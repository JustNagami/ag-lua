return {
	Play417221001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 417221001
		arg_1_1.duration_ = 17.5

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play417221002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 7.4

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_1 = 0.3

			if arg_1_1.time_ >= var_4_0 + var_4_1 and arg_1_1.time_ < var_4_0 + var_4_1 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_2 = 0
			local var_4_3 = 5
			local var_4_4 = "I16f"

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				arg_1_1.timestampController_:SetSelectedState("show")
				arg_1_1.timestampAni_:Play("in")

				arg_1_1.timeTicketbgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)

				arg_1_1.timestampColorController_:SetSelectedState("cold")

				local var_4_5 = arg_1_1:GetWordFromCfg(501067)
				local var_4_6 = arg_1_1:FormatText(var_4_5.content)

				arg_1_1.text_timeText_.text = var_4_6

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_timeText_)

				local var_4_7 = arg_1_1:GetWordFromCfg(501068)
				local var_4_8 = arg_1_1:FormatText(var_4_7.content)

				arg_1_1.text_siteText_.text = var_4_8

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_siteText_)
			end

			if arg_1_1.time_ >= var_4_2 + var_4_3 and arg_1_1.time_ < var_4_2 + var_4_3 + arg_4_0 then
				AnimatorTools.PlayAnimationWithCallback(arg_1_1.timestampAni_, "out", function()
					arg_1_1.timestampController_:SetSelectedState("hide")
				end)
			end

			local var_4_9 = 5

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_10 = 1.2

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_10 then
				local var_4_11 = (arg_1_1.time_ - var_4_9) / var_4_10
				local var_4_12 = Color.New(0, 0, 0)

				var_4_12.a = Mathf.Lerp(0, 1, var_4_11)
				arg_1_1.mask_.color = var_4_12
			end

			if arg_1_1.time_ >= var_4_9 + var_4_10 and arg_1_1.time_ < var_4_9 + var_4_10 + arg_4_0 then
				local var_4_13 = Color.New(0, 0, 0)

				var_4_13.a = 1
				arg_1_1.mask_.color = var_4_13
			end

			local var_4_14 = 6.2

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_15 = 1.2

			if var_4_14 <= arg_1_1.time_ and arg_1_1.time_ < var_4_14 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_14) / var_4_15
				local var_4_17 = Color.New(0, 0, 0)

				var_4_17.a = Mathf.Lerp(1, 0, var_4_16)
				arg_1_1.mask_.color = var_4_17
			end

			if arg_1_1.time_ >= var_4_14 + var_4_15 and arg_1_1.time_ < var_4_14 + var_4_15 + arg_4_0 then
				local var_4_18 = Color.New(0, 0, 0)
				local var_4_19 = 0

				arg_1_1.mask_.enabled = false
				var_4_18.a = var_4_19
				arg_1_1.mask_.color = var_4_18
			end

			local var_4_20 = "I16f"

			if arg_1_1.bgs_[var_4_20] == nil then
				local var_4_21 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_20)
				var_4_21.name = var_4_20
				var_4_21.transform.parent = arg_1_1.stage_.transform
				var_4_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_20] = var_4_21
			end

			local var_4_22 = 0

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_23 = manager.ui.mainCamera.transform.localPosition
				local var_4_24 = Vector3.New(0, 0, 10) + Vector3.New(var_4_23.x, var_4_23.y, 0)
				local var_4_25 = arg_1_1.bgs_.I16f

				var_4_25.transform.localPosition = var_4_24
				var_4_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_26 = var_4_25:GetComponent("SpriteRenderer")

				if var_4_26 and var_4_26.sprite then
					local var_4_27 = (var_4_25.transform.localPosition - var_4_23).z
					local var_4_28 = manager.ui.mainCameraCom_
					local var_4_29 = 2 * var_4_27 * Mathf.Tan(var_4_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_30 = var_4_29 * var_4_28.aspect
					local var_4_31 = var_4_26.sprite.bounds.size.x
					local var_4_32 = var_4_26.sprite.bounds.size.y
					local var_4_33 = var_4_30 / var_4_31
					local var_4_34 = var_4_29 / var_4_32
					local var_4_35 = var_4_34 < var_4_33 and var_4_33 or var_4_34

					var_4_25.transform.localScale = Vector3.New(var_4_35, var_4_35, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "I16f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_36 = 0

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_37 = 5

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37
				local var_4_39 = Color.New(0, 0, 0)

				var_4_39.a = Mathf.Lerp(1, 0, var_4_38)
				arg_1_1.mask_.color = var_4_39
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				local var_4_40 = Color.New(0, 0, 0)
				local var_4_41 = 0

				arg_1_1.mask_.enabled = false
				var_4_40.a = var_4_41
				arg_1_1.mask_.color = var_4_40
			end

			local var_4_42 = 0

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_43 = 1

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43
				local var_4_45 = Color.New(0, 0, 0)

				var_4_45.a = Mathf.Lerp(1, 0, var_4_44)
				arg_1_1.mask_.color = var_4_45
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				local var_4_46 = Color.New(0, 0, 0)
				local var_4_47 = 0

				arg_1_1.mask_.enabled = false
				var_4_46.a = var_4_47
				arg_1_1.mask_.color = var_4_46
			end

			local var_4_48 = 5.8
			local var_4_49 = 1

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				local var_4_50 = "play"
				local var_4_51 = "effect"

				arg_1_1:AudioAction(var_4_50, var_4_51, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			local var_4_52 = 0
			local var_4_53 = 0.2

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				local var_4_54 = "play"
				local var_4_55 = "music"

				arg_1_1:AudioAction(var_4_54, var_4_55, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_56 = ""
				local var_4_57 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_57 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_57 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_57

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_57
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

			local var_4_58 = 5.46666666666667
			local var_4_59 = 1

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				local var_4_60 = "play"
				local var_4_61 = "music"

				arg_1_1:AudioAction(var_4_60, var_4_61, "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base.awb")

				local var_4_62 = ""
				local var_4_63 = manager.audio:GetAudioName("bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base")

				if var_4_63 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_63 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_63

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_63
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

			local var_4_64 = 7.4
			local var_4_65 = 0.625

			if var_4_64 < arg_1_1.time_ and arg_1_1.time_ <= var_4_64 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_66 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_66:setOnUpdate(LuaHelper.FloatAction(function(arg_8_0)
					arg_1_1.dialogCg_.alpha = arg_8_0
				end))
				var_4_66:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_66:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_67 = arg_1_1:FormatText(StoryNameCfg[468].name)

				arg_1_1.leftNameTxt_.text = var_4_67

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_1_1.callingController_:SetSelectedState("normal")

				arg_1_1.keyicon_.color = Color.New(1, 1, 1)
				arg_1_1.icon_.color = Color.New(1, 1, 1)

				local var_4_68 = arg_1_1:GetWordFromCfg(417221001)
				local var_4_69 = arg_1_1:FormatText(var_4_68.content)

				arg_1_1.text_.text = var_4_69

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_70 = 25
				local var_4_71 = utf8.len(var_4_69)
				local var_4_72 = var_4_70 <= 0 and var_4_65 or var_4_65 * (var_4_71 / var_4_70)

				if var_4_72 > 0 and var_4_65 < var_4_72 then
					arg_1_1.talkMaxDuration = var_4_72
					var_4_64 = var_4_64 + 0.3

					if var_4_72 + var_4_64 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_72 + var_4_64
					end
				end

				arg_1_1.text_.text = var_4_69
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221001", "story_v_out_417221.awb") ~= 0 then
					local var_4_73 = manager.audio:GetVoiceLength("story_v_out_417221", "417221001", "story_v_out_417221.awb") / 1000

					if var_4_73 + var_4_64 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_73 + var_4_64
					end

					if var_4_68.prefab_name ~= "" and arg_1_1.actors_[var_4_68.prefab_name] ~= nil then
						local var_4_74 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_68.prefab_name].transform, "story_v_out_417221", "417221001", "story_v_out_417221.awb")

						arg_1_1:RecordAudio("417221001", var_4_74)
						arg_1_1:RecordAudio("417221001", var_4_74)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_417221", "417221001", "story_v_out_417221.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_417221", "417221001", "story_v_out_417221.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_75 = var_4_64 + 0.3
			local var_4_76 = math.max(var_4_65, arg_1_1.talkMaxDuration)

			if var_4_75 <= arg_1_1.time_ and arg_1_1.time_ < var_4_75 + var_4_76 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_75) / var_4_76

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_75 + var_4_76 and arg_1_1.time_ < var_4_75 + var_4_76 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play417221002 = function(arg_10_0, arg_10_1)
		arg_10_1.time_ = 0
		arg_10_1.frameCnt_ = 0
		arg_10_1.state_ = "playing"
		arg_10_1.curTalkId_ = 417221002
		arg_10_1.duration_ = 5

		SetActive(arg_10_1.tipsGo_, false)

		function arg_10_1.onSingleLineFinish_()
			arg_10_1.onSingleLineUpdate_ = nil
			arg_10_1.onSingleLineFinish_ = nil
			arg_10_1.state_ = "waiting"
		end

		function arg_10_1.playNext_(arg_12_0)
			if arg_12_0 == 1 then
				arg_10_0:Play417221003(arg_10_1)
			end
		end

		function arg_10_1.onSingleLineUpdate_(arg_13_0)
			local var_13_0 = 0
			local var_13_1 = 1.1

			if var_13_0 < arg_10_1.time_ and arg_10_1.time_ <= var_13_0 + arg_13_0 then
				arg_10_1.talkMaxDuration = 0
				arg_10_1.dialogCg_.alpha = 1

				arg_10_1.dialog_:SetActive(true)
				SetActive(arg_10_1.leftNameGo_, false)

				arg_10_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_10_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_10_1:RecordName(arg_10_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_10_1.iconTrs_.gameObject, false)
				arg_10_1.callingController_:SetSelectedState("normal")

				local var_13_2 = arg_10_1:GetWordFromCfg(417221002)
				local var_13_3 = arg_10_1:FormatText(var_13_2.content)

				arg_10_1.text_.text = var_13_3

				LuaForUtil.ClearLinePrefixSymbol(arg_10_1.text_)

				local var_13_4 = 44
				local var_13_5 = utf8.len(var_13_3)
				local var_13_6 = var_13_4 <= 0 and var_13_1 or var_13_1 * (var_13_5 / var_13_4)

				if var_13_6 > 0 and var_13_1 < var_13_6 then
					arg_10_1.talkMaxDuration = var_13_6

					if var_13_6 + var_13_0 > arg_10_1.duration_ then
						arg_10_1.duration_ = var_13_6 + var_13_0
					end
				end

				arg_10_1.text_.text = var_13_3
				arg_10_1.typewritter.percent = 0

				arg_10_1.typewritter:SetDirty()
				arg_10_1:ShowNextGo(false)
				arg_10_1:RecordContent(arg_10_1.text_.text)
			end

			local var_13_7 = math.max(var_13_1, arg_10_1.talkMaxDuration)

			if var_13_0 <= arg_10_1.time_ and arg_10_1.time_ < var_13_0 + var_13_7 then
				arg_10_1.typewritter.percent = (arg_10_1.time_ - var_13_0) / var_13_7

				arg_10_1.typewritter:SetDirty()
			end

			if arg_10_1.time_ >= var_13_0 + var_13_7 and arg_10_1.time_ < var_13_0 + var_13_7 + arg_13_0 then
				arg_10_1.typewritter.percent = 1

				arg_10_1.typewritter:SetDirty()
				arg_10_1:ShowNextGo(true)
			end
		end
	end,
	Play417221003 = function(arg_14_0, arg_14_1)
		arg_14_1.time_ = 0
		arg_14_1.frameCnt_ = 0
		arg_14_1.state_ = "playing"
		arg_14_1.curTalkId_ = 417221003
		arg_14_1.duration_ = 5

		SetActive(arg_14_1.tipsGo_, false)

		function arg_14_1.onSingleLineFinish_()
			arg_14_1.onSingleLineUpdate_ = nil
			arg_14_1.onSingleLineFinish_ = nil
			arg_14_1.state_ = "waiting"
		end

		function arg_14_1.playNext_(arg_16_0)
			if arg_16_0 == 1 then
				arg_14_0:Play417221004(arg_14_1)
			end
		end

		function arg_14_1.onSingleLineUpdate_(arg_17_0)
			local var_17_0 = 0
			local var_17_1 = 1.625

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

				local var_17_2 = arg_14_1:GetWordFromCfg(417221003)
				local var_17_3 = arg_14_1:FormatText(var_17_2.content)

				arg_14_1.text_.text = var_17_3

				LuaForUtil.ClearLinePrefixSymbol(arg_14_1.text_)

				local var_17_4 = 65
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
	Play417221004 = function(arg_18_0, arg_18_1)
		arg_18_1.time_ = 0
		arg_18_1.frameCnt_ = 0
		arg_18_1.state_ = "playing"
		arg_18_1.curTalkId_ = 417221004
		arg_18_1.duration_ = 4.6

		SetActive(arg_18_1.tipsGo_, false)

		function arg_18_1.onSingleLineFinish_()
			arg_18_1.onSingleLineUpdate_ = nil
			arg_18_1.onSingleLineFinish_ = nil
			arg_18_1.state_ = "waiting"
		end

		function arg_18_1.playNext_(arg_20_0)
			if arg_20_0 == 1 then
				arg_18_0:Play417221005(arg_18_1)
			end
		end

		function arg_18_1.onSingleLineUpdate_(arg_21_0)
			local var_21_0 = 0
			local var_21_1 = 0.35

			if var_21_0 < arg_18_1.time_ and arg_18_1.time_ <= var_21_0 + arg_21_0 then
				arg_18_1.talkMaxDuration = 0
				arg_18_1.dialogCg_.alpha = 1

				arg_18_1.dialog_:SetActive(true)
				SetActive(arg_18_1.leftNameGo_, true)

				local var_21_2 = arg_18_1:FormatText(StoryNameCfg[468].name)

				arg_18_1.leftNameTxt_.text = var_21_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_1.leftNameTxt_.transform)

				arg_18_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_18_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_18_1:RecordName(arg_18_1.leftNameTxt_.text)
				SetActive(arg_18_1.iconTrs_.gameObject, true)
				arg_18_1.iconController_:SetSelectedState("hero")

				arg_18_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_18_1.callingController_:SetSelectedState("normal")

				arg_18_1.keyicon_.color = Color.New(1, 1, 1)
				arg_18_1.icon_.color = Color.New(1, 1, 1)

				local var_21_3 = arg_18_1:GetWordFromCfg(417221004)
				local var_21_4 = arg_18_1:FormatText(var_21_3.content)

				arg_18_1.text_.text = var_21_4

				LuaForUtil.ClearLinePrefixSymbol(arg_18_1.text_)

				local var_21_5 = 14
				local var_21_6 = utf8.len(var_21_4)
				local var_21_7 = var_21_5 <= 0 and var_21_1 or var_21_1 * (var_21_6 / var_21_5)

				if var_21_7 > 0 and var_21_1 < var_21_7 then
					arg_18_1.talkMaxDuration = var_21_7

					if var_21_7 + var_21_0 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_7 + var_21_0
					end
				end

				arg_18_1.text_.text = var_21_4
				arg_18_1.typewritter.percent = 0

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221004", "story_v_out_417221.awb") ~= 0 then
					local var_21_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221004", "story_v_out_417221.awb") / 1000

					if var_21_8 + var_21_0 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_8 + var_21_0
					end

					if var_21_3.prefab_name ~= "" and arg_18_1.actors_[var_21_3.prefab_name] ~= nil then
						local var_21_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_18_1.actors_[var_21_3.prefab_name].transform, "story_v_out_417221", "417221004", "story_v_out_417221.awb")

						arg_18_1:RecordAudio("417221004", var_21_9)
						arg_18_1:RecordAudio("417221004", var_21_9)
					else
						arg_18_1:AudioAction("play", "voice", "story_v_out_417221", "417221004", "story_v_out_417221.awb")
					end

					arg_18_1:RecordHistoryTalkVoice("story_v_out_417221", "417221004", "story_v_out_417221.awb")
				end

				arg_18_1:RecordContent(arg_18_1.text_.text)
			end

			local var_21_10 = math.max(var_21_1, arg_18_1.talkMaxDuration)

			if var_21_0 <= arg_18_1.time_ and arg_18_1.time_ < var_21_0 + var_21_10 then
				arg_18_1.typewritter.percent = (arg_18_1.time_ - var_21_0) / var_21_10

				arg_18_1.typewritter:SetDirty()
			end

			if arg_18_1.time_ >= var_21_0 + var_21_10 and arg_18_1.time_ < var_21_0 + var_21_10 + arg_21_0 then
				arg_18_1.typewritter.percent = 1

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(true)
			end
		end
	end,
	Play417221005 = function(arg_22_0, arg_22_1)
		arg_22_1.time_ = 0
		arg_22_1.frameCnt_ = 0
		arg_22_1.state_ = "playing"
		arg_22_1.curTalkId_ = 417221005
		arg_22_1.duration_ = 9.57

		SetActive(arg_22_1.tipsGo_, false)

		function arg_22_1.onSingleLineFinish_()
			arg_22_1.onSingleLineUpdate_ = nil
			arg_22_1.onSingleLineFinish_ = nil
			arg_22_1.state_ = "waiting"
		end

		function arg_22_1.playNext_(arg_24_0)
			if arg_24_0 == 1 then
				arg_22_0:Play417221006(arg_22_1)
			end
		end

		function arg_22_1.onSingleLineUpdate_(arg_25_0)
			local var_25_0 = 0
			local var_25_1 = 0.775

			if var_25_0 < arg_22_1.time_ and arg_22_1.time_ <= var_25_0 + arg_25_0 then
				arg_22_1.talkMaxDuration = 0
				arg_22_1.dialogCg_.alpha = 1

				arg_22_1.dialog_:SetActive(true)
				SetActive(arg_22_1.leftNameGo_, true)

				local var_25_2 = arg_22_1:FormatText(StoryNameCfg[468].name)

				arg_22_1.leftNameTxt_.text = var_25_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_22_1.leftNameTxt_.transform)

				arg_22_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_22_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_22_1:RecordName(arg_22_1.leftNameTxt_.text)
				SetActive(arg_22_1.iconTrs_.gameObject, true)
				arg_22_1.iconController_:SetSelectedState("hero")

				arg_22_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_22_1.callingController_:SetSelectedState("normal")

				arg_22_1.keyicon_.color = Color.New(1, 1, 1)
				arg_22_1.icon_.color = Color.New(1, 1, 1)

				local var_25_3 = arg_22_1:GetWordFromCfg(417221005)
				local var_25_4 = arg_22_1:FormatText(var_25_3.content)

				arg_22_1.text_.text = var_25_4

				LuaForUtil.ClearLinePrefixSymbol(arg_22_1.text_)

				local var_25_5 = 31
				local var_25_6 = utf8.len(var_25_4)
				local var_25_7 = var_25_5 <= 0 and var_25_1 or var_25_1 * (var_25_6 / var_25_5)

				if var_25_7 > 0 and var_25_1 < var_25_7 then
					arg_22_1.talkMaxDuration = var_25_7

					if var_25_7 + var_25_0 > arg_22_1.duration_ then
						arg_22_1.duration_ = var_25_7 + var_25_0
					end
				end

				arg_22_1.text_.text = var_25_4
				arg_22_1.typewritter.percent = 0

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221005", "story_v_out_417221.awb") ~= 0 then
					local var_25_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221005", "story_v_out_417221.awb") / 1000

					if var_25_8 + var_25_0 > arg_22_1.duration_ then
						arg_22_1.duration_ = var_25_8 + var_25_0
					end

					if var_25_3.prefab_name ~= "" and arg_22_1.actors_[var_25_3.prefab_name] ~= nil then
						local var_25_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_22_1.actors_[var_25_3.prefab_name].transform, "story_v_out_417221", "417221005", "story_v_out_417221.awb")

						arg_22_1:RecordAudio("417221005", var_25_9)
						arg_22_1:RecordAudio("417221005", var_25_9)
					else
						arg_22_1:AudioAction("play", "voice", "story_v_out_417221", "417221005", "story_v_out_417221.awb")
					end

					arg_22_1:RecordHistoryTalkVoice("story_v_out_417221", "417221005", "story_v_out_417221.awb")
				end

				arg_22_1:RecordContent(arg_22_1.text_.text)
			end

			local var_25_10 = math.max(var_25_1, arg_22_1.talkMaxDuration)

			if var_25_0 <= arg_22_1.time_ and arg_22_1.time_ < var_25_0 + var_25_10 then
				arg_22_1.typewritter.percent = (arg_22_1.time_ - var_25_0) / var_25_10

				arg_22_1.typewritter:SetDirty()
			end

			if arg_22_1.time_ >= var_25_0 + var_25_10 and arg_22_1.time_ < var_25_0 + var_25_10 + arg_25_0 then
				arg_22_1.typewritter.percent = 1

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(true)
			end
		end
	end,
	Play417221006 = function(arg_26_0, arg_26_1)
		arg_26_1.time_ = 0
		arg_26_1.frameCnt_ = 0
		arg_26_1.state_ = "playing"
		arg_26_1.curTalkId_ = 417221006
		arg_26_1.duration_ = 10.07

		SetActive(arg_26_1.tipsGo_, false)

		function arg_26_1.onSingleLineFinish_()
			arg_26_1.onSingleLineUpdate_ = nil
			arg_26_1.onSingleLineFinish_ = nil
			arg_26_1.state_ = "waiting"
		end

		function arg_26_1.playNext_(arg_28_0)
			if arg_28_0 == 1 then
				arg_26_0:Play417221007(arg_26_1)
			end
		end

		function arg_26_1.onSingleLineUpdate_(arg_29_0)
			local var_29_0 = 0
			local var_29_1 = 0.9

			if var_29_0 < arg_26_1.time_ and arg_26_1.time_ <= var_29_0 + arg_29_0 then
				arg_26_1.talkMaxDuration = 0
				arg_26_1.dialogCg_.alpha = 1

				arg_26_1.dialog_:SetActive(true)
				SetActive(arg_26_1.leftNameGo_, true)

				local var_29_2 = arg_26_1:FormatText(StoryNameCfg[468].name)

				arg_26_1.leftNameTxt_.text = var_29_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_1.leftNameTxt_.transform)

				arg_26_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_26_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_26_1:RecordName(arg_26_1.leftNameTxt_.text)
				SetActive(arg_26_1.iconTrs_.gameObject, true)
				arg_26_1.iconController_:SetSelectedState("hero")

				arg_26_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_26_1.callingController_:SetSelectedState("normal")

				arg_26_1.keyicon_.color = Color.New(1, 1, 1)
				arg_26_1.icon_.color = Color.New(1, 1, 1)

				local var_29_3 = arg_26_1:GetWordFromCfg(417221006)
				local var_29_4 = arg_26_1:FormatText(var_29_3.content)

				arg_26_1.text_.text = var_29_4

				LuaForUtil.ClearLinePrefixSymbol(arg_26_1.text_)

				local var_29_5 = 36
				local var_29_6 = utf8.len(var_29_4)
				local var_29_7 = var_29_5 <= 0 and var_29_1 or var_29_1 * (var_29_6 / var_29_5)

				if var_29_7 > 0 and var_29_1 < var_29_7 then
					arg_26_1.talkMaxDuration = var_29_7

					if var_29_7 + var_29_0 > arg_26_1.duration_ then
						arg_26_1.duration_ = var_29_7 + var_29_0
					end
				end

				arg_26_1.text_.text = var_29_4
				arg_26_1.typewritter.percent = 0

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221006", "story_v_out_417221.awb") ~= 0 then
					local var_29_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221006", "story_v_out_417221.awb") / 1000

					if var_29_8 + var_29_0 > arg_26_1.duration_ then
						arg_26_1.duration_ = var_29_8 + var_29_0
					end

					if var_29_3.prefab_name ~= "" and arg_26_1.actors_[var_29_3.prefab_name] ~= nil then
						local var_29_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_26_1.actors_[var_29_3.prefab_name].transform, "story_v_out_417221", "417221006", "story_v_out_417221.awb")

						arg_26_1:RecordAudio("417221006", var_29_9)
						arg_26_1:RecordAudio("417221006", var_29_9)
					else
						arg_26_1:AudioAction("play", "voice", "story_v_out_417221", "417221006", "story_v_out_417221.awb")
					end

					arg_26_1:RecordHistoryTalkVoice("story_v_out_417221", "417221006", "story_v_out_417221.awb")
				end

				arg_26_1:RecordContent(arg_26_1.text_.text)
			end

			local var_29_10 = math.max(var_29_1, arg_26_1.talkMaxDuration)

			if var_29_0 <= arg_26_1.time_ and arg_26_1.time_ < var_29_0 + var_29_10 then
				arg_26_1.typewritter.percent = (arg_26_1.time_ - var_29_0) / var_29_10

				arg_26_1.typewritter:SetDirty()
			end

			if arg_26_1.time_ >= var_29_0 + var_29_10 and arg_26_1.time_ < var_29_0 + var_29_10 + arg_29_0 then
				arg_26_1.typewritter.percent = 1

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(true)
			end
		end
	end,
	Play417221007 = function(arg_30_0, arg_30_1)
		arg_30_1.time_ = 0
		arg_30_1.frameCnt_ = 0
		arg_30_1.state_ = "playing"
		arg_30_1.curTalkId_ = 417221007
		arg_30_1.duration_ = 13.67

		SetActive(arg_30_1.tipsGo_, false)

		function arg_30_1.onSingleLineFinish_()
			arg_30_1.onSingleLineUpdate_ = nil
			arg_30_1.onSingleLineFinish_ = nil
			arg_30_1.state_ = "waiting"
		end

		function arg_30_1.playNext_(arg_32_0)
			if arg_32_0 == 1 then
				arg_30_0:Play417221008(arg_30_1)
			end
		end

		function arg_30_1.onSingleLineUpdate_(arg_33_0)
			local var_33_0 = 0
			local var_33_1 = 1.075

			if var_33_0 < arg_30_1.time_ and arg_30_1.time_ <= var_33_0 + arg_33_0 then
				arg_30_1.talkMaxDuration = 0
				arg_30_1.dialogCg_.alpha = 1

				arg_30_1.dialog_:SetActive(true)
				SetActive(arg_30_1.leftNameGo_, true)

				local var_33_2 = arg_30_1:FormatText(StoryNameCfg[468].name)

				arg_30_1.leftNameTxt_.text = var_33_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_30_1.leftNameTxt_.transform)

				arg_30_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_30_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_30_1:RecordName(arg_30_1.leftNameTxt_.text)
				SetActive(arg_30_1.iconTrs_.gameObject, true)
				arg_30_1.iconController_:SetSelectedState("hero")

				arg_30_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_30_1.callingController_:SetSelectedState("normal")

				arg_30_1.keyicon_.color = Color.New(1, 1, 1)
				arg_30_1.icon_.color = Color.New(1, 1, 1)

				local var_33_3 = arg_30_1:GetWordFromCfg(417221007)
				local var_33_4 = arg_30_1:FormatText(var_33_3.content)

				arg_30_1.text_.text = var_33_4

				LuaForUtil.ClearLinePrefixSymbol(arg_30_1.text_)

				local var_33_5 = 43
				local var_33_6 = utf8.len(var_33_4)
				local var_33_7 = var_33_5 <= 0 and var_33_1 or var_33_1 * (var_33_6 / var_33_5)

				if var_33_7 > 0 and var_33_1 < var_33_7 then
					arg_30_1.talkMaxDuration = var_33_7

					if var_33_7 + var_33_0 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_7 + var_33_0
					end
				end

				arg_30_1.text_.text = var_33_4
				arg_30_1.typewritter.percent = 0

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221007", "story_v_out_417221.awb") ~= 0 then
					local var_33_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221007", "story_v_out_417221.awb") / 1000

					if var_33_8 + var_33_0 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_8 + var_33_0
					end

					if var_33_3.prefab_name ~= "" and arg_30_1.actors_[var_33_3.prefab_name] ~= nil then
						local var_33_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_30_1.actors_[var_33_3.prefab_name].transform, "story_v_out_417221", "417221007", "story_v_out_417221.awb")

						arg_30_1:RecordAudio("417221007", var_33_9)
						arg_30_1:RecordAudio("417221007", var_33_9)
					else
						arg_30_1:AudioAction("play", "voice", "story_v_out_417221", "417221007", "story_v_out_417221.awb")
					end

					arg_30_1:RecordHistoryTalkVoice("story_v_out_417221", "417221007", "story_v_out_417221.awb")
				end

				arg_30_1:RecordContent(arg_30_1.text_.text)
			end

			local var_33_10 = math.max(var_33_1, arg_30_1.talkMaxDuration)

			if var_33_0 <= arg_30_1.time_ and arg_30_1.time_ < var_33_0 + var_33_10 then
				arg_30_1.typewritter.percent = (arg_30_1.time_ - var_33_0) / var_33_10

				arg_30_1.typewritter:SetDirty()
			end

			if arg_30_1.time_ >= var_33_0 + var_33_10 and arg_30_1.time_ < var_33_0 + var_33_10 + arg_33_0 then
				arg_30_1.typewritter.percent = 1

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(true)
			end
		end
	end,
	Play417221008 = function(arg_34_0, arg_34_1)
		arg_34_1.time_ = 0
		arg_34_1.frameCnt_ = 0
		arg_34_1.state_ = "playing"
		arg_34_1.curTalkId_ = 417221008
		arg_34_1.duration_ = 12.4

		SetActive(arg_34_1.tipsGo_, false)

		function arg_34_1.onSingleLineFinish_()
			arg_34_1.onSingleLineUpdate_ = nil
			arg_34_1.onSingleLineFinish_ = nil
			arg_34_1.state_ = "waiting"
		end

		function arg_34_1.playNext_(arg_36_0)
			if arg_36_0 == 1 then
				arg_34_0:Play417221009(arg_34_1)
			end
		end

		function arg_34_1.onSingleLineUpdate_(arg_37_0)
			local var_37_0 = 0
			local var_37_1 = 0.95

			if var_37_0 < arg_34_1.time_ and arg_34_1.time_ <= var_37_0 + arg_37_0 then
				arg_34_1.talkMaxDuration = 0
				arg_34_1.dialogCg_.alpha = 1

				arg_34_1.dialog_:SetActive(true)
				SetActive(arg_34_1.leftNameGo_, true)

				local var_37_2 = arg_34_1:FormatText(StoryNameCfg[468].name)

				arg_34_1.leftNameTxt_.text = var_37_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_34_1.leftNameTxt_.transform)

				arg_34_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_34_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_34_1:RecordName(arg_34_1.leftNameTxt_.text)
				SetActive(arg_34_1.iconTrs_.gameObject, true)
				arg_34_1.iconController_:SetSelectedState("hero")

				arg_34_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_34_1.callingController_:SetSelectedState("normal")

				arg_34_1.keyicon_.color = Color.New(1, 1, 1)
				arg_34_1.icon_.color = Color.New(1, 1, 1)

				local var_37_3 = arg_34_1:GetWordFromCfg(417221008)
				local var_37_4 = arg_34_1:FormatText(var_37_3.content)

				arg_34_1.text_.text = var_37_4

				LuaForUtil.ClearLinePrefixSymbol(arg_34_1.text_)

				local var_37_5 = 38
				local var_37_6 = utf8.len(var_37_4)
				local var_37_7 = var_37_5 <= 0 and var_37_1 or var_37_1 * (var_37_6 / var_37_5)

				if var_37_7 > 0 and var_37_1 < var_37_7 then
					arg_34_1.talkMaxDuration = var_37_7

					if var_37_7 + var_37_0 > arg_34_1.duration_ then
						arg_34_1.duration_ = var_37_7 + var_37_0
					end
				end

				arg_34_1.text_.text = var_37_4
				arg_34_1.typewritter.percent = 0

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221008", "story_v_out_417221.awb") ~= 0 then
					local var_37_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221008", "story_v_out_417221.awb") / 1000

					if var_37_8 + var_37_0 > arg_34_1.duration_ then
						arg_34_1.duration_ = var_37_8 + var_37_0
					end

					if var_37_3.prefab_name ~= "" and arg_34_1.actors_[var_37_3.prefab_name] ~= nil then
						local var_37_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_34_1.actors_[var_37_3.prefab_name].transform, "story_v_out_417221", "417221008", "story_v_out_417221.awb")

						arg_34_1:RecordAudio("417221008", var_37_9)
						arg_34_1:RecordAudio("417221008", var_37_9)
					else
						arg_34_1:AudioAction("play", "voice", "story_v_out_417221", "417221008", "story_v_out_417221.awb")
					end

					arg_34_1:RecordHistoryTalkVoice("story_v_out_417221", "417221008", "story_v_out_417221.awb")
				end

				arg_34_1:RecordContent(arg_34_1.text_.text)
			end

			local var_37_10 = math.max(var_37_1, arg_34_1.talkMaxDuration)

			if var_37_0 <= arg_34_1.time_ and arg_34_1.time_ < var_37_0 + var_37_10 then
				arg_34_1.typewritter.percent = (arg_34_1.time_ - var_37_0) / var_37_10

				arg_34_1.typewritter:SetDirty()
			end

			if arg_34_1.time_ >= var_37_0 + var_37_10 and arg_34_1.time_ < var_37_0 + var_37_10 + arg_37_0 then
				arg_34_1.typewritter.percent = 1

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(true)
			end
		end
	end,
	Play417221009 = function(arg_38_0, arg_38_1)
		arg_38_1.time_ = 0
		arg_38_1.frameCnt_ = 0
		arg_38_1.state_ = "playing"
		arg_38_1.curTalkId_ = 417221009
		arg_38_1.duration_ = 12.37

		SetActive(arg_38_1.tipsGo_, false)

		function arg_38_1.onSingleLineFinish_()
			arg_38_1.onSingleLineUpdate_ = nil
			arg_38_1.onSingleLineFinish_ = nil
			arg_38_1.state_ = "waiting"
		end

		function arg_38_1.playNext_(arg_40_0)
			if arg_40_0 == 1 then
				arg_38_0:Play417221010(arg_38_1)
			end
		end

		function arg_38_1.onSingleLineUpdate_(arg_41_0)
			local var_41_0 = 0
			local var_41_1 = 1.175

			if var_41_0 < arg_38_1.time_ and arg_38_1.time_ <= var_41_0 + arg_41_0 then
				arg_38_1.talkMaxDuration = 0
				arg_38_1.dialogCg_.alpha = 1

				arg_38_1.dialog_:SetActive(true)
				SetActive(arg_38_1.leftNameGo_, true)

				local var_41_2 = arg_38_1:FormatText(StoryNameCfg[468].name)

				arg_38_1.leftNameTxt_.text = var_41_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_1.leftNameTxt_.transform)

				arg_38_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_38_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_38_1:RecordName(arg_38_1.leftNameTxt_.text)
				SetActive(arg_38_1.iconTrs_.gameObject, true)
				arg_38_1.iconController_:SetSelectedState("hero")

				arg_38_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_38_1.callingController_:SetSelectedState("normal")

				arg_38_1.keyicon_.color = Color.New(1, 1, 1)
				arg_38_1.icon_.color = Color.New(1, 1, 1)

				local var_41_3 = arg_38_1:GetWordFromCfg(417221009)
				local var_41_4 = arg_38_1:FormatText(var_41_3.content)

				arg_38_1.text_.text = var_41_4

				LuaForUtil.ClearLinePrefixSymbol(arg_38_1.text_)

				local var_41_5 = 47
				local var_41_6 = utf8.len(var_41_4)
				local var_41_7 = var_41_5 <= 0 and var_41_1 or var_41_1 * (var_41_6 / var_41_5)

				if var_41_7 > 0 and var_41_1 < var_41_7 then
					arg_38_1.talkMaxDuration = var_41_7

					if var_41_7 + var_41_0 > arg_38_1.duration_ then
						arg_38_1.duration_ = var_41_7 + var_41_0
					end
				end

				arg_38_1.text_.text = var_41_4
				arg_38_1.typewritter.percent = 0

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221009", "story_v_out_417221.awb") ~= 0 then
					local var_41_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221009", "story_v_out_417221.awb") / 1000

					if var_41_8 + var_41_0 > arg_38_1.duration_ then
						arg_38_1.duration_ = var_41_8 + var_41_0
					end

					if var_41_3.prefab_name ~= "" and arg_38_1.actors_[var_41_3.prefab_name] ~= nil then
						local var_41_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_38_1.actors_[var_41_3.prefab_name].transform, "story_v_out_417221", "417221009", "story_v_out_417221.awb")

						arg_38_1:RecordAudio("417221009", var_41_9)
						arg_38_1:RecordAudio("417221009", var_41_9)
					else
						arg_38_1:AudioAction("play", "voice", "story_v_out_417221", "417221009", "story_v_out_417221.awb")
					end

					arg_38_1:RecordHistoryTalkVoice("story_v_out_417221", "417221009", "story_v_out_417221.awb")
				end

				arg_38_1:RecordContent(arg_38_1.text_.text)
			end

			local var_41_10 = math.max(var_41_1, arg_38_1.talkMaxDuration)

			if var_41_0 <= arg_38_1.time_ and arg_38_1.time_ < var_41_0 + var_41_10 then
				arg_38_1.typewritter.percent = (arg_38_1.time_ - var_41_0) / var_41_10

				arg_38_1.typewritter:SetDirty()
			end

			if arg_38_1.time_ >= var_41_0 + var_41_10 and arg_38_1.time_ < var_41_0 + var_41_10 + arg_41_0 then
				arg_38_1.typewritter.percent = 1

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(true)
			end
		end
	end,
	Play417221010 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 417221010
		arg_42_1.duration_ = 16.7

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play417221011(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = 0
			local var_45_1 = 1.225

			if var_45_0 < arg_42_1.time_ and arg_42_1.time_ <= var_45_0 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0
				arg_42_1.dialogCg_.alpha = 1

				arg_42_1.dialog_:SetActive(true)
				SetActive(arg_42_1.leftNameGo_, true)

				local var_45_2 = arg_42_1:FormatText(StoryNameCfg[468].name)

				arg_42_1.leftNameTxt_.text = var_45_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_42_1.leftNameTxt_.transform)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1.leftNameTxt_.text)
				SetActive(arg_42_1.iconTrs_.gameObject, true)
				arg_42_1.iconController_:SetSelectedState("hero")

				arg_42_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_42_1.callingController_:SetSelectedState("normal")

				arg_42_1.keyicon_.color = Color.New(1, 1, 1)
				arg_42_1.icon_.color = Color.New(1, 1, 1)

				local var_45_3 = arg_42_1:GetWordFromCfg(417221010)
				local var_45_4 = arg_42_1:FormatText(var_45_3.content)

				arg_42_1.text_.text = var_45_4

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_5 = 49
				local var_45_6 = utf8.len(var_45_4)
				local var_45_7 = var_45_5 <= 0 and var_45_1 or var_45_1 * (var_45_6 / var_45_5)

				if var_45_7 > 0 and var_45_1 < var_45_7 then
					arg_42_1.talkMaxDuration = var_45_7

					if var_45_7 + var_45_0 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_7 + var_45_0
					end
				end

				arg_42_1.text_.text = var_45_4
				arg_42_1.typewritter.percent = 0

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221010", "story_v_out_417221.awb") ~= 0 then
					local var_45_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221010", "story_v_out_417221.awb") / 1000

					if var_45_8 + var_45_0 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_8 + var_45_0
					end

					if var_45_3.prefab_name ~= "" and arg_42_1.actors_[var_45_3.prefab_name] ~= nil then
						local var_45_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_42_1.actors_[var_45_3.prefab_name].transform, "story_v_out_417221", "417221010", "story_v_out_417221.awb")

						arg_42_1:RecordAudio("417221010", var_45_9)
						arg_42_1:RecordAudio("417221010", var_45_9)
					else
						arg_42_1:AudioAction("play", "voice", "story_v_out_417221", "417221010", "story_v_out_417221.awb")
					end

					arg_42_1:RecordHistoryTalkVoice("story_v_out_417221", "417221010", "story_v_out_417221.awb")
				end

				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_10 = math.max(var_45_1, arg_42_1.talkMaxDuration)

			if var_45_0 <= arg_42_1.time_ and arg_42_1.time_ < var_45_0 + var_45_10 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_0) / var_45_10

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_0 + var_45_10 and arg_42_1.time_ < var_45_0 + var_45_10 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play417221011 = function(arg_46_0, arg_46_1)
		arg_46_1.time_ = 0
		arg_46_1.frameCnt_ = 0
		arg_46_1.state_ = "playing"
		arg_46_1.curTalkId_ = 417221011
		arg_46_1.duration_ = 5.43

		SetActive(arg_46_1.tipsGo_, false)

		function arg_46_1.onSingleLineFinish_()
			arg_46_1.onSingleLineUpdate_ = nil
			arg_46_1.onSingleLineFinish_ = nil
			arg_46_1.state_ = "waiting"
		end

		function arg_46_1.playNext_(arg_48_0)
			if arg_48_0 == 1 then
				arg_46_0:Play417221012(arg_46_1)
			end
		end

		function arg_46_1.onSingleLineUpdate_(arg_49_0)
			local var_49_0 = 0
			local var_49_1 = 0.425

			if var_49_0 < arg_46_1.time_ and arg_46_1.time_ <= var_49_0 + arg_49_0 then
				arg_46_1.talkMaxDuration = 0
				arg_46_1.dialogCg_.alpha = 1

				arg_46_1.dialog_:SetActive(true)
				SetActive(arg_46_1.leftNameGo_, true)

				local var_49_2 = arg_46_1:FormatText(StoryNameCfg[468].name)

				arg_46_1.leftNameTxt_.text = var_49_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_46_1.leftNameTxt_.transform)

				arg_46_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_46_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_46_1:RecordName(arg_46_1.leftNameTxt_.text)
				SetActive(arg_46_1.iconTrs_.gameObject, true)
				arg_46_1.iconController_:SetSelectedState("hero")

				arg_46_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_46_1.callingController_:SetSelectedState("normal")

				arg_46_1.keyicon_.color = Color.New(1, 1, 1)
				arg_46_1.icon_.color = Color.New(1, 1, 1)

				local var_49_3 = arg_46_1:GetWordFromCfg(417221011)
				local var_49_4 = arg_46_1:FormatText(var_49_3.content)

				arg_46_1.text_.text = var_49_4

				LuaForUtil.ClearLinePrefixSymbol(arg_46_1.text_)

				local var_49_5 = 17
				local var_49_6 = utf8.len(var_49_4)
				local var_49_7 = var_49_5 <= 0 and var_49_1 or var_49_1 * (var_49_6 / var_49_5)

				if var_49_7 > 0 and var_49_1 < var_49_7 then
					arg_46_1.talkMaxDuration = var_49_7

					if var_49_7 + var_49_0 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_7 + var_49_0
					end
				end

				arg_46_1.text_.text = var_49_4
				arg_46_1.typewritter.percent = 0

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221011", "story_v_out_417221.awb") ~= 0 then
					local var_49_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221011", "story_v_out_417221.awb") / 1000

					if var_49_8 + var_49_0 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_8 + var_49_0
					end

					if var_49_3.prefab_name ~= "" and arg_46_1.actors_[var_49_3.prefab_name] ~= nil then
						local var_49_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_46_1.actors_[var_49_3.prefab_name].transform, "story_v_out_417221", "417221011", "story_v_out_417221.awb")

						arg_46_1:RecordAudio("417221011", var_49_9)
						arg_46_1:RecordAudio("417221011", var_49_9)
					else
						arg_46_1:AudioAction("play", "voice", "story_v_out_417221", "417221011", "story_v_out_417221.awb")
					end

					arg_46_1:RecordHistoryTalkVoice("story_v_out_417221", "417221011", "story_v_out_417221.awb")
				end

				arg_46_1:RecordContent(arg_46_1.text_.text)
			end

			local var_49_10 = math.max(var_49_1, arg_46_1.talkMaxDuration)

			if var_49_0 <= arg_46_1.time_ and arg_46_1.time_ < var_49_0 + var_49_10 then
				arg_46_1.typewritter.percent = (arg_46_1.time_ - var_49_0) / var_49_10

				arg_46_1.typewritter:SetDirty()
			end

			if arg_46_1.time_ >= var_49_0 + var_49_10 and arg_46_1.time_ < var_49_0 + var_49_10 + arg_49_0 then
				arg_46_1.typewritter.percent = 1

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(true)
			end
		end
	end,
	Play417221012 = function(arg_50_0, arg_50_1)
		arg_50_1.time_ = 0
		arg_50_1.frameCnt_ = 0
		arg_50_1.state_ = "playing"
		arg_50_1.curTalkId_ = 417221012
		arg_50_1.duration_ = 5

		SetActive(arg_50_1.tipsGo_, false)

		function arg_50_1.onSingleLineFinish_()
			arg_50_1.onSingleLineUpdate_ = nil
			arg_50_1.onSingleLineFinish_ = nil
			arg_50_1.state_ = "waiting"
		end

		function arg_50_1.playNext_(arg_52_0)
			if arg_52_0 == 1 then
				arg_50_0:Play417221013(arg_50_1)
			end
		end

		function arg_50_1.onSingleLineUpdate_(arg_53_0)
			local var_53_0 = 0
			local var_53_1 = 0.6

			if var_53_0 < arg_50_1.time_ and arg_50_1.time_ <= var_53_0 + arg_53_0 then
				arg_50_1.talkMaxDuration = 0
				arg_50_1.dialogCg_.alpha = 1

				arg_50_1.dialog_:SetActive(true)
				SetActive(arg_50_1.leftNameGo_, false)

				arg_50_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_50_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_50_1:RecordName(arg_50_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_50_1.iconTrs_.gameObject, false)
				arg_50_1.callingController_:SetSelectedState("normal")

				local var_53_2 = arg_50_1:GetWordFromCfg(417221012)
				local var_53_3 = arg_50_1:FormatText(var_53_2.content)

				arg_50_1.text_.text = var_53_3

				LuaForUtil.ClearLinePrefixSymbol(arg_50_1.text_)

				local var_53_4 = 24
				local var_53_5 = utf8.len(var_53_3)
				local var_53_6 = var_53_4 <= 0 and var_53_1 or var_53_1 * (var_53_5 / var_53_4)

				if var_53_6 > 0 and var_53_1 < var_53_6 then
					arg_50_1.talkMaxDuration = var_53_6

					if var_53_6 + var_53_0 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_6 + var_53_0
					end
				end

				arg_50_1.text_.text = var_53_3
				arg_50_1.typewritter.percent = 0

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(false)
				arg_50_1:RecordContent(arg_50_1.text_.text)
			end

			local var_53_7 = math.max(var_53_1, arg_50_1.talkMaxDuration)

			if var_53_0 <= arg_50_1.time_ and arg_50_1.time_ < var_53_0 + var_53_7 then
				arg_50_1.typewritter.percent = (arg_50_1.time_ - var_53_0) / var_53_7

				arg_50_1.typewritter:SetDirty()
			end

			if arg_50_1.time_ >= var_53_0 + var_53_7 and arg_50_1.time_ < var_53_0 + var_53_7 + arg_53_0 then
				arg_50_1.typewritter.percent = 1

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(true)
			end
		end
	end,
	Play417221013 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 417221013
		arg_54_1.duration_ = 13.4

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play417221014(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = 0
			local var_57_1 = 1.15

			if var_57_0 < arg_54_1.time_ and arg_54_1.time_ <= var_57_0 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0
				arg_54_1.dialogCg_.alpha = 1

				arg_54_1.dialog_:SetActive(true)
				SetActive(arg_54_1.leftNameGo_, true)

				local var_57_2 = arg_54_1:FormatText(StoryNameCfg[468].name)

				arg_54_1.leftNameTxt_.text = var_57_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_54_1.leftNameTxt_.transform)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1.leftNameTxt_.text)
				SetActive(arg_54_1.iconTrs_.gameObject, true)
				arg_54_1.iconController_:SetSelectedState("hero")

				arg_54_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10049")

				arg_54_1.callingController_:SetSelectedState("normal")

				arg_54_1.keyicon_.color = Color.New(1, 1, 1)
				arg_54_1.icon_.color = Color.New(1, 1, 1)

				local var_57_3 = arg_54_1:GetWordFromCfg(417221013)
				local var_57_4 = arg_54_1:FormatText(var_57_3.content)

				arg_54_1.text_.text = var_57_4

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221013", "story_v_out_417221.awb") ~= 0 then
					local var_57_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221013", "story_v_out_417221.awb") / 1000

					if var_57_8 + var_57_0 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_8 + var_57_0
					end

					if var_57_3.prefab_name ~= "" and arg_54_1.actors_[var_57_3.prefab_name] ~= nil then
						local var_57_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_54_1.actors_[var_57_3.prefab_name].transform, "story_v_out_417221", "417221013", "story_v_out_417221.awb")

						arg_54_1:RecordAudio("417221013", var_57_9)
						arg_54_1:RecordAudio("417221013", var_57_9)
					else
						arg_54_1:AudioAction("play", "voice", "story_v_out_417221", "417221013", "story_v_out_417221.awb")
					end

					arg_54_1:RecordHistoryTalkVoice("story_v_out_417221", "417221013", "story_v_out_417221.awb")
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
	Play417221014 = function(arg_58_0, arg_58_1)
		arg_58_1.time_ = 0
		arg_58_1.frameCnt_ = 0
		arg_58_1.state_ = "playing"
		arg_58_1.curTalkId_ = 417221014
		arg_58_1.duration_ = 5

		SetActive(arg_58_1.tipsGo_, false)

		function arg_58_1.onSingleLineFinish_()
			arg_58_1.onSingleLineUpdate_ = nil
			arg_58_1.onSingleLineFinish_ = nil
			arg_58_1.state_ = "waiting"
		end

		function arg_58_1.playNext_(arg_60_0)
			if arg_60_0 == 1 then
				arg_58_0:Play417221015(arg_58_1)
			end
		end

		function arg_58_1.onSingleLineUpdate_(arg_61_0)
			local var_61_0 = 0
			local var_61_1 = 1

			if var_61_0 < arg_58_1.time_ and arg_58_1.time_ <= var_61_0 + arg_61_0 then
				local var_61_2 = "play"
				local var_61_3 = "effect"

				arg_58_1:AudioAction(var_61_2, var_61_3, "se_story_1310", "se_story_1310_footstep01", "")
			end

			local var_61_4 = 0
			local var_61_5 = 0.725

			if var_61_4 < arg_58_1.time_ and arg_58_1.time_ <= var_61_4 + arg_61_0 then
				arg_58_1.talkMaxDuration = 0
				arg_58_1.dialogCg_.alpha = 1

				arg_58_1.dialog_:SetActive(true)
				SetActive(arg_58_1.leftNameGo_, false)

				arg_58_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_58_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_58_1:RecordName(arg_58_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_58_1.iconTrs_.gameObject, false)
				arg_58_1.callingController_:SetSelectedState("normal")

				local var_61_6 = arg_58_1:GetWordFromCfg(417221014)
				local var_61_7 = arg_58_1:FormatText(var_61_6.content)

				arg_58_1.text_.text = var_61_7

				LuaForUtil.ClearLinePrefixSymbol(arg_58_1.text_)

				local var_61_8 = 29
				local var_61_9 = utf8.len(var_61_7)
				local var_61_10 = var_61_8 <= 0 and var_61_5 or var_61_5 * (var_61_9 / var_61_8)

				if var_61_10 > 0 and var_61_5 < var_61_10 then
					arg_58_1.talkMaxDuration = var_61_10

					if var_61_10 + var_61_4 > arg_58_1.duration_ then
						arg_58_1.duration_ = var_61_10 + var_61_4
					end
				end

				arg_58_1.text_.text = var_61_7
				arg_58_1.typewritter.percent = 0

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(false)
				arg_58_1:RecordContent(arg_58_1.text_.text)
			end

			local var_61_11 = math.max(var_61_5, arg_58_1.talkMaxDuration)

			if var_61_4 <= arg_58_1.time_ and arg_58_1.time_ < var_61_4 + var_61_11 then
				arg_58_1.typewritter.percent = (arg_58_1.time_ - var_61_4) / var_61_11

				arg_58_1.typewritter:SetDirty()
			end

			if arg_58_1.time_ >= var_61_4 + var_61_11 and arg_58_1.time_ < var_61_4 + var_61_11 + arg_61_0 then
				arg_58_1.typewritter.percent = 1

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(true)
			end
		end
	end,
	Play417221015 = function(arg_62_0, arg_62_1)
		arg_62_1.time_ = 0
		arg_62_1.frameCnt_ = 0
		arg_62_1.state_ = "playing"
		arg_62_1.curTalkId_ = 417221015
		arg_62_1.duration_ = 5

		SetActive(arg_62_1.tipsGo_, false)

		function arg_62_1.onSingleLineFinish_()
			arg_62_1.onSingleLineUpdate_ = nil
			arg_62_1.onSingleLineFinish_ = nil
			arg_62_1.state_ = "waiting"
		end

		function arg_62_1.playNext_(arg_64_0)
			if arg_64_0 == 1 then
				arg_62_0:Play417221016(arg_62_1)
			end
		end

		function arg_62_1.onSingleLineUpdate_(arg_65_0)
			local var_65_0 = 0
			local var_65_1 = 1.1

			if var_65_0 < arg_62_1.time_ and arg_62_1.time_ <= var_65_0 + arg_65_0 then
				arg_62_1.talkMaxDuration = 0
				arg_62_1.dialogCg_.alpha = 1

				arg_62_1.dialog_:SetActive(true)
				SetActive(arg_62_1.leftNameGo_, false)

				arg_62_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_62_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_62_1:RecordName(arg_62_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_62_1.iconTrs_.gameObject, false)
				arg_62_1.callingController_:SetSelectedState("normal")

				local var_65_2 = arg_62_1:GetWordFromCfg(417221015)
				local var_65_3 = arg_62_1:FormatText(var_65_2.content)

				arg_62_1.text_.text = var_65_3

				LuaForUtil.ClearLinePrefixSymbol(arg_62_1.text_)

				local var_65_4 = 44
				local var_65_5 = utf8.len(var_65_3)
				local var_65_6 = var_65_4 <= 0 and var_65_1 or var_65_1 * (var_65_5 / var_65_4)

				if var_65_6 > 0 and var_65_1 < var_65_6 then
					arg_62_1.talkMaxDuration = var_65_6

					if var_65_6 + var_65_0 > arg_62_1.duration_ then
						arg_62_1.duration_ = var_65_6 + var_65_0
					end
				end

				arg_62_1.text_.text = var_65_3
				arg_62_1.typewritter.percent = 0

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(false)
				arg_62_1:RecordContent(arg_62_1.text_.text)
			end

			local var_65_7 = math.max(var_65_1, arg_62_1.talkMaxDuration)

			if var_65_0 <= arg_62_1.time_ and arg_62_1.time_ < var_65_0 + var_65_7 then
				arg_62_1.typewritter.percent = (arg_62_1.time_ - var_65_0) / var_65_7

				arg_62_1.typewritter:SetDirty()
			end

			if arg_62_1.time_ >= var_65_0 + var_65_7 and arg_62_1.time_ < var_65_0 + var_65_7 + arg_65_0 then
				arg_62_1.typewritter.percent = 1

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(true)
			end
		end
	end,
	Play417221016 = function(arg_66_0, arg_66_1)
		arg_66_1.time_ = 0
		arg_66_1.frameCnt_ = 0
		arg_66_1.state_ = "playing"
		arg_66_1.curTalkId_ = 417221016
		arg_66_1.duration_ = 5

		SetActive(arg_66_1.tipsGo_, false)

		function arg_66_1.onSingleLineFinish_()
			arg_66_1.onSingleLineUpdate_ = nil
			arg_66_1.onSingleLineFinish_ = nil
			arg_66_1.state_ = "waiting"
		end

		function arg_66_1.playNext_(arg_68_0)
			if arg_68_0 == 1 then
				arg_66_0:Play417221017(arg_66_1)
			end
		end

		function arg_66_1.onSingleLineUpdate_(arg_69_0)
			local var_69_0 = 0
			local var_69_1 = 1.625

			if var_69_0 < arg_66_1.time_ and arg_66_1.time_ <= var_69_0 + arg_69_0 then
				arg_66_1.talkMaxDuration = 0
				arg_66_1.dialogCg_.alpha = 1

				arg_66_1.dialog_:SetActive(true)
				SetActive(arg_66_1.leftNameGo_, false)

				arg_66_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_66_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_66_1:RecordName(arg_66_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_66_1.iconTrs_.gameObject, false)
				arg_66_1.callingController_:SetSelectedState("normal")

				local var_69_2 = arg_66_1:GetWordFromCfg(417221016)
				local var_69_3 = arg_66_1:FormatText(var_69_2.content)

				arg_66_1.text_.text = var_69_3

				LuaForUtil.ClearLinePrefixSymbol(arg_66_1.text_)

				local var_69_4 = 65
				local var_69_5 = utf8.len(var_69_3)
				local var_69_6 = var_69_4 <= 0 and var_69_1 or var_69_1 * (var_69_5 / var_69_4)

				if var_69_6 > 0 and var_69_1 < var_69_6 then
					arg_66_1.talkMaxDuration = var_69_6

					if var_69_6 + var_69_0 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_6 + var_69_0
					end
				end

				arg_66_1.text_.text = var_69_3
				arg_66_1.typewritter.percent = 0

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(false)
				arg_66_1:RecordContent(arg_66_1.text_.text)
			end

			local var_69_7 = math.max(var_69_1, arg_66_1.talkMaxDuration)

			if var_69_0 <= arg_66_1.time_ and arg_66_1.time_ < var_69_0 + var_69_7 then
				arg_66_1.typewritter.percent = (arg_66_1.time_ - var_69_0) / var_69_7

				arg_66_1.typewritter:SetDirty()
			end

			if arg_66_1.time_ >= var_69_0 + var_69_7 and arg_66_1.time_ < var_69_0 + var_69_7 + arg_69_0 then
				arg_66_1.typewritter.percent = 1

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(true)
			end
		end
	end,
	Play417221017 = function(arg_70_0, arg_70_1)
		arg_70_1.time_ = 0
		arg_70_1.frameCnt_ = 0
		arg_70_1.state_ = "playing"
		arg_70_1.curTalkId_ = 417221017
		arg_70_1.duration_ = 2.23

		SetActive(arg_70_1.tipsGo_, false)

		function arg_70_1.onSingleLineFinish_()
			arg_70_1.onSingleLineUpdate_ = nil
			arg_70_1.onSingleLineFinish_ = nil
			arg_70_1.state_ = "waiting"
		end

		function arg_70_1.playNext_(arg_72_0)
			if arg_72_0 == 1 then
				arg_70_0:Play417221018(arg_70_1)
			end
		end

		function arg_70_1.onSingleLineUpdate_(arg_73_0)
			local var_73_0 = "10113"

			if arg_70_1.actors_[var_73_0] == nil then
				local var_73_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10113")

				if not isNil(var_73_1) then
					local var_73_2 = Object.Instantiate(var_73_1, arg_70_1.canvasGo_.transform)

					var_73_2.transform:SetSiblingIndex(1)

					var_73_2.name = var_73_0
					var_73_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_70_1.actors_[var_73_0] = var_73_2

					local var_73_3 = var_73_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_70_1.isInRecall_ then
						for iter_73_0, iter_73_1 in ipairs(var_73_3) do
							iter_73_1.color = arg_70_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_73_4 = arg_70_1.actors_["10113"]
			local var_73_5 = 0

			if var_73_5 < arg_70_1.time_ and arg_70_1.time_ <= var_73_5 + arg_73_0 and not isNil(var_73_4) and arg_70_1.var_.actorSpriteComps10113 == nil then
				arg_70_1.var_.actorSpriteComps10113 = var_73_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_73_6 = 0.2

			if var_73_5 <= arg_70_1.time_ and arg_70_1.time_ < var_73_5 + var_73_6 and not isNil(var_73_4) then
				local var_73_7 = (arg_70_1.time_ - var_73_5) / var_73_6

				if arg_70_1.var_.actorSpriteComps10113 then
					for iter_73_2, iter_73_3 in pairs(arg_70_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_73_3 then
							if arg_70_1.isInRecall_ then
								local var_73_8 = Mathf.Lerp(iter_73_3.color.r, arg_70_1.hightColor1.r, var_73_7)
								local var_73_9 = Mathf.Lerp(iter_73_3.color.g, arg_70_1.hightColor1.g, var_73_7)
								local var_73_10 = Mathf.Lerp(iter_73_3.color.b, arg_70_1.hightColor1.b, var_73_7)

								iter_73_3.color = Color.New(var_73_8, var_73_9, var_73_10)
							else
								local var_73_11 = Mathf.Lerp(iter_73_3.color.r, 1, var_73_7)

								iter_73_3.color = Color.New(var_73_11, var_73_11, var_73_11)
							end
						end
					end
				end
			end

			if arg_70_1.time_ >= var_73_5 + var_73_6 and arg_70_1.time_ < var_73_5 + var_73_6 + arg_73_0 and not isNil(var_73_4) and arg_70_1.var_.actorSpriteComps10113 then
				for iter_73_4, iter_73_5 in pairs(arg_70_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_73_5 then
						if arg_70_1.isInRecall_ then
							iter_73_5.color = arg_70_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_73_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_70_1.var_.actorSpriteComps10113 = nil
			end

			local var_73_12 = arg_70_1.actors_["10113"].transform
			local var_73_13 = 0

			if var_73_13 < arg_70_1.time_ and arg_70_1.time_ <= var_73_13 + arg_73_0 then
				arg_70_1.var_.moveOldPos10113 = var_73_12.localPosition
				var_73_12.localScale = Vector3.New(1, 1, 1)

				arg_70_1:CheckSpriteTmpPos("10113", 3)

				local var_73_14 = var_73_12.childCount

				for iter_73_6 = 0, var_73_14 - 1 do
					local var_73_15 = var_73_12:GetChild(iter_73_6)

					if var_73_15.name == "" or not string.find(var_73_15.name, "split") then
						var_73_15.gameObject:SetActive(true)
					else
						var_73_15.gameObject:SetActive(false)
					end
				end
			end

			local var_73_16 = 0.001

			if var_73_13 <= arg_70_1.time_ and arg_70_1.time_ < var_73_13 + var_73_16 then
				local var_73_17 = (arg_70_1.time_ - var_73_13) / var_73_16
				local var_73_18 = Vector3.New(-30.38, -328.4, -517.4)

				var_73_12.localPosition = Vector3.Lerp(arg_70_1.var_.moveOldPos10113, var_73_18, var_73_17)
			end

			if arg_70_1.time_ >= var_73_13 + var_73_16 and arg_70_1.time_ < var_73_13 + var_73_16 + arg_73_0 then
				var_73_12.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_73_19 = arg_70_1.actors_["10113"]
			local var_73_20 = 0

			if var_73_20 < arg_70_1.time_ and arg_70_1.time_ <= var_73_20 + arg_73_0 then
				local var_73_21 = var_73_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_73_21 then
					arg_70_1.var_.alphaOldValue10113 = var_73_21.alpha
					arg_70_1.var_.characterEffect10113 = var_73_21
				end

				arg_70_1.var_.alphaOldValue10113 = 0
			end

			local var_73_22 = 0.333333333333333

			if var_73_20 <= arg_70_1.time_ and arg_70_1.time_ < var_73_20 + var_73_22 then
				local var_73_23 = (arg_70_1.time_ - var_73_20) / var_73_22
				local var_73_24 = Mathf.Lerp(arg_70_1.var_.alphaOldValue10113, 1, var_73_23)

				if arg_70_1.var_.characterEffect10113 then
					arg_70_1.var_.characterEffect10113.alpha = var_73_24
				end
			end

			if arg_70_1.time_ >= var_73_20 + var_73_22 and arg_70_1.time_ < var_73_20 + var_73_22 + arg_73_0 and arg_70_1.var_.characterEffect10113 then
				arg_70_1.var_.characterEffect10113.alpha = 1
			end

			local var_73_25 = 0
			local var_73_26 = 0.1

			if var_73_25 < arg_70_1.time_ and arg_70_1.time_ <= var_73_25 + arg_73_0 then
				arg_70_1.talkMaxDuration = 0
				arg_70_1.dialogCg_.alpha = 1

				arg_70_1.dialog_:SetActive(true)
				SetActive(arg_70_1.leftNameGo_, true)

				local var_73_27 = arg_70_1:FormatText(StoryNameCfg[1117].name)

				arg_70_1.leftNameTxt_.text = var_73_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_70_1.leftNameTxt_.transform)

				arg_70_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_70_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_70_1:RecordName(arg_70_1.leftNameTxt_.text)
				SetActive(arg_70_1.iconTrs_.gameObject, false)
				arg_70_1.callingController_:SetSelectedState("normal")

				local var_73_28 = arg_70_1:GetWordFromCfg(417221017)
				local var_73_29 = arg_70_1:FormatText(var_73_28.content)

				arg_70_1.text_.text = var_73_29

				LuaForUtil.ClearLinePrefixSymbol(arg_70_1.text_)

				local var_73_30 = 4
				local var_73_31 = utf8.len(var_73_29)
				local var_73_32 = var_73_30 <= 0 and var_73_26 or var_73_26 * (var_73_31 / var_73_30)

				if var_73_32 > 0 and var_73_26 < var_73_32 then
					arg_70_1.talkMaxDuration = var_73_32

					if var_73_32 + var_73_25 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_32 + var_73_25
					end
				end

				arg_70_1.text_.text = var_73_29
				arg_70_1.typewritter.percent = 0

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221017", "story_v_out_417221.awb") ~= 0 then
					local var_73_33 = manager.audio:GetVoiceLength("story_v_out_417221", "417221017", "story_v_out_417221.awb") / 1000

					if var_73_33 + var_73_25 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_33 + var_73_25
					end

					if var_73_28.prefab_name ~= "" and arg_70_1.actors_[var_73_28.prefab_name] ~= nil then
						local var_73_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_70_1.actors_[var_73_28.prefab_name].transform, "story_v_out_417221", "417221017", "story_v_out_417221.awb")

						arg_70_1:RecordAudio("417221017", var_73_34)
						arg_70_1:RecordAudio("417221017", var_73_34)
					else
						arg_70_1:AudioAction("play", "voice", "story_v_out_417221", "417221017", "story_v_out_417221.awb")
					end

					arg_70_1:RecordHistoryTalkVoice("story_v_out_417221", "417221017", "story_v_out_417221.awb")
				end

				arg_70_1:RecordContent(arg_70_1.text_.text)
			end

			local var_73_35 = math.max(var_73_26, arg_70_1.talkMaxDuration)

			if var_73_25 <= arg_70_1.time_ and arg_70_1.time_ < var_73_25 + var_73_35 then
				arg_70_1.typewritter.percent = (arg_70_1.time_ - var_73_25) / var_73_35

				arg_70_1.typewritter:SetDirty()
			end

			if arg_70_1.time_ >= var_73_25 + var_73_35 and arg_70_1.time_ < var_73_25 + var_73_35 + arg_73_0 then
				arg_70_1.typewritter.percent = 1

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(true)
			end
		end
	end,
	Play417221018 = function(arg_74_0, arg_74_1)
		arg_74_1.time_ = 0
		arg_74_1.frameCnt_ = 0
		arg_74_1.state_ = "playing"
		arg_74_1.curTalkId_ = 417221018
		arg_74_1.duration_ = 5

		SetActive(arg_74_1.tipsGo_, false)

		function arg_74_1.onSingleLineFinish_()
			arg_74_1.onSingleLineUpdate_ = nil
			arg_74_1.onSingleLineFinish_ = nil
			arg_74_1.state_ = "waiting"
		end

		function arg_74_1.playNext_(arg_76_0)
			if arg_76_0 == 1 then
				arg_74_0:Play417221019(arg_74_1)
			end
		end

		function arg_74_1.onSingleLineUpdate_(arg_77_0)
			local var_77_0 = arg_74_1.actors_["10113"].transform
			local var_77_1 = 0

			if var_77_1 < arg_74_1.time_ and arg_74_1.time_ <= var_77_1 + arg_77_0 then
				arg_74_1.var_.moveOldPos10113 = var_77_0.localPosition
				var_77_0.localScale = Vector3.New(1, 1, 1)

				arg_74_1:CheckSpriteTmpPos("10113", 7)

				local var_77_2 = var_77_0.childCount

				for iter_77_0 = 0, var_77_2 - 1 do
					local var_77_3 = var_77_0:GetChild(iter_77_0)

					if var_77_3.name == "" or not string.find(var_77_3.name, "split") then
						var_77_3.gameObject:SetActive(true)
					else
						var_77_3.gameObject:SetActive(false)
					end
				end
			end

			local var_77_4 = 0.001

			if var_77_1 <= arg_74_1.time_ and arg_74_1.time_ < var_77_1 + var_77_4 then
				local var_77_5 = (arg_74_1.time_ - var_77_1) / var_77_4
				local var_77_6 = Vector3.New(0, -2000, 0)

				var_77_0.localPosition = Vector3.Lerp(arg_74_1.var_.moveOldPos10113, var_77_6, var_77_5)
			end

			if arg_74_1.time_ >= var_77_1 + var_77_4 and arg_74_1.time_ < var_77_1 + var_77_4 + arg_77_0 then
				var_77_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_77_7 = 0
			local var_77_8 = 0.725

			if var_77_7 < arg_74_1.time_ and arg_74_1.time_ <= var_77_7 + arg_77_0 then
				arg_74_1.talkMaxDuration = 0
				arg_74_1.dialogCg_.alpha = 1

				arg_74_1.dialog_:SetActive(true)
				SetActive(arg_74_1.leftNameGo_, false)

				arg_74_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_74_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_74_1:RecordName(arg_74_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_74_1.iconTrs_.gameObject, false)
				arg_74_1.callingController_:SetSelectedState("normal")

				local var_77_9 = arg_74_1:GetWordFromCfg(417221018)
				local var_77_10 = arg_74_1:FormatText(var_77_9.content)

				arg_74_1.text_.text = var_77_10

				LuaForUtil.ClearLinePrefixSymbol(arg_74_1.text_)

				local var_77_11 = 29
				local var_77_12 = utf8.len(var_77_10)
				local var_77_13 = var_77_11 <= 0 and var_77_8 or var_77_8 * (var_77_12 / var_77_11)

				if var_77_13 > 0 and var_77_8 < var_77_13 then
					arg_74_1.talkMaxDuration = var_77_13

					if var_77_13 + var_77_7 > arg_74_1.duration_ then
						arg_74_1.duration_ = var_77_13 + var_77_7
					end
				end

				arg_74_1.text_.text = var_77_10
				arg_74_1.typewritter.percent = 0

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(false)
				arg_74_1:RecordContent(arg_74_1.text_.text)
			end

			local var_77_14 = math.max(var_77_8, arg_74_1.talkMaxDuration)

			if var_77_7 <= arg_74_1.time_ and arg_74_1.time_ < var_77_7 + var_77_14 then
				arg_74_1.typewritter.percent = (arg_74_1.time_ - var_77_7) / var_77_14

				arg_74_1.typewritter:SetDirty()
			end

			if arg_74_1.time_ >= var_77_7 + var_77_14 and arg_74_1.time_ < var_77_7 + var_77_14 + arg_77_0 then
				arg_74_1.typewritter.percent = 1

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(true)
			end
		end
	end,
	Play417221019 = function(arg_78_0, arg_78_1)
		arg_78_1.time_ = 0
		arg_78_1.frameCnt_ = 0
		arg_78_1.state_ = "playing"
		arg_78_1.curTalkId_ = 417221019
		arg_78_1.duration_ = 5

		SetActive(arg_78_1.tipsGo_, false)

		function arg_78_1.onSingleLineFinish_()
			arg_78_1.onSingleLineUpdate_ = nil
			arg_78_1.onSingleLineFinish_ = nil
			arg_78_1.state_ = "waiting"
		end

		function arg_78_1.playNext_(arg_80_0)
			if arg_80_0 == 1 then
				arg_78_0:Play417221020(arg_78_1)
			end
		end

		function arg_78_1.onSingleLineUpdate_(arg_81_0)
			local var_81_0 = 0
			local var_81_1 = 1.625

			if var_81_0 < arg_78_1.time_ and arg_78_1.time_ <= var_81_0 + arg_81_0 then
				arg_78_1.talkMaxDuration = 0
				arg_78_1.dialogCg_.alpha = 1

				arg_78_1.dialog_:SetActive(true)
				SetActive(arg_78_1.leftNameGo_, false)

				arg_78_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_78_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_78_1:RecordName(arg_78_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_78_1.iconTrs_.gameObject, false)
				arg_78_1.callingController_:SetSelectedState("normal")

				local var_81_2 = arg_78_1:GetWordFromCfg(417221019)
				local var_81_3 = arg_78_1:FormatText(var_81_2.content)

				arg_78_1.text_.text = var_81_3

				LuaForUtil.ClearLinePrefixSymbol(arg_78_1.text_)

				local var_81_4 = 65
				local var_81_5 = utf8.len(var_81_3)
				local var_81_6 = var_81_4 <= 0 and var_81_1 or var_81_1 * (var_81_5 / var_81_4)

				if var_81_6 > 0 and var_81_1 < var_81_6 then
					arg_78_1.talkMaxDuration = var_81_6

					if var_81_6 + var_81_0 > arg_78_1.duration_ then
						arg_78_1.duration_ = var_81_6 + var_81_0
					end
				end

				arg_78_1.text_.text = var_81_3
				arg_78_1.typewritter.percent = 0

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(false)
				arg_78_1:RecordContent(arg_78_1.text_.text)
			end

			local var_81_7 = math.max(var_81_1, arg_78_1.talkMaxDuration)

			if var_81_0 <= arg_78_1.time_ and arg_78_1.time_ < var_81_0 + var_81_7 then
				arg_78_1.typewritter.percent = (arg_78_1.time_ - var_81_0) / var_81_7

				arg_78_1.typewritter:SetDirty()
			end

			if arg_78_1.time_ >= var_81_0 + var_81_7 and arg_78_1.time_ < var_81_0 + var_81_7 + arg_81_0 then
				arg_78_1.typewritter.percent = 1

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(true)
			end
		end
	end,
	Play417221020 = function(arg_82_0, arg_82_1)
		arg_82_1.time_ = 0
		arg_82_1.frameCnt_ = 0
		arg_82_1.state_ = "playing"
		arg_82_1.curTalkId_ = 417221020
		arg_82_1.duration_ = 6.5

		SetActive(arg_82_1.tipsGo_, false)

		function arg_82_1.onSingleLineFinish_()
			arg_82_1.onSingleLineUpdate_ = nil
			arg_82_1.onSingleLineFinish_ = nil
			arg_82_1.state_ = "waiting"
		end

		function arg_82_1.playNext_(arg_84_0)
			if arg_84_0 == 1 then
				arg_82_0:Play417221021(arg_82_1)
			end
		end

		function arg_82_1.onSingleLineUpdate_(arg_85_0)
			local var_85_0 = arg_82_1.actors_["10113"]
			local var_85_1 = 0

			if var_85_1 < arg_82_1.time_ and arg_82_1.time_ <= var_85_1 + arg_85_0 and not isNil(var_85_0) and arg_82_1.var_.actorSpriteComps10113 == nil then
				arg_82_1.var_.actorSpriteComps10113 = var_85_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_85_2 = 0.2

			if var_85_1 <= arg_82_1.time_ and arg_82_1.time_ < var_85_1 + var_85_2 and not isNil(var_85_0) then
				local var_85_3 = (arg_82_1.time_ - var_85_1) / var_85_2

				if arg_82_1.var_.actorSpriteComps10113 then
					for iter_85_0, iter_85_1 in pairs(arg_82_1.var_.actorSpriteComps10113:ToTable()) do
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

			if arg_82_1.time_ >= var_85_1 + var_85_2 and arg_82_1.time_ < var_85_1 + var_85_2 + arg_85_0 and not isNil(var_85_0) and arg_82_1.var_.actorSpriteComps10113 then
				for iter_85_2, iter_85_3 in pairs(arg_82_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_85_3 then
						if arg_82_1.isInRecall_ then
							iter_85_3.color = arg_82_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_85_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_82_1.var_.actorSpriteComps10113 = nil
			end

			local var_85_8 = arg_82_1.actors_["10113"].transform
			local var_85_9 = 0

			if var_85_9 < arg_82_1.time_ and arg_82_1.time_ <= var_85_9 + arg_85_0 then
				arg_82_1.var_.moveOldPos10113 = var_85_8.localPosition
				var_85_8.localScale = Vector3.New(1, 1, 1)

				arg_82_1:CheckSpriteTmpPos("10113", 3)

				local var_85_10 = var_85_8.childCount

				for iter_85_4 = 0, var_85_10 - 1 do
					local var_85_11 = var_85_8:GetChild(iter_85_4)

					if var_85_11.name == "split_1" or not string.find(var_85_11.name, "split") then
						var_85_11.gameObject:SetActive(true)
					else
						var_85_11.gameObject:SetActive(false)
					end
				end
			end

			local var_85_12 = 0.001

			if var_85_9 <= arg_82_1.time_ and arg_82_1.time_ < var_85_9 + var_85_12 then
				local var_85_13 = (arg_82_1.time_ - var_85_9) / var_85_12
				local var_85_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_85_8.localPosition = Vector3.Lerp(arg_82_1.var_.moveOldPos10113, var_85_14, var_85_13)
			end

			if arg_82_1.time_ >= var_85_9 + var_85_12 and arg_82_1.time_ < var_85_9 + var_85_12 + arg_85_0 then
				var_85_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_85_15 = 0
			local var_85_16 = 0.625

			if var_85_15 < arg_82_1.time_ and arg_82_1.time_ <= var_85_15 + arg_85_0 then
				arg_82_1.talkMaxDuration = 0
				arg_82_1.dialogCg_.alpha = 1

				arg_82_1.dialog_:SetActive(true)
				SetActive(arg_82_1.leftNameGo_, true)

				local var_85_17 = arg_82_1:FormatText(StoryNameCfg[1117].name)

				arg_82_1.leftNameTxt_.text = var_85_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_82_1.leftNameTxt_.transform)

				arg_82_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_82_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_82_1:RecordName(arg_82_1.leftNameTxt_.text)
				SetActive(arg_82_1.iconTrs_.gameObject, false)
				arg_82_1.callingController_:SetSelectedState("normal")

				local var_85_18 = arg_82_1:GetWordFromCfg(417221020)
				local var_85_19 = arg_82_1:FormatText(var_85_18.content)

				arg_82_1.text_.text = var_85_19

				LuaForUtil.ClearLinePrefixSymbol(arg_82_1.text_)

				local var_85_20 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221020", "story_v_out_417221.awb") ~= 0 then
					local var_85_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221020", "story_v_out_417221.awb") / 1000

					if var_85_23 + var_85_15 > arg_82_1.duration_ then
						arg_82_1.duration_ = var_85_23 + var_85_15
					end

					if var_85_18.prefab_name ~= "" and arg_82_1.actors_[var_85_18.prefab_name] ~= nil then
						local var_85_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_82_1.actors_[var_85_18.prefab_name].transform, "story_v_out_417221", "417221020", "story_v_out_417221.awb")

						arg_82_1:RecordAudio("417221020", var_85_24)
						arg_82_1:RecordAudio("417221020", var_85_24)
					else
						arg_82_1:AudioAction("play", "voice", "story_v_out_417221", "417221020", "story_v_out_417221.awb")
					end

					arg_82_1:RecordHistoryTalkVoice("story_v_out_417221", "417221020", "story_v_out_417221.awb")
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
	Play417221021 = function(arg_86_0, arg_86_1)
		arg_86_1.time_ = 0
		arg_86_1.frameCnt_ = 0
		arg_86_1.state_ = "playing"
		arg_86_1.curTalkId_ = 417221021
		arg_86_1.duration_ = 2.93

		SetActive(arg_86_1.tipsGo_, false)

		function arg_86_1.onSingleLineFinish_()
			arg_86_1.onSingleLineUpdate_ = nil
			arg_86_1.onSingleLineFinish_ = nil
			arg_86_1.state_ = "waiting"
		end

		function arg_86_1.playNext_(arg_88_0)
			if arg_88_0 == 1 then
				arg_86_0:Play417221022(arg_86_1)
			end
		end

		function arg_86_1.onSingleLineUpdate_(arg_89_0)
			local var_89_0 = 0
			local var_89_1 = 0.25

			if var_89_0 < arg_86_1.time_ and arg_86_1.time_ <= var_89_0 + arg_89_0 then
				arg_86_1.talkMaxDuration = 0
				arg_86_1.dialogCg_.alpha = 1

				arg_86_1.dialog_:SetActive(true)
				SetActive(arg_86_1.leftNameGo_, true)

				local var_89_2 = arg_86_1:FormatText(StoryNameCfg[1117].name)

				arg_86_1.leftNameTxt_.text = var_89_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_86_1.leftNameTxt_.transform)

				arg_86_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_86_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_86_1:RecordName(arg_86_1.leftNameTxt_.text)
				SetActive(arg_86_1.iconTrs_.gameObject, false)
				arg_86_1.callingController_:SetSelectedState("normal")

				local var_89_3 = arg_86_1:GetWordFromCfg(417221021)
				local var_89_4 = arg_86_1:FormatText(var_89_3.content)

				arg_86_1.text_.text = var_89_4

				LuaForUtil.ClearLinePrefixSymbol(arg_86_1.text_)

				local var_89_5 = 10
				local var_89_6 = utf8.len(var_89_4)
				local var_89_7 = var_89_5 <= 0 and var_89_1 or var_89_1 * (var_89_6 / var_89_5)

				if var_89_7 > 0 and var_89_1 < var_89_7 then
					arg_86_1.talkMaxDuration = var_89_7

					if var_89_7 + var_89_0 > arg_86_1.duration_ then
						arg_86_1.duration_ = var_89_7 + var_89_0
					end
				end

				arg_86_1.text_.text = var_89_4
				arg_86_1.typewritter.percent = 0

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221021", "story_v_out_417221.awb") ~= 0 then
					local var_89_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221021", "story_v_out_417221.awb") / 1000

					if var_89_8 + var_89_0 > arg_86_1.duration_ then
						arg_86_1.duration_ = var_89_8 + var_89_0
					end

					if var_89_3.prefab_name ~= "" and arg_86_1.actors_[var_89_3.prefab_name] ~= nil then
						local var_89_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_86_1.actors_[var_89_3.prefab_name].transform, "story_v_out_417221", "417221021", "story_v_out_417221.awb")

						arg_86_1:RecordAudio("417221021", var_89_9)
						arg_86_1:RecordAudio("417221021", var_89_9)
					else
						arg_86_1:AudioAction("play", "voice", "story_v_out_417221", "417221021", "story_v_out_417221.awb")
					end

					arg_86_1:RecordHistoryTalkVoice("story_v_out_417221", "417221021", "story_v_out_417221.awb")
				end

				arg_86_1:RecordContent(arg_86_1.text_.text)
			end

			local var_89_10 = math.max(var_89_1, arg_86_1.talkMaxDuration)

			if var_89_0 <= arg_86_1.time_ and arg_86_1.time_ < var_89_0 + var_89_10 then
				arg_86_1.typewritter.percent = (arg_86_1.time_ - var_89_0) / var_89_10

				arg_86_1.typewritter:SetDirty()
			end

			if arg_86_1.time_ >= var_89_0 + var_89_10 and arg_86_1.time_ < var_89_0 + var_89_10 + arg_89_0 then
				arg_86_1.typewritter.percent = 1

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(true)
			end
		end
	end,
	Play417221022 = function(arg_90_0, arg_90_1)
		arg_90_1.time_ = 0
		arg_90_1.frameCnt_ = 0
		arg_90_1.state_ = "playing"
		arg_90_1.curTalkId_ = 417221022
		arg_90_1.duration_ = 5.1

		SetActive(arg_90_1.tipsGo_, false)

		function arg_90_1.onSingleLineFinish_()
			arg_90_1.onSingleLineUpdate_ = nil
			arg_90_1.onSingleLineFinish_ = nil
			arg_90_1.state_ = "waiting"
		end

		function arg_90_1.playNext_(arg_92_0)
			if arg_92_0 == 1 then
				arg_90_0:Play417221023(arg_90_1)
			end
		end

		function arg_90_1.onSingleLineUpdate_(arg_93_0)
			local var_93_0 = 0
			local var_93_1 = 0.575

			if var_93_0 < arg_90_1.time_ and arg_90_1.time_ <= var_93_0 + arg_93_0 then
				arg_90_1.talkMaxDuration = 0
				arg_90_1.dialogCg_.alpha = 1

				arg_90_1.dialog_:SetActive(true)
				SetActive(arg_90_1.leftNameGo_, true)

				local var_93_2 = arg_90_1:FormatText(StoryNameCfg[1117].name)

				arg_90_1.leftNameTxt_.text = var_93_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_90_1.leftNameTxt_.transform)

				arg_90_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_90_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_90_1:RecordName(arg_90_1.leftNameTxt_.text)
				SetActive(arg_90_1.iconTrs_.gameObject, false)
				arg_90_1.callingController_:SetSelectedState("normal")

				local var_93_3 = arg_90_1:GetWordFromCfg(417221022)
				local var_93_4 = arg_90_1:FormatText(var_93_3.content)

				arg_90_1.text_.text = var_93_4

				LuaForUtil.ClearLinePrefixSymbol(arg_90_1.text_)

				local var_93_5 = 20
				local var_93_6 = utf8.len(var_93_4)
				local var_93_7 = var_93_5 <= 0 and var_93_1 or var_93_1 * (var_93_6 / var_93_5)

				if var_93_7 > 0 and var_93_1 < var_93_7 then
					arg_90_1.talkMaxDuration = var_93_7

					if var_93_7 + var_93_0 > arg_90_1.duration_ then
						arg_90_1.duration_ = var_93_7 + var_93_0
					end
				end

				arg_90_1.text_.text = var_93_4
				arg_90_1.typewritter.percent = 0

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221022", "story_v_out_417221.awb") ~= 0 then
					local var_93_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221022", "story_v_out_417221.awb") / 1000

					if var_93_8 + var_93_0 > arg_90_1.duration_ then
						arg_90_1.duration_ = var_93_8 + var_93_0
					end

					if var_93_3.prefab_name ~= "" and arg_90_1.actors_[var_93_3.prefab_name] ~= nil then
						local var_93_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_90_1.actors_[var_93_3.prefab_name].transform, "story_v_out_417221", "417221022", "story_v_out_417221.awb")

						arg_90_1:RecordAudio("417221022", var_93_9)
						arg_90_1:RecordAudio("417221022", var_93_9)
					else
						arg_90_1:AudioAction("play", "voice", "story_v_out_417221", "417221022", "story_v_out_417221.awb")
					end

					arg_90_1:RecordHistoryTalkVoice("story_v_out_417221", "417221022", "story_v_out_417221.awb")
				end

				arg_90_1:RecordContent(arg_90_1.text_.text)
			end

			local var_93_10 = math.max(var_93_1, arg_90_1.talkMaxDuration)

			if var_93_0 <= arg_90_1.time_ and arg_90_1.time_ < var_93_0 + var_93_10 then
				arg_90_1.typewritter.percent = (arg_90_1.time_ - var_93_0) / var_93_10

				arg_90_1.typewritter:SetDirty()
			end

			if arg_90_1.time_ >= var_93_0 + var_93_10 and arg_90_1.time_ < var_93_0 + var_93_10 + arg_93_0 then
				arg_90_1.typewritter.percent = 1

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(true)
			end
		end
	end,
	Play417221023 = function(arg_94_0, arg_94_1)
		arg_94_1.time_ = 0
		arg_94_1.frameCnt_ = 0
		arg_94_1.state_ = "playing"
		arg_94_1.curTalkId_ = 417221023
		arg_94_1.duration_ = 4.17

		SetActive(arg_94_1.tipsGo_, false)

		function arg_94_1.onSingleLineFinish_()
			arg_94_1.onSingleLineUpdate_ = nil
			arg_94_1.onSingleLineFinish_ = nil
			arg_94_1.state_ = "waiting"
		end

		function arg_94_1.playNext_(arg_96_0)
			if arg_96_0 == 1 then
				arg_94_0:Play417221024(arg_94_1)
			end
		end

		function arg_94_1.onSingleLineUpdate_(arg_97_0)
			local var_97_0 = "ST69"

			if arg_94_1.bgs_[var_97_0] == nil then
				local var_97_1 = Object.Instantiate(arg_94_1.paintGo_)

				var_97_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_97_0)
				var_97_1.name = var_97_0
				var_97_1.transform.parent = arg_94_1.stage_.transform
				var_97_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_94_1.bgs_[var_97_0] = var_97_1
			end

			local var_97_2 = 1

			if var_97_2 < arg_94_1.time_ and arg_94_1.time_ <= var_97_2 + arg_97_0 then
				local var_97_3 = manager.ui.mainCamera.transform.localPosition
				local var_97_4 = Vector3.New(0, 0, 10) + Vector3.New(var_97_3.x, var_97_3.y, 0)
				local var_97_5 = arg_94_1.bgs_.ST69

				var_97_5.transform.localPosition = var_97_4
				var_97_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_97_6 = var_97_5:GetComponent("SpriteRenderer")

				if var_97_6 and var_97_6.sprite then
					local var_97_7 = (var_97_5.transform.localPosition - var_97_3).z
					local var_97_8 = manager.ui.mainCameraCom_
					local var_97_9 = 2 * var_97_7 * Mathf.Tan(var_97_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_97_10 = var_97_9 * var_97_8.aspect
					local var_97_11 = var_97_6.sprite.bounds.size.x
					local var_97_12 = var_97_6.sprite.bounds.size.y
					local var_97_13 = var_97_10 / var_97_11
					local var_97_14 = var_97_9 / var_97_12
					local var_97_15 = var_97_14 < var_97_13 and var_97_13 or var_97_14

					var_97_5.transform.localScale = Vector3.New(var_97_15, var_97_15, 0)
				end

				for iter_97_0, iter_97_1 in pairs(arg_94_1.bgs_) do
					if iter_97_0 ~= "ST69" then
						iter_97_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_97_16 = 3

			if var_97_16 < arg_94_1.time_ and arg_94_1.time_ <= var_97_16 + arg_97_0 then
				arg_94_1.allBtn_.enabled = false
			end

			local var_97_17 = 0.0750000000000002

			if arg_94_1.time_ >= var_97_16 + var_97_17 and arg_94_1.time_ < var_97_16 + var_97_17 + arg_97_0 then
				arg_94_1.allBtn_.enabled = true
			end

			local var_97_18 = 0

			if var_97_18 < arg_94_1.time_ and arg_94_1.time_ <= var_97_18 + arg_97_0 then
				arg_94_1.mask_.enabled = true
				arg_94_1.mask_.raycastTarget = true

				arg_94_1:SetGaussion(false)
			end

			local var_97_19 = 1

			if var_97_18 <= arg_94_1.time_ and arg_94_1.time_ < var_97_18 + var_97_19 then
				local var_97_20 = (arg_94_1.time_ - var_97_18) / var_97_19
				local var_97_21 = Color.New(0, 0, 0)

				var_97_21.a = Mathf.Lerp(0, 1, var_97_20)
				arg_94_1.mask_.color = var_97_21
			end

			if arg_94_1.time_ >= var_97_18 + var_97_19 and arg_94_1.time_ < var_97_18 + var_97_19 + arg_97_0 then
				local var_97_22 = Color.New(0, 0, 0)

				var_97_22.a = 1
				arg_94_1.mask_.color = var_97_22
			end

			local var_97_23 = 1

			if var_97_23 < arg_94_1.time_ and arg_94_1.time_ <= var_97_23 + arg_97_0 then
				arg_94_1.mask_.enabled = true
				arg_94_1.mask_.raycastTarget = true

				arg_94_1:SetGaussion(false)
			end

			local var_97_24 = 2

			if var_97_23 <= arg_94_1.time_ and arg_94_1.time_ < var_97_23 + var_97_24 then
				local var_97_25 = (arg_94_1.time_ - var_97_23) / var_97_24
				local var_97_26 = Color.New(0, 0, 0)

				var_97_26.a = Mathf.Lerp(1, 0, var_97_25)
				arg_94_1.mask_.color = var_97_26
			end

			if arg_94_1.time_ >= var_97_23 + var_97_24 and arg_94_1.time_ < var_97_23 + var_97_24 + arg_97_0 then
				local var_97_27 = Color.New(0, 0, 0)
				local var_97_28 = 0

				arg_94_1.mask_.enabled = false
				var_97_27.a = var_97_28
				arg_94_1.mask_.color = var_97_27
			end

			local var_97_29 = "1034"

			if arg_94_1.actors_[var_97_29] == nil then
				local var_97_30 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1034")

				if not isNil(var_97_30) then
					local var_97_31 = Object.Instantiate(var_97_30, arg_94_1.canvasGo_.transform)

					var_97_31.transform:SetSiblingIndex(1)

					var_97_31.name = var_97_29
					var_97_31.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_94_1.actors_[var_97_29] = var_97_31

					local var_97_32 = var_97_31:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_94_1.isInRecall_ then
						for iter_97_2, iter_97_3 in ipairs(var_97_32) do
							iter_97_3.color = arg_94_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_97_33 = arg_94_1.actors_["1034"].transform
			local var_97_34 = 2.73266666666667

			if var_97_34 < arg_94_1.time_ and arg_94_1.time_ <= var_97_34 + arg_97_0 then
				arg_94_1.var_.moveOldPos1034 = var_97_33.localPosition
				var_97_33.localScale = Vector3.New(1, 1, 1)

				arg_94_1:CheckSpriteTmpPos("1034", 3)

				local var_97_35 = var_97_33.childCount

				for iter_97_4 = 0, var_97_35 - 1 do
					local var_97_36 = var_97_33:GetChild(iter_97_4)

					if var_97_36.name == "split_6" or not string.find(var_97_36.name, "split") then
						var_97_36.gameObject:SetActive(true)
					else
						var_97_36.gameObject:SetActive(false)
					end
				end
			end

			local var_97_37 = 0.001

			if var_97_34 <= arg_94_1.time_ and arg_94_1.time_ < var_97_34 + var_97_37 then
				local var_97_38 = (arg_94_1.time_ - var_97_34) / var_97_37
				local var_97_39 = Vector3.New(0, -331.9, -324)

				var_97_33.localPosition = Vector3.Lerp(arg_94_1.var_.moveOldPos1034, var_97_39, var_97_38)
			end

			if arg_94_1.time_ >= var_97_34 + var_97_37 and arg_94_1.time_ < var_97_34 + var_97_37 + arg_97_0 then
				var_97_33.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_97_40 = arg_94_1.actors_["1034"]
			local var_97_41 = 2.73266666666667

			if var_97_41 < arg_94_1.time_ and arg_94_1.time_ <= var_97_41 + arg_97_0 and not isNil(var_97_40) and arg_94_1.var_.actorSpriteComps1034 == nil then
				arg_94_1.var_.actorSpriteComps1034 = var_97_40:GetComponentsInChildren(typeof(Image), true)
			end

			local var_97_42 = 0.2

			if var_97_41 <= arg_94_1.time_ and arg_94_1.time_ < var_97_41 + var_97_42 and not isNil(var_97_40) then
				local var_97_43 = (arg_94_1.time_ - var_97_41) / var_97_42

				if arg_94_1.var_.actorSpriteComps1034 then
					for iter_97_5, iter_97_6 in pairs(arg_94_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_97_6 then
							if arg_94_1.isInRecall_ then
								local var_97_44 = Mathf.Lerp(iter_97_6.color.r, arg_94_1.hightColor1.r, var_97_43)
								local var_97_45 = Mathf.Lerp(iter_97_6.color.g, arg_94_1.hightColor1.g, var_97_43)
								local var_97_46 = Mathf.Lerp(iter_97_6.color.b, arg_94_1.hightColor1.b, var_97_43)

								iter_97_6.color = Color.New(var_97_44, var_97_45, var_97_46)
							else
								local var_97_47 = Mathf.Lerp(iter_97_6.color.r, 1, var_97_43)

								iter_97_6.color = Color.New(var_97_47, var_97_47, var_97_47)
							end
						end
					end
				end
			end

			if arg_94_1.time_ >= var_97_41 + var_97_42 and arg_94_1.time_ < var_97_41 + var_97_42 + arg_97_0 and not isNil(var_97_40) and arg_94_1.var_.actorSpriteComps1034 then
				for iter_97_7, iter_97_8 in pairs(arg_94_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_97_8 then
						if arg_94_1.isInRecall_ then
							iter_97_8.color = arg_94_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_97_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_94_1.var_.actorSpriteComps1034 = nil
			end

			local var_97_48 = arg_94_1.actors_["1034"]
			local var_97_49 = 2.73266666666667

			if var_97_49 < arg_94_1.time_ and arg_94_1.time_ <= var_97_49 + arg_97_0 then
				local var_97_50 = var_97_48:GetComponentInChildren(typeof(CanvasGroup))

				if var_97_50 then
					arg_94_1.var_.alphaOldValue1034 = var_97_50.alpha
					arg_94_1.var_.characterEffect1034 = var_97_50
				end

				arg_94_1.var_.alphaOldValue1034 = 0
			end

			local var_97_51 = 0.267333333333333

			if var_97_49 <= arg_94_1.time_ and arg_94_1.time_ < var_97_49 + var_97_51 then
				local var_97_52 = (arg_94_1.time_ - var_97_49) / var_97_51
				local var_97_53 = Mathf.Lerp(arg_94_1.var_.alphaOldValue1034, 1, var_97_52)

				if arg_94_1.var_.characterEffect1034 then
					arg_94_1.var_.characterEffect1034.alpha = var_97_53
				end
			end

			if arg_94_1.time_ >= var_97_49 + var_97_51 and arg_94_1.time_ < var_97_49 + var_97_51 + arg_97_0 and arg_94_1.var_.characterEffect1034 then
				arg_94_1.var_.characterEffect1034.alpha = 1
			end

			local var_97_54 = arg_94_1.actors_["10113"].transform
			local var_97_55 = 1

			if var_97_55 < arg_94_1.time_ and arg_94_1.time_ <= var_97_55 + arg_97_0 then
				arg_94_1.var_.moveOldPos10113 = var_97_54.localPosition
				var_97_54.localScale = Vector3.New(1, 1, 1)

				arg_94_1:CheckSpriteTmpPos("10113", 7)

				local var_97_56 = var_97_54.childCount

				for iter_97_9 = 0, var_97_56 - 1 do
					local var_97_57 = var_97_54:GetChild(iter_97_9)

					if var_97_57.name == "" or not string.find(var_97_57.name, "split") then
						var_97_57.gameObject:SetActive(true)
					else
						var_97_57.gameObject:SetActive(false)
					end
				end
			end

			local var_97_58 = 0.001

			if var_97_55 <= arg_94_1.time_ and arg_94_1.time_ < var_97_55 + var_97_58 then
				local var_97_59 = (arg_94_1.time_ - var_97_55) / var_97_58
				local var_97_60 = Vector3.New(0, -2000, 0)

				var_97_54.localPosition = Vector3.Lerp(arg_94_1.var_.moveOldPos10113, var_97_60, var_97_59)
			end

			if arg_94_1.time_ >= var_97_55 + var_97_58 and arg_94_1.time_ < var_97_55 + var_97_58 + arg_97_0 then
				var_97_54.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_97_61 = 0.2
			local var_97_62 = 1

			if var_97_61 < arg_94_1.time_ and arg_94_1.time_ <= var_97_61 + arg_97_0 then
				local var_97_63 = "stop"
				local var_97_64 = "effect"

				arg_94_1:AudioAction(var_97_63, var_97_64, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			if arg_94_1.frameCnt_ <= 1 then
				arg_94_1.dialog_:SetActive(false)
			end

			local var_97_65 = 3
			local var_97_66 = 0.075

			if var_97_65 < arg_94_1.time_ and arg_94_1.time_ <= var_97_65 + arg_97_0 then
				arg_94_1.talkMaxDuration = 0

				arg_94_1.dialog_:SetActive(true)

				local var_97_67 = LeanTween.value(arg_94_1.dialog_, 0, 1, 0.3)

				var_97_67:setOnUpdate(LuaHelper.FloatAction(function(arg_98_0)
					arg_94_1.dialogCg_.alpha = arg_98_0
				end))
				var_97_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_94_1.dialog_)
					var_97_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_94_1.duration_ = arg_94_1.duration_ + 0.3

				SetActive(arg_94_1.leftNameGo_, true)

				local var_97_68 = arg_94_1:FormatText(StoryNameCfg[1109].name)

				arg_94_1.leftNameTxt_.text = var_97_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_94_1.leftNameTxt_.transform)

				arg_94_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_94_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_94_1:RecordName(arg_94_1.leftNameTxt_.text)
				SetActive(arg_94_1.iconTrs_.gameObject, false)
				arg_94_1.callingController_:SetSelectedState("normal")

				local var_97_69 = arg_94_1:GetWordFromCfg(417221023)
				local var_97_70 = arg_94_1:FormatText(var_97_69.content)

				arg_94_1.text_.text = var_97_70

				LuaForUtil.ClearLinePrefixSymbol(arg_94_1.text_)

				local var_97_71 = 3
				local var_97_72 = utf8.len(var_97_70)
				local var_97_73 = var_97_71 <= 0 and var_97_66 or var_97_66 * (var_97_72 / var_97_71)

				if var_97_73 > 0 and var_97_66 < var_97_73 then
					arg_94_1.talkMaxDuration = var_97_73
					var_97_65 = var_97_65 + 0.3

					if var_97_73 + var_97_65 > arg_94_1.duration_ then
						arg_94_1.duration_ = var_97_73 + var_97_65
					end
				end

				arg_94_1.text_.text = var_97_70
				arg_94_1.typewritter.percent = 0

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221023", "story_v_out_417221.awb") ~= 0 then
					local var_97_74 = manager.audio:GetVoiceLength("story_v_out_417221", "417221023", "story_v_out_417221.awb") / 1000

					if var_97_74 + var_97_65 > arg_94_1.duration_ then
						arg_94_1.duration_ = var_97_74 + var_97_65
					end

					if var_97_69.prefab_name ~= "" and arg_94_1.actors_[var_97_69.prefab_name] ~= nil then
						local var_97_75 = LuaForUtil.PlayVoiceWithCriLipsync(arg_94_1.actors_[var_97_69.prefab_name].transform, "story_v_out_417221", "417221023", "story_v_out_417221.awb")

						arg_94_1:RecordAudio("417221023", var_97_75)
						arg_94_1:RecordAudio("417221023", var_97_75)
					else
						arg_94_1:AudioAction("play", "voice", "story_v_out_417221", "417221023", "story_v_out_417221.awb")
					end

					arg_94_1:RecordHistoryTalkVoice("story_v_out_417221", "417221023", "story_v_out_417221.awb")
				end

				arg_94_1:RecordContent(arg_94_1.text_.text)
			end

			local var_97_76 = var_97_65 + 0.3
			local var_97_77 = math.max(var_97_66, arg_94_1.talkMaxDuration)

			if var_97_76 <= arg_94_1.time_ and arg_94_1.time_ < var_97_76 + var_97_77 then
				arg_94_1.typewritter.percent = (arg_94_1.time_ - var_97_76) / var_97_77

				arg_94_1.typewritter:SetDirty()
			end

			if arg_94_1.time_ >= var_97_76 + var_97_77 and arg_94_1.time_ < var_97_76 + var_97_77 + arg_97_0 then
				arg_94_1.typewritter.percent = 1

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(true)
			end
		end
	end,
	Play417221024 = function(arg_100_0, arg_100_1)
		arg_100_1.time_ = 0
		arg_100_1.frameCnt_ = 0
		arg_100_1.state_ = "playing"
		arg_100_1.curTalkId_ = 417221024
		arg_100_1.duration_ = 5

		SetActive(arg_100_1.tipsGo_, false)

		function arg_100_1.onSingleLineFinish_()
			arg_100_1.onSingleLineUpdate_ = nil
			arg_100_1.onSingleLineFinish_ = nil
			arg_100_1.state_ = "waiting"
		end

		function arg_100_1.playNext_(arg_102_0)
			if arg_102_0 == 1 then
				arg_100_0:Play417221025(arg_100_1)
			end
		end

		function arg_100_1.onSingleLineUpdate_(arg_103_0)
			local var_103_0 = arg_100_1.actors_["1034"].transform
			local var_103_1 = 0

			if var_103_1 < arg_100_1.time_ and arg_100_1.time_ <= var_103_1 + arg_103_0 then
				arg_100_1.var_.moveOldPos1034 = var_103_0.localPosition
				var_103_0.localScale = Vector3.New(1, 1, 1)

				arg_100_1:CheckSpriteTmpPos("1034", 7)

				local var_103_2 = var_103_0.childCount

				for iter_103_0 = 0, var_103_2 - 1 do
					local var_103_3 = var_103_0:GetChild(iter_103_0)

					if var_103_3.name == "" or not string.find(var_103_3.name, "split") then
						var_103_3.gameObject:SetActive(true)
					else
						var_103_3.gameObject:SetActive(false)
					end
				end
			end

			local var_103_4 = 0.001

			if var_103_1 <= arg_100_1.time_ and arg_100_1.time_ < var_103_1 + var_103_4 then
				local var_103_5 = (arg_100_1.time_ - var_103_1) / var_103_4
				local var_103_6 = Vector3.New(0, -2000, 0)

				var_103_0.localPosition = Vector3.Lerp(arg_100_1.var_.moveOldPos1034, var_103_6, var_103_5)
			end

			if arg_100_1.time_ >= var_103_1 + var_103_4 and arg_100_1.time_ < var_103_1 + var_103_4 + arg_103_0 then
				var_103_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_103_7 = 1.36666666666667
			local var_103_8 = 1

			if var_103_7 < arg_100_1.time_ and arg_100_1.time_ <= var_103_7 + arg_103_0 then
				local var_103_9 = "play"
				local var_103_10 = "effect"

				arg_100_1:AudioAction(var_103_9, var_103_10, "se_story_1310", "se_story_1310_uiout", "")
			end

			local var_103_11 = 0
			local var_103_12 = 1.15

			if var_103_11 < arg_100_1.time_ and arg_100_1.time_ <= var_103_11 + arg_103_0 then
				arg_100_1.talkMaxDuration = 0
				arg_100_1.dialogCg_.alpha = 1

				arg_100_1.dialog_:SetActive(true)
				SetActive(arg_100_1.leftNameGo_, false)

				arg_100_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_100_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_100_1:RecordName(arg_100_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_100_1.iconTrs_.gameObject, false)
				arg_100_1.callingController_:SetSelectedState("normal")

				local var_103_13 = arg_100_1:GetWordFromCfg(417221024)
				local var_103_14 = arg_100_1:FormatText(var_103_13.content)

				arg_100_1.text_.text = var_103_14

				LuaForUtil.ClearLinePrefixSymbol(arg_100_1.text_)

				local var_103_15 = 46
				local var_103_16 = utf8.len(var_103_14)
				local var_103_17 = var_103_15 <= 0 and var_103_12 or var_103_12 * (var_103_16 / var_103_15)

				if var_103_17 > 0 and var_103_12 < var_103_17 then
					arg_100_1.talkMaxDuration = var_103_17

					if var_103_17 + var_103_11 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_17 + var_103_11
					end
				end

				arg_100_1.text_.text = var_103_14
				arg_100_1.typewritter.percent = 0

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(false)
				arg_100_1:RecordContent(arg_100_1.text_.text)
			end

			local var_103_18 = math.max(var_103_12, arg_100_1.talkMaxDuration)

			if var_103_11 <= arg_100_1.time_ and arg_100_1.time_ < var_103_11 + var_103_18 then
				arg_100_1.typewritter.percent = (arg_100_1.time_ - var_103_11) / var_103_18

				arg_100_1.typewritter:SetDirty()
			end

			if arg_100_1.time_ >= var_103_11 + var_103_18 and arg_100_1.time_ < var_103_11 + var_103_18 + arg_103_0 then
				arg_100_1.typewritter.percent = 1

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(true)
			end
		end
	end,
	Play417221025 = function(arg_104_0, arg_104_1)
		arg_104_1.time_ = 0
		arg_104_1.frameCnt_ = 0
		arg_104_1.state_ = "playing"
		arg_104_1.curTalkId_ = 417221025
		arg_104_1.duration_ = 5

		SetActive(arg_104_1.tipsGo_, false)

		function arg_104_1.onSingleLineFinish_()
			arg_104_1.onSingleLineUpdate_ = nil
			arg_104_1.onSingleLineFinish_ = nil
			arg_104_1.state_ = "waiting"
		end

		function arg_104_1.playNext_(arg_106_0)
			if arg_106_0 == 1 then
				arg_104_0:Play417221026(arg_104_1)
			end
		end

		function arg_104_1.onSingleLineUpdate_(arg_107_0)
			local var_107_0 = 0
			local var_107_1 = 1.25

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

				local var_107_2 = arg_104_1:GetWordFromCfg(417221025)
				local var_107_3 = arg_104_1:FormatText(var_107_2.content)

				arg_104_1.text_.text = var_107_3

				LuaForUtil.ClearLinePrefixSymbol(arg_104_1.text_)

				local var_107_4 = 50
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
	Play417221026 = function(arg_108_0, arg_108_1)
		arg_108_1.time_ = 0
		arg_108_1.frameCnt_ = 0
		arg_108_1.state_ = "playing"
		arg_108_1.curTalkId_ = 417221026
		arg_108_1.duration_ = 5.1

		SetActive(arg_108_1.tipsGo_, false)

		function arg_108_1.onSingleLineFinish_()
			arg_108_1.onSingleLineUpdate_ = nil
			arg_108_1.onSingleLineFinish_ = nil
			arg_108_1.state_ = "waiting"
		end

		function arg_108_1.playNext_(arg_110_0)
			if arg_110_0 == 1 then
				arg_108_0:Play417221027(arg_108_1)
			end
		end

		function arg_108_1.onSingleLineUpdate_(arg_111_0)
			local var_111_0 = arg_108_1.actors_["1034"]
			local var_111_1 = 0

			if var_111_1 < arg_108_1.time_ and arg_108_1.time_ <= var_111_1 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.actorSpriteComps1034 == nil then
				arg_108_1.var_.actorSpriteComps1034 = var_111_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_111_2 = 0.2

			if var_111_1 <= arg_108_1.time_ and arg_108_1.time_ < var_111_1 + var_111_2 and not isNil(var_111_0) then
				local var_111_3 = (arg_108_1.time_ - var_111_1) / var_111_2

				if arg_108_1.var_.actorSpriteComps1034 then
					for iter_111_0, iter_111_1 in pairs(arg_108_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_111_1 then
							if arg_108_1.isInRecall_ then
								local var_111_4 = Mathf.Lerp(iter_111_1.color.r, arg_108_1.hightColor1.r, var_111_3)
								local var_111_5 = Mathf.Lerp(iter_111_1.color.g, arg_108_1.hightColor1.g, var_111_3)
								local var_111_6 = Mathf.Lerp(iter_111_1.color.b, arg_108_1.hightColor1.b, var_111_3)

								iter_111_1.color = Color.New(var_111_4, var_111_5, var_111_6)
							else
								local var_111_7 = Mathf.Lerp(iter_111_1.color.r, 1, var_111_3)

								iter_111_1.color = Color.New(var_111_7, var_111_7, var_111_7)
							end
						end
					end
				end
			end

			if arg_108_1.time_ >= var_111_1 + var_111_2 and arg_108_1.time_ < var_111_1 + var_111_2 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.actorSpriteComps1034 then
				for iter_111_2, iter_111_3 in pairs(arg_108_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_111_3 then
						if arg_108_1.isInRecall_ then
							iter_111_3.color = arg_108_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_111_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_108_1.var_.actorSpriteComps1034 = nil
			end

			local var_111_8 = arg_108_1.actors_["1034"].transform
			local var_111_9 = 0

			if var_111_9 < arg_108_1.time_ and arg_108_1.time_ <= var_111_9 + arg_111_0 then
				arg_108_1.var_.moveOldPos1034 = var_111_8.localPosition
				var_111_8.localScale = Vector3.New(1, 1, 1)

				arg_108_1:CheckSpriteTmpPos("1034", 3)

				local var_111_10 = var_111_8.childCount

				for iter_111_4 = 0, var_111_10 - 1 do
					local var_111_11 = var_111_8:GetChild(iter_111_4)

					if var_111_11.name == "split_6" or not string.find(var_111_11.name, "split") then
						var_111_11.gameObject:SetActive(true)
					else
						var_111_11.gameObject:SetActive(false)
					end
				end
			end

			local var_111_12 = 0.001

			if var_111_9 <= arg_108_1.time_ and arg_108_1.time_ < var_111_9 + var_111_12 then
				local var_111_13 = (arg_108_1.time_ - var_111_9) / var_111_12
				local var_111_14 = Vector3.New(0, -331.9, -324)

				var_111_8.localPosition = Vector3.Lerp(arg_108_1.var_.moveOldPos1034, var_111_14, var_111_13)
			end

			if arg_108_1.time_ >= var_111_9 + var_111_12 and arg_108_1.time_ < var_111_9 + var_111_12 + arg_111_0 then
				var_111_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_111_15 = 0
			local var_111_16 = 0.575

			if var_111_15 < arg_108_1.time_ and arg_108_1.time_ <= var_111_15 + arg_111_0 then
				arg_108_1.talkMaxDuration = 0
				arg_108_1.dialogCg_.alpha = 1

				arg_108_1.dialog_:SetActive(true)
				SetActive(arg_108_1.leftNameGo_, true)

				local var_111_17 = arg_108_1:FormatText(StoryNameCfg[1109].name)

				arg_108_1.leftNameTxt_.text = var_111_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_108_1.leftNameTxt_.transform)

				arg_108_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_108_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_108_1:RecordName(arg_108_1.leftNameTxt_.text)
				SetActive(arg_108_1.iconTrs_.gameObject, false)
				arg_108_1.callingController_:SetSelectedState("normal")

				local var_111_18 = arg_108_1:GetWordFromCfg(417221026)
				local var_111_19 = arg_108_1:FormatText(var_111_18.content)

				arg_108_1.text_.text = var_111_19

				LuaForUtil.ClearLinePrefixSymbol(arg_108_1.text_)

				local var_111_20 = 23
				local var_111_21 = utf8.len(var_111_19)
				local var_111_22 = var_111_20 <= 0 and var_111_16 or var_111_16 * (var_111_21 / var_111_20)

				if var_111_22 > 0 and var_111_16 < var_111_22 then
					arg_108_1.talkMaxDuration = var_111_22

					if var_111_22 + var_111_15 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_22 + var_111_15
					end
				end

				arg_108_1.text_.text = var_111_19
				arg_108_1.typewritter.percent = 0

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221026", "story_v_out_417221.awb") ~= 0 then
					local var_111_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221026", "story_v_out_417221.awb") / 1000

					if var_111_23 + var_111_15 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_23 + var_111_15
					end

					if var_111_18.prefab_name ~= "" and arg_108_1.actors_[var_111_18.prefab_name] ~= nil then
						local var_111_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_108_1.actors_[var_111_18.prefab_name].transform, "story_v_out_417221", "417221026", "story_v_out_417221.awb")

						arg_108_1:RecordAudio("417221026", var_111_24)
						arg_108_1:RecordAudio("417221026", var_111_24)
					else
						arg_108_1:AudioAction("play", "voice", "story_v_out_417221", "417221026", "story_v_out_417221.awb")
					end

					arg_108_1:RecordHistoryTalkVoice("story_v_out_417221", "417221026", "story_v_out_417221.awb")
				end

				arg_108_1:RecordContent(arg_108_1.text_.text)
			end

			local var_111_25 = math.max(var_111_16, arg_108_1.talkMaxDuration)

			if var_111_15 <= arg_108_1.time_ and arg_108_1.time_ < var_111_15 + var_111_25 then
				arg_108_1.typewritter.percent = (arg_108_1.time_ - var_111_15) / var_111_25

				arg_108_1.typewritter:SetDirty()
			end

			if arg_108_1.time_ >= var_111_15 + var_111_25 and arg_108_1.time_ < var_111_15 + var_111_25 + arg_111_0 then
				arg_108_1.typewritter.percent = 1

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(true)
			end
		end
	end,
	Play417221027 = function(arg_112_0, arg_112_1)
		arg_112_1.time_ = 0
		arg_112_1.frameCnt_ = 0
		arg_112_1.state_ = "playing"
		arg_112_1.curTalkId_ = 417221027
		arg_112_1.duration_ = 5

		SetActive(arg_112_1.tipsGo_, false)

		function arg_112_1.onSingleLineFinish_()
			arg_112_1.onSingleLineUpdate_ = nil
			arg_112_1.onSingleLineFinish_ = nil
			arg_112_1.state_ = "waiting"
		end

		function arg_112_1.playNext_(arg_114_0)
			if arg_114_0 == 1 then
				arg_112_0:Play417221028(arg_112_1)
			end
		end

		function arg_112_1.onSingleLineUpdate_(arg_115_0)
			local var_115_0 = arg_112_1.actors_["1034"].transform
			local var_115_1 = 0

			if var_115_1 < arg_112_1.time_ and arg_112_1.time_ <= var_115_1 + arg_115_0 then
				arg_112_1.var_.moveOldPos1034 = var_115_0.localPosition
				var_115_0.localScale = Vector3.New(1, 1, 1)

				arg_112_1:CheckSpriteTmpPos("1034", 7)

				local var_115_2 = var_115_0.childCount

				for iter_115_0 = 0, var_115_2 - 1 do
					local var_115_3 = var_115_0:GetChild(iter_115_0)

					if var_115_3.name == "" or not string.find(var_115_3.name, "split") then
						var_115_3.gameObject:SetActive(true)
					else
						var_115_3.gameObject:SetActive(false)
					end
				end
			end

			local var_115_4 = 0.001

			if var_115_1 <= arg_112_1.time_ and arg_112_1.time_ < var_115_1 + var_115_4 then
				local var_115_5 = (arg_112_1.time_ - var_115_1) / var_115_4
				local var_115_6 = Vector3.New(0, -2000, 0)

				var_115_0.localPosition = Vector3.Lerp(arg_112_1.var_.moveOldPos1034, var_115_6, var_115_5)
			end

			if arg_112_1.time_ >= var_115_1 + var_115_4 and arg_112_1.time_ < var_115_1 + var_115_4 + arg_115_0 then
				var_115_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_115_7 = 0
			local var_115_8 = 1.475

			if var_115_7 < arg_112_1.time_ and arg_112_1.time_ <= var_115_7 + arg_115_0 then
				arg_112_1.talkMaxDuration = 0
				arg_112_1.dialogCg_.alpha = 1

				arg_112_1.dialog_:SetActive(true)
				SetActive(arg_112_1.leftNameGo_, false)

				arg_112_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_112_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_112_1:RecordName(arg_112_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_112_1.iconTrs_.gameObject, false)
				arg_112_1.callingController_:SetSelectedState("normal")

				local var_115_9 = arg_112_1:GetWordFromCfg(417221027)
				local var_115_10 = arg_112_1:FormatText(var_115_9.content)

				arg_112_1.text_.text = var_115_10

				LuaForUtil.ClearLinePrefixSymbol(arg_112_1.text_)

				local var_115_11 = 59
				local var_115_12 = utf8.len(var_115_10)
				local var_115_13 = var_115_11 <= 0 and var_115_8 or var_115_8 * (var_115_12 / var_115_11)

				if var_115_13 > 0 and var_115_8 < var_115_13 then
					arg_112_1.talkMaxDuration = var_115_13

					if var_115_13 + var_115_7 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_13 + var_115_7
					end
				end

				arg_112_1.text_.text = var_115_10
				arg_112_1.typewritter.percent = 0

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(false)
				arg_112_1:RecordContent(arg_112_1.text_.text)
			end

			local var_115_14 = math.max(var_115_8, arg_112_1.talkMaxDuration)

			if var_115_7 <= arg_112_1.time_ and arg_112_1.time_ < var_115_7 + var_115_14 then
				arg_112_1.typewritter.percent = (arg_112_1.time_ - var_115_7) / var_115_14

				arg_112_1.typewritter:SetDirty()
			end

			if arg_112_1.time_ >= var_115_7 + var_115_14 and arg_112_1.time_ < var_115_7 + var_115_14 + arg_115_0 then
				arg_112_1.typewritter.percent = 1

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(true)
			end
		end
	end,
	Play417221028 = function(arg_116_0, arg_116_1)
		arg_116_1.time_ = 0
		arg_116_1.frameCnt_ = 0
		arg_116_1.state_ = "playing"
		arg_116_1.curTalkId_ = 417221028
		arg_116_1.duration_ = 6.3

		SetActive(arg_116_1.tipsGo_, false)

		function arg_116_1.onSingleLineFinish_()
			arg_116_1.onSingleLineUpdate_ = nil
			arg_116_1.onSingleLineFinish_ = nil
			arg_116_1.state_ = "waiting"
		end

		function arg_116_1.playNext_(arg_118_0)
			if arg_118_0 == 1 then
				arg_116_0:Play417221029(arg_116_1)
			end
		end

		function arg_116_1.onSingleLineUpdate_(arg_119_0)
			local var_119_0 = 2

			if var_119_0 < arg_116_1.time_ and arg_116_1.time_ <= var_119_0 + arg_119_0 then
				arg_116_1.allBtn_.enabled = false
			end

			local var_119_1 = 0.3

			if arg_116_1.time_ >= var_119_0 + var_119_1 and arg_116_1.time_ < var_119_0 + var_119_1 + arg_119_0 then
				arg_116_1.allBtn_.enabled = true
			end

			local var_119_2 = 1.00066666666667

			if var_119_2 < arg_116_1.time_ and arg_116_1.time_ <= var_119_2 + arg_119_0 then
				local var_119_3 = manager.ui.mainCamera.transform.localPosition
				local var_119_4 = Vector3.New(0, 0, 10) + Vector3.New(var_119_3.x, var_119_3.y, 0)
				local var_119_5 = arg_116_1.bgs_.ST69

				var_119_5.transform.localPosition = var_119_4
				var_119_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_119_6 = var_119_5:GetComponent("SpriteRenderer")

				if var_119_6 and var_119_6.sprite then
					local var_119_7 = (var_119_5.transform.localPosition - var_119_3).z
					local var_119_8 = manager.ui.mainCameraCom_
					local var_119_9 = 2 * var_119_7 * Mathf.Tan(var_119_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_119_10 = var_119_9 * var_119_8.aspect
					local var_119_11 = var_119_6.sprite.bounds.size.x
					local var_119_12 = var_119_6.sprite.bounds.size.y
					local var_119_13 = var_119_10 / var_119_11
					local var_119_14 = var_119_9 / var_119_12
					local var_119_15 = var_119_14 < var_119_13 and var_119_13 or var_119_14

					var_119_5.transform.localScale = Vector3.New(var_119_15, var_119_15, 0)
				end

				for iter_119_0, iter_119_1 in pairs(arg_116_1.bgs_) do
					if iter_119_0 ~= "ST69" then
						iter_119_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_119_16 = 0

			if var_119_16 < arg_116_1.time_ and arg_116_1.time_ <= var_119_16 + arg_119_0 then
				arg_116_1.mask_.enabled = true
				arg_116_1.mask_.raycastTarget = true

				arg_116_1:SetGaussion(false)
			end

			local var_119_17 = 1

			if var_119_16 <= arg_116_1.time_ and arg_116_1.time_ < var_119_16 + var_119_17 then
				local var_119_18 = (arg_116_1.time_ - var_119_16) / var_119_17
				local var_119_19 = Color.New(0, 0, 0)

				var_119_19.a = Mathf.Lerp(0, 1, var_119_18)
				arg_116_1.mask_.color = var_119_19
			end

			if arg_116_1.time_ >= var_119_16 + var_119_17 and arg_116_1.time_ < var_119_16 + var_119_17 + arg_119_0 then
				local var_119_20 = Color.New(0, 0, 0)

				var_119_20.a = 1
				arg_116_1.mask_.color = var_119_20
			end

			local var_119_21 = 1

			if var_119_21 < arg_116_1.time_ and arg_116_1.time_ <= var_119_21 + arg_119_0 then
				arg_116_1.mask_.enabled = true
				arg_116_1.mask_.raycastTarget = true

				arg_116_1:SetGaussion(false)
			end

			local var_119_22 = 0.999999999999998

			if var_119_21 <= arg_116_1.time_ and arg_116_1.time_ < var_119_21 + var_119_22 then
				local var_119_23 = (arg_116_1.time_ - var_119_21) / var_119_22
				local var_119_24 = Color.New(0, 0, 0)

				var_119_24.a = Mathf.Lerp(1, 0, var_119_23)
				arg_116_1.mask_.color = var_119_24
			end

			if arg_116_1.time_ >= var_119_21 + var_119_22 and arg_116_1.time_ < var_119_21 + var_119_22 + arg_119_0 then
				local var_119_25 = Color.New(0, 0, 0)
				local var_119_26 = 0

				arg_116_1.mask_.enabled = false
				var_119_25.a = var_119_26
				arg_116_1.mask_.color = var_119_25
			end

			local var_119_27 = arg_116_1.actors_["1034"].transform
			local var_119_28 = 0.966666666666667

			if var_119_28 < arg_116_1.time_ and arg_116_1.time_ <= var_119_28 + arg_119_0 then
				arg_116_1.var_.moveOldPos1034 = var_119_27.localPosition
				var_119_27.localScale = Vector3.New(1, 1, 1)

				arg_116_1:CheckSpriteTmpPos("1034", 7)

				local var_119_29 = var_119_27.childCount

				for iter_119_2 = 0, var_119_29 - 1 do
					local var_119_30 = var_119_27:GetChild(iter_119_2)

					if var_119_30.name == "" or not string.find(var_119_30.name, "split") then
						var_119_30.gameObject:SetActive(true)
					else
						var_119_30.gameObject:SetActive(false)
					end
				end
			end

			local var_119_31 = 0.001

			if var_119_28 <= arg_116_1.time_ and arg_116_1.time_ < var_119_28 + var_119_31 then
				local var_119_32 = (arg_116_1.time_ - var_119_28) / var_119_31
				local var_119_33 = Vector3.New(0, -2000, 0)

				var_119_27.localPosition = Vector3.Lerp(arg_116_1.var_.moveOldPos1034, var_119_33, var_119_32)
			end

			if arg_116_1.time_ >= var_119_28 + var_119_31 and arg_116_1.time_ < var_119_28 + var_119_31 + arg_119_0 then
				var_119_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_119_34 = arg_116_1.actors_["1034"].transform
			local var_119_35 = 1.83333333333333

			if var_119_35 < arg_116_1.time_ and arg_116_1.time_ <= var_119_35 + arg_119_0 then
				arg_116_1.var_.moveOldPos1034 = var_119_34.localPosition
				var_119_34.localScale = Vector3.New(1, 1, 1)

				arg_116_1:CheckSpriteTmpPos("1034", 3)

				local var_119_36 = var_119_34.childCount

				for iter_119_3 = 0, var_119_36 - 1 do
					local var_119_37 = var_119_34:GetChild(iter_119_3)

					if var_119_37.name == "split_5" or not string.find(var_119_37.name, "split") then
						var_119_37.gameObject:SetActive(true)
					else
						var_119_37.gameObject:SetActive(false)
					end
				end
			end

			local var_119_38 = 0.001

			if var_119_35 <= arg_116_1.time_ and arg_116_1.time_ < var_119_35 + var_119_38 then
				local var_119_39 = (arg_116_1.time_ - var_119_35) / var_119_38
				local var_119_40 = Vector3.New(0, -331.9, -324)

				var_119_34.localPosition = Vector3.Lerp(arg_116_1.var_.moveOldPos1034, var_119_40, var_119_39)
			end

			if arg_116_1.time_ >= var_119_35 + var_119_38 and arg_116_1.time_ < var_119_35 + var_119_38 + arg_119_0 then
				var_119_34.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_119_41 = arg_116_1.actors_["1034"]
			local var_119_42 = 1.83333333333333

			if var_119_42 < arg_116_1.time_ and arg_116_1.time_ <= var_119_42 + arg_119_0 and not isNil(var_119_41) and arg_116_1.var_.actorSpriteComps1034 == nil then
				arg_116_1.var_.actorSpriteComps1034 = var_119_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_119_43 = 0.167333333333333

			if var_119_42 <= arg_116_1.time_ and arg_116_1.time_ < var_119_42 + var_119_43 and not isNil(var_119_41) then
				local var_119_44 = (arg_116_1.time_ - var_119_42) / var_119_43

				if arg_116_1.var_.actorSpriteComps1034 then
					for iter_119_4, iter_119_5 in pairs(arg_116_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_119_5 then
							if arg_116_1.isInRecall_ then
								local var_119_45 = Mathf.Lerp(iter_119_5.color.r, arg_116_1.hightColor1.r, var_119_44)
								local var_119_46 = Mathf.Lerp(iter_119_5.color.g, arg_116_1.hightColor1.g, var_119_44)
								local var_119_47 = Mathf.Lerp(iter_119_5.color.b, arg_116_1.hightColor1.b, var_119_44)

								iter_119_5.color = Color.New(var_119_45, var_119_46, var_119_47)
							else
								local var_119_48 = Mathf.Lerp(iter_119_5.color.r, 1, var_119_44)

								iter_119_5.color = Color.New(var_119_48, var_119_48, var_119_48)
							end
						end
					end
				end
			end

			if arg_116_1.time_ >= var_119_42 + var_119_43 and arg_116_1.time_ < var_119_42 + var_119_43 + arg_119_0 and not isNil(var_119_41) and arg_116_1.var_.actorSpriteComps1034 then
				for iter_119_6, iter_119_7 in pairs(arg_116_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_119_7 then
						if arg_116_1.isInRecall_ then
							iter_119_7.color = arg_116_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_119_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_116_1.var_.actorSpriteComps1034 = nil
			end

			local var_119_49 = arg_116_1.actors_["1034"]
			local var_119_50 = 1.83333333333333

			if var_119_50 < arg_116_1.time_ and arg_116_1.time_ <= var_119_50 + arg_119_0 then
				local var_119_51 = var_119_49:GetComponentInChildren(typeof(CanvasGroup))

				if var_119_51 then
					arg_116_1.var_.alphaOldValue1034 = var_119_51.alpha
					arg_116_1.var_.characterEffect1034 = var_119_51
				end

				arg_116_1.var_.alphaOldValue1034 = 0
			end

			local var_119_52 = 0.167333333333333

			if var_119_50 <= arg_116_1.time_ and arg_116_1.time_ < var_119_50 + var_119_52 then
				local var_119_53 = (arg_116_1.time_ - var_119_50) / var_119_52
				local var_119_54 = Mathf.Lerp(arg_116_1.var_.alphaOldValue1034, 1, var_119_53)

				if arg_116_1.var_.characterEffect1034 then
					arg_116_1.var_.characterEffect1034.alpha = var_119_54
				end
			end

			if arg_116_1.time_ >= var_119_50 + var_119_52 and arg_116_1.time_ < var_119_50 + var_119_52 + arg_119_0 and arg_116_1.var_.characterEffect1034 then
				arg_116_1.var_.characterEffect1034.alpha = 1
			end

			local var_119_55 = 1.00066666666667

			arg_116_1.isInRecall_ = true

			if var_119_55 < arg_116_1.time_ and arg_116_1.time_ <= var_119_55 + arg_119_0 then
				arg_116_1.screenFilterGo_:SetActive(true)

				arg_116_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
				arg_116_1.hightColor1 = Color.New(0.82, 0.77, 0.62)
				arg_116_1.hightColor2 = Color.New(0.46, 0.43, 0.35)

				for iter_119_8, iter_119_9 in pairs(arg_116_1.actors_) do
					local var_119_56 = iter_119_9:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_119_10, iter_119_11 in ipairs(var_119_56) do
						if iter_119_11.color.r > 0.51 then
							iter_119_11.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_119_11.color = Color.New(0.46, 0.43, 0.35)
						end
					end
				end
			end

			local var_119_57 = 0.0660000000000001

			if var_119_55 <= arg_116_1.time_ and arg_116_1.time_ < var_119_55 + var_119_57 then
				local var_119_58 = (arg_116_1.time_ - var_119_55) / var_119_57

				arg_116_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_119_58)
			end

			if arg_116_1.time_ >= var_119_55 + var_119_57 and arg_116_1.time_ < var_119_55 + var_119_57 + arg_119_0 then
				arg_116_1.screenFilterEffect_.weight = 1
			end

			if arg_116_1.frameCnt_ <= 1 then
				arg_116_1.dialog_:SetActive(false)
			end

			local var_119_59 = 2.00066666666667
			local var_119_60 = 0.55

			if var_119_59 < arg_116_1.time_ and arg_116_1.time_ <= var_119_59 + arg_119_0 then
				arg_116_1.talkMaxDuration = 0

				arg_116_1.dialog_:SetActive(true)

				local var_119_61 = LeanTween.value(arg_116_1.dialog_, 0, 1, 0.3)

				var_119_61:setOnUpdate(LuaHelper.FloatAction(function(arg_120_0)
					arg_116_1.dialogCg_.alpha = arg_120_0
				end))
				var_119_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_116_1.dialog_)
					var_119_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_116_1.duration_ = arg_116_1.duration_ + 0.3

				SetActive(arg_116_1.leftNameGo_, true)

				local var_119_62 = arg_116_1:FormatText(StoryNameCfg[1109].name)

				arg_116_1.leftNameTxt_.text = var_119_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_116_1.leftNameTxt_.transform)

				arg_116_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_116_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_116_1:RecordName(arg_116_1.leftNameTxt_.text)
				SetActive(arg_116_1.iconTrs_.gameObject, false)
				arg_116_1.callingController_:SetSelectedState("normal")

				local var_119_63 = arg_116_1:GetWordFromCfg(417221028)
				local var_119_64 = arg_116_1:FormatText(var_119_63.content)

				arg_116_1.text_.text = var_119_64

				LuaForUtil.ClearLinePrefixSymbol(arg_116_1.text_)

				local var_119_65 = 22
				local var_119_66 = utf8.len(var_119_64)
				local var_119_67 = var_119_65 <= 0 and var_119_60 or var_119_60 * (var_119_66 / var_119_65)

				if var_119_67 > 0 and var_119_60 < var_119_67 then
					arg_116_1.talkMaxDuration = var_119_67
					var_119_59 = var_119_59 + 0.3

					if var_119_67 + var_119_59 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_67 + var_119_59
					end
				end

				arg_116_1.text_.text = var_119_64
				arg_116_1.typewritter.percent = 0

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221028", "story_v_out_417221.awb") ~= 0 then
					local var_119_68 = manager.audio:GetVoiceLength("story_v_out_417221", "417221028", "story_v_out_417221.awb") / 1000

					if var_119_68 + var_119_59 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_68 + var_119_59
					end

					if var_119_63.prefab_name ~= "" and arg_116_1.actors_[var_119_63.prefab_name] ~= nil then
						local var_119_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_116_1.actors_[var_119_63.prefab_name].transform, "story_v_out_417221", "417221028", "story_v_out_417221.awb")

						arg_116_1:RecordAudio("417221028", var_119_69)
						arg_116_1:RecordAudio("417221028", var_119_69)
					else
						arg_116_1:AudioAction("play", "voice", "story_v_out_417221", "417221028", "story_v_out_417221.awb")
					end

					arg_116_1:RecordHistoryTalkVoice("story_v_out_417221", "417221028", "story_v_out_417221.awb")
				end

				arg_116_1:RecordContent(arg_116_1.text_.text)
			end

			local var_119_70 = var_119_59 + 0.3
			local var_119_71 = math.max(var_119_60, arg_116_1.talkMaxDuration)

			if var_119_70 <= arg_116_1.time_ and arg_116_1.time_ < var_119_70 + var_119_71 then
				arg_116_1.typewritter.percent = (arg_116_1.time_ - var_119_70) / var_119_71

				arg_116_1.typewritter:SetDirty()
			end

			if arg_116_1.time_ >= var_119_70 + var_119_71 and arg_116_1.time_ < var_119_70 + var_119_71 + arg_119_0 then
				arg_116_1.typewritter.percent = 1

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(true)
			end
		end
	end,
	Play417221029 = function(arg_122_0, arg_122_1)
		arg_122_1.time_ = 0
		arg_122_1.frameCnt_ = 0
		arg_122_1.state_ = "playing"
		arg_122_1.curTalkId_ = 417221029
		arg_122_1.duration_ = 5

		SetActive(arg_122_1.tipsGo_, false)

		function arg_122_1.onSingleLineFinish_()
			arg_122_1.onSingleLineUpdate_ = nil
			arg_122_1.onSingleLineFinish_ = nil
			arg_122_1.state_ = "waiting"
		end

		function arg_122_1.playNext_(arg_124_0)
			if arg_124_0 == 1 then
				arg_122_0:Play417221030(arg_122_1)
			end
		end

		function arg_122_1.onSingleLineUpdate_(arg_125_0)
			local var_125_0 = arg_122_1.actors_["1034"].transform
			local var_125_1 = 0

			if var_125_1 < arg_122_1.time_ and arg_122_1.time_ <= var_125_1 + arg_125_0 then
				arg_122_1.var_.moveOldPos1034 = var_125_0.localPosition
				var_125_0.localScale = Vector3.New(1, 1, 1)

				arg_122_1:CheckSpriteTmpPos("1034", 7)

				local var_125_2 = var_125_0.childCount

				for iter_125_0 = 0, var_125_2 - 1 do
					local var_125_3 = var_125_0:GetChild(iter_125_0)

					if var_125_3.name == "" or not string.find(var_125_3.name, "split") then
						var_125_3.gameObject:SetActive(true)
					else
						var_125_3.gameObject:SetActive(false)
					end
				end
			end

			local var_125_4 = 0.001

			if var_125_1 <= arg_122_1.time_ and arg_122_1.time_ < var_125_1 + var_125_4 then
				local var_125_5 = (arg_122_1.time_ - var_125_1) / var_125_4
				local var_125_6 = Vector3.New(0, -2000, 0)

				var_125_0.localPosition = Vector3.Lerp(arg_122_1.var_.moveOldPos1034, var_125_6, var_125_5)
			end

			if arg_122_1.time_ >= var_125_1 + var_125_4 and arg_122_1.time_ < var_125_1 + var_125_4 + arg_125_0 then
				var_125_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_125_7 = 0.05
			local var_125_8 = 1

			if var_125_7 < arg_122_1.time_ and arg_122_1.time_ <= var_125_7 + arg_125_0 then
				local var_125_9 = "play"
				local var_125_10 = "effect"

				arg_122_1:AudioAction(var_125_9, var_125_10, "se_story_129", "se_story_129_alarm", "")
			end

			local var_125_11 = 0
			local var_125_12 = 1.3

			if var_125_11 < arg_122_1.time_ and arg_122_1.time_ <= var_125_11 + arg_125_0 then
				arg_122_1.talkMaxDuration = 0
				arg_122_1.dialogCg_.alpha = 1

				arg_122_1.dialog_:SetActive(true)
				SetActive(arg_122_1.leftNameGo_, false)

				arg_122_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_122_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_122_1:RecordName(arg_122_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_122_1.iconTrs_.gameObject, false)
				arg_122_1.callingController_:SetSelectedState("normal")

				local var_125_13 = arg_122_1:GetWordFromCfg(417221029)
				local var_125_14 = arg_122_1:FormatText(var_125_13.content)

				arg_122_1.text_.text = var_125_14

				LuaForUtil.ClearLinePrefixSymbol(arg_122_1.text_)

				local var_125_15 = 52
				local var_125_16 = utf8.len(var_125_14)
				local var_125_17 = var_125_15 <= 0 and var_125_12 or var_125_12 * (var_125_16 / var_125_15)

				if var_125_17 > 0 and var_125_12 < var_125_17 then
					arg_122_1.talkMaxDuration = var_125_17

					if var_125_17 + var_125_11 > arg_122_1.duration_ then
						arg_122_1.duration_ = var_125_17 + var_125_11
					end
				end

				arg_122_1.text_.text = var_125_14
				arg_122_1.typewritter.percent = 0

				arg_122_1.typewritter:SetDirty()
				arg_122_1:ShowNextGo(false)
				arg_122_1:RecordContent(arg_122_1.text_.text)
			end

			local var_125_18 = math.max(var_125_12, arg_122_1.talkMaxDuration)

			if var_125_11 <= arg_122_1.time_ and arg_122_1.time_ < var_125_11 + var_125_18 then
				arg_122_1.typewritter.percent = (arg_122_1.time_ - var_125_11) / var_125_18

				arg_122_1.typewritter:SetDirty()
			end

			if arg_122_1.time_ >= var_125_11 + var_125_18 and arg_122_1.time_ < var_125_11 + var_125_18 + arg_125_0 then
				arg_122_1.typewritter.percent = 1

				arg_122_1.typewritter:SetDirty()
				arg_122_1:ShowNextGo(true)
			end
		end
	end,
	Play417221030 = function(arg_126_0, arg_126_1)
		arg_126_1.time_ = 0
		arg_126_1.frameCnt_ = 0
		arg_126_1.state_ = "playing"
		arg_126_1.curTalkId_ = 417221030
		arg_126_1.duration_ = 5

		SetActive(arg_126_1.tipsGo_, false)

		function arg_126_1.onSingleLineFinish_()
			arg_126_1.onSingleLineUpdate_ = nil
			arg_126_1.onSingleLineFinish_ = nil
			arg_126_1.state_ = "waiting"
		end

		function arg_126_1.playNext_(arg_128_0)
			if arg_128_0 == 1 then
				arg_126_0:Play417221031(arg_126_1)
			end
		end

		function arg_126_1.onSingleLineUpdate_(arg_129_0)
			local var_129_0 = 0
			local var_129_1 = 1.15

			if var_129_0 < arg_126_1.time_ and arg_126_1.time_ <= var_129_0 + arg_129_0 then
				arg_126_1.talkMaxDuration = 0
				arg_126_1.dialogCg_.alpha = 1

				arg_126_1.dialog_:SetActive(true)
				SetActive(arg_126_1.leftNameGo_, false)

				arg_126_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_126_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_126_1:RecordName(arg_126_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_126_1.iconTrs_.gameObject, false)
				arg_126_1.callingController_:SetSelectedState("normal")

				local var_129_2 = arg_126_1:GetWordFromCfg(417221030)
				local var_129_3 = arg_126_1:FormatText(var_129_2.content)

				arg_126_1.text_.text = var_129_3

				LuaForUtil.ClearLinePrefixSymbol(arg_126_1.text_)

				local var_129_4 = 46
				local var_129_5 = utf8.len(var_129_3)
				local var_129_6 = var_129_4 <= 0 and var_129_1 or var_129_1 * (var_129_5 / var_129_4)

				if var_129_6 > 0 and var_129_1 < var_129_6 then
					arg_126_1.talkMaxDuration = var_129_6

					if var_129_6 + var_129_0 > arg_126_1.duration_ then
						arg_126_1.duration_ = var_129_6 + var_129_0
					end
				end

				arg_126_1.text_.text = var_129_3
				arg_126_1.typewritter.percent = 0

				arg_126_1.typewritter:SetDirty()
				arg_126_1:ShowNextGo(false)
				arg_126_1:RecordContent(arg_126_1.text_.text)
			end

			local var_129_7 = math.max(var_129_1, arg_126_1.talkMaxDuration)

			if var_129_0 <= arg_126_1.time_ and arg_126_1.time_ < var_129_0 + var_129_7 then
				arg_126_1.typewritter.percent = (arg_126_1.time_ - var_129_0) / var_129_7

				arg_126_1.typewritter:SetDirty()
			end

			if arg_126_1.time_ >= var_129_0 + var_129_7 and arg_126_1.time_ < var_129_0 + var_129_7 + arg_129_0 then
				arg_126_1.typewritter.percent = 1

				arg_126_1.typewritter:SetDirty()
				arg_126_1:ShowNextGo(true)
			end
		end
	end,
	Play417221031 = function(arg_130_0, arg_130_1)
		arg_130_1.time_ = 0
		arg_130_1.frameCnt_ = 0
		arg_130_1.state_ = "playing"
		arg_130_1.curTalkId_ = 417221031
		arg_130_1.duration_ = 4.02

		SetActive(arg_130_1.tipsGo_, false)

		function arg_130_1.onSingleLineFinish_()
			arg_130_1.onSingleLineUpdate_ = nil
			arg_130_1.onSingleLineFinish_ = nil
			arg_130_1.state_ = "waiting"
		end

		function arg_130_1.playNext_(arg_132_0)
			if arg_132_0 == 1 then
				arg_130_0:Play417221032(arg_130_1)
			end
		end

		function arg_130_1.onSingleLineUpdate_(arg_133_0)
			local var_133_0 = arg_130_1.actors_["1034"].transform
			local var_133_1 = 0

			if var_133_1 < arg_130_1.time_ and arg_130_1.time_ <= var_133_1 + arg_133_0 then
				arg_130_1.var_.moveOldPos1034 = var_133_0.localPosition
				var_133_0.localScale = Vector3.New(1, 1, 1)

				arg_130_1:CheckSpriteTmpPos("1034", 7)

				local var_133_2 = var_133_0.childCount

				for iter_133_0 = 0, var_133_2 - 1 do
					local var_133_3 = var_133_0:GetChild(iter_133_0)

					if var_133_3.name == "" or not string.find(var_133_3.name, "split") then
						var_133_3.gameObject:SetActive(true)
					else
						var_133_3.gameObject:SetActive(false)
					end
				end
			end

			local var_133_4 = 0.001

			if var_133_1 <= arg_130_1.time_ and arg_130_1.time_ < var_133_1 + var_133_4 then
				local var_133_5 = (arg_130_1.time_ - var_133_1) / var_133_4
				local var_133_6 = Vector3.New(0, -2000, 0)

				var_133_0.localPosition = Vector3.Lerp(arg_130_1.var_.moveOldPos1034, var_133_6, var_133_5)
			end

			if arg_130_1.time_ >= var_133_1 + var_133_4 and arg_130_1.time_ < var_133_1 + var_133_4 + arg_133_0 then
				var_133_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_133_7 = 0

			if var_133_7 < arg_130_1.time_ and arg_130_1.time_ <= var_133_7 + arg_133_0 then
				arg_130_1.fswbg_:SetActive(true)
				arg_130_1.dialog_:SetActive(false)

				arg_130_1.fswtw_.percent = 0

				local var_133_8 = arg_130_1:GetWordFromCfg(417221031)
				local var_133_9 = arg_130_1:FormatText(var_133_8.content)

				arg_130_1.fswt_.text = var_133_9

				LuaForUtil.ClearLinePrefixSymbol(arg_130_1.fswt_)

				arg_130_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_130_1.fswtw_:SetDirty()

				arg_130_1.typewritterCharCountI18N = 0

				arg_130_1:ShowNextGo(false)
			end

			local var_133_10 = 0.0166666666666667

			if var_133_10 < arg_130_1.time_ and arg_130_1.time_ <= var_133_10 + arg_133_0 then
				arg_130_1.var_.oldValueTypewriter = arg_130_1.fswtw_.percent

				arg_130_1:ShowNextGo(false)
			end

			local var_133_11 = 26
			local var_133_12 = 1.73333333333333
			local var_133_13 = arg_130_1:GetWordFromCfg(417221031)
			local var_133_14 = arg_130_1:FormatText(var_133_13.content)
			local var_133_15, var_133_16 = arg_130_1:GetPercentByPara(var_133_14, 1)

			if var_133_10 < arg_130_1.time_ and arg_130_1.time_ <= var_133_10 + arg_133_0 then
				arg_130_1.talkMaxDuration = 0

				local var_133_17 = var_133_11 <= 0 and var_133_12 or var_133_12 * ((var_133_16 - arg_130_1.typewritterCharCountI18N) / var_133_11)

				if var_133_17 > 0 and var_133_12 < var_133_17 then
					arg_130_1.talkMaxDuration = var_133_17

					if var_133_17 + var_133_10 > arg_130_1.duration_ then
						arg_130_1.duration_ = var_133_17 + var_133_10
					end
				end
			end

			local var_133_18 = 1.73333333333333
			local var_133_19 = math.max(var_133_18, arg_130_1.talkMaxDuration)

			if var_133_10 <= arg_130_1.time_ and arg_130_1.time_ < var_133_10 + var_133_19 then
				local var_133_20 = (arg_130_1.time_ - var_133_10) / var_133_19

				arg_130_1.fswtw_.percent = Mathf.Lerp(arg_130_1.var_.oldValueTypewriter, var_133_15, var_133_20)
				arg_130_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_130_1.fswtw_:SetDirty()
			end

			if arg_130_1.time_ >= var_133_10 + var_133_19 and arg_130_1.time_ < var_133_10 + var_133_19 + arg_133_0 then
				arg_130_1.fswtw_.percent = var_133_15

				arg_130_1.fswtw_:SetDirty()
				arg_130_1:ShowNextGo(true)

				arg_130_1.typewritterCharCountI18N = var_133_16
			end

			local var_133_21 = 0

			if var_133_21 < arg_130_1.time_ and arg_130_1.time_ <= var_133_21 + arg_133_0 then
				local var_133_22 = arg_130_1.fswbg_.transform:Find("textbox/adapt/content") or arg_130_1.fswbg_.transform:Find("textbox/content")
				local var_133_23 = var_133_22:GetComponent("Text")
				local var_133_24 = var_133_22:GetComponent("RectTransform")

				var_133_23.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_133_24.offsetMin = Vector2.New(0, 0)
				var_133_24.offsetMax = Vector2.New(0, 0)
			end

			local var_133_25
			local var_133_26 = 0

			if var_133_26 < arg_130_1.time_ and arg_130_1.time_ <= var_133_26 + arg_133_0 then
				local var_133_27 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_133_27 then
					var_133_27.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_133_27.radialBlurScale = 0
					var_133_27.radialBlurGradient = 1
					var_133_27.radialBlurIntensity = 1

					if var_133_25 then
						var_133_27.radialBlurTarget = var_133_25.transform
					end
				end
			end

			local var_133_28 = 1.75

			if var_133_26 <= arg_130_1.time_ and arg_130_1.time_ < var_133_26 + var_133_28 then
				local var_133_29 = (arg_130_1.time_ - var_133_26) / var_133_28
				local var_133_30 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_133_30 then
					var_133_30.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_133_30.radialBlurScale = Mathf.Lerp(0, 0, var_133_29)
					var_133_30.radialBlurGradient = Mathf.Lerp(1, 1, var_133_29)
					var_133_30.radialBlurIntensity = Mathf.Lerp(1, 1, var_133_29)
				end
			end

			if arg_130_1.time_ >= var_133_26 + var_133_28 and arg_130_1.time_ < var_133_26 + var_133_28 + arg_133_0 then
				local var_133_31 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_133_31 then
					var_133_31.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_133_31.radialBlurScale = 0
					var_133_31.radialBlurGradient = 1
					var_133_31.radialBlurIntensity = 1
				end
			end

			local var_133_32 = 0.0166666666666667
			local var_133_33 = 4
			local var_133_34 = manager.audio:GetVoiceLength("story_v_out_417221", "417221031", "story_v_out_417221.awb") / 1000

			if var_133_34 > 0 and var_133_33 < var_133_34 and var_133_34 + var_133_32 > arg_130_1.duration_ then
				local var_133_35 = var_133_34

				arg_130_1.duration_ = var_133_34 + var_133_32
			end

			if var_133_32 < arg_130_1.time_ and arg_130_1.time_ <= var_133_32 + arg_133_0 then
				local var_133_36 = "play"
				local var_133_37 = "voice"

				arg_130_1:AudioAction(var_133_36, var_133_37, "story_v_out_417221", "417221031", "story_v_out_417221.awb")
			end
		end
	end,
	Play417221032 = function(arg_134_0, arg_134_1)
		arg_134_1.time_ = 0
		arg_134_1.frameCnt_ = 0
		arg_134_1.state_ = "playing"
		arg_134_1.curTalkId_ = 417221032
		arg_134_1.duration_ = 4.15

		SetActive(arg_134_1.tipsGo_, false)

		function arg_134_1.onSingleLineFinish_()
			arg_134_1.onSingleLineUpdate_ = nil
			arg_134_1.onSingleLineFinish_ = nil
			arg_134_1.state_ = "waiting"
		end

		function arg_134_1.playNext_(arg_136_0)
			if arg_136_0 == 1 then
				arg_134_0:Play417221033(arg_134_1)
			end
		end

		function arg_134_1.onSingleLineUpdate_(arg_137_0)
			local var_137_0 = 0

			if var_137_0 < arg_134_1.time_ and arg_134_1.time_ <= var_137_0 + arg_137_0 then
				arg_134_1.fswbg_:SetActive(true)
				arg_134_1.dialog_:SetActive(false)

				arg_134_1.fswtw_.percent = 0

				local var_137_1 = arg_134_1:GetWordFromCfg(417221032)
				local var_137_2 = arg_134_1:FormatText(var_137_1.content)

				arg_134_1.fswt_.text = var_137_2

				LuaForUtil.ClearLinePrefixSymbol(arg_134_1.fswt_)

				arg_134_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_134_1.fswtw_:SetDirty()

				arg_134_1.typewritterCharCountI18N = 0

				arg_134_1:ShowNextGo(false)
			end

			local var_137_3 = 0.0166666666666667

			if var_137_3 < arg_134_1.time_ and arg_134_1.time_ <= var_137_3 + arg_137_0 then
				arg_134_1.var_.oldValueTypewriter = arg_134_1.fswtw_.percent

				arg_134_1:ShowNextGo(false)
			end

			local var_137_4 = 26
			local var_137_5 = 1.73333333333333
			local var_137_6 = arg_134_1:GetWordFromCfg(417221032)
			local var_137_7 = arg_134_1:FormatText(var_137_6.content)
			local var_137_8, var_137_9 = arg_134_1:GetPercentByPara(var_137_7, 1)

			if var_137_3 < arg_134_1.time_ and arg_134_1.time_ <= var_137_3 + arg_137_0 then
				arg_134_1.talkMaxDuration = 0

				local var_137_10 = var_137_4 <= 0 and var_137_5 or var_137_5 * ((var_137_9 - arg_134_1.typewritterCharCountI18N) / var_137_4)

				if var_137_10 > 0 and var_137_5 < var_137_10 then
					arg_134_1.talkMaxDuration = var_137_10

					if var_137_10 + var_137_3 > arg_134_1.duration_ then
						arg_134_1.duration_ = var_137_10 + var_137_3
					end
				end
			end

			local var_137_11 = 1.73333333333333
			local var_137_12 = math.max(var_137_11, arg_134_1.talkMaxDuration)

			if var_137_3 <= arg_134_1.time_ and arg_134_1.time_ < var_137_3 + var_137_12 then
				local var_137_13 = (arg_134_1.time_ - var_137_3) / var_137_12

				arg_134_1.fswtw_.percent = Mathf.Lerp(arg_134_1.var_.oldValueTypewriter, var_137_8, var_137_13)
				arg_134_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_134_1.fswtw_:SetDirty()
			end

			if arg_134_1.time_ >= var_137_3 + var_137_12 and arg_134_1.time_ < var_137_3 + var_137_12 + arg_137_0 then
				arg_134_1.fswtw_.percent = var_137_8

				arg_134_1.fswtw_:SetDirty()
				arg_134_1:ShowNextGo(true)

				arg_134_1.typewritterCharCountI18N = var_137_9
			end

			local var_137_14 = 0

			if var_137_14 < arg_134_1.time_ and arg_134_1.time_ <= var_137_14 + arg_137_0 then
				local var_137_15 = arg_134_1.fswbg_.transform:Find("textbox/adapt/content") or arg_134_1.fswbg_.transform:Find("textbox/content")
				local var_137_16 = var_137_15:GetComponent("Text")
				local var_137_17 = var_137_15:GetComponent("RectTransform")

				var_137_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_137_17.offsetMin = Vector2.New(0, 0)
				var_137_17.offsetMax = Vector2.New(0, 0)
			end

			local var_137_18 = 0.0166666666666667
			local var_137_19 = 4.133
			local var_137_20 = manager.audio:GetVoiceLength("story_v_out_417221", "417221032", "") / 1000

			if var_137_20 > 0 and var_137_19 < var_137_20 and var_137_20 + var_137_18 > arg_134_1.duration_ then
				local var_137_21 = var_137_20

				arg_134_1.duration_ = var_137_20 + var_137_18
			end

			if var_137_18 < arg_134_1.time_ and arg_134_1.time_ <= var_137_18 + arg_137_0 then
				local var_137_22 = "play"
				local var_137_23 = "voice"

				arg_134_1:AudioAction(var_137_22, var_137_23, "story_v_out_417221", "417221032", "")
			end
		end
	end,
	Play417221033 = function(arg_138_0, arg_138_1)
		arg_138_1.time_ = 0
		arg_138_1.frameCnt_ = 0
		arg_138_1.state_ = "playing"
		arg_138_1.curTalkId_ = 417221033
		arg_138_1.duration_ = 2.42

		SetActive(arg_138_1.tipsGo_, false)

		function arg_138_1.onSingleLineFinish_()
			arg_138_1.onSingleLineUpdate_ = nil
			arg_138_1.onSingleLineFinish_ = nil
			arg_138_1.state_ = "waiting"
		end

		function arg_138_1.playNext_(arg_140_0)
			if arg_140_0 == 1 then
				arg_138_0:Play417221034(arg_138_1)
			end
		end

		function arg_138_1.onSingleLineUpdate_(arg_141_0)
			local var_141_0 = 0

			if var_141_0 < arg_138_1.time_ and arg_138_1.time_ <= var_141_0 + arg_141_0 then
				arg_138_1.fswbg_:SetActive(true)
				arg_138_1.dialog_:SetActive(false)

				arg_138_1.fswtw_.percent = 0

				local var_141_1 = arg_138_1:GetWordFromCfg(417221033)
				local var_141_2 = arg_138_1:FormatText(var_141_1.content)

				arg_138_1.fswt_.text = var_141_2

				LuaForUtil.ClearLinePrefixSymbol(arg_138_1.fswt_)

				arg_138_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_138_1.fswtw_:SetDirty()

				arg_138_1.typewritterCharCountI18N = 0

				arg_138_1:ShowNextGo(false)
			end

			local var_141_3 = 0.0166666666666667

			if var_141_3 < arg_138_1.time_ and arg_138_1.time_ <= var_141_3 + arg_141_0 then
				arg_138_1.var_.oldValueTypewriter = arg_138_1.fswtw_.percent

				arg_138_1:ShowNextGo(false)
			end

			local var_141_4 = 15
			local var_141_5 = 1
			local var_141_6 = arg_138_1:GetWordFromCfg(417221033)
			local var_141_7 = arg_138_1:FormatText(var_141_6.content)
			local var_141_8, var_141_9 = arg_138_1:GetPercentByPara(var_141_7, 1)

			if var_141_3 < arg_138_1.time_ and arg_138_1.time_ <= var_141_3 + arg_141_0 then
				arg_138_1.talkMaxDuration = 0

				local var_141_10 = var_141_4 <= 0 and var_141_5 or var_141_5 * ((var_141_9 - arg_138_1.typewritterCharCountI18N) / var_141_4)

				if var_141_10 > 0 and var_141_5 < var_141_10 then
					arg_138_1.talkMaxDuration = var_141_10

					if var_141_10 + var_141_3 > arg_138_1.duration_ then
						arg_138_1.duration_ = var_141_10 + var_141_3
					end
				end
			end

			local var_141_11 = 1
			local var_141_12 = math.max(var_141_11, arg_138_1.talkMaxDuration)

			if var_141_3 <= arg_138_1.time_ and arg_138_1.time_ < var_141_3 + var_141_12 then
				local var_141_13 = (arg_138_1.time_ - var_141_3) / var_141_12

				arg_138_1.fswtw_.percent = Mathf.Lerp(arg_138_1.var_.oldValueTypewriter, var_141_8, var_141_13)
				arg_138_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_138_1.fswtw_:SetDirty()
			end

			if arg_138_1.time_ >= var_141_3 + var_141_12 and arg_138_1.time_ < var_141_3 + var_141_12 + arg_141_0 then
				arg_138_1.fswtw_.percent = var_141_8

				arg_138_1.fswtw_:SetDirty()
				arg_138_1:ShowNextGo(true)

				arg_138_1.typewritterCharCountI18N = var_141_9
			end

			local var_141_14 = 0

			if var_141_14 < arg_138_1.time_ and arg_138_1.time_ <= var_141_14 + arg_141_0 then
				local var_141_15 = arg_138_1.fswbg_.transform:Find("textbox/adapt/content") or arg_138_1.fswbg_.transform:Find("textbox/content")
				local var_141_16 = var_141_15:GetComponent("Text")
				local var_141_17 = var_141_15:GetComponent("RectTransform")

				var_141_16.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_141_17.offsetMin = Vector2.New(0, 0)
				var_141_17.offsetMax = Vector2.New(0, 0)
			end

			local var_141_18 = 0.0166666666666667
			local var_141_19 = 2.4
			local var_141_20 = manager.audio:GetVoiceLength("story_v_out_417221", "417221033", "") / 1000

			if var_141_20 > 0 and var_141_19 < var_141_20 and var_141_20 + var_141_18 > arg_138_1.duration_ then
				local var_141_21 = var_141_20

				arg_138_1.duration_ = var_141_20 + var_141_18
			end

			if var_141_18 < arg_138_1.time_ and arg_138_1.time_ <= var_141_18 + arg_141_0 then
				local var_141_22 = "play"
				local var_141_23 = "voice"

				arg_138_1:AudioAction(var_141_22, var_141_23, "story_v_out_417221", "417221033", "")
			end
		end
	end,
	Play417221034 = function(arg_142_0, arg_142_1)
		arg_142_1.time_ = 0
		arg_142_1.frameCnt_ = 0
		arg_142_1.state_ = "playing"
		arg_142_1.curTalkId_ = 417221034
		arg_142_1.duration_ = 3.37

		SetActive(arg_142_1.tipsGo_, false)

		function arg_142_1.onSingleLineFinish_()
			arg_142_1.onSingleLineUpdate_ = nil
			arg_142_1.onSingleLineFinish_ = nil
			arg_142_1.state_ = "waiting"
		end

		function arg_142_1.playNext_(arg_144_0)
			if arg_144_0 == 1 then
				arg_142_0:Play417221035(arg_142_1)
			end
		end

		function arg_142_1.onSingleLineUpdate_(arg_145_0)
			local var_145_0 = arg_142_1.actors_["1034"]
			local var_145_1 = 0

			if var_145_1 < arg_142_1.time_ and arg_142_1.time_ <= var_145_1 + arg_145_0 and not isNil(var_145_0) and arg_142_1.var_.actorSpriteComps1034 == nil then
				arg_142_1.var_.actorSpriteComps1034 = var_145_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_145_2 = 0.2

			if var_145_1 <= arg_142_1.time_ and arg_142_1.time_ < var_145_1 + var_145_2 and not isNil(var_145_0) then
				local var_145_3 = (arg_142_1.time_ - var_145_1) / var_145_2

				if arg_142_1.var_.actorSpriteComps1034 then
					for iter_145_0, iter_145_1 in pairs(arg_142_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_145_1 then
							if arg_142_1.isInRecall_ then
								local var_145_4 = Mathf.Lerp(iter_145_1.color.r, arg_142_1.hightColor1.r, var_145_3)
								local var_145_5 = Mathf.Lerp(iter_145_1.color.g, arg_142_1.hightColor1.g, var_145_3)
								local var_145_6 = Mathf.Lerp(iter_145_1.color.b, arg_142_1.hightColor1.b, var_145_3)

								iter_145_1.color = Color.New(var_145_4, var_145_5, var_145_6)
							else
								local var_145_7 = Mathf.Lerp(iter_145_1.color.r, 1, var_145_3)

								iter_145_1.color = Color.New(var_145_7, var_145_7, var_145_7)
							end
						end
					end
				end
			end

			if arg_142_1.time_ >= var_145_1 + var_145_2 and arg_142_1.time_ < var_145_1 + var_145_2 + arg_145_0 and not isNil(var_145_0) and arg_142_1.var_.actorSpriteComps1034 then
				for iter_145_2, iter_145_3 in pairs(arg_142_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_145_3 then
						if arg_142_1.isInRecall_ then
							iter_145_3.color = arg_142_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_145_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_142_1.var_.actorSpriteComps1034 = nil
			end

			local var_145_8 = arg_142_1.actors_["1034"].transform
			local var_145_9 = 0

			if var_145_9 < arg_142_1.time_ and arg_142_1.time_ <= var_145_9 + arg_145_0 then
				arg_142_1.var_.moveOldPos1034 = var_145_8.localPosition
				var_145_8.localScale = Vector3.New(1, 1, 1)

				arg_142_1:CheckSpriteTmpPos("1034", 3)

				local var_145_10 = var_145_8.childCount

				for iter_145_4 = 0, var_145_10 - 1 do
					local var_145_11 = var_145_8:GetChild(iter_145_4)

					if var_145_11.name == "split_6" or not string.find(var_145_11.name, "split") then
						var_145_11.gameObject:SetActive(true)
					else
						var_145_11.gameObject:SetActive(false)
					end
				end
			end

			local var_145_12 = 0.001

			if var_145_9 <= arg_142_1.time_ and arg_142_1.time_ < var_145_9 + var_145_12 then
				local var_145_13 = (arg_142_1.time_ - var_145_9) / var_145_12
				local var_145_14 = Vector3.New(0, -331.9, -324)

				var_145_8.localPosition = Vector3.Lerp(arg_142_1.var_.moveOldPos1034, var_145_14, var_145_13)
			end

			if arg_142_1.time_ >= var_145_9 + var_145_12 and arg_142_1.time_ < var_145_9 + var_145_12 + arg_145_0 then
				var_145_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_145_15 = 0

			if var_145_15 < arg_142_1.time_ and arg_142_1.time_ <= var_145_15 + arg_145_0 then
				arg_142_1.fswbg_:SetActive(false)
				arg_142_1.dialog_:SetActive(false)
				arg_142_1:ShowNextGo(false)
			end

			local var_145_16
			local var_145_17 = 0

			if var_145_17 < arg_142_1.time_ and arg_142_1.time_ <= var_145_17 + arg_145_0 then
				local var_145_18 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_145_18 then
					var_145_18.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_145_18.radialBlurScale = 0
					var_145_18.radialBlurGradient = 0
					var_145_18.radialBlurIntensity = 0

					if var_145_16 then
						var_145_18.radialBlurTarget = var_145_16.transform
					end
				end
			end

			local var_145_19 = 0.2

			if var_145_17 <= arg_142_1.time_ and arg_142_1.time_ < var_145_17 + var_145_19 then
				local var_145_20 = (arg_142_1.time_ - var_145_17) / var_145_19
				local var_145_21 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_145_21 then
					var_145_21.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_145_21.radialBlurScale = Mathf.Lerp(0, 0, var_145_20)
					var_145_21.radialBlurGradient = Mathf.Lerp(0, 0, var_145_20)
					var_145_21.radialBlurIntensity = Mathf.Lerp(0, 0, var_145_20)
				end
			end

			if arg_142_1.time_ >= var_145_17 + var_145_19 and arg_142_1.time_ < var_145_17 + var_145_19 + arg_145_0 then
				local var_145_22 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_145_22 then
					var_145_22.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_145_22.radialBlurScale = 0
					var_145_22.radialBlurGradient = 0
					var_145_22.radialBlurIntensity = 0
				end
			end

			local var_145_23 = 0
			local var_145_24 = 0.375

			if var_145_23 < arg_142_1.time_ and arg_142_1.time_ <= var_145_23 + arg_145_0 then
				arg_142_1.talkMaxDuration = 0
				arg_142_1.dialogCg_.alpha = 1

				arg_142_1.dialog_:SetActive(true)
				SetActive(arg_142_1.leftNameGo_, true)

				local var_145_25 = arg_142_1:FormatText(StoryNameCfg[1109].name)

				arg_142_1.leftNameTxt_.text = var_145_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_142_1.leftNameTxt_.transform)

				arg_142_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_142_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_142_1:RecordName(arg_142_1.leftNameTxt_.text)
				SetActive(arg_142_1.iconTrs_.gameObject, false)
				arg_142_1.callingController_:SetSelectedState("normal")

				local var_145_26 = arg_142_1:GetWordFromCfg(417221034)
				local var_145_27 = arg_142_1:FormatText(var_145_26.content)

				arg_142_1.text_.text = var_145_27

				LuaForUtil.ClearLinePrefixSymbol(arg_142_1.text_)

				local var_145_28 = 15
				local var_145_29 = utf8.len(var_145_27)
				local var_145_30 = var_145_28 <= 0 and var_145_24 or var_145_24 * (var_145_29 / var_145_28)

				if var_145_30 > 0 and var_145_24 < var_145_30 then
					arg_142_1.talkMaxDuration = var_145_30

					if var_145_30 + var_145_23 > arg_142_1.duration_ then
						arg_142_1.duration_ = var_145_30 + var_145_23
					end
				end

				arg_142_1.text_.text = var_145_27
				arg_142_1.typewritter.percent = 0

				arg_142_1.typewritter:SetDirty()
				arg_142_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221034", "story_v_out_417221.awb") ~= 0 then
					local var_145_31 = manager.audio:GetVoiceLength("story_v_out_417221", "417221034", "story_v_out_417221.awb") / 1000

					if var_145_31 + var_145_23 > arg_142_1.duration_ then
						arg_142_1.duration_ = var_145_31 + var_145_23
					end

					if var_145_26.prefab_name ~= "" and arg_142_1.actors_[var_145_26.prefab_name] ~= nil then
						local var_145_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_142_1.actors_[var_145_26.prefab_name].transform, "story_v_out_417221", "417221034", "story_v_out_417221.awb")

						arg_142_1:RecordAudio("417221034", var_145_32)
						arg_142_1:RecordAudio("417221034", var_145_32)
					else
						arg_142_1:AudioAction("play", "voice", "story_v_out_417221", "417221034", "story_v_out_417221.awb")
					end

					arg_142_1:RecordHistoryTalkVoice("story_v_out_417221", "417221034", "story_v_out_417221.awb")
				end

				arg_142_1:RecordContent(arg_142_1.text_.text)
			end

			local var_145_33 = math.max(var_145_24, arg_142_1.talkMaxDuration)

			if var_145_23 <= arg_142_1.time_ and arg_142_1.time_ < var_145_23 + var_145_33 then
				arg_142_1.typewritter.percent = (arg_142_1.time_ - var_145_23) / var_145_33

				arg_142_1.typewritter:SetDirty()
			end

			if arg_142_1.time_ >= var_145_23 + var_145_33 and arg_142_1.time_ < var_145_23 + var_145_33 + arg_145_0 then
				arg_142_1.typewritter.percent = 1

				arg_142_1.typewritter:SetDirty()
				arg_142_1:ShowNextGo(true)
			end
		end
	end,
	Play417221035 = function(arg_146_0, arg_146_1)
		arg_146_1.time_ = 0
		arg_146_1.frameCnt_ = 0
		arg_146_1.state_ = "playing"
		arg_146_1.curTalkId_ = 417221035
		arg_146_1.duration_ = 5

		SetActive(arg_146_1.tipsGo_, false)

		function arg_146_1.onSingleLineFinish_()
			arg_146_1.onSingleLineUpdate_ = nil
			arg_146_1.onSingleLineFinish_ = nil
			arg_146_1.state_ = "waiting"
		end

		function arg_146_1.playNext_(arg_148_0)
			if arg_148_0 == 1 then
				arg_146_0:Play417221036(arg_146_1)
			end
		end

		function arg_146_1.onSingleLineUpdate_(arg_149_0)
			local var_149_0 = arg_146_1.actors_["1034"]
			local var_149_1 = 0

			if var_149_1 < arg_146_1.time_ and arg_146_1.time_ <= var_149_1 + arg_149_0 and not isNil(var_149_0) and arg_146_1.var_.actorSpriteComps1034 == nil then
				arg_146_1.var_.actorSpriteComps1034 = var_149_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_149_2 = 0.2

			if var_149_1 <= arg_146_1.time_ and arg_146_1.time_ < var_149_1 + var_149_2 and not isNil(var_149_0) then
				local var_149_3 = (arg_146_1.time_ - var_149_1) / var_149_2

				if arg_146_1.var_.actorSpriteComps1034 then
					for iter_149_0, iter_149_1 in pairs(arg_146_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_149_1 then
							if arg_146_1.isInRecall_ then
								local var_149_4 = Mathf.Lerp(iter_149_1.color.r, arg_146_1.hightColor2.r, var_149_3)
								local var_149_5 = Mathf.Lerp(iter_149_1.color.g, arg_146_1.hightColor2.g, var_149_3)
								local var_149_6 = Mathf.Lerp(iter_149_1.color.b, arg_146_1.hightColor2.b, var_149_3)

								iter_149_1.color = Color.New(var_149_4, var_149_5, var_149_6)
							else
								local var_149_7 = Mathf.Lerp(iter_149_1.color.r, 0.5, var_149_3)

								iter_149_1.color = Color.New(var_149_7, var_149_7, var_149_7)
							end
						end
					end
				end
			end

			if arg_146_1.time_ >= var_149_1 + var_149_2 and arg_146_1.time_ < var_149_1 + var_149_2 + arg_149_0 and not isNil(var_149_0) and arg_146_1.var_.actorSpriteComps1034 then
				for iter_149_2, iter_149_3 in pairs(arg_146_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_149_3 then
						if arg_146_1.isInRecall_ then
							iter_149_3.color = arg_146_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_149_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_146_1.var_.actorSpriteComps1034 = nil
			end

			local var_149_8 = arg_146_1.actors_["1034"].transform
			local var_149_9 = 0

			if var_149_9 < arg_146_1.time_ and arg_146_1.time_ <= var_149_9 + arg_149_0 then
				arg_146_1.var_.moveOldPos1034 = var_149_8.localPosition
				var_149_8.localScale = Vector3.New(1, 1, 1)

				arg_146_1:CheckSpriteTmpPos("1034", 7)

				local var_149_10 = var_149_8.childCount

				for iter_149_4 = 0, var_149_10 - 1 do
					local var_149_11 = var_149_8:GetChild(iter_149_4)

					if var_149_11.name == "" or not string.find(var_149_11.name, "split") then
						var_149_11.gameObject:SetActive(true)
					else
						var_149_11.gameObject:SetActive(false)
					end
				end
			end

			local var_149_12 = 0.001

			if var_149_9 <= arg_146_1.time_ and arg_146_1.time_ < var_149_9 + var_149_12 then
				local var_149_13 = (arg_146_1.time_ - var_149_9) / var_149_12
				local var_149_14 = Vector3.New(0, -2000, 0)

				var_149_8.localPosition = Vector3.Lerp(arg_146_1.var_.moveOldPos1034, var_149_14, var_149_13)
			end

			if arg_146_1.time_ >= var_149_9 + var_149_12 and arg_146_1.time_ < var_149_9 + var_149_12 + arg_149_0 then
				var_149_8.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_149_15 = 0.5
			local var_149_16 = 1

			if var_149_15 < arg_146_1.time_ and arg_146_1.time_ <= var_149_15 + arg_149_0 then
				local var_149_17 = "play"
				local var_149_18 = "effect"

				arg_146_1:AudioAction(var_149_17, var_149_18, "se_story_1310", "se_story_1310_uiout", "")
			end

			local var_149_19 = 0
			local var_149_20 = 1.25

			if var_149_19 < arg_146_1.time_ and arg_146_1.time_ <= var_149_19 + arg_149_0 then
				arg_146_1.talkMaxDuration = 0
				arg_146_1.dialogCg_.alpha = 1

				arg_146_1.dialog_:SetActive(true)
				SetActive(arg_146_1.leftNameGo_, false)

				arg_146_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_146_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_146_1:RecordName(arg_146_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_146_1.iconTrs_.gameObject, false)
				arg_146_1.callingController_:SetSelectedState("normal")

				local var_149_21 = arg_146_1:GetWordFromCfg(417221035)
				local var_149_22 = arg_146_1:FormatText(var_149_21.content)

				arg_146_1.text_.text = var_149_22

				LuaForUtil.ClearLinePrefixSymbol(arg_146_1.text_)

				local var_149_23 = 50
				local var_149_24 = utf8.len(var_149_22)
				local var_149_25 = var_149_23 <= 0 and var_149_20 or var_149_20 * (var_149_24 / var_149_23)

				if var_149_25 > 0 and var_149_20 < var_149_25 then
					arg_146_1.talkMaxDuration = var_149_25

					if var_149_25 + var_149_19 > arg_146_1.duration_ then
						arg_146_1.duration_ = var_149_25 + var_149_19
					end
				end

				arg_146_1.text_.text = var_149_22
				arg_146_1.typewritter.percent = 0

				arg_146_1.typewritter:SetDirty()
				arg_146_1:ShowNextGo(false)
				arg_146_1:RecordContent(arg_146_1.text_.text)
			end

			local var_149_26 = math.max(var_149_20, arg_146_1.talkMaxDuration)

			if var_149_19 <= arg_146_1.time_ and arg_146_1.time_ < var_149_19 + var_149_26 then
				arg_146_1.typewritter.percent = (arg_146_1.time_ - var_149_19) / var_149_26

				arg_146_1.typewritter:SetDirty()
			end

			if arg_146_1.time_ >= var_149_19 + var_149_26 and arg_146_1.time_ < var_149_19 + var_149_26 + arg_149_0 then
				arg_146_1.typewritter.percent = 1

				arg_146_1.typewritter:SetDirty()
				arg_146_1:ShowNextGo(true)
			end
		end
	end,
	Play417221036 = function(arg_150_0, arg_150_1)
		arg_150_1.time_ = 0
		arg_150_1.frameCnt_ = 0
		arg_150_1.state_ = "playing"
		arg_150_1.curTalkId_ = 417221036
		arg_150_1.duration_ = 7.4

		SetActive(arg_150_1.tipsGo_, false)

		function arg_150_1.onSingleLineFinish_()
			arg_150_1.onSingleLineUpdate_ = nil
			arg_150_1.onSingleLineFinish_ = nil
			arg_150_1.state_ = "waiting"
		end

		function arg_150_1.playNext_(arg_152_0)
			if arg_152_0 == 1 then
				arg_150_0:Play417221037(arg_150_1)
			end
		end

		function arg_150_1.onSingleLineUpdate_(arg_153_0)
			local var_153_0 = "I05e"

			if arg_150_1.bgs_[var_153_0] == nil then
				local var_153_1 = Object.Instantiate(arg_150_1.paintGo_)

				var_153_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_153_0)
				var_153_1.name = var_153_0
				var_153_1.transform.parent = arg_150_1.stage_.transform
				var_153_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_150_1.bgs_[var_153_0] = var_153_1
			end

			local var_153_2 = 1

			if var_153_2 < arg_150_1.time_ and arg_150_1.time_ <= var_153_2 + arg_153_0 then
				local var_153_3 = manager.ui.mainCamera.transform.localPosition
				local var_153_4 = Vector3.New(0, 0, 10) + Vector3.New(var_153_3.x, var_153_3.y, 0)
				local var_153_5 = arg_150_1.bgs_.I05e

				var_153_5.transform.localPosition = var_153_4
				var_153_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_153_6 = var_153_5:GetComponent("SpriteRenderer")

				if var_153_6 and var_153_6.sprite then
					local var_153_7 = (var_153_5.transform.localPosition - var_153_3).z
					local var_153_8 = manager.ui.mainCameraCom_
					local var_153_9 = 2 * var_153_7 * Mathf.Tan(var_153_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_153_10 = var_153_9 * var_153_8.aspect
					local var_153_11 = var_153_6.sprite.bounds.size.x
					local var_153_12 = var_153_6.sprite.bounds.size.y
					local var_153_13 = var_153_10 / var_153_11
					local var_153_14 = var_153_9 / var_153_12
					local var_153_15 = var_153_14 < var_153_13 and var_153_13 or var_153_14

					var_153_5.transform.localScale = Vector3.New(var_153_15, var_153_15, 0)
				end

				for iter_153_0, iter_153_1 in pairs(arg_150_1.bgs_) do
					if iter_153_0 ~= "I05e" then
						iter_153_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_153_16 = 2

			if var_153_16 < arg_150_1.time_ and arg_150_1.time_ <= var_153_16 + arg_153_0 then
				arg_150_1.allBtn_.enabled = false
			end

			local var_153_17 = 0.3

			if arg_150_1.time_ >= var_153_16 + var_153_17 and arg_150_1.time_ < var_153_16 + var_153_17 + arg_153_0 then
				arg_150_1.allBtn_.enabled = true
			end

			local var_153_18 = 0

			if var_153_18 < arg_150_1.time_ and arg_150_1.time_ <= var_153_18 + arg_153_0 then
				arg_150_1.mask_.enabled = true
				arg_150_1.mask_.raycastTarget = true

				arg_150_1:SetGaussion(false)
			end

			local var_153_19 = 1

			if var_153_18 <= arg_150_1.time_ and arg_150_1.time_ < var_153_18 + var_153_19 then
				local var_153_20 = (arg_150_1.time_ - var_153_18) / var_153_19
				local var_153_21 = Color.New(0, 0, 0)

				var_153_21.a = Mathf.Lerp(0, 1, var_153_20)
				arg_150_1.mask_.color = var_153_21
			end

			if arg_150_1.time_ >= var_153_18 + var_153_19 and arg_150_1.time_ < var_153_18 + var_153_19 + arg_153_0 then
				local var_153_22 = Color.New(0, 0, 0)

				var_153_22.a = 1
				arg_150_1.mask_.color = var_153_22
			end

			local var_153_23 = 1

			if var_153_23 < arg_150_1.time_ and arg_150_1.time_ <= var_153_23 + arg_153_0 then
				arg_150_1.mask_.enabled = true
				arg_150_1.mask_.raycastTarget = true

				arg_150_1:SetGaussion(false)
			end

			local var_153_24 = 1

			if var_153_23 <= arg_150_1.time_ and arg_150_1.time_ < var_153_23 + var_153_24 then
				local var_153_25 = (arg_150_1.time_ - var_153_23) / var_153_24
				local var_153_26 = Color.New(0, 0, 0)

				var_153_26.a = Mathf.Lerp(1, 0, var_153_25)
				arg_150_1.mask_.color = var_153_26
			end

			if arg_150_1.time_ >= var_153_23 + var_153_24 and arg_150_1.time_ < var_153_23 + var_153_24 + arg_153_0 then
				local var_153_27 = Color.New(0, 0, 0)
				local var_153_28 = 0

				arg_150_1.mask_.enabled = false
				var_153_27.a = var_153_28
				arg_150_1.mask_.color = var_153_27
			end

			local var_153_29 = "1060"

			if arg_150_1.actors_[var_153_29] == nil then
				local var_153_30 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1060")

				if not isNil(var_153_30) then
					local var_153_31 = Object.Instantiate(var_153_30, arg_150_1.canvasGo_.transform)

					var_153_31.transform:SetSiblingIndex(1)

					var_153_31.name = var_153_29
					var_153_31.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_150_1.actors_[var_153_29] = var_153_31

					local var_153_32 = var_153_31:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_150_1.isInRecall_ then
						for iter_153_2, iter_153_3 in ipairs(var_153_32) do
							iter_153_3.color = arg_150_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_153_33 = arg_150_1.actors_["1060"]
			local var_153_34 = 1.76666666666667

			if var_153_34 < arg_150_1.time_ and arg_150_1.time_ <= var_153_34 + arg_153_0 and not isNil(var_153_33) and arg_150_1.var_.actorSpriteComps1060 == nil then
				arg_150_1.var_.actorSpriteComps1060 = var_153_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_153_35 = 0.2

			if var_153_34 <= arg_150_1.time_ and arg_150_1.time_ < var_153_34 + var_153_35 and not isNil(var_153_33) then
				local var_153_36 = (arg_150_1.time_ - var_153_34) / var_153_35

				if arg_150_1.var_.actorSpriteComps1060 then
					for iter_153_4, iter_153_5 in pairs(arg_150_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_153_5 then
							if arg_150_1.isInRecall_ then
								local var_153_37 = Mathf.Lerp(iter_153_5.color.r, arg_150_1.hightColor1.r, var_153_36)
								local var_153_38 = Mathf.Lerp(iter_153_5.color.g, arg_150_1.hightColor1.g, var_153_36)
								local var_153_39 = Mathf.Lerp(iter_153_5.color.b, arg_150_1.hightColor1.b, var_153_36)

								iter_153_5.color = Color.New(var_153_37, var_153_38, var_153_39)
							else
								local var_153_40 = Mathf.Lerp(iter_153_5.color.r, 1, var_153_36)

								iter_153_5.color = Color.New(var_153_40, var_153_40, var_153_40)
							end
						end
					end
				end
			end

			if arg_150_1.time_ >= var_153_34 + var_153_35 and arg_150_1.time_ < var_153_34 + var_153_35 + arg_153_0 and not isNil(var_153_33) and arg_150_1.var_.actorSpriteComps1060 then
				for iter_153_6, iter_153_7 in pairs(arg_150_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_153_7 then
						if arg_150_1.isInRecall_ then
							iter_153_7.color = arg_150_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_153_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_150_1.var_.actorSpriteComps1060 = nil
			end

			local var_153_41 = arg_150_1.actors_["1060"].transform
			local var_153_42 = 1.76666666666667

			if var_153_42 < arg_150_1.time_ and arg_150_1.time_ <= var_153_42 + arg_153_0 then
				arg_150_1.var_.moveOldPos1060 = var_153_41.localPosition
				var_153_41.localScale = Vector3.New(1, 1, 1)

				arg_150_1:CheckSpriteTmpPos("1060", 3)

				local var_153_43 = var_153_41.childCount

				for iter_153_8 = 0, var_153_43 - 1 do
					local var_153_44 = var_153_41:GetChild(iter_153_8)

					if var_153_44.name == "" or not string.find(var_153_44.name, "split") then
						var_153_44.gameObject:SetActive(true)
					else
						var_153_44.gameObject:SetActive(false)
					end
				end
			end

			local var_153_45 = 0.001

			if var_153_42 <= arg_150_1.time_ and arg_150_1.time_ < var_153_42 + var_153_45 then
				local var_153_46 = (arg_150_1.time_ - var_153_42) / var_153_45
				local var_153_47 = Vector3.New(33.4, -430.8, 6.9)

				var_153_41.localPosition = Vector3.Lerp(arg_150_1.var_.moveOldPos1060, var_153_47, var_153_46)
			end

			if arg_150_1.time_ >= var_153_42 + var_153_45 and arg_150_1.time_ < var_153_42 + var_153_45 + arg_153_0 then
				var_153_41.localPosition = Vector3.New(33.4, -430.8, 6.9)
			end

			local var_153_48 = arg_150_1.actors_["1060"]
			local var_153_49 = 1.76666666666667

			if var_153_49 < arg_150_1.time_ and arg_150_1.time_ <= var_153_49 + arg_153_0 then
				local var_153_50 = var_153_48:GetComponentInChildren(typeof(CanvasGroup))

				if var_153_50 then
					arg_150_1.var_.alphaOldValue1060 = var_153_50.alpha
					arg_150_1.var_.characterEffect1060 = var_153_50
				end

				arg_150_1.var_.alphaOldValue1060 = 0
			end

			local var_153_51 = 0.233333333333333

			if var_153_49 <= arg_150_1.time_ and arg_150_1.time_ < var_153_49 + var_153_51 then
				local var_153_52 = (arg_150_1.time_ - var_153_49) / var_153_51
				local var_153_53 = Mathf.Lerp(arg_150_1.var_.alphaOldValue1060, 1, var_153_52)

				if arg_150_1.var_.characterEffect1060 then
					arg_150_1.var_.characterEffect1060.alpha = var_153_53
				end
			end

			if arg_150_1.time_ >= var_153_49 + var_153_51 and arg_150_1.time_ < var_153_49 + var_153_51 + arg_153_0 and arg_150_1.var_.characterEffect1060 then
				arg_150_1.var_.characterEffect1060.alpha = 1
			end

			if arg_150_1.frameCnt_ <= 1 then
				arg_150_1.dialog_:SetActive(false)
			end

			local var_153_54 = 2
			local var_153_55 = 0.8

			if var_153_54 < arg_150_1.time_ and arg_150_1.time_ <= var_153_54 + arg_153_0 then
				arg_150_1.talkMaxDuration = 0

				arg_150_1.dialog_:SetActive(true)

				local var_153_56 = LeanTween.value(arg_150_1.dialog_, 0, 1, 0.3)

				var_153_56:setOnUpdate(LuaHelper.FloatAction(function(arg_154_0)
					arg_150_1.dialogCg_.alpha = arg_154_0
				end))
				var_153_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_150_1.dialog_)
					var_153_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_150_1.duration_ = arg_150_1.duration_ + 0.3

				SetActive(arg_150_1.leftNameGo_, true)

				local var_153_57 = arg_150_1:FormatText(StoryNameCfg[584].name)

				arg_150_1.leftNameTxt_.text = var_153_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_150_1.leftNameTxt_.transform)

				arg_150_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_150_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_150_1:RecordName(arg_150_1.leftNameTxt_.text)
				SetActive(arg_150_1.iconTrs_.gameObject, false)
				arg_150_1.callingController_:SetSelectedState("normal")

				local var_153_58 = arg_150_1:GetWordFromCfg(417221036)
				local var_153_59 = arg_150_1:FormatText(var_153_58.content)

				arg_150_1.text_.text = var_153_59

				LuaForUtil.ClearLinePrefixSymbol(arg_150_1.text_)

				local var_153_60 = 32
				local var_153_61 = utf8.len(var_153_59)
				local var_153_62 = var_153_60 <= 0 and var_153_55 or var_153_55 * (var_153_61 / var_153_60)

				if var_153_62 > 0 and var_153_55 < var_153_62 then
					arg_150_1.talkMaxDuration = var_153_62
					var_153_54 = var_153_54 + 0.3

					if var_153_62 + var_153_54 > arg_150_1.duration_ then
						arg_150_1.duration_ = var_153_62 + var_153_54
					end
				end

				arg_150_1.text_.text = var_153_59
				arg_150_1.typewritter.percent = 0

				arg_150_1.typewritter:SetDirty()
				arg_150_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221036", "story_v_out_417221.awb") ~= 0 then
					local var_153_63 = manager.audio:GetVoiceLength("story_v_out_417221", "417221036", "story_v_out_417221.awb") / 1000

					if var_153_63 + var_153_54 > arg_150_1.duration_ then
						arg_150_1.duration_ = var_153_63 + var_153_54
					end

					if var_153_58.prefab_name ~= "" and arg_150_1.actors_[var_153_58.prefab_name] ~= nil then
						local var_153_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_150_1.actors_[var_153_58.prefab_name].transform, "story_v_out_417221", "417221036", "story_v_out_417221.awb")

						arg_150_1:RecordAudio("417221036", var_153_64)
						arg_150_1:RecordAudio("417221036", var_153_64)
					else
						arg_150_1:AudioAction("play", "voice", "story_v_out_417221", "417221036", "story_v_out_417221.awb")
					end

					arg_150_1:RecordHistoryTalkVoice("story_v_out_417221", "417221036", "story_v_out_417221.awb")
				end

				arg_150_1:RecordContent(arg_150_1.text_.text)
			end

			local var_153_65 = var_153_54 + 0.3
			local var_153_66 = math.max(var_153_55, arg_150_1.talkMaxDuration)

			if var_153_65 <= arg_150_1.time_ and arg_150_1.time_ < var_153_65 + var_153_66 then
				arg_150_1.typewritter.percent = (arg_150_1.time_ - var_153_65) / var_153_66

				arg_150_1.typewritter:SetDirty()
			end

			if arg_150_1.time_ >= var_153_65 + var_153_66 and arg_150_1.time_ < var_153_65 + var_153_66 + arg_153_0 then
				arg_150_1.typewritter.percent = 1

				arg_150_1.typewritter:SetDirty()
				arg_150_1:ShowNextGo(true)
			end
		end
	end,
	Play417221037 = function(arg_156_0, arg_156_1)
		arg_156_1.time_ = 0
		arg_156_1.frameCnt_ = 0
		arg_156_1.state_ = "playing"
		arg_156_1.curTalkId_ = 417221037
		arg_156_1.duration_ = 4.4

		SetActive(arg_156_1.tipsGo_, false)

		function arg_156_1.onSingleLineFinish_()
			arg_156_1.onSingleLineUpdate_ = nil
			arg_156_1.onSingleLineFinish_ = nil
			arg_156_1.state_ = "waiting"
		end

		function arg_156_1.playNext_(arg_158_0)
			if arg_158_0 == 1 then
				arg_156_0:Play417221038(arg_156_1)
			end
		end

		function arg_156_1.onSingleLineUpdate_(arg_159_0)
			local var_159_0 = arg_156_1.actors_["1034"]
			local var_159_1 = 0

			if var_159_1 < arg_156_1.time_ and arg_156_1.time_ <= var_159_1 + arg_159_0 and not isNil(var_159_0) and arg_156_1.var_.actorSpriteComps1034 == nil then
				arg_156_1.var_.actorSpriteComps1034 = var_159_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_159_2 = 0.2

			if var_159_1 <= arg_156_1.time_ and arg_156_1.time_ < var_159_1 + var_159_2 and not isNil(var_159_0) then
				local var_159_3 = (arg_156_1.time_ - var_159_1) / var_159_2

				if arg_156_1.var_.actorSpriteComps1034 then
					for iter_159_0, iter_159_1 in pairs(arg_156_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_159_1 then
							if arg_156_1.isInRecall_ then
								local var_159_4 = Mathf.Lerp(iter_159_1.color.r, arg_156_1.hightColor1.r, var_159_3)
								local var_159_5 = Mathf.Lerp(iter_159_1.color.g, arg_156_1.hightColor1.g, var_159_3)
								local var_159_6 = Mathf.Lerp(iter_159_1.color.b, arg_156_1.hightColor1.b, var_159_3)

								iter_159_1.color = Color.New(var_159_4, var_159_5, var_159_6)
							else
								local var_159_7 = Mathf.Lerp(iter_159_1.color.r, 1, var_159_3)

								iter_159_1.color = Color.New(var_159_7, var_159_7, var_159_7)
							end
						end
					end
				end
			end

			if arg_156_1.time_ >= var_159_1 + var_159_2 and arg_156_1.time_ < var_159_1 + var_159_2 + arg_159_0 and not isNil(var_159_0) and arg_156_1.var_.actorSpriteComps1034 then
				for iter_159_2, iter_159_3 in pairs(arg_156_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_159_3 then
						if arg_156_1.isInRecall_ then
							iter_159_3.color = arg_156_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_159_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_156_1.var_.actorSpriteComps1034 = nil
			end

			local var_159_8 = arg_156_1.actors_["1060"]
			local var_159_9 = 0

			if var_159_9 < arg_156_1.time_ and arg_156_1.time_ <= var_159_9 + arg_159_0 and not isNil(var_159_8) and arg_156_1.var_.actorSpriteComps1060 == nil then
				arg_156_1.var_.actorSpriteComps1060 = var_159_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_159_10 = 0.2

			if var_159_9 <= arg_156_1.time_ and arg_156_1.time_ < var_159_9 + var_159_10 and not isNil(var_159_8) then
				local var_159_11 = (arg_156_1.time_ - var_159_9) / var_159_10

				if arg_156_1.var_.actorSpriteComps1060 then
					for iter_159_4, iter_159_5 in pairs(arg_156_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_159_5 then
							if arg_156_1.isInRecall_ then
								local var_159_12 = Mathf.Lerp(iter_159_5.color.r, arg_156_1.hightColor2.r, var_159_11)
								local var_159_13 = Mathf.Lerp(iter_159_5.color.g, arg_156_1.hightColor2.g, var_159_11)
								local var_159_14 = Mathf.Lerp(iter_159_5.color.b, arg_156_1.hightColor2.b, var_159_11)

								iter_159_5.color = Color.New(var_159_12, var_159_13, var_159_14)
							else
								local var_159_15 = Mathf.Lerp(iter_159_5.color.r, 0.5, var_159_11)

								iter_159_5.color = Color.New(var_159_15, var_159_15, var_159_15)
							end
						end
					end
				end
			end

			if arg_156_1.time_ >= var_159_9 + var_159_10 and arg_156_1.time_ < var_159_9 + var_159_10 + arg_159_0 and not isNil(var_159_8) and arg_156_1.var_.actorSpriteComps1060 then
				for iter_159_6, iter_159_7 in pairs(arg_156_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_159_7 then
						if arg_156_1.isInRecall_ then
							iter_159_7.color = arg_156_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_159_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_156_1.var_.actorSpriteComps1060 = nil
			end

			local var_159_16 = arg_156_1.actors_["1060"].transform
			local var_159_17 = 0

			if var_159_17 < arg_156_1.time_ and arg_156_1.time_ <= var_159_17 + arg_159_0 then
				arg_156_1.var_.moveOldPos1060 = var_159_16.localPosition
				var_159_16.localScale = Vector3.New(1, 1, 1)

				arg_156_1:CheckSpriteTmpPos("1060", 2)

				local var_159_18 = var_159_16.childCount

				for iter_159_8 = 0, var_159_18 - 1 do
					local var_159_19 = var_159_16:GetChild(iter_159_8)

					if var_159_19.name == "" or not string.find(var_159_19.name, "split") then
						var_159_19.gameObject:SetActive(true)
					else
						var_159_19.gameObject:SetActive(false)
					end
				end
			end

			local var_159_20 = 0.001

			if var_159_17 <= arg_156_1.time_ and arg_156_1.time_ < var_159_17 + var_159_20 then
				local var_159_21 = (arg_156_1.time_ - var_159_17) / var_159_20
				local var_159_22 = Vector3.New(-440.94, -430.8, 6.9)

				var_159_16.localPosition = Vector3.Lerp(arg_156_1.var_.moveOldPos1060, var_159_22, var_159_21)
			end

			if arg_156_1.time_ >= var_159_17 + var_159_20 and arg_156_1.time_ < var_159_17 + var_159_20 + arg_159_0 then
				var_159_16.localPosition = Vector3.New(-440.94, -430.8, 6.9)
			end

			local var_159_23 = arg_156_1.actors_["1034"].transform
			local var_159_24 = 0

			if var_159_24 < arg_156_1.time_ and arg_156_1.time_ <= var_159_24 + arg_159_0 then
				arg_156_1.var_.moveOldPos1034 = var_159_23.localPosition
				var_159_23.localScale = Vector3.New(1, 1, 1)

				arg_156_1:CheckSpriteTmpPos("1034", 4)

				local var_159_25 = var_159_23.childCount

				for iter_159_9 = 0, var_159_25 - 1 do
					local var_159_26 = var_159_23:GetChild(iter_159_9)

					if var_159_26.name == "" or not string.find(var_159_26.name, "split") then
						var_159_26.gameObject:SetActive(true)
					else
						var_159_26.gameObject:SetActive(false)
					end
				end
			end

			local var_159_27 = 0.001

			if var_159_24 <= arg_156_1.time_ and arg_156_1.time_ < var_159_24 + var_159_27 then
				local var_159_28 = (arg_156_1.time_ - var_159_24) / var_159_27
				local var_159_29 = Vector3.New(373.7, -331.9, -324)

				var_159_23.localPosition = Vector3.Lerp(arg_156_1.var_.moveOldPos1034, var_159_29, var_159_28)
			end

			if arg_156_1.time_ >= var_159_24 + var_159_27 and arg_156_1.time_ < var_159_24 + var_159_27 + arg_159_0 then
				var_159_23.localPosition = Vector3.New(373.7, -331.9, -324)
			end

			local var_159_30 = 0
			local var_159_31 = 0.4

			if var_159_30 < arg_156_1.time_ and arg_156_1.time_ <= var_159_30 + arg_159_0 then
				arg_156_1.talkMaxDuration = 0
				arg_156_1.dialogCg_.alpha = 1

				arg_156_1.dialog_:SetActive(true)
				SetActive(arg_156_1.leftNameGo_, true)

				local var_159_32 = arg_156_1:FormatText(StoryNameCfg[1109].name)

				arg_156_1.leftNameTxt_.text = var_159_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_156_1.leftNameTxt_.transform)

				arg_156_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_156_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_156_1:RecordName(arg_156_1.leftNameTxt_.text)
				SetActive(arg_156_1.iconTrs_.gameObject, false)
				arg_156_1.callingController_:SetSelectedState("normal")

				local var_159_33 = arg_156_1:GetWordFromCfg(417221037)
				local var_159_34 = arg_156_1:FormatText(var_159_33.content)

				arg_156_1.text_.text = var_159_34

				LuaForUtil.ClearLinePrefixSymbol(arg_156_1.text_)

				local var_159_35 = 16
				local var_159_36 = utf8.len(var_159_34)
				local var_159_37 = var_159_35 <= 0 and var_159_31 or var_159_31 * (var_159_36 / var_159_35)

				if var_159_37 > 0 and var_159_31 < var_159_37 then
					arg_156_1.talkMaxDuration = var_159_37

					if var_159_37 + var_159_30 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_37 + var_159_30
					end
				end

				arg_156_1.text_.text = var_159_34
				arg_156_1.typewritter.percent = 0

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221037", "story_v_out_417221.awb") ~= 0 then
					local var_159_38 = manager.audio:GetVoiceLength("story_v_out_417221", "417221037", "story_v_out_417221.awb") / 1000

					if var_159_38 + var_159_30 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_38 + var_159_30
					end

					if var_159_33.prefab_name ~= "" and arg_156_1.actors_[var_159_33.prefab_name] ~= nil then
						local var_159_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_156_1.actors_[var_159_33.prefab_name].transform, "story_v_out_417221", "417221037", "story_v_out_417221.awb")

						arg_156_1:RecordAudio("417221037", var_159_39)
						arg_156_1:RecordAudio("417221037", var_159_39)
					else
						arg_156_1:AudioAction("play", "voice", "story_v_out_417221", "417221037", "story_v_out_417221.awb")
					end

					arg_156_1:RecordHistoryTalkVoice("story_v_out_417221", "417221037", "story_v_out_417221.awb")
				end

				arg_156_1:RecordContent(arg_156_1.text_.text)
			end

			local var_159_40 = math.max(var_159_31, arg_156_1.talkMaxDuration)

			if var_159_30 <= arg_156_1.time_ and arg_156_1.time_ < var_159_30 + var_159_40 then
				arg_156_1.typewritter.percent = (arg_156_1.time_ - var_159_30) / var_159_40

				arg_156_1.typewritter:SetDirty()
			end

			if arg_156_1.time_ >= var_159_30 + var_159_40 and arg_156_1.time_ < var_159_30 + var_159_40 + arg_159_0 then
				arg_156_1.typewritter.percent = 1

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(true)
			end
		end
	end,
	Play417221038 = function(arg_160_0, arg_160_1)
		arg_160_1.time_ = 0
		arg_160_1.frameCnt_ = 0
		arg_160_1.state_ = "playing"
		arg_160_1.curTalkId_ = 417221038
		arg_160_1.duration_ = 5

		SetActive(arg_160_1.tipsGo_, false)

		function arg_160_1.onSingleLineFinish_()
			arg_160_1.onSingleLineUpdate_ = nil
			arg_160_1.onSingleLineFinish_ = nil
			arg_160_1.state_ = "waiting"
		end

		function arg_160_1.playNext_(arg_162_0)
			if arg_162_0 == 1 then
				arg_160_0:Play417221039(arg_160_1)
			end
		end

		function arg_160_1.onSingleLineUpdate_(arg_163_0)
			local var_163_0 = arg_160_1.actors_["1060"].transform
			local var_163_1 = 0

			if var_163_1 < arg_160_1.time_ and arg_160_1.time_ <= var_163_1 + arg_163_0 then
				arg_160_1.var_.moveOldPos1060 = var_163_0.localPosition
				var_163_0.localScale = Vector3.New(1, 1, 1)

				arg_160_1:CheckSpriteTmpPos("1060", 7)

				local var_163_2 = var_163_0.childCount

				for iter_163_0 = 0, var_163_2 - 1 do
					local var_163_3 = var_163_0:GetChild(iter_163_0)

					if var_163_3.name == "" or not string.find(var_163_3.name, "split") then
						var_163_3.gameObject:SetActive(true)
					else
						var_163_3.gameObject:SetActive(false)
					end
				end
			end

			local var_163_4 = 0.001

			if var_163_1 <= arg_160_1.time_ and arg_160_1.time_ < var_163_1 + var_163_4 then
				local var_163_5 = (arg_160_1.time_ - var_163_1) / var_163_4
				local var_163_6 = Vector3.New(0, -2000, -40)

				var_163_0.localPosition = Vector3.Lerp(arg_160_1.var_.moveOldPos1060, var_163_6, var_163_5)
			end

			if arg_160_1.time_ >= var_163_1 + var_163_4 and arg_160_1.time_ < var_163_1 + var_163_4 + arg_163_0 then
				var_163_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_163_7 = arg_160_1.actors_["1034"].transform
			local var_163_8 = 0

			if var_163_8 < arg_160_1.time_ and arg_160_1.time_ <= var_163_8 + arg_163_0 then
				arg_160_1.var_.moveOldPos1034 = var_163_7.localPosition
				var_163_7.localScale = Vector3.New(1, 1, 1)

				arg_160_1:CheckSpriteTmpPos("1034", 7)

				local var_163_9 = var_163_7.childCount

				for iter_163_1 = 0, var_163_9 - 1 do
					local var_163_10 = var_163_7:GetChild(iter_163_1)

					if var_163_10.name == "" or not string.find(var_163_10.name, "split") then
						var_163_10.gameObject:SetActive(true)
					else
						var_163_10.gameObject:SetActive(false)
					end
				end
			end

			local var_163_11 = 0.001

			if var_163_8 <= arg_160_1.time_ and arg_160_1.time_ < var_163_8 + var_163_11 then
				local var_163_12 = (arg_160_1.time_ - var_163_8) / var_163_11
				local var_163_13 = Vector3.New(0, -2000, 0)

				var_163_7.localPosition = Vector3.Lerp(arg_160_1.var_.moveOldPos1034, var_163_13, var_163_12)
			end

			if arg_160_1.time_ >= var_163_8 + var_163_11 and arg_160_1.time_ < var_163_8 + var_163_11 + arg_163_0 then
				var_163_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_163_14 = 0.166666666666667
			local var_163_15 = 1

			if var_163_14 < arg_160_1.time_ and arg_160_1.time_ <= var_163_14 + arg_163_0 then
				local var_163_16 = "play"
				local var_163_17 = "effect"

				arg_160_1:AudioAction(var_163_16, var_163_17, "se_story_1310", "se_story_1310_tip", "")
			end

			local var_163_18 = 0
			local var_163_19 = 0.975

			if var_163_18 < arg_160_1.time_ and arg_160_1.time_ <= var_163_18 + arg_163_0 then
				arg_160_1.talkMaxDuration = 0
				arg_160_1.dialogCg_.alpha = 1

				arg_160_1.dialog_:SetActive(true)
				SetActive(arg_160_1.leftNameGo_, false)

				arg_160_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_160_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_160_1:RecordName(arg_160_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_160_1.iconTrs_.gameObject, false)
				arg_160_1.callingController_:SetSelectedState("normal")

				local var_163_20 = arg_160_1:GetWordFromCfg(417221038)
				local var_163_21 = arg_160_1:FormatText(var_163_20.content)

				arg_160_1.text_.text = var_163_21

				LuaForUtil.ClearLinePrefixSymbol(arg_160_1.text_)

				local var_163_22 = 39
				local var_163_23 = utf8.len(var_163_21)
				local var_163_24 = var_163_22 <= 0 and var_163_19 or var_163_19 * (var_163_23 / var_163_22)

				if var_163_24 > 0 and var_163_19 < var_163_24 then
					arg_160_1.talkMaxDuration = var_163_24

					if var_163_24 + var_163_18 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_24 + var_163_18
					end
				end

				arg_160_1.text_.text = var_163_21
				arg_160_1.typewritter.percent = 0

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(false)
				arg_160_1:RecordContent(arg_160_1.text_.text)
			end

			local var_163_25 = math.max(var_163_19, arg_160_1.talkMaxDuration)

			if var_163_18 <= arg_160_1.time_ and arg_160_1.time_ < var_163_18 + var_163_25 then
				arg_160_1.typewritter.percent = (arg_160_1.time_ - var_163_18) / var_163_25

				arg_160_1.typewritter:SetDirty()
			end

			if arg_160_1.time_ >= var_163_18 + var_163_25 and arg_160_1.time_ < var_163_18 + var_163_25 + arg_163_0 then
				arg_160_1.typewritter.percent = 1

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(true)
			end
		end
	end,
	Play417221039 = function(arg_164_0, arg_164_1)
		arg_164_1.time_ = 0
		arg_164_1.frameCnt_ = 0
		arg_164_1.state_ = "playing"
		arg_164_1.curTalkId_ = 417221039
		arg_164_1.duration_ = 5

		SetActive(arg_164_1.tipsGo_, false)

		function arg_164_1.onSingleLineFinish_()
			arg_164_1.onSingleLineUpdate_ = nil
			arg_164_1.onSingleLineFinish_ = nil
			arg_164_1.state_ = "waiting"
		end

		function arg_164_1.playNext_(arg_166_0)
			if arg_166_0 == 1 then
				arg_164_0:Play417221040(arg_164_1)
			end
		end

		function arg_164_1.onSingleLineUpdate_(arg_167_0)
			local var_167_0 = 0
			local var_167_1 = 0.775

			if var_167_0 < arg_164_1.time_ and arg_164_1.time_ <= var_167_0 + arg_167_0 then
				arg_164_1.talkMaxDuration = 0
				arg_164_1.dialogCg_.alpha = 1

				arg_164_1.dialog_:SetActive(true)
				SetActive(arg_164_1.leftNameGo_, false)

				arg_164_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_164_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_164_1:RecordName(arg_164_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_164_1.iconTrs_.gameObject, false)
				arg_164_1.callingController_:SetSelectedState("normal")

				local var_167_2 = arg_164_1:GetWordFromCfg(417221039)
				local var_167_3 = arg_164_1:FormatText(var_167_2.content)

				arg_164_1.text_.text = var_167_3

				LuaForUtil.ClearLinePrefixSymbol(arg_164_1.text_)

				local var_167_4 = 26
				local var_167_5 = utf8.len(var_167_3)
				local var_167_6 = var_167_4 <= 0 and var_167_1 or var_167_1 * (var_167_5 / var_167_4)

				if var_167_6 > 0 and var_167_1 < var_167_6 then
					arg_164_1.talkMaxDuration = var_167_6

					if var_167_6 + var_167_0 > arg_164_1.duration_ then
						arg_164_1.duration_ = var_167_6 + var_167_0
					end
				end

				arg_164_1.text_.text = var_167_3
				arg_164_1.typewritter.percent = 0

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(false)
				arg_164_1:RecordContent(arg_164_1.text_.text)
			end

			local var_167_7 = math.max(var_167_1, arg_164_1.talkMaxDuration)

			if var_167_0 <= arg_164_1.time_ and arg_164_1.time_ < var_167_0 + var_167_7 then
				arg_164_1.typewritter.percent = (arg_164_1.time_ - var_167_0) / var_167_7

				arg_164_1.typewritter:SetDirty()
			end

			if arg_164_1.time_ >= var_167_0 + var_167_7 and arg_164_1.time_ < var_167_0 + var_167_7 + arg_167_0 then
				arg_164_1.typewritter.percent = 1

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(true)
			end
		end
	end,
	Play417221040 = function(arg_168_0, arg_168_1)
		arg_168_1.time_ = 0
		arg_168_1.frameCnt_ = 0
		arg_168_1.state_ = "playing"
		arg_168_1.curTalkId_ = 417221040
		arg_168_1.duration_ = 5.03

		SetActive(arg_168_1.tipsGo_, false)

		function arg_168_1.onSingleLineFinish_()
			arg_168_1.onSingleLineUpdate_ = nil
			arg_168_1.onSingleLineFinish_ = nil
			arg_168_1.state_ = "waiting"
		end

		function arg_168_1.playNext_(arg_170_0)
			if arg_170_0 == 1 then
				arg_168_0:Play417221041(arg_168_1)
			end
		end

		function arg_168_1.onSingleLineUpdate_(arg_171_0)
			local var_171_0 = 2

			if var_171_0 < arg_168_1.time_ and arg_168_1.time_ <= var_171_0 + arg_171_0 then
				arg_168_1.allBtn_.enabled = false
			end

			local var_171_1 = 0.3

			if arg_168_1.time_ >= var_171_0 + var_171_1 and arg_168_1.time_ < var_171_0 + var_171_1 + arg_171_0 then
				arg_168_1.allBtn_.enabled = true
			end

			local var_171_2 = "ST2106"

			if arg_168_1.bgs_[var_171_2] == nil then
				local var_171_3 = Object.Instantiate(arg_168_1.paintGo_)

				var_171_3:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_171_2)
				var_171_3.name = var_171_2
				var_171_3.transform.parent = arg_168_1.stage_.transform
				var_171_3.transform.localPosition = Vector3.New(0, 100, 0)
				arg_168_1.bgs_[var_171_2] = var_171_3
			end

			local var_171_4 = 0.999999999999

			if var_171_4 < arg_168_1.time_ and arg_168_1.time_ <= var_171_4 + arg_171_0 then
				local var_171_5 = manager.ui.mainCamera.transform.localPosition
				local var_171_6 = Vector3.New(0, 0, 10) + Vector3.New(var_171_5.x, var_171_5.y, 0)
				local var_171_7 = arg_168_1.bgs_.ST2106

				var_171_7.transform.localPosition = var_171_6
				var_171_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_171_8 = var_171_7:GetComponent("SpriteRenderer")

				if var_171_8 and var_171_8.sprite then
					local var_171_9 = (var_171_7.transform.localPosition - var_171_5).z
					local var_171_10 = manager.ui.mainCameraCom_
					local var_171_11 = 2 * var_171_9 * Mathf.Tan(var_171_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_171_12 = var_171_11 * var_171_10.aspect
					local var_171_13 = var_171_8.sprite.bounds.size.x
					local var_171_14 = var_171_8.sprite.bounds.size.y
					local var_171_15 = var_171_12 / var_171_13
					local var_171_16 = var_171_11 / var_171_14
					local var_171_17 = var_171_16 < var_171_15 and var_171_15 or var_171_16

					var_171_7.transform.localScale = Vector3.New(var_171_17, var_171_17, 0)
				end

				for iter_171_0, iter_171_1 in pairs(arg_168_1.bgs_) do
					if iter_171_0 ~= "ST2106" then
						iter_171_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_171_18 = 0

			if var_171_18 < arg_168_1.time_ and arg_168_1.time_ <= var_171_18 + arg_171_0 then
				arg_168_1.mask_.enabled = true
				arg_168_1.mask_.raycastTarget = true

				arg_168_1:SetGaussion(false)
			end

			local var_171_19 = 1

			if var_171_18 <= arg_168_1.time_ and arg_168_1.time_ < var_171_18 + var_171_19 then
				local var_171_20 = (arg_168_1.time_ - var_171_18) / var_171_19
				local var_171_21 = Color.New(0, 0, 0)

				var_171_21.a = Mathf.Lerp(0, 1, var_171_20)
				arg_168_1.mask_.color = var_171_21
			end

			if arg_168_1.time_ >= var_171_18 + var_171_19 and arg_168_1.time_ < var_171_18 + var_171_19 + arg_171_0 then
				local var_171_22 = Color.New(0, 0, 0)

				var_171_22.a = 1
				arg_168_1.mask_.color = var_171_22
			end

			local var_171_23 = 1

			if var_171_23 < arg_168_1.time_ and arg_168_1.time_ <= var_171_23 + arg_171_0 then
				arg_168_1.mask_.enabled = true
				arg_168_1.mask_.raycastTarget = true

				arg_168_1:SetGaussion(false)
			end

			local var_171_24 = 1

			if var_171_23 <= arg_168_1.time_ and arg_168_1.time_ < var_171_23 + var_171_24 then
				local var_171_25 = (arg_168_1.time_ - var_171_23) / var_171_24
				local var_171_26 = Color.New(0, 0, 0)

				var_171_26.a = Mathf.Lerp(1, 0, var_171_25)
				arg_168_1.mask_.color = var_171_26
			end

			if arg_168_1.time_ >= var_171_23 + var_171_24 and arg_168_1.time_ < var_171_23 + var_171_24 + arg_171_0 then
				local var_171_27 = Color.New(0, 0, 0)
				local var_171_28 = 0

				arg_168_1.mask_.enabled = false
				var_171_27.a = var_171_28
				arg_168_1.mask_.color = var_171_27
			end

			local var_171_29 = arg_168_1.actors_["1034"]
			local var_171_30 = 1.76666666666667

			if var_171_30 < arg_168_1.time_ and arg_168_1.time_ <= var_171_30 + arg_171_0 and not isNil(var_171_29) and arg_168_1.var_.actorSpriteComps1034 == nil then
				arg_168_1.var_.actorSpriteComps1034 = var_171_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_171_31 = 0.2

			if var_171_30 <= arg_168_1.time_ and arg_168_1.time_ < var_171_30 + var_171_31 and not isNil(var_171_29) then
				local var_171_32 = (arg_168_1.time_ - var_171_30) / var_171_31

				if arg_168_1.var_.actorSpriteComps1034 then
					for iter_171_2, iter_171_3 in pairs(arg_168_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_171_3 then
							if arg_168_1.isInRecall_ then
								local var_171_33 = Mathf.Lerp(iter_171_3.color.r, arg_168_1.hightColor1.r, var_171_32)
								local var_171_34 = Mathf.Lerp(iter_171_3.color.g, arg_168_1.hightColor1.g, var_171_32)
								local var_171_35 = Mathf.Lerp(iter_171_3.color.b, arg_168_1.hightColor1.b, var_171_32)

								iter_171_3.color = Color.New(var_171_33, var_171_34, var_171_35)
							else
								local var_171_36 = Mathf.Lerp(iter_171_3.color.r, 1, var_171_32)

								iter_171_3.color = Color.New(var_171_36, var_171_36, var_171_36)
							end
						end
					end
				end
			end

			if arg_168_1.time_ >= var_171_30 + var_171_31 and arg_168_1.time_ < var_171_30 + var_171_31 + arg_171_0 and not isNil(var_171_29) and arg_168_1.var_.actorSpriteComps1034 then
				for iter_171_4, iter_171_5 in pairs(arg_168_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_171_5 then
						if arg_168_1.isInRecall_ then
							iter_171_5.color = arg_168_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_171_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_168_1.var_.actorSpriteComps1034 = nil
			end

			local var_171_37 = arg_168_1.actors_["1034"].transform
			local var_171_38 = 1.76666666666667

			if var_171_38 < arg_168_1.time_ and arg_168_1.time_ <= var_171_38 + arg_171_0 then
				arg_168_1.var_.moveOldPos1034 = var_171_37.localPosition
				var_171_37.localScale = Vector3.New(1, 1, 1)

				arg_168_1:CheckSpriteTmpPos("1034", 3)

				local var_171_39 = var_171_37.childCount

				for iter_171_6 = 0, var_171_39 - 1 do
					local var_171_40 = var_171_37:GetChild(iter_171_6)

					if var_171_40.name == "" or not string.find(var_171_40.name, "split") then
						var_171_40.gameObject:SetActive(true)
					else
						var_171_40.gameObject:SetActive(false)
					end
				end
			end

			local var_171_41 = 0.001

			if var_171_38 <= arg_168_1.time_ and arg_168_1.time_ < var_171_38 + var_171_41 then
				local var_171_42 = (arg_168_1.time_ - var_171_38) / var_171_41
				local var_171_43 = Vector3.New(0, -331.9, -324)

				var_171_37.localPosition = Vector3.Lerp(arg_168_1.var_.moveOldPos1034, var_171_43, var_171_42)
			end

			if arg_168_1.time_ >= var_171_38 + var_171_41 and arg_168_1.time_ < var_171_38 + var_171_41 + arg_171_0 then
				var_171_37.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_171_44 = arg_168_1.actors_["1034"]
			local var_171_45 = 1.76666666666667

			if var_171_45 < arg_168_1.time_ and arg_168_1.time_ <= var_171_45 + arg_171_0 then
				local var_171_46 = var_171_44:GetComponentInChildren(typeof(CanvasGroup))

				if var_171_46 then
					arg_168_1.var_.alphaOldValue1034 = var_171_46.alpha
					arg_168_1.var_.characterEffect1034 = var_171_46
				end

				arg_168_1.var_.alphaOldValue1034 = 0
			end

			local var_171_47 = 0.233333333333333

			if var_171_45 <= arg_168_1.time_ and arg_168_1.time_ < var_171_45 + var_171_47 then
				local var_171_48 = (arg_168_1.time_ - var_171_45) / var_171_47
				local var_171_49 = Mathf.Lerp(arg_168_1.var_.alphaOldValue1034, 1, var_171_48)

				if arg_168_1.var_.characterEffect1034 then
					arg_168_1.var_.characterEffect1034.alpha = var_171_49
				end
			end

			if arg_168_1.time_ >= var_171_45 + var_171_47 and arg_168_1.time_ < var_171_45 + var_171_47 + arg_171_0 and arg_168_1.var_.characterEffect1034 then
				arg_168_1.var_.characterEffect1034.alpha = 1
			end

			if arg_168_1.frameCnt_ <= 1 then
				arg_168_1.dialog_:SetActive(false)
			end

			local var_171_50 = 2
			local var_171_51 = 0.35

			if var_171_50 < arg_168_1.time_ and arg_168_1.time_ <= var_171_50 + arg_171_0 then
				arg_168_1.talkMaxDuration = 0

				arg_168_1.dialog_:SetActive(true)

				local var_171_52 = LeanTween.value(arg_168_1.dialog_, 0, 1, 0.3)

				var_171_52:setOnUpdate(LuaHelper.FloatAction(function(arg_172_0)
					arg_168_1.dialogCg_.alpha = arg_172_0
				end))
				var_171_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_168_1.dialog_)
					var_171_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_168_1.duration_ = arg_168_1.duration_ + 0.3

				SetActive(arg_168_1.leftNameGo_, true)

				local var_171_53 = arg_168_1:FormatText(StoryNameCfg[1109].name)

				arg_168_1.leftNameTxt_.text = var_171_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_168_1.leftNameTxt_.transform)

				arg_168_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_168_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_168_1:RecordName(arg_168_1.leftNameTxt_.text)
				SetActive(arg_168_1.iconTrs_.gameObject, false)
				arg_168_1.callingController_:SetSelectedState("normal")

				local var_171_54 = arg_168_1:GetWordFromCfg(417221040)
				local var_171_55 = arg_168_1:FormatText(var_171_54.content)

				arg_168_1.text_.text = var_171_55

				LuaForUtil.ClearLinePrefixSymbol(arg_168_1.text_)

				local var_171_56 = 14
				local var_171_57 = utf8.len(var_171_55)
				local var_171_58 = var_171_56 <= 0 and var_171_51 or var_171_51 * (var_171_57 / var_171_56)

				if var_171_58 > 0 and var_171_51 < var_171_58 then
					arg_168_1.talkMaxDuration = var_171_58
					var_171_50 = var_171_50 + 0.3

					if var_171_58 + var_171_50 > arg_168_1.duration_ then
						arg_168_1.duration_ = var_171_58 + var_171_50
					end
				end

				arg_168_1.text_.text = var_171_55
				arg_168_1.typewritter.percent = 0

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221040", "story_v_out_417221.awb") ~= 0 then
					local var_171_59 = manager.audio:GetVoiceLength("story_v_out_417221", "417221040", "story_v_out_417221.awb") / 1000

					if var_171_59 + var_171_50 > arg_168_1.duration_ then
						arg_168_1.duration_ = var_171_59 + var_171_50
					end

					if var_171_54.prefab_name ~= "" and arg_168_1.actors_[var_171_54.prefab_name] ~= nil then
						local var_171_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_168_1.actors_[var_171_54.prefab_name].transform, "story_v_out_417221", "417221040", "story_v_out_417221.awb")

						arg_168_1:RecordAudio("417221040", var_171_60)
						arg_168_1:RecordAudio("417221040", var_171_60)
					else
						arg_168_1:AudioAction("play", "voice", "story_v_out_417221", "417221040", "story_v_out_417221.awb")
					end

					arg_168_1:RecordHistoryTalkVoice("story_v_out_417221", "417221040", "story_v_out_417221.awb")
				end

				arg_168_1:RecordContent(arg_168_1.text_.text)
			end

			local var_171_61 = var_171_50 + 0.3
			local var_171_62 = math.max(var_171_51, arg_168_1.talkMaxDuration)

			if var_171_61 <= arg_168_1.time_ and arg_168_1.time_ < var_171_61 + var_171_62 then
				arg_168_1.typewritter.percent = (arg_168_1.time_ - var_171_61) / var_171_62

				arg_168_1.typewritter:SetDirty()
			end

			if arg_168_1.time_ >= var_171_61 + var_171_62 and arg_168_1.time_ < var_171_61 + var_171_62 + arg_171_0 then
				arg_168_1.typewritter.percent = 1

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(true)
			end
		end
	end,
	Play417221041 = function(arg_174_0, arg_174_1)
		arg_174_1.time_ = 0
		arg_174_1.frameCnt_ = 0
		arg_174_1.state_ = "playing"
		arg_174_1.curTalkId_ = 417221041
		arg_174_1.duration_ = 5

		SetActive(arg_174_1.tipsGo_, false)

		function arg_174_1.onSingleLineFinish_()
			arg_174_1.onSingleLineUpdate_ = nil
			arg_174_1.onSingleLineFinish_ = nil
			arg_174_1.state_ = "waiting"
		end

		function arg_174_1.playNext_(arg_176_0)
			if arg_176_0 == 1 then
				arg_174_0:Play417221042(arg_174_1)
			end
		end

		function arg_174_1.onSingleLineUpdate_(arg_177_0)
			local var_177_0 = arg_174_1.actors_["1034"].transform
			local var_177_1 = 0

			if var_177_1 < arg_174_1.time_ and arg_174_1.time_ <= var_177_1 + arg_177_0 then
				arg_174_1.var_.moveOldPos1034 = var_177_0.localPosition
				var_177_0.localScale = Vector3.New(1, 1, 1)

				arg_174_1:CheckSpriteTmpPos("1034", 7)

				local var_177_2 = var_177_0.childCount

				for iter_177_0 = 0, var_177_2 - 1 do
					local var_177_3 = var_177_0:GetChild(iter_177_0)

					if var_177_3.name == "" or not string.find(var_177_3.name, "split") then
						var_177_3.gameObject:SetActive(true)
					else
						var_177_3.gameObject:SetActive(false)
					end
				end
			end

			local var_177_4 = 0.001

			if var_177_1 <= arg_174_1.time_ and arg_174_1.time_ < var_177_1 + var_177_4 then
				local var_177_5 = (arg_174_1.time_ - var_177_1) / var_177_4
				local var_177_6 = Vector3.New(0, -2000, 0)

				var_177_0.localPosition = Vector3.Lerp(arg_174_1.var_.moveOldPos1034, var_177_6, var_177_5)
			end

			if arg_174_1.time_ >= var_177_1 + var_177_4 and arg_174_1.time_ < var_177_1 + var_177_4 + arg_177_0 then
				var_177_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_177_7 = 0.034
			local var_177_8 = 1

			if var_177_7 < arg_174_1.time_ and arg_174_1.time_ <= var_177_7 + arg_177_0 then
				local var_177_9 = "play"
				local var_177_10 = "effect"

				arg_174_1:AudioAction(var_177_9, var_177_10, "ui_system_3_0", "ui_sight_archieve_in", "")
			end

			local var_177_11 = 0
			local var_177_12 = 1.125

			if var_177_11 < arg_174_1.time_ and arg_174_1.time_ <= var_177_11 + arg_177_0 then
				arg_174_1.talkMaxDuration = 0
				arg_174_1.dialogCg_.alpha = 1

				arg_174_1.dialog_:SetActive(true)
				SetActive(arg_174_1.leftNameGo_, false)

				arg_174_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_174_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_174_1:RecordName(arg_174_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_174_1.iconTrs_.gameObject, false)
				arg_174_1.callingController_:SetSelectedState("normal")

				local var_177_13 = arg_174_1:GetWordFromCfg(417221041)
				local var_177_14 = arg_174_1:FormatText(var_177_13.content)

				arg_174_1.text_.text = var_177_14

				LuaForUtil.ClearLinePrefixSymbol(arg_174_1.text_)

				local var_177_15 = 44
				local var_177_16 = utf8.len(var_177_14)
				local var_177_17 = var_177_15 <= 0 and var_177_12 or var_177_12 * (var_177_16 / var_177_15)

				if var_177_17 > 0 and var_177_12 < var_177_17 then
					arg_174_1.talkMaxDuration = var_177_17

					if var_177_17 + var_177_11 > arg_174_1.duration_ then
						arg_174_1.duration_ = var_177_17 + var_177_11
					end
				end

				arg_174_1.text_.text = var_177_14
				arg_174_1.typewritter.percent = 0

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(false)
				arg_174_1:RecordContent(arg_174_1.text_.text)
			end

			local var_177_18 = math.max(var_177_12, arg_174_1.talkMaxDuration)

			if var_177_11 <= arg_174_1.time_ and arg_174_1.time_ < var_177_11 + var_177_18 then
				arg_174_1.typewritter.percent = (arg_174_1.time_ - var_177_11) / var_177_18

				arg_174_1.typewritter:SetDirty()
			end

			if arg_174_1.time_ >= var_177_11 + var_177_18 and arg_174_1.time_ < var_177_11 + var_177_18 + arg_177_0 then
				arg_174_1.typewritter.percent = 1

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(true)
			end
		end
	end,
	Play417221042 = function(arg_178_0, arg_178_1)
		arg_178_1.time_ = 0
		arg_178_1.frameCnt_ = 0
		arg_178_1.state_ = "playing"
		arg_178_1.curTalkId_ = 417221042
		arg_178_1.duration_ = 5.2

		SetActive(arg_178_1.tipsGo_, false)

		function arg_178_1.onSingleLineFinish_()
			arg_178_1.onSingleLineUpdate_ = nil
			arg_178_1.onSingleLineFinish_ = nil
			arg_178_1.state_ = "waiting"
		end

		function arg_178_1.playNext_(arg_180_0)
			if arg_180_0 == 1 then
				arg_178_0:Play417221043(arg_178_1)
			end
		end

		function arg_178_1.onSingleLineUpdate_(arg_181_0)
			local var_181_0 = 0

			if var_181_0 < arg_178_1.time_ and arg_178_1.time_ <= var_181_0 + arg_181_0 then
				arg_178_1.mask_.enabled = true
				arg_178_1.mask_.raycastTarget = false

				arg_178_1:SetGaussion(false)
			end

			local var_181_1 = 0.7

			if var_181_0 <= arg_178_1.time_ and arg_178_1.time_ < var_181_0 + var_181_1 then
				local var_181_2 = (arg_178_1.time_ - var_181_0) / var_181_1
				local var_181_3 = Color.New(0, 0, 0)

				var_181_3.a = Mathf.Lerp(0, 1, var_181_2)
				arg_178_1.mask_.color = var_181_3
			end

			if arg_178_1.time_ >= var_181_0 + var_181_1 and arg_178_1.time_ < var_181_0 + var_181_1 + arg_181_0 then
				local var_181_4 = Color.New(0, 0, 0)

				var_181_4.a = 1
				arg_178_1.mask_.color = var_181_4
			end

			local var_181_5 = 0.7

			if var_181_5 < arg_178_1.time_ and arg_178_1.time_ <= var_181_5 + arg_181_0 then
				arg_178_1.mask_.enabled = true
				arg_178_1.mask_.raycastTarget = false

				arg_178_1:SetGaussion(false)
			end

			local var_181_6 = 0.7

			if var_181_5 <= arg_178_1.time_ and arg_178_1.time_ < var_181_5 + var_181_6 then
				local var_181_7 = (arg_178_1.time_ - var_181_5) / var_181_6
				local var_181_8 = Color.New(0, 0, 0)

				var_181_8.a = Mathf.Lerp(1, 0, var_181_7)
				arg_178_1.mask_.color = var_181_8
			end

			if arg_178_1.time_ >= var_181_5 + var_181_6 and arg_178_1.time_ < var_181_5 + var_181_6 + arg_181_0 then
				local var_181_9 = Color.New(0, 0, 0)
				local var_181_10 = 0

				arg_178_1.mask_.enabled = false
				var_181_9.a = var_181_10
				arg_178_1.mask_.color = var_181_9
			end

			local var_181_11 = 0.7

			if var_181_11 < arg_178_1.time_ and arg_178_1.time_ <= var_181_11 + arg_181_0 then
				arg_178_1.cswbg_:SetActive(true)

				local var_181_12 = arg_178_1.cswt_:GetComponent("RectTransform")

				arg_178_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_181_12.offsetMin = Vector2.New(0, 0)
				var_181_12.offsetMax = Vector2.New(0, 0)

				local var_181_13 = arg_178_1:GetWordFromCfg(419113)
				local var_181_14 = arg_178_1:FormatText(var_181_13.content)

				arg_178_1.cswt_.text = var_181_14

				LuaForUtil.ClearLinePrefixSymbol(arg_178_1.cswt_)

				arg_178_1.cswt_.fontSize = 120
				arg_178_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_178_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_181_15 = "STblack"

			if arg_178_1.bgs_[var_181_15] == nil then
				local var_181_16 = Object.Instantiate(arg_178_1.paintGo_)

				var_181_16:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_181_15)
				var_181_16.name = var_181_15
				var_181_16.transform.parent = arg_178_1.stage_.transform
				var_181_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_178_1.bgs_[var_181_15] = var_181_16
			end

			local var_181_17 = 0.7

			if var_181_17 < arg_178_1.time_ and arg_178_1.time_ <= var_181_17 + arg_181_0 then
				local var_181_18 = manager.ui.mainCamera.transform.localPosition
				local var_181_19 = Vector3.New(0, 0, 10) + Vector3.New(var_181_18.x, var_181_18.y, 0)
				local var_181_20 = arg_178_1.bgs_.STblack

				var_181_20.transform.localPosition = var_181_19
				var_181_20.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_181_21 = var_181_20:GetComponent("SpriteRenderer")

				if var_181_21 and var_181_21.sprite then
					local var_181_22 = (var_181_20.transform.localPosition - var_181_18).z
					local var_181_23 = manager.ui.mainCameraCom_
					local var_181_24 = 2 * var_181_22 * Mathf.Tan(var_181_23.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_181_25 = var_181_24 * var_181_23.aspect
					local var_181_26 = var_181_21.sprite.bounds.size.x
					local var_181_27 = var_181_21.sprite.bounds.size.y
					local var_181_28 = var_181_25 / var_181_26
					local var_181_29 = var_181_24 / var_181_27
					local var_181_30 = var_181_29 < var_181_28 and var_181_28 or var_181_29

					var_181_20.transform.localScale = Vector3.New(var_181_30, var_181_30, 0)
				end

				for iter_181_0, iter_181_1 in pairs(arg_178_1.bgs_) do
					if iter_181_0 ~= "STblack" then
						iter_181_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_181_31 = 0.7

			if var_181_31 < arg_178_1.time_ and arg_178_1.time_ <= var_181_31 + arg_181_0 then
				arg_178_1.fswbg_:SetActive(true)
				arg_178_1.dialog_:SetActive(false)

				arg_178_1.fswtw_.percent = 0

				local var_181_32 = arg_178_1:GetWordFromCfg(417221042)
				local var_181_33 = arg_178_1:FormatText(var_181_32.content)

				arg_178_1.fswt_.text = var_181_33

				LuaForUtil.ClearLinePrefixSymbol(arg_178_1.fswt_)

				arg_178_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_178_1.fswtw_:SetDirty()

				arg_178_1.typewritterCharCountI18N = 0

				arg_178_1:ShowNextGo(false)
			end

			local var_181_34 = 1.13333333333333

			if var_181_34 < arg_178_1.time_ and arg_178_1.time_ <= var_181_34 + arg_181_0 then
				arg_178_1.var_.oldValueTypewriter = arg_178_1.fswtw_.percent

				arg_178_1:ShowNextGo(false)
			end

			local var_181_35 = 19
			local var_181_36 = 1.26666666666667
			local var_181_37 = arg_178_1:GetWordFromCfg(417221042)
			local var_181_38 = arg_178_1:FormatText(var_181_37.content)
			local var_181_39, var_181_40 = arg_178_1:GetPercentByPara(var_181_38, 1)

			if var_181_34 < arg_178_1.time_ and arg_178_1.time_ <= var_181_34 + arg_181_0 then
				arg_178_1.talkMaxDuration = 0

				local var_181_41 = var_181_35 <= 0 and var_181_36 or var_181_36 * ((var_181_40 - arg_178_1.typewritterCharCountI18N) / var_181_35)

				if var_181_41 > 0 and var_181_36 < var_181_41 then
					arg_178_1.talkMaxDuration = var_181_41

					if var_181_41 + var_181_34 > arg_178_1.duration_ then
						arg_178_1.duration_ = var_181_41 + var_181_34
					end
				end
			end

			local var_181_42 = 1.26666666666667
			local var_181_43 = math.max(var_181_42, arg_178_1.talkMaxDuration)

			if var_181_34 <= arg_178_1.time_ and arg_178_1.time_ < var_181_34 + var_181_43 then
				local var_181_44 = (arg_178_1.time_ - var_181_34) / var_181_43

				arg_178_1.fswtw_.percent = Mathf.Lerp(arg_178_1.var_.oldValueTypewriter, var_181_39, var_181_44)
				arg_178_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_178_1.fswtw_:SetDirty()
			end

			if arg_178_1.time_ >= var_181_34 + var_181_43 and arg_178_1.time_ < var_181_34 + var_181_43 + arg_181_0 then
				arg_178_1.fswtw_.percent = var_181_39

				arg_178_1.fswtw_:SetDirty()
				arg_178_1:ShowNextGo(true)

				arg_178_1.typewritterCharCountI18N = var_181_40
			end

			local var_181_45 = 0.7

			if var_181_45 < arg_178_1.time_ and arg_178_1.time_ <= var_181_45 + arg_181_0 then
				local var_181_46 = arg_178_1.fswbg_.transform:Find("textbox/adapt/content") or arg_178_1.fswbg_.transform:Find("textbox/content")
				local var_181_47 = var_181_46:GetComponent("Text")
				local var_181_48 = var_181_46:GetComponent("RectTransform")

				var_181_47.alignment = UnityEngine.TextAnchor.LowerCenter
				var_181_48.offsetMin = Vector2.New(0, 0)
				var_181_48.offsetMax = Vector2.New(0, 0)
			end

			local var_181_49 = 0.683333333333333

			arg_178_1.isInRecall_ = false

			if var_181_49 < arg_178_1.time_ and arg_178_1.time_ <= var_181_49 + arg_181_0 then
				arg_178_1.screenFilterGo_:SetActive(false)

				for iter_181_2, iter_181_3 in pairs(arg_178_1.actors_) do
					local var_181_50 = iter_181_3:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_181_4, iter_181_5 in ipairs(var_181_50) do
						if iter_181_5.color.r > 0.51 then
							iter_181_5.color = Color.New(1, 1, 1)
						else
							iter_181_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_181_51 = 0.0166666666666667

			if var_181_49 <= arg_178_1.time_ and arg_178_1.time_ < var_181_49 + var_181_51 then
				local var_181_52 = (arg_178_1.time_ - var_181_49) / var_181_51

				arg_178_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_181_52)
			end

			if arg_178_1.time_ >= var_181_49 + var_181_51 and arg_178_1.time_ < var_181_49 + var_181_51 + arg_181_0 then
				arg_178_1.screenFilterEffect_.weight = 0
			end

			local var_181_53 = 1.13333333333333
			local var_181_54 = 4.066

			if var_181_53 < arg_178_1.time_ and arg_178_1.time_ <= var_181_53 + arg_181_0 then
				local var_181_55 = "play"
				local var_181_56 = "music"

				arg_178_1:AudioAction(var_181_55, var_181_56, "story_v_out_417221", "417221042", "story_v_out_417221.awb")

				local var_181_57 = ""
				local var_181_58 = manager.audio:GetAudioName("story_v_out_417221", "417221042")

				if var_181_58 ~= "" then
					if arg_178_1.bgmTxt_.text ~= var_181_58 and arg_178_1.bgmTxt_.text ~= "" then
						if arg_178_1.bgmTxt2_.text ~= "" then
							arg_178_1.bgmTxt_.text = arg_178_1.bgmTxt2_.text
						end

						arg_178_1.bgmTxt2_.text = var_181_58

						arg_178_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_178_1.bgmTxt_.text = var_181_58
					end

					if arg_178_1.bgmTimer then
						arg_178_1.bgmTimer:Stop()

						arg_178_1.bgmTimer = nil
					end

					if arg_178_1.settingData.show_music_name == 1 then
						arg_178_1.musicController:SetSelectedState("show")
						arg_178_1.musicAnimator_:Play("open", 0, 0)

						if arg_178_1.settingData.music_time ~= 0 then
							arg_178_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_178_1.settingData.music_time), function()
								if arg_178_1 == nil or isNil(arg_178_1.bgmTxt_) then
									return
								end

								arg_178_1.musicController:SetSelectedState("hide")
								arg_178_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 417221043
		arg_183_1.duration_ = 7

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play417221044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 2

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.allBtn_.enabled = false
			end

			local var_186_1 = 0.3

			if arg_183_1.time_ >= var_186_0 + var_186_1 and arg_183_1.time_ < var_186_0 + var_186_1 + arg_186_0 then
				arg_183_1.allBtn_.enabled = true
			end

			local var_186_2 = 0.999999999999999

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 then
				local var_186_3 = manager.ui.mainCamera.transform.localPosition
				local var_186_4 = Vector3.New(0, 0, 10) + Vector3.New(var_186_3.x, var_186_3.y, 0)
				local var_186_5 = arg_183_1.bgs_.ST69

				var_186_5.transform.localPosition = var_186_4
				var_186_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_186_6 = var_186_5:GetComponent("SpriteRenderer")

				if var_186_6 and var_186_6.sprite then
					local var_186_7 = (var_186_5.transform.localPosition - var_186_3).z
					local var_186_8 = manager.ui.mainCameraCom_
					local var_186_9 = 2 * var_186_7 * Mathf.Tan(var_186_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_186_10 = var_186_9 * var_186_8.aspect
					local var_186_11 = var_186_6.sprite.bounds.size.x
					local var_186_12 = var_186_6.sprite.bounds.size.y
					local var_186_13 = var_186_10 / var_186_11
					local var_186_14 = var_186_9 / var_186_12
					local var_186_15 = var_186_14 < var_186_13 and var_186_13 or var_186_14

					var_186_5.transform.localScale = Vector3.New(var_186_15, var_186_15, 0)
				end

				for iter_186_0, iter_186_1 in pairs(arg_183_1.bgs_) do
					if iter_186_0 ~= "ST69" then
						iter_186_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_17 = 1

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17
				local var_186_19 = Color.New(0, 0, 0)

				var_186_19.a = Mathf.Lerp(0, 1, var_186_18)
				arg_183_1.mask_.color = var_186_19
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				local var_186_20 = Color.New(0, 0, 0)

				var_186_20.a = 1
				arg_183_1.mask_.color = var_186_20
			end

			local var_186_21 = 0.999999999999999

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_22 = 1

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_22 then
				local var_186_23 = (arg_183_1.time_ - var_186_21) / var_186_22
				local var_186_24 = Color.New(0, 0, 0)

				var_186_24.a = Mathf.Lerp(1, 0, var_186_23)
				arg_183_1.mask_.color = var_186_24
			end

			if arg_183_1.time_ >= var_186_21 + var_186_22 and arg_183_1.time_ < var_186_21 + var_186_22 + arg_186_0 then
				local var_186_25 = Color.New(0, 0, 0)
				local var_186_26 = 0

				arg_183_1.mask_.enabled = false
				var_186_25.a = var_186_26
				arg_183_1.mask_.color = var_186_25
			end

			local var_186_27 = arg_183_1.actors_["1034"].transform
			local var_186_28 = 0.965999999999999

			if var_186_28 < arg_183_1.time_ and arg_183_1.time_ <= var_186_28 + arg_186_0 then
				arg_183_1.var_.moveOldPos1034 = var_186_27.localPosition
				var_186_27.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("1034", 7)

				local var_186_29 = var_186_27.childCount

				for iter_186_2 = 0, var_186_29 - 1 do
					local var_186_30 = var_186_27:GetChild(iter_186_2)

					if var_186_30.name == "" or not string.find(var_186_30.name, "split") then
						var_186_30.gameObject:SetActive(true)
					else
						var_186_30.gameObject:SetActive(false)
					end
				end
			end

			local var_186_31 = 0.001

			if var_186_28 <= arg_183_1.time_ and arg_183_1.time_ < var_186_28 + var_186_31 then
				local var_186_32 = (arg_183_1.time_ - var_186_28) / var_186_31
				local var_186_33 = Vector3.New(0, -2000, 0)

				var_186_27.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1034, var_186_33, var_186_32)
			end

			if arg_183_1.time_ >= var_186_28 + var_186_31 and arg_183_1.time_ < var_186_28 + var_186_31 + arg_186_0 then
				var_186_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_186_34 = 0.966666666666667

			if var_186_34 < arg_183_1.time_ and arg_183_1.time_ <= var_186_34 + arg_186_0 then
				arg_183_1.cswbg_:SetActive(false)
			end

			local var_186_35 = 0.966666666666667

			if var_186_35 < arg_183_1.time_ and arg_183_1.time_ <= var_186_35 + arg_186_0 then
				arg_183_1.fswbg_:SetActive(false)
				arg_183_1.dialog_:SetActive(false)
				arg_183_1:ShowNextGo(false)
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_36 = 2
			local var_186_37 = 0.9

			if var_186_36 < arg_183_1.time_ and arg_183_1.time_ <= var_186_36 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_38 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_38:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_39 = arg_183_1:GetWordFromCfg(417221043)
				local var_186_40 = arg_183_1:FormatText(var_186_39.content)

				arg_183_1.text_.text = var_186_40

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_41 = 36
				local var_186_42 = utf8.len(var_186_40)
				local var_186_43 = var_186_41 <= 0 and var_186_37 or var_186_37 * (var_186_42 / var_186_41)

				if var_186_43 > 0 and var_186_37 < var_186_43 then
					arg_183_1.talkMaxDuration = var_186_43
					var_186_36 = var_186_36 + 0.3

					if var_186_43 + var_186_36 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_43 + var_186_36
					end
				end

				arg_183_1.text_.text = var_186_40
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_44 = var_186_36 + 0.3
			local var_186_45 = math.max(var_186_37, arg_183_1.talkMaxDuration)

			if var_186_44 <= arg_183_1.time_ and arg_183_1.time_ < var_186_44 + var_186_45 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_44) / var_186_45

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_44 + var_186_45 and arg_183_1.time_ < var_186_44 + var_186_45 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play417221044 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 417221044
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play417221045(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.cswbg_:SetActive(false)
			end

			local var_192_1 = 0
			local var_192_2 = 1.775

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(417221044)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 71
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_2 or var_192_2 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_2 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_1 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_1
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_8 = math.max(var_192_2, arg_189_1.talkMaxDuration)

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_8 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_1) / var_192_8

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_1 + var_192_8 and arg_189_1.time_ < var_192_1 + var_192_8 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play417221045 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 417221045
		arg_193_1.duration_ = 7.6

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play417221046(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1034"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.actorSpriteComps1034 == nil then
				arg_193_1.var_.actorSpriteComps1034 = var_196_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_2 = 0.2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 and not isNil(var_196_0) then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.actorSpriteComps1034 then
					for iter_196_0, iter_196_1 in pairs(arg_193_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_196_1 then
							if arg_193_1.isInRecall_ then
								local var_196_4 = Mathf.Lerp(iter_196_1.color.r, arg_193_1.hightColor1.r, var_196_3)
								local var_196_5 = Mathf.Lerp(iter_196_1.color.g, arg_193_1.hightColor1.g, var_196_3)
								local var_196_6 = Mathf.Lerp(iter_196_1.color.b, arg_193_1.hightColor1.b, var_196_3)

								iter_196_1.color = Color.New(var_196_4, var_196_5, var_196_6)
							else
								local var_196_7 = Mathf.Lerp(iter_196_1.color.r, 1, var_196_3)

								iter_196_1.color = Color.New(var_196_7, var_196_7, var_196_7)
							end
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.actorSpriteComps1034 then
				for iter_196_2, iter_196_3 in pairs(arg_193_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_196_3 then
						if arg_193_1.isInRecall_ then
							iter_196_3.color = arg_193_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_196_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_193_1.var_.actorSpriteComps1034 = nil
			end

			local var_196_8 = arg_193_1.actors_["1034"].transform
			local var_196_9 = 0

			if var_196_9 < arg_193_1.time_ and arg_193_1.time_ <= var_196_9 + arg_196_0 then
				arg_193_1.var_.moveOldPos1034 = var_196_8.localPosition
				var_196_8.localScale = Vector3.New(1, 1, 1)

				arg_193_1:CheckSpriteTmpPos("1034", 3)

				local var_196_10 = var_196_8.childCount

				for iter_196_4 = 0, var_196_10 - 1 do
					local var_196_11 = var_196_8:GetChild(iter_196_4)

					if var_196_11.name == "" or not string.find(var_196_11.name, "split") then
						var_196_11.gameObject:SetActive(true)
					else
						var_196_11.gameObject:SetActive(false)
					end
				end
			end

			local var_196_12 = 0.001

			if var_196_9 <= arg_193_1.time_ and arg_193_1.time_ < var_196_9 + var_196_12 then
				local var_196_13 = (arg_193_1.time_ - var_196_9) / var_196_12
				local var_196_14 = Vector3.New(0, -331.9, -324)

				var_196_8.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1034, var_196_14, var_196_13)
			end

			if arg_193_1.time_ >= var_196_9 + var_196_12 and arg_193_1.time_ < var_196_9 + var_196_12 + arg_196_0 then
				var_196_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_196_15 = 0
			local var_196_16 = 0.7

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_17 = arg_193_1:FormatText(StoryNameCfg[1109].name)

				arg_193_1.leftNameTxt_.text = var_196_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_18 = arg_193_1:GetWordFromCfg(417221045)
				local var_196_19 = arg_193_1:FormatText(var_196_18.content)

				arg_193_1.text_.text = var_196_19

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_20 = 28
				local var_196_21 = utf8.len(var_196_19)
				local var_196_22 = var_196_20 <= 0 and var_196_16 or var_196_16 * (var_196_21 / var_196_20)

				if var_196_22 > 0 and var_196_16 < var_196_22 then
					arg_193_1.talkMaxDuration = var_196_22

					if var_196_22 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_22 + var_196_15
					end
				end

				arg_193_1.text_.text = var_196_19
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221045", "story_v_out_417221.awb") ~= 0 then
					local var_196_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221045", "story_v_out_417221.awb") / 1000

					if var_196_23 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_23 + var_196_15
					end

					if var_196_18.prefab_name ~= "" and arg_193_1.actors_[var_196_18.prefab_name] ~= nil then
						local var_196_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_18.prefab_name].transform, "story_v_out_417221", "417221045", "story_v_out_417221.awb")

						arg_193_1:RecordAudio("417221045", var_196_24)
						arg_193_1:RecordAudio("417221045", var_196_24)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_417221", "417221045", "story_v_out_417221.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_417221", "417221045", "story_v_out_417221.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_25 = math.max(var_196_16, arg_193_1.talkMaxDuration)

			if var_196_15 <= arg_193_1.time_ and arg_193_1.time_ < var_196_15 + var_196_25 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_15) / var_196_25

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_15 + var_196_25 and arg_193_1.time_ < var_196_15 + var_196_25 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play417221046 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 417221046
		arg_197_1.duration_ = 6.5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play417221047(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.55

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[1109].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(417221046)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 22
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221046", "story_v_out_417221.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221046", "story_v_out_417221.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_417221", "417221046", "story_v_out_417221.awb")

						arg_197_1:RecordAudio("417221046", var_200_9)
						arg_197_1:RecordAudio("417221046", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_417221", "417221046", "story_v_out_417221.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_417221", "417221046", "story_v_out_417221.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play417221047 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 417221047
		arg_201_1.duration_ = 3.2

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play417221048(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1034"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1034 = var_204_0.localPosition
				var_204_0.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("1034", 3)

				local var_204_2 = var_204_0.childCount

				for iter_204_0 = 0, var_204_2 - 1 do
					local var_204_3 = var_204_0:GetChild(iter_204_0)

					if var_204_3.name == "split_6" or not string.find(var_204_3.name, "split") then
						var_204_3.gameObject:SetActive(true)
					else
						var_204_3.gameObject:SetActive(false)
					end
				end
			end

			local var_204_4 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_4 then
				local var_204_5 = (arg_201_1.time_ - var_204_1) / var_204_4
				local var_204_6 = Vector3.New(0, -331.9, -324)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1034, var_204_6, var_204_5)
			end

			if arg_201_1.time_ >= var_204_1 + var_204_4 and arg_201_1.time_ < var_204_1 + var_204_4 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_204_7 = 0
			local var_204_8 = 0.275

			if var_204_7 < arg_201_1.time_ and arg_201_1.time_ <= var_204_7 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_9 = arg_201_1:FormatText(StoryNameCfg[1109].name)

				arg_201_1.leftNameTxt_.text = var_204_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_10 = arg_201_1:GetWordFromCfg(417221047)
				local var_204_11 = arg_201_1:FormatText(var_204_10.content)

				arg_201_1.text_.text = var_204_11

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_12 = 11
				local var_204_13 = utf8.len(var_204_11)
				local var_204_14 = var_204_12 <= 0 and var_204_8 or var_204_8 * (var_204_13 / var_204_12)

				if var_204_14 > 0 and var_204_8 < var_204_14 then
					arg_201_1.talkMaxDuration = var_204_14

					if var_204_14 + var_204_7 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_14 + var_204_7
					end
				end

				arg_201_1.text_.text = var_204_11
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221047", "story_v_out_417221.awb") ~= 0 then
					local var_204_15 = manager.audio:GetVoiceLength("story_v_out_417221", "417221047", "story_v_out_417221.awb") / 1000

					if var_204_15 + var_204_7 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_15 + var_204_7
					end

					if var_204_10.prefab_name ~= "" and arg_201_1.actors_[var_204_10.prefab_name] ~= nil then
						local var_204_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_10.prefab_name].transform, "story_v_out_417221", "417221047", "story_v_out_417221.awb")

						arg_201_1:RecordAudio("417221047", var_204_16)
						arg_201_1:RecordAudio("417221047", var_204_16)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_417221", "417221047", "story_v_out_417221.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_417221", "417221047", "story_v_out_417221.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_17 = math.max(var_204_8, arg_201_1.talkMaxDuration)

			if var_204_7 <= arg_201_1.time_ and arg_201_1.time_ < var_204_7 + var_204_17 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_7) / var_204_17

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_7 + var_204_17 and arg_201_1.time_ < var_204_7 + var_204_17 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play417221048 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 417221048
		arg_205_1.duration_ = 8.93

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play417221049(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 2

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				local var_208_1 = manager.ui.mainCamera.transform.localPosition
				local var_208_2 = Vector3.New(0, 0, 10) + Vector3.New(var_208_1.x, var_208_1.y, 0)
				local var_208_3 = arg_205_1.bgs_.I16f

				var_208_3.transform.localPosition = var_208_2
				var_208_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_208_4 = var_208_3:GetComponent("SpriteRenderer")

				if var_208_4 and var_208_4.sprite then
					local var_208_5 = (var_208_3.transform.localPosition - var_208_1).z
					local var_208_6 = manager.ui.mainCameraCom_
					local var_208_7 = 2 * var_208_5 * Mathf.Tan(var_208_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_208_8 = var_208_7 * var_208_6.aspect
					local var_208_9 = var_208_4.sprite.bounds.size.x
					local var_208_10 = var_208_4.sprite.bounds.size.y
					local var_208_11 = var_208_8 / var_208_9
					local var_208_12 = var_208_7 / var_208_10
					local var_208_13 = var_208_12 < var_208_11 and var_208_11 or var_208_12

					var_208_3.transform.localScale = Vector3.New(var_208_13, var_208_13, 0)
				end

				for iter_208_0, iter_208_1 in pairs(arg_205_1.bgs_) do
					if iter_208_0 ~= "I16f" then
						iter_208_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_208_14 = 4

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 then
				arg_205_1.allBtn_.enabled = false
			end

			local var_208_15 = 0.3

			if arg_205_1.time_ >= var_208_14 + var_208_15 and arg_205_1.time_ < var_208_14 + var_208_15 + arg_208_0 then
				arg_205_1.allBtn_.enabled = true
			end

			local var_208_16 = 0

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 then
				arg_205_1.mask_.enabled = true
				arg_205_1.mask_.raycastTarget = true

				arg_205_1:SetGaussion(false)
			end

			local var_208_17 = 2

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17
				local var_208_19 = Color.New(0, 0, 0)

				var_208_19.a = Mathf.Lerp(0, 1, var_208_18)
				arg_205_1.mask_.color = var_208_19
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 then
				local var_208_20 = Color.New(0, 0, 0)

				var_208_20.a = 1
				arg_205_1.mask_.color = var_208_20
			end

			local var_208_21 = 2

			if var_208_21 < arg_205_1.time_ and arg_205_1.time_ <= var_208_21 + arg_208_0 then
				arg_205_1.mask_.enabled = true
				arg_205_1.mask_.raycastTarget = true

				arg_205_1:SetGaussion(false)
			end

			local var_208_22 = 2

			if var_208_21 <= arg_205_1.time_ and arg_205_1.time_ < var_208_21 + var_208_22 then
				local var_208_23 = (arg_205_1.time_ - var_208_21) / var_208_22
				local var_208_24 = Color.New(0, 0, 0)

				var_208_24.a = Mathf.Lerp(1, 0, var_208_23)
				arg_205_1.mask_.color = var_208_24
			end

			if arg_205_1.time_ >= var_208_21 + var_208_22 and arg_205_1.time_ < var_208_21 + var_208_22 + arg_208_0 then
				local var_208_25 = Color.New(0, 0, 0)
				local var_208_26 = 0

				arg_205_1.mask_.enabled = false
				var_208_25.a = var_208_26
				arg_205_1.mask_.color = var_208_25
			end

			local var_208_27 = arg_205_1.actors_["10113"]
			local var_208_28 = 3.66666666666667

			if var_208_28 < arg_205_1.time_ and arg_205_1.time_ <= var_208_28 + arg_208_0 and not isNil(var_208_27) and arg_205_1.var_.actorSpriteComps10113 == nil then
				arg_205_1.var_.actorSpriteComps10113 = var_208_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_29 = 0.2

			if var_208_28 <= arg_205_1.time_ and arg_205_1.time_ < var_208_28 + var_208_29 and not isNil(var_208_27) then
				local var_208_30 = (arg_205_1.time_ - var_208_28) / var_208_29

				if arg_205_1.var_.actorSpriteComps10113 then
					for iter_208_2, iter_208_3 in pairs(arg_205_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_208_3 then
							if arg_205_1.isInRecall_ then
								local var_208_31 = Mathf.Lerp(iter_208_3.color.r, arg_205_1.hightColor1.r, var_208_30)
								local var_208_32 = Mathf.Lerp(iter_208_3.color.g, arg_205_1.hightColor1.g, var_208_30)
								local var_208_33 = Mathf.Lerp(iter_208_3.color.b, arg_205_1.hightColor1.b, var_208_30)

								iter_208_3.color = Color.New(var_208_31, var_208_32, var_208_33)
							else
								local var_208_34 = Mathf.Lerp(iter_208_3.color.r, 1, var_208_30)

								iter_208_3.color = Color.New(var_208_34, var_208_34, var_208_34)
							end
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_28 + var_208_29 and arg_205_1.time_ < var_208_28 + var_208_29 + arg_208_0 and not isNil(var_208_27) and arg_205_1.var_.actorSpriteComps10113 then
				for iter_208_4, iter_208_5 in pairs(arg_205_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_208_5 then
						if arg_205_1.isInRecall_ then
							iter_208_5.color = arg_205_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_208_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_205_1.var_.actorSpriteComps10113 = nil
			end

			local var_208_35 = arg_205_1.actors_["10113"].transform
			local var_208_36 = 3.66666666666667

			if var_208_36 < arg_205_1.time_ and arg_205_1.time_ <= var_208_36 + arg_208_0 then
				arg_205_1.var_.moveOldPos10113 = var_208_35.localPosition
				var_208_35.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10113", 3)

				local var_208_37 = var_208_35.childCount

				for iter_208_6 = 0, var_208_37 - 1 do
					local var_208_38 = var_208_35:GetChild(iter_208_6)

					if var_208_38.name == "" or not string.find(var_208_38.name, "split") then
						var_208_38.gameObject:SetActive(true)
					else
						var_208_38.gameObject:SetActive(false)
					end
				end
			end

			local var_208_39 = 0.001

			if var_208_36 <= arg_205_1.time_ and arg_205_1.time_ < var_208_36 + var_208_39 then
				local var_208_40 = (arg_205_1.time_ - var_208_36) / var_208_39
				local var_208_41 = Vector3.New(-30.38, -328.4, -517.4)

				var_208_35.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10113, var_208_41, var_208_40)
			end

			if arg_205_1.time_ >= var_208_36 + var_208_39 and arg_205_1.time_ < var_208_36 + var_208_39 + arg_208_0 then
				var_208_35.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_208_42 = arg_205_1.actors_["1034"].transform
			local var_208_43 = 2

			if var_208_43 < arg_205_1.time_ and arg_205_1.time_ <= var_208_43 + arg_208_0 then
				arg_205_1.var_.moveOldPos1034 = var_208_42.localPosition
				var_208_42.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("1034", 7)

				local var_208_44 = var_208_42.childCount

				for iter_208_7 = 0, var_208_44 - 1 do
					local var_208_45 = var_208_42:GetChild(iter_208_7)

					if var_208_45.name == "" or not string.find(var_208_45.name, "split") then
						var_208_45.gameObject:SetActive(true)
					else
						var_208_45.gameObject:SetActive(false)
					end
				end
			end

			local var_208_46 = 0.001

			if var_208_43 <= arg_205_1.time_ and arg_205_1.time_ < var_208_43 + var_208_46 then
				local var_208_47 = (arg_205_1.time_ - var_208_43) / var_208_46
				local var_208_48 = Vector3.New(0, -2000, 0)

				var_208_42.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1034, var_208_48, var_208_47)
			end

			if arg_205_1.time_ >= var_208_43 + var_208_46 and arg_205_1.time_ < var_208_43 + var_208_46 + arg_208_0 then
				var_208_42.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_208_49 = arg_205_1.actors_["10113"]
			local var_208_50 = 3.66666666666667

			if var_208_50 < arg_205_1.time_ and arg_205_1.time_ <= var_208_50 + arg_208_0 then
				local var_208_51 = var_208_49:GetComponentInChildren(typeof(CanvasGroup))

				if var_208_51 then
					arg_205_1.var_.alphaOldValue10113 = var_208_51.alpha
					arg_205_1.var_.characterEffect10113 = var_208_51
				end

				arg_205_1.var_.alphaOldValue10113 = 0
			end

			local var_208_52 = 0.333333333333333

			if var_208_50 <= arg_205_1.time_ and arg_205_1.time_ < var_208_50 + var_208_52 then
				local var_208_53 = (arg_205_1.time_ - var_208_50) / var_208_52
				local var_208_54 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10113, 1, var_208_53)

				if arg_205_1.var_.characterEffect10113 then
					arg_205_1.var_.characterEffect10113.alpha = var_208_54
				end
			end

			if arg_205_1.time_ >= var_208_50 + var_208_52 and arg_205_1.time_ < var_208_50 + var_208_52 + arg_208_0 and arg_205_1.var_.characterEffect10113 then
				arg_205_1.var_.characterEffect10113.alpha = 1
			end

			local var_208_55 = 1.73333333333333
			local var_208_56 = 1

			if var_208_55 < arg_205_1.time_ and arg_205_1.time_ <= var_208_55 + arg_208_0 then
				local var_208_57 = "play"
				local var_208_58 = "effect"

				arg_205_1:AudioAction(var_208_57, var_208_58, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			if arg_205_1.frameCnt_ <= 1 then
				arg_205_1.dialog_:SetActive(false)
			end

			local var_208_59 = 4
			local var_208_60 = 0.55

			if var_208_59 < arg_205_1.time_ and arg_205_1.time_ <= var_208_59 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0

				arg_205_1.dialog_:SetActive(true)

				local var_208_61 = LeanTween.value(arg_205_1.dialog_, 0, 1, 0.3)

				var_208_61:setOnUpdate(LuaHelper.FloatAction(function(arg_209_0)
					arg_205_1.dialogCg_.alpha = arg_209_0
				end))
				var_208_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_205_1.dialog_)
					var_208_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_205_1.duration_ = arg_205_1.duration_ + 0.3

				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_62 = arg_205_1:FormatText(StoryNameCfg[1117].name)

				arg_205_1.leftNameTxt_.text = var_208_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_63 = arg_205_1:GetWordFromCfg(417221048)
				local var_208_64 = arg_205_1:FormatText(var_208_63.content)

				arg_205_1.text_.text = var_208_64

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_65 = 22
				local var_208_66 = utf8.len(var_208_64)
				local var_208_67 = var_208_65 <= 0 and var_208_60 or var_208_60 * (var_208_66 / var_208_65)

				if var_208_67 > 0 and var_208_60 < var_208_67 then
					arg_205_1.talkMaxDuration = var_208_67
					var_208_59 = var_208_59 + 0.3

					if var_208_67 + var_208_59 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_67 + var_208_59
					end
				end

				arg_205_1.text_.text = var_208_64
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221048", "story_v_out_417221.awb") ~= 0 then
					local var_208_68 = manager.audio:GetVoiceLength("story_v_out_417221", "417221048", "story_v_out_417221.awb") / 1000

					if var_208_68 + var_208_59 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_68 + var_208_59
					end

					if var_208_63.prefab_name ~= "" and arg_205_1.actors_[var_208_63.prefab_name] ~= nil then
						local var_208_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_63.prefab_name].transform, "story_v_out_417221", "417221048", "story_v_out_417221.awb")

						arg_205_1:RecordAudio("417221048", var_208_69)
						arg_205_1:RecordAudio("417221048", var_208_69)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_417221", "417221048", "story_v_out_417221.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_417221", "417221048", "story_v_out_417221.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_70 = var_208_59 + 0.3
			local var_208_71 = math.max(var_208_60, arg_205_1.talkMaxDuration)

			if var_208_70 <= arg_205_1.time_ and arg_205_1.time_ < var_208_70 + var_208_71 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_70) / var_208_71

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_70 + var_208_71 and arg_205_1.time_ < var_208_70 + var_208_71 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play417221049 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 417221049
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play417221050(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10113"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos10113 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("10113", 7)

				local var_214_2 = var_214_0.childCount

				for iter_214_0 = 0, var_214_2 - 1 do
					local var_214_3 = var_214_0:GetChild(iter_214_0)

					if var_214_3.name == "" or not string.find(var_214_3.name, "split") then
						var_214_3.gameObject:SetActive(true)
					else
						var_214_3.gameObject:SetActive(false)
					end
				end
			end

			local var_214_4 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_1) / var_214_4
				local var_214_6 = Vector3.New(0, -2000, 0)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10113, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_214_7 = 0.05
			local var_214_8 = 1

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 then
				local var_214_9 = "play"
				local var_214_10 = "effect"

				arg_211_1:AudioAction(var_214_9, var_214_10, "se_story_side_1084", "se_story_1084_applause", "")
			end

			local var_214_11 = 0
			local var_214_12 = 1.625

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_13 = arg_211_1:GetWordFromCfg(417221049)
				local var_214_14 = arg_211_1:FormatText(var_214_13.content)

				arg_211_1.text_.text = var_214_14

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_15 = 65
				local var_214_16 = utf8.len(var_214_14)
				local var_214_17 = var_214_15 <= 0 and var_214_12 or var_214_12 * (var_214_16 / var_214_15)

				if var_214_17 > 0 and var_214_12 < var_214_17 then
					arg_211_1.talkMaxDuration = var_214_17

					if var_214_17 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_17 + var_214_11
					end
				end

				arg_211_1.text_.text = var_214_14
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_18 = math.max(var_214_12, arg_211_1.talkMaxDuration)

			if var_214_11 <= arg_211_1.time_ and arg_211_1.time_ < var_214_11 + var_214_18 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_11) / var_214_18

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_11 + var_214_18 and arg_211_1.time_ < var_214_11 + var_214_18 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play417221050 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 417221050
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play417221051(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.55

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

				local var_218_2 = arg_215_1:GetWordFromCfg(417221050)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 62
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
	Play417221051 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 417221051
		arg_219_1.duration_ = 1.03

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play417221052(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.166666666666667

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[1149].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10110_split_2")

				arg_219_1.callingController_:SetSelectedState("normal")

				arg_219_1.keyicon_.color = Color.New(1, 1, 1)
				arg_219_1.icon_.color = Color.New(1, 1, 1)

				local var_222_3 = arg_219_1:GetWordFromCfg(417221051)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 2
				local var_222_6 = utf8.len(var_222_4)
				local var_222_7 = var_222_5 <= 0 and var_222_1 or var_222_1 * (var_222_6 / var_222_5)

				if var_222_7 > 0 and var_222_1 < var_222_7 then
					arg_219_1.talkMaxDuration = var_222_7

					if var_222_7 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_7 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_4
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221051", "story_v_out_417221.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221051", "story_v_out_417221.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_417221", "417221051", "story_v_out_417221.awb")

						arg_219_1:RecordAudio("417221051", var_222_9)
						arg_219_1:RecordAudio("417221051", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_417221", "417221051", "story_v_out_417221.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_417221", "417221051", "story_v_out_417221.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_10 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_10 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_10

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_10 and arg_219_1.time_ < var_222_0 + var_222_10 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play417221052 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 417221052
		arg_223_1.duration_ = 9.67

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play417221053(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10113"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and not isNil(var_226_0) and arg_223_1.var_.actorSpriteComps10113 == nil then
				arg_223_1.var_.actorSpriteComps10113 = var_226_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 and not isNil(var_226_0) then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.actorSpriteComps10113 then
					for iter_226_0, iter_226_1 in pairs(arg_223_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_226_1 then
							if arg_223_1.isInRecall_ then
								local var_226_4 = Mathf.Lerp(iter_226_1.color.r, arg_223_1.hightColor1.r, var_226_3)
								local var_226_5 = Mathf.Lerp(iter_226_1.color.g, arg_223_1.hightColor1.g, var_226_3)
								local var_226_6 = Mathf.Lerp(iter_226_1.color.b, arg_223_1.hightColor1.b, var_226_3)

								iter_226_1.color = Color.New(var_226_4, var_226_5, var_226_6)
							else
								local var_226_7 = Mathf.Lerp(iter_226_1.color.r, 1, var_226_3)

								iter_226_1.color = Color.New(var_226_7, var_226_7, var_226_7)
							end
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and not isNil(var_226_0) and arg_223_1.var_.actorSpriteComps10113 then
				for iter_226_2, iter_226_3 in pairs(arg_223_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_226_3 then
						if arg_223_1.isInRecall_ then
							iter_226_3.color = arg_223_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_226_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_223_1.var_.actorSpriteComps10113 = nil
			end

			local var_226_8 = arg_223_1.actors_["10113"].transform
			local var_226_9 = 0

			if var_226_9 < arg_223_1.time_ and arg_223_1.time_ <= var_226_9 + arg_226_0 then
				arg_223_1.var_.moveOldPos10113 = var_226_8.localPosition
				var_226_8.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10113", 3)

				local var_226_10 = var_226_8.childCount

				for iter_226_4 = 0, var_226_10 - 1 do
					local var_226_11 = var_226_8:GetChild(iter_226_4)

					if var_226_11.name == "" or not string.find(var_226_11.name, "split") then
						var_226_11.gameObject:SetActive(true)
					else
						var_226_11.gameObject:SetActive(false)
					end
				end
			end

			local var_226_12 = 0.001

			if var_226_9 <= arg_223_1.time_ and arg_223_1.time_ < var_226_9 + var_226_12 then
				local var_226_13 = (arg_223_1.time_ - var_226_9) / var_226_12
				local var_226_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_226_8.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10113, var_226_14, var_226_13)
			end

			if arg_223_1.time_ >= var_226_9 + var_226_12 and arg_223_1.time_ < var_226_9 + var_226_12 + arg_226_0 then
				var_226_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_226_15 = 0
			local var_226_16 = 0.925

			if var_226_15 < arg_223_1.time_ and arg_223_1.time_ <= var_226_15 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_17 = arg_223_1:FormatText(StoryNameCfg[1117].name)

				arg_223_1.leftNameTxt_.text = var_226_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_18 = arg_223_1:GetWordFromCfg(417221052)
				local var_226_19 = arg_223_1:FormatText(var_226_18.content)

				arg_223_1.text_.text = var_226_19

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_20 = 37
				local var_226_21 = utf8.len(var_226_19)
				local var_226_22 = var_226_20 <= 0 and var_226_16 or var_226_16 * (var_226_21 / var_226_20)

				if var_226_22 > 0 and var_226_16 < var_226_22 then
					arg_223_1.talkMaxDuration = var_226_22

					if var_226_22 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_22 + var_226_15
					end
				end

				arg_223_1.text_.text = var_226_19
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221052", "story_v_out_417221.awb") ~= 0 then
					local var_226_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221052", "story_v_out_417221.awb") / 1000

					if var_226_23 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_23 + var_226_15
					end

					if var_226_18.prefab_name ~= "" and arg_223_1.actors_[var_226_18.prefab_name] ~= nil then
						local var_226_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_18.prefab_name].transform, "story_v_out_417221", "417221052", "story_v_out_417221.awb")

						arg_223_1:RecordAudio("417221052", var_226_24)
						arg_223_1:RecordAudio("417221052", var_226_24)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_417221", "417221052", "story_v_out_417221.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_417221", "417221052", "story_v_out_417221.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_25 = math.max(var_226_16, arg_223_1.talkMaxDuration)

			if var_226_15 <= arg_223_1.time_ and arg_223_1.time_ < var_226_15 + var_226_25 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_15) / var_226_25

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_15 + var_226_25 and arg_223_1.time_ < var_226_15 + var_226_25 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play417221053 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 417221053
		arg_227_1.duration_ = 5.67

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play417221054(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10113"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos10113 = var_230_0.localPosition
				var_230_0.localScale = Vector3.New(1, 1, 1)

				arg_227_1:CheckSpriteTmpPos("10113", 7)

				local var_230_2 = var_230_0.childCount

				for iter_230_0 = 0, var_230_2 - 1 do
					local var_230_3 = var_230_0:GetChild(iter_230_0)

					if var_230_3.name == "" or not string.find(var_230_3.name, "split") then
						var_230_3.gameObject:SetActive(true)
					else
						var_230_3.gameObject:SetActive(false)
					end
				end
			end

			local var_230_4 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_4 then
				local var_230_5 = (arg_227_1.time_ - var_230_1) / var_230_4
				local var_230_6 = Vector3.New(0, -2000, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10113, var_230_6, var_230_5)
			end

			if arg_227_1.time_ >= var_230_1 + var_230_4 and arg_227_1.time_ < var_230_1 + var_230_4 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_230_7 = 0
			local var_230_8 = 0.65

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_9 = arg_227_1:FormatText(StoryNameCfg[1150].name)

				arg_227_1.leftNameTxt_.text = var_230_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, true)
				arg_227_1.iconController_:SetSelectedState("hero")

				arg_227_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_227_1.callingController_:SetSelectedState("normal")

				arg_227_1.keyicon_.color = Color.New(1, 1, 1)
				arg_227_1.icon_.color = Color.New(1, 1, 1)

				local var_230_10 = arg_227_1:GetWordFromCfg(417221053)
				local var_230_11 = arg_227_1:FormatText(var_230_10.content)

				arg_227_1.text_.text = var_230_11

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_12 = 26
				local var_230_13 = utf8.len(var_230_11)
				local var_230_14 = var_230_12 <= 0 and var_230_8 or var_230_8 * (var_230_13 / var_230_12)

				if var_230_14 > 0 and var_230_8 < var_230_14 then
					arg_227_1.talkMaxDuration = var_230_14

					if var_230_14 + var_230_7 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_7
					end
				end

				arg_227_1.text_.text = var_230_11
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221053", "story_v_out_417221.awb") ~= 0 then
					local var_230_15 = manager.audio:GetVoiceLength("story_v_out_417221", "417221053", "story_v_out_417221.awb") / 1000

					if var_230_15 + var_230_7 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_15 + var_230_7
					end

					if var_230_10.prefab_name ~= "" and arg_227_1.actors_[var_230_10.prefab_name] ~= nil then
						local var_230_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_10.prefab_name].transform, "story_v_out_417221", "417221053", "story_v_out_417221.awb")

						arg_227_1:RecordAudio("417221053", var_230_16)
						arg_227_1:RecordAudio("417221053", var_230_16)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_417221", "417221053", "story_v_out_417221.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_417221", "417221053", "story_v_out_417221.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_17 = math.max(var_230_8, arg_227_1.talkMaxDuration)

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_17 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_7) / var_230_17

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_7 + var_230_17 and arg_227_1.time_ < var_230_7 + var_230_17 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play417221054 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 417221054
		arg_231_1.duration_ = 1.2

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play417221055(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.2

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[1150].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, true)
				arg_231_1.iconController_:SetSelectedState("hero")

				arg_231_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_231_1.callingController_:SetSelectedState("normal")

				arg_231_1.keyicon_.color = Color.New(1, 1, 1)
				arg_231_1.icon_.color = Color.New(1, 1, 1)

				local var_234_3 = arg_231_1:GetWordFromCfg(417221054)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 4
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221054", "story_v_out_417221.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221054", "story_v_out_417221.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_417221", "417221054", "story_v_out_417221.awb")

						arg_231_1:RecordAudio("417221054", var_234_9)
						arg_231_1:RecordAudio("417221054", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_417221", "417221054", "story_v_out_417221.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_417221", "417221054", "story_v_out_417221.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play417221055 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 417221055
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play417221056(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.9

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_2 = arg_235_1:GetWordFromCfg(417221055)
				local var_238_3 = arg_235_1:FormatText(var_238_2.content)

				arg_235_1.text_.text = var_238_3

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_4 = 36
				local var_238_5 = utf8.len(var_238_3)
				local var_238_6 = var_238_4 <= 0 and var_238_1 or var_238_1 * (var_238_5 / var_238_4)

				if var_238_6 > 0 and var_238_1 < var_238_6 then
					arg_235_1.talkMaxDuration = var_238_6

					if var_238_6 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_6 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_3
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_7 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_7 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_7

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_7 and arg_235_1.time_ < var_238_0 + var_238_7 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play417221056 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 417221056
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play417221057(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 1.35
			local var_242_1 = 1

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				local var_242_2 = "play"
				local var_242_3 = "effect"

				arg_239_1:AudioAction(var_242_2, var_242_3, "se_story_1311", "se_story_1311_shoes", "")
			end

			local var_242_4 = 0
			local var_242_5 = 1.35

			if var_242_4 < arg_239_1.time_ and arg_239_1.time_ <= var_242_4 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_6 = arg_239_1:GetWordFromCfg(417221056)
				local var_242_7 = arg_239_1:FormatText(var_242_6.content)

				arg_239_1.text_.text = var_242_7

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_8 = 54
				local var_242_9 = utf8.len(var_242_7)
				local var_242_10 = var_242_8 <= 0 and var_242_5 or var_242_5 * (var_242_9 / var_242_8)

				if var_242_10 > 0 and var_242_5 < var_242_10 then
					arg_239_1.talkMaxDuration = var_242_10

					if var_242_10 + var_242_4 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_10 + var_242_4
					end
				end

				arg_239_1.text_.text = var_242_7
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_11 = math.max(var_242_5, arg_239_1.talkMaxDuration)

			if var_242_4 <= arg_239_1.time_ and arg_239_1.time_ < var_242_4 + var_242_11 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_4) / var_242_11

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_4 + var_242_11 and arg_239_1.time_ < var_242_4 + var_242_11 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play417221057 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 417221057
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play417221058(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 1.1
			local var_246_1 = 1

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				local var_246_2 = "play"
				local var_246_3 = "effect"

				arg_243_1:AudioAction(var_246_2, var_246_3, "se_story_11", "se_story_11_microphone", "")
			end

			local var_246_4 = 0
			local var_246_5 = 1.275

			if var_246_4 < arg_243_1.time_ and arg_243_1.time_ <= var_246_4 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_6 = arg_243_1:GetWordFromCfg(417221057)
				local var_246_7 = arg_243_1:FormatText(var_246_6.content)

				arg_243_1.text_.text = var_246_7

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_8 = 51
				local var_246_9 = utf8.len(var_246_7)
				local var_246_10 = var_246_8 <= 0 and var_246_5 or var_246_5 * (var_246_9 / var_246_8)

				if var_246_10 > 0 and var_246_5 < var_246_10 then
					arg_243_1.talkMaxDuration = var_246_10

					if var_246_10 + var_246_4 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_10 + var_246_4
					end
				end

				arg_243_1.text_.text = var_246_7
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_11 = math.max(var_246_5, arg_243_1.talkMaxDuration)

			if var_246_4 <= arg_243_1.time_ and arg_243_1.time_ < var_246_4 + var_246_11 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_4) / var_246_11

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_4 + var_246_11 and arg_243_1.time_ < var_246_4 + var_246_11 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play417221058 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 417221058
		arg_247_1.duration_ = 9.37

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play417221059(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10113"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and not isNil(var_250_0) and arg_247_1.var_.actorSpriteComps10113 == nil then
				arg_247_1.var_.actorSpriteComps10113 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 and not isNil(var_250_0) then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps10113 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_250_1 then
							if arg_247_1.isInRecall_ then
								local var_250_4 = Mathf.Lerp(iter_250_1.color.r, arg_247_1.hightColor1.r, var_250_3)
								local var_250_5 = Mathf.Lerp(iter_250_1.color.g, arg_247_1.hightColor1.g, var_250_3)
								local var_250_6 = Mathf.Lerp(iter_250_1.color.b, arg_247_1.hightColor1.b, var_250_3)

								iter_250_1.color = Color.New(var_250_4, var_250_5, var_250_6)
							else
								local var_250_7 = Mathf.Lerp(iter_250_1.color.r, 1, var_250_3)

								iter_250_1.color = Color.New(var_250_7, var_250_7, var_250_7)
							end
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and not isNil(var_250_0) and arg_247_1.var_.actorSpriteComps10113 then
				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_250_3 then
						if arg_247_1.isInRecall_ then
							iter_250_3.color = arg_247_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_250_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_247_1.var_.actorSpriteComps10113 = nil
			end

			local var_250_8 = arg_247_1.actors_["10113"].transform
			local var_250_9 = 0

			if var_250_9 < arg_247_1.time_ and arg_247_1.time_ <= var_250_9 + arg_250_0 then
				arg_247_1.var_.moveOldPos10113 = var_250_8.localPosition
				var_250_8.localScale = Vector3.New(1, 1, 1)

				arg_247_1:CheckSpriteTmpPos("10113", 3)

				local var_250_10 = var_250_8.childCount

				for iter_250_4 = 0, var_250_10 - 1 do
					local var_250_11 = var_250_8:GetChild(iter_250_4)

					if var_250_11.name == "" or not string.find(var_250_11.name, "split") then
						var_250_11.gameObject:SetActive(true)
					else
						var_250_11.gameObject:SetActive(false)
					end
				end
			end

			local var_250_12 = 0.001

			if var_250_9 <= arg_247_1.time_ and arg_247_1.time_ < var_250_9 + var_250_12 then
				local var_250_13 = (arg_247_1.time_ - var_250_9) / var_250_12
				local var_250_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_250_8.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos10113, var_250_14, var_250_13)
			end

			if arg_247_1.time_ >= var_250_9 + var_250_12 and arg_247_1.time_ < var_250_9 + var_250_12 + arg_250_0 then
				var_250_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_250_15 = 0
			local var_250_16 = 0.875

			if var_250_15 < arg_247_1.time_ and arg_247_1.time_ <= var_250_15 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_17 = arg_247_1:FormatText(StoryNameCfg[1117].name)

				arg_247_1.leftNameTxt_.text = var_250_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_18 = arg_247_1:GetWordFromCfg(417221058)
				local var_250_19 = arg_247_1:FormatText(var_250_18.content)

				arg_247_1.text_.text = var_250_19

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_20 = 35
				local var_250_21 = utf8.len(var_250_19)
				local var_250_22 = var_250_20 <= 0 and var_250_16 or var_250_16 * (var_250_21 / var_250_20)

				if var_250_22 > 0 and var_250_16 < var_250_22 then
					arg_247_1.talkMaxDuration = var_250_22

					if var_250_22 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_22 + var_250_15
					end
				end

				arg_247_1.text_.text = var_250_19
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221058", "story_v_out_417221.awb") ~= 0 then
					local var_250_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221058", "story_v_out_417221.awb") / 1000

					if var_250_23 + var_250_15 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_23 + var_250_15
					end

					if var_250_18.prefab_name ~= "" and arg_247_1.actors_[var_250_18.prefab_name] ~= nil then
						local var_250_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_18.prefab_name].transform, "story_v_out_417221", "417221058", "story_v_out_417221.awb")

						arg_247_1:RecordAudio("417221058", var_250_24)
						arg_247_1:RecordAudio("417221058", var_250_24)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_417221", "417221058", "story_v_out_417221.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_417221", "417221058", "story_v_out_417221.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_25 = math.max(var_250_16, arg_247_1.talkMaxDuration)

			if var_250_15 <= arg_247_1.time_ and arg_247_1.time_ < var_250_15 + var_250_25 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_15) / var_250_25

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_15 + var_250_25 and arg_247_1.time_ < var_250_15 + var_250_25 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play417221059 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 417221059
		arg_251_1.duration_ = 5.7

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play417221060(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10113"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and not isNil(var_254_0) and arg_251_1.var_.actorSpriteComps10113 == nil then
				arg_251_1.var_.actorSpriteComps10113 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 and not isNil(var_254_0) then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10113 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_254_1 then
							if arg_251_1.isInRecall_ then
								local var_254_4 = Mathf.Lerp(iter_254_1.color.r, arg_251_1.hightColor2.r, var_254_3)
								local var_254_5 = Mathf.Lerp(iter_254_1.color.g, arg_251_1.hightColor2.g, var_254_3)
								local var_254_6 = Mathf.Lerp(iter_254_1.color.b, arg_251_1.hightColor2.b, var_254_3)

								iter_254_1.color = Color.New(var_254_4, var_254_5, var_254_6)
							else
								local var_254_7 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

								iter_254_1.color = Color.New(var_254_7, var_254_7, var_254_7)
							end
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and not isNil(var_254_0) and arg_251_1.var_.actorSpriteComps10113 then
				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_254_3 then
						if arg_251_1.isInRecall_ then
							iter_254_3.color = arg_251_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_254_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_251_1.var_.actorSpriteComps10113 = nil
			end

			local var_254_8 = 0
			local var_254_9 = 0.7

			if var_254_8 < arg_251_1.time_ and arg_251_1.time_ <= var_254_8 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_10 = arg_251_1:FormatText(StoryNameCfg[1150].name)

				arg_251_1.leftNameTxt_.text = var_254_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_251_1.callingController_:SetSelectedState("normal")

				arg_251_1.keyicon_.color = Color.New(1, 1, 1)
				arg_251_1.icon_.color = Color.New(1, 1, 1)

				local var_254_11 = arg_251_1:GetWordFromCfg(417221059)
				local var_254_12 = arg_251_1:FormatText(var_254_11.content)

				arg_251_1.text_.text = var_254_12

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_13 = 28
				local var_254_14 = utf8.len(var_254_12)
				local var_254_15 = var_254_13 <= 0 and var_254_9 or var_254_9 * (var_254_14 / var_254_13)

				if var_254_15 > 0 and var_254_9 < var_254_15 then
					arg_251_1.talkMaxDuration = var_254_15

					if var_254_15 + var_254_8 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_15 + var_254_8
					end
				end

				arg_251_1.text_.text = var_254_12
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221059", "story_v_out_417221.awb") ~= 0 then
					local var_254_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221059", "story_v_out_417221.awb") / 1000

					if var_254_16 + var_254_8 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_16 + var_254_8
					end

					if var_254_11.prefab_name ~= "" and arg_251_1.actors_[var_254_11.prefab_name] ~= nil then
						local var_254_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_11.prefab_name].transform, "story_v_out_417221", "417221059", "story_v_out_417221.awb")

						arg_251_1:RecordAudio("417221059", var_254_17)
						arg_251_1:RecordAudio("417221059", var_254_17)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_417221", "417221059", "story_v_out_417221.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_417221", "417221059", "story_v_out_417221.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_18 = math.max(var_254_9, arg_251_1.talkMaxDuration)

			if var_254_8 <= arg_251_1.time_ and arg_251_1.time_ < var_254_8 + var_254_18 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_8) / var_254_18

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_8 + var_254_18 and arg_251_1.time_ < var_254_8 + var_254_18 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play417221060 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 417221060
		arg_255_1.duration_ = 7.47

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play417221061(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10113"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and not isNil(var_258_0) and arg_255_1.var_.actorSpriteComps10113 == nil then
				arg_255_1.var_.actorSpriteComps10113 = var_258_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_2 = 0.2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 and not isNil(var_258_0) then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.actorSpriteComps10113 then
					for iter_258_0, iter_258_1 in pairs(arg_255_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_258_1 then
							if arg_255_1.isInRecall_ then
								local var_258_4 = Mathf.Lerp(iter_258_1.color.r, arg_255_1.hightColor1.r, var_258_3)
								local var_258_5 = Mathf.Lerp(iter_258_1.color.g, arg_255_1.hightColor1.g, var_258_3)
								local var_258_6 = Mathf.Lerp(iter_258_1.color.b, arg_255_1.hightColor1.b, var_258_3)

								iter_258_1.color = Color.New(var_258_4, var_258_5, var_258_6)
							else
								local var_258_7 = Mathf.Lerp(iter_258_1.color.r, 1, var_258_3)

								iter_258_1.color = Color.New(var_258_7, var_258_7, var_258_7)
							end
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and not isNil(var_258_0) and arg_255_1.var_.actorSpriteComps10113 then
				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_258_3 then
						if arg_255_1.isInRecall_ then
							iter_258_3.color = arg_255_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_258_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_255_1.var_.actorSpriteComps10113 = nil
			end

			local var_258_8 = 0
			local var_258_9 = 0.525

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_10 = arg_255_1:FormatText(StoryNameCfg[1117].name)

				arg_255_1.leftNameTxt_.text = var_258_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_11 = arg_255_1:GetWordFromCfg(417221060)
				local var_258_12 = arg_255_1:FormatText(var_258_11.content)

				arg_255_1.text_.text = var_258_12

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_13 = 21
				local var_258_14 = utf8.len(var_258_12)
				local var_258_15 = var_258_13 <= 0 and var_258_9 or var_258_9 * (var_258_14 / var_258_13)

				if var_258_15 > 0 and var_258_9 < var_258_15 then
					arg_255_1.talkMaxDuration = var_258_15

					if var_258_15 + var_258_8 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_15 + var_258_8
					end
				end

				arg_255_1.text_.text = var_258_12
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221060", "story_v_out_417221.awb") ~= 0 then
					local var_258_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221060", "story_v_out_417221.awb") / 1000

					if var_258_16 + var_258_8 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_16 + var_258_8
					end

					if var_258_11.prefab_name ~= "" and arg_255_1.actors_[var_258_11.prefab_name] ~= nil then
						local var_258_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_11.prefab_name].transform, "story_v_out_417221", "417221060", "story_v_out_417221.awb")

						arg_255_1:RecordAudio("417221060", var_258_17)
						arg_255_1:RecordAudio("417221060", var_258_17)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_417221", "417221060", "story_v_out_417221.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_417221", "417221060", "story_v_out_417221.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_18 = math.max(var_258_9, arg_255_1.talkMaxDuration)

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_18 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_8) / var_258_18

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_8 + var_258_18 and arg_255_1.time_ < var_258_8 + var_258_18 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play417221061 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 417221061
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play417221062(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10113"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10113 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10113", 7)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(0, -2000, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10113, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_262_7 = 0
			local var_262_8 = 1.5

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

				local var_262_9 = arg_259_1:GetWordFromCfg(417221061)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 60
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
	Play417221062 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 417221062
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play417221063(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.6

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_2 = arg_263_1:GetWordFromCfg(417221062)
				local var_266_3 = arg_263_1:FormatText(var_266_2.content)

				arg_263_1.text_.text = var_266_3

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_4 = 24
				local var_266_5 = utf8.len(var_266_3)
				local var_266_6 = var_266_4 <= 0 and var_266_1 or var_266_1 * (var_266_5 / var_266_4)

				if var_266_6 > 0 and var_266_1 < var_266_6 then
					arg_263_1.talkMaxDuration = var_266_6

					if var_266_6 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_6 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_3
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_7 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_7 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_7

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_7 and arg_263_1.time_ < var_266_0 + var_266_7 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play417221063 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 417221063
		arg_267_1.duration_ = 3.87

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play417221064(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 2

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.allBtn_.enabled = false
			end

			local var_270_1 = 0.0666666666666669

			if arg_267_1.time_ >= var_270_0 + var_270_1 and arg_267_1.time_ < var_270_0 + var_270_1 + arg_270_0 then
				arg_267_1.allBtn_.enabled = true
			end

			local var_270_2 = "I07a"

			if arg_267_1.bgs_[var_270_2] == nil then
				local var_270_3 = Object.Instantiate(arg_267_1.paintGo_)

				var_270_3:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_270_2)
				var_270_3.name = var_270_2
				var_270_3.transform.parent = arg_267_1.stage_.transform
				var_270_3.transform.localPosition = Vector3.New(0, 100, 0)
				arg_267_1.bgs_[var_270_2] = var_270_3
			end

			local var_270_4 = 1

			if var_270_4 < arg_267_1.time_ and arg_267_1.time_ <= var_270_4 + arg_270_0 then
				local var_270_5 = manager.ui.mainCamera.transform.localPosition
				local var_270_6 = Vector3.New(0, 0, 10) + Vector3.New(var_270_5.x, var_270_5.y, 0)
				local var_270_7 = arg_267_1.bgs_.I07a

				var_270_7.transform.localPosition = var_270_6
				var_270_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_270_8 = var_270_7:GetComponent("SpriteRenderer")

				if var_270_8 and var_270_8.sprite then
					local var_270_9 = (var_270_7.transform.localPosition - var_270_5).z
					local var_270_10 = manager.ui.mainCameraCom_
					local var_270_11 = 2 * var_270_9 * Mathf.Tan(var_270_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_270_12 = var_270_11 * var_270_10.aspect
					local var_270_13 = var_270_8.sprite.bounds.size.x
					local var_270_14 = var_270_8.sprite.bounds.size.y
					local var_270_15 = var_270_12 / var_270_13
					local var_270_16 = var_270_11 / var_270_14
					local var_270_17 = var_270_16 < var_270_15 and var_270_15 or var_270_16

					var_270_7.transform.localScale = Vector3.New(var_270_17, var_270_17, 0)
				end

				for iter_270_0, iter_270_1 in pairs(arg_267_1.bgs_) do
					if iter_270_0 ~= "I07a" then
						iter_270_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_270_18 = 0

			if var_270_18 < arg_267_1.time_ and arg_267_1.time_ <= var_270_18 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_19 = 1

			if var_270_18 <= arg_267_1.time_ and arg_267_1.time_ < var_270_18 + var_270_19 then
				local var_270_20 = (arg_267_1.time_ - var_270_18) / var_270_19
				local var_270_21 = Color.New(0, 0, 0)

				var_270_21.a = Mathf.Lerp(0, 1, var_270_20)
				arg_267_1.mask_.color = var_270_21
			end

			if arg_267_1.time_ >= var_270_18 + var_270_19 and arg_267_1.time_ < var_270_18 + var_270_19 + arg_270_0 then
				local var_270_22 = Color.New(0, 0, 0)

				var_270_22.a = 1
				arg_267_1.mask_.color = var_270_22
			end

			local var_270_23 = 1

			if var_270_23 < arg_267_1.time_ and arg_267_1.time_ <= var_270_23 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_24 = 1

			if var_270_23 <= arg_267_1.time_ and arg_267_1.time_ < var_270_23 + var_270_24 then
				local var_270_25 = (arg_267_1.time_ - var_270_23) / var_270_24
				local var_270_26 = Color.New(0, 0, 0)

				var_270_26.a = Mathf.Lerp(1, 0, var_270_25)
				arg_267_1.mask_.color = var_270_26
			end

			if arg_267_1.time_ >= var_270_23 + var_270_24 and arg_267_1.time_ < var_270_23 + var_270_24 + arg_270_0 then
				local var_270_27 = Color.New(0, 0, 0)
				local var_270_28 = 0

				arg_267_1.mask_.enabled = false
				var_270_27.a = var_270_28
				arg_267_1.mask_.color = var_270_27
			end

			local var_270_29 = 0.05
			local var_270_30 = 1

			if var_270_29 < arg_267_1.time_ and arg_267_1.time_ <= var_270_29 + arg_270_0 then
				local var_270_31 = "stop"
				local var_270_32 = "effect"

				arg_267_1:AudioAction(var_270_31, var_270_32, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			if arg_267_1.frameCnt_ <= 1 then
				arg_267_1.dialog_:SetActive(false)
			end

			local var_270_33 = 2
			local var_270_34 = 0.15

			if var_270_33 < arg_267_1.time_ and arg_267_1.time_ <= var_270_33 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				arg_267_1.dialog_:SetActive(true)

				local var_270_35 = LeanTween.value(arg_267_1.dialog_, 0, 1, 0.3)

				var_270_35:setOnUpdate(LuaHelper.FloatAction(function(arg_271_0)
					arg_267_1.dialogCg_.alpha = arg_271_0
				end))
				var_270_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_267_1.dialog_)
					var_270_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_267_1.duration_ = arg_267_1.duration_ + 0.3

				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_36 = arg_267_1:FormatText(StoryNameCfg[1135].name)

				arg_267_1.leftNameTxt_.text = var_270_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, true)
				arg_267_1.iconController_:SetSelectedState("hero")

				arg_267_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_267_1.callingController_:SetSelectedState("normal")

				arg_267_1.keyicon_.color = Color.New(1, 1, 1)
				arg_267_1.icon_.color = Color.New(1, 1, 1)

				local var_270_37 = arg_267_1:GetWordFromCfg(417221063)
				local var_270_38 = arg_267_1:FormatText(var_270_37.content)

				arg_267_1.text_.text = var_270_38

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_39 = 6
				local var_270_40 = utf8.len(var_270_38)
				local var_270_41 = var_270_39 <= 0 and var_270_34 or var_270_34 * (var_270_40 / var_270_39)

				if var_270_41 > 0 and var_270_34 < var_270_41 then
					arg_267_1.talkMaxDuration = var_270_41
					var_270_33 = var_270_33 + 0.3

					if var_270_41 + var_270_33 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_41 + var_270_33
					end
				end

				arg_267_1.text_.text = var_270_38
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221063", "story_v_out_417221.awb") ~= 0 then
					local var_270_42 = manager.audio:GetVoiceLength("story_v_out_417221", "417221063", "story_v_out_417221.awb") / 1000

					if var_270_42 + var_270_33 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_42 + var_270_33
					end

					if var_270_37.prefab_name ~= "" and arg_267_1.actors_[var_270_37.prefab_name] ~= nil then
						local var_270_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_37.prefab_name].transform, "story_v_out_417221", "417221063", "story_v_out_417221.awb")

						arg_267_1:RecordAudio("417221063", var_270_43)
						arg_267_1:RecordAudio("417221063", var_270_43)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_417221", "417221063", "story_v_out_417221.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_417221", "417221063", "story_v_out_417221.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_44 = var_270_33 + 0.3
			local var_270_45 = math.max(var_270_34, arg_267_1.talkMaxDuration)

			if var_270_44 <= arg_267_1.time_ and arg_267_1.time_ < var_270_44 + var_270_45 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_44) / var_270_45

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_44 + var_270_45 and arg_267_1.time_ < var_270_44 + var_270_45 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play417221064 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 417221064
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play417221065(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.4

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(417221064)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 56
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play417221065 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 417221065
		arg_277_1.duration_ = 3.5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play417221066(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = "10128"

			if arg_277_1.actors_[var_280_0] == nil then
				local var_280_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10128")

				if not isNil(var_280_1) then
					local var_280_2 = Object.Instantiate(var_280_1, arg_277_1.canvasGo_.transform)

					var_280_2.transform:SetSiblingIndex(1)

					var_280_2.name = var_280_0
					var_280_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_277_1.actors_[var_280_0] = var_280_2

					local var_280_3 = var_280_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_277_1.isInRecall_ then
						for iter_280_0, iter_280_1 in ipairs(var_280_3) do
							iter_280_1.color = arg_277_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_280_4 = arg_277_1.actors_["10128"]
			local var_280_5 = 0

			if var_280_5 < arg_277_1.time_ and arg_277_1.time_ <= var_280_5 + arg_280_0 and not isNil(var_280_4) and arg_277_1.var_.actorSpriteComps10128 == nil then
				arg_277_1.var_.actorSpriteComps10128 = var_280_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_280_6 = 0.2

			if var_280_5 <= arg_277_1.time_ and arg_277_1.time_ < var_280_5 + var_280_6 and not isNil(var_280_4) then
				local var_280_7 = (arg_277_1.time_ - var_280_5) / var_280_6

				if arg_277_1.var_.actorSpriteComps10128 then
					for iter_280_2, iter_280_3 in pairs(arg_277_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_280_3 then
							if arg_277_1.isInRecall_ then
								local var_280_8 = Mathf.Lerp(iter_280_3.color.r, arg_277_1.hightColor1.r, var_280_7)
								local var_280_9 = Mathf.Lerp(iter_280_3.color.g, arg_277_1.hightColor1.g, var_280_7)
								local var_280_10 = Mathf.Lerp(iter_280_3.color.b, arg_277_1.hightColor1.b, var_280_7)

								iter_280_3.color = Color.New(var_280_8, var_280_9, var_280_10)
							else
								local var_280_11 = Mathf.Lerp(iter_280_3.color.r, 1, var_280_7)

								iter_280_3.color = Color.New(var_280_11, var_280_11, var_280_11)
							end
						end
					end
				end
			end

			if arg_277_1.time_ >= var_280_5 + var_280_6 and arg_277_1.time_ < var_280_5 + var_280_6 + arg_280_0 and not isNil(var_280_4) and arg_277_1.var_.actorSpriteComps10128 then
				for iter_280_4, iter_280_5 in pairs(arg_277_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_280_5 then
						if arg_277_1.isInRecall_ then
							iter_280_5.color = arg_277_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_280_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_277_1.var_.actorSpriteComps10128 = nil
			end

			local var_280_12 = arg_277_1.actors_["10128"].transform
			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1.var_.moveOldPos10128 = var_280_12.localPosition
				var_280_12.localScale = Vector3.New(1, 1, 1)

				arg_277_1:CheckSpriteTmpPos("10128", 3)

				local var_280_14 = var_280_12.childCount

				for iter_280_6 = 0, var_280_14 - 1 do
					local var_280_15 = var_280_12:GetChild(iter_280_6)

					if var_280_15.name == "" or not string.find(var_280_15.name, "split") then
						var_280_15.gameObject:SetActive(true)
					else
						var_280_15.gameObject:SetActive(false)
					end
				end
			end

			local var_280_16 = 0.001

			if var_280_13 <= arg_277_1.time_ and arg_277_1.time_ < var_280_13 + var_280_16 then
				local var_280_17 = (arg_277_1.time_ - var_280_13) / var_280_16
				local var_280_18 = Vector3.New(0, -347, -300)

				var_280_12.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10128, var_280_18, var_280_17)
			end

			if arg_277_1.time_ >= var_280_13 + var_280_16 and arg_277_1.time_ < var_280_13 + var_280_16 + arg_280_0 then
				var_280_12.localPosition = Vector3.New(0, -347, -300)
			end

			local var_280_19 = 0
			local var_280_20 = 0.35

			if var_280_19 < arg_277_1.time_ and arg_277_1.time_ <= var_280_19 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_21 = arg_277_1:FormatText(StoryNameCfg[595].name)

				arg_277_1.leftNameTxt_.text = var_280_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_22 = arg_277_1:GetWordFromCfg(417221065)
				local var_280_23 = arg_277_1:FormatText(var_280_22.content)

				arg_277_1.text_.text = var_280_23

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_24 = 14
				local var_280_25 = utf8.len(var_280_23)
				local var_280_26 = var_280_24 <= 0 and var_280_20 or var_280_20 * (var_280_25 / var_280_24)

				if var_280_26 > 0 and var_280_20 < var_280_26 then
					arg_277_1.talkMaxDuration = var_280_26

					if var_280_26 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_26 + var_280_19
					end
				end

				arg_277_1.text_.text = var_280_23
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221065", "story_v_out_417221.awb") ~= 0 then
					local var_280_27 = manager.audio:GetVoiceLength("story_v_out_417221", "417221065", "story_v_out_417221.awb") / 1000

					if var_280_27 + var_280_19 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_27 + var_280_19
					end

					if var_280_22.prefab_name ~= "" and arg_277_1.actors_[var_280_22.prefab_name] ~= nil then
						local var_280_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_22.prefab_name].transform, "story_v_out_417221", "417221065", "story_v_out_417221.awb")

						arg_277_1:RecordAudio("417221065", var_280_28)
						arg_277_1:RecordAudio("417221065", var_280_28)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_417221", "417221065", "story_v_out_417221.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_417221", "417221065", "story_v_out_417221.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_29 = math.max(var_280_20, arg_277_1.talkMaxDuration)

			if var_280_19 <= arg_277_1.time_ and arg_277_1.time_ < var_280_19 + var_280_29 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_19) / var_280_29

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_19 + var_280_29 and arg_277_1.time_ < var_280_19 + var_280_29 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play417221066 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 417221066
		arg_281_1.duration_ = 2.97

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play417221067(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.35

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[595].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(417221066)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 14
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221066", "story_v_out_417221.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221066", "story_v_out_417221.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_417221", "417221066", "story_v_out_417221.awb")

						arg_281_1:RecordAudio("417221066", var_284_9)
						arg_281_1:RecordAudio("417221066", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_417221", "417221066", "story_v_out_417221.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_417221", "417221066", "story_v_out_417221.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play417221067 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 417221067
		arg_285_1.duration_ = 6.2

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play417221068(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["10128"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.actorSpriteComps10128 == nil then
				arg_285_1.var_.actorSpriteComps10128 = var_288_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_2 = 0.2

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 and not isNil(var_288_0) then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.actorSpriteComps10128 then
					for iter_288_0, iter_288_1 in pairs(arg_285_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_288_1 then
							if arg_285_1.isInRecall_ then
								local var_288_4 = Mathf.Lerp(iter_288_1.color.r, arg_285_1.hightColor2.r, var_288_3)
								local var_288_5 = Mathf.Lerp(iter_288_1.color.g, arg_285_1.hightColor2.g, var_288_3)
								local var_288_6 = Mathf.Lerp(iter_288_1.color.b, arg_285_1.hightColor2.b, var_288_3)

								iter_288_1.color = Color.New(var_288_4, var_288_5, var_288_6)
							else
								local var_288_7 = Mathf.Lerp(iter_288_1.color.r, 0.5, var_288_3)

								iter_288_1.color = Color.New(var_288_7, var_288_7, var_288_7)
							end
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.actorSpriteComps10128 then
				for iter_288_2, iter_288_3 in pairs(arg_285_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_288_3 then
						if arg_285_1.isInRecall_ then
							iter_288_3.color = arg_285_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_288_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_285_1.var_.actorSpriteComps10128 = nil
			end

			local var_288_8 = 0
			local var_288_9 = 0.825

			if var_288_8 < arg_285_1.time_ and arg_285_1.time_ <= var_288_8 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_10 = arg_285_1:FormatText(StoryNameCfg[1135].name)

				arg_285_1.leftNameTxt_.text = var_288_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_285_1.callingController_:SetSelectedState("normal")

				arg_285_1.keyicon_.color = Color.New(1, 1, 1)
				arg_285_1.icon_.color = Color.New(1, 1, 1)

				local var_288_11 = arg_285_1:GetWordFromCfg(417221067)
				local var_288_12 = arg_285_1:FormatText(var_288_11.content)

				arg_285_1.text_.text = var_288_12

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_13 = 33
				local var_288_14 = utf8.len(var_288_12)
				local var_288_15 = var_288_13 <= 0 and var_288_9 or var_288_9 * (var_288_14 / var_288_13)

				if var_288_15 > 0 and var_288_9 < var_288_15 then
					arg_285_1.talkMaxDuration = var_288_15

					if var_288_15 + var_288_8 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_15 + var_288_8
					end
				end

				arg_285_1.text_.text = var_288_12
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221067", "story_v_out_417221.awb") ~= 0 then
					local var_288_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221067", "story_v_out_417221.awb") / 1000

					if var_288_16 + var_288_8 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_16 + var_288_8
					end

					if var_288_11.prefab_name ~= "" and arg_285_1.actors_[var_288_11.prefab_name] ~= nil then
						local var_288_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_11.prefab_name].transform, "story_v_out_417221", "417221067", "story_v_out_417221.awb")

						arg_285_1:RecordAudio("417221067", var_288_17)
						arg_285_1:RecordAudio("417221067", var_288_17)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_417221", "417221067", "story_v_out_417221.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_417221", "417221067", "story_v_out_417221.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_18 = math.max(var_288_9, arg_285_1.talkMaxDuration)

			if var_288_8 <= arg_285_1.time_ and arg_285_1.time_ < var_288_8 + var_288_18 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_8) / var_288_18

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_8 + var_288_18 and arg_285_1.time_ < var_288_8 + var_288_18 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play417221068 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 417221068
		arg_289_1.duration_ = 3

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play417221069(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["10128"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and not isNil(var_292_0) and arg_289_1.var_.actorSpriteComps10128 == nil then
				arg_289_1.var_.actorSpriteComps10128 = var_292_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_2 = 0.2

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 and not isNil(var_292_0) then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.actorSpriteComps10128 then
					for iter_292_0, iter_292_1 in pairs(arg_289_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_292_1 then
							if arg_289_1.isInRecall_ then
								local var_292_4 = Mathf.Lerp(iter_292_1.color.r, arg_289_1.hightColor1.r, var_292_3)
								local var_292_5 = Mathf.Lerp(iter_292_1.color.g, arg_289_1.hightColor1.g, var_292_3)
								local var_292_6 = Mathf.Lerp(iter_292_1.color.b, arg_289_1.hightColor1.b, var_292_3)

								iter_292_1.color = Color.New(var_292_4, var_292_5, var_292_6)
							else
								local var_292_7 = Mathf.Lerp(iter_292_1.color.r, 1, var_292_3)

								iter_292_1.color = Color.New(var_292_7, var_292_7, var_292_7)
							end
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and not isNil(var_292_0) and arg_289_1.var_.actorSpriteComps10128 then
				for iter_292_2, iter_292_3 in pairs(arg_289_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_292_3 then
						if arg_289_1.isInRecall_ then
							iter_292_3.color = arg_289_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_292_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_289_1.var_.actorSpriteComps10128 = nil
			end

			local var_292_8 = 0
			local var_292_9 = 0.4

			if var_292_8 < arg_289_1.time_ and arg_289_1.time_ <= var_292_8 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_10 = arg_289_1:FormatText(StoryNameCfg[595].name)

				arg_289_1.leftNameTxt_.text = var_292_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_11 = arg_289_1:GetWordFromCfg(417221068)
				local var_292_12 = arg_289_1:FormatText(var_292_11.content)

				arg_289_1.text_.text = var_292_12

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_13 = 16
				local var_292_14 = utf8.len(var_292_12)
				local var_292_15 = var_292_13 <= 0 and var_292_9 or var_292_9 * (var_292_14 / var_292_13)

				if var_292_15 > 0 and var_292_9 < var_292_15 then
					arg_289_1.talkMaxDuration = var_292_15

					if var_292_15 + var_292_8 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_15 + var_292_8
					end
				end

				arg_289_1.text_.text = var_292_12
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221068", "story_v_out_417221.awb") ~= 0 then
					local var_292_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221068", "story_v_out_417221.awb") / 1000

					if var_292_16 + var_292_8 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_16 + var_292_8
					end

					if var_292_11.prefab_name ~= "" and arg_289_1.actors_[var_292_11.prefab_name] ~= nil then
						local var_292_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_11.prefab_name].transform, "story_v_out_417221", "417221068", "story_v_out_417221.awb")

						arg_289_1:RecordAudio("417221068", var_292_17)
						arg_289_1:RecordAudio("417221068", var_292_17)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_417221", "417221068", "story_v_out_417221.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_417221", "417221068", "story_v_out_417221.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_18 = math.max(var_292_9, arg_289_1.talkMaxDuration)

			if var_292_8 <= arg_289_1.time_ and arg_289_1.time_ < var_292_8 + var_292_18 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_8) / var_292_18

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_8 + var_292_18 and arg_289_1.time_ < var_292_8 + var_292_18 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play417221069 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 417221069
		arg_293_1.duration_ = 3.7

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play417221070(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10128"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and not isNil(var_296_0) and arg_293_1.var_.actorSpriteComps10128 == nil then
				arg_293_1.var_.actorSpriteComps10128 = var_296_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_2 = 0.2

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 and not isNil(var_296_0) then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.actorSpriteComps10128 then
					for iter_296_0, iter_296_1 in pairs(arg_293_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_296_1 then
							if arg_293_1.isInRecall_ then
								local var_296_4 = Mathf.Lerp(iter_296_1.color.r, arg_293_1.hightColor2.r, var_296_3)
								local var_296_5 = Mathf.Lerp(iter_296_1.color.g, arg_293_1.hightColor2.g, var_296_3)
								local var_296_6 = Mathf.Lerp(iter_296_1.color.b, arg_293_1.hightColor2.b, var_296_3)

								iter_296_1.color = Color.New(var_296_4, var_296_5, var_296_6)
							else
								local var_296_7 = Mathf.Lerp(iter_296_1.color.r, 0.5, var_296_3)

								iter_296_1.color = Color.New(var_296_7, var_296_7, var_296_7)
							end
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and not isNil(var_296_0) and arg_293_1.var_.actorSpriteComps10128 then
				for iter_296_2, iter_296_3 in pairs(arg_293_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_296_3 then
						if arg_293_1.isInRecall_ then
							iter_296_3.color = arg_293_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_296_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_293_1.var_.actorSpriteComps10128 = nil
			end

			local var_296_8 = 0
			local var_296_9 = 0.45

			if var_296_8 < arg_293_1.time_ and arg_293_1.time_ <= var_296_8 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_10 = arg_293_1:FormatText(StoryNameCfg[1135].name)

				arg_293_1.leftNameTxt_.text = var_296_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, true)
				arg_293_1.iconController_:SetSelectedState("hero")

				arg_293_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_293_1.callingController_:SetSelectedState("normal")

				arg_293_1.keyicon_.color = Color.New(1, 1, 1)
				arg_293_1.icon_.color = Color.New(1, 1, 1)

				local var_296_11 = arg_293_1:GetWordFromCfg(417221069)
				local var_296_12 = arg_293_1:FormatText(var_296_11.content)

				arg_293_1.text_.text = var_296_12

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_13 = 18
				local var_296_14 = utf8.len(var_296_12)
				local var_296_15 = var_296_13 <= 0 and var_296_9 or var_296_9 * (var_296_14 / var_296_13)

				if var_296_15 > 0 and var_296_9 < var_296_15 then
					arg_293_1.talkMaxDuration = var_296_15

					if var_296_15 + var_296_8 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_15 + var_296_8
					end
				end

				arg_293_1.text_.text = var_296_12
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221069", "story_v_out_417221.awb") ~= 0 then
					local var_296_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221069", "story_v_out_417221.awb") / 1000

					if var_296_16 + var_296_8 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_16 + var_296_8
					end

					if var_296_11.prefab_name ~= "" and arg_293_1.actors_[var_296_11.prefab_name] ~= nil then
						local var_296_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_11.prefab_name].transform, "story_v_out_417221", "417221069", "story_v_out_417221.awb")

						arg_293_1:RecordAudio("417221069", var_296_17)
						arg_293_1:RecordAudio("417221069", var_296_17)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_417221", "417221069", "story_v_out_417221.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_417221", "417221069", "story_v_out_417221.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_18 = math.max(var_296_9, arg_293_1.talkMaxDuration)

			if var_296_8 <= arg_293_1.time_ and arg_293_1.time_ < var_296_8 + var_296_18 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_8) / var_296_18

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_8 + var_296_18 and arg_293_1.time_ < var_296_8 + var_296_18 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play417221070 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 417221070
		arg_297_1.duration_ = 3.87

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play417221071(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["10128"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and not isNil(var_300_0) and arg_297_1.var_.actorSpriteComps10128 == nil then
				arg_297_1.var_.actorSpriteComps10128 = var_300_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_2 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 and not isNil(var_300_0) then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.actorSpriteComps10128 then
					for iter_300_0, iter_300_1 in pairs(arg_297_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_300_1 then
							if arg_297_1.isInRecall_ then
								local var_300_4 = Mathf.Lerp(iter_300_1.color.r, arg_297_1.hightColor1.r, var_300_3)
								local var_300_5 = Mathf.Lerp(iter_300_1.color.g, arg_297_1.hightColor1.g, var_300_3)
								local var_300_6 = Mathf.Lerp(iter_300_1.color.b, arg_297_1.hightColor1.b, var_300_3)

								iter_300_1.color = Color.New(var_300_4, var_300_5, var_300_6)
							else
								local var_300_7 = Mathf.Lerp(iter_300_1.color.r, 1, var_300_3)

								iter_300_1.color = Color.New(var_300_7, var_300_7, var_300_7)
							end
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and not isNil(var_300_0) and arg_297_1.var_.actorSpriteComps10128 then
				for iter_300_2, iter_300_3 in pairs(arg_297_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_300_3 then
						if arg_297_1.isInRecall_ then
							iter_300_3.color = arg_297_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_300_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_297_1.var_.actorSpriteComps10128 = nil
			end

			local var_300_8 = 0
			local var_300_9 = 0.575

			if var_300_8 < arg_297_1.time_ and arg_297_1.time_ <= var_300_8 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_10 = arg_297_1:FormatText(StoryNameCfg[595].name)

				arg_297_1.leftNameTxt_.text = var_300_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_11 = arg_297_1:GetWordFromCfg(417221070)
				local var_300_12 = arg_297_1:FormatText(var_300_11.content)

				arg_297_1.text_.text = var_300_12

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_13 = 23
				local var_300_14 = utf8.len(var_300_12)
				local var_300_15 = var_300_13 <= 0 and var_300_9 or var_300_9 * (var_300_14 / var_300_13)

				if var_300_15 > 0 and var_300_9 < var_300_15 then
					arg_297_1.talkMaxDuration = var_300_15

					if var_300_15 + var_300_8 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_15 + var_300_8
					end
				end

				arg_297_1.text_.text = var_300_12
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221070", "story_v_out_417221.awb") ~= 0 then
					local var_300_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221070", "story_v_out_417221.awb") / 1000

					if var_300_16 + var_300_8 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_16 + var_300_8
					end

					if var_300_11.prefab_name ~= "" and arg_297_1.actors_[var_300_11.prefab_name] ~= nil then
						local var_300_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_11.prefab_name].transform, "story_v_out_417221", "417221070", "story_v_out_417221.awb")

						arg_297_1:RecordAudio("417221070", var_300_17)
						arg_297_1:RecordAudio("417221070", var_300_17)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_417221", "417221070", "story_v_out_417221.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_417221", "417221070", "story_v_out_417221.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_18 = math.max(var_300_9, arg_297_1.talkMaxDuration)

			if var_300_8 <= arg_297_1.time_ and arg_297_1.time_ < var_300_8 + var_300_18 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_8) / var_300_18

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_8 + var_300_18 and arg_297_1.time_ < var_300_8 + var_300_18 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play417221071 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 417221071
		arg_301_1.duration_ = 6.17

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play417221072(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["10128"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and not isNil(var_304_0) and arg_301_1.var_.actorSpriteComps10128 == nil then
				arg_301_1.var_.actorSpriteComps10128 = var_304_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_304_2 = 0.2

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 and not isNil(var_304_0) then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.actorSpriteComps10128 then
					for iter_304_0, iter_304_1 in pairs(arg_301_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_304_1 then
							if arg_301_1.isInRecall_ then
								local var_304_4 = Mathf.Lerp(iter_304_1.color.r, arg_301_1.hightColor2.r, var_304_3)
								local var_304_5 = Mathf.Lerp(iter_304_1.color.g, arg_301_1.hightColor2.g, var_304_3)
								local var_304_6 = Mathf.Lerp(iter_304_1.color.b, arg_301_1.hightColor2.b, var_304_3)

								iter_304_1.color = Color.New(var_304_4, var_304_5, var_304_6)
							else
								local var_304_7 = Mathf.Lerp(iter_304_1.color.r, 0.5, var_304_3)

								iter_304_1.color = Color.New(var_304_7, var_304_7, var_304_7)
							end
						end
					end
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and not isNil(var_304_0) and arg_301_1.var_.actorSpriteComps10128 then
				for iter_304_2, iter_304_3 in pairs(arg_301_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_304_3 then
						if arg_301_1.isInRecall_ then
							iter_304_3.color = arg_301_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_304_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_301_1.var_.actorSpriteComps10128 = nil
			end

			local var_304_8 = 0
			local var_304_9 = 0.85

			if var_304_8 < arg_301_1.time_ and arg_301_1.time_ <= var_304_8 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_10 = arg_301_1:FormatText(StoryNameCfg[1135].name)

				arg_301_1.leftNameTxt_.text = var_304_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, true)
				arg_301_1.iconController_:SetSelectedState("hero")

				arg_301_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_301_1.callingController_:SetSelectedState("normal")

				arg_301_1.keyicon_.color = Color.New(1, 1, 1)
				arg_301_1.icon_.color = Color.New(1, 1, 1)

				local var_304_11 = arg_301_1:GetWordFromCfg(417221071)
				local var_304_12 = arg_301_1:FormatText(var_304_11.content)

				arg_301_1.text_.text = var_304_12

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_13 = 34
				local var_304_14 = utf8.len(var_304_12)
				local var_304_15 = var_304_13 <= 0 and var_304_9 or var_304_9 * (var_304_14 / var_304_13)

				if var_304_15 > 0 and var_304_9 < var_304_15 then
					arg_301_1.talkMaxDuration = var_304_15

					if var_304_15 + var_304_8 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_15 + var_304_8
					end
				end

				arg_301_1.text_.text = var_304_12
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221071", "story_v_out_417221.awb") ~= 0 then
					local var_304_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221071", "story_v_out_417221.awb") / 1000

					if var_304_16 + var_304_8 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_16 + var_304_8
					end

					if var_304_11.prefab_name ~= "" and arg_301_1.actors_[var_304_11.prefab_name] ~= nil then
						local var_304_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_11.prefab_name].transform, "story_v_out_417221", "417221071", "story_v_out_417221.awb")

						arg_301_1:RecordAudio("417221071", var_304_17)
						arg_301_1:RecordAudio("417221071", var_304_17)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_417221", "417221071", "story_v_out_417221.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_417221", "417221071", "story_v_out_417221.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_18 = math.max(var_304_9, arg_301_1.talkMaxDuration)

			if var_304_8 <= arg_301_1.time_ and arg_301_1.time_ < var_304_8 + var_304_18 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_8) / var_304_18

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_8 + var_304_18 and arg_301_1.time_ < var_304_8 + var_304_18 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play417221072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 417221072
		arg_305_1.duration_ = 2.03

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play417221073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.225

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[1135].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, true)
				arg_305_1.iconController_:SetSelectedState("hero")

				arg_305_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_305_1.callingController_:SetSelectedState("normal")

				arg_305_1.keyicon_.color = Color.New(1, 1, 1)
				arg_305_1.icon_.color = Color.New(1, 1, 1)

				local var_308_3 = arg_305_1:GetWordFromCfg(417221072)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 9
				local var_308_6 = utf8.len(var_308_4)
				local var_308_7 = var_308_5 <= 0 and var_308_1 or var_308_1 * (var_308_6 / var_308_5)

				if var_308_7 > 0 and var_308_1 < var_308_7 then
					arg_305_1.talkMaxDuration = var_308_7

					if var_308_7 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_7 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_4
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221072", "story_v_out_417221.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221072", "story_v_out_417221.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_417221", "417221072", "story_v_out_417221.awb")

						arg_305_1:RecordAudio("417221072", var_308_9)
						arg_305_1:RecordAudio("417221072", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_417221", "417221072", "story_v_out_417221.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_417221", "417221072", "story_v_out_417221.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_10 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_10 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_10

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_10 and arg_305_1.time_ < var_308_0 + var_308_10 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play417221073 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 417221073
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play417221074(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["10128"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos10128 = var_312_0.localPosition
				var_312_0.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("10128", 7)

				local var_312_2 = var_312_0.childCount

				for iter_312_0 = 0, var_312_2 - 1 do
					local var_312_3 = var_312_0:GetChild(iter_312_0)

					if var_312_3.name == "" or not string.find(var_312_3.name, "split") then
						var_312_3.gameObject:SetActive(true)
					else
						var_312_3.gameObject:SetActive(false)
					end
				end
			end

			local var_312_4 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_4 then
				local var_312_5 = (arg_309_1.time_ - var_312_1) / var_312_4
				local var_312_6 = Vector3.New(0, -2000, -300)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10128, var_312_6, var_312_5)
			end

			if arg_309_1.time_ >= var_312_1 + var_312_4 and arg_309_1.time_ < var_312_1 + var_312_4 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -2000, -300)
			end

			local var_312_7 = 0.133333333333333
			local var_312_8 = 1

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 then
				local var_312_9 = "play"
				local var_312_10 = "effect"

				arg_309_1:AudioAction(var_312_9, var_312_10, "se_story_1310", "se_story_1310_handcuffs", "")
			end

			local var_312_11 = 0
			local var_312_12 = 0.925

			if var_312_11 < arg_309_1.time_ and arg_309_1.time_ <= var_312_11 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_13 = arg_309_1:GetWordFromCfg(417221073)
				local var_312_14 = arg_309_1:FormatText(var_312_13.content)

				arg_309_1.text_.text = var_312_14

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_15 = 37
				local var_312_16 = utf8.len(var_312_14)
				local var_312_17 = var_312_15 <= 0 and var_312_12 or var_312_12 * (var_312_16 / var_312_15)

				if var_312_17 > 0 and var_312_12 < var_312_17 then
					arg_309_1.talkMaxDuration = var_312_17

					if var_312_17 + var_312_11 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_17 + var_312_11
					end
				end

				arg_309_1.text_.text = var_312_14
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_18 = math.max(var_312_12, arg_309_1.talkMaxDuration)

			if var_312_11 <= arg_309_1.time_ and arg_309_1.time_ < var_312_11 + var_312_18 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_11) / var_312_18

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_11 + var_312_18 and arg_309_1.time_ < var_312_11 + var_312_18 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play417221074 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 417221074
		arg_313_1.duration_ = 7.93

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play417221075(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10128"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and not isNil(var_316_0) and arg_313_1.var_.actorSpriteComps10128 == nil then
				arg_313_1.var_.actorSpriteComps10128 = var_316_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 and not isNil(var_316_0) then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.actorSpriteComps10128 then
					for iter_316_0, iter_316_1 in pairs(arg_313_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_316_1 then
							if arg_313_1.isInRecall_ then
								local var_316_4 = Mathf.Lerp(iter_316_1.color.r, arg_313_1.hightColor1.r, var_316_3)
								local var_316_5 = Mathf.Lerp(iter_316_1.color.g, arg_313_1.hightColor1.g, var_316_3)
								local var_316_6 = Mathf.Lerp(iter_316_1.color.b, arg_313_1.hightColor1.b, var_316_3)

								iter_316_1.color = Color.New(var_316_4, var_316_5, var_316_6)
							else
								local var_316_7 = Mathf.Lerp(iter_316_1.color.r, 1, var_316_3)

								iter_316_1.color = Color.New(var_316_7, var_316_7, var_316_7)
							end
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and not isNil(var_316_0) and arg_313_1.var_.actorSpriteComps10128 then
				for iter_316_2, iter_316_3 in pairs(arg_313_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_316_3 then
						if arg_313_1.isInRecall_ then
							iter_316_3.color = arg_313_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_316_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_313_1.var_.actorSpriteComps10128 = nil
			end

			local var_316_8 = arg_313_1.actors_["10128"].transform
			local var_316_9 = 0

			if var_316_9 < arg_313_1.time_ and arg_313_1.time_ <= var_316_9 + arg_316_0 then
				arg_313_1.var_.moveOldPos10128 = var_316_8.localPosition
				var_316_8.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("10128", 3)

				local var_316_10 = var_316_8.childCount

				for iter_316_4 = 0, var_316_10 - 1 do
					local var_316_11 = var_316_8:GetChild(iter_316_4)

					if var_316_11.name == "split_6" or not string.find(var_316_11.name, "split") then
						var_316_11.gameObject:SetActive(true)
					else
						var_316_11.gameObject:SetActive(false)
					end
				end
			end

			local var_316_12 = 0.001

			if var_316_9 <= arg_313_1.time_ and arg_313_1.time_ < var_316_9 + var_316_12 then
				local var_316_13 = (arg_313_1.time_ - var_316_9) / var_316_12
				local var_316_14 = Vector3.New(0, -347, -300)

				var_316_8.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos10128, var_316_14, var_316_13)
			end

			if arg_313_1.time_ >= var_316_9 + var_316_12 and arg_313_1.time_ < var_316_9 + var_316_12 + arg_316_0 then
				var_316_8.localPosition = Vector3.New(0, -347, -300)
			end

			local var_316_15 = 0
			local var_316_16 = 0.75

			if var_316_15 < arg_313_1.time_ and arg_313_1.time_ <= var_316_15 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_17 = arg_313_1:FormatText(StoryNameCfg[595].name)

				arg_313_1.leftNameTxt_.text = var_316_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_18 = arg_313_1:GetWordFromCfg(417221074)
				local var_316_19 = arg_313_1:FormatText(var_316_18.content)

				arg_313_1.text_.text = var_316_19

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_20 = 30
				local var_316_21 = utf8.len(var_316_19)
				local var_316_22 = var_316_20 <= 0 and var_316_16 or var_316_16 * (var_316_21 / var_316_20)

				if var_316_22 > 0 and var_316_16 < var_316_22 then
					arg_313_1.talkMaxDuration = var_316_22

					if var_316_22 + var_316_15 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_22 + var_316_15
					end
				end

				arg_313_1.text_.text = var_316_19
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221074", "story_v_out_417221.awb") ~= 0 then
					local var_316_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221074", "story_v_out_417221.awb") / 1000

					if var_316_23 + var_316_15 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_23 + var_316_15
					end

					if var_316_18.prefab_name ~= "" and arg_313_1.actors_[var_316_18.prefab_name] ~= nil then
						local var_316_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_18.prefab_name].transform, "story_v_out_417221", "417221074", "story_v_out_417221.awb")

						arg_313_1:RecordAudio("417221074", var_316_24)
						arg_313_1:RecordAudio("417221074", var_316_24)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_417221", "417221074", "story_v_out_417221.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_417221", "417221074", "story_v_out_417221.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_25 = math.max(var_316_16, arg_313_1.talkMaxDuration)

			if var_316_15 <= arg_313_1.time_ and arg_313_1.time_ < var_316_15 + var_316_25 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_15) / var_316_25

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_15 + var_316_25 and arg_313_1.time_ < var_316_15 + var_316_25 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play417221075 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 417221075
		arg_317_1.duration_ = 3.33

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play417221076(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10128"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and not isNil(var_320_0) and arg_317_1.var_.actorSpriteComps10128 == nil then
				arg_317_1.var_.actorSpriteComps10128 = var_320_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_2 = 0.2

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 and not isNil(var_320_0) then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.actorSpriteComps10128 then
					for iter_320_0, iter_320_1 in pairs(arg_317_1.var_.actorSpriteComps10128:ToTable()) do
						if iter_320_1 then
							if arg_317_1.isInRecall_ then
								local var_320_4 = Mathf.Lerp(iter_320_1.color.r, arg_317_1.hightColor2.r, var_320_3)
								local var_320_5 = Mathf.Lerp(iter_320_1.color.g, arg_317_1.hightColor2.g, var_320_3)
								local var_320_6 = Mathf.Lerp(iter_320_1.color.b, arg_317_1.hightColor2.b, var_320_3)

								iter_320_1.color = Color.New(var_320_4, var_320_5, var_320_6)
							else
								local var_320_7 = Mathf.Lerp(iter_320_1.color.r, 0.5, var_320_3)

								iter_320_1.color = Color.New(var_320_7, var_320_7, var_320_7)
							end
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and not isNil(var_320_0) and arg_317_1.var_.actorSpriteComps10128 then
				for iter_320_2, iter_320_3 in pairs(arg_317_1.var_.actorSpriteComps10128:ToTable()) do
					if iter_320_3 then
						if arg_317_1.isInRecall_ then
							iter_320_3.color = arg_317_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_320_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_317_1.var_.actorSpriteComps10128 = nil
			end

			local var_320_8 = 0
			local var_320_9 = 0.45

			if var_320_8 < arg_317_1.time_ and arg_317_1.time_ <= var_320_8 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_10 = arg_317_1:FormatText(StoryNameCfg[1135].name)

				arg_317_1.leftNameTxt_.text = var_320_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, true)
				arg_317_1.iconController_:SetSelectedState("hero")

				arg_317_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_317_1.callingController_:SetSelectedState("normal")

				arg_317_1.keyicon_.color = Color.New(1, 1, 1)
				arg_317_1.icon_.color = Color.New(1, 1, 1)

				local var_320_11 = arg_317_1:GetWordFromCfg(417221075)
				local var_320_12 = arg_317_1:FormatText(var_320_11.content)

				arg_317_1.text_.text = var_320_12

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_13 = 18
				local var_320_14 = utf8.len(var_320_12)
				local var_320_15 = var_320_13 <= 0 and var_320_9 or var_320_9 * (var_320_14 / var_320_13)

				if var_320_15 > 0 and var_320_9 < var_320_15 then
					arg_317_1.talkMaxDuration = var_320_15

					if var_320_15 + var_320_8 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_15 + var_320_8
					end
				end

				arg_317_1.text_.text = var_320_12
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221075", "story_v_out_417221.awb") ~= 0 then
					local var_320_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221075", "story_v_out_417221.awb") / 1000

					if var_320_16 + var_320_8 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_16 + var_320_8
					end

					if var_320_11.prefab_name ~= "" and arg_317_1.actors_[var_320_11.prefab_name] ~= nil then
						local var_320_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_11.prefab_name].transform, "story_v_out_417221", "417221075", "story_v_out_417221.awb")

						arg_317_1:RecordAudio("417221075", var_320_17)
						arg_317_1:RecordAudio("417221075", var_320_17)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_417221", "417221075", "story_v_out_417221.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_417221", "417221075", "story_v_out_417221.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_18 = math.max(var_320_9, arg_317_1.talkMaxDuration)

			if var_320_8 <= arg_317_1.time_ and arg_317_1.time_ < var_320_8 + var_320_18 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_8) / var_320_18

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_8 + var_320_18 and arg_317_1.time_ < var_320_8 + var_320_18 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play417221076 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 417221076
		arg_321_1.duration_ = 12.93

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play417221077(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 4

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.allBtn_.enabled = false
			end

			local var_324_1 = 0.3

			if arg_321_1.time_ >= var_324_0 + var_324_1 and arg_321_1.time_ < var_324_0 + var_324_1 + arg_324_0 then
				arg_321_1.allBtn_.enabled = true
			end

			local var_324_2 = 2

			if var_324_2 < arg_321_1.time_ and arg_321_1.time_ <= var_324_2 + arg_324_0 then
				local var_324_3 = manager.ui.mainCamera.transform.localPosition
				local var_324_4 = Vector3.New(0, 0, 10) + Vector3.New(var_324_3.x, var_324_3.y, 0)
				local var_324_5 = arg_321_1.bgs_.I16f

				var_324_5.transform.localPosition = var_324_4
				var_324_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_324_6 = var_324_5:GetComponent("SpriteRenderer")

				if var_324_6 and var_324_6.sprite then
					local var_324_7 = (var_324_5.transform.localPosition - var_324_3).z
					local var_324_8 = manager.ui.mainCameraCom_
					local var_324_9 = 2 * var_324_7 * Mathf.Tan(var_324_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_324_10 = var_324_9 * var_324_8.aspect
					local var_324_11 = var_324_6.sprite.bounds.size.x
					local var_324_12 = var_324_6.sprite.bounds.size.y
					local var_324_13 = var_324_10 / var_324_11
					local var_324_14 = var_324_9 / var_324_12
					local var_324_15 = var_324_14 < var_324_13 and var_324_13 or var_324_14

					var_324_5.transform.localScale = Vector3.New(var_324_15, var_324_15, 0)
				end

				for iter_324_0, iter_324_1 in pairs(arg_321_1.bgs_) do
					if iter_324_0 ~= "I16f" then
						iter_324_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_17 = 2

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17
				local var_324_19 = Color.New(0, 0, 0)

				var_324_19.a = Mathf.Lerp(0, 1, var_324_18)
				arg_321_1.mask_.color = var_324_19
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 then
				local var_324_20 = Color.New(0, 0, 0)

				var_324_20.a = 1
				arg_321_1.mask_.color = var_324_20
			end

			local var_324_21 = 2

			if var_324_21 < arg_321_1.time_ and arg_321_1.time_ <= var_324_21 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_22 = 2

			if var_324_21 <= arg_321_1.time_ and arg_321_1.time_ < var_324_21 + var_324_22 then
				local var_324_23 = (arg_321_1.time_ - var_324_21) / var_324_22
				local var_324_24 = Color.New(0, 0, 0)

				var_324_24.a = Mathf.Lerp(1, 0, var_324_23)
				arg_321_1.mask_.color = var_324_24
			end

			if arg_321_1.time_ >= var_324_21 + var_324_22 and arg_321_1.time_ < var_324_21 + var_324_22 + arg_324_0 then
				local var_324_25 = Color.New(0, 0, 0)
				local var_324_26 = 0

				arg_321_1.mask_.enabled = false
				var_324_25.a = var_324_26
				arg_321_1.mask_.color = var_324_25
			end

			local var_324_27 = arg_321_1.actors_["10113"]
			local var_324_28 = 3.76666666666667

			if var_324_28 < arg_321_1.time_ and arg_321_1.time_ <= var_324_28 + arg_324_0 and not isNil(var_324_27) and arg_321_1.var_.actorSpriteComps10113 == nil then
				arg_321_1.var_.actorSpriteComps10113 = var_324_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_29 = 0.2

			if var_324_28 <= arg_321_1.time_ and arg_321_1.time_ < var_324_28 + var_324_29 and not isNil(var_324_27) then
				local var_324_30 = (arg_321_1.time_ - var_324_28) / var_324_29

				if arg_321_1.var_.actorSpriteComps10113 then
					for iter_324_2, iter_324_3 in pairs(arg_321_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_324_3 then
							if arg_321_1.isInRecall_ then
								local var_324_31 = Mathf.Lerp(iter_324_3.color.r, arg_321_1.hightColor1.r, var_324_30)
								local var_324_32 = Mathf.Lerp(iter_324_3.color.g, arg_321_1.hightColor1.g, var_324_30)
								local var_324_33 = Mathf.Lerp(iter_324_3.color.b, arg_321_1.hightColor1.b, var_324_30)

								iter_324_3.color = Color.New(var_324_31, var_324_32, var_324_33)
							else
								local var_324_34 = Mathf.Lerp(iter_324_3.color.r, 1, var_324_30)

								iter_324_3.color = Color.New(var_324_34, var_324_34, var_324_34)
							end
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_28 + var_324_29 and arg_321_1.time_ < var_324_28 + var_324_29 + arg_324_0 and not isNil(var_324_27) and arg_321_1.var_.actorSpriteComps10113 then
				for iter_324_4, iter_324_5 in pairs(arg_321_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_324_5 then
						if arg_321_1.isInRecall_ then
							iter_324_5.color = arg_321_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_324_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_321_1.var_.actorSpriteComps10113 = nil
			end

			local var_324_35 = arg_321_1.actors_["10128"].transform
			local var_324_36 = 2

			if var_324_36 < arg_321_1.time_ and arg_321_1.time_ <= var_324_36 + arg_324_0 then
				arg_321_1.var_.moveOldPos10128 = var_324_35.localPosition
				var_324_35.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("10128", 7)

				local var_324_37 = var_324_35.childCount

				for iter_324_6 = 0, var_324_37 - 1 do
					local var_324_38 = var_324_35:GetChild(iter_324_6)

					if var_324_38.name == "" or not string.find(var_324_38.name, "split") then
						var_324_38.gameObject:SetActive(true)
					else
						var_324_38.gameObject:SetActive(false)
					end
				end
			end

			local var_324_39 = 0.001

			if var_324_36 <= arg_321_1.time_ and arg_321_1.time_ < var_324_36 + var_324_39 then
				local var_324_40 = (arg_321_1.time_ - var_324_36) / var_324_39
				local var_324_41 = Vector3.New(0, -2000, -300)

				var_324_35.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10128, var_324_41, var_324_40)
			end

			if arg_321_1.time_ >= var_324_36 + var_324_39 and arg_321_1.time_ < var_324_36 + var_324_39 + arg_324_0 then
				var_324_35.localPosition = Vector3.New(0, -2000, -300)
			end

			local var_324_42 = arg_321_1.actors_["10113"].transform
			local var_324_43 = 3.76666666666667

			if var_324_43 < arg_321_1.time_ and arg_321_1.time_ <= var_324_43 + arg_324_0 then
				arg_321_1.var_.moveOldPos10113 = var_324_42.localPosition
				var_324_42.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("10113", 3)

				local var_324_44 = var_324_42.childCount

				for iter_324_7 = 0, var_324_44 - 1 do
					local var_324_45 = var_324_42:GetChild(iter_324_7)

					if var_324_45.name == "" or not string.find(var_324_45.name, "split") then
						var_324_45.gameObject:SetActive(true)
					else
						var_324_45.gameObject:SetActive(false)
					end
				end
			end

			local var_324_46 = 0.001

			if var_324_43 <= arg_321_1.time_ and arg_321_1.time_ < var_324_43 + var_324_46 then
				local var_324_47 = (arg_321_1.time_ - var_324_43) / var_324_46
				local var_324_48 = Vector3.New(-30.38, -328.4, -517.4)

				var_324_42.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10113, var_324_48, var_324_47)
			end

			if arg_321_1.time_ >= var_324_43 + var_324_46 and arg_321_1.time_ < var_324_43 + var_324_46 + arg_324_0 then
				var_324_42.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_324_49 = arg_321_1.actors_["10113"]
			local var_324_50 = 3.76666666666667

			if var_324_50 < arg_321_1.time_ and arg_321_1.time_ <= var_324_50 + arg_324_0 then
				local var_324_51 = var_324_49:GetComponentInChildren(typeof(CanvasGroup))

				if var_324_51 then
					arg_321_1.var_.alphaOldValue10113 = var_324_51.alpha
					arg_321_1.var_.characterEffect10113 = var_324_51
				end

				arg_321_1.var_.alphaOldValue10113 = 0
			end

			local var_324_52 = 0.233333333333333

			if var_324_50 <= arg_321_1.time_ and arg_321_1.time_ < var_324_50 + var_324_52 then
				local var_324_53 = (arg_321_1.time_ - var_324_50) / var_324_52
				local var_324_54 = Mathf.Lerp(arg_321_1.var_.alphaOldValue10113, 1, var_324_53)

				if arg_321_1.var_.characterEffect10113 then
					arg_321_1.var_.characterEffect10113.alpha = var_324_54
				end
			end

			if arg_321_1.time_ >= var_324_50 + var_324_52 and arg_321_1.time_ < var_324_50 + var_324_52 + arg_324_0 and arg_321_1.var_.characterEffect10113 then
				arg_321_1.var_.characterEffect10113.alpha = 1
			end

			local var_324_55 = 1.7
			local var_324_56 = 1

			if var_324_55 < arg_321_1.time_ and arg_321_1.time_ <= var_324_55 + arg_324_0 then
				local var_324_57 = "play"
				local var_324_58 = "effect"

				arg_321_1:AudioAction(var_324_57, var_324_58, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			if arg_321_1.frameCnt_ <= 1 then
				arg_321_1.dialog_:SetActive(false)
			end

			local var_324_59 = 4
			local var_324_60 = 1.05

			if var_324_59 < arg_321_1.time_ and arg_321_1.time_ <= var_324_59 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0

				arg_321_1.dialog_:SetActive(true)

				local var_324_61 = LeanTween.value(arg_321_1.dialog_, 0, 1, 0.3)

				var_324_61:setOnUpdate(LuaHelper.FloatAction(function(arg_325_0)
					arg_321_1.dialogCg_.alpha = arg_325_0
				end))
				var_324_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_321_1.dialog_)
					var_324_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_321_1.duration_ = arg_321_1.duration_ + 0.3

				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_62 = arg_321_1:FormatText(StoryNameCfg[1117].name)

				arg_321_1.leftNameTxt_.text = var_324_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_63 = arg_321_1:GetWordFromCfg(417221076)
				local var_324_64 = arg_321_1:FormatText(var_324_63.content)

				arg_321_1.text_.text = var_324_64

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_65 = 42
				local var_324_66 = utf8.len(var_324_64)
				local var_324_67 = var_324_65 <= 0 and var_324_60 or var_324_60 * (var_324_66 / var_324_65)

				if var_324_67 > 0 and var_324_60 < var_324_67 then
					arg_321_1.talkMaxDuration = var_324_67
					var_324_59 = var_324_59 + 0.3

					if var_324_67 + var_324_59 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_67 + var_324_59
					end
				end

				arg_321_1.text_.text = var_324_64
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221076", "story_v_out_417221.awb") ~= 0 then
					local var_324_68 = manager.audio:GetVoiceLength("story_v_out_417221", "417221076", "story_v_out_417221.awb") / 1000

					if var_324_68 + var_324_59 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_68 + var_324_59
					end

					if var_324_63.prefab_name ~= "" and arg_321_1.actors_[var_324_63.prefab_name] ~= nil then
						local var_324_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_63.prefab_name].transform, "story_v_out_417221", "417221076", "story_v_out_417221.awb")

						arg_321_1:RecordAudio("417221076", var_324_69)
						arg_321_1:RecordAudio("417221076", var_324_69)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_417221", "417221076", "story_v_out_417221.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_417221", "417221076", "story_v_out_417221.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_70 = var_324_59 + 0.3
			local var_324_71 = math.max(var_324_60, arg_321_1.talkMaxDuration)

			if var_324_70 <= arg_321_1.time_ and arg_321_1.time_ < var_324_70 + var_324_71 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_70) / var_324_71

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_70 + var_324_71 and arg_321_1.time_ < var_324_70 + var_324_71 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play417221077 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 417221077
		arg_327_1.duration_ = 9.67

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play417221078(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 1.05

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[1117].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(417221077)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 42
				local var_330_6 = utf8.len(var_330_4)
				local var_330_7 = var_330_5 <= 0 and var_330_1 or var_330_1 * (var_330_6 / var_330_5)

				if var_330_7 > 0 and var_330_1 < var_330_7 then
					arg_327_1.talkMaxDuration = var_330_7

					if var_330_7 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_7 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_4
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221077", "story_v_out_417221.awb") ~= 0 then
					local var_330_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221077", "story_v_out_417221.awb") / 1000

					if var_330_8 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_8 + var_330_0
					end

					if var_330_3.prefab_name ~= "" and arg_327_1.actors_[var_330_3.prefab_name] ~= nil then
						local var_330_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_3.prefab_name].transform, "story_v_out_417221", "417221077", "story_v_out_417221.awb")

						arg_327_1:RecordAudio("417221077", var_330_9)
						arg_327_1:RecordAudio("417221077", var_330_9)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_417221", "417221077", "story_v_out_417221.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_417221", "417221077", "story_v_out_417221.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_10 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_10 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_10

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_10 and arg_327_1.time_ < var_330_0 + var_330_10 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play417221078 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 417221078
		arg_331_1.duration_ = 12.93

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play417221079(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 1.375

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[1117].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(417221078)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 55
				local var_334_6 = utf8.len(var_334_4)
				local var_334_7 = var_334_5 <= 0 and var_334_1 or var_334_1 * (var_334_6 / var_334_5)

				if var_334_7 > 0 and var_334_1 < var_334_7 then
					arg_331_1.talkMaxDuration = var_334_7

					if var_334_7 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_7 + var_334_0
					end
				end

				arg_331_1.text_.text = var_334_4
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221078", "story_v_out_417221.awb") ~= 0 then
					local var_334_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221078", "story_v_out_417221.awb") / 1000

					if var_334_8 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_8 + var_334_0
					end

					if var_334_3.prefab_name ~= "" and arg_331_1.actors_[var_334_3.prefab_name] ~= nil then
						local var_334_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_3.prefab_name].transform, "story_v_out_417221", "417221078", "story_v_out_417221.awb")

						arg_331_1:RecordAudio("417221078", var_334_9)
						arg_331_1:RecordAudio("417221078", var_334_9)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_417221", "417221078", "story_v_out_417221.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_417221", "417221078", "story_v_out_417221.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_10 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_10 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_10

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_10 and arg_331_1.time_ < var_334_0 + var_334_10 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play417221079 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 417221079
		arg_335_1.duration_ = 9.83

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play417221080(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1.075

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[1117].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(417221079)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 43
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221079", "story_v_out_417221.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221079", "story_v_out_417221.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_417221", "417221079", "story_v_out_417221.awb")

						arg_335_1:RecordAudio("417221079", var_338_9)
						arg_335_1:RecordAudio("417221079", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_417221", "417221079", "story_v_out_417221.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_417221", "417221079", "story_v_out_417221.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play417221080 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 417221080
		arg_339_1.duration_ = 6.23

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play417221081(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["10113"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos10113 = var_342_0.localPosition
				var_342_0.localScale = Vector3.New(1, 1, 1)

				arg_339_1:CheckSpriteTmpPos("10113", 3)

				local var_342_2 = var_342_0.childCount

				for iter_342_0 = 0, var_342_2 - 1 do
					local var_342_3 = var_342_0:GetChild(iter_342_0)

					if var_342_3.name == "split_4" or not string.find(var_342_3.name, "split") then
						var_342_3.gameObject:SetActive(true)
					else
						var_342_3.gameObject:SetActive(false)
					end
				end
			end

			local var_342_4 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_4 then
				local var_342_5 = (arg_339_1.time_ - var_342_1) / var_342_4
				local var_342_6 = Vector3.New(-30.38, -328.4, -517.4)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos10113, var_342_6, var_342_5)
			end

			if arg_339_1.time_ >= var_342_1 + var_342_4 and arg_339_1.time_ < var_342_1 + var_342_4 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_342_7 = 0
			local var_342_8 = 0.5

			if var_342_7 < arg_339_1.time_ and arg_339_1.time_ <= var_342_7 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_9 = arg_339_1:FormatText(StoryNameCfg[1117].name)

				arg_339_1.leftNameTxt_.text = var_342_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_10 = arg_339_1:GetWordFromCfg(417221080)
				local var_342_11 = arg_339_1:FormatText(var_342_10.content)

				arg_339_1.text_.text = var_342_11

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_12 = 20
				local var_342_13 = utf8.len(var_342_11)
				local var_342_14 = var_342_12 <= 0 and var_342_8 or var_342_8 * (var_342_13 / var_342_12)

				if var_342_14 > 0 and var_342_8 < var_342_14 then
					arg_339_1.talkMaxDuration = var_342_14

					if var_342_14 + var_342_7 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_14 + var_342_7
					end
				end

				arg_339_1.text_.text = var_342_11
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221080", "story_v_out_417221.awb") ~= 0 then
					local var_342_15 = manager.audio:GetVoiceLength("story_v_out_417221", "417221080", "story_v_out_417221.awb") / 1000

					if var_342_15 + var_342_7 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_15 + var_342_7
					end

					if var_342_10.prefab_name ~= "" and arg_339_1.actors_[var_342_10.prefab_name] ~= nil then
						local var_342_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_10.prefab_name].transform, "story_v_out_417221", "417221080", "story_v_out_417221.awb")

						arg_339_1:RecordAudio("417221080", var_342_16)
						arg_339_1:RecordAudio("417221080", var_342_16)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_417221", "417221080", "story_v_out_417221.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_417221", "417221080", "story_v_out_417221.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_17 = math.max(var_342_8, arg_339_1.talkMaxDuration)

			if var_342_7 <= arg_339_1.time_ and arg_339_1.time_ < var_342_7 + var_342_17 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_7) / var_342_17

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_7 + var_342_17 and arg_339_1.time_ < var_342_7 + var_342_17 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play417221081 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 417221081
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play417221082(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["10113"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.actorSpriteComps10113 == nil then
				arg_343_1.var_.actorSpriteComps10113 = var_346_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_2 = 0.2

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 and not isNil(var_346_0) then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.actorSpriteComps10113 then
					for iter_346_0, iter_346_1 in pairs(arg_343_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_346_1 then
							if arg_343_1.isInRecall_ then
								local var_346_4 = Mathf.Lerp(iter_346_1.color.r, arg_343_1.hightColor2.r, var_346_3)
								local var_346_5 = Mathf.Lerp(iter_346_1.color.g, arg_343_1.hightColor2.g, var_346_3)
								local var_346_6 = Mathf.Lerp(iter_346_1.color.b, arg_343_1.hightColor2.b, var_346_3)

								iter_346_1.color = Color.New(var_346_4, var_346_5, var_346_6)
							else
								local var_346_7 = Mathf.Lerp(iter_346_1.color.r, 0.5, var_346_3)

								iter_346_1.color = Color.New(var_346_7, var_346_7, var_346_7)
							end
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.actorSpriteComps10113 then
				for iter_346_2, iter_346_3 in pairs(arg_343_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_346_3 then
						if arg_343_1.isInRecall_ then
							iter_346_3.color = arg_343_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_346_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_343_1.var_.actorSpriteComps10113 = nil
			end

			local var_346_8 = 0
			local var_346_9 = 1.5

			if var_346_8 < arg_343_1.time_ and arg_343_1.time_ <= var_346_8 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_10 = arg_343_1:GetWordFromCfg(417221081)
				local var_346_11 = arg_343_1:FormatText(var_346_10.content)

				arg_343_1.text_.text = var_346_11

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_12 = 60
				local var_346_13 = utf8.len(var_346_11)
				local var_346_14 = var_346_12 <= 0 and var_346_9 or var_346_9 * (var_346_13 / var_346_12)

				if var_346_14 > 0 and var_346_9 < var_346_14 then
					arg_343_1.talkMaxDuration = var_346_14

					if var_346_14 + var_346_8 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_14 + var_346_8
					end
				end

				arg_343_1.text_.text = var_346_11
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_15 = math.max(var_346_9, arg_343_1.talkMaxDuration)

			if var_346_8 <= arg_343_1.time_ and arg_343_1.time_ < var_346_8 + var_346_15 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_8) / var_346_15

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_8 + var_346_15 and arg_343_1.time_ < var_346_8 + var_346_15 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play417221082 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 417221082
		arg_347_1.duration_ = 6

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play417221083(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10113"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and not isNil(var_350_0) and arg_347_1.var_.actorSpriteComps10113 == nil then
				arg_347_1.var_.actorSpriteComps10113 = var_350_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_2 = 0.034

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 and not isNil(var_350_0) then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.actorSpriteComps10113 then
					for iter_350_0, iter_350_1 in pairs(arg_347_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_350_1 then
							if arg_347_1.isInRecall_ then
								local var_350_4 = Mathf.Lerp(iter_350_1.color.r, arg_347_1.hightColor1.r, var_350_3)
								local var_350_5 = Mathf.Lerp(iter_350_1.color.g, arg_347_1.hightColor1.g, var_350_3)
								local var_350_6 = Mathf.Lerp(iter_350_1.color.b, arg_347_1.hightColor1.b, var_350_3)

								iter_350_1.color = Color.New(var_350_4, var_350_5, var_350_6)
							else
								local var_350_7 = Mathf.Lerp(iter_350_1.color.r, 1, var_350_3)

								iter_350_1.color = Color.New(var_350_7, var_350_7, var_350_7)
							end
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and not isNil(var_350_0) and arg_347_1.var_.actorSpriteComps10113 then
				for iter_350_2, iter_350_3 in pairs(arg_347_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_350_3 then
						if arg_347_1.isInRecall_ then
							iter_350_3.color = arg_347_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_350_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_347_1.var_.actorSpriteComps10113 = nil
			end

			local var_350_8 = arg_347_1.actors_["10113"].transform
			local var_350_9 = 0

			if var_350_9 < arg_347_1.time_ and arg_347_1.time_ <= var_350_9 + arg_350_0 then
				arg_347_1.var_.moveOldPos10113 = var_350_8.localPosition
				var_350_8.localScale = Vector3.New(1, 1, 1)

				arg_347_1:CheckSpriteTmpPos("10113", 3)

				local var_350_10 = var_350_8.childCount

				for iter_350_4 = 0, var_350_10 - 1 do
					local var_350_11 = var_350_8:GetChild(iter_350_4)

					if var_350_11.name == "split_3" or not string.find(var_350_11.name, "split") then
						var_350_11.gameObject:SetActive(true)
					else
						var_350_11.gameObject:SetActive(false)
					end
				end
			end

			local var_350_12 = 0.001

			if var_350_9 <= arg_347_1.time_ and arg_347_1.time_ < var_350_9 + var_350_12 then
				local var_350_13 = (arg_347_1.time_ - var_350_9) / var_350_12
				local var_350_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_350_8.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10113, var_350_14, var_350_13)
			end

			if arg_347_1.time_ >= var_350_9 + var_350_12 and arg_347_1.time_ < var_350_9 + var_350_12 + arg_350_0 then
				var_350_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_350_15 = 0
			local var_350_16 = 0.55

			if var_350_15 < arg_347_1.time_ and arg_347_1.time_ <= var_350_15 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_17 = arg_347_1:FormatText(StoryNameCfg[1117].name)

				arg_347_1.leftNameTxt_.text = var_350_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_18 = arg_347_1:GetWordFromCfg(417221082)
				local var_350_19 = arg_347_1:FormatText(var_350_18.content)

				arg_347_1.text_.text = var_350_19

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_20 = 22
				local var_350_21 = utf8.len(var_350_19)
				local var_350_22 = var_350_20 <= 0 and var_350_16 or var_350_16 * (var_350_21 / var_350_20)

				if var_350_22 > 0 and var_350_16 < var_350_22 then
					arg_347_1.talkMaxDuration = var_350_22

					if var_350_22 + var_350_15 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_22 + var_350_15
					end
				end

				arg_347_1.text_.text = var_350_19
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221082", "story_v_out_417221.awb") ~= 0 then
					local var_350_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221082", "story_v_out_417221.awb") / 1000

					if var_350_23 + var_350_15 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_23 + var_350_15
					end

					if var_350_18.prefab_name ~= "" and arg_347_1.actors_[var_350_18.prefab_name] ~= nil then
						local var_350_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_18.prefab_name].transform, "story_v_out_417221", "417221082", "story_v_out_417221.awb")

						arg_347_1:RecordAudio("417221082", var_350_24)
						arg_347_1:RecordAudio("417221082", var_350_24)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_417221", "417221082", "story_v_out_417221.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_417221", "417221082", "story_v_out_417221.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_25 = math.max(var_350_16, arg_347_1.talkMaxDuration)

			if var_350_15 <= arg_347_1.time_ and arg_347_1.time_ < var_350_15 + var_350_25 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_15) / var_350_25

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_15 + var_350_25 and arg_347_1.time_ < var_350_15 + var_350_25 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play417221083 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 417221083
		arg_351_1.duration_ = 8.47

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play417221084(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.775

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[1117].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(417221083)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 31
				local var_354_6 = utf8.len(var_354_4)
				local var_354_7 = var_354_5 <= 0 and var_354_1 or var_354_1 * (var_354_6 / var_354_5)

				if var_354_7 > 0 and var_354_1 < var_354_7 then
					arg_351_1.talkMaxDuration = var_354_7

					if var_354_7 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_7 + var_354_0
					end
				end

				arg_351_1.text_.text = var_354_4
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221083", "story_v_out_417221.awb") ~= 0 then
					local var_354_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221083", "story_v_out_417221.awb") / 1000

					if var_354_8 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_8 + var_354_0
					end

					if var_354_3.prefab_name ~= "" and arg_351_1.actors_[var_354_3.prefab_name] ~= nil then
						local var_354_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_3.prefab_name].transform, "story_v_out_417221", "417221083", "story_v_out_417221.awb")

						arg_351_1:RecordAudio("417221083", var_354_9)
						arg_351_1:RecordAudio("417221083", var_354_9)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_417221", "417221083", "story_v_out_417221.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_417221", "417221083", "story_v_out_417221.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_10 = math.max(var_354_1, arg_351_1.talkMaxDuration)

			if var_354_0 <= arg_351_1.time_ and arg_351_1.time_ < var_354_0 + var_354_10 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_0) / var_354_10

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_0 + var_354_10 and arg_351_1.time_ < var_354_0 + var_354_10 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play417221084 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 417221084
		arg_355_1.duration_ = 9.67

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play417221085(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 1.96666666666667

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1.cswbg_:SetActive(true)

				local var_358_1 = arg_355_1.cswt_:GetComponent("RectTransform")

				arg_355_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_358_1.offsetMin = Vector2.New(0, 0)
				var_358_1.offsetMax = Vector2.New(0, 0)

				local var_358_2 = arg_355_1:GetWordFromCfg(419114)
				local var_358_3 = arg_355_1:FormatText(var_358_2.content)

				arg_355_1.cswt_.text = var_358_3

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.cswt_)

				arg_355_1.cswt_.fontSize = 120
				arg_355_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_355_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_358_4 = 1.96666666666667

			if var_358_4 < arg_355_1.time_ and arg_355_1.time_ <= var_358_4 + arg_358_0 then
				local var_358_5 = manager.ui.mainCamera.transform.localPosition
				local var_358_6 = Vector3.New(0, 0, 10) + Vector3.New(var_358_5.x, var_358_5.y, 0)
				local var_358_7 = arg_355_1.bgs_.STblack

				var_358_7.transform.localPosition = var_358_6
				var_358_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_358_8 = var_358_7:GetComponent("SpriteRenderer")

				if var_358_8 and var_358_8.sprite then
					local var_358_9 = (var_358_7.transform.localPosition - var_358_5).z
					local var_358_10 = manager.ui.mainCameraCom_
					local var_358_11 = 2 * var_358_9 * Mathf.Tan(var_358_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_358_12 = var_358_11 * var_358_10.aspect
					local var_358_13 = var_358_8.sprite.bounds.size.x
					local var_358_14 = var_358_8.sprite.bounds.size.y
					local var_358_15 = var_358_12 / var_358_13
					local var_358_16 = var_358_11 / var_358_14
					local var_358_17 = var_358_16 < var_358_15 and var_358_15 or var_358_16

					var_358_7.transform.localScale = Vector3.New(var_358_17, var_358_17, 0)
				end

				for iter_358_0, iter_358_1 in pairs(arg_355_1.bgs_) do
					if iter_358_0 ~= "STblack" then
						iter_358_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_358_18 = 1.96666666666667

			if var_358_18 < arg_355_1.time_ and arg_355_1.time_ <= var_358_18 + arg_358_0 then
				arg_355_1.fswbg_:SetActive(true)
				arg_355_1.dialog_:SetActive(false)

				arg_355_1.fswtw_.percent = 0

				local var_358_19 = arg_355_1:GetWordFromCfg(417221084)
				local var_358_20 = arg_355_1:FormatText(var_358_19.content)

				arg_355_1.fswt_.text = var_358_20

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.fswt_)

				arg_355_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_355_1.fswtw_:SetDirty()

				arg_355_1.typewritterCharCountI18N = 0

				arg_355_1:ShowNextGo(false)
			end

			local var_358_21 = 3.33333333333333

			if var_358_21 < arg_355_1.time_ and arg_355_1.time_ <= var_358_21 + arg_358_0 then
				arg_355_1.var_.oldValueTypewriter = arg_355_1.fswtw_.percent

				arg_355_1:ShowNextGo(false)
			end

			local var_358_22 = 24
			local var_358_23 = 1.6
			local var_358_24 = arg_355_1:GetWordFromCfg(417221084)
			local var_358_25 = arg_355_1:FormatText(var_358_24.content)
			local var_358_26, var_358_27 = arg_355_1:GetPercentByPara(var_358_25, 1)

			if var_358_21 < arg_355_1.time_ and arg_355_1.time_ <= var_358_21 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0

				local var_358_28 = var_358_22 <= 0 and var_358_23 or var_358_23 * ((var_358_27 - arg_355_1.typewritterCharCountI18N) / var_358_22)

				if var_358_28 > 0 and var_358_23 < var_358_28 then
					arg_355_1.talkMaxDuration = var_358_28

					if var_358_28 + var_358_21 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_28 + var_358_21
					end
				end
			end

			local var_358_29 = 1.6
			local var_358_30 = math.max(var_358_29, arg_355_1.talkMaxDuration)

			if var_358_21 <= arg_355_1.time_ and arg_355_1.time_ < var_358_21 + var_358_30 then
				local var_358_31 = (arg_355_1.time_ - var_358_21) / var_358_30

				arg_355_1.fswtw_.percent = Mathf.Lerp(arg_355_1.var_.oldValueTypewriter, var_358_26, var_358_31)
				arg_355_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_355_1.fswtw_:SetDirty()
			end

			if arg_355_1.time_ >= var_358_21 + var_358_30 and arg_355_1.time_ < var_358_21 + var_358_30 + arg_358_0 then
				arg_355_1.fswtw_.percent = var_358_26

				arg_355_1.fswtw_:SetDirty()
				arg_355_1:ShowNextGo(true)

				arg_355_1.typewritterCharCountI18N = var_358_27
			end

			local var_358_32 = 0

			if var_358_32 < arg_355_1.time_ and arg_355_1.time_ <= var_358_32 + arg_358_0 then
				arg_355_1.mask_.enabled = true
				arg_355_1.mask_.raycastTarget = false

				arg_355_1:SetGaussion(false)
			end

			local var_358_33 = 1.96666666666667

			if var_358_32 <= arg_355_1.time_ and arg_355_1.time_ < var_358_32 + var_358_33 then
				local var_358_34 = (arg_355_1.time_ - var_358_32) / var_358_33
				local var_358_35 = Color.New(0, 0, 0)

				var_358_35.a = Mathf.Lerp(0, 1, var_358_34)
				arg_355_1.mask_.color = var_358_35
			end

			if arg_355_1.time_ >= var_358_32 + var_358_33 and arg_355_1.time_ < var_358_32 + var_358_33 + arg_358_0 then
				local var_358_36 = Color.New(0, 0, 0)

				var_358_36.a = 1
				arg_355_1.mask_.color = var_358_36
			end

			local var_358_37 = 1.96666666666667

			if var_358_37 < arg_355_1.time_ and arg_355_1.time_ <= var_358_37 + arg_358_0 then
				arg_355_1.mask_.enabled = true
				arg_355_1.mask_.raycastTarget = false

				arg_355_1:SetGaussion(false)
			end

			local var_358_38 = 1.96666666666667

			if var_358_37 <= arg_355_1.time_ and arg_355_1.time_ < var_358_37 + var_358_38 then
				local var_358_39 = (arg_355_1.time_ - var_358_37) / var_358_38
				local var_358_40 = Color.New(0, 0, 0)

				var_358_40.a = Mathf.Lerp(1, 0, var_358_39)
				arg_355_1.mask_.color = var_358_40
			end

			if arg_355_1.time_ >= var_358_37 + var_358_38 and arg_355_1.time_ < var_358_37 + var_358_38 + arg_358_0 then
				local var_358_41 = Color.New(0, 0, 0)
				local var_358_42 = 0

				arg_355_1.mask_.enabled = false
				var_358_41.a = var_358_42
				arg_355_1.mask_.color = var_358_41
			end

			local var_358_43 = arg_355_1.actors_["10113"].transform
			local var_358_44 = 1.93266666666667

			if var_358_44 < arg_355_1.time_ and arg_355_1.time_ <= var_358_44 + arg_358_0 then
				arg_355_1.var_.moveOldPos10113 = var_358_43.localPosition
				var_358_43.localScale = Vector3.New(1, 1, 1)

				arg_355_1:CheckSpriteTmpPos("10113", 7)

				local var_358_45 = var_358_43.childCount

				for iter_358_2 = 0, var_358_45 - 1 do
					local var_358_46 = var_358_43:GetChild(iter_358_2)

					if var_358_46.name == "" or not string.find(var_358_46.name, "split") then
						var_358_46.gameObject:SetActive(true)
					else
						var_358_46.gameObject:SetActive(false)
					end
				end
			end

			local var_358_47 = 0.001

			if var_358_44 <= arg_355_1.time_ and arg_355_1.time_ < var_358_44 + var_358_47 then
				local var_358_48 = (arg_355_1.time_ - var_358_44) / var_358_47
				local var_358_49 = Vector3.New(0, -2000, 0)

				var_358_43.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos10113, var_358_49, var_358_48)
			end

			if arg_355_1.time_ >= var_358_44 + var_358_47 and arg_355_1.time_ < var_358_44 + var_358_47 + arg_358_0 then
				var_358_43.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_358_50 = 1.96666666666667

			if var_358_50 < arg_355_1.time_ and arg_355_1.time_ <= var_358_50 + arg_358_0 then
				local var_358_51 = arg_355_1.fswbg_.transform:Find("textbox/adapt/content") or arg_355_1.fswbg_.transform:Find("textbox/content")
				local var_358_52 = var_358_51:GetComponent("Text")
				local var_358_53 = var_358_51:GetComponent("RectTransform")

				var_358_52.alignment = UnityEngine.TextAnchor.LowerCenter
				var_358_53.offsetMin = Vector2.New(0, 0)
				var_358_53.offsetMax = Vector2.New(0, 0)
			end

			local var_358_54 = 3.33333333333333
			local var_358_55 = 6.333

			if var_358_54 < arg_355_1.time_ and arg_355_1.time_ <= var_358_54 + arg_358_0 then
				local var_358_56 = "play"
				local var_358_57 = "music"

				arg_355_1:AudioAction(var_358_56, var_358_57, "story_v_out_417221", "417221084", "story_v_out_417221.awb")

				local var_358_58 = ""
				local var_358_59 = manager.audio:GetAudioName("story_v_out_417221", "417221084")

				if var_358_59 ~= "" then
					if arg_355_1.bgmTxt_.text ~= var_358_59 and arg_355_1.bgmTxt_.text ~= "" then
						if arg_355_1.bgmTxt2_.text ~= "" then
							arg_355_1.bgmTxt_.text = arg_355_1.bgmTxt2_.text
						end

						arg_355_1.bgmTxt2_.text = var_358_59

						arg_355_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_355_1.bgmTxt_.text = var_358_59
					end

					if arg_355_1.bgmTimer then
						arg_355_1.bgmTimer:Stop()

						arg_355_1.bgmTimer = nil
					end

					if arg_355_1.settingData.show_music_name == 1 then
						arg_355_1.musicController:SetSelectedState("show")
						arg_355_1.musicAnimator_:Play("open", 0, 0)

						if arg_355_1.settingData.music_time ~= 0 then
							arg_355_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_355_1.settingData.music_time), function()
								if arg_355_1 == nil or isNil(arg_355_1.bgmTxt_) then
									return
								end

								arg_355_1.musicController:SetSelectedState("hide")
								arg_355_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221085 = function(arg_360_0, arg_360_1)
		arg_360_1.time_ = 0
		arg_360_1.frameCnt_ = 0
		arg_360_1.state_ = "playing"
		arg_360_1.curTalkId_ = 417221085
		arg_360_1.duration_ = 10.17

		SetActive(arg_360_1.tipsGo_, false)

		function arg_360_1.onSingleLineFinish_()
			arg_360_1.onSingleLineUpdate_ = nil
			arg_360_1.onSingleLineFinish_ = nil
			arg_360_1.state_ = "waiting"
		end

		function arg_360_1.playNext_(arg_362_0)
			if arg_362_0 == 1 then
				arg_360_0:Play417221086(arg_360_1)
			end
		end

		function arg_360_1.onSingleLineUpdate_(arg_363_0)
			local var_363_0 = 0

			if var_363_0 < arg_360_1.time_ and arg_360_1.time_ <= var_363_0 + arg_363_0 then
				arg_360_1.fswbg_:SetActive(true)
				arg_360_1.dialog_:SetActive(false)

				arg_360_1.fswtw_.percent = 0

				local var_363_1 = arg_360_1:GetWordFromCfg(417221085)
				local var_363_2 = arg_360_1:FormatText(var_363_1.content)

				arg_360_1.fswt_.text = var_363_2

				LuaForUtil.ClearLinePrefixSymbol(arg_360_1.fswt_)

				arg_360_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_360_1.fswtw_:SetDirty()

				arg_360_1.typewritterCharCountI18N = 0

				arg_360_1:ShowNextGo(false)
			end

			local var_363_3 = 0.0999999999999999

			if var_363_3 < arg_360_1.time_ and arg_360_1.time_ <= var_363_3 + arg_363_0 then
				arg_360_1.var_.oldValueTypewriter = arg_360_1.fswtw_.percent

				arg_360_1:ShowNextGo(false)
			end

			local var_363_4 = 45
			local var_363_5 = 3
			local var_363_6 = arg_360_1:GetWordFromCfg(417221085)
			local var_363_7 = arg_360_1:FormatText(var_363_6.content)
			local var_363_8, var_363_9 = arg_360_1:GetPercentByPara(var_363_7, 1)

			if var_363_3 < arg_360_1.time_ and arg_360_1.time_ <= var_363_3 + arg_363_0 then
				arg_360_1.talkMaxDuration = 0

				local var_363_10 = var_363_4 <= 0 and var_363_5 or var_363_5 * ((var_363_9 - arg_360_1.typewritterCharCountI18N) / var_363_4)

				if var_363_10 > 0 and var_363_5 < var_363_10 then
					arg_360_1.talkMaxDuration = var_363_10

					if var_363_10 + var_363_3 > arg_360_1.duration_ then
						arg_360_1.duration_ = var_363_10 + var_363_3
					end
				end
			end

			local var_363_11 = 3
			local var_363_12 = math.max(var_363_11, arg_360_1.talkMaxDuration)

			if var_363_3 <= arg_360_1.time_ and arg_360_1.time_ < var_363_3 + var_363_12 then
				local var_363_13 = (arg_360_1.time_ - var_363_3) / var_363_12

				arg_360_1.fswtw_.percent = Mathf.Lerp(arg_360_1.var_.oldValueTypewriter, var_363_8, var_363_13)
				arg_360_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_360_1.fswtw_:SetDirty()
			end

			if arg_360_1.time_ >= var_363_3 + var_363_12 and arg_360_1.time_ < var_363_3 + var_363_12 + arg_363_0 then
				arg_360_1.fswtw_.percent = var_363_8

				arg_360_1.fswtw_:SetDirty()
				arg_360_1:ShowNextGo(true)

				arg_360_1.typewritterCharCountI18N = var_363_9
			end

			local var_363_14 = 0.0999999999999999
			local var_363_15 = 10.066

			if var_363_14 < arg_360_1.time_ and arg_360_1.time_ <= var_363_14 + arg_363_0 then
				local var_363_16 = "play"
				local var_363_17 = "music"

				arg_360_1:AudioAction(var_363_16, var_363_17, "story_v_out_417221", "417221085", "story_v_out_417221.awb")

				local var_363_18 = ""
				local var_363_19 = manager.audio:GetAudioName("story_v_out_417221", "417221085")

				if var_363_19 ~= "" then
					if arg_360_1.bgmTxt_.text ~= var_363_19 and arg_360_1.bgmTxt_.text ~= "" then
						if arg_360_1.bgmTxt2_.text ~= "" then
							arg_360_1.bgmTxt_.text = arg_360_1.bgmTxt2_.text
						end

						arg_360_1.bgmTxt2_.text = var_363_19

						arg_360_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_360_1.bgmTxt_.text = var_363_19
					end

					if arg_360_1.bgmTimer then
						arg_360_1.bgmTimer:Stop()

						arg_360_1.bgmTimer = nil
					end

					if arg_360_1.settingData.show_music_name == 1 then
						arg_360_1.musicController:SetSelectedState("show")
						arg_360_1.musicAnimator_:Play("open", 0, 0)

						if arg_360_1.settingData.music_time ~= 0 then
							arg_360_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_360_1.settingData.music_time), function()
								if arg_360_1 == nil or isNil(arg_360_1.bgmTxt_) then
									return
								end

								arg_360_1.musicController:SetSelectedState("hide")
								arg_360_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221086 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 417221086
		arg_365_1.duration_ = 12.13

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play417221087(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.fswbg_:SetActive(true)
				arg_365_1.dialog_:SetActive(false)

				arg_365_1.fswtw_.percent = 0

				local var_368_1 = arg_365_1:GetWordFromCfg(417221086)
				local var_368_2 = arg_365_1:FormatText(var_368_1.content)

				arg_365_1.fswt_.text = var_368_2

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.fswt_)

				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()

				arg_365_1.typewritterCharCountI18N = 0

				arg_365_1:ShowNextGo(false)
			end

			local var_368_3 = 0.0999999999999999

			if var_368_3 < arg_365_1.time_ and arg_365_1.time_ <= var_368_3 + arg_368_0 then
				arg_365_1.var_.oldValueTypewriter = arg_365_1.fswtw_.percent

				arg_365_1:ShowNextGo(false)
			end

			local var_368_4 = 50
			local var_368_5 = 2.33333333333333
			local var_368_6 = arg_365_1:GetWordFromCfg(417221086)
			local var_368_7 = arg_365_1:FormatText(var_368_6.content)
			local var_368_8, var_368_9 = arg_365_1:GetPercentByPara(var_368_7, 1)

			if var_368_3 < arg_365_1.time_ and arg_365_1.time_ <= var_368_3 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0

				local var_368_10 = var_368_4 <= 0 and var_368_5 or var_368_5 * ((var_368_9 - arg_365_1.typewritterCharCountI18N) / var_368_4)

				if var_368_10 > 0 and var_368_5 < var_368_10 then
					arg_365_1.talkMaxDuration = var_368_10

					if var_368_10 + var_368_3 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_10 + var_368_3
					end
				end
			end

			local var_368_11 = 2.33333333333333
			local var_368_12 = math.max(var_368_11, arg_365_1.talkMaxDuration)

			if var_368_3 <= arg_365_1.time_ and arg_365_1.time_ < var_368_3 + var_368_12 then
				local var_368_13 = (arg_365_1.time_ - var_368_3) / var_368_12

				arg_365_1.fswtw_.percent = Mathf.Lerp(arg_365_1.var_.oldValueTypewriter, var_368_8, var_368_13)
				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()
			end

			if arg_365_1.time_ >= var_368_3 + var_368_12 and arg_365_1.time_ < var_368_3 + var_368_12 + arg_368_0 then
				arg_365_1.fswtw_.percent = var_368_8

				arg_365_1.fswtw_:SetDirty()
				arg_365_1:ShowNextGo(true)

				arg_365_1.typewritterCharCountI18N = var_368_9
			end

			local var_368_14 = 0.0999999999999999
			local var_368_15 = 12.033

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 then
				local var_368_16 = "play"
				local var_368_17 = "music"

				arg_365_1:AudioAction(var_368_16, var_368_17, "story_v_out_417221", "417221086", "story_v_out_417221.awb")

				local var_368_18 = ""
				local var_368_19 = manager.audio:GetAudioName("story_v_out_417221", "417221086")

				if var_368_19 ~= "" then
					if arg_365_1.bgmTxt_.text ~= var_368_19 and arg_365_1.bgmTxt_.text ~= "" then
						if arg_365_1.bgmTxt2_.text ~= "" then
							arg_365_1.bgmTxt_.text = arg_365_1.bgmTxt2_.text
						end

						arg_365_1.bgmTxt2_.text = var_368_19

						arg_365_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_365_1.bgmTxt_.text = var_368_19
					end

					if arg_365_1.bgmTimer then
						arg_365_1.bgmTimer:Stop()

						arg_365_1.bgmTimer = nil
					end

					if arg_365_1.settingData.show_music_name == 1 then
						arg_365_1.musicController:SetSelectedState("show")
						arg_365_1.musicAnimator_:Play("open", 0, 0)

						if arg_365_1.settingData.music_time ~= 0 then
							arg_365_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_365_1.settingData.music_time), function()
								if arg_365_1 == nil or isNil(arg_365_1.bgmTxt_) then
									return
								end

								arg_365_1.musicController:SetSelectedState("hide")
								arg_365_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221087 = function(arg_370_0, arg_370_1)
		arg_370_1.time_ = 0
		arg_370_1.frameCnt_ = 0
		arg_370_1.state_ = "playing"
		arg_370_1.curTalkId_ = 417221087
		arg_370_1.duration_ = 7.87

		SetActive(arg_370_1.tipsGo_, false)

		function arg_370_1.onSingleLineFinish_()
			arg_370_1.onSingleLineUpdate_ = nil
			arg_370_1.onSingleLineFinish_ = nil
			arg_370_1.state_ = "waiting"
		end

		function arg_370_1.playNext_(arg_372_0)
			if arg_372_0 == 1 then
				arg_370_0:Play417221088(arg_370_1)
			end
		end

		function arg_370_1.onSingleLineUpdate_(arg_373_0)
			local var_373_0 = 0

			if var_373_0 < arg_370_1.time_ and arg_370_1.time_ <= var_373_0 + arg_373_0 then
				arg_370_1.fswbg_:SetActive(true)
				arg_370_1.dialog_:SetActive(false)

				arg_370_1.fswtw_.percent = 0

				local var_373_1 = arg_370_1:GetWordFromCfg(417221087)
				local var_373_2 = arg_370_1:FormatText(var_373_1.content)

				arg_370_1.fswt_.text = var_373_2

				LuaForUtil.ClearLinePrefixSymbol(arg_370_1.fswt_)

				arg_370_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_370_1.fswtw_:SetDirty()

				arg_370_1.typewritterCharCountI18N = 0

				arg_370_1:ShowNextGo(false)
			end

			local var_373_3 = 0.0999999999999999

			if var_373_3 < arg_370_1.time_ and arg_370_1.time_ <= var_373_3 + arg_373_0 then
				arg_370_1.var_.oldValueTypewriter = arg_370_1.fswtw_.percent

				arg_370_1:ShowNextGo(false)
			end

			local var_373_4 = 34
			local var_373_5 = 2.26666666666667
			local var_373_6 = arg_370_1:GetWordFromCfg(417221087)
			local var_373_7 = arg_370_1:FormatText(var_373_6.content)
			local var_373_8, var_373_9 = arg_370_1:GetPercentByPara(var_373_7, 1)

			if var_373_3 < arg_370_1.time_ and arg_370_1.time_ <= var_373_3 + arg_373_0 then
				arg_370_1.talkMaxDuration = 0

				local var_373_10 = var_373_4 <= 0 and var_373_5 or var_373_5 * ((var_373_9 - arg_370_1.typewritterCharCountI18N) / var_373_4)

				if var_373_10 > 0 and var_373_5 < var_373_10 then
					arg_370_1.talkMaxDuration = var_373_10

					if var_373_10 + var_373_3 > arg_370_1.duration_ then
						arg_370_1.duration_ = var_373_10 + var_373_3
					end
				end
			end

			local var_373_11 = 2.26666666666667
			local var_373_12 = math.max(var_373_11, arg_370_1.talkMaxDuration)

			if var_373_3 <= arg_370_1.time_ and arg_370_1.time_ < var_373_3 + var_373_12 then
				local var_373_13 = (arg_370_1.time_ - var_373_3) / var_373_12

				arg_370_1.fswtw_.percent = Mathf.Lerp(arg_370_1.var_.oldValueTypewriter, var_373_8, var_373_13)
				arg_370_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_370_1.fswtw_:SetDirty()
			end

			if arg_370_1.time_ >= var_373_3 + var_373_12 and arg_370_1.time_ < var_373_3 + var_373_12 + arg_373_0 then
				arg_370_1.fswtw_.percent = var_373_8

				arg_370_1.fswtw_:SetDirty()
				arg_370_1:ShowNextGo(true)

				arg_370_1.typewritterCharCountI18N = var_373_9
			end

			local var_373_14 = 0.1
			local var_373_15 = 7.766

			if var_373_14 < arg_370_1.time_ and arg_370_1.time_ <= var_373_14 + arg_373_0 then
				local var_373_16 = "play"
				local var_373_17 = "music"

				arg_370_1:AudioAction(var_373_16, var_373_17, "story_v_out_417221", "417221087", "story_v_out_417221.awb")

				local var_373_18 = ""
				local var_373_19 = manager.audio:GetAudioName("story_v_out_417221", "417221087")

				if var_373_19 ~= "" then
					if arg_370_1.bgmTxt_.text ~= var_373_19 and arg_370_1.bgmTxt_.text ~= "" then
						if arg_370_1.bgmTxt2_.text ~= "" then
							arg_370_1.bgmTxt_.text = arg_370_1.bgmTxt2_.text
						end

						arg_370_1.bgmTxt2_.text = var_373_19

						arg_370_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_370_1.bgmTxt_.text = var_373_19
					end

					if arg_370_1.bgmTimer then
						arg_370_1.bgmTimer:Stop()

						arg_370_1.bgmTimer = nil
					end

					if arg_370_1.settingData.show_music_name == 1 then
						arg_370_1.musicController:SetSelectedState("show")
						arg_370_1.musicAnimator_:Play("open", 0, 0)

						if arg_370_1.settingData.music_time ~= 0 then
							arg_370_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_370_1.settingData.music_time), function()
								if arg_370_1 == nil or isNil(arg_370_1.bgmTxt_) then
									return
								end

								arg_370_1.musicController:SetSelectedState("hide")
								arg_370_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221088 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 417221088
		arg_375_1.duration_ = 13.17

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play417221089(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.fswbg_:SetActive(true)
				arg_375_1.dialog_:SetActive(false)

				arg_375_1.fswtw_.percent = 0

				local var_378_1 = arg_375_1:GetWordFromCfg(417221088)
				local var_378_2 = arg_375_1:FormatText(var_378_1.content)

				arg_375_1.fswt_.text = var_378_2

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.fswt_)

				arg_375_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_375_1.fswtw_:SetDirty()

				arg_375_1.typewritterCharCountI18N = 0

				arg_375_1:ShowNextGo(false)
			end

			local var_378_3 = 0.0999999999999999

			if var_378_3 < arg_375_1.time_ and arg_375_1.time_ <= var_378_3 + arg_378_0 then
				arg_375_1.var_.oldValueTypewriter = arg_375_1.fswtw_.percent

				arg_375_1:ShowNextGo(false)
			end

			local var_378_4 = 59
			local var_378_5 = 3.93333333333333
			local var_378_6 = arg_375_1:GetWordFromCfg(417221088)
			local var_378_7 = arg_375_1:FormatText(var_378_6.content)
			local var_378_8, var_378_9 = arg_375_1:GetPercentByPara(var_378_7, 1)

			if var_378_3 < arg_375_1.time_ and arg_375_1.time_ <= var_378_3 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0

				local var_378_10 = var_378_4 <= 0 and var_378_5 or var_378_5 * ((var_378_9 - arg_375_1.typewritterCharCountI18N) / var_378_4)

				if var_378_10 > 0 and var_378_5 < var_378_10 then
					arg_375_1.talkMaxDuration = var_378_10

					if var_378_10 + var_378_3 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_10 + var_378_3
					end
				end
			end

			local var_378_11 = 3.93333333333333
			local var_378_12 = math.max(var_378_11, arg_375_1.talkMaxDuration)

			if var_378_3 <= arg_375_1.time_ and arg_375_1.time_ < var_378_3 + var_378_12 then
				local var_378_13 = (arg_375_1.time_ - var_378_3) / var_378_12

				arg_375_1.fswtw_.percent = Mathf.Lerp(arg_375_1.var_.oldValueTypewriter, var_378_8, var_378_13)
				arg_375_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_375_1.fswtw_:SetDirty()
			end

			if arg_375_1.time_ >= var_378_3 + var_378_12 and arg_375_1.time_ < var_378_3 + var_378_12 + arg_378_0 then
				arg_375_1.fswtw_.percent = var_378_8

				arg_375_1.fswtw_:SetDirty()
				arg_375_1:ShowNextGo(true)

				arg_375_1.typewritterCharCountI18N = var_378_9
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1.cswbg_:SetActive(false)
			end

			local var_378_15 = 1

			if var_378_15 < arg_375_1.time_ and arg_375_1.time_ <= var_378_15 + arg_378_0 then
				arg_375_1.cswbg_:SetActive(true)

				local var_378_16 = arg_375_1.cswt_:GetComponent("RectTransform")

				arg_375_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_378_16.offsetMin = Vector2.New(0, 0)
				var_378_16.offsetMax = Vector2.New(0, 0)

				local var_378_17 = arg_375_1:GetWordFromCfg(419115)
				local var_378_18 = arg_375_1:FormatText(var_378_17.content)

				arg_375_1.cswt_.text = var_378_18

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.cswt_)

				arg_375_1.cswt_.fontSize = 120
				arg_375_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_375_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_378_19 = 0.1
			local var_378_20 = 13.066

			if var_378_19 < arg_375_1.time_ and arg_375_1.time_ <= var_378_19 + arg_378_0 then
				local var_378_21 = "play"
				local var_378_22 = "music"

				arg_375_1:AudioAction(var_378_21, var_378_22, "story_v_out_417221", "417221088", "story_v_out_417221.awb")

				local var_378_23 = ""
				local var_378_24 = manager.audio:GetAudioName("story_v_out_417221", "417221088")

				if var_378_24 ~= "" then
					if arg_375_1.bgmTxt_.text ~= var_378_24 and arg_375_1.bgmTxt_.text ~= "" then
						if arg_375_1.bgmTxt2_.text ~= "" then
							arg_375_1.bgmTxt_.text = arg_375_1.bgmTxt2_.text
						end

						arg_375_1.bgmTxt2_.text = var_378_24

						arg_375_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_375_1.bgmTxt_.text = var_378_24
					end

					if arg_375_1.bgmTimer then
						arg_375_1.bgmTimer:Stop()

						arg_375_1.bgmTimer = nil
					end

					if arg_375_1.settingData.show_music_name == 1 then
						arg_375_1.musicController:SetSelectedState("show")
						arg_375_1.musicAnimator_:Play("open", 0, 0)

						if arg_375_1.settingData.music_time ~= 0 then
							arg_375_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_375_1.settingData.music_time), function()
								if arg_375_1 == nil or isNil(arg_375_1.bgmTxt_) then
									return
								end

								arg_375_1.musicController:SetSelectedState("hide")
								arg_375_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221089 = function(arg_380_0, arg_380_1)
		arg_380_1.time_ = 0
		arg_380_1.frameCnt_ = 0
		arg_380_1.state_ = "playing"
		arg_380_1.curTalkId_ = 417221089
		arg_380_1.duration_ = 13.03

		SetActive(arg_380_1.tipsGo_, false)

		function arg_380_1.onSingleLineFinish_()
			arg_380_1.onSingleLineUpdate_ = nil
			arg_380_1.onSingleLineFinish_ = nil
			arg_380_1.state_ = "waiting"
		end

		function arg_380_1.playNext_(arg_382_0)
			if arg_382_0 == 1 then
				arg_380_0:Play417221090(arg_380_1)
			end
		end

		function arg_380_1.onSingleLineUpdate_(arg_383_0)
			local var_383_0 = 0

			if var_383_0 < arg_380_1.time_ and arg_380_1.time_ <= var_383_0 + arg_383_0 then
				arg_380_1.fswbg_:SetActive(true)
				arg_380_1.dialog_:SetActive(false)

				arg_380_1.fswtw_.percent = 0

				local var_383_1 = arg_380_1:GetWordFromCfg(417221089)
				local var_383_2 = arg_380_1:FormatText(var_383_1.content)

				arg_380_1.fswt_.text = var_383_2

				LuaForUtil.ClearLinePrefixSymbol(arg_380_1.fswt_)

				arg_380_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_380_1.fswtw_:SetDirty()

				arg_380_1.typewritterCharCountI18N = 0

				arg_380_1:ShowNextGo(false)
			end

			local var_383_3 = 0.0999999999999999

			if var_383_3 < arg_380_1.time_ and arg_380_1.time_ <= var_383_3 + arg_383_0 then
				arg_380_1.var_.oldValueTypewriter = arg_380_1.fswtw_.percent

				arg_380_1:ShowNextGo(false)
			end

			local var_383_4 = 54
			local var_383_5 = 3.6
			local var_383_6 = arg_380_1:GetWordFromCfg(417221089)
			local var_383_7 = arg_380_1:FormatText(var_383_6.content)
			local var_383_8, var_383_9 = arg_380_1:GetPercentByPara(var_383_7, 1)

			if var_383_3 < arg_380_1.time_ and arg_380_1.time_ <= var_383_3 + arg_383_0 then
				arg_380_1.talkMaxDuration = 0

				local var_383_10 = var_383_4 <= 0 and var_383_5 or var_383_5 * ((var_383_9 - arg_380_1.typewritterCharCountI18N) / var_383_4)

				if var_383_10 > 0 and var_383_5 < var_383_10 then
					arg_380_1.talkMaxDuration = var_383_10

					if var_383_10 + var_383_3 > arg_380_1.duration_ then
						arg_380_1.duration_ = var_383_10 + var_383_3
					end
				end
			end

			local var_383_11 = 3.6
			local var_383_12 = math.max(var_383_11, arg_380_1.talkMaxDuration)

			if var_383_3 <= arg_380_1.time_ and arg_380_1.time_ < var_383_3 + var_383_12 then
				local var_383_13 = (arg_380_1.time_ - var_383_3) / var_383_12

				arg_380_1.fswtw_.percent = Mathf.Lerp(arg_380_1.var_.oldValueTypewriter, var_383_8, var_383_13)
				arg_380_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_380_1.fswtw_:SetDirty()
			end

			if arg_380_1.time_ >= var_383_3 + var_383_12 and arg_380_1.time_ < var_383_3 + var_383_12 + arg_383_0 then
				arg_380_1.fswtw_.percent = var_383_8

				arg_380_1.fswtw_:SetDirty()
				arg_380_1:ShowNextGo(true)

				arg_380_1.typewritterCharCountI18N = var_383_9
			end

			local var_383_14 = 0.0999999999999999
			local var_383_15 = 12.933

			if var_383_14 < arg_380_1.time_ and arg_380_1.time_ <= var_383_14 + arg_383_0 then
				local var_383_16 = "play"
				local var_383_17 = "music"

				arg_380_1:AudioAction(var_383_16, var_383_17, "story_v_out_417221", "417221089", "story_v_out_417221.awb")

				local var_383_18 = ""
				local var_383_19 = manager.audio:GetAudioName("story_v_out_417221", "417221089")

				if var_383_19 ~= "" then
					if arg_380_1.bgmTxt_.text ~= var_383_19 and arg_380_1.bgmTxt_.text ~= "" then
						if arg_380_1.bgmTxt2_.text ~= "" then
							arg_380_1.bgmTxt_.text = arg_380_1.bgmTxt2_.text
						end

						arg_380_1.bgmTxt2_.text = var_383_19

						arg_380_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_380_1.bgmTxt_.text = var_383_19
					end

					if arg_380_1.bgmTimer then
						arg_380_1.bgmTimer:Stop()

						arg_380_1.bgmTimer = nil
					end

					if arg_380_1.settingData.show_music_name == 1 then
						arg_380_1.musicController:SetSelectedState("show")
						arg_380_1.musicAnimator_:Play("open", 0, 0)

						if arg_380_1.settingData.music_time ~= 0 then
							arg_380_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_380_1.settingData.music_time), function()
								if arg_380_1 == nil or isNil(arg_380_1.bgmTxt_) then
									return
								end

								arg_380_1.musicController:SetSelectedState("hide")
								arg_380_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221090 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 417221090
		arg_385_1.duration_ = 11.6

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play417221091(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.fswbg_:SetActive(true)
				arg_385_1.dialog_:SetActive(false)

				arg_385_1.fswtw_.percent = 0

				local var_388_1 = arg_385_1:GetWordFromCfg(417221090)
				local var_388_2 = arg_385_1:FormatText(var_388_1.content)

				arg_385_1.fswt_.text = var_388_2

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.fswt_)

				arg_385_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_385_1.fswtw_:SetDirty()

				arg_385_1.typewritterCharCountI18N = 0

				arg_385_1:ShowNextGo(false)
			end

			local var_388_3 = 0.0999999999999999

			if var_388_3 < arg_385_1.time_ and arg_385_1.time_ <= var_388_3 + arg_388_0 then
				arg_385_1.var_.oldValueTypewriter = arg_385_1.fswtw_.percent

				arg_385_1:ShowNextGo(false)
			end

			local var_388_4 = 54
			local var_388_5 = 2.33333333333333
			local var_388_6 = arg_385_1:GetWordFromCfg(417221090)
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

			local var_388_11 = 2.33333333333333
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

			local var_388_14 = 0.0999999999999999
			local var_388_15 = 11.5

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				local var_388_16 = "play"
				local var_388_17 = "music"

				arg_385_1:AudioAction(var_388_16, var_388_17, "story_v_out_417221", "417221090", "story_v_out_417221.awb")

				local var_388_18 = ""
				local var_388_19 = manager.audio:GetAudioName("story_v_out_417221", "417221090")

				if var_388_19 ~= "" then
					if arg_385_1.bgmTxt_.text ~= var_388_19 and arg_385_1.bgmTxt_.text ~= "" then
						if arg_385_1.bgmTxt2_.text ~= "" then
							arg_385_1.bgmTxt_.text = arg_385_1.bgmTxt2_.text
						end

						arg_385_1.bgmTxt2_.text = var_388_19

						arg_385_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_385_1.bgmTxt_.text = var_388_19
					end

					if arg_385_1.bgmTimer then
						arg_385_1.bgmTimer:Stop()

						arg_385_1.bgmTimer = nil
					end

					if arg_385_1.settingData.show_music_name == 1 then
						arg_385_1.musicController:SetSelectedState("show")
						arg_385_1.musicAnimator_:Play("open", 0, 0)

						if arg_385_1.settingData.music_time ~= 0 then
							arg_385_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_385_1.settingData.music_time), function()
								if arg_385_1 == nil or isNil(arg_385_1.bgmTxt_) then
									return
								end

								arg_385_1.musicController:SetSelectedState("hide")
								arg_385_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221091 = function(arg_390_0, arg_390_1)
		arg_390_1.time_ = 0
		arg_390_1.frameCnt_ = 0
		arg_390_1.state_ = "playing"
		arg_390_1.curTalkId_ = 417221091
		arg_390_1.duration_ = 12.47

		SetActive(arg_390_1.tipsGo_, false)

		function arg_390_1.onSingleLineFinish_()
			arg_390_1.onSingleLineUpdate_ = nil
			arg_390_1.onSingleLineFinish_ = nil
			arg_390_1.state_ = "waiting"
		end

		function arg_390_1.playNext_(arg_392_0)
			if arg_392_0 == 1 then
				arg_390_0:Play417221092(arg_390_1)
			end
		end

		function arg_390_1.onSingleLineUpdate_(arg_393_0)
			local var_393_0 = 0

			if var_393_0 < arg_390_1.time_ and arg_390_1.time_ <= var_393_0 + arg_393_0 then
				arg_390_1.fswbg_:SetActive(true)
				arg_390_1.dialog_:SetActive(false)

				arg_390_1.fswtw_.percent = 0

				local var_393_1 = arg_390_1:GetWordFromCfg(417221091)
				local var_393_2 = arg_390_1:FormatText(var_393_1.content)

				arg_390_1.fswt_.text = var_393_2

				LuaForUtil.ClearLinePrefixSymbol(arg_390_1.fswt_)

				arg_390_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_390_1.fswtw_:SetDirty()

				arg_390_1.typewritterCharCountI18N = 0

				arg_390_1:ShowNextGo(false)
			end

			local var_393_3 = 0.0999999999999999

			if var_393_3 < arg_390_1.time_ and arg_390_1.time_ <= var_393_3 + arg_393_0 then
				arg_390_1.var_.oldValueTypewriter = arg_390_1.fswtw_.percent

				arg_390_1:ShowNextGo(false)
			end

			local var_393_4 = 47
			local var_393_5 = 3.13333333333333
			local var_393_6 = arg_390_1:GetWordFromCfg(417221091)
			local var_393_7 = arg_390_1:FormatText(var_393_6.content)
			local var_393_8, var_393_9 = arg_390_1:GetPercentByPara(var_393_7, 1)

			if var_393_3 < arg_390_1.time_ and arg_390_1.time_ <= var_393_3 + arg_393_0 then
				arg_390_1.talkMaxDuration = 0

				local var_393_10 = var_393_4 <= 0 and var_393_5 or var_393_5 * ((var_393_9 - arg_390_1.typewritterCharCountI18N) / var_393_4)

				if var_393_10 > 0 and var_393_5 < var_393_10 then
					arg_390_1.talkMaxDuration = var_393_10

					if var_393_10 + var_393_3 > arg_390_1.duration_ then
						arg_390_1.duration_ = var_393_10 + var_393_3
					end
				end
			end

			local var_393_11 = 3.13333333333333
			local var_393_12 = math.max(var_393_11, arg_390_1.talkMaxDuration)

			if var_393_3 <= arg_390_1.time_ and arg_390_1.time_ < var_393_3 + var_393_12 then
				local var_393_13 = (arg_390_1.time_ - var_393_3) / var_393_12

				arg_390_1.fswtw_.percent = Mathf.Lerp(arg_390_1.var_.oldValueTypewriter, var_393_8, var_393_13)
				arg_390_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_390_1.fswtw_:SetDirty()
			end

			if arg_390_1.time_ >= var_393_3 + var_393_12 and arg_390_1.time_ < var_393_3 + var_393_12 + arg_393_0 then
				arg_390_1.fswtw_.percent = var_393_8

				arg_390_1.fswtw_:SetDirty()
				arg_390_1:ShowNextGo(true)

				arg_390_1.typewritterCharCountI18N = var_393_9
			end

			local var_393_14 = 0.0999999999999999
			local var_393_15 = 12.366

			if var_393_14 < arg_390_1.time_ and arg_390_1.time_ <= var_393_14 + arg_393_0 then
				local var_393_16 = "play"
				local var_393_17 = "music"

				arg_390_1:AudioAction(var_393_16, var_393_17, "story_v_out_417221", "417221091", "story_v_out_417221.awb")

				local var_393_18 = ""
				local var_393_19 = manager.audio:GetAudioName("story_v_out_417221", "417221091")

				if var_393_19 ~= "" then
					if arg_390_1.bgmTxt_.text ~= var_393_19 and arg_390_1.bgmTxt_.text ~= "" then
						if arg_390_1.bgmTxt2_.text ~= "" then
							arg_390_1.bgmTxt_.text = arg_390_1.bgmTxt2_.text
						end

						arg_390_1.bgmTxt2_.text = var_393_19

						arg_390_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_390_1.bgmTxt_.text = var_393_19
					end

					if arg_390_1.bgmTimer then
						arg_390_1.bgmTimer:Stop()

						arg_390_1.bgmTimer = nil
					end

					if arg_390_1.settingData.show_music_name == 1 then
						arg_390_1.musicController:SetSelectedState("show")
						arg_390_1.musicAnimator_:Play("open", 0, 0)

						if arg_390_1.settingData.music_time ~= 0 then
							arg_390_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_390_1.settingData.music_time), function()
								if arg_390_1 == nil or isNil(arg_390_1.bgmTxt_) then
									return
								end

								arg_390_1.musicController:SetSelectedState("hide")
								arg_390_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221092 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 417221092
		arg_395_1.duration_ = 13.37

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play417221093(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = 2

			if var_398_0 < arg_395_1.time_ and arg_395_1.time_ <= var_398_0 + arg_398_0 then
				local var_398_1 = manager.ui.mainCamera.transform.localPosition
				local var_398_2 = Vector3.New(0, 0, 10) + Vector3.New(var_398_1.x, var_398_1.y, 0)
				local var_398_3 = arg_395_1.bgs_.I16f

				var_398_3.transform.localPosition = var_398_2
				var_398_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_398_4 = var_398_3:GetComponent("SpriteRenderer")

				if var_398_4 and var_398_4.sprite then
					local var_398_5 = (var_398_3.transform.localPosition - var_398_1).z
					local var_398_6 = manager.ui.mainCameraCom_
					local var_398_7 = 2 * var_398_5 * Mathf.Tan(var_398_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_398_8 = var_398_7 * var_398_6.aspect
					local var_398_9 = var_398_4.sprite.bounds.size.x
					local var_398_10 = var_398_4.sprite.bounds.size.y
					local var_398_11 = var_398_8 / var_398_9
					local var_398_12 = var_398_7 / var_398_10
					local var_398_13 = var_398_12 < var_398_11 and var_398_11 or var_398_12

					var_398_3.transform.localScale = Vector3.New(var_398_13, var_398_13, 0)
				end

				for iter_398_0, iter_398_1 in pairs(arg_395_1.bgs_) do
					if iter_398_0 ~= "I16f" then
						iter_398_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_398_14 = 4

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 then
				arg_395_1.allBtn_.enabled = false
			end

			local var_398_15 = 0.3

			if arg_395_1.time_ >= var_398_14 + var_398_15 and arg_395_1.time_ < var_398_14 + var_398_15 + arg_398_0 then
				arg_395_1.allBtn_.enabled = true
			end

			local var_398_16 = 0

			if var_398_16 < arg_395_1.time_ and arg_395_1.time_ <= var_398_16 + arg_398_0 then
				arg_395_1.mask_.enabled = true
				arg_395_1.mask_.raycastTarget = true

				arg_395_1:SetGaussion(false)
			end

			local var_398_17 = 2

			if var_398_16 <= arg_395_1.time_ and arg_395_1.time_ < var_398_16 + var_398_17 then
				local var_398_18 = (arg_395_1.time_ - var_398_16) / var_398_17
				local var_398_19 = Color.New(0, 0, 0)

				var_398_19.a = Mathf.Lerp(0, 1, var_398_18)
				arg_395_1.mask_.color = var_398_19
			end

			if arg_395_1.time_ >= var_398_16 + var_398_17 and arg_395_1.time_ < var_398_16 + var_398_17 + arg_398_0 then
				local var_398_20 = Color.New(0, 0, 0)

				var_398_20.a = 1
				arg_395_1.mask_.color = var_398_20
			end

			local var_398_21 = 2

			if var_398_21 < arg_395_1.time_ and arg_395_1.time_ <= var_398_21 + arg_398_0 then
				arg_395_1.mask_.enabled = true
				arg_395_1.mask_.raycastTarget = true

				arg_395_1:SetGaussion(false)
			end

			local var_398_22 = 2

			if var_398_21 <= arg_395_1.time_ and arg_395_1.time_ < var_398_21 + var_398_22 then
				local var_398_23 = (arg_395_1.time_ - var_398_21) / var_398_22
				local var_398_24 = Color.New(0, 0, 0)

				var_398_24.a = Mathf.Lerp(1, 0, var_398_23)
				arg_395_1.mask_.color = var_398_24
			end

			if arg_395_1.time_ >= var_398_21 + var_398_22 and arg_395_1.time_ < var_398_21 + var_398_22 + arg_398_0 then
				local var_398_25 = Color.New(0, 0, 0)
				local var_398_26 = 0

				arg_395_1.mask_.enabled = false
				var_398_25.a = var_398_26
				arg_395_1.mask_.color = var_398_25
			end

			local var_398_27 = arg_395_1.actors_["10113"].transform
			local var_398_28 = 1.96666666666667

			if var_398_28 < arg_395_1.time_ and arg_395_1.time_ <= var_398_28 + arg_398_0 then
				arg_395_1.var_.moveOldPos10113 = var_398_27.localPosition
				var_398_27.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("10113", 7)

				local var_398_29 = var_398_27.childCount

				for iter_398_2 = 0, var_398_29 - 1 do
					local var_398_30 = var_398_27:GetChild(iter_398_2)

					if var_398_30.name == "" or not string.find(var_398_30.name, "split") then
						var_398_30.gameObject:SetActive(true)
					else
						var_398_30.gameObject:SetActive(false)
					end
				end
			end

			local var_398_31 = 0.001

			if var_398_28 <= arg_395_1.time_ and arg_395_1.time_ < var_398_28 + var_398_31 then
				local var_398_32 = (arg_395_1.time_ - var_398_28) / var_398_31
				local var_398_33 = Vector3.New(0, -2000, 0)

				var_398_27.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos10113, var_398_33, var_398_32)
			end

			if arg_395_1.time_ >= var_398_28 + var_398_31 and arg_395_1.time_ < var_398_28 + var_398_31 + arg_398_0 then
				var_398_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_398_34 = arg_395_1.actors_["10113"].transform
			local var_398_35 = 3.76666666666667

			if var_398_35 < arg_395_1.time_ and arg_395_1.time_ <= var_398_35 + arg_398_0 then
				arg_395_1.var_.moveOldPos10113 = var_398_34.localPosition
				var_398_34.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("10113", 3)

				local var_398_36 = var_398_34.childCount

				for iter_398_3 = 0, var_398_36 - 1 do
					local var_398_37 = var_398_34:GetChild(iter_398_3)

					if var_398_37.name == "split_3" or not string.find(var_398_37.name, "split") then
						var_398_37.gameObject:SetActive(true)
					else
						var_398_37.gameObject:SetActive(false)
					end
				end
			end

			local var_398_38 = 0.001

			if var_398_35 <= arg_395_1.time_ and arg_395_1.time_ < var_398_35 + var_398_38 then
				local var_398_39 = (arg_395_1.time_ - var_398_35) / var_398_38
				local var_398_40 = Vector3.New(-30.38, -328.4, -517.4)

				var_398_34.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos10113, var_398_40, var_398_39)
			end

			if arg_395_1.time_ >= var_398_35 + var_398_38 and arg_395_1.time_ < var_398_35 + var_398_38 + arg_398_0 then
				var_398_34.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_398_41 = arg_395_1.actors_["10113"]
			local var_398_42 = 3.76666666666667

			if var_398_42 < arg_395_1.time_ and arg_395_1.time_ <= var_398_42 + arg_398_0 then
				local var_398_43 = var_398_41:GetComponentInChildren(typeof(CanvasGroup))

				if var_398_43 then
					arg_395_1.var_.alphaOldValue10113 = var_398_43.alpha
					arg_395_1.var_.characterEffect10113 = var_398_43
				end

				arg_395_1.var_.alphaOldValue10113 = 0
			end

			local var_398_44 = 0.233333333333333

			if var_398_42 <= arg_395_1.time_ and arg_395_1.time_ < var_398_42 + var_398_44 then
				local var_398_45 = (arg_395_1.time_ - var_398_42) / var_398_44
				local var_398_46 = Mathf.Lerp(arg_395_1.var_.alphaOldValue10113, 1, var_398_45)

				if arg_395_1.var_.characterEffect10113 then
					arg_395_1.var_.characterEffect10113.alpha = var_398_46
				end
			end

			if arg_395_1.time_ >= var_398_42 + var_398_44 and arg_395_1.time_ < var_398_42 + var_398_44 + arg_398_0 and arg_395_1.var_.characterEffect10113 then
				arg_395_1.var_.characterEffect10113.alpha = 1
			end

			local var_398_47 = arg_395_1.actors_["10113"]
			local var_398_48 = 3.76666666666667

			if var_398_48 < arg_395_1.time_ and arg_395_1.time_ <= var_398_48 + arg_398_0 and not isNil(var_398_47) and arg_395_1.var_.actorSpriteComps10113 == nil then
				arg_395_1.var_.actorSpriteComps10113 = var_398_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_49 = 0.2

			if var_398_48 <= arg_395_1.time_ and arg_395_1.time_ < var_398_48 + var_398_49 and not isNil(var_398_47) then
				local var_398_50 = (arg_395_1.time_ - var_398_48) / var_398_49

				if arg_395_1.var_.actorSpriteComps10113 then
					for iter_398_4, iter_398_5 in pairs(arg_395_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_398_5 then
							if arg_395_1.isInRecall_ then
								local var_398_51 = Mathf.Lerp(iter_398_5.color.r, arg_395_1.hightColor1.r, var_398_50)
								local var_398_52 = Mathf.Lerp(iter_398_5.color.g, arg_395_1.hightColor1.g, var_398_50)
								local var_398_53 = Mathf.Lerp(iter_398_5.color.b, arg_395_1.hightColor1.b, var_398_50)

								iter_398_5.color = Color.New(var_398_51, var_398_52, var_398_53)
							else
								local var_398_54 = Mathf.Lerp(iter_398_5.color.r, 1, var_398_50)

								iter_398_5.color = Color.New(var_398_54, var_398_54, var_398_54)
							end
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_48 + var_398_49 and arg_395_1.time_ < var_398_48 + var_398_49 + arg_398_0 and not isNil(var_398_47) and arg_395_1.var_.actorSpriteComps10113 then
				for iter_398_6, iter_398_7 in pairs(arg_395_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_398_7 then
						if arg_395_1.isInRecall_ then
							iter_398_7.color = arg_395_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_398_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_395_1.var_.actorSpriteComps10113 = nil
			end

			local var_398_55 = 1.90066666666667

			if var_398_55 < arg_395_1.time_ and arg_395_1.time_ <= var_398_55 + arg_398_0 then
				arg_395_1.cswbg_:SetActive(false)
			end

			local var_398_56 = 1.90066666666667

			if var_398_56 < arg_395_1.time_ and arg_395_1.time_ <= var_398_56 + arg_398_0 then
				arg_395_1.fswbg_:SetActive(false)
				arg_395_1.dialog_:SetActive(false)
				arg_395_1:ShowNextGo(false)
			end

			if arg_395_1.frameCnt_ <= 1 then
				arg_395_1.dialog_:SetActive(false)
			end

			local var_398_57 = 4
			local var_398_58 = 0.625

			if var_398_57 < arg_395_1.time_ and arg_395_1.time_ <= var_398_57 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0

				arg_395_1.dialog_:SetActive(true)

				local var_398_59 = LeanTween.value(arg_395_1.dialog_, 0, 1, 0.3)

				var_398_59:setOnUpdate(LuaHelper.FloatAction(function(arg_399_0)
					arg_395_1.dialogCg_.alpha = arg_399_0
				end))
				var_398_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_395_1.dialog_)
					var_398_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_395_1.duration_ = arg_395_1.duration_ + 0.3

				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_60 = arg_395_1:FormatText(StoryNameCfg[1117].name)

				arg_395_1.leftNameTxt_.text = var_398_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_61 = arg_395_1:GetWordFromCfg(417221092)
				local var_398_62 = arg_395_1:FormatText(var_398_61.content)

				arg_395_1.text_.text = var_398_62

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_63 = 25
				local var_398_64 = utf8.len(var_398_62)
				local var_398_65 = var_398_63 <= 0 and var_398_58 or var_398_58 * (var_398_64 / var_398_63)

				if var_398_65 > 0 and var_398_58 < var_398_65 then
					arg_395_1.talkMaxDuration = var_398_65
					var_398_57 = var_398_57 + 0.3

					if var_398_65 + var_398_57 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_65 + var_398_57
					end
				end

				arg_395_1.text_.text = var_398_62
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221092", "story_v_out_417221.awb") ~= 0 then
					local var_398_66 = manager.audio:GetVoiceLength("story_v_out_417221", "417221092", "story_v_out_417221.awb") / 1000

					if var_398_66 + var_398_57 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_66 + var_398_57
					end

					if var_398_61.prefab_name ~= "" and arg_395_1.actors_[var_398_61.prefab_name] ~= nil then
						local var_398_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_61.prefab_name].transform, "story_v_out_417221", "417221092", "story_v_out_417221.awb")

						arg_395_1:RecordAudio("417221092", var_398_67)
						arg_395_1:RecordAudio("417221092", var_398_67)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_417221", "417221092", "story_v_out_417221.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_417221", "417221092", "story_v_out_417221.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_68 = var_398_57 + 0.3
			local var_398_69 = math.max(var_398_58, arg_395_1.talkMaxDuration)

			if var_398_68 <= arg_395_1.time_ and arg_395_1.time_ < var_398_68 + var_398_69 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_68) / var_398_69

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_68 + var_398_69 and arg_395_1.time_ < var_398_68 + var_398_69 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play417221093 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 417221093
		arg_401_1.duration_ = 6.07

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play417221094(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10113"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and not isNil(var_404_0) and arg_401_1.var_.actorSpriteComps10113 == nil then
				arg_401_1.var_.actorSpriteComps10113 = var_404_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_2 = 0.2

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 and not isNil(var_404_0) then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.actorSpriteComps10113 then
					for iter_404_0, iter_404_1 in pairs(arg_401_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_404_1 then
							if arg_401_1.isInRecall_ then
								local var_404_4 = Mathf.Lerp(iter_404_1.color.r, arg_401_1.hightColor2.r, var_404_3)
								local var_404_5 = Mathf.Lerp(iter_404_1.color.g, arg_401_1.hightColor2.g, var_404_3)
								local var_404_6 = Mathf.Lerp(iter_404_1.color.b, arg_401_1.hightColor2.b, var_404_3)

								iter_404_1.color = Color.New(var_404_4, var_404_5, var_404_6)
							else
								local var_404_7 = Mathf.Lerp(iter_404_1.color.r, 0.5, var_404_3)

								iter_404_1.color = Color.New(var_404_7, var_404_7, var_404_7)
							end
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and not isNil(var_404_0) and arg_401_1.var_.actorSpriteComps10113 then
				for iter_404_2, iter_404_3 in pairs(arg_401_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_404_3 then
						if arg_401_1.isInRecall_ then
							iter_404_3.color = arg_401_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_404_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_401_1.var_.actorSpriteComps10113 = nil
			end

			local var_404_8 = 0
			local var_404_9 = 0.775

			if var_404_8 < arg_401_1.time_ and arg_401_1.time_ <= var_404_8 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_10 = arg_401_1:FormatText(StoryNameCfg[1150].name)

				arg_401_1.leftNameTxt_.text = var_404_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, true)
				arg_401_1.iconController_:SetSelectedState("hero")

				arg_401_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_401_1.callingController_:SetSelectedState("normal")

				arg_401_1.keyicon_.color = Color.New(1, 1, 1)
				arg_401_1.icon_.color = Color.New(1, 1, 1)

				local var_404_11 = arg_401_1:GetWordFromCfg(417221093)
				local var_404_12 = arg_401_1:FormatText(var_404_11.content)

				arg_401_1.text_.text = var_404_12

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_13 = 31
				local var_404_14 = utf8.len(var_404_12)
				local var_404_15 = var_404_13 <= 0 and var_404_9 or var_404_9 * (var_404_14 / var_404_13)

				if var_404_15 > 0 and var_404_9 < var_404_15 then
					arg_401_1.talkMaxDuration = var_404_15

					if var_404_15 + var_404_8 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_15 + var_404_8
					end
				end

				arg_401_1.text_.text = var_404_12
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221093", "story_v_out_417221.awb") ~= 0 then
					local var_404_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221093", "story_v_out_417221.awb") / 1000

					if var_404_16 + var_404_8 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_16 + var_404_8
					end

					if var_404_11.prefab_name ~= "" and arg_401_1.actors_[var_404_11.prefab_name] ~= nil then
						local var_404_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_11.prefab_name].transform, "story_v_out_417221", "417221093", "story_v_out_417221.awb")

						arg_401_1:RecordAudio("417221093", var_404_17)
						arg_401_1:RecordAudio("417221093", var_404_17)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_417221", "417221093", "story_v_out_417221.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_417221", "417221093", "story_v_out_417221.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_18 = math.max(var_404_9, arg_401_1.talkMaxDuration)

			if var_404_8 <= arg_401_1.time_ and arg_401_1.time_ < var_404_8 + var_404_18 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_8) / var_404_18

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_8 + var_404_18 and arg_401_1.time_ < var_404_8 + var_404_18 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play417221094 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 417221094
		arg_405_1.duration_ = 11.47

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play417221095(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 1

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				local var_408_1 = manager.ui.mainCamera.transform.localPosition
				local var_408_2 = Vector3.New(0, 0, 10) + Vector3.New(var_408_1.x, var_408_1.y, 0)
				local var_408_3 = arg_405_1.bgs_.STblack

				var_408_3.transform.localPosition = var_408_2
				var_408_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_408_4 = var_408_3:GetComponent("SpriteRenderer")

				if var_408_4 and var_408_4.sprite then
					local var_408_5 = (var_408_3.transform.localPosition - var_408_1).z
					local var_408_6 = manager.ui.mainCameraCom_
					local var_408_7 = 2 * var_408_5 * Mathf.Tan(var_408_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_408_8 = var_408_7 * var_408_6.aspect
					local var_408_9 = var_408_4.sprite.bounds.size.x
					local var_408_10 = var_408_4.sprite.bounds.size.y
					local var_408_11 = var_408_8 / var_408_9
					local var_408_12 = var_408_7 / var_408_10
					local var_408_13 = var_408_12 < var_408_11 and var_408_11 or var_408_12

					var_408_3.transform.localScale = Vector3.New(var_408_13, var_408_13, 0)
				end

				for iter_408_0, iter_408_1 in pairs(arg_405_1.bgs_) do
					if iter_408_0 ~= "STblack" then
						iter_408_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_408_14 = 0

			if var_408_14 < arg_405_1.time_ and arg_405_1.time_ <= var_408_14 + arg_408_0 then
				arg_405_1.mask_.enabled = true
				arg_405_1.mask_.raycastTarget = true

				arg_405_1:SetGaussion(false)
			end

			local var_408_15 = 1

			if var_408_14 <= arg_405_1.time_ and arg_405_1.time_ < var_408_14 + var_408_15 then
				local var_408_16 = (arg_405_1.time_ - var_408_14) / var_408_15
				local var_408_17 = Color.New(0, 0, 0)

				var_408_17.a = Mathf.Lerp(0, 1, var_408_16)
				arg_405_1.mask_.color = var_408_17
			end

			if arg_405_1.time_ >= var_408_14 + var_408_15 and arg_405_1.time_ < var_408_14 + var_408_15 + arg_408_0 then
				local var_408_18 = Color.New(0, 0, 0)

				var_408_18.a = 1
				arg_405_1.mask_.color = var_408_18
			end

			local var_408_19 = 1

			if var_408_19 < arg_405_1.time_ and arg_405_1.time_ <= var_408_19 + arg_408_0 then
				arg_405_1.mask_.enabled = true
				arg_405_1.mask_.raycastTarget = true

				arg_405_1:SetGaussion(false)
			end

			local var_408_20 = 0.966666666666667

			if var_408_19 <= arg_405_1.time_ and arg_405_1.time_ < var_408_19 + var_408_20 then
				local var_408_21 = (arg_405_1.time_ - var_408_19) / var_408_20
				local var_408_22 = Color.New(0, 0, 0)

				var_408_22.a = Mathf.Lerp(1, 0, var_408_21)
				arg_405_1.mask_.color = var_408_22
			end

			if arg_405_1.time_ >= var_408_19 + var_408_20 and arg_405_1.time_ < var_408_19 + var_408_20 + arg_408_0 then
				local var_408_23 = Color.New(0, 0, 0)
				local var_408_24 = 0

				arg_405_1.mask_.enabled = false
				var_408_23.a = var_408_24
				arg_405_1.mask_.color = var_408_23
			end

			local var_408_25 = 1

			if var_408_25 < arg_405_1.time_ and arg_405_1.time_ <= var_408_25 + arg_408_0 then
				arg_405_1.cswbg_:SetActive(true)

				local var_408_26 = arg_405_1.cswt_:GetComponent("RectTransform")

				arg_405_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_408_26.offsetMin = Vector2.New(0, 0)
				var_408_26.offsetMax = Vector2.New(0, 0)

				local var_408_27 = arg_405_1:GetWordFromCfg(419116)
				local var_408_28 = arg_405_1:FormatText(var_408_27.content)

				arg_405_1.cswt_.text = var_408_28

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.cswt_)

				arg_405_1.cswt_.fontSize = 120
				arg_405_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_405_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_408_29 = arg_405_1.actors_["10113"].transform
			local var_408_30 = 0.966

			if var_408_30 < arg_405_1.time_ and arg_405_1.time_ <= var_408_30 + arg_408_0 then
				arg_405_1.var_.moveOldPos10113 = var_408_29.localPosition
				var_408_29.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("10113", 7)

				local var_408_31 = var_408_29.childCount

				for iter_408_2 = 0, var_408_31 - 1 do
					local var_408_32 = var_408_29:GetChild(iter_408_2)

					if var_408_32.name == "" or not string.find(var_408_32.name, "split") then
						var_408_32.gameObject:SetActive(true)
					else
						var_408_32.gameObject:SetActive(false)
					end
				end
			end

			local var_408_33 = 0.001

			if var_408_30 <= arg_405_1.time_ and arg_405_1.time_ < var_408_30 + var_408_33 then
				local var_408_34 = (arg_405_1.time_ - var_408_30) / var_408_33
				local var_408_35 = Vector3.New(0, -2000, 0)

				var_408_29.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10113, var_408_35, var_408_34)
			end

			if arg_405_1.time_ >= var_408_30 + var_408_33 and arg_405_1.time_ < var_408_30 + var_408_33 + arg_408_0 then
				var_408_29.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_408_36 = 1

			if var_408_36 < arg_405_1.time_ and arg_405_1.time_ <= var_408_36 + arg_408_0 then
				arg_405_1.fswbg_:SetActive(true)
				arg_405_1.dialog_:SetActive(false)

				arg_405_1.fswtw_.percent = 0

				local var_408_37 = arg_405_1:GetWordFromCfg(417221094)
				local var_408_38 = arg_405_1:FormatText(var_408_37.content)

				arg_405_1.fswt_.text = var_408_38

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.fswt_)

				arg_405_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_405_1.fswtw_:SetDirty()

				arg_405_1.typewritterCharCountI18N = 0

				arg_405_1:ShowNextGo(false)
			end

			local var_408_39 = 1.96666666666667

			if var_408_39 < arg_405_1.time_ and arg_405_1.time_ <= var_408_39 + arg_408_0 then
				arg_405_1.var_.oldValueTypewriter = arg_405_1.fswtw_.percent

				arg_405_1:ShowNextGo(false)
			end

			local var_408_40 = 36
			local var_408_41 = 2.4
			local var_408_42 = arg_405_1:GetWordFromCfg(417221094)
			local var_408_43 = arg_405_1:FormatText(var_408_42.content)
			local var_408_44, var_408_45 = arg_405_1:GetPercentByPara(var_408_43, 1)

			if var_408_39 < arg_405_1.time_ and arg_405_1.time_ <= var_408_39 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0

				local var_408_46 = var_408_40 <= 0 and var_408_41 or var_408_41 * ((var_408_45 - arg_405_1.typewritterCharCountI18N) / var_408_40)

				if var_408_46 > 0 and var_408_41 < var_408_46 then
					arg_405_1.talkMaxDuration = var_408_46

					if var_408_46 + var_408_39 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_46 + var_408_39
					end
				end
			end

			local var_408_47 = 2.4
			local var_408_48 = math.max(var_408_47, arg_405_1.talkMaxDuration)

			if var_408_39 <= arg_405_1.time_ and arg_405_1.time_ < var_408_39 + var_408_48 then
				local var_408_49 = (arg_405_1.time_ - var_408_39) / var_408_48

				arg_405_1.fswtw_.percent = Mathf.Lerp(arg_405_1.var_.oldValueTypewriter, var_408_44, var_408_49)
				arg_405_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_405_1.fswtw_:SetDirty()
			end

			if arg_405_1.time_ >= var_408_39 + var_408_48 and arg_405_1.time_ < var_408_39 + var_408_48 + arg_408_0 then
				arg_405_1.fswtw_.percent = var_408_44

				arg_405_1.fswtw_:SetDirty()
				arg_405_1:ShowNextGo(true)

				arg_405_1.typewritterCharCountI18N = var_408_45
			end

			local var_408_50 = 1.96666666666667
			local var_408_51 = 9.5

			if var_408_50 < arg_405_1.time_ and arg_405_1.time_ <= var_408_50 + arg_408_0 then
				local var_408_52 = "play"
				local var_408_53 = "music"

				arg_405_1:AudioAction(var_408_52, var_408_53, "story_v_out_417221", "417221094", "story_v_out_417221.awb")

				local var_408_54 = ""
				local var_408_55 = manager.audio:GetAudioName("story_v_out_417221", "417221094")

				if var_408_55 ~= "" then
					if arg_405_1.bgmTxt_.text ~= var_408_55 and arg_405_1.bgmTxt_.text ~= "" then
						if arg_405_1.bgmTxt2_.text ~= "" then
							arg_405_1.bgmTxt_.text = arg_405_1.bgmTxt2_.text
						end

						arg_405_1.bgmTxt2_.text = var_408_55

						arg_405_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_405_1.bgmTxt_.text = var_408_55
					end

					if arg_405_1.bgmTimer then
						arg_405_1.bgmTimer:Stop()

						arg_405_1.bgmTimer = nil
					end

					if arg_405_1.settingData.show_music_name == 1 then
						arg_405_1.musicController:SetSelectedState("show")
						arg_405_1.musicAnimator_:Play("open", 0, 0)

						if arg_405_1.settingData.music_time ~= 0 then
							arg_405_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_405_1.settingData.music_time), function()
								if arg_405_1 == nil or isNil(arg_405_1.bgmTxt_) then
									return
								end

								arg_405_1.musicController:SetSelectedState("hide")
								arg_405_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221095 = function(arg_410_0, arg_410_1)
		arg_410_1.time_ = 0
		arg_410_1.frameCnt_ = 0
		arg_410_1.state_ = "playing"
		arg_410_1.curTalkId_ = 417221095
		arg_410_1.duration_ = 7.47

		SetActive(arg_410_1.tipsGo_, false)

		function arg_410_1.onSingleLineFinish_()
			arg_410_1.onSingleLineUpdate_ = nil
			arg_410_1.onSingleLineFinish_ = nil
			arg_410_1.state_ = "waiting"
		end

		function arg_410_1.playNext_(arg_412_0)
			if arg_412_0 == 1 then
				arg_410_0:Play417221096(arg_410_1)
			end
		end

		function arg_410_1.onSingleLineUpdate_(arg_413_0)
			local var_413_0 = 0

			if var_413_0 < arg_410_1.time_ and arg_410_1.time_ <= var_413_0 + arg_413_0 then
				arg_410_1.fswbg_:SetActive(true)
				arg_410_1.dialog_:SetActive(false)

				arg_410_1.fswtw_.percent = 0

				local var_413_1 = arg_410_1:GetWordFromCfg(417221095)
				local var_413_2 = arg_410_1:FormatText(var_413_1.content)

				arg_410_1.fswt_.text = var_413_2

				LuaForUtil.ClearLinePrefixSymbol(arg_410_1.fswt_)

				arg_410_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_410_1.fswtw_:SetDirty()

				arg_410_1.typewritterCharCountI18N = 0

				arg_410_1:ShowNextGo(false)
			end

			local var_413_3 = 0.0999999999999999

			if var_413_3 < arg_410_1.time_ and arg_410_1.time_ <= var_413_3 + arg_413_0 then
				arg_410_1.var_.oldValueTypewriter = arg_410_1.fswtw_.percent

				arg_410_1:ShowNextGo(false)
			end

			local var_413_4 = 32
			local var_413_5 = 2.13333333333333
			local var_413_6 = arg_410_1:GetWordFromCfg(417221095)
			local var_413_7 = arg_410_1:FormatText(var_413_6.content)
			local var_413_8, var_413_9 = arg_410_1:GetPercentByPara(var_413_7, 1)

			if var_413_3 < arg_410_1.time_ and arg_410_1.time_ <= var_413_3 + arg_413_0 then
				arg_410_1.talkMaxDuration = 0

				local var_413_10 = var_413_4 <= 0 and var_413_5 or var_413_5 * ((var_413_9 - arg_410_1.typewritterCharCountI18N) / var_413_4)

				if var_413_10 > 0 and var_413_5 < var_413_10 then
					arg_410_1.talkMaxDuration = var_413_10

					if var_413_10 + var_413_3 > arg_410_1.duration_ then
						arg_410_1.duration_ = var_413_10 + var_413_3
					end
				end
			end

			local var_413_11 = 2.13333333333333
			local var_413_12 = math.max(var_413_11, arg_410_1.talkMaxDuration)

			if var_413_3 <= arg_410_1.time_ and arg_410_1.time_ < var_413_3 + var_413_12 then
				local var_413_13 = (arg_410_1.time_ - var_413_3) / var_413_12

				arg_410_1.fswtw_.percent = Mathf.Lerp(arg_410_1.var_.oldValueTypewriter, var_413_8, var_413_13)
				arg_410_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_410_1.fswtw_:SetDirty()
			end

			if arg_410_1.time_ >= var_413_3 + var_413_12 and arg_410_1.time_ < var_413_3 + var_413_12 + arg_413_0 then
				arg_410_1.fswtw_.percent = var_413_8

				arg_410_1.fswtw_:SetDirty()
				arg_410_1:ShowNextGo(true)

				arg_410_1.typewritterCharCountI18N = var_413_9
			end

			local var_413_14 = 0.0999999999999999
			local var_413_15 = 7.366

			if var_413_14 < arg_410_1.time_ and arg_410_1.time_ <= var_413_14 + arg_413_0 then
				local var_413_16 = "play"
				local var_413_17 = "music"

				arg_410_1:AudioAction(var_413_16, var_413_17, "story_v_out_417221", "417221095", "story_v_out_417221.awb")

				local var_413_18 = ""
				local var_413_19 = manager.audio:GetAudioName("story_v_out_417221", "417221095")

				if var_413_19 ~= "" then
					if arg_410_1.bgmTxt_.text ~= var_413_19 and arg_410_1.bgmTxt_.text ~= "" then
						if arg_410_1.bgmTxt2_.text ~= "" then
							arg_410_1.bgmTxt_.text = arg_410_1.bgmTxt2_.text
						end

						arg_410_1.bgmTxt2_.text = var_413_19

						arg_410_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_410_1.bgmTxt_.text = var_413_19
					end

					if arg_410_1.bgmTimer then
						arg_410_1.bgmTimer:Stop()

						arg_410_1.bgmTimer = nil
					end

					if arg_410_1.settingData.show_music_name == 1 then
						arg_410_1.musicController:SetSelectedState("show")
						arg_410_1.musicAnimator_:Play("open", 0, 0)

						if arg_410_1.settingData.music_time ~= 0 then
							arg_410_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_410_1.settingData.music_time), function()
								if arg_410_1 == nil or isNil(arg_410_1.bgmTxt_) then
									return
								end

								arg_410_1.musicController:SetSelectedState("hide")
								arg_410_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221096 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 417221096
		arg_415_1.duration_ = 11.73

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play417221097(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1.cswbg_:SetActive(true)

				local var_418_1 = arg_415_1.cswt_:GetComponent("RectTransform")

				arg_415_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_418_1.offsetMin = Vector2.New(0, 0)
				var_418_1.offsetMax = Vector2.New(0, 0)

				local var_418_2 = arg_415_1:GetWordFromCfg(419117)
				local var_418_3 = arg_415_1:FormatText(var_418_2.content)

				arg_415_1.cswt_.text = var_418_3

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.cswt_)

				arg_415_1.cswt_.fontSize = 120
				arg_415_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_415_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_418_4 = 0

			if var_418_4 < arg_415_1.time_ and arg_415_1.time_ <= var_418_4 + arg_418_0 then
				arg_415_1.fswbg_:SetActive(true)
				arg_415_1.dialog_:SetActive(false)

				arg_415_1.fswtw_.percent = 0

				local var_418_5 = arg_415_1:GetWordFromCfg(417221096)
				local var_418_6 = arg_415_1:FormatText(var_418_5.content)

				arg_415_1.fswt_.text = var_418_6

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.fswt_)

				arg_415_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_415_1.fswtw_:SetDirty()

				arg_415_1.typewritterCharCountI18N = 0

				arg_415_1:ShowNextGo(false)
			end

			local var_418_7 = 0.0999999999999999

			if var_418_7 < arg_415_1.time_ and arg_415_1.time_ <= var_418_7 + arg_418_0 then
				arg_415_1.var_.oldValueTypewriter = arg_415_1.fswtw_.percent

				arg_415_1:ShowNextGo(false)
			end

			local var_418_8 = 50
			local var_418_9 = 2.33333333333333
			local var_418_10 = arg_415_1:GetWordFromCfg(417221096)
			local var_418_11 = arg_415_1:FormatText(var_418_10.content)
			local var_418_12, var_418_13 = arg_415_1:GetPercentByPara(var_418_11, 1)

			if var_418_7 < arg_415_1.time_ and arg_415_1.time_ <= var_418_7 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0

				local var_418_14 = var_418_8 <= 0 and var_418_9 or var_418_9 * ((var_418_13 - arg_415_1.typewritterCharCountI18N) / var_418_8)

				if var_418_14 > 0 and var_418_9 < var_418_14 then
					arg_415_1.talkMaxDuration = var_418_14

					if var_418_14 + var_418_7 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_14 + var_418_7
					end
				end
			end

			local var_418_15 = 2.33333333333333
			local var_418_16 = math.max(var_418_15, arg_415_1.talkMaxDuration)

			if var_418_7 <= arg_415_1.time_ and arg_415_1.time_ < var_418_7 + var_418_16 then
				local var_418_17 = (arg_415_1.time_ - var_418_7) / var_418_16

				arg_415_1.fswtw_.percent = Mathf.Lerp(arg_415_1.var_.oldValueTypewriter, var_418_12, var_418_17)
				arg_415_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_415_1.fswtw_:SetDirty()
			end

			if arg_415_1.time_ >= var_418_7 + var_418_16 and arg_415_1.time_ < var_418_7 + var_418_16 + arg_418_0 then
				arg_415_1.fswtw_.percent = var_418_12

				arg_415_1.fswtw_:SetDirty()
				arg_415_1:ShowNextGo(true)

				arg_415_1.typewritterCharCountI18N = var_418_13
			end

			local var_418_18 = 0.0999999999999999
			local var_418_19 = 11.633

			if var_418_18 < arg_415_1.time_ and arg_415_1.time_ <= var_418_18 + arg_418_0 then
				local var_418_20 = "play"
				local var_418_21 = "music"

				arg_415_1:AudioAction(var_418_20, var_418_21, "story_v_out_417221", "417221096", "story_v_out_417221.awb")

				local var_418_22 = ""
				local var_418_23 = manager.audio:GetAudioName("story_v_out_417221", "417221096")

				if var_418_23 ~= "" then
					if arg_415_1.bgmTxt_.text ~= var_418_23 and arg_415_1.bgmTxt_.text ~= "" then
						if arg_415_1.bgmTxt2_.text ~= "" then
							arg_415_1.bgmTxt_.text = arg_415_1.bgmTxt2_.text
						end

						arg_415_1.bgmTxt2_.text = var_418_23

						arg_415_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_415_1.bgmTxt_.text = var_418_23
					end

					if arg_415_1.bgmTimer then
						arg_415_1.bgmTimer:Stop()

						arg_415_1.bgmTimer = nil
					end

					if arg_415_1.settingData.show_music_name == 1 then
						arg_415_1.musicController:SetSelectedState("show")
						arg_415_1.musicAnimator_:Play("open", 0, 0)

						if arg_415_1.settingData.music_time ~= 0 then
							arg_415_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_415_1.settingData.music_time), function()
								if arg_415_1 == nil or isNil(arg_415_1.bgmTxt_) then
									return
								end

								arg_415_1.musicController:SetSelectedState("hide")
								arg_415_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221097 = function(arg_420_0, arg_420_1)
		arg_420_1.time_ = 0
		arg_420_1.frameCnt_ = 0
		arg_420_1.state_ = "playing"
		arg_420_1.curTalkId_ = 417221097
		arg_420_1.duration_ = 11.93

		SetActive(arg_420_1.tipsGo_, false)

		function arg_420_1.onSingleLineFinish_()
			arg_420_1.onSingleLineUpdate_ = nil
			arg_420_1.onSingleLineFinish_ = nil
			arg_420_1.state_ = "waiting"
		end

		function arg_420_1.playNext_(arg_422_0)
			if arg_422_0 == 1 then
				arg_420_0:Play417221098(arg_420_1)
			end
		end

		function arg_420_1.onSingleLineUpdate_(arg_423_0)
			local var_423_0 = 0

			if var_423_0 < arg_420_1.time_ and arg_420_1.time_ <= var_423_0 + arg_423_0 then
				arg_420_1.cswbg_:SetActive(true)

				local var_423_1 = arg_420_1.cswt_:GetComponent("RectTransform")

				arg_420_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_423_1.offsetMin = Vector2.New(0, 0)
				var_423_1.offsetMax = Vector2.New(0, 0)

				local var_423_2 = arg_420_1:GetWordFromCfg(419118)
				local var_423_3 = arg_420_1:FormatText(var_423_2.content)

				arg_420_1.cswt_.text = var_423_3

				LuaForUtil.ClearLinePrefixSymbol(arg_420_1.cswt_)

				arg_420_1.cswt_.fontSize = 120
				arg_420_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_420_1.cswt_.font = Asset.Load("Fonts/SourceHanSerifCN-Bold-3.0")
			end

			local var_423_4 = 0

			if var_423_4 < arg_420_1.time_ and arg_420_1.time_ <= var_423_4 + arg_423_0 then
				arg_420_1.fswbg_:SetActive(true)
				arg_420_1.dialog_:SetActive(false)

				arg_420_1.fswtw_.percent = 0

				local var_423_5 = arg_420_1:GetWordFromCfg(417221097)
				local var_423_6 = arg_420_1:FormatText(var_423_5.content)

				arg_420_1.fswt_.text = var_423_6

				LuaForUtil.ClearLinePrefixSymbol(arg_420_1.fswt_)

				arg_420_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_420_1.fswtw_:SetDirty()

				arg_420_1.typewritterCharCountI18N = 0

				arg_420_1:ShowNextGo(false)
			end

			local var_423_7 = 0.0999999999999999

			if var_423_7 < arg_420_1.time_ and arg_420_1.time_ <= var_423_7 + arg_423_0 then
				arg_420_1.var_.oldValueTypewriter = arg_420_1.fswtw_.percent

				arg_420_1:ShowNextGo(false)
			end

			local var_423_8 = 46
			local var_423_9 = 2.33333333333333
			local var_423_10 = arg_420_1:GetWordFromCfg(417221097)
			local var_423_11 = arg_420_1:FormatText(var_423_10.content)
			local var_423_12, var_423_13 = arg_420_1:GetPercentByPara(var_423_11, 1)

			if var_423_7 < arg_420_1.time_ and arg_420_1.time_ <= var_423_7 + arg_423_0 then
				arg_420_1.talkMaxDuration = 0

				local var_423_14 = var_423_8 <= 0 and var_423_9 or var_423_9 * ((var_423_13 - arg_420_1.typewritterCharCountI18N) / var_423_8)

				if var_423_14 > 0 and var_423_9 < var_423_14 then
					arg_420_1.talkMaxDuration = var_423_14

					if var_423_14 + var_423_7 > arg_420_1.duration_ then
						arg_420_1.duration_ = var_423_14 + var_423_7
					end
				end
			end

			local var_423_15 = 2.33333333333333
			local var_423_16 = math.max(var_423_15, arg_420_1.talkMaxDuration)

			if var_423_7 <= arg_420_1.time_ and arg_420_1.time_ < var_423_7 + var_423_16 then
				local var_423_17 = (arg_420_1.time_ - var_423_7) / var_423_16

				arg_420_1.fswtw_.percent = Mathf.Lerp(arg_420_1.var_.oldValueTypewriter, var_423_12, var_423_17)
				arg_420_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_420_1.fswtw_:SetDirty()
			end

			if arg_420_1.time_ >= var_423_7 + var_423_16 and arg_420_1.time_ < var_423_7 + var_423_16 + arg_423_0 then
				arg_420_1.fswtw_.percent = var_423_12

				arg_420_1.fswtw_:SetDirty()
				arg_420_1:ShowNextGo(true)

				arg_420_1.typewritterCharCountI18N = var_423_13
			end

			local var_423_18 = 0.0999999999999999
			local var_423_19 = 11.833

			if var_423_18 < arg_420_1.time_ and arg_420_1.time_ <= var_423_18 + arg_423_0 then
				local var_423_20 = "play"
				local var_423_21 = "music"

				arg_420_1:AudioAction(var_423_20, var_423_21, "story_v_out_417221", "417221097", "story_v_out_417221.awb")

				local var_423_22 = ""
				local var_423_23 = manager.audio:GetAudioName("story_v_out_417221", "417221097")

				if var_423_23 ~= "" then
					if arg_420_1.bgmTxt_.text ~= var_423_23 and arg_420_1.bgmTxt_.text ~= "" then
						if arg_420_1.bgmTxt2_.text ~= "" then
							arg_420_1.bgmTxt_.text = arg_420_1.bgmTxt2_.text
						end

						arg_420_1.bgmTxt2_.text = var_423_23

						arg_420_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_420_1.bgmTxt_.text = var_423_23
					end

					if arg_420_1.bgmTimer then
						arg_420_1.bgmTimer:Stop()

						arg_420_1.bgmTimer = nil
					end

					if arg_420_1.settingData.show_music_name == 1 then
						arg_420_1.musicController:SetSelectedState("show")
						arg_420_1.musicAnimator_:Play("open", 0, 0)

						if arg_420_1.settingData.music_time ~= 0 then
							arg_420_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_420_1.settingData.music_time), function()
								if arg_420_1 == nil or isNil(arg_420_1.bgmTxt_) then
									return
								end

								arg_420_1.musicController:SetSelectedState("hide")
								arg_420_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end
		end
	end,
	Play417221098 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 417221098
		arg_425_1.duration_ = 9

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play417221099(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 4

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.allBtn_.enabled = false
			end

			local var_428_1 = 0.833333333333333

			if arg_425_1.time_ >= var_428_0 + var_428_1 and arg_425_1.time_ < var_428_0 + var_428_1 + arg_428_0 then
				arg_425_1.allBtn_.enabled = true
			end

			local var_428_2 = 2

			if var_428_2 < arg_425_1.time_ and arg_425_1.time_ <= var_428_2 + arg_428_0 then
				local var_428_3 = manager.ui.mainCamera.transform.localPosition
				local var_428_4 = Vector3.New(0, 0, 10) + Vector3.New(var_428_3.x, var_428_3.y, 0)
				local var_428_5 = arg_425_1.bgs_.I16f

				var_428_5.transform.localPosition = var_428_4
				var_428_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_428_6 = var_428_5:GetComponent("SpriteRenderer")

				if var_428_6 and var_428_6.sprite then
					local var_428_7 = (var_428_5.transform.localPosition - var_428_3).z
					local var_428_8 = manager.ui.mainCameraCom_
					local var_428_9 = 2 * var_428_7 * Mathf.Tan(var_428_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_428_10 = var_428_9 * var_428_8.aspect
					local var_428_11 = var_428_6.sprite.bounds.size.x
					local var_428_12 = var_428_6.sprite.bounds.size.y
					local var_428_13 = var_428_10 / var_428_11
					local var_428_14 = var_428_9 / var_428_12
					local var_428_15 = var_428_14 < var_428_13 and var_428_13 or var_428_14

					var_428_5.transform.localScale = Vector3.New(var_428_15, var_428_15, 0)
				end

				for iter_428_0, iter_428_1 in pairs(arg_425_1.bgs_) do
					if iter_428_0 ~= "I16f" then
						iter_428_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_428_16 = 0

			if var_428_16 < arg_425_1.time_ and arg_425_1.time_ <= var_428_16 + arg_428_0 then
				arg_425_1.mask_.enabled = true
				arg_425_1.mask_.raycastTarget = true

				arg_425_1:SetGaussion(false)
			end

			local var_428_17 = 2

			if var_428_16 <= arg_425_1.time_ and arg_425_1.time_ < var_428_16 + var_428_17 then
				local var_428_18 = (arg_425_1.time_ - var_428_16) / var_428_17
				local var_428_19 = Color.New(0, 0, 0)

				var_428_19.a = Mathf.Lerp(0, 1, var_428_18)
				arg_425_1.mask_.color = var_428_19
			end

			if arg_425_1.time_ >= var_428_16 + var_428_17 and arg_425_1.time_ < var_428_16 + var_428_17 + arg_428_0 then
				local var_428_20 = Color.New(0, 0, 0)

				var_428_20.a = 1
				arg_425_1.mask_.color = var_428_20
			end

			local var_428_21 = 2

			if var_428_21 < arg_425_1.time_ and arg_425_1.time_ <= var_428_21 + arg_428_0 then
				arg_425_1.mask_.enabled = true
				arg_425_1.mask_.raycastTarget = true

				arg_425_1:SetGaussion(false)
			end

			local var_428_22 = 2

			if var_428_21 <= arg_425_1.time_ and arg_425_1.time_ < var_428_21 + var_428_22 then
				local var_428_23 = (arg_425_1.time_ - var_428_21) / var_428_22
				local var_428_24 = Color.New(0, 0, 0)

				var_428_24.a = Mathf.Lerp(1, 0, var_428_23)
				arg_425_1.mask_.color = var_428_24
			end

			if arg_425_1.time_ >= var_428_21 + var_428_22 and arg_425_1.time_ < var_428_21 + var_428_22 + arg_428_0 then
				local var_428_25 = Color.New(0, 0, 0)
				local var_428_26 = 0

				arg_425_1.mask_.enabled = false
				var_428_25.a = var_428_26
				arg_425_1.mask_.color = var_428_25
			end

			local var_428_27 = 1.9

			if var_428_27 < arg_425_1.time_ and arg_425_1.time_ <= var_428_27 + arg_428_0 then
				arg_425_1.cswbg_:SetActive(false)
			end

			local var_428_28 = 1.9

			if var_428_28 < arg_425_1.time_ and arg_425_1.time_ <= var_428_28 + arg_428_0 then
				arg_425_1.fswbg_:SetActive(false)
				arg_425_1.dialog_:SetActive(false)
				arg_425_1:ShowNextGo(false)
			end

			if arg_425_1.frameCnt_ <= 1 then
				arg_425_1.dialog_:SetActive(false)
			end

			local var_428_29 = 4
			local var_428_30 = 1.35

			if var_428_29 < arg_425_1.time_ and arg_425_1.time_ <= var_428_29 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0

				arg_425_1.dialog_:SetActive(true)

				local var_428_31 = LeanTween.value(arg_425_1.dialog_, 0, 1, 0.3)

				var_428_31:setOnUpdate(LuaHelper.FloatAction(function(arg_429_0)
					arg_425_1.dialogCg_.alpha = arg_429_0
				end))
				var_428_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_425_1.dialog_)
					var_428_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_425_1.duration_ = arg_425_1.duration_ + 0.3

				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_32 = arg_425_1:GetWordFromCfg(417221098)
				local var_428_33 = arg_425_1:FormatText(var_428_32.content)

				arg_425_1.text_.text = var_428_33

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_34 = 54
				local var_428_35 = utf8.len(var_428_33)
				local var_428_36 = var_428_34 <= 0 and var_428_30 or var_428_30 * (var_428_35 / var_428_34)

				if var_428_36 > 0 and var_428_30 < var_428_36 then
					arg_425_1.talkMaxDuration = var_428_36
					var_428_29 = var_428_29 + 0.3

					if var_428_36 + var_428_29 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_36 + var_428_29
					end
				end

				arg_425_1.text_.text = var_428_33
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_37 = var_428_29 + 0.3
			local var_428_38 = math.max(var_428_30, arg_425_1.talkMaxDuration)

			if var_428_37 <= arg_425_1.time_ and arg_425_1.time_ < var_428_37 + var_428_38 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_37) / var_428_38

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_37 + var_428_38 and arg_425_1.time_ < var_428_37 + var_428_38 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play417221099 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 417221099
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play417221100(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 1.125

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_2 = arg_431_1:GetWordFromCfg(417221099)
				local var_434_3 = arg_431_1:FormatText(var_434_2.content)

				arg_431_1.text_.text = var_434_3

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_4 = 45
				local var_434_5 = utf8.len(var_434_3)
				local var_434_6 = var_434_4 <= 0 and var_434_1 or var_434_1 * (var_434_5 / var_434_4)

				if var_434_6 > 0 and var_434_1 < var_434_6 then
					arg_431_1.talkMaxDuration = var_434_6

					if var_434_6 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_6 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_3
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_7 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_7 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_7

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_7 and arg_431_1.time_ < var_434_0 + var_434_7 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play417221100 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 417221100
		arg_435_1.duration_ = 8.37

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play417221101(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["10113"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and not isNil(var_438_0) and arg_435_1.var_.actorSpriteComps10113 == nil then
				arg_435_1.var_.actorSpriteComps10113 = var_438_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_438_2 = 0.2

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 and not isNil(var_438_0) then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.actorSpriteComps10113 then
					for iter_438_0, iter_438_1 in pairs(arg_435_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_438_1 then
							if arg_435_1.isInRecall_ then
								local var_438_4 = Mathf.Lerp(iter_438_1.color.r, arg_435_1.hightColor1.r, var_438_3)
								local var_438_5 = Mathf.Lerp(iter_438_1.color.g, arg_435_1.hightColor1.g, var_438_3)
								local var_438_6 = Mathf.Lerp(iter_438_1.color.b, arg_435_1.hightColor1.b, var_438_3)

								iter_438_1.color = Color.New(var_438_4, var_438_5, var_438_6)
							else
								local var_438_7 = Mathf.Lerp(iter_438_1.color.r, 1, var_438_3)

								iter_438_1.color = Color.New(var_438_7, var_438_7, var_438_7)
							end
						end
					end
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and not isNil(var_438_0) and arg_435_1.var_.actorSpriteComps10113 then
				for iter_438_2, iter_438_3 in pairs(arg_435_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_438_3 then
						if arg_435_1.isInRecall_ then
							iter_438_3.color = arg_435_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_438_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_435_1.var_.actorSpriteComps10113 = nil
			end

			local var_438_8 = arg_435_1.actors_["10113"].transform
			local var_438_9 = 0

			if var_438_9 < arg_435_1.time_ and arg_435_1.time_ <= var_438_9 + arg_438_0 then
				arg_435_1.var_.moveOldPos10113 = var_438_8.localPosition
				var_438_8.localScale = Vector3.New(1, 1, 1)

				arg_435_1:CheckSpriteTmpPos("10113", 3)

				local var_438_10 = var_438_8.childCount

				for iter_438_4 = 0, var_438_10 - 1 do
					local var_438_11 = var_438_8:GetChild(iter_438_4)

					if var_438_11.name == "split_6" or not string.find(var_438_11.name, "split") then
						var_438_11.gameObject:SetActive(true)
					else
						var_438_11.gameObject:SetActive(false)
					end
				end
			end

			local var_438_12 = 0.001

			if var_438_9 <= arg_435_1.time_ and arg_435_1.time_ < var_438_9 + var_438_12 then
				local var_438_13 = (arg_435_1.time_ - var_438_9) / var_438_12
				local var_438_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_438_8.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos10113, var_438_14, var_438_13)
			end

			if arg_435_1.time_ >= var_438_9 + var_438_12 and arg_435_1.time_ < var_438_9 + var_438_12 + arg_438_0 then
				var_438_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_438_15 = 0
			local var_438_16 = 0.95

			if var_438_15 < arg_435_1.time_ and arg_435_1.time_ <= var_438_15 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_17 = arg_435_1:FormatText(StoryNameCfg[1117].name)

				arg_435_1.leftNameTxt_.text = var_438_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_18 = arg_435_1:GetWordFromCfg(417221100)
				local var_438_19 = arg_435_1:FormatText(var_438_18.content)

				arg_435_1.text_.text = var_438_19

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_20 = 38
				local var_438_21 = utf8.len(var_438_19)
				local var_438_22 = var_438_20 <= 0 and var_438_16 or var_438_16 * (var_438_21 / var_438_20)

				if var_438_22 > 0 and var_438_16 < var_438_22 then
					arg_435_1.talkMaxDuration = var_438_22

					if var_438_22 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_22 + var_438_15
					end
				end

				arg_435_1.text_.text = var_438_19
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221100", "story_v_out_417221.awb") ~= 0 then
					local var_438_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221100", "story_v_out_417221.awb") / 1000

					if var_438_23 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_23 + var_438_15
					end

					if var_438_18.prefab_name ~= "" and arg_435_1.actors_[var_438_18.prefab_name] ~= nil then
						local var_438_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_18.prefab_name].transform, "story_v_out_417221", "417221100", "story_v_out_417221.awb")

						arg_435_1:RecordAudio("417221100", var_438_24)
						arg_435_1:RecordAudio("417221100", var_438_24)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_417221", "417221100", "story_v_out_417221.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_417221", "417221100", "story_v_out_417221.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_25 = math.max(var_438_16, arg_435_1.talkMaxDuration)

			if var_438_15 <= arg_435_1.time_ and arg_435_1.time_ < var_438_15 + var_438_25 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_15) / var_438_25

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_15 + var_438_25 and arg_435_1.time_ < var_438_15 + var_438_25 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play417221101 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 417221101
		arg_439_1.duration_ = 12.1

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play417221102(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 1.325

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[1117].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(417221101)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 53
				local var_442_6 = utf8.len(var_442_4)
				local var_442_7 = var_442_5 <= 0 and var_442_1 or var_442_1 * (var_442_6 / var_442_5)

				if var_442_7 > 0 and var_442_1 < var_442_7 then
					arg_439_1.talkMaxDuration = var_442_7

					if var_442_7 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_7 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_4
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221101", "story_v_out_417221.awb") ~= 0 then
					local var_442_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221101", "story_v_out_417221.awb") / 1000

					if var_442_8 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_8 + var_442_0
					end

					if var_442_3.prefab_name ~= "" and arg_439_1.actors_[var_442_3.prefab_name] ~= nil then
						local var_442_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_3.prefab_name].transform, "story_v_out_417221", "417221101", "story_v_out_417221.awb")

						arg_439_1:RecordAudio("417221101", var_442_9)
						arg_439_1:RecordAudio("417221101", var_442_9)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_417221", "417221101", "story_v_out_417221.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_417221", "417221101", "story_v_out_417221.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_10 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_10 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_10

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_10 and arg_439_1.time_ < var_442_0 + var_442_10 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play417221102 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 417221102
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play417221103(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["10113"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and not isNil(var_446_0) and arg_443_1.var_.actorSpriteComps10113 == nil then
				arg_443_1.var_.actorSpriteComps10113 = var_446_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_446_2 = 0.2

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 and not isNil(var_446_0) then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.actorSpriteComps10113 then
					for iter_446_0, iter_446_1 in pairs(arg_443_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_446_1 then
							if arg_443_1.isInRecall_ then
								local var_446_4 = Mathf.Lerp(iter_446_1.color.r, arg_443_1.hightColor2.r, var_446_3)
								local var_446_5 = Mathf.Lerp(iter_446_1.color.g, arg_443_1.hightColor2.g, var_446_3)
								local var_446_6 = Mathf.Lerp(iter_446_1.color.b, arg_443_1.hightColor2.b, var_446_3)

								iter_446_1.color = Color.New(var_446_4, var_446_5, var_446_6)
							else
								local var_446_7 = Mathf.Lerp(iter_446_1.color.r, 0.5, var_446_3)

								iter_446_1.color = Color.New(var_446_7, var_446_7, var_446_7)
							end
						end
					end
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and not isNil(var_446_0) and arg_443_1.var_.actorSpriteComps10113 then
				for iter_446_2, iter_446_3 in pairs(arg_443_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_446_3 then
						if arg_443_1.isInRecall_ then
							iter_446_3.color = arg_443_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_446_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_443_1.var_.actorSpriteComps10113 = nil
			end

			local var_446_8 = 0
			local var_446_9 = 1.25

			if var_446_8 < arg_443_1.time_ and arg_443_1.time_ <= var_446_8 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_10 = arg_443_1:GetWordFromCfg(417221102)
				local var_446_11 = arg_443_1:FormatText(var_446_10.content)

				arg_443_1.text_.text = var_446_11

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_12 = 50
				local var_446_13 = utf8.len(var_446_11)
				local var_446_14 = var_446_12 <= 0 and var_446_9 or var_446_9 * (var_446_13 / var_446_12)

				if var_446_14 > 0 and var_446_9 < var_446_14 then
					arg_443_1.talkMaxDuration = var_446_14

					if var_446_14 + var_446_8 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_14 + var_446_8
					end
				end

				arg_443_1.text_.text = var_446_11
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_15 = math.max(var_446_9, arg_443_1.talkMaxDuration)

			if var_446_8 <= arg_443_1.time_ and arg_443_1.time_ < var_446_8 + var_446_15 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_8) / var_446_15

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_8 + var_446_15 and arg_443_1.time_ < var_446_8 + var_446_15 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play417221103 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 417221103
		arg_447_1.duration_ = 9.77

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play417221104(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["10113"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and not isNil(var_450_0) and arg_447_1.var_.actorSpriteComps10113 == nil then
				arg_447_1.var_.actorSpriteComps10113 = var_450_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 and not isNil(var_450_0) then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.actorSpriteComps10113 then
					for iter_450_0, iter_450_1 in pairs(arg_447_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_450_1 then
							if arg_447_1.isInRecall_ then
								local var_450_4 = Mathf.Lerp(iter_450_1.color.r, arg_447_1.hightColor1.r, var_450_3)
								local var_450_5 = Mathf.Lerp(iter_450_1.color.g, arg_447_1.hightColor1.g, var_450_3)
								local var_450_6 = Mathf.Lerp(iter_450_1.color.b, arg_447_1.hightColor1.b, var_450_3)

								iter_450_1.color = Color.New(var_450_4, var_450_5, var_450_6)
							else
								local var_450_7 = Mathf.Lerp(iter_450_1.color.r, 1, var_450_3)

								iter_450_1.color = Color.New(var_450_7, var_450_7, var_450_7)
							end
						end
					end
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and not isNil(var_450_0) and arg_447_1.var_.actorSpriteComps10113 then
				for iter_450_2, iter_450_3 in pairs(arg_447_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_450_3 then
						if arg_447_1.isInRecall_ then
							iter_450_3.color = arg_447_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_450_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_447_1.var_.actorSpriteComps10113 = nil
			end

			local var_450_8 = arg_447_1.actors_["10113"].transform
			local var_450_9 = 0

			if var_450_9 < arg_447_1.time_ and arg_447_1.time_ <= var_450_9 + arg_450_0 then
				arg_447_1.var_.moveOldPos10113 = var_450_8.localPosition
				var_450_8.localScale = Vector3.New(1, 1, 1)

				arg_447_1:CheckSpriteTmpPos("10113", 3)

				local var_450_10 = var_450_8.childCount

				for iter_450_4 = 0, var_450_10 - 1 do
					local var_450_11 = var_450_8:GetChild(iter_450_4)

					if var_450_11.name == "split_3" or not string.find(var_450_11.name, "split") then
						var_450_11.gameObject:SetActive(true)
					else
						var_450_11.gameObject:SetActive(false)
					end
				end
			end

			local var_450_12 = 0.001

			if var_450_9 <= arg_447_1.time_ and arg_447_1.time_ < var_450_9 + var_450_12 then
				local var_450_13 = (arg_447_1.time_ - var_450_9) / var_450_12
				local var_450_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_450_8.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos10113, var_450_14, var_450_13)
			end

			if arg_447_1.time_ >= var_450_9 + var_450_12 and arg_447_1.time_ < var_450_9 + var_450_12 + arg_450_0 then
				var_450_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_450_15 = 2.32914680149406
			local var_450_16 = 1

			if var_450_15 < arg_447_1.time_ and arg_447_1.time_ <= var_450_15 + arg_450_0 then
				local var_450_17 = "play"
				local var_450_18 = "effect"

				arg_447_1:AudioAction(var_450_17, var_450_18, "se_story_1311", "se_story_1311_thunder04", "")
			end

			local var_450_19 = 0
			local var_450_20 = 0.7

			if var_450_19 < arg_447_1.time_ and arg_447_1.time_ <= var_450_19 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_21 = arg_447_1:FormatText(StoryNameCfg[1117].name)

				arg_447_1.leftNameTxt_.text = var_450_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_22 = arg_447_1:GetWordFromCfg(417221103)
				local var_450_23 = arg_447_1:FormatText(var_450_22.content)

				arg_447_1.text_.text = var_450_23

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_24 = 28
				local var_450_25 = utf8.len(var_450_23)
				local var_450_26 = var_450_24 <= 0 and var_450_20 or var_450_20 * (var_450_25 / var_450_24)

				if var_450_26 > 0 and var_450_20 < var_450_26 then
					arg_447_1.talkMaxDuration = var_450_26

					if var_450_26 + var_450_19 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_26 + var_450_19
					end
				end

				arg_447_1.text_.text = var_450_23
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221103", "story_v_out_417221.awb") ~= 0 then
					local var_450_27 = manager.audio:GetVoiceLength("story_v_out_417221", "417221103", "story_v_out_417221.awb") / 1000

					if var_450_27 + var_450_19 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_27 + var_450_19
					end

					if var_450_22.prefab_name ~= "" and arg_447_1.actors_[var_450_22.prefab_name] ~= nil then
						local var_450_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_22.prefab_name].transform, "story_v_out_417221", "417221103", "story_v_out_417221.awb")

						arg_447_1:RecordAudio("417221103", var_450_28)
						arg_447_1:RecordAudio("417221103", var_450_28)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_417221", "417221103", "story_v_out_417221.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_417221", "417221103", "story_v_out_417221.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_29 = math.max(var_450_20, arg_447_1.talkMaxDuration)

			if var_450_19 <= arg_447_1.time_ and arg_447_1.time_ < var_450_19 + var_450_29 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_19) / var_450_29

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_19 + var_450_29 and arg_447_1.time_ < var_450_19 + var_450_29 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play417221104 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 417221104
		arg_451_1.duration_ = 4.87

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play417221105(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10113"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos10113 = var_454_0.localPosition
				var_454_0.localScale = Vector3.New(1, 1, 1)

				arg_451_1:CheckSpriteTmpPos("10113", 7)

				local var_454_2 = var_454_0.childCount

				for iter_454_0 = 0, var_454_2 - 1 do
					local var_454_3 = var_454_0:GetChild(iter_454_0)

					if var_454_3.name == "" or not string.find(var_454_3.name, "split") then
						var_454_3.gameObject:SetActive(true)
					else
						var_454_3.gameObject:SetActive(false)
					end
				end
			end

			local var_454_4 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_4 then
				local var_454_5 = (arg_451_1.time_ - var_454_1) / var_454_4
				local var_454_6 = Vector3.New(0, -2000, 0)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10113, var_454_6, var_454_5)
			end

			if arg_451_1.time_ >= var_454_1 + var_454_4 and arg_451_1.time_ < var_454_1 + var_454_4 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_454_7 = 0
			local var_454_8 = 0.5

			if var_454_7 < arg_451_1.time_ and arg_451_1.time_ <= var_454_7 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_9 = arg_451_1:FormatText(StoryNameCfg[1150].name)

				arg_451_1.leftNameTxt_.text = var_454_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, true)
				arg_451_1.iconController_:SetSelectedState("hero")

				arg_451_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandmaa")

				arg_451_1.callingController_:SetSelectedState("normal")

				arg_451_1.keyicon_.color = Color.New(1, 1, 1)
				arg_451_1.icon_.color = Color.New(1, 1, 1)

				local var_454_10 = arg_451_1:GetWordFromCfg(417221104)
				local var_454_11 = arg_451_1:FormatText(var_454_10.content)

				arg_451_1.text_.text = var_454_11

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_12 = 20
				local var_454_13 = utf8.len(var_454_11)
				local var_454_14 = var_454_12 <= 0 and var_454_8 or var_454_8 * (var_454_13 / var_454_12)

				if var_454_14 > 0 and var_454_8 < var_454_14 then
					arg_451_1.talkMaxDuration = var_454_14

					if var_454_14 + var_454_7 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_14 + var_454_7
					end
				end

				arg_451_1.text_.text = var_454_11
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221104", "story_v_out_417221.awb") ~= 0 then
					local var_454_15 = manager.audio:GetVoiceLength("story_v_out_417221", "417221104", "story_v_out_417221.awb") / 1000

					if var_454_15 + var_454_7 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_15 + var_454_7
					end

					if var_454_10.prefab_name ~= "" and arg_451_1.actors_[var_454_10.prefab_name] ~= nil then
						local var_454_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_10.prefab_name].transform, "story_v_out_417221", "417221104", "story_v_out_417221.awb")

						arg_451_1:RecordAudio("417221104", var_454_16)
						arg_451_1:RecordAudio("417221104", var_454_16)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_417221", "417221104", "story_v_out_417221.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_417221", "417221104", "story_v_out_417221.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_17 = math.max(var_454_8, arg_451_1.talkMaxDuration)

			if var_454_7 <= arg_451_1.time_ and arg_451_1.time_ < var_454_7 + var_454_17 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_7) / var_454_17

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_7 + var_454_17 and arg_451_1.time_ < var_454_7 + var_454_17 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play417221105 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 417221105
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play417221106(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0.05
			local var_458_1 = 1

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				local var_458_2 = "play"
				local var_458_3 = "effect"

				arg_455_1:AudioAction(var_458_2, var_458_3, "se_story_1310", "se_story_1310_surround", "")
			end

			local var_458_4 = 0
			local var_458_5 = 0.85

			if var_458_4 < arg_455_1.time_ and arg_455_1.time_ <= var_458_4 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_6 = arg_455_1:GetWordFromCfg(417221105)
				local var_458_7 = arg_455_1:FormatText(var_458_6.content)

				arg_455_1.text_.text = var_458_7

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_8 = 34
				local var_458_9 = utf8.len(var_458_7)
				local var_458_10 = var_458_8 <= 0 and var_458_5 or var_458_5 * (var_458_9 / var_458_8)

				if var_458_10 > 0 and var_458_5 < var_458_10 then
					arg_455_1.talkMaxDuration = var_458_10

					if var_458_10 + var_458_4 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_10 + var_458_4
					end
				end

				arg_455_1.text_.text = var_458_7
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_11 = math.max(var_458_5, arg_455_1.talkMaxDuration)

			if var_458_4 <= arg_455_1.time_ and arg_455_1.time_ < var_458_4 + var_458_11 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_4) / var_458_11

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_4 + var_458_11 and arg_455_1.time_ < var_458_4 + var_458_11 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play417221106 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 417221106
		arg_459_1.duration_ = 9.13

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play417221107(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = "ST73"

			if arg_459_1.bgs_[var_462_0] == nil then
				local var_462_1 = Object.Instantiate(arg_459_1.paintGo_)

				var_462_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_462_0)
				var_462_1.name = var_462_0
				var_462_1.transform.parent = arg_459_1.stage_.transform
				var_462_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_459_1.bgs_[var_462_0] = var_462_1
			end

			local var_462_2 = 2

			if var_462_2 < arg_459_1.time_ and arg_459_1.time_ <= var_462_2 + arg_462_0 then
				local var_462_3 = manager.ui.mainCamera.transform.localPosition
				local var_462_4 = Vector3.New(0, 0, 10) + Vector3.New(var_462_3.x, var_462_3.y, 0)
				local var_462_5 = arg_459_1.bgs_.ST73

				var_462_5.transform.localPosition = var_462_4
				var_462_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_462_6 = var_462_5:GetComponent("SpriteRenderer")

				if var_462_6 and var_462_6.sprite then
					local var_462_7 = (var_462_5.transform.localPosition - var_462_3).z
					local var_462_8 = manager.ui.mainCameraCom_
					local var_462_9 = 2 * var_462_7 * Mathf.Tan(var_462_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_462_10 = var_462_9 * var_462_8.aspect
					local var_462_11 = var_462_6.sprite.bounds.size.x
					local var_462_12 = var_462_6.sprite.bounds.size.y
					local var_462_13 = var_462_10 / var_462_11
					local var_462_14 = var_462_9 / var_462_12
					local var_462_15 = var_462_14 < var_462_13 and var_462_13 or var_462_14

					var_462_5.transform.localScale = Vector3.New(var_462_15, var_462_15, 0)
				end

				for iter_462_0, iter_462_1 in pairs(arg_459_1.bgs_) do
					if iter_462_0 ~= "ST73" then
						iter_462_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_462_16 = 4

			if var_462_16 < arg_459_1.time_ and arg_459_1.time_ <= var_462_16 + arg_462_0 then
				arg_459_1.allBtn_.enabled = false
			end

			local var_462_17 = 0.3

			if arg_459_1.time_ >= var_462_16 + var_462_17 and arg_459_1.time_ < var_462_16 + var_462_17 + arg_462_0 then
				arg_459_1.allBtn_.enabled = true
			end

			local var_462_18 = 0

			if var_462_18 < arg_459_1.time_ and arg_459_1.time_ <= var_462_18 + arg_462_0 then
				arg_459_1.mask_.enabled = true
				arg_459_1.mask_.raycastTarget = true

				arg_459_1:SetGaussion(false)
			end

			local var_462_19 = 2

			if var_462_18 <= arg_459_1.time_ and arg_459_1.time_ < var_462_18 + var_462_19 then
				local var_462_20 = (arg_459_1.time_ - var_462_18) / var_462_19
				local var_462_21 = Color.New(0, 0, 0)

				var_462_21.a = Mathf.Lerp(0, 1, var_462_20)
				arg_459_1.mask_.color = var_462_21
			end

			if arg_459_1.time_ >= var_462_18 + var_462_19 and arg_459_1.time_ < var_462_18 + var_462_19 + arg_462_0 then
				local var_462_22 = Color.New(0, 0, 0)

				var_462_22.a = 1
				arg_459_1.mask_.color = var_462_22
			end

			local var_462_23 = 2

			if var_462_23 < arg_459_1.time_ and arg_459_1.time_ <= var_462_23 + arg_462_0 then
				arg_459_1.mask_.enabled = true
				arg_459_1.mask_.raycastTarget = true

				arg_459_1:SetGaussion(false)
			end

			local var_462_24 = 2

			if var_462_23 <= arg_459_1.time_ and arg_459_1.time_ < var_462_23 + var_462_24 then
				local var_462_25 = (arg_459_1.time_ - var_462_23) / var_462_24
				local var_462_26 = Color.New(0, 0, 0)

				var_462_26.a = Mathf.Lerp(1, 0, var_462_25)
				arg_459_1.mask_.color = var_462_26
			end

			if arg_459_1.time_ >= var_462_23 + var_462_24 and arg_459_1.time_ < var_462_23 + var_462_24 + arg_462_0 then
				local var_462_27 = Color.New(0, 0, 0)
				local var_462_28 = 0

				arg_459_1.mask_.enabled = false
				var_462_27.a = var_462_28
				arg_459_1.mask_.color = var_462_27
			end

			local var_462_29 = "10115"

			if arg_459_1.actors_[var_462_29] == nil then
				local var_462_30 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10115")

				if not isNil(var_462_30) then
					local var_462_31 = Object.Instantiate(var_462_30, arg_459_1.canvasGo_.transform)

					var_462_31.transform:SetSiblingIndex(1)

					var_462_31.name = var_462_29
					var_462_31.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_459_1.actors_[var_462_29] = var_462_31

					local var_462_32 = var_462_31:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_459_1.isInRecall_ then
						for iter_462_2, iter_462_3 in ipairs(var_462_32) do
							iter_462_3.color = arg_459_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_462_33 = arg_459_1.actors_["10115"]
			local var_462_34 = 3.76666666666667

			if var_462_34 < arg_459_1.time_ and arg_459_1.time_ <= var_462_34 + arg_462_0 and not isNil(var_462_33) and arg_459_1.var_.actorSpriteComps10115 == nil then
				arg_459_1.var_.actorSpriteComps10115 = var_462_33:GetComponentsInChildren(typeof(Image), true)
			end

			local var_462_35 = 0.2

			if var_462_34 <= arg_459_1.time_ and arg_459_1.time_ < var_462_34 + var_462_35 and not isNil(var_462_33) then
				local var_462_36 = (arg_459_1.time_ - var_462_34) / var_462_35

				if arg_459_1.var_.actorSpriteComps10115 then
					for iter_462_4, iter_462_5 in pairs(arg_459_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_462_5 then
							if arg_459_1.isInRecall_ then
								local var_462_37 = Mathf.Lerp(iter_462_5.color.r, arg_459_1.hightColor1.r, var_462_36)
								local var_462_38 = Mathf.Lerp(iter_462_5.color.g, arg_459_1.hightColor1.g, var_462_36)
								local var_462_39 = Mathf.Lerp(iter_462_5.color.b, arg_459_1.hightColor1.b, var_462_36)

								iter_462_5.color = Color.New(var_462_37, var_462_38, var_462_39)
							else
								local var_462_40 = Mathf.Lerp(iter_462_5.color.r, 1, var_462_36)

								iter_462_5.color = Color.New(var_462_40, var_462_40, var_462_40)
							end
						end
					end
				end
			end

			if arg_459_1.time_ >= var_462_34 + var_462_35 and arg_459_1.time_ < var_462_34 + var_462_35 + arg_462_0 and not isNil(var_462_33) and arg_459_1.var_.actorSpriteComps10115 then
				for iter_462_6, iter_462_7 in pairs(arg_459_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_462_7 then
						if arg_459_1.isInRecall_ then
							iter_462_7.color = arg_459_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_462_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_459_1.var_.actorSpriteComps10115 = nil
			end

			local var_462_41 = arg_459_1.actors_["10115"].transform
			local var_462_42 = 3.76666666666667

			if var_462_42 < arg_459_1.time_ and arg_459_1.time_ <= var_462_42 + arg_462_0 then
				arg_459_1.var_.moveOldPos10115 = var_462_41.localPosition
				var_462_41.localScale = Vector3.New(1, 1, 1)

				arg_459_1:CheckSpriteTmpPos("10115", 3)

				local var_462_43 = var_462_41.childCount

				for iter_462_8 = 0, var_462_43 - 1 do
					local var_462_44 = var_462_41:GetChild(iter_462_8)

					if var_462_44.name == "split_2" or not string.find(var_462_44.name, "split") then
						var_462_44.gameObject:SetActive(true)
					else
						var_462_44.gameObject:SetActive(false)
					end
				end
			end

			local var_462_45 = 0.001

			if var_462_42 <= arg_459_1.time_ and arg_459_1.time_ < var_462_42 + var_462_45 then
				local var_462_46 = (arg_459_1.time_ - var_462_42) / var_462_45
				local var_462_47 = Vector3.New(0, -355, -140)

				var_462_41.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos10115, var_462_47, var_462_46)
			end

			if arg_459_1.time_ >= var_462_42 + var_462_45 and arg_459_1.time_ < var_462_42 + var_462_45 + arg_462_0 then
				var_462_41.localPosition = Vector3.New(0, -355, -140)
			end

			local var_462_48 = arg_459_1.actors_["10115"]
			local var_462_49 = 3.76666666666667

			if var_462_49 < arg_459_1.time_ and arg_459_1.time_ <= var_462_49 + arg_462_0 then
				local var_462_50 = var_462_48:GetComponentInChildren(typeof(CanvasGroup))

				if var_462_50 then
					arg_459_1.var_.alphaOldValue10115 = var_462_50.alpha
					arg_459_1.var_.characterEffect10115 = var_462_50
				end

				arg_459_1.var_.alphaOldValue10115 = 0
			end

			local var_462_51 = 0.233333333333333

			if var_462_49 <= arg_459_1.time_ and arg_459_1.time_ < var_462_49 + var_462_51 then
				local var_462_52 = (arg_459_1.time_ - var_462_49) / var_462_51
				local var_462_53 = Mathf.Lerp(arg_459_1.var_.alphaOldValue10115, 1, var_462_52)

				if arg_459_1.var_.characterEffect10115 then
					arg_459_1.var_.characterEffect10115.alpha = var_462_53
				end
			end

			if arg_459_1.time_ >= var_462_49 + var_462_51 and arg_459_1.time_ < var_462_49 + var_462_51 + arg_462_0 and arg_459_1.var_.characterEffect10115 then
				arg_459_1.var_.characterEffect10115.alpha = 1
			end

			local var_462_54 = 1.43333333333333
			local var_462_55 = 1

			if var_462_54 < arg_459_1.time_ and arg_459_1.time_ <= var_462_54 + arg_462_0 then
				local var_462_56 = "stop"
				local var_462_57 = "effect"

				arg_459_1:AudioAction(var_462_56, var_462_57, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			local var_462_58 = 0
			local var_462_59 = 0.2

			if var_462_58 < arg_459_1.time_ and arg_459_1.time_ <= var_462_58 + arg_462_0 then
				local var_462_60 = "play"
				local var_462_61 = "music"

				arg_459_1:AudioAction(var_462_60, var_462_61, "ui_battle", "ui_battle_stopbgm", "")

				local var_462_62 = ""
				local var_462_63 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_462_63 ~= "" then
					if arg_459_1.bgmTxt_.text ~= var_462_63 and arg_459_1.bgmTxt_.text ~= "" then
						if arg_459_1.bgmTxt2_.text ~= "" then
							arg_459_1.bgmTxt_.text = arg_459_1.bgmTxt2_.text
						end

						arg_459_1.bgmTxt2_.text = var_462_63

						arg_459_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_459_1.bgmTxt_.text = var_462_63
					end

					if arg_459_1.bgmTimer then
						arg_459_1.bgmTimer:Stop()

						arg_459_1.bgmTimer = nil
					end

					if arg_459_1.settingData.show_music_name == 1 then
						arg_459_1.musicController:SetSelectedState("show")
						arg_459_1.musicAnimator_:Play("open", 0, 0)

						if arg_459_1.settingData.music_time ~= 0 then
							arg_459_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_459_1.settingData.music_time), function()
								if arg_459_1 == nil or isNil(arg_459_1.bgmTxt_) then
									return
								end

								arg_459_1.musicController:SetSelectedState("hide")
								arg_459_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_462_64 = 1.43333333333333
			local var_462_65 = 1

			if var_462_64 < arg_459_1.time_ and arg_459_1.time_ <= var_462_64 + arg_462_0 then
				local var_462_66 = "stop"
				local var_462_67 = "music"

				arg_459_1:AudioAction(var_462_66, var_462_67, "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base.awb")

				local var_462_68 = ""
				local var_462_69 = manager.audio:GetAudioName("bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base")

				if var_462_69 ~= "" then
					if arg_459_1.bgmTxt_.text ~= var_462_69 and arg_459_1.bgmTxt_.text ~= "" then
						if arg_459_1.bgmTxt2_.text ~= "" then
							arg_459_1.bgmTxt_.text = arg_459_1.bgmTxt2_.text
						end

						arg_459_1.bgmTxt2_.text = var_462_69

						arg_459_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_459_1.bgmTxt_.text = var_462_69
					end

					if arg_459_1.bgmTimer then
						arg_459_1.bgmTimer:Stop()

						arg_459_1.bgmTimer = nil
					end

					if arg_459_1.settingData.show_music_name == 1 then
						arg_459_1.musicController:SetSelectedState("show")
						arg_459_1.musicAnimator_:Play("open", 0, 0)

						if arg_459_1.settingData.music_time ~= 0 then
							arg_459_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_459_1.settingData.music_time), function()
								if arg_459_1 == nil or isNil(arg_459_1.bgmTxt_) then
									return
								end

								arg_459_1.musicController:SetSelectedState("hide")
								arg_459_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_459_1.frameCnt_ <= 1 then
				arg_459_1.dialog_:SetActive(false)
			end

			local var_462_70 = 4
			local var_462_71 = 0.55

			if var_462_70 < arg_459_1.time_ and arg_459_1.time_ <= var_462_70 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0

				arg_459_1.dialog_:SetActive(true)

				local var_462_72 = LeanTween.value(arg_459_1.dialog_, 0, 1, 0.3)

				var_462_72:setOnUpdate(LuaHelper.FloatAction(function(arg_465_0)
					arg_459_1.dialogCg_.alpha = arg_465_0
				end))
				var_462_72:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_459_1.dialog_)
					var_462_72:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_459_1.duration_ = arg_459_1.duration_ + 0.3

				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_73 = arg_459_1:FormatText(StoryNameCfg[1113].name)

				arg_459_1.leftNameTxt_.text = var_462_73

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_74 = arg_459_1:GetWordFromCfg(417221106)
				local var_462_75 = arg_459_1:FormatText(var_462_74.content)

				arg_459_1.text_.text = var_462_75

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_76 = 22
				local var_462_77 = utf8.len(var_462_75)
				local var_462_78 = var_462_76 <= 0 and var_462_71 or var_462_71 * (var_462_77 / var_462_76)

				if var_462_78 > 0 and var_462_71 < var_462_78 then
					arg_459_1.talkMaxDuration = var_462_78
					var_462_70 = var_462_70 + 0.3

					if var_462_78 + var_462_70 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_78 + var_462_70
					end
				end

				arg_459_1.text_.text = var_462_75
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221106", "story_v_out_417221.awb") ~= 0 then
					local var_462_79 = manager.audio:GetVoiceLength("story_v_out_417221", "417221106", "story_v_out_417221.awb") / 1000

					if var_462_79 + var_462_70 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_79 + var_462_70
					end

					if var_462_74.prefab_name ~= "" and arg_459_1.actors_[var_462_74.prefab_name] ~= nil then
						local var_462_80 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_74.prefab_name].transform, "story_v_out_417221", "417221106", "story_v_out_417221.awb")

						arg_459_1:RecordAudio("417221106", var_462_80)
						arg_459_1:RecordAudio("417221106", var_462_80)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_417221", "417221106", "story_v_out_417221.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_417221", "417221106", "story_v_out_417221.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_81 = var_462_70 + 0.3
			local var_462_82 = math.max(var_462_71, arg_459_1.talkMaxDuration)

			if var_462_81 <= arg_459_1.time_ and arg_459_1.time_ < var_462_81 + var_462_82 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_81) / var_462_82

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_81 + var_462_82 and arg_459_1.time_ < var_462_81 + var_462_82 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play417221107 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 417221107
		arg_467_1.duration_ = 5.57

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play417221108(arg_467_1)
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

				local var_470_2 = arg_467_1:FormatText(StoryNameCfg[1113].name)

				arg_467_1.leftNameTxt_.text = var_470_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_3 = arg_467_1:GetWordFromCfg(417221107)
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221107", "story_v_out_417221.awb") ~= 0 then
					local var_470_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221107", "story_v_out_417221.awb") / 1000

					if var_470_8 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_0
					end

					if var_470_3.prefab_name ~= "" and arg_467_1.actors_[var_470_3.prefab_name] ~= nil then
						local var_470_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_3.prefab_name].transform, "story_v_out_417221", "417221107", "story_v_out_417221.awb")

						arg_467_1:RecordAudio("417221107", var_470_9)
						arg_467_1:RecordAudio("417221107", var_470_9)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_417221", "417221107", "story_v_out_417221.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_417221", "417221107", "story_v_out_417221.awb")
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
	Play417221108 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 417221108
		arg_471_1.duration_ = 8.7

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play417221109(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 1.05

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_2 = arg_471_1:FormatText(StoryNameCfg[1113].name)

				arg_471_1.leftNameTxt_.text = var_474_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_3 = arg_471_1:GetWordFromCfg(417221108)
				local var_474_4 = arg_471_1:FormatText(var_474_3.content)

				arg_471_1.text_.text = var_474_4

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_5 = 42
				local var_474_6 = utf8.len(var_474_4)
				local var_474_7 = var_474_5 <= 0 and var_474_1 or var_474_1 * (var_474_6 / var_474_5)

				if var_474_7 > 0 and var_474_1 < var_474_7 then
					arg_471_1.talkMaxDuration = var_474_7

					if var_474_7 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_7 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_4
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221108", "story_v_out_417221.awb") ~= 0 then
					local var_474_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221108", "story_v_out_417221.awb") / 1000

					if var_474_8 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_8 + var_474_0
					end

					if var_474_3.prefab_name ~= "" and arg_471_1.actors_[var_474_3.prefab_name] ~= nil then
						local var_474_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_3.prefab_name].transform, "story_v_out_417221", "417221108", "story_v_out_417221.awb")

						arg_471_1:RecordAudio("417221108", var_474_9)
						arg_471_1:RecordAudio("417221108", var_474_9)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_417221", "417221108", "story_v_out_417221.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_417221", "417221108", "story_v_out_417221.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_10 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_10 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_10

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_10 and arg_471_1.time_ < var_474_0 + var_474_10 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play417221109 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 417221109
		arg_475_1.duration_ = 3.93

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play417221110(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.425

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[1113].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(417221109)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 17
				local var_478_6 = utf8.len(var_478_4)
				local var_478_7 = var_478_5 <= 0 and var_478_1 or var_478_1 * (var_478_6 / var_478_5)

				if var_478_7 > 0 and var_478_1 < var_478_7 then
					arg_475_1.talkMaxDuration = var_478_7

					if var_478_7 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_7 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_4
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221109", "story_v_out_417221.awb") ~= 0 then
					local var_478_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221109", "story_v_out_417221.awb") / 1000

					if var_478_8 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_0
					end

					if var_478_3.prefab_name ~= "" and arg_475_1.actors_[var_478_3.prefab_name] ~= nil then
						local var_478_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_3.prefab_name].transform, "story_v_out_417221", "417221109", "story_v_out_417221.awb")

						arg_475_1:RecordAudio("417221109", var_478_9)
						arg_475_1:RecordAudio("417221109", var_478_9)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_417221", "417221109", "story_v_out_417221.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_417221", "417221109", "story_v_out_417221.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_10 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_10 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_10

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_10 and arg_475_1.time_ < var_478_0 + var_478_10 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play417221110 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 417221110
		arg_479_1.duration_ = 5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play417221111(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["10115"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos10115 = var_482_0.localPosition
				var_482_0.localScale = Vector3.New(1, 1, 1)

				arg_479_1:CheckSpriteTmpPos("10115", 7)

				local var_482_2 = var_482_0.childCount

				for iter_482_0 = 0, var_482_2 - 1 do
					local var_482_3 = var_482_0:GetChild(iter_482_0)

					if var_482_3.name == "" or not string.find(var_482_3.name, "split") then
						var_482_3.gameObject:SetActive(true)
					else
						var_482_3.gameObject:SetActive(false)
					end
				end
			end

			local var_482_4 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_4 then
				local var_482_5 = (arg_479_1.time_ - var_482_1) / var_482_4
				local var_482_6 = Vector3.New(0, -2000, -140)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos10115, var_482_6, var_482_5)
			end

			if arg_479_1.time_ >= var_482_1 + var_482_4 and arg_479_1.time_ < var_482_1 + var_482_4 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_482_7 = 0
			local var_482_8 = 0.2

			if var_482_7 < arg_479_1.time_ and arg_479_1.time_ <= var_482_7 + arg_482_0 then
				local var_482_9 = "play"
				local var_482_10 = "music"

				arg_479_1:AudioAction(var_482_9, var_482_10, "ui_battle", "ui_battle_stopbgm", "")

				local var_482_11 = ""
				local var_482_12 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_482_12 ~= "" then
					if arg_479_1.bgmTxt_.text ~= var_482_12 and arg_479_1.bgmTxt_.text ~= "" then
						if arg_479_1.bgmTxt2_.text ~= "" then
							arg_479_1.bgmTxt_.text = arg_479_1.bgmTxt2_.text
						end

						arg_479_1.bgmTxt2_.text = var_482_12

						arg_479_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_479_1.bgmTxt_.text = var_482_12
					end

					if arg_479_1.bgmTimer then
						arg_479_1.bgmTimer:Stop()

						arg_479_1.bgmTimer = nil
					end

					if arg_479_1.settingData.show_music_name == 1 then
						arg_479_1.musicController:SetSelectedState("show")
						arg_479_1.musicAnimator_:Play("open", 0, 0)

						if arg_479_1.settingData.music_time ~= 0 then
							arg_479_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_479_1.settingData.music_time), function()
								if arg_479_1 == nil or isNil(arg_479_1.bgmTxt_) then
									return
								end

								arg_479_1.musicController:SetSelectedState("hide")
								arg_479_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_482_13 = 0.3
			local var_482_14 = 1

			if var_482_13 < arg_479_1.time_ and arg_479_1.time_ <= var_482_13 + arg_482_0 then
				local var_482_15 = "play"
				local var_482_16 = "music"

				arg_479_1:AudioAction(var_482_15, var_482_16, "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base.awb")

				local var_482_17 = ""
				local var_482_18 = manager.audio:GetAudioName("bgm_activity_3_10_story_corg_base", "bgm_activity_3_10_story_corg_base")

				if var_482_18 ~= "" then
					if arg_479_1.bgmTxt_.text ~= var_482_18 and arg_479_1.bgmTxt_.text ~= "" then
						if arg_479_1.bgmTxt2_.text ~= "" then
							arg_479_1.bgmTxt_.text = arg_479_1.bgmTxt2_.text
						end

						arg_479_1.bgmTxt2_.text = var_482_18

						arg_479_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_479_1.bgmTxt_.text = var_482_18
					end

					if arg_479_1.bgmTimer then
						arg_479_1.bgmTimer:Stop()

						arg_479_1.bgmTimer = nil
					end

					if arg_479_1.settingData.show_music_name == 1 then
						arg_479_1.musicController:SetSelectedState("show")
						arg_479_1.musicAnimator_:Play("open", 0, 0)

						if arg_479_1.settingData.music_time ~= 0 then
							arg_479_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_479_1.settingData.music_time), function()
								if arg_479_1 == nil or isNil(arg_479_1.bgmTxt_) then
									return
								end

								arg_479_1.musicController:SetSelectedState("hide")
								arg_479_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_482_19 = 0
			local var_482_20 = 1.175

			if var_482_19 < arg_479_1.time_ and arg_479_1.time_ <= var_482_19 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, false)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_21 = arg_479_1:GetWordFromCfg(417221110)
				local var_482_22 = arg_479_1:FormatText(var_482_21.content)

				arg_479_1.text_.text = var_482_22

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_23 = 47
				local var_482_24 = utf8.len(var_482_22)
				local var_482_25 = var_482_23 <= 0 and var_482_20 or var_482_20 * (var_482_24 / var_482_23)

				if var_482_25 > 0 and var_482_20 < var_482_25 then
					arg_479_1.talkMaxDuration = var_482_25

					if var_482_25 + var_482_19 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_25 + var_482_19
					end
				end

				arg_479_1.text_.text = var_482_22
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)
				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_26 = math.max(var_482_20, arg_479_1.talkMaxDuration)

			if var_482_19 <= arg_479_1.time_ and arg_479_1.time_ < var_482_19 + var_482_26 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_19) / var_482_26

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_19 + var_482_26 and arg_479_1.time_ < var_482_19 + var_482_26 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play417221111 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 417221111
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play417221112(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.85

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, false)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_2 = arg_485_1:GetWordFromCfg(417221111)
				local var_488_3 = arg_485_1:FormatText(var_488_2.content)

				arg_485_1.text_.text = var_488_3

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_4 = 34
				local var_488_5 = utf8.len(var_488_3)
				local var_488_6 = var_488_4 <= 0 and var_488_1 or var_488_1 * (var_488_5 / var_488_4)

				if var_488_6 > 0 and var_488_1 < var_488_6 then
					arg_485_1.talkMaxDuration = var_488_6

					if var_488_6 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_6 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_3
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_7 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_7 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_7

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_7 and arg_485_1.time_ < var_488_0 + var_488_7 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play417221112 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 417221112
		arg_489_1.duration_ = 1.2

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play417221113(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["10115"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.actorSpriteComps10115 == nil then
				arg_489_1.var_.actorSpriteComps10115 = var_492_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_492_2 = 0.2

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 and not isNil(var_492_0) then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.actorSpriteComps10115 then
					for iter_492_0, iter_492_1 in pairs(arg_489_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_492_1 then
							if arg_489_1.isInRecall_ then
								local var_492_4 = Mathf.Lerp(iter_492_1.color.r, arg_489_1.hightColor1.r, var_492_3)
								local var_492_5 = Mathf.Lerp(iter_492_1.color.g, arg_489_1.hightColor1.g, var_492_3)
								local var_492_6 = Mathf.Lerp(iter_492_1.color.b, arg_489_1.hightColor1.b, var_492_3)

								iter_492_1.color = Color.New(var_492_4, var_492_5, var_492_6)
							else
								local var_492_7 = Mathf.Lerp(iter_492_1.color.r, 1, var_492_3)

								iter_492_1.color = Color.New(var_492_7, var_492_7, var_492_7)
							end
						end
					end
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.actorSpriteComps10115 then
				for iter_492_2, iter_492_3 in pairs(arg_489_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_492_3 then
						if arg_489_1.isInRecall_ then
							iter_492_3.color = arg_489_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_492_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_489_1.var_.actorSpriteComps10115 = nil
			end

			local var_492_8 = arg_489_1.actors_["10115"].transform
			local var_492_9 = 0

			if var_492_9 < arg_489_1.time_ and arg_489_1.time_ <= var_492_9 + arg_492_0 then
				arg_489_1.var_.moveOldPos10115 = var_492_8.localPosition
				var_492_8.localScale = Vector3.New(1, 1, 1)

				arg_489_1:CheckSpriteTmpPos("10115", 3)

				local var_492_10 = var_492_8.childCount

				for iter_492_4 = 0, var_492_10 - 1 do
					local var_492_11 = var_492_8:GetChild(iter_492_4)

					if var_492_11.name == "split_1" or not string.find(var_492_11.name, "split") then
						var_492_11.gameObject:SetActive(true)
					else
						var_492_11.gameObject:SetActive(false)
					end
				end
			end

			local var_492_12 = 0.001

			if var_492_9 <= arg_489_1.time_ and arg_489_1.time_ < var_492_9 + var_492_12 then
				local var_492_13 = (arg_489_1.time_ - var_492_9) / var_492_12
				local var_492_14 = Vector3.New(0, -355, -140)

				var_492_8.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos10115, var_492_14, var_492_13)
			end

			if arg_489_1.time_ >= var_492_9 + var_492_12 and arg_489_1.time_ < var_492_9 + var_492_12 + arg_492_0 then
				var_492_8.localPosition = Vector3.New(0, -355, -140)
			end

			local var_492_15 = 0
			local var_492_16 = 0.1

			if var_492_15 < arg_489_1.time_ and arg_489_1.time_ <= var_492_15 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_17 = arg_489_1:FormatText(StoryNameCfg[1113].name)

				arg_489_1.leftNameTxt_.text = var_492_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_18 = arg_489_1:GetWordFromCfg(417221112)
				local var_492_19 = arg_489_1:FormatText(var_492_18.content)

				arg_489_1.text_.text = var_492_19

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_20 = 4
				local var_492_21 = utf8.len(var_492_19)
				local var_492_22 = var_492_20 <= 0 and var_492_16 or var_492_16 * (var_492_21 / var_492_20)

				if var_492_22 > 0 and var_492_16 < var_492_22 then
					arg_489_1.talkMaxDuration = var_492_22

					if var_492_22 + var_492_15 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_22 + var_492_15
					end
				end

				arg_489_1.text_.text = var_492_19
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221112", "story_v_out_417221.awb") ~= 0 then
					local var_492_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221112", "story_v_out_417221.awb") / 1000

					if var_492_23 + var_492_15 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_23 + var_492_15
					end

					if var_492_18.prefab_name ~= "" and arg_489_1.actors_[var_492_18.prefab_name] ~= nil then
						local var_492_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_18.prefab_name].transform, "story_v_out_417221", "417221112", "story_v_out_417221.awb")

						arg_489_1:RecordAudio("417221112", var_492_24)
						arg_489_1:RecordAudio("417221112", var_492_24)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_417221", "417221112", "story_v_out_417221.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_417221", "417221112", "story_v_out_417221.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_25 = math.max(var_492_16, arg_489_1.talkMaxDuration)

			if var_492_15 <= arg_489_1.time_ and arg_489_1.time_ < var_492_15 + var_492_25 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_15) / var_492_25

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_15 + var_492_25 and arg_489_1.time_ < var_492_15 + var_492_25 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play417221113 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 417221113
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play417221114(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["10115"].transform
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1.var_.moveOldPos10115 = var_496_0.localPosition
				var_496_0.localScale = Vector3.New(1, 1, 1)

				arg_493_1:CheckSpriteTmpPos("10115", 7)

				local var_496_2 = var_496_0.childCount

				for iter_496_0 = 0, var_496_2 - 1 do
					local var_496_3 = var_496_0:GetChild(iter_496_0)

					if var_496_3.name == "" or not string.find(var_496_3.name, "split") then
						var_496_3.gameObject:SetActive(true)
					else
						var_496_3.gameObject:SetActive(false)
					end
				end
			end

			local var_496_4 = 0.001

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_4 then
				local var_496_5 = (arg_493_1.time_ - var_496_1) / var_496_4
				local var_496_6 = Vector3.New(0, -2000, -140)

				var_496_0.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos10115, var_496_6, var_496_5)
			end

			if arg_493_1.time_ >= var_496_1 + var_496_4 and arg_493_1.time_ < var_496_1 + var_496_4 + arg_496_0 then
				var_496_0.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_496_7 = 0.02
			local var_496_8 = 1

			if var_496_7 < arg_493_1.time_ and arg_493_1.time_ <= var_496_7 + arg_496_0 then
				local var_496_9 = "play"
				local var_496_10 = "effect"

				arg_493_1:AudioAction(var_496_9, var_496_10, "ui_system_3_0", "ui_sight_archieve_in", "")
			end

			local var_496_11 = 0
			local var_496_12 = 0.925

			if var_496_11 < arg_493_1.time_ and arg_493_1.time_ <= var_496_11 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_13 = arg_493_1:GetWordFromCfg(417221113)
				local var_496_14 = arg_493_1:FormatText(var_496_13.content)

				arg_493_1.text_.text = var_496_14

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_15 = 37
				local var_496_16 = utf8.len(var_496_14)
				local var_496_17 = var_496_15 <= 0 and var_496_12 or var_496_12 * (var_496_16 / var_496_15)

				if var_496_17 > 0 and var_496_12 < var_496_17 then
					arg_493_1.talkMaxDuration = var_496_17

					if var_496_17 + var_496_11 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_17 + var_496_11
					end
				end

				arg_493_1.text_.text = var_496_14
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_18 = math.max(var_496_12, arg_493_1.talkMaxDuration)

			if var_496_11 <= arg_493_1.time_ and arg_493_1.time_ < var_496_11 + var_496_18 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_11) / var_496_18

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_11 + var_496_18 and arg_493_1.time_ < var_496_11 + var_496_18 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play417221114 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 417221114
		arg_497_1.duration_ = 8.37

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play417221115(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = "ST2104"

			if arg_497_1.bgs_[var_500_0] == nil then
				local var_500_1 = Object.Instantiate(arg_497_1.paintGo_)

				var_500_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_500_0)
				var_500_1.name = var_500_0
				var_500_1.transform.parent = arg_497_1.stage_.transform
				var_500_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_497_1.bgs_[var_500_0] = var_500_1
			end

			local var_500_2 = 2

			if var_500_2 < arg_497_1.time_ and arg_497_1.time_ <= var_500_2 + arg_500_0 then
				local var_500_3 = manager.ui.mainCamera.transform.localPosition
				local var_500_4 = Vector3.New(0, 0, 10) + Vector3.New(var_500_3.x, var_500_3.y, 0)
				local var_500_5 = arg_497_1.bgs_.ST2104

				var_500_5.transform.localPosition = var_500_4
				var_500_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_500_6 = var_500_5:GetComponent("SpriteRenderer")

				if var_500_6 and var_500_6.sprite then
					local var_500_7 = (var_500_5.transform.localPosition - var_500_3).z
					local var_500_8 = manager.ui.mainCameraCom_
					local var_500_9 = 2 * var_500_7 * Mathf.Tan(var_500_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_500_10 = var_500_9 * var_500_8.aspect
					local var_500_11 = var_500_6.sprite.bounds.size.x
					local var_500_12 = var_500_6.sprite.bounds.size.y
					local var_500_13 = var_500_10 / var_500_11
					local var_500_14 = var_500_9 / var_500_12
					local var_500_15 = var_500_14 < var_500_13 and var_500_13 or var_500_14

					var_500_5.transform.localScale = Vector3.New(var_500_15, var_500_15, 0)
				end

				for iter_500_0, iter_500_1 in pairs(arg_497_1.bgs_) do
					if iter_500_0 ~= "ST2104" then
						iter_500_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_500_16 = 4

			if var_500_16 < arg_497_1.time_ and arg_497_1.time_ <= var_500_16 + arg_500_0 then
				arg_497_1.allBtn_.enabled = false
			end

			local var_500_17 = 0.3

			if arg_497_1.time_ >= var_500_16 + var_500_17 and arg_497_1.time_ < var_500_16 + var_500_17 + arg_500_0 then
				arg_497_1.allBtn_.enabled = true
			end

			local var_500_18 = 0

			if var_500_18 < arg_497_1.time_ and arg_497_1.time_ <= var_500_18 + arg_500_0 then
				arg_497_1.mask_.enabled = true
				arg_497_1.mask_.raycastTarget = true

				arg_497_1:SetGaussion(false)
			end

			local var_500_19 = 2

			if var_500_18 <= arg_497_1.time_ and arg_497_1.time_ < var_500_18 + var_500_19 then
				local var_500_20 = (arg_497_1.time_ - var_500_18) / var_500_19
				local var_500_21 = Color.New(0, 0, 0)

				var_500_21.a = Mathf.Lerp(0, 1, var_500_20)
				arg_497_1.mask_.color = var_500_21
			end

			if arg_497_1.time_ >= var_500_18 + var_500_19 and arg_497_1.time_ < var_500_18 + var_500_19 + arg_500_0 then
				local var_500_22 = Color.New(0, 0, 0)

				var_500_22.a = 1
				arg_497_1.mask_.color = var_500_22
			end

			local var_500_23 = 2

			if var_500_23 < arg_497_1.time_ and arg_497_1.time_ <= var_500_23 + arg_500_0 then
				arg_497_1.mask_.enabled = true
				arg_497_1.mask_.raycastTarget = true

				arg_497_1:SetGaussion(false)
			end

			local var_500_24 = 2

			if var_500_23 <= arg_497_1.time_ and arg_497_1.time_ < var_500_23 + var_500_24 then
				local var_500_25 = (arg_497_1.time_ - var_500_23) / var_500_24
				local var_500_26 = Color.New(0, 0, 0)

				var_500_26.a = Mathf.Lerp(1, 0, var_500_25)
				arg_497_1.mask_.color = var_500_26
			end

			if arg_497_1.time_ >= var_500_23 + var_500_24 and arg_497_1.time_ < var_500_23 + var_500_24 + arg_500_0 then
				local var_500_27 = Color.New(0, 0, 0)
				local var_500_28 = 0

				arg_497_1.mask_.enabled = false
				var_500_27.a = var_500_28
				arg_497_1.mask_.color = var_500_27
			end

			local var_500_29 = manager.ui.mainCamera.transform
			local var_500_30 = 2

			if var_500_30 < arg_497_1.time_ and arg_497_1.time_ <= var_500_30 + arg_500_0 then
				local var_500_31 = arg_497_1.var_.effect21114

				if not var_500_31 then
					var_500_31 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_jingbao_in_keep"))
					var_500_31.name = "21114"
					arg_497_1.var_.effect21114 = var_500_31
				end

				local var_500_32 = var_500_29:Find("")

				if var_500_32 then
					var_500_31.transform.parent = var_500_32
				else
					var_500_31.transform.parent = var_500_29
				end

				var_500_31.transform.localPosition = Vector3.New(0, 0, -0.6)
				var_500_31.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_500_33 = manager.ui.mainCameraCom_
				local var_500_34 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_500_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_500_35 = var_500_31.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_500_36 = 15
				local var_500_37 = 2 * var_500_36 * Mathf.Tan(var_500_33.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_500_33.aspect
				local var_500_38 = 1
				local var_500_39 = 1.7777777777777777

				if var_500_39 < var_500_33.aspect then
					var_500_38 = var_500_37 / (2 * var_500_36 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_500_39)
				end

				for iter_500_2, iter_500_3 in ipairs(var_500_35) do
					local var_500_40 = iter_500_3.transform.localScale

					iter_500_3.transform.localScale = Vector3.New(var_500_40.x / var_500_34 * var_500_38, var_500_40.y / var_500_34, var_500_40.z)
				end
			end

			local var_500_41 = 2
			local var_500_42 = 1

			if var_500_41 < arg_497_1.time_ and arg_497_1.time_ <= var_500_41 + arg_500_0 then
				local var_500_43 = "play"
				local var_500_44 = "effect"

				arg_497_1:AudioAction(var_500_43, var_500_44, "se_story_129", "se_story_129_alarm", "")
			end

			if arg_497_1.frameCnt_ <= 1 then
				arg_497_1.dialog_:SetActive(false)
			end

			local var_500_45 = 4
			local var_500_46 = 0.65

			if var_500_45 < arg_497_1.time_ and arg_497_1.time_ <= var_500_45 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0

				arg_497_1.dialog_:SetActive(true)

				local var_500_47 = LeanTween.value(arg_497_1.dialog_, 0, 1, 0.3)

				var_500_47:setOnUpdate(LuaHelper.FloatAction(function(arg_501_0)
					arg_497_1.dialogCg_.alpha = arg_501_0
				end))
				var_500_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_497_1.dialog_)
					var_500_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_497_1.duration_ = arg_497_1.duration_ + 0.3

				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_48 = arg_497_1:FormatText(StoryNameCfg[1144].name)

				arg_497_1.leftNameTxt_.text = var_500_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, true)
				arg_497_1.iconController_:SetSelectedState("hero")

				arg_497_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_497_1.callingController_:SetSelectedState("normal")

				arg_497_1.keyicon_.color = Color.New(1, 1, 1)
				arg_497_1.icon_.color = Color.New(1, 1, 1)

				local var_500_49 = arg_497_1:GetWordFromCfg(417221114)
				local var_500_50 = arg_497_1:FormatText(var_500_49.content)

				arg_497_1.text_.text = var_500_50

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_51 = 26
				local var_500_52 = utf8.len(var_500_50)
				local var_500_53 = var_500_51 <= 0 and var_500_46 or var_500_46 * (var_500_52 / var_500_51)

				if var_500_53 > 0 and var_500_46 < var_500_53 then
					arg_497_1.talkMaxDuration = var_500_53
					var_500_45 = var_500_45 + 0.3

					if var_500_53 + var_500_45 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_53 + var_500_45
					end
				end

				arg_497_1.text_.text = var_500_50
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221114", "story_v_out_417221.awb") ~= 0 then
					local var_500_54 = manager.audio:GetVoiceLength("story_v_out_417221", "417221114", "story_v_out_417221.awb") / 1000

					if var_500_54 + var_500_45 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_54 + var_500_45
					end

					if var_500_49.prefab_name ~= "" and arg_497_1.actors_[var_500_49.prefab_name] ~= nil then
						local var_500_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_49.prefab_name].transform, "story_v_out_417221", "417221114", "story_v_out_417221.awb")

						arg_497_1:RecordAudio("417221114", var_500_55)
						arg_497_1:RecordAudio("417221114", var_500_55)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_417221", "417221114", "story_v_out_417221.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_417221", "417221114", "story_v_out_417221.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_56 = var_500_45 + 0.3
			local var_500_57 = math.max(var_500_46, arg_497_1.talkMaxDuration)

			if var_500_56 <= arg_497_1.time_ and arg_497_1.time_ < var_500_56 + var_500_57 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_56) / var_500_57

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_56 + var_500_57 and arg_497_1.time_ < var_500_56 + var_500_57 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play417221115 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 417221115
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play417221116(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.825

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_2 = arg_503_1:GetWordFromCfg(417221115)
				local var_506_3 = arg_503_1:FormatText(var_506_2.content)

				arg_503_1.text_.text = var_506_3

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_4 = 33
				local var_506_5 = utf8.len(var_506_3)
				local var_506_6 = var_506_4 <= 0 and var_506_1 or var_506_1 * (var_506_5 / var_506_4)

				if var_506_6 > 0 and var_506_1 < var_506_6 then
					arg_503_1.talkMaxDuration = var_506_6

					if var_506_6 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_6 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_3
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_7 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_7 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_7

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_7 and arg_503_1.time_ < var_506_0 + var_506_7 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play417221116 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 417221116
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play417221117(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 1.05

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_2 = arg_507_1:GetWordFromCfg(417221116)
				local var_510_3 = arg_507_1:FormatText(var_510_2.content)

				arg_507_1.text_.text = var_510_3

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_4 = 42
				local var_510_5 = utf8.len(var_510_3)
				local var_510_6 = var_510_4 <= 0 and var_510_1 or var_510_1 * (var_510_5 / var_510_4)

				if var_510_6 > 0 and var_510_1 < var_510_6 then
					arg_507_1.talkMaxDuration = var_510_6

					if var_510_6 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_6 + var_510_0
					end
				end

				arg_507_1.text_.text = var_510_3
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_7 = math.max(var_510_1, arg_507_1.talkMaxDuration)

			if var_510_0 <= arg_507_1.time_ and arg_507_1.time_ < var_510_0 + var_510_7 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_0) / var_510_7

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_0 + var_510_7 and arg_507_1.time_ < var_510_0 + var_510_7 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play417221117 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 417221117
		arg_511_1.duration_ = 3.2

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play417221118(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = manager.ui.mainCamera.transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				local var_514_2 = arg_511_1.var_.effect21114

				if var_514_2 then
					Object.Destroy(var_514_2)

					arg_511_1.var_.effect21114 = nil
				end
			end

			local var_514_3 = 0
			local var_514_4 = 0.35

			if var_514_3 < arg_511_1.time_ and arg_511_1.time_ <= var_514_3 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_5 = arg_511_1:FormatText(StoryNameCfg[1144].name)

				arg_511_1.leftNameTxt_.text = var_514_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, true)
				arg_511_1.iconController_:SetSelectedState("hero")

				arg_511_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_511_1.callingController_:SetSelectedState("normal")

				arg_511_1.keyicon_.color = Color.New(1, 1, 1)
				arg_511_1.icon_.color = Color.New(1, 1, 1)

				local var_514_6 = arg_511_1:GetWordFromCfg(417221117)
				local var_514_7 = arg_511_1:FormatText(var_514_6.content)

				arg_511_1.text_.text = var_514_7

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_8 = 14
				local var_514_9 = utf8.len(var_514_7)
				local var_514_10 = var_514_8 <= 0 and var_514_4 or var_514_4 * (var_514_9 / var_514_8)

				if var_514_10 > 0 and var_514_4 < var_514_10 then
					arg_511_1.talkMaxDuration = var_514_10

					if var_514_10 + var_514_3 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_10 + var_514_3
					end
				end

				arg_511_1.text_.text = var_514_7
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221117", "story_v_out_417221.awb") ~= 0 then
					local var_514_11 = manager.audio:GetVoiceLength("story_v_out_417221", "417221117", "story_v_out_417221.awb") / 1000

					if var_514_11 + var_514_3 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_11 + var_514_3
					end

					if var_514_6.prefab_name ~= "" and arg_511_1.actors_[var_514_6.prefab_name] ~= nil then
						local var_514_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_6.prefab_name].transform, "story_v_out_417221", "417221117", "story_v_out_417221.awb")

						arg_511_1:RecordAudio("417221117", var_514_12)
						arg_511_1:RecordAudio("417221117", var_514_12)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_417221", "417221117", "story_v_out_417221.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_417221", "417221117", "story_v_out_417221.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_13 = math.max(var_514_4, arg_511_1.talkMaxDuration)

			if var_514_3 <= arg_511_1.time_ and arg_511_1.time_ < var_514_3 + var_514_13 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_3) / var_514_13

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_3 + var_514_13 and arg_511_1.time_ < var_514_3 + var_514_13 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play417221118 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 417221118
		arg_515_1.duration_ = 3.47

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play417221119(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.225

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_2 = arg_515_1:FormatText(StoryNameCfg[1151].name)

				arg_515_1.leftNameTxt_.text = var_518_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, true)
				arg_515_1.iconController_:SetSelectedState("hero")

				arg_515_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_515_1.callingController_:SetSelectedState("calling")

				arg_515_1.keyicon_.color = Color.New(1, 1, 1)
				arg_515_1.icon_.color = Color.New(1, 1, 1)

				local var_518_3 = arg_515_1:GetWordFromCfg(417221118)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 9
				local var_518_6 = utf8.len(var_518_4)
				local var_518_7 = var_518_5 <= 0 and var_518_1 or var_518_1 * (var_518_6 / var_518_5)

				if var_518_7 > 0 and var_518_1 < var_518_7 then
					arg_515_1.talkMaxDuration = var_518_7

					if var_518_7 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_7 + var_518_0
					end
				end

				arg_515_1.text_.text = var_518_4
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221118", "story_v_out_417221.awb") ~= 0 then
					local var_518_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221118", "story_v_out_417221.awb") / 1000

					if var_518_8 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_8 + var_518_0
					end

					if var_518_3.prefab_name ~= "" and arg_515_1.actors_[var_518_3.prefab_name] ~= nil then
						local var_518_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_3.prefab_name].transform, "story_v_out_417221", "417221118", "story_v_out_417221.awb")

						arg_515_1:RecordAudio("417221118", var_518_9)
						arg_515_1:RecordAudio("417221118", var_518_9)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_417221", "417221118", "story_v_out_417221.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_417221", "417221118", "story_v_out_417221.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_10 = math.max(var_518_1, arg_515_1.talkMaxDuration)

			if var_518_0 <= arg_515_1.time_ and arg_515_1.time_ < var_518_0 + var_518_10 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_0) / var_518_10

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_0 + var_518_10 and arg_515_1.time_ < var_518_0 + var_518_10 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play417221119 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 417221119
		arg_519_1.duration_ = 1.33

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play417221120(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["10115"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and not isNil(var_522_0) and arg_519_1.var_.actorSpriteComps10115 == nil then
				arg_519_1.var_.actorSpriteComps10115 = var_522_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_2 = 0.2

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 and not isNil(var_522_0) then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.actorSpriteComps10115 then
					for iter_522_0, iter_522_1 in pairs(arg_519_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_522_1 then
							if arg_519_1.isInRecall_ then
								local var_522_4 = Mathf.Lerp(iter_522_1.color.r, arg_519_1.hightColor1.r, var_522_3)
								local var_522_5 = Mathf.Lerp(iter_522_1.color.g, arg_519_1.hightColor1.g, var_522_3)
								local var_522_6 = Mathf.Lerp(iter_522_1.color.b, arg_519_1.hightColor1.b, var_522_3)

								iter_522_1.color = Color.New(var_522_4, var_522_5, var_522_6)
							else
								local var_522_7 = Mathf.Lerp(iter_522_1.color.r, 1, var_522_3)

								iter_522_1.color = Color.New(var_522_7, var_522_7, var_522_7)
							end
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and not isNil(var_522_0) and arg_519_1.var_.actorSpriteComps10115 then
				for iter_522_2, iter_522_3 in pairs(arg_519_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_522_3 then
						if arg_519_1.isInRecall_ then
							iter_522_3.color = arg_519_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_522_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_519_1.var_.actorSpriteComps10115 = nil
			end

			local var_522_8 = arg_519_1.actors_["10115"].transform
			local var_522_9 = 0

			if var_522_9 < arg_519_1.time_ and arg_519_1.time_ <= var_522_9 + arg_522_0 then
				arg_519_1.var_.moveOldPos10115 = var_522_8.localPosition
				var_522_8.localScale = Vector3.New(1, 1, 1)

				arg_519_1:CheckSpriteTmpPos("10115", 3)

				local var_522_10 = var_522_8.childCount

				for iter_522_4 = 0, var_522_10 - 1 do
					local var_522_11 = var_522_8:GetChild(iter_522_4)

					if var_522_11.name == "split_6" or not string.find(var_522_11.name, "split") then
						var_522_11.gameObject:SetActive(true)
					else
						var_522_11.gameObject:SetActive(false)
					end
				end
			end

			local var_522_12 = 0.001

			if var_522_9 <= arg_519_1.time_ and arg_519_1.time_ < var_522_9 + var_522_12 then
				local var_522_13 = (arg_519_1.time_ - var_522_9) / var_522_12
				local var_522_14 = Vector3.New(0, -355, -140)

				var_522_8.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10115, var_522_14, var_522_13)
			end

			if arg_519_1.time_ >= var_522_9 + var_522_12 and arg_519_1.time_ < var_522_9 + var_522_12 + arg_522_0 then
				var_522_8.localPosition = Vector3.New(0, -355, -140)
			end

			local var_522_15 = 0
			local var_522_16 = 0.15

			if var_522_15 < arg_519_1.time_ and arg_519_1.time_ <= var_522_15 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_17 = arg_519_1:FormatText(StoryNameCfg[1113].name)

				arg_519_1.leftNameTxt_.text = var_522_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_18 = arg_519_1:GetWordFromCfg(417221119)
				local var_522_19 = arg_519_1:FormatText(var_522_18.content)

				arg_519_1.text_.text = var_522_19

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_20 = 6
				local var_522_21 = utf8.len(var_522_19)
				local var_522_22 = var_522_20 <= 0 and var_522_16 or var_522_16 * (var_522_21 / var_522_20)

				if var_522_22 > 0 and var_522_16 < var_522_22 then
					arg_519_1.talkMaxDuration = var_522_22

					if var_522_22 + var_522_15 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_22 + var_522_15
					end
				end

				arg_519_1.text_.text = var_522_19
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221119", "story_v_out_417221.awb") ~= 0 then
					local var_522_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221119", "story_v_out_417221.awb") / 1000

					if var_522_23 + var_522_15 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_23 + var_522_15
					end

					if var_522_18.prefab_name ~= "" and arg_519_1.actors_[var_522_18.prefab_name] ~= nil then
						local var_522_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_18.prefab_name].transform, "story_v_out_417221", "417221119", "story_v_out_417221.awb")

						arg_519_1:RecordAudio("417221119", var_522_24)
						arg_519_1:RecordAudio("417221119", var_522_24)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_417221", "417221119", "story_v_out_417221.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_417221", "417221119", "story_v_out_417221.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_25 = math.max(var_522_16, arg_519_1.talkMaxDuration)

			if var_522_15 <= arg_519_1.time_ and arg_519_1.time_ < var_522_15 + var_522_25 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_15) / var_522_25

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_15 + var_522_25 and arg_519_1.time_ < var_522_15 + var_522_25 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play417221120 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 417221120
		arg_523_1.duration_ = 6.9

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play417221121(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10115"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos10115 = var_526_0.localPosition
				var_526_0.localScale = Vector3.New(1, 1, 1)

				arg_523_1:CheckSpriteTmpPos("10115", 7)

				local var_526_2 = var_526_0.childCount

				for iter_526_0 = 0, var_526_2 - 1 do
					local var_526_3 = var_526_0:GetChild(iter_526_0)

					if var_526_3.name == "" or not string.find(var_526_3.name, "split") then
						var_526_3.gameObject:SetActive(true)
					else
						var_526_3.gameObject:SetActive(false)
					end
				end
			end

			local var_526_4 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_4 then
				local var_526_5 = (arg_523_1.time_ - var_526_1) / var_526_4
				local var_526_6 = Vector3.New(0, -2000, -140)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos10115, var_526_6, var_526_5)
			end

			if arg_523_1.time_ >= var_526_1 + var_526_4 and arg_523_1.time_ < var_526_1 + var_526_4 + arg_526_0 then
				var_526_0.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_526_7 = 4.5
			local var_526_8 = 1

			if var_526_7 < arg_523_1.time_ and arg_523_1.time_ <= var_526_7 + arg_526_0 then
				local var_526_9 = "play"
				local var_526_10 = "effect"

				arg_523_1:AudioAction(var_526_9, var_526_10, "se_story_16", "se_story_16_attack03", "")
			end

			local var_526_11 = 5.9
			local var_526_12 = 1

			if var_526_11 < arg_523_1.time_ and arg_523_1.time_ <= var_526_11 + arg_526_0 then
				local var_526_13 = "play"
				local var_526_14 = "effect"

				arg_523_1:AudioAction(var_526_13, var_526_14, "se_story_130", "se_story_130_noise", "")
			end

			local var_526_15 = 0
			local var_526_16 = 0.625

			if var_526_15 < arg_523_1.time_ and arg_523_1.time_ <= var_526_15 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_17 = arg_523_1:FormatText(StoryNameCfg[1151].name)

				arg_523_1.leftNameTxt_.text = var_526_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, true)
				arg_523_1.iconController_:SetSelectedState("hero")

				arg_523_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_523_1.callingController_:SetSelectedState("calling")

				arg_523_1.keyicon_.color = Color.New(1, 1, 1)
				arg_523_1.icon_.color = Color.New(1, 1, 1)

				local var_526_18 = arg_523_1:GetWordFromCfg(417221120)
				local var_526_19 = arg_523_1:FormatText(var_526_18.content)

				arg_523_1.text_.text = var_526_19

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_20 = 25
				local var_526_21 = utf8.len(var_526_19)
				local var_526_22 = var_526_20 <= 0 and var_526_16 or var_526_16 * (var_526_21 / var_526_20)

				if var_526_22 > 0 and var_526_16 < var_526_22 then
					arg_523_1.talkMaxDuration = var_526_22

					if var_526_22 + var_526_15 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_22 + var_526_15
					end
				end

				arg_523_1.text_.text = var_526_19
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221120", "story_v_out_417221.awb") ~= 0 then
					local var_526_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221120", "story_v_out_417221.awb") / 1000

					if var_526_23 + var_526_15 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_23 + var_526_15
					end

					if var_526_18.prefab_name ~= "" and arg_523_1.actors_[var_526_18.prefab_name] ~= nil then
						local var_526_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_18.prefab_name].transform, "story_v_out_417221", "417221120", "story_v_out_417221.awb")

						arg_523_1:RecordAudio("417221120", var_526_24)
						arg_523_1:RecordAudio("417221120", var_526_24)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_417221", "417221120", "story_v_out_417221.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_417221", "417221120", "story_v_out_417221.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_25 = math.max(var_526_16, arg_523_1.talkMaxDuration)

			if var_526_15 <= arg_523_1.time_ and arg_523_1.time_ < var_526_15 + var_526_25 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_15) / var_526_25

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_15 + var_526_25 and arg_523_1.time_ < var_526_15 + var_526_25 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play417221121 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 417221121
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play417221122(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 1.25

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_2 = arg_527_1:GetWordFromCfg(417221121)
				local var_530_3 = arg_527_1:FormatText(var_530_2.content)

				arg_527_1.text_.text = var_530_3

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_4 = 50
				local var_530_5 = utf8.len(var_530_3)
				local var_530_6 = var_530_4 <= 0 and var_530_1 or var_530_1 * (var_530_5 / var_530_4)

				if var_530_6 > 0 and var_530_1 < var_530_6 then
					arg_527_1.talkMaxDuration = var_530_6

					if var_530_6 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_6 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_3
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_7 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_0 <= arg_527_1.time_ and arg_527_1.time_ < var_530_0 + var_530_7 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_0) / var_530_7

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_0 + var_530_7 and arg_527_1.time_ < var_530_0 + var_530_7 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play417221122 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 417221122
		arg_531_1.duration_ = 5.2

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play417221123(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0
			local var_534_1 = 0.75

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_2 = arg_531_1:FormatText(StoryNameCfg[1144].name)

				arg_531_1.leftNameTxt_.text = var_534_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, true)
				arg_531_1.iconController_:SetSelectedState("hero")

				arg_531_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_531_1.callingController_:SetSelectedState("normal")

				arg_531_1.keyicon_.color = Color.New(1, 1, 1)
				arg_531_1.icon_.color = Color.New(1, 1, 1)

				local var_534_3 = arg_531_1:GetWordFromCfg(417221122)
				local var_534_4 = arg_531_1:FormatText(var_534_3.content)

				arg_531_1.text_.text = var_534_4

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_5 = 30
				local var_534_6 = utf8.len(var_534_4)
				local var_534_7 = var_534_5 <= 0 and var_534_1 or var_534_1 * (var_534_6 / var_534_5)

				if var_534_7 > 0 and var_534_1 < var_534_7 then
					arg_531_1.talkMaxDuration = var_534_7

					if var_534_7 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_7 + var_534_0
					end
				end

				arg_531_1.text_.text = var_534_4
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221122", "story_v_out_417221.awb") ~= 0 then
					local var_534_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221122", "story_v_out_417221.awb") / 1000

					if var_534_8 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_8 + var_534_0
					end

					if var_534_3.prefab_name ~= "" and arg_531_1.actors_[var_534_3.prefab_name] ~= nil then
						local var_534_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_3.prefab_name].transform, "story_v_out_417221", "417221122", "story_v_out_417221.awb")

						arg_531_1:RecordAudio("417221122", var_534_9)
						arg_531_1:RecordAudio("417221122", var_534_9)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_417221", "417221122", "story_v_out_417221.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_417221", "417221122", "story_v_out_417221.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_10 = math.max(var_534_1, arg_531_1.talkMaxDuration)

			if var_534_0 <= arg_531_1.time_ and arg_531_1.time_ < var_534_0 + var_534_10 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_0) / var_534_10

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_0 + var_534_10 and arg_531_1.time_ < var_534_0 + var_534_10 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play417221123 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 417221123
		arg_535_1.duration_ = 4.9

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play417221124(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = 0
			local var_538_1 = 0.625

			if var_538_0 < arg_535_1.time_ and arg_535_1.time_ <= var_538_0 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_2 = arg_535_1:FormatText(StoryNameCfg[1144].name)

				arg_535_1.leftNameTxt_.text = var_538_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, true)
				arg_535_1.iconController_:SetSelectedState("hero")

				arg_535_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_535_1.callingController_:SetSelectedState("normal")

				arg_535_1.keyicon_.color = Color.New(1, 1, 1)
				arg_535_1.icon_.color = Color.New(1, 1, 1)

				local var_538_3 = arg_535_1:GetWordFromCfg(417221123)
				local var_538_4 = arg_535_1:FormatText(var_538_3.content)

				arg_535_1.text_.text = var_538_4

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_5 = 25
				local var_538_6 = utf8.len(var_538_4)
				local var_538_7 = var_538_5 <= 0 and var_538_1 or var_538_1 * (var_538_6 / var_538_5)

				if var_538_7 > 0 and var_538_1 < var_538_7 then
					arg_535_1.talkMaxDuration = var_538_7

					if var_538_7 + var_538_0 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_7 + var_538_0
					end
				end

				arg_535_1.text_.text = var_538_4
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221123", "story_v_out_417221.awb") ~= 0 then
					local var_538_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221123", "story_v_out_417221.awb") / 1000

					if var_538_8 + var_538_0 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_8 + var_538_0
					end

					if var_538_3.prefab_name ~= "" and arg_535_1.actors_[var_538_3.prefab_name] ~= nil then
						local var_538_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_3.prefab_name].transform, "story_v_out_417221", "417221123", "story_v_out_417221.awb")

						arg_535_1:RecordAudio("417221123", var_538_9)
						arg_535_1:RecordAudio("417221123", var_538_9)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_417221", "417221123", "story_v_out_417221.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_417221", "417221123", "story_v_out_417221.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_10 = math.max(var_538_1, arg_535_1.talkMaxDuration)

			if var_538_0 <= arg_535_1.time_ and arg_535_1.time_ < var_538_0 + var_538_10 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_0) / var_538_10

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_0 + var_538_10 and arg_535_1.time_ < var_538_0 + var_538_10 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play417221124 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 417221124
		arg_539_1.duration_ = 4.8

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play417221125(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["10115"]
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 and not isNil(var_542_0) and arg_539_1.var_.actorSpriteComps10115 == nil then
				arg_539_1.var_.actorSpriteComps10115 = var_542_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_542_2 = 0.2

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 and not isNil(var_542_0) then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2

				if arg_539_1.var_.actorSpriteComps10115 then
					for iter_542_0, iter_542_1 in pairs(arg_539_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_542_1 then
							if arg_539_1.isInRecall_ then
								local var_542_4 = Mathf.Lerp(iter_542_1.color.r, arg_539_1.hightColor1.r, var_542_3)
								local var_542_5 = Mathf.Lerp(iter_542_1.color.g, arg_539_1.hightColor1.g, var_542_3)
								local var_542_6 = Mathf.Lerp(iter_542_1.color.b, arg_539_1.hightColor1.b, var_542_3)

								iter_542_1.color = Color.New(var_542_4, var_542_5, var_542_6)
							else
								local var_542_7 = Mathf.Lerp(iter_542_1.color.r, 1, var_542_3)

								iter_542_1.color = Color.New(var_542_7, var_542_7, var_542_7)
							end
						end
					end
				end
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 and not isNil(var_542_0) and arg_539_1.var_.actorSpriteComps10115 then
				for iter_542_2, iter_542_3 in pairs(arg_539_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_542_3 then
						if arg_539_1.isInRecall_ then
							iter_542_3.color = arg_539_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_542_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_539_1.var_.actorSpriteComps10115 = nil
			end

			local var_542_8 = arg_539_1.actors_["10115"].transform
			local var_542_9 = 0

			if var_542_9 < arg_539_1.time_ and arg_539_1.time_ <= var_542_9 + arg_542_0 then
				arg_539_1.var_.moveOldPos10115 = var_542_8.localPosition
				var_542_8.localScale = Vector3.New(1, 1, 1)

				arg_539_1:CheckSpriteTmpPos("10115", 3)

				local var_542_10 = var_542_8.childCount

				for iter_542_4 = 0, var_542_10 - 1 do
					local var_542_11 = var_542_8:GetChild(iter_542_4)

					if var_542_11.name == "split_6" or not string.find(var_542_11.name, "split") then
						var_542_11.gameObject:SetActive(true)
					else
						var_542_11.gameObject:SetActive(false)
					end
				end
			end

			local var_542_12 = 0.001

			if var_542_9 <= arg_539_1.time_ and arg_539_1.time_ < var_542_9 + var_542_12 then
				local var_542_13 = (arg_539_1.time_ - var_542_9) / var_542_12
				local var_542_14 = Vector3.New(0, -355, -140)

				var_542_8.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos10115, var_542_14, var_542_13)
			end

			if arg_539_1.time_ >= var_542_9 + var_542_12 and arg_539_1.time_ < var_542_9 + var_542_12 + arg_542_0 then
				var_542_8.localPosition = Vector3.New(0, -355, -140)
			end

			local var_542_15 = 0
			local var_542_16 = 0.525

			if var_542_15 < arg_539_1.time_ and arg_539_1.time_ <= var_542_15 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_17 = arg_539_1:FormatText(StoryNameCfg[1113].name)

				arg_539_1.leftNameTxt_.text = var_542_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_18 = arg_539_1:GetWordFromCfg(417221124)
				local var_542_19 = arg_539_1:FormatText(var_542_18.content)

				arg_539_1.text_.text = var_542_19

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_20 = 21
				local var_542_21 = utf8.len(var_542_19)
				local var_542_22 = var_542_20 <= 0 and var_542_16 or var_542_16 * (var_542_21 / var_542_20)

				if var_542_22 > 0 and var_542_16 < var_542_22 then
					arg_539_1.talkMaxDuration = var_542_22

					if var_542_22 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_22 + var_542_15
					end
				end

				arg_539_1.text_.text = var_542_19
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221124", "story_v_out_417221.awb") ~= 0 then
					local var_542_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221124", "story_v_out_417221.awb") / 1000

					if var_542_23 + var_542_15 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_23 + var_542_15
					end

					if var_542_18.prefab_name ~= "" and arg_539_1.actors_[var_542_18.prefab_name] ~= nil then
						local var_542_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_18.prefab_name].transform, "story_v_out_417221", "417221124", "story_v_out_417221.awb")

						arg_539_1:RecordAudio("417221124", var_542_24)
						arg_539_1:RecordAudio("417221124", var_542_24)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_417221", "417221124", "story_v_out_417221.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_417221", "417221124", "story_v_out_417221.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_25 = math.max(var_542_16, arg_539_1.talkMaxDuration)

			if var_542_15 <= arg_539_1.time_ and arg_539_1.time_ < var_542_15 + var_542_25 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_15) / var_542_25

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_15 + var_542_25 and arg_539_1.time_ < var_542_15 + var_542_25 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play417221125 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 417221125
		arg_543_1.duration_ = 6.47

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play417221126(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["10115"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and not isNil(var_546_0) and arg_543_1.var_.actorSpriteComps10115 == nil then
				arg_543_1.var_.actorSpriteComps10115 = var_546_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_546_2 = 0.2

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 and not isNil(var_546_0) then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.actorSpriteComps10115 then
					for iter_546_0, iter_546_1 in pairs(arg_543_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_546_1 then
							if arg_543_1.isInRecall_ then
								local var_546_4 = Mathf.Lerp(iter_546_1.color.r, arg_543_1.hightColor2.r, var_546_3)
								local var_546_5 = Mathf.Lerp(iter_546_1.color.g, arg_543_1.hightColor2.g, var_546_3)
								local var_546_6 = Mathf.Lerp(iter_546_1.color.b, arg_543_1.hightColor2.b, var_546_3)

								iter_546_1.color = Color.New(var_546_4, var_546_5, var_546_6)
							else
								local var_546_7 = Mathf.Lerp(iter_546_1.color.r, 0.5, var_546_3)

								iter_546_1.color = Color.New(var_546_7, var_546_7, var_546_7)
							end
						end
					end
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and not isNil(var_546_0) and arg_543_1.var_.actorSpriteComps10115 then
				for iter_546_2, iter_546_3 in pairs(arg_543_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_546_3 then
						if arg_543_1.isInRecall_ then
							iter_546_3.color = arg_543_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_546_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_543_1.var_.actorSpriteComps10115 = nil
			end

			local var_546_8 = 0
			local var_546_9 = 1

			if var_546_8 < arg_543_1.time_ and arg_543_1.time_ <= var_546_8 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_10 = arg_543_1:FormatText(StoryNameCfg[1144].name)

				arg_543_1.leftNameTxt_.text = var_546_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, true)
				arg_543_1.iconController_:SetSelectedState("hero")

				arg_543_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_543_1.callingController_:SetSelectedState("normal")

				arg_543_1.keyicon_.color = Color.New(1, 1, 1)
				arg_543_1.icon_.color = Color.New(1, 1, 1)

				local var_546_11 = arg_543_1:GetWordFromCfg(417221125)
				local var_546_12 = arg_543_1:FormatText(var_546_11.content)

				arg_543_1.text_.text = var_546_12

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_13 = 40
				local var_546_14 = utf8.len(var_546_12)
				local var_546_15 = var_546_13 <= 0 and var_546_9 or var_546_9 * (var_546_14 / var_546_13)

				if var_546_15 > 0 and var_546_9 < var_546_15 then
					arg_543_1.talkMaxDuration = var_546_15

					if var_546_15 + var_546_8 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_15 + var_546_8
					end
				end

				arg_543_1.text_.text = var_546_12
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221125", "story_v_out_417221.awb") ~= 0 then
					local var_546_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221125", "story_v_out_417221.awb") / 1000

					if var_546_16 + var_546_8 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_16 + var_546_8
					end

					if var_546_11.prefab_name ~= "" and arg_543_1.actors_[var_546_11.prefab_name] ~= nil then
						local var_546_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_11.prefab_name].transform, "story_v_out_417221", "417221125", "story_v_out_417221.awb")

						arg_543_1:RecordAudio("417221125", var_546_17)
						arg_543_1:RecordAudio("417221125", var_546_17)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_417221", "417221125", "story_v_out_417221.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_417221", "417221125", "story_v_out_417221.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_18 = math.max(var_546_9, arg_543_1.talkMaxDuration)

			if var_546_8 <= arg_543_1.time_ and arg_543_1.time_ < var_546_8 + var_546_18 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_8) / var_546_18

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_8 + var_546_18 and arg_543_1.time_ < var_546_8 + var_546_18 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play417221126 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 417221126
		arg_547_1.duration_ = 4.97

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play417221127(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["10115"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and not isNil(var_550_0) and arg_547_1.var_.actorSpriteComps10115 == nil then
				arg_547_1.var_.actorSpriteComps10115 = var_550_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_550_2 = 0.2

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 and not isNil(var_550_0) then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.actorSpriteComps10115 then
					for iter_550_0, iter_550_1 in pairs(arg_547_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_550_1 then
							if arg_547_1.isInRecall_ then
								local var_550_4 = Mathf.Lerp(iter_550_1.color.r, arg_547_1.hightColor1.r, var_550_3)
								local var_550_5 = Mathf.Lerp(iter_550_1.color.g, arg_547_1.hightColor1.g, var_550_3)
								local var_550_6 = Mathf.Lerp(iter_550_1.color.b, arg_547_1.hightColor1.b, var_550_3)

								iter_550_1.color = Color.New(var_550_4, var_550_5, var_550_6)
							else
								local var_550_7 = Mathf.Lerp(iter_550_1.color.r, 1, var_550_3)

								iter_550_1.color = Color.New(var_550_7, var_550_7, var_550_7)
							end
						end
					end
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and not isNil(var_550_0) and arg_547_1.var_.actorSpriteComps10115 then
				for iter_550_2, iter_550_3 in pairs(arg_547_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_550_3 then
						if arg_547_1.isInRecall_ then
							iter_550_3.color = arg_547_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_550_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_547_1.var_.actorSpriteComps10115 = nil
			end

			local var_550_8 = 0
			local var_550_9 = 0.625

			if var_550_8 < arg_547_1.time_ and arg_547_1.time_ <= var_550_8 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_10 = arg_547_1:FormatText(StoryNameCfg[1113].name)

				arg_547_1.leftNameTxt_.text = var_550_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_11 = arg_547_1:GetWordFromCfg(417221126)
				local var_550_12 = arg_547_1:FormatText(var_550_11.content)

				arg_547_1.text_.text = var_550_12

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_13 = 25
				local var_550_14 = utf8.len(var_550_12)
				local var_550_15 = var_550_13 <= 0 and var_550_9 or var_550_9 * (var_550_14 / var_550_13)

				if var_550_15 > 0 and var_550_9 < var_550_15 then
					arg_547_1.talkMaxDuration = var_550_15

					if var_550_15 + var_550_8 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_15 + var_550_8
					end
				end

				arg_547_1.text_.text = var_550_12
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221126", "story_v_out_417221.awb") ~= 0 then
					local var_550_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221126", "story_v_out_417221.awb") / 1000

					if var_550_16 + var_550_8 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_16 + var_550_8
					end

					if var_550_11.prefab_name ~= "" and arg_547_1.actors_[var_550_11.prefab_name] ~= nil then
						local var_550_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_11.prefab_name].transform, "story_v_out_417221", "417221126", "story_v_out_417221.awb")

						arg_547_1:RecordAudio("417221126", var_550_17)
						arg_547_1:RecordAudio("417221126", var_550_17)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_417221", "417221126", "story_v_out_417221.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_417221", "417221126", "story_v_out_417221.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_18 = math.max(var_550_9, arg_547_1.talkMaxDuration)

			if var_550_8 <= arg_547_1.time_ and arg_547_1.time_ < var_550_8 + var_550_18 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_8) / var_550_18

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_8 + var_550_18 and arg_547_1.time_ < var_550_8 + var_550_18 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play417221127 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 417221127
		arg_551_1.duration_ = 3.33

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play417221128(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["10115"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and not isNil(var_554_0) and arg_551_1.var_.actorSpriteComps10115 == nil then
				arg_551_1.var_.actorSpriteComps10115 = var_554_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_554_2 = 0.2

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 and not isNil(var_554_0) then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.actorSpriteComps10115 then
					for iter_554_0, iter_554_1 in pairs(arg_551_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_554_1 then
							if arg_551_1.isInRecall_ then
								local var_554_4 = Mathf.Lerp(iter_554_1.color.r, arg_551_1.hightColor2.r, var_554_3)
								local var_554_5 = Mathf.Lerp(iter_554_1.color.g, arg_551_1.hightColor2.g, var_554_3)
								local var_554_6 = Mathf.Lerp(iter_554_1.color.b, arg_551_1.hightColor2.b, var_554_3)

								iter_554_1.color = Color.New(var_554_4, var_554_5, var_554_6)
							else
								local var_554_7 = Mathf.Lerp(iter_554_1.color.r, 0.5, var_554_3)

								iter_554_1.color = Color.New(var_554_7, var_554_7, var_554_7)
							end
						end
					end
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and not isNil(var_554_0) and arg_551_1.var_.actorSpriteComps10115 then
				for iter_554_2, iter_554_3 in pairs(arg_551_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_554_3 then
						if arg_551_1.isInRecall_ then
							iter_554_3.color = arg_551_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_554_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_551_1.var_.actorSpriteComps10115 = nil
			end

			local var_554_8 = 0
			local var_554_9 = 0.525

			if var_554_8 < arg_551_1.time_ and arg_551_1.time_ <= var_554_8 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_10 = arg_551_1:FormatText(StoryNameCfg[1144].name)

				arg_551_1.leftNameTxt_.text = var_554_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, true)
				arg_551_1.iconController_:SetSelectedState("hero")

				arg_551_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_551_1.callingController_:SetSelectedState("normal")

				arg_551_1.keyicon_.color = Color.New(1, 1, 1)
				arg_551_1.icon_.color = Color.New(1, 1, 1)

				local var_554_11 = arg_551_1:GetWordFromCfg(417221127)
				local var_554_12 = arg_551_1:FormatText(var_554_11.content)

				arg_551_1.text_.text = var_554_12

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_13 = 21
				local var_554_14 = utf8.len(var_554_12)
				local var_554_15 = var_554_13 <= 0 and var_554_9 or var_554_9 * (var_554_14 / var_554_13)

				if var_554_15 > 0 and var_554_9 < var_554_15 then
					arg_551_1.talkMaxDuration = var_554_15

					if var_554_15 + var_554_8 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_15 + var_554_8
					end
				end

				arg_551_1.text_.text = var_554_12
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221127", "story_v_out_417221.awb") ~= 0 then
					local var_554_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221127", "story_v_out_417221.awb") / 1000

					if var_554_16 + var_554_8 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_16 + var_554_8
					end

					if var_554_11.prefab_name ~= "" and arg_551_1.actors_[var_554_11.prefab_name] ~= nil then
						local var_554_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_11.prefab_name].transform, "story_v_out_417221", "417221127", "story_v_out_417221.awb")

						arg_551_1:RecordAudio("417221127", var_554_17)
						arg_551_1:RecordAudio("417221127", var_554_17)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_417221", "417221127", "story_v_out_417221.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_417221", "417221127", "story_v_out_417221.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_18 = math.max(var_554_9, arg_551_1.talkMaxDuration)

			if var_554_8 <= arg_551_1.time_ and arg_551_1.time_ < var_554_8 + var_554_18 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_8) / var_554_18

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_8 + var_554_18 and arg_551_1.time_ < var_554_8 + var_554_18 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play417221128 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 417221128
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play417221129(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["10115"].transform
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 then
				arg_555_1.var_.moveOldPos10115 = var_558_0.localPosition
				var_558_0.localScale = Vector3.New(1, 1, 1)

				arg_555_1:CheckSpriteTmpPos("10115", 7)

				local var_558_2 = var_558_0.childCount

				for iter_558_0 = 0, var_558_2 - 1 do
					local var_558_3 = var_558_0:GetChild(iter_558_0)

					if var_558_3.name == "" or not string.find(var_558_3.name, "split") then
						var_558_3.gameObject:SetActive(true)
					else
						var_558_3.gameObject:SetActive(false)
					end
				end
			end

			local var_558_4 = 0.001

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_4 then
				local var_558_5 = (arg_555_1.time_ - var_558_1) / var_558_4
				local var_558_6 = Vector3.New(0, -2000, -140)

				var_558_0.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos10115, var_558_6, var_558_5)
			end

			if arg_555_1.time_ >= var_558_1 + var_558_4 and arg_555_1.time_ < var_558_1 + var_558_4 + arg_558_0 then
				var_558_0.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_558_7 = 1
			local var_558_8 = 1

			if var_558_7 < arg_555_1.time_ and arg_555_1.time_ <= var_558_7 + arg_558_0 then
				local var_558_9 = "play"
				local var_558_10 = "effect"

				arg_555_1:AudioAction(var_558_9, var_558_10, "se_story_1310", "se_story_1310_surround02", "")
			end

			local var_558_11 = 0
			local var_558_12 = 1.25

			if var_558_11 < arg_555_1.time_ and arg_555_1.time_ <= var_558_11 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_13 = arg_555_1:GetWordFromCfg(417221128)
				local var_558_14 = arg_555_1:FormatText(var_558_13.content)

				arg_555_1.text_.text = var_558_14

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_15 = 50
				local var_558_16 = utf8.len(var_558_14)
				local var_558_17 = var_558_15 <= 0 and var_558_12 or var_558_12 * (var_558_16 / var_558_15)

				if var_558_17 > 0 and var_558_12 < var_558_17 then
					arg_555_1.talkMaxDuration = var_558_17

					if var_558_17 + var_558_11 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_17 + var_558_11
					end
				end

				arg_555_1.text_.text = var_558_14
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_18 = math.max(var_558_12, arg_555_1.talkMaxDuration)

			if var_558_11 <= arg_555_1.time_ and arg_555_1.time_ < var_558_11 + var_558_18 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_11) / var_558_18

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_11 + var_558_18 and arg_555_1.time_ < var_558_11 + var_558_18 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play417221129 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 417221129
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play417221130(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.9

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_2 = arg_559_1:GetWordFromCfg(417221129)
				local var_562_3 = arg_559_1:FormatText(var_562_2.content)

				arg_559_1.text_.text = var_562_3

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_4 = 36
				local var_562_5 = utf8.len(var_562_3)
				local var_562_6 = var_562_4 <= 0 and var_562_1 or var_562_1 * (var_562_5 / var_562_4)

				if var_562_6 > 0 and var_562_1 < var_562_6 then
					arg_559_1.talkMaxDuration = var_562_6

					if var_562_6 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_6 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_3
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_7 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_7 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_7

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_7 and arg_559_1.time_ < var_562_0 + var_562_7 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play417221130 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 417221130
		arg_563_1.duration_ = 5.23

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play417221131(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["10115"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and not isNil(var_566_0) and arg_563_1.var_.actorSpriteComps10115 == nil then
				arg_563_1.var_.actorSpriteComps10115 = var_566_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_566_2 = 0.2

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 and not isNil(var_566_0) then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.actorSpriteComps10115 then
					for iter_566_0, iter_566_1 in pairs(arg_563_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_566_1 then
							if arg_563_1.isInRecall_ then
								local var_566_4 = Mathf.Lerp(iter_566_1.color.r, arg_563_1.hightColor1.r, var_566_3)
								local var_566_5 = Mathf.Lerp(iter_566_1.color.g, arg_563_1.hightColor1.g, var_566_3)
								local var_566_6 = Mathf.Lerp(iter_566_1.color.b, arg_563_1.hightColor1.b, var_566_3)

								iter_566_1.color = Color.New(var_566_4, var_566_5, var_566_6)
							else
								local var_566_7 = Mathf.Lerp(iter_566_1.color.r, 1, var_566_3)

								iter_566_1.color = Color.New(var_566_7, var_566_7, var_566_7)
							end
						end
					end
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and not isNil(var_566_0) and arg_563_1.var_.actorSpriteComps10115 then
				for iter_566_2, iter_566_3 in pairs(arg_563_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_566_3 then
						if arg_563_1.isInRecall_ then
							iter_566_3.color = arg_563_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_566_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_563_1.var_.actorSpriteComps10115 = nil
			end

			local var_566_8 = arg_563_1.actors_["10115"].transform
			local var_566_9 = 0

			if var_566_9 < arg_563_1.time_ and arg_563_1.time_ <= var_566_9 + arg_566_0 then
				arg_563_1.var_.moveOldPos10115 = var_566_8.localPosition
				var_566_8.localScale = Vector3.New(1, 1, 1)

				arg_563_1:CheckSpriteTmpPos("10115", 3)

				local var_566_10 = var_566_8.childCount

				for iter_566_4 = 0, var_566_10 - 1 do
					local var_566_11 = var_566_8:GetChild(iter_566_4)

					if var_566_11.name == "split_2" or not string.find(var_566_11.name, "split") then
						var_566_11.gameObject:SetActive(true)
					else
						var_566_11.gameObject:SetActive(false)
					end
				end
			end

			local var_566_12 = 0.001

			if var_566_9 <= arg_563_1.time_ and arg_563_1.time_ < var_566_9 + var_566_12 then
				local var_566_13 = (arg_563_1.time_ - var_566_9) / var_566_12
				local var_566_14 = Vector3.New(0, -355, -140)

				var_566_8.localPosition = Vector3.Lerp(arg_563_1.var_.moveOldPos10115, var_566_14, var_566_13)
			end

			if arg_563_1.time_ >= var_566_9 + var_566_12 and arg_563_1.time_ < var_566_9 + var_566_12 + arg_566_0 then
				var_566_8.localPosition = Vector3.New(0, -355, -140)
			end

			local var_566_15 = 0
			local var_566_16 = 0.625

			if var_566_15 < arg_563_1.time_ and arg_563_1.time_ <= var_566_15 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_17 = arg_563_1:FormatText(StoryNameCfg[1113].name)

				arg_563_1.leftNameTxt_.text = var_566_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_18 = arg_563_1:GetWordFromCfg(417221130)
				local var_566_19 = arg_563_1:FormatText(var_566_18.content)

				arg_563_1.text_.text = var_566_19

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_20 = 25
				local var_566_21 = utf8.len(var_566_19)
				local var_566_22 = var_566_20 <= 0 and var_566_16 or var_566_16 * (var_566_21 / var_566_20)

				if var_566_22 > 0 and var_566_16 < var_566_22 then
					arg_563_1.talkMaxDuration = var_566_22

					if var_566_22 + var_566_15 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_22 + var_566_15
					end
				end

				arg_563_1.text_.text = var_566_19
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221130", "story_v_out_417221.awb") ~= 0 then
					local var_566_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221130", "story_v_out_417221.awb") / 1000

					if var_566_23 + var_566_15 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_23 + var_566_15
					end

					if var_566_18.prefab_name ~= "" and arg_563_1.actors_[var_566_18.prefab_name] ~= nil then
						local var_566_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_18.prefab_name].transform, "story_v_out_417221", "417221130", "story_v_out_417221.awb")

						arg_563_1:RecordAudio("417221130", var_566_24)
						arg_563_1:RecordAudio("417221130", var_566_24)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_out_417221", "417221130", "story_v_out_417221.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_out_417221", "417221130", "story_v_out_417221.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_25 = math.max(var_566_16, arg_563_1.talkMaxDuration)

			if var_566_15 <= arg_563_1.time_ and arg_563_1.time_ < var_566_15 + var_566_25 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_15) / var_566_25

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_15 + var_566_25 and arg_563_1.time_ < var_566_15 + var_566_25 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play417221131 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 417221131
		arg_567_1.duration_ = 5.4

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play417221132(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["10115"]
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 and not isNil(var_570_0) and arg_567_1.var_.actorSpriteComps10115 == nil then
				arg_567_1.var_.actorSpriteComps10115 = var_570_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_570_2 = 0.2

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 and not isNil(var_570_0) then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2

				if arg_567_1.var_.actorSpriteComps10115 then
					for iter_570_0, iter_570_1 in pairs(arg_567_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_570_1 then
							if arg_567_1.isInRecall_ then
								local var_570_4 = Mathf.Lerp(iter_570_1.color.r, arg_567_1.hightColor2.r, var_570_3)
								local var_570_5 = Mathf.Lerp(iter_570_1.color.g, arg_567_1.hightColor2.g, var_570_3)
								local var_570_6 = Mathf.Lerp(iter_570_1.color.b, arg_567_1.hightColor2.b, var_570_3)

								iter_570_1.color = Color.New(var_570_4, var_570_5, var_570_6)
							else
								local var_570_7 = Mathf.Lerp(iter_570_1.color.r, 0.5, var_570_3)

								iter_570_1.color = Color.New(var_570_7, var_570_7, var_570_7)
							end
						end
					end
				end
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 and not isNil(var_570_0) and arg_567_1.var_.actorSpriteComps10115 then
				for iter_570_2, iter_570_3 in pairs(arg_567_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_570_3 then
						if arg_567_1.isInRecall_ then
							iter_570_3.color = arg_567_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_570_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_567_1.var_.actorSpriteComps10115 = nil
			end

			local var_570_8 = 0
			local var_570_9 = 0.625

			if var_570_8 < arg_567_1.time_ and arg_567_1.time_ <= var_570_8 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_10 = arg_567_1:FormatText(StoryNameCfg[1144].name)

				arg_567_1.leftNameTxt_.text = var_570_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, true)
				arg_567_1.iconController_:SetSelectedState("hero")

				arg_567_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_567_1.callingController_:SetSelectedState("normal")

				arg_567_1.keyicon_.color = Color.New(1, 1, 1)
				arg_567_1.icon_.color = Color.New(1, 1, 1)

				local var_570_11 = arg_567_1:GetWordFromCfg(417221131)
				local var_570_12 = arg_567_1:FormatText(var_570_11.content)

				arg_567_1.text_.text = var_570_12

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_13 = 25
				local var_570_14 = utf8.len(var_570_12)
				local var_570_15 = var_570_13 <= 0 and var_570_9 or var_570_9 * (var_570_14 / var_570_13)

				if var_570_15 > 0 and var_570_9 < var_570_15 then
					arg_567_1.talkMaxDuration = var_570_15

					if var_570_15 + var_570_8 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_15 + var_570_8
					end
				end

				arg_567_1.text_.text = var_570_12
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221131", "story_v_out_417221.awb") ~= 0 then
					local var_570_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221131", "story_v_out_417221.awb") / 1000

					if var_570_16 + var_570_8 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_16 + var_570_8
					end

					if var_570_11.prefab_name ~= "" and arg_567_1.actors_[var_570_11.prefab_name] ~= nil then
						local var_570_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_11.prefab_name].transform, "story_v_out_417221", "417221131", "story_v_out_417221.awb")

						arg_567_1:RecordAudio("417221131", var_570_17)
						arg_567_1:RecordAudio("417221131", var_570_17)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_out_417221", "417221131", "story_v_out_417221.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_out_417221", "417221131", "story_v_out_417221.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_18 = math.max(var_570_9, arg_567_1.talkMaxDuration)

			if var_570_8 <= arg_567_1.time_ and arg_567_1.time_ < var_570_8 + var_570_18 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_8) / var_570_18

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_8 + var_570_18 and arg_567_1.time_ < var_570_8 + var_570_18 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play417221132 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 417221132
		arg_571_1.duration_ = 10.9

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play417221133(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["10115"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and not isNil(var_574_0) and arg_571_1.var_.actorSpriteComps10115 == nil then
				arg_571_1.var_.actorSpriteComps10115 = var_574_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_574_2 = 0.2

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 and not isNil(var_574_0) then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.actorSpriteComps10115 then
					for iter_574_0, iter_574_1 in pairs(arg_571_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_574_1 then
							if arg_571_1.isInRecall_ then
								local var_574_4 = Mathf.Lerp(iter_574_1.color.r, arg_571_1.hightColor1.r, var_574_3)
								local var_574_5 = Mathf.Lerp(iter_574_1.color.g, arg_571_1.hightColor1.g, var_574_3)
								local var_574_6 = Mathf.Lerp(iter_574_1.color.b, arg_571_1.hightColor1.b, var_574_3)

								iter_574_1.color = Color.New(var_574_4, var_574_5, var_574_6)
							else
								local var_574_7 = Mathf.Lerp(iter_574_1.color.r, 1, var_574_3)

								iter_574_1.color = Color.New(var_574_7, var_574_7, var_574_7)
							end
						end
					end
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and not isNil(var_574_0) and arg_571_1.var_.actorSpriteComps10115 then
				for iter_574_2, iter_574_3 in pairs(arg_571_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_574_3 then
						if arg_571_1.isInRecall_ then
							iter_574_3.color = arg_571_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_574_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_571_1.var_.actorSpriteComps10115 = nil
			end

			local var_574_8 = 0
			local var_574_9 = 1.35

			if var_574_8 < arg_571_1.time_ and arg_571_1.time_ <= var_574_8 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_10 = arg_571_1:FormatText(StoryNameCfg[1113].name)

				arg_571_1.leftNameTxt_.text = var_574_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_11 = arg_571_1:GetWordFromCfg(417221132)
				local var_574_12 = arg_571_1:FormatText(var_574_11.content)

				arg_571_1.text_.text = var_574_12

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_13 = 54
				local var_574_14 = utf8.len(var_574_12)
				local var_574_15 = var_574_13 <= 0 and var_574_9 or var_574_9 * (var_574_14 / var_574_13)

				if var_574_15 > 0 and var_574_9 < var_574_15 then
					arg_571_1.talkMaxDuration = var_574_15

					if var_574_15 + var_574_8 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_15 + var_574_8
					end
				end

				arg_571_1.text_.text = var_574_12
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221132", "story_v_out_417221.awb") ~= 0 then
					local var_574_16 = manager.audio:GetVoiceLength("story_v_out_417221", "417221132", "story_v_out_417221.awb") / 1000

					if var_574_16 + var_574_8 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_16 + var_574_8
					end

					if var_574_11.prefab_name ~= "" and arg_571_1.actors_[var_574_11.prefab_name] ~= nil then
						local var_574_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_11.prefab_name].transform, "story_v_out_417221", "417221132", "story_v_out_417221.awb")

						arg_571_1:RecordAudio("417221132", var_574_17)
						arg_571_1:RecordAudio("417221132", var_574_17)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_out_417221", "417221132", "story_v_out_417221.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_out_417221", "417221132", "story_v_out_417221.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_18 = math.max(var_574_9, arg_571_1.talkMaxDuration)

			if var_574_8 <= arg_571_1.time_ and arg_571_1.time_ < var_574_8 + var_574_18 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_8) / var_574_18

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_8 + var_574_18 and arg_571_1.time_ < var_574_8 + var_574_18 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play417221133 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 417221133
		arg_575_1.duration_ = 1.33

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play417221134(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = 0
			local var_578_1 = 0.1

			if var_578_0 < arg_575_1.time_ and arg_575_1.time_ <= var_578_0 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_2 = arg_575_1:FormatText(StoryNameCfg[1113].name)

				arg_575_1.leftNameTxt_.text = var_578_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_3 = arg_575_1:GetWordFromCfg(417221133)
				local var_578_4 = arg_575_1:FormatText(var_578_3.content)

				arg_575_1.text_.text = var_578_4

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_5 = 4
				local var_578_6 = utf8.len(var_578_4)
				local var_578_7 = var_578_5 <= 0 and var_578_1 or var_578_1 * (var_578_6 / var_578_5)

				if var_578_7 > 0 and var_578_1 < var_578_7 then
					arg_575_1.talkMaxDuration = var_578_7

					if var_578_7 + var_578_0 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_7 + var_578_0
					end
				end

				arg_575_1.text_.text = var_578_4
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221133", "story_v_out_417221.awb") ~= 0 then
					local var_578_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221133", "story_v_out_417221.awb") / 1000

					if var_578_8 + var_578_0 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_8 + var_578_0
					end

					if var_578_3.prefab_name ~= "" and arg_575_1.actors_[var_578_3.prefab_name] ~= nil then
						local var_578_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_3.prefab_name].transform, "story_v_out_417221", "417221133", "story_v_out_417221.awb")

						arg_575_1:RecordAudio("417221133", var_578_9)
						arg_575_1:RecordAudio("417221133", var_578_9)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_417221", "417221133", "story_v_out_417221.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_417221", "417221133", "story_v_out_417221.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_10 = math.max(var_578_1, arg_575_1.talkMaxDuration)

			if var_578_0 <= arg_575_1.time_ and arg_575_1.time_ < var_578_0 + var_578_10 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_0) / var_578_10

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_0 + var_578_10 and arg_575_1.time_ < var_578_0 + var_578_10 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play417221134 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 417221134
		arg_579_1.duration_ = 5.5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play417221135(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["10115"].transform
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 then
				arg_579_1.var_.moveOldPos10115 = var_582_0.localPosition
				var_582_0.localScale = Vector3.New(1, 1, 1)

				arg_579_1:CheckSpriteTmpPos("10115", 7)

				local var_582_2 = var_582_0.childCount

				for iter_582_0 = 0, var_582_2 - 1 do
					local var_582_3 = var_582_0:GetChild(iter_582_0)

					if var_582_3.name == "split_2" or not string.find(var_582_3.name, "split") then
						var_582_3.gameObject:SetActive(true)
					else
						var_582_3.gameObject:SetActive(false)
					end
				end
			end

			local var_582_4 = 0.001

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_4 then
				local var_582_5 = (arg_579_1.time_ - var_582_1) / var_582_4
				local var_582_6 = Vector3.New(0, -2000, -140)

				var_582_0.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos10115, var_582_6, var_582_5)
			end

			if arg_579_1.time_ >= var_582_1 + var_582_4 and arg_579_1.time_ < var_582_1 + var_582_4 + arg_582_0 then
				var_582_0.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_582_7 = manager.ui.mainCamera.transform
			local var_582_8 = 0

			if var_582_8 < arg_579_1.time_ and arg_579_1.time_ <= var_582_8 + arg_582_0 then
				local var_582_9 = arg_579_1.var_.effect1134

				if not var_582_9 then
					var_582_9 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_hit"))
					var_582_9.name = "1134"
					arg_579_1.var_.effect1134 = var_582_9
				end

				local var_582_10 = var_582_7:Find("")

				if var_582_10 then
					var_582_9.transform.parent = var_582_10
				else
					var_582_9.transform.parent = var_582_7
				end

				var_582_9.transform.localPosition = Vector3.New(0, -0.17, 1.42)
				var_582_9.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_582_11 = manager.ui.mainCamera.transform
			local var_582_12 = 0

			if var_582_12 < arg_579_1.time_ and arg_579_1.time_ <= var_582_12 + arg_582_0 then
				arg_579_1.var_.shakeOldPos = var_582_11.localPosition
			end

			local var_582_13 = 0.4

			if var_582_12 <= arg_579_1.time_ and arg_579_1.time_ < var_582_12 + var_582_13 then
				local var_582_14 = (arg_579_1.time_ - var_582_12) / 0.066
				local var_582_15, var_582_16 = math.modf(var_582_14)

				var_582_11.localPosition = Vector3.New(var_582_16 * 0.13, var_582_16 * 0.13, var_582_16 * 0.13) + arg_579_1.var_.shakeOldPos
			end

			if arg_579_1.time_ >= var_582_12 + var_582_13 and arg_579_1.time_ < var_582_12 + var_582_13 + arg_582_0 then
				var_582_11.localPosition = arg_579_1.var_.shakeOldPos
			end

			local var_582_17 = 0.02
			local var_582_18 = 1

			if var_582_17 < arg_579_1.time_ and arg_579_1.time_ <= var_582_17 + arg_582_0 then
				local var_582_19 = "play"
				local var_582_20 = "effect"

				arg_579_1:AudioAction(var_582_19, var_582_20, "se_story_1310", "se_story_1310_gun02", "")
			end

			if arg_579_1.frameCnt_ <= 1 then
				arg_579_1.dialog_:SetActive(false)
			end

			local var_582_21 = 0.5
			local var_582_22 = 0.875

			if var_582_21 < arg_579_1.time_ and arg_579_1.time_ <= var_582_21 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0

				arg_579_1.dialog_:SetActive(true)

				local var_582_23 = LeanTween.value(arg_579_1.dialog_, 0, 1, 0.3)

				var_582_23:setOnUpdate(LuaHelper.FloatAction(function(arg_583_0)
					arg_579_1.dialogCg_.alpha = arg_583_0
				end))
				var_582_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_579_1.dialog_)
					var_582_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_579_1.duration_ = arg_579_1.duration_ + 0.3

				SetActive(arg_579_1.leftNameGo_, false)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_24 = arg_579_1:GetWordFromCfg(417221134)
				local var_582_25 = arg_579_1:FormatText(var_582_24.content)

				arg_579_1.text_.text = var_582_25

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_26 = 35
				local var_582_27 = utf8.len(var_582_25)
				local var_582_28 = var_582_26 <= 0 and var_582_22 or var_582_22 * (var_582_27 / var_582_26)

				if var_582_28 > 0 and var_582_22 < var_582_28 then
					arg_579_1.talkMaxDuration = var_582_28
					var_582_21 = var_582_21 + 0.3

					if var_582_28 + var_582_21 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_28 + var_582_21
					end
				end

				arg_579_1.text_.text = var_582_25
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_29 = var_582_21 + 0.3
			local var_582_30 = math.max(var_582_22, arg_579_1.talkMaxDuration)

			if var_582_29 <= arg_579_1.time_ and arg_579_1.time_ < var_582_29 + var_582_30 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_29) / var_582_30

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_29 + var_582_30 and arg_579_1.time_ < var_582_29 + var_582_30 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play417221135 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 417221135
		arg_585_1.duration_ = 4.37

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play417221136(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["10115"]
			local var_588_1 = 0

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 and not isNil(var_588_0) and arg_585_1.var_.actorSpriteComps10115 == nil then
				arg_585_1.var_.actorSpriteComps10115 = var_588_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_588_2 = 0.2

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_2 and not isNil(var_588_0) then
				local var_588_3 = (arg_585_1.time_ - var_588_1) / var_588_2

				if arg_585_1.var_.actorSpriteComps10115 then
					for iter_588_0, iter_588_1 in pairs(arg_585_1.var_.actorSpriteComps10115:ToTable()) do
						if iter_588_1 then
							if arg_585_1.isInRecall_ then
								local var_588_4 = Mathf.Lerp(iter_588_1.color.r, arg_585_1.hightColor1.r, var_588_3)
								local var_588_5 = Mathf.Lerp(iter_588_1.color.g, arg_585_1.hightColor1.g, var_588_3)
								local var_588_6 = Mathf.Lerp(iter_588_1.color.b, arg_585_1.hightColor1.b, var_588_3)

								iter_588_1.color = Color.New(var_588_4, var_588_5, var_588_6)
							else
								local var_588_7 = Mathf.Lerp(iter_588_1.color.r, 1, var_588_3)

								iter_588_1.color = Color.New(var_588_7, var_588_7, var_588_7)
							end
						end
					end
				end
			end

			if arg_585_1.time_ >= var_588_1 + var_588_2 and arg_585_1.time_ < var_588_1 + var_588_2 + arg_588_0 and not isNil(var_588_0) and arg_585_1.var_.actorSpriteComps10115 then
				for iter_588_2, iter_588_3 in pairs(arg_585_1.var_.actorSpriteComps10115:ToTable()) do
					if iter_588_3 then
						if arg_585_1.isInRecall_ then
							iter_588_3.color = arg_585_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_588_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_585_1.var_.actorSpriteComps10115 = nil
			end

			local var_588_8 = arg_585_1.actors_["10115"].transform
			local var_588_9 = 0

			if var_588_9 < arg_585_1.time_ and arg_585_1.time_ <= var_588_9 + arg_588_0 then
				arg_585_1.var_.moveOldPos10115 = var_588_8.localPosition
				var_588_8.localScale = Vector3.New(1, 1, 1)

				arg_585_1:CheckSpriteTmpPos("10115", 3)

				local var_588_10 = var_588_8.childCount

				for iter_588_4 = 0, var_588_10 - 1 do
					local var_588_11 = var_588_8:GetChild(iter_588_4)

					if var_588_11.name == "split_1" or not string.find(var_588_11.name, "split") then
						var_588_11.gameObject:SetActive(true)
					else
						var_588_11.gameObject:SetActive(false)
					end
				end
			end

			local var_588_12 = 0.001

			if var_588_9 <= arg_585_1.time_ and arg_585_1.time_ < var_588_9 + var_588_12 then
				local var_588_13 = (arg_585_1.time_ - var_588_9) / var_588_12
				local var_588_14 = Vector3.New(0, -355, -140)

				var_588_8.localPosition = Vector3.Lerp(arg_585_1.var_.moveOldPos10115, var_588_14, var_588_13)
			end

			if arg_585_1.time_ >= var_588_9 + var_588_12 and arg_585_1.time_ < var_588_9 + var_588_12 + arg_588_0 then
				var_588_8.localPosition = Vector3.New(0, -355, -140)
			end

			local var_588_15 = 0
			local var_588_16 = 0.425

			if var_588_15 < arg_585_1.time_ and arg_585_1.time_ <= var_588_15 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_17 = arg_585_1:FormatText(StoryNameCfg[1113].name)

				arg_585_1.leftNameTxt_.text = var_588_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_18 = arg_585_1:GetWordFromCfg(417221135)
				local var_588_19 = arg_585_1:FormatText(var_588_18.content)

				arg_585_1.text_.text = var_588_19

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_20 = 17
				local var_588_21 = utf8.len(var_588_19)
				local var_588_22 = var_588_20 <= 0 and var_588_16 or var_588_16 * (var_588_21 / var_588_20)

				if var_588_22 > 0 and var_588_16 < var_588_22 then
					arg_585_1.talkMaxDuration = var_588_22

					if var_588_22 + var_588_15 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_22 + var_588_15
					end
				end

				arg_585_1.text_.text = var_588_19
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221135", "story_v_out_417221.awb") ~= 0 then
					local var_588_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221135", "story_v_out_417221.awb") / 1000

					if var_588_23 + var_588_15 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_23 + var_588_15
					end

					if var_588_18.prefab_name ~= "" and arg_585_1.actors_[var_588_18.prefab_name] ~= nil then
						local var_588_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_18.prefab_name].transform, "story_v_out_417221", "417221135", "story_v_out_417221.awb")

						arg_585_1:RecordAudio("417221135", var_588_24)
						arg_585_1:RecordAudio("417221135", var_588_24)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_417221", "417221135", "story_v_out_417221.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_417221", "417221135", "story_v_out_417221.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_25 = math.max(var_588_16, arg_585_1.talkMaxDuration)

			if var_588_15 <= arg_585_1.time_ and arg_585_1.time_ < var_588_15 + var_588_25 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_15) / var_588_25

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_15 + var_588_25 and arg_585_1.time_ < var_588_15 + var_588_25 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play417221136 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 417221136
		arg_589_1.duration_ = 9

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play417221137(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = 2

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				local var_592_1 = manager.ui.mainCamera.transform.localPosition
				local var_592_2 = Vector3.New(0, 0, 10) + Vector3.New(var_592_1.x, var_592_1.y, 0)
				local var_592_3 = arg_589_1.bgs_.I16f

				var_592_3.transform.localPosition = var_592_2
				var_592_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_592_4 = var_592_3:GetComponent("SpriteRenderer")

				if var_592_4 and var_592_4.sprite then
					local var_592_5 = (var_592_3.transform.localPosition - var_592_1).z
					local var_592_6 = manager.ui.mainCameraCom_
					local var_592_7 = 2 * var_592_5 * Mathf.Tan(var_592_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_592_8 = var_592_7 * var_592_6.aspect
					local var_592_9 = var_592_4.sprite.bounds.size.x
					local var_592_10 = var_592_4.sprite.bounds.size.y
					local var_592_11 = var_592_8 / var_592_9
					local var_592_12 = var_592_7 / var_592_10
					local var_592_13 = var_592_12 < var_592_11 and var_592_11 or var_592_12

					var_592_3.transform.localScale = Vector3.New(var_592_13, var_592_13, 0)
				end

				for iter_592_0, iter_592_1 in pairs(arg_589_1.bgs_) do
					if iter_592_0 ~= "I16f" then
						iter_592_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_592_14 = 4

			if var_592_14 < arg_589_1.time_ and arg_589_1.time_ <= var_592_14 + arg_592_0 then
				arg_589_1.allBtn_.enabled = false
			end

			local var_592_15 = 0.3

			if arg_589_1.time_ >= var_592_14 + var_592_15 and arg_589_1.time_ < var_592_14 + var_592_15 + arg_592_0 then
				arg_589_1.allBtn_.enabled = true
			end

			local var_592_16 = 0

			if var_592_16 < arg_589_1.time_ and arg_589_1.time_ <= var_592_16 + arg_592_0 then
				arg_589_1.mask_.enabled = true
				arg_589_1.mask_.raycastTarget = true

				arg_589_1:SetGaussion(false)
			end

			local var_592_17 = 2

			if var_592_16 <= arg_589_1.time_ and arg_589_1.time_ < var_592_16 + var_592_17 then
				local var_592_18 = (arg_589_1.time_ - var_592_16) / var_592_17
				local var_592_19 = Color.New(0, 0, 0)

				var_592_19.a = Mathf.Lerp(0, 1, var_592_18)
				arg_589_1.mask_.color = var_592_19
			end

			if arg_589_1.time_ >= var_592_16 + var_592_17 and arg_589_1.time_ < var_592_16 + var_592_17 + arg_592_0 then
				local var_592_20 = Color.New(0, 0, 0)

				var_592_20.a = 1
				arg_589_1.mask_.color = var_592_20
			end

			local var_592_21 = 2

			if var_592_21 < arg_589_1.time_ and arg_589_1.time_ <= var_592_21 + arg_592_0 then
				arg_589_1.mask_.enabled = true
				arg_589_1.mask_.raycastTarget = true

				arg_589_1:SetGaussion(false)
			end

			local var_592_22 = 2

			if var_592_21 <= arg_589_1.time_ and arg_589_1.time_ < var_592_21 + var_592_22 then
				local var_592_23 = (arg_589_1.time_ - var_592_21) / var_592_22
				local var_592_24 = Color.New(0, 0, 0)

				var_592_24.a = Mathf.Lerp(1, 0, var_592_23)
				arg_589_1.mask_.color = var_592_24
			end

			if arg_589_1.time_ >= var_592_21 + var_592_22 and arg_589_1.time_ < var_592_21 + var_592_22 + arg_592_0 then
				local var_592_25 = Color.New(0, 0, 0)
				local var_592_26 = 0

				arg_589_1.mask_.enabled = false
				var_592_25.a = var_592_26
				arg_589_1.mask_.color = var_592_25
			end

			local var_592_27 = arg_589_1.actors_["10115"].transform
			local var_592_28 = 1.966

			if var_592_28 < arg_589_1.time_ and arg_589_1.time_ <= var_592_28 + arg_592_0 then
				arg_589_1.var_.moveOldPos10115 = var_592_27.localPosition
				var_592_27.localScale = Vector3.New(1, 1, 1)

				arg_589_1:CheckSpriteTmpPos("10115", 7)

				local var_592_29 = var_592_27.childCount

				for iter_592_2 = 0, var_592_29 - 1 do
					local var_592_30 = var_592_27:GetChild(iter_592_2)

					if var_592_30.name == "" or not string.find(var_592_30.name, "split") then
						var_592_30.gameObject:SetActive(true)
					else
						var_592_30.gameObject:SetActive(false)
					end
				end
			end

			local var_592_31 = 0.001

			if var_592_28 <= arg_589_1.time_ and arg_589_1.time_ < var_592_28 + var_592_31 then
				local var_592_32 = (arg_589_1.time_ - var_592_28) / var_592_31
				local var_592_33 = Vector3.New(0, -2000, -140)

				var_592_27.localPosition = Vector3.Lerp(arg_589_1.var_.moveOldPos10115, var_592_33, var_592_32)
			end

			if arg_589_1.time_ >= var_592_28 + var_592_31 and arg_589_1.time_ < var_592_28 + var_592_31 + arg_592_0 then
				var_592_27.localPosition = Vector3.New(0, -2000, -140)
			end

			local var_592_34 = manager.ui.mainCamera.transform
			local var_592_35 = 1.966

			if var_592_35 < arg_589_1.time_ and arg_589_1.time_ <= var_592_35 + arg_592_0 then
				local var_592_36 = arg_589_1.var_.effect21114

				if var_592_36 then
					Object.Destroy(var_592_36)

					arg_589_1.var_.effect21114 = nil
				end
			end

			local var_592_37 = 1.75135478796437
			local var_592_38 = 1

			if var_592_37 < arg_589_1.time_ and arg_589_1.time_ <= var_592_37 + arg_592_0 then
				local var_592_39 = "play"
				local var_592_40 = "effect"

				arg_589_1:AudioAction(var_592_39, var_592_40, "se_story_1310", "se_story_1310_thunderloop", "")
			end

			if arg_589_1.frameCnt_ <= 1 then
				arg_589_1.dialog_:SetActive(false)
			end

			local var_592_41 = 4
			local var_592_42 = 0.375

			if var_592_41 < arg_589_1.time_ and arg_589_1.time_ <= var_592_41 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0

				arg_589_1.dialog_:SetActive(true)

				local var_592_43 = LeanTween.value(arg_589_1.dialog_, 0, 1, 0.3)

				var_592_43:setOnUpdate(LuaHelper.FloatAction(function(arg_593_0)
					arg_589_1.dialogCg_.alpha = arg_593_0
				end))
				var_592_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_589_1.dialog_)
					var_592_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_589_1.duration_ = arg_589_1.duration_ + 0.3

				SetActive(arg_589_1.leftNameGo_, false)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_44 = arg_589_1:GetWordFromCfg(417221136)
				local var_592_45 = arg_589_1:FormatText(var_592_44.content)

				arg_589_1.text_.text = var_592_45

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_46 = 15
				local var_592_47 = utf8.len(var_592_45)
				local var_592_48 = var_592_46 <= 0 and var_592_42 or var_592_42 * (var_592_47 / var_592_46)

				if var_592_48 > 0 and var_592_42 < var_592_48 then
					arg_589_1.talkMaxDuration = var_592_48
					var_592_41 = var_592_41 + 0.3

					if var_592_48 + var_592_41 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_48 + var_592_41
					end
				end

				arg_589_1.text_.text = var_592_45
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_49 = var_592_41 + 0.3
			local var_592_50 = math.max(var_592_42, arg_589_1.talkMaxDuration)

			if var_592_49 <= arg_589_1.time_ and arg_589_1.time_ < var_592_49 + var_592_50 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_49) / var_592_50

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_49 + var_592_50 and arg_589_1.time_ < var_592_49 + var_592_50 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play417221137 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 417221137
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play417221138(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = 0.133333333333333
			local var_598_1 = 1

			if var_598_0 < arg_595_1.time_ and arg_595_1.time_ <= var_598_0 + arg_598_0 then
				local var_598_2 = "play"
				local var_598_3 = "effect"

				arg_595_1:AudioAction(var_598_2, var_598_3, "se_story_1311", "se_story_1311_rush", "")
			end

			local var_598_4 = 0
			local var_598_5 = 1

			if var_598_4 < arg_595_1.time_ and arg_595_1.time_ <= var_598_4 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, false)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_6 = arg_595_1:GetWordFromCfg(417221137)
				local var_598_7 = arg_595_1:FormatText(var_598_6.content)

				arg_595_1.text_.text = var_598_7

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_8 = 40
				local var_598_9 = utf8.len(var_598_7)
				local var_598_10 = var_598_8 <= 0 and var_598_5 or var_598_5 * (var_598_9 / var_598_8)

				if var_598_10 > 0 and var_598_5 < var_598_10 then
					arg_595_1.talkMaxDuration = var_598_10

					if var_598_10 + var_598_4 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_10 + var_598_4
					end
				end

				arg_595_1.text_.text = var_598_7
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_11 = math.max(var_598_5, arg_595_1.talkMaxDuration)

			if var_598_4 <= arg_595_1.time_ and arg_595_1.time_ < var_598_4 + var_598_11 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_4) / var_598_11

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_4 + var_598_11 and arg_595_1.time_ < var_598_4 + var_598_11 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play417221138 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 417221138
		arg_599_1.duration_ = 2.8

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play417221139(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["10113"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.actorSpriteComps10113 == nil then
				arg_599_1.var_.actorSpriteComps10113 = var_602_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_602_2 = 0.2

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 and not isNil(var_602_0) then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.actorSpriteComps10113 then
					for iter_602_0, iter_602_1 in pairs(arg_599_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_602_1 then
							if arg_599_1.isInRecall_ then
								local var_602_4 = Mathf.Lerp(iter_602_1.color.r, arg_599_1.hightColor1.r, var_602_3)
								local var_602_5 = Mathf.Lerp(iter_602_1.color.g, arg_599_1.hightColor1.g, var_602_3)
								local var_602_6 = Mathf.Lerp(iter_602_1.color.b, arg_599_1.hightColor1.b, var_602_3)

								iter_602_1.color = Color.New(var_602_4, var_602_5, var_602_6)
							else
								local var_602_7 = Mathf.Lerp(iter_602_1.color.r, 1, var_602_3)

								iter_602_1.color = Color.New(var_602_7, var_602_7, var_602_7)
							end
						end
					end
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.actorSpriteComps10113 then
				for iter_602_2, iter_602_3 in pairs(arg_599_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_602_3 then
						if arg_599_1.isInRecall_ then
							iter_602_3.color = arg_599_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_602_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_599_1.var_.actorSpriteComps10113 = nil
			end

			local var_602_8 = arg_599_1.actors_["10113"].transform
			local var_602_9 = 0

			if var_602_9 < arg_599_1.time_ and arg_599_1.time_ <= var_602_9 + arg_602_0 then
				arg_599_1.var_.moveOldPos10113 = var_602_8.localPosition
				var_602_8.localScale = Vector3.New(1, 1, 1)

				arg_599_1:CheckSpriteTmpPos("10113", 3)

				local var_602_10 = var_602_8.childCount

				for iter_602_4 = 0, var_602_10 - 1 do
					local var_602_11 = var_602_8:GetChild(iter_602_4)

					if var_602_11.name == "split_2" or not string.find(var_602_11.name, "split") then
						var_602_11.gameObject:SetActive(true)
					else
						var_602_11.gameObject:SetActive(false)
					end
				end
			end

			local var_602_12 = 0.001

			if var_602_9 <= arg_599_1.time_ and arg_599_1.time_ < var_602_9 + var_602_12 then
				local var_602_13 = (arg_599_1.time_ - var_602_9) / var_602_12
				local var_602_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_602_8.localPosition = Vector3.Lerp(arg_599_1.var_.moveOldPos10113, var_602_14, var_602_13)
			end

			if arg_599_1.time_ >= var_602_9 + var_602_12 and arg_599_1.time_ < var_602_9 + var_602_12 + arg_602_0 then
				var_602_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_602_15 = 0
			local var_602_16 = 0.175

			if var_602_15 < arg_599_1.time_ and arg_599_1.time_ <= var_602_15 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_17 = arg_599_1:FormatText(StoryNameCfg[1117].name)

				arg_599_1.leftNameTxt_.text = var_602_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_18 = arg_599_1:GetWordFromCfg(417221138)
				local var_602_19 = arg_599_1:FormatText(var_602_18.content)

				arg_599_1.text_.text = var_602_19

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_20 = 7
				local var_602_21 = utf8.len(var_602_19)
				local var_602_22 = var_602_20 <= 0 and var_602_16 or var_602_16 * (var_602_21 / var_602_20)

				if var_602_22 > 0 and var_602_16 < var_602_22 then
					arg_599_1.talkMaxDuration = var_602_22

					if var_602_22 + var_602_15 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_22 + var_602_15
					end
				end

				arg_599_1.text_.text = var_602_19
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221138", "story_v_out_417221.awb") ~= 0 then
					local var_602_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221138", "story_v_out_417221.awb") / 1000

					if var_602_23 + var_602_15 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_23 + var_602_15
					end

					if var_602_18.prefab_name ~= "" and arg_599_1.actors_[var_602_18.prefab_name] ~= nil then
						local var_602_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_18.prefab_name].transform, "story_v_out_417221", "417221138", "story_v_out_417221.awb")

						arg_599_1:RecordAudio("417221138", var_602_24)
						arg_599_1:RecordAudio("417221138", var_602_24)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_417221", "417221138", "story_v_out_417221.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_417221", "417221138", "story_v_out_417221.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_25 = math.max(var_602_16, arg_599_1.talkMaxDuration)

			if var_602_15 <= arg_599_1.time_ and arg_599_1.time_ < var_602_15 + var_602_25 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_15) / var_602_25

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_15 + var_602_25 and arg_599_1.time_ < var_602_15 + var_602_25 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play417221139 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 417221139
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play417221140(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["10113"].transform
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 then
				arg_603_1.var_.moveOldPos10113 = var_606_0.localPosition
				var_606_0.localScale = Vector3.New(1, 1, 1)

				arg_603_1:CheckSpriteTmpPos("10113", 7)

				local var_606_2 = var_606_0.childCount

				for iter_606_0 = 0, var_606_2 - 1 do
					local var_606_3 = var_606_0:GetChild(iter_606_0)

					if var_606_3.name == "" or not string.find(var_606_3.name, "split") then
						var_606_3.gameObject:SetActive(true)
					else
						var_606_3.gameObject:SetActive(false)
					end
				end
			end

			local var_606_4 = 0.001

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_4 then
				local var_606_5 = (arg_603_1.time_ - var_606_1) / var_606_4
				local var_606_6 = Vector3.New(0, -2000, 0)

				var_606_0.localPosition = Vector3.Lerp(arg_603_1.var_.moveOldPos10113, var_606_6, var_606_5)
			end

			if arg_603_1.time_ >= var_606_1 + var_606_4 and arg_603_1.time_ < var_606_1 + var_606_4 + arg_606_0 then
				var_606_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_606_7 = 0
			local var_606_8 = 1.05

			if var_606_7 < arg_603_1.time_ and arg_603_1.time_ <= var_606_7 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_9 = arg_603_1:GetWordFromCfg(417221139)
				local var_606_10 = arg_603_1:FormatText(var_606_9.content)

				arg_603_1.text_.text = var_606_10

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_11 = 42
				local var_606_12 = utf8.len(var_606_10)
				local var_606_13 = var_606_11 <= 0 and var_606_8 or var_606_8 * (var_606_12 / var_606_11)

				if var_606_13 > 0 and var_606_8 < var_606_13 then
					arg_603_1.talkMaxDuration = var_606_13

					if var_606_13 + var_606_7 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_13 + var_606_7
					end
				end

				arg_603_1.text_.text = var_606_10
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_14 = math.max(var_606_8, arg_603_1.talkMaxDuration)

			if var_606_7 <= arg_603_1.time_ and arg_603_1.time_ < var_606_7 + var_606_14 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_7) / var_606_14

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_7 + var_606_14 and arg_603_1.time_ < var_606_7 + var_606_14 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play417221140 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 417221140
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play417221141(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 1.1

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, false)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_2 = arg_607_1:GetWordFromCfg(417221140)
				local var_610_3 = arg_607_1:FormatText(var_610_2.content)

				arg_607_1.text_.text = var_610_3

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_4 = 44
				local var_610_5 = utf8.len(var_610_3)
				local var_610_6 = var_610_4 <= 0 and var_610_1 or var_610_1 * (var_610_5 / var_610_4)

				if var_610_6 > 0 and var_610_1 < var_610_6 then
					arg_607_1.talkMaxDuration = var_610_6

					if var_610_6 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_6 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_3
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_7 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_7 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_7

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_7 and arg_607_1.time_ < var_610_0 + var_610_7 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play417221141 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 417221141
		arg_611_1.duration_ = 5.37

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play417221142(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["10113"]
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 and not isNil(var_614_0) and arg_611_1.var_.actorSpriteComps10113 == nil then
				arg_611_1.var_.actorSpriteComps10113 = var_614_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_614_2 = 0.2

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 and not isNil(var_614_0) then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2

				if arg_611_1.var_.actorSpriteComps10113 then
					for iter_614_0, iter_614_1 in pairs(arg_611_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_614_1 then
							if arg_611_1.isInRecall_ then
								local var_614_4 = Mathf.Lerp(iter_614_1.color.r, arg_611_1.hightColor1.r, var_614_3)
								local var_614_5 = Mathf.Lerp(iter_614_1.color.g, arg_611_1.hightColor1.g, var_614_3)
								local var_614_6 = Mathf.Lerp(iter_614_1.color.b, arg_611_1.hightColor1.b, var_614_3)

								iter_614_1.color = Color.New(var_614_4, var_614_5, var_614_6)
							else
								local var_614_7 = Mathf.Lerp(iter_614_1.color.r, 1, var_614_3)

								iter_614_1.color = Color.New(var_614_7, var_614_7, var_614_7)
							end
						end
					end
				end
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 and not isNil(var_614_0) and arg_611_1.var_.actorSpriteComps10113 then
				for iter_614_2, iter_614_3 in pairs(arg_611_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_614_3 then
						if arg_611_1.isInRecall_ then
							iter_614_3.color = arg_611_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_614_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_611_1.var_.actorSpriteComps10113 = nil
			end

			local var_614_8 = arg_611_1.actors_["10113"].transform
			local var_614_9 = 0

			if var_614_9 < arg_611_1.time_ and arg_611_1.time_ <= var_614_9 + arg_614_0 then
				arg_611_1.var_.moveOldPos10113 = var_614_8.localPosition
				var_614_8.localScale = Vector3.New(1, 1, 1)

				arg_611_1:CheckSpriteTmpPos("10113", 3)

				local var_614_10 = var_614_8.childCount

				for iter_614_4 = 0, var_614_10 - 1 do
					local var_614_11 = var_614_8:GetChild(iter_614_4)

					if var_614_11.name == "split_2" or not string.find(var_614_11.name, "split") then
						var_614_11.gameObject:SetActive(true)
					else
						var_614_11.gameObject:SetActive(false)
					end
				end
			end

			local var_614_12 = 0.001

			if var_614_9 <= arg_611_1.time_ and arg_611_1.time_ < var_614_9 + var_614_12 then
				local var_614_13 = (arg_611_1.time_ - var_614_9) / var_614_12
				local var_614_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_614_8.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos10113, var_614_14, var_614_13)
			end

			if arg_611_1.time_ >= var_614_9 + var_614_12 and arg_611_1.time_ < var_614_9 + var_614_12 + arg_614_0 then
				var_614_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_614_15 = 0
			local var_614_16 = 0.325

			if var_614_15 < arg_611_1.time_ and arg_611_1.time_ <= var_614_15 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_17 = arg_611_1:FormatText(StoryNameCfg[1117].name)

				arg_611_1.leftNameTxt_.text = var_614_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_18 = arg_611_1:GetWordFromCfg(417221141)
				local var_614_19 = arg_611_1:FormatText(var_614_18.content)

				arg_611_1.text_.text = var_614_19

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_20 = 13
				local var_614_21 = utf8.len(var_614_19)
				local var_614_22 = var_614_20 <= 0 and var_614_16 or var_614_16 * (var_614_21 / var_614_20)

				if var_614_22 > 0 and var_614_16 < var_614_22 then
					arg_611_1.talkMaxDuration = var_614_22

					if var_614_22 + var_614_15 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_22 + var_614_15
					end
				end

				arg_611_1.text_.text = var_614_19
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221141", "story_v_out_417221.awb") ~= 0 then
					local var_614_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221141", "story_v_out_417221.awb") / 1000

					if var_614_23 + var_614_15 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_23 + var_614_15
					end

					if var_614_18.prefab_name ~= "" and arg_611_1.actors_[var_614_18.prefab_name] ~= nil then
						local var_614_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_18.prefab_name].transform, "story_v_out_417221", "417221141", "story_v_out_417221.awb")

						arg_611_1:RecordAudio("417221141", var_614_24)
						arg_611_1:RecordAudio("417221141", var_614_24)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_417221", "417221141", "story_v_out_417221.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_417221", "417221141", "story_v_out_417221.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_25 = math.max(var_614_16, arg_611_1.talkMaxDuration)

			if var_614_15 <= arg_611_1.time_ and arg_611_1.time_ < var_614_15 + var_614_25 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_15) / var_614_25

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_15 + var_614_25 and arg_611_1.time_ < var_614_15 + var_614_25 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play417221142 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 417221142
		arg_615_1.duration_ = 8.6

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play417221143(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 0.8

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_2 = arg_615_1:FormatText(StoryNameCfg[1117].name)

				arg_615_1.leftNameTxt_.text = var_618_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_3 = arg_615_1:GetWordFromCfg(417221142)
				local var_618_4 = arg_615_1:FormatText(var_618_3.content)

				arg_615_1.text_.text = var_618_4

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221142", "story_v_out_417221.awb") ~= 0 then
					local var_618_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221142", "story_v_out_417221.awb") / 1000

					if var_618_8 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_8 + var_618_0
					end

					if var_618_3.prefab_name ~= "" and arg_615_1.actors_[var_618_3.prefab_name] ~= nil then
						local var_618_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_3.prefab_name].transform, "story_v_out_417221", "417221142", "story_v_out_417221.awb")

						arg_615_1:RecordAudio("417221142", var_618_9)
						arg_615_1:RecordAudio("417221142", var_618_9)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_417221", "417221142", "story_v_out_417221.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_417221", "417221142", "story_v_out_417221.awb")
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
	Play417221143 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 417221143
		arg_619_1.duration_ = 10.9

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play417221144(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 1.125

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[1117].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(417221143)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221143", "story_v_out_417221.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221143", "story_v_out_417221.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_out_417221", "417221143", "story_v_out_417221.awb")

						arg_619_1:RecordAudio("417221143", var_622_9)
						arg_619_1:RecordAudio("417221143", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_417221", "417221143", "story_v_out_417221.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_417221", "417221143", "story_v_out_417221.awb")
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
	Play417221144 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 417221144
		arg_623_1.duration_ = 7.9

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play417221145(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 0.775

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_2 = arg_623_1:FormatText(StoryNameCfg[1117].name)

				arg_623_1.leftNameTxt_.text = var_626_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_3 = arg_623_1:GetWordFromCfg(417221144)
				local var_626_4 = arg_623_1:FormatText(var_626_3.content)

				arg_623_1.text_.text = var_626_4

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221144", "story_v_out_417221.awb") ~= 0 then
					local var_626_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221144", "story_v_out_417221.awb") / 1000

					if var_626_8 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_8 + var_626_0
					end

					if var_626_3.prefab_name ~= "" and arg_623_1.actors_[var_626_3.prefab_name] ~= nil then
						local var_626_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_3.prefab_name].transform, "story_v_out_417221", "417221144", "story_v_out_417221.awb")

						arg_623_1:RecordAudio("417221144", var_626_9)
						arg_623_1:RecordAudio("417221144", var_626_9)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_417221", "417221144", "story_v_out_417221.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_417221", "417221144", "story_v_out_417221.awb")
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
	Play417221145 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 417221145
		arg_627_1.duration_ = 11.07

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play417221146(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0
			local var_630_1 = 1.1

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_2 = arg_627_1:FormatText(StoryNameCfg[1117].name)

				arg_627_1.leftNameTxt_.text = var_630_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_3 = arg_627_1:GetWordFromCfg(417221145)
				local var_630_4 = arg_627_1:FormatText(var_630_3.content)

				arg_627_1.text_.text = var_630_4

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221145", "story_v_out_417221.awb") ~= 0 then
					local var_630_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221145", "story_v_out_417221.awb") / 1000

					if var_630_8 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_8 + var_630_0
					end

					if var_630_3.prefab_name ~= "" and arg_627_1.actors_[var_630_3.prefab_name] ~= nil then
						local var_630_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_3.prefab_name].transform, "story_v_out_417221", "417221145", "story_v_out_417221.awb")

						arg_627_1:RecordAudio("417221145", var_630_9)
						arg_627_1:RecordAudio("417221145", var_630_9)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_417221", "417221145", "story_v_out_417221.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_417221", "417221145", "story_v_out_417221.awb")
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
	Play417221146 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 417221146
		arg_631_1.duration_ = 7.97

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play417221147(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = 0
			local var_634_1 = 0.7

			if var_634_0 < arg_631_1.time_ and arg_631_1.time_ <= var_634_0 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_2 = arg_631_1:FormatText(StoryNameCfg[1117].name)

				arg_631_1.leftNameTxt_.text = var_634_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_3 = arg_631_1:GetWordFromCfg(417221146)
				local var_634_4 = arg_631_1:FormatText(var_634_3.content)

				arg_631_1.text_.text = var_634_4

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221146", "story_v_out_417221.awb") ~= 0 then
					local var_634_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221146", "story_v_out_417221.awb") / 1000

					if var_634_8 + var_634_0 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_8 + var_634_0
					end

					if var_634_3.prefab_name ~= "" and arg_631_1.actors_[var_634_3.prefab_name] ~= nil then
						local var_634_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_3.prefab_name].transform, "story_v_out_417221", "417221146", "story_v_out_417221.awb")

						arg_631_1:RecordAudio("417221146", var_634_9)
						arg_631_1:RecordAudio("417221146", var_634_9)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_417221", "417221146", "story_v_out_417221.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_417221", "417221146", "story_v_out_417221.awb")
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
	Play417221147 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 417221147
		arg_635_1.duration_ = 9.2

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play417221148(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = 0
			local var_638_1 = 0.875

			if var_638_0 < arg_635_1.time_ and arg_635_1.time_ <= var_638_0 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_2 = arg_635_1:FormatText(StoryNameCfg[1117].name)

				arg_635_1.leftNameTxt_.text = var_638_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_3 = arg_635_1:GetWordFromCfg(417221147)
				local var_638_4 = arg_635_1:FormatText(var_638_3.content)

				arg_635_1.text_.text = var_638_4

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221147", "story_v_out_417221.awb") ~= 0 then
					local var_638_8 = manager.audio:GetVoiceLength("story_v_out_417221", "417221147", "story_v_out_417221.awb") / 1000

					if var_638_8 + var_638_0 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_8 + var_638_0
					end

					if var_638_3.prefab_name ~= "" and arg_635_1.actors_[var_638_3.prefab_name] ~= nil then
						local var_638_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_3.prefab_name].transform, "story_v_out_417221", "417221147", "story_v_out_417221.awb")

						arg_635_1:RecordAudio("417221147", var_638_9)
						arg_635_1:RecordAudio("417221147", var_638_9)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_417221", "417221147", "story_v_out_417221.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_417221", "417221147", "story_v_out_417221.awb")
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
	Play417221148 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 417221148
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play417221149(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["10113"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and not isNil(var_642_0) and arg_639_1.var_.actorSpriteComps10113 == nil then
				arg_639_1.var_.actorSpriteComps10113 = var_642_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_642_2 = 0.2

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 and not isNil(var_642_0) then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.actorSpriteComps10113 then
					for iter_642_0, iter_642_1 in pairs(arg_639_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_642_1 then
							if arg_639_1.isInRecall_ then
								local var_642_4 = Mathf.Lerp(iter_642_1.color.r, arg_639_1.hightColor2.r, var_642_3)
								local var_642_5 = Mathf.Lerp(iter_642_1.color.g, arg_639_1.hightColor2.g, var_642_3)
								local var_642_6 = Mathf.Lerp(iter_642_1.color.b, arg_639_1.hightColor2.b, var_642_3)

								iter_642_1.color = Color.New(var_642_4, var_642_5, var_642_6)
							else
								local var_642_7 = Mathf.Lerp(iter_642_1.color.r, 0.5, var_642_3)

								iter_642_1.color = Color.New(var_642_7, var_642_7, var_642_7)
							end
						end
					end
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and not isNil(var_642_0) and arg_639_1.var_.actorSpriteComps10113 then
				for iter_642_2, iter_642_3 in pairs(arg_639_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_642_3 then
						if arg_639_1.isInRecall_ then
							iter_642_3.color = arg_639_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_642_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_639_1.var_.actorSpriteComps10113 = nil
			end

			local var_642_8 = arg_639_1.actors_["10113"].transform
			local var_642_9 = 0

			if var_642_9 < arg_639_1.time_ and arg_639_1.time_ <= var_642_9 + arg_642_0 then
				arg_639_1.var_.moveOldPos10113 = var_642_8.localPosition
				var_642_8.localScale = Vector3.New(1, 1, 1)

				arg_639_1:CheckSpriteTmpPos("10113", 7)

				local var_642_10 = var_642_8.childCount

				for iter_642_4 = 0, var_642_10 - 1 do
					local var_642_11 = var_642_8:GetChild(iter_642_4)

					if var_642_11.name == "" or not string.find(var_642_11.name, "split") then
						var_642_11.gameObject:SetActive(true)
					else
						var_642_11.gameObject:SetActive(false)
					end
				end
			end

			local var_642_12 = 0.001

			if var_642_9 <= arg_639_1.time_ and arg_639_1.time_ < var_642_9 + var_642_12 then
				local var_642_13 = (arg_639_1.time_ - var_642_9) / var_642_12
				local var_642_14 = Vector3.New(0, -2000, 0)

				var_642_8.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPos10113, var_642_14, var_642_13)
			end

			if arg_639_1.time_ >= var_642_9 + var_642_12 and arg_639_1.time_ < var_642_9 + var_642_12 + arg_642_0 then
				var_642_8.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_642_15 = 0.733333333333333
			local var_642_16 = 1

			if var_642_15 < arg_639_1.time_ and arg_639_1.time_ <= var_642_15 + arg_642_0 then
				local var_642_17 = "play"
				local var_642_18 = "effect"

				arg_639_1:AudioAction(var_642_17, var_642_18, "se_story_1310", "se_story_1310_rush", "")
			end

			local var_642_19 = 0
			local var_642_20 = 0.95

			if var_642_19 < arg_639_1.time_ and arg_639_1.time_ <= var_642_19 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, false)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_21 = arg_639_1:GetWordFromCfg(417221148)
				local var_642_22 = arg_639_1:FormatText(var_642_21.content)

				arg_639_1.text_.text = var_642_22

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_23 = 38
				local var_642_24 = utf8.len(var_642_22)
				local var_642_25 = var_642_23 <= 0 and var_642_20 or var_642_20 * (var_642_24 / var_642_23)

				if var_642_25 > 0 and var_642_20 < var_642_25 then
					arg_639_1.talkMaxDuration = var_642_25

					if var_642_25 + var_642_19 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_25 + var_642_19
					end
				end

				arg_639_1.text_.text = var_642_22
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_26 = math.max(var_642_20, arg_639_1.talkMaxDuration)

			if var_642_19 <= arg_639_1.time_ and arg_639_1.time_ < var_642_19 + var_642_26 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_19) / var_642_26

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_19 + var_642_26 and arg_639_1.time_ < var_642_19 + var_642_26 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play417221149 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 417221149
		arg_643_1.duration_ = 5

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play417221150(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 1

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				local var_646_2 = "play"
				local var_646_3 = "effect"

				arg_643_1:AudioAction(var_646_2, var_646_3, "se_story_1311", "se_story_1311_hit02", "")
			end

			local var_646_4 = 0
			local var_646_5 = 1.1

			if var_646_4 < arg_643_1.time_ and arg_643_1.time_ <= var_646_4 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, false)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_6 = arg_643_1:GetWordFromCfg(417221149)
				local var_646_7 = arg_643_1:FormatText(var_646_6.content)

				arg_643_1.text_.text = var_646_7

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_8 = 44
				local var_646_9 = utf8.len(var_646_7)
				local var_646_10 = var_646_8 <= 0 and var_646_5 or var_646_5 * (var_646_9 / var_646_8)

				if var_646_10 > 0 and var_646_5 < var_646_10 then
					arg_643_1.talkMaxDuration = var_646_10

					if var_646_10 + var_646_4 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_10 + var_646_4
					end
				end

				arg_643_1.text_.text = var_646_7
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)
				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_11 = math.max(var_646_5, arg_643_1.talkMaxDuration)

			if var_646_4 <= arg_643_1.time_ and arg_643_1.time_ < var_646_4 + var_646_11 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_4) / var_646_11

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_4 + var_646_11 and arg_643_1.time_ < var_646_4 + var_646_11 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play417221150 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 417221150
		arg_647_1.duration_ = 6.5

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play417221151(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = manager.ui.mainCamera.transform
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 then
				arg_647_1.var_.shakeOldPos = var_650_0.localPosition
			end

			local var_650_2 = 0.5

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / 0.066
				local var_650_4, var_650_5 = math.modf(var_650_3)

				var_650_0.localPosition = Vector3.New(var_650_5 * 0.13, var_650_5 * 0.13, var_650_5 * 0.13) + arg_647_1.var_.shakeOldPos
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 then
				var_650_0.localPosition = arg_647_1.var_.shakeOldPos
			end

			local var_650_6 = manager.ui.mainCamera.transform
			local var_650_7 = 0.733333333333334

			if var_650_7 < arg_647_1.time_ and arg_647_1.time_ <= var_650_7 + arg_650_0 then
				arg_647_1.var_.shakeOldPos = var_650_6.localPosition
			end

			local var_650_8 = 0.766666666666666

			if var_650_7 <= arg_647_1.time_ and arg_647_1.time_ < var_650_7 + var_650_8 then
				local var_650_9 = (arg_647_1.time_ - var_650_7) / 0.066
				local var_650_10, var_650_11 = math.modf(var_650_9)

				var_650_6.localPosition = Vector3.New(var_650_11 * 0.13, var_650_11 * 0.13, var_650_11 * 0.13) + arg_647_1.var_.shakeOldPos
			end

			if arg_647_1.time_ >= var_650_7 + var_650_8 and arg_647_1.time_ < var_650_7 + var_650_8 + arg_650_0 then
				var_650_6.localPosition = arg_647_1.var_.shakeOldPos
			end

			local var_650_12 = manager.ui.mainCamera.transform
			local var_650_13 = 0.6

			if var_650_13 < arg_647_1.time_ and arg_647_1.time_ <= var_650_13 + arg_650_0 then
				local var_650_14 = arg_647_1.var_.effect11501

				if not var_650_14 then
					var_650_14 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_hit"))
					var_650_14.name = "11501"
					arg_647_1.var_.effect11501 = var_650_14
				end

				local var_650_15 = var_650_12:Find("")

				if var_650_15 then
					var_650_14.transform.parent = var_650_15
				else
					var_650_14.transform.parent = var_650_12
				end

				var_650_14.transform.localPosition = Vector3.New(-1.22, -0.04, 4.42)
				var_650_14.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_650_16 = manager.ui.mainCamera.transform
			local var_650_17 = 1.66666666666667

			if var_650_17 < arg_647_1.time_ and arg_647_1.time_ <= var_650_17 + arg_650_0 then
				local var_650_18 = arg_647_1.var_.effect11501

				if var_650_18 then
					Object.Destroy(var_650_18)

					arg_647_1.var_.effect11501 = nil
				end
			end

			local var_650_19 = manager.ui.mainCamera.transform
			local var_650_20 = 0.866666666666667

			if var_650_20 < arg_647_1.time_ and arg_647_1.time_ <= var_650_20 + arg_650_0 then
				local var_650_21 = arg_647_1.var_.effect11502

				if not var_650_21 then
					var_650_21 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_hit"))
					var_650_21.name = "11502"
					arg_647_1.var_.effect11502 = var_650_21
				end

				local var_650_22 = var_650_19:Find("")

				if var_650_22 then
					var_650_21.transform.parent = var_650_22
				else
					var_650_21.transform.parent = var_650_19
				end

				var_650_21.transform.localPosition = Vector3.New(0.61, -0.17, 1.42)
				var_650_21.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_650_23 = manager.ui.mainCamera.transform
			local var_650_24 = 1.66666666666667

			if var_650_24 < arg_647_1.time_ and arg_647_1.time_ <= var_650_24 + arg_650_0 then
				local var_650_25 = arg_647_1.var_.effect11502

				if var_650_25 then
					Object.Destroy(var_650_25)

					arg_647_1.var_.effect11502 = nil
				end
			end

			local var_650_26 = manager.ui.mainCamera.transform
			local var_650_27 = 1.1

			if var_650_27 < arg_647_1.time_ and arg_647_1.time_ <= var_650_27 + arg_650_0 then
				local var_650_28 = arg_647_1.var_.effect11503

				if not var_650_28 then
					var_650_28 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_hit"))
					var_650_28.name = "11503"
					arg_647_1.var_.effect11503 = var_650_28
				end

				local var_650_29 = var_650_26:Find("")

				if var_650_29 then
					var_650_28.transform.parent = var_650_29
				else
					var_650_28.transform.parent = var_650_26
				end

				var_650_28.transform.localPosition = Vector3.New(0, -0.17, 1.42)
				var_650_28.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_650_30 = manager.ui.mainCamera.transform
			local var_650_31 = 1.66666666666667

			if var_650_31 < arg_647_1.time_ and arg_647_1.time_ <= var_650_31 + arg_650_0 then
				local var_650_32 = arg_647_1.var_.effect11503

				if var_650_32 then
					Object.Destroy(var_650_32)

					arg_647_1.var_.effect11503 = nil
				end
			end

			local var_650_33 = 0
			local var_650_34 = 1

			if var_650_33 < arg_647_1.time_ and arg_647_1.time_ <= var_650_33 + arg_650_0 then
				local var_650_35 = "play"
				local var_650_36 = "effect"

				arg_647_1:AudioAction(var_650_35, var_650_36, "se_story_1311", "se_story_1311_machinegun", "")
			end

			if arg_647_1.frameCnt_ <= 1 then
				arg_647_1.dialog_:SetActive(false)
			end

			local var_650_37 = 1.5
			local var_650_38 = 1.775

			if var_650_37 < arg_647_1.time_ and arg_647_1.time_ <= var_650_37 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0

				arg_647_1.dialog_:SetActive(true)

				local var_650_39 = LeanTween.value(arg_647_1.dialog_, 0, 1, 0.3)

				var_650_39:setOnUpdate(LuaHelper.FloatAction(function(arg_651_0)
					arg_647_1.dialogCg_.alpha = arg_651_0
				end))
				var_650_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_647_1.dialog_)
					var_650_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_647_1.duration_ = arg_647_1.duration_ + 0.3

				SetActive(arg_647_1.leftNameGo_, false)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_40 = arg_647_1:GetWordFromCfg(417221150)
				local var_650_41 = arg_647_1:FormatText(var_650_40.content)

				arg_647_1.text_.text = var_650_41

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_42 = 71
				local var_650_43 = utf8.len(var_650_41)
				local var_650_44 = var_650_42 <= 0 and var_650_38 or var_650_38 * (var_650_43 / var_650_42)

				if var_650_44 > 0 and var_650_38 < var_650_44 then
					arg_647_1.talkMaxDuration = var_650_44
					var_650_37 = var_650_37 + 0.3

					if var_650_44 + var_650_37 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_44 + var_650_37
					end
				end

				arg_647_1.text_.text = var_650_41
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)
				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_45 = var_650_37 + 0.3
			local var_650_46 = math.max(var_650_38, arg_647_1.talkMaxDuration)

			if var_650_45 <= arg_647_1.time_ and arg_647_1.time_ < var_650_45 + var_650_46 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_45) / var_650_46

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_45 + var_650_46 and arg_647_1.time_ < var_650_45 + var_650_46 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play417221151 = function(arg_653_0, arg_653_1)
		arg_653_1.time_ = 0
		arg_653_1.frameCnt_ = 0
		arg_653_1.state_ = "playing"
		arg_653_1.curTalkId_ = 417221151
		arg_653_1.duration_ = 5

		SetActive(arg_653_1.tipsGo_, false)

		function arg_653_1.onSingleLineFinish_()
			arg_653_1.onSingleLineUpdate_ = nil
			arg_653_1.onSingleLineFinish_ = nil
			arg_653_1.state_ = "waiting"
		end

		function arg_653_1.playNext_(arg_655_0)
			if arg_655_0 == 1 then
				arg_653_0:Play417221152(arg_653_1)
			end
		end

		function arg_653_1.onSingleLineUpdate_(arg_656_0)
			local var_656_0 = 0
			local var_656_1 = 1.25

			if var_656_0 < arg_653_1.time_ and arg_653_1.time_ <= var_656_0 + arg_656_0 then
				arg_653_1.talkMaxDuration = 0
				arg_653_1.dialogCg_.alpha = 1

				arg_653_1.dialog_:SetActive(true)
				SetActive(arg_653_1.leftNameGo_, false)

				arg_653_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_653_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_653_1:RecordName(arg_653_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_653_1.iconTrs_.gameObject, false)
				arg_653_1.callingController_:SetSelectedState("normal")

				local var_656_2 = arg_653_1:GetWordFromCfg(417221151)
				local var_656_3 = arg_653_1:FormatText(var_656_2.content)

				arg_653_1.text_.text = var_656_3

				LuaForUtil.ClearLinePrefixSymbol(arg_653_1.text_)

				local var_656_4 = 50
				local var_656_5 = utf8.len(var_656_3)
				local var_656_6 = var_656_4 <= 0 and var_656_1 or var_656_1 * (var_656_5 / var_656_4)

				if var_656_6 > 0 and var_656_1 < var_656_6 then
					arg_653_1.talkMaxDuration = var_656_6

					if var_656_6 + var_656_0 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_6 + var_656_0
					end
				end

				arg_653_1.text_.text = var_656_3
				arg_653_1.typewritter.percent = 0

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(false)
				arg_653_1:RecordContent(arg_653_1.text_.text)
			end

			local var_656_7 = math.max(var_656_1, arg_653_1.talkMaxDuration)

			if var_656_0 <= arg_653_1.time_ and arg_653_1.time_ < var_656_0 + var_656_7 then
				arg_653_1.typewritter.percent = (arg_653_1.time_ - var_656_0) / var_656_7

				arg_653_1.typewritter:SetDirty()
			end

			if arg_653_1.time_ >= var_656_0 + var_656_7 and arg_653_1.time_ < var_656_0 + var_656_7 + arg_656_0 then
				arg_653_1.typewritter.percent = 1

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(true)
			end
		end
	end,
	Play417221152 = function(arg_657_0, arg_657_1)
		arg_657_1.time_ = 0
		arg_657_1.frameCnt_ = 0
		arg_657_1.state_ = "playing"
		arg_657_1.curTalkId_ = 417221152
		arg_657_1.duration_ = 5.9

		SetActive(arg_657_1.tipsGo_, false)

		function arg_657_1.onSingleLineFinish_()
			arg_657_1.onSingleLineUpdate_ = nil
			arg_657_1.onSingleLineFinish_ = nil
			arg_657_1.state_ = "waiting"
			arg_657_1.auto_ = false
		end

		function arg_657_1.playNext_(arg_659_0)
			arg_657_1.onStoryFinished_()
		end

		function arg_657_1.onSingleLineUpdate_(arg_660_0)
			local var_660_0 = arg_657_1.actors_["10113"]
			local var_660_1 = 0

			if var_660_1 < arg_657_1.time_ and arg_657_1.time_ <= var_660_1 + arg_660_0 and not isNil(var_660_0) and arg_657_1.var_.actorSpriteComps10113 == nil then
				arg_657_1.var_.actorSpriteComps10113 = var_660_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_660_2 = 0.2

			if var_660_1 <= arg_657_1.time_ and arg_657_1.time_ < var_660_1 + var_660_2 and not isNil(var_660_0) then
				local var_660_3 = (arg_657_1.time_ - var_660_1) / var_660_2

				if arg_657_1.var_.actorSpriteComps10113 then
					for iter_660_0, iter_660_1 in pairs(arg_657_1.var_.actorSpriteComps10113:ToTable()) do
						if iter_660_1 then
							if arg_657_1.isInRecall_ then
								local var_660_4 = Mathf.Lerp(iter_660_1.color.r, arg_657_1.hightColor1.r, var_660_3)
								local var_660_5 = Mathf.Lerp(iter_660_1.color.g, arg_657_1.hightColor1.g, var_660_3)
								local var_660_6 = Mathf.Lerp(iter_660_1.color.b, arg_657_1.hightColor1.b, var_660_3)

								iter_660_1.color = Color.New(var_660_4, var_660_5, var_660_6)
							else
								local var_660_7 = Mathf.Lerp(iter_660_1.color.r, 1, var_660_3)

								iter_660_1.color = Color.New(var_660_7, var_660_7, var_660_7)
							end
						end
					end
				end
			end

			if arg_657_1.time_ >= var_660_1 + var_660_2 and arg_657_1.time_ < var_660_1 + var_660_2 + arg_660_0 and not isNil(var_660_0) and arg_657_1.var_.actorSpriteComps10113 then
				for iter_660_2, iter_660_3 in pairs(arg_657_1.var_.actorSpriteComps10113:ToTable()) do
					if iter_660_3 then
						if arg_657_1.isInRecall_ then
							iter_660_3.color = arg_657_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_660_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_657_1.var_.actorSpriteComps10113 = nil
			end

			local var_660_8 = arg_657_1.actors_["10113"].transform
			local var_660_9 = 0

			if var_660_9 < arg_657_1.time_ and arg_657_1.time_ <= var_660_9 + arg_660_0 then
				arg_657_1.var_.moveOldPos10113 = var_660_8.localPosition
				var_660_8.localScale = Vector3.New(1, 1, 1)

				arg_657_1:CheckSpriteTmpPos("10113", 3)

				local var_660_10 = var_660_8.childCount

				for iter_660_4 = 0, var_660_10 - 1 do
					local var_660_11 = var_660_8:GetChild(iter_660_4)

					if var_660_11.name == "split_3" or not string.find(var_660_11.name, "split") then
						var_660_11.gameObject:SetActive(true)
					else
						var_660_11.gameObject:SetActive(false)
					end
				end
			end

			local var_660_12 = 0.001

			if var_660_9 <= arg_657_1.time_ and arg_657_1.time_ < var_660_9 + var_660_12 then
				local var_660_13 = (arg_657_1.time_ - var_660_9) / var_660_12
				local var_660_14 = Vector3.New(-30.38, -328.4, -517.4)

				var_660_8.localPosition = Vector3.Lerp(arg_657_1.var_.moveOldPos10113, var_660_14, var_660_13)
			end

			if arg_657_1.time_ >= var_660_9 + var_660_12 and arg_657_1.time_ < var_660_9 + var_660_12 + arg_660_0 then
				var_660_8.localPosition = Vector3.New(-30.38, -328.4, -517.4)
			end

			local var_660_15 = 0
			local var_660_16 = 0.4

			if var_660_15 < arg_657_1.time_ and arg_657_1.time_ <= var_660_15 + arg_660_0 then
				arg_657_1.talkMaxDuration = 0
				arg_657_1.dialogCg_.alpha = 1

				arg_657_1.dialog_:SetActive(true)
				SetActive(arg_657_1.leftNameGo_, true)

				local var_660_17 = arg_657_1:FormatText(StoryNameCfg[1117].name)

				arg_657_1.leftNameTxt_.text = var_660_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_657_1.leftNameTxt_.transform)

				arg_657_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_657_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_657_1:RecordName(arg_657_1.leftNameTxt_.text)
				SetActive(arg_657_1.iconTrs_.gameObject, false)
				arg_657_1.callingController_:SetSelectedState("normal")

				local var_660_18 = arg_657_1:GetWordFromCfg(417221152)
				local var_660_19 = arg_657_1:FormatText(var_660_18.content)

				arg_657_1.text_.text = var_660_19

				LuaForUtil.ClearLinePrefixSymbol(arg_657_1.text_)

				local var_660_20 = 16
				local var_660_21 = utf8.len(var_660_19)
				local var_660_22 = var_660_20 <= 0 and var_660_16 or var_660_16 * (var_660_21 / var_660_20)

				if var_660_22 > 0 and var_660_16 < var_660_22 then
					arg_657_1.talkMaxDuration = var_660_22

					if var_660_22 + var_660_15 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_22 + var_660_15
					end
				end

				arg_657_1.text_.text = var_660_19
				arg_657_1.typewritter.percent = 0

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417221", "417221152", "story_v_out_417221.awb") ~= 0 then
					local var_660_23 = manager.audio:GetVoiceLength("story_v_out_417221", "417221152", "story_v_out_417221.awb") / 1000

					if var_660_23 + var_660_15 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_23 + var_660_15
					end

					if var_660_18.prefab_name ~= "" and arg_657_1.actors_[var_660_18.prefab_name] ~= nil then
						local var_660_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_657_1.actors_[var_660_18.prefab_name].transform, "story_v_out_417221", "417221152", "story_v_out_417221.awb")

						arg_657_1:RecordAudio("417221152", var_660_24)
						arg_657_1:RecordAudio("417221152", var_660_24)
					else
						arg_657_1:AudioAction("play", "voice", "story_v_out_417221", "417221152", "story_v_out_417221.awb")
					end

					arg_657_1:RecordHistoryTalkVoice("story_v_out_417221", "417221152", "story_v_out_417221.awb")
				end

				arg_657_1:RecordContent(arg_657_1.text_.text)
			end

			local var_660_25 = math.max(var_660_16, arg_657_1.talkMaxDuration)

			if var_660_15 <= arg_657_1.time_ and arg_657_1.time_ < var_660_15 + var_660_25 then
				arg_657_1.typewritter.percent = (arg_657_1.time_ - var_660_15) / var_660_25

				arg_657_1.typewritter:SetDirty()
			end

			if arg_657_1.time_ >= var_660_15 + var_660_25 and arg_657_1.time_ < var_660_15 + var_660_25 + arg_660_0 then
				arg_657_1.typewritter.percent = 1

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I16f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST69",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05e",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST2106",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST73",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST2104"
	},
	voices = {
		"story_v_out_417221.awb"
	}
}
