return {
	Play1104905001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1104905001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1104905002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K10g"

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
				local var_4_5 = arg_1_1.bgs_.K10g

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
					if iter_4_0 ~= "K10g" then
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

			local var_4_24 = 0.125
			local var_4_25 = 1

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "effect"

				arg_1_1:AudioAction(var_4_26, var_4_27, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			local var_4_28 = 1.475
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "effect"

				arg_1_1:AudioAction(var_4_30, var_4_31, "se_story_side_1049", "se_story_side_1049_footstep_walk", "")
			end

			local var_4_32 = 0.125
			local var_4_33 = 1

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				local var_4_34 = "play"
				local var_4_35 = "effect"

				arg_1_1:AudioAction(var_4_34, var_4_35, "se_story_side_1049", "se_story_side_1049_crowdloop", "")
			end

			local var_4_36 = 0
			local var_4_37 = 0.2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "music"

				arg_1_1:AudioAction(var_4_38, var_4_39, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_40 = ""
				local var_4_41 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_41 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_41 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_41

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_41
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

			local var_4_42 = 2
			local var_4_43 = 0.475

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_44 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_44:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_45 = arg_1_1:GetWordFromCfg(1104905001)
				local var_4_46 = arg_1_1:FormatText(var_4_45.content)

				arg_1_1.text_.text = var_4_46

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_47 = 19
				local var_4_48 = utf8.len(var_4_46)
				local var_4_49 = var_4_47 <= 0 and var_4_43 or var_4_43 * (var_4_48 / var_4_47)

				if var_4_49 > 0 and var_4_43 < var_4_49 then
					arg_1_1.talkMaxDuration = var_4_49
					var_4_42 = var_4_42 + 0.3

					if var_4_49 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_49 + var_4_42
					end
				end

				arg_1_1.text_.text = var_4_46
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_50 = var_4_42 + 0.3
			local var_4_51 = math.max(var_4_43, arg_1_1.talkMaxDuration)

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_50) / var_4_51

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 1104905002
		arg_8_1.duration_ = 5

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play1104905003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = 0
			local var_11_1 = 0.2

			if var_11_0 < arg_8_1.time_ and arg_8_1.time_ <= var_11_0 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_2 = arg_8_1:FormatText(StoryNameCfg[7].name)

				arg_8_1.leftNameTxt_.text = var_11_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_3 = arg_8_1:GetWordFromCfg(1104905002)
				local var_11_4 = arg_8_1:FormatText(var_11_3.content)

				arg_8_1.text_.text = var_11_4

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_5 = 8
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
				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_8 = math.max(var_11_1, arg_8_1.talkMaxDuration)

			if var_11_0 <= arg_8_1.time_ and arg_8_1.time_ < var_11_0 + var_11_8 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_0) / var_11_8

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_0 + var_11_8 and arg_8_1.time_ < var_11_0 + var_11_8 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 1104905003
		arg_12_1.duration_ = 5

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play1104905004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = 0
			local var_15_1 = 0.825

			if var_15_0 < arg_12_1.time_ and arg_12_1.time_ <= var_15_0 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, false)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_2 = arg_12_1:GetWordFromCfg(1104905003)
				local var_15_3 = arg_12_1:FormatText(var_15_2.content)

				arg_12_1.text_.text = var_15_3

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_4 = 33
				local var_15_5 = utf8.len(var_15_3)
				local var_15_6 = var_15_4 <= 0 and var_15_1 or var_15_1 * (var_15_5 / var_15_4)

				if var_15_6 > 0 and var_15_1 < var_15_6 then
					arg_12_1.talkMaxDuration = var_15_6

					if var_15_6 + var_15_0 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_6 + var_15_0
					end
				end

				arg_12_1.text_.text = var_15_3
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)
				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_7 = math.max(var_15_1, arg_12_1.talkMaxDuration)

			if var_15_0 <= arg_12_1.time_ and arg_12_1.time_ < var_15_0 + var_15_7 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_0) / var_15_7

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_0 + var_15_7 and arg_12_1.time_ < var_15_0 + var_15_7 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 1104905004
		arg_16_1.duration_ = 2

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play1104905005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = 0
			local var_19_1 = 0.2

			if var_19_0 < arg_16_1.time_ and arg_16_1.time_ <= var_19_0 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_2 = arg_16_1:FormatText(StoryNameCfg[1006].name)

				arg_16_1.leftNameTxt_.text = var_19_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, true)
				arg_16_1.iconController_:SetSelectedState("hero")

				arg_16_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_16_1.callingController_:SetSelectedState("normal")

				arg_16_1.keyicon_.color = Color.New(1, 1, 1)
				arg_16_1.icon_.color = Color.New(1, 1, 1)

				local var_19_3 = arg_16_1:GetWordFromCfg(1104905004)
				local var_19_4 = arg_16_1:FormatText(var_19_3.content)

				arg_16_1.text_.text = var_19_4

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_5 = 8
				local var_19_6 = utf8.len(var_19_4)
				local var_19_7 = var_19_5 <= 0 and var_19_1 or var_19_1 * (var_19_6 / var_19_5)

				if var_19_7 > 0 and var_19_1 < var_19_7 then
					arg_16_1.talkMaxDuration = var_19_7

					if var_19_7 + var_19_0 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_7 + var_19_0
					end
				end

				arg_16_1.text_.text = var_19_4
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905004", "story_v_side_new_1104905.awb") ~= 0 then
					local var_19_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905004", "story_v_side_new_1104905.awb") / 1000

					if var_19_8 + var_19_0 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_8 + var_19_0
					end

					if var_19_3.prefab_name ~= "" and arg_16_1.actors_[var_19_3.prefab_name] ~= nil then
						local var_19_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_16_1.actors_[var_19_3.prefab_name].transform, "story_v_side_new_1104905", "1104905004", "story_v_side_new_1104905.awb")

						arg_16_1:RecordAudio("1104905004", var_19_9)
						arg_16_1:RecordAudio("1104905004", var_19_9)
					else
						arg_16_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905004", "story_v_side_new_1104905.awb")
					end

					arg_16_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905004", "story_v_side_new_1104905.awb")
				end

				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_10 = math.max(var_19_1, arg_16_1.talkMaxDuration)

			if var_19_0 <= arg_16_1.time_ and arg_16_1.time_ < var_19_0 + var_19_10 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_0) / var_19_10

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_0 + var_19_10 and arg_16_1.time_ < var_19_0 + var_19_10 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 1104905005
		arg_20_1.duration_ = 5

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play1104905006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = 0
			local var_23_1 = 1

			if var_23_0 < arg_20_1.time_ and arg_20_1.time_ <= var_23_0 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, false)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_2 = arg_20_1:GetWordFromCfg(1104905005)
				local var_23_3 = arg_20_1:FormatText(var_23_2.content)

				arg_20_1.text_.text = var_23_3

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_4 = 40
				local var_23_5 = utf8.len(var_23_3)
				local var_23_6 = var_23_4 <= 0 and var_23_1 or var_23_1 * (var_23_5 / var_23_4)

				if var_23_6 > 0 and var_23_1 < var_23_6 then
					arg_20_1.talkMaxDuration = var_23_6

					if var_23_6 + var_23_0 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_6 + var_23_0
					end
				end

				arg_20_1.text_.text = var_23_3
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)
				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_7 = math.max(var_23_1, arg_20_1.talkMaxDuration)

			if var_23_0 <= arg_20_1.time_ and arg_20_1.time_ < var_23_0 + var_23_7 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_0) / var_23_7

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_0 + var_23_7 and arg_20_1.time_ < var_23_0 + var_23_7 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 1104905006
		arg_24_1.duration_ = 5

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play1104905007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = 0
			local var_27_1 = 0.25

			if var_27_0 < arg_24_1.time_ and arg_24_1.time_ <= var_27_0 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_2 = arg_24_1:FormatText(StoryNameCfg[7].name)

				arg_24_1.leftNameTxt_.text = var_27_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_3 = arg_24_1:GetWordFromCfg(1104905006)
				local var_27_4 = arg_24_1:FormatText(var_27_3.content)

				arg_24_1.text_.text = var_27_4

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_5 = 10
				local var_27_6 = utf8.len(var_27_4)
				local var_27_7 = var_27_5 <= 0 and var_27_1 or var_27_1 * (var_27_6 / var_27_5)

				if var_27_7 > 0 and var_27_1 < var_27_7 then
					arg_24_1.talkMaxDuration = var_27_7

					if var_27_7 + var_27_0 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_7 + var_27_0
					end
				end

				arg_24_1.text_.text = var_27_4
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)
				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_8 = math.max(var_27_1, arg_24_1.talkMaxDuration)

			if var_27_0 <= arg_24_1.time_ and arg_24_1.time_ < var_27_0 + var_27_8 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_0) / var_27_8

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_0 + var_27_8 and arg_24_1.time_ < var_27_0 + var_27_8 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 1104905007
		arg_28_1.duration_ = 4.07

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play1104905008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = 0
			local var_31_1 = 0.575

			if var_31_0 < arg_28_1.time_ and arg_28_1.time_ <= var_31_0 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_2 = arg_28_1:FormatText(StoryNameCfg[1006].name)

				arg_28_1.leftNameTxt_.text = var_31_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, true)
				arg_28_1.iconController_:SetSelectedState("hero")

				arg_28_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_28_1.callingController_:SetSelectedState("normal")

				arg_28_1.keyicon_.color = Color.New(1, 1, 1)
				arg_28_1.icon_.color = Color.New(1, 1, 1)

				local var_31_3 = arg_28_1:GetWordFromCfg(1104905007)
				local var_31_4 = arg_28_1:FormatText(var_31_3.content)

				arg_28_1.text_.text = var_31_4

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905007", "story_v_side_new_1104905.awb") ~= 0 then
					local var_31_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905007", "story_v_side_new_1104905.awb") / 1000

					if var_31_8 + var_31_0 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_8 + var_31_0
					end

					if var_31_3.prefab_name ~= "" and arg_28_1.actors_[var_31_3.prefab_name] ~= nil then
						local var_31_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_28_1.actors_[var_31_3.prefab_name].transform, "story_v_side_new_1104905", "1104905007", "story_v_side_new_1104905.awb")

						arg_28_1:RecordAudio("1104905007", var_31_9)
						arg_28_1:RecordAudio("1104905007", var_31_9)
					else
						arg_28_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905007", "story_v_side_new_1104905.awb")
					end

					arg_28_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905007", "story_v_side_new_1104905.awb")
				end

				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_10 = math.max(var_31_1, arg_28_1.talkMaxDuration)

			if var_31_0 <= arg_28_1.time_ and arg_28_1.time_ < var_31_0 + var_31_10 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_0) / var_31_10

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_0 + var_31_10 and arg_28_1.time_ < var_31_0 + var_31_10 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 1104905008
		arg_32_1.duration_ = 5

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play1104905009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = 0
			local var_35_1 = 0.225

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

				local var_35_3 = arg_32_1:GetWordFromCfg(1104905008)
				local var_35_4 = arg_32_1:FormatText(var_35_3.content)

				arg_32_1.text_.text = var_35_4

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_5 = 9
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
	Play1104905009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 1104905009
		arg_36_1.duration_ = 9

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play1104905010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = "ST12"

			if arg_36_1.bgs_[var_39_0] == nil then
				local var_39_1 = Object.Instantiate(arg_36_1.paintGo_)

				var_39_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_39_0)
				var_39_1.name = var_39_0
				var_39_1.transform.parent = arg_36_1.stage_.transform
				var_39_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_36_1.bgs_[var_39_0] = var_39_1
			end

			local var_39_2 = 2

			if var_39_2 < arg_36_1.time_ and arg_36_1.time_ <= var_39_2 + arg_39_0 then
				local var_39_3 = manager.ui.mainCamera.transform.localPosition
				local var_39_4 = Vector3.New(0, 0, 10) + Vector3.New(var_39_3.x, var_39_3.y, 0)
				local var_39_5 = arg_36_1.bgs_.ST12

				var_39_5.transform.localPosition = var_39_4
				var_39_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_39_6 = var_39_5:GetComponent("SpriteRenderer")

				if var_39_6 and var_39_6.sprite then
					local var_39_7 = (var_39_5.transform.localPosition - var_39_3).z
					local var_39_8 = manager.ui.mainCameraCom_
					local var_39_9 = 2 * var_39_7 * Mathf.Tan(var_39_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_39_10 = var_39_9 * var_39_8.aspect
					local var_39_11 = var_39_6.sprite.bounds.size.x
					local var_39_12 = var_39_6.sprite.bounds.size.y
					local var_39_13 = var_39_10 / var_39_11
					local var_39_14 = var_39_9 / var_39_12
					local var_39_15 = var_39_14 < var_39_13 and var_39_13 or var_39_14

					var_39_5.transform.localScale = Vector3.New(var_39_15, var_39_15, 0)
				end

				for iter_39_0, iter_39_1 in pairs(arg_36_1.bgs_) do
					if iter_39_0 ~= "ST12" then
						iter_39_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_39_16 = 4

			if var_39_16 < arg_36_1.time_ and arg_36_1.time_ <= var_39_16 + arg_39_0 then
				arg_36_1.allBtn_.enabled = false
			end

			local var_39_17 = 0.3

			if arg_36_1.time_ >= var_39_16 + var_39_17 and arg_36_1.time_ < var_39_16 + var_39_17 + arg_39_0 then
				arg_36_1.allBtn_.enabled = true
			end

			local var_39_18 = 0

			if var_39_18 < arg_36_1.time_ and arg_36_1.time_ <= var_39_18 + arg_39_0 then
				arg_36_1.mask_.enabled = true
				arg_36_1.mask_.raycastTarget = true

				arg_36_1:SetGaussion(false)
			end

			local var_39_19 = 2

			if var_39_18 <= arg_36_1.time_ and arg_36_1.time_ < var_39_18 + var_39_19 then
				local var_39_20 = (arg_36_1.time_ - var_39_18) / var_39_19
				local var_39_21 = Color.New(0, 0, 0)

				var_39_21.a = Mathf.Lerp(0, 1, var_39_20)
				arg_36_1.mask_.color = var_39_21
			end

			if arg_36_1.time_ >= var_39_18 + var_39_19 and arg_36_1.time_ < var_39_18 + var_39_19 + arg_39_0 then
				local var_39_22 = Color.New(0, 0, 0)

				var_39_22.a = 1
				arg_36_1.mask_.color = var_39_22
			end

			local var_39_23 = 2

			if var_39_23 < arg_36_1.time_ and arg_36_1.time_ <= var_39_23 + arg_39_0 then
				arg_36_1.mask_.enabled = true
				arg_36_1.mask_.raycastTarget = true

				arg_36_1:SetGaussion(false)
			end

			local var_39_24 = 2

			if var_39_23 <= arg_36_1.time_ and arg_36_1.time_ < var_39_23 + var_39_24 then
				local var_39_25 = (arg_36_1.time_ - var_39_23) / var_39_24
				local var_39_26 = Color.New(0, 0, 0)

				var_39_26.a = Mathf.Lerp(1, 0, var_39_25)
				arg_36_1.mask_.color = var_39_26
			end

			if arg_36_1.time_ >= var_39_23 + var_39_24 and arg_36_1.time_ < var_39_23 + var_39_24 + arg_39_0 then
				local var_39_27 = Color.New(0, 0, 0)
				local var_39_28 = 0

				arg_36_1.mask_.enabled = false
				var_39_27.a = var_39_28
				arg_36_1.mask_.color = var_39_27
			end

			local var_39_29 = 1.53333333333333
			local var_39_30 = 1

			if var_39_29 < arg_36_1.time_ and arg_36_1.time_ <= var_39_29 + arg_39_0 then
				local var_39_31 = "play"
				local var_39_32 = "effect"

				arg_36_1:AudioAction(var_39_31, var_39_32, "se_story_side_1020", "se_story_side_1020_amb_office", "")
			end

			local var_39_33 = 0.125
			local var_39_34 = 1

			if var_39_33 < arg_36_1.time_ and arg_36_1.time_ <= var_39_33 + arg_39_0 then
				local var_39_35 = "stop"
				local var_39_36 = "effect"

				arg_36_1:AudioAction(var_39_35, var_39_36, "se_story_side_1049", "se_story_side_1049_crowdloop", "")
			end

			local var_39_37 = 0.125
			local var_39_38 = 1

			if var_39_37 < arg_36_1.time_ and arg_36_1.time_ <= var_39_37 + arg_39_0 then
				local var_39_39 = "stop"
				local var_39_40 = "effect"

				arg_36_1:AudioAction(var_39_39, var_39_40, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			if arg_36_1.frameCnt_ <= 1 then
				arg_36_1.dialog_:SetActive(false)
			end

			local var_39_41 = 4
			local var_39_42 = 1.2

			if var_39_41 < arg_36_1.time_ and arg_36_1.time_ <= var_39_41 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0

				arg_36_1.dialog_:SetActive(true)

				local var_39_43 = LeanTween.value(arg_36_1.dialog_, 0, 1, 0.3)

				var_39_43:setOnUpdate(LuaHelper.FloatAction(function(arg_40_0)
					arg_36_1.dialogCg_.alpha = arg_40_0
				end))
				var_39_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_36_1.dialog_)
					var_39_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_36_1.duration_ = arg_36_1.duration_ + 0.3

				SetActive(arg_36_1.leftNameGo_, false)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_44 = arg_36_1:GetWordFromCfg(1104905009)
				local var_39_45 = arg_36_1:FormatText(var_39_44.content)

				arg_36_1.text_.text = var_39_45

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_46 = 48
				local var_39_47 = utf8.len(var_39_45)
				local var_39_48 = var_39_46 <= 0 and var_39_42 or var_39_42 * (var_39_47 / var_39_46)

				if var_39_48 > 0 and var_39_42 < var_39_48 then
					arg_36_1.talkMaxDuration = var_39_48
					var_39_41 = var_39_41 + 0.3

					if var_39_48 + var_39_41 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_48 + var_39_41
					end
				end

				arg_36_1.text_.text = var_39_45
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)
				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_49 = var_39_41 + 0.3
			local var_39_50 = math.max(var_39_42, arg_36_1.talkMaxDuration)

			if var_39_49 <= arg_36_1.time_ and arg_36_1.time_ < var_39_49 + var_39_50 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_49) / var_39_50

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_49 + var_39_50 and arg_36_1.time_ < var_39_49 + var_39_50 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905010 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 1104905010
		arg_42_1.duration_ = 5

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play1104905011(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = 0
			local var_45_1 = 0.15

			if var_45_0 < arg_42_1.time_ and arg_42_1.time_ <= var_45_0 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0
				arg_42_1.dialogCg_.alpha = 1

				arg_42_1.dialog_:SetActive(true)
				SetActive(arg_42_1.leftNameGo_, true)

				local var_45_2 = arg_42_1:FormatText(StoryNameCfg[7].name)

				arg_42_1.leftNameTxt_.text = var_45_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_42_1.leftNameTxt_.transform)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1.leftNameTxt_.text)
				SetActive(arg_42_1.iconTrs_.gameObject, false)
				arg_42_1.callingController_:SetSelectedState("normal")

				local var_45_3 = arg_42_1:GetWordFromCfg(1104905010)
				local var_45_4 = arg_42_1:FormatText(var_45_3.content)

				arg_42_1.text_.text = var_45_4

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_5 = 6
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
				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_8 = math.max(var_45_1, arg_42_1.talkMaxDuration)

			if var_45_0 <= arg_42_1.time_ and arg_42_1.time_ < var_45_0 + var_45_8 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_0) / var_45_8

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_0 + var_45_8 and arg_42_1.time_ < var_45_0 + var_45_8 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905011 = function(arg_46_0, arg_46_1)
		arg_46_1.time_ = 0
		arg_46_1.frameCnt_ = 0
		arg_46_1.state_ = "playing"
		arg_46_1.curTalkId_ = 1104905011
		arg_46_1.duration_ = 5

		SetActive(arg_46_1.tipsGo_, false)

		function arg_46_1.onSingleLineFinish_()
			arg_46_1.onSingleLineUpdate_ = nil
			arg_46_1.onSingleLineFinish_ = nil
			arg_46_1.state_ = "waiting"
		end

		function arg_46_1.playNext_(arg_48_0)
			if arg_48_0 == 1 then
				arg_46_0:Play1104905012(arg_46_1)
			end
		end

		function arg_46_1.onSingleLineUpdate_(arg_49_0)
			local var_49_0 = 0
			local var_49_1 = 1.05

			if var_49_0 < arg_46_1.time_ and arg_46_1.time_ <= var_49_0 + arg_49_0 then
				arg_46_1.talkMaxDuration = 0
				arg_46_1.dialogCg_.alpha = 1

				arg_46_1.dialog_:SetActive(true)
				SetActive(arg_46_1.leftNameGo_, false)

				arg_46_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_46_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_46_1:RecordName(arg_46_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_46_1.iconTrs_.gameObject, false)
				arg_46_1.callingController_:SetSelectedState("normal")

				local var_49_2 = arg_46_1:GetWordFromCfg(1104905011)
				local var_49_3 = arg_46_1:FormatText(var_49_2.content)

				arg_46_1.text_.text = var_49_3

				LuaForUtil.ClearLinePrefixSymbol(arg_46_1.text_)

				local var_49_4 = 42
				local var_49_5 = utf8.len(var_49_3)
				local var_49_6 = var_49_4 <= 0 and var_49_1 or var_49_1 * (var_49_5 / var_49_4)

				if var_49_6 > 0 and var_49_1 < var_49_6 then
					arg_46_1.talkMaxDuration = var_49_6

					if var_49_6 + var_49_0 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_6 + var_49_0
					end
				end

				arg_46_1.text_.text = var_49_3
				arg_46_1.typewritter.percent = 0

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(false)
				arg_46_1:RecordContent(arg_46_1.text_.text)
			end

			local var_49_7 = math.max(var_49_1, arg_46_1.talkMaxDuration)

			if var_49_0 <= arg_46_1.time_ and arg_46_1.time_ < var_49_0 + var_49_7 then
				arg_46_1.typewritter.percent = (arg_46_1.time_ - var_49_0) / var_49_7

				arg_46_1.typewritter:SetDirty()
			end

			if arg_46_1.time_ >= var_49_0 + var_49_7 and arg_46_1.time_ < var_49_0 + var_49_7 + arg_49_0 then
				arg_46_1.typewritter.percent = 1

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905012 = function(arg_50_0, arg_50_1)
		arg_50_1.time_ = 0
		arg_50_1.frameCnt_ = 0
		arg_50_1.state_ = "playing"
		arg_50_1.curTalkId_ = 1104905012
		arg_50_1.duration_ = 4

		SetActive(arg_50_1.tipsGo_, false)

		function arg_50_1.onSingleLineFinish_()
			arg_50_1.onSingleLineUpdate_ = nil
			arg_50_1.onSingleLineFinish_ = nil
			arg_50_1.state_ = "waiting"
		end

		function arg_50_1.playNext_(arg_52_0)
			if arg_52_0 == 1 then
				arg_50_0:Play1104905013(arg_50_1)
			end
		end

		function arg_50_1.onSingleLineUpdate_(arg_53_0)
			local var_53_0 = 0

			if var_53_0 < arg_50_1.time_ and arg_50_1.time_ <= var_53_0 + arg_53_0 then
				arg_50_1.mask_.enabled = true
				arg_50_1.mask_.raycastTarget = true

				arg_50_1:SetGaussion(false)
			end

			local var_53_1 = 2

			if var_53_0 <= arg_50_1.time_ and arg_50_1.time_ < var_53_0 + var_53_1 then
				local var_53_2 = (arg_50_1.time_ - var_53_0) / var_53_1
				local var_53_3 = Color.New(0, 0, 0)

				var_53_3.a = Mathf.Lerp(0, 1, var_53_2)
				arg_50_1.mask_.color = var_53_3
			end

			if arg_50_1.time_ >= var_53_0 + var_53_1 and arg_50_1.time_ < var_53_0 + var_53_1 + arg_53_0 then
				local var_53_4 = Color.New(0, 0, 0)

				var_53_4.a = 1
				arg_50_1.mask_.color = var_53_4
			end

			local var_53_5 = 2

			if var_53_5 < arg_50_1.time_ and arg_50_1.time_ <= var_53_5 + arg_53_0 then
				arg_50_1.mask_.enabled = true
				arg_50_1.mask_.raycastTarget = true

				arg_50_1:SetGaussion(false)
			end

			local var_53_6 = 2

			if var_53_5 <= arg_50_1.time_ and arg_50_1.time_ < var_53_5 + var_53_6 then
				local var_53_7 = (arg_50_1.time_ - var_53_5) / var_53_6
				local var_53_8 = Color.New(0, 0, 0)

				var_53_8.a = Mathf.Lerp(1, 0, var_53_7)
				arg_50_1.mask_.color = var_53_8
			end

			if arg_50_1.time_ >= var_53_5 + var_53_6 and arg_50_1.time_ < var_53_5 + var_53_6 + arg_53_0 then
				local var_53_9 = Color.New(0, 0, 0)
				local var_53_10 = 0

				arg_50_1.mask_.enabled = false
				var_53_9.a = var_53_10
				arg_50_1.mask_.color = var_53_9
			end

			local var_53_11 = 1.93333333333333

			if var_53_11 < arg_50_1.time_ and arg_50_1.time_ <= var_53_11 + arg_53_0 then
				arg_50_1.fswbg_:SetActive(true)
				arg_50_1.dialog_:SetActive(false)

				arg_50_1.fswtw_.percent = 0

				local var_53_12 = arg_50_1:GetWordFromCfg(1104905012)
				local var_53_13 = arg_50_1:FormatText(var_53_12.content)

				arg_50_1.fswt_.text = var_53_13

				LuaForUtil.ClearLinePrefixSymbol(arg_50_1.fswt_)

				arg_50_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_50_1.fswtw_:SetDirty()

				arg_50_1.typewritterCharCountI18N = 0
				arg_50_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_50_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, true)
				arg_50_1:ShowNextGo(false)
			end

			local var_53_14 = 2

			if var_53_14 < arg_50_1.time_ and arg_50_1.time_ <= var_53_14 + arg_53_0 then
				arg_50_1.var_.oldValueTypewriter = arg_50_1.fswtw_.percent
				arg_50_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_50_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, true)
				arg_50_1:ShowNextGo(false)
			end

			local var_53_15 = 11
			local var_53_16 = 0.733333333333333
			local var_53_17 = arg_50_1:GetWordFromCfg(1104905012)
			local var_53_18 = arg_50_1:FormatText(var_53_17.content)
			local var_53_19, var_53_20 = arg_50_1:GetPercentByPara(var_53_18, 1)

			if var_53_14 < arg_50_1.time_ and arg_50_1.time_ <= var_53_14 + arg_53_0 then
				arg_50_1.talkMaxDuration = 0

				local var_53_21 = var_53_15 <= 0 and var_53_16 or var_53_16 * ((var_53_20 - arg_50_1.typewritterCharCountI18N) / var_53_15)

				if var_53_21 > 0 and var_53_16 < var_53_21 then
					arg_50_1.talkMaxDuration = var_53_21

					if var_53_21 + var_53_14 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_21 + var_53_14
					end
				end
			end

			local var_53_22 = 0.733333333333333
			local var_53_23 = math.max(var_53_22, arg_50_1.talkMaxDuration)

			if var_53_14 <= arg_50_1.time_ and arg_50_1.time_ < var_53_14 + var_53_23 then
				local var_53_24 = (arg_50_1.time_ - var_53_14) / var_53_23

				arg_50_1.fswtw_.percent = Mathf.Lerp(arg_50_1.var_.oldValueTypewriter, var_53_19, var_53_24)
				arg_50_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_50_1.fswtw_:SetDirty()
			end

			if arg_50_1.time_ >= var_53_14 + var_53_23 and arg_50_1.time_ < var_53_14 + var_53_23 + arg_53_0 then
				arg_50_1.fswtw_.percent = var_53_19

				arg_50_1.fswtw_:SetDirty()
				arg_50_1:ShowNextGo(true)

				arg_50_1.typewritterCharCountI18N = var_53_20
			end

			local var_53_25 = "STblack"

			if arg_50_1.bgs_[var_53_25] == nil then
				local var_53_26 = Object.Instantiate(arg_50_1.paintGo_)

				var_53_26:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_53_25)
				var_53_26.name = var_53_25
				var_53_26.transform.parent = arg_50_1.stage_.transform
				var_53_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_50_1.bgs_[var_53_25] = var_53_26
			end

			local var_53_27 = 2

			if var_53_27 < arg_50_1.time_ and arg_50_1.time_ <= var_53_27 + arg_53_0 then
				local var_53_28 = manager.ui.mainCamera.transform.localPosition
				local var_53_29 = Vector3.New(0, 0, 10) + Vector3.New(var_53_28.x, var_53_28.y, 0)
				local var_53_30 = arg_50_1.bgs_.STblack

				var_53_30.transform.localPosition = var_53_29
				var_53_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_53_31 = var_53_30:GetComponent("SpriteRenderer")

				if var_53_31 and var_53_31.sprite then
					local var_53_32 = (var_53_30.transform.localPosition - var_53_28).z
					local var_53_33 = manager.ui.mainCameraCom_
					local var_53_34 = 2 * var_53_32 * Mathf.Tan(var_53_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_53_35 = var_53_34 * var_53_33.aspect
					local var_53_36 = var_53_31.sprite.bounds.size.x
					local var_53_37 = var_53_31.sprite.bounds.size.y
					local var_53_38 = var_53_35 / var_53_36
					local var_53_39 = var_53_34 / var_53_37
					local var_53_40 = var_53_39 < var_53_38 and var_53_38 or var_53_39

					var_53_30.transform.localScale = Vector3.New(var_53_40, var_53_40, 0)
				end

				for iter_53_0, iter_53_1 in pairs(arg_50_1.bgs_) do
					if iter_53_0 ~= "STblack" then
						iter_53_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_53_41 = 2

			if var_53_41 < arg_50_1.time_ and arg_50_1.time_ <= var_53_41 + arg_53_0 then
				local var_53_42 = arg_50_1.fswbg_.transform:Find("textbox/adapt/content") or arg_50_1.fswbg_.transform:Find("textbox/content")

				arg_50_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				local var_53_43 = var_53_42:GetComponent("Text")
				local var_53_44 = var_53_42:GetComponent("RectTransform")

				var_53_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_53_44.offsetMin = Vector2.New(0, 0)
				var_53_44.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play1104905013 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 1104905013
		arg_54_1.duration_ = 8.8

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play1104905014(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = 0

			if var_57_0 < arg_54_1.time_ and arg_54_1.time_ <= var_57_0 + arg_57_0 then
				arg_54_1.mask_.enabled = true
				arg_54_1.mask_.raycastTarget = true

				arg_54_1:SetGaussion(false)
			end

			local var_57_1 = 2

			if var_57_0 <= arg_54_1.time_ and arg_54_1.time_ < var_57_0 + var_57_1 then
				local var_57_2 = (arg_54_1.time_ - var_57_0) / var_57_1
				local var_57_3 = Color.New(0, 0, 0)

				var_57_3.a = Mathf.Lerp(0, 1, var_57_2)
				arg_54_1.mask_.color = var_57_3
			end

			if arg_54_1.time_ >= var_57_0 + var_57_1 and arg_54_1.time_ < var_57_0 + var_57_1 + arg_57_0 then
				local var_57_4 = Color.New(0, 0, 0)

				var_57_4.a = 1
				arg_54_1.mask_.color = var_57_4
			end

			local var_57_5 = 2

			if var_57_5 < arg_54_1.time_ and arg_54_1.time_ <= var_57_5 + arg_57_0 then
				arg_54_1.mask_.enabled = true
				arg_54_1.mask_.raycastTarget = true

				arg_54_1:SetGaussion(false)
			end

			local var_57_6 = 2

			if var_57_5 <= arg_54_1.time_ and arg_54_1.time_ < var_57_5 + var_57_6 then
				local var_57_7 = (arg_54_1.time_ - var_57_5) / var_57_6
				local var_57_8 = Color.New(0, 0, 0)

				var_57_8.a = Mathf.Lerp(1, 0, var_57_7)
				arg_54_1.mask_.color = var_57_8
			end

			if arg_54_1.time_ >= var_57_5 + var_57_6 and arg_54_1.time_ < var_57_5 + var_57_6 + arg_57_0 then
				local var_57_9 = Color.New(0, 0, 0)
				local var_57_10 = 0

				arg_54_1.mask_.enabled = false
				var_57_9.a = var_57_10
				arg_54_1.mask_.color = var_57_9
			end

			local var_57_11 = 2

			if var_57_11 < arg_54_1.time_ and arg_54_1.time_ <= var_57_11 + arg_57_0 then
				local var_57_12 = manager.ui.mainCamera.transform.localPosition
				local var_57_13 = Vector3.New(0, 0, 10) + Vector3.New(var_57_12.x, var_57_12.y, 0)
				local var_57_14 = arg_54_1.bgs_.ST12

				var_57_14.transform.localPosition = var_57_13
				var_57_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_57_15 = var_57_14:GetComponent("SpriteRenderer")

				if var_57_15 and var_57_15.sprite then
					local var_57_16 = (var_57_14.transform.localPosition - var_57_12).z
					local var_57_17 = manager.ui.mainCameraCom_
					local var_57_18 = 2 * var_57_16 * Mathf.Tan(var_57_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_57_19 = var_57_18 * var_57_17.aspect
					local var_57_20 = var_57_15.sprite.bounds.size.x
					local var_57_21 = var_57_15.sprite.bounds.size.y
					local var_57_22 = var_57_19 / var_57_20
					local var_57_23 = var_57_18 / var_57_21
					local var_57_24 = var_57_23 < var_57_22 and var_57_22 or var_57_23

					var_57_14.transform.localScale = Vector3.New(var_57_24, var_57_24, 0)
				end

				for iter_57_0, iter_57_1 in pairs(arg_54_1.bgs_) do
					if iter_57_0 ~= "ST12" then
						iter_57_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_57_25 = 2

			if var_57_25 < arg_54_1.time_ and arg_54_1.time_ <= var_57_25 + arg_57_0 then
				arg_54_1.fswbg_:SetActive(false)
				arg_54_1.dialog_:SetActive(false)

				arg_54_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_54_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, true)
				arg_54_1:ShowNextGo(false)
			end

			if arg_54_1.frameCnt_ <= 1 then
				arg_54_1.dialog_:SetActive(false)
			end

			local var_57_26 = 3.8
			local var_57_27 = 0.925

			if var_57_26 < arg_54_1.time_ and arg_54_1.time_ <= var_57_26 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0

				arg_54_1.dialog_:SetActive(true)

				local var_57_28 = LeanTween.value(arg_54_1.dialog_, 0, 1, 0.3)

				var_57_28:setOnUpdate(LuaHelper.FloatAction(function(arg_58_0)
					arg_54_1.dialogCg_.alpha = arg_58_0
				end))
				var_57_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_54_1.dialog_)
					var_57_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_54_1.duration_ = arg_54_1.duration_ + 0.3

				SetActive(arg_54_1.leftNameGo_, true)

				local var_57_29 = arg_54_1:FormatText(StoryNameCfg[7].name)

				arg_54_1.leftNameTxt_.text = var_57_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_54_1.leftNameTxt_.transform)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1.leftNameTxt_.text)
				SetActive(arg_54_1.iconTrs_.gameObject, false)
				arg_54_1.callingController_:SetSelectedState("normal")

				local var_57_30 = arg_54_1:GetWordFromCfg(1104905013)
				local var_57_31 = arg_54_1:FormatText(var_57_30.content)

				arg_54_1.text_.text = var_57_31

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_32 = 37
				local var_57_33 = utf8.len(var_57_31)
				local var_57_34 = var_57_32 <= 0 and var_57_27 or var_57_27 * (var_57_33 / var_57_32)

				if var_57_34 > 0 and var_57_27 < var_57_34 then
					arg_54_1.talkMaxDuration = var_57_34
					var_57_26 = var_57_26 + 0.3

					if var_57_34 + var_57_26 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_34 + var_57_26
					end
				end

				arg_54_1.text_.text = var_57_31
				arg_54_1.typewritter.percent = 0

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(false)
				arg_54_1:RecordContent(arg_54_1.text_.text)
			end

			local var_57_35 = var_57_26 + 0.3
			local var_57_36 = math.max(var_57_27, arg_54_1.talkMaxDuration)

			if var_57_35 <= arg_54_1.time_ and arg_54_1.time_ < var_57_35 + var_57_36 then
				arg_54_1.typewritter.percent = (arg_54_1.time_ - var_57_35) / var_57_36

				arg_54_1.typewritter:SetDirty()
			end

			if arg_54_1.time_ >= var_57_35 + var_57_36 and arg_54_1.time_ < var_57_35 + var_57_36 + arg_57_0 then
				arg_54_1.typewritter.percent = 1

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905014 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 1104905014
		arg_60_1.duration_ = 5

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play1104905015(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = 0
			local var_63_1 = 0.1

			if var_63_0 < arg_60_1.time_ and arg_60_1.time_ <= var_63_0 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, true)

				local var_63_2 = arg_60_1:FormatText(StoryNameCfg[7].name)

				arg_60_1.leftNameTxt_.text = var_63_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_60_1.leftNameTxt_.transform)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1.leftNameTxt_.text)
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_3 = arg_60_1:GetWordFromCfg(1104905014)
				local var_63_4 = arg_60_1:FormatText(var_63_3.content)

				arg_60_1.text_.text = var_63_4

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_5 = 4
				local var_63_6 = utf8.len(var_63_4)
				local var_63_7 = var_63_5 <= 0 and var_63_1 or var_63_1 * (var_63_6 / var_63_5)

				if var_63_7 > 0 and var_63_1 < var_63_7 then
					arg_60_1.talkMaxDuration = var_63_7

					if var_63_7 + var_63_0 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_7 + var_63_0
					end
				end

				arg_60_1.text_.text = var_63_4
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)
				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_8 = math.max(var_63_1, arg_60_1.talkMaxDuration)

			if var_63_0 <= arg_60_1.time_ and arg_60_1.time_ < var_63_0 + var_63_8 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_0) / var_63_8

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_0 + var_63_8 and arg_60_1.time_ < var_63_0 + var_63_8 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905015 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 1104905015
		arg_64_1.duration_ = 5

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
		end

		function arg_64_1.playNext_(arg_66_0)
			if arg_66_0 == 1 then
				arg_64_0:Play1104905016(arg_64_1)
			end
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = 0
			local var_67_1 = 0.2

			if var_67_0 < arg_64_1.time_ and arg_64_1.time_ <= var_67_0 + arg_67_0 then
				local var_67_2 = "play"
				local var_67_3 = "music"

				arg_64_1:AudioAction(var_67_2, var_67_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_67_4 = ""
				local var_67_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_67_5 ~= "" then
					if arg_64_1.bgmTxt_.text ~= var_67_5 and arg_64_1.bgmTxt_.text ~= "" then
						if arg_64_1.bgmTxt2_.text ~= "" then
							arg_64_1.bgmTxt_.text = arg_64_1.bgmTxt2_.text
						end

						arg_64_1.bgmTxt2_.text = var_67_5

						arg_64_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_64_1.bgmTxt_.text = var_67_5
					end

					if arg_64_1.bgmTimer then
						arg_64_1.bgmTimer:Stop()

						arg_64_1.bgmTimer = nil
					end

					if arg_64_1.settingData.show_music_name == 1 then
						arg_64_1.musicController:SetSelectedState("show")
						arg_64_1.musicAnimator_:Play("open", 0, 0)

						if arg_64_1.settingData.music_time ~= 0 then
							arg_64_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_64_1.settingData.music_time), function()
								if arg_64_1 == nil or isNil(arg_64_1.bgmTxt_) then
									return
								end

								arg_64_1.musicController:SetSelectedState("hide")
								arg_64_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_67_6 = 0
			local var_67_7 = 0.65

			if var_67_6 < arg_64_1.time_ and arg_64_1.time_ <= var_67_6 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, false)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_64_1.iconTrs_.gameObject, false)
				arg_64_1.callingController_:SetSelectedState("normal")

				local var_67_8 = arg_64_1:GetWordFromCfg(1104905015)
				local var_67_9 = arg_64_1:FormatText(var_67_8.content)

				arg_64_1.text_.text = var_67_9

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_10 = 26
				local var_67_11 = utf8.len(var_67_9)
				local var_67_12 = var_67_10 <= 0 and var_67_7 or var_67_7 * (var_67_11 / var_67_10)

				if var_67_12 > 0 and var_67_7 < var_67_12 then
					arg_64_1.talkMaxDuration = var_67_12

					if var_67_12 + var_67_6 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_12 + var_67_6
					end
				end

				arg_64_1.text_.text = var_67_9
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)
				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_13 = math.max(var_67_7, arg_64_1.talkMaxDuration)

			if var_67_6 <= arg_64_1.time_ and arg_64_1.time_ < var_67_6 + var_67_13 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_6) / var_67_13

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_6 + var_67_13 and arg_64_1.time_ < var_67_6 + var_67_13 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1104905016
		arg_69_1.duration_ = 9

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play1104905017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "K11g"

			if arg_69_1.bgs_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(arg_69_1.paintGo_)

				var_72_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_72_0)
				var_72_1.name = var_72_0
				var_72_1.transform.parent = arg_69_1.stage_.transform
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.bgs_[var_72_0] = var_72_1
			end

			local var_72_2 = 2

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 then
				local var_72_3 = manager.ui.mainCamera.transform.localPosition
				local var_72_4 = Vector3.New(0, 0, 10) + Vector3.New(var_72_3.x, var_72_3.y, 0)
				local var_72_5 = arg_69_1.bgs_.K11g

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
					if iter_72_0 ~= "K11g" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_16 = 4

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.allBtn_.enabled = false
			end

			local var_72_17 = 0.3

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 then
				arg_69_1.allBtn_.enabled = true
			end

			local var_72_18 = 0

			if var_72_18 < arg_69_1.time_ and arg_69_1.time_ <= var_72_18 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_19 = 2

			if var_72_18 <= arg_69_1.time_ and arg_69_1.time_ < var_72_18 + var_72_19 then
				local var_72_20 = (arg_69_1.time_ - var_72_18) / var_72_19
				local var_72_21 = Color.New(0, 0, 0)

				var_72_21.a = Mathf.Lerp(0, 1, var_72_20)
				arg_69_1.mask_.color = var_72_21
			end

			if arg_69_1.time_ >= var_72_18 + var_72_19 and arg_69_1.time_ < var_72_18 + var_72_19 + arg_72_0 then
				local var_72_22 = Color.New(0, 0, 0)

				var_72_22.a = 1
				arg_69_1.mask_.color = var_72_22
			end

			local var_72_23 = 2

			if var_72_23 < arg_69_1.time_ and arg_69_1.time_ <= var_72_23 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_24 = 2

			if var_72_23 <= arg_69_1.time_ and arg_69_1.time_ < var_72_23 + var_72_24 then
				local var_72_25 = (arg_69_1.time_ - var_72_23) / var_72_24
				local var_72_26 = Color.New(0, 0, 0)

				var_72_26.a = Mathf.Lerp(1, 0, var_72_25)
				arg_69_1.mask_.color = var_72_26
			end

			if arg_69_1.time_ >= var_72_23 + var_72_24 and arg_69_1.time_ < var_72_23 + var_72_24 + arg_72_0 then
				local var_72_27 = Color.New(0, 0, 0)
				local var_72_28 = 0

				arg_69_1.mask_.enabled = false
				var_72_27.a = var_72_28
				arg_69_1.mask_.color = var_72_27
			end

			local var_72_29 = 0.125
			local var_72_30 = 1

			if var_72_29 < arg_69_1.time_ and arg_69_1.time_ <= var_72_29 + arg_72_0 then
				local var_72_31 = "stop"
				local var_72_32 = "effect"

				arg_69_1:AudioAction(var_72_31, var_72_32, "se_story_side_1020", "se_story_side_1020_amb_office", "")
			end

			local var_72_33 = 1.56666666666667
			local var_72_34 = 1

			if var_72_33 < arg_69_1.time_ and arg_69_1.time_ <= var_72_33 + arg_72_0 then
				local var_72_35 = "play"
				local var_72_36 = "effect"

				arg_69_1:AudioAction(var_72_35, var_72_36, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			local var_72_37 = 1.56666666666667
			local var_72_38 = 1

			if var_72_37 < arg_69_1.time_ and arg_69_1.time_ <= var_72_37 + arg_72_0 then
				local var_72_39 = "play"
				local var_72_40 = "effect"

				arg_69_1:AudioAction(var_72_39, var_72_40, "se_story_side_1049", "se_story_side_1049_crowdloop", "")
			end

			local var_72_41 = 0
			local var_72_42 = 0.2

			if var_72_41 < arg_69_1.time_ and arg_69_1.time_ <= var_72_41 + arg_72_0 then
				local var_72_43 = "play"
				local var_72_44 = "music"

				arg_69_1:AudioAction(var_72_43, var_72_44, "ui_battle", "ui_battle_stopbgm", "")

				local var_72_45 = ""
				local var_72_46 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_72_46 ~= "" then
					if arg_69_1.bgmTxt_.text ~= var_72_46 and arg_69_1.bgmTxt_.text ~= "" then
						if arg_69_1.bgmTxt2_.text ~= "" then
							arg_69_1.bgmTxt_.text = arg_69_1.bgmTxt2_.text
						end

						arg_69_1.bgmTxt2_.text = var_72_46

						arg_69_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_69_1.bgmTxt_.text = var_72_46
					end

					if arg_69_1.bgmTimer then
						arg_69_1.bgmTimer:Stop()

						arg_69_1.bgmTimer = nil
					end

					if arg_69_1.settingData.show_music_name == 1 then
						arg_69_1.musicController:SetSelectedState("show")
						arg_69_1.musicAnimator_:Play("open", 0, 0)

						if arg_69_1.settingData.music_time ~= 0 then
							arg_69_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_69_1.settingData.music_time), function()
								if arg_69_1 == nil or isNil(arg_69_1.bgmTxt_) then
									return
								end

								arg_69_1.musicController:SetSelectedState("hide")
								arg_69_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_72_47 = 1.56666666666667
			local var_72_48 = 1

			if var_72_47 < arg_69_1.time_ and arg_69_1.time_ <= var_72_47 + arg_72_0 then
				local var_72_49 = "play"
				local var_72_50 = "music"

				arg_69_1:AudioAction(var_72_49, var_72_50, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden.awb")

				local var_72_51 = ""
				local var_72_52 = manager.audio:GetAudioName("bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden")

				if var_72_52 ~= "" then
					if arg_69_1.bgmTxt_.text ~= var_72_52 and arg_69_1.bgmTxt_.text ~= "" then
						if arg_69_1.bgmTxt2_.text ~= "" then
							arg_69_1.bgmTxt_.text = arg_69_1.bgmTxt2_.text
						end

						arg_69_1.bgmTxt2_.text = var_72_52

						arg_69_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_69_1.bgmTxt_.text = var_72_52
					end

					if arg_69_1.bgmTimer then
						arg_69_1.bgmTimer:Stop()

						arg_69_1.bgmTimer = nil
					end

					if arg_69_1.settingData.show_music_name == 1 then
						arg_69_1.musicController:SetSelectedState("show")
						arg_69_1.musicAnimator_:Play("open", 0, 0)

						if arg_69_1.settingData.music_time ~= 0 then
							arg_69_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_69_1.settingData.music_time), function()
								if arg_69_1 == nil or isNil(arg_69_1.bgmTxt_) then
									return
								end

								arg_69_1.musicController:SetSelectedState("hide")
								arg_69_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_53 = 4
			local var_72_54 = 0.4

			if var_72_53 < arg_69_1.time_ and arg_69_1.time_ <= var_72_53 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_55 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_55:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_69_1.dialogCg_.alpha = arg_75_0
				end))
				var_72_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_56 = arg_69_1:FormatText(StoryNameCfg[7].name)

				arg_69_1.leftNameTxt_.text = var_72_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_57 = arg_69_1:GetWordFromCfg(1104905016)
				local var_72_58 = arg_69_1:FormatText(var_72_57.content)

				arg_69_1.text_.text = var_72_58

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_59 = 16
				local var_72_60 = utf8.len(var_72_58)
				local var_72_61 = var_72_59 <= 0 and var_72_54 or var_72_54 * (var_72_60 / var_72_59)

				if var_72_61 > 0 and var_72_54 < var_72_61 then
					arg_69_1.talkMaxDuration = var_72_61
					var_72_53 = var_72_53 + 0.3

					if var_72_61 + var_72_53 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_61 + var_72_53
					end
				end

				arg_69_1.text_.text = var_72_58
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_62 = var_72_53 + 0.3
			local var_72_63 = math.max(var_72_54, arg_69_1.talkMaxDuration)

			if var_72_62 <= arg_69_1.time_ and arg_69_1.time_ < var_72_62 + var_72_63 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_62) / var_72_63

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_62 + var_72_63 and arg_69_1.time_ < var_72_62 + var_72_63 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905017 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1104905017
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1104905018(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1.6

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_2 = arg_77_1:GetWordFromCfg(1104905017)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 64
				local var_80_5 = utf8.len(var_80_3)
				local var_80_6 = var_80_4 <= 0 and var_80_1 or var_80_1 * (var_80_5 / var_80_4)

				if var_80_6 > 0 and var_80_1 < var_80_6 then
					arg_77_1.talkMaxDuration = var_80_6

					if var_80_6 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_6 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_3
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_7 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_7 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_7

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_7 and arg_77_1.time_ < var_80_0 + var_80_7 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905018 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1104905018
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1104905019(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.65

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_2 = arg_81_1:GetWordFromCfg(1104905018)
				local var_84_3 = arg_81_1:FormatText(var_84_2.content)

				arg_81_1.text_.text = var_84_3

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_4 = 66
				local var_84_5 = utf8.len(var_84_3)
				local var_84_6 = var_84_4 <= 0 and var_84_1 or var_84_1 * (var_84_5 / var_84_4)

				if var_84_6 > 0 and var_84_1 < var_84_6 then
					arg_81_1.talkMaxDuration = var_84_6

					if var_84_6 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_6 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_3
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_7 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_7 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_7

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_7 and arg_81_1.time_ < var_84_0 + var_84_7 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905019 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1104905019
		arg_85_1.duration_ = 2

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1104905020(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = "1049ui_story"

			if arg_85_1.actors_[var_88_0] == nil then
				local var_88_1 = Asset.Load("Char/" .. "1049ui_story")

				if not isNil(var_88_1) then
					local var_88_2 = Object.Instantiate(Asset.Load("Char/" .. "1049ui_story"), arg_85_1.stage_.transform)

					var_88_2.name = var_88_0
					var_88_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_85_1.actors_[var_88_0] = var_88_2

					local var_88_3 = var_88_2:GetComponentInChildren(typeof(CharacterEffect))

					var_88_3.enabled = true

					local var_88_4 = GameObjectTools.GetOrAddComponent(var_88_2, typeof(DynamicBoneHelper))

					if var_88_4 then
						var_88_4:EnableDynamicBone(false)
					end

					arg_85_1:ShowWeapon(var_88_3.transform, false)

					arg_85_1.var_[var_88_0 .. "Animator"] = var_88_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_85_1.var_[var_88_0 .. "Animator"].applyRootMotion = true
					arg_85_1.var_[var_88_0 .. "LipSync"] = var_88_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_88_5 = arg_85_1.actors_["1049ui_story"].transform
			local var_88_6 = 0

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.var_.moveOldPos1049ui_story = var_88_5.localPosition
			end

			local var_88_7 = 0.001

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_7 then
				local var_88_8 = (arg_85_1.time_ - var_88_6) / var_88_7
				local var_88_9 = Vector3.New(0, -1.2, -6)

				var_88_5.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1049ui_story, var_88_9, var_88_8)

				local var_88_10 = manager.ui.mainCamera.transform.position - var_88_5.position

				var_88_5.forward = Vector3.New(var_88_10.x, var_88_10.y, var_88_10.z)

				local var_88_11 = var_88_5.localEulerAngles

				var_88_11.z = 0
				var_88_11.x = 0
				var_88_5.localEulerAngles = var_88_11
			end

			if arg_85_1.time_ >= var_88_6 + var_88_7 and arg_85_1.time_ < var_88_6 + var_88_7 + arg_88_0 then
				var_88_5.localPosition = Vector3.New(0, -1.2, -6)

				local var_88_12 = manager.ui.mainCamera.transform.position - var_88_5.position

				var_88_5.forward = Vector3.New(var_88_12.x, var_88_12.y, var_88_12.z)

				local var_88_13 = var_88_5.localEulerAngles

				var_88_13.z = 0
				var_88_13.x = 0
				var_88_5.localEulerAngles = var_88_13
			end

			local var_88_14 = arg_85_1.actors_["1049ui_story"]
			local var_88_15 = 0

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 and not isNil(var_88_14) and arg_85_1.var_.characterEffect1049ui_story == nil then
				arg_85_1.var_.characterEffect1049ui_story = var_88_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_16 = 0.200000002980232

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_16 and not isNil(var_88_14) then
				local var_88_17 = (arg_85_1.time_ - var_88_15) / var_88_16

				if arg_85_1.var_.characterEffect1049ui_story and not isNil(var_88_14) then
					arg_85_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_15 + var_88_16 and arg_85_1.time_ < var_88_15 + var_88_16 + arg_88_0 and not isNil(var_88_14) and arg_85_1.var_.characterEffect1049ui_story then
				arg_85_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_88_18 = 0

			if var_88_18 < arg_85_1.time_ and arg_85_1.time_ <= var_88_18 + arg_88_0 then
				arg_85_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_88_19 = 0

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva", "EmotionTimelineAnimator")
			end

			local var_88_20 = 0
			local var_88_21 = 0.125

			if var_88_20 < arg_85_1.time_ and arg_85_1.time_ <= var_88_20 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_22 = arg_85_1:FormatText(StoryNameCfg[551].name)

				arg_85_1.leftNameTxt_.text = var_88_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_23 = arg_85_1:GetWordFromCfg(1104905019)
				local var_88_24 = arg_85_1:FormatText(var_88_23.content)

				arg_85_1.text_.text = var_88_24

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_25 = 5
				local var_88_26 = utf8.len(var_88_24)
				local var_88_27 = var_88_25 <= 0 and var_88_21 or var_88_21 * (var_88_26 / var_88_25)

				if var_88_27 > 0 and var_88_21 < var_88_27 then
					arg_85_1.talkMaxDuration = var_88_27

					if var_88_27 + var_88_20 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_27 + var_88_20
					end
				end

				arg_85_1.text_.text = var_88_24
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905019", "story_v_side_new_1104905.awb") ~= 0 then
					local var_88_28 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905019", "story_v_side_new_1104905.awb") / 1000

					if var_88_28 + var_88_20 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_28 + var_88_20
					end

					if var_88_23.prefab_name ~= "" and arg_85_1.actors_[var_88_23.prefab_name] ~= nil then
						local var_88_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_23.prefab_name].transform, "story_v_side_new_1104905", "1104905019", "story_v_side_new_1104905.awb")

						arg_85_1:RecordAudio("1104905019", var_88_29)
						arg_85_1:RecordAudio("1104905019", var_88_29)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905019", "story_v_side_new_1104905.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905019", "story_v_side_new_1104905.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_30 = math.max(var_88_21, arg_85_1.talkMaxDuration)

			if var_88_20 <= arg_85_1.time_ and arg_85_1.time_ < var_88_20 + var_88_30 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_20) / var_88_30

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_20 + var_88_30 and arg_85_1.time_ < var_88_20 + var_88_30 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905020 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1104905020
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1104905021(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1049ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and not isNil(var_92_0) and arg_89_1.var_.characterEffect1049ui_story == nil then
				arg_89_1.var_.characterEffect1049ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 and not isNil(var_92_0) then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1049ui_story and not isNil(var_92_0) then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1049ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and not isNil(var_92_0) and arg_89_1.var_.characterEffect1049ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1049ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 1

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				local var_92_8 = "play"
				local var_92_9 = "effect"

				arg_89_1:AudioAction(var_92_8, var_92_9, "se_story_side_1066", "se_story_1066_walk02", "")
			end

			local var_92_10 = 0
			local var_92_11 = 1.1

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_12 = arg_89_1:GetWordFromCfg(1104905020)
				local var_92_13 = arg_89_1:FormatText(var_92_12.content)

				arg_89_1.text_.text = var_92_13

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_14 = 44
				local var_92_15 = utf8.len(var_92_13)
				local var_92_16 = var_92_14 <= 0 and var_92_11 or var_92_11 * (var_92_15 / var_92_14)

				if var_92_16 > 0 and var_92_11 < var_92_16 then
					arg_89_1.talkMaxDuration = var_92_16

					if var_92_16 + var_92_10 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_16 + var_92_10
					end
				end

				arg_89_1.text_.text = var_92_13
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_17 = math.max(var_92_11, arg_89_1.talkMaxDuration)

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_17 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_10) / var_92_17

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_10 + var_92_17 and arg_89_1.time_ < var_92_10 + var_92_17 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905021 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1104905021
		arg_93_1.duration_ = 4.1

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1104905022(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1049ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and not isNil(var_96_0) and arg_93_1.var_.characterEffect1049ui_story == nil then
				arg_93_1.var_.characterEffect1049ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 and not isNil(var_96_0) then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1049ui_story and not isNil(var_96_0) then
					arg_93_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and not isNil(var_96_0) and arg_93_1.var_.characterEffect1049ui_story then
				arg_93_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_96_4 = 0

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1", "EmotionTimelineAnimator")
			end

			local var_96_6 = 0
			local var_96_7 = 0.2

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[551].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(1104905021)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 8
				local var_96_12 = utf8.len(var_96_10)
				local var_96_13 = var_96_11 <= 0 and var_96_7 or var_96_7 * (var_96_12 / var_96_11)

				if var_96_13 > 0 and var_96_7 < var_96_13 then
					arg_93_1.talkMaxDuration = var_96_13

					if var_96_13 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_13 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_10
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905021", "story_v_side_new_1104905.awb") ~= 0 then
					local var_96_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905021", "story_v_side_new_1104905.awb") / 1000

					if var_96_14 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_14 + var_96_6
					end

					if var_96_9.prefab_name ~= "" and arg_93_1.actors_[var_96_9.prefab_name] ~= nil then
						local var_96_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_9.prefab_name].transform, "story_v_side_new_1104905", "1104905021", "story_v_side_new_1104905.awb")

						arg_93_1:RecordAudio("1104905021", var_96_15)
						arg_93_1:RecordAudio("1104905021", var_96_15)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905021", "story_v_side_new_1104905.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905021", "story_v_side_new_1104905.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_16 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_16 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_16

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_16 and arg_93_1.time_ < var_96_6 + var_96_16 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905022 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1104905022
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1104905023(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1049ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and not isNil(var_100_0) and arg_97_1.var_.characterEffect1049ui_story == nil then
				arg_97_1.var_.characterEffect1049ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 and not isNil(var_100_0) then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1049ui_story and not isNil(var_100_0) then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1049ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and not isNil(var_100_0) and arg_97_1.var_.characterEffect1049ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1049ui_story.fillRatio = var_100_5
			end

			local var_100_6 = 0
			local var_100_7 = 0.2

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[7].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(1104905022)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 8
				local var_100_12 = utf8.len(var_100_10)
				local var_100_13 = var_100_11 <= 0 and var_100_7 or var_100_7 * (var_100_12 / var_100_11)

				if var_100_13 > 0 and var_100_7 < var_100_13 then
					arg_97_1.talkMaxDuration = var_100_13

					if var_100_13 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_10
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_14 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_14 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_14

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_14 and arg_97_1.time_ < var_100_6 + var_100_14 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905023 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1104905023
		arg_101_1.duration_ = 2

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play1104905024(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_104_2 = arg_101_1.actors_["1049ui_story"]
			local var_104_3 = 0

			if var_104_3 < arg_101_1.time_ and arg_101_1.time_ <= var_104_3 + arg_104_0 and not isNil(var_104_2) and arg_101_1.var_.characterEffect1049ui_story == nil then
				arg_101_1.var_.characterEffect1049ui_story = var_104_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_4 = 0.200000002980232

			if var_104_3 <= arg_101_1.time_ and arg_101_1.time_ < var_104_3 + var_104_4 and not isNil(var_104_2) then
				local var_104_5 = (arg_101_1.time_ - var_104_3) / var_104_4

				if arg_101_1.var_.characterEffect1049ui_story and not isNil(var_104_2) then
					arg_101_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_3 + var_104_4 and arg_101_1.time_ < var_104_3 + var_104_4 + arg_104_0 and not isNil(var_104_2) and arg_101_1.var_.characterEffect1049ui_story then
				arg_101_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_104_6 = 0
			local var_104_7 = 0.05

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[1200].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(1104905023)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 2
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905023", "story_v_side_new_1104905.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905023", "story_v_side_new_1104905.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_side_new_1104905", "1104905023", "story_v_side_new_1104905.awb")

						arg_101_1:RecordAudio("1104905023", var_104_15)
						arg_101_1:RecordAudio("1104905023", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905023", "story_v_side_new_1104905.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905023", "story_v_side_new_1104905.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905024 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1104905024
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1104905025(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1049ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and not isNil(var_108_0) and arg_105_1.var_.characterEffect1049ui_story == nil then
				arg_105_1.var_.characterEffect1049ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 and not isNil(var_108_0) then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1049ui_story and not isNil(var_108_0) then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1049ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and not isNil(var_108_0) and arg_105_1.var_.characterEffect1049ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1049ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.275

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[7].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(1104905024)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 11
				local var_108_12 = utf8.len(var_108_10)
				local var_108_13 = var_108_11 <= 0 and var_108_7 or var_108_7 * (var_108_12 / var_108_11)

				if var_108_13 > 0 and var_108_7 < var_108_13 then
					arg_105_1.talkMaxDuration = var_108_13

					if var_108_13 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_10
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_14 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_14 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_14

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_14 and arg_105_1.time_ < var_108_6 + var_108_14 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905025 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1104905025
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1104905026(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0.125
			local var_112_1 = 1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "effect"

				arg_109_1:AudioAction(var_112_2, var_112_3, "se_story_side_1094", "se_story_1094_paper", "")
			end

			local var_112_4 = 0
			local var_112_5 = 1.275

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

				local var_112_6 = arg_109_1:GetWordFromCfg(1104905025)
				local var_112_7 = arg_109_1:FormatText(var_112_6.content)

				arg_109_1.text_.text = var_112_7

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_8 = 51
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
	Play1104905026 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1104905026
		arg_113_1.duration_ = 2

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1104905027(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1049ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and not isNil(var_116_0) and arg_113_1.var_.characterEffect1049ui_story == nil then
				arg_113_1.var_.characterEffect1049ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 and not isNil(var_116_0) then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1049ui_story and not isNil(var_116_0) then
					arg_113_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and not isNil(var_116_0) and arg_113_1.var_.characterEffect1049ui_story then
				arg_113_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_1")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva", "EmotionTimelineAnimator")
			end

			local var_116_6 = 0
			local var_116_7 = 0.125

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[551].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(1104905026)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 5
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905026", "story_v_side_new_1104905.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905026", "story_v_side_new_1104905.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_side_new_1104905", "1104905026", "story_v_side_new_1104905.awb")

						arg_113_1:RecordAudio("1104905026", var_116_15)
						arg_113_1:RecordAudio("1104905026", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905026", "story_v_side_new_1104905.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905026", "story_v_side_new_1104905.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905027 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1104905027
		arg_117_1.duration_ = 6.83

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1104905028(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1049ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and not isNil(var_120_0) and arg_117_1.var_.characterEffect1049ui_story == nil then
				arg_117_1.var_.characterEffect1049ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 and not isNil(var_120_0) then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1049ui_story and not isNil(var_120_0) then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1049ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and not isNil(var_120_0) and arg_117_1.var_.characterEffect1049ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1049ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.65

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[1006].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_117_1.callingController_:SetSelectedState("normal")

				arg_117_1.keyicon_.color = Color.New(1, 1, 1)
				arg_117_1.icon_.color = Color.New(1, 1, 1)

				local var_120_9 = arg_117_1:GetWordFromCfg(1104905027)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 26
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905027", "story_v_side_new_1104905.awb") ~= 0 then
					local var_120_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905027", "story_v_side_new_1104905.awb") / 1000

					if var_120_14 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_14 + var_120_6
					end

					if var_120_9.prefab_name ~= "" and arg_117_1.actors_[var_120_9.prefab_name] ~= nil then
						local var_120_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_9.prefab_name].transform, "story_v_side_new_1104905", "1104905027", "story_v_side_new_1104905.awb")

						arg_117_1:RecordAudio("1104905027", var_120_15)
						arg_117_1:RecordAudio("1104905027", var_120_15)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905027", "story_v_side_new_1104905.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905027", "story_v_side_new_1104905.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_16 and arg_117_1.time_ < var_120_6 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905028 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1104905028
		arg_121_1.duration_ = 8.07

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1104905029(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1.125

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[1006].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_121_1.callingController_:SetSelectedState("normal")

				arg_121_1.keyicon_.color = Color.New(1, 1, 1)
				arg_121_1.icon_.color = Color.New(1, 1, 1)

				local var_124_3 = arg_121_1:GetWordFromCfg(1104905028)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905028", "story_v_side_new_1104905.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905028", "story_v_side_new_1104905.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_side_new_1104905", "1104905028", "story_v_side_new_1104905.awb")

						arg_121_1:RecordAudio("1104905028", var_124_9)
						arg_121_1:RecordAudio("1104905028", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905028", "story_v_side_new_1104905.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905028", "story_v_side_new_1104905.awb")
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
	Play1104905029 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1104905029
		arg_125_1.duration_ = 2

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1104905030(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1049ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and not isNil(var_128_0) and arg_125_1.var_.characterEffect1049ui_story == nil then
				arg_125_1.var_.characterEffect1049ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 and not isNil(var_128_0) then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1049ui_story and not isNil(var_128_0) then
					arg_125_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and not isNil(var_128_0) and arg_125_1.var_.characterEffect1049ui_story then
				arg_125_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_128_6 = 0
			local var_128_7 = 0.075

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[551].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(1104905029)
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905029", "story_v_side_new_1104905.awb") ~= 0 then
					local var_128_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905029", "story_v_side_new_1104905.awb") / 1000

					if var_128_14 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_14 + var_128_6
					end

					if var_128_9.prefab_name ~= "" and arg_125_1.actors_[var_128_9.prefab_name] ~= nil then
						local var_128_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_9.prefab_name].transform, "story_v_side_new_1104905", "1104905029", "story_v_side_new_1104905.awb")

						arg_125_1:RecordAudio("1104905029", var_128_15)
						arg_125_1:RecordAudio("1104905029", var_128_15)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905029", "story_v_side_new_1104905.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905029", "story_v_side_new_1104905.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_16 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_16 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_16

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_16 and arg_125_1.time_ < var_128_6 + var_128_16 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905030 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1104905030
		arg_129_1.duration_ = 3.5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1104905031(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1049ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and not isNil(var_132_0) and arg_129_1.var_.characterEffect1049ui_story == nil then
				arg_129_1.var_.characterEffect1049ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 and not isNil(var_132_0) then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1049ui_story and not isNil(var_132_0) then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1049ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and not isNil(var_132_0) and arg_129_1.var_.characterEffect1049ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1049ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0
			local var_132_7 = 0.35

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_8 = arg_129_1:FormatText(StoryNameCfg[1006].name)

				arg_129_1.leftNameTxt_.text = var_132_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, true)
				arg_129_1.iconController_:SetSelectedState("hero")

				arg_129_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_129_1.callingController_:SetSelectedState("normal")

				arg_129_1.keyicon_.color = Color.New(1, 1, 1)
				arg_129_1.icon_.color = Color.New(1, 1, 1)

				local var_132_9 = arg_129_1:GetWordFromCfg(1104905030)
				local var_132_10 = arg_129_1:FormatText(var_132_9.content)

				arg_129_1.text_.text = var_132_10

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_11 = 14
				local var_132_12 = utf8.len(var_132_10)
				local var_132_13 = var_132_11 <= 0 and var_132_7 or var_132_7 * (var_132_12 / var_132_11)

				if var_132_13 > 0 and var_132_7 < var_132_13 then
					arg_129_1.talkMaxDuration = var_132_13

					if var_132_13 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_13 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_10
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905030", "story_v_side_new_1104905.awb") ~= 0 then
					local var_132_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905030", "story_v_side_new_1104905.awb") / 1000

					if var_132_14 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_14 + var_132_6
					end

					if var_132_9.prefab_name ~= "" and arg_129_1.actors_[var_132_9.prefab_name] ~= nil then
						local var_132_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_9.prefab_name].transform, "story_v_side_new_1104905", "1104905030", "story_v_side_new_1104905.awb")

						arg_129_1:RecordAudio("1104905030", var_132_15)
						arg_129_1:RecordAudio("1104905030", var_132_15)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905030", "story_v_side_new_1104905.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905030", "story_v_side_new_1104905.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_16 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_16 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_16

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_16 and arg_129_1.time_ < var_132_6 + var_132_16 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905031 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1104905031
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1104905032(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1049ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1049ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, 100, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1049ui_story, var_136_4, var_136_3)

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

			local var_136_9 = 0
			local var_136_10 = 0.825

			if var_136_9 < arg_133_1.time_ and arg_133_1.time_ <= var_136_9 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_11 = arg_133_1:GetWordFromCfg(1104905031)
				local var_136_12 = arg_133_1:FormatText(var_136_11.content)

				arg_133_1.text_.text = var_136_12

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_13 = 33
				local var_136_14 = utf8.len(var_136_12)
				local var_136_15 = var_136_13 <= 0 and var_136_10 or var_136_10 * (var_136_14 / var_136_13)

				if var_136_15 > 0 and var_136_10 < var_136_15 then
					arg_133_1.talkMaxDuration = var_136_15

					if var_136_15 + var_136_9 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_15 + var_136_9
					end
				end

				arg_133_1.text_.text = var_136_12
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_16 = math.max(var_136_10, arg_133_1.talkMaxDuration)

			if var_136_9 <= arg_133_1.time_ and arg_133_1.time_ < var_136_9 + var_136_16 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_9) / var_136_16

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_9 + var_136_16 and arg_133_1.time_ < var_136_9 + var_136_16 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905032 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1104905032
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1104905033(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.925

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_2 = arg_137_1:GetWordFromCfg(1104905032)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 37
				local var_140_5 = utf8.len(var_140_3)
				local var_140_6 = var_140_4 <= 0 and var_140_1 or var_140_1 * (var_140_5 / var_140_4)

				if var_140_6 > 0 and var_140_1 < var_140_6 then
					arg_137_1.talkMaxDuration = var_140_6

					if var_140_6 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_6 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_3
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_7 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_7 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_7

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_7 and arg_137_1.time_ < var_140_0 + var_140_7 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905033 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1104905033
		arg_141_1.duration_ = 2.6

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1104905034(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1049ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1049ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -1.2, -6)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1049ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1049ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and not isNil(var_144_9) and arg_141_1.var_.characterEffect1049ui_story == nil then
				arg_141_1.var_.characterEffect1049ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 and not isNil(var_144_9) then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1049ui_story and not isNil(var_144_9) then
					arg_141_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and not isNil(var_144_9) and arg_141_1.var_.characterEffect1049ui_story then
				arg_141_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action2_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_144_15 = 0
			local var_144_16 = 0.3

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_17 = arg_141_1:FormatText(StoryNameCfg[551].name)

				arg_141_1.leftNameTxt_.text = var_144_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_18 = arg_141_1:GetWordFromCfg(1104905033)
				local var_144_19 = arg_141_1:FormatText(var_144_18.content)

				arg_141_1.text_.text = var_144_19

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_20 = 12
				local var_144_21 = utf8.len(var_144_19)
				local var_144_22 = var_144_20 <= 0 and var_144_16 or var_144_16 * (var_144_21 / var_144_20)

				if var_144_22 > 0 and var_144_16 < var_144_22 then
					arg_141_1.talkMaxDuration = var_144_22

					if var_144_22 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_22 + var_144_15
					end
				end

				arg_141_1.text_.text = var_144_19
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905033", "story_v_side_new_1104905.awb") ~= 0 then
					local var_144_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905033", "story_v_side_new_1104905.awb") / 1000

					if var_144_23 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_23 + var_144_15
					end

					if var_144_18.prefab_name ~= "" and arg_141_1.actors_[var_144_18.prefab_name] ~= nil then
						local var_144_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_18.prefab_name].transform, "story_v_side_new_1104905", "1104905033", "story_v_side_new_1104905.awb")

						arg_141_1:RecordAudio("1104905033", var_144_24)
						arg_141_1:RecordAudio("1104905033", var_144_24)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905033", "story_v_side_new_1104905.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905033", "story_v_side_new_1104905.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_25 = math.max(var_144_16, arg_141_1.talkMaxDuration)

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_25 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_15) / var_144_25

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_15 + var_144_25 and arg_141_1.time_ < var_144_15 + var_144_25 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1104905034
		arg_145_1.duration_ = 1

		SetActive(arg_145_1.tipsGo_, true)

		arg_145_1.tipsText_.text = StoryTipsCfg[104901].name

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"

			SetActive(arg_145_1.choicesGo_, true)

			for iter_146_0, iter_146_1 in ipairs(arg_145_1.choices_) do
				local var_146_0 = iter_146_0 <= 2

				SetActive(iter_146_1.go, var_146_0)
			end

			arg_145_1.choices_[1].txt.text = arg_145_1:FormatText(StoryChoiceCfg[1180].name)
			arg_145_1.choices_[2].txt.text = arg_145_1:FormatText(StoryChoiceCfg[1181].name)
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1104905035(arg_145_1)
			end

			if arg_147_0 == 2 then
				PlayerAction.UseStoryTrigger(1049011, 210490105, 1104905034, 2)
				arg_145_0:Play1104905035(arg_145_1)
			end

			arg_145_1:RecordChoiceLog(1104905034, 1104905035, 1104905035)
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1049ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.characterEffect1049ui_story == nil then
				arg_145_1.var_.characterEffect1049ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 and not isNil(var_148_0) then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1049ui_story and not isNil(var_148_0) then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1049ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.characterEffect1049ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1049ui_story.fillRatio = var_148_5
			end

			local var_148_6 = 0

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.allBtn_.enabled = false
			end

			local var_148_7 = 0.5

			if arg_145_1.time_ >= var_148_6 + var_148_7 and arg_145_1.time_ < var_148_6 + var_148_7 + arg_148_0 then
				arg_145_1.allBtn_.enabled = true
			end
		end
	end,
	Play1104905035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1104905035
		arg_149_1.duration_ = 2.1

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1104905036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1049ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and not isNil(var_152_0) and arg_149_1.var_.characterEffect1049ui_story == nil then
				arg_149_1.var_.characterEffect1049ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 and not isNil(var_152_0) then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1049ui_story and not isNil(var_152_0) then
					arg_149_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and not isNil(var_152_0) and arg_149_1.var_.characterEffect1049ui_story then
				arg_149_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_152_4 = "1049ui_story"

			if arg_149_1.actors_[var_152_4] == nil then
				local var_152_5 = Asset.Load("Char/" .. "1049ui_story")

				if not isNil(var_152_5) then
					local var_152_6 = Object.Instantiate(Asset.Load("Char/" .. "1049ui_story"), arg_149_1.stage_.transform)

					var_152_6.name = var_152_4
					var_152_6.transform.localPosition = Vector3.New(0, 100, 0)
					arg_149_1.actors_[var_152_4] = var_152_6

					local var_152_7 = var_152_6:GetComponentInChildren(typeof(CharacterEffect))

					var_152_7.enabled = true

					local var_152_8 = GameObjectTools.GetOrAddComponent(var_152_6, typeof(DynamicBoneHelper))

					if var_152_8 then
						var_152_8:EnableDynamicBone(false)
					end

					arg_149_1:ShowWeapon(var_152_7.transform, false)

					arg_149_1.var_[var_152_4 .. "Animator"] = var_152_7.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_149_1.var_[var_152_4 .. "Animator"].applyRootMotion = true
					arg_149_1.var_[var_152_4 .. "LipSync"] = var_152_7.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_152_9 = 0

			if var_152_9 < arg_149_1.time_ and arg_149_1.time_ <= var_152_9 + arg_152_0 then
				arg_149_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_152_10 = "1049ui_story"

			if arg_149_1.actors_[var_152_10] == nil then
				local var_152_11 = Asset.Load("Char/" .. "1049ui_story")

				if not isNil(var_152_11) then
					local var_152_12 = Object.Instantiate(Asset.Load("Char/" .. "1049ui_story"), arg_149_1.stage_.transform)

					var_152_12.name = var_152_10
					var_152_12.transform.localPosition = Vector3.New(0, 100, 0)
					arg_149_1.actors_[var_152_10] = var_152_12

					local var_152_13 = var_152_12:GetComponentInChildren(typeof(CharacterEffect))

					var_152_13.enabled = true

					local var_152_14 = GameObjectTools.GetOrAddComponent(var_152_12, typeof(DynamicBoneHelper))

					if var_152_14 then
						var_152_14:EnableDynamicBone(false)
					end

					arg_149_1:ShowWeapon(var_152_13.transform, false)

					arg_149_1.var_[var_152_10 .. "Animator"] = var_152_13.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_149_1.var_[var_152_10 .. "Animator"].applyRootMotion = true
					arg_149_1.var_[var_152_10 .. "LipSync"] = var_152_13.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_152_15 = 0

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_152_16 = 0
			local var_152_17 = 0.3

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_18 = arg_149_1:FormatText(StoryNameCfg[551].name)

				arg_149_1.leftNameTxt_.text = var_152_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_19 = arg_149_1:GetWordFromCfg(1104905035)
				local var_152_20 = arg_149_1:FormatText(var_152_19.content)

				arg_149_1.text_.text = var_152_20

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_21 = 12
				local var_152_22 = utf8.len(var_152_20)
				local var_152_23 = var_152_21 <= 0 and var_152_17 or var_152_17 * (var_152_22 / var_152_21)

				if var_152_23 > 0 and var_152_17 < var_152_23 then
					arg_149_1.talkMaxDuration = var_152_23

					if var_152_23 + var_152_16 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_16
					end
				end

				arg_149_1.text_.text = var_152_20
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905035", "story_v_side_new_1104905.awb") ~= 0 then
					local var_152_24 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905035", "story_v_side_new_1104905.awb") / 1000

					if var_152_24 + var_152_16 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_24 + var_152_16
					end

					if var_152_19.prefab_name ~= "" and arg_149_1.actors_[var_152_19.prefab_name] ~= nil then
						local var_152_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_19.prefab_name].transform, "story_v_side_new_1104905", "1104905035", "story_v_side_new_1104905.awb")

						arg_149_1:RecordAudio("1104905035", var_152_25)
						arg_149_1:RecordAudio("1104905035", var_152_25)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905035", "story_v_side_new_1104905.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905035", "story_v_side_new_1104905.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_26 = math.max(var_152_17, arg_149_1.talkMaxDuration)

			if var_152_16 <= arg_149_1.time_ and arg_149_1.time_ < var_152_16 + var_152_26 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_16) / var_152_26

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_16 + var_152_26 and arg_149_1.time_ < var_152_16 + var_152_26 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1104905036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1104905037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1049ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and not isNil(var_156_0) and arg_153_1.var_.characterEffect1049ui_story == nil then
				arg_153_1.var_.characterEffect1049ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 and not isNil(var_156_0) then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1049ui_story and not isNil(var_156_0) then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1049ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and not isNil(var_156_0) and arg_153_1.var_.characterEffect1049ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1049ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0.733333333333333
			local var_156_7 = 1

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				local var_156_8 = "play"
				local var_156_9 = "effect"

				arg_153_1:AudioAction(var_156_8, var_156_9, "se_story_1311", "se_story_1311_paper", "")
			end

			local var_156_10 = 0
			local var_156_11 = 1.375

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_12 = arg_153_1:GetWordFromCfg(1104905036)
				local var_156_13 = arg_153_1:FormatText(var_156_12.content)

				arg_153_1.text_.text = var_156_13

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_14 = 55
				local var_156_15 = utf8.len(var_156_13)
				local var_156_16 = var_156_14 <= 0 and var_156_11 or var_156_11 * (var_156_15 / var_156_14)

				if var_156_16 > 0 and var_156_11 < var_156_16 then
					arg_153_1.talkMaxDuration = var_156_16

					if var_156_16 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_16 + var_156_10
					end
				end

				arg_153_1.text_.text = var_156_13
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_17 = math.max(var_156_11, arg_153_1.talkMaxDuration)

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_17 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_10) / var_156_17

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_10 + var_156_17 and arg_153_1.time_ < var_156_10 + var_156_17 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1104905037
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1104905038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.3

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[7].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(1104905037)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 12
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_8 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_8 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_8

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_8 and arg_157_1.time_ < var_160_0 + var_160_8 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1104905038
		arg_161_1.duration_ = 2.4

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1104905039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1049ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.characterEffect1049ui_story == nil then
				arg_161_1.var_.characterEffect1049ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 and not isNil(var_164_0) then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1049ui_story and not isNil(var_164_0) then
					arg_161_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.characterEffect1049ui_story then
				arg_161_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_164_4 = 0

			if var_164_4 < arg_161_1.time_ and arg_161_1.time_ <= var_164_4 + arg_164_0 then
				arg_161_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 then
				arg_161_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_164_6 = 0
			local var_164_7 = 0.225

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_8 = arg_161_1:FormatText(StoryNameCfg[551].name)

				arg_161_1.leftNameTxt_.text = var_164_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_9 = arg_161_1:GetWordFromCfg(1104905038)
				local var_164_10 = arg_161_1:FormatText(var_164_9.content)

				arg_161_1.text_.text = var_164_10

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_11 = 9
				local var_164_12 = utf8.len(var_164_10)
				local var_164_13 = var_164_11 <= 0 and var_164_7 or var_164_7 * (var_164_12 / var_164_11)

				if var_164_13 > 0 and var_164_7 < var_164_13 then
					arg_161_1.talkMaxDuration = var_164_13

					if var_164_13 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_13 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_10
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905038", "story_v_side_new_1104905.awb") ~= 0 then
					local var_164_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905038", "story_v_side_new_1104905.awb") / 1000

					if var_164_14 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_14 + var_164_6
					end

					if var_164_9.prefab_name ~= "" and arg_161_1.actors_[var_164_9.prefab_name] ~= nil then
						local var_164_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_9.prefab_name].transform, "story_v_side_new_1104905", "1104905038", "story_v_side_new_1104905.awb")

						arg_161_1:RecordAudio("1104905038", var_164_15)
						arg_161_1:RecordAudio("1104905038", var_164_15)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905038", "story_v_side_new_1104905.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905038", "story_v_side_new_1104905.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_16 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_16 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_16

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_16 and arg_161_1.time_ < var_164_6 + var_164_16 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1104905039
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1104905040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1049ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and not isNil(var_168_0) and arg_165_1.var_.characterEffect1049ui_story == nil then
				arg_165_1.var_.characterEffect1049ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.200000002980232

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 and not isNil(var_168_0) then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect1049ui_story and not isNil(var_168_0) then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1049ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and not isNil(var_168_0) and arg_165_1.var_.characterEffect1049ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1049ui_story.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 0.15

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_8 = arg_165_1:FormatText(StoryNameCfg[7].name)

				arg_165_1.leftNameTxt_.text = var_168_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_9 = arg_165_1:GetWordFromCfg(1104905039)
				local var_168_10 = arg_165_1:FormatText(var_168_9.content)

				arg_165_1.text_.text = var_168_10

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_11 = 6
				local var_168_12 = utf8.len(var_168_10)
				local var_168_13 = var_168_11 <= 0 and var_168_7 or var_168_7 * (var_168_12 / var_168_11)

				if var_168_13 > 0 and var_168_7 < var_168_13 then
					arg_165_1.talkMaxDuration = var_168_13

					if var_168_13 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_13 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_10
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_14 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_14 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_14

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_14 and arg_165_1.time_ < var_168_6 + var_168_14 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1104905040
		arg_169_1.duration_ = 9.97

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1104905041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1049ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.characterEffect1049ui_story == nil then
				arg_169_1.var_.characterEffect1049ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 and not isNil(var_172_0) then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1049ui_story and not isNil(var_172_0) then
					arg_169_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.characterEffect1049ui_story then
				arg_169_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_172_4 = 0
			local var_172_5 = 0.875

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_6 = arg_169_1:FormatText(StoryNameCfg[551].name)

				arg_169_1.leftNameTxt_.text = var_172_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_7 = arg_169_1:GetWordFromCfg(1104905040)
				local var_172_8 = arg_169_1:FormatText(var_172_7.content)

				arg_169_1.text_.text = var_172_8

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_9 = 35
				local var_172_10 = utf8.len(var_172_8)
				local var_172_11 = var_172_9 <= 0 and var_172_5 or var_172_5 * (var_172_10 / var_172_9)

				if var_172_11 > 0 and var_172_5 < var_172_11 then
					arg_169_1.talkMaxDuration = var_172_11

					if var_172_11 + var_172_4 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_11 + var_172_4
					end
				end

				arg_169_1.text_.text = var_172_8
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905040", "story_v_side_new_1104905.awb") ~= 0 then
					local var_172_12 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905040", "story_v_side_new_1104905.awb") / 1000

					if var_172_12 + var_172_4 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_12 + var_172_4
					end

					if var_172_7.prefab_name ~= "" and arg_169_1.actors_[var_172_7.prefab_name] ~= nil then
						local var_172_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_7.prefab_name].transform, "story_v_side_new_1104905", "1104905040", "story_v_side_new_1104905.awb")

						arg_169_1:RecordAudio("1104905040", var_172_13)
						arg_169_1:RecordAudio("1104905040", var_172_13)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905040", "story_v_side_new_1104905.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905040", "story_v_side_new_1104905.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_14 = math.max(var_172_5, arg_169_1.talkMaxDuration)

			if var_172_4 <= arg_169_1.time_ and arg_169_1.time_ < var_172_4 + var_172_14 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_4) / var_172_14

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_4 + var_172_14 and arg_169_1.time_ < var_172_4 + var_172_14 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1104905041
		arg_173_1.duration_ = 16.6

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1104905042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 1.4

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[551].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(1104905041)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 56
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905041", "story_v_side_new_1104905.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905041", "story_v_side_new_1104905.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_side_new_1104905", "1104905041", "story_v_side_new_1104905.awb")

						arg_173_1:RecordAudio("1104905041", var_176_9)
						arg_173_1:RecordAudio("1104905041", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905041", "story_v_side_new_1104905.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905041", "story_v_side_new_1104905.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_10 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_10 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_10

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_10 and arg_173_1.time_ < var_176_0 + var_176_10 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1104905042
		arg_177_1.duration_ = 9.67

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1104905043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_1")
			end

			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_180_2 = 0
			local var_180_3 = 0.675

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_4 = arg_177_1:FormatText(StoryNameCfg[551].name)

				arg_177_1.leftNameTxt_.text = var_180_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_5 = arg_177_1:GetWordFromCfg(1104905042)
				local var_180_6 = arg_177_1:FormatText(var_180_5.content)

				arg_177_1.text_.text = var_180_6

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_7 = 27
				local var_180_8 = utf8.len(var_180_6)
				local var_180_9 = var_180_7 <= 0 and var_180_3 or var_180_3 * (var_180_8 / var_180_7)

				if var_180_9 > 0 and var_180_3 < var_180_9 then
					arg_177_1.talkMaxDuration = var_180_9

					if var_180_9 + var_180_2 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_9 + var_180_2
					end
				end

				arg_177_1.text_.text = var_180_6
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905042", "story_v_side_new_1104905.awb") ~= 0 then
					local var_180_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905042", "story_v_side_new_1104905.awb") / 1000

					if var_180_10 + var_180_2 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_10 + var_180_2
					end

					if var_180_5.prefab_name ~= "" and arg_177_1.actors_[var_180_5.prefab_name] ~= nil then
						local var_180_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_5.prefab_name].transform, "story_v_side_new_1104905", "1104905042", "story_v_side_new_1104905.awb")

						arg_177_1:RecordAudio("1104905042", var_180_11)
						arg_177_1:RecordAudio("1104905042", var_180_11)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905042", "story_v_side_new_1104905.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905042", "story_v_side_new_1104905.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_12 = math.max(var_180_3, arg_177_1.talkMaxDuration)

			if var_180_2 <= arg_177_1.time_ and arg_177_1.time_ < var_180_2 + var_180_12 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_2) / var_180_12

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_2 + var_180_12 and arg_177_1.time_ < var_180_2 + var_180_12 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1104905043
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1104905044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1049ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and not isNil(var_184_0) and arg_181_1.var_.characterEffect1049ui_story == nil then
				arg_181_1.var_.characterEffect1049ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 and not isNil(var_184_0) then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1049ui_story and not isNil(var_184_0) then
					local var_184_4 = Mathf.Lerp(0, 0.5, var_184_3)

					arg_181_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1049ui_story.fillRatio = var_184_4
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and not isNil(var_184_0) and arg_181_1.var_.characterEffect1049ui_story then
				local var_184_5 = 0.5

				arg_181_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1049ui_story.fillRatio = var_184_5
			end

			local var_184_6 = 0
			local var_184_7 = 1.025

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_8 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_9 = arg_181_1:GetWordFromCfg(1104905043)
				local var_184_10 = arg_181_1:FormatText(var_184_9.content)

				arg_181_1.text_.text = var_184_10

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_11 = 41
				local var_184_12 = utf8.len(var_184_10)
				local var_184_13 = var_184_11 <= 0 and var_184_7 or var_184_7 * (var_184_12 / var_184_11)

				if var_184_13 > 0 and var_184_7 < var_184_13 then
					arg_181_1.talkMaxDuration = var_184_13

					if var_184_13 + var_184_6 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_13 + var_184_6
					end
				end

				arg_181_1.text_.text = var_184_10
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_14 = math.max(var_184_7, arg_181_1.talkMaxDuration)

			if var_184_6 <= arg_181_1.time_ and arg_181_1.time_ < var_184_6 + var_184_14 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_6) / var_184_14

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_6 + var_184_14 and arg_181_1.time_ < var_184_6 + var_184_14 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1104905044
		arg_185_1.duration_ = 2.2

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1104905045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1049ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and not isNil(var_188_0) and arg_185_1.var_.characterEffect1049ui_story == nil then
				arg_185_1.var_.characterEffect1049ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 and not isNil(var_188_0) then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1049ui_story and not isNil(var_188_0) then
					arg_185_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and not isNil(var_188_0) and arg_185_1.var_.characterEffect1049ui_story then
				arg_185_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_188_4 = 0

			if var_188_4 < arg_185_1.time_ and arg_185_1.time_ <= var_188_4 + arg_188_0 then
				arg_185_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action3_2")
			end

			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 then
				arg_185_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_188_6 = 0
			local var_188_7 = 0.25

			if var_188_6 < arg_185_1.time_ and arg_185_1.time_ <= var_188_6 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_8 = arg_185_1:FormatText(StoryNameCfg[551].name)

				arg_185_1.leftNameTxt_.text = var_188_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_9 = arg_185_1:GetWordFromCfg(1104905044)
				local var_188_10 = arg_185_1:FormatText(var_188_9.content)

				arg_185_1.text_.text = var_188_10

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_11 = 10
				local var_188_12 = utf8.len(var_188_10)
				local var_188_13 = var_188_11 <= 0 and var_188_7 or var_188_7 * (var_188_12 / var_188_11)

				if var_188_13 > 0 and var_188_7 < var_188_13 then
					arg_185_1.talkMaxDuration = var_188_13

					if var_188_13 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_13 + var_188_6
					end
				end

				arg_185_1.text_.text = var_188_10
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905044", "story_v_side_new_1104905.awb") ~= 0 then
					local var_188_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905044", "story_v_side_new_1104905.awb") / 1000

					if var_188_14 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_14 + var_188_6
					end

					if var_188_9.prefab_name ~= "" and arg_185_1.actors_[var_188_9.prefab_name] ~= nil then
						local var_188_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_9.prefab_name].transform, "story_v_side_new_1104905", "1104905044", "story_v_side_new_1104905.awb")

						arg_185_1:RecordAudio("1104905044", var_188_15)
						arg_185_1:RecordAudio("1104905044", var_188_15)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905044", "story_v_side_new_1104905.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905044", "story_v_side_new_1104905.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_16 = math.max(var_188_7, arg_185_1.talkMaxDuration)

			if var_188_6 <= arg_185_1.time_ and arg_185_1.time_ < var_188_6 + var_188_16 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_6) / var_188_16

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_6 + var_188_16 and arg_185_1.time_ < var_188_6 + var_188_16 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1104905045
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play1104905046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1049ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and not isNil(var_192_0) and arg_189_1.var_.characterEffect1049ui_story == nil then
				arg_189_1.var_.characterEffect1049ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 and not isNil(var_192_0) then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1049ui_story and not isNil(var_192_0) then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1049ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and not isNil(var_192_0) and arg_189_1.var_.characterEffect1049ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1049ui_story.fillRatio = var_192_5
			end

			local var_192_6 = 0
			local var_192_7 = 0.275

			if var_192_6 < arg_189_1.time_ and arg_189_1.time_ <= var_192_6 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_8 = arg_189_1:FormatText(StoryNameCfg[7].name)

				arg_189_1.leftNameTxt_.text = var_192_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_9 = arg_189_1:GetWordFromCfg(1104905045)
				local var_192_10 = arg_189_1:FormatText(var_192_9.content)

				arg_189_1.text_.text = var_192_10

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_11 = 11
				local var_192_12 = utf8.len(var_192_10)
				local var_192_13 = var_192_11 <= 0 and var_192_7 or var_192_7 * (var_192_12 / var_192_11)

				if var_192_13 > 0 and var_192_7 < var_192_13 then
					arg_189_1.talkMaxDuration = var_192_13

					if var_192_13 + var_192_6 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_6
					end
				end

				arg_189_1.text_.text = var_192_10
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_14 = math.max(var_192_7, arg_189_1.talkMaxDuration)

			if var_192_6 <= arg_189_1.time_ and arg_189_1.time_ < var_192_6 + var_192_14 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_6) / var_192_14

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_6 + var_192_14 and arg_189_1.time_ < var_192_6 + var_192_14 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1104905046
		arg_193_1.duration_ = 15.2

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1104905047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1049ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.characterEffect1049ui_story == nil then
				arg_193_1.var_.characterEffect1049ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 and not isNil(var_196_0) then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1049ui_story and not isNil(var_196_0) then
					arg_193_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.characterEffect1049ui_story then
				arg_193_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_196_4 = 0

			if var_196_4 < arg_193_1.time_ and arg_193_1.time_ <= var_196_4 + arg_196_0 then
				arg_193_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action6_1")
			end

			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 then
				arg_193_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva", "EmotionTimelineAnimator")
			end

			local var_196_6 = 0
			local var_196_7 = 1.3

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_8 = arg_193_1:FormatText(StoryNameCfg[551].name)

				arg_193_1.leftNameTxt_.text = var_196_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_9 = arg_193_1:GetWordFromCfg(1104905046)
				local var_196_10 = arg_193_1:FormatText(var_196_9.content)

				arg_193_1.text_.text = var_196_10

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_11 = 52
				local var_196_12 = utf8.len(var_196_10)
				local var_196_13 = var_196_11 <= 0 and var_196_7 or var_196_7 * (var_196_12 / var_196_11)

				if var_196_13 > 0 and var_196_7 < var_196_13 then
					arg_193_1.talkMaxDuration = var_196_13

					if var_196_13 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_13 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_10
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905046", "story_v_side_new_1104905.awb") ~= 0 then
					local var_196_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905046", "story_v_side_new_1104905.awb") / 1000

					if var_196_14 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_14 + var_196_6
					end

					if var_196_9.prefab_name ~= "" and arg_193_1.actors_[var_196_9.prefab_name] ~= nil then
						local var_196_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_9.prefab_name].transform, "story_v_side_new_1104905", "1104905046", "story_v_side_new_1104905.awb")

						arg_193_1:RecordAudio("1104905046", var_196_15)
						arg_193_1:RecordAudio("1104905046", var_196_15)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905046", "story_v_side_new_1104905.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905046", "story_v_side_new_1104905.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_16 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_16 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_16

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_16 and arg_193_1.time_ < var_196_6 + var_196_16 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1104905047
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1104905048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1049ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1049ui_story == nil then
				arg_197_1.var_.characterEffect1049ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 and not isNil(var_200_0) then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1049ui_story and not isNil(var_200_0) then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1049ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1049ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1049ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.35

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_8 = arg_197_1:FormatText(StoryNameCfg[7].name)

				arg_197_1.leftNameTxt_.text = var_200_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_9 = arg_197_1:GetWordFromCfg(1104905047)
				local var_200_10 = arg_197_1:FormatText(var_200_9.content)

				arg_197_1.text_.text = var_200_10

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_11 = 14
				local var_200_12 = utf8.len(var_200_10)
				local var_200_13 = var_200_11 <= 0 and var_200_7 or var_200_7 * (var_200_12 / var_200_11)

				if var_200_13 > 0 and var_200_7 < var_200_13 then
					arg_197_1.talkMaxDuration = var_200_13

					if var_200_13 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_13 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_10
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_14 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_14 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_14

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_14 and arg_197_1.time_ < var_200_6 + var_200_14 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1104905048
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1104905049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1049ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1049ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, 100, 0)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1049ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, 100, 0)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = 0
			local var_204_10 = 0.7

			if var_204_9 < arg_201_1.time_ and arg_201_1.time_ <= var_204_9 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_11 = arg_201_1:GetWordFromCfg(1104905048)
				local var_204_12 = arg_201_1:FormatText(var_204_11.content)

				arg_201_1.text_.text = var_204_12

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_13 = 28
				local var_204_14 = utf8.len(var_204_12)
				local var_204_15 = var_204_13 <= 0 and var_204_10 or var_204_10 * (var_204_14 / var_204_13)

				if var_204_15 > 0 and var_204_10 < var_204_15 then
					arg_201_1.talkMaxDuration = var_204_15

					if var_204_15 + var_204_9 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_15 + var_204_9
					end
				end

				arg_201_1.text_.text = var_204_12
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_16 = math.max(var_204_10, arg_201_1.talkMaxDuration)

			if var_204_9 <= arg_201_1.time_ and arg_201_1.time_ < var_204_9 + var_204_16 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_9) / var_204_16

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_9 + var_204_16 and arg_201_1.time_ < var_204_9 + var_204_16 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1104905049
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1104905050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.2

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

				local var_208_2 = arg_205_1:GetWordFromCfg(1104905049)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 48
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
	Play1104905050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1104905050
		arg_209_1.duration_ = 6.87

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1104905051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1049ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1049ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -1.2, -6)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1049ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1049ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and not isNil(var_212_9) and arg_209_1.var_.characterEffect1049ui_story == nil then
				arg_209_1.var_.characterEffect1049ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 and not isNil(var_212_9) then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1049ui_story and not isNil(var_212_9) then
					arg_209_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and not isNil(var_212_9) and arg_209_1.var_.characterEffect1049ui_story then
				arg_209_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_2")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_212_15 = 0
			local var_212_16 = 0.725

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_17 = arg_209_1:FormatText(StoryNameCfg[551].name)

				arg_209_1.leftNameTxt_.text = var_212_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(1104905050)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 29
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905050", "story_v_side_new_1104905.awb") ~= 0 then
					local var_212_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905050", "story_v_side_new_1104905.awb") / 1000

					if var_212_23 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_23 + var_212_15
					end

					if var_212_18.prefab_name ~= "" and arg_209_1.actors_[var_212_18.prefab_name] ~= nil then
						local var_212_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_18.prefab_name].transform, "story_v_side_new_1104905", "1104905050", "story_v_side_new_1104905.awb")

						arg_209_1:RecordAudio("1104905050", var_212_24)
						arg_209_1:RecordAudio("1104905050", var_212_24)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905050", "story_v_side_new_1104905.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905050", "story_v_side_new_1104905.awb")
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
	Play1104905051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1104905051
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1104905052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1049ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.characterEffect1049ui_story == nil then
				arg_213_1.var_.characterEffect1049ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 and not isNil(var_216_0) then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1049ui_story and not isNil(var_216_0) then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1049ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.characterEffect1049ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1049ui_story.fillRatio = var_216_5
			end

			local var_216_6 = 0
			local var_216_7 = 0.175

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_8 = arg_213_1:FormatText(StoryNameCfg[7].name)

				arg_213_1.leftNameTxt_.text = var_216_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_9 = arg_213_1:GetWordFromCfg(1104905051)
				local var_216_10 = arg_213_1:FormatText(var_216_9.content)

				arg_213_1.text_.text = var_216_10

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_11 = 7
				local var_216_12 = utf8.len(var_216_10)
				local var_216_13 = var_216_11 <= 0 and var_216_7 or var_216_7 * (var_216_12 / var_216_11)

				if var_216_13 > 0 and var_216_7 < var_216_13 then
					arg_213_1.talkMaxDuration = var_216_13

					if var_216_13 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_10
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_14 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_14 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_14

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_14 and arg_213_1.time_ < var_216_6 + var_216_14 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1104905052
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1104905053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.725

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(1104905052)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 29
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1104905053
		arg_221_1.duration_ = 7.87

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1104905054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1049ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1049ui_story == nil then
				arg_221_1.var_.characterEffect1049ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 and not isNil(var_224_0) then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1049ui_story and not isNil(var_224_0) then
					arg_221_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1049ui_story then
				arg_221_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_224_4 = 0

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_224_5 = 0

			if var_224_5 < arg_221_1.time_ and arg_221_1.time_ <= var_224_5 + arg_224_0 then
				arg_221_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_224_6 = 0
			local var_224_7 = 0.425

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[551].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_9 = arg_221_1:GetWordFromCfg(1104905053)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 17
				local var_224_12 = utf8.len(var_224_10)
				local var_224_13 = var_224_11 <= 0 and var_224_7 or var_224_7 * (var_224_12 / var_224_11)

				if var_224_13 > 0 and var_224_7 < var_224_13 then
					arg_221_1.talkMaxDuration = var_224_13

					if var_224_13 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_13 + var_224_6
					end
				end

				arg_221_1.text_.text = var_224_10
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905053", "story_v_side_new_1104905.awb") ~= 0 then
					local var_224_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905053", "story_v_side_new_1104905.awb") / 1000

					if var_224_14 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_14 + var_224_6
					end

					if var_224_9.prefab_name ~= "" and arg_221_1.actors_[var_224_9.prefab_name] ~= nil then
						local var_224_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_9.prefab_name].transform, "story_v_side_new_1104905", "1104905053", "story_v_side_new_1104905.awb")

						arg_221_1:RecordAudio("1104905053", var_224_15)
						arg_221_1:RecordAudio("1104905053", var_224_15)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905053", "story_v_side_new_1104905.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905053", "story_v_side_new_1104905.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_16 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_16 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_16

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_16 and arg_221_1.time_ < var_224_6 + var_224_16 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1104905054
		arg_225_1.duration_ = 9

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1104905055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = "C02a"

			if arg_225_1.bgs_[var_228_0] == nil then
				local var_228_1 = Object.Instantiate(arg_225_1.paintGo_)

				var_228_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_228_0)
				var_228_1.name = var_228_0
				var_228_1.transform.parent = arg_225_1.stage_.transform
				var_228_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_225_1.bgs_[var_228_0] = var_228_1
			end

			local var_228_2 = 2

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 then
				local var_228_3 = manager.ui.mainCamera.transform.localPosition
				local var_228_4 = Vector3.New(0, 0, 10) + Vector3.New(var_228_3.x, var_228_3.y, 0)
				local var_228_5 = arg_225_1.bgs_.C02a

				var_228_5.transform.localPosition = var_228_4
				var_228_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_228_6 = var_228_5:GetComponent("SpriteRenderer")

				if var_228_6 and var_228_6.sprite then
					local var_228_7 = (var_228_5.transform.localPosition - var_228_3).z
					local var_228_8 = manager.ui.mainCameraCom_
					local var_228_9 = 2 * var_228_7 * Mathf.Tan(var_228_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_228_10 = var_228_9 * var_228_8.aspect
					local var_228_11 = var_228_6.sprite.bounds.size.x
					local var_228_12 = var_228_6.sprite.bounds.size.y
					local var_228_13 = var_228_10 / var_228_11
					local var_228_14 = var_228_9 / var_228_12
					local var_228_15 = var_228_14 < var_228_13 and var_228_13 or var_228_14

					var_228_5.transform.localScale = Vector3.New(var_228_15, var_228_15, 0)
				end

				for iter_228_0, iter_228_1 in pairs(arg_225_1.bgs_) do
					if iter_228_0 ~= "C02a" then
						iter_228_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_228_16 = 4

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 then
				arg_225_1.allBtn_.enabled = false
			end

			local var_228_17 = 0.3

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 then
				arg_225_1.allBtn_.enabled = true
			end

			local var_228_18 = 0

			if var_228_18 < arg_225_1.time_ and arg_225_1.time_ <= var_228_18 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_19 = 2

			if var_228_18 <= arg_225_1.time_ and arg_225_1.time_ < var_228_18 + var_228_19 then
				local var_228_20 = (arg_225_1.time_ - var_228_18) / var_228_19
				local var_228_21 = Color.New(0, 0, 0)

				var_228_21.a = Mathf.Lerp(0, 1, var_228_20)
				arg_225_1.mask_.color = var_228_21
			end

			if arg_225_1.time_ >= var_228_18 + var_228_19 and arg_225_1.time_ < var_228_18 + var_228_19 + arg_228_0 then
				local var_228_22 = Color.New(0, 0, 0)

				var_228_22.a = 1
				arg_225_1.mask_.color = var_228_22
			end

			local var_228_23 = 2

			if var_228_23 < arg_225_1.time_ and arg_225_1.time_ <= var_228_23 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_24 = 2

			if var_228_23 <= arg_225_1.time_ and arg_225_1.time_ < var_228_23 + var_228_24 then
				local var_228_25 = (arg_225_1.time_ - var_228_23) / var_228_24
				local var_228_26 = Color.New(0, 0, 0)

				var_228_26.a = Mathf.Lerp(1, 0, var_228_25)
				arg_225_1.mask_.color = var_228_26
			end

			if arg_225_1.time_ >= var_228_23 + var_228_24 and arg_225_1.time_ < var_228_23 + var_228_24 + arg_228_0 then
				local var_228_27 = Color.New(0, 0, 0)
				local var_228_28 = 0

				arg_225_1.mask_.enabled = false
				var_228_27.a = var_228_28
				arg_225_1.mask_.color = var_228_27
			end

			local var_228_29 = arg_225_1.actors_["1049ui_story"].transform
			local var_228_30 = 1.96599999815226

			if var_228_30 < arg_225_1.time_ and arg_225_1.time_ <= var_228_30 + arg_228_0 then
				arg_225_1.var_.moveOldPos1049ui_story = var_228_29.localPosition
			end

			local var_228_31 = 0.001

			if var_228_30 <= arg_225_1.time_ and arg_225_1.time_ < var_228_30 + var_228_31 then
				local var_228_32 = (arg_225_1.time_ - var_228_30) / var_228_31
				local var_228_33 = Vector3.New(0, 100, 0)

				var_228_29.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1049ui_story, var_228_33, var_228_32)

				local var_228_34 = manager.ui.mainCamera.transform.position - var_228_29.position

				var_228_29.forward = Vector3.New(var_228_34.x, var_228_34.y, var_228_34.z)

				local var_228_35 = var_228_29.localEulerAngles

				var_228_35.z = 0
				var_228_35.x = 0
				var_228_29.localEulerAngles = var_228_35
			end

			if arg_225_1.time_ >= var_228_30 + var_228_31 and arg_225_1.time_ < var_228_30 + var_228_31 + arg_228_0 then
				var_228_29.localPosition = Vector3.New(0, 100, 0)

				local var_228_36 = manager.ui.mainCamera.transform.position - var_228_29.position

				var_228_29.forward = Vector3.New(var_228_36.x, var_228_36.y, var_228_36.z)

				local var_228_37 = var_228_29.localEulerAngles

				var_228_37.z = 0
				var_228_37.x = 0
				var_228_29.localEulerAngles = var_228_37
			end

			local var_228_38 = arg_225_1.actors_["1049ui_story"]
			local var_228_39 = 1.96599999815226

			if var_228_39 < arg_225_1.time_ and arg_225_1.time_ <= var_228_39 + arg_228_0 and not isNil(var_228_38) and arg_225_1.var_.characterEffect1049ui_story == nil then
				arg_225_1.var_.characterEffect1049ui_story = var_228_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_40 = 0.034000001847744

			if var_228_39 <= arg_225_1.time_ and arg_225_1.time_ < var_228_39 + var_228_40 and not isNil(var_228_38) then
				local var_228_41 = (arg_225_1.time_ - var_228_39) / var_228_40

				if arg_225_1.var_.characterEffect1049ui_story and not isNil(var_228_38) then
					local var_228_42 = Mathf.Lerp(0, 0.5, var_228_41)

					arg_225_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1049ui_story.fillRatio = var_228_42
				end
			end

			if arg_225_1.time_ >= var_228_39 + var_228_40 and arg_225_1.time_ < var_228_39 + var_228_40 + arg_228_0 and not isNil(var_228_38) and arg_225_1.var_.characterEffect1049ui_story then
				local var_228_43 = 0.5

				arg_225_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1049ui_story.fillRatio = var_228_43
			end

			local var_228_44 = arg_225_1.bgs_.C02a.transform
			local var_228_45 = 2

			if var_228_45 < arg_225_1.time_ and arg_225_1.time_ <= var_228_45 + arg_228_0 then
				arg_225_1.var_.moveOldPosC02a = var_228_44.localPosition
			end

			local var_228_46 = 3.5

			if var_228_45 <= arg_225_1.time_ and arg_225_1.time_ < var_228_45 + var_228_46 then
				local var_228_47 = (arg_225_1.time_ - var_228_45) / var_228_46
				local var_228_48 = Vector3.New(0, 1, 9.5)

				var_228_44.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPosC02a, var_228_48, var_228_47)
			end

			if arg_225_1.time_ >= var_228_45 + var_228_46 and arg_225_1.time_ < var_228_45 + var_228_46 + arg_228_0 then
				var_228_44.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_228_49 = 4

			if var_228_49 < arg_225_1.time_ and arg_225_1.time_ <= var_228_49 + arg_228_0 then
				arg_225_1.allBtn_.enabled = false
			end

			local var_228_50 = 1.5

			if arg_225_1.time_ >= var_228_49 + var_228_50 and arg_225_1.time_ < var_228_49 + var_228_50 + arg_228_0 then
				arg_225_1.allBtn_.enabled = true
			end

			if arg_225_1.frameCnt_ <= 1 then
				arg_225_1.dialog_:SetActive(false)
			end

			local var_228_51 = 4
			local var_228_52 = 0.725

			if var_228_51 < arg_225_1.time_ and arg_225_1.time_ <= var_228_51 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_53 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_53:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_54 = arg_225_1:GetWordFromCfg(1104905054)
				local var_228_55 = arg_225_1:FormatText(var_228_54.content)

				arg_225_1.text_.text = var_228_55

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_56 = 29
				local var_228_57 = utf8.len(var_228_55)
				local var_228_58 = var_228_56 <= 0 and var_228_52 or var_228_52 * (var_228_57 / var_228_56)

				if var_228_58 > 0 and var_228_52 < var_228_58 then
					arg_225_1.talkMaxDuration = var_228_58
					var_228_51 = var_228_51 + 0.3

					if var_228_58 + var_228_51 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_58 + var_228_51
					end
				end

				arg_225_1.text_.text = var_228_55
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_59 = var_228_51 + 0.3
			local var_228_60 = math.max(var_228_52, arg_225_1.talkMaxDuration)

			if var_228_59 <= arg_225_1.time_ and arg_225_1.time_ < var_228_59 + var_228_60 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_59) / var_228_60

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_59 + var_228_60 and arg_225_1.time_ < var_228_59 + var_228_60 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 1104905055
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play1104905056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.55

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[7].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(1104905055)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 22
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
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_8 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_8 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_8

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_8 and arg_231_1.time_ < var_234_0 + var_234_8 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905056 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 1104905056
		arg_235_1.duration_ = 10.67

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play1104905057(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 1.325

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[1006].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, true)
				arg_235_1.iconController_:SetSelectedState("hero")

				arg_235_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_235_1.callingController_:SetSelectedState("normal")

				arg_235_1.keyicon_.color = Color.New(1, 1, 1)
				arg_235_1.icon_.color = Color.New(1, 1, 1)

				local var_238_3 = arg_235_1:GetWordFromCfg(1104905056)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905056", "story_v_side_new_1104905.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905056", "story_v_side_new_1104905.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_side_new_1104905", "1104905056", "story_v_side_new_1104905.awb")

						arg_235_1:RecordAudio("1104905056", var_238_9)
						arg_235_1:RecordAudio("1104905056", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905056", "story_v_side_new_1104905.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905056", "story_v_side_new_1104905.awb")
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
	Play1104905057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 1104905057
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play1104905058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 1.425

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, false)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_2 = arg_239_1:GetWordFromCfg(1104905057)
				local var_242_3 = arg_239_1:FormatText(var_242_2.content)

				arg_239_1.text_.text = var_242_3

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_4 = 57
				local var_242_5 = utf8.len(var_242_3)
				local var_242_6 = var_242_4 <= 0 and var_242_1 or var_242_1 * (var_242_5 / var_242_4)

				if var_242_6 > 0 and var_242_1 < var_242_6 then
					arg_239_1.talkMaxDuration = var_242_6

					if var_242_6 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_6 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_3
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_7 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_7 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_7

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_7 and arg_239_1.time_ < var_242_0 + var_242_7 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905058 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 1104905058
		arg_243_1.duration_ = 5.7

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play1104905059(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.625

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[1006].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_243_1.callingController_:SetSelectedState("normal")

				arg_243_1.keyicon_.color = Color.New(1, 1, 1)
				arg_243_1.icon_.color = Color.New(1, 1, 1)

				local var_246_3 = arg_243_1:GetWordFromCfg(1104905058)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 25
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905058", "story_v_side_new_1104905.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905058", "story_v_side_new_1104905.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_side_new_1104905", "1104905058", "story_v_side_new_1104905.awb")

						arg_243_1:RecordAudio("1104905058", var_246_9)
						arg_243_1:RecordAudio("1104905058", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905058", "story_v_side_new_1104905.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905058", "story_v_side_new_1104905.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905059 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 1104905059
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play1104905060(arg_247_1)
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

				local var_250_3 = arg_247_1:GetWordFromCfg(1104905059)
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
	Play1104905060 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 1104905060
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play1104905061(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.2

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_2 = arg_251_1:GetWordFromCfg(1104905060)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 48
				local var_254_5 = utf8.len(var_254_3)
				local var_254_6 = var_254_4 <= 0 and var_254_1 or var_254_1 * (var_254_5 / var_254_4)

				if var_254_6 > 0 and var_254_1 < var_254_6 then
					arg_251_1.talkMaxDuration = var_254_6

					if var_254_6 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_6 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_3
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_7 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_7 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_7

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_7 and arg_251_1.time_ < var_254_0 + var_254_7 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905061 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 1104905061
		arg_255_1.duration_ = 5.07

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play1104905062(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.55

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[1006].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, true)
				arg_255_1.iconController_:SetSelectedState("hero")

				arg_255_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_255_1.callingController_:SetSelectedState("normal")

				arg_255_1.keyicon_.color = Color.New(1, 1, 1)
				arg_255_1.icon_.color = Color.New(1, 1, 1)

				local var_258_3 = arg_255_1:GetWordFromCfg(1104905061)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905061", "story_v_side_new_1104905.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905061", "story_v_side_new_1104905.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_side_new_1104905", "1104905061", "story_v_side_new_1104905.awb")

						arg_255_1:RecordAudio("1104905061", var_258_9)
						arg_255_1:RecordAudio("1104905061", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905061", "story_v_side_new_1104905.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905061", "story_v_side_new_1104905.awb")
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
	Play1104905062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 1104905062
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play1104905063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.075

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[7].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(1104905062)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 3
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_8 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_8 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_8

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_8 and arg_259_1.time_ < var_262_0 + var_262_8 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1104905063
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play1104905064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.45

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

				local var_266_3 = arg_263_1:GetWordFromCfg(1104905063)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 18
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
	Play1104905064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1104905064
		arg_267_1.duration_ = 9

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1104905065(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 2

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				local var_270_1 = manager.ui.mainCamera.transform.localPosition
				local var_270_2 = Vector3.New(0, 0, 10) + Vector3.New(var_270_1.x, var_270_1.y, 0)
				local var_270_3 = arg_267_1.bgs_.STblack

				var_270_3.transform.localPosition = var_270_2
				var_270_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_270_4 = var_270_3:GetComponent("SpriteRenderer")

				if var_270_4 and var_270_4.sprite then
					local var_270_5 = (var_270_3.transform.localPosition - var_270_1).z
					local var_270_6 = manager.ui.mainCameraCom_
					local var_270_7 = 2 * var_270_5 * Mathf.Tan(var_270_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_270_8 = var_270_7 * var_270_6.aspect
					local var_270_9 = var_270_4.sprite.bounds.size.x
					local var_270_10 = var_270_4.sprite.bounds.size.y
					local var_270_11 = var_270_8 / var_270_9
					local var_270_12 = var_270_7 / var_270_10
					local var_270_13 = var_270_12 < var_270_11 and var_270_11 or var_270_12

					var_270_3.transform.localScale = Vector3.New(var_270_13, var_270_13, 0)
				end

				for iter_270_0, iter_270_1 in pairs(arg_267_1.bgs_) do
					if iter_270_0 ~= "STblack" then
						iter_270_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_270_14 = 4

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1.allBtn_.enabled = false
			end

			local var_270_15 = 0.3

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 then
				arg_267_1.allBtn_.enabled = true
			end

			local var_270_16 = 0

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_17 = 2

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_16) / var_270_17
				local var_270_19 = Color.New(0, 0, 0)

				var_270_19.a = Mathf.Lerp(0, 1, var_270_18)
				arg_267_1.mask_.color = var_270_19
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 then
				local var_270_20 = Color.New(0, 0, 0)

				var_270_20.a = 1
				arg_267_1.mask_.color = var_270_20
			end

			local var_270_21 = 2

			if var_270_21 < arg_267_1.time_ and arg_267_1.time_ <= var_270_21 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_22 = 2

			if var_270_21 <= arg_267_1.time_ and arg_267_1.time_ < var_270_21 + var_270_22 then
				local var_270_23 = (arg_267_1.time_ - var_270_21) / var_270_22
				local var_270_24 = Color.New(0, 0, 0)

				var_270_24.a = Mathf.Lerp(1, 0, var_270_23)
				arg_267_1.mask_.color = var_270_24
			end

			if arg_267_1.time_ >= var_270_21 + var_270_22 and arg_267_1.time_ < var_270_21 + var_270_22 + arg_270_0 then
				local var_270_25 = Color.New(0, 0, 0)
				local var_270_26 = 0

				arg_267_1.mask_.enabled = false
				var_270_25.a = var_270_26
				arg_267_1.mask_.color = var_270_25
			end

			local var_270_27 = 0
			local var_270_28 = 0.2

			if var_270_27 < arg_267_1.time_ and arg_267_1.time_ <= var_270_27 + arg_270_0 then
				local var_270_29 = "play"
				local var_270_30 = "music"

				arg_267_1:AudioAction(var_270_29, var_270_30, "ui_battle", "ui_battle_stopbgm", "")

				local var_270_31 = ""
				local var_270_32 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_270_32 ~= "" then
					if arg_267_1.bgmTxt_.text ~= var_270_32 and arg_267_1.bgmTxt_.text ~= "" then
						if arg_267_1.bgmTxt2_.text ~= "" then
							arg_267_1.bgmTxt_.text = arg_267_1.bgmTxt2_.text
						end

						arg_267_1.bgmTxt2_.text = var_270_32

						arg_267_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_267_1.bgmTxt_.text = var_270_32
					end

					if arg_267_1.bgmTimer then
						arg_267_1.bgmTimer:Stop()

						arg_267_1.bgmTimer = nil
					end

					if arg_267_1.settingData.show_music_name == 1 then
						arg_267_1.musicController:SetSelectedState("show")
						arg_267_1.musicAnimator_:Play("open", 0, 0)

						if arg_267_1.settingData.music_time ~= 0 then
							arg_267_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_267_1.settingData.music_time), function()
								if arg_267_1 == nil or isNil(arg_267_1.bgmTxt_) then
									return
								end

								arg_267_1.musicController:SetSelectedState("hide")
								arg_267_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_267_1.frameCnt_ <= 1 then
				arg_267_1.dialog_:SetActive(false)
			end

			local var_270_33 = 4
			local var_270_34 = 0.975

			if var_270_33 < arg_267_1.time_ and arg_267_1.time_ <= var_270_33 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				arg_267_1.dialog_:SetActive(true)

				local var_270_35 = LeanTween.value(arg_267_1.dialog_, 0, 1, 0.3)

				var_270_35:setOnUpdate(LuaHelper.FloatAction(function(arg_272_0)
					arg_267_1.dialogCg_.alpha = arg_272_0
				end))
				var_270_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_267_1.dialog_)
					var_270_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_267_1.duration_ = arg_267_1.duration_ + 0.3

				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_36 = arg_267_1:GetWordFromCfg(1104905064)
				local var_270_37 = arg_267_1:FormatText(var_270_36.content)

				arg_267_1.text_.text = var_270_37

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_38 = 39
				local var_270_39 = utf8.len(var_270_37)
				local var_270_40 = var_270_38 <= 0 and var_270_34 or var_270_34 * (var_270_39 / var_270_38)

				if var_270_40 > 0 and var_270_34 < var_270_40 then
					arg_267_1.talkMaxDuration = var_270_40
					var_270_33 = var_270_33 + 0.3

					if var_270_40 + var_270_33 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_40 + var_270_33
					end
				end

				arg_267_1.text_.text = var_270_37
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_41 = var_270_33 + 0.3
			local var_270_42 = math.max(var_270_34, arg_267_1.talkMaxDuration)

			if var_270_41 <= arg_267_1.time_ and arg_267_1.time_ < var_270_41 + var_270_42 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_41) / var_270_42

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_41 + var_270_42 and arg_267_1.time_ < var_270_41 + var_270_42 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905065 = function(arg_274_0, arg_274_1)
		arg_274_1.time_ = 0
		arg_274_1.frameCnt_ = 0
		arg_274_1.state_ = "playing"
		arg_274_1.curTalkId_ = 1104905065
		arg_274_1.duration_ = 5

		SetActive(arg_274_1.tipsGo_, false)

		function arg_274_1.onSingleLineFinish_()
			arg_274_1.onSingleLineUpdate_ = nil
			arg_274_1.onSingleLineFinish_ = nil
			arg_274_1.state_ = "waiting"
		end

		function arg_274_1.playNext_(arg_276_0)
			if arg_276_0 == 1 then
				arg_274_0:Play1104905066(arg_274_1)
			end
		end

		function arg_274_1.onSingleLineUpdate_(arg_277_0)
			local var_277_0 = 0
			local var_277_1 = 0.675

			if var_277_0 < arg_274_1.time_ and arg_274_1.time_ <= var_277_0 + arg_277_0 then
				arg_274_1.talkMaxDuration = 0
				arg_274_1.dialogCg_.alpha = 1

				arg_274_1.dialog_:SetActive(true)
				SetActive(arg_274_1.leftNameGo_, true)

				local var_277_2 = arg_274_1:FormatText(StoryNameCfg[7].name)

				arg_274_1.leftNameTxt_.text = var_277_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_274_1.leftNameTxt_.transform)

				arg_274_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_274_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_274_1:RecordName(arg_274_1.leftNameTxt_.text)
				SetActive(arg_274_1.iconTrs_.gameObject, false)
				arg_274_1.callingController_:SetSelectedState("normal")

				local var_277_3 = arg_274_1:GetWordFromCfg(1104905065)
				local var_277_4 = arg_274_1:FormatText(var_277_3.content)

				arg_274_1.text_.text = var_277_4

				LuaForUtil.ClearLinePrefixSymbol(arg_274_1.text_)

				local var_277_5 = 27
				local var_277_6 = utf8.len(var_277_4)
				local var_277_7 = var_277_5 <= 0 and var_277_1 or var_277_1 * (var_277_6 / var_277_5)

				if var_277_7 > 0 and var_277_1 < var_277_7 then
					arg_274_1.talkMaxDuration = var_277_7

					if var_277_7 + var_277_0 > arg_274_1.duration_ then
						arg_274_1.duration_ = var_277_7 + var_277_0
					end
				end

				arg_274_1.text_.text = var_277_4
				arg_274_1.typewritter.percent = 0

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(false)
				arg_274_1:RecordContent(arg_274_1.text_.text)
			end

			local var_277_8 = math.max(var_277_1, arg_274_1.talkMaxDuration)

			if var_277_0 <= arg_274_1.time_ and arg_274_1.time_ < var_277_0 + var_277_8 then
				arg_274_1.typewritter.percent = (arg_274_1.time_ - var_277_0) / var_277_8

				arg_274_1.typewritter:SetDirty()
			end

			if arg_274_1.time_ >= var_277_0 + var_277_8 and arg_274_1.time_ < var_277_0 + var_277_8 + arg_277_0 then
				arg_274_1.typewritter.percent = 1

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905066 = function(arg_278_0, arg_278_1)
		arg_278_1.time_ = 0
		arg_278_1.frameCnt_ = 0
		arg_278_1.state_ = "playing"
		arg_278_1.curTalkId_ = 1104905066
		arg_278_1.duration_ = 5

		SetActive(arg_278_1.tipsGo_, false)

		function arg_278_1.onSingleLineFinish_()
			arg_278_1.onSingleLineUpdate_ = nil
			arg_278_1.onSingleLineFinish_ = nil
			arg_278_1.state_ = "waiting"
		end

		function arg_278_1.playNext_(arg_280_0)
			if arg_280_0 == 1 then
				arg_278_0:Play1104905067(arg_278_1)
			end
		end

		function arg_278_1.onSingleLineUpdate_(arg_281_0)
			local var_281_0 = 0
			local var_281_1 = 0.3

			if var_281_0 < arg_278_1.time_ and arg_278_1.time_ <= var_281_0 + arg_281_0 then
				arg_278_1.talkMaxDuration = 0
				arg_278_1.dialogCg_.alpha = 1

				arg_278_1.dialog_:SetActive(true)
				SetActive(arg_278_1.leftNameGo_, true)

				local var_281_2 = arg_278_1:FormatText(StoryNameCfg[7].name)

				arg_278_1.leftNameTxt_.text = var_281_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_278_1.leftNameTxt_.transform)

				arg_278_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_278_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_278_1:RecordName(arg_278_1.leftNameTxt_.text)
				SetActive(arg_278_1.iconTrs_.gameObject, false)
				arg_278_1.callingController_:SetSelectedState("normal")

				local var_281_3 = arg_278_1:GetWordFromCfg(1104905066)
				local var_281_4 = arg_278_1:FormatText(var_281_3.content)

				arg_278_1.text_.text = var_281_4

				LuaForUtil.ClearLinePrefixSymbol(arg_278_1.text_)

				local var_281_5 = 12
				local var_281_6 = utf8.len(var_281_4)
				local var_281_7 = var_281_5 <= 0 and var_281_1 or var_281_1 * (var_281_6 / var_281_5)

				if var_281_7 > 0 and var_281_1 < var_281_7 then
					arg_278_1.talkMaxDuration = var_281_7

					if var_281_7 + var_281_0 > arg_278_1.duration_ then
						arg_278_1.duration_ = var_281_7 + var_281_0
					end
				end

				arg_278_1.text_.text = var_281_4
				arg_278_1.typewritter.percent = 0

				arg_278_1.typewritter:SetDirty()
				arg_278_1:ShowNextGo(false)
				arg_278_1:RecordContent(arg_278_1.text_.text)
			end

			local var_281_8 = math.max(var_281_1, arg_278_1.talkMaxDuration)

			if var_281_0 <= arg_278_1.time_ and arg_278_1.time_ < var_281_0 + var_281_8 then
				arg_278_1.typewritter.percent = (arg_278_1.time_ - var_281_0) / var_281_8

				arg_278_1.typewritter:SetDirty()
			end

			if arg_278_1.time_ >= var_281_0 + var_281_8 and arg_278_1.time_ < var_281_0 + var_281_8 + arg_281_0 then
				arg_278_1.typewritter.percent = 1

				arg_278_1.typewritter:SetDirty()
				arg_278_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905067 = function(arg_282_0, arg_282_1)
		arg_282_1.time_ = 0
		arg_282_1.frameCnt_ = 0
		arg_282_1.state_ = "playing"
		arg_282_1.curTalkId_ = 1104905067
		arg_282_1.duration_ = 7

		SetActive(arg_282_1.tipsGo_, false)

		function arg_282_1.onSingleLineFinish_()
			arg_282_1.onSingleLineUpdate_ = nil
			arg_282_1.onSingleLineFinish_ = nil
			arg_282_1.state_ = "waiting"
		end

		function arg_282_1.playNext_(arg_284_0)
			if arg_284_0 == 1 then
				arg_282_0:Play1104905068(arg_282_1)
			end
		end

		function arg_282_1.onSingleLineUpdate_(arg_285_0)
			local var_285_0 = "ST58"

			if arg_282_1.bgs_[var_285_0] == nil then
				local var_285_1 = Object.Instantiate(arg_282_1.paintGo_)

				var_285_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_285_0)
				var_285_1.name = var_285_0
				var_285_1.transform.parent = arg_282_1.stage_.transform
				var_285_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_282_1.bgs_[var_285_0] = var_285_1
			end

			local var_285_2 = 0

			if var_285_2 < arg_282_1.time_ and arg_282_1.time_ <= var_285_2 + arg_285_0 then
				local var_285_3 = manager.ui.mainCamera.transform.localPosition
				local var_285_4 = Vector3.New(0, 0, 10) + Vector3.New(var_285_3.x, var_285_3.y, 0)
				local var_285_5 = arg_282_1.bgs_.ST58

				var_285_5.transform.localPosition = var_285_4
				var_285_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_285_6 = var_285_5:GetComponent("SpriteRenderer")

				if var_285_6 and var_285_6.sprite then
					local var_285_7 = (var_285_5.transform.localPosition - var_285_3).z
					local var_285_8 = manager.ui.mainCameraCom_
					local var_285_9 = 2 * var_285_7 * Mathf.Tan(var_285_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_285_10 = var_285_9 * var_285_8.aspect
					local var_285_11 = var_285_6.sprite.bounds.size.x
					local var_285_12 = var_285_6.sprite.bounds.size.y
					local var_285_13 = var_285_10 / var_285_11
					local var_285_14 = var_285_9 / var_285_12
					local var_285_15 = var_285_14 < var_285_13 and var_285_13 or var_285_14

					var_285_5.transform.localScale = Vector3.New(var_285_15, var_285_15, 0)
				end

				for iter_285_0, iter_285_1 in pairs(arg_282_1.bgs_) do
					if iter_285_0 ~= "ST58" then
						iter_285_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_285_16 = 2

			if var_285_16 < arg_282_1.time_ and arg_282_1.time_ <= var_285_16 + arg_285_0 then
				arg_282_1.allBtn_.enabled = false
			end

			local var_285_17 = 0.3

			if arg_282_1.time_ >= var_285_16 + var_285_17 and arg_282_1.time_ < var_285_16 + var_285_17 + arg_285_0 then
				arg_282_1.allBtn_.enabled = true
			end

			local var_285_18 = 0

			if var_285_18 < arg_282_1.time_ and arg_282_1.time_ <= var_285_18 + arg_285_0 then
				arg_282_1.mask_.enabled = true
				arg_282_1.mask_.raycastTarget = true

				arg_282_1:SetGaussion(false)
			end

			local var_285_19 = 2

			if var_285_18 <= arg_282_1.time_ and arg_282_1.time_ < var_285_18 + var_285_19 then
				local var_285_20 = (arg_282_1.time_ - var_285_18) / var_285_19
				local var_285_21 = Color.New(0, 0, 0)

				var_285_21.a = Mathf.Lerp(1, 0, var_285_20)
				arg_282_1.mask_.color = var_285_21
			end

			if arg_282_1.time_ >= var_285_18 + var_285_19 and arg_282_1.time_ < var_285_18 + var_285_19 + arg_285_0 then
				local var_285_22 = Color.New(0, 0, 0)
				local var_285_23 = 0

				arg_282_1.mask_.enabled = false
				var_285_22.a = var_285_23
				arg_282_1.mask_.color = var_285_22
			end

			local var_285_24 = 0
			local var_285_25 = 0.2

			if var_285_24 < arg_282_1.time_ and arg_282_1.time_ <= var_285_24 + arg_285_0 then
				local var_285_26 = "play"
				local var_285_27 = "music"

				arg_282_1:AudioAction(var_285_26, var_285_27, "ui_battle", "ui_battle_stopbgm", "")

				local var_285_28 = ""
				local var_285_29 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_285_29 ~= "" then
					if arg_282_1.bgmTxt_.text ~= var_285_29 and arg_282_1.bgmTxt_.text ~= "" then
						if arg_282_1.bgmTxt2_.text ~= "" then
							arg_282_1.bgmTxt_.text = arg_282_1.bgmTxt2_.text
						end

						arg_282_1.bgmTxt2_.text = var_285_29

						arg_282_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_282_1.bgmTxt_.text = var_285_29
					end

					if arg_282_1.bgmTimer then
						arg_282_1.bgmTimer:Stop()

						arg_282_1.bgmTimer = nil
					end

					if arg_282_1.settingData.show_music_name == 1 then
						arg_282_1.musicController:SetSelectedState("show")
						arg_282_1.musicAnimator_:Play("open", 0, 0)

						if arg_282_1.settingData.music_time ~= 0 then
							arg_282_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_282_1.settingData.music_time), function()
								if arg_282_1 == nil or isNil(arg_282_1.bgmTxt_) then
									return
								end

								arg_282_1.musicController:SetSelectedState("hide")
								arg_282_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_285_30 = 0.4
			local var_285_31 = 1

			if var_285_30 < arg_282_1.time_ and arg_282_1.time_ <= var_285_30 + arg_285_0 then
				local var_285_32 = "play"
				local var_285_33 = "music"

				arg_282_1:AudioAction(var_285_32, var_285_33, "bgm_activity_2_6_story_sasanami_quiet", "bgm_activity_2_6_story_sasanami_quiet", "bgm_activity_2_6_story_sasanami_quiet.awb")

				local var_285_34 = ""
				local var_285_35 = manager.audio:GetAudioName("bgm_activity_2_6_story_sasanami_quiet", "bgm_activity_2_6_story_sasanami_quiet")

				if var_285_35 ~= "" then
					if arg_282_1.bgmTxt_.text ~= var_285_35 and arg_282_1.bgmTxt_.text ~= "" then
						if arg_282_1.bgmTxt2_.text ~= "" then
							arg_282_1.bgmTxt_.text = arg_282_1.bgmTxt2_.text
						end

						arg_282_1.bgmTxt2_.text = var_285_35

						arg_282_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_282_1.bgmTxt_.text = var_285_35
					end

					if arg_282_1.bgmTimer then
						arg_282_1.bgmTimer:Stop()

						arg_282_1.bgmTimer = nil
					end

					if arg_282_1.settingData.show_music_name == 1 then
						arg_282_1.musicController:SetSelectedState("show")
						arg_282_1.musicAnimator_:Play("open", 0, 0)

						if arg_282_1.settingData.music_time ~= 0 then
							arg_282_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_282_1.settingData.music_time), function()
								if arg_282_1 == nil or isNil(arg_282_1.bgmTxt_) then
									return
								end

								arg_282_1.musicController:SetSelectedState("hide")
								arg_282_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_285_36 = 0
			local var_285_37 = 1

			if var_285_36 < arg_282_1.time_ and arg_282_1.time_ <= var_285_36 + arg_285_0 then
				local var_285_38 = "play"
				local var_285_39 = "effect"

				arg_282_1:AudioAction(var_285_38, var_285_39, "se_story_side_1049", "se_story_side_1049_amb_room", "")
			end

			local var_285_40 = 0
			local var_285_41 = 1

			if var_285_40 < arg_282_1.time_ and arg_282_1.time_ <= var_285_40 + arg_285_0 then
				local var_285_42 = "stop"
				local var_285_43 = "effect"

				arg_282_1:AudioAction(var_285_42, var_285_43, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			local var_285_44 = 0
			local var_285_45 = 1

			if var_285_44 < arg_282_1.time_ and arg_282_1.time_ <= var_285_44 + arg_285_0 then
				local var_285_46 = "stop"
				local var_285_47 = "effect"

				arg_282_1:AudioAction(var_285_46, var_285_47, "se_story_side_1049", "se_story_side_1049_crowdloop", "")
			end

			if arg_282_1.frameCnt_ <= 1 then
				arg_282_1.dialog_:SetActive(false)
			end

			local var_285_48 = 2
			local var_285_49 = 0.15

			if var_285_48 < arg_282_1.time_ and arg_282_1.time_ <= var_285_48 + arg_285_0 then
				arg_282_1.talkMaxDuration = 0

				arg_282_1.dialog_:SetActive(true)

				local var_285_50 = LeanTween.value(arg_282_1.dialog_, 0, 1, 0.3)

				var_285_50:setOnUpdate(LuaHelper.FloatAction(function(arg_288_0)
					arg_282_1.dialogCg_.alpha = arg_288_0
				end))
				var_285_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_282_1.dialog_)
					var_285_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_282_1.duration_ = arg_282_1.duration_ + 0.3

				SetActive(arg_282_1.leftNameGo_, true)

				local var_285_51 = arg_282_1:FormatText(StoryNameCfg[7].name)

				arg_282_1.leftNameTxt_.text = var_285_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_282_1.leftNameTxt_.transform)

				arg_282_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_282_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_282_1:RecordName(arg_282_1.leftNameTxt_.text)
				SetActive(arg_282_1.iconTrs_.gameObject, false)
				arg_282_1.callingController_:SetSelectedState("normal")

				local var_285_52 = arg_282_1:GetWordFromCfg(1104905067)
				local var_285_53 = arg_282_1:FormatText(var_285_52.content)

				arg_282_1.text_.text = var_285_53

				LuaForUtil.ClearLinePrefixSymbol(arg_282_1.text_)

				local var_285_54 = 6
				local var_285_55 = utf8.len(var_285_53)
				local var_285_56 = var_285_54 <= 0 and var_285_49 or var_285_49 * (var_285_55 / var_285_54)

				if var_285_56 > 0 and var_285_49 < var_285_56 then
					arg_282_1.talkMaxDuration = var_285_56
					var_285_48 = var_285_48 + 0.3

					if var_285_56 + var_285_48 > arg_282_1.duration_ then
						arg_282_1.duration_ = var_285_56 + var_285_48
					end
				end

				arg_282_1.text_.text = var_285_53
				arg_282_1.typewritter.percent = 0

				arg_282_1.typewritter:SetDirty()
				arg_282_1:ShowNextGo(false)
				arg_282_1:RecordContent(arg_282_1.text_.text)
			end

			local var_285_57 = var_285_48 + 0.3
			local var_285_58 = math.max(var_285_49, arg_282_1.talkMaxDuration)

			if var_285_57 <= arg_282_1.time_ and arg_282_1.time_ < var_285_57 + var_285_58 then
				arg_282_1.typewritter.percent = (arg_282_1.time_ - var_285_57) / var_285_58

				arg_282_1.typewritter:SetDirty()
			end

			if arg_282_1.time_ >= var_285_57 + var_285_58 and arg_282_1.time_ < var_285_57 + var_285_58 + arg_285_0 then
				arg_282_1.typewritter.percent = 1

				arg_282_1.typewritter:SetDirty()
				arg_282_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905068 = function(arg_290_0, arg_290_1)
		arg_290_1.time_ = 0
		arg_290_1.frameCnt_ = 0
		arg_290_1.state_ = "playing"
		arg_290_1.curTalkId_ = 1104905068
		arg_290_1.duration_ = 5

		SetActive(arg_290_1.tipsGo_, false)

		function arg_290_1.onSingleLineFinish_()
			arg_290_1.onSingleLineUpdate_ = nil
			arg_290_1.onSingleLineFinish_ = nil
			arg_290_1.state_ = "waiting"
		end

		function arg_290_1.playNext_(arg_292_0)
			if arg_292_0 == 1 then
				arg_290_0:Play1104905069(arg_290_1)
			end
		end

		function arg_290_1.onSingleLineUpdate_(arg_293_0)
			local var_293_0 = 0
			local var_293_1 = 1.125

			if var_293_0 < arg_290_1.time_ and arg_290_1.time_ <= var_293_0 + arg_293_0 then
				arg_290_1.talkMaxDuration = 0
				arg_290_1.dialogCg_.alpha = 1

				arg_290_1.dialog_:SetActive(true)
				SetActive(arg_290_1.leftNameGo_, false)

				arg_290_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_290_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_290_1:RecordName(arg_290_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_290_1.iconTrs_.gameObject, false)
				arg_290_1.callingController_:SetSelectedState("normal")

				local var_293_2 = arg_290_1:GetWordFromCfg(1104905068)
				local var_293_3 = arg_290_1:FormatText(var_293_2.content)

				arg_290_1.text_.text = var_293_3

				LuaForUtil.ClearLinePrefixSymbol(arg_290_1.text_)

				local var_293_4 = 45
				local var_293_5 = utf8.len(var_293_3)
				local var_293_6 = var_293_4 <= 0 and var_293_1 or var_293_1 * (var_293_5 / var_293_4)

				if var_293_6 > 0 and var_293_1 < var_293_6 then
					arg_290_1.talkMaxDuration = var_293_6

					if var_293_6 + var_293_0 > arg_290_1.duration_ then
						arg_290_1.duration_ = var_293_6 + var_293_0
					end
				end

				arg_290_1.text_.text = var_293_3
				arg_290_1.typewritter.percent = 0

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(false)
				arg_290_1:RecordContent(arg_290_1.text_.text)
			end

			local var_293_7 = math.max(var_293_1, arg_290_1.talkMaxDuration)

			if var_293_0 <= arg_290_1.time_ and arg_290_1.time_ < var_293_0 + var_293_7 then
				arg_290_1.typewritter.percent = (arg_290_1.time_ - var_293_0) / var_293_7

				arg_290_1.typewritter:SetDirty()
			end

			if arg_290_1.time_ >= var_293_0 + var_293_7 and arg_290_1.time_ < var_293_0 + var_293_7 + arg_293_0 then
				arg_290_1.typewritter.percent = 1

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905069 = function(arg_294_0, arg_294_1)
		arg_294_1.time_ = 0
		arg_294_1.frameCnt_ = 0
		arg_294_1.state_ = "playing"
		arg_294_1.curTalkId_ = 1104905069
		arg_294_1.duration_ = 5

		SetActive(arg_294_1.tipsGo_, false)

		function arg_294_1.onSingleLineFinish_()
			arg_294_1.onSingleLineUpdate_ = nil
			arg_294_1.onSingleLineFinish_ = nil
			arg_294_1.state_ = "waiting"
		end

		function arg_294_1.playNext_(arg_296_0)
			if arg_296_0 == 1 then
				arg_294_0:Play1104905070(arg_294_1)
			end
		end

		function arg_294_1.onSingleLineUpdate_(arg_297_0)
			local var_297_0 = 0
			local var_297_1 = 1.35

			if var_297_0 < arg_294_1.time_ and arg_294_1.time_ <= var_297_0 + arg_297_0 then
				arg_294_1.talkMaxDuration = 0
				arg_294_1.dialogCg_.alpha = 1

				arg_294_1.dialog_:SetActive(true)
				SetActive(arg_294_1.leftNameGo_, false)

				arg_294_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_294_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_294_1:RecordName(arg_294_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_294_1.iconTrs_.gameObject, false)
				arg_294_1.callingController_:SetSelectedState("normal")

				local var_297_2 = arg_294_1:GetWordFromCfg(1104905069)
				local var_297_3 = arg_294_1:FormatText(var_297_2.content)

				arg_294_1.text_.text = var_297_3

				LuaForUtil.ClearLinePrefixSymbol(arg_294_1.text_)

				local var_297_4 = 54
				local var_297_5 = utf8.len(var_297_3)
				local var_297_6 = var_297_4 <= 0 and var_297_1 or var_297_1 * (var_297_5 / var_297_4)

				if var_297_6 > 0 and var_297_1 < var_297_6 then
					arg_294_1.talkMaxDuration = var_297_6

					if var_297_6 + var_297_0 > arg_294_1.duration_ then
						arg_294_1.duration_ = var_297_6 + var_297_0
					end
				end

				arg_294_1.text_.text = var_297_3
				arg_294_1.typewritter.percent = 0

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(false)
				arg_294_1:RecordContent(arg_294_1.text_.text)
			end

			local var_297_7 = math.max(var_297_1, arg_294_1.talkMaxDuration)

			if var_297_0 <= arg_294_1.time_ and arg_294_1.time_ < var_297_0 + var_297_7 then
				arg_294_1.typewritter.percent = (arg_294_1.time_ - var_297_0) / var_297_7

				arg_294_1.typewritter:SetDirty()
			end

			if arg_294_1.time_ >= var_297_0 + var_297_7 and arg_294_1.time_ < var_297_0 + var_297_7 + arg_297_0 then
				arg_294_1.typewritter.percent = 1

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905070 = function(arg_298_0, arg_298_1)
		arg_298_1.time_ = 0
		arg_298_1.frameCnt_ = 0
		arg_298_1.state_ = "playing"
		arg_298_1.curTalkId_ = 1104905070
		arg_298_1.duration_ = 5

		SetActive(arg_298_1.tipsGo_, false)

		function arg_298_1.onSingleLineFinish_()
			arg_298_1.onSingleLineUpdate_ = nil
			arg_298_1.onSingleLineFinish_ = nil
			arg_298_1.state_ = "waiting"
		end

		function arg_298_1.playNext_(arg_300_0)
			if arg_300_0 == 1 then
				arg_298_0:Play1104905071(arg_298_1)
			end
		end

		function arg_298_1.onSingleLineUpdate_(arg_301_0)
			local var_301_0 = 0
			local var_301_1 = 0.1

			if var_301_0 < arg_298_1.time_ and arg_298_1.time_ <= var_301_0 + arg_301_0 then
				arg_298_1.talkMaxDuration = 0
				arg_298_1.dialogCg_.alpha = 1

				arg_298_1.dialog_:SetActive(true)
				SetActive(arg_298_1.leftNameGo_, true)

				local var_301_2 = arg_298_1:FormatText(StoryNameCfg[7].name)

				arg_298_1.leftNameTxt_.text = var_301_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_298_1.leftNameTxt_.transform)

				arg_298_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_298_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_298_1:RecordName(arg_298_1.leftNameTxt_.text)
				SetActive(arg_298_1.iconTrs_.gameObject, false)
				arg_298_1.callingController_:SetSelectedState("normal")

				local var_301_3 = arg_298_1:GetWordFromCfg(1104905070)
				local var_301_4 = arg_298_1:FormatText(var_301_3.content)

				arg_298_1.text_.text = var_301_4

				LuaForUtil.ClearLinePrefixSymbol(arg_298_1.text_)

				local var_301_5 = 4
				local var_301_6 = utf8.len(var_301_4)
				local var_301_7 = var_301_5 <= 0 and var_301_1 or var_301_1 * (var_301_6 / var_301_5)

				if var_301_7 > 0 and var_301_1 < var_301_7 then
					arg_298_1.talkMaxDuration = var_301_7

					if var_301_7 + var_301_0 > arg_298_1.duration_ then
						arg_298_1.duration_ = var_301_7 + var_301_0
					end
				end

				arg_298_1.text_.text = var_301_4
				arg_298_1.typewritter.percent = 0

				arg_298_1.typewritter:SetDirty()
				arg_298_1:ShowNextGo(false)
				arg_298_1:RecordContent(arg_298_1.text_.text)
			end

			local var_301_8 = math.max(var_301_1, arg_298_1.talkMaxDuration)

			if var_301_0 <= arg_298_1.time_ and arg_298_1.time_ < var_301_0 + var_301_8 then
				arg_298_1.typewritter.percent = (arg_298_1.time_ - var_301_0) / var_301_8

				arg_298_1.typewritter:SetDirty()
			end

			if arg_298_1.time_ >= var_301_0 + var_301_8 and arg_298_1.time_ < var_301_0 + var_301_8 + arg_301_0 then
				arg_298_1.typewritter.percent = 1

				arg_298_1.typewritter:SetDirty()
				arg_298_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905071 = function(arg_302_0, arg_302_1)
		arg_302_1.time_ = 0
		arg_302_1.frameCnt_ = 0
		arg_302_1.state_ = "playing"
		arg_302_1.curTalkId_ = 1104905071
		arg_302_1.duration_ = 5

		SetActive(arg_302_1.tipsGo_, false)

		function arg_302_1.onSingleLineFinish_()
			arg_302_1.onSingleLineUpdate_ = nil
			arg_302_1.onSingleLineFinish_ = nil
			arg_302_1.state_ = "waiting"
		end

		function arg_302_1.playNext_(arg_304_0)
			if arg_304_0 == 1 then
				arg_302_0:Play1104905072(arg_302_1)
			end
		end

		function arg_302_1.onSingleLineUpdate_(arg_305_0)
			local var_305_0 = 0
			local var_305_1 = 0.575

			if var_305_0 < arg_302_1.time_ and arg_302_1.time_ <= var_305_0 + arg_305_0 then
				arg_302_1.talkMaxDuration = 0
				arg_302_1.dialogCg_.alpha = 1

				arg_302_1.dialog_:SetActive(true)
				SetActive(arg_302_1.leftNameGo_, false)

				arg_302_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_302_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_302_1:RecordName(arg_302_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_302_1.iconTrs_.gameObject, false)
				arg_302_1.callingController_:SetSelectedState("normal")

				local var_305_2 = arg_302_1:GetWordFromCfg(1104905071)
				local var_305_3 = arg_302_1:FormatText(var_305_2.content)

				arg_302_1.text_.text = var_305_3

				LuaForUtil.ClearLinePrefixSymbol(arg_302_1.text_)

				local var_305_4 = 23
				local var_305_5 = utf8.len(var_305_3)
				local var_305_6 = var_305_4 <= 0 and var_305_1 or var_305_1 * (var_305_5 / var_305_4)

				if var_305_6 > 0 and var_305_1 < var_305_6 then
					arg_302_1.talkMaxDuration = var_305_6

					if var_305_6 + var_305_0 > arg_302_1.duration_ then
						arg_302_1.duration_ = var_305_6 + var_305_0
					end
				end

				arg_302_1.text_.text = var_305_3
				arg_302_1.typewritter.percent = 0

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(false)
				arg_302_1:RecordContent(arg_302_1.text_.text)
			end

			local var_305_7 = math.max(var_305_1, arg_302_1.talkMaxDuration)

			if var_305_0 <= arg_302_1.time_ and arg_302_1.time_ < var_305_0 + var_305_7 then
				arg_302_1.typewritter.percent = (arg_302_1.time_ - var_305_0) / var_305_7

				arg_302_1.typewritter:SetDirty()
			end

			if arg_302_1.time_ >= var_305_0 + var_305_7 and arg_302_1.time_ < var_305_0 + var_305_7 + arg_305_0 then
				arg_302_1.typewritter.percent = 1

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905072 = function(arg_306_0, arg_306_1)
		arg_306_1.time_ = 0
		arg_306_1.frameCnt_ = 0
		arg_306_1.state_ = "playing"
		arg_306_1.curTalkId_ = 1104905072
		arg_306_1.duration_ = 3.6

		SetActive(arg_306_1.tipsGo_, false)

		function arg_306_1.onSingleLineFinish_()
			arg_306_1.onSingleLineUpdate_ = nil
			arg_306_1.onSingleLineFinish_ = nil
			arg_306_1.state_ = "waiting"
		end

		function arg_306_1.playNext_(arg_308_0)
			if arg_308_0 == 1 then
				arg_306_0:Play1104905073(arg_306_1)
			end
		end

		function arg_306_1.onSingleLineUpdate_(arg_309_0)
			local var_309_0 = arg_306_1.actors_["1049ui_story"].transform
			local var_309_1 = 0

			if var_309_1 < arg_306_1.time_ and arg_306_1.time_ <= var_309_1 + arg_309_0 then
				arg_306_1.var_.moveOldPos1049ui_story = var_309_0.localPosition
			end

			local var_309_2 = 0.001

			if var_309_1 <= arg_306_1.time_ and arg_306_1.time_ < var_309_1 + var_309_2 then
				local var_309_3 = (arg_306_1.time_ - var_309_1) / var_309_2
				local var_309_4 = Vector3.New(0, -1.2, -6)

				var_309_0.localPosition = Vector3.Lerp(arg_306_1.var_.moveOldPos1049ui_story, var_309_4, var_309_3)

				local var_309_5 = manager.ui.mainCamera.transform.position - var_309_0.position

				var_309_0.forward = Vector3.New(var_309_5.x, var_309_5.y, var_309_5.z)

				local var_309_6 = var_309_0.localEulerAngles

				var_309_6.z = 0
				var_309_6.x = 0
				var_309_0.localEulerAngles = var_309_6
			end

			if arg_306_1.time_ >= var_309_1 + var_309_2 and arg_306_1.time_ < var_309_1 + var_309_2 + arg_309_0 then
				var_309_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_309_7 = manager.ui.mainCamera.transform.position - var_309_0.position

				var_309_0.forward = Vector3.New(var_309_7.x, var_309_7.y, var_309_7.z)

				local var_309_8 = var_309_0.localEulerAngles

				var_309_8.z = 0
				var_309_8.x = 0
				var_309_0.localEulerAngles = var_309_8
			end

			local var_309_9 = arg_306_1.actors_["1049ui_story"]
			local var_309_10 = 0

			if var_309_10 < arg_306_1.time_ and arg_306_1.time_ <= var_309_10 + arg_309_0 and not isNil(var_309_9) and arg_306_1.var_.characterEffect1049ui_story == nil then
				arg_306_1.var_.characterEffect1049ui_story = var_309_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_309_11 = 0.200000002980232

			if var_309_10 <= arg_306_1.time_ and arg_306_1.time_ < var_309_10 + var_309_11 and not isNil(var_309_9) then
				local var_309_12 = (arg_306_1.time_ - var_309_10) / var_309_11

				if arg_306_1.var_.characterEffect1049ui_story and not isNil(var_309_9) then
					arg_306_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_306_1.time_ >= var_309_10 + var_309_11 and arg_306_1.time_ < var_309_10 + var_309_11 + arg_309_0 and not isNil(var_309_9) and arg_306_1.var_.characterEffect1049ui_story then
				arg_306_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_309_13 = 0

			if var_309_13 < arg_306_1.time_ and arg_306_1.time_ <= var_309_13 + arg_309_0 then
				arg_306_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_309_14 = 0

			if var_309_14 < arg_306_1.time_ and arg_306_1.time_ <= var_309_14 + arg_309_0 then
				arg_306_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_309_15 = 0
			local var_309_16 = 0.3

			if var_309_15 < arg_306_1.time_ and arg_306_1.time_ <= var_309_15 + arg_309_0 then
				arg_306_1.talkMaxDuration = 0
				arg_306_1.dialogCg_.alpha = 1

				arg_306_1.dialog_:SetActive(true)
				SetActive(arg_306_1.leftNameGo_, true)

				local var_309_17 = arg_306_1:FormatText(StoryNameCfg[551].name)

				arg_306_1.leftNameTxt_.text = var_309_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_306_1.leftNameTxt_.transform)

				arg_306_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_306_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_306_1:RecordName(arg_306_1.leftNameTxt_.text)
				SetActive(arg_306_1.iconTrs_.gameObject, false)
				arg_306_1.callingController_:SetSelectedState("normal")

				local var_309_18 = arg_306_1:GetWordFromCfg(1104905072)
				local var_309_19 = arg_306_1:FormatText(var_309_18.content)

				arg_306_1.text_.text = var_309_19

				LuaForUtil.ClearLinePrefixSymbol(arg_306_1.text_)

				local var_309_20 = 12
				local var_309_21 = utf8.len(var_309_19)
				local var_309_22 = var_309_20 <= 0 and var_309_16 or var_309_16 * (var_309_21 / var_309_20)

				if var_309_22 > 0 and var_309_16 < var_309_22 then
					arg_306_1.talkMaxDuration = var_309_22

					if var_309_22 + var_309_15 > arg_306_1.duration_ then
						arg_306_1.duration_ = var_309_22 + var_309_15
					end
				end

				arg_306_1.text_.text = var_309_19
				arg_306_1.typewritter.percent = 0

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905072", "story_v_side_new_1104905.awb") ~= 0 then
					local var_309_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905072", "story_v_side_new_1104905.awb") / 1000

					if var_309_23 + var_309_15 > arg_306_1.duration_ then
						arg_306_1.duration_ = var_309_23 + var_309_15
					end

					if var_309_18.prefab_name ~= "" and arg_306_1.actors_[var_309_18.prefab_name] ~= nil then
						local var_309_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_306_1.actors_[var_309_18.prefab_name].transform, "story_v_side_new_1104905", "1104905072", "story_v_side_new_1104905.awb")

						arg_306_1:RecordAudio("1104905072", var_309_24)
						arg_306_1:RecordAudio("1104905072", var_309_24)
					else
						arg_306_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905072", "story_v_side_new_1104905.awb")
					end

					arg_306_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905072", "story_v_side_new_1104905.awb")
				end

				arg_306_1:RecordContent(arg_306_1.text_.text)
			end

			local var_309_25 = math.max(var_309_16, arg_306_1.talkMaxDuration)

			if var_309_15 <= arg_306_1.time_ and arg_306_1.time_ < var_309_15 + var_309_25 then
				arg_306_1.typewritter.percent = (arg_306_1.time_ - var_309_15) / var_309_25

				arg_306_1.typewritter:SetDirty()
			end

			if arg_306_1.time_ >= var_309_15 + var_309_25 and arg_306_1.time_ < var_309_15 + var_309_25 + arg_309_0 then
				arg_306_1.typewritter.percent = 1

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905073 = function(arg_310_0, arg_310_1)
		arg_310_1.time_ = 0
		arg_310_1.frameCnt_ = 0
		arg_310_1.state_ = "playing"
		arg_310_1.curTalkId_ = 1104905073
		arg_310_1.duration_ = 5

		SetActive(arg_310_1.tipsGo_, false)

		function arg_310_1.onSingleLineFinish_()
			arg_310_1.onSingleLineUpdate_ = nil
			arg_310_1.onSingleLineFinish_ = nil
			arg_310_1.state_ = "waiting"
		end

		function arg_310_1.playNext_(arg_312_0)
			if arg_312_0 == 1 then
				arg_310_0:Play1104905074(arg_310_1)
			end
		end

		function arg_310_1.onSingleLineUpdate_(arg_313_0)
			local var_313_0 = arg_310_1.actors_["1049ui_story"]
			local var_313_1 = 0

			if var_313_1 < arg_310_1.time_ and arg_310_1.time_ <= var_313_1 + arg_313_0 and not isNil(var_313_0) and arg_310_1.var_.characterEffect1049ui_story == nil then
				arg_310_1.var_.characterEffect1049ui_story = var_313_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_313_2 = 0.200000002980232

			if var_313_1 <= arg_310_1.time_ and arg_310_1.time_ < var_313_1 + var_313_2 and not isNil(var_313_0) then
				local var_313_3 = (arg_310_1.time_ - var_313_1) / var_313_2

				if arg_310_1.var_.characterEffect1049ui_story and not isNil(var_313_0) then
					local var_313_4 = Mathf.Lerp(0, 0.5, var_313_3)

					arg_310_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_310_1.var_.characterEffect1049ui_story.fillRatio = var_313_4
				end
			end

			if arg_310_1.time_ >= var_313_1 + var_313_2 and arg_310_1.time_ < var_313_1 + var_313_2 + arg_313_0 and not isNil(var_313_0) and arg_310_1.var_.characterEffect1049ui_story then
				local var_313_5 = 0.5

				arg_310_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_310_1.var_.characterEffect1049ui_story.fillRatio = var_313_5
			end

			local var_313_6 = 0
			local var_313_7 = 0.3

			if var_313_6 < arg_310_1.time_ and arg_310_1.time_ <= var_313_6 + arg_313_0 then
				arg_310_1.talkMaxDuration = 0
				arg_310_1.dialogCg_.alpha = 1

				arg_310_1.dialog_:SetActive(true)
				SetActive(arg_310_1.leftNameGo_, true)

				local var_313_8 = arg_310_1:FormatText(StoryNameCfg[7].name)

				arg_310_1.leftNameTxt_.text = var_313_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_310_1.leftNameTxt_.transform)

				arg_310_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_310_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_310_1:RecordName(arg_310_1.leftNameTxt_.text)
				SetActive(arg_310_1.iconTrs_.gameObject, false)
				arg_310_1.callingController_:SetSelectedState("normal")

				local var_313_9 = arg_310_1:GetWordFromCfg(1104905073)
				local var_313_10 = arg_310_1:FormatText(var_313_9.content)

				arg_310_1.text_.text = var_313_10

				LuaForUtil.ClearLinePrefixSymbol(arg_310_1.text_)

				local var_313_11 = 12
				local var_313_12 = utf8.len(var_313_10)
				local var_313_13 = var_313_11 <= 0 and var_313_7 or var_313_7 * (var_313_12 / var_313_11)

				if var_313_13 > 0 and var_313_7 < var_313_13 then
					arg_310_1.talkMaxDuration = var_313_13

					if var_313_13 + var_313_6 > arg_310_1.duration_ then
						arg_310_1.duration_ = var_313_13 + var_313_6
					end
				end

				arg_310_1.text_.text = var_313_10
				arg_310_1.typewritter.percent = 0

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(false)
				arg_310_1:RecordContent(arg_310_1.text_.text)
			end

			local var_313_14 = math.max(var_313_7, arg_310_1.talkMaxDuration)

			if var_313_6 <= arg_310_1.time_ and arg_310_1.time_ < var_313_6 + var_313_14 then
				arg_310_1.typewritter.percent = (arg_310_1.time_ - var_313_6) / var_313_14

				arg_310_1.typewritter:SetDirty()
			end

			if arg_310_1.time_ >= var_313_6 + var_313_14 and arg_310_1.time_ < var_313_6 + var_313_14 + arg_313_0 then
				arg_310_1.typewritter.percent = 1

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905074 = function(arg_314_0, arg_314_1)
		arg_314_1.time_ = 0
		arg_314_1.frameCnt_ = 0
		arg_314_1.state_ = "playing"
		arg_314_1.curTalkId_ = 1104905074
		arg_314_1.duration_ = 4.77

		SetActive(arg_314_1.tipsGo_, false)

		function arg_314_1.onSingleLineFinish_()
			arg_314_1.onSingleLineUpdate_ = nil
			arg_314_1.onSingleLineFinish_ = nil
			arg_314_1.state_ = "waiting"
		end

		function arg_314_1.playNext_(arg_316_0)
			if arg_316_0 == 1 then
				arg_314_0:Play1104905075(arg_314_1)
			end
		end

		function arg_314_1.onSingleLineUpdate_(arg_317_0)
			local var_317_0 = arg_314_1.actors_["1049ui_story"]
			local var_317_1 = 0

			if var_317_1 < arg_314_1.time_ and arg_314_1.time_ <= var_317_1 + arg_317_0 and not isNil(var_317_0) and arg_314_1.var_.characterEffect1049ui_story == nil then
				arg_314_1.var_.characterEffect1049ui_story = var_317_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_317_2 = 0.200000002980232

			if var_317_1 <= arg_314_1.time_ and arg_314_1.time_ < var_317_1 + var_317_2 and not isNil(var_317_0) then
				local var_317_3 = (arg_314_1.time_ - var_317_1) / var_317_2

				if arg_314_1.var_.characterEffect1049ui_story and not isNil(var_317_0) then
					arg_314_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_314_1.time_ >= var_317_1 + var_317_2 and arg_314_1.time_ < var_317_1 + var_317_2 + arg_317_0 and not isNil(var_317_0) and arg_314_1.var_.characterEffect1049ui_story then
				arg_314_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_317_4 = 0

			if var_317_4 < arg_314_1.time_ and arg_314_1.time_ <= var_317_4 + arg_317_0 then
				arg_314_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049actionlink/1049action425")
			end

			local var_317_5 = 0

			if var_317_5 < arg_314_1.time_ and arg_314_1.time_ <= var_317_5 + arg_317_0 then
				arg_314_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_317_6 = 0
			local var_317_7 = 0.45

			if var_317_6 < arg_314_1.time_ and arg_314_1.time_ <= var_317_6 + arg_317_0 then
				arg_314_1.talkMaxDuration = 0
				arg_314_1.dialogCg_.alpha = 1

				arg_314_1.dialog_:SetActive(true)
				SetActive(arg_314_1.leftNameGo_, true)

				local var_317_8 = arg_314_1:FormatText(StoryNameCfg[551].name)

				arg_314_1.leftNameTxt_.text = var_317_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_314_1.leftNameTxt_.transform)

				arg_314_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_314_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_314_1:RecordName(arg_314_1.leftNameTxt_.text)
				SetActive(arg_314_1.iconTrs_.gameObject, false)
				arg_314_1.callingController_:SetSelectedState("normal")

				local var_317_9 = arg_314_1:GetWordFromCfg(1104905074)
				local var_317_10 = arg_314_1:FormatText(var_317_9.content)

				arg_314_1.text_.text = var_317_10

				LuaForUtil.ClearLinePrefixSymbol(arg_314_1.text_)

				local var_317_11 = 18
				local var_317_12 = utf8.len(var_317_10)
				local var_317_13 = var_317_11 <= 0 and var_317_7 or var_317_7 * (var_317_12 / var_317_11)

				if var_317_13 > 0 and var_317_7 < var_317_13 then
					arg_314_1.talkMaxDuration = var_317_13

					if var_317_13 + var_317_6 > arg_314_1.duration_ then
						arg_314_1.duration_ = var_317_13 + var_317_6
					end
				end

				arg_314_1.text_.text = var_317_10
				arg_314_1.typewritter.percent = 0

				arg_314_1.typewritter:SetDirty()
				arg_314_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905074", "story_v_side_new_1104905.awb") ~= 0 then
					local var_317_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905074", "story_v_side_new_1104905.awb") / 1000

					if var_317_14 + var_317_6 > arg_314_1.duration_ then
						arg_314_1.duration_ = var_317_14 + var_317_6
					end

					if var_317_9.prefab_name ~= "" and arg_314_1.actors_[var_317_9.prefab_name] ~= nil then
						local var_317_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_314_1.actors_[var_317_9.prefab_name].transform, "story_v_side_new_1104905", "1104905074", "story_v_side_new_1104905.awb")

						arg_314_1:RecordAudio("1104905074", var_317_15)
						arg_314_1:RecordAudio("1104905074", var_317_15)
					else
						arg_314_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905074", "story_v_side_new_1104905.awb")
					end

					arg_314_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905074", "story_v_side_new_1104905.awb")
				end

				arg_314_1:RecordContent(arg_314_1.text_.text)
			end

			local var_317_16 = math.max(var_317_7, arg_314_1.talkMaxDuration)

			if var_317_6 <= arg_314_1.time_ and arg_314_1.time_ < var_317_6 + var_317_16 then
				arg_314_1.typewritter.percent = (arg_314_1.time_ - var_317_6) / var_317_16

				arg_314_1.typewritter:SetDirty()
			end

			if arg_314_1.time_ >= var_317_6 + var_317_16 and arg_314_1.time_ < var_317_6 + var_317_16 + arg_317_0 then
				arg_314_1.typewritter.percent = 1

				arg_314_1.typewritter:SetDirty()
				arg_314_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905075 = function(arg_318_0, arg_318_1)
		arg_318_1.time_ = 0
		arg_318_1.frameCnt_ = 0
		arg_318_1.state_ = "playing"
		arg_318_1.curTalkId_ = 1104905075
		arg_318_1.duration_ = 6.93

		SetActive(arg_318_1.tipsGo_, false)

		function arg_318_1.onSingleLineFinish_()
			arg_318_1.onSingleLineUpdate_ = nil
			arg_318_1.onSingleLineFinish_ = nil
			arg_318_1.state_ = "waiting"
		end

		function arg_318_1.playNext_(arg_320_0)
			if arg_320_0 == 1 then
				arg_318_0:Play1104905076(arg_318_1)
			end
		end

		function arg_318_1.onSingleLineUpdate_(arg_321_0)
			local var_321_0 = 0
			local var_321_1 = 0.625

			if var_321_0 < arg_318_1.time_ and arg_318_1.time_ <= var_321_0 + arg_321_0 then
				arg_318_1.talkMaxDuration = 0
				arg_318_1.dialogCg_.alpha = 1

				arg_318_1.dialog_:SetActive(true)
				SetActive(arg_318_1.leftNameGo_, true)

				local var_321_2 = arg_318_1:FormatText(StoryNameCfg[551].name)

				arg_318_1.leftNameTxt_.text = var_321_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_318_1.leftNameTxt_.transform)

				arg_318_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_318_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_318_1:RecordName(arg_318_1.leftNameTxt_.text)
				SetActive(arg_318_1.iconTrs_.gameObject, false)
				arg_318_1.callingController_:SetSelectedState("normal")

				local var_321_3 = arg_318_1:GetWordFromCfg(1104905075)
				local var_321_4 = arg_318_1:FormatText(var_321_3.content)

				arg_318_1.text_.text = var_321_4

				LuaForUtil.ClearLinePrefixSymbol(arg_318_1.text_)

				local var_321_5 = 25
				local var_321_6 = utf8.len(var_321_4)
				local var_321_7 = var_321_5 <= 0 and var_321_1 or var_321_1 * (var_321_6 / var_321_5)

				if var_321_7 > 0 and var_321_1 < var_321_7 then
					arg_318_1.talkMaxDuration = var_321_7

					if var_321_7 + var_321_0 > arg_318_1.duration_ then
						arg_318_1.duration_ = var_321_7 + var_321_0
					end
				end

				arg_318_1.text_.text = var_321_4
				arg_318_1.typewritter.percent = 0

				arg_318_1.typewritter:SetDirty()
				arg_318_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905075", "story_v_side_new_1104905.awb") ~= 0 then
					local var_321_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905075", "story_v_side_new_1104905.awb") / 1000

					if var_321_8 + var_321_0 > arg_318_1.duration_ then
						arg_318_1.duration_ = var_321_8 + var_321_0
					end

					if var_321_3.prefab_name ~= "" and arg_318_1.actors_[var_321_3.prefab_name] ~= nil then
						local var_321_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_318_1.actors_[var_321_3.prefab_name].transform, "story_v_side_new_1104905", "1104905075", "story_v_side_new_1104905.awb")

						arg_318_1:RecordAudio("1104905075", var_321_9)
						arg_318_1:RecordAudio("1104905075", var_321_9)
					else
						arg_318_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905075", "story_v_side_new_1104905.awb")
					end

					arg_318_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905075", "story_v_side_new_1104905.awb")
				end

				arg_318_1:RecordContent(arg_318_1.text_.text)
			end

			local var_321_10 = math.max(var_321_1, arg_318_1.talkMaxDuration)

			if var_321_0 <= arg_318_1.time_ and arg_318_1.time_ < var_321_0 + var_321_10 then
				arg_318_1.typewritter.percent = (arg_318_1.time_ - var_321_0) / var_321_10

				arg_318_1.typewritter:SetDirty()
			end

			if arg_318_1.time_ >= var_321_0 + var_321_10 and arg_318_1.time_ < var_321_0 + var_321_10 + arg_321_0 then
				arg_318_1.typewritter.percent = 1

				arg_318_1.typewritter:SetDirty()
				arg_318_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905076 = function(arg_322_0, arg_322_1)
		arg_322_1.time_ = 0
		arg_322_1.frameCnt_ = 0
		arg_322_1.state_ = "playing"
		arg_322_1.curTalkId_ = 1104905076
		arg_322_1.duration_ = 8.2

		SetActive(arg_322_1.tipsGo_, false)

		function arg_322_1.onSingleLineFinish_()
			arg_322_1.onSingleLineUpdate_ = nil
			arg_322_1.onSingleLineFinish_ = nil
			arg_322_1.state_ = "waiting"
		end

		function arg_322_1.playNext_(arg_324_0)
			if arg_324_0 == 1 then
				arg_322_0:Play1104905077(arg_322_1)
			end
		end

		function arg_322_1.onSingleLineUpdate_(arg_325_0)
			local var_325_0 = 0

			if var_325_0 < arg_322_1.time_ and arg_322_1.time_ <= var_325_0 + arg_325_0 then
				arg_322_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action5_2")
			end

			local var_325_1 = 0

			if var_325_1 < arg_322_1.time_ and arg_322_1.time_ <= var_325_1 + arg_325_0 then
				arg_322_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_325_2 = 0
			local var_325_3 = 0.375

			if var_325_2 < arg_322_1.time_ and arg_322_1.time_ <= var_325_2 + arg_325_0 then
				arg_322_1.talkMaxDuration = 0
				arg_322_1.dialogCg_.alpha = 1

				arg_322_1.dialog_:SetActive(true)
				SetActive(arg_322_1.leftNameGo_, true)

				local var_325_4 = arg_322_1:FormatText(StoryNameCfg[551].name)

				arg_322_1.leftNameTxt_.text = var_325_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_322_1.leftNameTxt_.transform)

				arg_322_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_322_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_322_1:RecordName(arg_322_1.leftNameTxt_.text)
				SetActive(arg_322_1.iconTrs_.gameObject, false)
				arg_322_1.callingController_:SetSelectedState("normal")

				local var_325_5 = arg_322_1:GetWordFromCfg(1104905076)
				local var_325_6 = arg_322_1:FormatText(var_325_5.content)

				arg_322_1.text_.text = var_325_6

				LuaForUtil.ClearLinePrefixSymbol(arg_322_1.text_)

				local var_325_7 = 15
				local var_325_8 = utf8.len(var_325_6)
				local var_325_9 = var_325_7 <= 0 and var_325_3 or var_325_3 * (var_325_8 / var_325_7)

				if var_325_9 > 0 and var_325_3 < var_325_9 then
					arg_322_1.talkMaxDuration = var_325_9

					if var_325_9 + var_325_2 > arg_322_1.duration_ then
						arg_322_1.duration_ = var_325_9 + var_325_2
					end
				end

				arg_322_1.text_.text = var_325_6
				arg_322_1.typewritter.percent = 0

				arg_322_1.typewritter:SetDirty()
				arg_322_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905076", "story_v_side_new_1104905.awb") ~= 0 then
					local var_325_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905076", "story_v_side_new_1104905.awb") / 1000

					if var_325_10 + var_325_2 > arg_322_1.duration_ then
						arg_322_1.duration_ = var_325_10 + var_325_2
					end

					if var_325_5.prefab_name ~= "" and arg_322_1.actors_[var_325_5.prefab_name] ~= nil then
						local var_325_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_322_1.actors_[var_325_5.prefab_name].transform, "story_v_side_new_1104905", "1104905076", "story_v_side_new_1104905.awb")

						arg_322_1:RecordAudio("1104905076", var_325_11)
						arg_322_1:RecordAudio("1104905076", var_325_11)
					else
						arg_322_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905076", "story_v_side_new_1104905.awb")
					end

					arg_322_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905076", "story_v_side_new_1104905.awb")
				end

				arg_322_1:RecordContent(arg_322_1.text_.text)
			end

			local var_325_12 = math.max(var_325_3, arg_322_1.talkMaxDuration)

			if var_325_2 <= arg_322_1.time_ and arg_322_1.time_ < var_325_2 + var_325_12 then
				arg_322_1.typewritter.percent = (arg_322_1.time_ - var_325_2) / var_325_12

				arg_322_1.typewritter:SetDirty()
			end

			if arg_322_1.time_ >= var_325_2 + var_325_12 and arg_322_1.time_ < var_325_2 + var_325_12 + arg_325_0 then
				arg_322_1.typewritter.percent = 1

				arg_322_1.typewritter:SetDirty()
				arg_322_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905077 = function(arg_326_0, arg_326_1)
		arg_326_1.time_ = 0
		arg_326_1.frameCnt_ = 0
		arg_326_1.state_ = "playing"
		arg_326_1.curTalkId_ = 1104905077
		arg_326_1.duration_ = 5

		SetActive(arg_326_1.tipsGo_, false)

		function arg_326_1.onSingleLineFinish_()
			arg_326_1.onSingleLineUpdate_ = nil
			arg_326_1.onSingleLineFinish_ = nil
			arg_326_1.state_ = "waiting"
		end

		function arg_326_1.playNext_(arg_328_0)
			if arg_328_0 == 1 then
				arg_326_0:Play1104905078(arg_326_1)
			end
		end

		function arg_326_1.onSingleLineUpdate_(arg_329_0)
			local var_329_0 = arg_326_1.actors_["1049ui_story"].transform
			local var_329_1 = 0

			if var_329_1 < arg_326_1.time_ and arg_326_1.time_ <= var_329_1 + arg_329_0 then
				arg_326_1.var_.moveOldPos1049ui_story = var_329_0.localPosition
			end

			local var_329_2 = 0.001

			if var_329_1 <= arg_326_1.time_ and arg_326_1.time_ < var_329_1 + var_329_2 then
				local var_329_3 = (arg_326_1.time_ - var_329_1) / var_329_2
				local var_329_4 = Vector3.New(0, 100, 0)

				var_329_0.localPosition = Vector3.Lerp(arg_326_1.var_.moveOldPos1049ui_story, var_329_4, var_329_3)

				local var_329_5 = manager.ui.mainCamera.transform.position - var_329_0.position

				var_329_0.forward = Vector3.New(var_329_5.x, var_329_5.y, var_329_5.z)

				local var_329_6 = var_329_0.localEulerAngles

				var_329_6.z = 0
				var_329_6.x = 0
				var_329_0.localEulerAngles = var_329_6
			end

			if arg_326_1.time_ >= var_329_1 + var_329_2 and arg_326_1.time_ < var_329_1 + var_329_2 + arg_329_0 then
				var_329_0.localPosition = Vector3.New(0, 100, 0)

				local var_329_7 = manager.ui.mainCamera.transform.position - var_329_0.position

				var_329_0.forward = Vector3.New(var_329_7.x, var_329_7.y, var_329_7.z)

				local var_329_8 = var_329_0.localEulerAngles

				var_329_8.z = 0
				var_329_8.x = 0
				var_329_0.localEulerAngles = var_329_8
			end

			local var_329_9 = arg_326_1.actors_["1049ui_story"]
			local var_329_10 = 0

			if var_329_10 < arg_326_1.time_ and arg_326_1.time_ <= var_329_10 + arg_329_0 and not isNil(var_329_9) and arg_326_1.var_.characterEffect1049ui_story == nil then
				arg_326_1.var_.characterEffect1049ui_story = var_329_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_329_11 = 0.200000002980232

			if var_329_10 <= arg_326_1.time_ and arg_326_1.time_ < var_329_10 + var_329_11 and not isNil(var_329_9) then
				local var_329_12 = (arg_326_1.time_ - var_329_10) / var_329_11

				if arg_326_1.var_.characterEffect1049ui_story and not isNil(var_329_9) then
					local var_329_13 = Mathf.Lerp(0, 0.5, var_329_12)

					arg_326_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_326_1.var_.characterEffect1049ui_story.fillRatio = var_329_13
				end
			end

			if arg_326_1.time_ >= var_329_10 + var_329_11 and arg_326_1.time_ < var_329_10 + var_329_11 + arg_329_0 and not isNil(var_329_9) and arg_326_1.var_.characterEffect1049ui_story then
				local var_329_14 = 0.5

				arg_326_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_326_1.var_.characterEffect1049ui_story.fillRatio = var_329_14
			end

			local var_329_15 = 0
			local var_329_16 = 0.95

			if var_329_15 < arg_326_1.time_ and arg_326_1.time_ <= var_329_15 + arg_329_0 then
				arg_326_1.talkMaxDuration = 0
				arg_326_1.dialogCg_.alpha = 1

				arg_326_1.dialog_:SetActive(true)
				SetActive(arg_326_1.leftNameGo_, false)

				arg_326_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_326_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_326_1:RecordName(arg_326_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_326_1.iconTrs_.gameObject, false)
				arg_326_1.callingController_:SetSelectedState("normal")

				local var_329_17 = arg_326_1:GetWordFromCfg(1104905077)
				local var_329_18 = arg_326_1:FormatText(var_329_17.content)

				arg_326_1.text_.text = var_329_18

				LuaForUtil.ClearLinePrefixSymbol(arg_326_1.text_)

				local var_329_19 = 38
				local var_329_20 = utf8.len(var_329_18)
				local var_329_21 = var_329_19 <= 0 and var_329_16 or var_329_16 * (var_329_20 / var_329_19)

				if var_329_21 > 0 and var_329_16 < var_329_21 then
					arg_326_1.talkMaxDuration = var_329_21

					if var_329_21 + var_329_15 > arg_326_1.duration_ then
						arg_326_1.duration_ = var_329_21 + var_329_15
					end
				end

				arg_326_1.text_.text = var_329_18
				arg_326_1.typewritter.percent = 0

				arg_326_1.typewritter:SetDirty()
				arg_326_1:ShowNextGo(false)
				arg_326_1:RecordContent(arg_326_1.text_.text)
			end

			local var_329_22 = math.max(var_329_16, arg_326_1.talkMaxDuration)

			if var_329_15 <= arg_326_1.time_ and arg_326_1.time_ < var_329_15 + var_329_22 then
				arg_326_1.typewritter.percent = (arg_326_1.time_ - var_329_15) / var_329_22

				arg_326_1.typewritter:SetDirty()
			end

			if arg_326_1.time_ >= var_329_15 + var_329_22 and arg_326_1.time_ < var_329_15 + var_329_22 + arg_329_0 then
				arg_326_1.typewritter.percent = 1

				arg_326_1.typewritter:SetDirty()
				arg_326_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905078 = function(arg_330_0, arg_330_1)
		arg_330_1.time_ = 0
		arg_330_1.frameCnt_ = 0
		arg_330_1.state_ = "playing"
		arg_330_1.curTalkId_ = 1104905078
		arg_330_1.duration_ = 5

		SetActive(arg_330_1.tipsGo_, false)

		function arg_330_1.onSingleLineFinish_()
			arg_330_1.onSingleLineUpdate_ = nil
			arg_330_1.onSingleLineFinish_ = nil
			arg_330_1.state_ = "waiting"
		end

		function arg_330_1.playNext_(arg_332_0)
			if arg_332_0 == 1 then
				arg_330_0:Play1104905079(arg_330_1)
			end
		end

		function arg_330_1.onSingleLineUpdate_(arg_333_0)
			local var_333_0 = 0
			local var_333_1 = 0.825

			if var_333_0 < arg_330_1.time_ and arg_330_1.time_ <= var_333_0 + arg_333_0 then
				arg_330_1.talkMaxDuration = 0
				arg_330_1.dialogCg_.alpha = 1

				arg_330_1.dialog_:SetActive(true)
				SetActive(arg_330_1.leftNameGo_, false)

				arg_330_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_330_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_330_1:RecordName(arg_330_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_330_1.iconTrs_.gameObject, false)
				arg_330_1.callingController_:SetSelectedState("normal")

				local var_333_2 = arg_330_1:GetWordFromCfg(1104905078)
				local var_333_3 = arg_330_1:FormatText(var_333_2.content)

				arg_330_1.text_.text = var_333_3

				LuaForUtil.ClearLinePrefixSymbol(arg_330_1.text_)

				local var_333_4 = 33
				local var_333_5 = utf8.len(var_333_3)
				local var_333_6 = var_333_4 <= 0 and var_333_1 or var_333_1 * (var_333_5 / var_333_4)

				if var_333_6 > 0 and var_333_1 < var_333_6 then
					arg_330_1.talkMaxDuration = var_333_6

					if var_333_6 + var_333_0 > arg_330_1.duration_ then
						arg_330_1.duration_ = var_333_6 + var_333_0
					end
				end

				arg_330_1.text_.text = var_333_3
				arg_330_1.typewritter.percent = 0

				arg_330_1.typewritter:SetDirty()
				arg_330_1:ShowNextGo(false)
				arg_330_1:RecordContent(arg_330_1.text_.text)
			end

			local var_333_7 = math.max(var_333_1, arg_330_1.talkMaxDuration)

			if var_333_0 <= arg_330_1.time_ and arg_330_1.time_ < var_333_0 + var_333_7 then
				arg_330_1.typewritter.percent = (arg_330_1.time_ - var_333_0) / var_333_7

				arg_330_1.typewritter:SetDirty()
			end

			if arg_330_1.time_ >= var_333_0 + var_333_7 and arg_330_1.time_ < var_333_0 + var_333_7 + arg_333_0 then
				arg_330_1.typewritter.percent = 1

				arg_330_1.typewritter:SetDirty()
				arg_330_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905079 = function(arg_334_0, arg_334_1)
		arg_334_1.time_ = 0
		arg_334_1.frameCnt_ = 0
		arg_334_1.state_ = "playing"
		arg_334_1.curTalkId_ = 1104905079
		arg_334_1.duration_ = 2.57

		SetActive(arg_334_1.tipsGo_, false)

		function arg_334_1.onSingleLineFinish_()
			arg_334_1.onSingleLineUpdate_ = nil
			arg_334_1.onSingleLineFinish_ = nil
			arg_334_1.state_ = "waiting"
		end

		function arg_334_1.playNext_(arg_336_0)
			if arg_336_0 == 1 then
				arg_334_0:Play1104905080(arg_334_1)
			end
		end

		function arg_334_1.onSingleLineUpdate_(arg_337_0)
			local var_337_0 = arg_334_1.actors_["1049ui_story"].transform
			local var_337_1 = 0

			if var_337_1 < arg_334_1.time_ and arg_334_1.time_ <= var_337_1 + arg_337_0 then
				arg_334_1.var_.moveOldPos1049ui_story = var_337_0.localPosition
			end

			local var_337_2 = 0.001

			if var_337_1 <= arg_334_1.time_ and arg_334_1.time_ < var_337_1 + var_337_2 then
				local var_337_3 = (arg_334_1.time_ - var_337_1) / var_337_2
				local var_337_4 = Vector3.New(0, -1.2, -6)

				var_337_0.localPosition = Vector3.Lerp(arg_334_1.var_.moveOldPos1049ui_story, var_337_4, var_337_3)

				local var_337_5 = manager.ui.mainCamera.transform.position - var_337_0.position

				var_337_0.forward = Vector3.New(var_337_5.x, var_337_5.y, var_337_5.z)

				local var_337_6 = var_337_0.localEulerAngles

				var_337_6.z = 0
				var_337_6.x = 0
				var_337_0.localEulerAngles = var_337_6
			end

			if arg_334_1.time_ >= var_337_1 + var_337_2 and arg_334_1.time_ < var_337_1 + var_337_2 + arg_337_0 then
				var_337_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_337_7 = manager.ui.mainCamera.transform.position - var_337_0.position

				var_337_0.forward = Vector3.New(var_337_7.x, var_337_7.y, var_337_7.z)

				local var_337_8 = var_337_0.localEulerAngles

				var_337_8.z = 0
				var_337_8.x = 0
				var_337_0.localEulerAngles = var_337_8
			end

			local var_337_9 = arg_334_1.actors_["1049ui_story"]
			local var_337_10 = 0

			if var_337_10 < arg_334_1.time_ and arg_334_1.time_ <= var_337_10 + arg_337_0 and not isNil(var_337_9) and arg_334_1.var_.characterEffect1049ui_story == nil then
				arg_334_1.var_.characterEffect1049ui_story = var_337_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_337_11 = 0.200000002980232

			if var_337_10 <= arg_334_1.time_ and arg_334_1.time_ < var_337_10 + var_337_11 and not isNil(var_337_9) then
				local var_337_12 = (arg_334_1.time_ - var_337_10) / var_337_11

				if arg_334_1.var_.characterEffect1049ui_story and not isNil(var_337_9) then
					arg_334_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_334_1.time_ >= var_337_10 + var_337_11 and arg_334_1.time_ < var_337_10 + var_337_11 + arg_337_0 and not isNil(var_337_9) and arg_334_1.var_.characterEffect1049ui_story then
				arg_334_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_337_13 = 0

			if var_337_13 < arg_334_1.time_ and arg_334_1.time_ <= var_337_13 + arg_337_0 then
				arg_334_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action4_1")
			end

			local var_337_14 = 0

			if var_337_14 < arg_334_1.time_ and arg_334_1.time_ <= var_337_14 + arg_337_0 then
				arg_334_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_337_15 = 0
			local var_337_16 = 0.075

			if var_337_15 < arg_334_1.time_ and arg_334_1.time_ <= var_337_15 + arg_337_0 then
				arg_334_1.talkMaxDuration = 0
				arg_334_1.dialogCg_.alpha = 1

				arg_334_1.dialog_:SetActive(true)
				SetActive(arg_334_1.leftNameGo_, true)

				local var_337_17 = arg_334_1:FormatText(StoryNameCfg[551].name)

				arg_334_1.leftNameTxt_.text = var_337_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_334_1.leftNameTxt_.transform)

				arg_334_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_334_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_334_1:RecordName(arg_334_1.leftNameTxt_.text)
				SetActive(arg_334_1.iconTrs_.gameObject, false)
				arg_334_1.callingController_:SetSelectedState("normal")

				local var_337_18 = arg_334_1:GetWordFromCfg(1104905079)
				local var_337_19 = arg_334_1:FormatText(var_337_18.content)

				arg_334_1.text_.text = var_337_19

				LuaForUtil.ClearLinePrefixSymbol(arg_334_1.text_)

				local var_337_20 = 3
				local var_337_21 = utf8.len(var_337_19)
				local var_337_22 = var_337_20 <= 0 and var_337_16 or var_337_16 * (var_337_21 / var_337_20)

				if var_337_22 > 0 and var_337_16 < var_337_22 then
					arg_334_1.talkMaxDuration = var_337_22

					if var_337_22 + var_337_15 > arg_334_1.duration_ then
						arg_334_1.duration_ = var_337_22 + var_337_15
					end
				end

				arg_334_1.text_.text = var_337_19
				arg_334_1.typewritter.percent = 0

				arg_334_1.typewritter:SetDirty()
				arg_334_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905079", "story_v_side_new_1104905.awb") ~= 0 then
					local var_337_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905079", "story_v_side_new_1104905.awb") / 1000

					if var_337_23 + var_337_15 > arg_334_1.duration_ then
						arg_334_1.duration_ = var_337_23 + var_337_15
					end

					if var_337_18.prefab_name ~= "" and arg_334_1.actors_[var_337_18.prefab_name] ~= nil then
						local var_337_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_334_1.actors_[var_337_18.prefab_name].transform, "story_v_side_new_1104905", "1104905079", "story_v_side_new_1104905.awb")

						arg_334_1:RecordAudio("1104905079", var_337_24)
						arg_334_1:RecordAudio("1104905079", var_337_24)
					else
						arg_334_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905079", "story_v_side_new_1104905.awb")
					end

					arg_334_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905079", "story_v_side_new_1104905.awb")
				end

				arg_334_1:RecordContent(arg_334_1.text_.text)
			end

			local var_337_25 = math.max(var_337_16, arg_334_1.talkMaxDuration)

			if var_337_15 <= arg_334_1.time_ and arg_334_1.time_ < var_337_15 + var_337_25 then
				arg_334_1.typewritter.percent = (arg_334_1.time_ - var_337_15) / var_337_25

				arg_334_1.typewritter:SetDirty()
			end

			if arg_334_1.time_ >= var_337_15 + var_337_25 and arg_334_1.time_ < var_337_15 + var_337_25 + arg_337_0 then
				arg_334_1.typewritter.percent = 1

				arg_334_1.typewritter:SetDirty()
				arg_334_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905080 = function(arg_338_0, arg_338_1)
		arg_338_1.time_ = 0
		arg_338_1.frameCnt_ = 0
		arg_338_1.state_ = "playing"
		arg_338_1.curTalkId_ = 1104905080
		arg_338_1.duration_ = 5

		SetActive(arg_338_1.tipsGo_, false)

		function arg_338_1.onSingleLineFinish_()
			arg_338_1.onSingleLineUpdate_ = nil
			arg_338_1.onSingleLineFinish_ = nil
			arg_338_1.state_ = "waiting"
		end

		function arg_338_1.playNext_(arg_340_0)
			if arg_340_0 == 1 then
				arg_338_0:Play1104905081(arg_338_1)
			end
		end

		function arg_338_1.onSingleLineUpdate_(arg_341_0)
			local var_341_0 = arg_338_1.actors_["1049ui_story"].transform
			local var_341_1 = 0

			if var_341_1 < arg_338_1.time_ and arg_338_1.time_ <= var_341_1 + arg_341_0 then
				arg_338_1.var_.moveOldPos1049ui_story = var_341_0.localPosition
			end

			local var_341_2 = 0.001

			if var_341_1 <= arg_338_1.time_ and arg_338_1.time_ < var_341_1 + var_341_2 then
				local var_341_3 = (arg_338_1.time_ - var_341_1) / var_341_2
				local var_341_4 = Vector3.New(0, 100, 0)

				var_341_0.localPosition = Vector3.Lerp(arg_338_1.var_.moveOldPos1049ui_story, var_341_4, var_341_3)

				local var_341_5 = manager.ui.mainCamera.transform.position - var_341_0.position

				var_341_0.forward = Vector3.New(var_341_5.x, var_341_5.y, var_341_5.z)

				local var_341_6 = var_341_0.localEulerAngles

				var_341_6.z = 0
				var_341_6.x = 0
				var_341_0.localEulerAngles = var_341_6
			end

			if arg_338_1.time_ >= var_341_1 + var_341_2 and arg_338_1.time_ < var_341_1 + var_341_2 + arg_341_0 then
				var_341_0.localPosition = Vector3.New(0, 100, 0)

				local var_341_7 = manager.ui.mainCamera.transform.position - var_341_0.position

				var_341_0.forward = Vector3.New(var_341_7.x, var_341_7.y, var_341_7.z)

				local var_341_8 = var_341_0.localEulerAngles

				var_341_8.z = 0
				var_341_8.x = 0
				var_341_0.localEulerAngles = var_341_8
			end

			local var_341_9 = arg_338_1.actors_["1049ui_story"]
			local var_341_10 = 0

			if var_341_10 < arg_338_1.time_ and arg_338_1.time_ <= var_341_10 + arg_341_0 and not isNil(var_341_9) and arg_338_1.var_.characterEffect1049ui_story == nil then
				arg_338_1.var_.characterEffect1049ui_story = var_341_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_341_11 = 0.200000002980232

			if var_341_10 <= arg_338_1.time_ and arg_338_1.time_ < var_341_10 + var_341_11 and not isNil(var_341_9) then
				local var_341_12 = (arg_338_1.time_ - var_341_10) / var_341_11

				if arg_338_1.var_.characterEffect1049ui_story and not isNil(var_341_9) then
					local var_341_13 = Mathf.Lerp(0, 0.5, var_341_12)

					arg_338_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_338_1.var_.characterEffect1049ui_story.fillRatio = var_341_13
				end
			end

			if arg_338_1.time_ >= var_341_10 + var_341_11 and arg_338_1.time_ < var_341_10 + var_341_11 + arg_341_0 and not isNil(var_341_9) and arg_338_1.var_.characterEffect1049ui_story then
				local var_341_14 = 0.5

				arg_338_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_338_1.var_.characterEffect1049ui_story.fillRatio = var_341_14
			end

			local var_341_15 = 0
			local var_341_16 = 1.375

			if var_341_15 < arg_338_1.time_ and arg_338_1.time_ <= var_341_15 + arg_341_0 then
				arg_338_1.talkMaxDuration = 0
				arg_338_1.dialogCg_.alpha = 1

				arg_338_1.dialog_:SetActive(true)
				SetActive(arg_338_1.leftNameGo_, false)

				arg_338_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_338_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_338_1:RecordName(arg_338_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_338_1.iconTrs_.gameObject, false)
				arg_338_1.callingController_:SetSelectedState("normal")

				local var_341_17 = arg_338_1:GetWordFromCfg(1104905080)
				local var_341_18 = arg_338_1:FormatText(var_341_17.content)

				arg_338_1.text_.text = var_341_18

				LuaForUtil.ClearLinePrefixSymbol(arg_338_1.text_)

				local var_341_19 = 55
				local var_341_20 = utf8.len(var_341_18)
				local var_341_21 = var_341_19 <= 0 and var_341_16 or var_341_16 * (var_341_20 / var_341_19)

				if var_341_21 > 0 and var_341_16 < var_341_21 then
					arg_338_1.talkMaxDuration = var_341_21

					if var_341_21 + var_341_15 > arg_338_1.duration_ then
						arg_338_1.duration_ = var_341_21 + var_341_15
					end
				end

				arg_338_1.text_.text = var_341_18
				arg_338_1.typewritter.percent = 0

				arg_338_1.typewritter:SetDirty()
				arg_338_1:ShowNextGo(false)
				arg_338_1:RecordContent(arg_338_1.text_.text)
			end

			local var_341_22 = math.max(var_341_16, arg_338_1.talkMaxDuration)

			if var_341_15 <= arg_338_1.time_ and arg_338_1.time_ < var_341_15 + var_341_22 then
				arg_338_1.typewritter.percent = (arg_338_1.time_ - var_341_15) / var_341_22

				arg_338_1.typewritter:SetDirty()
			end

			if arg_338_1.time_ >= var_341_15 + var_341_22 and arg_338_1.time_ < var_341_15 + var_341_22 + arg_341_0 then
				arg_338_1.typewritter.percent = 1

				arg_338_1.typewritter:SetDirty()
				arg_338_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905081 = function(arg_342_0, arg_342_1)
		arg_342_1.time_ = 0
		arg_342_1.frameCnt_ = 0
		arg_342_1.state_ = "playing"
		arg_342_1.curTalkId_ = 1104905081
		arg_342_1.duration_ = 5

		SetActive(arg_342_1.tipsGo_, false)

		function arg_342_1.onSingleLineFinish_()
			arg_342_1.onSingleLineUpdate_ = nil
			arg_342_1.onSingleLineFinish_ = nil
			arg_342_1.state_ = "waiting"
		end

		function arg_342_1.playNext_(arg_344_0)
			if arg_344_0 == 1 then
				arg_342_0:Play1104905082(arg_342_1)
			end
		end

		function arg_342_1.onSingleLineUpdate_(arg_345_0)
			local var_345_0 = 0
			local var_345_1 = 0.75

			if var_345_0 < arg_342_1.time_ and arg_342_1.time_ <= var_345_0 + arg_345_0 then
				arg_342_1.talkMaxDuration = 0
				arg_342_1.dialogCg_.alpha = 1

				arg_342_1.dialog_:SetActive(true)
				SetActive(arg_342_1.leftNameGo_, true)

				local var_345_2 = arg_342_1:FormatText(StoryNameCfg[7].name)

				arg_342_1.leftNameTxt_.text = var_345_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_342_1.leftNameTxt_.transform)

				arg_342_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_342_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_342_1:RecordName(arg_342_1.leftNameTxt_.text)
				SetActive(arg_342_1.iconTrs_.gameObject, false)
				arg_342_1.callingController_:SetSelectedState("normal")

				local var_345_3 = arg_342_1:GetWordFromCfg(1104905081)
				local var_345_4 = arg_342_1:FormatText(var_345_3.content)

				arg_342_1.text_.text = var_345_4

				LuaForUtil.ClearLinePrefixSymbol(arg_342_1.text_)

				local var_345_5 = 30
				local var_345_6 = utf8.len(var_345_4)
				local var_345_7 = var_345_5 <= 0 and var_345_1 or var_345_1 * (var_345_6 / var_345_5)

				if var_345_7 > 0 and var_345_1 < var_345_7 then
					arg_342_1.talkMaxDuration = var_345_7

					if var_345_7 + var_345_0 > arg_342_1.duration_ then
						arg_342_1.duration_ = var_345_7 + var_345_0
					end
				end

				arg_342_1.text_.text = var_345_4
				arg_342_1.typewritter.percent = 0

				arg_342_1.typewritter:SetDirty()
				arg_342_1:ShowNextGo(false)
				arg_342_1:RecordContent(arg_342_1.text_.text)
			end

			local var_345_8 = math.max(var_345_1, arg_342_1.talkMaxDuration)

			if var_345_0 <= arg_342_1.time_ and arg_342_1.time_ < var_345_0 + var_345_8 then
				arg_342_1.typewritter.percent = (arg_342_1.time_ - var_345_0) / var_345_8

				arg_342_1.typewritter:SetDirty()
			end

			if arg_342_1.time_ >= var_345_0 + var_345_8 and arg_342_1.time_ < var_345_0 + var_345_8 + arg_345_0 then
				arg_342_1.typewritter.percent = 1

				arg_342_1.typewritter:SetDirty()
				arg_342_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905082 = function(arg_346_0, arg_346_1)
		arg_346_1.time_ = 0
		arg_346_1.frameCnt_ = 0
		arg_346_1.state_ = "playing"
		arg_346_1.curTalkId_ = 1104905082
		arg_346_1.duration_ = 5

		SetActive(arg_346_1.tipsGo_, false)

		function arg_346_1.onSingleLineFinish_()
			arg_346_1.onSingleLineUpdate_ = nil
			arg_346_1.onSingleLineFinish_ = nil
			arg_346_1.state_ = "waiting"
		end

		function arg_346_1.playNext_(arg_348_0)
			if arg_348_0 == 1 then
				arg_346_0:Play1104905083(arg_346_1)
			end
		end

		function arg_346_1.onSingleLineUpdate_(arg_349_0)
			local var_349_0 = 0
			local var_349_1 = 0.55

			if var_349_0 < arg_346_1.time_ and arg_346_1.time_ <= var_349_0 + arg_349_0 then
				arg_346_1.talkMaxDuration = 0
				arg_346_1.dialogCg_.alpha = 1

				arg_346_1.dialog_:SetActive(true)
				SetActive(arg_346_1.leftNameGo_, true)

				local var_349_2 = arg_346_1:FormatText(StoryNameCfg[7].name)

				arg_346_1.leftNameTxt_.text = var_349_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_346_1.leftNameTxt_.transform)

				arg_346_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_346_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_346_1:RecordName(arg_346_1.leftNameTxt_.text)
				SetActive(arg_346_1.iconTrs_.gameObject, false)
				arg_346_1.callingController_:SetSelectedState("normal")

				local var_349_3 = arg_346_1:GetWordFromCfg(1104905082)
				local var_349_4 = arg_346_1:FormatText(var_349_3.content)

				arg_346_1.text_.text = var_349_4

				LuaForUtil.ClearLinePrefixSymbol(arg_346_1.text_)

				local var_349_5 = 22
				local var_349_6 = utf8.len(var_349_4)
				local var_349_7 = var_349_5 <= 0 and var_349_1 or var_349_1 * (var_349_6 / var_349_5)

				if var_349_7 > 0 and var_349_1 < var_349_7 then
					arg_346_1.talkMaxDuration = var_349_7

					if var_349_7 + var_349_0 > arg_346_1.duration_ then
						arg_346_1.duration_ = var_349_7 + var_349_0
					end
				end

				arg_346_1.text_.text = var_349_4
				arg_346_1.typewritter.percent = 0

				arg_346_1.typewritter:SetDirty()
				arg_346_1:ShowNextGo(false)
				arg_346_1:RecordContent(arg_346_1.text_.text)
			end

			local var_349_8 = math.max(var_349_1, arg_346_1.talkMaxDuration)

			if var_349_0 <= arg_346_1.time_ and arg_346_1.time_ < var_349_0 + var_349_8 then
				arg_346_1.typewritter.percent = (arg_346_1.time_ - var_349_0) / var_349_8

				arg_346_1.typewritter:SetDirty()
			end

			if arg_346_1.time_ >= var_349_0 + var_349_8 and arg_346_1.time_ < var_349_0 + var_349_8 + arg_349_0 then
				arg_346_1.typewritter.percent = 1

				arg_346_1.typewritter:SetDirty()
				arg_346_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905083 = function(arg_350_0, arg_350_1)
		arg_350_1.time_ = 0
		arg_350_1.frameCnt_ = 0
		arg_350_1.state_ = "playing"
		arg_350_1.curTalkId_ = 1104905083
		arg_350_1.duration_ = 2

		SetActive(arg_350_1.tipsGo_, false)

		function arg_350_1.onSingleLineFinish_()
			arg_350_1.onSingleLineUpdate_ = nil
			arg_350_1.onSingleLineFinish_ = nil
			arg_350_1.state_ = "waiting"
		end

		function arg_350_1.playNext_(arg_352_0)
			if arg_352_0 == 1 then
				arg_350_0:Play1104905084(arg_350_1)
			end
		end

		function arg_350_1.onSingleLineUpdate_(arg_353_0)
			local var_353_0 = arg_350_1.actors_["1049ui_story"].transform
			local var_353_1 = 0

			if var_353_1 < arg_350_1.time_ and arg_350_1.time_ <= var_353_1 + arg_353_0 then
				arg_350_1.var_.moveOldPos1049ui_story = var_353_0.localPosition
			end

			local var_353_2 = 0.001

			if var_353_1 <= arg_350_1.time_ and arg_350_1.time_ < var_353_1 + var_353_2 then
				local var_353_3 = (arg_350_1.time_ - var_353_1) / var_353_2
				local var_353_4 = Vector3.New(0, -1.2, -6)

				var_353_0.localPosition = Vector3.Lerp(arg_350_1.var_.moveOldPos1049ui_story, var_353_4, var_353_3)

				local var_353_5 = manager.ui.mainCamera.transform.position - var_353_0.position

				var_353_0.forward = Vector3.New(var_353_5.x, var_353_5.y, var_353_5.z)

				local var_353_6 = var_353_0.localEulerAngles

				var_353_6.z = 0
				var_353_6.x = 0
				var_353_0.localEulerAngles = var_353_6
			end

			if arg_350_1.time_ >= var_353_1 + var_353_2 and arg_350_1.time_ < var_353_1 + var_353_2 + arg_353_0 then
				var_353_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_353_7 = manager.ui.mainCamera.transform.position - var_353_0.position

				var_353_0.forward = Vector3.New(var_353_7.x, var_353_7.y, var_353_7.z)

				local var_353_8 = var_353_0.localEulerAngles

				var_353_8.z = 0
				var_353_8.x = 0
				var_353_0.localEulerAngles = var_353_8
			end

			local var_353_9 = arg_350_1.actors_["1049ui_story"]
			local var_353_10 = 0

			if var_353_10 < arg_350_1.time_ and arg_350_1.time_ <= var_353_10 + arg_353_0 and not isNil(var_353_9) and arg_350_1.var_.characterEffect1049ui_story == nil then
				arg_350_1.var_.characterEffect1049ui_story = var_353_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_353_11 = 0.200000002980232

			if var_353_10 <= arg_350_1.time_ and arg_350_1.time_ < var_353_10 + var_353_11 and not isNil(var_353_9) then
				local var_353_12 = (arg_350_1.time_ - var_353_10) / var_353_11

				if arg_350_1.var_.characterEffect1049ui_story and not isNil(var_353_9) then
					arg_350_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_350_1.time_ >= var_353_10 + var_353_11 and arg_350_1.time_ < var_353_10 + var_353_11 + arg_353_0 and not isNil(var_353_9) and arg_350_1.var_.characterEffect1049ui_story then
				arg_350_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_353_13 = 0

			if var_353_13 < arg_350_1.time_ and arg_350_1.time_ <= var_353_13 + arg_353_0 then
				arg_350_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_2")
			end

			local var_353_14 = 0

			if var_353_14 < arg_350_1.time_ and arg_350_1.time_ <= var_353_14 + arg_353_0 then
				arg_350_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_353_15 = 0
			local var_353_16 = 0.125

			if var_353_15 < arg_350_1.time_ and arg_350_1.time_ <= var_353_15 + arg_353_0 then
				arg_350_1.talkMaxDuration = 0
				arg_350_1.dialogCg_.alpha = 1

				arg_350_1.dialog_:SetActive(true)
				SetActive(arg_350_1.leftNameGo_, true)

				local var_353_17 = arg_350_1:FormatText(StoryNameCfg[551].name)

				arg_350_1.leftNameTxt_.text = var_353_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_350_1.leftNameTxt_.transform)

				arg_350_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_350_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_350_1:RecordName(arg_350_1.leftNameTxt_.text)
				SetActive(arg_350_1.iconTrs_.gameObject, false)
				arg_350_1.callingController_:SetSelectedState("normal")

				local var_353_18 = arg_350_1:GetWordFromCfg(1104905083)
				local var_353_19 = arg_350_1:FormatText(var_353_18.content)

				arg_350_1.text_.text = var_353_19

				LuaForUtil.ClearLinePrefixSymbol(arg_350_1.text_)

				local var_353_20 = 5
				local var_353_21 = utf8.len(var_353_19)
				local var_353_22 = var_353_20 <= 0 and var_353_16 or var_353_16 * (var_353_21 / var_353_20)

				if var_353_22 > 0 and var_353_16 < var_353_22 then
					arg_350_1.talkMaxDuration = var_353_22

					if var_353_22 + var_353_15 > arg_350_1.duration_ then
						arg_350_1.duration_ = var_353_22 + var_353_15
					end
				end

				arg_350_1.text_.text = var_353_19
				arg_350_1.typewritter.percent = 0

				arg_350_1.typewritter:SetDirty()
				arg_350_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905083", "story_v_side_new_1104905.awb") ~= 0 then
					local var_353_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905083", "story_v_side_new_1104905.awb") / 1000

					if var_353_23 + var_353_15 > arg_350_1.duration_ then
						arg_350_1.duration_ = var_353_23 + var_353_15
					end

					if var_353_18.prefab_name ~= "" and arg_350_1.actors_[var_353_18.prefab_name] ~= nil then
						local var_353_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_350_1.actors_[var_353_18.prefab_name].transform, "story_v_side_new_1104905", "1104905083", "story_v_side_new_1104905.awb")

						arg_350_1:RecordAudio("1104905083", var_353_24)
						arg_350_1:RecordAudio("1104905083", var_353_24)
					else
						arg_350_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905083", "story_v_side_new_1104905.awb")
					end

					arg_350_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905083", "story_v_side_new_1104905.awb")
				end

				arg_350_1:RecordContent(arg_350_1.text_.text)
			end

			local var_353_25 = math.max(var_353_16, arg_350_1.talkMaxDuration)

			if var_353_15 <= arg_350_1.time_ and arg_350_1.time_ < var_353_15 + var_353_25 then
				arg_350_1.typewritter.percent = (arg_350_1.time_ - var_353_15) / var_353_25

				arg_350_1.typewritter:SetDirty()
			end

			if arg_350_1.time_ >= var_353_15 + var_353_25 and arg_350_1.time_ < var_353_15 + var_353_25 + arg_353_0 then
				arg_350_1.typewritter.percent = 1

				arg_350_1.typewritter:SetDirty()
				arg_350_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905084 = function(arg_354_0, arg_354_1)
		arg_354_1.time_ = 0
		arg_354_1.frameCnt_ = 0
		arg_354_1.state_ = "playing"
		arg_354_1.curTalkId_ = 1104905084
		arg_354_1.duration_ = 5

		SetActive(arg_354_1.tipsGo_, false)

		function arg_354_1.onSingleLineFinish_()
			arg_354_1.onSingleLineUpdate_ = nil
			arg_354_1.onSingleLineFinish_ = nil
			arg_354_1.state_ = "waiting"
		end

		function arg_354_1.playNext_(arg_356_0)
			if arg_356_0 == 1 then
				arg_354_0:Play1104905085(arg_354_1)
			end
		end

		function arg_354_1.onSingleLineUpdate_(arg_357_0)
			local var_357_0 = arg_354_1.actors_["1049ui_story"]
			local var_357_1 = 0

			if var_357_1 < arg_354_1.time_ and arg_354_1.time_ <= var_357_1 + arg_357_0 and not isNil(var_357_0) and arg_354_1.var_.characterEffect1049ui_story == nil then
				arg_354_1.var_.characterEffect1049ui_story = var_357_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_357_2 = 0.200000002980232

			if var_357_1 <= arg_354_1.time_ and arg_354_1.time_ < var_357_1 + var_357_2 and not isNil(var_357_0) then
				local var_357_3 = (arg_354_1.time_ - var_357_1) / var_357_2

				if arg_354_1.var_.characterEffect1049ui_story and not isNil(var_357_0) then
					local var_357_4 = Mathf.Lerp(0, 0.5, var_357_3)

					arg_354_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_354_1.var_.characterEffect1049ui_story.fillRatio = var_357_4
				end
			end

			if arg_354_1.time_ >= var_357_1 + var_357_2 and arg_354_1.time_ < var_357_1 + var_357_2 + arg_357_0 and not isNil(var_357_0) and arg_354_1.var_.characterEffect1049ui_story then
				local var_357_5 = 0.5

				arg_354_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_354_1.var_.characterEffect1049ui_story.fillRatio = var_357_5
			end

			local var_357_6 = 0
			local var_357_7 = 0.425

			if var_357_6 < arg_354_1.time_ and arg_354_1.time_ <= var_357_6 + arg_357_0 then
				arg_354_1.talkMaxDuration = 0
				arg_354_1.dialogCg_.alpha = 1

				arg_354_1.dialog_:SetActive(true)
				SetActive(arg_354_1.leftNameGo_, true)

				local var_357_8 = arg_354_1:FormatText(StoryNameCfg[7].name)

				arg_354_1.leftNameTxt_.text = var_357_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_354_1.leftNameTxt_.transform)

				arg_354_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_354_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_354_1:RecordName(arg_354_1.leftNameTxt_.text)
				SetActive(arg_354_1.iconTrs_.gameObject, false)
				arg_354_1.callingController_:SetSelectedState("normal")

				local var_357_9 = arg_354_1:GetWordFromCfg(1104905084)
				local var_357_10 = arg_354_1:FormatText(var_357_9.content)

				arg_354_1.text_.text = var_357_10

				LuaForUtil.ClearLinePrefixSymbol(arg_354_1.text_)

				local var_357_11 = 17
				local var_357_12 = utf8.len(var_357_10)
				local var_357_13 = var_357_11 <= 0 and var_357_7 or var_357_7 * (var_357_12 / var_357_11)

				if var_357_13 > 0 and var_357_7 < var_357_13 then
					arg_354_1.talkMaxDuration = var_357_13

					if var_357_13 + var_357_6 > arg_354_1.duration_ then
						arg_354_1.duration_ = var_357_13 + var_357_6
					end
				end

				arg_354_1.text_.text = var_357_10
				arg_354_1.typewritter.percent = 0

				arg_354_1.typewritter:SetDirty()
				arg_354_1:ShowNextGo(false)
				arg_354_1:RecordContent(arg_354_1.text_.text)
			end

			local var_357_14 = math.max(var_357_7, arg_354_1.talkMaxDuration)

			if var_357_6 <= arg_354_1.time_ and arg_354_1.time_ < var_357_6 + var_357_14 then
				arg_354_1.typewritter.percent = (arg_354_1.time_ - var_357_6) / var_357_14

				arg_354_1.typewritter:SetDirty()
			end

			if arg_354_1.time_ >= var_357_6 + var_357_14 and arg_354_1.time_ < var_357_6 + var_357_14 + arg_357_0 then
				arg_354_1.typewritter.percent = 1

				arg_354_1.typewritter:SetDirty()
				arg_354_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905085 = function(arg_358_0, arg_358_1)
		arg_358_1.time_ = 0
		arg_358_1.frameCnt_ = 0
		arg_358_1.state_ = "playing"
		arg_358_1.curTalkId_ = 1104905085
		arg_358_1.duration_ = 5.03

		SetActive(arg_358_1.tipsGo_, false)

		function arg_358_1.onSingleLineFinish_()
			arg_358_1.onSingleLineUpdate_ = nil
			arg_358_1.onSingleLineFinish_ = nil
			arg_358_1.state_ = "waiting"
		end

		function arg_358_1.playNext_(arg_360_0)
			if arg_360_0 == 1 then
				arg_358_0:Play1104905086(arg_358_1)
			end
		end

		function arg_358_1.onSingleLineUpdate_(arg_361_0)
			local var_361_0 = arg_358_1.actors_["1049ui_story"]
			local var_361_1 = 0

			if var_361_1 < arg_358_1.time_ and arg_358_1.time_ <= var_361_1 + arg_361_0 and not isNil(var_361_0) and arg_358_1.var_.characterEffect1049ui_story == nil then
				arg_358_1.var_.characterEffect1049ui_story = var_361_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_361_2 = 0.200000002980232

			if var_361_1 <= arg_358_1.time_ and arg_358_1.time_ < var_361_1 + var_361_2 and not isNil(var_361_0) then
				local var_361_3 = (arg_358_1.time_ - var_361_1) / var_361_2

				if arg_358_1.var_.characterEffect1049ui_story and not isNil(var_361_0) then
					arg_358_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_358_1.time_ >= var_361_1 + var_361_2 and arg_358_1.time_ < var_361_1 + var_361_2 + arg_361_0 and not isNil(var_361_0) and arg_358_1.var_.characterEffect1049ui_story then
				arg_358_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_361_4 = 0

			if var_361_4 < arg_358_1.time_ and arg_358_1.time_ <= var_361_4 + arg_361_0 then
				arg_358_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_361_5 = 0

			if var_361_5 < arg_358_1.time_ and arg_358_1.time_ <= var_361_5 + arg_361_0 then
				arg_358_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva", "EmotionTimelineAnimator")
			end

			local var_361_6 = 0
			local var_361_7 = 0.65

			if var_361_6 < arg_358_1.time_ and arg_358_1.time_ <= var_361_6 + arg_361_0 then
				arg_358_1.talkMaxDuration = 0
				arg_358_1.dialogCg_.alpha = 1

				arg_358_1.dialog_:SetActive(true)
				SetActive(arg_358_1.leftNameGo_, true)

				local var_361_8 = arg_358_1:FormatText(StoryNameCfg[551].name)

				arg_358_1.leftNameTxt_.text = var_361_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_358_1.leftNameTxt_.transform)

				arg_358_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_358_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_358_1:RecordName(arg_358_1.leftNameTxt_.text)
				SetActive(arg_358_1.iconTrs_.gameObject, false)
				arg_358_1.callingController_:SetSelectedState("normal")

				local var_361_9 = arg_358_1:GetWordFromCfg(1104905085)
				local var_361_10 = arg_358_1:FormatText(var_361_9.content)

				arg_358_1.text_.text = var_361_10

				LuaForUtil.ClearLinePrefixSymbol(arg_358_1.text_)

				local var_361_11 = 26
				local var_361_12 = utf8.len(var_361_10)
				local var_361_13 = var_361_11 <= 0 and var_361_7 or var_361_7 * (var_361_12 / var_361_11)

				if var_361_13 > 0 and var_361_7 < var_361_13 then
					arg_358_1.talkMaxDuration = var_361_13

					if var_361_13 + var_361_6 > arg_358_1.duration_ then
						arg_358_1.duration_ = var_361_13 + var_361_6
					end
				end

				arg_358_1.text_.text = var_361_10
				arg_358_1.typewritter.percent = 0

				arg_358_1.typewritter:SetDirty()
				arg_358_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905085", "story_v_side_new_1104905.awb") ~= 0 then
					local var_361_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905085", "story_v_side_new_1104905.awb") / 1000

					if var_361_14 + var_361_6 > arg_358_1.duration_ then
						arg_358_1.duration_ = var_361_14 + var_361_6
					end

					if var_361_9.prefab_name ~= "" and arg_358_1.actors_[var_361_9.prefab_name] ~= nil then
						local var_361_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_358_1.actors_[var_361_9.prefab_name].transform, "story_v_side_new_1104905", "1104905085", "story_v_side_new_1104905.awb")

						arg_358_1:RecordAudio("1104905085", var_361_15)
						arg_358_1:RecordAudio("1104905085", var_361_15)
					else
						arg_358_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905085", "story_v_side_new_1104905.awb")
					end

					arg_358_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905085", "story_v_side_new_1104905.awb")
				end

				arg_358_1:RecordContent(arg_358_1.text_.text)
			end

			local var_361_16 = math.max(var_361_7, arg_358_1.talkMaxDuration)

			if var_361_6 <= arg_358_1.time_ and arg_358_1.time_ < var_361_6 + var_361_16 then
				arg_358_1.typewritter.percent = (arg_358_1.time_ - var_361_6) / var_361_16

				arg_358_1.typewritter:SetDirty()
			end

			if arg_358_1.time_ >= var_361_6 + var_361_16 and arg_358_1.time_ < var_361_6 + var_361_16 + arg_361_0 then
				arg_358_1.typewritter.percent = 1

				arg_358_1.typewritter:SetDirty()
				arg_358_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905086 = function(arg_362_0, arg_362_1)
		arg_362_1.time_ = 0
		arg_362_1.frameCnt_ = 0
		arg_362_1.state_ = "playing"
		arg_362_1.curTalkId_ = 1104905086
		arg_362_1.duration_ = 9.03

		SetActive(arg_362_1.tipsGo_, false)

		function arg_362_1.onSingleLineFinish_()
			arg_362_1.onSingleLineUpdate_ = nil
			arg_362_1.onSingleLineFinish_ = nil
			arg_362_1.state_ = "waiting"
		end

		function arg_362_1.playNext_(arg_364_0)
			if arg_364_0 == 1 then
				arg_362_0:Play1104905087(arg_362_1)
			end
		end

		function arg_362_1.onSingleLineUpdate_(arg_365_0)
			local var_365_0 = 0

			if var_365_0 < arg_362_1.time_ and arg_362_1.time_ <= var_365_0 + arg_365_0 then
				arg_362_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_365_1 = 0

			if var_365_1 < arg_362_1.time_ and arg_362_1.time_ <= var_365_1 + arg_365_0 then
				arg_362_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_365_2 = 0
			local var_365_3 = 1.025

			if var_365_2 < arg_362_1.time_ and arg_362_1.time_ <= var_365_2 + arg_365_0 then
				arg_362_1.talkMaxDuration = 0
				arg_362_1.dialogCg_.alpha = 1

				arg_362_1.dialog_:SetActive(true)
				SetActive(arg_362_1.leftNameGo_, true)

				local var_365_4 = arg_362_1:FormatText(StoryNameCfg[551].name)

				arg_362_1.leftNameTxt_.text = var_365_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_362_1.leftNameTxt_.transform)

				arg_362_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_362_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_362_1:RecordName(arg_362_1.leftNameTxt_.text)
				SetActive(arg_362_1.iconTrs_.gameObject, false)
				arg_362_1.callingController_:SetSelectedState("normal")

				local var_365_5 = arg_362_1:GetWordFromCfg(1104905086)
				local var_365_6 = arg_362_1:FormatText(var_365_5.content)

				arg_362_1.text_.text = var_365_6

				LuaForUtil.ClearLinePrefixSymbol(arg_362_1.text_)

				local var_365_7 = 41
				local var_365_8 = utf8.len(var_365_6)
				local var_365_9 = var_365_7 <= 0 and var_365_3 or var_365_3 * (var_365_8 / var_365_7)

				if var_365_9 > 0 and var_365_3 < var_365_9 then
					arg_362_1.talkMaxDuration = var_365_9

					if var_365_9 + var_365_2 > arg_362_1.duration_ then
						arg_362_1.duration_ = var_365_9 + var_365_2
					end
				end

				arg_362_1.text_.text = var_365_6
				arg_362_1.typewritter.percent = 0

				arg_362_1.typewritter:SetDirty()
				arg_362_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905086", "story_v_side_new_1104905.awb") ~= 0 then
					local var_365_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905086", "story_v_side_new_1104905.awb") / 1000

					if var_365_10 + var_365_2 > arg_362_1.duration_ then
						arg_362_1.duration_ = var_365_10 + var_365_2
					end

					if var_365_5.prefab_name ~= "" and arg_362_1.actors_[var_365_5.prefab_name] ~= nil then
						local var_365_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_362_1.actors_[var_365_5.prefab_name].transform, "story_v_side_new_1104905", "1104905086", "story_v_side_new_1104905.awb")

						arg_362_1:RecordAudio("1104905086", var_365_11)
						arg_362_1:RecordAudio("1104905086", var_365_11)
					else
						arg_362_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905086", "story_v_side_new_1104905.awb")
					end

					arg_362_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905086", "story_v_side_new_1104905.awb")
				end

				arg_362_1:RecordContent(arg_362_1.text_.text)
			end

			local var_365_12 = math.max(var_365_3, arg_362_1.talkMaxDuration)

			if var_365_2 <= arg_362_1.time_ and arg_362_1.time_ < var_365_2 + var_365_12 then
				arg_362_1.typewritter.percent = (arg_362_1.time_ - var_365_2) / var_365_12

				arg_362_1.typewritter:SetDirty()
			end

			if arg_362_1.time_ >= var_365_2 + var_365_12 and arg_362_1.time_ < var_365_2 + var_365_12 + arg_365_0 then
				arg_362_1.typewritter.percent = 1

				arg_362_1.typewritter:SetDirty()
				arg_362_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905087 = function(arg_366_0, arg_366_1)
		arg_366_1.time_ = 0
		arg_366_1.frameCnt_ = 0
		arg_366_1.state_ = "playing"
		arg_366_1.curTalkId_ = 1104905087
		arg_366_1.duration_ = 5

		SetActive(arg_366_1.tipsGo_, false)

		function arg_366_1.onSingleLineFinish_()
			arg_366_1.onSingleLineUpdate_ = nil
			arg_366_1.onSingleLineFinish_ = nil
			arg_366_1.state_ = "waiting"
		end

		function arg_366_1.playNext_(arg_368_0)
			if arg_368_0 == 1 then
				arg_366_0:Play1104905088(arg_366_1)
			end
		end

		function arg_366_1.onSingleLineUpdate_(arg_369_0)
			local var_369_0 = arg_366_1.actors_["1049ui_story"].transform
			local var_369_1 = 0

			if var_369_1 < arg_366_1.time_ and arg_366_1.time_ <= var_369_1 + arg_369_0 then
				arg_366_1.var_.moveOldPos1049ui_story = var_369_0.localPosition
			end

			local var_369_2 = 0.001

			if var_369_1 <= arg_366_1.time_ and arg_366_1.time_ < var_369_1 + var_369_2 then
				local var_369_3 = (arg_366_1.time_ - var_369_1) / var_369_2
				local var_369_4 = Vector3.New(0, 100, 0)

				var_369_0.localPosition = Vector3.Lerp(arg_366_1.var_.moveOldPos1049ui_story, var_369_4, var_369_3)

				local var_369_5 = manager.ui.mainCamera.transform.position - var_369_0.position

				var_369_0.forward = Vector3.New(var_369_5.x, var_369_5.y, var_369_5.z)

				local var_369_6 = var_369_0.localEulerAngles

				var_369_6.z = 0
				var_369_6.x = 0
				var_369_0.localEulerAngles = var_369_6
			end

			if arg_366_1.time_ >= var_369_1 + var_369_2 and arg_366_1.time_ < var_369_1 + var_369_2 + arg_369_0 then
				var_369_0.localPosition = Vector3.New(0, 100, 0)

				local var_369_7 = manager.ui.mainCamera.transform.position - var_369_0.position

				var_369_0.forward = Vector3.New(var_369_7.x, var_369_7.y, var_369_7.z)

				local var_369_8 = var_369_0.localEulerAngles

				var_369_8.z = 0
				var_369_8.x = 0
				var_369_0.localEulerAngles = var_369_8
			end

			local var_369_9 = arg_366_1.actors_["1049ui_story"]
			local var_369_10 = 0

			if var_369_10 < arg_366_1.time_ and arg_366_1.time_ <= var_369_10 + arg_369_0 and not isNil(var_369_9) and arg_366_1.var_.characterEffect1049ui_story == nil then
				arg_366_1.var_.characterEffect1049ui_story = var_369_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_369_11 = 0.200000002980232

			if var_369_10 <= arg_366_1.time_ and arg_366_1.time_ < var_369_10 + var_369_11 and not isNil(var_369_9) then
				local var_369_12 = (arg_366_1.time_ - var_369_10) / var_369_11

				if arg_366_1.var_.characterEffect1049ui_story and not isNil(var_369_9) then
					local var_369_13 = Mathf.Lerp(0, 0.5, var_369_12)

					arg_366_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_366_1.var_.characterEffect1049ui_story.fillRatio = var_369_13
				end
			end

			if arg_366_1.time_ >= var_369_10 + var_369_11 and arg_366_1.time_ < var_369_10 + var_369_11 + arg_369_0 and not isNil(var_369_9) and arg_366_1.var_.characterEffect1049ui_story then
				local var_369_14 = 0.5

				arg_366_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_366_1.var_.characterEffect1049ui_story.fillRatio = var_369_14
			end

			local var_369_15 = 0
			local var_369_16 = 1.275

			if var_369_15 < arg_366_1.time_ and arg_366_1.time_ <= var_369_15 + arg_369_0 then
				arg_366_1.talkMaxDuration = 0
				arg_366_1.dialogCg_.alpha = 1

				arg_366_1.dialog_:SetActive(true)
				SetActive(arg_366_1.leftNameGo_, false)

				arg_366_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_366_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_366_1:RecordName(arg_366_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_366_1.iconTrs_.gameObject, false)
				arg_366_1.callingController_:SetSelectedState("normal")

				local var_369_17 = arg_366_1:GetWordFromCfg(1104905087)
				local var_369_18 = arg_366_1:FormatText(var_369_17.content)

				arg_366_1.text_.text = var_369_18

				LuaForUtil.ClearLinePrefixSymbol(arg_366_1.text_)

				local var_369_19 = 51
				local var_369_20 = utf8.len(var_369_18)
				local var_369_21 = var_369_19 <= 0 and var_369_16 or var_369_16 * (var_369_20 / var_369_19)

				if var_369_21 > 0 and var_369_16 < var_369_21 then
					arg_366_1.talkMaxDuration = var_369_21

					if var_369_21 + var_369_15 > arg_366_1.duration_ then
						arg_366_1.duration_ = var_369_21 + var_369_15
					end
				end

				arg_366_1.text_.text = var_369_18
				arg_366_1.typewritter.percent = 0

				arg_366_1.typewritter:SetDirty()
				arg_366_1:ShowNextGo(false)
				arg_366_1:RecordContent(arg_366_1.text_.text)
			end

			local var_369_22 = math.max(var_369_16, arg_366_1.talkMaxDuration)

			if var_369_15 <= arg_366_1.time_ and arg_366_1.time_ < var_369_15 + var_369_22 then
				arg_366_1.typewritter.percent = (arg_366_1.time_ - var_369_15) / var_369_22

				arg_366_1.typewritter:SetDirty()
			end

			if arg_366_1.time_ >= var_369_15 + var_369_22 and arg_366_1.time_ < var_369_15 + var_369_22 + arg_369_0 then
				arg_366_1.typewritter.percent = 1

				arg_366_1.typewritter:SetDirty()
				arg_366_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905088 = function(arg_370_0, arg_370_1)
		arg_370_1.time_ = 0
		arg_370_1.frameCnt_ = 0
		arg_370_1.state_ = "playing"
		arg_370_1.curTalkId_ = 1104905088
		arg_370_1.duration_ = 5

		SetActive(arg_370_1.tipsGo_, false)

		function arg_370_1.onSingleLineFinish_()
			arg_370_1.onSingleLineUpdate_ = nil
			arg_370_1.onSingleLineFinish_ = nil
			arg_370_1.state_ = "waiting"
		end

		function arg_370_1.playNext_(arg_372_0)
			if arg_372_0 == 1 then
				arg_370_0:Play1104905089(arg_370_1)
			end
		end

		function arg_370_1.onSingleLineUpdate_(arg_373_0)
			local var_373_0 = 0
			local var_373_1 = 0.4

			if var_373_0 < arg_370_1.time_ and arg_370_1.time_ <= var_373_0 + arg_373_0 then
				arg_370_1.talkMaxDuration = 0
				arg_370_1.dialogCg_.alpha = 1

				arg_370_1.dialog_:SetActive(true)
				SetActive(arg_370_1.leftNameGo_, true)

				local var_373_2 = arg_370_1:FormatText(StoryNameCfg[7].name)

				arg_370_1.leftNameTxt_.text = var_373_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_370_1.leftNameTxt_.transform)

				arg_370_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_370_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_370_1:RecordName(arg_370_1.leftNameTxt_.text)
				SetActive(arg_370_1.iconTrs_.gameObject, false)
				arg_370_1.callingController_:SetSelectedState("normal")

				local var_373_3 = arg_370_1:GetWordFromCfg(1104905088)
				local var_373_4 = arg_370_1:FormatText(var_373_3.content)

				arg_370_1.text_.text = var_373_4

				LuaForUtil.ClearLinePrefixSymbol(arg_370_1.text_)

				local var_373_5 = 16
				local var_373_6 = utf8.len(var_373_4)
				local var_373_7 = var_373_5 <= 0 and var_373_1 or var_373_1 * (var_373_6 / var_373_5)

				if var_373_7 > 0 and var_373_1 < var_373_7 then
					arg_370_1.talkMaxDuration = var_373_7

					if var_373_7 + var_373_0 > arg_370_1.duration_ then
						arg_370_1.duration_ = var_373_7 + var_373_0
					end
				end

				arg_370_1.text_.text = var_373_4
				arg_370_1.typewritter.percent = 0

				arg_370_1.typewritter:SetDirty()
				arg_370_1:ShowNextGo(false)
				arg_370_1:RecordContent(arg_370_1.text_.text)
			end

			local var_373_8 = math.max(var_373_1, arg_370_1.talkMaxDuration)

			if var_373_0 <= arg_370_1.time_ and arg_370_1.time_ < var_373_0 + var_373_8 then
				arg_370_1.typewritter.percent = (arg_370_1.time_ - var_373_0) / var_373_8

				arg_370_1.typewritter:SetDirty()
			end

			if arg_370_1.time_ >= var_373_0 + var_373_8 and arg_370_1.time_ < var_373_0 + var_373_8 + arg_373_0 then
				arg_370_1.typewritter.percent = 1

				arg_370_1.typewritter:SetDirty()
				arg_370_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905089 = function(arg_374_0, arg_374_1)
		arg_374_1.time_ = 0
		arg_374_1.frameCnt_ = 0
		arg_374_1.state_ = "playing"
		arg_374_1.curTalkId_ = 1104905089
		arg_374_1.duration_ = 5

		SetActive(arg_374_1.tipsGo_, false)

		function arg_374_1.onSingleLineFinish_()
			arg_374_1.onSingleLineUpdate_ = nil
			arg_374_1.onSingleLineFinish_ = nil
			arg_374_1.state_ = "waiting"
		end

		function arg_374_1.playNext_(arg_376_0)
			if arg_376_0 == 1 then
				arg_374_0:Play1104905090(arg_374_1)
			end
		end

		function arg_374_1.onSingleLineUpdate_(arg_377_0)
			local var_377_0 = 0
			local var_377_1 = 0.75

			if var_377_0 < arg_374_1.time_ and arg_374_1.time_ <= var_377_0 + arg_377_0 then
				arg_374_1.talkMaxDuration = 0
				arg_374_1.dialogCg_.alpha = 1

				arg_374_1.dialog_:SetActive(true)
				SetActive(arg_374_1.leftNameGo_, true)

				local var_377_2 = arg_374_1:FormatText(StoryNameCfg[7].name)

				arg_374_1.leftNameTxt_.text = var_377_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_374_1.leftNameTxt_.transform)

				arg_374_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_374_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_374_1:RecordName(arg_374_1.leftNameTxt_.text)
				SetActive(arg_374_1.iconTrs_.gameObject, false)
				arg_374_1.callingController_:SetSelectedState("normal")

				local var_377_3 = arg_374_1:GetWordFromCfg(1104905089)
				local var_377_4 = arg_374_1:FormatText(var_377_3.content)

				arg_374_1.text_.text = var_377_4

				LuaForUtil.ClearLinePrefixSymbol(arg_374_1.text_)

				local var_377_5 = 30
				local var_377_6 = utf8.len(var_377_4)
				local var_377_7 = var_377_5 <= 0 and var_377_1 or var_377_1 * (var_377_6 / var_377_5)

				if var_377_7 > 0 and var_377_1 < var_377_7 then
					arg_374_1.talkMaxDuration = var_377_7

					if var_377_7 + var_377_0 > arg_374_1.duration_ then
						arg_374_1.duration_ = var_377_7 + var_377_0
					end
				end

				arg_374_1.text_.text = var_377_4
				arg_374_1.typewritter.percent = 0

				arg_374_1.typewritter:SetDirty()
				arg_374_1:ShowNextGo(false)
				arg_374_1:RecordContent(arg_374_1.text_.text)
			end

			local var_377_8 = math.max(var_377_1, arg_374_1.talkMaxDuration)

			if var_377_0 <= arg_374_1.time_ and arg_374_1.time_ < var_377_0 + var_377_8 then
				arg_374_1.typewritter.percent = (arg_374_1.time_ - var_377_0) / var_377_8

				arg_374_1.typewritter:SetDirty()
			end

			if arg_374_1.time_ >= var_377_0 + var_377_8 and arg_374_1.time_ < var_377_0 + var_377_8 + arg_377_0 then
				arg_374_1.typewritter.percent = 1

				arg_374_1.typewritter:SetDirty()
				arg_374_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905090 = function(arg_378_0, arg_378_1)
		arg_378_1.time_ = 0
		arg_378_1.frameCnt_ = 0
		arg_378_1.state_ = "playing"
		arg_378_1.curTalkId_ = 1104905090
		arg_378_1.duration_ = 3.7

		SetActive(arg_378_1.tipsGo_, false)

		function arg_378_1.onSingleLineFinish_()
			arg_378_1.onSingleLineUpdate_ = nil
			arg_378_1.onSingleLineFinish_ = nil
			arg_378_1.state_ = "waiting"
		end

		function arg_378_1.playNext_(arg_380_0)
			if arg_380_0 == 1 then
				arg_378_0:Play1104905091(arg_378_1)
			end
		end

		function arg_378_1.onSingleLineUpdate_(arg_381_0)
			local var_381_0 = arg_378_1.actors_["1049ui_story"]
			local var_381_1 = 0

			if var_381_1 < arg_378_1.time_ and arg_378_1.time_ <= var_381_1 + arg_381_0 and not isNil(var_381_0) and arg_378_1.var_.characterEffect1049ui_story == nil then
				arg_378_1.var_.characterEffect1049ui_story = var_381_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_381_2 = 0.200000002980232

			if var_381_1 <= arg_378_1.time_ and arg_378_1.time_ < var_381_1 + var_381_2 and not isNil(var_381_0) then
				local var_381_3 = (arg_378_1.time_ - var_381_1) / var_381_2

				if arg_378_1.var_.characterEffect1049ui_story and not isNil(var_381_0) then
					arg_378_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_378_1.time_ >= var_381_1 + var_381_2 and arg_378_1.time_ < var_381_1 + var_381_2 + arg_381_0 and not isNil(var_381_0) and arg_378_1.var_.characterEffect1049ui_story then
				arg_378_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_381_4 = 0

			if var_381_4 < arg_378_1.time_ and arg_378_1.time_ <= var_381_4 + arg_381_0 then
				arg_378_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_381_5 = 0

			if var_381_5 < arg_378_1.time_ and arg_378_1.time_ <= var_381_5 + arg_381_0 then
				arg_378_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_381_6 = arg_378_1.actors_["1049ui_story"].transform
			local var_381_7 = 0

			if var_381_7 < arg_378_1.time_ and arg_378_1.time_ <= var_381_7 + arg_381_0 then
				arg_378_1.var_.moveOldPos1049ui_story = var_381_6.localPosition
			end

			local var_381_8 = 0.001

			if var_381_7 <= arg_378_1.time_ and arg_378_1.time_ < var_381_7 + var_381_8 then
				local var_381_9 = (arg_378_1.time_ - var_381_7) / var_381_8
				local var_381_10 = Vector3.New(0, -1.2, -6)

				var_381_6.localPosition = Vector3.Lerp(arg_378_1.var_.moveOldPos1049ui_story, var_381_10, var_381_9)

				local var_381_11 = manager.ui.mainCamera.transform.position - var_381_6.position

				var_381_6.forward = Vector3.New(var_381_11.x, var_381_11.y, var_381_11.z)

				local var_381_12 = var_381_6.localEulerAngles

				var_381_12.z = 0
				var_381_12.x = 0
				var_381_6.localEulerAngles = var_381_12
			end

			if arg_378_1.time_ >= var_381_7 + var_381_8 and arg_378_1.time_ < var_381_7 + var_381_8 + arg_381_0 then
				var_381_6.localPosition = Vector3.New(0, -1.2, -6)

				local var_381_13 = manager.ui.mainCamera.transform.position - var_381_6.position

				var_381_6.forward = Vector3.New(var_381_13.x, var_381_13.y, var_381_13.z)

				local var_381_14 = var_381_6.localEulerAngles

				var_381_14.z = 0
				var_381_14.x = 0
				var_381_6.localEulerAngles = var_381_14
			end

			local var_381_15 = 0
			local var_381_16 = 0.325

			if var_381_15 < arg_378_1.time_ and arg_378_1.time_ <= var_381_15 + arg_381_0 then
				arg_378_1.talkMaxDuration = 0
				arg_378_1.dialogCg_.alpha = 1

				arg_378_1.dialog_:SetActive(true)
				SetActive(arg_378_1.leftNameGo_, true)

				local var_381_17 = arg_378_1:FormatText(StoryNameCfg[551].name)

				arg_378_1.leftNameTxt_.text = var_381_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_378_1.leftNameTxt_.transform)

				arg_378_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_378_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_378_1:RecordName(arg_378_1.leftNameTxt_.text)
				SetActive(arg_378_1.iconTrs_.gameObject, false)
				arg_378_1.callingController_:SetSelectedState("normal")

				local var_381_18 = arg_378_1:GetWordFromCfg(1104905090)
				local var_381_19 = arg_378_1:FormatText(var_381_18.content)

				arg_378_1.text_.text = var_381_19

				LuaForUtil.ClearLinePrefixSymbol(arg_378_1.text_)

				local var_381_20 = 13
				local var_381_21 = utf8.len(var_381_19)
				local var_381_22 = var_381_20 <= 0 and var_381_16 or var_381_16 * (var_381_21 / var_381_20)

				if var_381_22 > 0 and var_381_16 < var_381_22 then
					arg_378_1.talkMaxDuration = var_381_22

					if var_381_22 + var_381_15 > arg_378_1.duration_ then
						arg_378_1.duration_ = var_381_22 + var_381_15
					end
				end

				arg_378_1.text_.text = var_381_19
				arg_378_1.typewritter.percent = 0

				arg_378_1.typewritter:SetDirty()
				arg_378_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905090", "story_v_side_new_1104905.awb") ~= 0 then
					local var_381_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905090", "story_v_side_new_1104905.awb") / 1000

					if var_381_23 + var_381_15 > arg_378_1.duration_ then
						arg_378_1.duration_ = var_381_23 + var_381_15
					end

					if var_381_18.prefab_name ~= "" and arg_378_1.actors_[var_381_18.prefab_name] ~= nil then
						local var_381_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_378_1.actors_[var_381_18.prefab_name].transform, "story_v_side_new_1104905", "1104905090", "story_v_side_new_1104905.awb")

						arg_378_1:RecordAudio("1104905090", var_381_24)
						arg_378_1:RecordAudio("1104905090", var_381_24)
					else
						arg_378_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905090", "story_v_side_new_1104905.awb")
					end

					arg_378_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905090", "story_v_side_new_1104905.awb")
				end

				arg_378_1:RecordContent(arg_378_1.text_.text)
			end

			local var_381_25 = math.max(var_381_16, arg_378_1.talkMaxDuration)

			if var_381_15 <= arg_378_1.time_ and arg_378_1.time_ < var_381_15 + var_381_25 then
				arg_378_1.typewritter.percent = (arg_378_1.time_ - var_381_15) / var_381_25

				arg_378_1.typewritter:SetDirty()
			end

			if arg_378_1.time_ >= var_381_15 + var_381_25 and arg_378_1.time_ < var_381_15 + var_381_25 + arg_381_0 then
				arg_378_1.typewritter.percent = 1

				arg_378_1.typewritter:SetDirty()
				arg_378_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905091 = function(arg_382_0, arg_382_1)
		arg_382_1.time_ = 0
		arg_382_1.frameCnt_ = 0
		arg_382_1.state_ = "playing"
		arg_382_1.curTalkId_ = 1104905091
		arg_382_1.duration_ = 5

		SetActive(arg_382_1.tipsGo_, false)

		function arg_382_1.onSingleLineFinish_()
			arg_382_1.onSingleLineUpdate_ = nil
			arg_382_1.onSingleLineFinish_ = nil
			arg_382_1.state_ = "waiting"
		end

		function arg_382_1.playNext_(arg_384_0)
			if arg_384_0 == 1 then
				arg_382_0:Play1104905092(arg_382_1)
			end
		end

		function arg_382_1.onSingleLineUpdate_(arg_385_0)
			local var_385_0 = arg_382_1.actors_["1049ui_story"]
			local var_385_1 = 0

			if var_385_1 < arg_382_1.time_ and arg_382_1.time_ <= var_385_1 + arg_385_0 and not isNil(var_385_0) and arg_382_1.var_.characterEffect1049ui_story == nil then
				arg_382_1.var_.characterEffect1049ui_story = var_385_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_385_2 = 0.200000002980232

			if var_385_1 <= arg_382_1.time_ and arg_382_1.time_ < var_385_1 + var_385_2 and not isNil(var_385_0) then
				local var_385_3 = (arg_382_1.time_ - var_385_1) / var_385_2

				if arg_382_1.var_.characterEffect1049ui_story and not isNil(var_385_0) then
					local var_385_4 = Mathf.Lerp(0, 0.5, var_385_3)

					arg_382_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_382_1.var_.characterEffect1049ui_story.fillRatio = var_385_4
				end
			end

			if arg_382_1.time_ >= var_385_1 + var_385_2 and arg_382_1.time_ < var_385_1 + var_385_2 + arg_385_0 and not isNil(var_385_0) and arg_382_1.var_.characterEffect1049ui_story then
				local var_385_5 = 0.5

				arg_382_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_382_1.var_.characterEffect1049ui_story.fillRatio = var_385_5
			end

			local var_385_6 = 0
			local var_385_7 = 0.3

			if var_385_6 < arg_382_1.time_ and arg_382_1.time_ <= var_385_6 + arg_385_0 then
				arg_382_1.talkMaxDuration = 0
				arg_382_1.dialogCg_.alpha = 1

				arg_382_1.dialog_:SetActive(true)
				SetActive(arg_382_1.leftNameGo_, true)

				local var_385_8 = arg_382_1:FormatText(StoryNameCfg[7].name)

				arg_382_1.leftNameTxt_.text = var_385_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_382_1.leftNameTxt_.transform)

				arg_382_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_382_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_382_1:RecordName(arg_382_1.leftNameTxt_.text)
				SetActive(arg_382_1.iconTrs_.gameObject, false)
				arg_382_1.callingController_:SetSelectedState("normal")

				local var_385_9 = arg_382_1:GetWordFromCfg(1104905091)
				local var_385_10 = arg_382_1:FormatText(var_385_9.content)

				arg_382_1.text_.text = var_385_10

				LuaForUtil.ClearLinePrefixSymbol(arg_382_1.text_)

				local var_385_11 = 12
				local var_385_12 = utf8.len(var_385_10)
				local var_385_13 = var_385_11 <= 0 and var_385_7 or var_385_7 * (var_385_12 / var_385_11)

				if var_385_13 > 0 and var_385_7 < var_385_13 then
					arg_382_1.talkMaxDuration = var_385_13

					if var_385_13 + var_385_6 > arg_382_1.duration_ then
						arg_382_1.duration_ = var_385_13 + var_385_6
					end
				end

				arg_382_1.text_.text = var_385_10
				arg_382_1.typewritter.percent = 0

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(false)
				arg_382_1:RecordContent(arg_382_1.text_.text)
			end

			local var_385_14 = math.max(var_385_7, arg_382_1.talkMaxDuration)

			if var_385_6 <= arg_382_1.time_ and arg_382_1.time_ < var_385_6 + var_385_14 then
				arg_382_1.typewritter.percent = (arg_382_1.time_ - var_385_6) / var_385_14

				arg_382_1.typewritter:SetDirty()
			end

			if arg_382_1.time_ >= var_385_6 + var_385_14 and arg_382_1.time_ < var_385_6 + var_385_14 + arg_385_0 then
				arg_382_1.typewritter.percent = 1

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905092 = function(arg_386_0, arg_386_1)
		arg_386_1.time_ = 0
		arg_386_1.frameCnt_ = 0
		arg_386_1.state_ = "playing"
		arg_386_1.curTalkId_ = 1104905092
		arg_386_1.duration_ = 5

		SetActive(arg_386_1.tipsGo_, false)

		function arg_386_1.onSingleLineFinish_()
			arg_386_1.onSingleLineUpdate_ = nil
			arg_386_1.onSingleLineFinish_ = nil
			arg_386_1.state_ = "waiting"
		end

		function arg_386_1.playNext_(arg_388_0)
			if arg_388_0 == 1 then
				arg_386_0:Play1104905093(arg_386_1)
			end
		end

		function arg_386_1.onSingleLineUpdate_(arg_389_0)
			local var_389_0 = arg_386_1.actors_["1049ui_story"]
			local var_389_1 = 0

			if var_389_1 < arg_386_1.time_ and arg_386_1.time_ <= var_389_1 + arg_389_0 and not isNil(var_389_0) and arg_386_1.var_.characterEffect1049ui_story == nil then
				arg_386_1.var_.characterEffect1049ui_story = var_389_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_389_2 = 0.200000002980232

			if var_389_1 <= arg_386_1.time_ and arg_386_1.time_ < var_389_1 + var_389_2 and not isNil(var_389_0) then
				local var_389_3 = (arg_386_1.time_ - var_389_1) / var_389_2

				if arg_386_1.var_.characterEffect1049ui_story and not isNil(var_389_0) then
					arg_386_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_386_1.time_ >= var_389_1 + var_389_2 and arg_386_1.time_ < var_389_1 + var_389_2 + arg_389_0 and not isNil(var_389_0) and arg_386_1.var_.characterEffect1049ui_story then
				arg_386_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_389_4 = 0

			if var_389_4 < arg_386_1.time_ and arg_386_1.time_ <= var_389_4 + arg_389_0 then
				arg_386_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action7_1")
			end

			local var_389_5 = 0

			if var_389_5 < arg_386_1.time_ and arg_386_1.time_ <= var_389_5 + arg_389_0 then
				arg_386_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_389_6 = 0
			local var_389_7 = 0.4

			if var_389_6 < arg_386_1.time_ and arg_386_1.time_ <= var_389_6 + arg_389_0 then
				arg_386_1.talkMaxDuration = 0
				arg_386_1.dialogCg_.alpha = 1

				arg_386_1.dialog_:SetActive(true)
				SetActive(arg_386_1.leftNameGo_, true)

				local var_389_8 = arg_386_1:FormatText(StoryNameCfg[551].name)

				arg_386_1.leftNameTxt_.text = var_389_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_386_1.leftNameTxt_.transform)

				arg_386_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_386_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_386_1:RecordName(arg_386_1.leftNameTxt_.text)
				SetActive(arg_386_1.iconTrs_.gameObject, false)
				arg_386_1.callingController_:SetSelectedState("normal")

				local var_389_9 = arg_386_1:GetWordFromCfg(1104905092)
				local var_389_10 = arg_386_1:FormatText(var_389_9.content)

				arg_386_1.text_.text = var_389_10

				LuaForUtil.ClearLinePrefixSymbol(arg_386_1.text_)

				local var_389_11 = 16
				local var_389_12 = utf8.len(var_389_10)
				local var_389_13 = var_389_11 <= 0 and var_389_7 or var_389_7 * (var_389_12 / var_389_11)

				if var_389_13 > 0 and var_389_7 < var_389_13 then
					arg_386_1.talkMaxDuration = var_389_13

					if var_389_13 + var_389_6 > arg_386_1.duration_ then
						arg_386_1.duration_ = var_389_13 + var_389_6
					end
				end

				arg_386_1.text_.text = var_389_10
				arg_386_1.typewritter.percent = 0

				arg_386_1.typewritter:SetDirty()
				arg_386_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905092", "story_v_side_new_1104905.awb") ~= 0 then
					local var_389_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905092", "story_v_side_new_1104905.awb") / 1000

					if var_389_14 + var_389_6 > arg_386_1.duration_ then
						arg_386_1.duration_ = var_389_14 + var_389_6
					end

					if var_389_9.prefab_name ~= "" and arg_386_1.actors_[var_389_9.prefab_name] ~= nil then
						local var_389_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_386_1.actors_[var_389_9.prefab_name].transform, "story_v_side_new_1104905", "1104905092", "story_v_side_new_1104905.awb")

						arg_386_1:RecordAudio("1104905092", var_389_15)
						arg_386_1:RecordAudio("1104905092", var_389_15)
					else
						arg_386_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905092", "story_v_side_new_1104905.awb")
					end

					arg_386_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905092", "story_v_side_new_1104905.awb")
				end

				arg_386_1:RecordContent(arg_386_1.text_.text)
			end

			local var_389_16 = math.max(var_389_7, arg_386_1.talkMaxDuration)

			if var_389_6 <= arg_386_1.time_ and arg_386_1.time_ < var_389_6 + var_389_16 then
				arg_386_1.typewritter.percent = (arg_386_1.time_ - var_389_6) / var_389_16

				arg_386_1.typewritter:SetDirty()
			end

			if arg_386_1.time_ >= var_389_6 + var_389_16 and arg_386_1.time_ < var_389_6 + var_389_16 + arg_389_0 then
				arg_386_1.typewritter.percent = 1

				arg_386_1.typewritter:SetDirty()
				arg_386_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905093 = function(arg_390_0, arg_390_1)
		arg_390_1.time_ = 0
		arg_390_1.frameCnt_ = 0
		arg_390_1.state_ = "playing"
		arg_390_1.curTalkId_ = 1104905093
		arg_390_1.duration_ = 5

		SetActive(arg_390_1.tipsGo_, false)

		function arg_390_1.onSingleLineFinish_()
			arg_390_1.onSingleLineUpdate_ = nil
			arg_390_1.onSingleLineFinish_ = nil
			arg_390_1.state_ = "waiting"
		end

		function arg_390_1.playNext_(arg_392_0)
			if arg_392_0 == 1 then
				arg_390_0:Play1104905094(arg_390_1)
			end
		end

		function arg_390_1.onSingleLineUpdate_(arg_393_0)
			local var_393_0 = arg_390_1.actors_["1049ui_story"]
			local var_393_1 = 0

			if var_393_1 < arg_390_1.time_ and arg_390_1.time_ <= var_393_1 + arg_393_0 and not isNil(var_393_0) and arg_390_1.var_.characterEffect1049ui_story == nil then
				arg_390_1.var_.characterEffect1049ui_story = var_393_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_393_2 = 0.200000002980232

			if var_393_1 <= arg_390_1.time_ and arg_390_1.time_ < var_393_1 + var_393_2 and not isNil(var_393_0) then
				local var_393_3 = (arg_390_1.time_ - var_393_1) / var_393_2

				if arg_390_1.var_.characterEffect1049ui_story and not isNil(var_393_0) then
					local var_393_4 = Mathf.Lerp(0, 0.5, var_393_3)

					arg_390_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_390_1.var_.characterEffect1049ui_story.fillRatio = var_393_4
				end
			end

			if arg_390_1.time_ >= var_393_1 + var_393_2 and arg_390_1.time_ < var_393_1 + var_393_2 + arg_393_0 and not isNil(var_393_0) and arg_390_1.var_.characterEffect1049ui_story then
				local var_393_5 = 0.5

				arg_390_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_390_1.var_.characterEffect1049ui_story.fillRatio = var_393_5
			end

			local var_393_6 = 0
			local var_393_7 = 0.15

			if var_393_6 < arg_390_1.time_ and arg_390_1.time_ <= var_393_6 + arg_393_0 then
				arg_390_1.talkMaxDuration = 0
				arg_390_1.dialogCg_.alpha = 1

				arg_390_1.dialog_:SetActive(true)
				SetActive(arg_390_1.leftNameGo_, true)

				local var_393_8 = arg_390_1:FormatText(StoryNameCfg[7].name)

				arg_390_1.leftNameTxt_.text = var_393_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_390_1.leftNameTxt_.transform)

				arg_390_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_390_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_390_1:RecordName(arg_390_1.leftNameTxt_.text)
				SetActive(arg_390_1.iconTrs_.gameObject, false)
				arg_390_1.callingController_:SetSelectedState("normal")

				local var_393_9 = arg_390_1:GetWordFromCfg(1104905093)
				local var_393_10 = arg_390_1:FormatText(var_393_9.content)

				arg_390_1.text_.text = var_393_10

				LuaForUtil.ClearLinePrefixSymbol(arg_390_1.text_)

				local var_393_11 = 6
				local var_393_12 = utf8.len(var_393_10)
				local var_393_13 = var_393_11 <= 0 and var_393_7 or var_393_7 * (var_393_12 / var_393_11)

				if var_393_13 > 0 and var_393_7 < var_393_13 then
					arg_390_1.talkMaxDuration = var_393_13

					if var_393_13 + var_393_6 > arg_390_1.duration_ then
						arg_390_1.duration_ = var_393_13 + var_393_6
					end
				end

				arg_390_1.text_.text = var_393_10
				arg_390_1.typewritter.percent = 0

				arg_390_1.typewritter:SetDirty()
				arg_390_1:ShowNextGo(false)
				arg_390_1:RecordContent(arg_390_1.text_.text)
			end

			local var_393_14 = math.max(var_393_7, arg_390_1.talkMaxDuration)

			if var_393_6 <= arg_390_1.time_ and arg_390_1.time_ < var_393_6 + var_393_14 then
				arg_390_1.typewritter.percent = (arg_390_1.time_ - var_393_6) / var_393_14

				arg_390_1.typewritter:SetDirty()
			end

			if arg_390_1.time_ >= var_393_6 + var_393_14 and arg_390_1.time_ < var_393_6 + var_393_14 + arg_393_0 then
				arg_390_1.typewritter.percent = 1

				arg_390_1.typewritter:SetDirty()
				arg_390_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905094 = function(arg_394_0, arg_394_1)
		arg_394_1.time_ = 0
		arg_394_1.frameCnt_ = 0
		arg_394_1.state_ = "playing"
		arg_394_1.curTalkId_ = 1104905094
		arg_394_1.duration_ = 5

		SetActive(arg_394_1.tipsGo_, false)

		function arg_394_1.onSingleLineFinish_()
			arg_394_1.onSingleLineUpdate_ = nil
			arg_394_1.onSingleLineFinish_ = nil
			arg_394_1.state_ = "waiting"
		end

		function arg_394_1.playNext_(arg_396_0)
			if arg_396_0 == 1 then
				arg_394_0:Play1104905095(arg_394_1)
			end
		end

		function arg_394_1.onSingleLineUpdate_(arg_397_0)
			local var_397_0 = arg_394_1.actors_["1049ui_story"].transform
			local var_397_1 = 0

			if var_397_1 < arg_394_1.time_ and arg_394_1.time_ <= var_397_1 + arg_397_0 then
				arg_394_1.var_.moveOldPos1049ui_story = var_397_0.localPosition
			end

			local var_397_2 = 0.001

			if var_397_1 <= arg_394_1.time_ and arg_394_1.time_ < var_397_1 + var_397_2 then
				local var_397_3 = (arg_394_1.time_ - var_397_1) / var_397_2
				local var_397_4 = Vector3.New(0, 100, 0)

				var_397_0.localPosition = Vector3.Lerp(arg_394_1.var_.moveOldPos1049ui_story, var_397_4, var_397_3)

				local var_397_5 = manager.ui.mainCamera.transform.position - var_397_0.position

				var_397_0.forward = Vector3.New(var_397_5.x, var_397_5.y, var_397_5.z)

				local var_397_6 = var_397_0.localEulerAngles

				var_397_6.z = 0
				var_397_6.x = 0
				var_397_0.localEulerAngles = var_397_6
			end

			if arg_394_1.time_ >= var_397_1 + var_397_2 and arg_394_1.time_ < var_397_1 + var_397_2 + arg_397_0 then
				var_397_0.localPosition = Vector3.New(0, 100, 0)

				local var_397_7 = manager.ui.mainCamera.transform.position - var_397_0.position

				var_397_0.forward = Vector3.New(var_397_7.x, var_397_7.y, var_397_7.z)

				local var_397_8 = var_397_0.localEulerAngles

				var_397_8.z = 0
				var_397_8.x = 0
				var_397_0.localEulerAngles = var_397_8
			end

			local var_397_9 = 0
			local var_397_10 = 1.1

			if var_397_9 < arg_394_1.time_ and arg_394_1.time_ <= var_397_9 + arg_397_0 then
				arg_394_1.talkMaxDuration = 0
				arg_394_1.dialogCg_.alpha = 1

				arg_394_1.dialog_:SetActive(true)
				SetActive(arg_394_1.leftNameGo_, false)

				arg_394_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_394_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_394_1:RecordName(arg_394_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_394_1.iconTrs_.gameObject, false)
				arg_394_1.callingController_:SetSelectedState("normal")

				local var_397_11 = arg_394_1:GetWordFromCfg(1104905094)
				local var_397_12 = arg_394_1:FormatText(var_397_11.content)

				arg_394_1.text_.text = var_397_12

				LuaForUtil.ClearLinePrefixSymbol(arg_394_1.text_)

				local var_397_13 = 44
				local var_397_14 = utf8.len(var_397_12)
				local var_397_15 = var_397_13 <= 0 and var_397_10 or var_397_10 * (var_397_14 / var_397_13)

				if var_397_15 > 0 and var_397_10 < var_397_15 then
					arg_394_1.talkMaxDuration = var_397_15

					if var_397_15 + var_397_9 > arg_394_1.duration_ then
						arg_394_1.duration_ = var_397_15 + var_397_9
					end
				end

				arg_394_1.text_.text = var_397_12
				arg_394_1.typewritter.percent = 0

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(false)
				arg_394_1:RecordContent(arg_394_1.text_.text)
			end

			local var_397_16 = math.max(var_397_10, arg_394_1.talkMaxDuration)

			if var_397_9 <= arg_394_1.time_ and arg_394_1.time_ < var_397_9 + var_397_16 then
				arg_394_1.typewritter.percent = (arg_394_1.time_ - var_397_9) / var_397_16

				arg_394_1.typewritter:SetDirty()
			end

			if arg_394_1.time_ >= var_397_9 + var_397_16 and arg_394_1.time_ < var_397_9 + var_397_16 + arg_397_0 then
				arg_394_1.typewritter.percent = 1

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905095 = function(arg_398_0, arg_398_1)
		arg_398_1.time_ = 0
		arg_398_1.frameCnt_ = 0
		arg_398_1.state_ = "playing"
		arg_398_1.curTalkId_ = 1104905095
		arg_398_1.duration_ = 4.87

		SetActive(arg_398_1.tipsGo_, false)

		function arg_398_1.onSingleLineFinish_()
			arg_398_1.onSingleLineUpdate_ = nil
			arg_398_1.onSingleLineFinish_ = nil
			arg_398_1.state_ = "waiting"
		end

		function arg_398_1.playNext_(arg_400_0)
			if arg_400_0 == 1 then
				arg_398_0:Play1104905096(arg_398_1)
			end
		end

		function arg_398_1.onSingleLineUpdate_(arg_401_0)
			local var_401_0 = arg_398_1.actors_["1049ui_story"].transform
			local var_401_1 = 0

			if var_401_1 < arg_398_1.time_ and arg_398_1.time_ <= var_401_1 + arg_401_0 then
				arg_398_1.var_.moveOldPos1049ui_story = var_401_0.localPosition
			end

			local var_401_2 = 0.001

			if var_401_1 <= arg_398_1.time_ and arg_398_1.time_ < var_401_1 + var_401_2 then
				local var_401_3 = (arg_398_1.time_ - var_401_1) / var_401_2
				local var_401_4 = Vector3.New(0, -1.2, -6)

				var_401_0.localPosition = Vector3.Lerp(arg_398_1.var_.moveOldPos1049ui_story, var_401_4, var_401_3)

				local var_401_5 = manager.ui.mainCamera.transform.position - var_401_0.position

				var_401_0.forward = Vector3.New(var_401_5.x, var_401_5.y, var_401_5.z)

				local var_401_6 = var_401_0.localEulerAngles

				var_401_6.z = 0
				var_401_6.x = 0
				var_401_0.localEulerAngles = var_401_6
			end

			if arg_398_1.time_ >= var_401_1 + var_401_2 and arg_398_1.time_ < var_401_1 + var_401_2 + arg_401_0 then
				var_401_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_401_7 = manager.ui.mainCamera.transform.position - var_401_0.position

				var_401_0.forward = Vector3.New(var_401_7.x, var_401_7.y, var_401_7.z)

				local var_401_8 = var_401_0.localEulerAngles

				var_401_8.z = 0
				var_401_8.x = 0
				var_401_0.localEulerAngles = var_401_8
			end

			local var_401_9 = arg_398_1.actors_["1049ui_story"]
			local var_401_10 = 0

			if var_401_10 < arg_398_1.time_ and arg_398_1.time_ <= var_401_10 + arg_401_0 and not isNil(var_401_9) and arg_398_1.var_.characterEffect1049ui_story == nil then
				arg_398_1.var_.characterEffect1049ui_story = var_401_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_401_11 = 0.200000002980232

			if var_401_10 <= arg_398_1.time_ and arg_398_1.time_ < var_401_10 + var_401_11 and not isNil(var_401_9) then
				local var_401_12 = (arg_398_1.time_ - var_401_10) / var_401_11

				if arg_398_1.var_.characterEffect1049ui_story and not isNil(var_401_9) then
					arg_398_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_398_1.time_ >= var_401_10 + var_401_11 and arg_398_1.time_ < var_401_10 + var_401_11 + arg_401_0 and not isNil(var_401_9) and arg_398_1.var_.characterEffect1049ui_story then
				arg_398_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_401_13 = 0

			if var_401_13 < arg_398_1.time_ and arg_398_1.time_ <= var_401_13 + arg_401_0 then
				arg_398_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049actionlink/1049action476")
			end

			local var_401_14 = 0

			if var_401_14 < arg_398_1.time_ and arg_398_1.time_ <= var_401_14 + arg_401_0 then
				arg_398_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva", "EmotionTimelineAnimator")
			end

			local var_401_15 = 0
			local var_401_16 = 0.3

			if var_401_15 < arg_398_1.time_ and arg_398_1.time_ <= var_401_15 + arg_401_0 then
				arg_398_1.talkMaxDuration = 0
				arg_398_1.dialogCg_.alpha = 1

				arg_398_1.dialog_:SetActive(true)
				SetActive(arg_398_1.leftNameGo_, true)

				local var_401_17 = arg_398_1:FormatText(StoryNameCfg[551].name)

				arg_398_1.leftNameTxt_.text = var_401_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_398_1.leftNameTxt_.transform)

				arg_398_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_398_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_398_1:RecordName(arg_398_1.leftNameTxt_.text)
				SetActive(arg_398_1.iconTrs_.gameObject, false)
				arg_398_1.callingController_:SetSelectedState("normal")

				local var_401_18 = arg_398_1:GetWordFromCfg(1104905095)
				local var_401_19 = arg_398_1:FormatText(var_401_18.content)

				arg_398_1.text_.text = var_401_19

				LuaForUtil.ClearLinePrefixSymbol(arg_398_1.text_)

				local var_401_20 = 12
				local var_401_21 = utf8.len(var_401_19)
				local var_401_22 = var_401_20 <= 0 and var_401_16 or var_401_16 * (var_401_21 / var_401_20)

				if var_401_22 > 0 and var_401_16 < var_401_22 then
					arg_398_1.talkMaxDuration = var_401_22

					if var_401_22 + var_401_15 > arg_398_1.duration_ then
						arg_398_1.duration_ = var_401_22 + var_401_15
					end
				end

				arg_398_1.text_.text = var_401_19
				arg_398_1.typewritter.percent = 0

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905095", "story_v_side_new_1104905.awb") ~= 0 then
					local var_401_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905095", "story_v_side_new_1104905.awb") / 1000

					if var_401_23 + var_401_15 > arg_398_1.duration_ then
						arg_398_1.duration_ = var_401_23 + var_401_15
					end

					if var_401_18.prefab_name ~= "" and arg_398_1.actors_[var_401_18.prefab_name] ~= nil then
						local var_401_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_398_1.actors_[var_401_18.prefab_name].transform, "story_v_side_new_1104905", "1104905095", "story_v_side_new_1104905.awb")

						arg_398_1:RecordAudio("1104905095", var_401_24)
						arg_398_1:RecordAudio("1104905095", var_401_24)
					else
						arg_398_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905095", "story_v_side_new_1104905.awb")
					end

					arg_398_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905095", "story_v_side_new_1104905.awb")
				end

				arg_398_1:RecordContent(arg_398_1.text_.text)
			end

			local var_401_25 = math.max(var_401_16, arg_398_1.talkMaxDuration)

			if var_401_15 <= arg_398_1.time_ and arg_398_1.time_ < var_401_15 + var_401_25 then
				arg_398_1.typewritter.percent = (arg_398_1.time_ - var_401_15) / var_401_25

				arg_398_1.typewritter:SetDirty()
			end

			if arg_398_1.time_ >= var_401_15 + var_401_25 and arg_398_1.time_ < var_401_15 + var_401_25 + arg_401_0 then
				arg_398_1.typewritter.percent = 1

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905096 = function(arg_402_0, arg_402_1)
		arg_402_1.time_ = 0
		arg_402_1.frameCnt_ = 0
		arg_402_1.state_ = "playing"
		arg_402_1.curTalkId_ = 1104905096
		arg_402_1.duration_ = 5.73

		SetActive(arg_402_1.tipsGo_, false)

		function arg_402_1.onSingleLineFinish_()
			arg_402_1.onSingleLineUpdate_ = nil
			arg_402_1.onSingleLineFinish_ = nil
			arg_402_1.state_ = "waiting"
		end

		function arg_402_1.playNext_(arg_404_0)
			if arg_404_0 == 1 then
				arg_402_0:Play1104905097(arg_402_1)
			end
		end

		function arg_402_1.onSingleLineUpdate_(arg_405_0)
			local var_405_0 = 0

			if var_405_0 < arg_402_1.time_ and arg_402_1.time_ <= var_405_0 + arg_405_0 then
				arg_402_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_2")
			end

			local var_405_1 = 0

			if var_405_1 < arg_402_1.time_ and arg_402_1.time_ <= var_405_1 + arg_405_0 then
				arg_402_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_405_2 = 0
			local var_405_3 = 0.35

			if var_405_2 < arg_402_1.time_ and arg_402_1.time_ <= var_405_2 + arg_405_0 then
				arg_402_1.talkMaxDuration = 0
				arg_402_1.dialogCg_.alpha = 1

				arg_402_1.dialog_:SetActive(true)
				SetActive(arg_402_1.leftNameGo_, true)

				local var_405_4 = arg_402_1:FormatText(StoryNameCfg[551].name)

				arg_402_1.leftNameTxt_.text = var_405_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_402_1.leftNameTxt_.transform)

				arg_402_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_402_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_402_1:RecordName(arg_402_1.leftNameTxt_.text)
				SetActive(arg_402_1.iconTrs_.gameObject, false)
				arg_402_1.callingController_:SetSelectedState("normal")

				local var_405_5 = arg_402_1:GetWordFromCfg(1104905096)
				local var_405_6 = arg_402_1:FormatText(var_405_5.content)

				arg_402_1.text_.text = var_405_6

				LuaForUtil.ClearLinePrefixSymbol(arg_402_1.text_)

				local var_405_7 = 14
				local var_405_8 = utf8.len(var_405_6)
				local var_405_9 = var_405_7 <= 0 and var_405_3 or var_405_3 * (var_405_8 / var_405_7)

				if var_405_9 > 0 and var_405_3 < var_405_9 then
					arg_402_1.talkMaxDuration = var_405_9

					if var_405_9 + var_405_2 > arg_402_1.duration_ then
						arg_402_1.duration_ = var_405_9 + var_405_2
					end
				end

				arg_402_1.text_.text = var_405_6
				arg_402_1.typewritter.percent = 0

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905096", "story_v_side_new_1104905.awb") ~= 0 then
					local var_405_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905096", "story_v_side_new_1104905.awb") / 1000

					if var_405_10 + var_405_2 > arg_402_1.duration_ then
						arg_402_1.duration_ = var_405_10 + var_405_2
					end

					if var_405_5.prefab_name ~= "" and arg_402_1.actors_[var_405_5.prefab_name] ~= nil then
						local var_405_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_402_1.actors_[var_405_5.prefab_name].transform, "story_v_side_new_1104905", "1104905096", "story_v_side_new_1104905.awb")

						arg_402_1:RecordAudio("1104905096", var_405_11)
						arg_402_1:RecordAudio("1104905096", var_405_11)
					else
						arg_402_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905096", "story_v_side_new_1104905.awb")
					end

					arg_402_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905096", "story_v_side_new_1104905.awb")
				end

				arg_402_1:RecordContent(arg_402_1.text_.text)
			end

			local var_405_12 = math.max(var_405_3, arg_402_1.talkMaxDuration)

			if var_405_2 <= arg_402_1.time_ and arg_402_1.time_ < var_405_2 + var_405_12 then
				arg_402_1.typewritter.percent = (arg_402_1.time_ - var_405_2) / var_405_12

				arg_402_1.typewritter:SetDirty()
			end

			if arg_402_1.time_ >= var_405_2 + var_405_12 and arg_402_1.time_ < var_405_2 + var_405_12 + arg_405_0 then
				arg_402_1.typewritter.percent = 1

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905097 = function(arg_406_0, arg_406_1)
		arg_406_1.time_ = 0
		arg_406_1.frameCnt_ = 0
		arg_406_1.state_ = "playing"
		arg_406_1.curTalkId_ = 1104905097
		arg_406_1.duration_ = 5

		SetActive(arg_406_1.tipsGo_, false)

		function arg_406_1.onSingleLineFinish_()
			arg_406_1.onSingleLineUpdate_ = nil
			arg_406_1.onSingleLineFinish_ = nil
			arg_406_1.state_ = "waiting"
		end

		function arg_406_1.playNext_(arg_408_0)
			if arg_408_0 == 1 then
				arg_406_0:Play1104905098(arg_406_1)
			end
		end

		function arg_406_1.onSingleLineUpdate_(arg_409_0)
			local var_409_0 = arg_406_1.actors_["1049ui_story"]
			local var_409_1 = 0

			if var_409_1 < arg_406_1.time_ and arg_406_1.time_ <= var_409_1 + arg_409_0 and not isNil(var_409_0) and arg_406_1.var_.characterEffect1049ui_story == nil then
				arg_406_1.var_.characterEffect1049ui_story = var_409_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_409_2 = 0.200000002980232

			if var_409_1 <= arg_406_1.time_ and arg_406_1.time_ < var_409_1 + var_409_2 and not isNil(var_409_0) then
				local var_409_3 = (arg_406_1.time_ - var_409_1) / var_409_2

				if arg_406_1.var_.characterEffect1049ui_story and not isNil(var_409_0) then
					local var_409_4 = Mathf.Lerp(0, 0.5, var_409_3)

					arg_406_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_406_1.var_.characterEffect1049ui_story.fillRatio = var_409_4
				end
			end

			if arg_406_1.time_ >= var_409_1 + var_409_2 and arg_406_1.time_ < var_409_1 + var_409_2 + arg_409_0 and not isNil(var_409_0) and arg_406_1.var_.characterEffect1049ui_story then
				local var_409_5 = 0.5

				arg_406_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_406_1.var_.characterEffect1049ui_story.fillRatio = var_409_5
			end

			local var_409_6 = 0
			local var_409_7 = 0.05

			if var_409_6 < arg_406_1.time_ and arg_406_1.time_ <= var_409_6 + arg_409_0 then
				arg_406_1.talkMaxDuration = 0
				arg_406_1.dialogCg_.alpha = 1

				arg_406_1.dialog_:SetActive(true)
				SetActive(arg_406_1.leftNameGo_, true)

				local var_409_8 = arg_406_1:FormatText(StoryNameCfg[7].name)

				arg_406_1.leftNameTxt_.text = var_409_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_406_1.leftNameTxt_.transform)

				arg_406_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_406_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_406_1:RecordName(arg_406_1.leftNameTxt_.text)
				SetActive(arg_406_1.iconTrs_.gameObject, false)
				arg_406_1.callingController_:SetSelectedState("normal")

				local var_409_9 = arg_406_1:GetWordFromCfg(1104905097)
				local var_409_10 = arg_406_1:FormatText(var_409_9.content)

				arg_406_1.text_.text = var_409_10

				LuaForUtil.ClearLinePrefixSymbol(arg_406_1.text_)

				local var_409_11 = 2
				local var_409_12 = utf8.len(var_409_10)
				local var_409_13 = var_409_11 <= 0 and var_409_7 or var_409_7 * (var_409_12 / var_409_11)

				if var_409_13 > 0 and var_409_7 < var_409_13 then
					arg_406_1.talkMaxDuration = var_409_13

					if var_409_13 + var_409_6 > arg_406_1.duration_ then
						arg_406_1.duration_ = var_409_13 + var_409_6
					end
				end

				arg_406_1.text_.text = var_409_10
				arg_406_1.typewritter.percent = 0

				arg_406_1.typewritter:SetDirty()
				arg_406_1:ShowNextGo(false)
				arg_406_1:RecordContent(arg_406_1.text_.text)
			end

			local var_409_14 = math.max(var_409_7, arg_406_1.talkMaxDuration)

			if var_409_6 <= arg_406_1.time_ and arg_406_1.time_ < var_409_6 + var_409_14 then
				arg_406_1.typewritter.percent = (arg_406_1.time_ - var_409_6) / var_409_14

				arg_406_1.typewritter:SetDirty()
			end

			if arg_406_1.time_ >= var_409_6 + var_409_14 and arg_406_1.time_ < var_409_6 + var_409_14 + arg_409_0 then
				arg_406_1.typewritter.percent = 1

				arg_406_1.typewritter:SetDirty()
				arg_406_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905098 = function(arg_410_0, arg_410_1)
		arg_410_1.time_ = 0
		arg_410_1.frameCnt_ = 0
		arg_410_1.state_ = "playing"
		arg_410_1.curTalkId_ = 1104905098
		arg_410_1.duration_ = 7.6

		SetActive(arg_410_1.tipsGo_, false)

		function arg_410_1.onSingleLineFinish_()
			arg_410_1.onSingleLineUpdate_ = nil
			arg_410_1.onSingleLineFinish_ = nil
			arg_410_1.state_ = "waiting"
		end

		function arg_410_1.playNext_(arg_412_0)
			if arg_412_0 == 1 then
				arg_410_0:Play1104905099(arg_410_1)
			end
		end

		function arg_410_1.onSingleLineUpdate_(arg_413_0)
			local var_413_0 = arg_410_1.actors_["1049ui_story"]
			local var_413_1 = 0

			if var_413_1 < arg_410_1.time_ and arg_410_1.time_ <= var_413_1 + arg_413_0 and not isNil(var_413_0) and arg_410_1.var_.characterEffect1049ui_story == nil then
				arg_410_1.var_.characterEffect1049ui_story = var_413_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_413_2 = 0.200000002980232

			if var_413_1 <= arg_410_1.time_ and arg_410_1.time_ < var_413_1 + var_413_2 and not isNil(var_413_0) then
				local var_413_3 = (arg_410_1.time_ - var_413_1) / var_413_2

				if arg_410_1.var_.characterEffect1049ui_story and not isNil(var_413_0) then
					arg_410_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_410_1.time_ >= var_413_1 + var_413_2 and arg_410_1.time_ < var_413_1 + var_413_2 + arg_413_0 and not isNil(var_413_0) and arg_410_1.var_.characterEffect1049ui_story then
				arg_410_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_413_4 = 0

			if var_413_4 < arg_410_1.time_ and arg_410_1.time_ <= var_413_4 + arg_413_0 then
				arg_410_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_1")
			end

			local var_413_5 = 0

			if var_413_5 < arg_410_1.time_ and arg_410_1.time_ <= var_413_5 + arg_413_0 then
				arg_410_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_413_6 = 0
			local var_413_7 = 0.675

			if var_413_6 < arg_410_1.time_ and arg_410_1.time_ <= var_413_6 + arg_413_0 then
				arg_410_1.talkMaxDuration = 0
				arg_410_1.dialogCg_.alpha = 1

				arg_410_1.dialog_:SetActive(true)
				SetActive(arg_410_1.leftNameGo_, true)

				local var_413_8 = arg_410_1:FormatText(StoryNameCfg[551].name)

				arg_410_1.leftNameTxt_.text = var_413_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_410_1.leftNameTxt_.transform)

				arg_410_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_410_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_410_1:RecordName(arg_410_1.leftNameTxt_.text)
				SetActive(arg_410_1.iconTrs_.gameObject, false)
				arg_410_1.callingController_:SetSelectedState("normal")

				local var_413_9 = arg_410_1:GetWordFromCfg(1104905098)
				local var_413_10 = arg_410_1:FormatText(var_413_9.content)

				arg_410_1.text_.text = var_413_10

				LuaForUtil.ClearLinePrefixSymbol(arg_410_1.text_)

				local var_413_11 = 27
				local var_413_12 = utf8.len(var_413_10)
				local var_413_13 = var_413_11 <= 0 and var_413_7 or var_413_7 * (var_413_12 / var_413_11)

				if var_413_13 > 0 and var_413_7 < var_413_13 then
					arg_410_1.talkMaxDuration = var_413_13

					if var_413_13 + var_413_6 > arg_410_1.duration_ then
						arg_410_1.duration_ = var_413_13 + var_413_6
					end
				end

				arg_410_1.text_.text = var_413_10
				arg_410_1.typewritter.percent = 0

				arg_410_1.typewritter:SetDirty()
				arg_410_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905098", "story_v_side_new_1104905.awb") ~= 0 then
					local var_413_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905098", "story_v_side_new_1104905.awb") / 1000

					if var_413_14 + var_413_6 > arg_410_1.duration_ then
						arg_410_1.duration_ = var_413_14 + var_413_6
					end

					if var_413_9.prefab_name ~= "" and arg_410_1.actors_[var_413_9.prefab_name] ~= nil then
						local var_413_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_410_1.actors_[var_413_9.prefab_name].transform, "story_v_side_new_1104905", "1104905098", "story_v_side_new_1104905.awb")

						arg_410_1:RecordAudio("1104905098", var_413_15)
						arg_410_1:RecordAudio("1104905098", var_413_15)
					else
						arg_410_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905098", "story_v_side_new_1104905.awb")
					end

					arg_410_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905098", "story_v_side_new_1104905.awb")
				end

				arg_410_1:RecordContent(arg_410_1.text_.text)
			end

			local var_413_16 = math.max(var_413_7, arg_410_1.talkMaxDuration)

			if var_413_6 <= arg_410_1.time_ and arg_410_1.time_ < var_413_6 + var_413_16 then
				arg_410_1.typewritter.percent = (arg_410_1.time_ - var_413_6) / var_413_16

				arg_410_1.typewritter:SetDirty()
			end

			if arg_410_1.time_ >= var_413_6 + var_413_16 and arg_410_1.time_ < var_413_6 + var_413_16 + arg_413_0 then
				arg_410_1.typewritter.percent = 1

				arg_410_1.typewritter:SetDirty()
				arg_410_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905099 = function(arg_414_0, arg_414_1)
		arg_414_1.time_ = 0
		arg_414_1.frameCnt_ = 0
		arg_414_1.state_ = "playing"
		arg_414_1.curTalkId_ = 1104905099
		arg_414_1.duration_ = 14.3

		SetActive(arg_414_1.tipsGo_, false)

		function arg_414_1.onSingleLineFinish_()
			arg_414_1.onSingleLineUpdate_ = nil
			arg_414_1.onSingleLineFinish_ = nil
			arg_414_1.state_ = "waiting"
		end

		function arg_414_1.playNext_(arg_416_0)
			if arg_416_0 == 1 then
				arg_414_0:Play1104905100(arg_414_1)
			end
		end

		function arg_414_1.onSingleLineUpdate_(arg_417_0)
			local var_417_0 = 0

			if var_417_0 < arg_414_1.time_ and arg_414_1.time_ <= var_417_0 + arg_417_0 then
				arg_414_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_2")
			end

			local var_417_1 = 0

			if var_417_1 < arg_414_1.time_ and arg_414_1.time_ <= var_417_1 + arg_417_0 then
				arg_414_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_417_2 = 0
			local var_417_3 = 1.125

			if var_417_2 < arg_414_1.time_ and arg_414_1.time_ <= var_417_2 + arg_417_0 then
				arg_414_1.talkMaxDuration = 0
				arg_414_1.dialogCg_.alpha = 1

				arg_414_1.dialog_:SetActive(true)
				SetActive(arg_414_1.leftNameGo_, true)

				local var_417_4 = arg_414_1:FormatText(StoryNameCfg[551].name)

				arg_414_1.leftNameTxt_.text = var_417_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_414_1.leftNameTxt_.transform)

				arg_414_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_414_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_414_1:RecordName(arg_414_1.leftNameTxt_.text)
				SetActive(arg_414_1.iconTrs_.gameObject, false)
				arg_414_1.callingController_:SetSelectedState("normal")

				local var_417_5 = arg_414_1:GetWordFromCfg(1104905099)
				local var_417_6 = arg_414_1:FormatText(var_417_5.content)

				arg_414_1.text_.text = var_417_6

				LuaForUtil.ClearLinePrefixSymbol(arg_414_1.text_)

				local var_417_7 = 45
				local var_417_8 = utf8.len(var_417_6)
				local var_417_9 = var_417_7 <= 0 and var_417_3 or var_417_3 * (var_417_8 / var_417_7)

				if var_417_9 > 0 and var_417_3 < var_417_9 then
					arg_414_1.talkMaxDuration = var_417_9

					if var_417_9 + var_417_2 > arg_414_1.duration_ then
						arg_414_1.duration_ = var_417_9 + var_417_2
					end
				end

				arg_414_1.text_.text = var_417_6
				arg_414_1.typewritter.percent = 0

				arg_414_1.typewritter:SetDirty()
				arg_414_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905099", "story_v_side_new_1104905.awb") ~= 0 then
					local var_417_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905099", "story_v_side_new_1104905.awb") / 1000

					if var_417_10 + var_417_2 > arg_414_1.duration_ then
						arg_414_1.duration_ = var_417_10 + var_417_2
					end

					if var_417_5.prefab_name ~= "" and arg_414_1.actors_[var_417_5.prefab_name] ~= nil then
						local var_417_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_414_1.actors_[var_417_5.prefab_name].transform, "story_v_side_new_1104905", "1104905099", "story_v_side_new_1104905.awb")

						arg_414_1:RecordAudio("1104905099", var_417_11)
						arg_414_1:RecordAudio("1104905099", var_417_11)
					else
						arg_414_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905099", "story_v_side_new_1104905.awb")
					end

					arg_414_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905099", "story_v_side_new_1104905.awb")
				end

				arg_414_1:RecordContent(arg_414_1.text_.text)
			end

			local var_417_12 = math.max(var_417_3, arg_414_1.talkMaxDuration)

			if var_417_2 <= arg_414_1.time_ and arg_414_1.time_ < var_417_2 + var_417_12 then
				arg_414_1.typewritter.percent = (arg_414_1.time_ - var_417_2) / var_417_12

				arg_414_1.typewritter:SetDirty()
			end

			if arg_414_1.time_ >= var_417_2 + var_417_12 and arg_414_1.time_ < var_417_2 + var_417_12 + arg_417_0 then
				arg_414_1.typewritter.percent = 1

				arg_414_1.typewritter:SetDirty()
				arg_414_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905100 = function(arg_418_0, arg_418_1)
		arg_418_1.time_ = 0
		arg_418_1.frameCnt_ = 0
		arg_418_1.state_ = "playing"
		arg_418_1.curTalkId_ = 1104905100
		arg_418_1.duration_ = 5

		SetActive(arg_418_1.tipsGo_, false)

		function arg_418_1.onSingleLineFinish_()
			arg_418_1.onSingleLineUpdate_ = nil
			arg_418_1.onSingleLineFinish_ = nil
			arg_418_1.state_ = "waiting"
		end

		function arg_418_1.playNext_(arg_420_0)
			if arg_420_0 == 1 then
				arg_418_0:Play1104905101(arg_418_1)
			end
		end

		function arg_418_1.onSingleLineUpdate_(arg_421_0)
			local var_421_0 = arg_418_1.actors_["1049ui_story"].transform
			local var_421_1 = 0

			if var_421_1 < arg_418_1.time_ and arg_418_1.time_ <= var_421_1 + arg_421_0 then
				arg_418_1.var_.moveOldPos1049ui_story = var_421_0.localPosition
			end

			local var_421_2 = 0.001

			if var_421_1 <= arg_418_1.time_ and arg_418_1.time_ < var_421_1 + var_421_2 then
				local var_421_3 = (arg_418_1.time_ - var_421_1) / var_421_2
				local var_421_4 = Vector3.New(0, 100, 0)

				var_421_0.localPosition = Vector3.Lerp(arg_418_1.var_.moveOldPos1049ui_story, var_421_4, var_421_3)

				local var_421_5 = manager.ui.mainCamera.transform.position - var_421_0.position

				var_421_0.forward = Vector3.New(var_421_5.x, var_421_5.y, var_421_5.z)

				local var_421_6 = var_421_0.localEulerAngles

				var_421_6.z = 0
				var_421_6.x = 0
				var_421_0.localEulerAngles = var_421_6
			end

			if arg_418_1.time_ >= var_421_1 + var_421_2 and arg_418_1.time_ < var_421_1 + var_421_2 + arg_421_0 then
				var_421_0.localPosition = Vector3.New(0, 100, 0)

				local var_421_7 = manager.ui.mainCamera.transform.position - var_421_0.position

				var_421_0.forward = Vector3.New(var_421_7.x, var_421_7.y, var_421_7.z)

				local var_421_8 = var_421_0.localEulerAngles

				var_421_8.z = 0
				var_421_8.x = 0
				var_421_0.localEulerAngles = var_421_8
			end

			local var_421_9 = arg_418_1.actors_["1049ui_story"]
			local var_421_10 = 0

			if var_421_10 < arg_418_1.time_ and arg_418_1.time_ <= var_421_10 + arg_421_0 and not isNil(var_421_9) and arg_418_1.var_.characterEffect1049ui_story == nil then
				arg_418_1.var_.characterEffect1049ui_story = var_421_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_421_11 = 0.200000002980232

			if var_421_10 <= arg_418_1.time_ and arg_418_1.time_ < var_421_10 + var_421_11 and not isNil(var_421_9) then
				local var_421_12 = (arg_418_1.time_ - var_421_10) / var_421_11

				if arg_418_1.var_.characterEffect1049ui_story and not isNil(var_421_9) then
					local var_421_13 = Mathf.Lerp(0, 0.5, var_421_12)

					arg_418_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_418_1.var_.characterEffect1049ui_story.fillRatio = var_421_13
				end
			end

			if arg_418_1.time_ >= var_421_10 + var_421_11 and arg_418_1.time_ < var_421_10 + var_421_11 + arg_421_0 and not isNil(var_421_9) and arg_418_1.var_.characterEffect1049ui_story then
				local var_421_14 = 0.5

				arg_418_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_418_1.var_.characterEffect1049ui_story.fillRatio = var_421_14
			end

			local var_421_15 = 0
			local var_421_16 = 0.925

			if var_421_15 < arg_418_1.time_ and arg_418_1.time_ <= var_421_15 + arg_421_0 then
				arg_418_1.talkMaxDuration = 0
				arg_418_1.dialogCg_.alpha = 1

				arg_418_1.dialog_:SetActive(true)
				SetActive(arg_418_1.leftNameGo_, false)

				arg_418_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_418_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_418_1:RecordName(arg_418_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_418_1.iconTrs_.gameObject, false)
				arg_418_1.callingController_:SetSelectedState("normal")

				local var_421_17 = arg_418_1:GetWordFromCfg(1104905100)
				local var_421_18 = arg_418_1:FormatText(var_421_17.content)

				arg_418_1.text_.text = var_421_18

				LuaForUtil.ClearLinePrefixSymbol(arg_418_1.text_)

				local var_421_19 = 37
				local var_421_20 = utf8.len(var_421_18)
				local var_421_21 = var_421_19 <= 0 and var_421_16 or var_421_16 * (var_421_20 / var_421_19)

				if var_421_21 > 0 and var_421_16 < var_421_21 then
					arg_418_1.talkMaxDuration = var_421_21

					if var_421_21 + var_421_15 > arg_418_1.duration_ then
						arg_418_1.duration_ = var_421_21 + var_421_15
					end
				end

				arg_418_1.text_.text = var_421_18
				arg_418_1.typewritter.percent = 0

				arg_418_1.typewritter:SetDirty()
				arg_418_1:ShowNextGo(false)
				arg_418_1:RecordContent(arg_418_1.text_.text)
			end

			local var_421_22 = math.max(var_421_16, arg_418_1.talkMaxDuration)

			if var_421_15 <= arg_418_1.time_ and arg_418_1.time_ < var_421_15 + var_421_22 then
				arg_418_1.typewritter.percent = (arg_418_1.time_ - var_421_15) / var_421_22

				arg_418_1.typewritter:SetDirty()
			end

			if arg_418_1.time_ >= var_421_15 + var_421_22 and arg_418_1.time_ < var_421_15 + var_421_22 + arg_421_0 then
				arg_418_1.typewritter.percent = 1

				arg_418_1.typewritter:SetDirty()
				arg_418_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905101 = function(arg_422_0, arg_422_1)
		arg_422_1.time_ = 0
		arg_422_1.frameCnt_ = 0
		arg_422_1.state_ = "playing"
		arg_422_1.curTalkId_ = 1104905101
		arg_422_1.duration_ = 7.27

		SetActive(arg_422_1.tipsGo_, false)

		function arg_422_1.onSingleLineFinish_()
			arg_422_1.onSingleLineUpdate_ = nil
			arg_422_1.onSingleLineFinish_ = nil
			arg_422_1.state_ = "waiting"
		end

		function arg_422_1.playNext_(arg_424_0)
			if arg_424_0 == 1 then
				arg_422_0:Play1104905102(arg_422_1)
			end
		end

		function arg_422_1.onSingleLineUpdate_(arg_425_0)
			local var_425_0 = arg_422_1.actors_["1049ui_story"].transform
			local var_425_1 = 0

			if var_425_1 < arg_422_1.time_ and arg_422_1.time_ <= var_425_1 + arg_425_0 then
				arg_422_1.var_.moveOldPos1049ui_story = var_425_0.localPosition
			end

			local var_425_2 = 0.001

			if var_425_1 <= arg_422_1.time_ and arg_422_1.time_ < var_425_1 + var_425_2 then
				local var_425_3 = (arg_422_1.time_ - var_425_1) / var_425_2
				local var_425_4 = Vector3.New(0, -1.2, -6)

				var_425_0.localPosition = Vector3.Lerp(arg_422_1.var_.moveOldPos1049ui_story, var_425_4, var_425_3)

				local var_425_5 = manager.ui.mainCamera.transform.position - var_425_0.position

				var_425_0.forward = Vector3.New(var_425_5.x, var_425_5.y, var_425_5.z)

				local var_425_6 = var_425_0.localEulerAngles

				var_425_6.z = 0
				var_425_6.x = 0
				var_425_0.localEulerAngles = var_425_6
			end

			if arg_422_1.time_ >= var_425_1 + var_425_2 and arg_422_1.time_ < var_425_1 + var_425_2 + arg_425_0 then
				var_425_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_425_7 = manager.ui.mainCamera.transform.position - var_425_0.position

				var_425_0.forward = Vector3.New(var_425_7.x, var_425_7.y, var_425_7.z)

				local var_425_8 = var_425_0.localEulerAngles

				var_425_8.z = 0
				var_425_8.x = 0
				var_425_0.localEulerAngles = var_425_8
			end

			local var_425_9 = arg_422_1.actors_["1049ui_story"]
			local var_425_10 = 0

			if var_425_10 < arg_422_1.time_ and arg_422_1.time_ <= var_425_10 + arg_425_0 and not isNil(var_425_9) and arg_422_1.var_.characterEffect1049ui_story == nil then
				arg_422_1.var_.characterEffect1049ui_story = var_425_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_425_11 = 0.200000002980232

			if var_425_10 <= arg_422_1.time_ and arg_422_1.time_ < var_425_10 + var_425_11 and not isNil(var_425_9) then
				local var_425_12 = (arg_422_1.time_ - var_425_10) / var_425_11

				if arg_422_1.var_.characterEffect1049ui_story and not isNil(var_425_9) then
					arg_422_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_422_1.time_ >= var_425_10 + var_425_11 and arg_422_1.time_ < var_425_10 + var_425_11 + arg_425_0 and not isNil(var_425_9) and arg_422_1.var_.characterEffect1049ui_story then
				arg_422_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_425_13 = 0

			if var_425_13 < arg_422_1.time_ and arg_422_1.time_ <= var_425_13 + arg_425_0 then
				arg_422_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_425_14 = 0

			if var_425_14 < arg_422_1.time_ and arg_422_1.time_ <= var_425_14 + arg_425_0 then
				arg_422_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_425_15 = 0
			local var_425_16 = 0.65

			if var_425_15 < arg_422_1.time_ and arg_422_1.time_ <= var_425_15 + arg_425_0 then
				arg_422_1.talkMaxDuration = 0
				arg_422_1.dialogCg_.alpha = 1

				arg_422_1.dialog_:SetActive(true)
				SetActive(arg_422_1.leftNameGo_, true)

				local var_425_17 = arg_422_1:FormatText(StoryNameCfg[551].name)

				arg_422_1.leftNameTxt_.text = var_425_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_422_1.leftNameTxt_.transform)

				arg_422_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_422_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_422_1:RecordName(arg_422_1.leftNameTxt_.text)
				SetActive(arg_422_1.iconTrs_.gameObject, false)
				arg_422_1.callingController_:SetSelectedState("normal")

				local var_425_18 = arg_422_1:GetWordFromCfg(1104905101)
				local var_425_19 = arg_422_1:FormatText(var_425_18.content)

				arg_422_1.text_.text = var_425_19

				LuaForUtil.ClearLinePrefixSymbol(arg_422_1.text_)

				local var_425_20 = 26
				local var_425_21 = utf8.len(var_425_19)
				local var_425_22 = var_425_20 <= 0 and var_425_16 or var_425_16 * (var_425_21 / var_425_20)

				if var_425_22 > 0 and var_425_16 < var_425_22 then
					arg_422_1.talkMaxDuration = var_425_22

					if var_425_22 + var_425_15 > arg_422_1.duration_ then
						arg_422_1.duration_ = var_425_22 + var_425_15
					end
				end

				arg_422_1.text_.text = var_425_19
				arg_422_1.typewritter.percent = 0

				arg_422_1.typewritter:SetDirty()
				arg_422_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905101", "story_v_side_new_1104905.awb") ~= 0 then
					local var_425_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905101", "story_v_side_new_1104905.awb") / 1000

					if var_425_23 + var_425_15 > arg_422_1.duration_ then
						arg_422_1.duration_ = var_425_23 + var_425_15
					end

					if var_425_18.prefab_name ~= "" and arg_422_1.actors_[var_425_18.prefab_name] ~= nil then
						local var_425_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_422_1.actors_[var_425_18.prefab_name].transform, "story_v_side_new_1104905", "1104905101", "story_v_side_new_1104905.awb")

						arg_422_1:RecordAudio("1104905101", var_425_24)
						arg_422_1:RecordAudio("1104905101", var_425_24)
					else
						arg_422_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905101", "story_v_side_new_1104905.awb")
					end

					arg_422_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905101", "story_v_side_new_1104905.awb")
				end

				arg_422_1:RecordContent(arg_422_1.text_.text)
			end

			local var_425_25 = math.max(var_425_16, arg_422_1.talkMaxDuration)

			if var_425_15 <= arg_422_1.time_ and arg_422_1.time_ < var_425_15 + var_425_25 then
				arg_422_1.typewritter.percent = (arg_422_1.time_ - var_425_15) / var_425_25

				arg_422_1.typewritter:SetDirty()
			end

			if arg_422_1.time_ >= var_425_15 + var_425_25 and arg_422_1.time_ < var_425_15 + var_425_25 + arg_425_0 then
				arg_422_1.typewritter.percent = 1

				arg_422_1.typewritter:SetDirty()
				arg_422_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905102 = function(arg_426_0, arg_426_1)
		arg_426_1.time_ = 0
		arg_426_1.frameCnt_ = 0
		arg_426_1.state_ = "playing"
		arg_426_1.curTalkId_ = 1104905102
		arg_426_1.duration_ = 1

		SetActive(arg_426_1.tipsGo_, false)

		function arg_426_1.onSingleLineFinish_()
			arg_426_1.onSingleLineUpdate_ = nil
			arg_426_1.onSingleLineFinish_ = nil
			arg_426_1.state_ = "waiting"

			SetActive(arg_426_1.choicesGo_, true)

			for iter_427_0, iter_427_1 in ipairs(arg_426_1.choices_) do
				local var_427_0 = iter_427_0 <= 1

				SetActive(iter_427_1.go, var_427_0)
			end

			arg_426_1.choices_[1].txt.text = arg_426_1:FormatText(StoryChoiceCfg[1182].name)
		end

		function arg_426_1.playNext_(arg_428_0)
			if arg_428_0 == 1 then
				arg_426_0:Play1104905103(arg_426_1)
			end

			arg_426_1:RecordChoiceLog(1104905102, 1104905103)
		end

		function arg_426_1.onSingleLineUpdate_(arg_429_0)
			local var_429_0 = arg_426_1.actors_["1049ui_story"]
			local var_429_1 = 0

			if var_429_1 < arg_426_1.time_ and arg_426_1.time_ <= var_429_1 + arg_429_0 and not isNil(var_429_0) and arg_426_1.var_.characterEffect1049ui_story == nil then
				arg_426_1.var_.characterEffect1049ui_story = var_429_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_429_2 = 0.200000002980232

			if var_429_1 <= arg_426_1.time_ and arg_426_1.time_ < var_429_1 + var_429_2 and not isNil(var_429_0) then
				local var_429_3 = (arg_426_1.time_ - var_429_1) / var_429_2

				if arg_426_1.var_.characterEffect1049ui_story and not isNil(var_429_0) then
					local var_429_4 = Mathf.Lerp(0, 0.5, var_429_3)

					arg_426_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_426_1.var_.characterEffect1049ui_story.fillRatio = var_429_4
				end
			end

			if arg_426_1.time_ >= var_429_1 + var_429_2 and arg_426_1.time_ < var_429_1 + var_429_2 + arg_429_0 and not isNil(var_429_0) and arg_426_1.var_.characterEffect1049ui_story then
				local var_429_5 = 0.5

				arg_426_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_426_1.var_.characterEffect1049ui_story.fillRatio = var_429_5
			end

			local var_429_6 = 0

			if var_429_6 < arg_426_1.time_ and arg_426_1.time_ <= var_429_6 + arg_429_0 then
				arg_426_1.allBtn_.enabled = false
			end

			local var_429_7 = 0.5

			if arg_426_1.time_ >= var_429_6 + var_429_7 and arg_426_1.time_ < var_429_6 + var_429_7 + arg_429_0 then
				arg_426_1.allBtn_.enabled = true
			end
		end
	end,
	Play1104905103 = function(arg_430_0, arg_430_1)
		arg_430_1.time_ = 0
		arg_430_1.frameCnt_ = 0
		arg_430_1.state_ = "playing"
		arg_430_1.curTalkId_ = 1104905103
		arg_430_1.duration_ = 5

		SetActive(arg_430_1.tipsGo_, false)

		function arg_430_1.onSingleLineFinish_()
			arg_430_1.onSingleLineUpdate_ = nil
			arg_430_1.onSingleLineFinish_ = nil
			arg_430_1.state_ = "waiting"
		end

		function arg_430_1.playNext_(arg_432_0)
			if arg_432_0 == 1 then
				arg_430_0:Play1104905104(arg_430_1)
			end
		end

		function arg_430_1.onSingleLineUpdate_(arg_433_0)
			local var_433_0 = 0
			local var_433_1 = 0.425

			if var_433_0 < arg_430_1.time_ and arg_430_1.time_ <= var_433_0 + arg_433_0 then
				arg_430_1.talkMaxDuration = 0
				arg_430_1.dialogCg_.alpha = 1

				arg_430_1.dialog_:SetActive(true)
				SetActive(arg_430_1.leftNameGo_, true)

				local var_433_2 = arg_430_1:FormatText(StoryNameCfg[7].name)

				arg_430_1.leftNameTxt_.text = var_433_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_430_1.leftNameTxt_.transform)

				arg_430_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_430_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_430_1:RecordName(arg_430_1.leftNameTxt_.text)
				SetActive(arg_430_1.iconTrs_.gameObject, false)
				arg_430_1.callingController_:SetSelectedState("normal")

				local var_433_3 = arg_430_1:GetWordFromCfg(1104905103)
				local var_433_4 = arg_430_1:FormatText(var_433_3.content)

				arg_430_1.text_.text = var_433_4

				LuaForUtil.ClearLinePrefixSymbol(arg_430_1.text_)

				local var_433_5 = 17
				local var_433_6 = utf8.len(var_433_4)
				local var_433_7 = var_433_5 <= 0 and var_433_1 or var_433_1 * (var_433_6 / var_433_5)

				if var_433_7 > 0 and var_433_1 < var_433_7 then
					arg_430_1.talkMaxDuration = var_433_7

					if var_433_7 + var_433_0 > arg_430_1.duration_ then
						arg_430_1.duration_ = var_433_7 + var_433_0
					end
				end

				arg_430_1.text_.text = var_433_4
				arg_430_1.typewritter.percent = 0

				arg_430_1.typewritter:SetDirty()
				arg_430_1:ShowNextGo(false)
				arg_430_1:RecordContent(arg_430_1.text_.text)
			end

			local var_433_8 = math.max(var_433_1, arg_430_1.talkMaxDuration)

			if var_433_0 <= arg_430_1.time_ and arg_430_1.time_ < var_433_0 + var_433_8 then
				arg_430_1.typewritter.percent = (arg_430_1.time_ - var_433_0) / var_433_8

				arg_430_1.typewritter:SetDirty()
			end

			if arg_430_1.time_ >= var_433_0 + var_433_8 and arg_430_1.time_ < var_433_0 + var_433_8 + arg_433_0 then
				arg_430_1.typewritter.percent = 1

				arg_430_1.typewritter:SetDirty()
				arg_430_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905104 = function(arg_434_0, arg_434_1)
		arg_434_1.time_ = 0
		arg_434_1.frameCnt_ = 0
		arg_434_1.state_ = "playing"
		arg_434_1.curTalkId_ = 1104905104
		arg_434_1.duration_ = 5.6

		SetActive(arg_434_1.tipsGo_, false)

		function arg_434_1.onSingleLineFinish_()
			arg_434_1.onSingleLineUpdate_ = nil
			arg_434_1.onSingleLineFinish_ = nil
			arg_434_1.state_ = "waiting"
		end

		function arg_434_1.playNext_(arg_436_0)
			if arg_436_0 == 1 then
				arg_434_0:Play1104905105(arg_434_1)
			end
		end

		function arg_434_1.onSingleLineUpdate_(arg_437_0)
			local var_437_0 = arg_434_1.actors_["1049ui_story"]
			local var_437_1 = 0

			if var_437_1 < arg_434_1.time_ and arg_434_1.time_ <= var_437_1 + arg_437_0 and not isNil(var_437_0) and arg_434_1.var_.characterEffect1049ui_story == nil then
				arg_434_1.var_.characterEffect1049ui_story = var_437_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_437_2 = 0.200000002980232

			if var_437_1 <= arg_434_1.time_ and arg_434_1.time_ < var_437_1 + var_437_2 and not isNil(var_437_0) then
				local var_437_3 = (arg_434_1.time_ - var_437_1) / var_437_2

				if arg_434_1.var_.characterEffect1049ui_story and not isNil(var_437_0) then
					arg_434_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_434_1.time_ >= var_437_1 + var_437_2 and arg_434_1.time_ < var_437_1 + var_437_2 + arg_437_0 and not isNil(var_437_0) and arg_434_1.var_.characterEffect1049ui_story then
				arg_434_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_437_4 = 0

			if var_437_4 < arg_434_1.time_ and arg_434_1.time_ <= var_437_4 + arg_437_0 then
				arg_434_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_437_5 = 0

			if var_437_5 < arg_434_1.time_ and arg_434_1.time_ <= var_437_5 + arg_437_0 then
				arg_434_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_437_6 = 0
			local var_437_7 = 0.475

			if var_437_6 < arg_434_1.time_ and arg_434_1.time_ <= var_437_6 + arg_437_0 then
				arg_434_1.talkMaxDuration = 0
				arg_434_1.dialogCg_.alpha = 1

				arg_434_1.dialog_:SetActive(true)
				SetActive(arg_434_1.leftNameGo_, true)

				local var_437_8 = arg_434_1:FormatText(StoryNameCfg[551].name)

				arg_434_1.leftNameTxt_.text = var_437_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_434_1.leftNameTxt_.transform)

				arg_434_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_434_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_434_1:RecordName(arg_434_1.leftNameTxt_.text)
				SetActive(arg_434_1.iconTrs_.gameObject, false)
				arg_434_1.callingController_:SetSelectedState("normal")

				local var_437_9 = arg_434_1:GetWordFromCfg(1104905104)
				local var_437_10 = arg_434_1:FormatText(var_437_9.content)

				arg_434_1.text_.text = var_437_10

				LuaForUtil.ClearLinePrefixSymbol(arg_434_1.text_)

				local var_437_11 = 19
				local var_437_12 = utf8.len(var_437_10)
				local var_437_13 = var_437_11 <= 0 and var_437_7 or var_437_7 * (var_437_12 / var_437_11)

				if var_437_13 > 0 and var_437_7 < var_437_13 then
					arg_434_1.talkMaxDuration = var_437_13

					if var_437_13 + var_437_6 > arg_434_1.duration_ then
						arg_434_1.duration_ = var_437_13 + var_437_6
					end
				end

				arg_434_1.text_.text = var_437_10
				arg_434_1.typewritter.percent = 0

				arg_434_1.typewritter:SetDirty()
				arg_434_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905104", "story_v_side_new_1104905.awb") ~= 0 then
					local var_437_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905104", "story_v_side_new_1104905.awb") / 1000

					if var_437_14 + var_437_6 > arg_434_1.duration_ then
						arg_434_1.duration_ = var_437_14 + var_437_6
					end

					if var_437_9.prefab_name ~= "" and arg_434_1.actors_[var_437_9.prefab_name] ~= nil then
						local var_437_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_434_1.actors_[var_437_9.prefab_name].transform, "story_v_side_new_1104905", "1104905104", "story_v_side_new_1104905.awb")

						arg_434_1:RecordAudio("1104905104", var_437_15)
						arg_434_1:RecordAudio("1104905104", var_437_15)
					else
						arg_434_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905104", "story_v_side_new_1104905.awb")
					end

					arg_434_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905104", "story_v_side_new_1104905.awb")
				end

				arg_434_1:RecordContent(arg_434_1.text_.text)
			end

			local var_437_16 = math.max(var_437_7, arg_434_1.talkMaxDuration)

			if var_437_6 <= arg_434_1.time_ and arg_434_1.time_ < var_437_6 + var_437_16 then
				arg_434_1.typewritter.percent = (arg_434_1.time_ - var_437_6) / var_437_16

				arg_434_1.typewritter:SetDirty()
			end

			if arg_434_1.time_ >= var_437_6 + var_437_16 and arg_434_1.time_ < var_437_6 + var_437_16 + arg_437_0 then
				arg_434_1.typewritter.percent = 1

				arg_434_1.typewritter:SetDirty()
				arg_434_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905105 = function(arg_438_0, arg_438_1)
		arg_438_1.time_ = 0
		arg_438_1.frameCnt_ = 0
		arg_438_1.state_ = "playing"
		arg_438_1.curTalkId_ = 1104905105
		arg_438_1.duration_ = 5

		SetActive(arg_438_1.tipsGo_, false)

		function arg_438_1.onSingleLineFinish_()
			arg_438_1.onSingleLineUpdate_ = nil
			arg_438_1.onSingleLineFinish_ = nil
			arg_438_1.state_ = "waiting"
		end

		function arg_438_1.playNext_(arg_440_0)
			if arg_440_0 == 1 then
				arg_438_0:Play1104905106(arg_438_1)
			end
		end

		function arg_438_1.onSingleLineUpdate_(arg_441_0)
			local var_441_0 = arg_438_1.actors_["1049ui_story"]
			local var_441_1 = 0

			if var_441_1 < arg_438_1.time_ and arg_438_1.time_ <= var_441_1 + arg_441_0 and not isNil(var_441_0) and arg_438_1.var_.characterEffect1049ui_story == nil then
				arg_438_1.var_.characterEffect1049ui_story = var_441_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_441_2 = 0.200000002980232

			if var_441_1 <= arg_438_1.time_ and arg_438_1.time_ < var_441_1 + var_441_2 and not isNil(var_441_0) then
				local var_441_3 = (arg_438_1.time_ - var_441_1) / var_441_2

				if arg_438_1.var_.characterEffect1049ui_story and not isNil(var_441_0) then
					local var_441_4 = Mathf.Lerp(0, 0.5, var_441_3)

					arg_438_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_438_1.var_.characterEffect1049ui_story.fillRatio = var_441_4
				end
			end

			if arg_438_1.time_ >= var_441_1 + var_441_2 and arg_438_1.time_ < var_441_1 + var_441_2 + arg_441_0 and not isNil(var_441_0) and arg_438_1.var_.characterEffect1049ui_story then
				local var_441_5 = 0.5

				arg_438_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_438_1.var_.characterEffect1049ui_story.fillRatio = var_441_5
			end

			local var_441_6 = 0
			local var_441_7 = 0.125

			if var_441_6 < arg_438_1.time_ and arg_438_1.time_ <= var_441_6 + arg_441_0 then
				arg_438_1.talkMaxDuration = 0
				arg_438_1.dialogCg_.alpha = 1

				arg_438_1.dialog_:SetActive(true)
				SetActive(arg_438_1.leftNameGo_, true)

				local var_441_8 = arg_438_1:FormatText(StoryNameCfg[7].name)

				arg_438_1.leftNameTxt_.text = var_441_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_438_1.leftNameTxt_.transform)

				arg_438_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_438_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_438_1:RecordName(arg_438_1.leftNameTxt_.text)
				SetActive(arg_438_1.iconTrs_.gameObject, false)
				arg_438_1.callingController_:SetSelectedState("normal")

				local var_441_9 = arg_438_1:GetWordFromCfg(1104905105)
				local var_441_10 = arg_438_1:FormatText(var_441_9.content)

				arg_438_1.text_.text = var_441_10

				LuaForUtil.ClearLinePrefixSymbol(arg_438_1.text_)

				local var_441_11 = 5
				local var_441_12 = utf8.len(var_441_10)
				local var_441_13 = var_441_11 <= 0 and var_441_7 or var_441_7 * (var_441_12 / var_441_11)

				if var_441_13 > 0 and var_441_7 < var_441_13 then
					arg_438_1.talkMaxDuration = var_441_13

					if var_441_13 + var_441_6 > arg_438_1.duration_ then
						arg_438_1.duration_ = var_441_13 + var_441_6
					end
				end

				arg_438_1.text_.text = var_441_10
				arg_438_1.typewritter.percent = 0

				arg_438_1.typewritter:SetDirty()
				arg_438_1:ShowNextGo(false)
				arg_438_1:RecordContent(arg_438_1.text_.text)
			end

			local var_441_14 = math.max(var_441_7, arg_438_1.talkMaxDuration)

			if var_441_6 <= arg_438_1.time_ and arg_438_1.time_ < var_441_6 + var_441_14 then
				arg_438_1.typewritter.percent = (arg_438_1.time_ - var_441_6) / var_441_14

				arg_438_1.typewritter:SetDirty()
			end

			if arg_438_1.time_ >= var_441_6 + var_441_14 and arg_438_1.time_ < var_441_6 + var_441_14 + arg_441_0 then
				arg_438_1.typewritter.percent = 1

				arg_438_1.typewritter:SetDirty()
				arg_438_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905106 = function(arg_442_0, arg_442_1)
		arg_442_1.time_ = 0
		arg_442_1.frameCnt_ = 0
		arg_442_1.state_ = "playing"
		arg_442_1.curTalkId_ = 1104905106
		arg_442_1.duration_ = 5

		SetActive(arg_442_1.tipsGo_, false)

		function arg_442_1.onSingleLineFinish_()
			arg_442_1.onSingleLineUpdate_ = nil
			arg_442_1.onSingleLineFinish_ = nil
			arg_442_1.state_ = "waiting"
		end

		function arg_442_1.playNext_(arg_444_0)
			if arg_444_0 == 1 then
				arg_442_0:Play1104905107(arg_442_1)
			end
		end

		function arg_442_1.onSingleLineUpdate_(arg_445_0)
			local var_445_0 = arg_442_1.actors_["1049ui_story"].transform
			local var_445_1 = 0

			if var_445_1 < arg_442_1.time_ and arg_442_1.time_ <= var_445_1 + arg_445_0 then
				arg_442_1.var_.moveOldPos1049ui_story = var_445_0.localPosition
			end

			local var_445_2 = 0.001

			if var_445_1 <= arg_442_1.time_ and arg_442_1.time_ < var_445_1 + var_445_2 then
				local var_445_3 = (arg_442_1.time_ - var_445_1) / var_445_2
				local var_445_4 = Vector3.New(0, 100, 0)

				var_445_0.localPosition = Vector3.Lerp(arg_442_1.var_.moveOldPos1049ui_story, var_445_4, var_445_3)

				local var_445_5 = manager.ui.mainCamera.transform.position - var_445_0.position

				var_445_0.forward = Vector3.New(var_445_5.x, var_445_5.y, var_445_5.z)

				local var_445_6 = var_445_0.localEulerAngles

				var_445_6.z = 0
				var_445_6.x = 0
				var_445_0.localEulerAngles = var_445_6
			end

			if arg_442_1.time_ >= var_445_1 + var_445_2 and arg_442_1.time_ < var_445_1 + var_445_2 + arg_445_0 then
				var_445_0.localPosition = Vector3.New(0, 100, 0)

				local var_445_7 = manager.ui.mainCamera.transform.position - var_445_0.position

				var_445_0.forward = Vector3.New(var_445_7.x, var_445_7.y, var_445_7.z)

				local var_445_8 = var_445_0.localEulerAngles

				var_445_8.z = 0
				var_445_8.x = 0
				var_445_0.localEulerAngles = var_445_8
			end

			local var_445_9 = 0
			local var_445_10 = 0.9

			if var_445_9 < arg_442_1.time_ and arg_442_1.time_ <= var_445_9 + arg_445_0 then
				arg_442_1.talkMaxDuration = 0
				arg_442_1.dialogCg_.alpha = 1

				arg_442_1.dialog_:SetActive(true)
				SetActive(arg_442_1.leftNameGo_, false)

				arg_442_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_442_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_442_1:RecordName(arg_442_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_442_1.iconTrs_.gameObject, false)
				arg_442_1.callingController_:SetSelectedState("normal")

				local var_445_11 = arg_442_1:GetWordFromCfg(1104905106)
				local var_445_12 = arg_442_1:FormatText(var_445_11.content)

				arg_442_1.text_.text = var_445_12

				LuaForUtil.ClearLinePrefixSymbol(arg_442_1.text_)

				local var_445_13 = 36
				local var_445_14 = utf8.len(var_445_12)
				local var_445_15 = var_445_13 <= 0 and var_445_10 or var_445_10 * (var_445_14 / var_445_13)

				if var_445_15 > 0 and var_445_10 < var_445_15 then
					arg_442_1.talkMaxDuration = var_445_15

					if var_445_15 + var_445_9 > arg_442_1.duration_ then
						arg_442_1.duration_ = var_445_15 + var_445_9
					end
				end

				arg_442_1.text_.text = var_445_12
				arg_442_1.typewritter.percent = 0

				arg_442_1.typewritter:SetDirty()
				arg_442_1:ShowNextGo(false)
				arg_442_1:RecordContent(arg_442_1.text_.text)
			end

			local var_445_16 = math.max(var_445_10, arg_442_1.talkMaxDuration)

			if var_445_9 <= arg_442_1.time_ and arg_442_1.time_ < var_445_9 + var_445_16 then
				arg_442_1.typewritter.percent = (arg_442_1.time_ - var_445_9) / var_445_16

				arg_442_1.typewritter:SetDirty()
			end

			if arg_442_1.time_ >= var_445_9 + var_445_16 and arg_442_1.time_ < var_445_9 + var_445_16 + arg_445_0 then
				arg_442_1.typewritter.percent = 1

				arg_442_1.typewritter:SetDirty()
				arg_442_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905107 = function(arg_446_0, arg_446_1)
		arg_446_1.time_ = 0
		arg_446_1.frameCnt_ = 0
		arg_446_1.state_ = "playing"
		arg_446_1.curTalkId_ = 1104905107
		arg_446_1.duration_ = 2.57

		SetActive(arg_446_1.tipsGo_, false)

		function arg_446_1.onSingleLineFinish_()
			arg_446_1.onSingleLineUpdate_ = nil
			arg_446_1.onSingleLineFinish_ = nil
			arg_446_1.state_ = "waiting"
		end

		function arg_446_1.playNext_(arg_448_0)
			if arg_448_0 == 1 then
				arg_446_0:Play1104905108(arg_446_1)
			end
		end

		function arg_446_1.onSingleLineUpdate_(arg_449_0)
			local var_449_0 = arg_446_1.actors_["1049ui_story"].transform
			local var_449_1 = 0

			if var_449_1 < arg_446_1.time_ and arg_446_1.time_ <= var_449_1 + arg_449_0 then
				arg_446_1.var_.moveOldPos1049ui_story = var_449_0.localPosition
			end

			local var_449_2 = 0.001

			if var_449_1 <= arg_446_1.time_ and arg_446_1.time_ < var_449_1 + var_449_2 then
				local var_449_3 = (arg_446_1.time_ - var_449_1) / var_449_2
				local var_449_4 = Vector3.New(0, -1.2, -6)

				var_449_0.localPosition = Vector3.Lerp(arg_446_1.var_.moveOldPos1049ui_story, var_449_4, var_449_3)

				local var_449_5 = manager.ui.mainCamera.transform.position - var_449_0.position

				var_449_0.forward = Vector3.New(var_449_5.x, var_449_5.y, var_449_5.z)

				local var_449_6 = var_449_0.localEulerAngles

				var_449_6.z = 0
				var_449_6.x = 0
				var_449_0.localEulerAngles = var_449_6
			end

			if arg_446_1.time_ >= var_449_1 + var_449_2 and arg_446_1.time_ < var_449_1 + var_449_2 + arg_449_0 then
				var_449_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_449_7 = manager.ui.mainCamera.transform.position - var_449_0.position

				var_449_0.forward = Vector3.New(var_449_7.x, var_449_7.y, var_449_7.z)

				local var_449_8 = var_449_0.localEulerAngles

				var_449_8.z = 0
				var_449_8.x = 0
				var_449_0.localEulerAngles = var_449_8
			end

			local var_449_9 = arg_446_1.actors_["1049ui_story"]
			local var_449_10 = 0

			if var_449_10 < arg_446_1.time_ and arg_446_1.time_ <= var_449_10 + arg_449_0 and not isNil(var_449_9) and arg_446_1.var_.characterEffect1049ui_story == nil then
				arg_446_1.var_.characterEffect1049ui_story = var_449_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_449_11 = 0.200000002980232

			if var_449_10 <= arg_446_1.time_ and arg_446_1.time_ < var_449_10 + var_449_11 and not isNil(var_449_9) then
				local var_449_12 = (arg_446_1.time_ - var_449_10) / var_449_11

				if arg_446_1.var_.characterEffect1049ui_story and not isNil(var_449_9) then
					arg_446_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_446_1.time_ >= var_449_10 + var_449_11 and arg_446_1.time_ < var_449_10 + var_449_11 + arg_449_0 and not isNil(var_449_9) and arg_446_1.var_.characterEffect1049ui_story then
				arg_446_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_449_13 = 0

			if var_449_13 < arg_446_1.time_ and arg_446_1.time_ <= var_449_13 + arg_449_0 then
				arg_446_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_449_14 = 0

			if var_449_14 < arg_446_1.time_ and arg_446_1.time_ <= var_449_14 + arg_449_0 then
				arg_446_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_449_15 = 0
			local var_449_16 = 0.225

			if var_449_15 < arg_446_1.time_ and arg_446_1.time_ <= var_449_15 + arg_449_0 then
				arg_446_1.talkMaxDuration = 0
				arg_446_1.dialogCg_.alpha = 1

				arg_446_1.dialog_:SetActive(true)
				SetActive(arg_446_1.leftNameGo_, true)

				local var_449_17 = arg_446_1:FormatText(StoryNameCfg[551].name)

				arg_446_1.leftNameTxt_.text = var_449_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_446_1.leftNameTxt_.transform)

				arg_446_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_446_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_446_1:RecordName(arg_446_1.leftNameTxt_.text)
				SetActive(arg_446_1.iconTrs_.gameObject, false)
				arg_446_1.callingController_:SetSelectedState("normal")

				local var_449_18 = arg_446_1:GetWordFromCfg(1104905107)
				local var_449_19 = arg_446_1:FormatText(var_449_18.content)

				arg_446_1.text_.text = var_449_19

				LuaForUtil.ClearLinePrefixSymbol(arg_446_1.text_)

				local var_449_20 = 9
				local var_449_21 = utf8.len(var_449_19)
				local var_449_22 = var_449_20 <= 0 and var_449_16 or var_449_16 * (var_449_21 / var_449_20)

				if var_449_22 > 0 and var_449_16 < var_449_22 then
					arg_446_1.talkMaxDuration = var_449_22

					if var_449_22 + var_449_15 > arg_446_1.duration_ then
						arg_446_1.duration_ = var_449_22 + var_449_15
					end
				end

				arg_446_1.text_.text = var_449_19
				arg_446_1.typewritter.percent = 0

				arg_446_1.typewritter:SetDirty()
				arg_446_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905107", "story_v_side_new_1104905.awb") ~= 0 then
					local var_449_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905107", "story_v_side_new_1104905.awb") / 1000

					if var_449_23 + var_449_15 > arg_446_1.duration_ then
						arg_446_1.duration_ = var_449_23 + var_449_15
					end

					if var_449_18.prefab_name ~= "" and arg_446_1.actors_[var_449_18.prefab_name] ~= nil then
						local var_449_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_446_1.actors_[var_449_18.prefab_name].transform, "story_v_side_new_1104905", "1104905107", "story_v_side_new_1104905.awb")

						arg_446_1:RecordAudio("1104905107", var_449_24)
						arg_446_1:RecordAudio("1104905107", var_449_24)
					else
						arg_446_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905107", "story_v_side_new_1104905.awb")
					end

					arg_446_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905107", "story_v_side_new_1104905.awb")
				end

				arg_446_1:RecordContent(arg_446_1.text_.text)
			end

			local var_449_25 = math.max(var_449_16, arg_446_1.talkMaxDuration)

			if var_449_15 <= arg_446_1.time_ and arg_446_1.time_ < var_449_15 + var_449_25 then
				arg_446_1.typewritter.percent = (arg_446_1.time_ - var_449_15) / var_449_25

				arg_446_1.typewritter:SetDirty()
			end

			if arg_446_1.time_ >= var_449_15 + var_449_25 and arg_446_1.time_ < var_449_15 + var_449_25 + arg_449_0 then
				arg_446_1.typewritter.percent = 1

				arg_446_1.typewritter:SetDirty()
				arg_446_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905108 = function(arg_450_0, arg_450_1)
		arg_450_1.time_ = 0
		arg_450_1.frameCnt_ = 0
		arg_450_1.state_ = "playing"
		arg_450_1.curTalkId_ = 1104905108
		arg_450_1.duration_ = 9

		SetActive(arg_450_1.tipsGo_, false)

		function arg_450_1.onSingleLineFinish_()
			arg_450_1.onSingleLineUpdate_ = nil
			arg_450_1.onSingleLineFinish_ = nil
			arg_450_1.state_ = "waiting"
		end

		function arg_450_1.playNext_(arg_452_0)
			if arg_452_0 == 1 then
				arg_450_0:Play1104905109(arg_450_1)
			end
		end

		function arg_450_1.onSingleLineUpdate_(arg_453_0)
			local var_453_0 = 1.999999999999

			if var_453_0 < arg_450_1.time_ and arg_450_1.time_ <= var_453_0 + arg_453_0 then
				local var_453_1 = manager.ui.mainCamera.transform.localPosition
				local var_453_2 = Vector3.New(0, 0, 10) + Vector3.New(var_453_1.x, var_453_1.y, 0)
				local var_453_3 = arg_450_1.bgs_.K11g

				var_453_3.transform.localPosition = var_453_2
				var_453_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_453_4 = var_453_3:GetComponent("SpriteRenderer")

				if var_453_4 and var_453_4.sprite then
					local var_453_5 = (var_453_3.transform.localPosition - var_453_1).z
					local var_453_6 = manager.ui.mainCameraCom_
					local var_453_7 = 2 * var_453_5 * Mathf.Tan(var_453_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_453_8 = var_453_7 * var_453_6.aspect
					local var_453_9 = var_453_4.sprite.bounds.size.x
					local var_453_10 = var_453_4.sprite.bounds.size.y
					local var_453_11 = var_453_8 / var_453_9
					local var_453_12 = var_453_7 / var_453_10
					local var_453_13 = var_453_12 < var_453_11 and var_453_11 or var_453_12

					var_453_3.transform.localScale = Vector3.New(var_453_13, var_453_13, 0)
				end

				for iter_453_0, iter_453_1 in pairs(arg_450_1.bgs_) do
					if iter_453_0 ~= "K11g" then
						iter_453_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_453_14 = 3.999999999999

			if var_453_14 < arg_450_1.time_ and arg_450_1.time_ <= var_453_14 + arg_453_0 then
				arg_450_1.allBtn_.enabled = false
			end

			local var_453_15 = 0.3

			if arg_450_1.time_ >= var_453_14 + var_453_15 and arg_450_1.time_ < var_453_14 + var_453_15 + arg_453_0 then
				arg_450_1.allBtn_.enabled = true
			end

			local var_453_16 = 0

			if var_453_16 < arg_450_1.time_ and arg_450_1.time_ <= var_453_16 + arg_453_0 then
				arg_450_1.mask_.enabled = true
				arg_450_1.mask_.raycastTarget = true

				arg_450_1:SetGaussion(false)
			end

			local var_453_17 = 2

			if var_453_16 <= arg_450_1.time_ and arg_450_1.time_ < var_453_16 + var_453_17 then
				local var_453_18 = (arg_450_1.time_ - var_453_16) / var_453_17
				local var_453_19 = Color.New(0, 0, 0)

				var_453_19.a = Mathf.Lerp(0, 1, var_453_18)
				arg_450_1.mask_.color = var_453_19
			end

			if arg_450_1.time_ >= var_453_16 + var_453_17 and arg_450_1.time_ < var_453_16 + var_453_17 + arg_453_0 then
				local var_453_20 = Color.New(0, 0, 0)

				var_453_20.a = 1
				arg_450_1.mask_.color = var_453_20
			end

			local var_453_21 = 2

			if var_453_21 < arg_450_1.time_ and arg_450_1.time_ <= var_453_21 + arg_453_0 then
				arg_450_1.mask_.enabled = true
				arg_450_1.mask_.raycastTarget = true

				arg_450_1:SetGaussion(false)
			end

			local var_453_22 = 2

			if var_453_21 <= arg_450_1.time_ and arg_450_1.time_ < var_453_21 + var_453_22 then
				local var_453_23 = (arg_450_1.time_ - var_453_21) / var_453_22
				local var_453_24 = Color.New(0, 0, 0)

				var_453_24.a = Mathf.Lerp(1, 0, var_453_23)
				arg_450_1.mask_.color = var_453_24
			end

			if arg_450_1.time_ >= var_453_21 + var_453_22 and arg_450_1.time_ < var_453_21 + var_453_22 + arg_453_0 then
				local var_453_25 = Color.New(0, 0, 0)
				local var_453_26 = 0

				arg_450_1.mask_.enabled = false
				var_453_25.a = var_453_26
				arg_450_1.mask_.color = var_453_25
			end

			local var_453_27 = arg_450_1.actors_["1049ui_story"].transform
			local var_453_28 = 1.96599999815226

			if var_453_28 < arg_450_1.time_ and arg_450_1.time_ <= var_453_28 + arg_453_0 then
				arg_450_1.var_.moveOldPos1049ui_story = var_453_27.localPosition
			end

			local var_453_29 = 0.001

			if var_453_28 <= arg_450_1.time_ and arg_450_1.time_ < var_453_28 + var_453_29 then
				local var_453_30 = (arg_450_1.time_ - var_453_28) / var_453_29
				local var_453_31 = Vector3.New(0, 100, 0)

				var_453_27.localPosition = Vector3.Lerp(arg_450_1.var_.moveOldPos1049ui_story, var_453_31, var_453_30)

				local var_453_32 = manager.ui.mainCamera.transform.position - var_453_27.position

				var_453_27.forward = Vector3.New(var_453_32.x, var_453_32.y, var_453_32.z)

				local var_453_33 = var_453_27.localEulerAngles

				var_453_33.z = 0
				var_453_33.x = 0
				var_453_27.localEulerAngles = var_453_33
			end

			if arg_450_1.time_ >= var_453_28 + var_453_29 and arg_450_1.time_ < var_453_28 + var_453_29 + arg_453_0 then
				var_453_27.localPosition = Vector3.New(0, 100, 0)

				local var_453_34 = manager.ui.mainCamera.transform.position - var_453_27.position

				var_453_27.forward = Vector3.New(var_453_34.x, var_453_34.y, var_453_34.z)

				local var_453_35 = var_453_27.localEulerAngles

				var_453_35.z = 0
				var_453_35.x = 0
				var_453_27.localEulerAngles = var_453_35
			end

			local var_453_36 = arg_450_1.actors_["1049ui_story"]
			local var_453_37 = 1.96599999815226

			if var_453_37 < arg_450_1.time_ and arg_450_1.time_ <= var_453_37 + arg_453_0 and not isNil(var_453_36) and arg_450_1.var_.characterEffect1049ui_story == nil then
				arg_450_1.var_.characterEffect1049ui_story = var_453_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_453_38 = 0.034000001847744

			if var_453_37 <= arg_450_1.time_ and arg_450_1.time_ < var_453_37 + var_453_38 and not isNil(var_453_36) then
				local var_453_39 = (arg_450_1.time_ - var_453_37) / var_453_38

				if arg_450_1.var_.characterEffect1049ui_story and not isNil(var_453_36) then
					local var_453_40 = Mathf.Lerp(0, 0.5, var_453_39)

					arg_450_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_450_1.var_.characterEffect1049ui_story.fillRatio = var_453_40
				end
			end

			if arg_450_1.time_ >= var_453_37 + var_453_38 and arg_450_1.time_ < var_453_37 + var_453_38 + arg_453_0 and not isNil(var_453_36) and arg_450_1.var_.characterEffect1049ui_story then
				local var_453_41 = 0.5

				arg_450_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_450_1.var_.characterEffect1049ui_story.fillRatio = var_453_41
			end

			local var_453_42 = 1.63333333333333
			local var_453_43 = 1

			if var_453_42 < arg_450_1.time_ and arg_450_1.time_ <= var_453_42 + arg_453_0 then
				local var_453_44 = "play"
				local var_453_45 = "effect"

				arg_450_1:AudioAction(var_453_44, var_453_45, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			local var_453_46 = 0.125
			local var_453_47 = 1

			if var_453_46 < arg_450_1.time_ and arg_450_1.time_ <= var_453_46 + arg_453_0 then
				local var_453_48 = "stop"
				local var_453_49 = "effect"

				arg_450_1:AudioAction(var_453_48, var_453_49, "se_story_side_1049", "se_story_side_1049_amb_room", "")
			end

			if arg_450_1.frameCnt_ <= 1 then
				arg_450_1.dialog_:SetActive(false)
			end

			local var_453_50 = 4
			local var_453_51 = 1.075

			if var_453_50 < arg_450_1.time_ and arg_450_1.time_ <= var_453_50 + arg_453_0 then
				arg_450_1.talkMaxDuration = 0

				arg_450_1.dialog_:SetActive(true)

				local var_453_52 = LeanTween.value(arg_450_1.dialog_, 0, 1, 0.3)

				var_453_52:setOnUpdate(LuaHelper.FloatAction(function(arg_454_0)
					arg_450_1.dialogCg_.alpha = arg_454_0
				end))
				var_453_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_450_1.dialog_)
					var_453_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_450_1.duration_ = arg_450_1.duration_ + 0.3

				SetActive(arg_450_1.leftNameGo_, false)

				arg_450_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_450_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_450_1:RecordName(arg_450_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_450_1.iconTrs_.gameObject, false)
				arg_450_1.callingController_:SetSelectedState("normal")

				local var_453_53 = arg_450_1:GetWordFromCfg(1104905108)
				local var_453_54 = arg_450_1:FormatText(var_453_53.content)

				arg_450_1.text_.text = var_453_54

				LuaForUtil.ClearLinePrefixSymbol(arg_450_1.text_)

				local var_453_55 = 43
				local var_453_56 = utf8.len(var_453_54)
				local var_453_57 = var_453_55 <= 0 and var_453_51 or var_453_51 * (var_453_56 / var_453_55)

				if var_453_57 > 0 and var_453_51 < var_453_57 then
					arg_450_1.talkMaxDuration = var_453_57
					var_453_50 = var_453_50 + 0.3

					if var_453_57 + var_453_50 > arg_450_1.duration_ then
						arg_450_1.duration_ = var_453_57 + var_453_50
					end
				end

				arg_450_1.text_.text = var_453_54
				arg_450_1.typewritter.percent = 0

				arg_450_1.typewritter:SetDirty()
				arg_450_1:ShowNextGo(false)
				arg_450_1:RecordContent(arg_450_1.text_.text)
			end

			local var_453_58 = var_453_50 + 0.3
			local var_453_59 = math.max(var_453_51, arg_450_1.talkMaxDuration)

			if var_453_58 <= arg_450_1.time_ and arg_450_1.time_ < var_453_58 + var_453_59 then
				arg_450_1.typewritter.percent = (arg_450_1.time_ - var_453_58) / var_453_59

				arg_450_1.typewritter:SetDirty()
			end

			if arg_450_1.time_ >= var_453_58 + var_453_59 and arg_450_1.time_ < var_453_58 + var_453_59 + arg_453_0 then
				arg_450_1.typewritter.percent = 1

				arg_450_1.typewritter:SetDirty()
				arg_450_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905109 = function(arg_456_0, arg_456_1)
		arg_456_1.time_ = 0
		arg_456_1.frameCnt_ = 0
		arg_456_1.state_ = "playing"
		arg_456_1.curTalkId_ = 1104905109
		arg_456_1.duration_ = 5

		SetActive(arg_456_1.tipsGo_, false)

		function arg_456_1.onSingleLineFinish_()
			arg_456_1.onSingleLineUpdate_ = nil
			arg_456_1.onSingleLineFinish_ = nil
			arg_456_1.state_ = "waiting"
		end

		function arg_456_1.playNext_(arg_458_0)
			if arg_458_0 == 1 then
				arg_456_0:Play1104905110(arg_456_1)
			end
		end

		function arg_456_1.onSingleLineUpdate_(arg_459_0)
			local var_459_0 = 0
			local var_459_1 = 0.2

			if var_459_0 < arg_456_1.time_ and arg_456_1.time_ <= var_459_0 + arg_459_0 then
				arg_456_1.talkMaxDuration = 0
				arg_456_1.dialogCg_.alpha = 1

				arg_456_1.dialog_:SetActive(true)
				SetActive(arg_456_1.leftNameGo_, true)

				local var_459_2 = arg_456_1:FormatText(StoryNameCfg[7].name)

				arg_456_1.leftNameTxt_.text = var_459_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_456_1.leftNameTxt_.transform)

				arg_456_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_456_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_456_1:RecordName(arg_456_1.leftNameTxt_.text)
				SetActive(arg_456_1.iconTrs_.gameObject, false)
				arg_456_1.callingController_:SetSelectedState("normal")

				local var_459_3 = arg_456_1:GetWordFromCfg(1104905109)
				local var_459_4 = arg_456_1:FormatText(var_459_3.content)

				arg_456_1.text_.text = var_459_4

				LuaForUtil.ClearLinePrefixSymbol(arg_456_1.text_)

				local var_459_5 = 8
				local var_459_6 = utf8.len(var_459_4)
				local var_459_7 = var_459_5 <= 0 and var_459_1 or var_459_1 * (var_459_6 / var_459_5)

				if var_459_7 > 0 and var_459_1 < var_459_7 then
					arg_456_1.talkMaxDuration = var_459_7

					if var_459_7 + var_459_0 > arg_456_1.duration_ then
						arg_456_1.duration_ = var_459_7 + var_459_0
					end
				end

				arg_456_1.text_.text = var_459_4
				arg_456_1.typewritter.percent = 0

				arg_456_1.typewritter:SetDirty()
				arg_456_1:ShowNextGo(false)
				arg_456_1:RecordContent(arg_456_1.text_.text)
			end

			local var_459_8 = math.max(var_459_1, arg_456_1.talkMaxDuration)

			if var_459_0 <= arg_456_1.time_ and arg_456_1.time_ < var_459_0 + var_459_8 then
				arg_456_1.typewritter.percent = (arg_456_1.time_ - var_459_0) / var_459_8

				arg_456_1.typewritter:SetDirty()
			end

			if arg_456_1.time_ >= var_459_0 + var_459_8 and arg_456_1.time_ < var_459_0 + var_459_8 + arg_459_0 then
				arg_456_1.typewritter.percent = 1

				arg_456_1.typewritter:SetDirty()
				arg_456_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905110 = function(arg_460_0, arg_460_1)
		arg_460_1.time_ = 0
		arg_460_1.frameCnt_ = 0
		arg_460_1.state_ = "playing"
		arg_460_1.curTalkId_ = 1104905110
		arg_460_1.duration_ = 4.5

		SetActive(arg_460_1.tipsGo_, false)

		function arg_460_1.onSingleLineFinish_()
			arg_460_1.onSingleLineUpdate_ = nil
			arg_460_1.onSingleLineFinish_ = nil
			arg_460_1.state_ = "waiting"
		end

		function arg_460_1.playNext_(arg_462_0)
			if arg_462_0 == 1 then
				arg_460_0:Play1104905111(arg_460_1)
			end
		end

		function arg_460_1.onSingleLineUpdate_(arg_463_0)
			local var_463_0 = arg_460_1.actors_["1049ui_story"].transform
			local var_463_1 = 0

			if var_463_1 < arg_460_1.time_ and arg_460_1.time_ <= var_463_1 + arg_463_0 then
				arg_460_1.var_.moveOldPos1049ui_story = var_463_0.localPosition
			end

			local var_463_2 = 0.001

			if var_463_1 <= arg_460_1.time_ and arg_460_1.time_ < var_463_1 + var_463_2 then
				local var_463_3 = (arg_460_1.time_ - var_463_1) / var_463_2
				local var_463_4 = Vector3.New(0, -1.2, -6)

				var_463_0.localPosition = Vector3.Lerp(arg_460_1.var_.moveOldPos1049ui_story, var_463_4, var_463_3)

				local var_463_5 = manager.ui.mainCamera.transform.position - var_463_0.position

				var_463_0.forward = Vector3.New(var_463_5.x, var_463_5.y, var_463_5.z)

				local var_463_6 = var_463_0.localEulerAngles

				var_463_6.z = 0
				var_463_6.x = 0
				var_463_0.localEulerAngles = var_463_6
			end

			if arg_460_1.time_ >= var_463_1 + var_463_2 and arg_460_1.time_ < var_463_1 + var_463_2 + arg_463_0 then
				var_463_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_463_7 = manager.ui.mainCamera.transform.position - var_463_0.position

				var_463_0.forward = Vector3.New(var_463_7.x, var_463_7.y, var_463_7.z)

				local var_463_8 = var_463_0.localEulerAngles

				var_463_8.z = 0
				var_463_8.x = 0
				var_463_0.localEulerAngles = var_463_8
			end

			local var_463_9 = arg_460_1.actors_["1049ui_story"]
			local var_463_10 = 0

			if var_463_10 < arg_460_1.time_ and arg_460_1.time_ <= var_463_10 + arg_463_0 and not isNil(var_463_9) and arg_460_1.var_.characterEffect1049ui_story == nil then
				arg_460_1.var_.characterEffect1049ui_story = var_463_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_463_11 = 0.200000002980232

			if var_463_10 <= arg_460_1.time_ and arg_460_1.time_ < var_463_10 + var_463_11 and not isNil(var_463_9) then
				local var_463_12 = (arg_460_1.time_ - var_463_10) / var_463_11

				if arg_460_1.var_.characterEffect1049ui_story and not isNil(var_463_9) then
					arg_460_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_460_1.time_ >= var_463_10 + var_463_11 and arg_460_1.time_ < var_463_10 + var_463_11 + arg_463_0 and not isNil(var_463_9) and arg_460_1.var_.characterEffect1049ui_story then
				arg_460_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_463_13 = 0

			if var_463_13 < arg_460_1.time_ and arg_460_1.time_ <= var_463_13 + arg_463_0 then
				arg_460_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_463_14 = 0

			if var_463_14 < arg_460_1.time_ and arg_460_1.time_ <= var_463_14 + arg_463_0 then
				arg_460_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_463_15 = 0
			local var_463_16 = 0.45

			if var_463_15 < arg_460_1.time_ and arg_460_1.time_ <= var_463_15 + arg_463_0 then
				arg_460_1.talkMaxDuration = 0
				arg_460_1.dialogCg_.alpha = 1

				arg_460_1.dialog_:SetActive(true)
				SetActive(arg_460_1.leftNameGo_, true)

				local var_463_17 = arg_460_1:FormatText(StoryNameCfg[551].name)

				arg_460_1.leftNameTxt_.text = var_463_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_460_1.leftNameTxt_.transform)

				arg_460_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_460_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_460_1:RecordName(arg_460_1.leftNameTxt_.text)
				SetActive(arg_460_1.iconTrs_.gameObject, false)
				arg_460_1.callingController_:SetSelectedState("normal")

				local var_463_18 = arg_460_1:GetWordFromCfg(1104905110)
				local var_463_19 = arg_460_1:FormatText(var_463_18.content)

				arg_460_1.text_.text = var_463_19

				LuaForUtil.ClearLinePrefixSymbol(arg_460_1.text_)

				local var_463_20 = 18
				local var_463_21 = utf8.len(var_463_19)
				local var_463_22 = var_463_20 <= 0 and var_463_16 or var_463_16 * (var_463_21 / var_463_20)

				if var_463_22 > 0 and var_463_16 < var_463_22 then
					arg_460_1.talkMaxDuration = var_463_22

					if var_463_22 + var_463_15 > arg_460_1.duration_ then
						arg_460_1.duration_ = var_463_22 + var_463_15
					end
				end

				arg_460_1.text_.text = var_463_19
				arg_460_1.typewritter.percent = 0

				arg_460_1.typewritter:SetDirty()
				arg_460_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905110", "story_v_side_new_1104905.awb") ~= 0 then
					local var_463_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905110", "story_v_side_new_1104905.awb") / 1000

					if var_463_23 + var_463_15 > arg_460_1.duration_ then
						arg_460_1.duration_ = var_463_23 + var_463_15
					end

					if var_463_18.prefab_name ~= "" and arg_460_1.actors_[var_463_18.prefab_name] ~= nil then
						local var_463_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_460_1.actors_[var_463_18.prefab_name].transform, "story_v_side_new_1104905", "1104905110", "story_v_side_new_1104905.awb")

						arg_460_1:RecordAudio("1104905110", var_463_24)
						arg_460_1:RecordAudio("1104905110", var_463_24)
					else
						arg_460_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905110", "story_v_side_new_1104905.awb")
					end

					arg_460_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905110", "story_v_side_new_1104905.awb")
				end

				arg_460_1:RecordContent(arg_460_1.text_.text)
			end

			local var_463_25 = math.max(var_463_16, arg_460_1.talkMaxDuration)

			if var_463_15 <= arg_460_1.time_ and arg_460_1.time_ < var_463_15 + var_463_25 then
				arg_460_1.typewritter.percent = (arg_460_1.time_ - var_463_15) / var_463_25

				arg_460_1.typewritter:SetDirty()
			end

			if arg_460_1.time_ >= var_463_15 + var_463_25 and arg_460_1.time_ < var_463_15 + var_463_25 + arg_463_0 then
				arg_460_1.typewritter.percent = 1

				arg_460_1.typewritter:SetDirty()
				arg_460_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905111 = function(arg_464_0, arg_464_1)
		arg_464_1.time_ = 0
		arg_464_1.frameCnt_ = 0
		arg_464_1.state_ = "playing"
		arg_464_1.curTalkId_ = 1104905111
		arg_464_1.duration_ = 11.3

		SetActive(arg_464_1.tipsGo_, false)

		function arg_464_1.onSingleLineFinish_()
			arg_464_1.onSingleLineUpdate_ = nil
			arg_464_1.onSingleLineFinish_ = nil
			arg_464_1.state_ = "waiting"
		end

		function arg_464_1.playNext_(arg_466_0)
			if arg_466_0 == 1 then
				arg_464_0:Play1104905112(arg_464_1)
			end
		end

		function arg_464_1.onSingleLineUpdate_(arg_467_0)
			local var_467_0 = 0
			local var_467_1 = 1.075

			if var_467_0 < arg_464_1.time_ and arg_464_1.time_ <= var_467_0 + arg_467_0 then
				arg_464_1.talkMaxDuration = 0
				arg_464_1.dialogCg_.alpha = 1

				arg_464_1.dialog_:SetActive(true)
				SetActive(arg_464_1.leftNameGo_, true)

				local var_467_2 = arg_464_1:FormatText(StoryNameCfg[551].name)

				arg_464_1.leftNameTxt_.text = var_467_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_464_1.leftNameTxt_.transform)

				arg_464_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_464_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_464_1:RecordName(arg_464_1.leftNameTxt_.text)
				SetActive(arg_464_1.iconTrs_.gameObject, false)
				arg_464_1.callingController_:SetSelectedState("normal")

				local var_467_3 = arg_464_1:GetWordFromCfg(1104905111)
				local var_467_4 = arg_464_1:FormatText(var_467_3.content)

				arg_464_1.text_.text = var_467_4

				LuaForUtil.ClearLinePrefixSymbol(arg_464_1.text_)

				local var_467_5 = 43
				local var_467_6 = utf8.len(var_467_4)
				local var_467_7 = var_467_5 <= 0 and var_467_1 or var_467_1 * (var_467_6 / var_467_5)

				if var_467_7 > 0 and var_467_1 < var_467_7 then
					arg_464_1.talkMaxDuration = var_467_7

					if var_467_7 + var_467_0 > arg_464_1.duration_ then
						arg_464_1.duration_ = var_467_7 + var_467_0
					end
				end

				arg_464_1.text_.text = var_467_4
				arg_464_1.typewritter.percent = 0

				arg_464_1.typewritter:SetDirty()
				arg_464_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905111", "story_v_side_new_1104905.awb") ~= 0 then
					local var_467_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905111", "story_v_side_new_1104905.awb") / 1000

					if var_467_8 + var_467_0 > arg_464_1.duration_ then
						arg_464_1.duration_ = var_467_8 + var_467_0
					end

					if var_467_3.prefab_name ~= "" and arg_464_1.actors_[var_467_3.prefab_name] ~= nil then
						local var_467_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_464_1.actors_[var_467_3.prefab_name].transform, "story_v_side_new_1104905", "1104905111", "story_v_side_new_1104905.awb")

						arg_464_1:RecordAudio("1104905111", var_467_9)
						arg_464_1:RecordAudio("1104905111", var_467_9)
					else
						arg_464_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905111", "story_v_side_new_1104905.awb")
					end

					arg_464_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905111", "story_v_side_new_1104905.awb")
				end

				arg_464_1:RecordContent(arg_464_1.text_.text)
			end

			local var_467_10 = math.max(var_467_1, arg_464_1.talkMaxDuration)

			if var_467_0 <= arg_464_1.time_ and arg_464_1.time_ < var_467_0 + var_467_10 then
				arg_464_1.typewritter.percent = (arg_464_1.time_ - var_467_0) / var_467_10

				arg_464_1.typewritter:SetDirty()
			end

			if arg_464_1.time_ >= var_467_0 + var_467_10 and arg_464_1.time_ < var_467_0 + var_467_10 + arg_467_0 then
				arg_464_1.typewritter.percent = 1

				arg_464_1.typewritter:SetDirty()
				arg_464_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905112 = function(arg_468_0, arg_468_1)
		arg_468_1.time_ = 0
		arg_468_1.frameCnt_ = 0
		arg_468_1.state_ = "playing"
		arg_468_1.curTalkId_ = 1104905112
		arg_468_1.duration_ = 11.63

		SetActive(arg_468_1.tipsGo_, false)

		function arg_468_1.onSingleLineFinish_()
			arg_468_1.onSingleLineUpdate_ = nil
			arg_468_1.onSingleLineFinish_ = nil
			arg_468_1.state_ = "waiting"
		end

		function arg_468_1.playNext_(arg_470_0)
			if arg_470_0 == 1 then
				arg_468_0:Play1104905113(arg_468_1)
			end
		end

		function arg_468_1.onSingleLineUpdate_(arg_471_0)
			local var_471_0 = 0
			local var_471_1 = 1.05

			if var_471_0 < arg_468_1.time_ and arg_468_1.time_ <= var_471_0 + arg_471_0 then
				arg_468_1.talkMaxDuration = 0
				arg_468_1.dialogCg_.alpha = 1

				arg_468_1.dialog_:SetActive(true)
				SetActive(arg_468_1.leftNameGo_, true)

				local var_471_2 = arg_468_1:FormatText(StoryNameCfg[551].name)

				arg_468_1.leftNameTxt_.text = var_471_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_468_1.leftNameTxt_.transform)

				arg_468_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_468_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_468_1:RecordName(arg_468_1.leftNameTxt_.text)
				SetActive(arg_468_1.iconTrs_.gameObject, false)
				arg_468_1.callingController_:SetSelectedState("normal")

				local var_471_3 = arg_468_1:GetWordFromCfg(1104905112)
				local var_471_4 = arg_468_1:FormatText(var_471_3.content)

				arg_468_1.text_.text = var_471_4

				LuaForUtil.ClearLinePrefixSymbol(arg_468_1.text_)

				local var_471_5 = 42
				local var_471_6 = utf8.len(var_471_4)
				local var_471_7 = var_471_5 <= 0 and var_471_1 or var_471_1 * (var_471_6 / var_471_5)

				if var_471_7 > 0 and var_471_1 < var_471_7 then
					arg_468_1.talkMaxDuration = var_471_7

					if var_471_7 + var_471_0 > arg_468_1.duration_ then
						arg_468_1.duration_ = var_471_7 + var_471_0
					end
				end

				arg_468_1.text_.text = var_471_4
				arg_468_1.typewritter.percent = 0

				arg_468_1.typewritter:SetDirty()
				arg_468_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905112", "story_v_side_new_1104905.awb") ~= 0 then
					local var_471_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905112", "story_v_side_new_1104905.awb") / 1000

					if var_471_8 + var_471_0 > arg_468_1.duration_ then
						arg_468_1.duration_ = var_471_8 + var_471_0
					end

					if var_471_3.prefab_name ~= "" and arg_468_1.actors_[var_471_3.prefab_name] ~= nil then
						local var_471_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_468_1.actors_[var_471_3.prefab_name].transform, "story_v_side_new_1104905", "1104905112", "story_v_side_new_1104905.awb")

						arg_468_1:RecordAudio("1104905112", var_471_9)
						arg_468_1:RecordAudio("1104905112", var_471_9)
					else
						arg_468_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905112", "story_v_side_new_1104905.awb")
					end

					arg_468_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905112", "story_v_side_new_1104905.awb")
				end

				arg_468_1:RecordContent(arg_468_1.text_.text)
			end

			local var_471_10 = math.max(var_471_1, arg_468_1.talkMaxDuration)

			if var_471_0 <= arg_468_1.time_ and arg_468_1.time_ < var_471_0 + var_471_10 then
				arg_468_1.typewritter.percent = (arg_468_1.time_ - var_471_0) / var_471_10

				arg_468_1.typewritter:SetDirty()
			end

			if arg_468_1.time_ >= var_471_0 + var_471_10 and arg_468_1.time_ < var_471_0 + var_471_10 + arg_471_0 then
				arg_468_1.typewritter.percent = 1

				arg_468_1.typewritter:SetDirty()
				arg_468_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905113 = function(arg_472_0, arg_472_1)
		arg_472_1.time_ = 0
		arg_472_1.frameCnt_ = 0
		arg_472_1.state_ = "playing"
		arg_472_1.curTalkId_ = 1104905113
		arg_472_1.duration_ = 11.43

		SetActive(arg_472_1.tipsGo_, false)

		function arg_472_1.onSingleLineFinish_()
			arg_472_1.onSingleLineUpdate_ = nil
			arg_472_1.onSingleLineFinish_ = nil
			arg_472_1.state_ = "waiting"
		end

		function arg_472_1.playNext_(arg_474_0)
			if arg_474_0 == 1 then
				arg_472_0:Play1104905114(arg_472_1)
			end
		end

		function arg_472_1.onSingleLineUpdate_(arg_475_0)
			local var_475_0 = 0

			if var_475_0 < arg_472_1.time_ and arg_472_1.time_ <= var_475_0 + arg_475_0 then
				arg_472_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_475_1 = 0

			if var_475_1 < arg_472_1.time_ and arg_472_1.time_ <= var_475_1 + arg_475_0 then
				arg_472_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_475_2 = 0
			local var_475_3 = 0.9

			if var_475_2 < arg_472_1.time_ and arg_472_1.time_ <= var_475_2 + arg_475_0 then
				arg_472_1.talkMaxDuration = 0
				arg_472_1.dialogCg_.alpha = 1

				arg_472_1.dialog_:SetActive(true)
				SetActive(arg_472_1.leftNameGo_, true)

				local var_475_4 = arg_472_1:FormatText(StoryNameCfg[551].name)

				arg_472_1.leftNameTxt_.text = var_475_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_472_1.leftNameTxt_.transform)

				arg_472_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_472_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_472_1:RecordName(arg_472_1.leftNameTxt_.text)
				SetActive(arg_472_1.iconTrs_.gameObject, false)
				arg_472_1.callingController_:SetSelectedState("normal")

				local var_475_5 = arg_472_1:GetWordFromCfg(1104905113)
				local var_475_6 = arg_472_1:FormatText(var_475_5.content)

				arg_472_1.text_.text = var_475_6

				LuaForUtil.ClearLinePrefixSymbol(arg_472_1.text_)

				local var_475_7 = 36
				local var_475_8 = utf8.len(var_475_6)
				local var_475_9 = var_475_7 <= 0 and var_475_3 or var_475_3 * (var_475_8 / var_475_7)

				if var_475_9 > 0 and var_475_3 < var_475_9 then
					arg_472_1.talkMaxDuration = var_475_9

					if var_475_9 + var_475_2 > arg_472_1.duration_ then
						arg_472_1.duration_ = var_475_9 + var_475_2
					end
				end

				arg_472_1.text_.text = var_475_6
				arg_472_1.typewritter.percent = 0

				arg_472_1.typewritter:SetDirty()
				arg_472_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905113", "story_v_side_new_1104905.awb") ~= 0 then
					local var_475_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905113", "story_v_side_new_1104905.awb") / 1000

					if var_475_10 + var_475_2 > arg_472_1.duration_ then
						arg_472_1.duration_ = var_475_10 + var_475_2
					end

					if var_475_5.prefab_name ~= "" and arg_472_1.actors_[var_475_5.prefab_name] ~= nil then
						local var_475_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_472_1.actors_[var_475_5.prefab_name].transform, "story_v_side_new_1104905", "1104905113", "story_v_side_new_1104905.awb")

						arg_472_1:RecordAudio("1104905113", var_475_11)
						arg_472_1:RecordAudio("1104905113", var_475_11)
					else
						arg_472_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905113", "story_v_side_new_1104905.awb")
					end

					arg_472_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905113", "story_v_side_new_1104905.awb")
				end

				arg_472_1:RecordContent(arg_472_1.text_.text)
			end

			local var_475_12 = math.max(var_475_3, arg_472_1.talkMaxDuration)

			if var_475_2 <= arg_472_1.time_ and arg_472_1.time_ < var_475_2 + var_475_12 then
				arg_472_1.typewritter.percent = (arg_472_1.time_ - var_475_2) / var_475_12

				arg_472_1.typewritter:SetDirty()
			end

			if arg_472_1.time_ >= var_475_2 + var_475_12 and arg_472_1.time_ < var_475_2 + var_475_12 + arg_475_0 then
				arg_472_1.typewritter.percent = 1

				arg_472_1.typewritter:SetDirty()
				arg_472_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905114 = function(arg_476_0, arg_476_1)
		arg_476_1.time_ = 0
		arg_476_1.frameCnt_ = 0
		arg_476_1.state_ = "playing"
		arg_476_1.curTalkId_ = 1104905114
		arg_476_1.duration_ = 5

		SetActive(arg_476_1.tipsGo_, false)

		function arg_476_1.onSingleLineFinish_()
			arg_476_1.onSingleLineUpdate_ = nil
			arg_476_1.onSingleLineFinish_ = nil
			arg_476_1.state_ = "waiting"
		end

		function arg_476_1.playNext_(arg_478_0)
			if arg_478_0 == 1 then
				arg_476_0:Play1104905115(arg_476_1)
			end
		end

		function arg_476_1.onSingleLineUpdate_(arg_479_0)
			local var_479_0 = arg_476_1.actors_["1049ui_story"].transform
			local var_479_1 = 0

			if var_479_1 < arg_476_1.time_ and arg_476_1.time_ <= var_479_1 + arg_479_0 then
				arg_476_1.var_.moveOldPos1049ui_story = var_479_0.localPosition
			end

			local var_479_2 = 0.001

			if var_479_1 <= arg_476_1.time_ and arg_476_1.time_ < var_479_1 + var_479_2 then
				local var_479_3 = (arg_476_1.time_ - var_479_1) / var_479_2
				local var_479_4 = Vector3.New(0, 100, 0)

				var_479_0.localPosition = Vector3.Lerp(arg_476_1.var_.moveOldPos1049ui_story, var_479_4, var_479_3)

				local var_479_5 = manager.ui.mainCamera.transform.position - var_479_0.position

				var_479_0.forward = Vector3.New(var_479_5.x, var_479_5.y, var_479_5.z)

				local var_479_6 = var_479_0.localEulerAngles

				var_479_6.z = 0
				var_479_6.x = 0
				var_479_0.localEulerAngles = var_479_6
			end

			if arg_476_1.time_ >= var_479_1 + var_479_2 and arg_476_1.time_ < var_479_1 + var_479_2 + arg_479_0 then
				var_479_0.localPosition = Vector3.New(0, 100, 0)

				local var_479_7 = manager.ui.mainCamera.transform.position - var_479_0.position

				var_479_0.forward = Vector3.New(var_479_7.x, var_479_7.y, var_479_7.z)

				local var_479_8 = var_479_0.localEulerAngles

				var_479_8.z = 0
				var_479_8.x = 0
				var_479_0.localEulerAngles = var_479_8
			end

			local var_479_9 = arg_476_1.actors_["1049ui_story"]
			local var_479_10 = 0

			if var_479_10 < arg_476_1.time_ and arg_476_1.time_ <= var_479_10 + arg_479_0 and not isNil(var_479_9) and arg_476_1.var_.characterEffect1049ui_story == nil then
				arg_476_1.var_.characterEffect1049ui_story = var_479_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_479_11 = 0.200000002980232

			if var_479_10 <= arg_476_1.time_ and arg_476_1.time_ < var_479_10 + var_479_11 and not isNil(var_479_9) then
				local var_479_12 = (arg_476_1.time_ - var_479_10) / var_479_11

				if arg_476_1.var_.characterEffect1049ui_story and not isNil(var_479_9) then
					local var_479_13 = Mathf.Lerp(0, 0.5, var_479_12)

					arg_476_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_476_1.var_.characterEffect1049ui_story.fillRatio = var_479_13
				end
			end

			if arg_476_1.time_ >= var_479_10 + var_479_11 and arg_476_1.time_ < var_479_10 + var_479_11 + arg_479_0 and not isNil(var_479_9) and arg_476_1.var_.characterEffect1049ui_story then
				local var_479_14 = 0.5

				arg_476_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_476_1.var_.characterEffect1049ui_story.fillRatio = var_479_14
			end

			local var_479_15 = 0
			local var_479_16 = 0.825

			if var_479_15 < arg_476_1.time_ and arg_476_1.time_ <= var_479_15 + arg_479_0 then
				arg_476_1.talkMaxDuration = 0
				arg_476_1.dialogCg_.alpha = 1

				arg_476_1.dialog_:SetActive(true)
				SetActive(arg_476_1.leftNameGo_, false)

				arg_476_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_476_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_476_1:RecordName(arg_476_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_476_1.iconTrs_.gameObject, false)
				arg_476_1.callingController_:SetSelectedState("normal")

				local var_479_17 = arg_476_1:GetWordFromCfg(1104905114)
				local var_479_18 = arg_476_1:FormatText(var_479_17.content)

				arg_476_1.text_.text = var_479_18

				LuaForUtil.ClearLinePrefixSymbol(arg_476_1.text_)

				local var_479_19 = 33
				local var_479_20 = utf8.len(var_479_18)
				local var_479_21 = var_479_19 <= 0 and var_479_16 or var_479_16 * (var_479_20 / var_479_19)

				if var_479_21 > 0 and var_479_16 < var_479_21 then
					arg_476_1.talkMaxDuration = var_479_21

					if var_479_21 + var_479_15 > arg_476_1.duration_ then
						arg_476_1.duration_ = var_479_21 + var_479_15
					end
				end

				arg_476_1.text_.text = var_479_18
				arg_476_1.typewritter.percent = 0

				arg_476_1.typewritter:SetDirty()
				arg_476_1:ShowNextGo(false)
				arg_476_1:RecordContent(arg_476_1.text_.text)
			end

			local var_479_22 = math.max(var_479_16, arg_476_1.talkMaxDuration)

			if var_479_15 <= arg_476_1.time_ and arg_476_1.time_ < var_479_15 + var_479_22 then
				arg_476_1.typewritter.percent = (arg_476_1.time_ - var_479_15) / var_479_22

				arg_476_1.typewritter:SetDirty()
			end

			if arg_476_1.time_ >= var_479_15 + var_479_22 and arg_476_1.time_ < var_479_15 + var_479_22 + arg_479_0 then
				arg_476_1.typewritter.percent = 1

				arg_476_1.typewritter:SetDirty()
				arg_476_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905115 = function(arg_480_0, arg_480_1)
		arg_480_1.time_ = 0
		arg_480_1.frameCnt_ = 0
		arg_480_1.state_ = "playing"
		arg_480_1.curTalkId_ = 1104905115
		arg_480_1.duration_ = 6.2

		SetActive(arg_480_1.tipsGo_, false)

		function arg_480_1.onSingleLineFinish_()
			arg_480_1.onSingleLineUpdate_ = nil
			arg_480_1.onSingleLineFinish_ = nil
			arg_480_1.state_ = "waiting"
		end

		function arg_480_1.playNext_(arg_482_0)
			if arg_482_0 == 1 then
				arg_480_0:Play1104905116(arg_480_1)
			end
		end

		function arg_480_1.onSingleLineUpdate_(arg_483_0)
			local var_483_0 = arg_480_1.actors_["1049ui_story"].transform
			local var_483_1 = 0

			if var_483_1 < arg_480_1.time_ and arg_480_1.time_ <= var_483_1 + arg_483_0 then
				arg_480_1.var_.moveOldPos1049ui_story = var_483_0.localPosition
			end

			local var_483_2 = 0.001

			if var_483_1 <= arg_480_1.time_ and arg_480_1.time_ < var_483_1 + var_483_2 then
				local var_483_3 = (arg_480_1.time_ - var_483_1) / var_483_2
				local var_483_4 = Vector3.New(0, -1.2, -6)

				var_483_0.localPosition = Vector3.Lerp(arg_480_1.var_.moveOldPos1049ui_story, var_483_4, var_483_3)

				local var_483_5 = manager.ui.mainCamera.transform.position - var_483_0.position

				var_483_0.forward = Vector3.New(var_483_5.x, var_483_5.y, var_483_5.z)

				local var_483_6 = var_483_0.localEulerAngles

				var_483_6.z = 0
				var_483_6.x = 0
				var_483_0.localEulerAngles = var_483_6
			end

			if arg_480_1.time_ >= var_483_1 + var_483_2 and arg_480_1.time_ < var_483_1 + var_483_2 + arg_483_0 then
				var_483_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_483_7 = manager.ui.mainCamera.transform.position - var_483_0.position

				var_483_0.forward = Vector3.New(var_483_7.x, var_483_7.y, var_483_7.z)

				local var_483_8 = var_483_0.localEulerAngles

				var_483_8.z = 0
				var_483_8.x = 0
				var_483_0.localEulerAngles = var_483_8
			end

			local var_483_9 = arg_480_1.actors_["1049ui_story"]
			local var_483_10 = 0

			if var_483_10 < arg_480_1.time_ and arg_480_1.time_ <= var_483_10 + arg_483_0 and not isNil(var_483_9) and arg_480_1.var_.characterEffect1049ui_story == nil then
				arg_480_1.var_.characterEffect1049ui_story = var_483_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_483_11 = 0.200000002980232

			if var_483_10 <= arg_480_1.time_ and arg_480_1.time_ < var_483_10 + var_483_11 and not isNil(var_483_9) then
				local var_483_12 = (arg_480_1.time_ - var_483_10) / var_483_11

				if arg_480_1.var_.characterEffect1049ui_story and not isNil(var_483_9) then
					arg_480_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_480_1.time_ >= var_483_10 + var_483_11 and arg_480_1.time_ < var_483_10 + var_483_11 + arg_483_0 and not isNil(var_483_9) and arg_480_1.var_.characterEffect1049ui_story then
				arg_480_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_483_13 = 0

			if var_483_13 < arg_480_1.time_ and arg_480_1.time_ <= var_483_13 + arg_483_0 then
				arg_480_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_483_14 = 0

			if var_483_14 < arg_480_1.time_ and arg_480_1.time_ <= var_483_14 + arg_483_0 then
				arg_480_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_483_15 = 0
			local var_483_16 = 0.575

			if var_483_15 < arg_480_1.time_ and arg_480_1.time_ <= var_483_15 + arg_483_0 then
				arg_480_1.talkMaxDuration = 0
				arg_480_1.dialogCg_.alpha = 1

				arg_480_1.dialog_:SetActive(true)
				SetActive(arg_480_1.leftNameGo_, true)

				local var_483_17 = arg_480_1:FormatText(StoryNameCfg[551].name)

				arg_480_1.leftNameTxt_.text = var_483_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_480_1.leftNameTxt_.transform)

				arg_480_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_480_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_480_1:RecordName(arg_480_1.leftNameTxt_.text)
				SetActive(arg_480_1.iconTrs_.gameObject, false)
				arg_480_1.callingController_:SetSelectedState("normal")

				local var_483_18 = arg_480_1:GetWordFromCfg(1104905115)
				local var_483_19 = arg_480_1:FormatText(var_483_18.content)

				arg_480_1.text_.text = var_483_19

				LuaForUtil.ClearLinePrefixSymbol(arg_480_1.text_)

				local var_483_20 = 23
				local var_483_21 = utf8.len(var_483_19)
				local var_483_22 = var_483_20 <= 0 and var_483_16 or var_483_16 * (var_483_21 / var_483_20)

				if var_483_22 > 0 and var_483_16 < var_483_22 then
					arg_480_1.talkMaxDuration = var_483_22

					if var_483_22 + var_483_15 > arg_480_1.duration_ then
						arg_480_1.duration_ = var_483_22 + var_483_15
					end
				end

				arg_480_1.text_.text = var_483_19
				arg_480_1.typewritter.percent = 0

				arg_480_1.typewritter:SetDirty()
				arg_480_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905115", "story_v_side_new_1104905.awb") ~= 0 then
					local var_483_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905115", "story_v_side_new_1104905.awb") / 1000

					if var_483_23 + var_483_15 > arg_480_1.duration_ then
						arg_480_1.duration_ = var_483_23 + var_483_15
					end

					if var_483_18.prefab_name ~= "" and arg_480_1.actors_[var_483_18.prefab_name] ~= nil then
						local var_483_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_480_1.actors_[var_483_18.prefab_name].transform, "story_v_side_new_1104905", "1104905115", "story_v_side_new_1104905.awb")

						arg_480_1:RecordAudio("1104905115", var_483_24)
						arg_480_1:RecordAudio("1104905115", var_483_24)
					else
						arg_480_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905115", "story_v_side_new_1104905.awb")
					end

					arg_480_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905115", "story_v_side_new_1104905.awb")
				end

				arg_480_1:RecordContent(arg_480_1.text_.text)
			end

			local var_483_25 = math.max(var_483_16, arg_480_1.talkMaxDuration)

			if var_483_15 <= arg_480_1.time_ and arg_480_1.time_ < var_483_15 + var_483_25 then
				arg_480_1.typewritter.percent = (arg_480_1.time_ - var_483_15) / var_483_25

				arg_480_1.typewritter:SetDirty()
			end

			if arg_480_1.time_ >= var_483_15 + var_483_25 and arg_480_1.time_ < var_483_15 + var_483_25 + arg_483_0 then
				arg_480_1.typewritter.percent = 1

				arg_480_1.typewritter:SetDirty()
				arg_480_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905116 = function(arg_484_0, arg_484_1)
		arg_484_1.time_ = 0
		arg_484_1.frameCnt_ = 0
		arg_484_1.state_ = "playing"
		arg_484_1.curTalkId_ = 1104905116
		arg_484_1.duration_ = 5

		SetActive(arg_484_1.tipsGo_, false)

		function arg_484_1.onSingleLineFinish_()
			arg_484_1.onSingleLineUpdate_ = nil
			arg_484_1.onSingleLineFinish_ = nil
			arg_484_1.state_ = "waiting"
		end

		function arg_484_1.playNext_(arg_486_0)
			if arg_486_0 == 1 then
				arg_484_0:Play1104905117(arg_484_1)
			end
		end

		function arg_484_1.onSingleLineUpdate_(arg_487_0)
			local var_487_0 = arg_484_1.actors_["1049ui_story"]
			local var_487_1 = 0

			if var_487_1 < arg_484_1.time_ and arg_484_1.time_ <= var_487_1 + arg_487_0 and not isNil(var_487_0) and arg_484_1.var_.characterEffect1049ui_story == nil then
				arg_484_1.var_.characterEffect1049ui_story = var_487_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_487_2 = 0.200000002980232

			if var_487_1 <= arg_484_1.time_ and arg_484_1.time_ < var_487_1 + var_487_2 and not isNil(var_487_0) then
				local var_487_3 = (arg_484_1.time_ - var_487_1) / var_487_2

				if arg_484_1.var_.characterEffect1049ui_story and not isNil(var_487_0) then
					local var_487_4 = Mathf.Lerp(0, 0.5, var_487_3)

					arg_484_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_484_1.var_.characterEffect1049ui_story.fillRatio = var_487_4
				end
			end

			if arg_484_1.time_ >= var_487_1 + var_487_2 and arg_484_1.time_ < var_487_1 + var_487_2 + arg_487_0 and not isNil(var_487_0) and arg_484_1.var_.characterEffect1049ui_story then
				local var_487_5 = 0.5

				arg_484_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_484_1.var_.characterEffect1049ui_story.fillRatio = var_487_5
			end

			local var_487_6 = 0
			local var_487_7 = 0.175

			if var_487_6 < arg_484_1.time_ and arg_484_1.time_ <= var_487_6 + arg_487_0 then
				arg_484_1.talkMaxDuration = 0
				arg_484_1.dialogCg_.alpha = 1

				arg_484_1.dialog_:SetActive(true)
				SetActive(arg_484_1.leftNameGo_, true)

				local var_487_8 = arg_484_1:FormatText(StoryNameCfg[7].name)

				arg_484_1.leftNameTxt_.text = var_487_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_484_1.leftNameTxt_.transform)

				arg_484_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_484_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_484_1:RecordName(arg_484_1.leftNameTxt_.text)
				SetActive(arg_484_1.iconTrs_.gameObject, false)
				arg_484_1.callingController_:SetSelectedState("normal")

				local var_487_9 = arg_484_1:GetWordFromCfg(1104905116)
				local var_487_10 = arg_484_1:FormatText(var_487_9.content)

				arg_484_1.text_.text = var_487_10

				LuaForUtil.ClearLinePrefixSymbol(arg_484_1.text_)

				local var_487_11 = 7
				local var_487_12 = utf8.len(var_487_10)
				local var_487_13 = var_487_11 <= 0 and var_487_7 or var_487_7 * (var_487_12 / var_487_11)

				if var_487_13 > 0 and var_487_7 < var_487_13 then
					arg_484_1.talkMaxDuration = var_487_13

					if var_487_13 + var_487_6 > arg_484_1.duration_ then
						arg_484_1.duration_ = var_487_13 + var_487_6
					end
				end

				arg_484_1.text_.text = var_487_10
				arg_484_1.typewritter.percent = 0

				arg_484_1.typewritter:SetDirty()
				arg_484_1:ShowNextGo(false)
				arg_484_1:RecordContent(arg_484_1.text_.text)
			end

			local var_487_14 = math.max(var_487_7, arg_484_1.talkMaxDuration)

			if var_487_6 <= arg_484_1.time_ and arg_484_1.time_ < var_487_6 + var_487_14 then
				arg_484_1.typewritter.percent = (arg_484_1.time_ - var_487_6) / var_487_14

				arg_484_1.typewritter:SetDirty()
			end

			if arg_484_1.time_ >= var_487_6 + var_487_14 and arg_484_1.time_ < var_487_6 + var_487_14 + arg_487_0 then
				arg_484_1.typewritter.percent = 1

				arg_484_1.typewritter:SetDirty()
				arg_484_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905117 = function(arg_488_0, arg_488_1)
		arg_488_1.time_ = 0
		arg_488_1.frameCnt_ = 0
		arg_488_1.state_ = "playing"
		arg_488_1.curTalkId_ = 1104905117
		arg_488_1.duration_ = 5

		SetActive(arg_488_1.tipsGo_, false)

		function arg_488_1.onSingleLineFinish_()
			arg_488_1.onSingleLineUpdate_ = nil
			arg_488_1.onSingleLineFinish_ = nil
			arg_488_1.state_ = "waiting"
		end

		function arg_488_1.playNext_(arg_490_0)
			if arg_490_0 == 1 then
				arg_488_0:Play1104905118(arg_488_1)
			end
		end

		function arg_488_1.onSingleLineUpdate_(arg_491_0)
			local var_491_0 = 0
			local var_491_1 = 1.175

			if var_491_0 < arg_488_1.time_ and arg_488_1.time_ <= var_491_0 + arg_491_0 then
				arg_488_1.talkMaxDuration = 0
				arg_488_1.dialogCg_.alpha = 1

				arg_488_1.dialog_:SetActive(true)
				SetActive(arg_488_1.leftNameGo_, true)

				local var_491_2 = arg_488_1:FormatText(StoryNameCfg[7].name)

				arg_488_1.leftNameTxt_.text = var_491_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_488_1.leftNameTxt_.transform)

				arg_488_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_488_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_488_1:RecordName(arg_488_1.leftNameTxt_.text)
				SetActive(arg_488_1.iconTrs_.gameObject, false)
				arg_488_1.callingController_:SetSelectedState("normal")

				local var_491_3 = arg_488_1:GetWordFromCfg(1104905117)
				local var_491_4 = arg_488_1:FormatText(var_491_3.content)

				arg_488_1.text_.text = var_491_4

				LuaForUtil.ClearLinePrefixSymbol(arg_488_1.text_)

				local var_491_5 = 47
				local var_491_6 = utf8.len(var_491_4)
				local var_491_7 = var_491_5 <= 0 and var_491_1 or var_491_1 * (var_491_6 / var_491_5)

				if var_491_7 > 0 and var_491_1 < var_491_7 then
					arg_488_1.talkMaxDuration = var_491_7

					if var_491_7 + var_491_0 > arg_488_1.duration_ then
						arg_488_1.duration_ = var_491_7 + var_491_0
					end
				end

				arg_488_1.text_.text = var_491_4
				arg_488_1.typewritter.percent = 0

				arg_488_1.typewritter:SetDirty()
				arg_488_1:ShowNextGo(false)
				arg_488_1:RecordContent(arg_488_1.text_.text)
			end

			local var_491_8 = math.max(var_491_1, arg_488_1.talkMaxDuration)

			if var_491_0 <= arg_488_1.time_ and arg_488_1.time_ < var_491_0 + var_491_8 then
				arg_488_1.typewritter.percent = (arg_488_1.time_ - var_491_0) / var_491_8

				arg_488_1.typewritter:SetDirty()
			end

			if arg_488_1.time_ >= var_491_0 + var_491_8 and arg_488_1.time_ < var_491_0 + var_491_8 + arg_491_0 then
				arg_488_1.typewritter.percent = 1

				arg_488_1.typewritter:SetDirty()
				arg_488_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905118 = function(arg_492_0, arg_492_1)
		arg_492_1.time_ = 0
		arg_492_1.frameCnt_ = 0
		arg_492_1.state_ = "playing"
		arg_492_1.curTalkId_ = 1104905118
		arg_492_1.duration_ = 5

		SetActive(arg_492_1.tipsGo_, false)

		function arg_492_1.onSingleLineFinish_()
			arg_492_1.onSingleLineUpdate_ = nil
			arg_492_1.onSingleLineFinish_ = nil
			arg_492_1.state_ = "waiting"
		end

		function arg_492_1.playNext_(arg_494_0)
			if arg_494_0 == 1 then
				arg_492_0:Play1104905119(arg_492_1)
			end
		end

		function arg_492_1.onSingleLineUpdate_(arg_495_0)
			local var_495_0 = arg_492_1.actors_["1049ui_story"].transform
			local var_495_1 = 0

			if var_495_1 < arg_492_1.time_ and arg_492_1.time_ <= var_495_1 + arg_495_0 then
				arg_492_1.var_.moveOldPos1049ui_story = var_495_0.localPosition
			end

			local var_495_2 = 0.001

			if var_495_1 <= arg_492_1.time_ and arg_492_1.time_ < var_495_1 + var_495_2 then
				local var_495_3 = (arg_492_1.time_ - var_495_1) / var_495_2
				local var_495_4 = Vector3.New(0, 100, 0)

				var_495_0.localPosition = Vector3.Lerp(arg_492_1.var_.moveOldPos1049ui_story, var_495_4, var_495_3)

				local var_495_5 = manager.ui.mainCamera.transform.position - var_495_0.position

				var_495_0.forward = Vector3.New(var_495_5.x, var_495_5.y, var_495_5.z)

				local var_495_6 = var_495_0.localEulerAngles

				var_495_6.z = 0
				var_495_6.x = 0
				var_495_0.localEulerAngles = var_495_6
			end

			if arg_492_1.time_ >= var_495_1 + var_495_2 and arg_492_1.time_ < var_495_1 + var_495_2 + arg_495_0 then
				var_495_0.localPosition = Vector3.New(0, 100, 0)

				local var_495_7 = manager.ui.mainCamera.transform.position - var_495_0.position

				var_495_0.forward = Vector3.New(var_495_7.x, var_495_7.y, var_495_7.z)

				local var_495_8 = var_495_0.localEulerAngles

				var_495_8.z = 0
				var_495_8.x = 0
				var_495_0.localEulerAngles = var_495_8
			end

			local var_495_9 = 0
			local var_495_10 = 1.075

			if var_495_9 < arg_492_1.time_ and arg_492_1.time_ <= var_495_9 + arg_495_0 then
				arg_492_1.talkMaxDuration = 0
				arg_492_1.dialogCg_.alpha = 1

				arg_492_1.dialog_:SetActive(true)
				SetActive(arg_492_1.leftNameGo_, false)

				arg_492_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_492_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_492_1:RecordName(arg_492_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_492_1.iconTrs_.gameObject, false)
				arg_492_1.callingController_:SetSelectedState("normal")

				local var_495_11 = arg_492_1:GetWordFromCfg(1104905118)
				local var_495_12 = arg_492_1:FormatText(var_495_11.content)

				arg_492_1.text_.text = var_495_12

				LuaForUtil.ClearLinePrefixSymbol(arg_492_1.text_)

				local var_495_13 = 43
				local var_495_14 = utf8.len(var_495_12)
				local var_495_15 = var_495_13 <= 0 and var_495_10 or var_495_10 * (var_495_14 / var_495_13)

				if var_495_15 > 0 and var_495_10 < var_495_15 then
					arg_492_1.talkMaxDuration = var_495_15

					if var_495_15 + var_495_9 > arg_492_1.duration_ then
						arg_492_1.duration_ = var_495_15 + var_495_9
					end
				end

				arg_492_1.text_.text = var_495_12
				arg_492_1.typewritter.percent = 0

				arg_492_1.typewritter:SetDirty()
				arg_492_1:ShowNextGo(false)
				arg_492_1:RecordContent(arg_492_1.text_.text)
			end

			local var_495_16 = math.max(var_495_10, arg_492_1.talkMaxDuration)

			if var_495_9 <= arg_492_1.time_ and arg_492_1.time_ < var_495_9 + var_495_16 then
				arg_492_1.typewritter.percent = (arg_492_1.time_ - var_495_9) / var_495_16

				arg_492_1.typewritter:SetDirty()
			end

			if arg_492_1.time_ >= var_495_9 + var_495_16 and arg_492_1.time_ < var_495_9 + var_495_16 + arg_495_0 then
				arg_492_1.typewritter.percent = 1

				arg_492_1.typewritter:SetDirty()
				arg_492_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905119 = function(arg_496_0, arg_496_1)
		arg_496_1.time_ = 0
		arg_496_1.frameCnt_ = 0
		arg_496_1.state_ = "playing"
		arg_496_1.curTalkId_ = 1104905119
		arg_496_1.duration_ = 5

		SetActive(arg_496_1.tipsGo_, false)

		function arg_496_1.onSingleLineFinish_()
			arg_496_1.onSingleLineUpdate_ = nil
			arg_496_1.onSingleLineFinish_ = nil
			arg_496_1.state_ = "waiting"
		end

		function arg_496_1.playNext_(arg_498_0)
			if arg_498_0 == 1 then
				arg_496_0:Play1104905120(arg_496_1)
			end
		end

		function arg_496_1.onSingleLineUpdate_(arg_499_0)
			local var_499_0 = 0
			local var_499_1 = 0.825

			if var_499_0 < arg_496_1.time_ and arg_496_1.time_ <= var_499_0 + arg_499_0 then
				arg_496_1.talkMaxDuration = 0
				arg_496_1.dialogCg_.alpha = 1

				arg_496_1.dialog_:SetActive(true)
				SetActive(arg_496_1.leftNameGo_, false)

				arg_496_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_496_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_496_1:RecordName(arg_496_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_496_1.iconTrs_.gameObject, false)
				arg_496_1.callingController_:SetSelectedState("normal")

				local var_499_2 = arg_496_1:GetWordFromCfg(1104905119)
				local var_499_3 = arg_496_1:FormatText(var_499_2.content)

				arg_496_1.text_.text = var_499_3

				LuaForUtil.ClearLinePrefixSymbol(arg_496_1.text_)

				local var_499_4 = 33
				local var_499_5 = utf8.len(var_499_3)
				local var_499_6 = var_499_4 <= 0 and var_499_1 or var_499_1 * (var_499_5 / var_499_4)

				if var_499_6 > 0 and var_499_1 < var_499_6 then
					arg_496_1.talkMaxDuration = var_499_6

					if var_499_6 + var_499_0 > arg_496_1.duration_ then
						arg_496_1.duration_ = var_499_6 + var_499_0
					end
				end

				arg_496_1.text_.text = var_499_3
				arg_496_1.typewritter.percent = 0

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(false)
				arg_496_1:RecordContent(arg_496_1.text_.text)
			end

			local var_499_7 = math.max(var_499_1, arg_496_1.talkMaxDuration)

			if var_499_0 <= arg_496_1.time_ and arg_496_1.time_ < var_499_0 + var_499_7 then
				arg_496_1.typewritter.percent = (arg_496_1.time_ - var_499_0) / var_499_7

				arg_496_1.typewritter:SetDirty()
			end

			if arg_496_1.time_ >= var_499_0 + var_499_7 and arg_496_1.time_ < var_499_0 + var_499_7 + arg_499_0 then
				arg_496_1.typewritter.percent = 1

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905120 = function(arg_500_0, arg_500_1)
		arg_500_1.time_ = 0
		arg_500_1.frameCnt_ = 0
		arg_500_1.state_ = "playing"
		arg_500_1.curTalkId_ = 1104905120
		arg_500_1.duration_ = 5

		SetActive(arg_500_1.tipsGo_, false)

		function arg_500_1.onSingleLineFinish_()
			arg_500_1.onSingleLineUpdate_ = nil
			arg_500_1.onSingleLineFinish_ = nil
			arg_500_1.state_ = "waiting"
		end

		function arg_500_1.playNext_(arg_502_0)
			if arg_502_0 == 1 then
				arg_500_0:Play1104905121(arg_500_1)
			end
		end

		function arg_500_1.onSingleLineUpdate_(arg_503_0)
			local var_503_0 = 0
			local var_503_1 = 0.175

			if var_503_0 < arg_500_1.time_ and arg_500_1.time_ <= var_503_0 + arg_503_0 then
				arg_500_1.talkMaxDuration = 0
				arg_500_1.dialogCg_.alpha = 1

				arg_500_1.dialog_:SetActive(true)
				SetActive(arg_500_1.leftNameGo_, true)

				local var_503_2 = arg_500_1:FormatText(StoryNameCfg[7].name)

				arg_500_1.leftNameTxt_.text = var_503_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_500_1.leftNameTxt_.transform)

				arg_500_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_500_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_500_1:RecordName(arg_500_1.leftNameTxt_.text)
				SetActive(arg_500_1.iconTrs_.gameObject, false)
				arg_500_1.callingController_:SetSelectedState("normal")

				local var_503_3 = arg_500_1:GetWordFromCfg(1104905120)
				local var_503_4 = arg_500_1:FormatText(var_503_3.content)

				arg_500_1.text_.text = var_503_4

				LuaForUtil.ClearLinePrefixSymbol(arg_500_1.text_)

				local var_503_5 = 7
				local var_503_6 = utf8.len(var_503_4)
				local var_503_7 = var_503_5 <= 0 and var_503_1 or var_503_1 * (var_503_6 / var_503_5)

				if var_503_7 > 0 and var_503_1 < var_503_7 then
					arg_500_1.talkMaxDuration = var_503_7

					if var_503_7 + var_503_0 > arg_500_1.duration_ then
						arg_500_1.duration_ = var_503_7 + var_503_0
					end
				end

				arg_500_1.text_.text = var_503_4
				arg_500_1.typewritter.percent = 0

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(false)
				arg_500_1:RecordContent(arg_500_1.text_.text)
			end

			local var_503_8 = math.max(var_503_1, arg_500_1.talkMaxDuration)

			if var_503_0 <= arg_500_1.time_ and arg_500_1.time_ < var_503_0 + var_503_8 then
				arg_500_1.typewritter.percent = (arg_500_1.time_ - var_503_0) / var_503_8

				arg_500_1.typewritter:SetDirty()
			end

			if arg_500_1.time_ >= var_503_0 + var_503_8 and arg_500_1.time_ < var_503_0 + var_503_8 + arg_503_0 then
				arg_500_1.typewritter.percent = 1

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905121 = function(arg_504_0, arg_504_1)
		arg_504_1.time_ = 0
		arg_504_1.frameCnt_ = 0
		arg_504_1.state_ = "playing"
		arg_504_1.curTalkId_ = 1104905121
		arg_504_1.duration_ = 5

		SetActive(arg_504_1.tipsGo_, false)

		function arg_504_1.onSingleLineFinish_()
			arg_504_1.onSingleLineUpdate_ = nil
			arg_504_1.onSingleLineFinish_ = nil
			arg_504_1.state_ = "waiting"
		end

		function arg_504_1.playNext_(arg_506_0)
			if arg_506_0 == 1 then
				arg_504_0:Play1104905122(arg_504_1)
			end
		end

		function arg_504_1.onSingleLineUpdate_(arg_507_0)
			local var_507_0 = 0
			local var_507_1 = 0.45

			if var_507_0 < arg_504_1.time_ and arg_504_1.time_ <= var_507_0 + arg_507_0 then
				arg_504_1.talkMaxDuration = 0
				arg_504_1.dialogCg_.alpha = 1

				arg_504_1.dialog_:SetActive(true)
				SetActive(arg_504_1.leftNameGo_, true)

				local var_507_2 = arg_504_1:FormatText(StoryNameCfg[7].name)

				arg_504_1.leftNameTxt_.text = var_507_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_504_1.leftNameTxt_.transform)

				arg_504_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_504_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_504_1:RecordName(arg_504_1.leftNameTxt_.text)
				SetActive(arg_504_1.iconTrs_.gameObject, false)
				arg_504_1.callingController_:SetSelectedState("normal")

				local var_507_3 = arg_504_1:GetWordFromCfg(1104905121)
				local var_507_4 = arg_504_1:FormatText(var_507_3.content)

				arg_504_1.text_.text = var_507_4

				LuaForUtil.ClearLinePrefixSymbol(arg_504_1.text_)

				local var_507_5 = 18
				local var_507_6 = utf8.len(var_507_4)
				local var_507_7 = var_507_5 <= 0 and var_507_1 or var_507_1 * (var_507_6 / var_507_5)

				if var_507_7 > 0 and var_507_1 < var_507_7 then
					arg_504_1.talkMaxDuration = var_507_7

					if var_507_7 + var_507_0 > arg_504_1.duration_ then
						arg_504_1.duration_ = var_507_7 + var_507_0
					end
				end

				arg_504_1.text_.text = var_507_4
				arg_504_1.typewritter.percent = 0

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(false)
				arg_504_1:RecordContent(arg_504_1.text_.text)
			end

			local var_507_8 = math.max(var_507_1, arg_504_1.talkMaxDuration)

			if var_507_0 <= arg_504_1.time_ and arg_504_1.time_ < var_507_0 + var_507_8 then
				arg_504_1.typewritter.percent = (arg_504_1.time_ - var_507_0) / var_507_8

				arg_504_1.typewritter:SetDirty()
			end

			if arg_504_1.time_ >= var_507_0 + var_507_8 and arg_504_1.time_ < var_507_0 + var_507_8 + arg_507_0 then
				arg_504_1.typewritter.percent = 1

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905122 = function(arg_508_0, arg_508_1)
		arg_508_1.time_ = 0
		arg_508_1.frameCnt_ = 0
		arg_508_1.state_ = "playing"
		arg_508_1.curTalkId_ = 1104905122
		arg_508_1.duration_ = 5

		SetActive(arg_508_1.tipsGo_, false)

		function arg_508_1.onSingleLineFinish_()
			arg_508_1.onSingleLineUpdate_ = nil
			arg_508_1.onSingleLineFinish_ = nil
			arg_508_1.state_ = "waiting"
		end

		function arg_508_1.playNext_(arg_510_0)
			if arg_510_0 == 1 then
				arg_508_0:Play1104905123(arg_508_1)
			end
		end

		function arg_508_1.onSingleLineUpdate_(arg_511_0)
			local var_511_0 = 0
			local var_511_1 = 0.65

			if var_511_0 < arg_508_1.time_ and arg_508_1.time_ <= var_511_0 + arg_511_0 then
				arg_508_1.talkMaxDuration = 0
				arg_508_1.dialogCg_.alpha = 1

				arg_508_1.dialog_:SetActive(true)
				SetActive(arg_508_1.leftNameGo_, false)

				arg_508_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_508_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_508_1:RecordName(arg_508_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_508_1.iconTrs_.gameObject, false)
				arg_508_1.callingController_:SetSelectedState("normal")

				local var_511_2 = arg_508_1:GetWordFromCfg(1104905122)
				local var_511_3 = arg_508_1:FormatText(var_511_2.content)

				arg_508_1.text_.text = var_511_3

				LuaForUtil.ClearLinePrefixSymbol(arg_508_1.text_)

				local var_511_4 = 34
				local var_511_5 = utf8.len(var_511_3)
				local var_511_6 = var_511_4 <= 0 and var_511_1 or var_511_1 * (var_511_5 / var_511_4)

				if var_511_6 > 0 and var_511_1 < var_511_6 then
					arg_508_1.talkMaxDuration = var_511_6

					if var_511_6 + var_511_0 > arg_508_1.duration_ then
						arg_508_1.duration_ = var_511_6 + var_511_0
					end
				end

				arg_508_1.text_.text = var_511_3
				arg_508_1.typewritter.percent = 0

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(false)
				arg_508_1:RecordContent(arg_508_1.text_.text)
			end

			local var_511_7 = math.max(var_511_1, arg_508_1.talkMaxDuration)

			if var_511_0 <= arg_508_1.time_ and arg_508_1.time_ < var_511_0 + var_511_7 then
				arg_508_1.typewritter.percent = (arg_508_1.time_ - var_511_0) / var_511_7

				arg_508_1.typewritter:SetDirty()
			end

			if arg_508_1.time_ >= var_511_0 + var_511_7 and arg_508_1.time_ < var_511_0 + var_511_7 + arg_511_0 then
				arg_508_1.typewritter.percent = 1

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905123 = function(arg_512_0, arg_512_1)
		arg_512_1.time_ = 0
		arg_512_1.frameCnt_ = 0
		arg_512_1.state_ = "playing"
		arg_512_1.curTalkId_ = 1104905123
		arg_512_1.duration_ = 4.37

		SetActive(arg_512_1.tipsGo_, false)

		function arg_512_1.onSingleLineFinish_()
			arg_512_1.onSingleLineUpdate_ = nil
			arg_512_1.onSingleLineFinish_ = nil
			arg_512_1.state_ = "waiting"
		end

		function arg_512_1.playNext_(arg_514_0)
			if arg_514_0 == 1 then
				arg_512_0:Play1104905124(arg_512_1)
			end
		end

		function arg_512_1.onSingleLineUpdate_(arg_515_0)
			local var_515_0 = arg_512_1.actors_["1049ui_story"].transform
			local var_515_1 = 0

			if var_515_1 < arg_512_1.time_ and arg_512_1.time_ <= var_515_1 + arg_515_0 then
				arg_512_1.var_.moveOldPos1049ui_story = var_515_0.localPosition
			end

			local var_515_2 = 0.001

			if var_515_1 <= arg_512_1.time_ and arg_512_1.time_ < var_515_1 + var_515_2 then
				local var_515_3 = (arg_512_1.time_ - var_515_1) / var_515_2
				local var_515_4 = Vector3.New(0, -1.2, -6)

				var_515_0.localPosition = Vector3.Lerp(arg_512_1.var_.moveOldPos1049ui_story, var_515_4, var_515_3)

				local var_515_5 = manager.ui.mainCamera.transform.position - var_515_0.position

				var_515_0.forward = Vector3.New(var_515_5.x, var_515_5.y, var_515_5.z)

				local var_515_6 = var_515_0.localEulerAngles

				var_515_6.z = 0
				var_515_6.x = 0
				var_515_0.localEulerAngles = var_515_6
			end

			if arg_512_1.time_ >= var_515_1 + var_515_2 and arg_512_1.time_ < var_515_1 + var_515_2 + arg_515_0 then
				var_515_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_515_7 = manager.ui.mainCamera.transform.position - var_515_0.position

				var_515_0.forward = Vector3.New(var_515_7.x, var_515_7.y, var_515_7.z)

				local var_515_8 = var_515_0.localEulerAngles

				var_515_8.z = 0
				var_515_8.x = 0
				var_515_0.localEulerAngles = var_515_8
			end

			local var_515_9 = arg_512_1.actors_["1049ui_story"]
			local var_515_10 = 0

			if var_515_10 < arg_512_1.time_ and arg_512_1.time_ <= var_515_10 + arg_515_0 and not isNil(var_515_9) and arg_512_1.var_.characterEffect1049ui_story == nil then
				arg_512_1.var_.characterEffect1049ui_story = var_515_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_515_11 = 0.200000002980232

			if var_515_10 <= arg_512_1.time_ and arg_512_1.time_ < var_515_10 + var_515_11 and not isNil(var_515_9) then
				local var_515_12 = (arg_512_1.time_ - var_515_10) / var_515_11

				if arg_512_1.var_.characterEffect1049ui_story and not isNil(var_515_9) then
					arg_512_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_512_1.time_ >= var_515_10 + var_515_11 and arg_512_1.time_ < var_515_10 + var_515_11 + arg_515_0 and not isNil(var_515_9) and arg_512_1.var_.characterEffect1049ui_story then
				arg_512_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_515_13 = 0

			if var_515_13 < arg_512_1.time_ and arg_512_1.time_ <= var_515_13 + arg_515_0 then
				arg_512_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_515_14 = 0

			if var_515_14 < arg_512_1.time_ and arg_512_1.time_ <= var_515_14 + arg_515_0 then
				arg_512_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_515_15 = 0
			local var_515_16 = 0.35

			if var_515_15 < arg_512_1.time_ and arg_512_1.time_ <= var_515_15 + arg_515_0 then
				arg_512_1.talkMaxDuration = 0
				arg_512_1.dialogCg_.alpha = 1

				arg_512_1.dialog_:SetActive(true)
				SetActive(arg_512_1.leftNameGo_, true)

				local var_515_17 = arg_512_1:FormatText(StoryNameCfg[551].name)

				arg_512_1.leftNameTxt_.text = var_515_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_512_1.leftNameTxt_.transform)

				arg_512_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_512_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_512_1:RecordName(arg_512_1.leftNameTxt_.text)
				SetActive(arg_512_1.iconTrs_.gameObject, false)
				arg_512_1.callingController_:SetSelectedState("normal")

				local var_515_18 = arg_512_1:GetWordFromCfg(1104905123)
				local var_515_19 = arg_512_1:FormatText(var_515_18.content)

				arg_512_1.text_.text = var_515_19

				LuaForUtil.ClearLinePrefixSymbol(arg_512_1.text_)

				local var_515_20 = 14
				local var_515_21 = utf8.len(var_515_19)
				local var_515_22 = var_515_20 <= 0 and var_515_16 or var_515_16 * (var_515_21 / var_515_20)

				if var_515_22 > 0 and var_515_16 < var_515_22 then
					arg_512_1.talkMaxDuration = var_515_22

					if var_515_22 + var_515_15 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_22 + var_515_15
					end
				end

				arg_512_1.text_.text = var_515_19
				arg_512_1.typewritter.percent = 0

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905123", "story_v_side_new_1104905.awb") ~= 0 then
					local var_515_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905123", "story_v_side_new_1104905.awb") / 1000

					if var_515_23 + var_515_15 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_23 + var_515_15
					end

					if var_515_18.prefab_name ~= "" and arg_512_1.actors_[var_515_18.prefab_name] ~= nil then
						local var_515_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_512_1.actors_[var_515_18.prefab_name].transform, "story_v_side_new_1104905", "1104905123", "story_v_side_new_1104905.awb")

						arg_512_1:RecordAudio("1104905123", var_515_24)
						arg_512_1:RecordAudio("1104905123", var_515_24)
					else
						arg_512_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905123", "story_v_side_new_1104905.awb")
					end

					arg_512_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905123", "story_v_side_new_1104905.awb")
				end

				arg_512_1:RecordContent(arg_512_1.text_.text)
			end

			local var_515_25 = math.max(var_515_16, arg_512_1.talkMaxDuration)

			if var_515_15 <= arg_512_1.time_ and arg_512_1.time_ < var_515_15 + var_515_25 then
				arg_512_1.typewritter.percent = (arg_512_1.time_ - var_515_15) / var_515_25

				arg_512_1.typewritter:SetDirty()
			end

			if arg_512_1.time_ >= var_515_15 + var_515_25 and arg_512_1.time_ < var_515_15 + var_515_25 + arg_515_0 then
				arg_512_1.typewritter.percent = 1

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905124 = function(arg_516_0, arg_516_1)
		arg_516_1.time_ = 0
		arg_516_1.frameCnt_ = 0
		arg_516_1.state_ = "playing"
		arg_516_1.curTalkId_ = 1104905124
		arg_516_1.duration_ = 9

		SetActive(arg_516_1.tipsGo_, false)

		function arg_516_1.onSingleLineFinish_()
			arg_516_1.onSingleLineUpdate_ = nil
			arg_516_1.onSingleLineFinish_ = nil
			arg_516_1.state_ = "waiting"
		end

		function arg_516_1.playNext_(arg_518_0)
			if arg_518_0 == 1 then
				arg_516_0:Play1104905125(arg_516_1)
			end
		end

		function arg_516_1.onSingleLineUpdate_(arg_519_0)
			local var_519_0 = 2

			if var_519_0 < arg_516_1.time_ and arg_516_1.time_ <= var_519_0 + arg_519_0 then
				local var_519_1 = manager.ui.mainCamera.transform.localPosition
				local var_519_2 = Vector3.New(0, 0, 10) + Vector3.New(var_519_1.x, var_519_1.y, 0)
				local var_519_3 = arg_516_1.bgs_.K10g

				var_519_3.transform.localPosition = var_519_2
				var_519_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_519_4 = var_519_3:GetComponent("SpriteRenderer")

				if var_519_4 and var_519_4.sprite then
					local var_519_5 = (var_519_3.transform.localPosition - var_519_1).z
					local var_519_6 = manager.ui.mainCameraCom_
					local var_519_7 = 2 * var_519_5 * Mathf.Tan(var_519_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_519_8 = var_519_7 * var_519_6.aspect
					local var_519_9 = var_519_4.sprite.bounds.size.x
					local var_519_10 = var_519_4.sprite.bounds.size.y
					local var_519_11 = var_519_8 / var_519_9
					local var_519_12 = var_519_7 / var_519_10
					local var_519_13 = var_519_12 < var_519_11 and var_519_11 or var_519_12

					var_519_3.transform.localScale = Vector3.New(var_519_13, var_519_13, 0)
				end

				for iter_519_0, iter_519_1 in pairs(arg_516_1.bgs_) do
					if iter_519_0 ~= "K10g" then
						iter_519_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_519_14 = 4

			if var_519_14 < arg_516_1.time_ and arg_516_1.time_ <= var_519_14 + arg_519_0 then
				arg_516_1.allBtn_.enabled = false
			end

			local var_519_15 = 0.3

			if arg_516_1.time_ >= var_519_14 + var_519_15 and arg_516_1.time_ < var_519_14 + var_519_15 + arg_519_0 then
				arg_516_1.allBtn_.enabled = true
			end

			local var_519_16 = 0

			if var_519_16 < arg_516_1.time_ and arg_516_1.time_ <= var_519_16 + arg_519_0 then
				arg_516_1.mask_.enabled = true
				arg_516_1.mask_.raycastTarget = true

				arg_516_1:SetGaussion(false)
			end

			local var_519_17 = 2

			if var_519_16 <= arg_516_1.time_ and arg_516_1.time_ < var_519_16 + var_519_17 then
				local var_519_18 = (arg_516_1.time_ - var_519_16) / var_519_17
				local var_519_19 = Color.New(0, 0, 0)

				var_519_19.a = Mathf.Lerp(0, 1, var_519_18)
				arg_516_1.mask_.color = var_519_19
			end

			if arg_516_1.time_ >= var_519_16 + var_519_17 and arg_516_1.time_ < var_519_16 + var_519_17 + arg_519_0 then
				local var_519_20 = Color.New(0, 0, 0)

				var_519_20.a = 1
				arg_516_1.mask_.color = var_519_20
			end

			local var_519_21 = 2

			if var_519_21 < arg_516_1.time_ and arg_516_1.time_ <= var_519_21 + arg_519_0 then
				arg_516_1.mask_.enabled = true
				arg_516_1.mask_.raycastTarget = true

				arg_516_1:SetGaussion(false)
			end

			local var_519_22 = 2

			if var_519_21 <= arg_516_1.time_ and arg_516_1.time_ < var_519_21 + var_519_22 then
				local var_519_23 = (arg_516_1.time_ - var_519_21) / var_519_22
				local var_519_24 = Color.New(0, 0, 0)

				var_519_24.a = Mathf.Lerp(1, 0, var_519_23)
				arg_516_1.mask_.color = var_519_24
			end

			if arg_516_1.time_ >= var_519_21 + var_519_22 and arg_516_1.time_ < var_519_21 + var_519_22 + arg_519_0 then
				local var_519_25 = Color.New(0, 0, 0)
				local var_519_26 = 0

				arg_516_1.mask_.enabled = false
				var_519_25.a = var_519_26
				arg_516_1.mask_.color = var_519_25
			end

			local var_519_27 = arg_516_1.actors_["1049ui_story"].transform
			local var_519_28 = 1.96599999815226

			if var_519_28 < arg_516_1.time_ and arg_516_1.time_ <= var_519_28 + arg_519_0 then
				arg_516_1.var_.moveOldPos1049ui_story = var_519_27.localPosition
			end

			local var_519_29 = 0.001

			if var_519_28 <= arg_516_1.time_ and arg_516_1.time_ < var_519_28 + var_519_29 then
				local var_519_30 = (arg_516_1.time_ - var_519_28) / var_519_29
				local var_519_31 = Vector3.New(0, 100, 0)

				var_519_27.localPosition = Vector3.Lerp(arg_516_1.var_.moveOldPos1049ui_story, var_519_31, var_519_30)

				local var_519_32 = manager.ui.mainCamera.transform.position - var_519_27.position

				var_519_27.forward = Vector3.New(var_519_32.x, var_519_32.y, var_519_32.z)

				local var_519_33 = var_519_27.localEulerAngles

				var_519_33.z = 0
				var_519_33.x = 0
				var_519_27.localEulerAngles = var_519_33
			end

			if arg_516_1.time_ >= var_519_28 + var_519_29 and arg_516_1.time_ < var_519_28 + var_519_29 + arg_519_0 then
				var_519_27.localPosition = Vector3.New(0, 100, 0)

				local var_519_34 = manager.ui.mainCamera.transform.position - var_519_27.position

				var_519_27.forward = Vector3.New(var_519_34.x, var_519_34.y, var_519_34.z)

				local var_519_35 = var_519_27.localEulerAngles

				var_519_35.z = 0
				var_519_35.x = 0
				var_519_27.localEulerAngles = var_519_35
			end

			local var_519_36 = arg_516_1.actors_["1049ui_story"]
			local var_519_37 = 1.96599999815226

			if var_519_37 < arg_516_1.time_ and arg_516_1.time_ <= var_519_37 + arg_519_0 and not isNil(var_519_36) and arg_516_1.var_.characterEffect1049ui_story == nil then
				arg_516_1.var_.characterEffect1049ui_story = var_519_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_519_38 = 0.034000001847744

			if var_519_37 <= arg_516_1.time_ and arg_516_1.time_ < var_519_37 + var_519_38 and not isNil(var_519_36) then
				local var_519_39 = (arg_516_1.time_ - var_519_37) / var_519_38

				if arg_516_1.var_.characterEffect1049ui_story and not isNil(var_519_36) then
					local var_519_40 = Mathf.Lerp(0, 0.5, var_519_39)

					arg_516_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_516_1.var_.characterEffect1049ui_story.fillRatio = var_519_40
				end
			end

			if arg_516_1.time_ >= var_519_37 + var_519_38 and arg_516_1.time_ < var_519_37 + var_519_38 + arg_519_0 and not isNil(var_519_36) and arg_516_1.var_.characterEffect1049ui_story then
				local var_519_41 = 0.5

				arg_516_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_516_1.var_.characterEffect1049ui_story.fillRatio = var_519_41
			end

			if arg_516_1.frameCnt_ <= 1 then
				arg_516_1.dialog_:SetActive(false)
			end

			local var_519_42 = 4
			local var_519_43 = 0.225

			if var_519_42 < arg_516_1.time_ and arg_516_1.time_ <= var_519_42 + arg_519_0 then
				arg_516_1.talkMaxDuration = 0

				arg_516_1.dialog_:SetActive(true)

				local var_519_44 = LeanTween.value(arg_516_1.dialog_, 0, 1, 0.3)

				var_519_44:setOnUpdate(LuaHelper.FloatAction(function(arg_520_0)
					arg_516_1.dialogCg_.alpha = arg_520_0
				end))
				var_519_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_516_1.dialog_)
					var_519_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_516_1.duration_ = arg_516_1.duration_ + 0.3

				SetActive(arg_516_1.leftNameGo_, true)

				local var_519_45 = arg_516_1:FormatText(StoryNameCfg[7].name)

				arg_516_1.leftNameTxt_.text = var_519_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_516_1.leftNameTxt_.transform)

				arg_516_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_516_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_516_1:RecordName(arg_516_1.leftNameTxt_.text)
				SetActive(arg_516_1.iconTrs_.gameObject, false)
				arg_516_1.callingController_:SetSelectedState("normal")

				local var_519_46 = arg_516_1:GetWordFromCfg(1104905124)
				local var_519_47 = arg_516_1:FormatText(var_519_46.content)

				arg_516_1.text_.text = var_519_47

				LuaForUtil.ClearLinePrefixSymbol(arg_516_1.text_)

				local var_519_48 = 9
				local var_519_49 = utf8.len(var_519_47)
				local var_519_50 = var_519_48 <= 0 and var_519_43 or var_519_43 * (var_519_49 / var_519_48)

				if var_519_50 > 0 and var_519_43 < var_519_50 then
					arg_516_1.talkMaxDuration = var_519_50
					var_519_42 = var_519_42 + 0.3

					if var_519_50 + var_519_42 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_50 + var_519_42
					end
				end

				arg_516_1.text_.text = var_519_47
				arg_516_1.typewritter.percent = 0

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(false)
				arg_516_1:RecordContent(arg_516_1.text_.text)
			end

			local var_519_51 = var_519_42 + 0.3
			local var_519_52 = math.max(var_519_43, arg_516_1.talkMaxDuration)

			if var_519_51 <= arg_516_1.time_ and arg_516_1.time_ < var_519_51 + var_519_52 then
				arg_516_1.typewritter.percent = (arg_516_1.time_ - var_519_51) / var_519_52

				arg_516_1.typewritter:SetDirty()
			end

			if arg_516_1.time_ >= var_519_51 + var_519_52 and arg_516_1.time_ < var_519_51 + var_519_52 + arg_519_0 then
				arg_516_1.typewritter.percent = 1

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905125 = function(arg_522_0, arg_522_1)
		arg_522_1.time_ = 0
		arg_522_1.frameCnt_ = 0
		arg_522_1.state_ = "playing"
		arg_522_1.curTalkId_ = 1104905125
		arg_522_1.duration_ = 4.03

		SetActive(arg_522_1.tipsGo_, false)

		function arg_522_1.onSingleLineFinish_()
			arg_522_1.onSingleLineUpdate_ = nil
			arg_522_1.onSingleLineFinish_ = nil
			arg_522_1.state_ = "waiting"
		end

		function arg_522_1.playNext_(arg_524_0)
			if arg_524_0 == 1 then
				arg_522_0:Play1104905126(arg_522_1)
			end
		end

		function arg_522_1.onSingleLineUpdate_(arg_525_0)
			local var_525_0 = arg_522_1.actors_["1049ui_story"].transform
			local var_525_1 = 0

			if var_525_1 < arg_522_1.time_ and arg_522_1.time_ <= var_525_1 + arg_525_0 then
				arg_522_1.var_.moveOldPos1049ui_story = var_525_0.localPosition
			end

			local var_525_2 = 0.001

			if var_525_1 <= arg_522_1.time_ and arg_522_1.time_ < var_525_1 + var_525_2 then
				local var_525_3 = (arg_522_1.time_ - var_525_1) / var_525_2
				local var_525_4 = Vector3.New(0, -1.2, -6)

				var_525_0.localPosition = Vector3.Lerp(arg_522_1.var_.moveOldPos1049ui_story, var_525_4, var_525_3)

				local var_525_5 = manager.ui.mainCamera.transform.position - var_525_0.position

				var_525_0.forward = Vector3.New(var_525_5.x, var_525_5.y, var_525_5.z)

				local var_525_6 = var_525_0.localEulerAngles

				var_525_6.z = 0
				var_525_6.x = 0
				var_525_0.localEulerAngles = var_525_6
			end

			if arg_522_1.time_ >= var_525_1 + var_525_2 and arg_522_1.time_ < var_525_1 + var_525_2 + arg_525_0 then
				var_525_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_525_7 = manager.ui.mainCamera.transform.position - var_525_0.position

				var_525_0.forward = Vector3.New(var_525_7.x, var_525_7.y, var_525_7.z)

				local var_525_8 = var_525_0.localEulerAngles

				var_525_8.z = 0
				var_525_8.x = 0
				var_525_0.localEulerAngles = var_525_8
			end

			local var_525_9 = arg_522_1.actors_["1049ui_story"]
			local var_525_10 = 0

			if var_525_10 < arg_522_1.time_ and arg_522_1.time_ <= var_525_10 + arg_525_0 and not isNil(var_525_9) and arg_522_1.var_.characterEffect1049ui_story == nil then
				arg_522_1.var_.characterEffect1049ui_story = var_525_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_525_11 = 0.200000002980232

			if var_525_10 <= arg_522_1.time_ and arg_522_1.time_ < var_525_10 + var_525_11 and not isNil(var_525_9) then
				local var_525_12 = (arg_522_1.time_ - var_525_10) / var_525_11

				if arg_522_1.var_.characterEffect1049ui_story and not isNil(var_525_9) then
					arg_522_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_522_1.time_ >= var_525_10 + var_525_11 and arg_522_1.time_ < var_525_10 + var_525_11 + arg_525_0 and not isNil(var_525_9) and arg_522_1.var_.characterEffect1049ui_story then
				arg_522_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_525_13 = 0

			if var_525_13 < arg_522_1.time_ and arg_522_1.time_ <= var_525_13 + arg_525_0 then
				arg_522_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_525_14 = 0

			if var_525_14 < arg_522_1.time_ and arg_522_1.time_ <= var_525_14 + arg_525_0 then
				arg_522_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_525_15 = 0
			local var_525_16 = 0.375

			if var_525_15 < arg_522_1.time_ and arg_522_1.time_ <= var_525_15 + arg_525_0 then
				arg_522_1.talkMaxDuration = 0
				arg_522_1.dialogCg_.alpha = 1

				arg_522_1.dialog_:SetActive(true)
				SetActive(arg_522_1.leftNameGo_, true)

				local var_525_17 = arg_522_1:FormatText(StoryNameCfg[551].name)

				arg_522_1.leftNameTxt_.text = var_525_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_522_1.leftNameTxt_.transform)

				arg_522_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_522_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_522_1:RecordName(arg_522_1.leftNameTxt_.text)
				SetActive(arg_522_1.iconTrs_.gameObject, false)
				arg_522_1.callingController_:SetSelectedState("normal")

				local var_525_18 = arg_522_1:GetWordFromCfg(1104905125)
				local var_525_19 = arg_522_1:FormatText(var_525_18.content)

				arg_522_1.text_.text = var_525_19

				LuaForUtil.ClearLinePrefixSymbol(arg_522_1.text_)

				local var_525_20 = 15
				local var_525_21 = utf8.len(var_525_19)
				local var_525_22 = var_525_20 <= 0 and var_525_16 or var_525_16 * (var_525_21 / var_525_20)

				if var_525_22 > 0 and var_525_16 < var_525_22 then
					arg_522_1.talkMaxDuration = var_525_22

					if var_525_22 + var_525_15 > arg_522_1.duration_ then
						arg_522_1.duration_ = var_525_22 + var_525_15
					end
				end

				arg_522_1.text_.text = var_525_19
				arg_522_1.typewritter.percent = 0

				arg_522_1.typewritter:SetDirty()
				arg_522_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905125", "story_v_side_new_1104905.awb") ~= 0 then
					local var_525_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905125", "story_v_side_new_1104905.awb") / 1000

					if var_525_23 + var_525_15 > arg_522_1.duration_ then
						arg_522_1.duration_ = var_525_23 + var_525_15
					end

					if var_525_18.prefab_name ~= "" and arg_522_1.actors_[var_525_18.prefab_name] ~= nil then
						local var_525_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_522_1.actors_[var_525_18.prefab_name].transform, "story_v_side_new_1104905", "1104905125", "story_v_side_new_1104905.awb")

						arg_522_1:RecordAudio("1104905125", var_525_24)
						arg_522_1:RecordAudio("1104905125", var_525_24)
					else
						arg_522_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905125", "story_v_side_new_1104905.awb")
					end

					arg_522_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905125", "story_v_side_new_1104905.awb")
				end

				arg_522_1:RecordContent(arg_522_1.text_.text)
			end

			local var_525_25 = math.max(var_525_16, arg_522_1.talkMaxDuration)

			if var_525_15 <= arg_522_1.time_ and arg_522_1.time_ < var_525_15 + var_525_25 then
				arg_522_1.typewritter.percent = (arg_522_1.time_ - var_525_15) / var_525_25

				arg_522_1.typewritter:SetDirty()
			end

			if arg_522_1.time_ >= var_525_15 + var_525_25 and arg_522_1.time_ < var_525_15 + var_525_25 + arg_525_0 then
				arg_522_1.typewritter.percent = 1

				arg_522_1.typewritter:SetDirty()
				arg_522_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905126 = function(arg_526_0, arg_526_1)
		arg_526_1.time_ = 0
		arg_526_1.frameCnt_ = 0
		arg_526_1.state_ = "playing"
		arg_526_1.curTalkId_ = 1104905126
		arg_526_1.duration_ = 5

		SetActive(arg_526_1.tipsGo_, false)

		function arg_526_1.onSingleLineFinish_()
			arg_526_1.onSingleLineUpdate_ = nil
			arg_526_1.onSingleLineFinish_ = nil
			arg_526_1.state_ = "waiting"
		end

		function arg_526_1.playNext_(arg_528_0)
			if arg_528_0 == 1 then
				arg_526_0:Play1104905127(arg_526_1)
			end
		end

		function arg_526_1.onSingleLineUpdate_(arg_529_0)
			local var_529_0 = arg_526_1.actors_["1049ui_story"].transform
			local var_529_1 = 0

			if var_529_1 < arg_526_1.time_ and arg_526_1.time_ <= var_529_1 + arg_529_0 then
				arg_526_1.var_.moveOldPos1049ui_story = var_529_0.localPosition
			end

			local var_529_2 = 0.001

			if var_529_1 <= arg_526_1.time_ and arg_526_1.time_ < var_529_1 + var_529_2 then
				local var_529_3 = (arg_526_1.time_ - var_529_1) / var_529_2
				local var_529_4 = Vector3.New(0, 100, 0)

				var_529_0.localPosition = Vector3.Lerp(arg_526_1.var_.moveOldPos1049ui_story, var_529_4, var_529_3)

				local var_529_5 = manager.ui.mainCamera.transform.position - var_529_0.position

				var_529_0.forward = Vector3.New(var_529_5.x, var_529_5.y, var_529_5.z)

				local var_529_6 = var_529_0.localEulerAngles

				var_529_6.z = 0
				var_529_6.x = 0
				var_529_0.localEulerAngles = var_529_6
			end

			if arg_526_1.time_ >= var_529_1 + var_529_2 and arg_526_1.time_ < var_529_1 + var_529_2 + arg_529_0 then
				var_529_0.localPosition = Vector3.New(0, 100, 0)

				local var_529_7 = manager.ui.mainCamera.transform.position - var_529_0.position

				var_529_0.forward = Vector3.New(var_529_7.x, var_529_7.y, var_529_7.z)

				local var_529_8 = var_529_0.localEulerAngles

				var_529_8.z = 0
				var_529_8.x = 0
				var_529_0.localEulerAngles = var_529_8
			end

			local var_529_9 = arg_526_1.actors_["1049ui_story"]
			local var_529_10 = 0

			if var_529_10 < arg_526_1.time_ and arg_526_1.time_ <= var_529_10 + arg_529_0 and not isNil(var_529_9) and arg_526_1.var_.characterEffect1049ui_story == nil then
				arg_526_1.var_.characterEffect1049ui_story = var_529_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_529_11 = 0.200000002980232

			if var_529_10 <= arg_526_1.time_ and arg_526_1.time_ < var_529_10 + var_529_11 and not isNil(var_529_9) then
				local var_529_12 = (arg_526_1.time_ - var_529_10) / var_529_11

				if arg_526_1.var_.characterEffect1049ui_story and not isNil(var_529_9) then
					local var_529_13 = Mathf.Lerp(0, 0.5, var_529_12)

					arg_526_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_526_1.var_.characterEffect1049ui_story.fillRatio = var_529_13
				end
			end

			if arg_526_1.time_ >= var_529_10 + var_529_11 and arg_526_1.time_ < var_529_10 + var_529_11 + arg_529_0 and not isNil(var_529_9) and arg_526_1.var_.characterEffect1049ui_story then
				local var_529_14 = 0.5

				arg_526_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_526_1.var_.characterEffect1049ui_story.fillRatio = var_529_14
			end

			local var_529_15 = 0
			local var_529_16 = 0.6

			if var_529_15 < arg_526_1.time_ and arg_526_1.time_ <= var_529_15 + arg_529_0 then
				arg_526_1.talkMaxDuration = 0
				arg_526_1.dialogCg_.alpha = 1

				arg_526_1.dialog_:SetActive(true)
				SetActive(arg_526_1.leftNameGo_, false)

				arg_526_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_526_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_526_1:RecordName(arg_526_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_526_1.iconTrs_.gameObject, false)
				arg_526_1.callingController_:SetSelectedState("normal")

				local var_529_17 = arg_526_1:GetWordFromCfg(1104905126)
				local var_529_18 = arg_526_1:FormatText(var_529_17.content)

				arg_526_1.text_.text = var_529_18

				LuaForUtil.ClearLinePrefixSymbol(arg_526_1.text_)

				local var_529_19 = 24
				local var_529_20 = utf8.len(var_529_18)
				local var_529_21 = var_529_19 <= 0 and var_529_16 or var_529_16 * (var_529_20 / var_529_19)

				if var_529_21 > 0 and var_529_16 < var_529_21 then
					arg_526_1.talkMaxDuration = var_529_21

					if var_529_21 + var_529_15 > arg_526_1.duration_ then
						arg_526_1.duration_ = var_529_21 + var_529_15
					end
				end

				arg_526_1.text_.text = var_529_18
				arg_526_1.typewritter.percent = 0

				arg_526_1.typewritter:SetDirty()
				arg_526_1:ShowNextGo(false)
				arg_526_1:RecordContent(arg_526_1.text_.text)
			end

			local var_529_22 = math.max(var_529_16, arg_526_1.talkMaxDuration)

			if var_529_15 <= arg_526_1.time_ and arg_526_1.time_ < var_529_15 + var_529_22 then
				arg_526_1.typewritter.percent = (arg_526_1.time_ - var_529_15) / var_529_22

				arg_526_1.typewritter:SetDirty()
			end

			if arg_526_1.time_ >= var_529_15 + var_529_22 and arg_526_1.time_ < var_529_15 + var_529_22 + arg_529_0 then
				arg_526_1.typewritter.percent = 1

				arg_526_1.typewritter:SetDirty()
				arg_526_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905127 = function(arg_530_0, arg_530_1)
		arg_530_1.time_ = 0
		arg_530_1.frameCnt_ = 0
		arg_530_1.state_ = "playing"
		arg_530_1.curTalkId_ = 1104905127
		arg_530_1.duration_ = 12.2

		SetActive(arg_530_1.tipsGo_, false)

		function arg_530_1.onSingleLineFinish_()
			arg_530_1.onSingleLineUpdate_ = nil
			arg_530_1.onSingleLineFinish_ = nil
			arg_530_1.state_ = "waiting"
		end

		function arg_530_1.playNext_(arg_532_0)
			if arg_532_0 == 1 then
				arg_530_0:Play1104905128(arg_530_1)
			end
		end

		function arg_530_1.onSingleLineUpdate_(arg_533_0)
			local var_533_0 = arg_530_1.actors_["1049ui_story"].transform
			local var_533_1 = 0

			if var_533_1 < arg_530_1.time_ and arg_530_1.time_ <= var_533_1 + arg_533_0 then
				arg_530_1.var_.moveOldPos1049ui_story = var_533_0.localPosition
			end

			local var_533_2 = 0.001

			if var_533_1 <= arg_530_1.time_ and arg_530_1.time_ < var_533_1 + var_533_2 then
				local var_533_3 = (arg_530_1.time_ - var_533_1) / var_533_2
				local var_533_4 = Vector3.New(0, -1.2, -6)

				var_533_0.localPosition = Vector3.Lerp(arg_530_1.var_.moveOldPos1049ui_story, var_533_4, var_533_3)

				local var_533_5 = manager.ui.mainCamera.transform.position - var_533_0.position

				var_533_0.forward = Vector3.New(var_533_5.x, var_533_5.y, var_533_5.z)

				local var_533_6 = var_533_0.localEulerAngles

				var_533_6.z = 0
				var_533_6.x = 0
				var_533_0.localEulerAngles = var_533_6
			end

			if arg_530_1.time_ >= var_533_1 + var_533_2 and arg_530_1.time_ < var_533_1 + var_533_2 + arg_533_0 then
				var_533_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_533_7 = manager.ui.mainCamera.transform.position - var_533_0.position

				var_533_0.forward = Vector3.New(var_533_7.x, var_533_7.y, var_533_7.z)

				local var_533_8 = var_533_0.localEulerAngles

				var_533_8.z = 0
				var_533_8.x = 0
				var_533_0.localEulerAngles = var_533_8
			end

			local var_533_9 = arg_530_1.actors_["1049ui_story"]
			local var_533_10 = 0

			if var_533_10 < arg_530_1.time_ and arg_530_1.time_ <= var_533_10 + arg_533_0 and not isNil(var_533_9) and arg_530_1.var_.characterEffect1049ui_story == nil then
				arg_530_1.var_.characterEffect1049ui_story = var_533_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_533_11 = 0.200000002980232

			if var_533_10 <= arg_530_1.time_ and arg_530_1.time_ < var_533_10 + var_533_11 and not isNil(var_533_9) then
				local var_533_12 = (arg_530_1.time_ - var_533_10) / var_533_11

				if arg_530_1.var_.characterEffect1049ui_story and not isNil(var_533_9) then
					arg_530_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_530_1.time_ >= var_533_10 + var_533_11 and arg_530_1.time_ < var_533_10 + var_533_11 + arg_533_0 and not isNil(var_533_9) and arg_530_1.var_.characterEffect1049ui_story then
				arg_530_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_533_13 = 0

			if var_533_13 < arg_530_1.time_ and arg_530_1.time_ <= var_533_13 + arg_533_0 then
				arg_530_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_533_14 = 0

			if var_533_14 < arg_530_1.time_ and arg_530_1.time_ <= var_533_14 + arg_533_0 then
				arg_530_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_533_15 = 0
			local var_533_16 = 1

			if var_533_15 < arg_530_1.time_ and arg_530_1.time_ <= var_533_15 + arg_533_0 then
				arg_530_1.talkMaxDuration = 0
				arg_530_1.dialogCg_.alpha = 1

				arg_530_1.dialog_:SetActive(true)
				SetActive(arg_530_1.leftNameGo_, true)

				local var_533_17 = arg_530_1:FormatText(StoryNameCfg[551].name)

				arg_530_1.leftNameTxt_.text = var_533_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_530_1.leftNameTxt_.transform)

				arg_530_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_530_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_530_1:RecordName(arg_530_1.leftNameTxt_.text)
				SetActive(arg_530_1.iconTrs_.gameObject, false)
				arg_530_1.callingController_:SetSelectedState("normal")

				local var_533_18 = arg_530_1:GetWordFromCfg(1104905127)
				local var_533_19 = arg_530_1:FormatText(var_533_18.content)

				arg_530_1.text_.text = var_533_19

				LuaForUtil.ClearLinePrefixSymbol(arg_530_1.text_)

				local var_533_20 = 40
				local var_533_21 = utf8.len(var_533_19)
				local var_533_22 = var_533_20 <= 0 and var_533_16 or var_533_16 * (var_533_21 / var_533_20)

				if var_533_22 > 0 and var_533_16 < var_533_22 then
					arg_530_1.talkMaxDuration = var_533_22

					if var_533_22 + var_533_15 > arg_530_1.duration_ then
						arg_530_1.duration_ = var_533_22 + var_533_15
					end
				end

				arg_530_1.text_.text = var_533_19
				arg_530_1.typewritter.percent = 0

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905127", "story_v_side_new_1104905.awb") ~= 0 then
					local var_533_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905127", "story_v_side_new_1104905.awb") / 1000

					if var_533_23 + var_533_15 > arg_530_1.duration_ then
						arg_530_1.duration_ = var_533_23 + var_533_15
					end

					if var_533_18.prefab_name ~= "" and arg_530_1.actors_[var_533_18.prefab_name] ~= nil then
						local var_533_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_530_1.actors_[var_533_18.prefab_name].transform, "story_v_side_new_1104905", "1104905127", "story_v_side_new_1104905.awb")

						arg_530_1:RecordAudio("1104905127", var_533_24)
						arg_530_1:RecordAudio("1104905127", var_533_24)
					else
						arg_530_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905127", "story_v_side_new_1104905.awb")
					end

					arg_530_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905127", "story_v_side_new_1104905.awb")
				end

				arg_530_1:RecordContent(arg_530_1.text_.text)
			end

			local var_533_25 = math.max(var_533_16, arg_530_1.talkMaxDuration)

			if var_533_15 <= arg_530_1.time_ and arg_530_1.time_ < var_533_15 + var_533_25 then
				arg_530_1.typewritter.percent = (arg_530_1.time_ - var_533_15) / var_533_25

				arg_530_1.typewritter:SetDirty()
			end

			if arg_530_1.time_ >= var_533_15 + var_533_25 and arg_530_1.time_ < var_533_15 + var_533_25 + arg_533_0 then
				arg_530_1.typewritter.percent = 1

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905128 = function(arg_534_0, arg_534_1)
		arg_534_1.time_ = 0
		arg_534_1.frameCnt_ = 0
		arg_534_1.state_ = "playing"
		arg_534_1.curTalkId_ = 1104905128
		arg_534_1.duration_ = 10.6

		SetActive(arg_534_1.tipsGo_, false)

		function arg_534_1.onSingleLineFinish_()
			arg_534_1.onSingleLineUpdate_ = nil
			arg_534_1.onSingleLineFinish_ = nil
			arg_534_1.state_ = "waiting"
		end

		function arg_534_1.playNext_(arg_536_0)
			if arg_536_0 == 1 then
				arg_534_0:Play1104905129(arg_534_1)
			end
		end

		function arg_534_1.onSingleLineUpdate_(arg_537_0)
			local var_537_0 = 0

			if var_537_0 < arg_534_1.time_ and arg_534_1.time_ <= var_537_0 + arg_537_0 then
				arg_534_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_537_1 = 0

			if var_537_1 < arg_534_1.time_ and arg_534_1.time_ <= var_537_1 + arg_537_0 then
				arg_534_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_537_2 = 0
			local var_537_3 = 1

			if var_537_2 < arg_534_1.time_ and arg_534_1.time_ <= var_537_2 + arg_537_0 then
				arg_534_1.talkMaxDuration = 0
				arg_534_1.dialogCg_.alpha = 1

				arg_534_1.dialog_:SetActive(true)
				SetActive(arg_534_1.leftNameGo_, true)

				local var_537_4 = arg_534_1:FormatText(StoryNameCfg[551].name)

				arg_534_1.leftNameTxt_.text = var_537_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_534_1.leftNameTxt_.transform)

				arg_534_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_534_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_534_1:RecordName(arg_534_1.leftNameTxt_.text)
				SetActive(arg_534_1.iconTrs_.gameObject, false)
				arg_534_1.callingController_:SetSelectedState("normal")

				local var_537_5 = arg_534_1:GetWordFromCfg(1104905128)
				local var_537_6 = arg_534_1:FormatText(var_537_5.content)

				arg_534_1.text_.text = var_537_6

				LuaForUtil.ClearLinePrefixSymbol(arg_534_1.text_)

				local var_537_7 = 40
				local var_537_8 = utf8.len(var_537_6)
				local var_537_9 = var_537_7 <= 0 and var_537_3 or var_537_3 * (var_537_8 / var_537_7)

				if var_537_9 > 0 and var_537_3 < var_537_9 then
					arg_534_1.talkMaxDuration = var_537_9

					if var_537_9 + var_537_2 > arg_534_1.duration_ then
						arg_534_1.duration_ = var_537_9 + var_537_2
					end
				end

				arg_534_1.text_.text = var_537_6
				arg_534_1.typewritter.percent = 0

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905128", "story_v_side_new_1104905.awb") ~= 0 then
					local var_537_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905128", "story_v_side_new_1104905.awb") / 1000

					if var_537_10 + var_537_2 > arg_534_1.duration_ then
						arg_534_1.duration_ = var_537_10 + var_537_2
					end

					if var_537_5.prefab_name ~= "" and arg_534_1.actors_[var_537_5.prefab_name] ~= nil then
						local var_537_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_534_1.actors_[var_537_5.prefab_name].transform, "story_v_side_new_1104905", "1104905128", "story_v_side_new_1104905.awb")

						arg_534_1:RecordAudio("1104905128", var_537_11)
						arg_534_1:RecordAudio("1104905128", var_537_11)
					else
						arg_534_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905128", "story_v_side_new_1104905.awb")
					end

					arg_534_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905128", "story_v_side_new_1104905.awb")
				end

				arg_534_1:RecordContent(arg_534_1.text_.text)
			end

			local var_537_12 = math.max(var_537_3, arg_534_1.talkMaxDuration)

			if var_537_2 <= arg_534_1.time_ and arg_534_1.time_ < var_537_2 + var_537_12 then
				arg_534_1.typewritter.percent = (arg_534_1.time_ - var_537_2) / var_537_12

				arg_534_1.typewritter:SetDirty()
			end

			if arg_534_1.time_ >= var_537_2 + var_537_12 and arg_534_1.time_ < var_537_2 + var_537_12 + arg_537_0 then
				arg_534_1.typewritter.percent = 1

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905129 = function(arg_538_0, arg_538_1)
		arg_538_1.time_ = 0
		arg_538_1.frameCnt_ = 0
		arg_538_1.state_ = "playing"
		arg_538_1.curTalkId_ = 1104905129
		arg_538_1.duration_ = 5

		SetActive(arg_538_1.tipsGo_, false)

		function arg_538_1.onSingleLineFinish_()
			arg_538_1.onSingleLineUpdate_ = nil
			arg_538_1.onSingleLineFinish_ = nil
			arg_538_1.state_ = "waiting"
		end

		function arg_538_1.playNext_(arg_540_0)
			if arg_540_0 == 1 then
				arg_538_0:Play1104905130(arg_538_1)
			end
		end

		function arg_538_1.onSingleLineUpdate_(arg_541_0)
			local var_541_0 = arg_538_1.actors_["1049ui_story"]
			local var_541_1 = 0

			if var_541_1 < arg_538_1.time_ and arg_538_1.time_ <= var_541_1 + arg_541_0 and not isNil(var_541_0) and arg_538_1.var_.characterEffect1049ui_story == nil then
				arg_538_1.var_.characterEffect1049ui_story = var_541_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_541_2 = 0.200000002980232

			if var_541_1 <= arg_538_1.time_ and arg_538_1.time_ < var_541_1 + var_541_2 and not isNil(var_541_0) then
				local var_541_3 = (arg_538_1.time_ - var_541_1) / var_541_2

				if arg_538_1.var_.characterEffect1049ui_story and not isNil(var_541_0) then
					local var_541_4 = Mathf.Lerp(0, 0.5, var_541_3)

					arg_538_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_538_1.var_.characterEffect1049ui_story.fillRatio = var_541_4
				end
			end

			if arg_538_1.time_ >= var_541_1 + var_541_2 and arg_538_1.time_ < var_541_1 + var_541_2 + arg_541_0 and not isNil(var_541_0) and arg_538_1.var_.characterEffect1049ui_story then
				local var_541_5 = 0.5

				arg_538_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_538_1.var_.characterEffect1049ui_story.fillRatio = var_541_5
			end

			local var_541_6 = 0
			local var_541_7 = 0.3

			if var_541_6 < arg_538_1.time_ and arg_538_1.time_ <= var_541_6 + arg_541_0 then
				arg_538_1.talkMaxDuration = 0
				arg_538_1.dialogCg_.alpha = 1

				arg_538_1.dialog_:SetActive(true)
				SetActive(arg_538_1.leftNameGo_, true)

				local var_541_8 = arg_538_1:FormatText(StoryNameCfg[7].name)

				arg_538_1.leftNameTxt_.text = var_541_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_538_1.leftNameTxt_.transform)

				arg_538_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_538_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_538_1:RecordName(arg_538_1.leftNameTxt_.text)
				SetActive(arg_538_1.iconTrs_.gameObject, false)
				arg_538_1.callingController_:SetSelectedState("normal")

				local var_541_9 = arg_538_1:GetWordFromCfg(1104905129)
				local var_541_10 = arg_538_1:FormatText(var_541_9.content)

				arg_538_1.text_.text = var_541_10

				LuaForUtil.ClearLinePrefixSymbol(arg_538_1.text_)

				local var_541_11 = 12
				local var_541_12 = utf8.len(var_541_10)
				local var_541_13 = var_541_11 <= 0 and var_541_7 or var_541_7 * (var_541_12 / var_541_11)

				if var_541_13 > 0 and var_541_7 < var_541_13 then
					arg_538_1.talkMaxDuration = var_541_13

					if var_541_13 + var_541_6 > arg_538_1.duration_ then
						arg_538_1.duration_ = var_541_13 + var_541_6
					end
				end

				arg_538_1.text_.text = var_541_10
				arg_538_1.typewritter.percent = 0

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(false)
				arg_538_1:RecordContent(arg_538_1.text_.text)
			end

			local var_541_14 = math.max(var_541_7, arg_538_1.talkMaxDuration)

			if var_541_6 <= arg_538_1.time_ and arg_538_1.time_ < var_541_6 + var_541_14 then
				arg_538_1.typewritter.percent = (arg_538_1.time_ - var_541_6) / var_541_14

				arg_538_1.typewritter:SetDirty()
			end

			if arg_538_1.time_ >= var_541_6 + var_541_14 and arg_538_1.time_ < var_541_6 + var_541_14 + arg_541_0 then
				arg_538_1.typewritter.percent = 1

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905130 = function(arg_542_0, arg_542_1)
		arg_542_1.time_ = 0
		arg_542_1.frameCnt_ = 0
		arg_542_1.state_ = "playing"
		arg_542_1.curTalkId_ = 1104905130
		arg_542_1.duration_ = 6.07

		SetActive(arg_542_1.tipsGo_, false)

		function arg_542_1.onSingleLineFinish_()
			arg_542_1.onSingleLineUpdate_ = nil
			arg_542_1.onSingleLineFinish_ = nil
			arg_542_1.state_ = "waiting"
		end

		function arg_542_1.playNext_(arg_544_0)
			if arg_544_0 == 1 then
				arg_542_0:Play1104905131(arg_542_1)
			end
		end

		function arg_542_1.onSingleLineUpdate_(arg_545_0)
			local var_545_0 = arg_542_1.actors_["1049ui_story"]
			local var_545_1 = 0

			if var_545_1 < arg_542_1.time_ and arg_542_1.time_ <= var_545_1 + arg_545_0 and not isNil(var_545_0) and arg_542_1.var_.characterEffect1049ui_story == nil then
				arg_542_1.var_.characterEffect1049ui_story = var_545_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_545_2 = 0.200000002980232

			if var_545_1 <= arg_542_1.time_ and arg_542_1.time_ < var_545_1 + var_545_2 and not isNil(var_545_0) then
				local var_545_3 = (arg_542_1.time_ - var_545_1) / var_545_2

				if arg_542_1.var_.characterEffect1049ui_story and not isNil(var_545_0) then
					arg_542_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_542_1.time_ >= var_545_1 + var_545_2 and arg_542_1.time_ < var_545_1 + var_545_2 + arg_545_0 and not isNil(var_545_0) and arg_542_1.var_.characterEffect1049ui_story then
				arg_542_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_545_4 = 0

			if var_545_4 < arg_542_1.time_ and arg_542_1.time_ <= var_545_4 + arg_545_0 then
				arg_542_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_1")
			end

			local var_545_5 = 0

			if var_545_5 < arg_542_1.time_ and arg_542_1.time_ <= var_545_5 + arg_545_0 then
				arg_542_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_545_6 = 0
			local var_545_7 = 0.675

			if var_545_6 < arg_542_1.time_ and arg_542_1.time_ <= var_545_6 + arg_545_0 then
				arg_542_1.talkMaxDuration = 0
				arg_542_1.dialogCg_.alpha = 1

				arg_542_1.dialog_:SetActive(true)
				SetActive(arg_542_1.leftNameGo_, true)

				local var_545_8 = arg_542_1:FormatText(StoryNameCfg[551].name)

				arg_542_1.leftNameTxt_.text = var_545_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_542_1.leftNameTxt_.transform)

				arg_542_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_542_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_542_1:RecordName(arg_542_1.leftNameTxt_.text)
				SetActive(arg_542_1.iconTrs_.gameObject, false)
				arg_542_1.callingController_:SetSelectedState("normal")

				local var_545_9 = arg_542_1:GetWordFromCfg(1104905130)
				local var_545_10 = arg_542_1:FormatText(var_545_9.content)

				arg_542_1.text_.text = var_545_10

				LuaForUtil.ClearLinePrefixSymbol(arg_542_1.text_)

				local var_545_11 = 27
				local var_545_12 = utf8.len(var_545_10)
				local var_545_13 = var_545_11 <= 0 and var_545_7 or var_545_7 * (var_545_12 / var_545_11)

				if var_545_13 > 0 and var_545_7 < var_545_13 then
					arg_542_1.talkMaxDuration = var_545_13

					if var_545_13 + var_545_6 > arg_542_1.duration_ then
						arg_542_1.duration_ = var_545_13 + var_545_6
					end
				end

				arg_542_1.text_.text = var_545_10
				arg_542_1.typewritter.percent = 0

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905130", "story_v_side_new_1104905.awb") ~= 0 then
					local var_545_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905130", "story_v_side_new_1104905.awb") / 1000

					if var_545_14 + var_545_6 > arg_542_1.duration_ then
						arg_542_1.duration_ = var_545_14 + var_545_6
					end

					if var_545_9.prefab_name ~= "" and arg_542_1.actors_[var_545_9.prefab_name] ~= nil then
						local var_545_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_542_1.actors_[var_545_9.prefab_name].transform, "story_v_side_new_1104905", "1104905130", "story_v_side_new_1104905.awb")

						arg_542_1:RecordAudio("1104905130", var_545_15)
						arg_542_1:RecordAudio("1104905130", var_545_15)
					else
						arg_542_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905130", "story_v_side_new_1104905.awb")
					end

					arg_542_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905130", "story_v_side_new_1104905.awb")
				end

				arg_542_1:RecordContent(arg_542_1.text_.text)
			end

			local var_545_16 = math.max(var_545_7, arg_542_1.talkMaxDuration)

			if var_545_6 <= arg_542_1.time_ and arg_542_1.time_ < var_545_6 + var_545_16 then
				arg_542_1.typewritter.percent = (arg_542_1.time_ - var_545_6) / var_545_16

				arg_542_1.typewritter:SetDirty()
			end

			if arg_542_1.time_ >= var_545_6 + var_545_16 and arg_542_1.time_ < var_545_6 + var_545_16 + arg_545_0 then
				arg_542_1.typewritter.percent = 1

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905131 = function(arg_546_0, arg_546_1)
		arg_546_1.time_ = 0
		arg_546_1.frameCnt_ = 0
		arg_546_1.state_ = "playing"
		arg_546_1.curTalkId_ = 1104905131
		arg_546_1.duration_ = 10.7

		SetActive(arg_546_1.tipsGo_, false)

		function arg_546_1.onSingleLineFinish_()
			arg_546_1.onSingleLineUpdate_ = nil
			arg_546_1.onSingleLineFinish_ = nil
			arg_546_1.state_ = "waiting"
		end

		function arg_546_1.playNext_(arg_548_0)
			if arg_548_0 == 1 then
				arg_546_0:Play1104905132(arg_546_1)
			end
		end

		function arg_546_1.onSingleLineUpdate_(arg_549_0)
			local var_549_0 = 0

			if var_549_0 < arg_546_1.time_ and arg_546_1.time_ <= var_549_0 + arg_549_0 then
				arg_546_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva", "EmotionTimelineAnimator")
			end

			local var_549_1 = 0
			local var_549_2 = 1.05

			if var_549_1 < arg_546_1.time_ and arg_546_1.time_ <= var_549_1 + arg_549_0 then
				arg_546_1.talkMaxDuration = 0
				arg_546_1.dialogCg_.alpha = 1

				arg_546_1.dialog_:SetActive(true)
				SetActive(arg_546_1.leftNameGo_, true)

				local var_549_3 = arg_546_1:FormatText(StoryNameCfg[551].name)

				arg_546_1.leftNameTxt_.text = var_549_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_546_1.leftNameTxt_.transform)

				arg_546_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_546_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_546_1:RecordName(arg_546_1.leftNameTxt_.text)
				SetActive(arg_546_1.iconTrs_.gameObject, false)
				arg_546_1.callingController_:SetSelectedState("normal")

				local var_549_4 = arg_546_1:GetWordFromCfg(1104905131)
				local var_549_5 = arg_546_1:FormatText(var_549_4.content)

				arg_546_1.text_.text = var_549_5

				LuaForUtil.ClearLinePrefixSymbol(arg_546_1.text_)

				local var_549_6 = 42
				local var_549_7 = utf8.len(var_549_5)
				local var_549_8 = var_549_6 <= 0 and var_549_2 or var_549_2 * (var_549_7 / var_549_6)

				if var_549_8 > 0 and var_549_2 < var_549_8 then
					arg_546_1.talkMaxDuration = var_549_8

					if var_549_8 + var_549_1 > arg_546_1.duration_ then
						arg_546_1.duration_ = var_549_8 + var_549_1
					end
				end

				arg_546_1.text_.text = var_549_5
				arg_546_1.typewritter.percent = 0

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905131", "story_v_side_new_1104905.awb") ~= 0 then
					local var_549_9 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905131", "story_v_side_new_1104905.awb") / 1000

					if var_549_9 + var_549_1 > arg_546_1.duration_ then
						arg_546_1.duration_ = var_549_9 + var_549_1
					end

					if var_549_4.prefab_name ~= "" and arg_546_1.actors_[var_549_4.prefab_name] ~= nil then
						local var_549_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_546_1.actors_[var_549_4.prefab_name].transform, "story_v_side_new_1104905", "1104905131", "story_v_side_new_1104905.awb")

						arg_546_1:RecordAudio("1104905131", var_549_10)
						arg_546_1:RecordAudio("1104905131", var_549_10)
					else
						arg_546_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905131", "story_v_side_new_1104905.awb")
					end

					arg_546_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905131", "story_v_side_new_1104905.awb")
				end

				arg_546_1:RecordContent(arg_546_1.text_.text)
			end

			local var_549_11 = math.max(var_549_2, arg_546_1.talkMaxDuration)

			if var_549_1 <= arg_546_1.time_ and arg_546_1.time_ < var_549_1 + var_549_11 then
				arg_546_1.typewritter.percent = (arg_546_1.time_ - var_549_1) / var_549_11

				arg_546_1.typewritter:SetDirty()
			end

			if arg_546_1.time_ >= var_549_1 + var_549_11 and arg_546_1.time_ < var_549_1 + var_549_11 + arg_549_0 then
				arg_546_1.typewritter.percent = 1

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905132 = function(arg_550_0, arg_550_1)
		arg_550_1.time_ = 0
		arg_550_1.frameCnt_ = 0
		arg_550_1.state_ = "playing"
		arg_550_1.curTalkId_ = 1104905132
		arg_550_1.duration_ = 5

		SetActive(arg_550_1.tipsGo_, false)

		function arg_550_1.onSingleLineFinish_()
			arg_550_1.onSingleLineUpdate_ = nil
			arg_550_1.onSingleLineFinish_ = nil
			arg_550_1.state_ = "waiting"
		end

		function arg_550_1.playNext_(arg_552_0)
			if arg_552_0 == 1 then
				arg_550_0:Play1104905133(arg_550_1)
			end
		end

		function arg_550_1.onSingleLineUpdate_(arg_553_0)
			local var_553_0 = arg_550_1.actors_["1049ui_story"].transform
			local var_553_1 = 0

			if var_553_1 < arg_550_1.time_ and arg_550_1.time_ <= var_553_1 + arg_553_0 then
				arg_550_1.var_.moveOldPos1049ui_story = var_553_0.localPosition
			end

			local var_553_2 = 0.001

			if var_553_1 <= arg_550_1.time_ and arg_550_1.time_ < var_553_1 + var_553_2 then
				local var_553_3 = (arg_550_1.time_ - var_553_1) / var_553_2
				local var_553_4 = Vector3.New(0, 100, 0)

				var_553_0.localPosition = Vector3.Lerp(arg_550_1.var_.moveOldPos1049ui_story, var_553_4, var_553_3)

				local var_553_5 = manager.ui.mainCamera.transform.position - var_553_0.position

				var_553_0.forward = Vector3.New(var_553_5.x, var_553_5.y, var_553_5.z)

				local var_553_6 = var_553_0.localEulerAngles

				var_553_6.z = 0
				var_553_6.x = 0
				var_553_0.localEulerAngles = var_553_6
			end

			if arg_550_1.time_ >= var_553_1 + var_553_2 and arg_550_1.time_ < var_553_1 + var_553_2 + arg_553_0 then
				var_553_0.localPosition = Vector3.New(0, 100, 0)

				local var_553_7 = manager.ui.mainCamera.transform.position - var_553_0.position

				var_553_0.forward = Vector3.New(var_553_7.x, var_553_7.y, var_553_7.z)

				local var_553_8 = var_553_0.localEulerAngles

				var_553_8.z = 0
				var_553_8.x = 0
				var_553_0.localEulerAngles = var_553_8
			end

			local var_553_9 = arg_550_1.actors_["1049ui_story"]
			local var_553_10 = 0

			if var_553_10 < arg_550_1.time_ and arg_550_1.time_ <= var_553_10 + arg_553_0 and not isNil(var_553_9) and arg_550_1.var_.characterEffect1049ui_story == nil then
				arg_550_1.var_.characterEffect1049ui_story = var_553_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_553_11 = 0.200000002980232

			if var_553_10 <= arg_550_1.time_ and arg_550_1.time_ < var_553_10 + var_553_11 and not isNil(var_553_9) then
				local var_553_12 = (arg_550_1.time_ - var_553_10) / var_553_11

				if arg_550_1.var_.characterEffect1049ui_story and not isNil(var_553_9) then
					local var_553_13 = Mathf.Lerp(0, 0.5, var_553_12)

					arg_550_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_550_1.var_.characterEffect1049ui_story.fillRatio = var_553_13
				end
			end

			if arg_550_1.time_ >= var_553_10 + var_553_11 and arg_550_1.time_ < var_553_10 + var_553_11 + arg_553_0 and not isNil(var_553_9) and arg_550_1.var_.characterEffect1049ui_story then
				local var_553_14 = 0.5

				arg_550_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_550_1.var_.characterEffect1049ui_story.fillRatio = var_553_14
			end

			local var_553_15 = 0
			local var_553_16 = 1.275

			if var_553_15 < arg_550_1.time_ and arg_550_1.time_ <= var_553_15 + arg_553_0 then
				arg_550_1.talkMaxDuration = 0
				arg_550_1.dialogCg_.alpha = 1

				arg_550_1.dialog_:SetActive(true)
				SetActive(arg_550_1.leftNameGo_, false)

				arg_550_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_550_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_550_1:RecordName(arg_550_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_550_1.iconTrs_.gameObject, false)
				arg_550_1.callingController_:SetSelectedState("normal")

				local var_553_17 = arg_550_1:GetWordFromCfg(1104905132)
				local var_553_18 = arg_550_1:FormatText(var_553_17.content)

				arg_550_1.text_.text = var_553_18

				LuaForUtil.ClearLinePrefixSymbol(arg_550_1.text_)

				local var_553_19 = 51
				local var_553_20 = utf8.len(var_553_18)
				local var_553_21 = var_553_19 <= 0 and var_553_16 or var_553_16 * (var_553_20 / var_553_19)

				if var_553_21 > 0 and var_553_16 < var_553_21 then
					arg_550_1.talkMaxDuration = var_553_21

					if var_553_21 + var_553_15 > arg_550_1.duration_ then
						arg_550_1.duration_ = var_553_21 + var_553_15
					end
				end

				arg_550_1.text_.text = var_553_18
				arg_550_1.typewritter.percent = 0

				arg_550_1.typewritter:SetDirty()
				arg_550_1:ShowNextGo(false)
				arg_550_1:RecordContent(arg_550_1.text_.text)
			end

			local var_553_22 = math.max(var_553_16, arg_550_1.talkMaxDuration)

			if var_553_15 <= arg_550_1.time_ and arg_550_1.time_ < var_553_15 + var_553_22 then
				arg_550_1.typewritter.percent = (arg_550_1.time_ - var_553_15) / var_553_22

				arg_550_1.typewritter:SetDirty()
			end

			if arg_550_1.time_ >= var_553_15 + var_553_22 and arg_550_1.time_ < var_553_15 + var_553_22 + arg_553_0 then
				arg_550_1.typewritter.percent = 1

				arg_550_1.typewritter:SetDirty()
				arg_550_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905133 = function(arg_554_0, arg_554_1)
		arg_554_1.time_ = 0
		arg_554_1.frameCnt_ = 0
		arg_554_1.state_ = "playing"
		arg_554_1.curTalkId_ = 1104905133
		arg_554_1.duration_ = 5

		SetActive(arg_554_1.tipsGo_, false)

		function arg_554_1.onSingleLineFinish_()
			arg_554_1.onSingleLineUpdate_ = nil
			arg_554_1.onSingleLineFinish_ = nil
			arg_554_1.state_ = "waiting"
		end

		function arg_554_1.playNext_(arg_556_0)
			if arg_556_0 == 1 then
				arg_554_0:Play1104905134(arg_554_1)
			end
		end

		function arg_554_1.onSingleLineUpdate_(arg_557_0)
			local var_557_0 = 0
			local var_557_1 = 0.65

			if var_557_0 < arg_554_1.time_ and arg_554_1.time_ <= var_557_0 + arg_557_0 then
				arg_554_1.talkMaxDuration = 0
				arg_554_1.dialogCg_.alpha = 1

				arg_554_1.dialog_:SetActive(true)
				SetActive(arg_554_1.leftNameGo_, true)

				local var_557_2 = arg_554_1:FormatText(StoryNameCfg[7].name)

				arg_554_1.leftNameTxt_.text = var_557_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_554_1.leftNameTxt_.transform)

				arg_554_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_554_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_554_1:RecordName(arg_554_1.leftNameTxt_.text)
				SetActive(arg_554_1.iconTrs_.gameObject, false)
				arg_554_1.callingController_:SetSelectedState("normal")

				local var_557_3 = arg_554_1:GetWordFromCfg(1104905133)
				local var_557_4 = arg_554_1:FormatText(var_557_3.content)

				arg_554_1.text_.text = var_557_4

				LuaForUtil.ClearLinePrefixSymbol(arg_554_1.text_)

				local var_557_5 = 29
				local var_557_6 = utf8.len(var_557_4)
				local var_557_7 = var_557_5 <= 0 and var_557_1 or var_557_1 * (var_557_6 / var_557_5)

				if var_557_7 > 0 and var_557_1 < var_557_7 then
					arg_554_1.talkMaxDuration = var_557_7

					if var_557_7 + var_557_0 > arg_554_1.duration_ then
						arg_554_1.duration_ = var_557_7 + var_557_0
					end
				end

				arg_554_1.text_.text = var_557_4
				arg_554_1.typewritter.percent = 0

				arg_554_1.typewritter:SetDirty()
				arg_554_1:ShowNextGo(false)
				arg_554_1:RecordContent(arg_554_1.text_.text)
			end

			local var_557_8 = math.max(var_557_1, arg_554_1.talkMaxDuration)

			if var_557_0 <= arg_554_1.time_ and arg_554_1.time_ < var_557_0 + var_557_8 then
				arg_554_1.typewritter.percent = (arg_554_1.time_ - var_557_0) / var_557_8

				arg_554_1.typewritter:SetDirty()
			end

			if arg_554_1.time_ >= var_557_0 + var_557_8 and arg_554_1.time_ < var_557_0 + var_557_8 + arg_557_0 then
				arg_554_1.typewritter.percent = 1

				arg_554_1.typewritter:SetDirty()
				arg_554_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905134 = function(arg_558_0, arg_558_1)
		arg_558_1.time_ = 0
		arg_558_1.frameCnt_ = 0
		arg_558_1.state_ = "playing"
		arg_558_1.curTalkId_ = 1104905134
		arg_558_1.duration_ = 2.5

		SetActive(arg_558_1.tipsGo_, false)

		function arg_558_1.onSingleLineFinish_()
			arg_558_1.onSingleLineUpdate_ = nil
			arg_558_1.onSingleLineFinish_ = nil
			arg_558_1.state_ = "waiting"
		end

		function arg_558_1.playNext_(arg_560_0)
			if arg_560_0 == 1 then
				arg_558_0:Play1104905135(arg_558_1)
			end
		end

		function arg_558_1.onSingleLineUpdate_(arg_561_0)
			local var_561_0 = arg_558_1.actors_["1049ui_story"].transform
			local var_561_1 = 0

			if var_561_1 < arg_558_1.time_ and arg_558_1.time_ <= var_561_1 + arg_561_0 then
				arg_558_1.var_.moveOldPos1049ui_story = var_561_0.localPosition
			end

			local var_561_2 = 0.001

			if var_561_1 <= arg_558_1.time_ and arg_558_1.time_ < var_561_1 + var_561_2 then
				local var_561_3 = (arg_558_1.time_ - var_561_1) / var_561_2
				local var_561_4 = Vector3.New(0, -1.2, -6)

				var_561_0.localPosition = Vector3.Lerp(arg_558_1.var_.moveOldPos1049ui_story, var_561_4, var_561_3)

				local var_561_5 = manager.ui.mainCamera.transform.position - var_561_0.position

				var_561_0.forward = Vector3.New(var_561_5.x, var_561_5.y, var_561_5.z)

				local var_561_6 = var_561_0.localEulerAngles

				var_561_6.z = 0
				var_561_6.x = 0
				var_561_0.localEulerAngles = var_561_6
			end

			if arg_558_1.time_ >= var_561_1 + var_561_2 and arg_558_1.time_ < var_561_1 + var_561_2 + arg_561_0 then
				var_561_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_561_7 = manager.ui.mainCamera.transform.position - var_561_0.position

				var_561_0.forward = Vector3.New(var_561_7.x, var_561_7.y, var_561_7.z)

				local var_561_8 = var_561_0.localEulerAngles

				var_561_8.z = 0
				var_561_8.x = 0
				var_561_0.localEulerAngles = var_561_8
			end

			local var_561_9 = arg_558_1.actors_["1049ui_story"]
			local var_561_10 = 0

			if var_561_10 < arg_558_1.time_ and arg_558_1.time_ <= var_561_10 + arg_561_0 and not isNil(var_561_9) and arg_558_1.var_.characterEffect1049ui_story == nil then
				arg_558_1.var_.characterEffect1049ui_story = var_561_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_561_11 = 0.200000002980232

			if var_561_10 <= arg_558_1.time_ and arg_558_1.time_ < var_561_10 + var_561_11 and not isNil(var_561_9) then
				local var_561_12 = (arg_558_1.time_ - var_561_10) / var_561_11

				if arg_558_1.var_.characterEffect1049ui_story and not isNil(var_561_9) then
					arg_558_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_558_1.time_ >= var_561_10 + var_561_11 and arg_558_1.time_ < var_561_10 + var_561_11 + arg_561_0 and not isNil(var_561_9) and arg_558_1.var_.characterEffect1049ui_story then
				arg_558_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_561_13 = 0

			if var_561_13 < arg_558_1.time_ and arg_558_1.time_ <= var_561_13 + arg_561_0 then
				arg_558_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_2")
			end

			local var_561_14 = 0

			if var_561_14 < arg_558_1.time_ and arg_558_1.time_ <= var_561_14 + arg_561_0 then
				arg_558_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_561_15 = 0
			local var_561_16 = 0.2

			if var_561_15 < arg_558_1.time_ and arg_558_1.time_ <= var_561_15 + arg_561_0 then
				local var_561_17 = "play"
				local var_561_18 = "music"

				arg_558_1:AudioAction(var_561_17, var_561_18, "ui_battle", "ui_battle_stopbgm", "")

				local var_561_19 = ""
				local var_561_20 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_561_20 ~= "" then
					if arg_558_1.bgmTxt_.text ~= var_561_20 and arg_558_1.bgmTxt_.text ~= "" then
						if arg_558_1.bgmTxt2_.text ~= "" then
							arg_558_1.bgmTxt_.text = arg_558_1.bgmTxt2_.text
						end

						arg_558_1.bgmTxt2_.text = var_561_20

						arg_558_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_558_1.bgmTxt_.text = var_561_20
					end

					if arg_558_1.bgmTimer then
						arg_558_1.bgmTimer:Stop()

						arg_558_1.bgmTimer = nil
					end

					if arg_558_1.settingData.show_music_name == 1 then
						arg_558_1.musicController:SetSelectedState("show")
						arg_558_1.musicAnimator_:Play("open", 0, 0)

						if arg_558_1.settingData.music_time ~= 0 then
							arg_558_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_558_1.settingData.music_time), function()
								if arg_558_1 == nil or isNil(arg_558_1.bgmTxt_) then
									return
								end

								arg_558_1.musicController:SetSelectedState("hide")
								arg_558_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_561_21 = 0
			local var_561_22 = 0.15

			if var_561_21 < arg_558_1.time_ and arg_558_1.time_ <= var_561_21 + arg_561_0 then
				arg_558_1.talkMaxDuration = 0
				arg_558_1.dialogCg_.alpha = 1

				arg_558_1.dialog_:SetActive(true)
				SetActive(arg_558_1.leftNameGo_, true)

				local var_561_23 = arg_558_1:FormatText(StoryNameCfg[551].name)

				arg_558_1.leftNameTxt_.text = var_561_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_558_1.leftNameTxt_.transform)

				arg_558_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_558_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_558_1:RecordName(arg_558_1.leftNameTxt_.text)
				SetActive(arg_558_1.iconTrs_.gameObject, false)
				arg_558_1.callingController_:SetSelectedState("normal")

				local var_561_24 = arg_558_1:GetWordFromCfg(1104905134)
				local var_561_25 = arg_558_1:FormatText(var_561_24.content)

				arg_558_1.text_.text = var_561_25

				LuaForUtil.ClearLinePrefixSymbol(arg_558_1.text_)

				local var_561_26 = 6
				local var_561_27 = utf8.len(var_561_25)
				local var_561_28 = var_561_26 <= 0 and var_561_22 or var_561_22 * (var_561_27 / var_561_26)

				if var_561_28 > 0 and var_561_22 < var_561_28 then
					arg_558_1.talkMaxDuration = var_561_28

					if var_561_28 + var_561_21 > arg_558_1.duration_ then
						arg_558_1.duration_ = var_561_28 + var_561_21
					end
				end

				arg_558_1.text_.text = var_561_25
				arg_558_1.typewritter.percent = 0

				arg_558_1.typewritter:SetDirty()
				arg_558_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905134", "story_v_side_new_1104905.awb") ~= 0 then
					local var_561_29 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905134", "story_v_side_new_1104905.awb") / 1000

					if var_561_29 + var_561_21 > arg_558_1.duration_ then
						arg_558_1.duration_ = var_561_29 + var_561_21
					end

					if var_561_24.prefab_name ~= "" and arg_558_1.actors_[var_561_24.prefab_name] ~= nil then
						local var_561_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_558_1.actors_[var_561_24.prefab_name].transform, "story_v_side_new_1104905", "1104905134", "story_v_side_new_1104905.awb")

						arg_558_1:RecordAudio("1104905134", var_561_30)
						arg_558_1:RecordAudio("1104905134", var_561_30)
					else
						arg_558_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905134", "story_v_side_new_1104905.awb")
					end

					arg_558_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905134", "story_v_side_new_1104905.awb")
				end

				arg_558_1:RecordContent(arg_558_1.text_.text)
			end

			local var_561_31 = math.max(var_561_22, arg_558_1.talkMaxDuration)

			if var_561_21 <= arg_558_1.time_ and arg_558_1.time_ < var_561_21 + var_561_31 then
				arg_558_1.typewritter.percent = (arg_558_1.time_ - var_561_21) / var_561_31

				arg_558_1.typewritter:SetDirty()
			end

			if arg_558_1.time_ >= var_561_21 + var_561_31 and arg_558_1.time_ < var_561_21 + var_561_31 + arg_561_0 then
				arg_558_1.typewritter.percent = 1

				arg_558_1.typewritter:SetDirty()
				arg_558_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905135 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1104905135
		arg_563_1.duration_ = 9

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1104905136(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = "K12h"

			if arg_563_1.bgs_[var_566_0] == nil then
				local var_566_1 = Object.Instantiate(arg_563_1.paintGo_)

				var_566_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_566_0)
				var_566_1.name = var_566_0
				var_566_1.transform.parent = arg_563_1.stage_.transform
				var_566_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_563_1.bgs_[var_566_0] = var_566_1
			end

			local var_566_2 = 2

			if var_566_2 < arg_563_1.time_ and arg_563_1.time_ <= var_566_2 + arg_566_0 then
				local var_566_3 = manager.ui.mainCamera.transform.localPosition
				local var_566_4 = Vector3.New(0, 0, 10) + Vector3.New(var_566_3.x, var_566_3.y, 0)
				local var_566_5 = arg_563_1.bgs_.K12h

				var_566_5.transform.localPosition = var_566_4
				var_566_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_566_6 = var_566_5:GetComponent("SpriteRenderer")

				if var_566_6 and var_566_6.sprite then
					local var_566_7 = (var_566_5.transform.localPosition - var_566_3).z
					local var_566_8 = manager.ui.mainCameraCom_
					local var_566_9 = 2 * var_566_7 * Mathf.Tan(var_566_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_566_10 = var_566_9 * var_566_8.aspect
					local var_566_11 = var_566_6.sprite.bounds.size.x
					local var_566_12 = var_566_6.sprite.bounds.size.y
					local var_566_13 = var_566_10 / var_566_11
					local var_566_14 = var_566_9 / var_566_12
					local var_566_15 = var_566_14 < var_566_13 and var_566_13 or var_566_14

					var_566_5.transform.localScale = Vector3.New(var_566_15, var_566_15, 0)
				end

				for iter_566_0, iter_566_1 in pairs(arg_563_1.bgs_) do
					if iter_566_0 ~= "K12h" then
						iter_566_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_566_16 = 3.999999999999

			if var_566_16 < arg_563_1.time_ and arg_563_1.time_ <= var_566_16 + arg_566_0 then
				arg_563_1.allBtn_.enabled = false
			end

			local var_566_17 = 0.3

			if arg_563_1.time_ >= var_566_16 + var_566_17 and arg_563_1.time_ < var_566_16 + var_566_17 + arg_566_0 then
				arg_563_1.allBtn_.enabled = true
			end

			local var_566_18 = 0

			if var_566_18 < arg_563_1.time_ and arg_563_1.time_ <= var_566_18 + arg_566_0 then
				arg_563_1.mask_.enabled = true
				arg_563_1.mask_.raycastTarget = true

				arg_563_1:SetGaussion(false)
			end

			local var_566_19 = 2

			if var_566_18 <= arg_563_1.time_ and arg_563_1.time_ < var_566_18 + var_566_19 then
				local var_566_20 = (arg_563_1.time_ - var_566_18) / var_566_19
				local var_566_21 = Color.New(0, 0, 0)

				var_566_21.a = Mathf.Lerp(0, 1, var_566_20)
				arg_563_1.mask_.color = var_566_21
			end

			if arg_563_1.time_ >= var_566_18 + var_566_19 and arg_563_1.time_ < var_566_18 + var_566_19 + arg_566_0 then
				local var_566_22 = Color.New(0, 0, 0)

				var_566_22.a = 1
				arg_563_1.mask_.color = var_566_22
			end

			local var_566_23 = 2

			if var_566_23 < arg_563_1.time_ and arg_563_1.time_ <= var_566_23 + arg_566_0 then
				arg_563_1.mask_.enabled = true
				arg_563_1.mask_.raycastTarget = true

				arg_563_1:SetGaussion(false)
			end

			local var_566_24 = 2

			if var_566_23 <= arg_563_1.time_ and arg_563_1.time_ < var_566_23 + var_566_24 then
				local var_566_25 = (arg_563_1.time_ - var_566_23) / var_566_24
				local var_566_26 = Color.New(0, 0, 0)

				var_566_26.a = Mathf.Lerp(1, 0, var_566_25)
				arg_563_1.mask_.color = var_566_26
			end

			if arg_563_1.time_ >= var_566_23 + var_566_24 and arg_563_1.time_ < var_566_23 + var_566_24 + arg_566_0 then
				local var_566_27 = Color.New(0, 0, 0)
				local var_566_28 = 0

				arg_563_1.mask_.enabled = false
				var_566_27.a = var_566_28
				arg_563_1.mask_.color = var_566_27
			end

			local var_566_29 = arg_563_1.actors_["1049ui_story"].transform
			local var_566_30 = 1.96599999815226

			if var_566_30 < arg_563_1.time_ and arg_563_1.time_ <= var_566_30 + arg_566_0 then
				arg_563_1.var_.moveOldPos1049ui_story = var_566_29.localPosition
			end

			local var_566_31 = 0.001

			if var_566_30 <= arg_563_1.time_ and arg_563_1.time_ < var_566_30 + var_566_31 then
				local var_566_32 = (arg_563_1.time_ - var_566_30) / var_566_31
				local var_566_33 = Vector3.New(0, 100, 0)

				var_566_29.localPosition = Vector3.Lerp(arg_563_1.var_.moveOldPos1049ui_story, var_566_33, var_566_32)

				local var_566_34 = manager.ui.mainCamera.transform.position - var_566_29.position

				var_566_29.forward = Vector3.New(var_566_34.x, var_566_34.y, var_566_34.z)

				local var_566_35 = var_566_29.localEulerAngles

				var_566_35.z = 0
				var_566_35.x = 0
				var_566_29.localEulerAngles = var_566_35
			end

			if arg_563_1.time_ >= var_566_30 + var_566_31 and arg_563_1.time_ < var_566_30 + var_566_31 + arg_566_0 then
				var_566_29.localPosition = Vector3.New(0, 100, 0)

				local var_566_36 = manager.ui.mainCamera.transform.position - var_566_29.position

				var_566_29.forward = Vector3.New(var_566_36.x, var_566_36.y, var_566_36.z)

				local var_566_37 = var_566_29.localEulerAngles

				var_566_37.z = 0
				var_566_37.x = 0
				var_566_29.localEulerAngles = var_566_37
			end

			local var_566_38 = arg_563_1.actors_["1049ui_story"]
			local var_566_39 = 1.96599999815226

			if var_566_39 < arg_563_1.time_ and arg_563_1.time_ <= var_566_39 + arg_566_0 and not isNil(var_566_38) and arg_563_1.var_.characterEffect1049ui_story == nil then
				arg_563_1.var_.characterEffect1049ui_story = var_566_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_40 = 0.034000001847744

			if var_566_39 <= arg_563_1.time_ and arg_563_1.time_ < var_566_39 + var_566_40 and not isNil(var_566_38) then
				local var_566_41 = (arg_563_1.time_ - var_566_39) / var_566_40

				if arg_563_1.var_.characterEffect1049ui_story and not isNil(var_566_38) then
					local var_566_42 = Mathf.Lerp(0, 0.5, var_566_41)

					arg_563_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_563_1.var_.characterEffect1049ui_story.fillRatio = var_566_42
				end
			end

			if arg_563_1.time_ >= var_566_39 + var_566_40 and arg_563_1.time_ < var_566_39 + var_566_40 + arg_566_0 and not isNil(var_566_38) and arg_563_1.var_.characterEffect1049ui_story then
				local var_566_43 = 0.5

				arg_563_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_563_1.var_.characterEffect1049ui_story.fillRatio = var_566_43
			end

			local var_566_44 = 0
			local var_566_45 = 0.2

			if var_566_44 < arg_563_1.time_ and arg_563_1.time_ <= var_566_44 + arg_566_0 then
				local var_566_46 = "play"
				local var_566_47 = "music"

				arg_563_1:AudioAction(var_566_46, var_566_47, "ui_battle", "ui_battle_stopbgm", "")

				local var_566_48 = ""
				local var_566_49 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_566_49 ~= "" then
					if arg_563_1.bgmTxt_.text ~= var_566_49 and arg_563_1.bgmTxt_.text ~= "" then
						if arg_563_1.bgmTxt2_.text ~= "" then
							arg_563_1.bgmTxt_.text = arg_563_1.bgmTxt2_.text
						end

						arg_563_1.bgmTxt2_.text = var_566_49

						arg_563_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_563_1.bgmTxt_.text = var_566_49
					end

					if arg_563_1.bgmTimer then
						arg_563_1.bgmTimer:Stop()

						arg_563_1.bgmTimer = nil
					end

					if arg_563_1.settingData.show_music_name == 1 then
						arg_563_1.musicController:SetSelectedState("show")
						arg_563_1.musicAnimator_:Play("open", 0, 0)

						if arg_563_1.settingData.music_time ~= 0 then
							arg_563_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_563_1.settingData.music_time), function()
								if arg_563_1 == nil or isNil(arg_563_1.bgmTxt_) then
									return
								end

								arg_563_1.musicController:SetSelectedState("hide")
								arg_563_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_566_50 = 0.4
			local var_566_51 = 1

			if var_566_50 < arg_563_1.time_ and arg_563_1.time_ <= var_566_50 + arg_566_0 then
				local var_566_52 = "play"
				local var_566_53 = "music"

				arg_563_1:AudioAction(var_566_52, var_566_53, "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet.awb")

				local var_566_54 = ""
				local var_566_55 = manager.audio:GetAudioName("bgm_activity_3_0_story_daily_quiet", "bgm_activity_3_0_story_daily_quiet")

				if var_566_55 ~= "" then
					if arg_563_1.bgmTxt_.text ~= var_566_55 and arg_563_1.bgmTxt_.text ~= "" then
						if arg_563_1.bgmTxt2_.text ~= "" then
							arg_563_1.bgmTxt_.text = arg_563_1.bgmTxt2_.text
						end

						arg_563_1.bgmTxt2_.text = var_566_55

						arg_563_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_563_1.bgmTxt_.text = var_566_55
					end

					if arg_563_1.bgmTimer then
						arg_563_1.bgmTimer:Stop()

						arg_563_1.bgmTimer = nil
					end

					if arg_563_1.settingData.show_music_name == 1 then
						arg_563_1.musicController:SetSelectedState("show")
						arg_563_1.musicAnimator_:Play("open", 0, 0)

						if arg_563_1.settingData.music_time ~= 0 then
							arg_563_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_563_1.settingData.music_time), function()
								if arg_563_1 == nil or isNil(arg_563_1.bgmTxt_) then
									return
								end

								arg_563_1.musicController:SetSelectedState("hide")
								arg_563_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_566_56 = 1.56666666666667
			local var_566_57 = 1

			if var_566_56 < arg_563_1.time_ and arg_563_1.time_ <= var_566_56 + arg_566_0 then
				local var_566_58 = "play"
				local var_566_59 = "effect"

				arg_563_1:AudioAction(var_566_58, var_566_59, "se_story_side_1049", "se_story_side_1049_amb_room", "")
			end

			local var_566_60 = 4.56666666666767
			local var_566_61 = 1

			if var_566_60 < arg_563_1.time_ and arg_563_1.time_ <= var_566_60 + arg_566_0 then
				local var_566_62 = "play"
				local var_566_63 = "effect"

				arg_563_1:AudioAction(var_566_62, var_566_63, "se_story_side_1058", "se_story_side_1058_bell", "")
			end

			local var_566_64 = 4.56666666666667
			local var_566_65 = 1

			if var_566_64 < arg_563_1.time_ and arg_563_1.time_ <= var_566_64 + arg_566_0 then
				local var_566_66 = "play"
				local var_566_67 = "effect"

				arg_563_1:AudioAction(var_566_66, var_566_67, "se_story_side_1075", "se_story_side_1075_door", "")
			end

			local var_566_68 = 0.125
			local var_566_69 = 1

			if var_566_68 < arg_563_1.time_ and arg_563_1.time_ <= var_566_68 + arg_566_0 then
				local var_566_70 = "stop"
				local var_566_71 = "effect"

				arg_563_1:AudioAction(var_566_70, var_566_71, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			if arg_563_1.frameCnt_ <= 1 then
				arg_563_1.dialog_:SetActive(false)
			end

			local var_566_72 = 3.999999999999
			local var_566_73 = 1.075

			if var_566_72 < arg_563_1.time_ and arg_563_1.time_ <= var_566_72 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0

				arg_563_1.dialog_:SetActive(true)

				local var_566_74 = LeanTween.value(arg_563_1.dialog_, 0, 1, 0.3)

				var_566_74:setOnUpdate(LuaHelper.FloatAction(function(arg_569_0)
					arg_563_1.dialogCg_.alpha = arg_569_0
				end))
				var_566_74:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_563_1.dialog_)
					var_566_74:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_563_1.duration_ = arg_563_1.duration_ + 0.3

				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_75 = arg_563_1:GetWordFromCfg(1104905135)
				local var_566_76 = arg_563_1:FormatText(var_566_75.content)

				arg_563_1.text_.text = var_566_76

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_77 = 43
				local var_566_78 = utf8.len(var_566_76)
				local var_566_79 = var_566_77 <= 0 and var_566_73 or var_566_73 * (var_566_78 / var_566_77)

				if var_566_79 > 0 and var_566_73 < var_566_79 then
					arg_563_1.talkMaxDuration = var_566_79
					var_566_72 = var_566_72 + 0.3

					if var_566_79 + var_566_72 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_79 + var_566_72
					end
				end

				arg_563_1.text_.text = var_566_76
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_80 = var_566_72 + 0.3
			local var_566_81 = math.max(var_566_73, arg_563_1.talkMaxDuration)

			if var_566_80 <= arg_563_1.time_ and arg_563_1.time_ < var_566_80 + var_566_81 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_80) / var_566_81

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_80 + var_566_81 and arg_563_1.time_ < var_566_80 + var_566_81 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905136 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1104905136
		arg_571_1.duration_ = 1

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1104905137(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1049ui_story"].transform
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 then
				arg_571_1.var_.moveOldPos1049ui_story = var_574_0.localPosition
			end

			local var_574_2 = 0.001

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2
				local var_574_4 = Vector3.New(0, -1.2, -6)

				var_574_0.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1049ui_story, var_574_4, var_574_3)

				local var_574_5 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_5.x, var_574_5.y, var_574_5.z)

				local var_574_6 = var_574_0.localEulerAngles

				var_574_6.z = 0
				var_574_6.x = 0
				var_574_0.localEulerAngles = var_574_6
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 then
				var_574_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_574_7 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_7.x, var_574_7.y, var_574_7.z)

				local var_574_8 = var_574_0.localEulerAngles

				var_574_8.z = 0
				var_574_8.x = 0
				var_574_0.localEulerAngles = var_574_8
			end

			local var_574_9 = arg_571_1.actors_["1049ui_story"]
			local var_574_10 = 0

			if var_574_10 < arg_571_1.time_ and arg_571_1.time_ <= var_574_10 + arg_574_0 and not isNil(var_574_9) and arg_571_1.var_.characterEffect1049ui_story == nil then
				arg_571_1.var_.characterEffect1049ui_story = var_574_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_11 = 0.200000002980232

			if var_574_10 <= arg_571_1.time_ and arg_571_1.time_ < var_574_10 + var_574_11 and not isNil(var_574_9) then
				local var_574_12 = (arg_571_1.time_ - var_574_10) / var_574_11

				if arg_571_1.var_.characterEffect1049ui_story and not isNil(var_574_9) then
					arg_571_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_571_1.time_ >= var_574_10 + var_574_11 and arg_571_1.time_ < var_574_10 + var_574_11 + arg_574_0 and not isNil(var_574_9) and arg_571_1.var_.characterEffect1049ui_story then
				arg_571_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_574_13 = 0

			if var_574_13 < arg_571_1.time_ and arg_571_1.time_ <= var_574_13 + arg_574_0 then
				arg_571_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_574_14 = 0

			if var_574_14 < arg_571_1.time_ and arg_571_1.time_ <= var_574_14 + arg_574_0 then
				arg_571_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_574_15 = 0
			local var_574_16 = 0.075

			if var_574_15 < arg_571_1.time_ and arg_571_1.time_ <= var_574_15 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_17 = arg_571_1:FormatText(StoryNameCfg[551].name)

				arg_571_1.leftNameTxt_.text = var_574_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_18 = arg_571_1:GetWordFromCfg(1104905136)
				local var_574_19 = arg_571_1:FormatText(var_574_18.content)

				arg_571_1.text_.text = var_574_19

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_20 = 3
				local var_574_21 = utf8.len(var_574_19)
				local var_574_22 = var_574_20 <= 0 and var_574_16 or var_574_16 * (var_574_21 / var_574_20)

				if var_574_22 > 0 and var_574_16 < var_574_22 then
					arg_571_1.talkMaxDuration = var_574_22

					if var_574_22 + var_574_15 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_22 + var_574_15
					end
				end

				arg_571_1.text_.text = var_574_19
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905136", "story_v_side_new_1104905.awb") ~= 0 then
					local var_574_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905136", "story_v_side_new_1104905.awb") / 1000

					if var_574_23 + var_574_15 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_23 + var_574_15
					end

					if var_574_18.prefab_name ~= "" and arg_571_1.actors_[var_574_18.prefab_name] ~= nil then
						local var_574_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_18.prefab_name].transform, "story_v_side_new_1104905", "1104905136", "story_v_side_new_1104905.awb")

						arg_571_1:RecordAudio("1104905136", var_574_24)
						arg_571_1:RecordAudio("1104905136", var_574_24)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905136", "story_v_side_new_1104905.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905136", "story_v_side_new_1104905.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_25 = math.max(var_574_16, arg_571_1.talkMaxDuration)

			if var_574_15 <= arg_571_1.time_ and arg_571_1.time_ < var_574_15 + var_574_25 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_15) / var_574_25

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_15 + var_574_25 and arg_571_1.time_ < var_574_15 + var_574_25 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905137 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 1104905137
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play1104905138(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1049ui_story"].transform
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 then
				arg_575_1.var_.moveOldPos1049ui_story = var_578_0.localPosition
			end

			local var_578_2 = 0.001

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2
				local var_578_4 = Vector3.New(0, 100, 0)

				var_578_0.localPosition = Vector3.Lerp(arg_575_1.var_.moveOldPos1049ui_story, var_578_4, var_578_3)

				local var_578_5 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_5.x, var_578_5.y, var_578_5.z)

				local var_578_6 = var_578_0.localEulerAngles

				var_578_6.z = 0
				var_578_6.x = 0
				var_578_0.localEulerAngles = var_578_6
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 then
				var_578_0.localPosition = Vector3.New(0, 100, 0)

				local var_578_7 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_7.x, var_578_7.y, var_578_7.z)

				local var_578_8 = var_578_0.localEulerAngles

				var_578_8.z = 0
				var_578_8.x = 0
				var_578_0.localEulerAngles = var_578_8
			end

			local var_578_9 = arg_575_1.actors_["1049ui_story"]
			local var_578_10 = 0

			if var_578_10 < arg_575_1.time_ and arg_575_1.time_ <= var_578_10 + arg_578_0 and not isNil(var_578_9) and arg_575_1.var_.characterEffect1049ui_story == nil then
				arg_575_1.var_.characterEffect1049ui_story = var_578_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_11 = 0.200000002980232

			if var_578_10 <= arg_575_1.time_ and arg_575_1.time_ < var_578_10 + var_578_11 and not isNil(var_578_9) then
				local var_578_12 = (arg_575_1.time_ - var_578_10) / var_578_11

				if arg_575_1.var_.characterEffect1049ui_story and not isNil(var_578_9) then
					local var_578_13 = Mathf.Lerp(0, 0.5, var_578_12)

					arg_575_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_575_1.var_.characterEffect1049ui_story.fillRatio = var_578_13
				end
			end

			if arg_575_1.time_ >= var_578_10 + var_578_11 and arg_575_1.time_ < var_578_10 + var_578_11 + arg_578_0 and not isNil(var_578_9) and arg_575_1.var_.characterEffect1049ui_story then
				local var_578_14 = 0.5

				arg_575_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_575_1.var_.characterEffect1049ui_story.fillRatio = var_578_14
			end

			local var_578_15 = 0
			local var_578_16 = 1

			if var_578_15 < arg_575_1.time_ and arg_575_1.time_ <= var_578_15 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, false)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_17 = arg_575_1:GetWordFromCfg(1104905137)
				local var_578_18 = arg_575_1:FormatText(var_578_17.content)

				arg_575_1.text_.text = var_578_18

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_19 = 40
				local var_578_20 = utf8.len(var_578_18)
				local var_578_21 = var_578_19 <= 0 and var_578_16 or var_578_16 * (var_578_20 / var_578_19)

				if var_578_21 > 0 and var_578_16 < var_578_21 then
					arg_575_1.talkMaxDuration = var_578_21

					if var_578_21 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_21 + var_578_15
					end
				end

				arg_575_1.text_.text = var_578_18
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)
				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_22 = math.max(var_578_16, arg_575_1.talkMaxDuration)

			if var_578_15 <= arg_575_1.time_ and arg_575_1.time_ < var_578_15 + var_578_22 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_15) / var_578_22

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_15 + var_578_22 and arg_575_1.time_ < var_578_15 + var_578_22 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905138 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 1104905138
		arg_579_1.duration_ = 6.5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play1104905139(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1049ui_story"].transform
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 then
				arg_579_1.var_.moveOldPos1049ui_story = var_582_0.localPosition
			end

			local var_582_2 = 0.001

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2
				local var_582_4 = Vector3.New(0, -1.2, -6)

				var_582_0.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1049ui_story, var_582_4, var_582_3)

				local var_582_5 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_5.x, var_582_5.y, var_582_5.z)

				local var_582_6 = var_582_0.localEulerAngles

				var_582_6.z = 0
				var_582_6.x = 0
				var_582_0.localEulerAngles = var_582_6
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 then
				var_582_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_582_7 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_7.x, var_582_7.y, var_582_7.z)

				local var_582_8 = var_582_0.localEulerAngles

				var_582_8.z = 0
				var_582_8.x = 0
				var_582_0.localEulerAngles = var_582_8
			end

			local var_582_9 = arg_579_1.actors_["1049ui_story"]
			local var_582_10 = 0

			if var_582_10 < arg_579_1.time_ and arg_579_1.time_ <= var_582_10 + arg_582_0 and not isNil(var_582_9) and arg_579_1.var_.characterEffect1049ui_story == nil then
				arg_579_1.var_.characterEffect1049ui_story = var_582_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_11 = 0.200000002980232

			if var_582_10 <= arg_579_1.time_ and arg_579_1.time_ < var_582_10 + var_582_11 and not isNil(var_582_9) then
				local var_582_12 = (arg_579_1.time_ - var_582_10) / var_582_11

				if arg_579_1.var_.characterEffect1049ui_story and not isNil(var_582_9) then
					arg_579_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_10 + var_582_11 and arg_579_1.time_ < var_582_10 + var_582_11 + arg_582_0 and not isNil(var_582_9) and arg_579_1.var_.characterEffect1049ui_story then
				arg_579_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_582_13 = 0

			if var_582_13 < arg_579_1.time_ and arg_579_1.time_ <= var_582_13 + arg_582_0 then
				arg_579_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_582_14 = 0

			if var_582_14 < arg_579_1.time_ and arg_579_1.time_ <= var_582_14 + arg_582_0 then
				arg_579_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_582_15 = 0
			local var_582_16 = 0.75

			if var_582_15 < arg_579_1.time_ and arg_579_1.time_ <= var_582_15 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_17 = arg_579_1:FormatText(StoryNameCfg[551].name)

				arg_579_1.leftNameTxt_.text = var_582_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_18 = arg_579_1:GetWordFromCfg(1104905138)
				local var_582_19 = arg_579_1:FormatText(var_582_18.content)

				arg_579_1.text_.text = var_582_19

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_20 = 30
				local var_582_21 = utf8.len(var_582_19)
				local var_582_22 = var_582_20 <= 0 and var_582_16 or var_582_16 * (var_582_21 / var_582_20)

				if var_582_22 > 0 and var_582_16 < var_582_22 then
					arg_579_1.talkMaxDuration = var_582_22

					if var_582_22 + var_582_15 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_22 + var_582_15
					end
				end

				arg_579_1.text_.text = var_582_19
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905138", "story_v_side_new_1104905.awb") ~= 0 then
					local var_582_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905138", "story_v_side_new_1104905.awb") / 1000

					if var_582_23 + var_582_15 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_23 + var_582_15
					end

					if var_582_18.prefab_name ~= "" and arg_579_1.actors_[var_582_18.prefab_name] ~= nil then
						local var_582_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_18.prefab_name].transform, "story_v_side_new_1104905", "1104905138", "story_v_side_new_1104905.awb")

						arg_579_1:RecordAudio("1104905138", var_582_24)
						arg_579_1:RecordAudio("1104905138", var_582_24)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905138", "story_v_side_new_1104905.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905138", "story_v_side_new_1104905.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_25 = math.max(var_582_16, arg_579_1.talkMaxDuration)

			if var_582_15 <= arg_579_1.time_ and arg_579_1.time_ < var_582_15 + var_582_25 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_15) / var_582_25

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_15 + var_582_25 and arg_579_1.time_ < var_582_15 + var_582_25 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905139 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 1104905139
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play1104905140(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1049ui_story"]
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 and not isNil(var_586_0) and arg_583_1.var_.characterEffect1049ui_story == nil then
				arg_583_1.var_.characterEffect1049ui_story = var_586_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_2 = 0.200000002980232

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 and not isNil(var_586_0) then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2

				if arg_583_1.var_.characterEffect1049ui_story and not isNil(var_586_0) then
					local var_586_4 = Mathf.Lerp(0, 0.5, var_586_3)

					arg_583_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1049ui_story.fillRatio = var_586_4
				end
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 and not isNil(var_586_0) and arg_583_1.var_.characterEffect1049ui_story then
				local var_586_5 = 0.5

				arg_583_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1049ui_story.fillRatio = var_586_5
			end

			local var_586_6 = 0
			local var_586_7 = 0.775

			if var_586_6 < arg_583_1.time_ and arg_583_1.time_ <= var_586_6 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_8 = arg_583_1:FormatText(StoryNameCfg[7].name)

				arg_583_1.leftNameTxt_.text = var_586_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_9 = arg_583_1:GetWordFromCfg(1104905139)
				local var_586_10 = arg_583_1:FormatText(var_586_9.content)

				arg_583_1.text_.text = var_586_10

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_11 = 31
				local var_586_12 = utf8.len(var_586_10)
				local var_586_13 = var_586_11 <= 0 and var_586_7 or var_586_7 * (var_586_12 / var_586_11)

				if var_586_13 > 0 and var_586_7 < var_586_13 then
					arg_583_1.talkMaxDuration = var_586_13

					if var_586_13 + var_586_6 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_13 + var_586_6
					end
				end

				arg_583_1.text_.text = var_586_10
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_14 = math.max(var_586_7, arg_583_1.talkMaxDuration)

			if var_586_6 <= arg_583_1.time_ and arg_583_1.time_ < var_586_6 + var_586_14 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_6) / var_586_14

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_6 + var_586_14 and arg_583_1.time_ < var_586_6 + var_586_14 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905140 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 1104905140
		arg_587_1.duration_ = 3.27

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play1104905141(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["1049ui_story"]
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 and not isNil(var_590_0) and arg_587_1.var_.characterEffect1049ui_story == nil then
				arg_587_1.var_.characterEffect1049ui_story = var_590_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_2 = 0.200000002980232

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 and not isNil(var_590_0) then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2

				if arg_587_1.var_.characterEffect1049ui_story and not isNil(var_590_0) then
					arg_587_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 and not isNil(var_590_0) and arg_587_1.var_.characterEffect1049ui_story then
				arg_587_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_590_4 = 0

			if var_590_4 < arg_587_1.time_ and arg_587_1.time_ <= var_590_4 + arg_590_0 then
				arg_587_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_590_5 = 0

			if var_590_5 < arg_587_1.time_ and arg_587_1.time_ <= var_590_5 + arg_590_0 then
				arg_587_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_590_6 = 0
			local var_590_7 = 0.25

			if var_590_6 < arg_587_1.time_ and arg_587_1.time_ <= var_590_6 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_8 = arg_587_1:FormatText(StoryNameCfg[551].name)

				arg_587_1.leftNameTxt_.text = var_590_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_9 = arg_587_1:GetWordFromCfg(1104905140)
				local var_590_10 = arg_587_1:FormatText(var_590_9.content)

				arg_587_1.text_.text = var_590_10

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_11 = 10
				local var_590_12 = utf8.len(var_590_10)
				local var_590_13 = var_590_11 <= 0 and var_590_7 or var_590_7 * (var_590_12 / var_590_11)

				if var_590_13 > 0 and var_590_7 < var_590_13 then
					arg_587_1.talkMaxDuration = var_590_13

					if var_590_13 + var_590_6 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_13 + var_590_6
					end
				end

				arg_587_1.text_.text = var_590_10
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905140", "story_v_side_new_1104905.awb") ~= 0 then
					local var_590_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905140", "story_v_side_new_1104905.awb") / 1000

					if var_590_14 + var_590_6 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_14 + var_590_6
					end

					if var_590_9.prefab_name ~= "" and arg_587_1.actors_[var_590_9.prefab_name] ~= nil then
						local var_590_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_9.prefab_name].transform, "story_v_side_new_1104905", "1104905140", "story_v_side_new_1104905.awb")

						arg_587_1:RecordAudio("1104905140", var_590_15)
						arg_587_1:RecordAudio("1104905140", var_590_15)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905140", "story_v_side_new_1104905.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905140", "story_v_side_new_1104905.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_16 = math.max(var_590_7, arg_587_1.talkMaxDuration)

			if var_590_6 <= arg_587_1.time_ and arg_587_1.time_ < var_590_6 + var_590_16 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_6) / var_590_16

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_6 + var_590_16 and arg_587_1.time_ < var_590_6 + var_590_16 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905141 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 1104905141
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play1104905142(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["1049ui_story"].transform
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 then
				arg_591_1.var_.moveOldPos1049ui_story = var_594_0.localPosition
			end

			local var_594_2 = 0.001

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2
				local var_594_4 = Vector3.New(0, 100, 0)

				var_594_0.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1049ui_story, var_594_4, var_594_3)

				local var_594_5 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_5.x, var_594_5.y, var_594_5.z)

				local var_594_6 = var_594_0.localEulerAngles

				var_594_6.z = 0
				var_594_6.x = 0
				var_594_0.localEulerAngles = var_594_6
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 then
				var_594_0.localPosition = Vector3.New(0, 100, 0)

				local var_594_7 = manager.ui.mainCamera.transform.position - var_594_0.position

				var_594_0.forward = Vector3.New(var_594_7.x, var_594_7.y, var_594_7.z)

				local var_594_8 = var_594_0.localEulerAngles

				var_594_8.z = 0
				var_594_8.x = 0
				var_594_0.localEulerAngles = var_594_8
			end

			local var_594_9 = arg_591_1.actors_["1049ui_story"]
			local var_594_10 = 0

			if var_594_10 < arg_591_1.time_ and arg_591_1.time_ <= var_594_10 + arg_594_0 and not isNil(var_594_9) and arg_591_1.var_.characterEffect1049ui_story == nil then
				arg_591_1.var_.characterEffect1049ui_story = var_594_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_11 = 0.200000002980232

			if var_594_10 <= arg_591_1.time_ and arg_591_1.time_ < var_594_10 + var_594_11 and not isNil(var_594_9) then
				local var_594_12 = (arg_591_1.time_ - var_594_10) / var_594_11

				if arg_591_1.var_.characterEffect1049ui_story and not isNil(var_594_9) then
					local var_594_13 = Mathf.Lerp(0, 0.5, var_594_12)

					arg_591_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_591_1.var_.characterEffect1049ui_story.fillRatio = var_594_13
				end
			end

			if arg_591_1.time_ >= var_594_10 + var_594_11 and arg_591_1.time_ < var_594_10 + var_594_11 + arg_594_0 and not isNil(var_594_9) and arg_591_1.var_.characterEffect1049ui_story then
				local var_594_14 = 0.5

				arg_591_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_591_1.var_.characterEffect1049ui_story.fillRatio = var_594_14
			end

			local var_594_15 = 0.125
			local var_594_16 = 1

			if var_594_15 < arg_591_1.time_ and arg_591_1.time_ <= var_594_15 + arg_594_0 then
				local var_594_17 = "play"
				local var_594_18 = "effect"

				arg_591_1:AudioAction(var_594_17, var_594_18, "se_story_141", "se_story_141_footstep_walk02", "")
			end

			local var_594_19 = 0
			local var_594_20 = 0.95

			if var_594_19 < arg_591_1.time_ and arg_591_1.time_ <= var_594_19 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, false)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_21 = arg_591_1:GetWordFromCfg(1104905141)
				local var_594_22 = arg_591_1:FormatText(var_594_21.content)

				arg_591_1.text_.text = var_594_22

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_23 = 38
				local var_594_24 = utf8.len(var_594_22)
				local var_594_25 = var_594_23 <= 0 and var_594_20 or var_594_20 * (var_594_24 / var_594_23)

				if var_594_25 > 0 and var_594_20 < var_594_25 then
					arg_591_1.talkMaxDuration = var_594_25

					if var_594_25 + var_594_19 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_25 + var_594_19
					end
				end

				arg_591_1.text_.text = var_594_22
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_26 = math.max(var_594_20, arg_591_1.talkMaxDuration)

			if var_594_19 <= arg_591_1.time_ and arg_591_1.time_ < var_594_19 + var_594_26 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_19) / var_594_26

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_19 + var_594_26 and arg_591_1.time_ < var_594_19 + var_594_26 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905142 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 1104905142
		arg_595_1.duration_ = 4.63

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play1104905143(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1049ui_story"].transform
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 then
				arg_595_1.var_.moveOldPos1049ui_story = var_598_0.localPosition
			end

			local var_598_2 = 0.001

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2
				local var_598_4 = Vector3.New(0, -1.2, -6)

				var_598_0.localPosition = Vector3.Lerp(arg_595_1.var_.moveOldPos1049ui_story, var_598_4, var_598_3)

				local var_598_5 = manager.ui.mainCamera.transform.position - var_598_0.position

				var_598_0.forward = Vector3.New(var_598_5.x, var_598_5.y, var_598_5.z)

				local var_598_6 = var_598_0.localEulerAngles

				var_598_6.z = 0
				var_598_6.x = 0
				var_598_0.localEulerAngles = var_598_6
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 then
				var_598_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_598_7 = manager.ui.mainCamera.transform.position - var_598_0.position

				var_598_0.forward = Vector3.New(var_598_7.x, var_598_7.y, var_598_7.z)

				local var_598_8 = var_598_0.localEulerAngles

				var_598_8.z = 0
				var_598_8.x = 0
				var_598_0.localEulerAngles = var_598_8
			end

			local var_598_9 = arg_595_1.actors_["1049ui_story"]
			local var_598_10 = 0

			if var_598_10 < arg_595_1.time_ and arg_595_1.time_ <= var_598_10 + arg_598_0 and not isNil(var_598_9) and arg_595_1.var_.characterEffect1049ui_story == nil then
				arg_595_1.var_.characterEffect1049ui_story = var_598_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_11 = 0.200000002980232

			if var_598_10 <= arg_595_1.time_ and arg_595_1.time_ < var_598_10 + var_598_11 and not isNil(var_598_9) then
				local var_598_12 = (arg_595_1.time_ - var_598_10) / var_598_11

				if arg_595_1.var_.characterEffect1049ui_story and not isNil(var_598_9) then
					arg_595_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_10 + var_598_11 and arg_595_1.time_ < var_598_10 + var_598_11 + arg_598_0 and not isNil(var_598_9) and arg_595_1.var_.characterEffect1049ui_story then
				arg_595_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_598_13 = 0

			if var_598_13 < arg_595_1.time_ and arg_595_1.time_ <= var_598_13 + arg_598_0 then
				arg_595_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_598_14 = 0

			if var_598_14 < arg_595_1.time_ and arg_595_1.time_ <= var_598_14 + arg_598_0 then
				arg_595_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_598_15 = 0
			local var_598_16 = 0.475

			if var_598_15 < arg_595_1.time_ and arg_595_1.time_ <= var_598_15 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_17 = arg_595_1:FormatText(StoryNameCfg[551].name)

				arg_595_1.leftNameTxt_.text = var_598_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_18 = arg_595_1:GetWordFromCfg(1104905142)
				local var_598_19 = arg_595_1:FormatText(var_598_18.content)

				arg_595_1.text_.text = var_598_19

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_20 = 19
				local var_598_21 = utf8.len(var_598_19)
				local var_598_22 = var_598_20 <= 0 and var_598_16 or var_598_16 * (var_598_21 / var_598_20)

				if var_598_22 > 0 and var_598_16 < var_598_22 then
					arg_595_1.talkMaxDuration = var_598_22

					if var_598_22 + var_598_15 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_22 + var_598_15
					end
				end

				arg_595_1.text_.text = var_598_19
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905142", "story_v_side_new_1104905.awb") ~= 0 then
					local var_598_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905142", "story_v_side_new_1104905.awb") / 1000

					if var_598_23 + var_598_15 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_23 + var_598_15
					end

					if var_598_18.prefab_name ~= "" and arg_595_1.actors_[var_598_18.prefab_name] ~= nil then
						local var_598_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_18.prefab_name].transform, "story_v_side_new_1104905", "1104905142", "story_v_side_new_1104905.awb")

						arg_595_1:RecordAudio("1104905142", var_598_24)
						arg_595_1:RecordAudio("1104905142", var_598_24)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905142", "story_v_side_new_1104905.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905142", "story_v_side_new_1104905.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_25 = math.max(var_598_16, arg_595_1.talkMaxDuration)

			if var_598_15 <= arg_595_1.time_ and arg_595_1.time_ < var_598_15 + var_598_25 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_15) / var_598_25

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_15 + var_598_25 and arg_595_1.time_ < var_598_15 + var_598_25 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905143 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1104905143
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1104905144(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1049ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.characterEffect1049ui_story == nil then
				arg_599_1.var_.characterEffect1049ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.200000002980232

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 and not isNil(var_602_0) then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1049ui_story and not isNil(var_602_0) then
					local var_602_4 = Mathf.Lerp(0, 0.5, var_602_3)

					arg_599_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_599_1.var_.characterEffect1049ui_story.fillRatio = var_602_4
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.characterEffect1049ui_story then
				local var_602_5 = 0.5

				arg_599_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_599_1.var_.characterEffect1049ui_story.fillRatio = var_602_5
			end

			local var_602_6 = 0
			local var_602_7 = 0.325

			if var_602_6 < arg_599_1.time_ and arg_599_1.time_ <= var_602_6 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_8 = arg_599_1:FormatText(StoryNameCfg[7].name)

				arg_599_1.leftNameTxt_.text = var_602_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_9 = arg_599_1:GetWordFromCfg(1104905143)
				local var_602_10 = arg_599_1:FormatText(var_602_9.content)

				arg_599_1.text_.text = var_602_10

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_11 = 13
				local var_602_12 = utf8.len(var_602_10)
				local var_602_13 = var_602_11 <= 0 and var_602_7 or var_602_7 * (var_602_12 / var_602_11)

				if var_602_13 > 0 and var_602_7 < var_602_13 then
					arg_599_1.talkMaxDuration = var_602_13

					if var_602_13 + var_602_6 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_13 + var_602_6
					end
				end

				arg_599_1.text_.text = var_602_10
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_14 = math.max(var_602_7, arg_599_1.talkMaxDuration)

			if var_602_6 <= arg_599_1.time_ and arg_599_1.time_ < var_602_6 + var_602_14 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_6) / var_602_14

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_6 + var_602_14 and arg_599_1.time_ < var_602_6 + var_602_14 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905144 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1104905144
		arg_603_1.duration_ = 7.9

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1104905145(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["1049ui_story"]
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.characterEffect1049ui_story == nil then
				arg_603_1.var_.characterEffect1049ui_story = var_606_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_606_2 = 0.200000002980232

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 and not isNil(var_606_0) then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2

				if arg_603_1.var_.characterEffect1049ui_story and not isNil(var_606_0) then
					arg_603_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.characterEffect1049ui_story then
				arg_603_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_606_4 = 0

			if var_606_4 < arg_603_1.time_ and arg_603_1.time_ <= var_606_4 + arg_606_0 then
				arg_603_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_606_5 = 0

			if var_606_5 < arg_603_1.time_ and arg_603_1.time_ <= var_606_5 + arg_606_0 then
				arg_603_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_606_6 = 0
			local var_606_7 = 0.775

			if var_606_6 < arg_603_1.time_ and arg_603_1.time_ <= var_606_6 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_8 = arg_603_1:FormatText(StoryNameCfg[551].name)

				arg_603_1.leftNameTxt_.text = var_606_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_9 = arg_603_1:GetWordFromCfg(1104905144)
				local var_606_10 = arg_603_1:FormatText(var_606_9.content)

				arg_603_1.text_.text = var_606_10

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_11 = 31
				local var_606_12 = utf8.len(var_606_10)
				local var_606_13 = var_606_11 <= 0 and var_606_7 or var_606_7 * (var_606_12 / var_606_11)

				if var_606_13 > 0 and var_606_7 < var_606_13 then
					arg_603_1.talkMaxDuration = var_606_13

					if var_606_13 + var_606_6 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_13 + var_606_6
					end
				end

				arg_603_1.text_.text = var_606_10
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905144", "story_v_side_new_1104905.awb") ~= 0 then
					local var_606_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905144", "story_v_side_new_1104905.awb") / 1000

					if var_606_14 + var_606_6 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_14 + var_606_6
					end

					if var_606_9.prefab_name ~= "" and arg_603_1.actors_[var_606_9.prefab_name] ~= nil then
						local var_606_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_9.prefab_name].transform, "story_v_side_new_1104905", "1104905144", "story_v_side_new_1104905.awb")

						arg_603_1:RecordAudio("1104905144", var_606_15)
						arg_603_1:RecordAudio("1104905144", var_606_15)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905144", "story_v_side_new_1104905.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905144", "story_v_side_new_1104905.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_16 = math.max(var_606_7, arg_603_1.talkMaxDuration)

			if var_606_6 <= arg_603_1.time_ and arg_603_1.time_ < var_606_6 + var_606_16 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_6) / var_606_16

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_6 + var_606_16 and arg_603_1.time_ < var_606_6 + var_606_16 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905145 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1104905145
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1104905146(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1049ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.characterEffect1049ui_story == nil then
				arg_607_1.var_.characterEffect1049ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.200000002980232

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 and not isNil(var_610_0) then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect1049ui_story and not isNil(var_610_0) then
					local var_610_4 = Mathf.Lerp(0, 0.5, var_610_3)

					arg_607_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_607_1.var_.characterEffect1049ui_story.fillRatio = var_610_4
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.characterEffect1049ui_story then
				local var_610_5 = 0.5

				arg_607_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_607_1.var_.characterEffect1049ui_story.fillRatio = var_610_5
			end

			local var_610_6 = 0
			local var_610_7 = 0.225

			if var_610_6 < arg_607_1.time_ and arg_607_1.time_ <= var_610_6 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_8 = arg_607_1:FormatText(StoryNameCfg[7].name)

				arg_607_1.leftNameTxt_.text = var_610_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_9 = arg_607_1:GetWordFromCfg(1104905145)
				local var_610_10 = arg_607_1:FormatText(var_610_9.content)

				arg_607_1.text_.text = var_610_10

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_11 = 9
				local var_610_12 = utf8.len(var_610_10)
				local var_610_13 = var_610_11 <= 0 and var_610_7 or var_610_7 * (var_610_12 / var_610_11)

				if var_610_13 > 0 and var_610_7 < var_610_13 then
					arg_607_1.talkMaxDuration = var_610_13

					if var_610_13 + var_610_6 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_13 + var_610_6
					end
				end

				arg_607_1.text_.text = var_610_10
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_14 = math.max(var_610_7, arg_607_1.talkMaxDuration)

			if var_610_6 <= arg_607_1.time_ and arg_607_1.time_ < var_610_6 + var_610_14 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_6) / var_610_14

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_6 + var_610_14 and arg_607_1.time_ < var_610_6 + var_610_14 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905146 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1104905146
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1104905147(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1049ui_story"].transform
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1.var_.moveOldPos1049ui_story = var_614_0.localPosition
			end

			local var_614_2 = 0.001

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2
				local var_614_4 = Vector3.New(0, 100, 0)

				var_614_0.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1049ui_story, var_614_4, var_614_3)

				local var_614_5 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_5.x, var_614_5.y, var_614_5.z)

				local var_614_6 = var_614_0.localEulerAngles

				var_614_6.z = 0
				var_614_6.x = 0
				var_614_0.localEulerAngles = var_614_6
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 then
				var_614_0.localPosition = Vector3.New(0, 100, 0)

				local var_614_7 = manager.ui.mainCamera.transform.position - var_614_0.position

				var_614_0.forward = Vector3.New(var_614_7.x, var_614_7.y, var_614_7.z)

				local var_614_8 = var_614_0.localEulerAngles

				var_614_8.z = 0
				var_614_8.x = 0
				var_614_0.localEulerAngles = var_614_8
			end

			local var_614_9 = 0
			local var_614_10 = 1.4

			if var_614_9 < arg_611_1.time_ and arg_611_1.time_ <= var_614_9 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_11 = arg_611_1:GetWordFromCfg(1104905146)
				local var_614_12 = arg_611_1:FormatText(var_614_11.content)

				arg_611_1.text_.text = var_614_12

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_13 = 56
				local var_614_14 = utf8.len(var_614_12)
				local var_614_15 = var_614_13 <= 0 and var_614_10 or var_614_10 * (var_614_14 / var_614_13)

				if var_614_15 > 0 and var_614_10 < var_614_15 then
					arg_611_1.talkMaxDuration = var_614_15

					if var_614_15 + var_614_9 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_15 + var_614_9
					end
				end

				arg_611_1.text_.text = var_614_12
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_16 = math.max(var_614_10, arg_611_1.talkMaxDuration)

			if var_614_9 <= arg_611_1.time_ and arg_611_1.time_ < var_614_9 + var_614_16 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_9) / var_614_16

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_9 + var_614_16 and arg_611_1.time_ < var_614_9 + var_614_16 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905147 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1104905147
		arg_615_1.duration_ = 4.3

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1104905148(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = arg_615_1.actors_["1049ui_story"].transform
			local var_618_1 = 0

			if var_618_1 < arg_615_1.time_ and arg_615_1.time_ <= var_618_1 + arg_618_0 then
				arg_615_1.var_.moveOldPos1049ui_story = var_618_0.localPosition
			end

			local var_618_2 = 0.001

			if var_618_1 <= arg_615_1.time_ and arg_615_1.time_ < var_618_1 + var_618_2 then
				local var_618_3 = (arg_615_1.time_ - var_618_1) / var_618_2
				local var_618_4 = Vector3.New(0, -1.2, -6)

				var_618_0.localPosition = Vector3.Lerp(arg_615_1.var_.moveOldPos1049ui_story, var_618_4, var_618_3)

				local var_618_5 = manager.ui.mainCamera.transform.position - var_618_0.position

				var_618_0.forward = Vector3.New(var_618_5.x, var_618_5.y, var_618_5.z)

				local var_618_6 = var_618_0.localEulerAngles

				var_618_6.z = 0
				var_618_6.x = 0
				var_618_0.localEulerAngles = var_618_6
			end

			if arg_615_1.time_ >= var_618_1 + var_618_2 and arg_615_1.time_ < var_618_1 + var_618_2 + arg_618_0 then
				var_618_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_618_7 = manager.ui.mainCamera.transform.position - var_618_0.position

				var_618_0.forward = Vector3.New(var_618_7.x, var_618_7.y, var_618_7.z)

				local var_618_8 = var_618_0.localEulerAngles

				var_618_8.z = 0
				var_618_8.x = 0
				var_618_0.localEulerAngles = var_618_8
			end

			local var_618_9 = arg_615_1.actors_["1049ui_story"]
			local var_618_10 = 0

			if var_618_10 < arg_615_1.time_ and arg_615_1.time_ <= var_618_10 + arg_618_0 and not isNil(var_618_9) and arg_615_1.var_.characterEffect1049ui_story == nil then
				arg_615_1.var_.characterEffect1049ui_story = var_618_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_618_11 = 0.200000002980232

			if var_618_10 <= arg_615_1.time_ and arg_615_1.time_ < var_618_10 + var_618_11 and not isNil(var_618_9) then
				local var_618_12 = (arg_615_1.time_ - var_618_10) / var_618_11

				if arg_615_1.var_.characterEffect1049ui_story and not isNil(var_618_9) then
					arg_615_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_615_1.time_ >= var_618_10 + var_618_11 and arg_615_1.time_ < var_618_10 + var_618_11 + arg_618_0 and not isNil(var_618_9) and arg_615_1.var_.characterEffect1049ui_story then
				arg_615_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_618_13 = 0

			if var_618_13 < arg_615_1.time_ and arg_615_1.time_ <= var_618_13 + arg_618_0 then
				arg_615_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action2_1")
			end

			local var_618_14 = 0

			if var_618_14 < arg_615_1.time_ and arg_615_1.time_ <= var_618_14 + arg_618_0 then
				arg_615_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_618_15 = 0
			local var_618_16 = 0.425

			if var_618_15 < arg_615_1.time_ and arg_615_1.time_ <= var_618_15 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_17 = arg_615_1:FormatText(StoryNameCfg[551].name)

				arg_615_1.leftNameTxt_.text = var_618_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_18 = arg_615_1:GetWordFromCfg(1104905147)
				local var_618_19 = arg_615_1:FormatText(var_618_18.content)

				arg_615_1.text_.text = var_618_19

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_20 = 17
				local var_618_21 = utf8.len(var_618_19)
				local var_618_22 = var_618_20 <= 0 and var_618_16 or var_618_16 * (var_618_21 / var_618_20)

				if var_618_22 > 0 and var_618_16 < var_618_22 then
					arg_615_1.talkMaxDuration = var_618_22

					if var_618_22 + var_618_15 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_22 + var_618_15
					end
				end

				arg_615_1.text_.text = var_618_19
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905147", "story_v_side_new_1104905.awb") ~= 0 then
					local var_618_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905147", "story_v_side_new_1104905.awb") / 1000

					if var_618_23 + var_618_15 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_23 + var_618_15
					end

					if var_618_18.prefab_name ~= "" and arg_615_1.actors_[var_618_18.prefab_name] ~= nil then
						local var_618_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_18.prefab_name].transform, "story_v_side_new_1104905", "1104905147", "story_v_side_new_1104905.awb")

						arg_615_1:RecordAudio("1104905147", var_618_24)
						arg_615_1:RecordAudio("1104905147", var_618_24)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905147", "story_v_side_new_1104905.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905147", "story_v_side_new_1104905.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_25 = math.max(var_618_16, arg_615_1.talkMaxDuration)

			if var_618_15 <= arg_615_1.time_ and arg_615_1.time_ < var_618_15 + var_618_25 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_15) / var_618_25

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_15 + var_618_25 and arg_615_1.time_ < var_618_15 + var_618_25 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905148 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 1104905148
		arg_619_1.duration_ = 12.13

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play1104905149(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 1.4

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[551].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(1104905148)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905148", "story_v_side_new_1104905.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905148", "story_v_side_new_1104905.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_side_new_1104905", "1104905148", "story_v_side_new_1104905.awb")

						arg_619_1:RecordAudio("1104905148", var_622_9)
						arg_619_1:RecordAudio("1104905148", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905148", "story_v_side_new_1104905.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905148", "story_v_side_new_1104905.awb")
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
	Play1104905149 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 1104905149
		arg_623_1.duration_ = 10.93

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play1104905150(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 1.125

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_2 = arg_623_1:FormatText(StoryNameCfg[551].name)

				arg_623_1.leftNameTxt_.text = var_626_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_3 = arg_623_1:GetWordFromCfg(1104905149)
				local var_626_4 = arg_623_1:FormatText(var_626_3.content)

				arg_623_1.text_.text = var_626_4

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905149", "story_v_side_new_1104905.awb") ~= 0 then
					local var_626_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905149", "story_v_side_new_1104905.awb") / 1000

					if var_626_8 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_8 + var_626_0
					end

					if var_626_3.prefab_name ~= "" and arg_623_1.actors_[var_626_3.prefab_name] ~= nil then
						local var_626_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_3.prefab_name].transform, "story_v_side_new_1104905", "1104905149", "story_v_side_new_1104905.awb")

						arg_623_1:RecordAudio("1104905149", var_626_9)
						arg_623_1:RecordAudio("1104905149", var_626_9)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905149", "story_v_side_new_1104905.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905149", "story_v_side_new_1104905.awb")
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
	Play1104905150 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 1104905150
		arg_627_1.duration_ = 3.03

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play1104905151(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva", "EmotionTimelineAnimator")
			end

			local var_630_2 = 0
			local var_630_3 = 0.275

			if var_630_2 < arg_627_1.time_ and arg_627_1.time_ <= var_630_2 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_4 = arg_627_1:FormatText(StoryNameCfg[551].name)

				arg_627_1.leftNameTxt_.text = var_630_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_5 = arg_627_1:GetWordFromCfg(1104905150)
				local var_630_6 = arg_627_1:FormatText(var_630_5.content)

				arg_627_1.text_.text = var_630_6

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_7 = 11
				local var_630_8 = utf8.len(var_630_6)
				local var_630_9 = var_630_7 <= 0 and var_630_3 or var_630_3 * (var_630_8 / var_630_7)

				if var_630_9 > 0 and var_630_3 < var_630_9 then
					arg_627_1.talkMaxDuration = var_630_9

					if var_630_9 + var_630_2 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_9 + var_630_2
					end
				end

				arg_627_1.text_.text = var_630_6
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905150", "story_v_side_new_1104905.awb") ~= 0 then
					local var_630_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905150", "story_v_side_new_1104905.awb") / 1000

					if var_630_10 + var_630_2 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_10 + var_630_2
					end

					if var_630_5.prefab_name ~= "" and arg_627_1.actors_[var_630_5.prefab_name] ~= nil then
						local var_630_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_5.prefab_name].transform, "story_v_side_new_1104905", "1104905150", "story_v_side_new_1104905.awb")

						arg_627_1:RecordAudio("1104905150", var_630_11)
						arg_627_1:RecordAudio("1104905150", var_630_11)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905150", "story_v_side_new_1104905.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905150", "story_v_side_new_1104905.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_12 = math.max(var_630_3, arg_627_1.talkMaxDuration)

			if var_630_2 <= arg_627_1.time_ and arg_627_1.time_ < var_630_2 + var_630_12 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_2) / var_630_12

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_2 + var_630_12 and arg_627_1.time_ < var_630_2 + var_630_12 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905151 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 1104905151
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play1104905152(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1049ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and not isNil(var_634_0) and arg_631_1.var_.characterEffect1049ui_story == nil then
				arg_631_1.var_.characterEffect1049ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.200000002980232

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 and not isNil(var_634_0) then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1049ui_story and not isNil(var_634_0) then
					local var_634_4 = Mathf.Lerp(0, 0.5, var_634_3)

					arg_631_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1049ui_story.fillRatio = var_634_4
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and not isNil(var_634_0) and arg_631_1.var_.characterEffect1049ui_story then
				local var_634_5 = 0.5

				arg_631_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1049ui_story.fillRatio = var_634_5
			end

			local var_634_6 = 0
			local var_634_7 = 0.825

			if var_634_6 < arg_631_1.time_ and arg_631_1.time_ <= var_634_6 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_8 = arg_631_1:FormatText(StoryNameCfg[7].name)

				arg_631_1.leftNameTxt_.text = var_634_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_9 = arg_631_1:GetWordFromCfg(1104905151)
				local var_634_10 = arg_631_1:FormatText(var_634_9.content)

				arg_631_1.text_.text = var_634_10

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_11 = 33
				local var_634_12 = utf8.len(var_634_10)
				local var_634_13 = var_634_11 <= 0 and var_634_7 or var_634_7 * (var_634_12 / var_634_11)

				if var_634_13 > 0 and var_634_7 < var_634_13 then
					arg_631_1.talkMaxDuration = var_634_13

					if var_634_13 + var_634_6 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_13 + var_634_6
					end
				end

				arg_631_1.text_.text = var_634_10
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_14 = math.max(var_634_7, arg_631_1.talkMaxDuration)

			if var_634_6 <= arg_631_1.time_ and arg_631_1.time_ < var_634_6 + var_634_14 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_6) / var_634_14

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_6 + var_634_14 and arg_631_1.time_ < var_634_6 + var_634_14 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905152 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 1104905152
		arg_635_1.duration_ = 7.9

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play1104905153(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1049ui_story"]
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 and not isNil(var_638_0) and arg_635_1.var_.characterEffect1049ui_story == nil then
				arg_635_1.var_.characterEffect1049ui_story = var_638_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_2 = 0.200000002980232

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 and not isNil(var_638_0) then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2

				if arg_635_1.var_.characterEffect1049ui_story and not isNil(var_638_0) then
					arg_635_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 and not isNil(var_638_0) and arg_635_1.var_.characterEffect1049ui_story then
				arg_635_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_638_4 = 0

			if var_638_4 < arg_635_1.time_ and arg_635_1.time_ <= var_638_4 + arg_638_0 then
				arg_635_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_638_5 = 0
			local var_638_6 = 0.85

			if var_638_5 < arg_635_1.time_ and arg_635_1.time_ <= var_638_5 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_7 = arg_635_1:FormatText(StoryNameCfg[551].name)

				arg_635_1.leftNameTxt_.text = var_638_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_8 = arg_635_1:GetWordFromCfg(1104905152)
				local var_638_9 = arg_635_1:FormatText(var_638_8.content)

				arg_635_1.text_.text = var_638_9

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_10 = 34
				local var_638_11 = utf8.len(var_638_9)
				local var_638_12 = var_638_10 <= 0 and var_638_6 or var_638_6 * (var_638_11 / var_638_10)

				if var_638_12 > 0 and var_638_6 < var_638_12 then
					arg_635_1.talkMaxDuration = var_638_12

					if var_638_12 + var_638_5 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_12 + var_638_5
					end
				end

				arg_635_1.text_.text = var_638_9
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905152", "story_v_side_new_1104905.awb") ~= 0 then
					local var_638_13 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905152", "story_v_side_new_1104905.awb") / 1000

					if var_638_13 + var_638_5 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_13 + var_638_5
					end

					if var_638_8.prefab_name ~= "" and arg_635_1.actors_[var_638_8.prefab_name] ~= nil then
						local var_638_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_8.prefab_name].transform, "story_v_side_new_1104905", "1104905152", "story_v_side_new_1104905.awb")

						arg_635_1:RecordAudio("1104905152", var_638_14)
						arg_635_1:RecordAudio("1104905152", var_638_14)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905152", "story_v_side_new_1104905.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905152", "story_v_side_new_1104905.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_15 = math.max(var_638_6, arg_635_1.talkMaxDuration)

			if var_638_5 <= arg_635_1.time_ and arg_635_1.time_ < var_638_5 + var_638_15 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_5) / var_638_15

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_5 + var_638_15 and arg_635_1.time_ < var_638_5 + var_638_15 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905153 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 1104905153
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play1104905154(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1049ui_story"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and not isNil(var_642_0) and arg_639_1.var_.characterEffect1049ui_story == nil then
				arg_639_1.var_.characterEffect1049ui_story = var_642_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_2 = 0.200000002980232

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 and not isNil(var_642_0) then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.characterEffect1049ui_story and not isNil(var_642_0) then
					local var_642_4 = Mathf.Lerp(0, 0.5, var_642_3)

					arg_639_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_639_1.var_.characterEffect1049ui_story.fillRatio = var_642_4
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and not isNil(var_642_0) and arg_639_1.var_.characterEffect1049ui_story then
				local var_642_5 = 0.5

				arg_639_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_639_1.var_.characterEffect1049ui_story.fillRatio = var_642_5
			end

			local var_642_6 = 0
			local var_642_7 = 0.35

			if var_642_6 < arg_639_1.time_ and arg_639_1.time_ <= var_642_6 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_8 = arg_639_1:FormatText(StoryNameCfg[7].name)

				arg_639_1.leftNameTxt_.text = var_642_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_9 = arg_639_1:GetWordFromCfg(1104905153)
				local var_642_10 = arg_639_1:FormatText(var_642_9.content)

				arg_639_1.text_.text = var_642_10

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_11 = 14
				local var_642_12 = utf8.len(var_642_10)
				local var_642_13 = var_642_11 <= 0 and var_642_7 or var_642_7 * (var_642_12 / var_642_11)

				if var_642_13 > 0 and var_642_7 < var_642_13 then
					arg_639_1.talkMaxDuration = var_642_13

					if var_642_13 + var_642_6 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_13 + var_642_6
					end
				end

				arg_639_1.text_.text = var_642_10
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_14 = math.max(var_642_7, arg_639_1.talkMaxDuration)

			if var_642_6 <= arg_639_1.time_ and arg_639_1.time_ < var_642_6 + var_642_14 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_6) / var_642_14

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_6 + var_642_14 and arg_639_1.time_ < var_642_6 + var_642_14 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905154 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 1104905154
		arg_643_1.duration_ = 19.73

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play1104905155(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1049ui_story"]
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 and not isNil(var_646_0) and arg_643_1.var_.characterEffect1049ui_story == nil then
				arg_643_1.var_.characterEffect1049ui_story = var_646_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_2 = 0.200000002980232

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 and not isNil(var_646_0) then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2

				if arg_643_1.var_.characterEffect1049ui_story and not isNil(var_646_0) then
					arg_643_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 and not isNil(var_646_0) and arg_643_1.var_.characterEffect1049ui_story then
				arg_643_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_646_4 = 0

			if var_646_4 < arg_643_1.time_ and arg_643_1.time_ <= var_646_4 + arg_646_0 then
				arg_643_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_1")
			end

			local var_646_5 = 0

			if var_646_5 < arg_643_1.time_ and arg_643_1.time_ <= var_646_5 + arg_646_0 then
				arg_643_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_646_6 = 0
			local var_646_7 = 1.75

			if var_646_6 < arg_643_1.time_ and arg_643_1.time_ <= var_646_6 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_8 = arg_643_1:FormatText(StoryNameCfg[551].name)

				arg_643_1.leftNameTxt_.text = var_646_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_9 = arg_643_1:GetWordFromCfg(1104905154)
				local var_646_10 = arg_643_1:FormatText(var_646_9.content)

				arg_643_1.text_.text = var_646_10

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_11 = 70
				local var_646_12 = utf8.len(var_646_10)
				local var_646_13 = var_646_11 <= 0 and var_646_7 or var_646_7 * (var_646_12 / var_646_11)

				if var_646_13 > 0 and var_646_7 < var_646_13 then
					arg_643_1.talkMaxDuration = var_646_13

					if var_646_13 + var_646_6 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_13 + var_646_6
					end
				end

				arg_643_1.text_.text = var_646_10
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905154", "story_v_side_new_1104905.awb") ~= 0 then
					local var_646_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905154", "story_v_side_new_1104905.awb") / 1000

					if var_646_14 + var_646_6 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_14 + var_646_6
					end

					if var_646_9.prefab_name ~= "" and arg_643_1.actors_[var_646_9.prefab_name] ~= nil then
						local var_646_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_9.prefab_name].transform, "story_v_side_new_1104905", "1104905154", "story_v_side_new_1104905.awb")

						arg_643_1:RecordAudio("1104905154", var_646_15)
						arg_643_1:RecordAudio("1104905154", var_646_15)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905154", "story_v_side_new_1104905.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905154", "story_v_side_new_1104905.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_16 = math.max(var_646_7, arg_643_1.talkMaxDuration)

			if var_646_6 <= arg_643_1.time_ and arg_643_1.time_ < var_646_6 + var_646_16 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_6) / var_646_16

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_6 + var_646_16 and arg_643_1.time_ < var_646_6 + var_646_16 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905155 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 1104905155
		arg_647_1.duration_ = 5

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play1104905156(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1049ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and not isNil(var_650_0) and arg_647_1.var_.characterEffect1049ui_story == nil then
				arg_647_1.var_.characterEffect1049ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.200000002980232

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 and not isNil(var_650_0) then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect1049ui_story and not isNil(var_650_0) then
					local var_650_4 = Mathf.Lerp(0, 0.5, var_650_3)

					arg_647_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_647_1.var_.characterEffect1049ui_story.fillRatio = var_650_4
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and not isNil(var_650_0) and arg_647_1.var_.characterEffect1049ui_story then
				local var_650_5 = 0.5

				arg_647_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_647_1.var_.characterEffect1049ui_story.fillRatio = var_650_5
			end

			local var_650_6 = 0
			local var_650_7 = 0.275

			if var_650_6 < arg_647_1.time_ and arg_647_1.time_ <= var_650_6 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_8 = arg_647_1:FormatText(StoryNameCfg[7].name)

				arg_647_1.leftNameTxt_.text = var_650_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_9 = arg_647_1:GetWordFromCfg(1104905155)
				local var_650_10 = arg_647_1:FormatText(var_650_9.content)

				arg_647_1.text_.text = var_650_10

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_11 = 11
				local var_650_12 = utf8.len(var_650_10)
				local var_650_13 = var_650_11 <= 0 and var_650_7 or var_650_7 * (var_650_12 / var_650_11)

				if var_650_13 > 0 and var_650_7 < var_650_13 then
					arg_647_1.talkMaxDuration = var_650_13

					if var_650_13 + var_650_6 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_13 + var_650_6
					end
				end

				arg_647_1.text_.text = var_650_10
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)
				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_14 = math.max(var_650_7, arg_647_1.talkMaxDuration)

			if var_650_6 <= arg_647_1.time_ and arg_647_1.time_ < var_650_6 + var_650_14 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_6) / var_650_14

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_6 + var_650_14 and arg_647_1.time_ < var_650_6 + var_650_14 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905156 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 1104905156
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play1104905157(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1049ui_story"].transform
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 then
				arg_651_1.var_.moveOldPos1049ui_story = var_654_0.localPosition
			end

			local var_654_2 = 0.001

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2
				local var_654_4 = Vector3.New(0, 100, 0)

				var_654_0.localPosition = Vector3.Lerp(arg_651_1.var_.moveOldPos1049ui_story, var_654_4, var_654_3)

				local var_654_5 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_5.x, var_654_5.y, var_654_5.z)

				local var_654_6 = var_654_0.localEulerAngles

				var_654_6.z = 0
				var_654_6.x = 0
				var_654_0.localEulerAngles = var_654_6
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 then
				var_654_0.localPosition = Vector3.New(0, 100, 0)

				local var_654_7 = manager.ui.mainCamera.transform.position - var_654_0.position

				var_654_0.forward = Vector3.New(var_654_7.x, var_654_7.y, var_654_7.z)

				local var_654_8 = var_654_0.localEulerAngles

				var_654_8.z = 0
				var_654_8.x = 0
				var_654_0.localEulerAngles = var_654_8
			end

			local var_654_9 = 0
			local var_654_10 = 1

			if var_654_9 < arg_651_1.time_ and arg_651_1.time_ <= var_654_9 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, false)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_11 = arg_651_1:GetWordFromCfg(1104905156)
				local var_654_12 = arg_651_1:FormatText(var_654_11.content)

				arg_651_1.text_.text = var_654_12

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_13 = 40
				local var_654_14 = utf8.len(var_654_12)
				local var_654_15 = var_654_13 <= 0 and var_654_10 or var_654_10 * (var_654_14 / var_654_13)

				if var_654_15 > 0 and var_654_10 < var_654_15 then
					arg_651_1.talkMaxDuration = var_654_15

					if var_654_15 + var_654_9 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_15 + var_654_9
					end
				end

				arg_651_1.text_.text = var_654_12
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_16 = math.max(var_654_10, arg_651_1.talkMaxDuration)

			if var_654_9 <= arg_651_1.time_ and arg_651_1.time_ < var_654_9 + var_654_16 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_9) / var_654_16

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_9 + var_654_16 and arg_651_1.time_ < var_654_9 + var_654_16 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905157 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1104905157
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1104905158(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.725

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[7].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(1104905157)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 29
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
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_8 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_8 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_8

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_8 and arg_655_1.time_ < var_658_0 + var_658_8 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905158 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1104905158
		arg_659_1.duration_ = 3.8

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1104905159(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1049ui_story"].transform
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 then
				arg_659_1.var_.moveOldPos1049ui_story = var_662_0.localPosition
			end

			local var_662_2 = 0.001

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2
				local var_662_4 = Vector3.New(0, -1.2, -6)

				var_662_0.localPosition = Vector3.Lerp(arg_659_1.var_.moveOldPos1049ui_story, var_662_4, var_662_3)

				local var_662_5 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_5.x, var_662_5.y, var_662_5.z)

				local var_662_6 = var_662_0.localEulerAngles

				var_662_6.z = 0
				var_662_6.x = 0
				var_662_0.localEulerAngles = var_662_6
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 then
				var_662_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_662_7 = manager.ui.mainCamera.transform.position - var_662_0.position

				var_662_0.forward = Vector3.New(var_662_7.x, var_662_7.y, var_662_7.z)

				local var_662_8 = var_662_0.localEulerAngles

				var_662_8.z = 0
				var_662_8.x = 0
				var_662_0.localEulerAngles = var_662_8
			end

			local var_662_9 = arg_659_1.actors_["1049ui_story"]
			local var_662_10 = 0

			if var_662_10 < arg_659_1.time_ and arg_659_1.time_ <= var_662_10 + arg_662_0 and not isNil(var_662_9) and arg_659_1.var_.characterEffect1049ui_story == nil then
				arg_659_1.var_.characterEffect1049ui_story = var_662_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_11 = 0.200000002980232

			if var_662_10 <= arg_659_1.time_ and arg_659_1.time_ < var_662_10 + var_662_11 and not isNil(var_662_9) then
				local var_662_12 = (arg_659_1.time_ - var_662_10) / var_662_11

				if arg_659_1.var_.characterEffect1049ui_story and not isNil(var_662_9) then
					arg_659_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_659_1.time_ >= var_662_10 + var_662_11 and arg_659_1.time_ < var_662_10 + var_662_11 + arg_662_0 and not isNil(var_662_9) and arg_659_1.var_.characterEffect1049ui_story then
				arg_659_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_662_13 = 0

			if var_662_13 < arg_659_1.time_ and arg_659_1.time_ <= var_662_13 + arg_662_0 then
				arg_659_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_662_14 = 0

			if var_662_14 < arg_659_1.time_ and arg_659_1.time_ <= var_662_14 + arg_662_0 then
				arg_659_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_662_15 = 0
			local var_662_16 = 0.325

			if var_662_15 < arg_659_1.time_ and arg_659_1.time_ <= var_662_15 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_17 = arg_659_1:FormatText(StoryNameCfg[551].name)

				arg_659_1.leftNameTxt_.text = var_662_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_18 = arg_659_1:GetWordFromCfg(1104905158)
				local var_662_19 = arg_659_1:FormatText(var_662_18.content)

				arg_659_1.text_.text = var_662_19

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_20 = 13
				local var_662_21 = utf8.len(var_662_19)
				local var_662_22 = var_662_20 <= 0 and var_662_16 or var_662_16 * (var_662_21 / var_662_20)

				if var_662_22 > 0 and var_662_16 < var_662_22 then
					arg_659_1.talkMaxDuration = var_662_22

					if var_662_22 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_22 + var_662_15
					end
				end

				arg_659_1.text_.text = var_662_19
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905158", "story_v_side_new_1104905.awb") ~= 0 then
					local var_662_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905158", "story_v_side_new_1104905.awb") / 1000

					if var_662_23 + var_662_15 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_23 + var_662_15
					end

					if var_662_18.prefab_name ~= "" and arg_659_1.actors_[var_662_18.prefab_name] ~= nil then
						local var_662_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_18.prefab_name].transform, "story_v_side_new_1104905", "1104905158", "story_v_side_new_1104905.awb")

						arg_659_1:RecordAudio("1104905158", var_662_24)
						arg_659_1:RecordAudio("1104905158", var_662_24)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905158", "story_v_side_new_1104905.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905158", "story_v_side_new_1104905.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_25 = math.max(var_662_16, arg_659_1.talkMaxDuration)

			if var_662_15 <= arg_659_1.time_ and arg_659_1.time_ < var_662_15 + var_662_25 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_15) / var_662_25

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_15 + var_662_25 and arg_659_1.time_ < var_662_15 + var_662_25 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905159 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1104905159
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1104905160(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1049ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and not isNil(var_666_0) and arg_663_1.var_.characterEffect1049ui_story == nil then
				arg_663_1.var_.characterEffect1049ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.200000002980232

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 and not isNil(var_666_0) then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1049ui_story and not isNil(var_666_0) then
					local var_666_4 = Mathf.Lerp(0, 0.5, var_666_3)

					arg_663_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_663_1.var_.characterEffect1049ui_story.fillRatio = var_666_4
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and not isNil(var_666_0) and arg_663_1.var_.characterEffect1049ui_story then
				local var_666_5 = 0.5

				arg_663_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_663_1.var_.characterEffect1049ui_story.fillRatio = var_666_5
			end

			local var_666_6 = 0
			local var_666_7 = 1

			if var_666_6 < arg_663_1.time_ and arg_663_1.time_ <= var_666_6 + arg_666_0 then
				local var_666_8 = "play"
				local var_666_9 = "effect"

				arg_663_1:AudioAction(var_666_8, var_666_9, "se_story_side_1058", "se_story_side_1058_bell", "")
			end

			local var_666_10 = 0
			local var_666_11 = 0.675

			if var_666_10 < arg_663_1.time_ and arg_663_1.time_ <= var_666_10 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_12 = arg_663_1:FormatText(StoryNameCfg[7].name)

				arg_663_1.leftNameTxt_.text = var_666_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_13 = arg_663_1:GetWordFromCfg(1104905159)
				local var_666_14 = arg_663_1:FormatText(var_666_13.content)

				arg_663_1.text_.text = var_666_14

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_15 = 27
				local var_666_16 = utf8.len(var_666_14)
				local var_666_17 = var_666_15 <= 0 and var_666_11 or var_666_11 * (var_666_16 / var_666_15)

				if var_666_17 > 0 and var_666_11 < var_666_17 then
					arg_663_1.talkMaxDuration = var_666_17

					if var_666_17 + var_666_10 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_17 + var_666_10
					end
				end

				arg_663_1.text_.text = var_666_14
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_18 = math.max(var_666_11, arg_663_1.talkMaxDuration)

			if var_666_10 <= arg_663_1.time_ and arg_663_1.time_ < var_666_10 + var_666_18 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_10) / var_666_18

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_10 + var_666_18 and arg_663_1.time_ < var_666_10 + var_666_18 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905160 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1104905160
		arg_667_1.duration_ = 9

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1104905161(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 2

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				local var_670_1 = manager.ui.mainCamera.transform.localPosition
				local var_670_2 = Vector3.New(0, 0, 10) + Vector3.New(var_670_1.x, var_670_1.y, 0)
				local var_670_3 = arg_667_1.bgs_.STblack

				var_670_3.transform.localPosition = var_670_2
				var_670_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_670_4 = var_670_3:GetComponent("SpriteRenderer")

				if var_670_4 and var_670_4.sprite then
					local var_670_5 = (var_670_3.transform.localPosition - var_670_1).z
					local var_670_6 = manager.ui.mainCameraCom_
					local var_670_7 = 2 * var_670_5 * Mathf.Tan(var_670_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_670_8 = var_670_7 * var_670_6.aspect
					local var_670_9 = var_670_4.sprite.bounds.size.x
					local var_670_10 = var_670_4.sprite.bounds.size.y
					local var_670_11 = var_670_8 / var_670_9
					local var_670_12 = var_670_7 / var_670_10
					local var_670_13 = var_670_12 < var_670_11 and var_670_11 or var_670_12

					var_670_3.transform.localScale = Vector3.New(var_670_13, var_670_13, 0)
				end

				for iter_670_0, iter_670_1 in pairs(arg_667_1.bgs_) do
					if iter_670_0 ~= "STblack" then
						iter_670_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_670_14 = 3.999999999999

			if var_670_14 < arg_667_1.time_ and arg_667_1.time_ <= var_670_14 + arg_670_0 then
				arg_667_1.allBtn_.enabled = false
			end

			local var_670_15 = 0.3

			if arg_667_1.time_ >= var_670_14 + var_670_15 and arg_667_1.time_ < var_670_14 + var_670_15 + arg_670_0 then
				arg_667_1.allBtn_.enabled = true
			end

			local var_670_16 = 0

			if var_670_16 < arg_667_1.time_ and arg_667_1.time_ <= var_670_16 + arg_670_0 then
				arg_667_1.mask_.enabled = true
				arg_667_1.mask_.raycastTarget = true

				arg_667_1:SetGaussion(false)
			end

			local var_670_17 = 2

			if var_670_16 <= arg_667_1.time_ and arg_667_1.time_ < var_670_16 + var_670_17 then
				local var_670_18 = (arg_667_1.time_ - var_670_16) / var_670_17
				local var_670_19 = Color.New(0, 0, 0)

				var_670_19.a = Mathf.Lerp(0, 1, var_670_18)
				arg_667_1.mask_.color = var_670_19
			end

			if arg_667_1.time_ >= var_670_16 + var_670_17 and arg_667_1.time_ < var_670_16 + var_670_17 + arg_670_0 then
				local var_670_20 = Color.New(0, 0, 0)

				var_670_20.a = 1
				arg_667_1.mask_.color = var_670_20
			end

			local var_670_21 = 2

			if var_670_21 < arg_667_1.time_ and arg_667_1.time_ <= var_670_21 + arg_670_0 then
				arg_667_1.mask_.enabled = true
				arg_667_1.mask_.raycastTarget = true

				arg_667_1:SetGaussion(false)
			end

			local var_670_22 = 2

			if var_670_21 <= arg_667_1.time_ and arg_667_1.time_ < var_670_21 + var_670_22 then
				local var_670_23 = (arg_667_1.time_ - var_670_21) / var_670_22
				local var_670_24 = Color.New(0, 0, 0)

				var_670_24.a = Mathf.Lerp(1, 0, var_670_23)
				arg_667_1.mask_.color = var_670_24
			end

			if arg_667_1.time_ >= var_670_21 + var_670_22 and arg_667_1.time_ < var_670_21 + var_670_22 + arg_670_0 then
				local var_670_25 = Color.New(0, 0, 0)
				local var_670_26 = 0

				arg_667_1.mask_.enabled = false
				var_670_25.a = var_670_26
				arg_667_1.mask_.color = var_670_25
			end

			local var_670_27 = arg_667_1.actors_["1049ui_story"].transform
			local var_670_28 = 1.96599999815226

			if var_670_28 < arg_667_1.time_ and arg_667_1.time_ <= var_670_28 + arg_670_0 then
				arg_667_1.var_.moveOldPos1049ui_story = var_670_27.localPosition
			end

			local var_670_29 = 0.001

			if var_670_28 <= arg_667_1.time_ and arg_667_1.time_ < var_670_28 + var_670_29 then
				local var_670_30 = (arg_667_1.time_ - var_670_28) / var_670_29
				local var_670_31 = Vector3.New(0, 100, 0)

				var_670_27.localPosition = Vector3.Lerp(arg_667_1.var_.moveOldPos1049ui_story, var_670_31, var_670_30)

				local var_670_32 = manager.ui.mainCamera.transform.position - var_670_27.position

				var_670_27.forward = Vector3.New(var_670_32.x, var_670_32.y, var_670_32.z)

				local var_670_33 = var_670_27.localEulerAngles

				var_670_33.z = 0
				var_670_33.x = 0
				var_670_27.localEulerAngles = var_670_33
			end

			if arg_667_1.time_ >= var_670_28 + var_670_29 and arg_667_1.time_ < var_670_28 + var_670_29 + arg_670_0 then
				var_670_27.localPosition = Vector3.New(0, 100, 0)

				local var_670_34 = manager.ui.mainCamera.transform.position - var_670_27.position

				var_670_27.forward = Vector3.New(var_670_34.x, var_670_34.y, var_670_34.z)

				local var_670_35 = var_670_27.localEulerAngles

				var_670_35.z = 0
				var_670_35.x = 0
				var_670_27.localEulerAngles = var_670_35
			end

			local var_670_36 = 0.4
			local var_670_37 = 1

			if var_670_36 < arg_667_1.time_ and arg_667_1.time_ <= var_670_36 + arg_670_0 then
				local var_670_38 = "stop"
				local var_670_39 = "effect"

				arg_667_1:AudioAction(var_670_38, var_670_39, "se_story_side_1049", "se_story_side_1049_amb_room", "")
			end

			local var_670_40 = 2.23333333333333
			local var_670_41 = 1

			if var_670_40 < arg_667_1.time_ and arg_667_1.time_ <= var_670_40 + arg_670_0 then
				local var_670_42 = "play"
				local var_670_43 = "effect"

				arg_667_1:AudioAction(var_670_42, var_670_43, "se_story_side_1033", "se_story_side_1033_footstep", "")
			end

			if arg_667_1.frameCnt_ <= 1 then
				arg_667_1.dialog_:SetActive(false)
			end

			local var_670_44 = 3.999999999999
			local var_670_45 = 0.625

			if var_670_44 < arg_667_1.time_ and arg_667_1.time_ <= var_670_44 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0

				arg_667_1.dialog_:SetActive(true)

				local var_670_46 = LeanTween.value(arg_667_1.dialog_, 0, 1, 0.3)

				var_670_46:setOnUpdate(LuaHelper.FloatAction(function(arg_671_0)
					arg_667_1.dialogCg_.alpha = arg_671_0
				end))
				var_670_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_667_1.dialog_)
					var_670_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_667_1.duration_ = arg_667_1.duration_ + 0.3

				SetActive(arg_667_1.leftNameGo_, false)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_47 = arg_667_1:GetWordFromCfg(1104905160)
				local var_670_48 = arg_667_1:FormatText(var_670_47.content)

				arg_667_1.text_.text = var_670_48

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_49 = 25
				local var_670_50 = utf8.len(var_670_48)
				local var_670_51 = var_670_49 <= 0 and var_670_45 or var_670_45 * (var_670_50 / var_670_49)

				if var_670_51 > 0 and var_670_45 < var_670_51 then
					arg_667_1.talkMaxDuration = var_670_51
					var_670_44 = var_670_44 + 0.3

					if var_670_51 + var_670_44 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_51 + var_670_44
					end
				end

				arg_667_1.text_.text = var_670_48
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_52 = var_670_44 + 0.3
			local var_670_53 = math.max(var_670_45, arg_667_1.talkMaxDuration)

			if var_670_52 <= arg_667_1.time_ and arg_667_1.time_ < var_670_52 + var_670_53 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_52) / var_670_53

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_52 + var_670_53 and arg_667_1.time_ < var_670_52 + var_670_53 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905161 = function(arg_673_0, arg_673_1)
		arg_673_1.time_ = 0
		arg_673_1.frameCnt_ = 0
		arg_673_1.state_ = "playing"
		arg_673_1.curTalkId_ = 1104905161
		arg_673_1.duration_ = 7

		SetActive(arg_673_1.tipsGo_, false)

		function arg_673_1.onSingleLineFinish_()
			arg_673_1.onSingleLineUpdate_ = nil
			arg_673_1.onSingleLineFinish_ = nil
			arg_673_1.state_ = "waiting"
		end

		function arg_673_1.playNext_(arg_675_0)
			if arg_675_0 == 1 then
				arg_673_0:Play1104905162(arg_673_1)
			end
		end

		function arg_673_1.onSingleLineUpdate_(arg_676_0)
			local var_676_0 = 0

			if var_676_0 < arg_673_1.time_ and arg_673_1.time_ <= var_676_0 + arg_676_0 then
				local var_676_1 = manager.ui.mainCamera.transform.localPosition
				local var_676_2 = Vector3.New(0, 0, 10) + Vector3.New(var_676_1.x, var_676_1.y, 0)
				local var_676_3 = arg_673_1.bgs_.K11g

				var_676_3.transform.localPosition = var_676_2
				var_676_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_676_4 = var_676_3:GetComponent("SpriteRenderer")

				if var_676_4 and var_676_4.sprite then
					local var_676_5 = (var_676_3.transform.localPosition - var_676_1).z
					local var_676_6 = manager.ui.mainCameraCom_
					local var_676_7 = 2 * var_676_5 * Mathf.Tan(var_676_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_676_8 = var_676_7 * var_676_6.aspect
					local var_676_9 = var_676_4.sprite.bounds.size.x
					local var_676_10 = var_676_4.sprite.bounds.size.y
					local var_676_11 = var_676_8 / var_676_9
					local var_676_12 = var_676_7 / var_676_10
					local var_676_13 = var_676_12 < var_676_11 and var_676_11 or var_676_12

					var_676_3.transform.localScale = Vector3.New(var_676_13, var_676_13, 0)
				end

				for iter_676_0, iter_676_1 in pairs(arg_673_1.bgs_) do
					if iter_676_0 ~= "K11g" then
						iter_676_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_676_14 = 2

			if var_676_14 < arg_673_1.time_ and arg_673_1.time_ <= var_676_14 + arg_676_0 then
				arg_673_1.allBtn_.enabled = false
			end

			local var_676_15 = 0.3

			if arg_673_1.time_ >= var_676_14 + var_676_15 and arg_673_1.time_ < var_676_14 + var_676_15 + arg_676_0 then
				arg_673_1.allBtn_.enabled = true
			end

			local var_676_16 = 0

			if var_676_16 < arg_673_1.time_ and arg_673_1.time_ <= var_676_16 + arg_676_0 then
				arg_673_1.mask_.enabled = true
				arg_673_1.mask_.raycastTarget = true

				arg_673_1:SetGaussion(false)
			end

			local var_676_17 = 2

			if var_676_16 <= arg_673_1.time_ and arg_673_1.time_ < var_676_16 + var_676_17 then
				local var_676_18 = (arg_673_1.time_ - var_676_16) / var_676_17
				local var_676_19 = Color.New(0, 0, 0)

				var_676_19.a = Mathf.Lerp(1, 0, var_676_18)
				arg_673_1.mask_.color = var_676_19
			end

			if arg_673_1.time_ >= var_676_16 + var_676_17 and arg_673_1.time_ < var_676_16 + var_676_17 + arg_676_0 then
				local var_676_20 = Color.New(0, 0, 0)
				local var_676_21 = 0

				arg_673_1.mask_.enabled = false
				var_676_20.a = var_676_21
				arg_673_1.mask_.color = var_676_20
			end

			local var_676_22 = 0.125
			local var_676_23 = 1

			if var_676_22 < arg_673_1.time_ and arg_673_1.time_ <= var_676_22 + arg_676_0 then
				local var_676_24 = "play"
				local var_676_25 = "effect"

				arg_673_1:AudioAction(var_676_24, var_676_25, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			if arg_673_1.frameCnt_ <= 1 then
				arg_673_1.dialog_:SetActive(false)
			end

			local var_676_26 = 2
			local var_676_27 = 1.15

			if var_676_26 < arg_673_1.time_ and arg_673_1.time_ <= var_676_26 + arg_676_0 then
				arg_673_1.talkMaxDuration = 0

				arg_673_1.dialog_:SetActive(true)

				local var_676_28 = LeanTween.value(arg_673_1.dialog_, 0, 1, 0.3)

				var_676_28:setOnUpdate(LuaHelper.FloatAction(function(arg_677_0)
					arg_673_1.dialogCg_.alpha = arg_677_0
				end))
				var_676_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_673_1.dialog_)
					var_676_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_673_1.duration_ = arg_673_1.duration_ + 0.3

				SetActive(arg_673_1.leftNameGo_, false)

				arg_673_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_673_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_673_1:RecordName(arg_673_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_673_1.iconTrs_.gameObject, false)
				arg_673_1.callingController_:SetSelectedState("normal")

				local var_676_29 = arg_673_1:GetWordFromCfg(1104905161)
				local var_676_30 = arg_673_1:FormatText(var_676_29.content)

				arg_673_1.text_.text = var_676_30

				LuaForUtil.ClearLinePrefixSymbol(arg_673_1.text_)

				local var_676_31 = 46
				local var_676_32 = utf8.len(var_676_30)
				local var_676_33 = var_676_31 <= 0 and var_676_27 or var_676_27 * (var_676_32 / var_676_31)

				if var_676_33 > 0 and var_676_27 < var_676_33 then
					arg_673_1.talkMaxDuration = var_676_33
					var_676_26 = var_676_26 + 0.3

					if var_676_33 + var_676_26 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_33 + var_676_26
					end
				end

				arg_673_1.text_.text = var_676_30
				arg_673_1.typewritter.percent = 0

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(false)
				arg_673_1:RecordContent(arg_673_1.text_.text)
			end

			local var_676_34 = var_676_26 + 0.3
			local var_676_35 = math.max(var_676_27, arg_673_1.talkMaxDuration)

			if var_676_34 <= arg_673_1.time_ and arg_673_1.time_ < var_676_34 + var_676_35 then
				arg_673_1.typewritter.percent = (arg_673_1.time_ - var_676_34) / var_676_35

				arg_673_1.typewritter:SetDirty()
			end

			if arg_673_1.time_ >= var_676_34 + var_676_35 and arg_673_1.time_ < var_676_34 + var_676_35 + arg_676_0 then
				arg_673_1.typewritter.percent = 1

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905162 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 1104905162
		arg_679_1.duration_ = 5

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play1104905163(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.275

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[7].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(1104905162)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 11
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
				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_8 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_8 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_8

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_8 and arg_679_1.time_ < var_682_0 + var_682_8 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905163 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 1104905163
		arg_683_1.duration_ = 2.47

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play1104905164(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = arg_683_1.actors_["1049ui_story"].transform
			local var_686_1 = 0

			if var_686_1 < arg_683_1.time_ and arg_683_1.time_ <= var_686_1 + arg_686_0 then
				arg_683_1.var_.moveOldPos1049ui_story = var_686_0.localPosition
			end

			local var_686_2 = 0.001

			if var_686_1 <= arg_683_1.time_ and arg_683_1.time_ < var_686_1 + var_686_2 then
				local var_686_3 = (arg_683_1.time_ - var_686_1) / var_686_2
				local var_686_4 = Vector3.New(0, -1.2, -6)

				var_686_0.localPosition = Vector3.Lerp(arg_683_1.var_.moveOldPos1049ui_story, var_686_4, var_686_3)

				local var_686_5 = manager.ui.mainCamera.transform.position - var_686_0.position

				var_686_0.forward = Vector3.New(var_686_5.x, var_686_5.y, var_686_5.z)

				local var_686_6 = var_686_0.localEulerAngles

				var_686_6.z = 0
				var_686_6.x = 0
				var_686_0.localEulerAngles = var_686_6
			end

			if arg_683_1.time_ >= var_686_1 + var_686_2 and arg_683_1.time_ < var_686_1 + var_686_2 + arg_686_0 then
				var_686_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_686_7 = manager.ui.mainCamera.transform.position - var_686_0.position

				var_686_0.forward = Vector3.New(var_686_7.x, var_686_7.y, var_686_7.z)

				local var_686_8 = var_686_0.localEulerAngles

				var_686_8.z = 0
				var_686_8.x = 0
				var_686_0.localEulerAngles = var_686_8
			end

			local var_686_9 = arg_683_1.actors_["1049ui_story"]
			local var_686_10 = 0

			if var_686_10 < arg_683_1.time_ and arg_683_1.time_ <= var_686_10 + arg_686_0 and not isNil(var_686_9) and arg_683_1.var_.characterEffect1049ui_story == nil then
				arg_683_1.var_.characterEffect1049ui_story = var_686_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_686_11 = 0.200000002980232

			if var_686_10 <= arg_683_1.time_ and arg_683_1.time_ < var_686_10 + var_686_11 and not isNil(var_686_9) then
				local var_686_12 = (arg_683_1.time_ - var_686_10) / var_686_11

				if arg_683_1.var_.characterEffect1049ui_story and not isNil(var_686_9) then
					arg_683_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_683_1.time_ >= var_686_10 + var_686_11 and arg_683_1.time_ < var_686_10 + var_686_11 + arg_686_0 and not isNil(var_686_9) and arg_683_1.var_.characterEffect1049ui_story then
				arg_683_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_686_13 = 0

			if var_686_13 < arg_683_1.time_ and arg_683_1.time_ <= var_686_13 + arg_686_0 then
				arg_683_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action6_1")
			end

			local var_686_14 = 0

			if var_686_14 < arg_683_1.time_ and arg_683_1.time_ <= var_686_14 + arg_686_0 then
				arg_683_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_686_15 = 0
			local var_686_16 = 0.3

			if var_686_15 < arg_683_1.time_ and arg_683_1.time_ <= var_686_15 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_17 = arg_683_1:FormatText(StoryNameCfg[551].name)

				arg_683_1.leftNameTxt_.text = var_686_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_18 = arg_683_1:GetWordFromCfg(1104905163)
				local var_686_19 = arg_683_1:FormatText(var_686_18.content)

				arg_683_1.text_.text = var_686_19

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_20 = 12
				local var_686_21 = utf8.len(var_686_19)
				local var_686_22 = var_686_20 <= 0 and var_686_16 or var_686_16 * (var_686_21 / var_686_20)

				if var_686_22 > 0 and var_686_16 < var_686_22 then
					arg_683_1.talkMaxDuration = var_686_22

					if var_686_22 + var_686_15 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_22 + var_686_15
					end
				end

				arg_683_1.text_.text = var_686_19
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905163", "story_v_side_new_1104905.awb") ~= 0 then
					local var_686_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905163", "story_v_side_new_1104905.awb") / 1000

					if var_686_23 + var_686_15 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_23 + var_686_15
					end

					if var_686_18.prefab_name ~= "" and arg_683_1.actors_[var_686_18.prefab_name] ~= nil then
						local var_686_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_18.prefab_name].transform, "story_v_side_new_1104905", "1104905163", "story_v_side_new_1104905.awb")

						arg_683_1:RecordAudio("1104905163", var_686_24)
						arg_683_1:RecordAudio("1104905163", var_686_24)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905163", "story_v_side_new_1104905.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905163", "story_v_side_new_1104905.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_25 = math.max(var_686_16, arg_683_1.talkMaxDuration)

			if var_686_15 <= arg_683_1.time_ and arg_683_1.time_ < var_686_15 + var_686_25 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_15) / var_686_25

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_15 + var_686_25 and arg_683_1.time_ < var_686_15 + var_686_25 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905164 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 1104905164
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play1104905165(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["1049ui_story"]
			local var_690_1 = 0

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 and not isNil(var_690_0) and arg_687_1.var_.characterEffect1049ui_story == nil then
				arg_687_1.var_.characterEffect1049ui_story = var_690_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_690_2 = 0.200000002980232

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_2 and not isNil(var_690_0) then
				local var_690_3 = (arg_687_1.time_ - var_690_1) / var_690_2

				if arg_687_1.var_.characterEffect1049ui_story and not isNil(var_690_0) then
					local var_690_4 = Mathf.Lerp(0, 0.5, var_690_3)

					arg_687_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_687_1.var_.characterEffect1049ui_story.fillRatio = var_690_4
				end
			end

			if arg_687_1.time_ >= var_690_1 + var_690_2 and arg_687_1.time_ < var_690_1 + var_690_2 + arg_690_0 and not isNil(var_690_0) and arg_687_1.var_.characterEffect1049ui_story then
				local var_690_5 = 0.5

				arg_687_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_687_1.var_.characterEffect1049ui_story.fillRatio = var_690_5
			end

			local var_690_6 = 0
			local var_690_7 = 0.4

			if var_690_6 < arg_687_1.time_ and arg_687_1.time_ <= var_690_6 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, true)

				local var_690_8 = arg_687_1:FormatText(StoryNameCfg[7].name)

				arg_687_1.leftNameTxt_.text = var_690_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_687_1.leftNameTxt_.transform)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1.leftNameTxt_.text)
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_9 = arg_687_1:GetWordFromCfg(1104905164)
				local var_690_10 = arg_687_1:FormatText(var_690_9.content)

				arg_687_1.text_.text = var_690_10

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_11 = 16
				local var_690_12 = utf8.len(var_690_10)
				local var_690_13 = var_690_11 <= 0 and var_690_7 or var_690_7 * (var_690_12 / var_690_11)

				if var_690_13 > 0 and var_690_7 < var_690_13 then
					arg_687_1.talkMaxDuration = var_690_13

					if var_690_13 + var_690_6 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_13 + var_690_6
					end
				end

				arg_687_1.text_.text = var_690_10
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_14 = math.max(var_690_7, arg_687_1.talkMaxDuration)

			if var_690_6 <= arg_687_1.time_ and arg_687_1.time_ < var_690_6 + var_690_14 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_6) / var_690_14

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_6 + var_690_14 and arg_687_1.time_ < var_690_6 + var_690_14 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905165 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 1104905165
		arg_691_1.duration_ = 5

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play1104905166(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0
			local var_694_1 = 0.125

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, true)

				local var_694_2 = arg_691_1:FormatText(StoryNameCfg[7].name)

				arg_691_1.leftNameTxt_.text = var_694_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_691_1.leftNameTxt_.transform)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1.leftNameTxt_.text)
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_3 = arg_691_1:GetWordFromCfg(1104905165)
				local var_694_4 = arg_691_1:FormatText(var_694_3.content)

				arg_691_1.text_.text = var_694_4

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_5 = 5
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
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_8 = math.max(var_694_1, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_8 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_0) / var_694_8

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_8 and arg_691_1.time_ < var_694_0 + var_694_8 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905166 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 1104905166
		arg_695_1.duration_ = 10.8

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play1104905167(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = "K03h"

			if arg_695_1.bgs_[var_698_0] == nil then
				local var_698_1 = Object.Instantiate(arg_695_1.paintGo_)

				var_698_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_698_0)
				var_698_1.name = var_698_0
				var_698_1.transform.parent = arg_695_1.stage_.transform
				var_698_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_695_1.bgs_[var_698_0] = var_698_1
			end

			local var_698_2 = 3

			if var_698_2 < arg_695_1.time_ and arg_695_1.time_ <= var_698_2 + arg_698_0 then
				local var_698_3 = manager.ui.mainCamera.transform.localPosition
				local var_698_4 = Vector3.New(0, 0, 10) + Vector3.New(var_698_3.x, var_698_3.y, 0)
				local var_698_5 = arg_695_1.bgs_.K03h

				var_698_5.transform.localPosition = var_698_4
				var_698_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_698_6 = var_698_5:GetComponent("SpriteRenderer")

				if var_698_6 and var_698_6.sprite then
					local var_698_7 = (var_698_5.transform.localPosition - var_698_3).z
					local var_698_8 = manager.ui.mainCameraCom_
					local var_698_9 = 2 * var_698_7 * Mathf.Tan(var_698_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_698_10 = var_698_9 * var_698_8.aspect
					local var_698_11 = var_698_6.sprite.bounds.size.x
					local var_698_12 = var_698_6.sprite.bounds.size.y
					local var_698_13 = var_698_10 / var_698_11
					local var_698_14 = var_698_9 / var_698_12
					local var_698_15 = var_698_14 < var_698_13 and var_698_13 or var_698_14

					var_698_5.transform.localScale = Vector3.New(var_698_15, var_698_15, 0)
				end

				for iter_698_0, iter_698_1 in pairs(arg_695_1.bgs_) do
					if iter_698_0 ~= "K03h" then
						iter_698_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_698_16 = 6.366667

			if var_698_16 < arg_695_1.time_ and arg_695_1.time_ <= var_698_16 + arg_698_0 then
				arg_695_1.allBtn_.enabled = false
			end

			local var_698_17 = 0.3

			if arg_695_1.time_ >= var_698_16 + var_698_17 and arg_695_1.time_ < var_698_16 + var_698_17 + arg_698_0 then
				arg_695_1.allBtn_.enabled = true
			end

			local var_698_18 = 0

			if var_698_18 < arg_695_1.time_ and arg_695_1.time_ <= var_698_18 + arg_698_0 then
				arg_695_1.mask_.enabled = true
				arg_695_1.mask_.raycastTarget = true

				arg_695_1:SetGaussion(false)
			end

			local var_698_19 = 3

			if var_698_18 <= arg_695_1.time_ and arg_695_1.time_ < var_698_18 + var_698_19 then
				local var_698_20 = (arg_695_1.time_ - var_698_18) / var_698_19
				local var_698_21 = Color.New(0, 0, 0)

				var_698_21.a = Mathf.Lerp(0, 1, var_698_20)
				arg_695_1.mask_.color = var_698_21
			end

			if arg_695_1.time_ >= var_698_18 + var_698_19 and arg_695_1.time_ < var_698_18 + var_698_19 + arg_698_0 then
				local var_698_22 = Color.New(0, 0, 0)

				var_698_22.a = 1
				arg_695_1.mask_.color = var_698_22
			end

			local var_698_23 = 3

			if var_698_23 < arg_695_1.time_ and arg_695_1.time_ <= var_698_23 + arg_698_0 then
				arg_695_1.mask_.enabled = true
				arg_695_1.mask_.raycastTarget = true

				arg_695_1:SetGaussion(false)
			end

			local var_698_24 = 3

			if var_698_23 <= arg_695_1.time_ and arg_695_1.time_ < var_698_23 + var_698_24 then
				local var_698_25 = (arg_695_1.time_ - var_698_23) / var_698_24
				local var_698_26 = Color.New(0, 0, 0)

				var_698_26.a = Mathf.Lerp(1, 0, var_698_25)
				arg_695_1.mask_.color = var_698_26
			end

			if arg_695_1.time_ >= var_698_23 + var_698_24 and arg_695_1.time_ < var_698_23 + var_698_24 + arg_698_0 then
				local var_698_27 = Color.New(0, 0, 0)
				local var_698_28 = 0

				arg_695_1.mask_.enabled = false
				var_698_27.a = var_698_28
				arg_695_1.mask_.color = var_698_27
			end

			local var_698_29 = arg_695_1.actors_["1049ui_story"].transform
			local var_698_30 = 2.96599999815226

			if var_698_30 < arg_695_1.time_ and arg_695_1.time_ <= var_698_30 + arg_698_0 then
				arg_695_1.var_.moveOldPos1049ui_story = var_698_29.localPosition
			end

			local var_698_31 = 0.001

			if var_698_30 <= arg_695_1.time_ and arg_695_1.time_ < var_698_30 + var_698_31 then
				local var_698_32 = (arg_695_1.time_ - var_698_30) / var_698_31
				local var_698_33 = Vector3.New(0, 100, 0)

				var_698_29.localPosition = Vector3.Lerp(arg_695_1.var_.moveOldPos1049ui_story, var_698_33, var_698_32)

				local var_698_34 = manager.ui.mainCamera.transform.position - var_698_29.position

				var_698_29.forward = Vector3.New(var_698_34.x, var_698_34.y, var_698_34.z)

				local var_698_35 = var_698_29.localEulerAngles

				var_698_35.z = 0
				var_698_35.x = 0
				var_698_29.localEulerAngles = var_698_35
			end

			if arg_695_1.time_ >= var_698_30 + var_698_31 and arg_695_1.time_ < var_698_30 + var_698_31 + arg_698_0 then
				var_698_29.localPosition = Vector3.New(0, 100, 0)

				local var_698_36 = manager.ui.mainCamera.transform.position - var_698_29.position

				var_698_29.forward = Vector3.New(var_698_36.x, var_698_36.y, var_698_36.z)

				local var_698_37 = var_698_29.localEulerAngles

				var_698_37.z = 0
				var_698_37.x = 0
				var_698_29.localEulerAngles = var_698_37
			end

			local var_698_38 = 0.587165498640388
			local var_698_39 = 1

			if var_698_38 < arg_695_1.time_ and arg_695_1.time_ <= var_698_38 + arg_698_0 then
				local var_698_40 = "stop"
				local var_698_41 = "effect"

				arg_695_1:AudioAction(var_698_40, var_698_41, "se_story_side_1049", "se_story_side_1049_amb_wind_leaves", "")
			end

			local var_698_42 = 2.53333333333333
			local var_698_43 = 1

			if var_698_42 < arg_695_1.time_ and arg_695_1.time_ <= var_698_42 + arg_698_0 then
				local var_698_44 = "play"
				local var_698_45 = "effect"

				arg_695_1:AudioAction(var_698_44, var_698_45, "se_story_side_1049", "se_story_side_1049_amb_river_waterfall", "")
			end

			if arg_695_1.frameCnt_ <= 1 then
				arg_695_1.dialog_:SetActive(false)
			end

			local var_698_46 = 5.8
			local var_698_47 = 1.275

			if var_698_46 < arg_695_1.time_ and arg_695_1.time_ <= var_698_46 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0

				arg_695_1.dialog_:SetActive(true)

				local var_698_48 = LeanTween.value(arg_695_1.dialog_, 0, 1, 0.3)

				var_698_48:setOnUpdate(LuaHelper.FloatAction(function(arg_699_0)
					arg_695_1.dialogCg_.alpha = arg_699_0
				end))
				var_698_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_695_1.dialog_)
					var_698_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_695_1.duration_ = arg_695_1.duration_ + 0.3

				SetActive(arg_695_1.leftNameGo_, false)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_49 = arg_695_1:GetWordFromCfg(1104905166)
				local var_698_50 = arg_695_1:FormatText(var_698_49.content)

				arg_695_1.text_.text = var_698_50

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_51 = 51
				local var_698_52 = utf8.len(var_698_50)
				local var_698_53 = var_698_51 <= 0 and var_698_47 or var_698_47 * (var_698_52 / var_698_51)

				if var_698_53 > 0 and var_698_47 < var_698_53 then
					arg_695_1.talkMaxDuration = var_698_53
					var_698_46 = var_698_46 + 0.3

					if var_698_53 + var_698_46 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_53 + var_698_46
					end
				end

				arg_695_1.text_.text = var_698_50
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)
				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_54 = var_698_46 + 0.3
			local var_698_55 = math.max(var_698_47, arg_695_1.talkMaxDuration)

			if var_698_54 <= arg_695_1.time_ and arg_695_1.time_ < var_698_54 + var_698_55 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_54) / var_698_55

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_54 + var_698_55 and arg_695_1.time_ < var_698_54 + var_698_55 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905167 = function(arg_701_0, arg_701_1)
		arg_701_1.time_ = 0
		arg_701_1.frameCnt_ = 0
		arg_701_1.state_ = "playing"
		arg_701_1.curTalkId_ = 1104905167
		arg_701_1.duration_ = 2

		SetActive(arg_701_1.tipsGo_, false)

		function arg_701_1.onSingleLineFinish_()
			arg_701_1.onSingleLineUpdate_ = nil
			arg_701_1.onSingleLineFinish_ = nil
			arg_701_1.state_ = "waiting"
		end

		function arg_701_1.playNext_(arg_703_0)
			if arg_703_0 == 1 then
				arg_701_0:Play1104905168(arg_701_1)
			end
		end

		function arg_701_1.onSingleLineUpdate_(arg_704_0)
			local var_704_0 = arg_701_1.actors_["1049ui_story"].transform
			local var_704_1 = 0

			if var_704_1 < arg_701_1.time_ and arg_701_1.time_ <= var_704_1 + arg_704_0 then
				arg_701_1.var_.moveOldPos1049ui_story = var_704_0.localPosition
			end

			local var_704_2 = 0.001

			if var_704_1 <= arg_701_1.time_ and arg_701_1.time_ < var_704_1 + var_704_2 then
				local var_704_3 = (arg_701_1.time_ - var_704_1) / var_704_2
				local var_704_4 = Vector3.New(0, -1.2, -6)

				var_704_0.localPosition = Vector3.Lerp(arg_701_1.var_.moveOldPos1049ui_story, var_704_4, var_704_3)

				local var_704_5 = manager.ui.mainCamera.transform.position - var_704_0.position

				var_704_0.forward = Vector3.New(var_704_5.x, var_704_5.y, var_704_5.z)

				local var_704_6 = var_704_0.localEulerAngles

				var_704_6.z = 0
				var_704_6.x = 0
				var_704_0.localEulerAngles = var_704_6
			end

			if arg_701_1.time_ >= var_704_1 + var_704_2 and arg_701_1.time_ < var_704_1 + var_704_2 + arg_704_0 then
				var_704_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_704_7 = manager.ui.mainCamera.transform.position - var_704_0.position

				var_704_0.forward = Vector3.New(var_704_7.x, var_704_7.y, var_704_7.z)

				local var_704_8 = var_704_0.localEulerAngles

				var_704_8.z = 0
				var_704_8.x = 0
				var_704_0.localEulerAngles = var_704_8
			end

			local var_704_9 = arg_701_1.actors_["1049ui_story"]
			local var_704_10 = 0

			if var_704_10 < arg_701_1.time_ and arg_701_1.time_ <= var_704_10 + arg_704_0 and not isNil(var_704_9) and arg_701_1.var_.characterEffect1049ui_story == nil then
				arg_701_1.var_.characterEffect1049ui_story = var_704_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_704_11 = 0.200000002980232

			if var_704_10 <= arg_701_1.time_ and arg_701_1.time_ < var_704_10 + var_704_11 and not isNil(var_704_9) then
				local var_704_12 = (arg_701_1.time_ - var_704_10) / var_704_11

				if arg_701_1.var_.characterEffect1049ui_story and not isNil(var_704_9) then
					arg_701_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_701_1.time_ >= var_704_10 + var_704_11 and arg_701_1.time_ < var_704_10 + var_704_11 + arg_704_0 and not isNil(var_704_9) and arg_701_1.var_.characterEffect1049ui_story then
				arg_701_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_704_13 = 0

			if var_704_13 < arg_701_1.time_ and arg_701_1.time_ <= var_704_13 + arg_704_0 then
				arg_701_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action8_1")
			end

			local var_704_14 = 0

			if var_704_14 < arg_701_1.time_ and arg_701_1.time_ <= var_704_14 + arg_704_0 then
				arg_701_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_704_15 = 0
			local var_704_16 = 0.15

			if var_704_15 < arg_701_1.time_ and arg_701_1.time_ <= var_704_15 + arg_704_0 then
				arg_701_1.talkMaxDuration = 0
				arg_701_1.dialogCg_.alpha = 1

				arg_701_1.dialog_:SetActive(true)
				SetActive(arg_701_1.leftNameGo_, true)

				local var_704_17 = arg_701_1:FormatText(StoryNameCfg[551].name)

				arg_701_1.leftNameTxt_.text = var_704_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_701_1.leftNameTxt_.transform)

				arg_701_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_701_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_701_1:RecordName(arg_701_1.leftNameTxt_.text)
				SetActive(arg_701_1.iconTrs_.gameObject, false)
				arg_701_1.callingController_:SetSelectedState("normal")

				local var_704_18 = arg_701_1:GetWordFromCfg(1104905167)
				local var_704_19 = arg_701_1:FormatText(var_704_18.content)

				arg_701_1.text_.text = var_704_19

				LuaForUtil.ClearLinePrefixSymbol(arg_701_1.text_)

				local var_704_20 = 6
				local var_704_21 = utf8.len(var_704_19)
				local var_704_22 = var_704_20 <= 0 and var_704_16 or var_704_16 * (var_704_21 / var_704_20)

				if var_704_22 > 0 and var_704_16 < var_704_22 then
					arg_701_1.talkMaxDuration = var_704_22

					if var_704_22 + var_704_15 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_22 + var_704_15
					end
				end

				arg_701_1.text_.text = var_704_19
				arg_701_1.typewritter.percent = 0

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905167", "story_v_side_new_1104905.awb") ~= 0 then
					local var_704_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905167", "story_v_side_new_1104905.awb") / 1000

					if var_704_23 + var_704_15 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_23 + var_704_15
					end

					if var_704_18.prefab_name ~= "" and arg_701_1.actors_[var_704_18.prefab_name] ~= nil then
						local var_704_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_701_1.actors_[var_704_18.prefab_name].transform, "story_v_side_new_1104905", "1104905167", "story_v_side_new_1104905.awb")

						arg_701_1:RecordAudio("1104905167", var_704_24)
						arg_701_1:RecordAudio("1104905167", var_704_24)
					else
						arg_701_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905167", "story_v_side_new_1104905.awb")
					end

					arg_701_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905167", "story_v_side_new_1104905.awb")
				end

				arg_701_1:RecordContent(arg_701_1.text_.text)
			end

			local var_704_25 = math.max(var_704_16, arg_701_1.talkMaxDuration)

			if var_704_15 <= arg_701_1.time_ and arg_701_1.time_ < var_704_15 + var_704_25 then
				arg_701_1.typewritter.percent = (arg_701_1.time_ - var_704_15) / var_704_25

				arg_701_1.typewritter:SetDirty()
			end

			if arg_701_1.time_ >= var_704_15 + var_704_25 and arg_701_1.time_ < var_704_15 + var_704_25 + arg_704_0 then
				arg_701_1.typewritter.percent = 1

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905168 = function(arg_705_0, arg_705_1)
		arg_705_1.time_ = 0
		arg_705_1.frameCnt_ = 0
		arg_705_1.state_ = "playing"
		arg_705_1.curTalkId_ = 1104905168
		arg_705_1.duration_ = 5

		SetActive(arg_705_1.tipsGo_, false)

		function arg_705_1.onSingleLineFinish_()
			arg_705_1.onSingleLineUpdate_ = nil
			arg_705_1.onSingleLineFinish_ = nil
			arg_705_1.state_ = "waiting"
		end

		function arg_705_1.playNext_(arg_707_0)
			if arg_707_0 == 1 then
				arg_705_0:Play1104905169(arg_705_1)
			end
		end

		function arg_705_1.onSingleLineUpdate_(arg_708_0)
			local var_708_0 = arg_705_1.actors_["1049ui_story"].transform
			local var_708_1 = 0

			if var_708_1 < arg_705_1.time_ and arg_705_1.time_ <= var_708_1 + arg_708_0 then
				arg_705_1.var_.moveOldPos1049ui_story = var_708_0.localPosition
			end

			local var_708_2 = 0.001

			if var_708_1 <= arg_705_1.time_ and arg_705_1.time_ < var_708_1 + var_708_2 then
				local var_708_3 = (arg_705_1.time_ - var_708_1) / var_708_2
				local var_708_4 = Vector3.New(0, 100, 0)

				var_708_0.localPosition = Vector3.Lerp(arg_705_1.var_.moveOldPos1049ui_story, var_708_4, var_708_3)

				local var_708_5 = manager.ui.mainCamera.transform.position - var_708_0.position

				var_708_0.forward = Vector3.New(var_708_5.x, var_708_5.y, var_708_5.z)

				local var_708_6 = var_708_0.localEulerAngles

				var_708_6.z = 0
				var_708_6.x = 0
				var_708_0.localEulerAngles = var_708_6
			end

			if arg_705_1.time_ >= var_708_1 + var_708_2 and arg_705_1.time_ < var_708_1 + var_708_2 + arg_708_0 then
				var_708_0.localPosition = Vector3.New(0, 100, 0)

				local var_708_7 = manager.ui.mainCamera.transform.position - var_708_0.position

				var_708_0.forward = Vector3.New(var_708_7.x, var_708_7.y, var_708_7.z)

				local var_708_8 = var_708_0.localEulerAngles

				var_708_8.z = 0
				var_708_8.x = 0
				var_708_0.localEulerAngles = var_708_8
			end

			local var_708_9 = arg_705_1.actors_["1049ui_story"]
			local var_708_10 = 0

			if var_708_10 < arg_705_1.time_ and arg_705_1.time_ <= var_708_10 + arg_708_0 and not isNil(var_708_9) and arg_705_1.var_.characterEffect1049ui_story == nil then
				arg_705_1.var_.characterEffect1049ui_story = var_708_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_708_11 = 0.200000002980232

			if var_708_10 <= arg_705_1.time_ and arg_705_1.time_ < var_708_10 + var_708_11 and not isNil(var_708_9) then
				local var_708_12 = (arg_705_1.time_ - var_708_10) / var_708_11

				if arg_705_1.var_.characterEffect1049ui_story and not isNil(var_708_9) then
					local var_708_13 = Mathf.Lerp(0, 0.5, var_708_12)

					arg_705_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_705_1.var_.characterEffect1049ui_story.fillRatio = var_708_13
				end
			end

			if arg_705_1.time_ >= var_708_10 + var_708_11 and arg_705_1.time_ < var_708_10 + var_708_11 + arg_708_0 and not isNil(var_708_9) and arg_705_1.var_.characterEffect1049ui_story then
				local var_708_14 = 0.5

				arg_705_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_705_1.var_.characterEffect1049ui_story.fillRatio = var_708_14
			end

			local var_708_15 = 0
			local var_708_16 = 0.85

			if var_708_15 < arg_705_1.time_ and arg_705_1.time_ <= var_708_15 + arg_708_0 then
				arg_705_1.talkMaxDuration = 0
				arg_705_1.dialogCg_.alpha = 1

				arg_705_1.dialog_:SetActive(true)
				SetActive(arg_705_1.leftNameGo_, false)

				arg_705_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_705_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_705_1:RecordName(arg_705_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_705_1.iconTrs_.gameObject, false)
				arg_705_1.callingController_:SetSelectedState("normal")

				local var_708_17 = arg_705_1:GetWordFromCfg(1104905168)
				local var_708_18 = arg_705_1:FormatText(var_708_17.content)

				arg_705_1.text_.text = var_708_18

				LuaForUtil.ClearLinePrefixSymbol(arg_705_1.text_)

				local var_708_19 = 34
				local var_708_20 = utf8.len(var_708_18)
				local var_708_21 = var_708_19 <= 0 and var_708_16 or var_708_16 * (var_708_20 / var_708_19)

				if var_708_21 > 0 and var_708_16 < var_708_21 then
					arg_705_1.talkMaxDuration = var_708_21

					if var_708_21 + var_708_15 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_21 + var_708_15
					end
				end

				arg_705_1.text_.text = var_708_18
				arg_705_1.typewritter.percent = 0

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(false)
				arg_705_1:RecordContent(arg_705_1.text_.text)
			end

			local var_708_22 = math.max(var_708_16, arg_705_1.talkMaxDuration)

			if var_708_15 <= arg_705_1.time_ and arg_705_1.time_ < var_708_15 + var_708_22 then
				arg_705_1.typewritter.percent = (arg_705_1.time_ - var_708_15) / var_708_22

				arg_705_1.typewritter:SetDirty()
			end

			if arg_705_1.time_ >= var_708_15 + var_708_22 and arg_705_1.time_ < var_708_15 + var_708_22 + arg_708_0 then
				arg_705_1.typewritter.percent = 1

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905169 = function(arg_709_0, arg_709_1)
		arg_709_1.time_ = 0
		arg_709_1.frameCnt_ = 0
		arg_709_1.state_ = "playing"
		arg_709_1.curTalkId_ = 1104905169
		arg_709_1.duration_ = 4.93

		SetActive(arg_709_1.tipsGo_, false)

		function arg_709_1.onSingleLineFinish_()
			arg_709_1.onSingleLineUpdate_ = nil
			arg_709_1.onSingleLineFinish_ = nil
			arg_709_1.state_ = "waiting"
		end

		function arg_709_1.playNext_(arg_711_0)
			if arg_711_0 == 1 then
				arg_709_0:Play1104905170(arg_709_1)
			end
		end

		function arg_709_1.onSingleLineUpdate_(arg_712_0)
			local var_712_0 = arg_709_1.actors_["1049ui_story"].transform
			local var_712_1 = 0

			if var_712_1 < arg_709_1.time_ and arg_709_1.time_ <= var_712_1 + arg_712_0 then
				arg_709_1.var_.moveOldPos1049ui_story = var_712_0.localPosition
			end

			local var_712_2 = 0.001

			if var_712_1 <= arg_709_1.time_ and arg_709_1.time_ < var_712_1 + var_712_2 then
				local var_712_3 = (arg_709_1.time_ - var_712_1) / var_712_2
				local var_712_4 = Vector3.New(0, -1.2, -6)

				var_712_0.localPosition = Vector3.Lerp(arg_709_1.var_.moveOldPos1049ui_story, var_712_4, var_712_3)

				local var_712_5 = manager.ui.mainCamera.transform.position - var_712_0.position

				var_712_0.forward = Vector3.New(var_712_5.x, var_712_5.y, var_712_5.z)

				local var_712_6 = var_712_0.localEulerAngles

				var_712_6.z = 0
				var_712_6.x = 0
				var_712_0.localEulerAngles = var_712_6
			end

			if arg_709_1.time_ >= var_712_1 + var_712_2 and arg_709_1.time_ < var_712_1 + var_712_2 + arg_712_0 then
				var_712_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_712_7 = manager.ui.mainCamera.transform.position - var_712_0.position

				var_712_0.forward = Vector3.New(var_712_7.x, var_712_7.y, var_712_7.z)

				local var_712_8 = var_712_0.localEulerAngles

				var_712_8.z = 0
				var_712_8.x = 0
				var_712_0.localEulerAngles = var_712_8
			end

			local var_712_9 = arg_709_1.actors_["1049ui_story"]
			local var_712_10 = 0

			if var_712_10 < arg_709_1.time_ and arg_709_1.time_ <= var_712_10 + arg_712_0 and not isNil(var_712_9) and arg_709_1.var_.characterEffect1049ui_story == nil then
				arg_709_1.var_.characterEffect1049ui_story = var_712_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_712_11 = 0.200000002980232

			if var_712_10 <= arg_709_1.time_ and arg_709_1.time_ < var_712_10 + var_712_11 and not isNil(var_712_9) then
				local var_712_12 = (arg_709_1.time_ - var_712_10) / var_712_11

				if arg_709_1.var_.characterEffect1049ui_story and not isNil(var_712_9) then
					arg_709_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_709_1.time_ >= var_712_10 + var_712_11 and arg_709_1.time_ < var_712_10 + var_712_11 + arg_712_0 and not isNil(var_712_9) and arg_709_1.var_.characterEffect1049ui_story then
				arg_709_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_712_13 = 0

			if var_712_13 < arg_709_1.time_ and arg_709_1.time_ <= var_712_13 + arg_712_0 then
				arg_709_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action8_2")
			end

			local var_712_14 = 0

			if var_712_14 < arg_709_1.time_ and arg_709_1.time_ <= var_712_14 + arg_712_0 then
				arg_709_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_712_15 = 0
			local var_712_16 = 0.475

			if var_712_15 < arg_709_1.time_ and arg_709_1.time_ <= var_712_15 + arg_712_0 then
				arg_709_1.talkMaxDuration = 0
				arg_709_1.dialogCg_.alpha = 1

				arg_709_1.dialog_:SetActive(true)
				SetActive(arg_709_1.leftNameGo_, true)

				local var_712_17 = arg_709_1:FormatText(StoryNameCfg[551].name)

				arg_709_1.leftNameTxt_.text = var_712_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_709_1.leftNameTxt_.transform)

				arg_709_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_709_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_709_1:RecordName(arg_709_1.leftNameTxt_.text)
				SetActive(arg_709_1.iconTrs_.gameObject, false)
				arg_709_1.callingController_:SetSelectedState("normal")

				local var_712_18 = arg_709_1:GetWordFromCfg(1104905169)
				local var_712_19 = arg_709_1:FormatText(var_712_18.content)

				arg_709_1.text_.text = var_712_19

				LuaForUtil.ClearLinePrefixSymbol(arg_709_1.text_)

				local var_712_20 = 19
				local var_712_21 = utf8.len(var_712_19)
				local var_712_22 = var_712_20 <= 0 and var_712_16 or var_712_16 * (var_712_21 / var_712_20)

				if var_712_22 > 0 and var_712_16 < var_712_22 then
					arg_709_1.talkMaxDuration = var_712_22

					if var_712_22 + var_712_15 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_22 + var_712_15
					end
				end

				arg_709_1.text_.text = var_712_19
				arg_709_1.typewritter.percent = 0

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905169", "story_v_side_new_1104905.awb") ~= 0 then
					local var_712_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905169", "story_v_side_new_1104905.awb") / 1000

					if var_712_23 + var_712_15 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_23 + var_712_15
					end

					if var_712_18.prefab_name ~= "" and arg_709_1.actors_[var_712_18.prefab_name] ~= nil then
						local var_712_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_709_1.actors_[var_712_18.prefab_name].transform, "story_v_side_new_1104905", "1104905169", "story_v_side_new_1104905.awb")

						arg_709_1:RecordAudio("1104905169", var_712_24)
						arg_709_1:RecordAudio("1104905169", var_712_24)
					else
						arg_709_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905169", "story_v_side_new_1104905.awb")
					end

					arg_709_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905169", "story_v_side_new_1104905.awb")
				end

				arg_709_1:RecordContent(arg_709_1.text_.text)
			end

			local var_712_25 = math.max(var_712_16, arg_709_1.talkMaxDuration)

			if var_712_15 <= arg_709_1.time_ and arg_709_1.time_ < var_712_15 + var_712_25 then
				arg_709_1.typewritter.percent = (arg_709_1.time_ - var_712_15) / var_712_25

				arg_709_1.typewritter:SetDirty()
			end

			if arg_709_1.time_ >= var_712_15 + var_712_25 and arg_709_1.time_ < var_712_15 + var_712_25 + arg_712_0 then
				arg_709_1.typewritter.percent = 1

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905170 = function(arg_713_0, arg_713_1)
		arg_713_1.time_ = 0
		arg_713_1.frameCnt_ = 0
		arg_713_1.state_ = "playing"
		arg_713_1.curTalkId_ = 1104905170
		arg_713_1.duration_ = 5

		SetActive(arg_713_1.tipsGo_, false)

		function arg_713_1.onSingleLineFinish_()
			arg_713_1.onSingleLineUpdate_ = nil
			arg_713_1.onSingleLineFinish_ = nil
			arg_713_1.state_ = "waiting"
		end

		function arg_713_1.playNext_(arg_715_0)
			if arg_715_0 == 1 then
				arg_713_0:Play1104905171(arg_713_1)
			end
		end

		function arg_713_1.onSingleLineUpdate_(arg_716_0)
			local var_716_0 = arg_713_1.actors_["1049ui_story"]
			local var_716_1 = 0

			if var_716_1 < arg_713_1.time_ and arg_713_1.time_ <= var_716_1 + arg_716_0 and not isNil(var_716_0) and arg_713_1.var_.characterEffect1049ui_story == nil then
				arg_713_1.var_.characterEffect1049ui_story = var_716_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_716_2 = 0.200000002980232

			if var_716_1 <= arg_713_1.time_ and arg_713_1.time_ < var_716_1 + var_716_2 and not isNil(var_716_0) then
				local var_716_3 = (arg_713_1.time_ - var_716_1) / var_716_2

				if arg_713_1.var_.characterEffect1049ui_story and not isNil(var_716_0) then
					local var_716_4 = Mathf.Lerp(0, 0.5, var_716_3)

					arg_713_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_713_1.var_.characterEffect1049ui_story.fillRatio = var_716_4
				end
			end

			if arg_713_1.time_ >= var_716_1 + var_716_2 and arg_713_1.time_ < var_716_1 + var_716_2 + arg_716_0 and not isNil(var_716_0) and arg_713_1.var_.characterEffect1049ui_story then
				local var_716_5 = 0.5

				arg_713_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_713_1.var_.characterEffect1049ui_story.fillRatio = var_716_5
			end

			local var_716_6 = 0
			local var_716_7 = 0.45

			if var_716_6 < arg_713_1.time_ and arg_713_1.time_ <= var_716_6 + arg_716_0 then
				arg_713_1.talkMaxDuration = 0
				arg_713_1.dialogCg_.alpha = 1

				arg_713_1.dialog_:SetActive(true)
				SetActive(arg_713_1.leftNameGo_, true)

				local var_716_8 = arg_713_1:FormatText(StoryNameCfg[7].name)

				arg_713_1.leftNameTxt_.text = var_716_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_713_1.leftNameTxt_.transform)

				arg_713_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_713_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_713_1:RecordName(arg_713_1.leftNameTxt_.text)
				SetActive(arg_713_1.iconTrs_.gameObject, false)
				arg_713_1.callingController_:SetSelectedState("normal")

				local var_716_9 = arg_713_1:GetWordFromCfg(1104905170)
				local var_716_10 = arg_713_1:FormatText(var_716_9.content)

				arg_713_1.text_.text = var_716_10

				LuaForUtil.ClearLinePrefixSymbol(arg_713_1.text_)

				local var_716_11 = 18
				local var_716_12 = utf8.len(var_716_10)
				local var_716_13 = var_716_11 <= 0 and var_716_7 or var_716_7 * (var_716_12 / var_716_11)

				if var_716_13 > 0 and var_716_7 < var_716_13 then
					arg_713_1.talkMaxDuration = var_716_13

					if var_716_13 + var_716_6 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_13 + var_716_6
					end
				end

				arg_713_1.text_.text = var_716_10
				arg_713_1.typewritter.percent = 0

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(false)
				arg_713_1:RecordContent(arg_713_1.text_.text)
			end

			local var_716_14 = math.max(var_716_7, arg_713_1.talkMaxDuration)

			if var_716_6 <= arg_713_1.time_ and arg_713_1.time_ < var_716_6 + var_716_14 then
				arg_713_1.typewritter.percent = (arg_713_1.time_ - var_716_6) / var_716_14

				arg_713_1.typewritter:SetDirty()
			end

			if arg_713_1.time_ >= var_716_6 + var_716_14 and arg_713_1.time_ < var_716_6 + var_716_14 + arg_716_0 then
				arg_713_1.typewritter.percent = 1

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905171 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 1104905171
		arg_717_1.duration_ = 4.4

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play1104905172(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = arg_717_1.actors_["1049ui_story"]
			local var_720_1 = 0

			if var_720_1 < arg_717_1.time_ and arg_717_1.time_ <= var_720_1 + arg_720_0 and not isNil(var_720_0) and arg_717_1.var_.characterEffect1049ui_story == nil then
				arg_717_1.var_.characterEffect1049ui_story = var_720_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_720_2 = 0.200000002980232

			if var_720_1 <= arg_717_1.time_ and arg_717_1.time_ < var_720_1 + var_720_2 and not isNil(var_720_0) then
				local var_720_3 = (arg_717_1.time_ - var_720_1) / var_720_2

				if arg_717_1.var_.characterEffect1049ui_story and not isNil(var_720_0) then
					arg_717_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_717_1.time_ >= var_720_1 + var_720_2 and arg_717_1.time_ < var_720_1 + var_720_2 + arg_720_0 and not isNil(var_720_0) and arg_717_1.var_.characterEffect1049ui_story then
				arg_717_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_720_4 = 0

			if var_720_4 < arg_717_1.time_ and arg_717_1.time_ <= var_720_4 + arg_720_0 then
				arg_717_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_720_5 = 0

			if var_720_5 < arg_717_1.time_ and arg_717_1.time_ <= var_720_5 + arg_720_0 then
				arg_717_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_720_6 = 0
			local var_720_7 = 0.275

			if var_720_6 < arg_717_1.time_ and arg_717_1.time_ <= var_720_6 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0
				arg_717_1.dialogCg_.alpha = 1

				arg_717_1.dialog_:SetActive(true)
				SetActive(arg_717_1.leftNameGo_, true)

				local var_720_8 = arg_717_1:FormatText(StoryNameCfg[551].name)

				arg_717_1.leftNameTxt_.text = var_720_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_717_1.leftNameTxt_.transform)

				arg_717_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_717_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_717_1:RecordName(arg_717_1.leftNameTxt_.text)
				SetActive(arg_717_1.iconTrs_.gameObject, false)
				arg_717_1.callingController_:SetSelectedState("normal")

				local var_720_9 = arg_717_1:GetWordFromCfg(1104905171)
				local var_720_10 = arg_717_1:FormatText(var_720_9.content)

				arg_717_1.text_.text = var_720_10

				LuaForUtil.ClearLinePrefixSymbol(arg_717_1.text_)

				local var_720_11 = 11
				local var_720_12 = utf8.len(var_720_10)
				local var_720_13 = var_720_11 <= 0 and var_720_7 or var_720_7 * (var_720_12 / var_720_11)

				if var_720_13 > 0 and var_720_7 < var_720_13 then
					arg_717_1.talkMaxDuration = var_720_13

					if var_720_13 + var_720_6 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_13 + var_720_6
					end
				end

				arg_717_1.text_.text = var_720_10
				arg_717_1.typewritter.percent = 0

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905171", "story_v_side_new_1104905.awb") ~= 0 then
					local var_720_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905171", "story_v_side_new_1104905.awb") / 1000

					if var_720_14 + var_720_6 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_14 + var_720_6
					end

					if var_720_9.prefab_name ~= "" and arg_717_1.actors_[var_720_9.prefab_name] ~= nil then
						local var_720_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_717_1.actors_[var_720_9.prefab_name].transform, "story_v_side_new_1104905", "1104905171", "story_v_side_new_1104905.awb")

						arg_717_1:RecordAudio("1104905171", var_720_15)
						arg_717_1:RecordAudio("1104905171", var_720_15)
					else
						arg_717_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905171", "story_v_side_new_1104905.awb")
					end

					arg_717_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905171", "story_v_side_new_1104905.awb")
				end

				arg_717_1:RecordContent(arg_717_1.text_.text)
			end

			local var_720_16 = math.max(var_720_7, arg_717_1.talkMaxDuration)

			if var_720_6 <= arg_717_1.time_ and arg_717_1.time_ < var_720_6 + var_720_16 then
				arg_717_1.typewritter.percent = (arg_717_1.time_ - var_720_6) / var_720_16

				arg_717_1.typewritter:SetDirty()
			end

			if arg_717_1.time_ >= var_720_6 + var_720_16 and arg_717_1.time_ < var_720_6 + var_720_16 + arg_720_0 then
				arg_717_1.typewritter.percent = 1

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905172 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 1104905172
		arg_721_1.duration_ = 9

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play1104905173(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = "ST06a"

			if arg_721_1.bgs_[var_724_0] == nil then
				local var_724_1 = Object.Instantiate(arg_721_1.paintGo_)

				var_724_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_724_0)
				var_724_1.name = var_724_0
				var_724_1.transform.parent = arg_721_1.stage_.transform
				var_724_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_721_1.bgs_[var_724_0] = var_724_1
			end

			local var_724_2 = 2

			if var_724_2 < arg_721_1.time_ and arg_721_1.time_ <= var_724_2 + arg_724_0 then
				local var_724_3 = manager.ui.mainCamera.transform.localPosition
				local var_724_4 = Vector3.New(0, 0, 10) + Vector3.New(var_724_3.x, var_724_3.y, 0)
				local var_724_5 = arg_721_1.bgs_.ST06a

				var_724_5.transform.localPosition = var_724_4
				var_724_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_724_6 = var_724_5:GetComponent("SpriteRenderer")

				if var_724_6 and var_724_6.sprite then
					local var_724_7 = (var_724_5.transform.localPosition - var_724_3).z
					local var_724_8 = manager.ui.mainCameraCom_
					local var_724_9 = 2 * var_724_7 * Mathf.Tan(var_724_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_724_10 = var_724_9 * var_724_8.aspect
					local var_724_11 = var_724_6.sprite.bounds.size.x
					local var_724_12 = var_724_6.sprite.bounds.size.y
					local var_724_13 = var_724_10 / var_724_11
					local var_724_14 = var_724_9 / var_724_12
					local var_724_15 = var_724_14 < var_724_13 and var_724_13 or var_724_14

					var_724_5.transform.localScale = Vector3.New(var_724_15, var_724_15, 0)
				end

				for iter_724_0, iter_724_1 in pairs(arg_721_1.bgs_) do
					if iter_724_0 ~= "ST06a" then
						iter_724_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_724_16 = 4

			if var_724_16 < arg_721_1.time_ and arg_721_1.time_ <= var_724_16 + arg_724_0 then
				arg_721_1.allBtn_.enabled = false
			end

			local var_724_17 = 0.3

			if arg_721_1.time_ >= var_724_16 + var_724_17 and arg_721_1.time_ < var_724_16 + var_724_17 + arg_724_0 then
				arg_721_1.allBtn_.enabled = true
			end

			local var_724_18 = 0

			if var_724_18 < arg_721_1.time_ and arg_721_1.time_ <= var_724_18 + arg_724_0 then
				arg_721_1.mask_.enabled = true
				arg_721_1.mask_.raycastTarget = true

				arg_721_1:SetGaussion(false)
			end

			local var_724_19 = 2

			if var_724_18 <= arg_721_1.time_ and arg_721_1.time_ < var_724_18 + var_724_19 then
				local var_724_20 = (arg_721_1.time_ - var_724_18) / var_724_19
				local var_724_21 = Color.New(0, 0, 0)

				var_724_21.a = Mathf.Lerp(0, 1, var_724_20)
				arg_721_1.mask_.color = var_724_21
			end

			if arg_721_1.time_ >= var_724_18 + var_724_19 and arg_721_1.time_ < var_724_18 + var_724_19 + arg_724_0 then
				local var_724_22 = Color.New(0, 0, 0)

				var_724_22.a = 1
				arg_721_1.mask_.color = var_724_22
			end

			local var_724_23 = 2

			if var_724_23 < arg_721_1.time_ and arg_721_1.time_ <= var_724_23 + arg_724_0 then
				arg_721_1.mask_.enabled = true
				arg_721_1.mask_.raycastTarget = true

				arg_721_1:SetGaussion(false)
			end

			local var_724_24 = 2

			if var_724_23 <= arg_721_1.time_ and arg_721_1.time_ < var_724_23 + var_724_24 then
				local var_724_25 = (arg_721_1.time_ - var_724_23) / var_724_24
				local var_724_26 = Color.New(0, 0, 0)

				var_724_26.a = Mathf.Lerp(1, 0, var_724_25)
				arg_721_1.mask_.color = var_724_26
			end

			if arg_721_1.time_ >= var_724_23 + var_724_24 and arg_721_1.time_ < var_724_23 + var_724_24 + arg_724_0 then
				local var_724_27 = Color.New(0, 0, 0)
				local var_724_28 = 0

				arg_721_1.mask_.enabled = false
				var_724_27.a = var_724_28
				arg_721_1.mask_.color = var_724_27
			end

			local var_724_29 = arg_721_1.actors_["1049ui_story"].transform
			local var_724_30 = 1.96599999815226

			if var_724_30 < arg_721_1.time_ and arg_721_1.time_ <= var_724_30 + arg_724_0 then
				arg_721_1.var_.moveOldPos1049ui_story = var_724_29.localPosition
			end

			local var_724_31 = 0.001

			if var_724_30 <= arg_721_1.time_ and arg_721_1.time_ < var_724_30 + var_724_31 then
				local var_724_32 = (arg_721_1.time_ - var_724_30) / var_724_31
				local var_724_33 = Vector3.New(0, 100, 0)

				var_724_29.localPosition = Vector3.Lerp(arg_721_1.var_.moveOldPos1049ui_story, var_724_33, var_724_32)

				local var_724_34 = manager.ui.mainCamera.transform.position - var_724_29.position

				var_724_29.forward = Vector3.New(var_724_34.x, var_724_34.y, var_724_34.z)

				local var_724_35 = var_724_29.localEulerAngles

				var_724_35.z = 0
				var_724_35.x = 0
				var_724_29.localEulerAngles = var_724_35
			end

			if arg_721_1.time_ >= var_724_30 + var_724_31 and arg_721_1.time_ < var_724_30 + var_724_31 + arg_724_0 then
				var_724_29.localPosition = Vector3.New(0, 100, 0)

				local var_724_36 = manager.ui.mainCamera.transform.position - var_724_29.position

				var_724_29.forward = Vector3.New(var_724_36.x, var_724_36.y, var_724_36.z)

				local var_724_37 = var_724_29.localEulerAngles

				var_724_37.z = 0
				var_724_37.x = 0
				var_724_29.localEulerAngles = var_724_37
			end

			local var_724_38 = arg_721_1.actors_["1049ui_story"]
			local var_724_39 = 1.96599999815226

			if var_724_39 < arg_721_1.time_ and arg_721_1.time_ <= var_724_39 + arg_724_0 and not isNil(var_724_38) and arg_721_1.var_.characterEffect1049ui_story == nil then
				arg_721_1.var_.characterEffect1049ui_story = var_724_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_724_40 = 0.0166666666666667

			if var_724_39 <= arg_721_1.time_ and arg_721_1.time_ < var_724_39 + var_724_40 and not isNil(var_724_38) then
				local var_724_41 = (arg_721_1.time_ - var_724_39) / var_724_40

				if arg_721_1.var_.characterEffect1049ui_story and not isNil(var_724_38) then
					local var_724_42 = Mathf.Lerp(0, 0.5, var_724_41)

					arg_721_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_721_1.var_.characterEffect1049ui_story.fillRatio = var_724_42
				end
			end

			if arg_721_1.time_ >= var_724_39 + var_724_40 and arg_721_1.time_ < var_724_39 + var_724_40 + arg_724_0 and not isNil(var_724_38) and arg_721_1.var_.characterEffect1049ui_story then
				local var_724_43 = 0.5

				arg_721_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_721_1.var_.characterEffect1049ui_story.fillRatio = var_724_43
			end

			local var_724_44 = 0.2
			local var_724_45 = 1

			if var_724_44 < arg_721_1.time_ and arg_721_1.time_ <= var_724_44 + arg_724_0 then
				local var_724_46 = "stop"
				local var_724_47 = "effect"

				arg_721_1:AudioAction(var_724_46, var_724_47, "se_story_side_1049", "se_story_side_1049_amb_river_waterfall", "")
			end

			local var_724_48 = 1.56666666666667
			local var_724_49 = 1

			if var_724_48 < arg_721_1.time_ and arg_721_1.time_ <= var_724_48 + arg_724_0 then
				local var_724_50 = "play"
				local var_724_51 = "effect"

				arg_721_1:AudioAction(var_724_50, var_724_51, "se_story_side_1075", "se_story_side_1075_morningloop", "")
			end

			local var_724_52 = 0
			local var_724_53 = 0.2

			if var_724_52 < arg_721_1.time_ and arg_721_1.time_ <= var_724_52 + arg_724_0 then
				local var_724_54 = "play"
				local var_724_55 = "music"

				arg_721_1:AudioAction(var_724_54, var_724_55, "ui_battle", "ui_battle_stopbgm", "")

				local var_724_56 = ""
				local var_724_57 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_724_57 ~= "" then
					if arg_721_1.bgmTxt_.text ~= var_724_57 and arg_721_1.bgmTxt_.text ~= "" then
						if arg_721_1.bgmTxt2_.text ~= "" then
							arg_721_1.bgmTxt_.text = arg_721_1.bgmTxt2_.text
						end

						arg_721_1.bgmTxt2_.text = var_724_57

						arg_721_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_721_1.bgmTxt_.text = var_724_57
					end

					if arg_721_1.bgmTimer then
						arg_721_1.bgmTimer:Stop()

						arg_721_1.bgmTimer = nil
					end

					if arg_721_1.settingData.show_music_name == 1 then
						arg_721_1.musicController:SetSelectedState("show")
						arg_721_1.musicAnimator_:Play("open", 0, 0)

						if arg_721_1.settingData.music_time ~= 0 then
							arg_721_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_721_1.settingData.music_time), function()
								if arg_721_1 == nil or isNil(arg_721_1.bgmTxt_) then
									return
								end

								arg_721_1.musicController:SetSelectedState("hide")
								arg_721_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_724_58 = 1.56666666666667
			local var_724_59 = 1

			if var_724_58 < arg_721_1.time_ and arg_721_1.time_ <= var_724_58 + arg_724_0 then
				local var_724_60 = "play"
				local var_724_61 = "music"

				arg_721_1:AudioAction(var_724_60, var_724_61, "bgm_activity_2_6_story_izanami_piano", "bgm_activity_2_6_story_izanami_piano", "bgm_activity_2_6_story_izanami_piano.awb")

				local var_724_62 = ""
				local var_724_63 = manager.audio:GetAudioName("bgm_activity_2_6_story_izanami_piano", "bgm_activity_2_6_story_izanami_piano")

				if var_724_63 ~= "" then
					if arg_721_1.bgmTxt_.text ~= var_724_63 and arg_721_1.bgmTxt_.text ~= "" then
						if arg_721_1.bgmTxt2_.text ~= "" then
							arg_721_1.bgmTxt_.text = arg_721_1.bgmTxt2_.text
						end

						arg_721_1.bgmTxt2_.text = var_724_63

						arg_721_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_721_1.bgmTxt_.text = var_724_63
					end

					if arg_721_1.bgmTimer then
						arg_721_1.bgmTimer:Stop()

						arg_721_1.bgmTimer = nil
					end

					if arg_721_1.settingData.show_music_name == 1 then
						arg_721_1.musicController:SetSelectedState("show")
						arg_721_1.musicAnimator_:Play("open", 0, 0)

						if arg_721_1.settingData.music_time ~= 0 then
							arg_721_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_721_1.settingData.music_time), function()
								if arg_721_1 == nil or isNil(arg_721_1.bgmTxt_) then
									return
								end

								arg_721_1.musicController:SetSelectedState("hide")
								arg_721_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_721_1.frameCnt_ <= 1 then
				arg_721_1.dialog_:SetActive(false)
			end

			local var_724_64 = 4
			local var_724_65 = 1.05

			if var_724_64 < arg_721_1.time_ and arg_721_1.time_ <= var_724_64 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0

				arg_721_1.dialog_:SetActive(true)

				local var_724_66 = LeanTween.value(arg_721_1.dialog_, 0, 1, 0.3)

				var_724_66:setOnUpdate(LuaHelper.FloatAction(function(arg_727_0)
					arg_721_1.dialogCg_.alpha = arg_727_0
				end))
				var_724_66:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_721_1.dialog_)
					var_724_66:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_721_1.duration_ = arg_721_1.duration_ + 0.3

				SetActive(arg_721_1.leftNameGo_, false)

				arg_721_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_721_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_721_1:RecordName(arg_721_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_721_1.iconTrs_.gameObject, false)
				arg_721_1.callingController_:SetSelectedState("normal")

				local var_724_67 = arg_721_1:GetWordFromCfg(1104905172)
				local var_724_68 = arg_721_1:FormatText(var_724_67.content)

				arg_721_1.text_.text = var_724_68

				LuaForUtil.ClearLinePrefixSymbol(arg_721_1.text_)

				local var_724_69 = 42
				local var_724_70 = utf8.len(var_724_68)
				local var_724_71 = var_724_69 <= 0 and var_724_65 or var_724_65 * (var_724_70 / var_724_69)

				if var_724_71 > 0 and var_724_65 < var_724_71 then
					arg_721_1.talkMaxDuration = var_724_71
					var_724_64 = var_724_64 + 0.3

					if var_724_71 + var_724_64 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_71 + var_724_64
					end
				end

				arg_721_1.text_.text = var_724_68
				arg_721_1.typewritter.percent = 0

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(false)
				arg_721_1:RecordContent(arg_721_1.text_.text)
			end

			local var_724_72 = var_724_64 + 0.3
			local var_724_73 = math.max(var_724_65, arg_721_1.talkMaxDuration)

			if var_724_72 <= arg_721_1.time_ and arg_721_1.time_ < var_724_72 + var_724_73 then
				arg_721_1.typewritter.percent = (arg_721_1.time_ - var_724_72) / var_724_73

				arg_721_1.typewritter:SetDirty()
			end

			if arg_721_1.time_ >= var_724_72 + var_724_73 and arg_721_1.time_ < var_724_72 + var_724_73 + arg_724_0 then
				arg_721_1.typewritter.percent = 1

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905173 = function(arg_729_0, arg_729_1)
		arg_729_1.time_ = 0
		arg_729_1.frameCnt_ = 0
		arg_729_1.state_ = "playing"
		arg_729_1.curTalkId_ = 1104905173
		arg_729_1.duration_ = 4.67

		SetActive(arg_729_1.tipsGo_, false)

		function arg_729_1.onSingleLineFinish_()
			arg_729_1.onSingleLineUpdate_ = nil
			arg_729_1.onSingleLineFinish_ = nil
			arg_729_1.state_ = "waiting"
		end

		function arg_729_1.playNext_(arg_731_0)
			if arg_731_0 == 1 then
				arg_729_0:Play1104905174(arg_729_1)
			end
		end

		function arg_729_1.onSingleLineUpdate_(arg_732_0)
			local var_732_0 = arg_729_1.actors_["1049ui_story"].transform
			local var_732_1 = 0

			if var_732_1 < arg_729_1.time_ and arg_729_1.time_ <= var_732_1 + arg_732_0 then
				arg_729_1.var_.moveOldPos1049ui_story = var_732_0.localPosition
			end

			local var_732_2 = 0.001

			if var_732_1 <= arg_729_1.time_ and arg_729_1.time_ < var_732_1 + var_732_2 then
				local var_732_3 = (arg_729_1.time_ - var_732_1) / var_732_2
				local var_732_4 = Vector3.New(0, -1.2, -6)

				var_732_0.localPosition = Vector3.Lerp(arg_729_1.var_.moveOldPos1049ui_story, var_732_4, var_732_3)

				local var_732_5 = manager.ui.mainCamera.transform.position - var_732_0.position

				var_732_0.forward = Vector3.New(var_732_5.x, var_732_5.y, var_732_5.z)

				local var_732_6 = var_732_0.localEulerAngles

				var_732_6.z = 0
				var_732_6.x = 0
				var_732_0.localEulerAngles = var_732_6
			end

			if arg_729_1.time_ >= var_732_1 + var_732_2 and arg_729_1.time_ < var_732_1 + var_732_2 + arg_732_0 then
				var_732_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_732_7 = manager.ui.mainCamera.transform.position - var_732_0.position

				var_732_0.forward = Vector3.New(var_732_7.x, var_732_7.y, var_732_7.z)

				local var_732_8 = var_732_0.localEulerAngles

				var_732_8.z = 0
				var_732_8.x = 0
				var_732_0.localEulerAngles = var_732_8
			end

			local var_732_9 = arg_729_1.actors_["1049ui_story"]
			local var_732_10 = 0

			if var_732_10 < arg_729_1.time_ and arg_729_1.time_ <= var_732_10 + arg_732_0 and not isNil(var_732_9) and arg_729_1.var_.characterEffect1049ui_story == nil then
				arg_729_1.var_.characterEffect1049ui_story = var_732_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_732_11 = 0.200000002980232

			if var_732_10 <= arg_729_1.time_ and arg_729_1.time_ < var_732_10 + var_732_11 and not isNil(var_732_9) then
				local var_732_12 = (arg_729_1.time_ - var_732_10) / var_732_11

				if arg_729_1.var_.characterEffect1049ui_story and not isNil(var_732_9) then
					arg_729_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_729_1.time_ >= var_732_10 + var_732_11 and arg_729_1.time_ < var_732_10 + var_732_11 + arg_732_0 and not isNil(var_732_9) and arg_729_1.var_.characterEffect1049ui_story then
				arg_729_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_732_13 = 0

			if var_732_13 < arg_729_1.time_ and arg_729_1.time_ <= var_732_13 + arg_732_0 then
				arg_729_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_732_14 = 0

			if var_732_14 < arg_729_1.time_ and arg_729_1.time_ <= var_732_14 + arg_732_0 then
				arg_729_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva", "EmotionTimelineAnimator")
			end

			local var_732_15 = 0
			local var_732_16 = 0.5

			if var_732_15 < arg_729_1.time_ and arg_729_1.time_ <= var_732_15 + arg_732_0 then
				arg_729_1.talkMaxDuration = 0
				arg_729_1.dialogCg_.alpha = 1

				arg_729_1.dialog_:SetActive(true)
				SetActive(arg_729_1.leftNameGo_, true)

				local var_732_17 = arg_729_1:FormatText(StoryNameCfg[551].name)

				arg_729_1.leftNameTxt_.text = var_732_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_729_1.leftNameTxt_.transform)

				arg_729_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_729_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_729_1:RecordName(arg_729_1.leftNameTxt_.text)
				SetActive(arg_729_1.iconTrs_.gameObject, false)
				arg_729_1.callingController_:SetSelectedState("normal")

				local var_732_18 = arg_729_1:GetWordFromCfg(1104905173)
				local var_732_19 = arg_729_1:FormatText(var_732_18.content)

				arg_729_1.text_.text = var_732_19

				LuaForUtil.ClearLinePrefixSymbol(arg_729_1.text_)

				local var_732_20 = 20
				local var_732_21 = utf8.len(var_732_19)
				local var_732_22 = var_732_20 <= 0 and var_732_16 or var_732_16 * (var_732_21 / var_732_20)

				if var_732_22 > 0 and var_732_16 < var_732_22 then
					arg_729_1.talkMaxDuration = var_732_22

					if var_732_22 + var_732_15 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_22 + var_732_15
					end
				end

				arg_729_1.text_.text = var_732_19
				arg_729_1.typewritter.percent = 0

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905173", "story_v_side_new_1104905.awb") ~= 0 then
					local var_732_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905173", "story_v_side_new_1104905.awb") / 1000

					if var_732_23 + var_732_15 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_23 + var_732_15
					end

					if var_732_18.prefab_name ~= "" and arg_729_1.actors_[var_732_18.prefab_name] ~= nil then
						local var_732_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_729_1.actors_[var_732_18.prefab_name].transform, "story_v_side_new_1104905", "1104905173", "story_v_side_new_1104905.awb")

						arg_729_1:RecordAudio("1104905173", var_732_24)
						arg_729_1:RecordAudio("1104905173", var_732_24)
					else
						arg_729_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905173", "story_v_side_new_1104905.awb")
					end

					arg_729_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905173", "story_v_side_new_1104905.awb")
				end

				arg_729_1:RecordContent(arg_729_1.text_.text)
			end

			local var_732_25 = math.max(var_732_16, arg_729_1.talkMaxDuration)

			if var_732_15 <= arg_729_1.time_ and arg_729_1.time_ < var_732_15 + var_732_25 then
				arg_729_1.typewritter.percent = (arg_729_1.time_ - var_732_15) / var_732_25

				arg_729_1.typewritter:SetDirty()
			end

			if arg_729_1.time_ >= var_732_15 + var_732_25 and arg_729_1.time_ < var_732_15 + var_732_25 + arg_732_0 then
				arg_729_1.typewritter.percent = 1

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905174 = function(arg_733_0, arg_733_1)
		arg_733_1.time_ = 0
		arg_733_1.frameCnt_ = 0
		arg_733_1.state_ = "playing"
		arg_733_1.curTalkId_ = 1104905174
		arg_733_1.duration_ = 5

		SetActive(arg_733_1.tipsGo_, false)

		function arg_733_1.onSingleLineFinish_()
			arg_733_1.onSingleLineUpdate_ = nil
			arg_733_1.onSingleLineFinish_ = nil
			arg_733_1.state_ = "waiting"
		end

		function arg_733_1.playNext_(arg_735_0)
			if arg_735_0 == 1 then
				arg_733_0:Play1104905175(arg_733_1)
			end
		end

		function arg_733_1.onSingleLineUpdate_(arg_736_0)
			local var_736_0 = arg_733_1.actors_["1049ui_story"]
			local var_736_1 = 0

			if var_736_1 < arg_733_1.time_ and arg_733_1.time_ <= var_736_1 + arg_736_0 and not isNil(var_736_0) and arg_733_1.var_.characterEffect1049ui_story == nil then
				arg_733_1.var_.characterEffect1049ui_story = var_736_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_736_2 = 0.200000002980232

			if var_736_1 <= arg_733_1.time_ and arg_733_1.time_ < var_736_1 + var_736_2 and not isNil(var_736_0) then
				local var_736_3 = (arg_733_1.time_ - var_736_1) / var_736_2

				if arg_733_1.var_.characterEffect1049ui_story and not isNil(var_736_0) then
					local var_736_4 = Mathf.Lerp(0, 0.5, var_736_3)

					arg_733_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_733_1.var_.characterEffect1049ui_story.fillRatio = var_736_4
				end
			end

			if arg_733_1.time_ >= var_736_1 + var_736_2 and arg_733_1.time_ < var_736_1 + var_736_2 + arg_736_0 and not isNil(var_736_0) and arg_733_1.var_.characterEffect1049ui_story then
				local var_736_5 = 0.5

				arg_733_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_733_1.var_.characterEffect1049ui_story.fillRatio = var_736_5
			end

			local var_736_6 = 0
			local var_736_7 = 0.225

			if var_736_6 < arg_733_1.time_ and arg_733_1.time_ <= var_736_6 + arg_736_0 then
				arg_733_1.talkMaxDuration = 0
				arg_733_1.dialogCg_.alpha = 1

				arg_733_1.dialog_:SetActive(true)
				SetActive(arg_733_1.leftNameGo_, true)

				local var_736_8 = arg_733_1:FormatText(StoryNameCfg[7].name)

				arg_733_1.leftNameTxt_.text = var_736_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_733_1.leftNameTxt_.transform)

				arg_733_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_733_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_733_1:RecordName(arg_733_1.leftNameTxt_.text)
				SetActive(arg_733_1.iconTrs_.gameObject, false)
				arg_733_1.callingController_:SetSelectedState("normal")

				local var_736_9 = arg_733_1:GetWordFromCfg(1104905174)
				local var_736_10 = arg_733_1:FormatText(var_736_9.content)

				arg_733_1.text_.text = var_736_10

				LuaForUtil.ClearLinePrefixSymbol(arg_733_1.text_)

				local var_736_11 = 9
				local var_736_12 = utf8.len(var_736_10)
				local var_736_13 = var_736_11 <= 0 and var_736_7 or var_736_7 * (var_736_12 / var_736_11)

				if var_736_13 > 0 and var_736_7 < var_736_13 then
					arg_733_1.talkMaxDuration = var_736_13

					if var_736_13 + var_736_6 > arg_733_1.duration_ then
						arg_733_1.duration_ = var_736_13 + var_736_6
					end
				end

				arg_733_1.text_.text = var_736_10
				arg_733_1.typewritter.percent = 0

				arg_733_1.typewritter:SetDirty()
				arg_733_1:ShowNextGo(false)
				arg_733_1:RecordContent(arg_733_1.text_.text)
			end

			local var_736_14 = math.max(var_736_7, arg_733_1.talkMaxDuration)

			if var_736_6 <= arg_733_1.time_ and arg_733_1.time_ < var_736_6 + var_736_14 then
				arg_733_1.typewritter.percent = (arg_733_1.time_ - var_736_6) / var_736_14

				arg_733_1.typewritter:SetDirty()
			end

			if arg_733_1.time_ >= var_736_6 + var_736_14 and arg_733_1.time_ < var_736_6 + var_736_14 + arg_736_0 then
				arg_733_1.typewritter.percent = 1

				arg_733_1.typewritter:SetDirty()
				arg_733_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905175 = function(arg_737_0, arg_737_1)
		arg_737_1.time_ = 0
		arg_737_1.frameCnt_ = 0
		arg_737_1.state_ = "playing"
		arg_737_1.curTalkId_ = 1104905175
		arg_737_1.duration_ = 5.2

		SetActive(arg_737_1.tipsGo_, false)

		function arg_737_1.onSingleLineFinish_()
			arg_737_1.onSingleLineUpdate_ = nil
			arg_737_1.onSingleLineFinish_ = nil
			arg_737_1.state_ = "waiting"
		end

		function arg_737_1.playNext_(arg_739_0)
			if arg_739_0 == 1 then
				arg_737_0:Play1104905176(arg_737_1)
			end
		end

		function arg_737_1.onSingleLineUpdate_(arg_740_0)
			local var_740_0 = arg_737_1.actors_["1049ui_story"]
			local var_740_1 = 0

			if var_740_1 < arg_737_1.time_ and arg_737_1.time_ <= var_740_1 + arg_740_0 and not isNil(var_740_0) and arg_737_1.var_.characterEffect1049ui_story == nil then
				arg_737_1.var_.characterEffect1049ui_story = var_740_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_740_2 = 0.200000002980232

			if var_740_1 <= arg_737_1.time_ and arg_737_1.time_ < var_740_1 + var_740_2 and not isNil(var_740_0) then
				local var_740_3 = (arg_737_1.time_ - var_740_1) / var_740_2

				if arg_737_1.var_.characterEffect1049ui_story and not isNil(var_740_0) then
					arg_737_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_737_1.time_ >= var_740_1 + var_740_2 and arg_737_1.time_ < var_740_1 + var_740_2 + arg_740_0 and not isNil(var_740_0) and arg_737_1.var_.characterEffect1049ui_story then
				arg_737_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_740_4 = 0

			if var_740_4 < arg_737_1.time_ and arg_737_1.time_ <= var_740_4 + arg_740_0 then
				arg_737_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_740_5 = 0

			if var_740_5 < arg_737_1.time_ and arg_737_1.time_ <= var_740_5 + arg_740_0 then
				arg_737_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_740_6 = 0
			local var_740_7 = 0.425

			if var_740_6 < arg_737_1.time_ and arg_737_1.time_ <= var_740_6 + arg_740_0 then
				arg_737_1.talkMaxDuration = 0
				arg_737_1.dialogCg_.alpha = 1

				arg_737_1.dialog_:SetActive(true)
				SetActive(arg_737_1.leftNameGo_, true)

				local var_740_8 = arg_737_1:FormatText(StoryNameCfg[551].name)

				arg_737_1.leftNameTxt_.text = var_740_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_737_1.leftNameTxt_.transform)

				arg_737_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_737_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_737_1:RecordName(arg_737_1.leftNameTxt_.text)
				SetActive(arg_737_1.iconTrs_.gameObject, false)
				arg_737_1.callingController_:SetSelectedState("normal")

				local var_740_9 = arg_737_1:GetWordFromCfg(1104905175)
				local var_740_10 = arg_737_1:FormatText(var_740_9.content)

				arg_737_1.text_.text = var_740_10

				LuaForUtil.ClearLinePrefixSymbol(arg_737_1.text_)

				local var_740_11 = 17
				local var_740_12 = utf8.len(var_740_10)
				local var_740_13 = var_740_11 <= 0 and var_740_7 or var_740_7 * (var_740_12 / var_740_11)

				if var_740_13 > 0 and var_740_7 < var_740_13 then
					arg_737_1.talkMaxDuration = var_740_13

					if var_740_13 + var_740_6 > arg_737_1.duration_ then
						arg_737_1.duration_ = var_740_13 + var_740_6
					end
				end

				arg_737_1.text_.text = var_740_10
				arg_737_1.typewritter.percent = 0

				arg_737_1.typewritter:SetDirty()
				arg_737_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905175", "story_v_side_new_1104905.awb") ~= 0 then
					local var_740_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905175", "story_v_side_new_1104905.awb") / 1000

					if var_740_14 + var_740_6 > arg_737_1.duration_ then
						arg_737_1.duration_ = var_740_14 + var_740_6
					end

					if var_740_9.prefab_name ~= "" and arg_737_1.actors_[var_740_9.prefab_name] ~= nil then
						local var_740_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_737_1.actors_[var_740_9.prefab_name].transform, "story_v_side_new_1104905", "1104905175", "story_v_side_new_1104905.awb")

						arg_737_1:RecordAudio("1104905175", var_740_15)
						arg_737_1:RecordAudio("1104905175", var_740_15)
					else
						arg_737_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905175", "story_v_side_new_1104905.awb")
					end

					arg_737_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905175", "story_v_side_new_1104905.awb")
				end

				arg_737_1:RecordContent(arg_737_1.text_.text)
			end

			local var_740_16 = math.max(var_740_7, arg_737_1.talkMaxDuration)

			if var_740_6 <= arg_737_1.time_ and arg_737_1.time_ < var_740_6 + var_740_16 then
				arg_737_1.typewritter.percent = (arg_737_1.time_ - var_740_6) / var_740_16

				arg_737_1.typewritter:SetDirty()
			end

			if arg_737_1.time_ >= var_740_6 + var_740_16 and arg_737_1.time_ < var_740_6 + var_740_16 + arg_740_0 then
				arg_737_1.typewritter.percent = 1

				arg_737_1.typewritter:SetDirty()
				arg_737_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905176 = function(arg_741_0, arg_741_1)
		arg_741_1.time_ = 0
		arg_741_1.frameCnt_ = 0
		arg_741_1.state_ = "playing"
		arg_741_1.curTalkId_ = 1104905176
		arg_741_1.duration_ = 5

		SetActive(arg_741_1.tipsGo_, false)

		function arg_741_1.onSingleLineFinish_()
			arg_741_1.onSingleLineUpdate_ = nil
			arg_741_1.onSingleLineFinish_ = nil
			arg_741_1.state_ = "waiting"
		end

		function arg_741_1.playNext_(arg_743_0)
			if arg_743_0 == 1 then
				arg_741_0:Play1104905177(arg_741_1)
			end
		end

		function arg_741_1.onSingleLineUpdate_(arg_744_0)
			local var_744_0 = arg_741_1.actors_["1049ui_story"]
			local var_744_1 = 0

			if var_744_1 < arg_741_1.time_ and arg_741_1.time_ <= var_744_1 + arg_744_0 and not isNil(var_744_0) and arg_741_1.var_.characterEffect1049ui_story == nil then
				arg_741_1.var_.characterEffect1049ui_story = var_744_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_744_2 = 0.200000002980232

			if var_744_1 <= arg_741_1.time_ and arg_741_1.time_ < var_744_1 + var_744_2 and not isNil(var_744_0) then
				local var_744_3 = (arg_741_1.time_ - var_744_1) / var_744_2

				if arg_741_1.var_.characterEffect1049ui_story and not isNil(var_744_0) then
					local var_744_4 = Mathf.Lerp(0, 0.5, var_744_3)

					arg_741_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_741_1.var_.characterEffect1049ui_story.fillRatio = var_744_4
				end
			end

			if arg_741_1.time_ >= var_744_1 + var_744_2 and arg_741_1.time_ < var_744_1 + var_744_2 + arg_744_0 and not isNil(var_744_0) and arg_741_1.var_.characterEffect1049ui_story then
				local var_744_5 = 0.5

				arg_741_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_741_1.var_.characterEffect1049ui_story.fillRatio = var_744_5
			end

			local var_744_6 = 0
			local var_744_7 = 0.175

			if var_744_6 < arg_741_1.time_ and arg_741_1.time_ <= var_744_6 + arg_744_0 then
				arg_741_1.talkMaxDuration = 0
				arg_741_1.dialogCg_.alpha = 1

				arg_741_1.dialog_:SetActive(true)
				SetActive(arg_741_1.leftNameGo_, true)

				local var_744_8 = arg_741_1:FormatText(StoryNameCfg[7].name)

				arg_741_1.leftNameTxt_.text = var_744_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_741_1.leftNameTxt_.transform)

				arg_741_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_741_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_741_1:RecordName(arg_741_1.leftNameTxt_.text)
				SetActive(arg_741_1.iconTrs_.gameObject, false)
				arg_741_1.callingController_:SetSelectedState("normal")

				local var_744_9 = arg_741_1:GetWordFromCfg(1104905176)
				local var_744_10 = arg_741_1:FormatText(var_744_9.content)

				arg_741_1.text_.text = var_744_10

				LuaForUtil.ClearLinePrefixSymbol(arg_741_1.text_)

				local var_744_11 = 7
				local var_744_12 = utf8.len(var_744_10)
				local var_744_13 = var_744_11 <= 0 and var_744_7 or var_744_7 * (var_744_12 / var_744_11)

				if var_744_13 > 0 and var_744_7 < var_744_13 then
					arg_741_1.talkMaxDuration = var_744_13

					if var_744_13 + var_744_6 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_13 + var_744_6
					end
				end

				arg_741_1.text_.text = var_744_10
				arg_741_1.typewritter.percent = 0

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(false)
				arg_741_1:RecordContent(arg_741_1.text_.text)
			end

			local var_744_14 = math.max(var_744_7, arg_741_1.talkMaxDuration)

			if var_744_6 <= arg_741_1.time_ and arg_741_1.time_ < var_744_6 + var_744_14 then
				arg_741_1.typewritter.percent = (arg_741_1.time_ - var_744_6) / var_744_14

				arg_741_1.typewritter:SetDirty()
			end

			if arg_741_1.time_ >= var_744_6 + var_744_14 and arg_741_1.time_ < var_744_6 + var_744_14 + arg_744_0 then
				arg_741_1.typewritter.percent = 1

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905177 = function(arg_745_0, arg_745_1)
		arg_745_1.time_ = 0
		arg_745_1.frameCnt_ = 0
		arg_745_1.state_ = "playing"
		arg_745_1.curTalkId_ = 1104905177
		arg_745_1.duration_ = 5

		SetActive(arg_745_1.tipsGo_, false)

		function arg_745_1.onSingleLineFinish_()
			arg_745_1.onSingleLineUpdate_ = nil
			arg_745_1.onSingleLineFinish_ = nil
			arg_745_1.state_ = "waiting"
		end

		function arg_745_1.playNext_(arg_747_0)
			if arg_747_0 == 1 then
				arg_745_0:Play1104905178(arg_745_1)
			end
		end

		function arg_745_1.onSingleLineUpdate_(arg_748_0)
			local var_748_0 = arg_745_1.actors_["1049ui_story"].transform
			local var_748_1 = 0

			if var_748_1 < arg_745_1.time_ and arg_745_1.time_ <= var_748_1 + arg_748_0 then
				arg_745_1.var_.moveOldPos1049ui_story = var_748_0.localPosition
			end

			local var_748_2 = 0.001

			if var_748_1 <= arg_745_1.time_ and arg_745_1.time_ < var_748_1 + var_748_2 then
				local var_748_3 = (arg_745_1.time_ - var_748_1) / var_748_2
				local var_748_4 = Vector3.New(0, 100, 0)

				var_748_0.localPosition = Vector3.Lerp(arg_745_1.var_.moveOldPos1049ui_story, var_748_4, var_748_3)

				local var_748_5 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_5.x, var_748_5.y, var_748_5.z)

				local var_748_6 = var_748_0.localEulerAngles

				var_748_6.z = 0
				var_748_6.x = 0
				var_748_0.localEulerAngles = var_748_6
			end

			if arg_745_1.time_ >= var_748_1 + var_748_2 and arg_745_1.time_ < var_748_1 + var_748_2 + arg_748_0 then
				var_748_0.localPosition = Vector3.New(0, 100, 0)

				local var_748_7 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_7.x, var_748_7.y, var_748_7.z)

				local var_748_8 = var_748_0.localEulerAngles

				var_748_8.z = 0
				var_748_8.x = 0
				var_748_0.localEulerAngles = var_748_8
			end

			local var_748_9 = 0
			local var_748_10 = 1.025

			if var_748_9 < arg_745_1.time_ and arg_745_1.time_ <= var_748_9 + arg_748_0 then
				arg_745_1.talkMaxDuration = 0
				arg_745_1.dialogCg_.alpha = 1

				arg_745_1.dialog_:SetActive(true)
				SetActive(arg_745_1.leftNameGo_, false)

				arg_745_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_745_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_745_1:RecordName(arg_745_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_745_1.iconTrs_.gameObject, false)
				arg_745_1.callingController_:SetSelectedState("normal")

				local var_748_11 = arg_745_1:GetWordFromCfg(1104905177)
				local var_748_12 = arg_745_1:FormatText(var_748_11.content)

				arg_745_1.text_.text = var_748_12

				LuaForUtil.ClearLinePrefixSymbol(arg_745_1.text_)

				local var_748_13 = 41
				local var_748_14 = utf8.len(var_748_12)
				local var_748_15 = var_748_13 <= 0 and var_748_10 or var_748_10 * (var_748_14 / var_748_13)

				if var_748_15 > 0 and var_748_10 < var_748_15 then
					arg_745_1.talkMaxDuration = var_748_15

					if var_748_15 + var_748_9 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_15 + var_748_9
					end
				end

				arg_745_1.text_.text = var_748_12
				arg_745_1.typewritter.percent = 0

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(false)
				arg_745_1:RecordContent(arg_745_1.text_.text)
			end

			local var_748_16 = math.max(var_748_10, arg_745_1.talkMaxDuration)

			if var_748_9 <= arg_745_1.time_ and arg_745_1.time_ < var_748_9 + var_748_16 then
				arg_745_1.typewritter.percent = (arg_745_1.time_ - var_748_9) / var_748_16

				arg_745_1.typewritter:SetDirty()
			end

			if arg_745_1.time_ >= var_748_9 + var_748_16 and arg_745_1.time_ < var_748_9 + var_748_16 + arg_748_0 then
				arg_745_1.typewritter.percent = 1

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905178 = function(arg_749_0, arg_749_1)
		arg_749_1.time_ = 0
		arg_749_1.frameCnt_ = 0
		arg_749_1.state_ = "playing"
		arg_749_1.curTalkId_ = 1104905178
		arg_749_1.duration_ = 5

		SetActive(arg_749_1.tipsGo_, false)

		function arg_749_1.onSingleLineFinish_()
			arg_749_1.onSingleLineUpdate_ = nil
			arg_749_1.onSingleLineFinish_ = nil
			arg_749_1.state_ = "waiting"
		end

		function arg_749_1.playNext_(arg_751_0)
			if arg_751_0 == 1 then
				arg_749_0:Play1104905179(arg_749_1)
			end
		end

		function arg_749_1.onSingleLineUpdate_(arg_752_0)
			local var_752_0 = 0
			local var_752_1 = 0.675

			if var_752_0 < arg_749_1.time_ and arg_749_1.time_ <= var_752_0 + arg_752_0 then
				arg_749_1.talkMaxDuration = 0
				arg_749_1.dialogCg_.alpha = 1

				arg_749_1.dialog_:SetActive(true)
				SetActive(arg_749_1.leftNameGo_, false)

				arg_749_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_749_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_749_1:RecordName(arg_749_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_749_1.iconTrs_.gameObject, false)
				arg_749_1.callingController_:SetSelectedState("normal")

				local var_752_2 = arg_749_1:GetWordFromCfg(1104905178)
				local var_752_3 = arg_749_1:FormatText(var_752_2.content)

				arg_749_1.text_.text = var_752_3

				LuaForUtil.ClearLinePrefixSymbol(arg_749_1.text_)

				local var_752_4 = 27
				local var_752_5 = utf8.len(var_752_3)
				local var_752_6 = var_752_4 <= 0 and var_752_1 or var_752_1 * (var_752_5 / var_752_4)

				if var_752_6 > 0 and var_752_1 < var_752_6 then
					arg_749_1.talkMaxDuration = var_752_6

					if var_752_6 + var_752_0 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_6 + var_752_0
					end
				end

				arg_749_1.text_.text = var_752_3
				arg_749_1.typewritter.percent = 0

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(false)
				arg_749_1:RecordContent(arg_749_1.text_.text)
			end

			local var_752_7 = math.max(var_752_1, arg_749_1.talkMaxDuration)

			if var_752_0 <= arg_749_1.time_ and arg_749_1.time_ < var_752_0 + var_752_7 then
				arg_749_1.typewritter.percent = (arg_749_1.time_ - var_752_0) / var_752_7

				arg_749_1.typewritter:SetDirty()
			end

			if arg_749_1.time_ >= var_752_0 + var_752_7 and arg_749_1.time_ < var_752_0 + var_752_7 + arg_752_0 then
				arg_749_1.typewritter.percent = 1

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905179 = function(arg_753_0, arg_753_1)
		arg_753_1.time_ = 0
		arg_753_1.frameCnt_ = 0
		arg_753_1.state_ = "playing"
		arg_753_1.curTalkId_ = 1104905179
		arg_753_1.duration_ = 5

		SetActive(arg_753_1.tipsGo_, false)

		function arg_753_1.onSingleLineFinish_()
			arg_753_1.onSingleLineUpdate_ = nil
			arg_753_1.onSingleLineFinish_ = nil
			arg_753_1.state_ = "waiting"
		end

		function arg_753_1.playNext_(arg_755_0)
			if arg_755_0 == 1 then
				arg_753_0:Play1104905180(arg_753_1)
			end
		end

		function arg_753_1.onSingleLineUpdate_(arg_756_0)
			local var_756_0 = 0
			local var_756_1 = 0.325

			if var_756_0 < arg_753_1.time_ and arg_753_1.time_ <= var_756_0 + arg_756_0 then
				arg_753_1.talkMaxDuration = 0
				arg_753_1.dialogCg_.alpha = 1

				arg_753_1.dialog_:SetActive(true)
				SetActive(arg_753_1.leftNameGo_, true)

				local var_756_2 = arg_753_1:FormatText(StoryNameCfg[7].name)

				arg_753_1.leftNameTxt_.text = var_756_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_753_1.leftNameTxt_.transform)

				arg_753_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_753_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_753_1:RecordName(arg_753_1.leftNameTxt_.text)
				SetActive(arg_753_1.iconTrs_.gameObject, false)
				arg_753_1.callingController_:SetSelectedState("normal")

				local var_756_3 = arg_753_1:GetWordFromCfg(1104905179)
				local var_756_4 = arg_753_1:FormatText(var_756_3.content)

				arg_753_1.text_.text = var_756_4

				LuaForUtil.ClearLinePrefixSymbol(arg_753_1.text_)

				local var_756_5 = 13
				local var_756_6 = utf8.len(var_756_4)
				local var_756_7 = var_756_5 <= 0 and var_756_1 or var_756_1 * (var_756_6 / var_756_5)

				if var_756_7 > 0 and var_756_1 < var_756_7 then
					arg_753_1.talkMaxDuration = var_756_7

					if var_756_7 + var_756_0 > arg_753_1.duration_ then
						arg_753_1.duration_ = var_756_7 + var_756_0
					end
				end

				arg_753_1.text_.text = var_756_4
				arg_753_1.typewritter.percent = 0

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(false)
				arg_753_1:RecordContent(arg_753_1.text_.text)
			end

			local var_756_8 = math.max(var_756_1, arg_753_1.talkMaxDuration)

			if var_756_0 <= arg_753_1.time_ and arg_753_1.time_ < var_756_0 + var_756_8 then
				arg_753_1.typewritter.percent = (arg_753_1.time_ - var_756_0) / var_756_8

				arg_753_1.typewritter:SetDirty()
			end

			if arg_753_1.time_ >= var_756_0 + var_756_8 and arg_753_1.time_ < var_756_0 + var_756_8 + arg_756_0 then
				arg_753_1.typewritter.percent = 1

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905180 = function(arg_757_0, arg_757_1)
		arg_757_1.time_ = 0
		arg_757_1.frameCnt_ = 0
		arg_757_1.state_ = "playing"
		arg_757_1.curTalkId_ = 1104905180
		arg_757_1.duration_ = 5

		SetActive(arg_757_1.tipsGo_, false)

		function arg_757_1.onSingleLineFinish_()
			arg_757_1.onSingleLineUpdate_ = nil
			arg_757_1.onSingleLineFinish_ = nil
			arg_757_1.state_ = "waiting"
		end

		function arg_757_1.playNext_(arg_759_0)
			if arg_759_0 == 1 then
				arg_757_0:Play1104905181(arg_757_1)
			end
		end

		function arg_757_1.onSingleLineUpdate_(arg_760_0)
			local var_760_0 = 0
			local var_760_1 = 0.65

			if var_760_0 < arg_757_1.time_ and arg_757_1.time_ <= var_760_0 + arg_760_0 then
				arg_757_1.talkMaxDuration = 0
				arg_757_1.dialogCg_.alpha = 1

				arg_757_1.dialog_:SetActive(true)
				SetActive(arg_757_1.leftNameGo_, true)

				local var_760_2 = arg_757_1:FormatText(StoryNameCfg[7].name)

				arg_757_1.leftNameTxt_.text = var_760_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_757_1.leftNameTxt_.transform)

				arg_757_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_757_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_757_1:RecordName(arg_757_1.leftNameTxt_.text)
				SetActive(arg_757_1.iconTrs_.gameObject, false)
				arg_757_1.callingController_:SetSelectedState("normal")

				local var_760_3 = arg_757_1:GetWordFromCfg(1104905180)
				local var_760_4 = arg_757_1:FormatText(var_760_3.content)

				arg_757_1.text_.text = var_760_4

				LuaForUtil.ClearLinePrefixSymbol(arg_757_1.text_)

				local var_760_5 = 26
				local var_760_6 = utf8.len(var_760_4)
				local var_760_7 = var_760_5 <= 0 and var_760_1 or var_760_1 * (var_760_6 / var_760_5)

				if var_760_7 > 0 and var_760_1 < var_760_7 then
					arg_757_1.talkMaxDuration = var_760_7

					if var_760_7 + var_760_0 > arg_757_1.duration_ then
						arg_757_1.duration_ = var_760_7 + var_760_0
					end
				end

				arg_757_1.text_.text = var_760_4
				arg_757_1.typewritter.percent = 0

				arg_757_1.typewritter:SetDirty()
				arg_757_1:ShowNextGo(false)
				arg_757_1:RecordContent(arg_757_1.text_.text)
			end

			local var_760_8 = math.max(var_760_1, arg_757_1.talkMaxDuration)

			if var_760_0 <= arg_757_1.time_ and arg_757_1.time_ < var_760_0 + var_760_8 then
				arg_757_1.typewritter.percent = (arg_757_1.time_ - var_760_0) / var_760_8

				arg_757_1.typewritter:SetDirty()
			end

			if arg_757_1.time_ >= var_760_0 + var_760_8 and arg_757_1.time_ < var_760_0 + var_760_8 + arg_760_0 then
				arg_757_1.typewritter.percent = 1

				arg_757_1.typewritter:SetDirty()
				arg_757_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905181 = function(arg_761_0, arg_761_1)
		arg_761_1.time_ = 0
		arg_761_1.frameCnt_ = 0
		arg_761_1.state_ = "playing"
		arg_761_1.curTalkId_ = 1104905181
		arg_761_1.duration_ = 4.97

		SetActive(arg_761_1.tipsGo_, false)

		function arg_761_1.onSingleLineFinish_()
			arg_761_1.onSingleLineUpdate_ = nil
			arg_761_1.onSingleLineFinish_ = nil
			arg_761_1.state_ = "waiting"
		end

		function arg_761_1.playNext_(arg_763_0)
			if arg_763_0 == 1 then
				arg_761_0:Play1104905182(arg_761_1)
			end
		end

		function arg_761_1.onSingleLineUpdate_(arg_764_0)
			local var_764_0 = arg_761_1.actors_["1049ui_story"].transform
			local var_764_1 = 0

			if var_764_1 < arg_761_1.time_ and arg_761_1.time_ <= var_764_1 + arg_764_0 then
				arg_761_1.var_.moveOldPos1049ui_story = var_764_0.localPosition
			end

			local var_764_2 = 0.001

			if var_764_1 <= arg_761_1.time_ and arg_761_1.time_ < var_764_1 + var_764_2 then
				local var_764_3 = (arg_761_1.time_ - var_764_1) / var_764_2
				local var_764_4 = Vector3.New(0, -1.2, -6)

				var_764_0.localPosition = Vector3.Lerp(arg_761_1.var_.moveOldPos1049ui_story, var_764_4, var_764_3)

				local var_764_5 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_5.x, var_764_5.y, var_764_5.z)

				local var_764_6 = var_764_0.localEulerAngles

				var_764_6.z = 0
				var_764_6.x = 0
				var_764_0.localEulerAngles = var_764_6
			end

			if arg_761_1.time_ >= var_764_1 + var_764_2 and arg_761_1.time_ < var_764_1 + var_764_2 + arg_764_0 then
				var_764_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_764_7 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_7.x, var_764_7.y, var_764_7.z)

				local var_764_8 = var_764_0.localEulerAngles

				var_764_8.z = 0
				var_764_8.x = 0
				var_764_0.localEulerAngles = var_764_8
			end

			local var_764_9 = arg_761_1.actors_["1049ui_story"]
			local var_764_10 = 0

			if var_764_10 < arg_761_1.time_ and arg_761_1.time_ <= var_764_10 + arg_764_0 and not isNil(var_764_9) and arg_761_1.var_.characterEffect1049ui_story == nil then
				arg_761_1.var_.characterEffect1049ui_story = var_764_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_764_11 = 0.200000002980232

			if var_764_10 <= arg_761_1.time_ and arg_761_1.time_ < var_764_10 + var_764_11 and not isNil(var_764_9) then
				local var_764_12 = (arg_761_1.time_ - var_764_10) / var_764_11

				if arg_761_1.var_.characterEffect1049ui_story and not isNil(var_764_9) then
					arg_761_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_761_1.time_ >= var_764_10 + var_764_11 and arg_761_1.time_ < var_764_10 + var_764_11 + arg_764_0 and not isNil(var_764_9) and arg_761_1.var_.characterEffect1049ui_story then
				arg_761_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_764_13 = 0

			if var_764_13 < arg_761_1.time_ and arg_761_1.time_ <= var_764_13 + arg_764_0 then
				arg_761_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_1")
			end

			local var_764_14 = 0

			if var_764_14 < arg_761_1.time_ and arg_761_1.time_ <= var_764_14 + arg_764_0 then
				arg_761_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_764_15 = 0
			local var_764_16 = 0.525

			if var_764_15 < arg_761_1.time_ and arg_761_1.time_ <= var_764_15 + arg_764_0 then
				arg_761_1.talkMaxDuration = 0
				arg_761_1.dialogCg_.alpha = 1

				arg_761_1.dialog_:SetActive(true)
				SetActive(arg_761_1.leftNameGo_, true)

				local var_764_17 = arg_761_1:FormatText(StoryNameCfg[551].name)

				arg_761_1.leftNameTxt_.text = var_764_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_761_1.leftNameTxt_.transform)

				arg_761_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_761_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_761_1:RecordName(arg_761_1.leftNameTxt_.text)
				SetActive(arg_761_1.iconTrs_.gameObject, false)
				arg_761_1.callingController_:SetSelectedState("normal")

				local var_764_18 = arg_761_1:GetWordFromCfg(1104905181)
				local var_764_19 = arg_761_1:FormatText(var_764_18.content)

				arg_761_1.text_.text = var_764_19

				LuaForUtil.ClearLinePrefixSymbol(arg_761_1.text_)

				local var_764_20 = 21
				local var_764_21 = utf8.len(var_764_19)
				local var_764_22 = var_764_20 <= 0 and var_764_16 or var_764_16 * (var_764_21 / var_764_20)

				if var_764_22 > 0 and var_764_16 < var_764_22 then
					arg_761_1.talkMaxDuration = var_764_22

					if var_764_22 + var_764_15 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_22 + var_764_15
					end
				end

				arg_761_1.text_.text = var_764_19
				arg_761_1.typewritter.percent = 0

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905181", "story_v_side_new_1104905.awb") ~= 0 then
					local var_764_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905181", "story_v_side_new_1104905.awb") / 1000

					if var_764_23 + var_764_15 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_23 + var_764_15
					end

					if var_764_18.prefab_name ~= "" and arg_761_1.actors_[var_764_18.prefab_name] ~= nil then
						local var_764_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_761_1.actors_[var_764_18.prefab_name].transform, "story_v_side_new_1104905", "1104905181", "story_v_side_new_1104905.awb")

						arg_761_1:RecordAudio("1104905181", var_764_24)
						arg_761_1:RecordAudio("1104905181", var_764_24)
					else
						arg_761_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905181", "story_v_side_new_1104905.awb")
					end

					arg_761_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905181", "story_v_side_new_1104905.awb")
				end

				arg_761_1:RecordContent(arg_761_1.text_.text)
			end

			local var_764_25 = math.max(var_764_16, arg_761_1.talkMaxDuration)

			if var_764_15 <= arg_761_1.time_ and arg_761_1.time_ < var_764_15 + var_764_25 then
				arg_761_1.typewritter.percent = (arg_761_1.time_ - var_764_15) / var_764_25

				arg_761_1.typewritter:SetDirty()
			end

			if arg_761_1.time_ >= var_764_15 + var_764_25 and arg_761_1.time_ < var_764_15 + var_764_25 + arg_764_0 then
				arg_761_1.typewritter.percent = 1

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905182 = function(arg_765_0, arg_765_1)
		arg_765_1.time_ = 0
		arg_765_1.frameCnt_ = 0
		arg_765_1.state_ = "playing"
		arg_765_1.curTalkId_ = 1104905182
		arg_765_1.duration_ = 5

		SetActive(arg_765_1.tipsGo_, false)

		function arg_765_1.onSingleLineFinish_()
			arg_765_1.onSingleLineUpdate_ = nil
			arg_765_1.onSingleLineFinish_ = nil
			arg_765_1.state_ = "waiting"
		end

		function arg_765_1.playNext_(arg_767_0)
			if arg_767_0 == 1 then
				arg_765_0:Play1104905183(arg_765_1)
			end
		end

		function arg_765_1.onSingleLineUpdate_(arg_768_0)
			local var_768_0 = arg_765_1.actors_["1049ui_story"].transform
			local var_768_1 = 0

			if var_768_1 < arg_765_1.time_ and arg_765_1.time_ <= var_768_1 + arg_768_0 then
				arg_765_1.var_.moveOldPos1049ui_story = var_768_0.localPosition
			end

			local var_768_2 = 0.001

			if var_768_1 <= arg_765_1.time_ and arg_765_1.time_ < var_768_1 + var_768_2 then
				local var_768_3 = (arg_765_1.time_ - var_768_1) / var_768_2
				local var_768_4 = Vector3.New(0, 100, 0)

				var_768_0.localPosition = Vector3.Lerp(arg_765_1.var_.moveOldPos1049ui_story, var_768_4, var_768_3)

				local var_768_5 = manager.ui.mainCamera.transform.position - var_768_0.position

				var_768_0.forward = Vector3.New(var_768_5.x, var_768_5.y, var_768_5.z)

				local var_768_6 = var_768_0.localEulerAngles

				var_768_6.z = 0
				var_768_6.x = 0
				var_768_0.localEulerAngles = var_768_6
			end

			if arg_765_1.time_ >= var_768_1 + var_768_2 and arg_765_1.time_ < var_768_1 + var_768_2 + arg_768_0 then
				var_768_0.localPosition = Vector3.New(0, 100, 0)

				local var_768_7 = manager.ui.mainCamera.transform.position - var_768_0.position

				var_768_0.forward = Vector3.New(var_768_7.x, var_768_7.y, var_768_7.z)

				local var_768_8 = var_768_0.localEulerAngles

				var_768_8.z = 0
				var_768_8.x = 0
				var_768_0.localEulerAngles = var_768_8
			end

			local var_768_9 = arg_765_1.actors_["1049ui_story"]
			local var_768_10 = 0

			if var_768_10 < arg_765_1.time_ and arg_765_1.time_ <= var_768_10 + arg_768_0 and not isNil(var_768_9) and arg_765_1.var_.characterEffect1049ui_story == nil then
				arg_765_1.var_.characterEffect1049ui_story = var_768_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_768_11 = 0.200000002980232

			if var_768_10 <= arg_765_1.time_ and arg_765_1.time_ < var_768_10 + var_768_11 and not isNil(var_768_9) then
				local var_768_12 = (arg_765_1.time_ - var_768_10) / var_768_11

				if arg_765_1.var_.characterEffect1049ui_story and not isNil(var_768_9) then
					local var_768_13 = Mathf.Lerp(0, 0.5, var_768_12)

					arg_765_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_765_1.var_.characterEffect1049ui_story.fillRatio = var_768_13
				end
			end

			if arg_765_1.time_ >= var_768_10 + var_768_11 and arg_765_1.time_ < var_768_10 + var_768_11 + arg_768_0 and not isNil(var_768_9) and arg_765_1.var_.characterEffect1049ui_story then
				local var_768_14 = 0.5

				arg_765_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_765_1.var_.characterEffect1049ui_story.fillRatio = var_768_14
			end

			local var_768_15 = 0
			local var_768_16 = 1.375

			if var_768_15 < arg_765_1.time_ and arg_765_1.time_ <= var_768_15 + arg_768_0 then
				arg_765_1.talkMaxDuration = 0
				arg_765_1.dialogCg_.alpha = 1

				arg_765_1.dialog_:SetActive(true)
				SetActive(arg_765_1.leftNameGo_, false)

				arg_765_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_765_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_765_1:RecordName(arg_765_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_765_1.iconTrs_.gameObject, false)
				arg_765_1.callingController_:SetSelectedState("normal")

				local var_768_17 = arg_765_1:GetWordFromCfg(1104905182)
				local var_768_18 = arg_765_1:FormatText(var_768_17.content)

				arg_765_1.text_.text = var_768_18

				LuaForUtil.ClearLinePrefixSymbol(arg_765_1.text_)

				local var_768_19 = 55
				local var_768_20 = utf8.len(var_768_18)
				local var_768_21 = var_768_19 <= 0 and var_768_16 or var_768_16 * (var_768_20 / var_768_19)

				if var_768_21 > 0 and var_768_16 < var_768_21 then
					arg_765_1.talkMaxDuration = var_768_21

					if var_768_21 + var_768_15 > arg_765_1.duration_ then
						arg_765_1.duration_ = var_768_21 + var_768_15
					end
				end

				arg_765_1.text_.text = var_768_18
				arg_765_1.typewritter.percent = 0

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(false)
				arg_765_1:RecordContent(arg_765_1.text_.text)
			end

			local var_768_22 = math.max(var_768_16, arg_765_1.talkMaxDuration)

			if var_768_15 <= arg_765_1.time_ and arg_765_1.time_ < var_768_15 + var_768_22 then
				arg_765_1.typewritter.percent = (arg_765_1.time_ - var_768_15) / var_768_22

				arg_765_1.typewritter:SetDirty()
			end

			if arg_765_1.time_ >= var_768_15 + var_768_22 and arg_765_1.time_ < var_768_15 + var_768_22 + arg_768_0 then
				arg_765_1.typewritter.percent = 1

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905183 = function(arg_769_0, arg_769_1)
		arg_769_1.time_ = 0
		arg_769_1.frameCnt_ = 0
		arg_769_1.state_ = "playing"
		arg_769_1.curTalkId_ = 1104905183
		arg_769_1.duration_ = 5

		SetActive(arg_769_1.tipsGo_, false)

		function arg_769_1.onSingleLineFinish_()
			arg_769_1.onSingleLineUpdate_ = nil
			arg_769_1.onSingleLineFinish_ = nil
			arg_769_1.state_ = "waiting"
		end

		function arg_769_1.playNext_(arg_771_0)
			if arg_771_0 == 1 then
				arg_769_0:Play1104905184(arg_769_1)
			end
		end

		function arg_769_1.onSingleLineUpdate_(arg_772_0)
			local var_772_0 = 0
			local var_772_1 = 0.525

			if var_772_0 < arg_769_1.time_ and arg_769_1.time_ <= var_772_0 + arg_772_0 then
				arg_769_1.talkMaxDuration = 0
				arg_769_1.dialogCg_.alpha = 1

				arg_769_1.dialog_:SetActive(true)
				SetActive(arg_769_1.leftNameGo_, true)

				local var_772_2 = arg_769_1:FormatText(StoryNameCfg[7].name)

				arg_769_1.leftNameTxt_.text = var_772_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_769_1.leftNameTxt_.transform)

				arg_769_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_769_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_769_1:RecordName(arg_769_1.leftNameTxt_.text)
				SetActive(arg_769_1.iconTrs_.gameObject, false)
				arg_769_1.callingController_:SetSelectedState("normal")

				local var_772_3 = arg_769_1:GetWordFromCfg(1104905183)
				local var_772_4 = arg_769_1:FormatText(var_772_3.content)

				arg_769_1.text_.text = var_772_4

				LuaForUtil.ClearLinePrefixSymbol(arg_769_1.text_)

				local var_772_5 = 21
				local var_772_6 = utf8.len(var_772_4)
				local var_772_7 = var_772_5 <= 0 and var_772_1 or var_772_1 * (var_772_6 / var_772_5)

				if var_772_7 > 0 and var_772_1 < var_772_7 then
					arg_769_1.talkMaxDuration = var_772_7

					if var_772_7 + var_772_0 > arg_769_1.duration_ then
						arg_769_1.duration_ = var_772_7 + var_772_0
					end
				end

				arg_769_1.text_.text = var_772_4
				arg_769_1.typewritter.percent = 0

				arg_769_1.typewritter:SetDirty()
				arg_769_1:ShowNextGo(false)
				arg_769_1:RecordContent(arg_769_1.text_.text)
			end

			local var_772_8 = math.max(var_772_1, arg_769_1.talkMaxDuration)

			if var_772_0 <= arg_769_1.time_ and arg_769_1.time_ < var_772_0 + var_772_8 then
				arg_769_1.typewritter.percent = (arg_769_1.time_ - var_772_0) / var_772_8

				arg_769_1.typewritter:SetDirty()
			end

			if arg_769_1.time_ >= var_772_0 + var_772_8 and arg_769_1.time_ < var_772_0 + var_772_8 + arg_772_0 then
				arg_769_1.typewritter.percent = 1

				arg_769_1.typewritter:SetDirty()
				arg_769_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905184 = function(arg_773_0, arg_773_1)
		arg_773_1.time_ = 0
		arg_773_1.frameCnt_ = 0
		arg_773_1.state_ = "playing"
		arg_773_1.curTalkId_ = 1104905184
		arg_773_1.duration_ = 5

		SetActive(arg_773_1.tipsGo_, false)

		function arg_773_1.onSingleLineFinish_()
			arg_773_1.onSingleLineUpdate_ = nil
			arg_773_1.onSingleLineFinish_ = nil
			arg_773_1.state_ = "waiting"
		end

		function arg_773_1.playNext_(arg_775_0)
			if arg_775_0 == 1 then
				arg_773_0:Play1104905185(arg_773_1)
			end
		end

		function arg_773_1.onSingleLineUpdate_(arg_776_0)
			local var_776_0 = 0
			local var_776_1 = 1.525

			if var_776_0 < arg_773_1.time_ and arg_773_1.time_ <= var_776_0 + arg_776_0 then
				arg_773_1.talkMaxDuration = 0
				arg_773_1.dialogCg_.alpha = 1

				arg_773_1.dialog_:SetActive(true)
				SetActive(arg_773_1.leftNameGo_, true)

				local var_776_2 = arg_773_1:FormatText(StoryNameCfg[7].name)

				arg_773_1.leftNameTxt_.text = var_776_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_773_1.leftNameTxt_.transform)

				arg_773_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_773_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_773_1:RecordName(arg_773_1.leftNameTxt_.text)
				SetActive(arg_773_1.iconTrs_.gameObject, false)
				arg_773_1.callingController_:SetSelectedState("normal")

				local var_776_3 = arg_773_1:GetWordFromCfg(1104905184)
				local var_776_4 = arg_773_1:FormatText(var_776_3.content)

				arg_773_1.text_.text = var_776_4

				LuaForUtil.ClearLinePrefixSymbol(arg_773_1.text_)

				local var_776_5 = 61
				local var_776_6 = utf8.len(var_776_4)
				local var_776_7 = var_776_5 <= 0 and var_776_1 or var_776_1 * (var_776_6 / var_776_5)

				if var_776_7 > 0 and var_776_1 < var_776_7 then
					arg_773_1.talkMaxDuration = var_776_7

					if var_776_7 + var_776_0 > arg_773_1.duration_ then
						arg_773_1.duration_ = var_776_7 + var_776_0
					end
				end

				arg_773_1.text_.text = var_776_4
				arg_773_1.typewritter.percent = 0

				arg_773_1.typewritter:SetDirty()
				arg_773_1:ShowNextGo(false)
				arg_773_1:RecordContent(arg_773_1.text_.text)
			end

			local var_776_8 = math.max(var_776_1, arg_773_1.talkMaxDuration)

			if var_776_0 <= arg_773_1.time_ and arg_773_1.time_ < var_776_0 + var_776_8 then
				arg_773_1.typewritter.percent = (arg_773_1.time_ - var_776_0) / var_776_8

				arg_773_1.typewritter:SetDirty()
			end

			if arg_773_1.time_ >= var_776_0 + var_776_8 and arg_773_1.time_ < var_776_0 + var_776_8 + arg_776_0 then
				arg_773_1.typewritter.percent = 1

				arg_773_1.typewritter:SetDirty()
				arg_773_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905185 = function(arg_777_0, arg_777_1)
		arg_777_1.time_ = 0
		arg_777_1.frameCnt_ = 0
		arg_777_1.state_ = "playing"
		arg_777_1.curTalkId_ = 1104905185
		arg_777_1.duration_ = 5.83

		SetActive(arg_777_1.tipsGo_, false)

		function arg_777_1.onSingleLineFinish_()
			arg_777_1.onSingleLineUpdate_ = nil
			arg_777_1.onSingleLineFinish_ = nil
			arg_777_1.state_ = "waiting"
		end

		function arg_777_1.playNext_(arg_779_0)
			if arg_779_0 == 1 then
				arg_777_0:Play1104905186(arg_777_1)
			end
		end

		function arg_777_1.onSingleLineUpdate_(arg_780_0)
			local var_780_0 = arg_777_1.actors_["1049ui_story"].transform
			local var_780_1 = 0

			if var_780_1 < arg_777_1.time_ and arg_777_1.time_ <= var_780_1 + arg_780_0 then
				arg_777_1.var_.moveOldPos1049ui_story = var_780_0.localPosition
			end

			local var_780_2 = 0.001

			if var_780_1 <= arg_777_1.time_ and arg_777_1.time_ < var_780_1 + var_780_2 then
				local var_780_3 = (arg_777_1.time_ - var_780_1) / var_780_2
				local var_780_4 = Vector3.New(0, -1.2, -6)

				var_780_0.localPosition = Vector3.Lerp(arg_777_1.var_.moveOldPos1049ui_story, var_780_4, var_780_3)

				local var_780_5 = manager.ui.mainCamera.transform.position - var_780_0.position

				var_780_0.forward = Vector3.New(var_780_5.x, var_780_5.y, var_780_5.z)

				local var_780_6 = var_780_0.localEulerAngles

				var_780_6.z = 0
				var_780_6.x = 0
				var_780_0.localEulerAngles = var_780_6
			end

			if arg_777_1.time_ >= var_780_1 + var_780_2 and arg_777_1.time_ < var_780_1 + var_780_2 + arg_780_0 then
				var_780_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_780_7 = manager.ui.mainCamera.transform.position - var_780_0.position

				var_780_0.forward = Vector3.New(var_780_7.x, var_780_7.y, var_780_7.z)

				local var_780_8 = var_780_0.localEulerAngles

				var_780_8.z = 0
				var_780_8.x = 0
				var_780_0.localEulerAngles = var_780_8
			end

			local var_780_9 = arg_777_1.actors_["1049ui_story"]
			local var_780_10 = 0

			if var_780_10 < arg_777_1.time_ and arg_777_1.time_ <= var_780_10 + arg_780_0 and not isNil(var_780_9) and arg_777_1.var_.characterEffect1049ui_story == nil then
				arg_777_1.var_.characterEffect1049ui_story = var_780_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_780_11 = 0.200000002980232

			if var_780_10 <= arg_777_1.time_ and arg_777_1.time_ < var_780_10 + var_780_11 and not isNil(var_780_9) then
				local var_780_12 = (arg_777_1.time_ - var_780_10) / var_780_11

				if arg_777_1.var_.characterEffect1049ui_story and not isNil(var_780_9) then
					arg_777_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_777_1.time_ >= var_780_10 + var_780_11 and arg_777_1.time_ < var_780_10 + var_780_11 + arg_780_0 and not isNil(var_780_9) and arg_777_1.var_.characterEffect1049ui_story then
				arg_777_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_780_13 = 0

			if var_780_13 < arg_777_1.time_ and arg_777_1.time_ <= var_780_13 + arg_780_0 then
				arg_777_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action6_2")
			end

			local var_780_14 = 0

			if var_780_14 < arg_777_1.time_ and arg_777_1.time_ <= var_780_14 + arg_780_0 then
				arg_777_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_780_15 = 0
			local var_780_16 = 0.475

			if var_780_15 < arg_777_1.time_ and arg_777_1.time_ <= var_780_15 + arg_780_0 then
				arg_777_1.talkMaxDuration = 0
				arg_777_1.dialogCg_.alpha = 1

				arg_777_1.dialog_:SetActive(true)
				SetActive(arg_777_1.leftNameGo_, true)

				local var_780_17 = arg_777_1:FormatText(StoryNameCfg[551].name)

				arg_777_1.leftNameTxt_.text = var_780_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_777_1.leftNameTxt_.transform)

				arg_777_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_777_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_777_1:RecordName(arg_777_1.leftNameTxt_.text)
				SetActive(arg_777_1.iconTrs_.gameObject, false)
				arg_777_1.callingController_:SetSelectedState("normal")

				local var_780_18 = arg_777_1:GetWordFromCfg(1104905185)
				local var_780_19 = arg_777_1:FormatText(var_780_18.content)

				arg_777_1.text_.text = var_780_19

				LuaForUtil.ClearLinePrefixSymbol(arg_777_1.text_)

				local var_780_20 = 19
				local var_780_21 = utf8.len(var_780_19)
				local var_780_22 = var_780_20 <= 0 and var_780_16 or var_780_16 * (var_780_21 / var_780_20)

				if var_780_22 > 0 and var_780_16 < var_780_22 then
					arg_777_1.talkMaxDuration = var_780_22

					if var_780_22 + var_780_15 > arg_777_1.duration_ then
						arg_777_1.duration_ = var_780_22 + var_780_15
					end
				end

				arg_777_1.text_.text = var_780_19
				arg_777_1.typewritter.percent = 0

				arg_777_1.typewritter:SetDirty()
				arg_777_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905185", "story_v_side_new_1104905.awb") ~= 0 then
					local var_780_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905185", "story_v_side_new_1104905.awb") / 1000

					if var_780_23 + var_780_15 > arg_777_1.duration_ then
						arg_777_1.duration_ = var_780_23 + var_780_15
					end

					if var_780_18.prefab_name ~= "" and arg_777_1.actors_[var_780_18.prefab_name] ~= nil then
						local var_780_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_777_1.actors_[var_780_18.prefab_name].transform, "story_v_side_new_1104905", "1104905185", "story_v_side_new_1104905.awb")

						arg_777_1:RecordAudio("1104905185", var_780_24)
						arg_777_1:RecordAudio("1104905185", var_780_24)
					else
						arg_777_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905185", "story_v_side_new_1104905.awb")
					end

					arg_777_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905185", "story_v_side_new_1104905.awb")
				end

				arg_777_1:RecordContent(arg_777_1.text_.text)
			end

			local var_780_25 = math.max(var_780_16, arg_777_1.talkMaxDuration)

			if var_780_15 <= arg_777_1.time_ and arg_777_1.time_ < var_780_15 + var_780_25 then
				arg_777_1.typewritter.percent = (arg_777_1.time_ - var_780_15) / var_780_25

				arg_777_1.typewritter:SetDirty()
			end

			if arg_777_1.time_ >= var_780_15 + var_780_25 and arg_777_1.time_ < var_780_15 + var_780_25 + arg_780_0 then
				arg_777_1.typewritter.percent = 1

				arg_777_1.typewritter:SetDirty()
				arg_777_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905186 = function(arg_781_0, arg_781_1)
		arg_781_1.time_ = 0
		arg_781_1.frameCnt_ = 0
		arg_781_1.state_ = "playing"
		arg_781_1.curTalkId_ = 1104905186
		arg_781_1.duration_ = 5

		SetActive(arg_781_1.tipsGo_, false)

		function arg_781_1.onSingleLineFinish_()
			arg_781_1.onSingleLineUpdate_ = nil
			arg_781_1.onSingleLineFinish_ = nil
			arg_781_1.state_ = "waiting"
		end

		function arg_781_1.playNext_(arg_783_0)
			if arg_783_0 == 1 then
				arg_781_0:Play1104905187(arg_781_1)
			end
		end

		function arg_781_1.onSingleLineUpdate_(arg_784_0)
			local var_784_0 = arg_781_1.actors_["1049ui_story"].transform
			local var_784_1 = 0

			if var_784_1 < arg_781_1.time_ and arg_781_1.time_ <= var_784_1 + arg_784_0 then
				arg_781_1.var_.moveOldPos1049ui_story = var_784_0.localPosition
			end

			local var_784_2 = 0.001

			if var_784_1 <= arg_781_1.time_ and arg_781_1.time_ < var_784_1 + var_784_2 then
				local var_784_3 = (arg_781_1.time_ - var_784_1) / var_784_2
				local var_784_4 = Vector3.New(0, 100, 0)

				var_784_0.localPosition = Vector3.Lerp(arg_781_1.var_.moveOldPos1049ui_story, var_784_4, var_784_3)

				local var_784_5 = manager.ui.mainCamera.transform.position - var_784_0.position

				var_784_0.forward = Vector3.New(var_784_5.x, var_784_5.y, var_784_5.z)

				local var_784_6 = var_784_0.localEulerAngles

				var_784_6.z = 0
				var_784_6.x = 0
				var_784_0.localEulerAngles = var_784_6
			end

			if arg_781_1.time_ >= var_784_1 + var_784_2 and arg_781_1.time_ < var_784_1 + var_784_2 + arg_784_0 then
				var_784_0.localPosition = Vector3.New(0, 100, 0)

				local var_784_7 = manager.ui.mainCamera.transform.position - var_784_0.position

				var_784_0.forward = Vector3.New(var_784_7.x, var_784_7.y, var_784_7.z)

				local var_784_8 = var_784_0.localEulerAngles

				var_784_8.z = 0
				var_784_8.x = 0
				var_784_0.localEulerAngles = var_784_8
			end

			local var_784_9 = arg_781_1.actors_["1049ui_story"]
			local var_784_10 = 0

			if var_784_10 < arg_781_1.time_ and arg_781_1.time_ <= var_784_10 + arg_784_0 and not isNil(var_784_9) and arg_781_1.var_.characterEffect1049ui_story == nil then
				arg_781_1.var_.characterEffect1049ui_story = var_784_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_784_11 = 0.200000002980232

			if var_784_10 <= arg_781_1.time_ and arg_781_1.time_ < var_784_10 + var_784_11 and not isNil(var_784_9) then
				local var_784_12 = (arg_781_1.time_ - var_784_10) / var_784_11

				if arg_781_1.var_.characterEffect1049ui_story and not isNil(var_784_9) then
					local var_784_13 = Mathf.Lerp(0, 0.5, var_784_12)

					arg_781_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_781_1.var_.characterEffect1049ui_story.fillRatio = var_784_13
				end
			end

			if arg_781_1.time_ >= var_784_10 + var_784_11 and arg_781_1.time_ < var_784_10 + var_784_11 + arg_784_0 and not isNil(var_784_9) and arg_781_1.var_.characterEffect1049ui_story then
				local var_784_14 = 0.5

				arg_781_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_781_1.var_.characterEffect1049ui_story.fillRatio = var_784_14
			end

			local var_784_15 = 0
			local var_784_16 = 1.75

			if var_784_15 < arg_781_1.time_ and arg_781_1.time_ <= var_784_15 + arg_784_0 then
				arg_781_1.talkMaxDuration = 0
				arg_781_1.dialogCg_.alpha = 1

				arg_781_1.dialog_:SetActive(true)
				SetActive(arg_781_1.leftNameGo_, false)

				arg_781_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_781_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_781_1:RecordName(arg_781_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_781_1.iconTrs_.gameObject, false)
				arg_781_1.callingController_:SetSelectedState("normal")

				local var_784_17 = arg_781_1:GetWordFromCfg(1104905186)
				local var_784_18 = arg_781_1:FormatText(var_784_17.content)

				arg_781_1.text_.text = var_784_18

				LuaForUtil.ClearLinePrefixSymbol(arg_781_1.text_)

				local var_784_19 = 70
				local var_784_20 = utf8.len(var_784_18)
				local var_784_21 = var_784_19 <= 0 and var_784_16 or var_784_16 * (var_784_20 / var_784_19)

				if var_784_21 > 0 and var_784_16 < var_784_21 then
					arg_781_1.talkMaxDuration = var_784_21

					if var_784_21 + var_784_15 > arg_781_1.duration_ then
						arg_781_1.duration_ = var_784_21 + var_784_15
					end
				end

				arg_781_1.text_.text = var_784_18
				arg_781_1.typewritter.percent = 0

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(false)
				arg_781_1:RecordContent(arg_781_1.text_.text)
			end

			local var_784_22 = math.max(var_784_16, arg_781_1.talkMaxDuration)

			if var_784_15 <= arg_781_1.time_ and arg_781_1.time_ < var_784_15 + var_784_22 then
				arg_781_1.typewritter.percent = (arg_781_1.time_ - var_784_15) / var_784_22

				arg_781_1.typewritter:SetDirty()
			end

			if arg_781_1.time_ >= var_784_15 + var_784_22 and arg_781_1.time_ < var_784_15 + var_784_22 + arg_784_0 then
				arg_781_1.typewritter.percent = 1

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905187 = function(arg_785_0, arg_785_1)
		arg_785_1.time_ = 0
		arg_785_1.frameCnt_ = 0
		arg_785_1.state_ = "playing"
		arg_785_1.curTalkId_ = 1104905187
		arg_785_1.duration_ = 15.7

		SetActive(arg_785_1.tipsGo_, false)

		function arg_785_1.onSingleLineFinish_()
			arg_785_1.onSingleLineUpdate_ = nil
			arg_785_1.onSingleLineFinish_ = nil
			arg_785_1.state_ = "waiting"
		end

		function arg_785_1.playNext_(arg_787_0)
			if arg_787_0 == 1 then
				arg_785_0:Play1104905188(arg_785_1)
			end
		end

		function arg_785_1.onSingleLineUpdate_(arg_788_0)
			local var_788_0 = arg_785_1.actors_["1049ui_story"].transform
			local var_788_1 = 0

			if var_788_1 < arg_785_1.time_ and arg_785_1.time_ <= var_788_1 + arg_788_0 then
				arg_785_1.var_.moveOldPos1049ui_story = var_788_0.localPosition
			end

			local var_788_2 = 0.001

			if var_788_1 <= arg_785_1.time_ and arg_785_1.time_ < var_788_1 + var_788_2 then
				local var_788_3 = (arg_785_1.time_ - var_788_1) / var_788_2
				local var_788_4 = Vector3.New(0, -1.2, -6)

				var_788_0.localPosition = Vector3.Lerp(arg_785_1.var_.moveOldPos1049ui_story, var_788_4, var_788_3)

				local var_788_5 = manager.ui.mainCamera.transform.position - var_788_0.position

				var_788_0.forward = Vector3.New(var_788_5.x, var_788_5.y, var_788_5.z)

				local var_788_6 = var_788_0.localEulerAngles

				var_788_6.z = 0
				var_788_6.x = 0
				var_788_0.localEulerAngles = var_788_6
			end

			if arg_785_1.time_ >= var_788_1 + var_788_2 and arg_785_1.time_ < var_788_1 + var_788_2 + arg_788_0 then
				var_788_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_788_7 = manager.ui.mainCamera.transform.position - var_788_0.position

				var_788_0.forward = Vector3.New(var_788_7.x, var_788_7.y, var_788_7.z)

				local var_788_8 = var_788_0.localEulerAngles

				var_788_8.z = 0
				var_788_8.x = 0
				var_788_0.localEulerAngles = var_788_8
			end

			local var_788_9 = arg_785_1.actors_["1049ui_story"]
			local var_788_10 = 0

			if var_788_10 < arg_785_1.time_ and arg_785_1.time_ <= var_788_10 + arg_788_0 and not isNil(var_788_9) and arg_785_1.var_.characterEffect1049ui_story == nil then
				arg_785_1.var_.characterEffect1049ui_story = var_788_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_788_11 = 0.200000002980232

			if var_788_10 <= arg_785_1.time_ and arg_785_1.time_ < var_788_10 + var_788_11 and not isNil(var_788_9) then
				local var_788_12 = (arg_785_1.time_ - var_788_10) / var_788_11

				if arg_785_1.var_.characterEffect1049ui_story and not isNil(var_788_9) then
					arg_785_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_785_1.time_ >= var_788_10 + var_788_11 and arg_785_1.time_ < var_788_10 + var_788_11 + arg_788_0 and not isNil(var_788_9) and arg_785_1.var_.characterEffect1049ui_story then
				arg_785_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_788_13 = 0

			if var_788_13 < arg_785_1.time_ and arg_785_1.time_ <= var_788_13 + arg_788_0 then
				arg_785_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_788_14 = 0

			if var_788_14 < arg_785_1.time_ and arg_785_1.time_ <= var_788_14 + arg_788_0 then
				arg_785_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_788_15 = 0
			local var_788_16 = 1.325

			if var_788_15 < arg_785_1.time_ and arg_785_1.time_ <= var_788_15 + arg_788_0 then
				arg_785_1.talkMaxDuration = 0
				arg_785_1.dialogCg_.alpha = 1

				arg_785_1.dialog_:SetActive(true)
				SetActive(arg_785_1.leftNameGo_, true)

				local var_788_17 = arg_785_1:FormatText(StoryNameCfg[551].name)

				arg_785_1.leftNameTxt_.text = var_788_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_785_1.leftNameTxt_.transform)

				arg_785_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_785_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_785_1:RecordName(arg_785_1.leftNameTxt_.text)
				SetActive(arg_785_1.iconTrs_.gameObject, false)
				arg_785_1.callingController_:SetSelectedState("normal")

				local var_788_18 = arg_785_1:GetWordFromCfg(1104905187)
				local var_788_19 = arg_785_1:FormatText(var_788_18.content)

				arg_785_1.text_.text = var_788_19

				LuaForUtil.ClearLinePrefixSymbol(arg_785_1.text_)

				local var_788_20 = 50
				local var_788_21 = utf8.len(var_788_19)
				local var_788_22 = var_788_20 <= 0 and var_788_16 or var_788_16 * (var_788_21 / var_788_20)

				if var_788_22 > 0 and var_788_16 < var_788_22 then
					arg_785_1.talkMaxDuration = var_788_22

					if var_788_22 + var_788_15 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_22 + var_788_15
					end
				end

				arg_785_1.text_.text = var_788_19
				arg_785_1.typewritter.percent = 0

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905187", "story_v_side_new_1104905.awb") ~= 0 then
					local var_788_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905187", "story_v_side_new_1104905.awb") / 1000

					if var_788_23 + var_788_15 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_23 + var_788_15
					end

					if var_788_18.prefab_name ~= "" and arg_785_1.actors_[var_788_18.prefab_name] ~= nil then
						local var_788_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_785_1.actors_[var_788_18.prefab_name].transform, "story_v_side_new_1104905", "1104905187", "story_v_side_new_1104905.awb")

						arg_785_1:RecordAudio("1104905187", var_788_24)
						arg_785_1:RecordAudio("1104905187", var_788_24)
					else
						arg_785_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905187", "story_v_side_new_1104905.awb")
					end

					arg_785_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905187", "story_v_side_new_1104905.awb")
				end

				arg_785_1:RecordContent(arg_785_1.text_.text)
			end

			local var_788_25 = math.max(var_788_16, arg_785_1.talkMaxDuration)

			if var_788_15 <= arg_785_1.time_ and arg_785_1.time_ < var_788_15 + var_788_25 then
				arg_785_1.typewritter.percent = (arg_785_1.time_ - var_788_15) / var_788_25

				arg_785_1.typewritter:SetDirty()
			end

			if arg_785_1.time_ >= var_788_15 + var_788_25 and arg_785_1.time_ < var_788_15 + var_788_25 + arg_788_0 then
				arg_785_1.typewritter.percent = 1

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905188 = function(arg_789_0, arg_789_1)
		arg_789_1.time_ = 0
		arg_789_1.frameCnt_ = 0
		arg_789_1.state_ = "playing"
		arg_789_1.curTalkId_ = 1104905188
		arg_789_1.duration_ = 12.37

		SetActive(arg_789_1.tipsGo_, false)

		function arg_789_1.onSingleLineFinish_()
			arg_789_1.onSingleLineUpdate_ = nil
			arg_789_1.onSingleLineFinish_ = nil
			arg_789_1.state_ = "waiting"
		end

		function arg_789_1.playNext_(arg_791_0)
			if arg_791_0 == 1 then
				arg_789_0:Play1104905189(arg_789_1)
			end
		end

		function arg_789_1.onSingleLineUpdate_(arg_792_0)
			local var_792_0 = 0
			local var_792_1 = 1.075

			if var_792_0 < arg_789_1.time_ and arg_789_1.time_ <= var_792_0 + arg_792_0 then
				arg_789_1.talkMaxDuration = 0
				arg_789_1.dialogCg_.alpha = 1

				arg_789_1.dialog_:SetActive(true)
				SetActive(arg_789_1.leftNameGo_, true)

				local var_792_2 = arg_789_1:FormatText(StoryNameCfg[551].name)

				arg_789_1.leftNameTxt_.text = var_792_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_789_1.leftNameTxt_.transform)

				arg_789_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_789_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_789_1:RecordName(arg_789_1.leftNameTxt_.text)
				SetActive(arg_789_1.iconTrs_.gameObject, false)
				arg_789_1.callingController_:SetSelectedState("normal")

				local var_792_3 = arg_789_1:GetWordFromCfg(1104905188)
				local var_792_4 = arg_789_1:FormatText(var_792_3.content)

				arg_789_1.text_.text = var_792_4

				LuaForUtil.ClearLinePrefixSymbol(arg_789_1.text_)

				local var_792_5 = 43
				local var_792_6 = utf8.len(var_792_4)
				local var_792_7 = var_792_5 <= 0 and var_792_1 or var_792_1 * (var_792_6 / var_792_5)

				if var_792_7 > 0 and var_792_1 < var_792_7 then
					arg_789_1.talkMaxDuration = var_792_7

					if var_792_7 + var_792_0 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_7 + var_792_0
					end
				end

				arg_789_1.text_.text = var_792_4
				arg_789_1.typewritter.percent = 0

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905188", "story_v_side_new_1104905.awb") ~= 0 then
					local var_792_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905188", "story_v_side_new_1104905.awb") / 1000

					if var_792_8 + var_792_0 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_8 + var_792_0
					end

					if var_792_3.prefab_name ~= "" and arg_789_1.actors_[var_792_3.prefab_name] ~= nil then
						local var_792_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_789_1.actors_[var_792_3.prefab_name].transform, "story_v_side_new_1104905", "1104905188", "story_v_side_new_1104905.awb")

						arg_789_1:RecordAudio("1104905188", var_792_9)
						arg_789_1:RecordAudio("1104905188", var_792_9)
					else
						arg_789_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905188", "story_v_side_new_1104905.awb")
					end

					arg_789_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905188", "story_v_side_new_1104905.awb")
				end

				arg_789_1:RecordContent(arg_789_1.text_.text)
			end

			local var_792_10 = math.max(var_792_1, arg_789_1.talkMaxDuration)

			if var_792_0 <= arg_789_1.time_ and arg_789_1.time_ < var_792_0 + var_792_10 then
				arg_789_1.typewritter.percent = (arg_789_1.time_ - var_792_0) / var_792_10

				arg_789_1.typewritter:SetDirty()
			end

			if arg_789_1.time_ >= var_792_0 + var_792_10 and arg_789_1.time_ < var_792_0 + var_792_10 + arg_792_0 then
				arg_789_1.typewritter.percent = 1

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905189 = function(arg_793_0, arg_793_1)
		arg_793_1.time_ = 0
		arg_793_1.frameCnt_ = 0
		arg_793_1.state_ = "playing"
		arg_793_1.curTalkId_ = 1104905189
		arg_793_1.duration_ = 8.57

		SetActive(arg_793_1.tipsGo_, false)

		function arg_793_1.onSingleLineFinish_()
			arg_793_1.onSingleLineUpdate_ = nil
			arg_793_1.onSingleLineFinish_ = nil
			arg_793_1.state_ = "waiting"
		end

		function arg_793_1.playNext_(arg_795_0)
			if arg_795_0 == 1 then
				arg_793_0:Play1104905190(arg_793_1)
			end
		end

		function arg_793_1.onSingleLineUpdate_(arg_796_0)
			local var_796_0 = 0

			if var_796_0 < arg_793_1.time_ and arg_793_1.time_ <= var_796_0 + arg_796_0 then
				arg_793_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_796_1 = 0

			if var_796_1 < arg_793_1.time_ and arg_793_1.time_ <= var_796_1 + arg_796_0 then
				arg_793_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_796_2 = 0
			local var_796_3 = 0.75

			if var_796_2 < arg_793_1.time_ and arg_793_1.time_ <= var_796_2 + arg_796_0 then
				arg_793_1.talkMaxDuration = 0
				arg_793_1.dialogCg_.alpha = 1

				arg_793_1.dialog_:SetActive(true)
				SetActive(arg_793_1.leftNameGo_, true)

				local var_796_4 = arg_793_1:FormatText(StoryNameCfg[551].name)

				arg_793_1.leftNameTxt_.text = var_796_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_793_1.leftNameTxt_.transform)

				arg_793_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_793_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_793_1:RecordName(arg_793_1.leftNameTxt_.text)
				SetActive(arg_793_1.iconTrs_.gameObject, false)
				arg_793_1.callingController_:SetSelectedState("normal")

				local var_796_5 = arg_793_1:GetWordFromCfg(1104905189)
				local var_796_6 = arg_793_1:FormatText(var_796_5.content)

				arg_793_1.text_.text = var_796_6

				LuaForUtil.ClearLinePrefixSymbol(arg_793_1.text_)

				local var_796_7 = 30
				local var_796_8 = utf8.len(var_796_6)
				local var_796_9 = var_796_7 <= 0 and var_796_3 or var_796_3 * (var_796_8 / var_796_7)

				if var_796_9 > 0 and var_796_3 < var_796_9 then
					arg_793_1.talkMaxDuration = var_796_9

					if var_796_9 + var_796_2 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_9 + var_796_2
					end
				end

				arg_793_1.text_.text = var_796_6
				arg_793_1.typewritter.percent = 0

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905189", "story_v_side_new_1104905.awb") ~= 0 then
					local var_796_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905189", "story_v_side_new_1104905.awb") / 1000

					if var_796_10 + var_796_2 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_10 + var_796_2
					end

					if var_796_5.prefab_name ~= "" and arg_793_1.actors_[var_796_5.prefab_name] ~= nil then
						local var_796_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_793_1.actors_[var_796_5.prefab_name].transform, "story_v_side_new_1104905", "1104905189", "story_v_side_new_1104905.awb")

						arg_793_1:RecordAudio("1104905189", var_796_11)
						arg_793_1:RecordAudio("1104905189", var_796_11)
					else
						arg_793_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905189", "story_v_side_new_1104905.awb")
					end

					arg_793_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905189", "story_v_side_new_1104905.awb")
				end

				arg_793_1:RecordContent(arg_793_1.text_.text)
			end

			local var_796_12 = math.max(var_796_3, arg_793_1.talkMaxDuration)

			if var_796_2 <= arg_793_1.time_ and arg_793_1.time_ < var_796_2 + var_796_12 then
				arg_793_1.typewritter.percent = (arg_793_1.time_ - var_796_2) / var_796_12

				arg_793_1.typewritter:SetDirty()
			end

			if arg_793_1.time_ >= var_796_2 + var_796_12 and arg_793_1.time_ < var_796_2 + var_796_12 + arg_796_0 then
				arg_793_1.typewritter.percent = 1

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905190 = function(arg_797_0, arg_797_1)
		arg_797_1.time_ = 0
		arg_797_1.frameCnt_ = 0
		arg_797_1.state_ = "playing"
		arg_797_1.curTalkId_ = 1104905190
		arg_797_1.duration_ = 5

		SetActive(arg_797_1.tipsGo_, false)

		function arg_797_1.onSingleLineFinish_()
			arg_797_1.onSingleLineUpdate_ = nil
			arg_797_1.onSingleLineFinish_ = nil
			arg_797_1.state_ = "waiting"
		end

		function arg_797_1.playNext_(arg_799_0)
			if arg_799_0 == 1 then
				arg_797_0:Play1104905191(arg_797_1)
			end
		end

		function arg_797_1.onSingleLineUpdate_(arg_800_0)
			local var_800_0 = arg_797_1.actors_["1049ui_story"]
			local var_800_1 = 0

			if var_800_1 < arg_797_1.time_ and arg_797_1.time_ <= var_800_1 + arg_800_0 and not isNil(var_800_0) and arg_797_1.var_.characterEffect1049ui_story == nil then
				arg_797_1.var_.characterEffect1049ui_story = var_800_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_800_2 = 0.200000002980232

			if var_800_1 <= arg_797_1.time_ and arg_797_1.time_ < var_800_1 + var_800_2 and not isNil(var_800_0) then
				local var_800_3 = (arg_797_1.time_ - var_800_1) / var_800_2

				if arg_797_1.var_.characterEffect1049ui_story and not isNil(var_800_0) then
					local var_800_4 = Mathf.Lerp(0, 0.5, var_800_3)

					arg_797_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_797_1.var_.characterEffect1049ui_story.fillRatio = var_800_4
				end
			end

			if arg_797_1.time_ >= var_800_1 + var_800_2 and arg_797_1.time_ < var_800_1 + var_800_2 + arg_800_0 and not isNil(var_800_0) and arg_797_1.var_.characterEffect1049ui_story then
				local var_800_5 = 0.5

				arg_797_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_797_1.var_.characterEffect1049ui_story.fillRatio = var_800_5
			end

			local var_800_6 = 0
			local var_800_7 = 0.95

			if var_800_6 < arg_797_1.time_ and arg_797_1.time_ <= var_800_6 + arg_800_0 then
				arg_797_1.talkMaxDuration = 0
				arg_797_1.dialogCg_.alpha = 1

				arg_797_1.dialog_:SetActive(true)
				SetActive(arg_797_1.leftNameGo_, true)

				local var_800_8 = arg_797_1:FormatText(StoryNameCfg[7].name)

				arg_797_1.leftNameTxt_.text = var_800_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_797_1.leftNameTxt_.transform)

				arg_797_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_797_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_797_1:RecordName(arg_797_1.leftNameTxt_.text)
				SetActive(arg_797_1.iconTrs_.gameObject, false)
				arg_797_1.callingController_:SetSelectedState("normal")

				local var_800_9 = arg_797_1:GetWordFromCfg(1104905190)
				local var_800_10 = arg_797_1:FormatText(var_800_9.content)

				arg_797_1.text_.text = var_800_10

				LuaForUtil.ClearLinePrefixSymbol(arg_797_1.text_)

				local var_800_11 = 38
				local var_800_12 = utf8.len(var_800_10)
				local var_800_13 = var_800_11 <= 0 and var_800_7 or var_800_7 * (var_800_12 / var_800_11)

				if var_800_13 > 0 and var_800_7 < var_800_13 then
					arg_797_1.talkMaxDuration = var_800_13

					if var_800_13 + var_800_6 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_13 + var_800_6
					end
				end

				arg_797_1.text_.text = var_800_10
				arg_797_1.typewritter.percent = 0

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(false)
				arg_797_1:RecordContent(arg_797_1.text_.text)
			end

			local var_800_14 = math.max(var_800_7, arg_797_1.talkMaxDuration)

			if var_800_6 <= arg_797_1.time_ and arg_797_1.time_ < var_800_6 + var_800_14 then
				arg_797_1.typewritter.percent = (arg_797_1.time_ - var_800_6) / var_800_14

				arg_797_1.typewritter:SetDirty()
			end

			if arg_797_1.time_ >= var_800_6 + var_800_14 and arg_797_1.time_ < var_800_6 + var_800_14 + arg_800_0 then
				arg_797_1.typewritter.percent = 1

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905191 = function(arg_801_0, arg_801_1)
		arg_801_1.time_ = 0
		arg_801_1.frameCnt_ = 0
		arg_801_1.state_ = "playing"
		arg_801_1.curTalkId_ = 1104905191
		arg_801_1.duration_ = 2

		SetActive(arg_801_1.tipsGo_, false)

		function arg_801_1.onSingleLineFinish_()
			arg_801_1.onSingleLineUpdate_ = nil
			arg_801_1.onSingleLineFinish_ = nil
			arg_801_1.state_ = "waiting"
		end

		function arg_801_1.playNext_(arg_803_0)
			if arg_803_0 == 1 then
				arg_801_0:Play1104905192(arg_801_1)
			end
		end

		function arg_801_1.onSingleLineUpdate_(arg_804_0)
			local var_804_0 = arg_801_1.actors_["1049ui_story"]
			local var_804_1 = 0

			if var_804_1 < arg_801_1.time_ and arg_801_1.time_ <= var_804_1 + arg_804_0 and not isNil(var_804_0) and arg_801_1.var_.characterEffect1049ui_story == nil then
				arg_801_1.var_.characterEffect1049ui_story = var_804_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_804_2 = 0.200000002980232

			if var_804_1 <= arg_801_1.time_ and arg_801_1.time_ < var_804_1 + var_804_2 and not isNil(var_804_0) then
				local var_804_3 = (arg_801_1.time_ - var_804_1) / var_804_2

				if arg_801_1.var_.characterEffect1049ui_story and not isNil(var_804_0) then
					arg_801_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_801_1.time_ >= var_804_1 + var_804_2 and arg_801_1.time_ < var_804_1 + var_804_2 + arg_804_0 and not isNil(var_804_0) and arg_801_1.var_.characterEffect1049ui_story then
				arg_801_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_804_4 = 0

			if var_804_4 < arg_801_1.time_ and arg_801_1.time_ <= var_804_4 + arg_804_0 then
				arg_801_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_804_5 = 0

			if var_804_5 < arg_801_1.time_ and arg_801_1.time_ <= var_804_5 + arg_804_0 then
				arg_801_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_804_6 = 0
			local var_804_7 = 0.125

			if var_804_6 < arg_801_1.time_ and arg_801_1.time_ <= var_804_6 + arg_804_0 then
				arg_801_1.talkMaxDuration = 0
				arg_801_1.dialogCg_.alpha = 1

				arg_801_1.dialog_:SetActive(true)
				SetActive(arg_801_1.leftNameGo_, true)

				local var_804_8 = arg_801_1:FormatText(StoryNameCfg[551].name)

				arg_801_1.leftNameTxt_.text = var_804_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_801_1.leftNameTxt_.transform)

				arg_801_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_801_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_801_1:RecordName(arg_801_1.leftNameTxt_.text)
				SetActive(arg_801_1.iconTrs_.gameObject, false)
				arg_801_1.callingController_:SetSelectedState("normal")

				local var_804_9 = arg_801_1:GetWordFromCfg(1104905191)
				local var_804_10 = arg_801_1:FormatText(var_804_9.content)

				arg_801_1.text_.text = var_804_10

				LuaForUtil.ClearLinePrefixSymbol(arg_801_1.text_)

				local var_804_11 = 5
				local var_804_12 = utf8.len(var_804_10)
				local var_804_13 = var_804_11 <= 0 and var_804_7 or var_804_7 * (var_804_12 / var_804_11)

				if var_804_13 > 0 and var_804_7 < var_804_13 then
					arg_801_1.talkMaxDuration = var_804_13

					if var_804_13 + var_804_6 > arg_801_1.duration_ then
						arg_801_1.duration_ = var_804_13 + var_804_6
					end
				end

				arg_801_1.text_.text = var_804_10
				arg_801_1.typewritter.percent = 0

				arg_801_1.typewritter:SetDirty()
				arg_801_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905191", "story_v_side_new_1104905.awb") ~= 0 then
					local var_804_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905191", "story_v_side_new_1104905.awb") / 1000

					if var_804_14 + var_804_6 > arg_801_1.duration_ then
						arg_801_1.duration_ = var_804_14 + var_804_6
					end

					if var_804_9.prefab_name ~= "" and arg_801_1.actors_[var_804_9.prefab_name] ~= nil then
						local var_804_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_801_1.actors_[var_804_9.prefab_name].transform, "story_v_side_new_1104905", "1104905191", "story_v_side_new_1104905.awb")

						arg_801_1:RecordAudio("1104905191", var_804_15)
						arg_801_1:RecordAudio("1104905191", var_804_15)
					else
						arg_801_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905191", "story_v_side_new_1104905.awb")
					end

					arg_801_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905191", "story_v_side_new_1104905.awb")
				end

				arg_801_1:RecordContent(arg_801_1.text_.text)
			end

			local var_804_16 = math.max(var_804_7, arg_801_1.talkMaxDuration)

			if var_804_6 <= arg_801_1.time_ and arg_801_1.time_ < var_804_6 + var_804_16 then
				arg_801_1.typewritter.percent = (arg_801_1.time_ - var_804_6) / var_804_16

				arg_801_1.typewritter:SetDirty()
			end

			if arg_801_1.time_ >= var_804_6 + var_804_16 and arg_801_1.time_ < var_804_6 + var_804_16 + arg_804_0 then
				arg_801_1.typewritter.percent = 1

				arg_801_1.typewritter:SetDirty()
				arg_801_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905192 = function(arg_805_0, arg_805_1)
		arg_805_1.time_ = 0
		arg_805_1.frameCnt_ = 0
		arg_805_1.state_ = "playing"
		arg_805_1.curTalkId_ = 1104905192
		arg_805_1.duration_ = 3.7

		SetActive(arg_805_1.tipsGo_, false)

		function arg_805_1.onSingleLineFinish_()
			arg_805_1.onSingleLineUpdate_ = nil
			arg_805_1.onSingleLineFinish_ = nil
			arg_805_1.state_ = "waiting"
		end

		function arg_805_1.playNext_(arg_807_0)
			if arg_807_0 == 1 then
				arg_805_0:Play1104905193(arg_805_1)
			end
		end

		function arg_805_1.onSingleLineUpdate_(arg_808_0)
			local var_808_0 = 0

			if var_808_0 < arg_805_1.time_ and arg_805_1.time_ <= var_808_0 + arg_808_0 then
				arg_805_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_1")
			end

			local var_808_1 = 0

			if var_808_1 < arg_805_1.time_ and arg_805_1.time_ <= var_808_1 + arg_808_0 then
				arg_805_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_808_2 = 0
			local var_808_3 = 0.25

			if var_808_2 < arg_805_1.time_ and arg_805_1.time_ <= var_808_2 + arg_808_0 then
				arg_805_1.talkMaxDuration = 0
				arg_805_1.dialogCg_.alpha = 1

				arg_805_1.dialog_:SetActive(true)
				SetActive(arg_805_1.leftNameGo_, true)

				local var_808_4 = arg_805_1:FormatText(StoryNameCfg[551].name)

				arg_805_1.leftNameTxt_.text = var_808_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_805_1.leftNameTxt_.transform)

				arg_805_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_805_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_805_1:RecordName(arg_805_1.leftNameTxt_.text)
				SetActive(arg_805_1.iconTrs_.gameObject, false)
				arg_805_1.callingController_:SetSelectedState("normal")

				local var_808_5 = arg_805_1:GetWordFromCfg(1104905192)
				local var_808_6 = arg_805_1:FormatText(var_808_5.content)

				arg_805_1.text_.text = var_808_6

				LuaForUtil.ClearLinePrefixSymbol(arg_805_1.text_)

				local var_808_7 = 10
				local var_808_8 = utf8.len(var_808_6)
				local var_808_9 = var_808_7 <= 0 and var_808_3 or var_808_3 * (var_808_8 / var_808_7)

				if var_808_9 > 0 and var_808_3 < var_808_9 then
					arg_805_1.talkMaxDuration = var_808_9

					if var_808_9 + var_808_2 > arg_805_1.duration_ then
						arg_805_1.duration_ = var_808_9 + var_808_2
					end
				end

				arg_805_1.text_.text = var_808_6
				arg_805_1.typewritter.percent = 0

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905192", "story_v_side_new_1104905.awb") ~= 0 then
					local var_808_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905192", "story_v_side_new_1104905.awb") / 1000

					if var_808_10 + var_808_2 > arg_805_1.duration_ then
						arg_805_1.duration_ = var_808_10 + var_808_2
					end

					if var_808_5.prefab_name ~= "" and arg_805_1.actors_[var_808_5.prefab_name] ~= nil then
						local var_808_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_805_1.actors_[var_808_5.prefab_name].transform, "story_v_side_new_1104905", "1104905192", "story_v_side_new_1104905.awb")

						arg_805_1:RecordAudio("1104905192", var_808_11)
						arg_805_1:RecordAudio("1104905192", var_808_11)
					else
						arg_805_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905192", "story_v_side_new_1104905.awb")
					end

					arg_805_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905192", "story_v_side_new_1104905.awb")
				end

				arg_805_1:RecordContent(arg_805_1.text_.text)
			end

			local var_808_12 = math.max(var_808_3, arg_805_1.talkMaxDuration)

			if var_808_2 <= arg_805_1.time_ and arg_805_1.time_ < var_808_2 + var_808_12 then
				arg_805_1.typewritter.percent = (arg_805_1.time_ - var_808_2) / var_808_12

				arg_805_1.typewritter:SetDirty()
			end

			if arg_805_1.time_ >= var_808_2 + var_808_12 and arg_805_1.time_ < var_808_2 + var_808_12 + arg_808_0 then
				arg_805_1.typewritter.percent = 1

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905193 = function(arg_809_0, arg_809_1)
		arg_809_1.time_ = 0
		arg_809_1.frameCnt_ = 0
		arg_809_1.state_ = "playing"
		arg_809_1.curTalkId_ = 1104905193
		arg_809_1.duration_ = 5

		SetActive(arg_809_1.tipsGo_, false)

		function arg_809_1.onSingleLineFinish_()
			arg_809_1.onSingleLineUpdate_ = nil
			arg_809_1.onSingleLineFinish_ = nil
			arg_809_1.state_ = "waiting"
		end

		function arg_809_1.playNext_(arg_811_0)
			if arg_811_0 == 1 then
				arg_809_0:Play1104905194(arg_809_1)
			end
		end

		function arg_809_1.onSingleLineUpdate_(arg_812_0)
			local var_812_0 = arg_809_1.actors_["1049ui_story"]
			local var_812_1 = 0

			if var_812_1 < arg_809_1.time_ and arg_809_1.time_ <= var_812_1 + arg_812_0 and not isNil(var_812_0) and arg_809_1.var_.characterEffect1049ui_story == nil then
				arg_809_1.var_.characterEffect1049ui_story = var_812_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_812_2 = 0.200000002980232

			if var_812_1 <= arg_809_1.time_ and arg_809_1.time_ < var_812_1 + var_812_2 and not isNil(var_812_0) then
				local var_812_3 = (arg_809_1.time_ - var_812_1) / var_812_2

				if arg_809_1.var_.characterEffect1049ui_story and not isNil(var_812_0) then
					local var_812_4 = Mathf.Lerp(0, 0.5, var_812_3)

					arg_809_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_809_1.var_.characterEffect1049ui_story.fillRatio = var_812_4
				end
			end

			if arg_809_1.time_ >= var_812_1 + var_812_2 and arg_809_1.time_ < var_812_1 + var_812_2 + arg_812_0 and not isNil(var_812_0) and arg_809_1.var_.characterEffect1049ui_story then
				local var_812_5 = 0.5

				arg_809_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_809_1.var_.characterEffect1049ui_story.fillRatio = var_812_5
			end

			local var_812_6 = 0
			local var_812_7 = 0.95

			if var_812_6 < arg_809_1.time_ and arg_809_1.time_ <= var_812_6 + arg_812_0 then
				arg_809_1.talkMaxDuration = 0
				arg_809_1.dialogCg_.alpha = 1

				arg_809_1.dialog_:SetActive(true)
				SetActive(arg_809_1.leftNameGo_, false)

				arg_809_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_809_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_809_1:RecordName(arg_809_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_809_1.iconTrs_.gameObject, false)
				arg_809_1.callingController_:SetSelectedState("normal")

				local var_812_8 = arg_809_1:GetWordFromCfg(1104905193)
				local var_812_9 = arg_809_1:FormatText(var_812_8.content)

				arg_809_1.text_.text = var_812_9

				LuaForUtil.ClearLinePrefixSymbol(arg_809_1.text_)

				local var_812_10 = 38
				local var_812_11 = utf8.len(var_812_9)
				local var_812_12 = var_812_10 <= 0 and var_812_7 or var_812_7 * (var_812_11 / var_812_10)

				if var_812_12 > 0 and var_812_7 < var_812_12 then
					arg_809_1.talkMaxDuration = var_812_12

					if var_812_12 + var_812_6 > arg_809_1.duration_ then
						arg_809_1.duration_ = var_812_12 + var_812_6
					end
				end

				arg_809_1.text_.text = var_812_9
				arg_809_1.typewritter.percent = 0

				arg_809_1.typewritter:SetDirty()
				arg_809_1:ShowNextGo(false)
				arg_809_1:RecordContent(arg_809_1.text_.text)
			end

			local var_812_13 = math.max(var_812_7, arg_809_1.talkMaxDuration)

			if var_812_6 <= arg_809_1.time_ and arg_809_1.time_ < var_812_6 + var_812_13 then
				arg_809_1.typewritter.percent = (arg_809_1.time_ - var_812_6) / var_812_13

				arg_809_1.typewritter:SetDirty()
			end

			if arg_809_1.time_ >= var_812_6 + var_812_13 and arg_809_1.time_ < var_812_6 + var_812_13 + arg_812_0 then
				arg_809_1.typewritter.percent = 1

				arg_809_1.typewritter:SetDirty()
				arg_809_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905194 = function(arg_813_0, arg_813_1)
		arg_813_1.time_ = 0
		arg_813_1.frameCnt_ = 0
		arg_813_1.state_ = "playing"
		arg_813_1.curTalkId_ = 1104905194
		arg_813_1.duration_ = 8

		SetActive(arg_813_1.tipsGo_, false)

		function arg_813_1.onSingleLineFinish_()
			arg_813_1.onSingleLineUpdate_ = nil
			arg_813_1.onSingleLineFinish_ = nil
			arg_813_1.state_ = "waiting"
		end

		function arg_813_1.playNext_(arg_815_0)
			if arg_815_0 == 1 then
				arg_813_0:Play1104905195(arg_813_1)
			end
		end

		function arg_813_1.onSingleLineUpdate_(arg_816_0)
			local var_816_0 = arg_813_1.actors_["1049ui_story"]
			local var_816_1 = 0

			if var_816_1 < arg_813_1.time_ and arg_813_1.time_ <= var_816_1 + arg_816_0 and not isNil(var_816_0) and arg_813_1.var_.characterEffect1049ui_story == nil then
				arg_813_1.var_.characterEffect1049ui_story = var_816_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_816_2 = 0.200000002980232

			if var_816_1 <= arg_813_1.time_ and arg_813_1.time_ < var_816_1 + var_816_2 and not isNil(var_816_0) then
				local var_816_3 = (arg_813_1.time_ - var_816_1) / var_816_2

				if arg_813_1.var_.characterEffect1049ui_story and not isNil(var_816_0) then
					arg_813_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_813_1.time_ >= var_816_1 + var_816_2 and arg_813_1.time_ < var_816_1 + var_816_2 + arg_816_0 and not isNil(var_816_0) and arg_813_1.var_.characterEffect1049ui_story then
				arg_813_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_816_4 = 0

			if var_816_4 < arg_813_1.time_ and arg_813_1.time_ <= var_816_4 + arg_816_0 then
				arg_813_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_2")
			end

			local var_816_5 = 0

			if var_816_5 < arg_813_1.time_ and arg_813_1.time_ <= var_816_5 + arg_816_0 then
				arg_813_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_816_6 = 0
			local var_816_7 = 0.675

			if var_816_6 < arg_813_1.time_ and arg_813_1.time_ <= var_816_6 + arg_816_0 then
				arg_813_1.talkMaxDuration = 0
				arg_813_1.dialogCg_.alpha = 1

				arg_813_1.dialog_:SetActive(true)
				SetActive(arg_813_1.leftNameGo_, true)

				local var_816_8 = arg_813_1:FormatText(StoryNameCfg[551].name)

				arg_813_1.leftNameTxt_.text = var_816_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_813_1.leftNameTxt_.transform)

				arg_813_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_813_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_813_1:RecordName(arg_813_1.leftNameTxt_.text)
				SetActive(arg_813_1.iconTrs_.gameObject, false)
				arg_813_1.callingController_:SetSelectedState("normal")

				local var_816_9 = arg_813_1:GetWordFromCfg(1104905194)
				local var_816_10 = arg_813_1:FormatText(var_816_9.content)

				arg_813_1.text_.text = var_816_10

				LuaForUtil.ClearLinePrefixSymbol(arg_813_1.text_)

				local var_816_11 = 27
				local var_816_12 = utf8.len(var_816_10)
				local var_816_13 = var_816_11 <= 0 and var_816_7 or var_816_7 * (var_816_12 / var_816_11)

				if var_816_13 > 0 and var_816_7 < var_816_13 then
					arg_813_1.talkMaxDuration = var_816_13

					if var_816_13 + var_816_6 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_13 + var_816_6
					end
				end

				arg_813_1.text_.text = var_816_10
				arg_813_1.typewritter.percent = 0

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905194", "story_v_side_new_1104905.awb") ~= 0 then
					local var_816_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905194", "story_v_side_new_1104905.awb") / 1000

					if var_816_14 + var_816_6 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_14 + var_816_6
					end

					if var_816_9.prefab_name ~= "" and arg_813_1.actors_[var_816_9.prefab_name] ~= nil then
						local var_816_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_813_1.actors_[var_816_9.prefab_name].transform, "story_v_side_new_1104905", "1104905194", "story_v_side_new_1104905.awb")

						arg_813_1:RecordAudio("1104905194", var_816_15)
						arg_813_1:RecordAudio("1104905194", var_816_15)
					else
						arg_813_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905194", "story_v_side_new_1104905.awb")
					end

					arg_813_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905194", "story_v_side_new_1104905.awb")
				end

				arg_813_1:RecordContent(arg_813_1.text_.text)
			end

			local var_816_16 = math.max(var_816_7, arg_813_1.talkMaxDuration)

			if var_816_6 <= arg_813_1.time_ and arg_813_1.time_ < var_816_6 + var_816_16 then
				arg_813_1.typewritter.percent = (arg_813_1.time_ - var_816_6) / var_816_16

				arg_813_1.typewritter:SetDirty()
			end

			if arg_813_1.time_ >= var_816_6 + var_816_16 and arg_813_1.time_ < var_816_6 + var_816_16 + arg_816_0 then
				arg_813_1.typewritter.percent = 1

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905195 = function(arg_817_0, arg_817_1)
		arg_817_1.time_ = 0
		arg_817_1.frameCnt_ = 0
		arg_817_1.state_ = "playing"
		arg_817_1.curTalkId_ = 1104905195
		arg_817_1.duration_ = 13.5

		SetActive(arg_817_1.tipsGo_, false)

		function arg_817_1.onSingleLineFinish_()
			arg_817_1.onSingleLineUpdate_ = nil
			arg_817_1.onSingleLineFinish_ = nil
			arg_817_1.state_ = "waiting"
		end

		function arg_817_1.playNext_(arg_819_0)
			if arg_819_0 == 1 then
				arg_817_0:Play1104905196(arg_817_1)
			end
		end

		function arg_817_1.onSingleLineUpdate_(arg_820_0)
			local var_820_0 = 0
			local var_820_1 = 1.35

			if var_820_0 < arg_817_1.time_ and arg_817_1.time_ <= var_820_0 + arg_820_0 then
				arg_817_1.talkMaxDuration = 0
				arg_817_1.dialogCg_.alpha = 1

				arg_817_1.dialog_:SetActive(true)
				SetActive(arg_817_1.leftNameGo_, true)

				local var_820_2 = arg_817_1:FormatText(StoryNameCfg[551].name)

				arg_817_1.leftNameTxt_.text = var_820_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_817_1.leftNameTxt_.transform)

				arg_817_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_817_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_817_1:RecordName(arg_817_1.leftNameTxt_.text)
				SetActive(arg_817_1.iconTrs_.gameObject, false)
				arg_817_1.callingController_:SetSelectedState("normal")

				local var_820_3 = arg_817_1:GetWordFromCfg(1104905195)
				local var_820_4 = arg_817_1:FormatText(var_820_3.content)

				arg_817_1.text_.text = var_820_4

				LuaForUtil.ClearLinePrefixSymbol(arg_817_1.text_)

				local var_820_5 = 54
				local var_820_6 = utf8.len(var_820_4)
				local var_820_7 = var_820_5 <= 0 and var_820_1 or var_820_1 * (var_820_6 / var_820_5)

				if var_820_7 > 0 and var_820_1 < var_820_7 then
					arg_817_1.talkMaxDuration = var_820_7

					if var_820_7 + var_820_0 > arg_817_1.duration_ then
						arg_817_1.duration_ = var_820_7 + var_820_0
					end
				end

				arg_817_1.text_.text = var_820_4
				arg_817_1.typewritter.percent = 0

				arg_817_1.typewritter:SetDirty()
				arg_817_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905195", "story_v_side_new_1104905.awb") ~= 0 then
					local var_820_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905195", "story_v_side_new_1104905.awb") / 1000

					if var_820_8 + var_820_0 > arg_817_1.duration_ then
						arg_817_1.duration_ = var_820_8 + var_820_0
					end

					if var_820_3.prefab_name ~= "" and arg_817_1.actors_[var_820_3.prefab_name] ~= nil then
						local var_820_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_817_1.actors_[var_820_3.prefab_name].transform, "story_v_side_new_1104905", "1104905195", "story_v_side_new_1104905.awb")

						arg_817_1:RecordAudio("1104905195", var_820_9)
						arg_817_1:RecordAudio("1104905195", var_820_9)
					else
						arg_817_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905195", "story_v_side_new_1104905.awb")
					end

					arg_817_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905195", "story_v_side_new_1104905.awb")
				end

				arg_817_1:RecordContent(arg_817_1.text_.text)
			end

			local var_820_10 = math.max(var_820_1, arg_817_1.talkMaxDuration)

			if var_820_0 <= arg_817_1.time_ and arg_817_1.time_ < var_820_0 + var_820_10 then
				arg_817_1.typewritter.percent = (arg_817_1.time_ - var_820_0) / var_820_10

				arg_817_1.typewritter:SetDirty()
			end

			if arg_817_1.time_ >= var_820_0 + var_820_10 and arg_817_1.time_ < var_820_0 + var_820_10 + arg_820_0 then
				arg_817_1.typewritter.percent = 1

				arg_817_1.typewritter:SetDirty()
				arg_817_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905196 = function(arg_821_0, arg_821_1)
		arg_821_1.time_ = 0
		arg_821_1.frameCnt_ = 0
		arg_821_1.state_ = "playing"
		arg_821_1.curTalkId_ = 1104905196
		arg_821_1.duration_ = 5.63

		SetActive(arg_821_1.tipsGo_, false)

		function arg_821_1.onSingleLineFinish_()
			arg_821_1.onSingleLineUpdate_ = nil
			arg_821_1.onSingleLineFinish_ = nil
			arg_821_1.state_ = "waiting"
		end

		function arg_821_1.playNext_(arg_823_0)
			if arg_823_0 == 1 then
				arg_821_0:Play1104905197(arg_821_1)
			end
		end

		function arg_821_1.onSingleLineUpdate_(arg_824_0)
			local var_824_0 = 0
			local var_824_1 = 0.375

			if var_824_0 < arg_821_1.time_ and arg_821_1.time_ <= var_824_0 + arg_824_0 then
				arg_821_1.talkMaxDuration = 0
				arg_821_1.dialogCg_.alpha = 1

				arg_821_1.dialog_:SetActive(true)
				SetActive(arg_821_1.leftNameGo_, true)

				local var_824_2 = arg_821_1:FormatText(StoryNameCfg[551].name)

				arg_821_1.leftNameTxt_.text = var_824_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_821_1.leftNameTxt_.transform)

				arg_821_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_821_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_821_1:RecordName(arg_821_1.leftNameTxt_.text)
				SetActive(arg_821_1.iconTrs_.gameObject, false)
				arg_821_1.callingController_:SetSelectedState("normal")

				local var_824_3 = arg_821_1:GetWordFromCfg(1104905196)
				local var_824_4 = arg_821_1:FormatText(var_824_3.content)

				arg_821_1.text_.text = var_824_4

				LuaForUtil.ClearLinePrefixSymbol(arg_821_1.text_)

				local var_824_5 = 15
				local var_824_6 = utf8.len(var_824_4)
				local var_824_7 = var_824_5 <= 0 and var_824_1 or var_824_1 * (var_824_6 / var_824_5)

				if var_824_7 > 0 and var_824_1 < var_824_7 then
					arg_821_1.talkMaxDuration = var_824_7

					if var_824_7 + var_824_0 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_7 + var_824_0
					end
				end

				arg_821_1.text_.text = var_824_4
				arg_821_1.typewritter.percent = 0

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905196", "story_v_side_new_1104905.awb") ~= 0 then
					local var_824_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905196", "story_v_side_new_1104905.awb") / 1000

					if var_824_8 + var_824_0 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_8 + var_824_0
					end

					if var_824_3.prefab_name ~= "" and arg_821_1.actors_[var_824_3.prefab_name] ~= nil then
						local var_824_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_821_1.actors_[var_824_3.prefab_name].transform, "story_v_side_new_1104905", "1104905196", "story_v_side_new_1104905.awb")

						arg_821_1:RecordAudio("1104905196", var_824_9)
						arg_821_1:RecordAudio("1104905196", var_824_9)
					else
						arg_821_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905196", "story_v_side_new_1104905.awb")
					end

					arg_821_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905196", "story_v_side_new_1104905.awb")
				end

				arg_821_1:RecordContent(arg_821_1.text_.text)
			end

			local var_824_10 = math.max(var_824_1, arg_821_1.talkMaxDuration)

			if var_824_0 <= arg_821_1.time_ and arg_821_1.time_ < var_824_0 + var_824_10 then
				arg_821_1.typewritter.percent = (arg_821_1.time_ - var_824_0) / var_824_10

				arg_821_1.typewritter:SetDirty()
			end

			if arg_821_1.time_ >= var_824_0 + var_824_10 and arg_821_1.time_ < var_824_0 + var_824_10 + arg_824_0 then
				arg_821_1.typewritter.percent = 1

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905197 = function(arg_825_0, arg_825_1)
		arg_825_1.time_ = 0
		arg_825_1.frameCnt_ = 0
		arg_825_1.state_ = "playing"
		arg_825_1.curTalkId_ = 1104905197
		arg_825_1.duration_ = 9.27

		SetActive(arg_825_1.tipsGo_, false)

		function arg_825_1.onSingleLineFinish_()
			arg_825_1.onSingleLineUpdate_ = nil
			arg_825_1.onSingleLineFinish_ = nil
			arg_825_1.state_ = "waiting"
		end

		function arg_825_1.playNext_(arg_827_0)
			if arg_827_0 == 1 then
				arg_825_0:Play1104905198(arg_825_1)
			end
		end

		function arg_825_1.onSingleLineUpdate_(arg_828_0)
			local var_828_0 = 0

			if var_828_0 < arg_825_1.time_ and arg_825_1.time_ <= var_828_0 + arg_828_0 then
				arg_825_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action4_1")
			end

			local var_828_1 = 0

			if var_828_1 < arg_825_1.time_ and arg_825_1.time_ <= var_828_1 + arg_828_0 then
				arg_825_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_828_2 = 0
			local var_828_3 = 0.925

			if var_828_2 < arg_825_1.time_ and arg_825_1.time_ <= var_828_2 + arg_828_0 then
				arg_825_1.talkMaxDuration = 0
				arg_825_1.dialogCg_.alpha = 1

				arg_825_1.dialog_:SetActive(true)
				SetActive(arg_825_1.leftNameGo_, true)

				local var_828_4 = arg_825_1:FormatText(StoryNameCfg[551].name)

				arg_825_1.leftNameTxt_.text = var_828_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_825_1.leftNameTxt_.transform)

				arg_825_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_825_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_825_1:RecordName(arg_825_1.leftNameTxt_.text)
				SetActive(arg_825_1.iconTrs_.gameObject, false)
				arg_825_1.callingController_:SetSelectedState("normal")

				local var_828_5 = arg_825_1:GetWordFromCfg(1104905197)
				local var_828_6 = arg_825_1:FormatText(var_828_5.content)

				arg_825_1.text_.text = var_828_6

				LuaForUtil.ClearLinePrefixSymbol(arg_825_1.text_)

				local var_828_7 = 37
				local var_828_8 = utf8.len(var_828_6)
				local var_828_9 = var_828_7 <= 0 and var_828_3 or var_828_3 * (var_828_8 / var_828_7)

				if var_828_9 > 0 and var_828_3 < var_828_9 then
					arg_825_1.talkMaxDuration = var_828_9

					if var_828_9 + var_828_2 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_9 + var_828_2
					end
				end

				arg_825_1.text_.text = var_828_6
				arg_825_1.typewritter.percent = 0

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905197", "story_v_side_new_1104905.awb") ~= 0 then
					local var_828_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905197", "story_v_side_new_1104905.awb") / 1000

					if var_828_10 + var_828_2 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_10 + var_828_2
					end

					if var_828_5.prefab_name ~= "" and arg_825_1.actors_[var_828_5.prefab_name] ~= nil then
						local var_828_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_825_1.actors_[var_828_5.prefab_name].transform, "story_v_side_new_1104905", "1104905197", "story_v_side_new_1104905.awb")

						arg_825_1:RecordAudio("1104905197", var_828_11)
						arg_825_1:RecordAudio("1104905197", var_828_11)
					else
						arg_825_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905197", "story_v_side_new_1104905.awb")
					end

					arg_825_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905197", "story_v_side_new_1104905.awb")
				end

				arg_825_1:RecordContent(arg_825_1.text_.text)
			end

			local var_828_12 = math.max(var_828_3, arg_825_1.talkMaxDuration)

			if var_828_2 <= arg_825_1.time_ and arg_825_1.time_ < var_828_2 + var_828_12 then
				arg_825_1.typewritter.percent = (arg_825_1.time_ - var_828_2) / var_828_12

				arg_825_1.typewritter:SetDirty()
			end

			if arg_825_1.time_ >= var_828_2 + var_828_12 and arg_825_1.time_ < var_828_2 + var_828_12 + arg_828_0 then
				arg_825_1.typewritter.percent = 1

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905198 = function(arg_829_0, arg_829_1)
		arg_829_1.time_ = 0
		arg_829_1.frameCnt_ = 0
		arg_829_1.state_ = "playing"
		arg_829_1.curTalkId_ = 1104905198
		arg_829_1.duration_ = 12.4

		SetActive(arg_829_1.tipsGo_, false)

		function arg_829_1.onSingleLineFinish_()
			arg_829_1.onSingleLineUpdate_ = nil
			arg_829_1.onSingleLineFinish_ = nil
			arg_829_1.state_ = "waiting"
		end

		function arg_829_1.playNext_(arg_831_0)
			if arg_831_0 == 1 then
				arg_829_0:Play1104905199(arg_829_1)
			end
		end

		function arg_829_1.onSingleLineUpdate_(arg_832_0)
			local var_832_0 = 0

			if var_832_0 < arg_829_1.time_ and arg_829_1.time_ <= var_832_0 + arg_832_0 then
				arg_829_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049actionlink/1049action442")
			end

			local var_832_1 = 0
			local var_832_2 = 0.9

			if var_832_1 < arg_829_1.time_ and arg_829_1.time_ <= var_832_1 + arg_832_0 then
				arg_829_1.talkMaxDuration = 0
				arg_829_1.dialogCg_.alpha = 1

				arg_829_1.dialog_:SetActive(true)
				SetActive(arg_829_1.leftNameGo_, true)

				local var_832_3 = arg_829_1:FormatText(StoryNameCfg[551].name)

				arg_829_1.leftNameTxt_.text = var_832_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_829_1.leftNameTxt_.transform)

				arg_829_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_829_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_829_1:RecordName(arg_829_1.leftNameTxt_.text)
				SetActive(arg_829_1.iconTrs_.gameObject, false)
				arg_829_1.callingController_:SetSelectedState("normal")

				local var_832_4 = arg_829_1:GetWordFromCfg(1104905198)
				local var_832_5 = arg_829_1:FormatText(var_832_4.content)

				arg_829_1.text_.text = var_832_5

				LuaForUtil.ClearLinePrefixSymbol(arg_829_1.text_)

				local var_832_6 = 36
				local var_832_7 = utf8.len(var_832_5)
				local var_832_8 = var_832_6 <= 0 and var_832_2 or var_832_2 * (var_832_7 / var_832_6)

				if var_832_8 > 0 and var_832_2 < var_832_8 then
					arg_829_1.talkMaxDuration = var_832_8

					if var_832_8 + var_832_1 > arg_829_1.duration_ then
						arg_829_1.duration_ = var_832_8 + var_832_1
					end
				end

				arg_829_1.text_.text = var_832_5
				arg_829_1.typewritter.percent = 0

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905198", "story_v_side_new_1104905.awb") ~= 0 then
					local var_832_9 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905198", "story_v_side_new_1104905.awb") / 1000

					if var_832_9 + var_832_1 > arg_829_1.duration_ then
						arg_829_1.duration_ = var_832_9 + var_832_1
					end

					if var_832_4.prefab_name ~= "" and arg_829_1.actors_[var_832_4.prefab_name] ~= nil then
						local var_832_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_829_1.actors_[var_832_4.prefab_name].transform, "story_v_side_new_1104905", "1104905198", "story_v_side_new_1104905.awb")

						arg_829_1:RecordAudio("1104905198", var_832_10)
						arg_829_1:RecordAudio("1104905198", var_832_10)
					else
						arg_829_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905198", "story_v_side_new_1104905.awb")
					end

					arg_829_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905198", "story_v_side_new_1104905.awb")
				end

				arg_829_1:RecordContent(arg_829_1.text_.text)
			end

			local var_832_11 = math.max(var_832_2, arg_829_1.talkMaxDuration)

			if var_832_1 <= arg_829_1.time_ and arg_829_1.time_ < var_832_1 + var_832_11 then
				arg_829_1.typewritter.percent = (arg_829_1.time_ - var_832_1) / var_832_11

				arg_829_1.typewritter:SetDirty()
			end

			if arg_829_1.time_ >= var_832_1 + var_832_11 and arg_829_1.time_ < var_832_1 + var_832_11 + arg_832_0 then
				arg_829_1.typewritter.percent = 1

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905199 = function(arg_833_0, arg_833_1)
		arg_833_1.time_ = 0
		arg_833_1.frameCnt_ = 0
		arg_833_1.state_ = "playing"
		arg_833_1.curTalkId_ = 1104905199
		arg_833_1.duration_ = 15.57

		SetActive(arg_833_1.tipsGo_, false)

		function arg_833_1.onSingleLineFinish_()
			arg_833_1.onSingleLineUpdate_ = nil
			arg_833_1.onSingleLineFinish_ = nil
			arg_833_1.state_ = "waiting"
		end

		function arg_833_1.playNext_(arg_835_0)
			if arg_835_0 == 1 then
				arg_833_0:Play1104905200(arg_833_1)
			end
		end

		function arg_833_1.onSingleLineUpdate_(arg_836_0)
			local var_836_0 = 0
			local var_836_1 = 1.1

			if var_836_0 < arg_833_1.time_ and arg_833_1.time_ <= var_836_0 + arg_836_0 then
				arg_833_1.talkMaxDuration = 0
				arg_833_1.dialogCg_.alpha = 1

				arg_833_1.dialog_:SetActive(true)
				SetActive(arg_833_1.leftNameGo_, true)

				local var_836_2 = arg_833_1:FormatText(StoryNameCfg[551].name)

				arg_833_1.leftNameTxt_.text = var_836_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_833_1.leftNameTxt_.transform)

				arg_833_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_833_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_833_1:RecordName(arg_833_1.leftNameTxt_.text)
				SetActive(arg_833_1.iconTrs_.gameObject, false)
				arg_833_1.callingController_:SetSelectedState("normal")

				local var_836_3 = arg_833_1:GetWordFromCfg(1104905199)
				local var_836_4 = arg_833_1:FormatText(var_836_3.content)

				arg_833_1.text_.text = var_836_4

				LuaForUtil.ClearLinePrefixSymbol(arg_833_1.text_)

				local var_836_5 = 44
				local var_836_6 = utf8.len(var_836_4)
				local var_836_7 = var_836_5 <= 0 and var_836_1 or var_836_1 * (var_836_6 / var_836_5)

				if var_836_7 > 0 and var_836_1 < var_836_7 then
					arg_833_1.talkMaxDuration = var_836_7

					if var_836_7 + var_836_0 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_7 + var_836_0
					end
				end

				arg_833_1.text_.text = var_836_4
				arg_833_1.typewritter.percent = 0

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905199", "story_v_side_new_1104905.awb") ~= 0 then
					local var_836_8 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905199", "story_v_side_new_1104905.awb") / 1000

					if var_836_8 + var_836_0 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_8 + var_836_0
					end

					if var_836_3.prefab_name ~= "" and arg_833_1.actors_[var_836_3.prefab_name] ~= nil then
						local var_836_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_833_1.actors_[var_836_3.prefab_name].transform, "story_v_side_new_1104905", "1104905199", "story_v_side_new_1104905.awb")

						arg_833_1:RecordAudio("1104905199", var_836_9)
						arg_833_1:RecordAudio("1104905199", var_836_9)
					else
						arg_833_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905199", "story_v_side_new_1104905.awb")
					end

					arg_833_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905199", "story_v_side_new_1104905.awb")
				end

				arg_833_1:RecordContent(arg_833_1.text_.text)
			end

			local var_836_10 = math.max(var_836_1, arg_833_1.talkMaxDuration)

			if var_836_0 <= arg_833_1.time_ and arg_833_1.time_ < var_836_0 + var_836_10 then
				arg_833_1.typewritter.percent = (arg_833_1.time_ - var_836_0) / var_836_10

				arg_833_1.typewritter:SetDirty()
			end

			if arg_833_1.time_ >= var_836_0 + var_836_10 and arg_833_1.time_ < var_836_0 + var_836_10 + arg_836_0 then
				arg_833_1.typewritter.percent = 1

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905200 = function(arg_837_0, arg_837_1)
		arg_837_1.time_ = 0
		arg_837_1.frameCnt_ = 0
		arg_837_1.state_ = "playing"
		arg_837_1.curTalkId_ = 1104905200
		arg_837_1.duration_ = 5.33

		SetActive(arg_837_1.tipsGo_, false)

		function arg_837_1.onSingleLineFinish_()
			arg_837_1.onSingleLineUpdate_ = nil
			arg_837_1.onSingleLineFinish_ = nil
			arg_837_1.state_ = "waiting"
		end

		function arg_837_1.playNext_(arg_839_0)
			if arg_839_0 == 1 then
				arg_837_0:Play1104905201(arg_837_1)
			end
		end

		function arg_837_1.onSingleLineUpdate_(arg_840_0)
			local var_840_0 = 0

			if var_840_0 < arg_837_1.time_ and arg_837_1.time_ <= var_840_0 + arg_840_0 then
				arg_837_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049actionlink/1049action426")
			end

			local var_840_1 = 0

			if var_840_1 < arg_837_1.time_ and arg_837_1.time_ <= var_840_1 + arg_840_0 then
				arg_837_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva", "EmotionTimelineAnimator")
			end

			local var_840_2 = 0
			local var_840_3 = 0.4

			if var_840_2 < arg_837_1.time_ and arg_837_1.time_ <= var_840_2 + arg_840_0 then
				arg_837_1.talkMaxDuration = 0
				arg_837_1.dialogCg_.alpha = 1

				arg_837_1.dialog_:SetActive(true)
				SetActive(arg_837_1.leftNameGo_, true)

				local var_840_4 = arg_837_1:FormatText(StoryNameCfg[551].name)

				arg_837_1.leftNameTxt_.text = var_840_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_837_1.leftNameTxt_.transform)

				arg_837_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_837_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_837_1:RecordName(arg_837_1.leftNameTxt_.text)
				SetActive(arg_837_1.iconTrs_.gameObject, false)
				arg_837_1.callingController_:SetSelectedState("normal")

				local var_840_5 = arg_837_1:GetWordFromCfg(1104905200)
				local var_840_6 = arg_837_1:FormatText(var_840_5.content)

				arg_837_1.text_.text = var_840_6

				LuaForUtil.ClearLinePrefixSymbol(arg_837_1.text_)

				local var_840_7 = 16
				local var_840_8 = utf8.len(var_840_6)
				local var_840_9 = var_840_7 <= 0 and var_840_3 or var_840_3 * (var_840_8 / var_840_7)

				if var_840_9 > 0 and var_840_3 < var_840_9 then
					arg_837_1.talkMaxDuration = var_840_9

					if var_840_9 + var_840_2 > arg_837_1.duration_ then
						arg_837_1.duration_ = var_840_9 + var_840_2
					end
				end

				arg_837_1.text_.text = var_840_6
				arg_837_1.typewritter.percent = 0

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905200", "story_v_side_new_1104905.awb") ~= 0 then
					local var_840_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905200", "story_v_side_new_1104905.awb") / 1000

					if var_840_10 + var_840_2 > arg_837_1.duration_ then
						arg_837_1.duration_ = var_840_10 + var_840_2
					end

					if var_840_5.prefab_name ~= "" and arg_837_1.actors_[var_840_5.prefab_name] ~= nil then
						local var_840_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_837_1.actors_[var_840_5.prefab_name].transform, "story_v_side_new_1104905", "1104905200", "story_v_side_new_1104905.awb")

						arg_837_1:RecordAudio("1104905200", var_840_11)
						arg_837_1:RecordAudio("1104905200", var_840_11)
					else
						arg_837_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905200", "story_v_side_new_1104905.awb")
					end

					arg_837_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905200", "story_v_side_new_1104905.awb")
				end

				arg_837_1:RecordContent(arg_837_1.text_.text)
			end

			local var_840_12 = math.max(var_840_3, arg_837_1.talkMaxDuration)

			if var_840_2 <= arg_837_1.time_ and arg_837_1.time_ < var_840_2 + var_840_12 then
				arg_837_1.typewritter.percent = (arg_837_1.time_ - var_840_2) / var_840_12

				arg_837_1.typewritter:SetDirty()
			end

			if arg_837_1.time_ >= var_840_2 + var_840_12 and arg_837_1.time_ < var_840_2 + var_840_12 + arg_840_0 then
				arg_837_1.typewritter.percent = 1

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905201 = function(arg_841_0, arg_841_1)
		arg_841_1.time_ = 0
		arg_841_1.frameCnt_ = 0
		arg_841_1.state_ = "playing"
		arg_841_1.curTalkId_ = 1104905201
		arg_841_1.duration_ = 5

		SetActive(arg_841_1.tipsGo_, false)

		function arg_841_1.onSingleLineFinish_()
			arg_841_1.onSingleLineUpdate_ = nil
			arg_841_1.onSingleLineFinish_ = nil
			arg_841_1.state_ = "waiting"
		end

		function arg_841_1.playNext_(arg_843_0)
			if arg_843_0 == 1 then
				arg_841_0:Play1104905202(arg_841_1)
			end
		end

		function arg_841_1.onSingleLineUpdate_(arg_844_0)
			local var_844_0 = arg_841_1.actors_["1049ui_story"]
			local var_844_1 = 0

			if var_844_1 < arg_841_1.time_ and arg_841_1.time_ <= var_844_1 + arg_844_0 and not isNil(var_844_0) and arg_841_1.var_.characterEffect1049ui_story == nil then
				arg_841_1.var_.characterEffect1049ui_story = var_844_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_844_2 = 0.200000002980232

			if var_844_1 <= arg_841_1.time_ and arg_841_1.time_ < var_844_1 + var_844_2 and not isNil(var_844_0) then
				local var_844_3 = (arg_841_1.time_ - var_844_1) / var_844_2

				if arg_841_1.var_.characterEffect1049ui_story and not isNil(var_844_0) then
					local var_844_4 = Mathf.Lerp(0, 0.5, var_844_3)

					arg_841_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_841_1.var_.characterEffect1049ui_story.fillRatio = var_844_4
				end
			end

			if arg_841_1.time_ >= var_844_1 + var_844_2 and arg_841_1.time_ < var_844_1 + var_844_2 + arg_844_0 and not isNil(var_844_0) and arg_841_1.var_.characterEffect1049ui_story then
				local var_844_5 = 0.5

				arg_841_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_841_1.var_.characterEffect1049ui_story.fillRatio = var_844_5
			end

			local var_844_6 = 0
			local var_844_7 = 0.8

			if var_844_6 < arg_841_1.time_ and arg_841_1.time_ <= var_844_6 + arg_844_0 then
				arg_841_1.talkMaxDuration = 0
				arg_841_1.dialogCg_.alpha = 1

				arg_841_1.dialog_:SetActive(true)
				SetActive(arg_841_1.leftNameGo_, false)

				arg_841_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_841_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_841_1:RecordName(arg_841_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_841_1.iconTrs_.gameObject, false)
				arg_841_1.callingController_:SetSelectedState("normal")

				local var_844_8 = arg_841_1:GetWordFromCfg(1104905201)
				local var_844_9 = arg_841_1:FormatText(var_844_8.content)

				arg_841_1.text_.text = var_844_9

				LuaForUtil.ClearLinePrefixSymbol(arg_841_1.text_)

				local var_844_10 = 32
				local var_844_11 = utf8.len(var_844_9)
				local var_844_12 = var_844_10 <= 0 and var_844_7 or var_844_7 * (var_844_11 / var_844_10)

				if var_844_12 > 0 and var_844_7 < var_844_12 then
					arg_841_1.talkMaxDuration = var_844_12

					if var_844_12 + var_844_6 > arg_841_1.duration_ then
						arg_841_1.duration_ = var_844_12 + var_844_6
					end
				end

				arg_841_1.text_.text = var_844_9
				arg_841_1.typewritter.percent = 0

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(false)
				arg_841_1:RecordContent(arg_841_1.text_.text)
			end

			local var_844_13 = math.max(var_844_7, arg_841_1.talkMaxDuration)

			if var_844_6 <= arg_841_1.time_ and arg_841_1.time_ < var_844_6 + var_844_13 then
				arg_841_1.typewritter.percent = (arg_841_1.time_ - var_844_6) / var_844_13

				arg_841_1.typewritter:SetDirty()
			end

			if arg_841_1.time_ >= var_844_6 + var_844_13 and arg_841_1.time_ < var_844_6 + var_844_13 + arg_844_0 then
				arg_841_1.typewritter.percent = 1

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905202 = function(arg_845_0, arg_845_1)
		arg_845_1.time_ = 0
		arg_845_1.frameCnt_ = 0
		arg_845_1.state_ = "playing"
		arg_845_1.curTalkId_ = 1104905202
		arg_845_1.duration_ = 5

		SetActive(arg_845_1.tipsGo_, false)

		function arg_845_1.onSingleLineFinish_()
			arg_845_1.onSingleLineUpdate_ = nil
			arg_845_1.onSingleLineFinish_ = nil
			arg_845_1.state_ = "waiting"
		end

		function arg_845_1.playNext_(arg_847_0)
			if arg_847_0 == 1 then
				arg_845_0:Play1104905203(arg_845_1)
			end
		end

		function arg_845_1.onSingleLineUpdate_(arg_848_0)
			local var_848_0 = 0
			local var_848_1 = 0.625

			if var_848_0 < arg_845_1.time_ and arg_845_1.time_ <= var_848_0 + arg_848_0 then
				arg_845_1.talkMaxDuration = 0
				arg_845_1.dialogCg_.alpha = 1

				arg_845_1.dialog_:SetActive(true)
				SetActive(arg_845_1.leftNameGo_, false)

				arg_845_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_845_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_845_1:RecordName(arg_845_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_845_1.iconTrs_.gameObject, false)
				arg_845_1.callingController_:SetSelectedState("normal")

				local var_848_2 = arg_845_1:GetWordFromCfg(1104905202)
				local var_848_3 = arg_845_1:FormatText(var_848_2.content)

				arg_845_1.text_.text = var_848_3

				LuaForUtil.ClearLinePrefixSymbol(arg_845_1.text_)

				local var_848_4 = 25
				local var_848_5 = utf8.len(var_848_3)
				local var_848_6 = var_848_4 <= 0 and var_848_1 or var_848_1 * (var_848_5 / var_848_4)

				if var_848_6 > 0 and var_848_1 < var_848_6 then
					arg_845_1.talkMaxDuration = var_848_6

					if var_848_6 + var_848_0 > arg_845_1.duration_ then
						arg_845_1.duration_ = var_848_6 + var_848_0
					end
				end

				arg_845_1.text_.text = var_848_3
				arg_845_1.typewritter.percent = 0

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(false)
				arg_845_1:RecordContent(arg_845_1.text_.text)
			end

			local var_848_7 = math.max(var_848_1, arg_845_1.talkMaxDuration)

			if var_848_0 <= arg_845_1.time_ and arg_845_1.time_ < var_848_0 + var_848_7 then
				arg_845_1.typewritter.percent = (arg_845_1.time_ - var_848_0) / var_848_7

				arg_845_1.typewritter:SetDirty()
			end

			if arg_845_1.time_ >= var_848_0 + var_848_7 and arg_845_1.time_ < var_848_0 + var_848_7 + arg_848_0 then
				arg_845_1.typewritter.percent = 1

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905203 = function(arg_849_0, arg_849_1)
		arg_849_1.time_ = 0
		arg_849_1.frameCnt_ = 0
		arg_849_1.state_ = "playing"
		arg_849_1.curTalkId_ = 1104905203
		arg_849_1.duration_ = 5

		SetActive(arg_849_1.tipsGo_, false)

		function arg_849_1.onSingleLineFinish_()
			arg_849_1.onSingleLineUpdate_ = nil
			arg_849_1.onSingleLineFinish_ = nil
			arg_849_1.state_ = "waiting"
		end

		function arg_849_1.playNext_(arg_851_0)
			if arg_851_0 == 1 then
				arg_849_0:Play1104905204(arg_849_1)
			end
		end

		function arg_849_1.onSingleLineUpdate_(arg_852_0)
			local var_852_0 = 0

			if var_852_0 < arg_849_1.time_ and arg_849_1.time_ <= var_852_0 + arg_852_0 then
				arg_849_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action6_2")
			end

			local var_852_1 = 0

			if var_852_1 < arg_849_1.time_ and arg_849_1.time_ <= var_852_1 + arg_852_0 then
				arg_849_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_852_2 = 0
			local var_852_3 = 0.775

			if var_852_2 < arg_849_1.time_ and arg_849_1.time_ <= var_852_2 + arg_852_0 then
				arg_849_1.talkMaxDuration = 0
				arg_849_1.dialogCg_.alpha = 1

				arg_849_1.dialog_:SetActive(true)
				SetActive(arg_849_1.leftNameGo_, false)

				arg_849_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_849_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_849_1:RecordName(arg_849_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_849_1.iconTrs_.gameObject, false)
				arg_849_1.callingController_:SetSelectedState("normal")

				local var_852_4 = arg_849_1:GetWordFromCfg(1104905203)
				local var_852_5 = arg_849_1:FormatText(var_852_4.content)

				arg_849_1.text_.text = var_852_5

				LuaForUtil.ClearLinePrefixSymbol(arg_849_1.text_)

				local var_852_6 = 31
				local var_852_7 = utf8.len(var_852_5)
				local var_852_8 = var_852_6 <= 0 and var_852_3 or var_852_3 * (var_852_7 / var_852_6)

				if var_852_8 > 0 and var_852_3 < var_852_8 then
					arg_849_1.talkMaxDuration = var_852_8

					if var_852_8 + var_852_2 > arg_849_1.duration_ then
						arg_849_1.duration_ = var_852_8 + var_852_2
					end
				end

				arg_849_1.text_.text = var_852_5
				arg_849_1.typewritter.percent = 0

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(false)
				arg_849_1:RecordContent(arg_849_1.text_.text)
			end

			local var_852_9 = math.max(var_852_3, arg_849_1.talkMaxDuration)

			if var_852_2 <= arg_849_1.time_ and arg_849_1.time_ < var_852_2 + var_852_9 then
				arg_849_1.typewritter.percent = (arg_849_1.time_ - var_852_2) / var_852_9

				arg_849_1.typewritter:SetDirty()
			end

			if arg_849_1.time_ >= var_852_2 + var_852_9 and arg_849_1.time_ < var_852_2 + var_852_9 + arg_852_0 then
				arg_849_1.typewritter.percent = 1

				arg_849_1.typewritter:SetDirty()
				arg_849_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905204 = function(arg_853_0, arg_853_1)
		arg_853_1.time_ = 0
		arg_853_1.frameCnt_ = 0
		arg_853_1.state_ = "playing"
		arg_853_1.curTalkId_ = 1104905204
		arg_853_1.duration_ = 1

		SetActive(arg_853_1.tipsGo_, true)

		arg_853_1.tipsText_.text = StoryTipsCfg[104901].name

		function arg_853_1.onSingleLineFinish_()
			arg_853_1.onSingleLineUpdate_ = nil
			arg_853_1.onSingleLineFinish_ = nil
			arg_853_1.state_ = "waiting"

			SetActive(arg_853_1.choicesGo_, true)

			for iter_854_0, iter_854_1 in ipairs(arg_853_1.choices_) do
				local var_854_0 = iter_854_0 <= 2

				SetActive(iter_854_1.go, var_854_0)
			end

			arg_853_1.choices_[1].txt.text = arg_853_1:FormatText(StoryChoiceCfg[1183].name)
			arg_853_1.choices_[2].txt.text = arg_853_1:FormatText(StoryChoiceCfg[1184].name)
		end

		function arg_853_1.playNext_(arg_855_0)
			if arg_855_0 == 1 then
				PlayerAction.UseStoryTrigger(1049012, 210490105, 1104905204, 1)
				arg_853_0:Play1104905205(arg_853_1)
			end

			if arg_855_0 == 2 then
				PlayerAction.UseStoryTrigger(1049012, 210490105, 1104905204, 2)
				arg_853_0:Play1104905205(arg_853_1)
			end

			arg_853_1:RecordChoiceLog(1104905204, 1104905205, 1104905205)
		end

		function arg_853_1.onSingleLineUpdate_(arg_856_0)
			local var_856_0 = 0

			if var_856_0 < arg_853_1.time_ and arg_853_1.time_ <= var_856_0 + arg_856_0 then
				arg_853_1.allBtn_.enabled = false
			end

			local var_856_1 = 0.5

			if arg_853_1.time_ >= var_856_0 + var_856_1 and arg_853_1.time_ < var_856_0 + var_856_1 + arg_856_0 then
				arg_853_1.allBtn_.enabled = true
			end
		end
	end,
	Play1104905205 = function(arg_857_0, arg_857_1)
		arg_857_1.time_ = 0
		arg_857_1.frameCnt_ = 0
		arg_857_1.state_ = "playing"
		arg_857_1.curTalkId_ = 1104905205
		arg_857_1.duration_ = 5

		SetActive(arg_857_1.tipsGo_, false)

		function arg_857_1.onSingleLineFinish_()
			arg_857_1.onSingleLineUpdate_ = nil
			arg_857_1.onSingleLineFinish_ = nil
			arg_857_1.state_ = "waiting"
		end

		function arg_857_1.playNext_(arg_859_0)
			if arg_859_0 == 1 then
				arg_857_0:Play1104905206(arg_857_1)
			end
		end

		function arg_857_1.onSingleLineUpdate_(arg_860_0)
			local var_860_0 = 0
			local var_860_1 = 0.525

			if var_860_0 < arg_857_1.time_ and arg_857_1.time_ <= var_860_0 + arg_860_0 then
				arg_857_1.talkMaxDuration = 0
				arg_857_1.dialogCg_.alpha = 1

				arg_857_1.dialog_:SetActive(true)
				SetActive(arg_857_1.leftNameGo_, true)

				local var_860_2 = arg_857_1:FormatText(StoryNameCfg[7].name)

				arg_857_1.leftNameTxt_.text = var_860_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_857_1.leftNameTxt_.transform)

				arg_857_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_857_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_857_1:RecordName(arg_857_1.leftNameTxt_.text)
				SetActive(arg_857_1.iconTrs_.gameObject, false)
				arg_857_1.callingController_:SetSelectedState("normal")

				local var_860_3 = arg_857_1:GetWordFromCfg(1104905205)
				local var_860_4 = arg_857_1:FormatText(var_860_3.content)

				arg_857_1.text_.text = var_860_4

				LuaForUtil.ClearLinePrefixSymbol(arg_857_1.text_)

				local var_860_5 = 21
				local var_860_6 = utf8.len(var_860_4)
				local var_860_7 = var_860_5 <= 0 and var_860_1 or var_860_1 * (var_860_6 / var_860_5)

				if var_860_7 > 0 and var_860_1 < var_860_7 then
					arg_857_1.talkMaxDuration = var_860_7

					if var_860_7 + var_860_0 > arg_857_1.duration_ then
						arg_857_1.duration_ = var_860_7 + var_860_0
					end
				end

				arg_857_1.text_.text = var_860_4
				arg_857_1.typewritter.percent = 0

				arg_857_1.typewritter:SetDirty()
				arg_857_1:ShowNextGo(false)
				arg_857_1:RecordContent(arg_857_1.text_.text)
			end

			local var_860_8 = math.max(var_860_1, arg_857_1.talkMaxDuration)

			if var_860_0 <= arg_857_1.time_ and arg_857_1.time_ < var_860_0 + var_860_8 then
				arg_857_1.typewritter.percent = (arg_857_1.time_ - var_860_0) / var_860_8

				arg_857_1.typewritter:SetDirty()
			end

			if arg_857_1.time_ >= var_860_0 + var_860_8 and arg_857_1.time_ < var_860_0 + var_860_8 + arg_860_0 then
				arg_857_1.typewritter.percent = 1

				arg_857_1.typewritter:SetDirty()
				arg_857_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905206 = function(arg_861_0, arg_861_1)
		arg_861_1.time_ = 0
		arg_861_1.frameCnt_ = 0
		arg_861_1.state_ = "playing"
		arg_861_1.curTalkId_ = 1104905206
		arg_861_1.duration_ = 5

		SetActive(arg_861_1.tipsGo_, false)

		function arg_861_1.onSingleLineFinish_()
			arg_861_1.onSingleLineUpdate_ = nil
			arg_861_1.onSingleLineFinish_ = nil
			arg_861_1.state_ = "waiting"
		end

		function arg_861_1.playNext_(arg_863_0)
			if arg_863_0 == 1 then
				arg_861_0:Play1104905207(arg_861_1)
			end
		end

		function arg_861_1.onSingleLineUpdate_(arg_864_0)
			local var_864_0 = arg_861_1.actors_["1049ui_story"].transform
			local var_864_1 = 0

			if var_864_1 < arg_861_1.time_ and arg_861_1.time_ <= var_864_1 + arg_864_0 then
				arg_861_1.var_.moveOldPos1049ui_story = var_864_0.localPosition
			end

			local var_864_2 = 0.001

			if var_864_1 <= arg_861_1.time_ and arg_861_1.time_ < var_864_1 + var_864_2 then
				local var_864_3 = (arg_861_1.time_ - var_864_1) / var_864_2
				local var_864_4 = Vector3.New(0, 100, 0)

				var_864_0.localPosition = Vector3.Lerp(arg_861_1.var_.moveOldPos1049ui_story, var_864_4, var_864_3)

				local var_864_5 = manager.ui.mainCamera.transform.position - var_864_0.position

				var_864_0.forward = Vector3.New(var_864_5.x, var_864_5.y, var_864_5.z)

				local var_864_6 = var_864_0.localEulerAngles

				var_864_6.z = 0
				var_864_6.x = 0
				var_864_0.localEulerAngles = var_864_6
			end

			if arg_861_1.time_ >= var_864_1 + var_864_2 and arg_861_1.time_ < var_864_1 + var_864_2 + arg_864_0 then
				var_864_0.localPosition = Vector3.New(0, 100, 0)

				local var_864_7 = manager.ui.mainCamera.transform.position - var_864_0.position

				var_864_0.forward = Vector3.New(var_864_7.x, var_864_7.y, var_864_7.z)

				local var_864_8 = var_864_0.localEulerAngles

				var_864_8.z = 0
				var_864_8.x = 0
				var_864_0.localEulerAngles = var_864_8
			end

			local var_864_9 = 0
			local var_864_10 = 0.675

			if var_864_9 < arg_861_1.time_ and arg_861_1.time_ <= var_864_9 + arg_864_0 then
				arg_861_1.talkMaxDuration = 0
				arg_861_1.dialogCg_.alpha = 1

				arg_861_1.dialog_:SetActive(true)
				SetActive(arg_861_1.leftNameGo_, false)

				arg_861_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_861_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_861_1:RecordName(arg_861_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_861_1.iconTrs_.gameObject, false)
				arg_861_1.callingController_:SetSelectedState("normal")

				local var_864_11 = arg_861_1:GetWordFromCfg(1104905206)
				local var_864_12 = arg_861_1:FormatText(var_864_11.content)

				arg_861_1.text_.text = var_864_12

				LuaForUtil.ClearLinePrefixSymbol(arg_861_1.text_)

				local var_864_13 = 27
				local var_864_14 = utf8.len(var_864_12)
				local var_864_15 = var_864_13 <= 0 and var_864_10 or var_864_10 * (var_864_14 / var_864_13)

				if var_864_15 > 0 and var_864_10 < var_864_15 then
					arg_861_1.talkMaxDuration = var_864_15

					if var_864_15 + var_864_9 > arg_861_1.duration_ then
						arg_861_1.duration_ = var_864_15 + var_864_9
					end
				end

				arg_861_1.text_.text = var_864_12
				arg_861_1.typewritter.percent = 0

				arg_861_1.typewritter:SetDirty()
				arg_861_1:ShowNextGo(false)
				arg_861_1:RecordContent(arg_861_1.text_.text)
			end

			local var_864_16 = math.max(var_864_10, arg_861_1.talkMaxDuration)

			if var_864_9 <= arg_861_1.time_ and arg_861_1.time_ < var_864_9 + var_864_16 then
				arg_861_1.typewritter.percent = (arg_861_1.time_ - var_864_9) / var_864_16

				arg_861_1.typewritter:SetDirty()
			end

			if arg_861_1.time_ >= var_864_9 + var_864_16 and arg_861_1.time_ < var_864_9 + var_864_16 + arg_864_0 then
				arg_861_1.typewritter.percent = 1

				arg_861_1.typewritter:SetDirty()
				arg_861_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905207 = function(arg_865_0, arg_865_1)
		arg_865_1.time_ = 0
		arg_865_1.frameCnt_ = 0
		arg_865_1.state_ = "playing"
		arg_865_1.curTalkId_ = 1104905207
		arg_865_1.duration_ = 5.63

		SetActive(arg_865_1.tipsGo_, false)

		function arg_865_1.onSingleLineFinish_()
			arg_865_1.onSingleLineUpdate_ = nil
			arg_865_1.onSingleLineFinish_ = nil
			arg_865_1.state_ = "waiting"
		end

		function arg_865_1.playNext_(arg_867_0)
			if arg_867_0 == 1 then
				arg_865_0:Play1104905208(arg_865_1)
			end
		end

		function arg_865_1.onSingleLineUpdate_(arg_868_0)
			local var_868_0 = arg_865_1.actors_["1049ui_story"].transform
			local var_868_1 = 0

			if var_868_1 < arg_865_1.time_ and arg_865_1.time_ <= var_868_1 + arg_868_0 then
				arg_865_1.var_.moveOldPos1049ui_story = var_868_0.localPosition
			end

			local var_868_2 = 0.001

			if var_868_1 <= arg_865_1.time_ and arg_865_1.time_ < var_868_1 + var_868_2 then
				local var_868_3 = (arg_865_1.time_ - var_868_1) / var_868_2
				local var_868_4 = Vector3.New(0, -1.2, -6)

				var_868_0.localPosition = Vector3.Lerp(arg_865_1.var_.moveOldPos1049ui_story, var_868_4, var_868_3)

				local var_868_5 = manager.ui.mainCamera.transform.position - var_868_0.position

				var_868_0.forward = Vector3.New(var_868_5.x, var_868_5.y, var_868_5.z)

				local var_868_6 = var_868_0.localEulerAngles

				var_868_6.z = 0
				var_868_6.x = 0
				var_868_0.localEulerAngles = var_868_6
			end

			if arg_865_1.time_ >= var_868_1 + var_868_2 and arg_865_1.time_ < var_868_1 + var_868_2 + arg_868_0 then
				var_868_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_868_7 = manager.ui.mainCamera.transform.position - var_868_0.position

				var_868_0.forward = Vector3.New(var_868_7.x, var_868_7.y, var_868_7.z)

				local var_868_8 = var_868_0.localEulerAngles

				var_868_8.z = 0
				var_868_8.x = 0
				var_868_0.localEulerAngles = var_868_8
			end

			local var_868_9 = arg_865_1.actors_["1049ui_story"]
			local var_868_10 = 0

			if var_868_10 < arg_865_1.time_ and arg_865_1.time_ <= var_868_10 + arg_868_0 and not isNil(var_868_9) and arg_865_1.var_.characterEffect1049ui_story == nil then
				arg_865_1.var_.characterEffect1049ui_story = var_868_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_868_11 = 0.200000002980232

			if var_868_10 <= arg_865_1.time_ and arg_865_1.time_ < var_868_10 + var_868_11 and not isNil(var_868_9) then
				local var_868_12 = (arg_865_1.time_ - var_868_10) / var_868_11

				if arg_865_1.var_.characterEffect1049ui_story and not isNil(var_868_9) then
					arg_865_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_865_1.time_ >= var_868_10 + var_868_11 and arg_865_1.time_ < var_868_10 + var_868_11 + arg_868_0 and not isNil(var_868_9) and arg_865_1.var_.characterEffect1049ui_story then
				arg_865_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_868_13 = 0

			if var_868_13 < arg_865_1.time_ and arg_865_1.time_ <= var_868_13 + arg_868_0 then
				arg_865_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_868_14 = 0

			if var_868_14 < arg_865_1.time_ and arg_865_1.time_ <= var_868_14 + arg_868_0 then
				arg_865_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_868_15 = 0
			local var_868_16 = 0.2

			if var_868_15 < arg_865_1.time_ and arg_865_1.time_ <= var_868_15 + arg_868_0 then
				arg_865_1.talkMaxDuration = 0
				arg_865_1.dialogCg_.alpha = 1

				arg_865_1.dialog_:SetActive(true)
				SetActive(arg_865_1.leftNameGo_, true)

				local var_868_17 = arg_865_1:FormatText(StoryNameCfg[551].name)

				arg_865_1.leftNameTxt_.text = var_868_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_865_1.leftNameTxt_.transform)

				arg_865_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_865_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_865_1:RecordName(arg_865_1.leftNameTxt_.text)
				SetActive(arg_865_1.iconTrs_.gameObject, false)
				arg_865_1.callingController_:SetSelectedState("normal")

				local var_868_18 = arg_865_1:GetWordFromCfg(1104905207)
				local var_868_19 = arg_865_1:FormatText(var_868_18.content)

				arg_865_1.text_.text = var_868_19

				LuaForUtil.ClearLinePrefixSymbol(arg_865_1.text_)

				local var_868_20 = 8
				local var_868_21 = utf8.len(var_868_19)
				local var_868_22 = var_868_20 <= 0 and var_868_16 or var_868_16 * (var_868_21 / var_868_20)

				if var_868_22 > 0 and var_868_16 < var_868_22 then
					arg_865_1.talkMaxDuration = var_868_22

					if var_868_22 + var_868_15 > arg_865_1.duration_ then
						arg_865_1.duration_ = var_868_22 + var_868_15
					end
				end

				arg_865_1.text_.text = var_868_19
				arg_865_1.typewritter.percent = 0

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905207", "story_v_side_new_1104905.awb") ~= 0 then
					local var_868_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905207", "story_v_side_new_1104905.awb") / 1000

					if var_868_23 + var_868_15 > arg_865_1.duration_ then
						arg_865_1.duration_ = var_868_23 + var_868_15
					end

					if var_868_18.prefab_name ~= "" and arg_865_1.actors_[var_868_18.prefab_name] ~= nil then
						local var_868_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_865_1.actors_[var_868_18.prefab_name].transform, "story_v_side_new_1104905", "1104905207", "story_v_side_new_1104905.awb")

						arg_865_1:RecordAudio("1104905207", var_868_24)
						arg_865_1:RecordAudio("1104905207", var_868_24)
					else
						arg_865_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905207", "story_v_side_new_1104905.awb")
					end

					arg_865_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905207", "story_v_side_new_1104905.awb")
				end

				arg_865_1:RecordContent(arg_865_1.text_.text)
			end

			local var_868_25 = math.max(var_868_16, arg_865_1.talkMaxDuration)

			if var_868_15 <= arg_865_1.time_ and arg_865_1.time_ < var_868_15 + var_868_25 then
				arg_865_1.typewritter.percent = (arg_865_1.time_ - var_868_15) / var_868_25

				arg_865_1.typewritter:SetDirty()
			end

			if arg_865_1.time_ >= var_868_15 + var_868_25 and arg_865_1.time_ < var_868_15 + var_868_25 + arg_868_0 then
				arg_865_1.typewritter.percent = 1

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905208 = function(arg_869_0, arg_869_1)
		arg_869_1.time_ = 0
		arg_869_1.frameCnt_ = 0
		arg_869_1.state_ = "playing"
		arg_869_1.curTalkId_ = 1104905208
		arg_869_1.duration_ = 5

		SetActive(arg_869_1.tipsGo_, false)

		function arg_869_1.onSingleLineFinish_()
			arg_869_1.onSingleLineUpdate_ = nil
			arg_869_1.onSingleLineFinish_ = nil
			arg_869_1.state_ = "waiting"
		end

		function arg_869_1.playNext_(arg_871_0)
			if arg_871_0 == 1 then
				arg_869_0:Play1104905209(arg_869_1)
			end
		end

		function arg_869_1.onSingleLineUpdate_(arg_872_0)
			local var_872_0 = arg_869_1.actors_["1049ui_story"]
			local var_872_1 = 0

			if var_872_1 < arg_869_1.time_ and arg_869_1.time_ <= var_872_1 + arg_872_0 and not isNil(var_872_0) and arg_869_1.var_.characterEffect1049ui_story == nil then
				arg_869_1.var_.characterEffect1049ui_story = var_872_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_872_2 = 0.200000002980232

			if var_872_1 <= arg_869_1.time_ and arg_869_1.time_ < var_872_1 + var_872_2 and not isNil(var_872_0) then
				local var_872_3 = (arg_869_1.time_ - var_872_1) / var_872_2

				if arg_869_1.var_.characterEffect1049ui_story and not isNil(var_872_0) then
					local var_872_4 = Mathf.Lerp(0, 0.5, var_872_3)

					arg_869_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_869_1.var_.characterEffect1049ui_story.fillRatio = var_872_4
				end
			end

			if arg_869_1.time_ >= var_872_1 + var_872_2 and arg_869_1.time_ < var_872_1 + var_872_2 + arg_872_0 and not isNil(var_872_0) and arg_869_1.var_.characterEffect1049ui_story then
				local var_872_5 = 0.5

				arg_869_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_869_1.var_.characterEffect1049ui_story.fillRatio = var_872_5
			end

			local var_872_6 = 0
			local var_872_7 = 1.25

			if var_872_6 < arg_869_1.time_ and arg_869_1.time_ <= var_872_6 + arg_872_0 then
				arg_869_1.talkMaxDuration = 0
				arg_869_1.dialogCg_.alpha = 1

				arg_869_1.dialog_:SetActive(true)
				SetActive(arg_869_1.leftNameGo_, false)

				arg_869_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_869_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_869_1:RecordName(arg_869_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_869_1.iconTrs_.gameObject, false)
				arg_869_1.callingController_:SetSelectedState("normal")

				local var_872_8 = arg_869_1:GetWordFromCfg(1104905208)
				local var_872_9 = arg_869_1:FormatText(var_872_8.content)

				arg_869_1.text_.text = var_872_9

				LuaForUtil.ClearLinePrefixSymbol(arg_869_1.text_)

				local var_872_10 = 50
				local var_872_11 = utf8.len(var_872_9)
				local var_872_12 = var_872_10 <= 0 and var_872_7 or var_872_7 * (var_872_11 / var_872_10)

				if var_872_12 > 0 and var_872_7 < var_872_12 then
					arg_869_1.talkMaxDuration = var_872_12

					if var_872_12 + var_872_6 > arg_869_1.duration_ then
						arg_869_1.duration_ = var_872_12 + var_872_6
					end
				end

				arg_869_1.text_.text = var_872_9
				arg_869_1.typewritter.percent = 0

				arg_869_1.typewritter:SetDirty()
				arg_869_1:ShowNextGo(false)
				arg_869_1:RecordContent(arg_869_1.text_.text)
			end

			local var_872_13 = math.max(var_872_7, arg_869_1.talkMaxDuration)

			if var_872_6 <= arg_869_1.time_ and arg_869_1.time_ < var_872_6 + var_872_13 then
				arg_869_1.typewritter.percent = (arg_869_1.time_ - var_872_6) / var_872_13

				arg_869_1.typewritter:SetDirty()
			end

			if arg_869_1.time_ >= var_872_6 + var_872_13 and arg_869_1.time_ < var_872_6 + var_872_13 + arg_872_0 then
				arg_869_1.typewritter.percent = 1

				arg_869_1.typewritter:SetDirty()
				arg_869_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905209 = function(arg_873_0, arg_873_1)
		arg_873_1.time_ = 0
		arg_873_1.frameCnt_ = 0
		arg_873_1.state_ = "playing"
		arg_873_1.curTalkId_ = 1104905209
		arg_873_1.duration_ = 4.3

		SetActive(arg_873_1.tipsGo_, false)

		function arg_873_1.onSingleLineFinish_()
			arg_873_1.onSingleLineUpdate_ = nil
			arg_873_1.onSingleLineFinish_ = nil
			arg_873_1.state_ = "waiting"
		end

		function arg_873_1.playNext_(arg_875_0)
			if arg_875_0 == 1 then
				arg_873_0:Play1104905210(arg_873_1)
			end
		end

		function arg_873_1.onSingleLineUpdate_(arg_876_0)
			local var_876_0 = arg_873_1.actors_["1049ui_story"]
			local var_876_1 = 0

			if var_876_1 < arg_873_1.time_ and arg_873_1.time_ <= var_876_1 + arg_876_0 and not isNil(var_876_0) and arg_873_1.var_.characterEffect1049ui_story == nil then
				arg_873_1.var_.characterEffect1049ui_story = var_876_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_876_2 = 0.200000002980232

			if var_876_1 <= arg_873_1.time_ and arg_873_1.time_ < var_876_1 + var_876_2 and not isNil(var_876_0) then
				local var_876_3 = (arg_873_1.time_ - var_876_1) / var_876_2

				if arg_873_1.var_.characterEffect1049ui_story and not isNil(var_876_0) then
					arg_873_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_873_1.time_ >= var_876_1 + var_876_2 and arg_873_1.time_ < var_876_1 + var_876_2 + arg_876_0 and not isNil(var_876_0) and arg_873_1.var_.characterEffect1049ui_story then
				arg_873_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_876_4 = 0

			if var_876_4 < arg_873_1.time_ and arg_873_1.time_ <= var_876_4 + arg_876_0 then
				arg_873_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story104901/story1049action/1049action2_1")
			end

			local var_876_5 = 0

			if var_876_5 < arg_873_1.time_ and arg_873_1.time_ <= var_876_5 + arg_876_0 then
				arg_873_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva", "EmotionTimelineAnimator")
			end

			local var_876_6 = 0
			local var_876_7 = 0.4

			if var_876_6 < arg_873_1.time_ and arg_873_1.time_ <= var_876_6 + arg_876_0 then
				arg_873_1.talkMaxDuration = 0
				arg_873_1.dialogCg_.alpha = 1

				arg_873_1.dialog_:SetActive(true)
				SetActive(arg_873_1.leftNameGo_, true)

				local var_876_8 = arg_873_1:FormatText(StoryNameCfg[551].name)

				arg_873_1.leftNameTxt_.text = var_876_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_873_1.leftNameTxt_.transform)

				arg_873_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_873_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_873_1:RecordName(arg_873_1.leftNameTxt_.text)
				SetActive(arg_873_1.iconTrs_.gameObject, false)
				arg_873_1.callingController_:SetSelectedState("normal")

				local var_876_9 = arg_873_1:GetWordFromCfg(1104905209)
				local var_876_10 = arg_873_1:FormatText(var_876_9.content)

				arg_873_1.text_.text = var_876_10

				LuaForUtil.ClearLinePrefixSymbol(arg_873_1.text_)

				local var_876_11 = 16
				local var_876_12 = utf8.len(var_876_10)
				local var_876_13 = var_876_11 <= 0 and var_876_7 or var_876_7 * (var_876_12 / var_876_11)

				if var_876_13 > 0 and var_876_7 < var_876_13 then
					arg_873_1.talkMaxDuration = var_876_13

					if var_876_13 + var_876_6 > arg_873_1.duration_ then
						arg_873_1.duration_ = var_876_13 + var_876_6
					end
				end

				arg_873_1.text_.text = var_876_10
				arg_873_1.typewritter.percent = 0

				arg_873_1.typewritter:SetDirty()
				arg_873_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905209", "story_v_side_new_1104905.awb") ~= 0 then
					local var_876_14 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905209", "story_v_side_new_1104905.awb") / 1000

					if var_876_14 + var_876_6 > arg_873_1.duration_ then
						arg_873_1.duration_ = var_876_14 + var_876_6
					end

					if var_876_9.prefab_name ~= "" and arg_873_1.actors_[var_876_9.prefab_name] ~= nil then
						local var_876_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_873_1.actors_[var_876_9.prefab_name].transform, "story_v_side_new_1104905", "1104905209", "story_v_side_new_1104905.awb")

						arg_873_1:RecordAudio("1104905209", var_876_15)
						arg_873_1:RecordAudio("1104905209", var_876_15)
					else
						arg_873_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905209", "story_v_side_new_1104905.awb")
					end

					arg_873_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905209", "story_v_side_new_1104905.awb")
				end

				arg_873_1:RecordContent(arg_873_1.text_.text)
			end

			local var_876_16 = math.max(var_876_7, arg_873_1.talkMaxDuration)

			if var_876_6 <= arg_873_1.time_ and arg_873_1.time_ < var_876_6 + var_876_16 then
				arg_873_1.typewritter.percent = (arg_873_1.time_ - var_876_6) / var_876_16

				arg_873_1.typewritter:SetDirty()
			end

			if arg_873_1.time_ >= var_876_6 + var_876_16 and arg_873_1.time_ < var_876_6 + var_876_16 + arg_876_0 then
				arg_873_1.typewritter.percent = 1

				arg_873_1.typewritter:SetDirty()
				arg_873_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905210 = function(arg_877_0, arg_877_1)
		arg_877_1.time_ = 0
		arg_877_1.frameCnt_ = 0
		arg_877_1.state_ = "playing"
		arg_877_1.curTalkId_ = 1104905210
		arg_877_1.duration_ = 5

		SetActive(arg_877_1.tipsGo_, false)

		function arg_877_1.onSingleLineFinish_()
			arg_877_1.onSingleLineUpdate_ = nil
			arg_877_1.onSingleLineFinish_ = nil
			arg_877_1.state_ = "waiting"
		end

		function arg_877_1.playNext_(arg_879_0)
			if arg_879_0 == 1 then
				arg_877_0:Play1104905211(arg_877_1)
			end
		end

		function arg_877_1.onSingleLineUpdate_(arg_880_0)
			local var_880_0 = arg_877_1.actors_["1049ui_story"]
			local var_880_1 = 0

			if var_880_1 < arg_877_1.time_ and arg_877_1.time_ <= var_880_1 + arg_880_0 and not isNil(var_880_0) and arg_877_1.var_.characterEffect1049ui_story == nil then
				arg_877_1.var_.characterEffect1049ui_story = var_880_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_880_2 = 0.200000002980232

			if var_880_1 <= arg_877_1.time_ and arg_877_1.time_ < var_880_1 + var_880_2 and not isNil(var_880_0) then
				local var_880_3 = (arg_877_1.time_ - var_880_1) / var_880_2

				if arg_877_1.var_.characterEffect1049ui_story and not isNil(var_880_0) then
					local var_880_4 = Mathf.Lerp(0, 0.5, var_880_3)

					arg_877_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_877_1.var_.characterEffect1049ui_story.fillRatio = var_880_4
				end
			end

			if arg_877_1.time_ >= var_880_1 + var_880_2 and arg_877_1.time_ < var_880_1 + var_880_2 + arg_880_0 and not isNil(var_880_0) and arg_877_1.var_.characterEffect1049ui_story then
				local var_880_5 = 0.5

				arg_877_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_877_1.var_.characterEffect1049ui_story.fillRatio = var_880_5
			end

			local var_880_6 = 0
			local var_880_7 = 0.075

			if var_880_6 < arg_877_1.time_ and arg_877_1.time_ <= var_880_6 + arg_880_0 then
				arg_877_1.talkMaxDuration = 0
				arg_877_1.dialogCg_.alpha = 1

				arg_877_1.dialog_:SetActive(true)
				SetActive(arg_877_1.leftNameGo_, true)

				local var_880_8 = arg_877_1:FormatText(StoryNameCfg[7].name)

				arg_877_1.leftNameTxt_.text = var_880_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_877_1.leftNameTxt_.transform)

				arg_877_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_877_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_877_1:RecordName(arg_877_1.leftNameTxt_.text)
				SetActive(arg_877_1.iconTrs_.gameObject, false)
				arg_877_1.callingController_:SetSelectedState("normal")

				local var_880_9 = arg_877_1:GetWordFromCfg(1104905210)
				local var_880_10 = arg_877_1:FormatText(var_880_9.content)

				arg_877_1.text_.text = var_880_10

				LuaForUtil.ClearLinePrefixSymbol(arg_877_1.text_)

				local var_880_11 = 3
				local var_880_12 = utf8.len(var_880_10)
				local var_880_13 = var_880_11 <= 0 and var_880_7 or var_880_7 * (var_880_12 / var_880_11)

				if var_880_13 > 0 and var_880_7 < var_880_13 then
					arg_877_1.talkMaxDuration = var_880_13

					if var_880_13 + var_880_6 > arg_877_1.duration_ then
						arg_877_1.duration_ = var_880_13 + var_880_6
					end
				end

				arg_877_1.text_.text = var_880_10
				arg_877_1.typewritter.percent = 0

				arg_877_1.typewritter:SetDirty()
				arg_877_1:ShowNextGo(false)
				arg_877_1:RecordContent(arg_877_1.text_.text)
			end

			local var_880_14 = math.max(var_880_7, arg_877_1.talkMaxDuration)

			if var_880_6 <= arg_877_1.time_ and arg_877_1.time_ < var_880_6 + var_880_14 then
				arg_877_1.typewritter.percent = (arg_877_1.time_ - var_880_6) / var_880_14

				arg_877_1.typewritter:SetDirty()
			end

			if arg_877_1.time_ >= var_880_6 + var_880_14 and arg_877_1.time_ < var_880_6 + var_880_14 + arg_880_0 then
				arg_877_1.typewritter.percent = 1

				arg_877_1.typewritter:SetDirty()
				arg_877_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905211 = function(arg_881_0, arg_881_1)
		arg_881_1.time_ = 0
		arg_881_1.frameCnt_ = 0
		arg_881_1.state_ = "playing"
		arg_881_1.curTalkId_ = 1104905211
		arg_881_1.duration_ = 5

		SetActive(arg_881_1.tipsGo_, false)

		function arg_881_1.onSingleLineFinish_()
			arg_881_1.onSingleLineUpdate_ = nil
			arg_881_1.onSingleLineFinish_ = nil
			arg_881_1.state_ = "waiting"
		end

		function arg_881_1.playNext_(arg_883_0)
			if arg_883_0 == 1 then
				arg_881_0:Play1104905212(arg_881_1)
			end
		end

		function arg_881_1.onSingleLineUpdate_(arg_884_0)
			local var_884_0 = arg_881_1.actors_["1049ui_story"].transform
			local var_884_1 = 0

			if var_884_1 < arg_881_1.time_ and arg_881_1.time_ <= var_884_1 + arg_884_0 then
				arg_881_1.var_.moveOldPos1049ui_story = var_884_0.localPosition
			end

			local var_884_2 = 0.001

			if var_884_1 <= arg_881_1.time_ and arg_881_1.time_ < var_884_1 + var_884_2 then
				local var_884_3 = (arg_881_1.time_ - var_884_1) / var_884_2
				local var_884_4 = Vector3.New(0, 100, 0)

				var_884_0.localPosition = Vector3.Lerp(arg_881_1.var_.moveOldPos1049ui_story, var_884_4, var_884_3)

				local var_884_5 = manager.ui.mainCamera.transform.position - var_884_0.position

				var_884_0.forward = Vector3.New(var_884_5.x, var_884_5.y, var_884_5.z)

				local var_884_6 = var_884_0.localEulerAngles

				var_884_6.z = 0
				var_884_6.x = 0
				var_884_0.localEulerAngles = var_884_6
			end

			if arg_881_1.time_ >= var_884_1 + var_884_2 and arg_881_1.time_ < var_884_1 + var_884_2 + arg_884_0 then
				var_884_0.localPosition = Vector3.New(0, 100, 0)

				local var_884_7 = manager.ui.mainCamera.transform.position - var_884_0.position

				var_884_0.forward = Vector3.New(var_884_7.x, var_884_7.y, var_884_7.z)

				local var_884_8 = var_884_0.localEulerAngles

				var_884_8.z = 0
				var_884_8.x = 0
				var_884_0.localEulerAngles = var_884_8
			end

			local var_884_9 = 0
			local var_884_10 = 0.575

			if var_884_9 < arg_881_1.time_ and arg_881_1.time_ <= var_884_9 + arg_884_0 then
				arg_881_1.talkMaxDuration = 0
				arg_881_1.dialogCg_.alpha = 1

				arg_881_1.dialog_:SetActive(true)
				SetActive(arg_881_1.leftNameGo_, false)

				arg_881_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_881_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_881_1:RecordName(arg_881_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_881_1.iconTrs_.gameObject, false)
				arg_881_1.callingController_:SetSelectedState("normal")

				local var_884_11 = arg_881_1:GetWordFromCfg(1104905211)
				local var_884_12 = arg_881_1:FormatText(var_884_11.content)

				arg_881_1.text_.text = var_884_12

				LuaForUtil.ClearLinePrefixSymbol(arg_881_1.text_)

				local var_884_13 = 23
				local var_884_14 = utf8.len(var_884_12)
				local var_884_15 = var_884_13 <= 0 and var_884_10 or var_884_10 * (var_884_14 / var_884_13)

				if var_884_15 > 0 and var_884_10 < var_884_15 then
					arg_881_1.talkMaxDuration = var_884_15

					if var_884_15 + var_884_9 > arg_881_1.duration_ then
						arg_881_1.duration_ = var_884_15 + var_884_9
					end
				end

				arg_881_1.text_.text = var_884_12
				arg_881_1.typewritter.percent = 0

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(false)
				arg_881_1:RecordContent(arg_881_1.text_.text)
			end

			local var_884_16 = math.max(var_884_10, arg_881_1.talkMaxDuration)

			if var_884_9 <= arg_881_1.time_ and arg_881_1.time_ < var_884_9 + var_884_16 then
				arg_881_1.typewritter.percent = (arg_881_1.time_ - var_884_9) / var_884_16

				arg_881_1.typewritter:SetDirty()
			end

			if arg_881_1.time_ >= var_884_9 + var_884_16 and arg_881_1.time_ < var_884_9 + var_884_16 + arg_884_0 then
				arg_881_1.typewritter.percent = 1

				arg_881_1.typewritter:SetDirty()
				arg_881_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905212 = function(arg_885_0, arg_885_1)
		arg_885_1.time_ = 0
		arg_885_1.frameCnt_ = 0
		arg_885_1.state_ = "playing"
		arg_885_1.curTalkId_ = 1104905212
		arg_885_1.duration_ = 5

		SetActive(arg_885_1.tipsGo_, false)

		function arg_885_1.onSingleLineFinish_()
			arg_885_1.onSingleLineUpdate_ = nil
			arg_885_1.onSingleLineFinish_ = nil
			arg_885_1.state_ = "waiting"
		end

		function arg_885_1.playNext_(arg_887_0)
			if arg_887_0 == 1 then
				arg_885_0:Play1104905213(arg_885_1)
			end
		end

		function arg_885_1.onSingleLineUpdate_(arg_888_0)
			local var_888_0 = 0
			local var_888_1 = 0.875

			if var_888_0 < arg_885_1.time_ and arg_885_1.time_ <= var_888_0 + arg_888_0 then
				arg_885_1.talkMaxDuration = 0
				arg_885_1.dialogCg_.alpha = 1

				arg_885_1.dialog_:SetActive(true)
				SetActive(arg_885_1.leftNameGo_, false)

				arg_885_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_885_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_885_1:RecordName(arg_885_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_885_1.iconTrs_.gameObject, false)
				arg_885_1.callingController_:SetSelectedState("normal")

				local var_888_2 = arg_885_1:GetWordFromCfg(1104905212)
				local var_888_3 = arg_885_1:FormatText(var_888_2.content)

				arg_885_1.text_.text = var_888_3

				LuaForUtil.ClearLinePrefixSymbol(arg_885_1.text_)

				local var_888_4 = 35
				local var_888_5 = utf8.len(var_888_3)
				local var_888_6 = var_888_4 <= 0 and var_888_1 or var_888_1 * (var_888_5 / var_888_4)

				if var_888_6 > 0 and var_888_1 < var_888_6 then
					arg_885_1.talkMaxDuration = var_888_6

					if var_888_6 + var_888_0 > arg_885_1.duration_ then
						arg_885_1.duration_ = var_888_6 + var_888_0
					end
				end

				arg_885_1.text_.text = var_888_3
				arg_885_1.typewritter.percent = 0

				arg_885_1.typewritter:SetDirty()
				arg_885_1:ShowNextGo(false)
				arg_885_1:RecordContent(arg_885_1.text_.text)
			end

			local var_888_7 = math.max(var_888_1, arg_885_1.talkMaxDuration)

			if var_888_0 <= arg_885_1.time_ and arg_885_1.time_ < var_888_0 + var_888_7 then
				arg_885_1.typewritter.percent = (arg_885_1.time_ - var_888_0) / var_888_7

				arg_885_1.typewritter:SetDirty()
			end

			if arg_885_1.time_ >= var_888_0 + var_888_7 and arg_885_1.time_ < var_888_0 + var_888_7 + arg_888_0 then
				arg_885_1.typewritter.percent = 1

				arg_885_1.typewritter:SetDirty()
				arg_885_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905213 = function(arg_889_0, arg_889_1)
		arg_889_1.time_ = 0
		arg_889_1.frameCnt_ = 0
		arg_889_1.state_ = "playing"
		arg_889_1.curTalkId_ = 1104905213
		arg_889_1.duration_ = 9.7

		SetActive(arg_889_1.tipsGo_, false)

		function arg_889_1.onSingleLineFinish_()
			arg_889_1.onSingleLineUpdate_ = nil
			arg_889_1.onSingleLineFinish_ = nil
			arg_889_1.state_ = "waiting"
		end

		function arg_889_1.playNext_(arg_891_0)
			if arg_891_0 == 1 then
				arg_889_0:Play1104905214(arg_889_1)
			end
		end

		function arg_889_1.onSingleLineUpdate_(arg_892_0)
			local var_892_0 = arg_889_1.actors_["1049ui_story"].transform
			local var_892_1 = 0

			if var_892_1 < arg_889_1.time_ and arg_889_1.time_ <= var_892_1 + arg_892_0 then
				arg_889_1.var_.moveOldPos1049ui_story = var_892_0.localPosition
			end

			local var_892_2 = 0.001

			if var_892_1 <= arg_889_1.time_ and arg_889_1.time_ < var_892_1 + var_892_2 then
				local var_892_3 = (arg_889_1.time_ - var_892_1) / var_892_2
				local var_892_4 = Vector3.New(0, -1.2, -6)

				var_892_0.localPosition = Vector3.Lerp(arg_889_1.var_.moveOldPos1049ui_story, var_892_4, var_892_3)

				local var_892_5 = manager.ui.mainCamera.transform.position - var_892_0.position

				var_892_0.forward = Vector3.New(var_892_5.x, var_892_5.y, var_892_5.z)

				local var_892_6 = var_892_0.localEulerAngles

				var_892_6.z = 0
				var_892_6.x = 0
				var_892_0.localEulerAngles = var_892_6
			end

			if arg_889_1.time_ >= var_892_1 + var_892_2 and arg_889_1.time_ < var_892_1 + var_892_2 + arg_892_0 then
				var_892_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_892_7 = manager.ui.mainCamera.transform.position - var_892_0.position

				var_892_0.forward = Vector3.New(var_892_7.x, var_892_7.y, var_892_7.z)

				local var_892_8 = var_892_0.localEulerAngles

				var_892_8.z = 0
				var_892_8.x = 0
				var_892_0.localEulerAngles = var_892_8
			end

			local var_892_9 = arg_889_1.actors_["1049ui_story"]
			local var_892_10 = 0

			if var_892_10 < arg_889_1.time_ and arg_889_1.time_ <= var_892_10 + arg_892_0 and not isNil(var_892_9) and arg_889_1.var_.characterEffect1049ui_story == nil then
				arg_889_1.var_.characterEffect1049ui_story = var_892_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_892_11 = 0.200000002980232

			if var_892_10 <= arg_889_1.time_ and arg_889_1.time_ < var_892_10 + var_892_11 and not isNil(var_892_9) then
				local var_892_12 = (arg_889_1.time_ - var_892_10) / var_892_11

				if arg_889_1.var_.characterEffect1049ui_story and not isNil(var_892_9) then
					arg_889_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_889_1.time_ >= var_892_10 + var_892_11 and arg_889_1.time_ < var_892_10 + var_892_11 + arg_892_0 and not isNil(var_892_9) and arg_889_1.var_.characterEffect1049ui_story then
				arg_889_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_892_13 = 0

			if var_892_13 < arg_889_1.time_ and arg_889_1.time_ <= var_892_13 + arg_892_0 then
				arg_889_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_2")
			end

			local var_892_14 = 0

			if var_892_14 < arg_889_1.time_ and arg_889_1.time_ <= var_892_14 + arg_892_0 then
				arg_889_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_892_15 = 0
			local var_892_16 = 1

			if var_892_15 < arg_889_1.time_ and arg_889_1.time_ <= var_892_15 + arg_892_0 then
				arg_889_1.talkMaxDuration = 0
				arg_889_1.dialogCg_.alpha = 1

				arg_889_1.dialog_:SetActive(true)
				SetActive(arg_889_1.leftNameGo_, true)

				local var_892_17 = arg_889_1:FormatText(StoryNameCfg[551].name)

				arg_889_1.leftNameTxt_.text = var_892_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_889_1.leftNameTxt_.transform)

				arg_889_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_889_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_889_1:RecordName(arg_889_1.leftNameTxt_.text)
				SetActive(arg_889_1.iconTrs_.gameObject, false)
				arg_889_1.callingController_:SetSelectedState("normal")

				local var_892_18 = arg_889_1:GetWordFromCfg(1104905213)
				local var_892_19 = arg_889_1:FormatText(var_892_18.content)

				arg_889_1.text_.text = var_892_19

				LuaForUtil.ClearLinePrefixSymbol(arg_889_1.text_)

				local var_892_20 = 40
				local var_892_21 = utf8.len(var_892_19)
				local var_892_22 = var_892_20 <= 0 and var_892_16 or var_892_16 * (var_892_21 / var_892_20)

				if var_892_22 > 0 and var_892_16 < var_892_22 then
					arg_889_1.talkMaxDuration = var_892_22

					if var_892_22 + var_892_15 > arg_889_1.duration_ then
						arg_889_1.duration_ = var_892_22 + var_892_15
					end
				end

				arg_889_1.text_.text = var_892_19
				arg_889_1.typewritter.percent = 0

				arg_889_1.typewritter:SetDirty()
				arg_889_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905213", "story_v_side_new_1104905.awb") ~= 0 then
					local var_892_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905213", "story_v_side_new_1104905.awb") / 1000

					if var_892_23 + var_892_15 > arg_889_1.duration_ then
						arg_889_1.duration_ = var_892_23 + var_892_15
					end

					if var_892_18.prefab_name ~= "" and arg_889_1.actors_[var_892_18.prefab_name] ~= nil then
						local var_892_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_889_1.actors_[var_892_18.prefab_name].transform, "story_v_side_new_1104905", "1104905213", "story_v_side_new_1104905.awb")

						arg_889_1:RecordAudio("1104905213", var_892_24)
						arg_889_1:RecordAudio("1104905213", var_892_24)
					else
						arg_889_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905213", "story_v_side_new_1104905.awb")
					end

					arg_889_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905213", "story_v_side_new_1104905.awb")
				end

				arg_889_1:RecordContent(arg_889_1.text_.text)
			end

			local var_892_25 = math.max(var_892_16, arg_889_1.talkMaxDuration)

			if var_892_15 <= arg_889_1.time_ and arg_889_1.time_ < var_892_15 + var_892_25 then
				arg_889_1.typewritter.percent = (arg_889_1.time_ - var_892_15) / var_892_25

				arg_889_1.typewritter:SetDirty()
			end

			if arg_889_1.time_ >= var_892_15 + var_892_25 and arg_889_1.time_ < var_892_15 + var_892_25 + arg_892_0 then
				arg_889_1.typewritter.percent = 1

				arg_889_1.typewritter:SetDirty()
				arg_889_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905214 = function(arg_893_0, arg_893_1)
		arg_893_1.time_ = 0
		arg_893_1.frameCnt_ = 0
		arg_893_1.state_ = "playing"
		arg_893_1.curTalkId_ = 1104905214
		arg_893_1.duration_ = 3.9

		SetActive(arg_893_1.tipsGo_, false)

		function arg_893_1.onSingleLineFinish_()
			arg_893_1.onSingleLineUpdate_ = nil
			arg_893_1.onSingleLineFinish_ = nil
			arg_893_1.state_ = "waiting"
		end

		function arg_893_1.playNext_(arg_895_0)
			if arg_895_0 == 1 then
				arg_893_0:Play1104905215(arg_893_1)
			end
		end

		function arg_893_1.onSingleLineUpdate_(arg_896_0)
			local var_896_0 = 0

			if var_896_0 < arg_893_1.time_ and arg_893_1.time_ <= var_896_0 + arg_896_0 then
				arg_893_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action1_1")
			end

			local var_896_1 = 0

			if var_896_1 < arg_893_1.time_ and arg_893_1.time_ <= var_896_1 + arg_896_0 then
				arg_893_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva", "EmotionTimelineAnimator")
			end

			local var_896_2 = 0
			local var_896_3 = 0.425

			if var_896_2 < arg_893_1.time_ and arg_893_1.time_ <= var_896_2 + arg_896_0 then
				arg_893_1.talkMaxDuration = 0
				arg_893_1.dialogCg_.alpha = 1

				arg_893_1.dialog_:SetActive(true)
				SetActive(arg_893_1.leftNameGo_, true)

				local var_896_4 = arg_893_1:FormatText(StoryNameCfg[551].name)

				arg_893_1.leftNameTxt_.text = var_896_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_893_1.leftNameTxt_.transform)

				arg_893_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_893_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_893_1:RecordName(arg_893_1.leftNameTxt_.text)
				SetActive(arg_893_1.iconTrs_.gameObject, false)
				arg_893_1.callingController_:SetSelectedState("normal")

				local var_896_5 = arg_893_1:GetWordFromCfg(1104905214)
				local var_896_6 = arg_893_1:FormatText(var_896_5.content)

				arg_893_1.text_.text = var_896_6

				LuaForUtil.ClearLinePrefixSymbol(arg_893_1.text_)

				local var_896_7 = 17
				local var_896_8 = utf8.len(var_896_6)
				local var_896_9 = var_896_7 <= 0 and var_896_3 or var_896_3 * (var_896_8 / var_896_7)

				if var_896_9 > 0 and var_896_3 < var_896_9 then
					arg_893_1.talkMaxDuration = var_896_9

					if var_896_9 + var_896_2 > arg_893_1.duration_ then
						arg_893_1.duration_ = var_896_9 + var_896_2
					end
				end

				arg_893_1.text_.text = var_896_6
				arg_893_1.typewritter.percent = 0

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905214", "story_v_side_new_1104905.awb") ~= 0 then
					local var_896_10 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905214", "story_v_side_new_1104905.awb") / 1000

					if var_896_10 + var_896_2 > arg_893_1.duration_ then
						arg_893_1.duration_ = var_896_10 + var_896_2
					end

					if var_896_5.prefab_name ~= "" and arg_893_1.actors_[var_896_5.prefab_name] ~= nil then
						local var_896_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_893_1.actors_[var_896_5.prefab_name].transform, "story_v_side_new_1104905", "1104905214", "story_v_side_new_1104905.awb")

						arg_893_1:RecordAudio("1104905214", var_896_11)
						arg_893_1:RecordAudio("1104905214", var_896_11)
					else
						arg_893_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905214", "story_v_side_new_1104905.awb")
					end

					arg_893_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905214", "story_v_side_new_1104905.awb")
				end

				arg_893_1:RecordContent(arg_893_1.text_.text)
			end

			local var_896_12 = math.max(var_896_3, arg_893_1.talkMaxDuration)

			if var_896_2 <= arg_893_1.time_ and arg_893_1.time_ < var_896_2 + var_896_12 then
				arg_893_1.typewritter.percent = (arg_893_1.time_ - var_896_2) / var_896_12

				arg_893_1.typewritter:SetDirty()
			end

			if arg_893_1.time_ >= var_896_2 + var_896_12 and arg_893_1.time_ < var_896_2 + var_896_12 + arg_896_0 then
				arg_893_1.typewritter.percent = 1

				arg_893_1.typewritter:SetDirty()
				arg_893_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905215 = function(arg_897_0, arg_897_1)
		arg_897_1.time_ = 0
		arg_897_1.frameCnt_ = 0
		arg_897_1.state_ = "playing"
		arg_897_1.curTalkId_ = 1104905215
		arg_897_1.duration_ = 5

		SetActive(arg_897_1.tipsGo_, false)

		function arg_897_1.onSingleLineFinish_()
			arg_897_1.onSingleLineUpdate_ = nil
			arg_897_1.onSingleLineFinish_ = nil
			arg_897_1.state_ = "waiting"
		end

		function arg_897_1.playNext_(arg_899_0)
			if arg_899_0 == 1 then
				arg_897_0:Play1104905216(arg_897_1)
			end
		end

		function arg_897_1.onSingleLineUpdate_(arg_900_0)
			local var_900_0 = arg_897_1.actors_["1049ui_story"]
			local var_900_1 = 0

			if var_900_1 < arg_897_1.time_ and arg_897_1.time_ <= var_900_1 + arg_900_0 and not isNil(var_900_0) and arg_897_1.var_.characterEffect1049ui_story == nil then
				arg_897_1.var_.characterEffect1049ui_story = var_900_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_900_2 = 0.200000002980232

			if var_900_1 <= arg_897_1.time_ and arg_897_1.time_ < var_900_1 + var_900_2 and not isNil(var_900_0) then
				local var_900_3 = (arg_897_1.time_ - var_900_1) / var_900_2

				if arg_897_1.var_.characterEffect1049ui_story and not isNil(var_900_0) then
					local var_900_4 = Mathf.Lerp(0, 0.5, var_900_3)

					arg_897_1.var_.characterEffect1049ui_story.fillFlat = true
					arg_897_1.var_.characterEffect1049ui_story.fillRatio = var_900_4
				end
			end

			if arg_897_1.time_ >= var_900_1 + var_900_2 and arg_897_1.time_ < var_900_1 + var_900_2 + arg_900_0 and not isNil(var_900_0) and arg_897_1.var_.characterEffect1049ui_story then
				local var_900_5 = 0.5

				arg_897_1.var_.characterEffect1049ui_story.fillFlat = true
				arg_897_1.var_.characterEffect1049ui_story.fillRatio = var_900_5
			end

			local var_900_6 = 0
			local var_900_7 = 0.1

			if var_900_6 < arg_897_1.time_ and arg_897_1.time_ <= var_900_6 + arg_900_0 then
				arg_897_1.talkMaxDuration = 0
				arg_897_1.dialogCg_.alpha = 1

				arg_897_1.dialog_:SetActive(true)
				SetActive(arg_897_1.leftNameGo_, true)

				local var_900_8 = arg_897_1:FormatText(StoryNameCfg[7].name)

				arg_897_1.leftNameTxt_.text = var_900_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_897_1.leftNameTxt_.transform)

				arg_897_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_897_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_897_1:RecordName(arg_897_1.leftNameTxt_.text)
				SetActive(arg_897_1.iconTrs_.gameObject, false)
				arg_897_1.callingController_:SetSelectedState("normal")

				local var_900_9 = arg_897_1:GetWordFromCfg(1104905215)
				local var_900_10 = arg_897_1:FormatText(var_900_9.content)

				arg_897_1.text_.text = var_900_10

				LuaForUtil.ClearLinePrefixSymbol(arg_897_1.text_)

				local var_900_11 = 4
				local var_900_12 = utf8.len(var_900_10)
				local var_900_13 = var_900_11 <= 0 and var_900_7 or var_900_7 * (var_900_12 / var_900_11)

				if var_900_13 > 0 and var_900_7 < var_900_13 then
					arg_897_1.talkMaxDuration = var_900_13

					if var_900_13 + var_900_6 > arg_897_1.duration_ then
						arg_897_1.duration_ = var_900_13 + var_900_6
					end
				end

				arg_897_1.text_.text = var_900_10
				arg_897_1.typewritter.percent = 0

				arg_897_1.typewritter:SetDirty()
				arg_897_1:ShowNextGo(false)
				arg_897_1:RecordContent(arg_897_1.text_.text)
			end

			local var_900_14 = math.max(var_900_7, arg_897_1.talkMaxDuration)

			if var_900_6 <= arg_897_1.time_ and arg_897_1.time_ < var_900_6 + var_900_14 then
				arg_897_1.typewritter.percent = (arg_897_1.time_ - var_900_6) / var_900_14

				arg_897_1.typewritter:SetDirty()
			end

			if arg_897_1.time_ >= var_900_6 + var_900_14 and arg_897_1.time_ < var_900_6 + var_900_14 + arg_900_0 then
				arg_897_1.typewritter.percent = 1

				arg_897_1.typewritter:SetDirty()
				arg_897_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905216 = function(arg_901_0, arg_901_1)
		arg_901_1.time_ = 0
		arg_901_1.frameCnt_ = 0
		arg_901_1.state_ = "playing"
		arg_901_1.curTalkId_ = 1104905216
		arg_901_1.duration_ = 5

		SetActive(arg_901_1.tipsGo_, false)

		function arg_901_1.onSingleLineFinish_()
			arg_901_1.onSingleLineUpdate_ = nil
			arg_901_1.onSingleLineFinish_ = nil
			arg_901_1.state_ = "waiting"
		end

		function arg_901_1.playNext_(arg_903_0)
			if arg_903_0 == 1 then
				arg_901_0:Play1104905217(arg_901_1)
			end
		end

		function arg_901_1.onSingleLineUpdate_(arg_904_0)
			local var_904_0 = arg_901_1.actors_["1049ui_story"].transform
			local var_904_1 = 0

			if var_904_1 < arg_901_1.time_ and arg_901_1.time_ <= var_904_1 + arg_904_0 then
				arg_901_1.var_.moveOldPos1049ui_story = var_904_0.localPosition
			end

			local var_904_2 = 0.001

			if var_904_1 <= arg_901_1.time_ and arg_901_1.time_ < var_904_1 + var_904_2 then
				local var_904_3 = (arg_901_1.time_ - var_904_1) / var_904_2
				local var_904_4 = Vector3.New(0, 100, 0)

				var_904_0.localPosition = Vector3.Lerp(arg_901_1.var_.moveOldPos1049ui_story, var_904_4, var_904_3)

				local var_904_5 = manager.ui.mainCamera.transform.position - var_904_0.position

				var_904_0.forward = Vector3.New(var_904_5.x, var_904_5.y, var_904_5.z)

				local var_904_6 = var_904_0.localEulerAngles

				var_904_6.z = 0
				var_904_6.x = 0
				var_904_0.localEulerAngles = var_904_6
			end

			if arg_901_1.time_ >= var_904_1 + var_904_2 and arg_901_1.time_ < var_904_1 + var_904_2 + arg_904_0 then
				var_904_0.localPosition = Vector3.New(0, 100, 0)

				local var_904_7 = manager.ui.mainCamera.transform.position - var_904_0.position

				var_904_0.forward = Vector3.New(var_904_7.x, var_904_7.y, var_904_7.z)

				local var_904_8 = var_904_0.localEulerAngles

				var_904_8.z = 0
				var_904_8.x = 0
				var_904_0.localEulerAngles = var_904_8
			end

			local var_904_9 = 0
			local var_904_10 = 1.625

			if var_904_9 < arg_901_1.time_ and arg_901_1.time_ <= var_904_9 + arg_904_0 then
				arg_901_1.talkMaxDuration = 0
				arg_901_1.dialogCg_.alpha = 1

				arg_901_1.dialog_:SetActive(true)
				SetActive(arg_901_1.leftNameGo_, false)

				arg_901_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_901_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_901_1:RecordName(arg_901_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_901_1.iconTrs_.gameObject, false)
				arg_901_1.callingController_:SetSelectedState("normal")

				local var_904_11 = arg_901_1:GetWordFromCfg(1104905216)
				local var_904_12 = arg_901_1:FormatText(var_904_11.content)

				arg_901_1.text_.text = var_904_12

				LuaForUtil.ClearLinePrefixSymbol(arg_901_1.text_)

				local var_904_13 = 65
				local var_904_14 = utf8.len(var_904_12)
				local var_904_15 = var_904_13 <= 0 and var_904_10 or var_904_10 * (var_904_14 / var_904_13)

				if var_904_15 > 0 and var_904_10 < var_904_15 then
					arg_901_1.talkMaxDuration = var_904_15

					if var_904_15 + var_904_9 > arg_901_1.duration_ then
						arg_901_1.duration_ = var_904_15 + var_904_9
					end
				end

				arg_901_1.text_.text = var_904_12
				arg_901_1.typewritter.percent = 0

				arg_901_1.typewritter:SetDirty()
				arg_901_1:ShowNextGo(false)
				arg_901_1:RecordContent(arg_901_1.text_.text)
			end

			local var_904_16 = math.max(var_904_10, arg_901_1.talkMaxDuration)

			if var_904_9 <= arg_901_1.time_ and arg_901_1.time_ < var_904_9 + var_904_16 then
				arg_901_1.typewritter.percent = (arg_901_1.time_ - var_904_9) / var_904_16

				arg_901_1.typewritter:SetDirty()
			end

			if arg_901_1.time_ >= var_904_9 + var_904_16 and arg_901_1.time_ < var_904_9 + var_904_16 + arg_904_0 then
				arg_901_1.typewritter.percent = 1

				arg_901_1.typewritter:SetDirty()
				arg_901_1:ShowNextGo(true)
			end
		end
	end,
	Play1104905217 = function(arg_905_0, arg_905_1)
		arg_905_1.time_ = 0
		arg_905_1.frameCnt_ = 0
		arg_905_1.state_ = "playing"
		arg_905_1.curTalkId_ = 1104905217
		arg_905_1.duration_ = 3.9

		SetActive(arg_905_1.tipsGo_, false)

		function arg_905_1.onSingleLineFinish_()
			arg_905_1.onSingleLineUpdate_ = nil
			arg_905_1.onSingleLineFinish_ = nil
			arg_905_1.state_ = "waiting"
			arg_905_1.auto_ = false
		end

		function arg_905_1.playNext_(arg_907_0)
			arg_905_1.onStoryFinished_()
		end

		function arg_905_1.onSingleLineUpdate_(arg_908_0)
			local var_908_0 = arg_905_1.actors_["1049ui_story"].transform
			local var_908_1 = 0

			if var_908_1 < arg_905_1.time_ and arg_905_1.time_ <= var_908_1 + arg_908_0 then
				arg_905_1.var_.moveOldPos1049ui_story = var_908_0.localPosition
			end

			local var_908_2 = 0.001

			if var_908_1 <= arg_905_1.time_ and arg_905_1.time_ < var_908_1 + var_908_2 then
				local var_908_3 = (arg_905_1.time_ - var_908_1) / var_908_2
				local var_908_4 = Vector3.New(0, -1.2, -6)

				var_908_0.localPosition = Vector3.Lerp(arg_905_1.var_.moveOldPos1049ui_story, var_908_4, var_908_3)

				local var_908_5 = manager.ui.mainCamera.transform.position - var_908_0.position

				var_908_0.forward = Vector3.New(var_908_5.x, var_908_5.y, var_908_5.z)

				local var_908_6 = var_908_0.localEulerAngles

				var_908_6.z = 0
				var_908_6.x = 0
				var_908_0.localEulerAngles = var_908_6
			end

			if arg_905_1.time_ >= var_908_1 + var_908_2 and arg_905_1.time_ < var_908_1 + var_908_2 + arg_908_0 then
				var_908_0.localPosition = Vector3.New(0, -1.2, -6)

				local var_908_7 = manager.ui.mainCamera.transform.position - var_908_0.position

				var_908_0.forward = Vector3.New(var_908_7.x, var_908_7.y, var_908_7.z)

				local var_908_8 = var_908_0.localEulerAngles

				var_908_8.z = 0
				var_908_8.x = 0
				var_908_0.localEulerAngles = var_908_8
			end

			local var_908_9 = arg_905_1.actors_["1049ui_story"]
			local var_908_10 = 0

			if var_908_10 < arg_905_1.time_ and arg_905_1.time_ <= var_908_10 + arg_908_0 and not isNil(var_908_9) and arg_905_1.var_.characterEffect1049ui_story == nil then
				arg_905_1.var_.characterEffect1049ui_story = var_908_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_908_11 = 0.200000002980232

			if var_908_10 <= arg_905_1.time_ and arg_905_1.time_ < var_908_10 + var_908_11 and not isNil(var_908_9) then
				local var_908_12 = (arg_905_1.time_ - var_908_10) / var_908_11

				if arg_905_1.var_.characterEffect1049ui_story and not isNil(var_908_9) then
					arg_905_1.var_.characterEffect1049ui_story.fillFlat = false
				end
			end

			if arg_905_1.time_ >= var_908_10 + var_908_11 and arg_905_1.time_ < var_908_10 + var_908_11 + arg_908_0 and not isNil(var_908_9) and arg_905_1.var_.characterEffect1049ui_story then
				arg_905_1.var_.characterEffect1049ui_story.fillFlat = false
			end

			local var_908_13 = 0

			if var_908_13 < arg_905_1.time_ and arg_905_1.time_ <= var_908_13 + arg_908_0 then
				arg_905_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/story1049/story1049action/1049action2_1")
			end

			local var_908_14 = 0

			if var_908_14 < arg_905_1.time_ and arg_905_1.time_ <= var_908_14 + arg_908_0 then
				arg_905_1:PlayTimeline("1049ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva", "EmotionTimelineAnimator")
			end

			local var_908_15 = 0
			local var_908_16 = 0.4

			if var_908_15 < arg_905_1.time_ and arg_905_1.time_ <= var_908_15 + arg_908_0 then
				arg_905_1.talkMaxDuration = 0
				arg_905_1.dialogCg_.alpha = 1

				arg_905_1.dialog_:SetActive(true)
				SetActive(arg_905_1.leftNameGo_, true)

				local var_908_17 = arg_905_1:FormatText(StoryNameCfg[551].name)

				arg_905_1.leftNameTxt_.text = var_908_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_905_1.leftNameTxt_.transform)

				arg_905_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_905_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_905_1:RecordName(arg_905_1.leftNameTxt_.text)
				SetActive(arg_905_1.iconTrs_.gameObject, false)
				arg_905_1.callingController_:SetSelectedState("normal")

				local var_908_18 = arg_905_1:GetWordFromCfg(1104905217)
				local var_908_19 = arg_905_1:FormatText(var_908_18.content)

				arg_905_1.text_.text = var_908_19

				LuaForUtil.ClearLinePrefixSymbol(arg_905_1.text_)

				local var_908_20 = 16
				local var_908_21 = utf8.len(var_908_19)
				local var_908_22 = var_908_20 <= 0 and var_908_16 or var_908_16 * (var_908_21 / var_908_20)

				if var_908_22 > 0 and var_908_16 < var_908_22 then
					arg_905_1.talkMaxDuration = var_908_22

					if var_908_22 + var_908_15 > arg_905_1.duration_ then
						arg_905_1.duration_ = var_908_22 + var_908_15
					end
				end

				arg_905_1.text_.text = var_908_19
				arg_905_1.typewritter.percent = 0

				arg_905_1.typewritter:SetDirty()
				arg_905_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905217", "story_v_side_new_1104905.awb") ~= 0 then
					local var_908_23 = manager.audio:GetVoiceLength("story_v_side_new_1104905", "1104905217", "story_v_side_new_1104905.awb") / 1000

					if var_908_23 + var_908_15 > arg_905_1.duration_ then
						arg_905_1.duration_ = var_908_23 + var_908_15
					end

					if var_908_18.prefab_name ~= "" and arg_905_1.actors_[var_908_18.prefab_name] ~= nil then
						local var_908_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_905_1.actors_[var_908_18.prefab_name].transform, "story_v_side_new_1104905", "1104905217", "story_v_side_new_1104905.awb")

						arg_905_1:RecordAudio("1104905217", var_908_24)
						arg_905_1:RecordAudio("1104905217", var_908_24)
					else
						arg_905_1:AudioAction("play", "voice", "story_v_side_new_1104905", "1104905217", "story_v_side_new_1104905.awb")
					end

					arg_905_1:RecordHistoryTalkVoice("story_v_side_new_1104905", "1104905217", "story_v_side_new_1104905.awb")
				end

				arg_905_1:RecordContent(arg_905_1.text_.text)
			end

			local var_908_25 = math.max(var_908_16, arg_905_1.talkMaxDuration)

			if var_908_15 <= arg_905_1.time_ and arg_905_1.time_ < var_908_15 + var_908_25 then
				arg_905_1.typewritter.percent = (arg_905_1.time_ - var_908_15) / var_908_25

				arg_905_1.typewritter:SetDirty()
			end

			if arg_905_1.time_ >= var_908_15 + var_908_25 and arg_905_1.time_ < var_908_15 + var_908_25 + arg_908_0 then
				arg_905_1.typewritter.percent = 1

				arg_905_1.typewritter:SetDirty()
				arg_905_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K10g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/C02a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST58",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K12h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K03h",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06a"
	},
	voices = {
		"story_v_side_new_1104905.awb"
	}
}
