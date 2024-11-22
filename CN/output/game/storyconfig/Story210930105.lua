﻿return {
	Play1109305001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1109305001
		arg_1_1.duration_ = 6.9

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1109305002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST06b"

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
				local var_4_5 = arg_1_1.bgs_.ST06b

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
					if iter_4_0 ~= "ST06b" then
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

			local var_4_22 = 0
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_26 = ""
				local var_4_27 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_27 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_27 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_27

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_27
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

			local var_4_28 = 2
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")

				local var_4_32 = ""
				local var_4_33 = manager.audio:GetAudioName("bgm_side_daily03", "bgm_side_daily03")

				if var_4_33 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_33 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_33

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_33
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

			local var_4_34 = 1.9
			local var_4_35 = 1.175

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(1109305001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 47
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 1109305002
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play1109305003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 0.8

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_2 = arg_9_1:GetWordFromCfg(1109305002)
				local var_12_3 = arg_9_1:FormatText(var_12_2.content)

				arg_9_1.text_.text = var_12_3

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_4 = 32
				local var_12_5 = utf8.len(var_12_3)
				local var_12_6 = var_12_4 <= 0 and var_12_1 or var_12_1 * (var_12_5 / var_12_4)

				if var_12_6 > 0 and var_12_1 < var_12_6 then
					arg_9_1.talkMaxDuration = var_12_6

					if var_12_6 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_6 + var_12_0
					end
				end

				arg_9_1.text_.text = var_12_3
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_7 = math.max(var_12_1, arg_9_1.talkMaxDuration)

			if var_12_0 <= arg_9_1.time_ and arg_9_1.time_ < var_12_0 + var_12_7 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_0) / var_12_7

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_0 + var_12_7 and arg_9_1.time_ < var_12_0 + var_12_7 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 1109305003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play1109305004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.8

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[7].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(1109305003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 32
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
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_8 = math.max(var_16_1, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_8 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_0) / var_16_8

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_8 and arg_13_1.time_ < var_16_0 + var_16_8 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 1109305004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play1109305005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.225

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

				local var_20_3 = arg_17_1:GetWordFromCfg(1109305004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 9
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
	Play1109305005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 1109305005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play1109305006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 1.425

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_2 = arg_21_1:GetWordFromCfg(1109305005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 57
				local var_24_5 = utf8.len(var_24_3)
				local var_24_6 = var_24_4 <= 0 and var_24_1 or var_24_1 * (var_24_5 / var_24_4)

				if var_24_6 > 0 and var_24_1 < var_24_6 then
					arg_21_1.talkMaxDuration = var_24_6

					if var_24_6 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_6 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_3
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_7 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_7 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_7

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_7 and arg_21_1.time_ < var_24_0 + var_24_7 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 1109305006
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play1109305007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.275

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[7].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(1109305006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 11
				local var_28_6 = utf8.len(var_28_4)
				local var_28_7 = var_28_5 <= 0 and var_28_1 or var_28_1 * (var_28_6 / var_28_5)

				if var_28_7 > 0 and var_28_1 < var_28_7 then
					arg_25_1.talkMaxDuration = var_28_7

					if var_28_7 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_7 + var_28_0
					end
				end

				arg_25_1.text_.text = var_28_4
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_8 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_8 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_8

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_8 and arg_25_1.time_ < var_28_0 + var_28_8 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 1109305007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play1109305008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.675

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_2 = arg_29_1:GetWordFromCfg(1109305007)
				local var_32_3 = arg_29_1:FormatText(var_32_2.content)

				arg_29_1.text_.text = var_32_3

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_4 = 27
				local var_32_5 = utf8.len(var_32_3)
				local var_32_6 = var_32_4 <= 0 and var_32_1 or var_32_1 * (var_32_5 / var_32_4)

				if var_32_6 > 0 and var_32_1 < var_32_6 then
					arg_29_1.talkMaxDuration = var_32_6

					if var_32_6 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_6 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_3
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_7 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_7 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_7

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_7 and arg_29_1.time_ < var_32_0 + var_32_7 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 1109305008
		arg_33_1.duration_ = 2

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play1109305009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = "1093ui_story"

			if arg_33_1.actors_[var_36_0] == nil then
				local var_36_1 = Asset.Load("Char/" .. "1093ui_story")

				if not isNil(var_36_1) then
					local var_36_2 = Object.Instantiate(Asset.Load("Char/" .. "1093ui_story"), arg_33_1.stage_.transform)

					var_36_2.name = var_36_0
					var_36_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_33_1.actors_[var_36_0] = var_36_2

					local var_36_3 = var_36_2:GetComponentInChildren(typeof(CharacterEffect))

					var_36_3.enabled = true

					local var_36_4 = GameObjectTools.GetOrAddComponent(var_36_2, typeof(DynamicBoneHelper))

					if var_36_4 then
						var_36_4:EnableDynamicBone(false)
					end

					arg_33_1:ShowWeapon(var_36_3.transform, false)

					arg_33_1.var_[var_36_0 .. "Animator"] = var_36_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_33_1.var_[var_36_0 .. "Animator"].applyRootMotion = true
					arg_33_1.var_[var_36_0 .. "LipSync"] = var_36_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_36_5 = arg_33_1.actors_["1093ui_story"].transform
			local var_36_6 = 0

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.var_.moveOldPos1093ui_story = var_36_5.localPosition

				local var_36_7 = "1093ui_story"

				arg_33_1:ShowWeapon(arg_33_1.var_[var_36_7 .. "Animator"].transform, false)
			end

			local var_36_8 = 0.001

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_8 then
				local var_36_9 = (arg_33_1.time_ - var_36_6) / var_36_8
				local var_36_10 = Vector3.New(0, -1.11, -5.88)

				var_36_5.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1093ui_story, var_36_10, var_36_9)

				local var_36_11 = manager.ui.mainCamera.transform.position - var_36_5.position

				var_36_5.forward = Vector3.New(var_36_11.x, var_36_11.y, var_36_11.z)

				local var_36_12 = var_36_5.localEulerAngles

				var_36_12.z = 0
				var_36_12.x = 0
				var_36_5.localEulerAngles = var_36_12
			end

			if arg_33_1.time_ >= var_36_6 + var_36_8 and arg_33_1.time_ < var_36_6 + var_36_8 + arg_36_0 then
				var_36_5.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_36_13 = manager.ui.mainCamera.transform.position - var_36_5.position

				var_36_5.forward = Vector3.New(var_36_13.x, var_36_13.y, var_36_13.z)

				local var_36_14 = var_36_5.localEulerAngles

				var_36_14.z = 0
				var_36_14.x = 0
				var_36_5.localEulerAngles = var_36_14
			end

			local var_36_15 = arg_33_1.actors_["1093ui_story"]
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 and not isNil(var_36_15) and arg_33_1.var_.characterEffect1093ui_story == nil then
				arg_33_1.var_.characterEffect1093ui_story = var_36_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_17 = 0.200000002980232

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_17 and not isNil(var_36_15) then
				local var_36_18 = (arg_33_1.time_ - var_36_16) / var_36_17

				if arg_33_1.var_.characterEffect1093ui_story and not isNil(var_36_15) then
					arg_33_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_16 + var_36_17 and arg_33_1.time_ < var_36_16 + var_36_17 + arg_36_0 and not isNil(var_36_15) and arg_33_1.var_.characterEffect1093ui_story then
				arg_33_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_36_19 = 0

			if var_36_19 < arg_33_1.time_ and arg_33_1.time_ <= var_36_19 + arg_36_0 then
				arg_33_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_36_20 = 0

			if var_36_20 < arg_33_1.time_ and arg_33_1.time_ <= var_36_20 + arg_36_0 then
				arg_33_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_33_1.frameCnt_ <= 1 then
				arg_33_1.dialog_:SetActive(false)
			end

			local var_36_21 = 0.3
			local var_36_22 = 0.075

			if var_36_21 < arg_33_1.time_ and arg_33_1.time_ <= var_36_21 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0

				arg_33_1.dialog_:SetActive(true)

				local var_36_23 = LeanTween.value(arg_33_1.dialog_, 0, 1, 0.3)

				var_36_23:setOnUpdate(LuaHelper.FloatAction(function(arg_37_0)
					arg_33_1.dialogCg_.alpha = arg_37_0
				end))
				var_36_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_33_1.dialog_)
					var_36_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_33_1.duration_ = arg_33_1.duration_ + 0.3

				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_24 = arg_33_1:FormatText(StoryNameCfg[73].name)

				arg_33_1.leftNameTxt_.text = var_36_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_25 = arg_33_1:GetWordFromCfg(1109305008)
				local var_36_26 = arg_33_1:FormatText(var_36_25.content)

				arg_33_1.text_.text = var_36_26

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_27 = 3
				local var_36_28 = utf8.len(var_36_26)
				local var_36_29 = var_36_27 <= 0 and var_36_22 or var_36_22 * (var_36_28 / var_36_27)

				if var_36_29 > 0 and var_36_22 < var_36_29 then
					arg_33_1.talkMaxDuration = var_36_29
					var_36_21 = var_36_21 + 0.3

					if var_36_29 + var_36_21 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_29 + var_36_21
					end
				end

				arg_33_1.text_.text = var_36_26
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305008", "story_v_side_new_1109305.awb") ~= 0 then
					local var_36_30 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305008", "story_v_side_new_1109305.awb") / 1000

					if var_36_30 + var_36_21 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_30 + var_36_21
					end

					if var_36_25.prefab_name ~= "" and arg_33_1.actors_[var_36_25.prefab_name] ~= nil then
						local var_36_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_25.prefab_name].transform, "story_v_side_new_1109305", "1109305008", "story_v_side_new_1109305.awb")

						arg_33_1:RecordAudio("1109305008", var_36_31)
						arg_33_1:RecordAudio("1109305008", var_36_31)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305008", "story_v_side_new_1109305.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305008", "story_v_side_new_1109305.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_32 = var_36_21 + 0.3
			local var_36_33 = math.max(var_36_22, arg_33_1.talkMaxDuration)

			if var_36_32 <= arg_33_1.time_ and arg_33_1.time_ < var_36_32 + var_36_33 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_32) / var_36_33

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_32 + var_36_33 and arg_33_1.time_ < var_36_32 + var_36_33 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1109305009
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1109305010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1093ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and not isNil(var_42_0) and arg_39_1.var_.characterEffect1093ui_story == nil then
				arg_39_1.var_.characterEffect1093ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 and not isNil(var_42_0) then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1093ui_story and not isNil(var_42_0) then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and not isNil(var_42_0) and arg_39_1.var_.characterEffect1093ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1093ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.1

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(1109305009)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 4
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
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_14 and arg_39_1.time_ < var_42_6 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1109305010
		arg_43_1.duration_ = 3

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1109305011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1093ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1093ui_story == nil then
				arg_43_1.var_.characterEffect1093ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 and not isNil(var_46_0) then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1093ui_story and not isNil(var_46_0) then
					arg_43_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1093ui_story then
				arg_43_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.3

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[73].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(1109305010)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 12
				local var_46_10 = utf8.len(var_46_8)
				local var_46_11 = var_46_9 <= 0 and var_46_5 or var_46_5 * (var_46_10 / var_46_9)

				if var_46_11 > 0 and var_46_5 < var_46_11 then
					arg_43_1.talkMaxDuration = var_46_11

					if var_46_11 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_11 + var_46_4
					end
				end

				arg_43_1.text_.text = var_46_8
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305010", "story_v_side_new_1109305.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305010", "story_v_side_new_1109305.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_side_new_1109305", "1109305010", "story_v_side_new_1109305.awb")

						arg_43_1:RecordAudio("1109305010", var_46_13)
						arg_43_1:RecordAudio("1109305010", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305010", "story_v_side_new_1109305.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305010", "story_v_side_new_1109305.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_5, arg_43_1.talkMaxDuration)

			if var_46_4 <= arg_43_1.time_ and arg_43_1.time_ < var_46_4 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_4) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_4 + var_46_14 and arg_43_1.time_ < var_46_4 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1109305011
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play1109305012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1093ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and not isNil(var_50_0) and arg_47_1.var_.characterEffect1093ui_story == nil then
				arg_47_1.var_.characterEffect1093ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 and not isNil(var_50_0) then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1093ui_story and not isNil(var_50_0) then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1093ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and not isNil(var_50_0) and arg_47_1.var_.characterEffect1093ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1093ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.9

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(1109305011)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 36
				local var_50_11 = utf8.len(var_50_9)
				local var_50_12 = var_50_10 <= 0 and var_50_7 or var_50_7 * (var_50_11 / var_50_10)

				if var_50_12 > 0 and var_50_7 < var_50_12 then
					arg_47_1.talkMaxDuration = var_50_12

					if var_50_12 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_9
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_13 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_13 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_13

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_13 and arg_47_1.time_ < var_50_6 + var_50_13 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1109305012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1109305013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.525

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(1109305012)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 21
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
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1109305013
		arg_55_1.duration_ = 7.7

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play1109305014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1093ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1093ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -1.11, -5.88)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1093ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1093ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and not isNil(var_58_9) and arg_55_1.var_.characterEffect1093ui_story == nil then
				arg_55_1.var_.characterEffect1093ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 and not isNil(var_58_9) then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1093ui_story and not isNil(var_58_9) then
					arg_55_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and not isNil(var_58_9) and arg_55_1.var_.characterEffect1093ui_story then
				arg_55_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action446")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_58_15 = 0
			local var_58_16 = 0.675

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[73].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(1109305013)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 27
				local var_58_21 = utf8.len(var_58_19)
				local var_58_22 = var_58_20 <= 0 and var_58_16 or var_58_16 * (var_58_21 / var_58_20)

				if var_58_22 > 0 and var_58_16 < var_58_22 then
					arg_55_1.talkMaxDuration = var_58_22

					if var_58_22 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_19
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305013", "story_v_side_new_1109305.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305013", "story_v_side_new_1109305.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_side_new_1109305", "1109305013", "story_v_side_new_1109305.awb")

						arg_55_1:RecordAudio("1109305013", var_58_24)
						arg_55_1:RecordAudio("1109305013", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305013", "story_v_side_new_1109305.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305013", "story_v_side_new_1109305.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_25 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_25 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_25

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_25 and arg_55_1.time_ < var_58_15 + var_58_25 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1109305014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play1109305015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1093ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and not isNil(var_62_0) and arg_59_1.var_.characterEffect1093ui_story == nil then
				arg_59_1.var_.characterEffect1093ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 and not isNil(var_62_0) then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1093ui_story and not isNil(var_62_0) then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1093ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and not isNil(var_62_0) and arg_59_1.var_.characterEffect1093ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1093ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.75

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(1109305014)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 30
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_14 and arg_59_1.time_ < var_62_6 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1109305015
		arg_63_1.duration_ = 6.07

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1109305016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1093ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1093ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -1.11, -5.88)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1093ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1093ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and not isNil(var_66_9) and arg_63_1.var_.characterEffect1093ui_story == nil then
				arg_63_1.var_.characterEffect1093ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 and not isNil(var_66_9) then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1093ui_story and not isNil(var_66_9) then
					arg_63_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and not isNil(var_66_9) and arg_63_1.var_.characterEffect1093ui_story then
				arg_63_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_66_13 = 0

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_66_14 = 0
			local var_66_15 = 0.625

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_16 = arg_63_1:FormatText(StoryNameCfg[73].name)

				arg_63_1.leftNameTxt_.text = var_66_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_17 = arg_63_1:GetWordFromCfg(1109305015)
				local var_66_18 = arg_63_1:FormatText(var_66_17.content)

				arg_63_1.text_.text = var_66_18

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_19 = 25
				local var_66_20 = utf8.len(var_66_18)
				local var_66_21 = var_66_19 <= 0 and var_66_15 or var_66_15 * (var_66_20 / var_66_19)

				if var_66_21 > 0 and var_66_15 < var_66_21 then
					arg_63_1.talkMaxDuration = var_66_21

					if var_66_21 + var_66_14 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_21 + var_66_14
					end
				end

				arg_63_1.text_.text = var_66_18
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305015", "story_v_side_new_1109305.awb") ~= 0 then
					local var_66_22 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305015", "story_v_side_new_1109305.awb") / 1000

					if var_66_22 + var_66_14 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_22 + var_66_14
					end

					if var_66_17.prefab_name ~= "" and arg_63_1.actors_[var_66_17.prefab_name] ~= nil then
						local var_66_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_17.prefab_name].transform, "story_v_side_new_1109305", "1109305015", "story_v_side_new_1109305.awb")

						arg_63_1:RecordAudio("1109305015", var_66_23)
						arg_63_1:RecordAudio("1109305015", var_66_23)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305015", "story_v_side_new_1109305.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305015", "story_v_side_new_1109305.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_24 = math.max(var_66_15, arg_63_1.talkMaxDuration)

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_24 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_14) / var_66_24

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_14 + var_66_24 and arg_63_1.time_ < var_66_14 + var_66_24 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1109305016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play1109305017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1093ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1093ui_story == nil then
				arg_67_1.var_.characterEffect1093ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 and not isNil(var_70_0) then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1093ui_story and not isNil(var_70_0) then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1093ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1093ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1093ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.7

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[7].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(1109305016)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 28
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
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_14 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_14 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_14

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_14 and arg_67_1.time_ < var_70_6 + var_70_14 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 1109305017
		arg_71_1.duration_ = 6.37

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play1109305018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1093ui_story"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1093ui_story = var_74_0.localPosition
			end

			local var_74_2 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2
				local var_74_4 = Vector3.New(0, -1.11, -5.88)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1093ui_story, var_74_4, var_74_3)

				local var_74_5 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_5.x, var_74_5.y, var_74_5.z)

				local var_74_6 = var_74_0.localEulerAngles

				var_74_6.z = 0
				var_74_6.x = 0
				var_74_0.localEulerAngles = var_74_6
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_74_7 = manager.ui.mainCamera.transform.position - var_74_0.position

				var_74_0.forward = Vector3.New(var_74_7.x, var_74_7.y, var_74_7.z)

				local var_74_8 = var_74_0.localEulerAngles

				var_74_8.z = 0
				var_74_8.x = 0
				var_74_0.localEulerAngles = var_74_8
			end

			local var_74_9 = arg_71_1.actors_["1093ui_story"]
			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 and not isNil(var_74_9) and arg_71_1.var_.characterEffect1093ui_story == nil then
				arg_71_1.var_.characterEffect1093ui_story = var_74_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_11 = 0.200000002980232

			if var_74_10 <= arg_71_1.time_ and arg_71_1.time_ < var_74_10 + var_74_11 and not isNil(var_74_9) then
				local var_74_12 = (arg_71_1.time_ - var_74_10) / var_74_11

				if arg_71_1.var_.characterEffect1093ui_story and not isNil(var_74_9) then
					arg_71_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_10 + var_74_11 and arg_71_1.time_ < var_74_10 + var_74_11 + arg_74_0 and not isNil(var_74_9) and arg_71_1.var_.characterEffect1093ui_story then
				arg_71_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_74_13 = 0

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_14 = 0.200000002980232
			local var_74_15 = 0.625

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_16 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_16:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_16:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_16:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_17 = arg_71_1:FormatText(StoryNameCfg[73].name)

				arg_71_1.leftNameTxt_.text = var_74_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_18 = arg_71_1:GetWordFromCfg(1109305017)
				local var_74_19 = arg_71_1:FormatText(var_74_18.content)

				arg_71_1.text_.text = var_74_19

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_20 = 24
				local var_74_21 = utf8.len(var_74_19)
				local var_74_22 = var_74_20 <= 0 and var_74_15 or var_74_15 * (var_74_21 / var_74_20)

				if var_74_22 > 0 and var_74_15 < var_74_22 then
					arg_71_1.talkMaxDuration = var_74_22
					var_74_14 = var_74_14 + 0.3

					if var_74_22 + var_74_14 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_22 + var_74_14
					end
				end

				arg_71_1.text_.text = var_74_19
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305017", "story_v_side_new_1109305.awb") ~= 0 then
					local var_74_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305017", "story_v_side_new_1109305.awb") / 1000

					if var_74_23 + var_74_14 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_23 + var_74_14
					end

					if var_74_18.prefab_name ~= "" and arg_71_1.actors_[var_74_18.prefab_name] ~= nil then
						local var_74_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_18.prefab_name].transform, "story_v_side_new_1109305", "1109305017", "story_v_side_new_1109305.awb")

						arg_71_1:RecordAudio("1109305017", var_74_24)
						arg_71_1:RecordAudio("1109305017", var_74_24)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305017", "story_v_side_new_1109305.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305017", "story_v_side_new_1109305.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_25 = var_74_14 + 0.3
			local var_74_26 = math.max(var_74_15, arg_71_1.talkMaxDuration)

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_25) / var_74_26

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1109305018
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1109305019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1093ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and not isNil(var_80_0) and arg_77_1.var_.characterEffect1093ui_story == nil then
				arg_77_1.var_.characterEffect1093ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 and not isNil(var_80_0) then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1093ui_story and not isNil(var_80_0) then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1093ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and not isNil(var_80_0) and arg_77_1.var_.characterEffect1093ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1093ui_story.fillRatio = var_80_5
			end

			local var_80_6 = 0
			local var_80_7 = 0.125

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[7].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(1109305018)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 5
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_7 or var_80_7 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_7 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_14 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_14 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_14

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_14 and arg_77_1.time_ < var_80_6 + var_80_14 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1109305019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1109305020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1093ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1093ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0, 100, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1093ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, 100, 0)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = 0
			local var_84_10 = 0.8

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_11 = arg_81_1:GetWordFromCfg(1109305019)
				local var_84_12 = arg_81_1:FormatText(var_84_11.content)

				arg_81_1.text_.text = var_84_12

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_13 = 32
				local var_84_14 = utf8.len(var_84_12)
				local var_84_15 = var_84_13 <= 0 and var_84_10 or var_84_10 * (var_84_14 / var_84_13)

				if var_84_15 > 0 and var_84_10 < var_84_15 then
					arg_81_1.talkMaxDuration = var_84_15

					if var_84_15 + var_84_9 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_15 + var_84_9
					end
				end

				arg_81_1.text_.text = var_84_12
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_16 = math.max(var_84_10, arg_81_1.talkMaxDuration)

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_16 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_9) / var_84_16

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_9 + var_84_16 and arg_81_1.time_ < var_84_9 + var_84_16 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1109305020
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1109305021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.125

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[7].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(1109305020)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 5
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_8 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_8 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_8

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_8 and arg_85_1.time_ < var_88_0 + var_88_8 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1109305021
		arg_89_1.duration_ = 1

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1109305022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.075

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[73].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_89_1.callingController_:SetSelectedState("normal")

				arg_89_1.keyicon_.color = Color.New(1, 1, 1)
				arg_89_1.icon_.color = Color.New(1, 1, 1)

				local var_92_3 = arg_89_1:GetWordFromCfg(1109305021)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 3
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305021", "story_v_side_new_1109305.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305021", "story_v_side_new_1109305.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_side_new_1109305", "1109305021", "story_v_side_new_1109305.awb")

						arg_89_1:RecordAudio("1109305021", var_92_9)
						arg_89_1:RecordAudio("1109305021", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305021", "story_v_side_new_1109305.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305021", "story_v_side_new_1109305.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1109305022
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1109305023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.25

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(1109305022)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 10
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_8 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_8 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_8

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_8 and arg_93_1.time_ < var_96_0 + var_96_8 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1109305023
		arg_97_1.duration_ = 3.4

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1109305024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.325

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[73].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_97_1.callingController_:SetSelectedState("normal")

				arg_97_1.keyicon_.color = Color.New(1, 1, 1)
				arg_97_1.icon_.color = Color.New(1, 1, 1)

				local var_100_3 = arg_97_1:GetWordFromCfg(1109305023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 13
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305023", "story_v_side_new_1109305.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305023", "story_v_side_new_1109305.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_side_new_1109305", "1109305023", "story_v_side_new_1109305.awb")

						arg_97_1:RecordAudio("1109305023", var_100_9)
						arg_97_1:RecordAudio("1109305023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305023", "story_v_side_new_1109305.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305023", "story_v_side_new_1109305.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1109305024
		arg_101_1.duration_ = 0.77

		SetActive(arg_101_1.tipsGo_, true)

		arg_101_1.tipsText_.text = StoryTipsCfg[109301].name

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"

			SetActive(arg_101_1.choicesGo_, true)

			for iter_102_0, iter_102_1 in ipairs(arg_101_1.choices_) do
				local var_102_0 = iter_102_0 <= 2

				SetActive(iter_102_1.go, var_102_0)
			end

			arg_101_1.choices_[1].txt.text = arg_101_1:FormatText(StoryChoiceCfg[1027].name)
			arg_101_1.choices_[2].txt.text = arg_101_1:FormatText(StoryChoiceCfg[1028].name)
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play1109305025(arg_101_1)
			end

			if arg_103_0 == 2 then
				PlayerAction.UseStoryTrigger(1093011, 210930105, 1109305024, 2)
				arg_101_0:Play1109305025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1093ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and not isNil(var_104_0) and arg_101_1.var_.characterEffect1093ui_story == nil then
				arg_101_1.var_.characterEffect1093ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.3

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 and not isNil(var_104_0) then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1093ui_story and not isNil(var_104_0) then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1093ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and not isNil(var_104_0) and arg_101_1.var_.characterEffect1093ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1093ui_story.fillRatio = var_104_5
			end
		end
	end,
	Play1109305025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1109305025
		arg_105_1.duration_ = 3.53

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1109305026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1093ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1093ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, -1.11, -5.88)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1093ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1093ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and not isNil(var_108_9) and arg_105_1.var_.characterEffect1093ui_story == nil then
				arg_105_1.var_.characterEffect1093ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 and not isNil(var_108_9) then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1093ui_story and not isNil(var_108_9) then
					arg_105_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and not isNil(var_108_9) and arg_105_1.var_.characterEffect1093ui_story then
				arg_105_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_108_13 = "1093ui_story"

			if arg_105_1.actors_[var_108_13] == nil then
				local var_108_14 = Asset.Load("Char/" .. "1093ui_story")

				if not isNil(var_108_14) then
					local var_108_15 = Object.Instantiate(Asset.Load("Char/" .. "1093ui_story"), arg_105_1.stage_.transform)

					var_108_15.name = var_108_13
					var_108_15.transform.localPosition = Vector3.New(0, 100, 0)
					arg_105_1.actors_[var_108_13] = var_108_15

					local var_108_16 = var_108_15:GetComponentInChildren(typeof(CharacterEffect))

					var_108_16.enabled = true

					local var_108_17 = GameObjectTools.GetOrAddComponent(var_108_15, typeof(DynamicBoneHelper))

					if var_108_17 then
						var_108_17:EnableDynamicBone(false)
					end

					arg_105_1:ShowWeapon(var_108_16.transform, false)

					arg_105_1.var_[var_108_13 .. "Animator"] = var_108_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_105_1.var_[var_108_13 .. "Animator"].applyRootMotion = true
					arg_105_1.var_[var_108_13 .. "LipSync"] = var_108_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_108_18 = 0

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 then
				arg_105_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_108_19 = "1093ui_story"

			if arg_105_1.actors_[var_108_19] == nil then
				local var_108_20 = Asset.Load("Char/" .. "1093ui_story")

				if not isNil(var_108_20) then
					local var_108_21 = Object.Instantiate(Asset.Load("Char/" .. "1093ui_story"), arg_105_1.stage_.transform)

					var_108_21.name = var_108_19
					var_108_21.transform.localPosition = Vector3.New(0, 100, 0)
					arg_105_1.actors_[var_108_19] = var_108_21

					local var_108_22 = var_108_21:GetComponentInChildren(typeof(CharacterEffect))

					var_108_22.enabled = true

					local var_108_23 = GameObjectTools.GetOrAddComponent(var_108_21, typeof(DynamicBoneHelper))

					if var_108_23 then
						var_108_23:EnableDynamicBone(false)
					end

					arg_105_1:ShowWeapon(var_108_22.transform, false)

					arg_105_1.var_[var_108_19 .. "Animator"] = var_108_22.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_105_1.var_[var_108_19 .. "Animator"].applyRootMotion = true
					arg_105_1.var_[var_108_19 .. "LipSync"] = var_108_22.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_108_24 = 0

			if var_108_24 < arg_105_1.time_ and arg_105_1.time_ <= var_108_24 + arg_108_0 then
				arg_105_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_108_25 = 0
			local var_108_26 = 0.375

			if var_108_25 < arg_105_1.time_ and arg_105_1.time_ <= var_108_25 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_27 = arg_105_1:FormatText(StoryNameCfg[73].name)

				arg_105_1.leftNameTxt_.text = var_108_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_28 = arg_105_1:GetWordFromCfg(1109305025)
				local var_108_29 = arg_105_1:FormatText(var_108_28.content)

				arg_105_1.text_.text = var_108_29

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_30 = 15
				local var_108_31 = utf8.len(var_108_29)
				local var_108_32 = var_108_30 <= 0 and var_108_26 or var_108_26 * (var_108_31 / var_108_30)

				if var_108_32 > 0 and var_108_26 < var_108_32 then
					arg_105_1.talkMaxDuration = var_108_32

					if var_108_32 + var_108_25 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_32 + var_108_25
					end
				end

				arg_105_1.text_.text = var_108_29
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305025", "story_v_side_new_1109305.awb") ~= 0 then
					local var_108_33 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305025", "story_v_side_new_1109305.awb") / 1000

					if var_108_33 + var_108_25 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_33 + var_108_25
					end

					if var_108_28.prefab_name ~= "" and arg_105_1.actors_[var_108_28.prefab_name] ~= nil then
						local var_108_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_28.prefab_name].transform, "story_v_side_new_1109305", "1109305025", "story_v_side_new_1109305.awb")

						arg_105_1:RecordAudio("1109305025", var_108_34)
						arg_105_1:RecordAudio("1109305025", var_108_34)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305025", "story_v_side_new_1109305.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305025", "story_v_side_new_1109305.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_35 = math.max(var_108_26, arg_105_1.talkMaxDuration)

			if var_108_25 <= arg_105_1.time_ and arg_105_1.time_ < var_108_25 + var_108_35 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_25) / var_108_35

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_25 + var_108_35 and arg_105_1.time_ < var_108_25 + var_108_35 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1109305026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1109305027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1093ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1093ui_story == nil then
				arg_109_1.var_.characterEffect1093ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 and not isNil(var_112_0) then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1093ui_story and not isNil(var_112_0) then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1093ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1093ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1093ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.35

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

				local var_112_9 = arg_109_1:GetWordFromCfg(1109305026)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 14
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
	Play1109305027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1109305027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1109305028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.5

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

				local var_116_3 = arg_113_1:GetWordFromCfg(1109305027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 20
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
	Play1109305028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1109305028
		arg_117_1.duration_ = 4.97

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1109305029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1093ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1093ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, -1.11, -5.88)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1093ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1093ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and not isNil(var_120_9) and arg_117_1.var_.characterEffect1093ui_story == nil then
				arg_117_1.var_.characterEffect1093ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 and not isNil(var_120_9) then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1093ui_story and not isNil(var_120_9) then
					arg_117_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and not isNil(var_120_9) and arg_117_1.var_.characterEffect1093ui_story then
				arg_117_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_2")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_15 = 0
			local var_120_16 = 0.5

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[73].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(1109305028)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 20
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305028", "story_v_side_new_1109305.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305028", "story_v_side_new_1109305.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_side_new_1109305", "1109305028", "story_v_side_new_1109305.awb")

						arg_117_1:RecordAudio("1109305028", var_120_24)
						arg_117_1:RecordAudio("1109305028", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305028", "story_v_side_new_1109305.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305028", "story_v_side_new_1109305.awb")
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
	Play1109305029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1109305029
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1109305030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1093ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and not isNil(var_124_0) and arg_121_1.var_.characterEffect1093ui_story == nil then
				arg_121_1.var_.characterEffect1093ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 and not isNil(var_124_0) then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1093ui_story and not isNil(var_124_0) then
					local var_124_4 = Mathf.Lerp(0, 0.5, var_124_3)

					arg_121_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1093ui_story.fillRatio = var_124_4
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and not isNil(var_124_0) and arg_121_1.var_.characterEffect1093ui_story then
				local var_124_5 = 0.5

				arg_121_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1093ui_story.fillRatio = var_124_5
			end

			local var_124_6 = 0
			local var_124_7 = 0.525

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_8 = arg_121_1:FormatText(StoryNameCfg[7].name)

				arg_121_1.leftNameTxt_.text = var_124_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_9 = arg_121_1:GetWordFromCfg(1109305029)
				local var_124_10 = arg_121_1:FormatText(var_124_9.content)

				arg_121_1.text_.text = var_124_10

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_11 = 21
				local var_124_12 = utf8.len(var_124_10)
				local var_124_13 = var_124_11 <= 0 and var_124_7 or var_124_7 * (var_124_12 / var_124_11)

				if var_124_13 > 0 and var_124_7 < var_124_13 then
					arg_121_1.talkMaxDuration = var_124_13

					if var_124_13 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_13 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_10
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_14 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_14 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_14

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_14 and arg_121_1.time_ < var_124_6 + var_124_14 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1109305030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1109305031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1093ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1093ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, 100, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1093ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, 100, 0)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = 0
			local var_128_10 = 0.9

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_11 = arg_125_1:GetWordFromCfg(1109305030)
				local var_128_12 = arg_125_1:FormatText(var_128_11.content)

				arg_125_1.text_.text = var_128_12

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_13 = 36
				local var_128_14 = utf8.len(var_128_12)
				local var_128_15 = var_128_13 <= 0 and var_128_10 or var_128_10 * (var_128_14 / var_128_13)

				if var_128_15 > 0 and var_128_10 < var_128_15 then
					arg_125_1.talkMaxDuration = var_128_15

					if var_128_15 + var_128_9 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_15 + var_128_9
					end
				end

				arg_125_1.text_.text = var_128_12
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_16 = math.max(var_128_10, arg_125_1.talkMaxDuration)

			if var_128_9 <= arg_125_1.time_ and arg_125_1.time_ < var_128_9 + var_128_16 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_9) / var_128_16

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_9 + var_128_16 and arg_125_1.time_ < var_128_9 + var_128_16 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1109305031
		arg_129_1.duration_ = 8.97

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1109305032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1093ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1093ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -1.11, -5.88)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1093ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1093ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and not isNil(var_132_9) and arg_129_1.var_.characterEffect1093ui_story == nil then
				arg_129_1.var_.characterEffect1093ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 and not isNil(var_132_9) then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1093ui_story and not isNil(var_132_9) then
					arg_129_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and not isNil(var_132_9) and arg_129_1.var_.characterEffect1093ui_story then
				arg_129_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.75

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[73].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(1109305031)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 30
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305031", "story_v_side_new_1109305.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305031", "story_v_side_new_1109305.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_side_new_1109305", "1109305031", "story_v_side_new_1109305.awb")

						arg_129_1:RecordAudio("1109305031", var_132_24)
						arg_129_1:RecordAudio("1109305031", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305031", "story_v_side_new_1109305.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305031", "story_v_side_new_1109305.awb")
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
	Play1109305032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1109305032
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1109305033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1093ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect1093ui_story == nil then
				arg_133_1.var_.characterEffect1093ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 and not isNil(var_136_0) then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1093ui_story and not isNil(var_136_0) then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1093ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect1093ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1093ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.4

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

				local var_136_9 = arg_133_1:GetWordFromCfg(1109305032)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 16
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
	Play1109305033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1109305033
		arg_137_1.duration_ = 7.27

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1109305034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1093ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.characterEffect1093ui_story == nil then
				arg_137_1.var_.characterEffect1093ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 and not isNil(var_140_0) then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1093ui_story and not isNil(var_140_0) then
					arg_137_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.characterEffect1093ui_story then
				arg_137_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_140_4 = 0
			local var_140_5 = 0.675

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_6 = arg_137_1:FormatText(StoryNameCfg[73].name)

				arg_137_1.leftNameTxt_.text = var_140_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_7 = arg_137_1:GetWordFromCfg(1109305033)
				local var_140_8 = arg_137_1:FormatText(var_140_7.content)

				arg_137_1.text_.text = var_140_8

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_9 = 27
				local var_140_10 = utf8.len(var_140_8)
				local var_140_11 = var_140_9 <= 0 and var_140_5 or var_140_5 * (var_140_10 / var_140_9)

				if var_140_11 > 0 and var_140_5 < var_140_11 then
					arg_137_1.talkMaxDuration = var_140_11

					if var_140_11 + var_140_4 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_11 + var_140_4
					end
				end

				arg_137_1.text_.text = var_140_8
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305033", "story_v_side_new_1109305.awb") ~= 0 then
					local var_140_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305033", "story_v_side_new_1109305.awb") / 1000

					if var_140_12 + var_140_4 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_12 + var_140_4
					end

					if var_140_7.prefab_name ~= "" and arg_137_1.actors_[var_140_7.prefab_name] ~= nil then
						local var_140_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_7.prefab_name].transform, "story_v_side_new_1109305", "1109305033", "story_v_side_new_1109305.awb")

						arg_137_1:RecordAudio("1109305033", var_140_13)
						arg_137_1:RecordAudio("1109305033", var_140_13)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305033", "story_v_side_new_1109305.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305033", "story_v_side_new_1109305.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_14 = math.max(var_140_5, arg_137_1.talkMaxDuration)

			if var_140_4 <= arg_137_1.time_ and arg_137_1.time_ < var_140_4 + var_140_14 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_4) / var_140_14

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_4 + var_140_14 and arg_137_1.time_ < var_140_4 + var_140_14 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1109305034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1109305035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1093ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.characterEffect1093ui_story == nil then
				arg_141_1.var_.characterEffect1093ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 and not isNil(var_144_0) then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1093ui_story and not isNil(var_144_0) then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1093ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.characterEffect1093ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1093ui_story.fillRatio = var_144_5
			end

			local var_144_6 = 0
			local var_144_7 = 0.675

			if var_144_6 < arg_141_1.time_ and arg_141_1.time_ <= var_144_6 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_8 = arg_141_1:FormatText(StoryNameCfg[7].name)

				arg_141_1.leftNameTxt_.text = var_144_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_9 = arg_141_1:GetWordFromCfg(1109305034)
				local var_144_10 = arg_141_1:FormatText(var_144_9.content)

				arg_141_1.text_.text = var_144_10

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_11 = 27
				local var_144_12 = utf8.len(var_144_10)
				local var_144_13 = var_144_11 <= 0 and var_144_7 or var_144_7 * (var_144_12 / var_144_11)

				if var_144_13 > 0 and var_144_7 < var_144_13 then
					arg_141_1.talkMaxDuration = var_144_13

					if var_144_13 + var_144_6 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_13 + var_144_6
					end
				end

				arg_141_1.text_.text = var_144_10
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_14 = math.max(var_144_7, arg_141_1.talkMaxDuration)

			if var_144_6 <= arg_141_1.time_ and arg_141_1.time_ < var_144_6 + var_144_14 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_6) / var_144_14

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_6 + var_144_14 and arg_141_1.time_ < var_144_6 + var_144_14 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1109305035
		arg_145_1.duration_ = 5.67

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1109305036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = "STblack"

			if arg_145_1.bgs_[var_148_0] == nil then
				local var_148_1 = Object.Instantiate(arg_145_1.paintGo_)

				var_148_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_148_0)
				var_148_1.name = var_148_0
				var_148_1.transform.parent = arg_145_1.stage_.transform
				var_148_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_145_1.bgs_[var_148_0] = var_148_1
			end

			local var_148_2 = 0

			if var_148_2 < arg_145_1.time_ and arg_145_1.time_ <= var_148_2 + arg_148_0 then
				local var_148_3 = manager.ui.mainCamera.transform.localPosition
				local var_148_4 = Vector3.New(0, 0, 10) + Vector3.New(var_148_3.x, var_148_3.y, 0)
				local var_148_5 = arg_145_1.bgs_.STblack

				var_148_5.transform.localPosition = var_148_4
				var_148_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_148_6 = var_148_5:GetComponent("SpriteRenderer")

				if var_148_6 and var_148_6.sprite then
					local var_148_7 = (var_148_5.transform.localPosition - var_148_3).z
					local var_148_8 = manager.ui.mainCameraCom_
					local var_148_9 = 2 * var_148_7 * Mathf.Tan(var_148_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_148_10 = var_148_9 * var_148_8.aspect
					local var_148_11 = var_148_6.sprite.bounds.size.x
					local var_148_12 = var_148_6.sprite.bounds.size.y
					local var_148_13 = var_148_10 / var_148_11
					local var_148_14 = var_148_9 / var_148_12
					local var_148_15 = var_148_14 < var_148_13 and var_148_13 or var_148_14

					var_148_5.transform.localScale = Vector3.New(var_148_15, var_148_15, 0)
				end

				for iter_148_0, iter_148_1 in pairs(arg_145_1.bgs_) do
					if iter_148_0 ~= "STblack" then
						iter_148_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_148_16 = 0

			if var_148_16 < arg_145_1.time_ and arg_145_1.time_ <= var_148_16 + arg_148_0 then
				arg_145_1.allBtn_.enabled = false
			end

			local var_148_17 = 0.3

			if arg_145_1.time_ >= var_148_16 + var_148_17 and arg_145_1.time_ < var_148_16 + var_148_17 + arg_148_0 then
				arg_145_1.allBtn_.enabled = true
			end

			local var_148_18 = 0

			if var_148_18 < arg_145_1.time_ and arg_145_1.time_ <= var_148_18 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_19 = 0.200000002980232

			if var_148_18 <= arg_145_1.time_ and arg_145_1.time_ < var_148_18 + var_148_19 then
				local var_148_20 = (arg_145_1.time_ - var_148_18) / var_148_19
				local var_148_21 = Color.New(0.8773585, 0.87322, 0.87322)

				var_148_21.a = Mathf.Lerp(1, 0, var_148_20)
				arg_145_1.mask_.color = var_148_21
			end

			if arg_145_1.time_ >= var_148_18 + var_148_19 and arg_145_1.time_ < var_148_18 + var_148_19 + arg_148_0 then
				local var_148_22 = Color.New(0.8773585, 0.87322, 0.87322)
				local var_148_23 = 0

				arg_145_1.mask_.enabled = false
				var_148_22.a = var_148_23
				arg_145_1.mask_.color = var_148_22
			end

			local var_148_24 = arg_145_1.actors_["1093ui_story"].transform
			local var_148_25 = 0

			if var_148_25 < arg_145_1.time_ and arg_145_1.time_ <= var_148_25 + arg_148_0 then
				arg_145_1.var_.moveOldPos1093ui_story = var_148_24.localPosition
			end

			local var_148_26 = 0.001

			if var_148_25 <= arg_145_1.time_ and arg_145_1.time_ < var_148_25 + var_148_26 then
				local var_148_27 = (arg_145_1.time_ - var_148_25) / var_148_26
				local var_148_28 = Vector3.New(0, 100, 0)

				var_148_24.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1093ui_story, var_148_28, var_148_27)

				local var_148_29 = manager.ui.mainCamera.transform.position - var_148_24.position

				var_148_24.forward = Vector3.New(var_148_29.x, var_148_29.y, var_148_29.z)

				local var_148_30 = var_148_24.localEulerAngles

				var_148_30.z = 0
				var_148_30.x = 0
				var_148_24.localEulerAngles = var_148_30
			end

			if arg_145_1.time_ >= var_148_25 + var_148_26 and arg_145_1.time_ < var_148_25 + var_148_26 + arg_148_0 then
				var_148_24.localPosition = Vector3.New(0, 100, 0)

				local var_148_31 = manager.ui.mainCamera.transform.position - var_148_24.position

				var_148_24.forward = Vector3.New(var_148_31.x, var_148_31.y, var_148_31.z)

				local var_148_32 = var_148_24.localEulerAngles

				var_148_32.z = 0
				var_148_32.x = 0
				var_148_24.localEulerAngles = var_148_32
			end

			local var_148_33 = arg_145_1.actors_["1093ui_story"]
			local var_148_34 = 0

			if var_148_34 < arg_145_1.time_ and arg_145_1.time_ <= var_148_34 + arg_148_0 and not isNil(var_148_33) and arg_145_1.var_.characterEffect1093ui_story == nil then
				arg_145_1.var_.characterEffect1093ui_story = var_148_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_35 = 0.200000002980232

			if var_148_34 <= arg_145_1.time_ and arg_145_1.time_ < var_148_34 + var_148_35 and not isNil(var_148_33) then
				local var_148_36 = (arg_145_1.time_ - var_148_34) / var_148_35

				if arg_145_1.var_.characterEffect1093ui_story and not isNil(var_148_33) then
					local var_148_37 = Mathf.Lerp(0, 0.5, var_148_36)

					arg_145_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1093ui_story.fillRatio = var_148_37
				end
			end

			if arg_145_1.time_ >= var_148_34 + var_148_35 and arg_145_1.time_ < var_148_34 + var_148_35 + arg_148_0 and not isNil(var_148_33) and arg_145_1.var_.characterEffect1093ui_story then
				local var_148_38 = 0.5

				arg_145_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1093ui_story.fillRatio = var_148_38
			end

			local var_148_39 = 0
			local var_148_40 = 1

			if var_148_39 < arg_145_1.time_ and arg_145_1.time_ <= var_148_39 + arg_148_0 then
				local var_148_41 = "play"
				local var_148_42 = "effect"

				arg_145_1:AudioAction(var_148_41, var_148_42, "ui_skip", "ui_bgm_mute", "")
			end

			local var_148_43 = 0.034000001847744
			local var_148_44 = 1

			if var_148_43 < arg_145_1.time_ and arg_145_1.time_ <= var_148_43 + arg_148_0 then
				local var_148_45 = "play"
				local var_148_46 = "effect"

				arg_145_1:AudioAction(var_148_45, var_148_46, "se_story_side_1093", "se_story_side_1093_poweroff", "")
			end

			if arg_145_1.frameCnt_ <= 1 then
				arg_145_1.dialog_:SetActive(false)
			end

			local var_148_47 = 0.666666666666667
			local var_148_48 = 1.05

			if var_148_47 < arg_145_1.time_ and arg_145_1.time_ <= var_148_47 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0

				arg_145_1.dialog_:SetActive(true)

				local var_148_49 = LeanTween.value(arg_145_1.dialog_, 0, 1, 0.3)

				var_148_49:setOnUpdate(LuaHelper.FloatAction(function(arg_149_0)
					arg_145_1.dialogCg_.alpha = arg_149_0
				end))
				var_148_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_145_1.dialog_)
					var_148_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_145_1.duration_ = arg_145_1.duration_ + 0.3

				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_50 = arg_145_1:GetWordFromCfg(1109305035)
				local var_148_51 = arg_145_1:FormatText(var_148_50.content)

				arg_145_1.text_.text = var_148_51

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_52 = 42
				local var_148_53 = utf8.len(var_148_51)
				local var_148_54 = var_148_52 <= 0 and var_148_48 or var_148_48 * (var_148_53 / var_148_52)

				if var_148_54 > 0 and var_148_48 < var_148_54 then
					arg_145_1.talkMaxDuration = var_148_54
					var_148_47 = var_148_47 + 0.3

					if var_148_54 + var_148_47 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_54 + var_148_47
					end
				end

				arg_145_1.text_.text = var_148_51
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_55 = var_148_47 + 0.3
			local var_148_56 = math.max(var_148_48, arg_145_1.talkMaxDuration)

			if var_148_55 <= arg_145_1.time_ and arg_145_1.time_ < var_148_55 + var_148_56 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_55) / var_148_56

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_55 + var_148_56 and arg_145_1.time_ < var_148_55 + var_148_56 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 1109305036
		arg_151_1.duration_ = 2.6

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play1109305037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.225

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[73].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, true)
				arg_151_1.iconController_:SetSelectedState("hero")

				arg_151_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_151_1.callingController_:SetSelectedState("normal")

				arg_151_1.keyicon_.color = Color.New(1, 1, 1)
				arg_151_1.icon_.color = Color.New(1, 1, 1)

				local var_154_3 = arg_151_1:GetWordFromCfg(1109305036)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 9
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305036", "story_v_side_new_1109305.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305036", "story_v_side_new_1109305.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_side_new_1109305", "1109305036", "story_v_side_new_1109305.awb")

						arg_151_1:RecordAudio("1109305036", var_154_9)
						arg_151_1:RecordAudio("1109305036", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305036", "story_v_side_new_1109305.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305036", "story_v_side_new_1109305.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 1109305037
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play1109305038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.775

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_2 = arg_155_1:GetWordFromCfg(1109305037)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 31
				local var_158_5 = utf8.len(var_158_3)
				local var_158_6 = var_158_4 <= 0 and var_158_1 or var_158_1 * (var_158_5 / var_158_4)

				if var_158_6 > 0 and var_158_1 < var_158_6 then
					arg_155_1.talkMaxDuration = var_158_6

					if var_158_6 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_6 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_3
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_7 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_7 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_7

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_7 and arg_155_1.time_ < var_158_0 + var_158_7 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 1109305038
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play1109305039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.5

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[7].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(1109305038)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 20
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_8 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_8 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_8

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_8 and arg_159_1.time_ < var_162_0 + var_162_8 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1109305039
		arg_163_1.duration_ = 3.9

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play1109305040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.375

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[73].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, true)
				arg_163_1.iconController_:SetSelectedState("hero")

				arg_163_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_163_1.callingController_:SetSelectedState("normal")

				arg_163_1.keyicon_.color = Color.New(1, 1, 1)
				arg_163_1.icon_.color = Color.New(1, 1, 1)

				local var_166_3 = arg_163_1:GetWordFromCfg(1109305039)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 15
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305039", "story_v_side_new_1109305.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305039", "story_v_side_new_1109305.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_side_new_1109305", "1109305039", "story_v_side_new_1109305.awb")

						arg_163_1:RecordAudio("1109305039", var_166_9)
						arg_163_1:RecordAudio("1109305039", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305039", "story_v_side_new_1109305.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305039", "story_v_side_new_1109305.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 1109305040
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play1109305041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.475

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[7].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(1109305040)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 19
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_8 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_8 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_8

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_8 and arg_167_1.time_ < var_170_0 + var_170_8 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 1109305041
		arg_171_1.duration_ = 5.3

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play1109305042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.575

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[73].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_171_1.callingController_:SetSelectedState("normal")

				arg_171_1.keyicon_.color = Color.New(1, 1, 1)
				arg_171_1.icon_.color = Color.New(1, 1, 1)

				local var_174_3 = arg_171_1:GetWordFromCfg(1109305041)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 23
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305041", "story_v_side_new_1109305.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305041", "story_v_side_new_1109305.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_side_new_1109305", "1109305041", "story_v_side_new_1109305.awb")

						arg_171_1:RecordAudio("1109305041", var_174_9)
						arg_171_1:RecordAudio("1109305041", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305041", "story_v_side_new_1109305.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305041", "story_v_side_new_1109305.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 1109305042
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play1109305043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.525

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[7].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(1109305042)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 21
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_8 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_8 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_8

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_8 and arg_175_1.time_ < var_178_0 + var_178_8 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 1109305043
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play1109305044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.55

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

				local var_182_2 = arg_179_1:GetWordFromCfg(1109305043)
				local var_182_3 = arg_179_1:FormatText(var_182_2.content)

				arg_179_1.text_.text = var_182_3

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_4 = 22
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
	Play1109305044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 1109305044
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play1109305045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.4

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[7].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(1109305044)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 16
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_8 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_8 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_8

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_8 and arg_183_1.time_ < var_186_0 + var_186_8 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 1109305045
		arg_187_1.duration_ = 6.9

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play1109305046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				local var_190_1 = manager.ui.mainCamera.transform.localPosition
				local var_190_2 = Vector3.New(0, 0, 10) + Vector3.New(var_190_1.x, var_190_1.y, 0)
				local var_190_3 = arg_187_1.bgs_.ST06b

				var_190_3.transform.localPosition = var_190_2
				var_190_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_190_4 = var_190_3:GetComponent("SpriteRenderer")

				if var_190_4 and var_190_4.sprite then
					local var_190_5 = (var_190_3.transform.localPosition - var_190_1).z
					local var_190_6 = manager.ui.mainCameraCom_
					local var_190_7 = 2 * var_190_5 * Mathf.Tan(var_190_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_190_8 = var_190_7 * var_190_6.aspect
					local var_190_9 = var_190_4.sprite.bounds.size.x
					local var_190_10 = var_190_4.sprite.bounds.size.y
					local var_190_11 = var_190_8 / var_190_9
					local var_190_12 = var_190_7 / var_190_10
					local var_190_13 = var_190_12 < var_190_11 and var_190_11 or var_190_12

					var_190_3.transform.localScale = Vector3.New(var_190_13, var_190_13, 0)
				end

				for iter_190_0, iter_190_1 in pairs(arg_187_1.bgs_) do
					if iter_190_0 ~= "ST06b" then
						iter_190_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_15 = 2

			if var_190_14 <= arg_187_1.time_ and arg_187_1.time_ < var_190_14 + var_190_15 then
				local var_190_16 = (arg_187_1.time_ - var_190_14) / var_190_15
				local var_190_17 = Color.New(0, 0, 0)

				var_190_17.a = Mathf.Lerp(1, 0, var_190_16)
				arg_187_1.mask_.color = var_190_17
			end

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 then
				local var_190_18 = Color.New(0, 0, 0)
				local var_190_19 = 0

				arg_187_1.mask_.enabled = false
				var_190_18.a = var_190_19
				arg_187_1.mask_.color = var_190_18
			end

			local var_190_20 = 0.9
			local var_190_21 = 1

			if var_190_20 < arg_187_1.time_ and arg_187_1.time_ <= var_190_20 + arg_190_0 then
				local var_190_22 = "play"
				local var_190_23 = "effect"

				arg_187_1:AudioAction(var_190_22, var_190_23, "ui_skip", "ui_reset", "")
			end

			local var_190_24 = 0
			local var_190_25 = 1

			if var_190_24 < arg_187_1.time_ and arg_187_1.time_ <= var_190_24 + arg_190_0 then
				local var_190_26 = "play"
				local var_190_27 = "effect"

				arg_187_1:AudioAction(var_190_26, var_190_27, "se_story_side_1093", "se_story_side_1093_poweron", "")
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_28 = 1.9
			local var_190_29 = 0.525

			if var_190_28 < arg_187_1.time_ and arg_187_1.time_ <= var_190_28 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_30 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_30:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_31 = arg_187_1:GetWordFromCfg(1109305045)
				local var_190_32 = arg_187_1:FormatText(var_190_31.content)

				arg_187_1.text_.text = var_190_32

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_33 = 21
				local var_190_34 = utf8.len(var_190_32)
				local var_190_35 = var_190_33 <= 0 and var_190_29 or var_190_29 * (var_190_34 / var_190_33)

				if var_190_35 > 0 and var_190_29 < var_190_35 then
					arg_187_1.talkMaxDuration = var_190_35
					var_190_28 = var_190_28 + 0.3

					if var_190_35 + var_190_28 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_35 + var_190_28
					end
				end

				arg_187_1.text_.text = var_190_32
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_36 = var_190_28 + 0.3
			local var_190_37 = math.max(var_190_29, arg_187_1.talkMaxDuration)

			if var_190_36 <= arg_187_1.time_ and arg_187_1.time_ < var_190_36 + var_190_37 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_36) / var_190_37

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_36 + var_190_37 and arg_187_1.time_ < var_190_36 + var_190_37 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1109305046
		arg_193_1.duration_ = 6.77

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1109305047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1093ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1093ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, -1.11, -5.88)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1093ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1093ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and not isNil(var_196_9) and arg_193_1.var_.characterEffect1093ui_story == nil then
				arg_193_1.var_.characterEffect1093ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 and not isNil(var_196_9) then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1093ui_story and not isNil(var_196_9) then
					arg_193_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and not isNil(var_196_9) and arg_193_1.var_.characterEffect1093ui_story then
				arg_193_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			local var_196_14 = 0

			if var_196_14 < arg_193_1.time_ and arg_193_1.time_ <= var_196_14 + arg_196_0 then
				arg_193_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_196_15 = 0
			local var_196_16 = 0.7

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_17 = arg_193_1:FormatText(StoryNameCfg[73].name)

				arg_193_1.leftNameTxt_.text = var_196_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_18 = arg_193_1:GetWordFromCfg(1109305046)
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305046", "story_v_side_new_1109305.awb") ~= 0 then
					local var_196_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305046", "story_v_side_new_1109305.awb") / 1000

					if var_196_23 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_23 + var_196_15
					end

					if var_196_18.prefab_name ~= "" and arg_193_1.actors_[var_196_18.prefab_name] ~= nil then
						local var_196_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_18.prefab_name].transform, "story_v_side_new_1109305", "1109305046", "story_v_side_new_1109305.awb")

						arg_193_1:RecordAudio("1109305046", var_196_24)
						arg_193_1:RecordAudio("1109305046", var_196_24)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305046", "story_v_side_new_1109305.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305046", "story_v_side_new_1109305.awb")
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
	Play1109305047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1109305047
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1109305048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1093ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1093ui_story == nil then
				arg_197_1.var_.characterEffect1093ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 and not isNil(var_200_0) then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1093ui_story and not isNil(var_200_0) then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1093ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1093ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1093ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.425

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

				local var_200_9 = arg_197_1:GetWordFromCfg(1109305047)
				local var_200_10 = arg_197_1:FormatText(var_200_9.content)

				arg_197_1.text_.text = var_200_10

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_11 = 17
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
	Play1109305048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1109305048
		arg_201_1.duration_ = 5.7

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1109305049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1093ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1093ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -1.11, -5.88)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1093ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1093ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and not isNil(var_204_9) and arg_201_1.var_.characterEffect1093ui_story == nil then
				arg_201_1.var_.characterEffect1093ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 and not isNil(var_204_9) then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1093ui_story and not isNil(var_204_9) then
					arg_201_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and not isNil(var_204_9) and arg_201_1.var_.characterEffect1093ui_story then
				arg_201_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action3_1")
			end

			local var_204_15 = 0
			local var_204_16 = 0.525

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_17 = arg_201_1:FormatText(StoryNameCfg[73].name)

				arg_201_1.leftNameTxt_.text = var_204_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_18 = arg_201_1:GetWordFromCfg(1109305048)
				local var_204_19 = arg_201_1:FormatText(var_204_18.content)

				arg_201_1.text_.text = var_204_19

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_20 = 21
				local var_204_21 = utf8.len(var_204_19)
				local var_204_22 = var_204_20 <= 0 and var_204_16 or var_204_16 * (var_204_21 / var_204_20)

				if var_204_22 > 0 and var_204_16 < var_204_22 then
					arg_201_1.talkMaxDuration = var_204_22

					if var_204_22 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_15
					end
				end

				arg_201_1.text_.text = var_204_19
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305048", "story_v_side_new_1109305.awb") ~= 0 then
					local var_204_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305048", "story_v_side_new_1109305.awb") / 1000

					if var_204_23 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_23 + var_204_15
					end

					if var_204_18.prefab_name ~= "" and arg_201_1.actors_[var_204_18.prefab_name] ~= nil then
						local var_204_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_18.prefab_name].transform, "story_v_side_new_1109305", "1109305048", "story_v_side_new_1109305.awb")

						arg_201_1:RecordAudio("1109305048", var_204_24)
						arg_201_1:RecordAudio("1109305048", var_204_24)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305048", "story_v_side_new_1109305.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305048", "story_v_side_new_1109305.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_25 = math.max(var_204_16, arg_201_1.talkMaxDuration)

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_25 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_15) / var_204_25

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_15 + var_204_25 and arg_201_1.time_ < var_204_15 + var_204_25 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1109305049
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1109305050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1093ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.characterEffect1093ui_story == nil then
				arg_205_1.var_.characterEffect1093ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 and not isNil(var_208_0) then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1093ui_story and not isNil(var_208_0) then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1093ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.characterEffect1093ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1093ui_story.fillRatio = var_208_5
			end

			local var_208_6 = 0
			local var_208_7 = 0.5

			if var_208_6 < arg_205_1.time_ and arg_205_1.time_ <= var_208_6 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_8 = arg_205_1:FormatText(StoryNameCfg[7].name)

				arg_205_1.leftNameTxt_.text = var_208_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_9 = arg_205_1:GetWordFromCfg(1109305049)
				local var_208_10 = arg_205_1:FormatText(var_208_9.content)

				arg_205_1.text_.text = var_208_10

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_11 = 20
				local var_208_12 = utf8.len(var_208_10)
				local var_208_13 = var_208_11 <= 0 and var_208_7 or var_208_7 * (var_208_12 / var_208_11)

				if var_208_13 > 0 and var_208_7 < var_208_13 then
					arg_205_1.talkMaxDuration = var_208_13

					if var_208_13 + var_208_6 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_6
					end
				end

				arg_205_1.text_.text = var_208_10
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_14 = math.max(var_208_7, arg_205_1.talkMaxDuration)

			if var_208_6 <= arg_205_1.time_ and arg_205_1.time_ < var_208_6 + var_208_14 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_6) / var_208_14

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_6 + var_208_14 and arg_205_1.time_ < var_208_6 + var_208_14 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1109305050
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1109305051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1093ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1093ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, 100, 0)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1093ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, 100, 0)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = 0
			local var_212_10 = 0.975

			if var_212_9 < arg_209_1.time_ and arg_209_1.time_ <= var_212_9 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_11 = arg_209_1:GetWordFromCfg(1109305050)
				local var_212_12 = arg_209_1:FormatText(var_212_11.content)

				arg_209_1.text_.text = var_212_12

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_13 = 39
				local var_212_14 = utf8.len(var_212_12)
				local var_212_15 = var_212_13 <= 0 and var_212_10 or var_212_10 * (var_212_14 / var_212_13)

				if var_212_15 > 0 and var_212_10 < var_212_15 then
					arg_209_1.talkMaxDuration = var_212_15

					if var_212_15 + var_212_9 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_15 + var_212_9
					end
				end

				arg_209_1.text_.text = var_212_12
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_16 = math.max(var_212_10, arg_209_1.talkMaxDuration)

			if var_212_9 <= arg_209_1.time_ and arg_209_1.time_ < var_212_9 + var_212_16 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_9) / var_212_16

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_9 + var_212_16 and arg_209_1.time_ < var_212_9 + var_212_16 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1109305051
		arg_213_1.duration_ = 3.7

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1109305052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1093ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1093ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, -1.11, -5.88)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1093ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1093ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and not isNil(var_216_9) and arg_213_1.var_.characterEffect1093ui_story == nil then
				arg_213_1.var_.characterEffect1093ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 and not isNil(var_216_9) then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1093ui_story and not isNil(var_216_9) then
					arg_213_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and not isNil(var_216_9) and arg_213_1.var_.characterEffect1093ui_story then
				arg_213_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_216_13 = 0

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action438")
			end

			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_216_15 = 0
			local var_216_16 = 0.4

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_17 = arg_213_1:FormatText(StoryNameCfg[73].name)

				arg_213_1.leftNameTxt_.text = var_216_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_18 = arg_213_1:GetWordFromCfg(1109305051)
				local var_216_19 = arg_213_1:FormatText(var_216_18.content)

				arg_213_1.text_.text = var_216_19

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_20 = 16
				local var_216_21 = utf8.len(var_216_19)
				local var_216_22 = var_216_20 <= 0 and var_216_16 or var_216_16 * (var_216_21 / var_216_20)

				if var_216_22 > 0 and var_216_16 < var_216_22 then
					arg_213_1.talkMaxDuration = var_216_22

					if var_216_22 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_22 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_19
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305051", "story_v_side_new_1109305.awb") ~= 0 then
					local var_216_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305051", "story_v_side_new_1109305.awb") / 1000

					if var_216_23 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_23 + var_216_15
					end

					if var_216_18.prefab_name ~= "" and arg_213_1.actors_[var_216_18.prefab_name] ~= nil then
						local var_216_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_18.prefab_name].transform, "story_v_side_new_1109305", "1109305051", "story_v_side_new_1109305.awb")

						arg_213_1:RecordAudio("1109305051", var_216_24)
						arg_213_1:RecordAudio("1109305051", var_216_24)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305051", "story_v_side_new_1109305.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305051", "story_v_side_new_1109305.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_25 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_25 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_25

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_25 and arg_213_1.time_ < var_216_15 + var_216_25 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1109305052
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1109305053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1093ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and not isNil(var_220_0) and arg_217_1.var_.characterEffect1093ui_story == nil then
				arg_217_1.var_.characterEffect1093ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.200000002980232

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 and not isNil(var_220_0) then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1093ui_story and not isNil(var_220_0) then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1093ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and not isNil(var_220_0) and arg_217_1.var_.characterEffect1093ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1093ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0
			local var_220_7 = 0.4

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_8 = arg_217_1:FormatText(StoryNameCfg[7].name)

				arg_217_1.leftNameTxt_.text = var_220_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_9 = arg_217_1:GetWordFromCfg(1109305052)
				local var_220_10 = arg_217_1:FormatText(var_220_9.content)

				arg_217_1.text_.text = var_220_10

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_11 = 16
				local var_220_12 = utf8.len(var_220_10)
				local var_220_13 = var_220_11 <= 0 and var_220_7 or var_220_7 * (var_220_12 / var_220_11)

				if var_220_13 > 0 and var_220_7 < var_220_13 then
					arg_217_1.talkMaxDuration = var_220_13

					if var_220_13 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_13 + var_220_6
					end
				end

				arg_217_1.text_.text = var_220_10
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_14 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_14 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_14

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_14 and arg_217_1.time_ < var_220_6 + var_220_14 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1109305053
		arg_221_1.duration_ = 3.8

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1109305054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1093ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1093ui_story == nil then
				arg_221_1.var_.characterEffect1093ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 and not isNil(var_224_0) then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1093ui_story and not isNil(var_224_0) then
					arg_221_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1093ui_story then
				arg_221_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_224_4 = 0
			local var_224_5 = 0.425

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_6 = arg_221_1:FormatText(StoryNameCfg[73].name)

				arg_221_1.leftNameTxt_.text = var_224_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_7 = arg_221_1:GetWordFromCfg(1109305053)
				local var_224_8 = arg_221_1:FormatText(var_224_7.content)

				arg_221_1.text_.text = var_224_8

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_9 = 17
				local var_224_10 = utf8.len(var_224_8)
				local var_224_11 = var_224_9 <= 0 and var_224_5 or var_224_5 * (var_224_10 / var_224_9)

				if var_224_11 > 0 and var_224_5 < var_224_11 then
					arg_221_1.talkMaxDuration = var_224_11

					if var_224_11 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_11 + var_224_4
					end
				end

				arg_221_1.text_.text = var_224_8
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305053", "story_v_side_new_1109305.awb") ~= 0 then
					local var_224_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305053", "story_v_side_new_1109305.awb") / 1000

					if var_224_12 + var_224_4 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_12 + var_224_4
					end

					if var_224_7.prefab_name ~= "" and arg_221_1.actors_[var_224_7.prefab_name] ~= nil then
						local var_224_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_7.prefab_name].transform, "story_v_side_new_1109305", "1109305053", "story_v_side_new_1109305.awb")

						arg_221_1:RecordAudio("1109305053", var_224_13)
						arg_221_1:RecordAudio("1109305053", var_224_13)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305053", "story_v_side_new_1109305.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305053", "story_v_side_new_1109305.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_5, arg_221_1.talkMaxDuration)

			if var_224_4 <= arg_221_1.time_ and arg_221_1.time_ < var_224_4 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_4) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_4 + var_224_14 and arg_221_1.time_ < var_224_4 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1109305054
		arg_225_1.duration_ = 6.33

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1109305055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action484")
			end

			local var_228_1 = arg_225_1.actors_["1093ui_story"]
			local var_228_2 = 0

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 and not isNil(var_228_1) and arg_225_1.var_.characterEffect1093ui_story == nil then
				arg_225_1.var_.characterEffect1093ui_story = var_228_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_3 = 0.200000002980232

			if var_228_2 <= arg_225_1.time_ and arg_225_1.time_ < var_228_2 + var_228_3 and not isNil(var_228_1) then
				local var_228_4 = (arg_225_1.time_ - var_228_2) / var_228_3

				if arg_225_1.var_.characterEffect1093ui_story and not isNil(var_228_1) then
					arg_225_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_2 + var_228_3 and arg_225_1.time_ < var_228_2 + var_228_3 + arg_228_0 and not isNil(var_228_1) and arg_225_1.var_.characterEffect1093ui_story then
				arg_225_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_228_5 = arg_225_1.actors_["1093ui_story"].transform
			local var_228_6 = 0

			if var_228_6 < arg_225_1.time_ and arg_225_1.time_ <= var_228_6 + arg_228_0 then
				arg_225_1.var_.moveOldPos1093ui_story = var_228_5.localPosition
			end

			local var_228_7 = 0.001

			if var_228_6 <= arg_225_1.time_ and arg_225_1.time_ < var_228_6 + var_228_7 then
				local var_228_8 = (arg_225_1.time_ - var_228_6) / var_228_7
				local var_228_9 = Vector3.New(0, -1.11, -5.88)

				var_228_5.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1093ui_story, var_228_9, var_228_8)

				local var_228_10 = manager.ui.mainCamera.transform.position - var_228_5.position

				var_228_5.forward = Vector3.New(var_228_10.x, var_228_10.y, var_228_10.z)

				local var_228_11 = var_228_5.localEulerAngles

				var_228_11.z = 0
				var_228_11.x = 0
				var_228_5.localEulerAngles = var_228_11
			end

			if arg_225_1.time_ >= var_228_6 + var_228_7 and arg_225_1.time_ < var_228_6 + var_228_7 + arg_228_0 then
				var_228_5.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_228_12 = manager.ui.mainCamera.transform.position - var_228_5.position

				var_228_5.forward = Vector3.New(var_228_12.x, var_228_12.y, var_228_12.z)

				local var_228_13 = var_228_5.localEulerAngles

				var_228_13.z = 0
				var_228_13.x = 0
				var_228_5.localEulerAngles = var_228_13
			end

			local var_228_14 = 0
			local var_228_15 = 0.725

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_16 = arg_225_1:FormatText(StoryNameCfg[73].name)

				arg_225_1.leftNameTxt_.text = var_228_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_17 = arg_225_1:GetWordFromCfg(1109305054)
				local var_228_18 = arg_225_1:FormatText(var_228_17.content)

				arg_225_1.text_.text = var_228_18

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_19 = 29
				local var_228_20 = utf8.len(var_228_18)
				local var_228_21 = var_228_19 <= 0 and var_228_15 or var_228_15 * (var_228_20 / var_228_19)

				if var_228_21 > 0 and var_228_15 < var_228_21 then
					arg_225_1.talkMaxDuration = var_228_21

					if var_228_21 + var_228_14 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_14
					end
				end

				arg_225_1.text_.text = var_228_18
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305054", "story_v_side_new_1109305.awb") ~= 0 then
					local var_228_22 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305054", "story_v_side_new_1109305.awb") / 1000

					if var_228_22 + var_228_14 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_14
					end

					if var_228_17.prefab_name ~= "" and arg_225_1.actors_[var_228_17.prefab_name] ~= nil then
						local var_228_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_17.prefab_name].transform, "story_v_side_new_1109305", "1109305054", "story_v_side_new_1109305.awb")

						arg_225_1:RecordAudio("1109305054", var_228_23)
						arg_225_1:RecordAudio("1109305054", var_228_23)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305054", "story_v_side_new_1109305.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305054", "story_v_side_new_1109305.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_24 = math.max(var_228_15, arg_225_1.talkMaxDuration)

			if var_228_14 <= arg_225_1.time_ and arg_225_1.time_ < var_228_14 + var_228_24 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_14) / var_228_24

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_14 + var_228_24 and arg_225_1.time_ < var_228_14 + var_228_24 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1109305055
		arg_229_1.duration_ = 1

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"

			SetActive(arg_229_1.choicesGo_, true)

			for iter_230_0, iter_230_1 in ipairs(arg_229_1.choices_) do
				local var_230_0 = iter_230_0 <= 1

				SetActive(iter_230_1.go, var_230_0)
			end

			arg_229_1.choices_[1].txt.text = arg_229_1:FormatText(StoryChoiceCfg[1029].name)
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1109305056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1093ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and not isNil(var_232_0) and arg_229_1.var_.characterEffect1093ui_story == nil then
				arg_229_1.var_.characterEffect1093ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 and not isNil(var_232_0) then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1093ui_story and not isNil(var_232_0) then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1093ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and not isNil(var_232_0) and arg_229_1.var_.characterEffect1093ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1093ui_story.fillRatio = var_232_5
			end
		end
	end,
	Play1109305056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1109305056
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1109305057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.625

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[7].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(1109305056)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 25
				local var_236_6 = utf8.len(var_236_4)
				local var_236_7 = var_236_5 <= 0 and var_236_1 or var_236_1 * (var_236_6 / var_236_5)

				if var_236_7 > 0 and var_236_1 < var_236_7 then
					arg_233_1.talkMaxDuration = var_236_7

					if var_236_7 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_7 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_4
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_8 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_8 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_8

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_8 and arg_233_1.time_ < var_236_0 + var_236_8 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1109305057
		arg_237_1.duration_ = 4

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1109305058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1093ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and not isNil(var_240_0) and arg_237_1.var_.characterEffect1093ui_story == nil then
				arg_237_1.var_.characterEffect1093ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 and not isNil(var_240_0) then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1093ui_story and not isNil(var_240_0) then
					arg_237_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and not isNil(var_240_0) and arg_237_1.var_.characterEffect1093ui_story then
				arg_237_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_240_4 = 0
			local var_240_5 = 0.45

			if var_240_4 < arg_237_1.time_ and arg_237_1.time_ <= var_240_4 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_6 = arg_237_1:FormatText(StoryNameCfg[73].name)

				arg_237_1.leftNameTxt_.text = var_240_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_7 = arg_237_1:GetWordFromCfg(1109305057)
				local var_240_8 = arg_237_1:FormatText(var_240_7.content)

				arg_237_1.text_.text = var_240_8

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_9 = 18
				local var_240_10 = utf8.len(var_240_8)
				local var_240_11 = var_240_9 <= 0 and var_240_5 or var_240_5 * (var_240_10 / var_240_9)

				if var_240_11 > 0 and var_240_5 < var_240_11 then
					arg_237_1.talkMaxDuration = var_240_11

					if var_240_11 + var_240_4 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_11 + var_240_4
					end
				end

				arg_237_1.text_.text = var_240_8
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305057", "story_v_side_new_1109305.awb") ~= 0 then
					local var_240_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305057", "story_v_side_new_1109305.awb") / 1000

					if var_240_12 + var_240_4 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_4
					end

					if var_240_7.prefab_name ~= "" and arg_237_1.actors_[var_240_7.prefab_name] ~= nil then
						local var_240_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_7.prefab_name].transform, "story_v_side_new_1109305", "1109305057", "story_v_side_new_1109305.awb")

						arg_237_1:RecordAudio("1109305057", var_240_13)
						arg_237_1:RecordAudio("1109305057", var_240_13)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305057", "story_v_side_new_1109305.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305057", "story_v_side_new_1109305.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_14 = math.max(var_240_5, arg_237_1.talkMaxDuration)

			if var_240_4 <= arg_237_1.time_ and arg_237_1.time_ < var_240_4 + var_240_14 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_4) / var_240_14

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_4 + var_240_14 and arg_237_1.time_ < var_240_4 + var_240_14 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1109305058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1109305059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1093ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1093ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0, 100, 0)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1093ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, 100, 0)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = 0
			local var_244_10 = 0.7

			if var_244_9 < arg_241_1.time_ and arg_241_1.time_ <= var_244_9 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_11 = arg_241_1:GetWordFromCfg(1109305058)
				local var_244_12 = arg_241_1:FormatText(var_244_11.content)

				arg_241_1.text_.text = var_244_12

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_13 = 28
				local var_244_14 = utf8.len(var_244_12)
				local var_244_15 = var_244_13 <= 0 and var_244_10 or var_244_10 * (var_244_14 / var_244_13)

				if var_244_15 > 0 and var_244_10 < var_244_15 then
					arg_241_1.talkMaxDuration = var_244_15

					if var_244_15 + var_244_9 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_15 + var_244_9
					end
				end

				arg_241_1.text_.text = var_244_12
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_16 = math.max(var_244_10, arg_241_1.talkMaxDuration)

			if var_244_9 <= arg_241_1.time_ and arg_241_1.time_ < var_244_9 + var_244_16 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_9) / var_244_16

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_9 + var_244_16 and arg_241_1.time_ < var_244_9 + var_244_16 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1109305059
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1109305060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.775

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[7].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(1109305059)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 31
				local var_248_6 = utf8.len(var_248_4)
				local var_248_7 = var_248_5 <= 0 and var_248_1 or var_248_1 * (var_248_6 / var_248_5)

				if var_248_7 > 0 and var_248_1 < var_248_7 then
					arg_245_1.talkMaxDuration = var_248_7

					if var_248_7 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_7 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_4
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_8 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_8 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_8

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_8 and arg_245_1.time_ < var_248_0 + var_248_8 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1109305060
		arg_249_1.duration_ = 4.37

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1109305061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1093ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1093ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -1.11, -5.88)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1093ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1093ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and not isNil(var_252_9) and arg_249_1.var_.characterEffect1093ui_story == nil then
				arg_249_1.var_.characterEffect1093ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 and not isNil(var_252_9) then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1093ui_story and not isNil(var_252_9) then
					arg_249_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and not isNil(var_252_9) and arg_249_1.var_.characterEffect1093ui_story then
				arg_249_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_252_15 = 0
			local var_252_16 = 0.475

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_17 = arg_249_1:FormatText(StoryNameCfg[73].name)

				arg_249_1.leftNameTxt_.text = var_252_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_18 = arg_249_1:GetWordFromCfg(1109305060)
				local var_252_19 = arg_249_1:FormatText(var_252_18.content)

				arg_249_1.text_.text = var_252_19

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_20 = 19
				local var_252_21 = utf8.len(var_252_19)
				local var_252_22 = var_252_20 <= 0 and var_252_16 or var_252_16 * (var_252_21 / var_252_20)

				if var_252_22 > 0 and var_252_16 < var_252_22 then
					arg_249_1.talkMaxDuration = var_252_22

					if var_252_22 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_22 + var_252_15
					end
				end

				arg_249_1.text_.text = var_252_19
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305060", "story_v_side_new_1109305.awb") ~= 0 then
					local var_252_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305060", "story_v_side_new_1109305.awb") / 1000

					if var_252_23 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_23 + var_252_15
					end

					if var_252_18.prefab_name ~= "" and arg_249_1.actors_[var_252_18.prefab_name] ~= nil then
						local var_252_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_18.prefab_name].transform, "story_v_side_new_1109305", "1109305060", "story_v_side_new_1109305.awb")

						arg_249_1:RecordAudio("1109305060", var_252_24)
						arg_249_1:RecordAudio("1109305060", var_252_24)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305060", "story_v_side_new_1109305.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305060", "story_v_side_new_1109305.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_25 = math.max(var_252_16, arg_249_1.talkMaxDuration)

			if var_252_15 <= arg_249_1.time_ and arg_249_1.time_ < var_252_15 + var_252_25 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_15) / var_252_25

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_15 + var_252_25 and arg_249_1.time_ < var_252_15 + var_252_25 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1109305061
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1109305062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1093ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1093ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0, 100, 0)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1093ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, 100, 0)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["1093ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and not isNil(var_256_9) and arg_253_1.var_.characterEffect1093ui_story == nil then
				arg_253_1.var_.characterEffect1093ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 and not isNil(var_256_9) then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect1093ui_story and not isNil(var_256_9) then
					local var_256_13 = Mathf.Lerp(0, 0.5, var_256_12)

					arg_253_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1093ui_story.fillRatio = var_256_13
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and not isNil(var_256_9) and arg_253_1.var_.characterEffect1093ui_story then
				local var_256_14 = 0.5

				arg_253_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1093ui_story.fillRatio = var_256_14
			end

			local var_256_15 = 0
			local var_256_16 = 0.525

			if var_256_15 < arg_253_1.time_ and arg_253_1.time_ <= var_256_15 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_17 = arg_253_1:GetWordFromCfg(1109305061)
				local var_256_18 = arg_253_1:FormatText(var_256_17.content)

				arg_253_1.text_.text = var_256_18

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_19 = 21
				local var_256_20 = utf8.len(var_256_18)
				local var_256_21 = var_256_19 <= 0 and var_256_16 or var_256_16 * (var_256_20 / var_256_19)

				if var_256_21 > 0 and var_256_16 < var_256_21 then
					arg_253_1.talkMaxDuration = var_256_21

					if var_256_21 + var_256_15 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_21 + var_256_15
					end
				end

				arg_253_1.text_.text = var_256_18
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_22 = math.max(var_256_16, arg_253_1.talkMaxDuration)

			if var_256_15 <= arg_253_1.time_ and arg_253_1.time_ < var_256_15 + var_256_22 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_15) / var_256_22

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_15 + var_256_22 and arg_253_1.time_ < var_256_15 + var_256_22 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305062 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1109305062
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1109305063(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.55

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[7].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(1109305062)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 22
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_8 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_8 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_8

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_8 and arg_257_1.time_ < var_260_0 + var_260_8 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1109305063
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1109305064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.775

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_2 = arg_261_1:GetWordFromCfg(1109305063)
				local var_264_3 = arg_261_1:FormatText(var_264_2.content)

				arg_261_1.text_.text = var_264_3

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_4 = 31
				local var_264_5 = utf8.len(var_264_3)
				local var_264_6 = var_264_4 <= 0 and var_264_1 or var_264_1 * (var_264_5 / var_264_4)

				if var_264_6 > 0 and var_264_1 < var_264_6 then
					arg_261_1.talkMaxDuration = var_264_6

					if var_264_6 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_6 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_3
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_7 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_7 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_7

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_7 and arg_261_1.time_ < var_264_0 + var_264_7 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1109305064
		arg_265_1.duration_ = 5.2

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1109305065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1093ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1093ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(0, -1.11, -5.88)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1093ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["1093ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and not isNil(var_268_9) and arg_265_1.var_.characterEffect1093ui_story == nil then
				arg_265_1.var_.characterEffect1093ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 and not isNil(var_268_9) then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect1093ui_story and not isNil(var_268_9) then
					arg_265_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and not isNil(var_268_9) and arg_265_1.var_.characterEffect1093ui_story then
				arg_265_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_268_13 = 0

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_1")
			end

			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 then
				arg_265_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_15 = 0
			local var_268_16 = 0.65

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_17 = arg_265_1:FormatText(StoryNameCfg[73].name)

				arg_265_1.leftNameTxt_.text = var_268_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_18 = arg_265_1:GetWordFromCfg(1109305064)
				local var_268_19 = arg_265_1:FormatText(var_268_18.content)

				arg_265_1.text_.text = var_268_19

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_20 = 26
				local var_268_21 = utf8.len(var_268_19)
				local var_268_22 = var_268_20 <= 0 and var_268_16 or var_268_16 * (var_268_21 / var_268_20)

				if var_268_22 > 0 and var_268_16 < var_268_22 then
					arg_265_1.talkMaxDuration = var_268_22

					if var_268_22 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_22 + var_268_15
					end
				end

				arg_265_1.text_.text = var_268_19
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305064", "story_v_side_new_1109305.awb") ~= 0 then
					local var_268_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305064", "story_v_side_new_1109305.awb") / 1000

					if var_268_23 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_23 + var_268_15
					end

					if var_268_18.prefab_name ~= "" and arg_265_1.actors_[var_268_18.prefab_name] ~= nil then
						local var_268_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_18.prefab_name].transform, "story_v_side_new_1109305", "1109305064", "story_v_side_new_1109305.awb")

						arg_265_1:RecordAudio("1109305064", var_268_24)
						arg_265_1:RecordAudio("1109305064", var_268_24)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305064", "story_v_side_new_1109305.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305064", "story_v_side_new_1109305.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_25 = math.max(var_268_16, arg_265_1.talkMaxDuration)

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_25 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_15) / var_268_25

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_15 + var_268_25 and arg_265_1.time_ < var_268_15 + var_268_25 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1109305065
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play1109305066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1093ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and not isNil(var_272_0) and arg_269_1.var_.characterEffect1093ui_story == nil then
				arg_269_1.var_.characterEffect1093ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 and not isNil(var_272_0) then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1093ui_story and not isNil(var_272_0) then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1093ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and not isNil(var_272_0) and arg_269_1.var_.characterEffect1093ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1093ui_story.fillRatio = var_272_5
			end

			local var_272_6 = 0
			local var_272_7 = 0.95

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[7].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(1109305065)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 38
				local var_272_12 = utf8.len(var_272_10)
				local var_272_13 = var_272_11 <= 0 and var_272_7 or var_272_7 * (var_272_12 / var_272_11)

				if var_272_13 > 0 and var_272_7 < var_272_13 then
					arg_269_1.talkMaxDuration = var_272_13

					if var_272_13 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_13 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_10
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_14 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_14 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_14

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_14 and arg_269_1.time_ < var_272_6 + var_272_14 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1109305066
		arg_273_1.duration_ = 5.23

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1109305067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1093ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and not isNil(var_276_0) and arg_273_1.var_.characterEffect1093ui_story == nil then
				arg_273_1.var_.characterEffect1093ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 and not isNil(var_276_0) then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect1093ui_story and not isNil(var_276_0) then
					arg_273_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and not isNil(var_276_0) and arg_273_1.var_.characterEffect1093ui_story then
				arg_273_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_276_4 = 0
			local var_276_5 = 0.475

			if var_276_4 < arg_273_1.time_ and arg_273_1.time_ <= var_276_4 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_6 = arg_273_1:FormatText(StoryNameCfg[73].name)

				arg_273_1.leftNameTxt_.text = var_276_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_7 = arg_273_1:GetWordFromCfg(1109305066)
				local var_276_8 = arg_273_1:FormatText(var_276_7.content)

				arg_273_1.text_.text = var_276_8

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_9 = 19
				local var_276_10 = utf8.len(var_276_8)
				local var_276_11 = var_276_9 <= 0 and var_276_5 or var_276_5 * (var_276_10 / var_276_9)

				if var_276_11 > 0 and var_276_5 < var_276_11 then
					arg_273_1.talkMaxDuration = var_276_11

					if var_276_11 + var_276_4 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_11 + var_276_4
					end
				end

				arg_273_1.text_.text = var_276_8
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305066", "story_v_side_new_1109305.awb") ~= 0 then
					local var_276_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305066", "story_v_side_new_1109305.awb") / 1000

					if var_276_12 + var_276_4 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_12 + var_276_4
					end

					if var_276_7.prefab_name ~= "" and arg_273_1.actors_[var_276_7.prefab_name] ~= nil then
						local var_276_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_7.prefab_name].transform, "story_v_side_new_1109305", "1109305066", "story_v_side_new_1109305.awb")

						arg_273_1:RecordAudio("1109305066", var_276_13)
						arg_273_1:RecordAudio("1109305066", var_276_13)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305066", "story_v_side_new_1109305.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305066", "story_v_side_new_1109305.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_14 = math.max(var_276_5, arg_273_1.talkMaxDuration)

			if var_276_4 <= arg_273_1.time_ and arg_273_1.time_ < var_276_4 + var_276_14 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_4) / var_276_14

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_4 + var_276_14 and arg_273_1.time_ < var_276_4 + var_276_14 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1109305067
		arg_277_1.duration_ = 0.33

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"

			SetActive(arg_277_1.choicesGo_, true)

			for iter_278_0, iter_278_1 in ipairs(arg_277_1.choices_) do
				local var_278_0 = iter_278_0 <= 1

				SetActive(iter_278_1.go, var_278_0)
			end

			arg_277_1.choices_[1].txt.text = arg_277_1:FormatText(StoryChoiceCfg[1030].name)
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1109305068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1093ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and not isNil(var_280_0) and arg_277_1.var_.characterEffect1093ui_story == nil then
				arg_277_1.var_.characterEffect1093ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 and not isNil(var_280_0) then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1093ui_story and not isNil(var_280_0) then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1093ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and not isNil(var_280_0) and arg_277_1.var_.characterEffect1093ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1093ui_story.fillRatio = var_280_5
			end
		end
	end,
	Play1109305068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1109305068
		arg_281_1.duration_ = 6.5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play1109305069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1093ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1093ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, -1.11, -5.88)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1093ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["1093ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and not isNil(var_284_9) and arg_281_1.var_.characterEffect1093ui_story == nil then
				arg_281_1.var_.characterEffect1093ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 and not isNil(var_284_9) then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect1093ui_story and not isNil(var_284_9) then
					arg_281_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and not isNil(var_284_9) and arg_281_1.var_.characterEffect1093ui_story then
				arg_281_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_284_13 = 0

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_2")
			end

			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 then
				arg_281_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_284_15 = 0
			local var_284_16 = 0.625

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_17 = arg_281_1:FormatText(StoryNameCfg[73].name)

				arg_281_1.leftNameTxt_.text = var_284_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_18 = arg_281_1:GetWordFromCfg(1109305068)
				local var_284_19 = arg_281_1:FormatText(var_284_18.content)

				arg_281_1.text_.text = var_284_19

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_20 = 25
				local var_284_21 = utf8.len(var_284_19)
				local var_284_22 = var_284_20 <= 0 and var_284_16 or var_284_16 * (var_284_21 / var_284_20)

				if var_284_22 > 0 and var_284_16 < var_284_22 then
					arg_281_1.talkMaxDuration = var_284_22

					if var_284_22 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_22 + var_284_15
					end
				end

				arg_281_1.text_.text = var_284_19
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305068", "story_v_side_new_1109305.awb") ~= 0 then
					local var_284_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305068", "story_v_side_new_1109305.awb") / 1000

					if var_284_23 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_23 + var_284_15
					end

					if var_284_18.prefab_name ~= "" and arg_281_1.actors_[var_284_18.prefab_name] ~= nil then
						local var_284_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_18.prefab_name].transform, "story_v_side_new_1109305", "1109305068", "story_v_side_new_1109305.awb")

						arg_281_1:RecordAudio("1109305068", var_284_24)
						arg_281_1:RecordAudio("1109305068", var_284_24)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305068", "story_v_side_new_1109305.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305068", "story_v_side_new_1109305.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_25 = math.max(var_284_16, arg_281_1.talkMaxDuration)

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_25 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_15) / var_284_25

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_15 + var_284_25 and arg_281_1.time_ < var_284_15 + var_284_25 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1109305069
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1109305070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1093ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.characterEffect1093ui_story == nil then
				arg_285_1.var_.characterEffect1093ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 and not isNil(var_288_0) then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1093ui_story and not isNil(var_288_0) then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1093ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.characterEffect1093ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1093ui_story.fillRatio = var_288_5
			end

			local var_288_6 = 0
			local var_288_7 = 0.55

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_8 = arg_285_1:FormatText(StoryNameCfg[7].name)

				arg_285_1.leftNameTxt_.text = var_288_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_9 = arg_285_1:GetWordFromCfg(1109305069)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 22
				local var_288_12 = utf8.len(var_288_10)
				local var_288_13 = var_288_11 <= 0 and var_288_7 or var_288_7 * (var_288_12 / var_288_11)

				if var_288_13 > 0 and var_288_7 < var_288_13 then
					arg_285_1.talkMaxDuration = var_288_13

					if var_288_13 + var_288_6 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_13 + var_288_6
					end
				end

				arg_285_1.text_.text = var_288_10
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_14 = math.max(var_288_7, arg_285_1.talkMaxDuration)

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_14 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_6) / var_288_14

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_6 + var_288_14 and arg_285_1.time_ < var_288_6 + var_288_14 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 1109305070
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play1109305071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 1.05

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_2 = arg_289_1:GetWordFromCfg(1109305070)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 42
				local var_292_5 = utf8.len(var_292_3)
				local var_292_6 = var_292_4 <= 0 and var_292_1 or var_292_1 * (var_292_5 / var_292_4)

				if var_292_6 > 0 and var_292_1 < var_292_6 then
					arg_289_1.talkMaxDuration = var_292_6

					if var_292_6 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_6 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_3
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_7 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_7 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_7

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_7 and arg_289_1.time_ < var_292_0 + var_292_7 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 1109305071
		arg_293_1.duration_ = 3.97

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play1109305072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1093ui_story"].transform
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				arg_293_1.var_.moveOldPos1093ui_story = var_296_0.localPosition
			end

			local var_296_2 = 0.001

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2
				local var_296_4 = Vector3.New(0, -1.11, -5.88)

				var_296_0.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos1093ui_story, var_296_4, var_296_3)

				local var_296_5 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_5.x, var_296_5.y, var_296_5.z)

				local var_296_6 = var_296_0.localEulerAngles

				var_296_6.z = 0
				var_296_6.x = 0
				var_296_0.localEulerAngles = var_296_6
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 then
				var_296_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_296_7 = manager.ui.mainCamera.transform.position - var_296_0.position

				var_296_0.forward = Vector3.New(var_296_7.x, var_296_7.y, var_296_7.z)

				local var_296_8 = var_296_0.localEulerAngles

				var_296_8.z = 0
				var_296_8.x = 0
				var_296_0.localEulerAngles = var_296_8
			end

			local var_296_9 = arg_293_1.actors_["1093ui_story"]
			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 and not isNil(var_296_9) and arg_293_1.var_.characterEffect1093ui_story == nil then
				arg_293_1.var_.characterEffect1093ui_story = var_296_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_11 = 0.200000002980232

			if var_296_10 <= arg_293_1.time_ and arg_293_1.time_ < var_296_10 + var_296_11 and not isNil(var_296_9) then
				local var_296_12 = (arg_293_1.time_ - var_296_10) / var_296_11

				if arg_293_1.var_.characterEffect1093ui_story and not isNil(var_296_9) then
					arg_293_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_10 + var_296_11 and arg_293_1.time_ < var_296_10 + var_296_11 + arg_296_0 and not isNil(var_296_9) and arg_293_1.var_.characterEffect1093ui_story then
				arg_293_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_296_13 = 0

			if var_296_13 < arg_293_1.time_ and arg_293_1.time_ <= var_296_13 + arg_296_0 then
				arg_293_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_296_14 = 0

			if var_296_14 < arg_293_1.time_ and arg_293_1.time_ <= var_296_14 + arg_296_0 then
				arg_293_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_296_15 = 0
			local var_296_16 = 0.35

			if var_296_15 < arg_293_1.time_ and arg_293_1.time_ <= var_296_15 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_17 = arg_293_1:FormatText(StoryNameCfg[73].name)

				arg_293_1.leftNameTxt_.text = var_296_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_18 = arg_293_1:GetWordFromCfg(1109305071)
				local var_296_19 = arg_293_1:FormatText(var_296_18.content)

				arg_293_1.text_.text = var_296_19

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_20 = 14
				local var_296_21 = utf8.len(var_296_19)
				local var_296_22 = var_296_20 <= 0 and var_296_16 or var_296_16 * (var_296_21 / var_296_20)

				if var_296_22 > 0 and var_296_16 < var_296_22 then
					arg_293_1.talkMaxDuration = var_296_22

					if var_296_22 + var_296_15 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_22 + var_296_15
					end
				end

				arg_293_1.text_.text = var_296_19
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305071", "story_v_side_new_1109305.awb") ~= 0 then
					local var_296_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305071", "story_v_side_new_1109305.awb") / 1000

					if var_296_23 + var_296_15 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_23 + var_296_15
					end

					if var_296_18.prefab_name ~= "" and arg_293_1.actors_[var_296_18.prefab_name] ~= nil then
						local var_296_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_18.prefab_name].transform, "story_v_side_new_1109305", "1109305071", "story_v_side_new_1109305.awb")

						arg_293_1:RecordAudio("1109305071", var_296_24)
						arg_293_1:RecordAudio("1109305071", var_296_24)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305071", "story_v_side_new_1109305.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305071", "story_v_side_new_1109305.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_25 = math.max(var_296_16, arg_293_1.talkMaxDuration)

			if var_296_15 <= arg_293_1.time_ and arg_293_1.time_ < var_296_15 + var_296_25 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_15) / var_296_25

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_15 + var_296_25 and arg_293_1.time_ < var_296_15 + var_296_25 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 1109305072
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play1109305073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1093ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and not isNil(var_300_0) and arg_297_1.var_.characterEffect1093ui_story == nil then
				arg_297_1.var_.characterEffect1093ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.200000002980232

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 and not isNil(var_300_0) then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1093ui_story and not isNil(var_300_0) then
					local var_300_4 = Mathf.Lerp(0, 0.5, var_300_3)

					arg_297_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1093ui_story.fillRatio = var_300_4
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and not isNil(var_300_0) and arg_297_1.var_.characterEffect1093ui_story then
				local var_300_5 = 0.5

				arg_297_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1093ui_story.fillRatio = var_300_5
			end

			local var_300_6 = 0
			local var_300_7 = 0.775

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_8 = arg_297_1:FormatText(StoryNameCfg[7].name)

				arg_297_1.leftNameTxt_.text = var_300_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_9 = arg_297_1:GetWordFromCfg(1109305072)
				local var_300_10 = arg_297_1:FormatText(var_300_9.content)

				arg_297_1.text_.text = var_300_10

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_11 = 31
				local var_300_12 = utf8.len(var_300_10)
				local var_300_13 = var_300_11 <= 0 and var_300_7 or var_300_7 * (var_300_12 / var_300_11)

				if var_300_13 > 0 and var_300_7 < var_300_13 then
					arg_297_1.talkMaxDuration = var_300_13

					if var_300_13 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_13 + var_300_6
					end
				end

				arg_297_1.text_.text = var_300_10
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_14 = math.max(var_300_7, arg_297_1.talkMaxDuration)

			if var_300_6 <= arg_297_1.time_ and arg_297_1.time_ < var_300_6 + var_300_14 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_6) / var_300_14

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_6 + var_300_14 and arg_297_1.time_ < var_300_6 + var_300_14 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1109305073
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1109305074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				local var_304_2 = "play"
				local var_304_3 = "effect"

				arg_301_1:AudioAction(var_304_2, var_304_3, "se_story_side_1093", "se_story_side_1093_noogies", "")
			end

			local var_304_4 = 0
			local var_304_5 = 0.575

			if var_304_4 < arg_301_1.time_ and arg_301_1.time_ <= var_304_4 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_6 = arg_301_1:GetWordFromCfg(1109305073)
				local var_304_7 = arg_301_1:FormatText(var_304_6.content)

				arg_301_1.text_.text = var_304_7

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_8 = 23
				local var_304_9 = utf8.len(var_304_7)
				local var_304_10 = var_304_8 <= 0 and var_304_5 or var_304_5 * (var_304_9 / var_304_8)

				if var_304_10 > 0 and var_304_5 < var_304_10 then
					arg_301_1.talkMaxDuration = var_304_10

					if var_304_10 + var_304_4 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_10 + var_304_4
					end
				end

				arg_301_1.text_.text = var_304_7
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_11 = math.max(var_304_5, arg_301_1.talkMaxDuration)

			if var_304_4 <= arg_301_1.time_ and arg_301_1.time_ < var_304_4 + var_304_11 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_4) / var_304_11

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_4 + var_304_11 and arg_301_1.time_ < var_304_4 + var_304_11 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1109305074
		arg_305_1.duration_ = 2.73

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1109305075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1093ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos1093ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, -1.11, -5.88)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos1093ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["1093ui_story"]
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 and not isNil(var_308_9) and arg_305_1.var_.characterEffect1093ui_story == nil then
				arg_305_1.var_.characterEffect1093ui_story = var_308_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_11 = 0.200000002980232

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 and not isNil(var_308_9) then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11

				if arg_305_1.var_.characterEffect1093ui_story and not isNil(var_308_9) then
					arg_305_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 and not isNil(var_308_9) and arg_305_1.var_.characterEffect1093ui_story then
				arg_305_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_308_13 = 0

			if var_308_13 < arg_305_1.time_ and arg_305_1.time_ <= var_308_13 + arg_308_0 then
				arg_305_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_2")
			end

			local var_308_14 = 0

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				arg_305_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_308_15 = 0
			local var_308_16 = 0.25

			if var_308_15 < arg_305_1.time_ and arg_305_1.time_ <= var_308_15 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_17 = arg_305_1:FormatText(StoryNameCfg[73].name)

				arg_305_1.leftNameTxt_.text = var_308_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_18 = arg_305_1:GetWordFromCfg(1109305074)
				local var_308_19 = arg_305_1:FormatText(var_308_18.content)

				arg_305_1.text_.text = var_308_19

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_20 = 10
				local var_308_21 = utf8.len(var_308_19)
				local var_308_22 = var_308_20 <= 0 and var_308_16 or var_308_16 * (var_308_21 / var_308_20)

				if var_308_22 > 0 and var_308_16 < var_308_22 then
					arg_305_1.talkMaxDuration = var_308_22

					if var_308_22 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_22 + var_308_15
					end
				end

				arg_305_1.text_.text = var_308_19
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305074", "story_v_side_new_1109305.awb") ~= 0 then
					local var_308_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305074", "story_v_side_new_1109305.awb") / 1000

					if var_308_23 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_23 + var_308_15
					end

					if var_308_18.prefab_name ~= "" and arg_305_1.actors_[var_308_18.prefab_name] ~= nil then
						local var_308_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_18.prefab_name].transform, "story_v_side_new_1109305", "1109305074", "story_v_side_new_1109305.awb")

						arg_305_1:RecordAudio("1109305074", var_308_24)
						arg_305_1:RecordAudio("1109305074", var_308_24)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305074", "story_v_side_new_1109305.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305074", "story_v_side_new_1109305.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_25 = math.max(var_308_16, arg_305_1.talkMaxDuration)

			if var_308_15 <= arg_305_1.time_ and arg_305_1.time_ < var_308_15 + var_308_25 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_15) / var_308_25

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_15 + var_308_25 and arg_305_1.time_ < var_308_15 + var_308_25 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1109305075
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play1109305076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1093ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and not isNil(var_312_0) and arg_309_1.var_.characterEffect1093ui_story == nil then
				arg_309_1.var_.characterEffect1093ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.200000002980232

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 and not isNil(var_312_0) then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1093ui_story and not isNil(var_312_0) then
					local var_312_4 = Mathf.Lerp(0, 0.5, var_312_3)

					arg_309_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1093ui_story.fillRatio = var_312_4
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and not isNil(var_312_0) and arg_309_1.var_.characterEffect1093ui_story then
				local var_312_5 = 0.5

				arg_309_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1093ui_story.fillRatio = var_312_5
			end

			local var_312_6 = 0
			local var_312_7 = 0.4

			if var_312_6 < arg_309_1.time_ and arg_309_1.time_ <= var_312_6 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_8 = arg_309_1:FormatText(StoryNameCfg[7].name)

				arg_309_1.leftNameTxt_.text = var_312_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_9 = arg_309_1:GetWordFromCfg(1109305075)
				local var_312_10 = arg_309_1:FormatText(var_312_9.content)

				arg_309_1.text_.text = var_312_10

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_11 = 16
				local var_312_12 = utf8.len(var_312_10)
				local var_312_13 = var_312_11 <= 0 and var_312_7 or var_312_7 * (var_312_12 / var_312_11)

				if var_312_13 > 0 and var_312_7 < var_312_13 then
					arg_309_1.talkMaxDuration = var_312_13

					if var_312_13 + var_312_6 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_13 + var_312_6
					end
				end

				arg_309_1.text_.text = var_312_10
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_14 = math.max(var_312_7, arg_309_1.talkMaxDuration)

			if var_312_6 <= arg_309_1.time_ and arg_309_1.time_ < var_312_6 + var_312_14 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_6) / var_312_14

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_6 + var_312_14 and arg_309_1.time_ < var_312_6 + var_312_14 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 1109305076
		arg_313_1.duration_ = 4.47

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play1109305077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1093ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and not isNil(var_316_0) and arg_313_1.var_.characterEffect1093ui_story == nil then
				arg_313_1.var_.characterEffect1093ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 and not isNil(var_316_0) then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1093ui_story and not isNil(var_316_0) then
					arg_313_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and not isNil(var_316_0) and arg_313_1.var_.characterEffect1093ui_story then
				arg_313_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_316_4 = 0
			local var_316_5 = 0.45

			if var_316_4 < arg_313_1.time_ and arg_313_1.time_ <= var_316_4 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_6 = arg_313_1:FormatText(StoryNameCfg[73].name)

				arg_313_1.leftNameTxt_.text = var_316_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_7 = arg_313_1:GetWordFromCfg(1109305076)
				local var_316_8 = arg_313_1:FormatText(var_316_7.content)

				arg_313_1.text_.text = var_316_8

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_9 = 18
				local var_316_10 = utf8.len(var_316_8)
				local var_316_11 = var_316_9 <= 0 and var_316_5 or var_316_5 * (var_316_10 / var_316_9)

				if var_316_11 > 0 and var_316_5 < var_316_11 then
					arg_313_1.talkMaxDuration = var_316_11

					if var_316_11 + var_316_4 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_11 + var_316_4
					end
				end

				arg_313_1.text_.text = var_316_8
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305076", "story_v_side_new_1109305.awb") ~= 0 then
					local var_316_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305076", "story_v_side_new_1109305.awb") / 1000

					if var_316_12 + var_316_4 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_12 + var_316_4
					end

					if var_316_7.prefab_name ~= "" and arg_313_1.actors_[var_316_7.prefab_name] ~= nil then
						local var_316_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_7.prefab_name].transform, "story_v_side_new_1109305", "1109305076", "story_v_side_new_1109305.awb")

						arg_313_1:RecordAudio("1109305076", var_316_13)
						arg_313_1:RecordAudio("1109305076", var_316_13)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305076", "story_v_side_new_1109305.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305076", "story_v_side_new_1109305.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_14 = math.max(var_316_5, arg_313_1.talkMaxDuration)

			if var_316_4 <= arg_313_1.time_ and arg_313_1.time_ < var_316_4 + var_316_14 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_4) / var_316_14

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_4 + var_316_14 and arg_313_1.time_ < var_316_4 + var_316_14 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 1109305077
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play1109305078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1093ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and not isNil(var_320_0) and arg_317_1.var_.characterEffect1093ui_story == nil then
				arg_317_1.var_.characterEffect1093ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 and not isNil(var_320_0) then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1093ui_story and not isNil(var_320_0) then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1093ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and not isNil(var_320_0) and arg_317_1.var_.characterEffect1093ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1093ui_story.fillRatio = var_320_5
			end

			local var_320_6 = 0
			local var_320_7 = 0.275

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_8 = arg_317_1:FormatText(StoryNameCfg[7].name)

				arg_317_1.leftNameTxt_.text = var_320_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_9 = arg_317_1:GetWordFromCfg(1109305077)
				local var_320_10 = arg_317_1:FormatText(var_320_9.content)

				arg_317_1.text_.text = var_320_10

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_11 = 9
				local var_320_12 = utf8.len(var_320_10)
				local var_320_13 = var_320_11 <= 0 and var_320_7 or var_320_7 * (var_320_12 / var_320_11)

				if var_320_13 > 0 and var_320_7 < var_320_13 then
					arg_317_1.talkMaxDuration = var_320_13

					if var_320_13 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_13 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_10
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_14 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_14 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_14

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_14 and arg_317_1.time_ < var_320_6 + var_320_14 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 1109305078
		arg_321_1.duration_ = 4.3

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play1109305079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1093ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1093ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, -1.11, -5.88)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1093ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["1093ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and not isNil(var_324_9) and arg_321_1.var_.characterEffect1093ui_story == nil then
				arg_321_1.var_.characterEffect1093ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 and not isNil(var_324_9) then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect1093ui_story and not isNil(var_324_9) then
					arg_321_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and not isNil(var_324_9) and arg_321_1.var_.characterEffect1093ui_story then
				arg_321_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_324_15 = 0
			local var_324_16 = 0.5

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_17 = arg_321_1:FormatText(StoryNameCfg[73].name)

				arg_321_1.leftNameTxt_.text = var_324_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_18 = arg_321_1:GetWordFromCfg(1109305078)
				local var_324_19 = arg_321_1:FormatText(var_324_18.content)

				arg_321_1.text_.text = var_324_19

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_20 = 20
				local var_324_21 = utf8.len(var_324_19)
				local var_324_22 = var_324_20 <= 0 and var_324_16 or var_324_16 * (var_324_21 / var_324_20)

				if var_324_22 > 0 and var_324_16 < var_324_22 then
					arg_321_1.talkMaxDuration = var_324_22

					if var_324_22 + var_324_15 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_22 + var_324_15
					end
				end

				arg_321_1.text_.text = var_324_19
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305078", "story_v_side_new_1109305.awb") ~= 0 then
					local var_324_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305078", "story_v_side_new_1109305.awb") / 1000

					if var_324_23 + var_324_15 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_23 + var_324_15
					end

					if var_324_18.prefab_name ~= "" and arg_321_1.actors_[var_324_18.prefab_name] ~= nil then
						local var_324_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_18.prefab_name].transform, "story_v_side_new_1109305", "1109305078", "story_v_side_new_1109305.awb")

						arg_321_1:RecordAudio("1109305078", var_324_24)
						arg_321_1:RecordAudio("1109305078", var_324_24)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305078", "story_v_side_new_1109305.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305078", "story_v_side_new_1109305.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_25 = math.max(var_324_16, arg_321_1.talkMaxDuration)

			if var_324_15 <= arg_321_1.time_ and arg_321_1.time_ < var_324_15 + var_324_25 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_15) / var_324_25

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_15 + var_324_25 and arg_321_1.time_ < var_324_15 + var_324_25 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 1109305079
		arg_325_1.duration_ = 0.77

		SetActive(arg_325_1.tipsGo_, true)

		arg_325_1.tipsText_.text = StoryTipsCfg[109301].name

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"

			SetActive(arg_325_1.choicesGo_, true)

			for iter_326_0, iter_326_1 in ipairs(arg_325_1.choices_) do
				local var_326_0 = iter_326_0 <= 2

				SetActive(iter_326_1.go, var_326_0)
			end

			arg_325_1.choices_[1].txt.text = arg_325_1:FormatText(StoryChoiceCfg[1031].name)
			arg_325_1.choices_[2].txt.text = arg_325_1:FormatText(StoryChoiceCfg[1032].name)
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play1109305080(arg_325_1)
			end

			if arg_327_0 == 2 then
				PlayerAction.UseStoryTrigger(1093012, 210930105, 1109305079, 2)
				arg_325_0:Play1109305082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1093ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and not isNil(var_328_0) and arg_325_1.var_.characterEffect1093ui_story == nil then
				arg_325_1.var_.characterEffect1093ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.200000002980232

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 and not isNil(var_328_0) then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1093ui_story and not isNil(var_328_0) then
					local var_328_4 = Mathf.Lerp(0, 0.5, var_328_3)

					arg_325_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1093ui_story.fillRatio = var_328_4
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and not isNil(var_328_0) and arg_325_1.var_.characterEffect1093ui_story then
				local var_328_5 = 0.5

				arg_325_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1093ui_story.fillRatio = var_328_5
			end
		end
	end,
	Play1109305080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 1109305080
		arg_329_1.duration_ = 3.97

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play1109305081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1093ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1093ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, -1.11, -5.88)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1093ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1093ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and not isNil(var_332_9) and arg_329_1.var_.characterEffect1093ui_story == nil then
				arg_329_1.var_.characterEffect1093ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 and not isNil(var_332_9) then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1093ui_story and not isNil(var_332_9) then
					arg_329_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and not isNil(var_332_9) and arg_329_1.var_.characterEffect1093ui_story then
				arg_329_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_332_13 = 0
			local var_332_14 = 0.45

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_15 = arg_329_1:FormatText(StoryNameCfg[73].name)

				arg_329_1.leftNameTxt_.text = var_332_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_16 = arg_329_1:GetWordFromCfg(1109305080)
				local var_332_17 = arg_329_1:FormatText(var_332_16.content)

				arg_329_1.text_.text = var_332_17

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_18 = 18
				local var_332_19 = utf8.len(var_332_17)
				local var_332_20 = var_332_18 <= 0 and var_332_14 or var_332_14 * (var_332_19 / var_332_18)

				if var_332_20 > 0 and var_332_14 < var_332_20 then
					arg_329_1.talkMaxDuration = var_332_20

					if var_332_20 + var_332_13 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_20 + var_332_13
					end
				end

				arg_329_1.text_.text = var_332_17
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305080", "story_v_side_new_1109305.awb") ~= 0 then
					local var_332_21 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305080", "story_v_side_new_1109305.awb") / 1000

					if var_332_21 + var_332_13 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_21 + var_332_13
					end

					if var_332_16.prefab_name ~= "" and arg_329_1.actors_[var_332_16.prefab_name] ~= nil then
						local var_332_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_16.prefab_name].transform, "story_v_side_new_1109305", "1109305080", "story_v_side_new_1109305.awb")

						arg_329_1:RecordAudio("1109305080", var_332_22)
						arg_329_1:RecordAudio("1109305080", var_332_22)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305080", "story_v_side_new_1109305.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305080", "story_v_side_new_1109305.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_23 = math.max(var_332_14, arg_329_1.talkMaxDuration)

			if var_332_13 <= arg_329_1.time_ and arg_329_1.time_ < var_332_13 + var_332_23 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_13) / var_332_23

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_13 + var_332_23 and arg_329_1.time_ < var_332_13 + var_332_23 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 1109305081
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play1109305088(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1093ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and not isNil(var_336_0) and arg_333_1.var_.characterEffect1093ui_story == nil then
				arg_333_1.var_.characterEffect1093ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.200000002980232

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 and not isNil(var_336_0) then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1093ui_story and not isNil(var_336_0) then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1093ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and not isNil(var_336_0) and arg_333_1.var_.characterEffect1093ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1093ui_story.fillRatio = var_336_5
			end

			local var_336_6 = 0
			local var_336_7 = 0.325

			if var_336_6 < arg_333_1.time_ and arg_333_1.time_ <= var_336_6 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_8 = arg_333_1:FormatText(StoryNameCfg[7].name)

				arg_333_1.leftNameTxt_.text = var_336_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_9 = arg_333_1:GetWordFromCfg(1109305081)
				local var_336_10 = arg_333_1:FormatText(var_336_9.content)

				arg_333_1.text_.text = var_336_10

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_11 = 13
				local var_336_12 = utf8.len(var_336_10)
				local var_336_13 = var_336_11 <= 0 and var_336_7 or var_336_7 * (var_336_12 / var_336_11)

				if var_336_13 > 0 and var_336_7 < var_336_13 then
					arg_333_1.talkMaxDuration = var_336_13

					if var_336_13 + var_336_6 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_13 + var_336_6
					end
				end

				arg_333_1.text_.text = var_336_10
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_14 = math.max(var_336_7, arg_333_1.talkMaxDuration)

			if var_336_6 <= arg_333_1.time_ and arg_333_1.time_ < var_336_6 + var_336_14 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_6) / var_336_14

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_6 + var_336_14 and arg_333_1.time_ < var_336_6 + var_336_14 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305088 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 1109305088
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play1109305089(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1093ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1093ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0, 100, 0)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1093ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, 100, 0)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["1093ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and not isNil(var_340_9) and arg_337_1.var_.characterEffect1093ui_story == nil then
				arg_337_1.var_.characterEffect1093ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.200000002980232

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 and not isNil(var_340_9) then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect1093ui_story and not isNil(var_340_9) then
					local var_340_13 = Mathf.Lerp(0, 0.5, var_340_12)

					arg_337_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_337_1.var_.characterEffect1093ui_story.fillRatio = var_340_13
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and not isNil(var_340_9) and arg_337_1.var_.characterEffect1093ui_story then
				local var_340_14 = 0.5

				arg_337_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_337_1.var_.characterEffect1093ui_story.fillRatio = var_340_14
			end

			local var_340_15 = 0
			local var_340_16 = 0.85

			if var_340_15 < arg_337_1.time_ and arg_337_1.time_ <= var_340_15 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_17 = arg_337_1:GetWordFromCfg(1109305088)
				local var_340_18 = arg_337_1:FormatText(var_340_17.content)

				arg_337_1.text_.text = var_340_18

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_19 = 34
				local var_340_20 = utf8.len(var_340_18)
				local var_340_21 = var_340_19 <= 0 and var_340_16 or var_340_16 * (var_340_20 / var_340_19)

				if var_340_21 > 0 and var_340_16 < var_340_21 then
					arg_337_1.talkMaxDuration = var_340_21

					if var_340_21 + var_340_15 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_21 + var_340_15
					end
				end

				arg_337_1.text_.text = var_340_18
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_22 = math.max(var_340_16, arg_337_1.talkMaxDuration)

			if var_340_15 <= arg_337_1.time_ and arg_337_1.time_ < var_340_15 + var_340_22 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_15) / var_340_22

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_15 + var_340_22 and arg_337_1.time_ < var_340_15 + var_340_22 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305089 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 1109305089
		arg_341_1.duration_ = 8.63

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play1109305090(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1093ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1093ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(0, -1.11, -5.88)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1093ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = arg_341_1.actors_["1093ui_story"]
			local var_344_10 = 0

			if var_344_10 < arg_341_1.time_ and arg_341_1.time_ <= var_344_10 + arg_344_0 and not isNil(var_344_9) and arg_341_1.var_.characterEffect1093ui_story == nil then
				arg_341_1.var_.characterEffect1093ui_story = var_344_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_11 = 0.200000002980232

			if var_344_10 <= arg_341_1.time_ and arg_341_1.time_ < var_344_10 + var_344_11 and not isNil(var_344_9) then
				local var_344_12 = (arg_341_1.time_ - var_344_10) / var_344_11

				if arg_341_1.var_.characterEffect1093ui_story and not isNil(var_344_9) then
					arg_341_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_10 + var_344_11 and arg_341_1.time_ < var_344_10 + var_344_11 + arg_344_0 and not isNil(var_344_9) and arg_341_1.var_.characterEffect1093ui_story then
				arg_341_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_344_13 = 0

			if var_344_13 < arg_341_1.time_ and arg_341_1.time_ <= var_344_13 + arg_344_0 then
				arg_341_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				arg_341_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_344_15 = 0
			local var_344_16 = 0.9

			if var_344_15 < arg_341_1.time_ and arg_341_1.time_ <= var_344_15 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_17 = arg_341_1:FormatText(StoryNameCfg[73].name)

				arg_341_1.leftNameTxt_.text = var_344_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_18 = arg_341_1:GetWordFromCfg(1109305089)
				local var_344_19 = arg_341_1:FormatText(var_344_18.content)

				arg_341_1.text_.text = var_344_19

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_20 = 36
				local var_344_21 = utf8.len(var_344_19)
				local var_344_22 = var_344_20 <= 0 and var_344_16 or var_344_16 * (var_344_21 / var_344_20)

				if var_344_22 > 0 and var_344_16 < var_344_22 then
					arg_341_1.talkMaxDuration = var_344_22

					if var_344_22 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_22 + var_344_15
					end
				end

				arg_341_1.text_.text = var_344_19
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305089", "story_v_side_new_1109305.awb") ~= 0 then
					local var_344_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305089", "story_v_side_new_1109305.awb") / 1000

					if var_344_23 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_23 + var_344_15
					end

					if var_344_18.prefab_name ~= "" and arg_341_1.actors_[var_344_18.prefab_name] ~= nil then
						local var_344_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_18.prefab_name].transform, "story_v_side_new_1109305", "1109305089", "story_v_side_new_1109305.awb")

						arg_341_1:RecordAudio("1109305089", var_344_24)
						arg_341_1:RecordAudio("1109305089", var_344_24)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305089", "story_v_side_new_1109305.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305089", "story_v_side_new_1109305.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_25 = math.max(var_344_16, arg_341_1.talkMaxDuration)

			if var_344_15 <= arg_341_1.time_ and arg_341_1.time_ < var_344_15 + var_344_25 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_15) / var_344_25

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_15 + var_344_25 and arg_341_1.time_ < var_344_15 + var_344_25 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305090 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 1109305090
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play1109305091(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1093ui_story"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and not isNil(var_348_0) and arg_345_1.var_.characterEffect1093ui_story == nil then
				arg_345_1.var_.characterEffect1093ui_story = var_348_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_2 = 0.200000002980232

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 and not isNil(var_348_0) then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.characterEffect1093ui_story and not isNil(var_348_0) then
					local var_348_4 = Mathf.Lerp(0, 0.5, var_348_3)

					arg_345_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1093ui_story.fillRatio = var_348_4
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and not isNil(var_348_0) and arg_345_1.var_.characterEffect1093ui_story then
				local var_348_5 = 0.5

				arg_345_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1093ui_story.fillRatio = var_348_5
			end

			local var_348_6 = 0
			local var_348_7 = 0.225

			if var_348_6 < arg_345_1.time_ and arg_345_1.time_ <= var_348_6 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_8 = arg_345_1:FormatText(StoryNameCfg[7].name)

				arg_345_1.leftNameTxt_.text = var_348_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_9 = arg_345_1:GetWordFromCfg(1109305090)
				local var_348_10 = arg_345_1:FormatText(var_348_9.content)

				arg_345_1.text_.text = var_348_10

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_11 = 9
				local var_348_12 = utf8.len(var_348_10)
				local var_348_13 = var_348_11 <= 0 and var_348_7 or var_348_7 * (var_348_12 / var_348_11)

				if var_348_13 > 0 and var_348_7 < var_348_13 then
					arg_345_1.talkMaxDuration = var_348_13

					if var_348_13 + var_348_6 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_13 + var_348_6
					end
				end

				arg_345_1.text_.text = var_348_10
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_14 = math.max(var_348_7, arg_345_1.talkMaxDuration)

			if var_348_6 <= arg_345_1.time_ and arg_345_1.time_ < var_348_6 + var_348_14 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_6) / var_348_14

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_6 + var_348_14 and arg_345_1.time_ < var_348_6 + var_348_14 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305091 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 1109305091
		arg_349_1.duration_ = 2

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play1109305092(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1093ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and not isNil(var_352_0) and arg_349_1.var_.characterEffect1093ui_story == nil then
				arg_349_1.var_.characterEffect1093ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 and not isNil(var_352_0) then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1093ui_story and not isNil(var_352_0) then
					arg_349_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and not isNil(var_352_0) and arg_349_1.var_.characterEffect1093ui_story then
				arg_349_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_352_4 = 0
			local var_352_5 = 0.175

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_6 = arg_349_1:FormatText(StoryNameCfg[73].name)

				arg_349_1.leftNameTxt_.text = var_352_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_7 = arg_349_1:GetWordFromCfg(1109305091)
				local var_352_8 = arg_349_1:FormatText(var_352_7.content)

				arg_349_1.text_.text = var_352_8

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_9 = 7
				local var_352_10 = utf8.len(var_352_8)
				local var_352_11 = var_352_9 <= 0 and var_352_5 or var_352_5 * (var_352_10 / var_352_9)

				if var_352_11 > 0 and var_352_5 < var_352_11 then
					arg_349_1.talkMaxDuration = var_352_11

					if var_352_11 + var_352_4 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_11 + var_352_4
					end
				end

				arg_349_1.text_.text = var_352_8
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305091", "story_v_side_new_1109305.awb") ~= 0 then
					local var_352_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305091", "story_v_side_new_1109305.awb") / 1000

					if var_352_12 + var_352_4 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_12 + var_352_4
					end

					if var_352_7.prefab_name ~= "" and arg_349_1.actors_[var_352_7.prefab_name] ~= nil then
						local var_352_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_7.prefab_name].transform, "story_v_side_new_1109305", "1109305091", "story_v_side_new_1109305.awb")

						arg_349_1:RecordAudio("1109305091", var_352_13)
						arg_349_1:RecordAudio("1109305091", var_352_13)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305091", "story_v_side_new_1109305.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305091", "story_v_side_new_1109305.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_14 = math.max(var_352_5, arg_349_1.talkMaxDuration)

			if var_352_4 <= arg_349_1.time_ and arg_349_1.time_ < var_352_4 + var_352_14 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_4) / var_352_14

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_4 + var_352_14 and arg_349_1.time_ < var_352_4 + var_352_14 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305092 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 1109305092
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play1109305093(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1093ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and not isNil(var_356_0) and arg_353_1.var_.characterEffect1093ui_story == nil then
				arg_353_1.var_.characterEffect1093ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 and not isNil(var_356_0) then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect1093ui_story and not isNil(var_356_0) then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1093ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and not isNil(var_356_0) and arg_353_1.var_.characterEffect1093ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1093ui_story.fillRatio = var_356_5
			end

			local var_356_6 = 0
			local var_356_7 = 0.4

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_8 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_9 = arg_353_1:GetWordFromCfg(1109305092)
				local var_356_10 = arg_353_1:FormatText(var_356_9.content)

				arg_353_1.text_.text = var_356_10

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_11 = 16
				local var_356_12 = utf8.len(var_356_10)
				local var_356_13 = var_356_11 <= 0 and var_356_7 or var_356_7 * (var_356_12 / var_356_11)

				if var_356_13 > 0 and var_356_7 < var_356_13 then
					arg_353_1.talkMaxDuration = var_356_13

					if var_356_13 + var_356_6 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_13 + var_356_6
					end
				end

				arg_353_1.text_.text = var_356_10
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_14 = math.max(var_356_7, arg_353_1.talkMaxDuration)

			if var_356_6 <= arg_353_1.time_ and arg_353_1.time_ < var_356_6 + var_356_14 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_6) / var_356_14

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_6 + var_356_14 and arg_353_1.time_ < var_356_6 + var_356_14 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305093 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 1109305093
		arg_357_1.duration_ = 2.63

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play1109305094(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1093ui_story"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos1093ui_story = var_360_0.localPosition
			end

			local var_360_2 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2
				local var_360_4 = Vector3.New(0, -1.11, -5.88)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1093ui_story, var_360_4, var_360_3)

				local var_360_5 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_5.x, var_360_5.y, var_360_5.z)

				local var_360_6 = var_360_0.localEulerAngles

				var_360_6.z = 0
				var_360_6.x = 0
				var_360_0.localEulerAngles = var_360_6
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_360_7 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_7.x, var_360_7.y, var_360_7.z)

				local var_360_8 = var_360_0.localEulerAngles

				var_360_8.z = 0
				var_360_8.x = 0
				var_360_0.localEulerAngles = var_360_8
			end

			local var_360_9 = arg_357_1.actors_["1093ui_story"]
			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 and not isNil(var_360_9) and arg_357_1.var_.characterEffect1093ui_story == nil then
				arg_357_1.var_.characterEffect1093ui_story = var_360_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_11 = 0.200000002980232

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_11 and not isNil(var_360_9) then
				local var_360_12 = (arg_357_1.time_ - var_360_10) / var_360_11

				if arg_357_1.var_.characterEffect1093ui_story and not isNil(var_360_9) then
					arg_357_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_10 + var_360_11 and arg_357_1.time_ < var_360_10 + var_360_11 + arg_360_0 and not isNil(var_360_9) and arg_357_1.var_.characterEffect1093ui_story then
				arg_357_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_360_13 = 0

			if var_360_13 < arg_357_1.time_ and arg_357_1.time_ <= var_360_13 + arg_360_0 then
				arg_357_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_1")
			end

			local var_360_14 = 0

			if var_360_14 < arg_357_1.time_ and arg_357_1.time_ <= var_360_14 + arg_360_0 then
				arg_357_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			if arg_357_1.frameCnt_ <= 1 then
				arg_357_1.dialog_:SetActive(false)
			end

			local var_360_15 = 0.433333333333333
			local var_360_16 = 0.375

			if var_360_15 < arg_357_1.time_ and arg_357_1.time_ <= var_360_15 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0

				arg_357_1.dialog_:SetActive(true)

				local var_360_17 = LeanTween.value(arg_357_1.dialog_, 0, 1, 0.3)

				var_360_17:setOnUpdate(LuaHelper.FloatAction(function(arg_361_0)
					arg_357_1.dialogCg_.alpha = arg_361_0
				end))
				var_360_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_357_1.dialog_)
					var_360_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_357_1.duration_ = arg_357_1.duration_ + 0.3

				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_18 = arg_357_1:FormatText(StoryNameCfg[73].name)

				arg_357_1.leftNameTxt_.text = var_360_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_19 = arg_357_1:GetWordFromCfg(1109305093)
				local var_360_20 = arg_357_1:FormatText(var_360_19.content)

				arg_357_1.text_.text = var_360_20

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_21 = 15
				local var_360_22 = utf8.len(var_360_20)
				local var_360_23 = var_360_21 <= 0 and var_360_16 or var_360_16 * (var_360_22 / var_360_21)

				if var_360_23 > 0 and var_360_16 < var_360_23 then
					arg_357_1.talkMaxDuration = var_360_23
					var_360_15 = var_360_15 + 0.3

					if var_360_23 + var_360_15 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_23 + var_360_15
					end
				end

				arg_357_1.text_.text = var_360_20
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305093", "story_v_side_new_1109305.awb") ~= 0 then
					local var_360_24 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305093", "story_v_side_new_1109305.awb") / 1000

					if var_360_24 + var_360_15 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_24 + var_360_15
					end

					if var_360_19.prefab_name ~= "" and arg_357_1.actors_[var_360_19.prefab_name] ~= nil then
						local var_360_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_19.prefab_name].transform, "story_v_side_new_1109305", "1109305093", "story_v_side_new_1109305.awb")

						arg_357_1:RecordAudio("1109305093", var_360_25)
						arg_357_1:RecordAudio("1109305093", var_360_25)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305093", "story_v_side_new_1109305.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305093", "story_v_side_new_1109305.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_26 = var_360_15 + 0.3
			local var_360_27 = math.max(var_360_16, arg_357_1.talkMaxDuration)

			if var_360_26 <= arg_357_1.time_ and arg_357_1.time_ < var_360_26 + var_360_27 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_26) / var_360_27

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_26 + var_360_27 and arg_357_1.time_ < var_360_26 + var_360_27 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305094 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1109305094
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1109305095(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1093ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and not isNil(var_366_0) and arg_363_1.var_.characterEffect1093ui_story == nil then
				arg_363_1.var_.characterEffect1093ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 and not isNil(var_366_0) then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1093ui_story and not isNil(var_366_0) then
					local var_366_4 = Mathf.Lerp(0, 0.5, var_366_3)

					arg_363_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1093ui_story.fillRatio = var_366_4
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and not isNil(var_366_0) and arg_363_1.var_.characterEffect1093ui_story then
				local var_366_5 = 0.5

				arg_363_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1093ui_story.fillRatio = var_366_5
			end

			local var_366_6 = 0
			local var_366_7 = 0.875

			if var_366_6 < arg_363_1.time_ and arg_363_1.time_ <= var_366_6 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_8 = arg_363_1:FormatText(StoryNameCfg[7].name)

				arg_363_1.leftNameTxt_.text = var_366_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_9 = arg_363_1:GetWordFromCfg(1109305094)
				local var_366_10 = arg_363_1:FormatText(var_366_9.content)

				arg_363_1.text_.text = var_366_10

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_11 = 35
				local var_366_12 = utf8.len(var_366_10)
				local var_366_13 = var_366_11 <= 0 and var_366_7 or var_366_7 * (var_366_12 / var_366_11)

				if var_366_13 > 0 and var_366_7 < var_366_13 then
					arg_363_1.talkMaxDuration = var_366_13

					if var_366_13 + var_366_6 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_13 + var_366_6
					end
				end

				arg_363_1.text_.text = var_366_10
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_14 = math.max(var_366_7, arg_363_1.talkMaxDuration)

			if var_366_6 <= arg_363_1.time_ and arg_363_1.time_ < var_366_6 + var_366_14 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_6) / var_366_14

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_6 + var_366_14 and arg_363_1.time_ < var_366_6 + var_366_14 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305095 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 1109305095
		arg_367_1.duration_ = 5.9

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play1109305096(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1093ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and not isNil(var_370_0) and arg_367_1.var_.characterEffect1093ui_story == nil then
				arg_367_1.var_.characterEffect1093ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.200000002980232

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 and not isNil(var_370_0) then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1093ui_story and not isNil(var_370_0) then
					arg_367_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and not isNil(var_370_0) and arg_367_1.var_.characterEffect1093ui_story then
				arg_367_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_370_4 = 0
			local var_370_5 = 0.65

			if var_370_4 < arg_367_1.time_ and arg_367_1.time_ <= var_370_4 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_6 = arg_367_1:FormatText(StoryNameCfg[73].name)

				arg_367_1.leftNameTxt_.text = var_370_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_7 = arg_367_1:GetWordFromCfg(1109305095)
				local var_370_8 = arg_367_1:FormatText(var_370_7.content)

				arg_367_1.text_.text = var_370_8

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_9 = 26
				local var_370_10 = utf8.len(var_370_8)
				local var_370_11 = var_370_9 <= 0 and var_370_5 or var_370_5 * (var_370_10 / var_370_9)

				if var_370_11 > 0 and var_370_5 < var_370_11 then
					arg_367_1.talkMaxDuration = var_370_11

					if var_370_11 + var_370_4 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_11 + var_370_4
					end
				end

				arg_367_1.text_.text = var_370_8
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305095", "story_v_side_new_1109305.awb") ~= 0 then
					local var_370_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305095", "story_v_side_new_1109305.awb") / 1000

					if var_370_12 + var_370_4 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_12 + var_370_4
					end

					if var_370_7.prefab_name ~= "" and arg_367_1.actors_[var_370_7.prefab_name] ~= nil then
						local var_370_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_7.prefab_name].transform, "story_v_side_new_1109305", "1109305095", "story_v_side_new_1109305.awb")

						arg_367_1:RecordAudio("1109305095", var_370_13)
						arg_367_1:RecordAudio("1109305095", var_370_13)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305095", "story_v_side_new_1109305.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305095", "story_v_side_new_1109305.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_5, arg_367_1.talkMaxDuration)

			if var_370_4 <= arg_367_1.time_ and arg_367_1.time_ < var_370_4 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_4) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_4 + var_370_14 and arg_367_1.time_ < var_370_4 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305096 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 1109305096
		arg_371_1.duration_ = 3.53

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play1109305097(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.425

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_2 = arg_371_1:FormatText(StoryNameCfg[73].name)

				arg_371_1.leftNameTxt_.text = var_374_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_3 = arg_371_1:GetWordFromCfg(1109305096)
				local var_374_4 = arg_371_1:FormatText(var_374_3.content)

				arg_371_1.text_.text = var_374_4

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_5 = 17
				local var_374_6 = utf8.len(var_374_4)
				local var_374_7 = var_374_5 <= 0 and var_374_1 or var_374_1 * (var_374_6 / var_374_5)

				if var_374_7 > 0 and var_374_1 < var_374_7 then
					arg_371_1.talkMaxDuration = var_374_7

					if var_374_7 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_7 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_4
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305096", "story_v_side_new_1109305.awb") ~= 0 then
					local var_374_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305096", "story_v_side_new_1109305.awb") / 1000

					if var_374_8 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_8 + var_374_0
					end

					if var_374_3.prefab_name ~= "" and arg_371_1.actors_[var_374_3.prefab_name] ~= nil then
						local var_374_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_3.prefab_name].transform, "story_v_side_new_1109305", "1109305096", "story_v_side_new_1109305.awb")

						arg_371_1:RecordAudio("1109305096", var_374_9)
						arg_371_1:RecordAudio("1109305096", var_374_9)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305096", "story_v_side_new_1109305.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305096", "story_v_side_new_1109305.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_10 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_10 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_10

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_10 and arg_371_1.time_ < var_374_0 + var_374_10 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305097 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 1109305097
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play1109305098(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1093ui_story"]
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 and not isNil(var_378_0) and arg_375_1.var_.characterEffect1093ui_story == nil then
				arg_375_1.var_.characterEffect1093ui_story = var_378_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_2 = 0.200000002980232

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 and not isNil(var_378_0) then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2

				if arg_375_1.var_.characterEffect1093ui_story and not isNil(var_378_0) then
					local var_378_4 = Mathf.Lerp(0, 0.5, var_378_3)

					arg_375_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1093ui_story.fillRatio = var_378_4
				end
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 and not isNil(var_378_0) and arg_375_1.var_.characterEffect1093ui_story then
				local var_378_5 = 0.5

				arg_375_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1093ui_story.fillRatio = var_378_5
			end

			local var_378_6 = 0
			local var_378_7 = 0.25

			if var_378_6 < arg_375_1.time_ and arg_375_1.time_ <= var_378_6 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_8 = arg_375_1:FormatText(StoryNameCfg[7].name)

				arg_375_1.leftNameTxt_.text = var_378_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_9 = arg_375_1:GetWordFromCfg(1109305097)
				local var_378_10 = arg_375_1:FormatText(var_378_9.content)

				arg_375_1.text_.text = var_378_10

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_11 = 10
				local var_378_12 = utf8.len(var_378_10)
				local var_378_13 = var_378_11 <= 0 and var_378_7 or var_378_7 * (var_378_12 / var_378_11)

				if var_378_13 > 0 and var_378_7 < var_378_13 then
					arg_375_1.talkMaxDuration = var_378_13

					if var_378_13 + var_378_6 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_13 + var_378_6
					end
				end

				arg_375_1.text_.text = var_378_10
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_14 = math.max(var_378_7, arg_375_1.talkMaxDuration)

			if var_378_6 <= arg_375_1.time_ and arg_375_1.time_ < var_378_6 + var_378_14 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_6) / var_378_14

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_6 + var_378_14 and arg_375_1.time_ < var_378_6 + var_378_14 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305098 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 1109305098
		arg_379_1.duration_ = 6.13

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play1109305099(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1093ui_story"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos1093ui_story = var_382_0.localPosition
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(0, -1.11, -5.88)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1093ui_story, var_382_4, var_382_3)

				local var_382_5 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_5.x, var_382_5.y, var_382_5.z)

				local var_382_6 = var_382_0.localEulerAngles

				var_382_6.z = 0
				var_382_6.x = 0
				var_382_0.localEulerAngles = var_382_6
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_382_7 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_7.x, var_382_7.y, var_382_7.z)

				local var_382_8 = var_382_0.localEulerAngles

				var_382_8.z = 0
				var_382_8.x = 0
				var_382_0.localEulerAngles = var_382_8
			end

			local var_382_9 = arg_379_1.actors_["1093ui_story"]
			local var_382_10 = 0

			if var_382_10 < arg_379_1.time_ and arg_379_1.time_ <= var_382_10 + arg_382_0 and not isNil(var_382_9) and arg_379_1.var_.characterEffect1093ui_story == nil then
				arg_379_1.var_.characterEffect1093ui_story = var_382_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_11 = 0.200000002980232

			if var_382_10 <= arg_379_1.time_ and arg_379_1.time_ < var_382_10 + var_382_11 and not isNil(var_382_9) then
				local var_382_12 = (arg_379_1.time_ - var_382_10) / var_382_11

				if arg_379_1.var_.characterEffect1093ui_story and not isNil(var_382_9) then
					arg_379_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_10 + var_382_11 and arg_379_1.time_ < var_382_10 + var_382_11 + arg_382_0 and not isNil(var_382_9) and arg_379_1.var_.characterEffect1093ui_story then
				arg_379_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_382_13 = 0

			if var_382_13 < arg_379_1.time_ and arg_379_1.time_ <= var_382_13 + arg_382_0 then
				arg_379_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			local var_382_14 = 0

			if var_382_14 < arg_379_1.time_ and arg_379_1.time_ <= var_382_14 + arg_382_0 then
				arg_379_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_382_15 = 0
			local var_382_16 = 0.525

			if var_382_15 < arg_379_1.time_ and arg_379_1.time_ <= var_382_15 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_17 = arg_379_1:FormatText(StoryNameCfg[73].name)

				arg_379_1.leftNameTxt_.text = var_382_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_18 = arg_379_1:GetWordFromCfg(1109305098)
				local var_382_19 = arg_379_1:FormatText(var_382_18.content)

				arg_379_1.text_.text = var_382_19

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_20 = 21
				local var_382_21 = utf8.len(var_382_19)
				local var_382_22 = var_382_20 <= 0 and var_382_16 or var_382_16 * (var_382_21 / var_382_20)

				if var_382_22 > 0 and var_382_16 < var_382_22 then
					arg_379_1.talkMaxDuration = var_382_22

					if var_382_22 + var_382_15 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_22 + var_382_15
					end
				end

				arg_379_1.text_.text = var_382_19
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305098", "story_v_side_new_1109305.awb") ~= 0 then
					local var_382_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305098", "story_v_side_new_1109305.awb") / 1000

					if var_382_23 + var_382_15 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_23 + var_382_15
					end

					if var_382_18.prefab_name ~= "" and arg_379_1.actors_[var_382_18.prefab_name] ~= nil then
						local var_382_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_18.prefab_name].transform, "story_v_side_new_1109305", "1109305098", "story_v_side_new_1109305.awb")

						arg_379_1:RecordAudio("1109305098", var_382_24)
						arg_379_1:RecordAudio("1109305098", var_382_24)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305098", "story_v_side_new_1109305.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305098", "story_v_side_new_1109305.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_25 = math.max(var_382_16, arg_379_1.talkMaxDuration)

			if var_382_15 <= arg_379_1.time_ and arg_379_1.time_ < var_382_15 + var_382_25 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_15) / var_382_25

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_15 + var_382_25 and arg_379_1.time_ < var_382_15 + var_382_25 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305099 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 1109305099
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play1109305100(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1093ui_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and not isNil(var_386_0) and arg_383_1.var_.characterEffect1093ui_story == nil then
				arg_383_1.var_.characterEffect1093ui_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.200000002980232

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 and not isNil(var_386_0) then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect1093ui_story and not isNil(var_386_0) then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_383_1.var_.characterEffect1093ui_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and not isNil(var_386_0) and arg_383_1.var_.characterEffect1093ui_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_383_1.var_.characterEffect1093ui_story.fillRatio = var_386_5
			end

			local var_386_6 = 0
			local var_386_7 = 0.275

			if var_386_6 < arg_383_1.time_ and arg_383_1.time_ <= var_386_6 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_8 = arg_383_1:FormatText(StoryNameCfg[7].name)

				arg_383_1.leftNameTxt_.text = var_386_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_9 = arg_383_1:GetWordFromCfg(1109305099)
				local var_386_10 = arg_383_1:FormatText(var_386_9.content)

				arg_383_1.text_.text = var_386_10

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_11 = 11
				local var_386_12 = utf8.len(var_386_10)
				local var_386_13 = var_386_11 <= 0 and var_386_7 or var_386_7 * (var_386_12 / var_386_11)

				if var_386_13 > 0 and var_386_7 < var_386_13 then
					arg_383_1.talkMaxDuration = var_386_13

					if var_386_13 + var_386_6 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_13 + var_386_6
					end
				end

				arg_383_1.text_.text = var_386_10
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_14 = math.max(var_386_7, arg_383_1.talkMaxDuration)

			if var_386_6 <= arg_383_1.time_ and arg_383_1.time_ < var_386_6 + var_386_14 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_6) / var_386_14

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_6 + var_386_14 and arg_383_1.time_ < var_386_6 + var_386_14 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305100 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 1109305100
		arg_387_1.duration_ = 6.17

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play1109305101(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1093ui_story"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 and not isNil(var_390_0) and arg_387_1.var_.characterEffect1093ui_story == nil then
				arg_387_1.var_.characterEffect1093ui_story = var_390_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_2 = 0.200000002980232

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 and not isNil(var_390_0) then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2

				if arg_387_1.var_.characterEffect1093ui_story and not isNil(var_390_0) then
					arg_387_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 and not isNil(var_390_0) and arg_387_1.var_.characterEffect1093ui_story then
				arg_387_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_390_4 = 0
			local var_390_5 = 0.65

			if var_390_4 < arg_387_1.time_ and arg_387_1.time_ <= var_390_4 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_6 = arg_387_1:FormatText(StoryNameCfg[73].name)

				arg_387_1.leftNameTxt_.text = var_390_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_7 = arg_387_1:GetWordFromCfg(1109305100)
				local var_390_8 = arg_387_1:FormatText(var_390_7.content)

				arg_387_1.text_.text = var_390_8

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_9 = 26
				local var_390_10 = utf8.len(var_390_8)
				local var_390_11 = var_390_9 <= 0 and var_390_5 or var_390_5 * (var_390_10 / var_390_9)

				if var_390_11 > 0 and var_390_5 < var_390_11 then
					arg_387_1.talkMaxDuration = var_390_11

					if var_390_11 + var_390_4 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_11 + var_390_4
					end
				end

				arg_387_1.text_.text = var_390_8
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305100", "story_v_side_new_1109305.awb") ~= 0 then
					local var_390_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305100", "story_v_side_new_1109305.awb") / 1000

					if var_390_12 + var_390_4 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_12 + var_390_4
					end

					if var_390_7.prefab_name ~= "" and arg_387_1.actors_[var_390_7.prefab_name] ~= nil then
						local var_390_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_7.prefab_name].transform, "story_v_side_new_1109305", "1109305100", "story_v_side_new_1109305.awb")

						arg_387_1:RecordAudio("1109305100", var_390_13)
						arg_387_1:RecordAudio("1109305100", var_390_13)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305100", "story_v_side_new_1109305.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305100", "story_v_side_new_1109305.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_14 = math.max(var_390_5, arg_387_1.talkMaxDuration)

			if var_390_4 <= arg_387_1.time_ and arg_387_1.time_ < var_390_4 + var_390_14 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_4) / var_390_14

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_4 + var_390_14 and arg_387_1.time_ < var_390_4 + var_390_14 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305101 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 1109305101
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play1109305102(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1093ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and not isNil(var_394_0) and arg_391_1.var_.characterEffect1093ui_story == nil then
				arg_391_1.var_.characterEffect1093ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.200000002980232

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 and not isNil(var_394_0) then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect1093ui_story and not isNil(var_394_0) then
					local var_394_4 = Mathf.Lerp(0, 0.5, var_394_3)

					arg_391_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1093ui_story.fillRatio = var_394_4
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and not isNil(var_394_0) and arg_391_1.var_.characterEffect1093ui_story then
				local var_394_5 = 0.5

				arg_391_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1093ui_story.fillRatio = var_394_5
			end

			local var_394_6 = 0
			local var_394_7 = 0.8

			if var_394_6 < arg_391_1.time_ and arg_391_1.time_ <= var_394_6 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_8 = arg_391_1:FormatText(StoryNameCfg[7].name)

				arg_391_1.leftNameTxt_.text = var_394_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_9 = arg_391_1:GetWordFromCfg(1109305101)
				local var_394_10 = arg_391_1:FormatText(var_394_9.content)

				arg_391_1.text_.text = var_394_10

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_11 = 32
				local var_394_12 = utf8.len(var_394_10)
				local var_394_13 = var_394_11 <= 0 and var_394_7 or var_394_7 * (var_394_12 / var_394_11)

				if var_394_13 > 0 and var_394_7 < var_394_13 then
					arg_391_1.talkMaxDuration = var_394_13

					if var_394_13 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_13 + var_394_6
					end
				end

				arg_391_1.text_.text = var_394_10
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_14 = math.max(var_394_7, arg_391_1.talkMaxDuration)

			if var_394_6 <= arg_391_1.time_ and arg_391_1.time_ < var_394_6 + var_394_14 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_6) / var_394_14

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_6 + var_394_14 and arg_391_1.time_ < var_394_6 + var_394_14 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305102 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 1109305102
		arg_395_1.duration_ = 5.23

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play1109305103(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1093ui_story"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1093ui_story = var_398_0.localPosition
			end

			local var_398_2 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2
				local var_398_4 = Vector3.New(0, -1.11, -5.88)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1093ui_story, var_398_4, var_398_3)

				local var_398_5 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_5.x, var_398_5.y, var_398_5.z)

				local var_398_6 = var_398_0.localEulerAngles

				var_398_6.z = 0
				var_398_6.x = 0
				var_398_0.localEulerAngles = var_398_6
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_398_7 = manager.ui.mainCamera.transform.position - var_398_0.position

				var_398_0.forward = Vector3.New(var_398_7.x, var_398_7.y, var_398_7.z)

				local var_398_8 = var_398_0.localEulerAngles

				var_398_8.z = 0
				var_398_8.x = 0
				var_398_0.localEulerAngles = var_398_8
			end

			local var_398_9 = arg_395_1.actors_["1093ui_story"]
			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 and not isNil(var_398_9) and arg_395_1.var_.characterEffect1093ui_story == nil then
				arg_395_1.var_.characterEffect1093ui_story = var_398_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_11 = 0.200000002980232

			if var_398_10 <= arg_395_1.time_ and arg_395_1.time_ < var_398_10 + var_398_11 and not isNil(var_398_9) then
				local var_398_12 = (arg_395_1.time_ - var_398_10) / var_398_11

				if arg_395_1.var_.characterEffect1093ui_story and not isNil(var_398_9) then
					arg_395_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_10 + var_398_11 and arg_395_1.time_ < var_398_10 + var_398_11 + arg_398_0 and not isNil(var_398_9) and arg_395_1.var_.characterEffect1093ui_story then
				arg_395_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_398_13 = 0

			if var_398_13 < arg_395_1.time_ and arg_395_1.time_ <= var_398_13 + arg_398_0 then
				arg_395_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 then
				arg_395_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_398_15 = 0
			local var_398_16 = 0.55

			if var_398_15 < arg_395_1.time_ and arg_395_1.time_ <= var_398_15 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_17 = arg_395_1:FormatText(StoryNameCfg[73].name)

				arg_395_1.leftNameTxt_.text = var_398_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_18 = arg_395_1:GetWordFromCfg(1109305102)
				local var_398_19 = arg_395_1:FormatText(var_398_18.content)

				arg_395_1.text_.text = var_398_19

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_20 = 22
				local var_398_21 = utf8.len(var_398_19)
				local var_398_22 = var_398_20 <= 0 and var_398_16 or var_398_16 * (var_398_21 / var_398_20)

				if var_398_22 > 0 and var_398_16 < var_398_22 then
					arg_395_1.talkMaxDuration = var_398_22

					if var_398_22 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_22 + var_398_15
					end
				end

				arg_395_1.text_.text = var_398_19
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305102", "story_v_side_new_1109305.awb") ~= 0 then
					local var_398_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305102", "story_v_side_new_1109305.awb") / 1000

					if var_398_23 + var_398_15 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_23 + var_398_15
					end

					if var_398_18.prefab_name ~= "" and arg_395_1.actors_[var_398_18.prefab_name] ~= nil then
						local var_398_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_18.prefab_name].transform, "story_v_side_new_1109305", "1109305102", "story_v_side_new_1109305.awb")

						arg_395_1:RecordAudio("1109305102", var_398_24)
						arg_395_1:RecordAudio("1109305102", var_398_24)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305102", "story_v_side_new_1109305.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305102", "story_v_side_new_1109305.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_25 = math.max(var_398_16, arg_395_1.talkMaxDuration)

			if var_398_15 <= arg_395_1.time_ and arg_395_1.time_ < var_398_15 + var_398_25 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_15) / var_398_25

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_15 + var_398_25 and arg_395_1.time_ < var_398_15 + var_398_25 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305103 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 1109305103
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play1109305104(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1093ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and not isNil(var_402_0) and arg_399_1.var_.characterEffect1093ui_story == nil then
				arg_399_1.var_.characterEffect1093ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.200000002980232

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 and not isNil(var_402_0) then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1093ui_story and not isNil(var_402_0) then
					local var_402_4 = Mathf.Lerp(0, 0.5, var_402_3)

					arg_399_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_399_1.var_.characterEffect1093ui_story.fillRatio = var_402_4
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and not isNil(var_402_0) and arg_399_1.var_.characterEffect1093ui_story then
				local var_402_5 = 0.5

				arg_399_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_399_1.var_.characterEffect1093ui_story.fillRatio = var_402_5
			end

			local var_402_6 = 0
			local var_402_7 = 0.95

			if var_402_6 < arg_399_1.time_ and arg_399_1.time_ <= var_402_6 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_8 = arg_399_1:FormatText(StoryNameCfg[7].name)

				arg_399_1.leftNameTxt_.text = var_402_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_9 = arg_399_1:GetWordFromCfg(1109305103)
				local var_402_10 = arg_399_1:FormatText(var_402_9.content)

				arg_399_1.text_.text = var_402_10

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_11 = 38
				local var_402_12 = utf8.len(var_402_10)
				local var_402_13 = var_402_11 <= 0 and var_402_7 or var_402_7 * (var_402_12 / var_402_11)

				if var_402_13 > 0 and var_402_7 < var_402_13 then
					arg_399_1.talkMaxDuration = var_402_13

					if var_402_13 + var_402_6 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_13 + var_402_6
					end
				end

				arg_399_1.text_.text = var_402_10
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_14 = math.max(var_402_7, arg_399_1.talkMaxDuration)

			if var_402_6 <= arg_399_1.time_ and arg_399_1.time_ < var_402_6 + var_402_14 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_6) / var_402_14

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_6 + var_402_14 and arg_399_1.time_ < var_402_6 + var_402_14 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305104 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 1109305104
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play1109305105(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1093ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos1093ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, 100, 0)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1093ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(0, 100, 0)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = arg_403_1.actors_["1093ui_story"]
			local var_406_10 = 0

			if var_406_10 < arg_403_1.time_ and arg_403_1.time_ <= var_406_10 + arg_406_0 and not isNil(var_406_9) and arg_403_1.var_.characterEffect1093ui_story == nil then
				arg_403_1.var_.characterEffect1093ui_story = var_406_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_11 = 0.200000002980232

			if var_406_10 <= arg_403_1.time_ and arg_403_1.time_ < var_406_10 + var_406_11 and not isNil(var_406_9) then
				local var_406_12 = (arg_403_1.time_ - var_406_10) / var_406_11

				if arg_403_1.var_.characterEffect1093ui_story and not isNil(var_406_9) then
					local var_406_13 = Mathf.Lerp(0, 0.5, var_406_12)

					arg_403_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1093ui_story.fillRatio = var_406_13
				end
			end

			if arg_403_1.time_ >= var_406_10 + var_406_11 and arg_403_1.time_ < var_406_10 + var_406_11 + arg_406_0 and not isNil(var_406_9) and arg_403_1.var_.characterEffect1093ui_story then
				local var_406_14 = 0.5

				arg_403_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1093ui_story.fillRatio = var_406_14
			end

			local var_406_15 = 0
			local var_406_16 = 0.5

			if var_406_15 < arg_403_1.time_ and arg_403_1.time_ <= var_406_15 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_17 = arg_403_1:GetWordFromCfg(1109305104)
				local var_406_18 = arg_403_1:FormatText(var_406_17.content)

				arg_403_1.text_.text = var_406_18

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_19 = 20
				local var_406_20 = utf8.len(var_406_18)
				local var_406_21 = var_406_19 <= 0 and var_406_16 or var_406_16 * (var_406_20 / var_406_19)

				if var_406_21 > 0 and var_406_16 < var_406_21 then
					arg_403_1.talkMaxDuration = var_406_21

					if var_406_21 + var_406_15 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_21 + var_406_15
					end
				end

				arg_403_1.text_.text = var_406_18
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_22 = math.max(var_406_16, arg_403_1.talkMaxDuration)

			if var_406_15 <= arg_403_1.time_ and arg_403_1.time_ < var_406_15 + var_406_22 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_15) / var_406_22

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_15 + var_406_22 and arg_403_1.time_ < var_406_15 + var_406_22 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305105 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 1109305105
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play1109305106(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.625

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

				local var_410_2 = arg_407_1:GetWordFromCfg(1109305105)
				local var_410_3 = arg_407_1:FormatText(var_410_2.content)

				arg_407_1.text_.text = var_410_3

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_4 = 25
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
	Play1109305106 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 1109305106
		arg_411_1.duration_ = 7.27

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play1109305107(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1093ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos1093ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0, -1.11, -5.88)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1093ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["1093ui_story"]
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect1093ui_story == nil then
				arg_411_1.var_.characterEffect1093ui_story = var_414_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_11 = 0.200000002980232

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_11 and not isNil(var_414_9) then
				local var_414_12 = (arg_411_1.time_ - var_414_10) / var_414_11

				if arg_411_1.var_.characterEffect1093ui_story and not isNil(var_414_9) then
					arg_411_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_10 + var_414_11 and arg_411_1.time_ < var_414_10 + var_414_11 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect1093ui_story then
				arg_411_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_414_13 = 0

			if var_414_13 < arg_411_1.time_ and arg_411_1.time_ <= var_414_13 + arg_414_0 then
				arg_411_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_414_14 = 0

			if var_414_14 < arg_411_1.time_ and arg_411_1.time_ <= var_414_14 + arg_414_0 then
				arg_411_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_414_15 = 0
			local var_414_16 = 0.7

			if var_414_15 < arg_411_1.time_ and arg_411_1.time_ <= var_414_15 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_17 = arg_411_1:FormatText(StoryNameCfg[73].name)

				arg_411_1.leftNameTxt_.text = var_414_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_18 = arg_411_1:GetWordFromCfg(1109305106)
				local var_414_19 = arg_411_1:FormatText(var_414_18.content)

				arg_411_1.text_.text = var_414_19

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_20 = 28
				local var_414_21 = utf8.len(var_414_19)
				local var_414_22 = var_414_20 <= 0 and var_414_16 or var_414_16 * (var_414_21 / var_414_20)

				if var_414_22 > 0 and var_414_16 < var_414_22 then
					arg_411_1.talkMaxDuration = var_414_22

					if var_414_22 + var_414_15 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_22 + var_414_15
					end
				end

				arg_411_1.text_.text = var_414_19
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305106", "story_v_side_new_1109305.awb") ~= 0 then
					local var_414_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305106", "story_v_side_new_1109305.awb") / 1000

					if var_414_23 + var_414_15 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_23 + var_414_15
					end

					if var_414_18.prefab_name ~= "" and arg_411_1.actors_[var_414_18.prefab_name] ~= nil then
						local var_414_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_18.prefab_name].transform, "story_v_side_new_1109305", "1109305106", "story_v_side_new_1109305.awb")

						arg_411_1:RecordAudio("1109305106", var_414_24)
						arg_411_1:RecordAudio("1109305106", var_414_24)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305106", "story_v_side_new_1109305.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305106", "story_v_side_new_1109305.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_25 = math.max(var_414_16, arg_411_1.talkMaxDuration)

			if var_414_15 <= arg_411_1.time_ and arg_411_1.time_ < var_414_15 + var_414_25 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_15) / var_414_25

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_15 + var_414_25 and arg_411_1.time_ < var_414_15 + var_414_25 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305107 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 1109305107
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play1109305108(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1093ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect1093ui_story == nil then
				arg_415_1.var_.characterEffect1093ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 and not isNil(var_418_0) then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect1093ui_story and not isNil(var_418_0) then
					local var_418_4 = Mathf.Lerp(0, 0.5, var_418_3)

					arg_415_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_415_1.var_.characterEffect1093ui_story.fillRatio = var_418_4
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect1093ui_story then
				local var_418_5 = 0.5

				arg_415_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_415_1.var_.characterEffect1093ui_story.fillRatio = var_418_5
			end

			local var_418_6 = 0
			local var_418_7 = 0.375

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_8 = arg_415_1:FormatText(StoryNameCfg[7].name)

				arg_415_1.leftNameTxt_.text = var_418_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_9 = arg_415_1:GetWordFromCfg(1109305107)
				local var_418_10 = arg_415_1:FormatText(var_418_9.content)

				arg_415_1.text_.text = var_418_10

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_11 = 15
				local var_418_12 = utf8.len(var_418_10)
				local var_418_13 = var_418_11 <= 0 and var_418_7 or var_418_7 * (var_418_12 / var_418_11)

				if var_418_13 > 0 and var_418_7 < var_418_13 then
					arg_415_1.talkMaxDuration = var_418_13

					if var_418_13 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_13 + var_418_6
					end
				end

				arg_415_1.text_.text = var_418_10
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_14 = math.max(var_418_7, arg_415_1.talkMaxDuration)

			if var_418_6 <= arg_415_1.time_ and arg_415_1.time_ < var_418_6 + var_418_14 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_6) / var_418_14

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_6 + var_418_14 and arg_415_1.time_ < var_418_6 + var_418_14 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305108 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1109305108
		arg_419_1.duration_ = 6.57

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1109305109(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1093ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and not isNil(var_422_0) and arg_419_1.var_.characterEffect1093ui_story == nil then
				arg_419_1.var_.characterEffect1093ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.200000002980232

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 and not isNil(var_422_0) then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect1093ui_story and not isNil(var_422_0) then
					arg_419_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and not isNil(var_422_0) and arg_419_1.var_.characterEffect1093ui_story then
				arg_419_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_422_4 = 0
			local var_422_5 = 0.775

			if var_422_4 < arg_419_1.time_ and arg_419_1.time_ <= var_422_4 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_6 = arg_419_1:FormatText(StoryNameCfg[73].name)

				arg_419_1.leftNameTxt_.text = var_422_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_7 = arg_419_1:GetWordFromCfg(1109305108)
				local var_422_8 = arg_419_1:FormatText(var_422_7.content)

				arg_419_1.text_.text = var_422_8

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_9 = 31
				local var_422_10 = utf8.len(var_422_8)
				local var_422_11 = var_422_9 <= 0 and var_422_5 or var_422_5 * (var_422_10 / var_422_9)

				if var_422_11 > 0 and var_422_5 < var_422_11 then
					arg_419_1.talkMaxDuration = var_422_11

					if var_422_11 + var_422_4 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_11 + var_422_4
					end
				end

				arg_419_1.text_.text = var_422_8
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305108", "story_v_side_new_1109305.awb") ~= 0 then
					local var_422_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305108", "story_v_side_new_1109305.awb") / 1000

					if var_422_12 + var_422_4 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_12 + var_422_4
					end

					if var_422_7.prefab_name ~= "" and arg_419_1.actors_[var_422_7.prefab_name] ~= nil then
						local var_422_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_7.prefab_name].transform, "story_v_side_new_1109305", "1109305108", "story_v_side_new_1109305.awb")

						arg_419_1:RecordAudio("1109305108", var_422_13)
						arg_419_1:RecordAudio("1109305108", var_422_13)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305108", "story_v_side_new_1109305.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305108", "story_v_side_new_1109305.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_14 = math.max(var_422_5, arg_419_1.talkMaxDuration)

			if var_422_4 <= arg_419_1.time_ and arg_419_1.time_ < var_422_4 + var_422_14 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_4) / var_422_14

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_4 + var_422_14 and arg_419_1.time_ < var_422_4 + var_422_14 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305109 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1109305109
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1109305110(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["1093ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and not isNil(var_426_0) and arg_423_1.var_.characterEffect1093ui_story == nil then
				arg_423_1.var_.characterEffect1093ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.200000002980232

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 and not isNil(var_426_0) then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect1093ui_story and not isNil(var_426_0) then
					local var_426_4 = Mathf.Lerp(0, 0.5, var_426_3)

					arg_423_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_423_1.var_.characterEffect1093ui_story.fillRatio = var_426_4
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and not isNil(var_426_0) and arg_423_1.var_.characterEffect1093ui_story then
				local var_426_5 = 0.5

				arg_423_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_423_1.var_.characterEffect1093ui_story.fillRatio = var_426_5
			end

			local var_426_6 = 0
			local var_426_7 = 0.325

			if var_426_6 < arg_423_1.time_ and arg_423_1.time_ <= var_426_6 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_8 = arg_423_1:FormatText(StoryNameCfg[7].name)

				arg_423_1.leftNameTxt_.text = var_426_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_9 = arg_423_1:GetWordFromCfg(1109305109)
				local var_426_10 = arg_423_1:FormatText(var_426_9.content)

				arg_423_1.text_.text = var_426_10

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_11 = 13
				local var_426_12 = utf8.len(var_426_10)
				local var_426_13 = var_426_11 <= 0 and var_426_7 or var_426_7 * (var_426_12 / var_426_11)

				if var_426_13 > 0 and var_426_7 < var_426_13 then
					arg_423_1.talkMaxDuration = var_426_13

					if var_426_13 + var_426_6 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_13 + var_426_6
					end
				end

				arg_423_1.text_.text = var_426_10
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_14 = math.max(var_426_7, arg_423_1.talkMaxDuration)

			if var_426_6 <= arg_423_1.time_ and arg_423_1.time_ < var_426_6 + var_426_14 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_6) / var_426_14

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_6 + var_426_14 and arg_423_1.time_ < var_426_6 + var_426_14 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305110 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1109305110
		arg_427_1.duration_ = 7.2

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1109305111(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["1093ui_story"].transform
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 then
				arg_427_1.var_.moveOldPos1093ui_story = var_430_0.localPosition
			end

			local var_430_2 = 0.001

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2
				local var_430_4 = Vector3.New(0, -1.11, -5.88)

				var_430_0.localPosition = Vector3.Lerp(arg_427_1.var_.moveOldPos1093ui_story, var_430_4, var_430_3)

				local var_430_5 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_5.x, var_430_5.y, var_430_5.z)

				local var_430_6 = var_430_0.localEulerAngles

				var_430_6.z = 0
				var_430_6.x = 0
				var_430_0.localEulerAngles = var_430_6
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 then
				var_430_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_430_7 = manager.ui.mainCamera.transform.position - var_430_0.position

				var_430_0.forward = Vector3.New(var_430_7.x, var_430_7.y, var_430_7.z)

				local var_430_8 = var_430_0.localEulerAngles

				var_430_8.z = 0
				var_430_8.x = 0
				var_430_0.localEulerAngles = var_430_8
			end

			local var_430_9 = arg_427_1.actors_["1093ui_story"]
			local var_430_10 = 0

			if var_430_10 < arg_427_1.time_ and arg_427_1.time_ <= var_430_10 + arg_430_0 and not isNil(var_430_9) and arg_427_1.var_.characterEffect1093ui_story == nil then
				arg_427_1.var_.characterEffect1093ui_story = var_430_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_11 = 0.200000002980232

			if var_430_10 <= arg_427_1.time_ and arg_427_1.time_ < var_430_10 + var_430_11 and not isNil(var_430_9) then
				local var_430_12 = (arg_427_1.time_ - var_430_10) / var_430_11

				if arg_427_1.var_.characterEffect1093ui_story and not isNil(var_430_9) then
					arg_427_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_10 + var_430_11 and arg_427_1.time_ < var_430_10 + var_430_11 + arg_430_0 and not isNil(var_430_9) and arg_427_1.var_.characterEffect1093ui_story then
				arg_427_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_430_13 = 0

			if var_430_13 < arg_427_1.time_ and arg_427_1.time_ <= var_430_13 + arg_430_0 then
				arg_427_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_430_14 = 0

			if var_430_14 < arg_427_1.time_ and arg_427_1.time_ <= var_430_14 + arg_430_0 then
				arg_427_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_430_15 = 0
			local var_430_16 = 0.675

			if var_430_15 < arg_427_1.time_ and arg_427_1.time_ <= var_430_15 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_17 = arg_427_1:FormatText(StoryNameCfg[73].name)

				arg_427_1.leftNameTxt_.text = var_430_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_18 = arg_427_1:GetWordFromCfg(1109305110)
				local var_430_19 = arg_427_1:FormatText(var_430_18.content)

				arg_427_1.text_.text = var_430_19

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_20 = 27
				local var_430_21 = utf8.len(var_430_19)
				local var_430_22 = var_430_20 <= 0 and var_430_16 or var_430_16 * (var_430_21 / var_430_20)

				if var_430_22 > 0 and var_430_16 < var_430_22 then
					arg_427_1.talkMaxDuration = var_430_22

					if var_430_22 + var_430_15 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_22 + var_430_15
					end
				end

				arg_427_1.text_.text = var_430_19
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305110", "story_v_side_new_1109305.awb") ~= 0 then
					local var_430_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305110", "story_v_side_new_1109305.awb") / 1000

					if var_430_23 + var_430_15 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_23 + var_430_15
					end

					if var_430_18.prefab_name ~= "" and arg_427_1.actors_[var_430_18.prefab_name] ~= nil then
						local var_430_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_18.prefab_name].transform, "story_v_side_new_1109305", "1109305110", "story_v_side_new_1109305.awb")

						arg_427_1:RecordAudio("1109305110", var_430_24)
						arg_427_1:RecordAudio("1109305110", var_430_24)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305110", "story_v_side_new_1109305.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305110", "story_v_side_new_1109305.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_25 = math.max(var_430_16, arg_427_1.talkMaxDuration)

			if var_430_15 <= arg_427_1.time_ and arg_427_1.time_ < var_430_15 + var_430_25 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_15) / var_430_25

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_15 + var_430_25 and arg_427_1.time_ < var_430_15 + var_430_25 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305111 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1109305111
		arg_431_1.duration_ = 5

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play1109305112(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1093ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and not isNil(var_434_0) and arg_431_1.var_.characterEffect1093ui_story == nil then
				arg_431_1.var_.characterEffect1093ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.200000002980232

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 and not isNil(var_434_0) then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1093ui_story and not isNil(var_434_0) then
					local var_434_4 = Mathf.Lerp(0, 0.5, var_434_3)

					arg_431_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_431_1.var_.characterEffect1093ui_story.fillRatio = var_434_4
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and not isNil(var_434_0) and arg_431_1.var_.characterEffect1093ui_story then
				local var_434_5 = 0.5

				arg_431_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_431_1.var_.characterEffect1093ui_story.fillRatio = var_434_5
			end

			local var_434_6 = 0
			local var_434_7 = 0.525

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_8 = arg_431_1:FormatText(StoryNameCfg[7].name)

				arg_431_1.leftNameTxt_.text = var_434_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_9 = arg_431_1:GetWordFromCfg(1109305111)
				local var_434_10 = arg_431_1:FormatText(var_434_9.content)

				arg_431_1.text_.text = var_434_10

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_11 = 21
				local var_434_12 = utf8.len(var_434_10)
				local var_434_13 = var_434_11 <= 0 and var_434_7 or var_434_7 * (var_434_12 / var_434_11)

				if var_434_13 > 0 and var_434_7 < var_434_13 then
					arg_431_1.talkMaxDuration = var_434_13

					if var_434_13 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_13 + var_434_6
					end
				end

				arg_431_1.text_.text = var_434_10
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_14 = math.max(var_434_7, arg_431_1.talkMaxDuration)

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_14 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_6) / var_434_14

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_6 + var_434_14 and arg_431_1.time_ < var_434_6 + var_434_14 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305112 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 1109305112
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play1109305113(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.65

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, false)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_2 = arg_435_1:GetWordFromCfg(1109305112)
				local var_438_3 = arg_435_1:FormatText(var_438_2.content)

				arg_435_1.text_.text = var_438_3

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_4 = 26
				local var_438_5 = utf8.len(var_438_3)
				local var_438_6 = var_438_4 <= 0 and var_438_1 or var_438_1 * (var_438_5 / var_438_4)

				if var_438_6 > 0 and var_438_1 < var_438_6 then
					arg_435_1.talkMaxDuration = var_438_6

					if var_438_6 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_6 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_3
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_7 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_7 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_7

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_7 and arg_435_1.time_ < var_438_0 + var_438_7 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305113 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 1109305113
		arg_439_1.duration_ = 5

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play1109305114(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.5

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[7].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(1109305113)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 20
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
				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_8 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_8 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_8

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_8 and arg_439_1.time_ < var_442_0 + var_442_8 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305114 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 1109305114
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play1109305115(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1093ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1093ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, 100, 0)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1093ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, 100, 0)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = arg_443_1.actors_["1093ui_story"]
			local var_446_10 = 0

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 and not isNil(var_446_9) and arg_443_1.var_.characterEffect1093ui_story == nil then
				arg_443_1.var_.characterEffect1093ui_story = var_446_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_11 = 0.200000002980232

			if var_446_10 <= arg_443_1.time_ and arg_443_1.time_ < var_446_10 + var_446_11 and not isNil(var_446_9) then
				local var_446_12 = (arg_443_1.time_ - var_446_10) / var_446_11

				if arg_443_1.var_.characterEffect1093ui_story and not isNil(var_446_9) then
					local var_446_13 = Mathf.Lerp(0, 0.5, var_446_12)

					arg_443_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_443_1.var_.characterEffect1093ui_story.fillRatio = var_446_13
				end
			end

			if arg_443_1.time_ >= var_446_10 + var_446_11 and arg_443_1.time_ < var_446_10 + var_446_11 + arg_446_0 and not isNil(var_446_9) and arg_443_1.var_.characterEffect1093ui_story then
				local var_446_14 = 0.5

				arg_443_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_443_1.var_.characterEffect1093ui_story.fillRatio = var_446_14
			end

			local var_446_15 = 0
			local var_446_16 = 0.6

			if var_446_15 < arg_443_1.time_ and arg_443_1.time_ <= var_446_15 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_17 = arg_443_1:GetWordFromCfg(1109305114)
				local var_446_18 = arg_443_1:FormatText(var_446_17.content)

				arg_443_1.text_.text = var_446_18

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_19 = 24
				local var_446_20 = utf8.len(var_446_18)
				local var_446_21 = var_446_19 <= 0 and var_446_16 or var_446_16 * (var_446_20 / var_446_19)

				if var_446_21 > 0 and var_446_16 < var_446_21 then
					arg_443_1.talkMaxDuration = var_446_21

					if var_446_21 + var_446_15 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_21 + var_446_15
					end
				end

				arg_443_1.text_.text = var_446_18
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_22 = math.max(var_446_16, arg_443_1.talkMaxDuration)

			if var_446_15 <= arg_443_1.time_ and arg_443_1.time_ < var_446_15 + var_446_22 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_15) / var_446_22

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_15 + var_446_22 and arg_443_1.time_ < var_446_15 + var_446_22 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305115 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 1109305115
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play1109305116(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.75

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, false)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_2 = arg_447_1:GetWordFromCfg(1109305115)
				local var_450_3 = arg_447_1:FormatText(var_450_2.content)

				arg_447_1.text_.text = var_450_3

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_4 = 30
				local var_450_5 = utf8.len(var_450_3)
				local var_450_6 = var_450_4 <= 0 and var_450_1 or var_450_1 * (var_450_5 / var_450_4)

				if var_450_6 > 0 and var_450_1 < var_450_6 then
					arg_447_1.talkMaxDuration = var_450_6

					if var_450_6 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_6 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_3
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_7 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_7 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_7

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_7 and arg_447_1.time_ < var_450_0 + var_450_7 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305116 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 1109305116
		arg_451_1.duration_ = 3.83

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play1109305117(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 0.4

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_2 = arg_451_1:FormatText(StoryNameCfg[73].name)

				arg_451_1.leftNameTxt_.text = var_454_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, true)
				arg_451_1.iconController_:SetSelectedState("hero")

				arg_451_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_451_1.callingController_:SetSelectedState("normal")

				arg_451_1.keyicon_.color = Color.New(1, 1, 1)
				arg_451_1.icon_.color = Color.New(1, 1, 1)

				local var_454_3 = arg_451_1:GetWordFromCfg(1109305116)
				local var_454_4 = arg_451_1:FormatText(var_454_3.content)

				arg_451_1.text_.text = var_454_4

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_5 = 16
				local var_454_6 = utf8.len(var_454_4)
				local var_454_7 = var_454_5 <= 0 and var_454_1 or var_454_1 * (var_454_6 / var_454_5)

				if var_454_7 > 0 and var_454_1 < var_454_7 then
					arg_451_1.talkMaxDuration = var_454_7

					if var_454_7 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_7 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_4
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305116", "story_v_side_new_1109305.awb") ~= 0 then
					local var_454_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305116", "story_v_side_new_1109305.awb") / 1000

					if var_454_8 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_8 + var_454_0
					end

					if var_454_3.prefab_name ~= "" and arg_451_1.actors_[var_454_3.prefab_name] ~= nil then
						local var_454_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_3.prefab_name].transform, "story_v_side_new_1109305", "1109305116", "story_v_side_new_1109305.awb")

						arg_451_1:RecordAudio("1109305116", var_454_9)
						arg_451_1:RecordAudio("1109305116", var_454_9)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305116", "story_v_side_new_1109305.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305116", "story_v_side_new_1109305.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_10 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_10 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_10

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_10 and arg_451_1.time_ < var_454_0 + var_454_10 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305117 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 1109305117
		arg_455_1.duration_ = 5.27

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play1109305118(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.625

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[73].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, true)
				arg_455_1.iconController_:SetSelectedState("hero")

				arg_455_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_455_1.callingController_:SetSelectedState("normal")

				arg_455_1.keyicon_.color = Color.New(1, 1, 1)
				arg_455_1.icon_.color = Color.New(1, 1, 1)

				local var_458_3 = arg_455_1:GetWordFromCfg(1109305117)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 25
				local var_458_6 = utf8.len(var_458_4)
				local var_458_7 = var_458_5 <= 0 and var_458_1 or var_458_1 * (var_458_6 / var_458_5)

				if var_458_7 > 0 and var_458_1 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_4
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305117", "story_v_side_new_1109305.awb") ~= 0 then
					local var_458_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305117", "story_v_side_new_1109305.awb") / 1000

					if var_458_8 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_0
					end

					if var_458_3.prefab_name ~= "" and arg_455_1.actors_[var_458_3.prefab_name] ~= nil then
						local var_458_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_3.prefab_name].transform, "story_v_side_new_1109305", "1109305117", "story_v_side_new_1109305.awb")

						arg_455_1:RecordAudio("1109305117", var_458_9)
						arg_455_1:RecordAudio("1109305117", var_458_9)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305117", "story_v_side_new_1109305.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305117", "story_v_side_new_1109305.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_10 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_10 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_10

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_10 and arg_455_1.time_ < var_458_0 + var_458_10 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305118 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 1109305118
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play1109305119(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 0.45

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_2 = arg_459_1:GetWordFromCfg(1109305118)
				local var_462_3 = arg_459_1:FormatText(var_462_2.content)

				arg_459_1.text_.text = var_462_3

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_4 = 18
				local var_462_5 = utf8.len(var_462_3)
				local var_462_6 = var_462_4 <= 0 and var_462_1 or var_462_1 * (var_462_5 / var_462_4)

				if var_462_6 > 0 and var_462_1 < var_462_6 then
					arg_459_1.talkMaxDuration = var_462_6

					if var_462_6 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_6 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_3
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_7 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_7 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_7

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_7 and arg_459_1.time_ < var_462_0 + var_462_7 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305119 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 1109305119
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play1109305120(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 0.75

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[7].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(1109305119)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 30
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_8 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_8 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_8

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_8 and arg_463_1.time_ < var_466_0 + var_466_8 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305120 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 1109305120
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play1109305121(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.7

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_2 = arg_467_1:GetWordFromCfg(1109305120)
				local var_470_3 = arg_467_1:FormatText(var_470_2.content)

				arg_467_1.text_.text = var_470_3

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_4 = 28
				local var_470_5 = utf8.len(var_470_3)
				local var_470_6 = var_470_4 <= 0 and var_470_1 or var_470_1 * (var_470_5 / var_470_4)

				if var_470_6 > 0 and var_470_1 < var_470_6 then
					arg_467_1.talkMaxDuration = var_470_6

					if var_470_6 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_6 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_3
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_7 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_7 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_7

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_7 and arg_467_1.time_ < var_470_0 + var_470_7 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305121 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 1109305121
		arg_471_1.duration_ = 7.97

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play1109305122(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = "ST02"

			if arg_471_1.bgs_[var_474_0] == nil then
				local var_474_1 = Object.Instantiate(arg_471_1.paintGo_)

				var_474_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_474_0)
				var_474_1.name = var_474_0
				var_474_1.transform.parent = arg_471_1.stage_.transform
				var_474_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_471_1.bgs_[var_474_0] = var_474_1
			end

			local var_474_2 = 1.23333333333333

			if var_474_2 < arg_471_1.time_ and arg_471_1.time_ <= var_474_2 + arg_474_0 then
				local var_474_3 = manager.ui.mainCamera.transform.localPosition
				local var_474_4 = Vector3.New(0, 0, 10) + Vector3.New(var_474_3.x, var_474_3.y, 0)
				local var_474_5 = arg_471_1.bgs_.ST02

				var_474_5.transform.localPosition = var_474_4
				var_474_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_474_6 = var_474_5:GetComponent("SpriteRenderer")

				if var_474_6 and var_474_6.sprite then
					local var_474_7 = (var_474_5.transform.localPosition - var_474_3).z
					local var_474_8 = manager.ui.mainCameraCom_
					local var_474_9 = 2 * var_474_7 * Mathf.Tan(var_474_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_474_10 = var_474_9 * var_474_8.aspect
					local var_474_11 = var_474_6.sprite.bounds.size.x
					local var_474_12 = var_474_6.sprite.bounds.size.y
					local var_474_13 = var_474_10 / var_474_11
					local var_474_14 = var_474_9 / var_474_12
					local var_474_15 = var_474_14 < var_474_13 and var_474_13 or var_474_14

					var_474_5.transform.localScale = Vector3.New(var_474_15, var_474_15, 0)
				end

				for iter_474_0, iter_474_1 in pairs(arg_471_1.bgs_) do
					if iter_474_0 ~= "ST02" then
						iter_474_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_474_16 = 0

			if var_474_16 < arg_471_1.time_ and arg_471_1.time_ <= var_474_16 + arg_474_0 then
				arg_471_1.allBtn_.enabled = false
			end

			local var_474_17 = 0.3

			if arg_471_1.time_ >= var_474_16 + var_474_17 and arg_471_1.time_ < var_474_16 + var_474_17 + arg_474_0 then
				arg_471_1.allBtn_.enabled = true
			end

			local var_474_18 = 0

			if var_474_18 < arg_471_1.time_ and arg_471_1.time_ <= var_474_18 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_19 = 1.23333333333333

			if var_474_18 <= arg_471_1.time_ and arg_471_1.time_ < var_474_18 + var_474_19 then
				local var_474_20 = (arg_471_1.time_ - var_474_18) / var_474_19
				local var_474_21 = Color.New(0, 0, 0)

				var_474_21.a = Mathf.Lerp(0, 1, var_474_20)
				arg_471_1.mask_.color = var_474_21
			end

			if arg_471_1.time_ >= var_474_18 + var_474_19 and arg_471_1.time_ < var_474_18 + var_474_19 + arg_474_0 then
				local var_474_22 = Color.New(0, 0, 0)

				var_474_22.a = 1
				arg_471_1.mask_.color = var_474_22
			end

			local var_474_23 = 1.23333333333333

			if var_474_23 < arg_471_1.time_ and arg_471_1.time_ <= var_474_23 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_24 = 2

			if var_474_23 <= arg_471_1.time_ and arg_471_1.time_ < var_474_23 + var_474_24 then
				local var_474_25 = (arg_471_1.time_ - var_474_23) / var_474_24
				local var_474_26 = Color.New(0, 0, 0)

				var_474_26.a = Mathf.Lerp(1, 0, var_474_25)
				arg_471_1.mask_.color = var_474_26
			end

			if arg_471_1.time_ >= var_474_23 + var_474_24 and arg_471_1.time_ < var_474_23 + var_474_24 + arg_474_0 then
				local var_474_27 = Color.New(0, 0, 0)
				local var_474_28 = 0

				arg_471_1.mask_.enabled = false
				var_474_27.a = var_474_28
				arg_471_1.mask_.color = var_474_27
			end

			if arg_471_1.frameCnt_ <= 1 then
				arg_471_1.dialog_:SetActive(false)
			end

			local var_474_29 = 2.96666666666667
			local var_474_30 = 0.6

			if var_474_29 < arg_471_1.time_ and arg_471_1.time_ <= var_474_29 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0

				arg_471_1.dialog_:SetActive(true)

				local var_474_31 = LeanTween.value(arg_471_1.dialog_, 0, 1, 0.3)

				var_474_31:setOnUpdate(LuaHelper.FloatAction(function(arg_475_0)
					arg_471_1.dialogCg_.alpha = arg_475_0
				end))
				var_474_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_471_1.dialog_)
					var_474_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_471_1.duration_ = arg_471_1.duration_ + 0.3

				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_32 = arg_471_1:GetWordFromCfg(1109305121)
				local var_474_33 = arg_471_1:FormatText(var_474_32.content)

				arg_471_1.text_.text = var_474_33

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_34 = 24
				local var_474_35 = utf8.len(var_474_33)
				local var_474_36 = var_474_34 <= 0 and var_474_30 or var_474_30 * (var_474_35 / var_474_34)

				if var_474_36 > 0 and var_474_30 < var_474_36 then
					arg_471_1.talkMaxDuration = var_474_36
					var_474_29 = var_474_29 + 0.3

					if var_474_36 + var_474_29 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_36 + var_474_29
					end
				end

				arg_471_1.text_.text = var_474_33
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_37 = var_474_29 + 0.3
			local var_474_38 = math.max(var_474_30, arg_471_1.talkMaxDuration)

			if var_474_37 <= arg_471_1.time_ and arg_471_1.time_ < var_474_37 + var_474_38 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_37) / var_474_38

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_37 + var_474_38 and arg_471_1.time_ < var_474_37 + var_474_38 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305122 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1109305122
		arg_477_1.duration_ = 7.17

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1109305123(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1093ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1093ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(0, -1.11, -5.88)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1093ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["1093ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and not isNil(var_480_9) and arg_477_1.var_.characterEffect1093ui_story == nil then
				arg_477_1.var_.characterEffect1093ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 and not isNil(var_480_9) then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1093ui_story and not isNil(var_480_9) then
					arg_477_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and not isNil(var_480_9) and arg_477_1.var_.characterEffect1093ui_story then
				arg_477_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_480_13 = 0

			if var_480_13 < arg_477_1.time_ and arg_477_1.time_ <= var_480_13 + arg_480_0 then
				arg_477_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_480_14 = 0

			if var_480_14 < arg_477_1.time_ and arg_477_1.time_ <= var_480_14 + arg_480_0 then
				arg_477_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_480_15 = 0
			local var_480_16 = 0.8

			if var_480_15 < arg_477_1.time_ and arg_477_1.time_ <= var_480_15 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_17 = arg_477_1:FormatText(StoryNameCfg[73].name)

				arg_477_1.leftNameTxt_.text = var_480_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_18 = arg_477_1:GetWordFromCfg(1109305122)
				local var_480_19 = arg_477_1:FormatText(var_480_18.content)

				arg_477_1.text_.text = var_480_19

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_20 = 32
				local var_480_21 = utf8.len(var_480_19)
				local var_480_22 = var_480_20 <= 0 and var_480_16 or var_480_16 * (var_480_21 / var_480_20)

				if var_480_22 > 0 and var_480_16 < var_480_22 then
					arg_477_1.talkMaxDuration = var_480_22

					if var_480_22 + var_480_15 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_22 + var_480_15
					end
				end

				arg_477_1.text_.text = var_480_19
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305122", "story_v_side_new_1109305.awb") ~= 0 then
					local var_480_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305122", "story_v_side_new_1109305.awb") / 1000

					if var_480_23 + var_480_15 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_23 + var_480_15
					end

					if var_480_18.prefab_name ~= "" and arg_477_1.actors_[var_480_18.prefab_name] ~= nil then
						local var_480_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_18.prefab_name].transform, "story_v_side_new_1109305", "1109305122", "story_v_side_new_1109305.awb")

						arg_477_1:RecordAudio("1109305122", var_480_24)
						arg_477_1:RecordAudio("1109305122", var_480_24)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305122", "story_v_side_new_1109305.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305122", "story_v_side_new_1109305.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_25 = math.max(var_480_16, arg_477_1.talkMaxDuration)

			if var_480_15 <= arg_477_1.time_ and arg_477_1.time_ < var_480_15 + var_480_25 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_15) / var_480_25

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_15 + var_480_25 and arg_477_1.time_ < var_480_15 + var_480_25 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305123 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 1109305123
		arg_481_1.duration_ = 5

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play1109305124(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1093ui_story"]
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 and not isNil(var_484_0) and arg_481_1.var_.characterEffect1093ui_story == nil then
				arg_481_1.var_.characterEffect1093ui_story = var_484_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_2 = 0.200000002980232

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 and not isNil(var_484_0) then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2

				if arg_481_1.var_.characterEffect1093ui_story and not isNil(var_484_0) then
					local var_484_4 = Mathf.Lerp(0, 0.5, var_484_3)

					arg_481_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1093ui_story.fillRatio = var_484_4
				end
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 and not isNil(var_484_0) and arg_481_1.var_.characterEffect1093ui_story then
				local var_484_5 = 0.5

				arg_481_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1093ui_story.fillRatio = var_484_5
			end

			local var_484_6 = 0
			local var_484_7 = 0.65

			if var_484_6 < arg_481_1.time_ and arg_481_1.time_ <= var_484_6 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_8 = arg_481_1:FormatText(StoryNameCfg[7].name)

				arg_481_1.leftNameTxt_.text = var_484_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_9 = arg_481_1:GetWordFromCfg(1109305123)
				local var_484_10 = arg_481_1:FormatText(var_484_9.content)

				arg_481_1.text_.text = var_484_10

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_11 = 26
				local var_484_12 = utf8.len(var_484_10)
				local var_484_13 = var_484_11 <= 0 and var_484_7 or var_484_7 * (var_484_12 / var_484_11)

				if var_484_13 > 0 and var_484_7 < var_484_13 then
					arg_481_1.talkMaxDuration = var_484_13

					if var_484_13 + var_484_6 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_13 + var_484_6
					end
				end

				arg_481_1.text_.text = var_484_10
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)
				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_14 = math.max(var_484_7, arg_481_1.talkMaxDuration)

			if var_484_6 <= arg_481_1.time_ and arg_481_1.time_ < var_484_6 + var_484_14 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_6) / var_484_14

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_6 + var_484_14 and arg_481_1.time_ < var_484_6 + var_484_14 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305124 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 1109305124
		arg_485_1.duration_ = 2.57

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play1109305125(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["1093ui_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect1093ui_story == nil then
				arg_485_1.var_.characterEffect1093ui_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.200000002980232

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 and not isNil(var_488_0) then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect1093ui_story and not isNil(var_488_0) then
					arg_485_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect1093ui_story then
				arg_485_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_488_4 = 0
			local var_488_5 = 0.3

			if var_488_4 < arg_485_1.time_ and arg_485_1.time_ <= var_488_4 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_6 = arg_485_1:FormatText(StoryNameCfg[73].name)

				arg_485_1.leftNameTxt_.text = var_488_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_7 = arg_485_1:GetWordFromCfg(1109305124)
				local var_488_8 = arg_485_1:FormatText(var_488_7.content)

				arg_485_1.text_.text = var_488_8

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_9 = 12
				local var_488_10 = utf8.len(var_488_8)
				local var_488_11 = var_488_9 <= 0 and var_488_5 or var_488_5 * (var_488_10 / var_488_9)

				if var_488_11 > 0 and var_488_5 < var_488_11 then
					arg_485_1.talkMaxDuration = var_488_11

					if var_488_11 + var_488_4 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_11 + var_488_4
					end
				end

				arg_485_1.text_.text = var_488_8
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305124", "story_v_side_new_1109305.awb") ~= 0 then
					local var_488_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305124", "story_v_side_new_1109305.awb") / 1000

					if var_488_12 + var_488_4 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_12 + var_488_4
					end

					if var_488_7.prefab_name ~= "" and arg_485_1.actors_[var_488_7.prefab_name] ~= nil then
						local var_488_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_7.prefab_name].transform, "story_v_side_new_1109305", "1109305124", "story_v_side_new_1109305.awb")

						arg_485_1:RecordAudio("1109305124", var_488_13)
						arg_485_1:RecordAudio("1109305124", var_488_13)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305124", "story_v_side_new_1109305.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305124", "story_v_side_new_1109305.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_14 = math.max(var_488_5, arg_485_1.talkMaxDuration)

			if var_488_4 <= arg_485_1.time_ and arg_485_1.time_ < var_488_4 + var_488_14 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_4) / var_488_14

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_4 + var_488_14 and arg_485_1.time_ < var_488_4 + var_488_14 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305125 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 1109305125
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play1109305126(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1093ui_story"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.characterEffect1093ui_story == nil then
				arg_489_1.var_.characterEffect1093ui_story = var_492_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_2 = 0.200000002980232

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 and not isNil(var_492_0) then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.characterEffect1093ui_story and not isNil(var_492_0) then
					local var_492_4 = Mathf.Lerp(0, 0.5, var_492_3)

					arg_489_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_489_1.var_.characterEffect1093ui_story.fillRatio = var_492_4
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.characterEffect1093ui_story then
				local var_492_5 = 0.5

				arg_489_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_489_1.var_.characterEffect1093ui_story.fillRatio = var_492_5
			end

			local var_492_6 = 0
			local var_492_7 = 0.475

			if var_492_6 < arg_489_1.time_ and arg_489_1.time_ <= var_492_6 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_8 = arg_489_1:FormatText(StoryNameCfg[7].name)

				arg_489_1.leftNameTxt_.text = var_492_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_9 = arg_489_1:GetWordFromCfg(1109305125)
				local var_492_10 = arg_489_1:FormatText(var_492_9.content)

				arg_489_1.text_.text = var_492_10

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_11 = 19
				local var_492_12 = utf8.len(var_492_10)
				local var_492_13 = var_492_11 <= 0 and var_492_7 or var_492_7 * (var_492_12 / var_492_11)

				if var_492_13 > 0 and var_492_7 < var_492_13 then
					arg_489_1.talkMaxDuration = var_492_13

					if var_492_13 + var_492_6 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_13 + var_492_6
					end
				end

				arg_489_1.text_.text = var_492_10
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_14 = math.max(var_492_7, arg_489_1.talkMaxDuration)

			if var_492_6 <= arg_489_1.time_ and arg_489_1.time_ < var_492_6 + var_492_14 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_6) / var_492_14

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_6 + var_492_14 and arg_489_1.time_ < var_492_6 + var_492_14 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305126 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 1109305126
		arg_493_1.duration_ = 3.53

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play1109305127(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["1093ui_story"]
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 and not isNil(var_496_0) and arg_493_1.var_.characterEffect1093ui_story == nil then
				arg_493_1.var_.characterEffect1093ui_story = var_496_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_2 = 0.200000002980232

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 and not isNil(var_496_0) then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2

				if arg_493_1.var_.characterEffect1093ui_story and not isNil(var_496_0) then
					arg_493_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 and not isNil(var_496_0) and arg_493_1.var_.characterEffect1093ui_story then
				arg_493_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			if arg_493_1.frameCnt_ <= 1 then
				arg_493_1.dialog_:SetActive(false)
			end

			local var_496_4 = 0.666666666666667
			local var_496_5 = 0.25

			if var_496_4 < arg_493_1.time_ and arg_493_1.time_ <= var_496_4 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0

				arg_493_1.dialog_:SetActive(true)

				local var_496_6 = LeanTween.value(arg_493_1.dialog_, 0, 1, 0.3)

				var_496_6:setOnUpdate(LuaHelper.FloatAction(function(arg_497_0)
					arg_493_1.dialogCg_.alpha = arg_497_0
				end))
				var_496_6:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_493_1.dialog_)
					var_496_6:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_493_1.duration_ = arg_493_1.duration_ + 0.3

				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_7 = arg_493_1:FormatText(StoryNameCfg[73].name)

				arg_493_1.leftNameTxt_.text = var_496_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_8 = arg_493_1:GetWordFromCfg(1109305126)
				local var_496_9 = arg_493_1:FormatText(var_496_8.content)

				arg_493_1.text_.text = var_496_9

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_10 = 10
				local var_496_11 = utf8.len(var_496_9)
				local var_496_12 = var_496_10 <= 0 and var_496_5 or var_496_5 * (var_496_11 / var_496_10)

				if var_496_12 > 0 and var_496_5 < var_496_12 then
					arg_493_1.talkMaxDuration = var_496_12
					var_496_4 = var_496_4 + 0.3

					if var_496_12 + var_496_4 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_12 + var_496_4
					end
				end

				arg_493_1.text_.text = var_496_9
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305126", "story_v_side_new_1109305.awb") ~= 0 then
					local var_496_13 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305126", "story_v_side_new_1109305.awb") / 1000

					if var_496_13 + var_496_4 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_13 + var_496_4
					end

					if var_496_8.prefab_name ~= "" and arg_493_1.actors_[var_496_8.prefab_name] ~= nil then
						local var_496_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_8.prefab_name].transform, "story_v_side_new_1109305", "1109305126", "story_v_side_new_1109305.awb")

						arg_493_1:RecordAudio("1109305126", var_496_14)
						arg_493_1:RecordAudio("1109305126", var_496_14)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305126", "story_v_side_new_1109305.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305126", "story_v_side_new_1109305.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_15 = var_496_4 + 0.3
			local var_496_16 = math.max(var_496_5, arg_493_1.talkMaxDuration)

			if var_496_15 <= arg_493_1.time_ and arg_493_1.time_ < var_496_15 + var_496_16 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_15) / var_496_16

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_15 + var_496_16 and arg_493_1.time_ < var_496_15 + var_496_16 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305127 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1109305127
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1109305128(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1093ui_story"].transform
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				arg_499_1.var_.moveOldPos1093ui_story = var_502_0.localPosition
			end

			local var_502_2 = 0.001

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2
				local var_502_4 = Vector3.New(0, 100, 0)

				var_502_0.localPosition = Vector3.Lerp(arg_499_1.var_.moveOldPos1093ui_story, var_502_4, var_502_3)

				local var_502_5 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_5.x, var_502_5.y, var_502_5.z)

				local var_502_6 = var_502_0.localEulerAngles

				var_502_6.z = 0
				var_502_6.x = 0
				var_502_0.localEulerAngles = var_502_6
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 then
				var_502_0.localPosition = Vector3.New(0, 100, 0)

				local var_502_7 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_7.x, var_502_7.y, var_502_7.z)

				local var_502_8 = var_502_0.localEulerAngles

				var_502_8.z = 0
				var_502_8.x = 0
				var_502_0.localEulerAngles = var_502_8
			end

			local var_502_9 = arg_499_1.actors_["1093ui_story"]
			local var_502_10 = 0

			if var_502_10 < arg_499_1.time_ and arg_499_1.time_ <= var_502_10 + arg_502_0 and not isNil(var_502_9) and arg_499_1.var_.characterEffect1093ui_story == nil then
				arg_499_1.var_.characterEffect1093ui_story = var_502_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_11 = 0.200000002980232

			if var_502_10 <= arg_499_1.time_ and arg_499_1.time_ < var_502_10 + var_502_11 and not isNil(var_502_9) then
				local var_502_12 = (arg_499_1.time_ - var_502_10) / var_502_11

				if arg_499_1.var_.characterEffect1093ui_story and not isNil(var_502_9) then
					local var_502_13 = Mathf.Lerp(0, 0.5, var_502_12)

					arg_499_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1093ui_story.fillRatio = var_502_13
				end
			end

			if arg_499_1.time_ >= var_502_10 + var_502_11 and arg_499_1.time_ < var_502_10 + var_502_11 + arg_502_0 and not isNil(var_502_9) and arg_499_1.var_.characterEffect1093ui_story then
				local var_502_14 = 0.5

				arg_499_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1093ui_story.fillRatio = var_502_14
			end

			local var_502_15 = 0
			local var_502_16 = 0.875

			if var_502_15 < arg_499_1.time_ and arg_499_1.time_ <= var_502_15 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_17 = arg_499_1:GetWordFromCfg(1109305127)
				local var_502_18 = arg_499_1:FormatText(var_502_17.content)

				arg_499_1.text_.text = var_502_18

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_19 = 35
				local var_502_20 = utf8.len(var_502_18)
				local var_502_21 = var_502_19 <= 0 and var_502_16 or var_502_16 * (var_502_20 / var_502_19)

				if var_502_21 > 0 and var_502_16 < var_502_21 then
					arg_499_1.talkMaxDuration = var_502_21

					if var_502_21 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_21 + var_502_15
					end
				end

				arg_499_1.text_.text = var_502_18
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_22 = math.max(var_502_16, arg_499_1.talkMaxDuration)

			if var_502_15 <= arg_499_1.time_ and arg_499_1.time_ < var_502_15 + var_502_22 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_15) / var_502_22

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_15 + var_502_22 and arg_499_1.time_ < var_502_15 + var_502_22 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305128 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1109305128
		arg_503_1.duration_ = 1.63

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1109305129(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.05

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_2 = arg_503_1:FormatText(StoryNameCfg[1056].name)

				arg_503_1.leftNameTxt_.text = var_506_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, true)
				arg_503_1.iconController_:SetSelectedState("hero")

				arg_503_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_503_1.callingController_:SetSelectedState("normal")

				arg_503_1.keyicon_.color = Color.New(1, 1, 1)
				arg_503_1.icon_.color = Color.New(1, 1, 1)

				local var_506_3 = arg_503_1:GetWordFromCfg(1109305128)
				local var_506_4 = arg_503_1:FormatText(var_506_3.content)

				arg_503_1.text_.text = var_506_4

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_5 = 2
				local var_506_6 = utf8.len(var_506_4)
				local var_506_7 = var_506_5 <= 0 and var_506_1 or var_506_1 * (var_506_6 / var_506_5)

				if var_506_7 > 0 and var_506_1 < var_506_7 then
					arg_503_1.talkMaxDuration = var_506_7

					if var_506_7 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_7 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_4
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305128", "story_v_side_new_1109305.awb") ~= 0 then
					local var_506_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305128", "story_v_side_new_1109305.awb") / 1000

					if var_506_8 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_8 + var_506_0
					end

					if var_506_3.prefab_name ~= "" and arg_503_1.actors_[var_506_3.prefab_name] ~= nil then
						local var_506_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_3.prefab_name].transform, "story_v_side_new_1109305", "1109305128", "story_v_side_new_1109305.awb")

						arg_503_1:RecordAudio("1109305128", var_506_9)
						arg_503_1:RecordAudio("1109305128", var_506_9)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305128", "story_v_side_new_1109305.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305128", "story_v_side_new_1109305.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_10 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_10 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_10

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_10 and arg_503_1.time_ < var_506_0 + var_506_10 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305129 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 1109305129
		arg_507_1.duration_ = 4.23

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play1109305130(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1093ui_story"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos1093ui_story = var_510_0.localPosition
			end

			local var_510_2 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2
				local var_510_4 = Vector3.New(0, -1.11, -5.88)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1093ui_story, var_510_4, var_510_3)

				local var_510_5 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_5.x, var_510_5.y, var_510_5.z)

				local var_510_6 = var_510_0.localEulerAngles

				var_510_6.z = 0
				var_510_6.x = 0
				var_510_0.localEulerAngles = var_510_6
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_510_7 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_7.x, var_510_7.y, var_510_7.z)

				local var_510_8 = var_510_0.localEulerAngles

				var_510_8.z = 0
				var_510_8.x = 0
				var_510_0.localEulerAngles = var_510_8
			end

			local var_510_9 = arg_507_1.actors_["1093ui_story"]
			local var_510_10 = 0

			if var_510_10 < arg_507_1.time_ and arg_507_1.time_ <= var_510_10 + arg_510_0 and not isNil(var_510_9) and arg_507_1.var_.characterEffect1093ui_story == nil then
				arg_507_1.var_.characterEffect1093ui_story = var_510_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_11 = 0.200000002980232

			if var_510_10 <= arg_507_1.time_ and arg_507_1.time_ < var_510_10 + var_510_11 and not isNil(var_510_9) then
				local var_510_12 = (arg_507_1.time_ - var_510_10) / var_510_11

				if arg_507_1.var_.characterEffect1093ui_story and not isNil(var_510_9) then
					arg_507_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_10 + var_510_11 and arg_507_1.time_ < var_510_10 + var_510_11 + arg_510_0 and not isNil(var_510_9) and arg_507_1.var_.characterEffect1093ui_story then
				arg_507_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_510_13 = 0

			if var_510_13 < arg_507_1.time_ and arg_507_1.time_ <= var_510_13 + arg_510_0 then
				arg_507_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action446")
			end

			local var_510_14 = 0

			if var_510_14 < arg_507_1.time_ and arg_507_1.time_ <= var_510_14 + arg_510_0 then
				arg_507_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_510_15 = 0
			local var_510_16 = 0.45

			if var_510_15 < arg_507_1.time_ and arg_507_1.time_ <= var_510_15 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_17 = arg_507_1:FormatText(StoryNameCfg[73].name)

				arg_507_1.leftNameTxt_.text = var_510_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_18 = arg_507_1:GetWordFromCfg(1109305129)
				local var_510_19 = arg_507_1:FormatText(var_510_18.content)

				arg_507_1.text_.text = var_510_19

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_20 = 18
				local var_510_21 = utf8.len(var_510_19)
				local var_510_22 = var_510_20 <= 0 and var_510_16 or var_510_16 * (var_510_21 / var_510_20)

				if var_510_22 > 0 and var_510_16 < var_510_22 then
					arg_507_1.talkMaxDuration = var_510_22

					if var_510_22 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_22 + var_510_15
					end
				end

				arg_507_1.text_.text = var_510_19
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305129", "story_v_side_new_1109305.awb") ~= 0 then
					local var_510_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305129", "story_v_side_new_1109305.awb") / 1000

					if var_510_23 + var_510_15 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_23 + var_510_15
					end

					if var_510_18.prefab_name ~= "" and arg_507_1.actors_[var_510_18.prefab_name] ~= nil then
						local var_510_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_18.prefab_name].transform, "story_v_side_new_1109305", "1109305129", "story_v_side_new_1109305.awb")

						arg_507_1:RecordAudio("1109305129", var_510_24)
						arg_507_1:RecordAudio("1109305129", var_510_24)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305129", "story_v_side_new_1109305.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305129", "story_v_side_new_1109305.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_25 = math.max(var_510_16, arg_507_1.talkMaxDuration)

			if var_510_15 <= arg_507_1.time_ and arg_507_1.time_ < var_510_15 + var_510_25 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_15) / var_510_25

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_15 + var_510_25 and arg_507_1.time_ < var_510_15 + var_510_25 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305130 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 1109305130
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play1109305131(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1093ui_story"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and not isNil(var_514_0) and arg_511_1.var_.characterEffect1093ui_story == nil then
				arg_511_1.var_.characterEffect1093ui_story = var_514_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_2 = 0.200000002980232

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 and not isNil(var_514_0) then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.characterEffect1093ui_story and not isNil(var_514_0) then
					local var_514_4 = Mathf.Lerp(0, 0.5, var_514_3)

					arg_511_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1093ui_story.fillRatio = var_514_4
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and not isNil(var_514_0) and arg_511_1.var_.characterEffect1093ui_story then
				local var_514_5 = 0.5

				arg_511_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1093ui_story.fillRatio = var_514_5
			end

			local var_514_6 = 0
			local var_514_7 = 0.375

			if var_514_6 < arg_511_1.time_ and arg_511_1.time_ <= var_514_6 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_8 = arg_511_1:GetWordFromCfg(1109305130)
				local var_514_9 = arg_511_1:FormatText(var_514_8.content)

				arg_511_1.text_.text = var_514_9

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_10 = 15
				local var_514_11 = utf8.len(var_514_9)
				local var_514_12 = var_514_10 <= 0 and var_514_7 or var_514_7 * (var_514_11 / var_514_10)

				if var_514_12 > 0 and var_514_7 < var_514_12 then
					arg_511_1.talkMaxDuration = var_514_12

					if var_514_12 + var_514_6 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_12 + var_514_6
					end
				end

				arg_511_1.text_.text = var_514_9
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_13 = math.max(var_514_7, arg_511_1.talkMaxDuration)

			if var_514_6 <= arg_511_1.time_ and arg_511_1.time_ < var_514_6 + var_514_13 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_6) / var_514_13

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_6 + var_514_13 and arg_511_1.time_ < var_514_6 + var_514_13 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305131 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1109305131
		arg_515_1.duration_ = 1.87

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1109305132(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.25

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_2 = arg_515_1:FormatText(StoryNameCfg[1056].name)

				arg_515_1.leftNameTxt_.text = var_518_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, true)
				arg_515_1.iconController_:SetSelectedState("hero")

				arg_515_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_515_1.callingController_:SetSelectedState("normal")

				arg_515_1.keyicon_.color = Color.New(1, 1, 1)
				arg_515_1.icon_.color = Color.New(1, 1, 1)

				local var_518_3 = arg_515_1:GetWordFromCfg(1109305131)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305131", "story_v_side_new_1109305.awb") ~= 0 then
					local var_518_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305131", "story_v_side_new_1109305.awb") / 1000

					if var_518_8 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_8 + var_518_0
					end

					if var_518_3.prefab_name ~= "" and arg_515_1.actors_[var_518_3.prefab_name] ~= nil then
						local var_518_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_3.prefab_name].transform, "story_v_side_new_1109305", "1109305131", "story_v_side_new_1109305.awb")

						arg_515_1:RecordAudio("1109305131", var_518_9)
						arg_515_1:RecordAudio("1109305131", var_518_9)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305131", "story_v_side_new_1109305.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305131", "story_v_side_new_1109305.awb")
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
	Play1109305132 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 1109305132
		arg_519_1.duration_ = 4.3

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play1109305133(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1093ui_story"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and not isNil(var_522_0) and arg_519_1.var_.characterEffect1093ui_story == nil then
				arg_519_1.var_.characterEffect1093ui_story = var_522_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_2 = 0.200000002980232

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 and not isNil(var_522_0) then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.characterEffect1093ui_story and not isNil(var_522_0) then
					arg_519_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and not isNil(var_522_0) and arg_519_1.var_.characterEffect1093ui_story then
				arg_519_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_522_4 = 0
			local var_522_5 = 0.5

			if var_522_4 < arg_519_1.time_ and arg_519_1.time_ <= var_522_4 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_6 = arg_519_1:FormatText(StoryNameCfg[73].name)

				arg_519_1.leftNameTxt_.text = var_522_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_7 = arg_519_1:GetWordFromCfg(1109305132)
				local var_522_8 = arg_519_1:FormatText(var_522_7.content)

				arg_519_1.text_.text = var_522_8

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_9 = 31
				local var_522_10 = utf8.len(var_522_8)
				local var_522_11 = var_522_9 <= 0 and var_522_5 or var_522_5 * (var_522_10 / var_522_9)

				if var_522_11 > 0 and var_522_5 < var_522_11 then
					arg_519_1.talkMaxDuration = var_522_11

					if var_522_11 + var_522_4 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_11 + var_522_4
					end
				end

				arg_519_1.text_.text = var_522_8
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305132", "story_v_side_new_1109305.awb") ~= 0 then
					local var_522_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305132", "story_v_side_new_1109305.awb") / 1000

					if var_522_12 + var_522_4 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_12 + var_522_4
					end

					if var_522_7.prefab_name ~= "" and arg_519_1.actors_[var_522_7.prefab_name] ~= nil then
						local var_522_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_7.prefab_name].transform, "story_v_side_new_1109305", "1109305132", "story_v_side_new_1109305.awb")

						arg_519_1:RecordAudio("1109305132", var_522_13)
						arg_519_1:RecordAudio("1109305132", var_522_13)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305132", "story_v_side_new_1109305.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305132", "story_v_side_new_1109305.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_14 = math.max(var_522_5, arg_519_1.talkMaxDuration)

			if var_522_4 <= arg_519_1.time_ and arg_519_1.time_ < var_522_4 + var_522_14 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_4) / var_522_14

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_4 + var_522_14 and arg_519_1.time_ < var_522_4 + var_522_14 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305133 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 1109305133
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play1109305134(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1093ui_story"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and not isNil(var_526_0) and arg_523_1.var_.characterEffect1093ui_story == nil then
				arg_523_1.var_.characterEffect1093ui_story = var_526_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_2 = 0.200000002980232

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 and not isNil(var_526_0) then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.characterEffect1093ui_story and not isNil(var_526_0) then
					local var_526_4 = Mathf.Lerp(0, 0.5, var_526_3)

					arg_523_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_523_1.var_.characterEffect1093ui_story.fillRatio = var_526_4
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and not isNil(var_526_0) and arg_523_1.var_.characterEffect1093ui_story then
				local var_526_5 = 0.5

				arg_523_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_523_1.var_.characterEffect1093ui_story.fillRatio = var_526_5
			end

			local var_526_6 = 0
			local var_526_7 = 0.525

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_8 = arg_523_1:GetWordFromCfg(1109305133)
				local var_526_9 = arg_523_1:FormatText(var_526_8.content)

				arg_523_1.text_.text = var_526_9

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_10 = 21
				local var_526_11 = utf8.len(var_526_9)
				local var_526_12 = var_526_10 <= 0 and var_526_7 or var_526_7 * (var_526_11 / var_526_10)

				if var_526_12 > 0 and var_526_7 < var_526_12 then
					arg_523_1.talkMaxDuration = var_526_12

					if var_526_12 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_12 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_9
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_13 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_13 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_13

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_13 and arg_523_1.time_ < var_526_6 + var_526_13 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305134 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 1109305134
		arg_527_1.duration_ = 1.7

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play1109305135(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 0.2

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_2 = arg_527_1:FormatText(StoryNameCfg[1056].name)

				arg_527_1.leftNameTxt_.text = var_530_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, true)
				arg_527_1.iconController_:SetSelectedState("hero")

				arg_527_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_527_1.callingController_:SetSelectedState("normal")

				arg_527_1.keyicon_.color = Color.New(1, 1, 1)
				arg_527_1.icon_.color = Color.New(1, 1, 1)

				local var_530_3 = arg_527_1:GetWordFromCfg(1109305134)
				local var_530_4 = arg_527_1:FormatText(var_530_3.content)

				arg_527_1.text_.text = var_530_4

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_5 = 8
				local var_530_6 = utf8.len(var_530_4)
				local var_530_7 = var_530_5 <= 0 and var_530_1 or var_530_1 * (var_530_6 / var_530_5)

				if var_530_7 > 0 and var_530_1 < var_530_7 then
					arg_527_1.talkMaxDuration = var_530_7

					if var_530_7 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_7 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_4
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305134", "story_v_side_new_1109305.awb") ~= 0 then
					local var_530_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305134", "story_v_side_new_1109305.awb") / 1000

					if var_530_8 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_8 + var_530_0
					end

					if var_530_3.prefab_name ~= "" and arg_527_1.actors_[var_530_3.prefab_name] ~= nil then
						local var_530_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_3.prefab_name].transform, "story_v_side_new_1109305", "1109305134", "story_v_side_new_1109305.awb")

						arg_527_1:RecordAudio("1109305134", var_530_9)
						arg_527_1:RecordAudio("1109305134", var_530_9)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305134", "story_v_side_new_1109305.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305134", "story_v_side_new_1109305.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_10 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_0 <= arg_527_1.time_ and arg_527_1.time_ < var_530_0 + var_530_10 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_0) / var_530_10

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_0 + var_530_10 and arg_527_1.time_ < var_530_0 + var_530_10 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305135 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 1109305135
		arg_531_1.duration_ = 6.6

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play1109305136(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1093ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and not isNil(var_534_0) and arg_531_1.var_.characterEffect1093ui_story == nil then
				arg_531_1.var_.characterEffect1093ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.200000002980232

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 and not isNil(var_534_0) then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1093ui_story and not isNil(var_534_0) then
					arg_531_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and not isNil(var_534_0) and arg_531_1.var_.characterEffect1093ui_story then
				arg_531_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_534_4 = 0
			local var_534_5 = 0.75

			if var_534_4 < arg_531_1.time_ and arg_531_1.time_ <= var_534_4 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_6 = arg_531_1:FormatText(StoryNameCfg[73].name)

				arg_531_1.leftNameTxt_.text = var_534_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_7 = arg_531_1:GetWordFromCfg(1109305135)
				local var_534_8 = arg_531_1:FormatText(var_534_7.content)

				arg_531_1.text_.text = var_534_8

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_9 = 30
				local var_534_10 = utf8.len(var_534_8)
				local var_534_11 = var_534_9 <= 0 and var_534_5 or var_534_5 * (var_534_10 / var_534_9)

				if var_534_11 > 0 and var_534_5 < var_534_11 then
					arg_531_1.talkMaxDuration = var_534_11

					if var_534_11 + var_534_4 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_11 + var_534_4
					end
				end

				arg_531_1.text_.text = var_534_8
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305135", "story_v_side_new_1109305.awb") ~= 0 then
					local var_534_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305135", "story_v_side_new_1109305.awb") / 1000

					if var_534_12 + var_534_4 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_12 + var_534_4
					end

					if var_534_7.prefab_name ~= "" and arg_531_1.actors_[var_534_7.prefab_name] ~= nil then
						local var_534_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_7.prefab_name].transform, "story_v_side_new_1109305", "1109305135", "story_v_side_new_1109305.awb")

						arg_531_1:RecordAudio("1109305135", var_534_13)
						arg_531_1:RecordAudio("1109305135", var_534_13)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305135", "story_v_side_new_1109305.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305135", "story_v_side_new_1109305.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_14 = math.max(var_534_5, arg_531_1.talkMaxDuration)

			if var_534_4 <= arg_531_1.time_ and arg_531_1.time_ < var_534_4 + var_534_14 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_4) / var_534_14

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_4 + var_534_14 and arg_531_1.time_ < var_534_4 + var_534_14 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305136 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 1109305136
		arg_535_1.duration_ = 4.73

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play1109305137(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1093ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and not isNil(var_538_0) and arg_535_1.var_.characterEffect1093ui_story == nil then
				arg_535_1.var_.characterEffect1093ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.200000002980232

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 and not isNil(var_538_0) then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1093ui_story and not isNil(var_538_0) then
					local var_538_4 = Mathf.Lerp(0, 0.5, var_538_3)

					arg_535_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_535_1.var_.characterEffect1093ui_story.fillRatio = var_538_4
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and not isNil(var_538_0) and arg_535_1.var_.characterEffect1093ui_story then
				local var_538_5 = 0.5

				arg_535_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_535_1.var_.characterEffect1093ui_story.fillRatio = var_538_5
			end

			local var_538_6 = 0
			local var_538_7 = 0.65

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_8 = arg_535_1:FormatText(StoryNameCfg[1056].name)

				arg_535_1.leftNameTxt_.text = var_538_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, true)
				arg_535_1.iconController_:SetSelectedState("hero")

				arg_535_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_535_1.callingController_:SetSelectedState("normal")

				arg_535_1.keyicon_.color = Color.New(1, 1, 1)
				arg_535_1.icon_.color = Color.New(1, 1, 1)

				local var_538_9 = arg_535_1:GetWordFromCfg(1109305136)
				local var_538_10 = arg_535_1:FormatText(var_538_9.content)

				arg_535_1.text_.text = var_538_10

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_11 = 26
				local var_538_12 = utf8.len(var_538_10)
				local var_538_13 = var_538_11 <= 0 and var_538_7 or var_538_7 * (var_538_12 / var_538_11)

				if var_538_13 > 0 and var_538_7 < var_538_13 then
					arg_535_1.talkMaxDuration = var_538_13

					if var_538_13 + var_538_6 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_13 + var_538_6
					end
				end

				arg_535_1.text_.text = var_538_10
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305136", "story_v_side_new_1109305.awb") ~= 0 then
					local var_538_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305136", "story_v_side_new_1109305.awb") / 1000

					if var_538_14 + var_538_6 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_14 + var_538_6
					end

					if var_538_9.prefab_name ~= "" and arg_535_1.actors_[var_538_9.prefab_name] ~= nil then
						local var_538_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_9.prefab_name].transform, "story_v_side_new_1109305", "1109305136", "story_v_side_new_1109305.awb")

						arg_535_1:RecordAudio("1109305136", var_538_15)
						arg_535_1:RecordAudio("1109305136", var_538_15)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305136", "story_v_side_new_1109305.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305136", "story_v_side_new_1109305.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_16 = math.max(var_538_7, arg_535_1.talkMaxDuration)

			if var_538_6 <= arg_535_1.time_ and arg_535_1.time_ < var_538_6 + var_538_16 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_6) / var_538_16

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_6 + var_538_16 and arg_535_1.time_ < var_538_6 + var_538_16 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305137 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 1109305137
		arg_539_1.duration_ = 9.57

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play1109305138(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action6_2")
			end

			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_542_2 = arg_539_1.actors_["1093ui_story"]
			local var_542_3 = 0

			if var_542_3 < arg_539_1.time_ and arg_539_1.time_ <= var_542_3 + arg_542_0 and not isNil(var_542_2) and arg_539_1.var_.characterEffect1093ui_story == nil then
				arg_539_1.var_.characterEffect1093ui_story = var_542_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_4 = 0.200000002980232

			if var_542_3 <= arg_539_1.time_ and arg_539_1.time_ < var_542_3 + var_542_4 and not isNil(var_542_2) then
				local var_542_5 = (arg_539_1.time_ - var_542_3) / var_542_4

				if arg_539_1.var_.characterEffect1093ui_story and not isNil(var_542_2) then
					arg_539_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_3 + var_542_4 and arg_539_1.time_ < var_542_3 + var_542_4 + arg_542_0 and not isNil(var_542_2) and arg_539_1.var_.characterEffect1093ui_story then
				arg_539_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_542_6 = 0
			local var_542_7 = 0.9

			if var_542_6 < arg_539_1.time_ and arg_539_1.time_ <= var_542_6 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_8 = arg_539_1:FormatText(StoryNameCfg[73].name)

				arg_539_1.leftNameTxt_.text = var_542_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_9 = arg_539_1:GetWordFromCfg(1109305137)
				local var_542_10 = arg_539_1:FormatText(var_542_9.content)

				arg_539_1.text_.text = var_542_10

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_11 = 36
				local var_542_12 = utf8.len(var_542_10)
				local var_542_13 = var_542_11 <= 0 and var_542_7 or var_542_7 * (var_542_12 / var_542_11)

				if var_542_13 > 0 and var_542_7 < var_542_13 then
					arg_539_1.talkMaxDuration = var_542_13

					if var_542_13 + var_542_6 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_13 + var_542_6
					end
				end

				arg_539_1.text_.text = var_542_10
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305137", "story_v_side_new_1109305.awb") ~= 0 then
					local var_542_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305137", "story_v_side_new_1109305.awb") / 1000

					if var_542_14 + var_542_6 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_14 + var_542_6
					end

					if var_542_9.prefab_name ~= "" and arg_539_1.actors_[var_542_9.prefab_name] ~= nil then
						local var_542_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_9.prefab_name].transform, "story_v_side_new_1109305", "1109305137", "story_v_side_new_1109305.awb")

						arg_539_1:RecordAudio("1109305137", var_542_15)
						arg_539_1:RecordAudio("1109305137", var_542_15)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305137", "story_v_side_new_1109305.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305137", "story_v_side_new_1109305.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_16 = math.max(var_542_7, arg_539_1.talkMaxDuration)

			if var_542_6 <= arg_539_1.time_ and arg_539_1.time_ < var_542_6 + var_542_16 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_6) / var_542_16

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_6 + var_542_16 and arg_539_1.time_ < var_542_6 + var_542_16 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305138 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 1109305138
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play1109305139(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1093ui_story"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and not isNil(var_546_0) and arg_543_1.var_.characterEffect1093ui_story == nil then
				arg_543_1.var_.characterEffect1093ui_story = var_546_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_2 = 0.200000002980232

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 and not isNil(var_546_0) then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.characterEffect1093ui_story and not isNil(var_546_0) then
					local var_546_4 = Mathf.Lerp(0, 0.5, var_546_3)

					arg_543_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_543_1.var_.characterEffect1093ui_story.fillRatio = var_546_4
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and not isNil(var_546_0) and arg_543_1.var_.characterEffect1093ui_story then
				local var_546_5 = 0.5

				arg_543_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_543_1.var_.characterEffect1093ui_story.fillRatio = var_546_5
			end

			local var_546_6 = arg_543_1.actors_["1093ui_story"].transform
			local var_546_7 = 0

			if var_546_7 < arg_543_1.time_ and arg_543_1.time_ <= var_546_7 + arg_546_0 then
				arg_543_1.var_.moveOldPos1093ui_story = var_546_6.localPosition
			end

			local var_546_8 = 0.001

			if var_546_7 <= arg_543_1.time_ and arg_543_1.time_ < var_546_7 + var_546_8 then
				local var_546_9 = (arg_543_1.time_ - var_546_7) / var_546_8
				local var_546_10 = Vector3.New(0, 100, 0)

				var_546_6.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1093ui_story, var_546_10, var_546_9)

				local var_546_11 = manager.ui.mainCamera.transform.position - var_546_6.position

				var_546_6.forward = Vector3.New(var_546_11.x, var_546_11.y, var_546_11.z)

				local var_546_12 = var_546_6.localEulerAngles

				var_546_12.z = 0
				var_546_12.x = 0
				var_546_6.localEulerAngles = var_546_12
			end

			if arg_543_1.time_ >= var_546_7 + var_546_8 and arg_543_1.time_ < var_546_7 + var_546_8 + arg_546_0 then
				var_546_6.localPosition = Vector3.New(0, 100, 0)

				local var_546_13 = manager.ui.mainCamera.transform.position - var_546_6.position

				var_546_6.forward = Vector3.New(var_546_13.x, var_546_13.y, var_546_13.z)

				local var_546_14 = var_546_6.localEulerAngles

				var_546_14.z = 0
				var_546_14.x = 0
				var_546_6.localEulerAngles = var_546_14
			end

			local var_546_15 = 0
			local var_546_16 = 0.425

			if var_546_15 < arg_543_1.time_ and arg_543_1.time_ <= var_546_15 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_17 = arg_543_1:GetWordFromCfg(1109305138)
				local var_546_18 = arg_543_1:FormatText(var_546_17.content)

				arg_543_1.text_.text = var_546_18

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_19 = 17
				local var_546_20 = utf8.len(var_546_18)
				local var_546_21 = var_546_19 <= 0 and var_546_16 or var_546_16 * (var_546_20 / var_546_19)

				if var_546_21 > 0 and var_546_16 < var_546_21 then
					arg_543_1.talkMaxDuration = var_546_21

					if var_546_21 + var_546_15 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_21 + var_546_15
					end
				end

				arg_543_1.text_.text = var_546_18
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_22 = math.max(var_546_16, arg_543_1.talkMaxDuration)

			if var_546_15 <= arg_543_1.time_ and arg_543_1.time_ < var_546_15 + var_546_22 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_15) / var_546_22

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_15 + var_546_22 and arg_543_1.time_ < var_546_15 + var_546_22 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305139 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1109305139
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1109305140(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.275

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[7].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(1109305139)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 11
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_8 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_8 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_8

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_8 and arg_547_1.time_ < var_550_0 + var_550_8 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305140 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1109305140
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play1109305141(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.325

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_2 = arg_551_1:GetWordFromCfg(1109305140)
				local var_554_3 = arg_551_1:FormatText(var_554_2.content)

				arg_551_1.text_.text = var_554_3

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_4 = 13
				local var_554_5 = utf8.len(var_554_3)
				local var_554_6 = var_554_4 <= 0 and var_554_1 or var_554_1 * (var_554_5 / var_554_4)

				if var_554_6 > 0 and var_554_1 < var_554_6 then
					arg_551_1.talkMaxDuration = var_554_6

					if var_554_6 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_6 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_3
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_7 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_7 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_7

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_7 and arg_551_1.time_ < var_554_0 + var_554_7 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305141 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 1109305141
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play1109305142(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.575

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_2 = arg_555_1:FormatText(StoryNameCfg[7].name)

				arg_555_1.leftNameTxt_.text = var_558_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_3 = arg_555_1:GetWordFromCfg(1109305141)
				local var_558_4 = arg_555_1:FormatText(var_558_3.content)

				arg_555_1.text_.text = var_558_4

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_5 = 23
				local var_558_6 = utf8.len(var_558_4)
				local var_558_7 = var_558_5 <= 0 and var_558_1 or var_558_1 * (var_558_6 / var_558_5)

				if var_558_7 > 0 and var_558_1 < var_558_7 then
					arg_555_1.talkMaxDuration = var_558_7

					if var_558_7 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_7 + var_558_0
					end
				end

				arg_555_1.text_.text = var_558_4
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_8 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_8 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_8

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_8 and arg_555_1.time_ < var_558_0 + var_558_8 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305142 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1109305142
		arg_559_1.duration_ = 5.13

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1109305143(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.525

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_2 = arg_559_1:FormatText(StoryNameCfg[1056].name)

				arg_559_1.leftNameTxt_.text = var_562_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, true)
				arg_559_1.iconController_:SetSelectedState("hero")

				arg_559_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_559_1.callingController_:SetSelectedState("normal")

				arg_559_1.keyicon_.color = Color.New(1, 1, 1)
				arg_559_1.icon_.color = Color.New(1, 1, 1)

				local var_562_3 = arg_559_1:GetWordFromCfg(1109305142)
				local var_562_4 = arg_559_1:FormatText(var_562_3.content)

				arg_559_1.text_.text = var_562_4

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_5 = 21
				local var_562_6 = utf8.len(var_562_4)
				local var_562_7 = var_562_5 <= 0 and var_562_1 or var_562_1 * (var_562_6 / var_562_5)

				if var_562_7 > 0 and var_562_1 < var_562_7 then
					arg_559_1.talkMaxDuration = var_562_7

					if var_562_7 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_7 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_4
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305142", "story_v_side_new_1109305.awb") ~= 0 then
					local var_562_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305142", "story_v_side_new_1109305.awb") / 1000

					if var_562_8 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_8 + var_562_0
					end

					if var_562_3.prefab_name ~= "" and arg_559_1.actors_[var_562_3.prefab_name] ~= nil then
						local var_562_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_3.prefab_name].transform, "story_v_side_new_1109305", "1109305142", "story_v_side_new_1109305.awb")

						arg_559_1:RecordAudio("1109305142", var_562_9)
						arg_559_1:RecordAudio("1109305142", var_562_9)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305142", "story_v_side_new_1109305.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305142", "story_v_side_new_1109305.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_10 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_10 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_10

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_10 and arg_559_1.time_ < var_562_0 + var_562_10 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305143 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1109305143
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1109305144(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.275

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[7].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(1109305143)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 11
				local var_566_6 = utf8.len(var_566_4)
				local var_566_7 = var_566_5 <= 0 and var_566_1 or var_566_1 * (var_566_6 / var_566_5)

				if var_566_7 > 0 and var_566_1 < var_566_7 then
					arg_563_1.talkMaxDuration = var_566_7

					if var_566_7 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_7 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_4
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_8 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_8 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_8

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_8 and arg_563_1.time_ < var_566_0 + var_566_8 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305144 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1109305144
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1109305145(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.625

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, false)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_2 = arg_567_1:GetWordFromCfg(1109305144)
				local var_570_3 = arg_567_1:FormatText(var_570_2.content)

				arg_567_1.text_.text = var_570_3

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_4 = 25
				local var_570_5 = utf8.len(var_570_3)
				local var_570_6 = var_570_4 <= 0 and var_570_1 or var_570_1 * (var_570_5 / var_570_4)

				if var_570_6 > 0 and var_570_1 < var_570_6 then
					arg_567_1.talkMaxDuration = var_570_6

					if var_570_6 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_6 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_3
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_7 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_7 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_7

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_7 and arg_567_1.time_ < var_570_0 + var_570_7 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305145 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1109305145
		arg_571_1.duration_ = 8.57

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1109305146(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = 0
			local var_574_1 = 0.95

			if var_574_0 < arg_571_1.time_ and arg_571_1.time_ <= var_574_0 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_2 = arg_571_1:FormatText(StoryNameCfg[1056].name)

				arg_571_1.leftNameTxt_.text = var_574_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, true)
				arg_571_1.iconController_:SetSelectedState("hero")

				arg_571_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_571_1.callingController_:SetSelectedState("normal")

				arg_571_1.keyicon_.color = Color.New(1, 1, 1)
				arg_571_1.icon_.color = Color.New(1, 1, 1)

				local var_574_3 = arg_571_1:GetWordFromCfg(1109305145)
				local var_574_4 = arg_571_1:FormatText(var_574_3.content)

				arg_571_1.text_.text = var_574_4

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_5 = 38
				local var_574_6 = utf8.len(var_574_4)
				local var_574_7 = var_574_5 <= 0 and var_574_1 or var_574_1 * (var_574_6 / var_574_5)

				if var_574_7 > 0 and var_574_1 < var_574_7 then
					arg_571_1.talkMaxDuration = var_574_7

					if var_574_7 + var_574_0 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_7 + var_574_0
					end
				end

				arg_571_1.text_.text = var_574_4
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305145", "story_v_side_new_1109305.awb") ~= 0 then
					local var_574_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305145", "story_v_side_new_1109305.awb") / 1000

					if var_574_8 + var_574_0 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_8 + var_574_0
					end

					if var_574_3.prefab_name ~= "" and arg_571_1.actors_[var_574_3.prefab_name] ~= nil then
						local var_574_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_3.prefab_name].transform, "story_v_side_new_1109305", "1109305145", "story_v_side_new_1109305.awb")

						arg_571_1:RecordAudio("1109305145", var_574_9)
						arg_571_1:RecordAudio("1109305145", var_574_9)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305145", "story_v_side_new_1109305.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305145", "story_v_side_new_1109305.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_10 = math.max(var_574_1, arg_571_1.talkMaxDuration)

			if var_574_0 <= arg_571_1.time_ and arg_571_1.time_ < var_574_0 + var_574_10 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_0) / var_574_10

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_0 + var_574_10 and arg_571_1.time_ < var_574_0 + var_574_10 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305146 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 1109305146
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play1109305147(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = 0
			local var_578_1 = 1.05

			if var_578_0 < arg_575_1.time_ and arg_575_1.time_ <= var_578_0 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, false)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_2 = arg_575_1:GetWordFromCfg(1109305146)
				local var_578_3 = arg_575_1:FormatText(var_578_2.content)

				arg_575_1.text_.text = var_578_3

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_4 = 42
				local var_578_5 = utf8.len(var_578_3)
				local var_578_6 = var_578_4 <= 0 and var_578_1 or var_578_1 * (var_578_5 / var_578_4)

				if var_578_6 > 0 and var_578_1 < var_578_6 then
					arg_575_1.talkMaxDuration = var_578_6

					if var_578_6 + var_578_0 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_6 + var_578_0
					end
				end

				arg_575_1.text_.text = var_578_3
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)
				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_7 = math.max(var_578_1, arg_575_1.talkMaxDuration)

			if var_578_0 <= arg_575_1.time_ and arg_575_1.time_ < var_578_0 + var_578_7 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_0) / var_578_7

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_0 + var_578_7 and arg_575_1.time_ < var_578_0 + var_578_7 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305147 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 1109305147
		arg_579_1.duration_ = 5.03

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play1109305148(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1093ui_story"].transform
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 then
				arg_579_1.var_.moveOldPos1093ui_story = var_582_0.localPosition
			end

			local var_582_2 = 0.001

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2
				local var_582_4 = Vector3.New(0, -1.11, -5.88)

				var_582_0.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1093ui_story, var_582_4, var_582_3)

				local var_582_5 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_5.x, var_582_5.y, var_582_5.z)

				local var_582_6 = var_582_0.localEulerAngles

				var_582_6.z = 0
				var_582_6.x = 0
				var_582_0.localEulerAngles = var_582_6
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 then
				var_582_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_582_7 = manager.ui.mainCamera.transform.position - var_582_0.position

				var_582_0.forward = Vector3.New(var_582_7.x, var_582_7.y, var_582_7.z)

				local var_582_8 = var_582_0.localEulerAngles

				var_582_8.z = 0
				var_582_8.x = 0
				var_582_0.localEulerAngles = var_582_8
			end

			local var_582_9 = arg_579_1.actors_["1093ui_story"]
			local var_582_10 = 0

			if var_582_10 < arg_579_1.time_ and arg_579_1.time_ <= var_582_10 + arg_582_0 and not isNil(var_582_9) and arg_579_1.var_.characterEffect1093ui_story == nil then
				arg_579_1.var_.characterEffect1093ui_story = var_582_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_11 = 0.200000002980232

			if var_582_10 <= arg_579_1.time_ and arg_579_1.time_ < var_582_10 + var_582_11 and not isNil(var_582_9) then
				local var_582_12 = (arg_579_1.time_ - var_582_10) / var_582_11

				if arg_579_1.var_.characterEffect1093ui_story and not isNil(var_582_9) then
					arg_579_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_10 + var_582_11 and arg_579_1.time_ < var_582_10 + var_582_11 + arg_582_0 and not isNil(var_582_9) and arg_579_1.var_.characterEffect1093ui_story then
				arg_579_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_582_13 = 0

			if var_582_13 < arg_579_1.time_ and arg_579_1.time_ <= var_582_13 + arg_582_0 then
				arg_579_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_582_14 = 0

			if var_582_14 < arg_579_1.time_ and arg_579_1.time_ <= var_582_14 + arg_582_0 then
				arg_579_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_582_15 = 0
			local var_582_16 = 0.525

			if var_582_15 < arg_579_1.time_ and arg_579_1.time_ <= var_582_15 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_17 = arg_579_1:FormatText(StoryNameCfg[73].name)

				arg_579_1.leftNameTxt_.text = var_582_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_18 = arg_579_1:GetWordFromCfg(1109305147)
				local var_582_19 = arg_579_1:FormatText(var_582_18.content)

				arg_579_1.text_.text = var_582_19

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_20 = 21
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305147", "story_v_side_new_1109305.awb") ~= 0 then
					local var_582_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305147", "story_v_side_new_1109305.awb") / 1000

					if var_582_23 + var_582_15 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_23 + var_582_15
					end

					if var_582_18.prefab_name ~= "" and arg_579_1.actors_[var_582_18.prefab_name] ~= nil then
						local var_582_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_18.prefab_name].transform, "story_v_side_new_1109305", "1109305147", "story_v_side_new_1109305.awb")

						arg_579_1:RecordAudio("1109305147", var_582_24)
						arg_579_1:RecordAudio("1109305147", var_582_24)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305147", "story_v_side_new_1109305.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305147", "story_v_side_new_1109305.awb")
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
	Play1109305148 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 1109305148
		arg_583_1.duration_ = 9.17

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play1109305149(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = 0

			if var_586_0 < arg_583_1.time_ and arg_583_1.time_ <= var_586_0 + arg_586_0 then
				arg_583_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_586_2 = 0
			local var_586_3 = 1

			if var_586_2 < arg_583_1.time_ and arg_583_1.time_ <= var_586_2 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_4 = arg_583_1:FormatText(StoryNameCfg[73].name)

				arg_583_1.leftNameTxt_.text = var_586_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_5 = arg_583_1:GetWordFromCfg(1109305148)
				local var_586_6 = arg_583_1:FormatText(var_586_5.content)

				arg_583_1.text_.text = var_586_6

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_7 = 40
				local var_586_8 = utf8.len(var_586_6)
				local var_586_9 = var_586_7 <= 0 and var_586_3 or var_586_3 * (var_586_8 / var_586_7)

				if var_586_9 > 0 and var_586_3 < var_586_9 then
					arg_583_1.talkMaxDuration = var_586_9

					if var_586_9 + var_586_2 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_9 + var_586_2
					end
				end

				arg_583_1.text_.text = var_586_6
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305148", "story_v_side_new_1109305.awb") ~= 0 then
					local var_586_10 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305148", "story_v_side_new_1109305.awb") / 1000

					if var_586_10 + var_586_2 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_10 + var_586_2
					end

					if var_586_5.prefab_name ~= "" and arg_583_1.actors_[var_586_5.prefab_name] ~= nil then
						local var_586_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_5.prefab_name].transform, "story_v_side_new_1109305", "1109305148", "story_v_side_new_1109305.awb")

						arg_583_1:RecordAudio("1109305148", var_586_11)
						arg_583_1:RecordAudio("1109305148", var_586_11)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305148", "story_v_side_new_1109305.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305148", "story_v_side_new_1109305.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_12 = math.max(var_586_3, arg_583_1.talkMaxDuration)

			if var_586_2 <= arg_583_1.time_ and arg_583_1.time_ < var_586_2 + var_586_12 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_2) / var_586_12

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_2 + var_586_12 and arg_583_1.time_ < var_586_2 + var_586_12 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305149 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 1109305149
		arg_587_1.duration_ = 5

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play1109305150(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["1093ui_story"]
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 and not isNil(var_590_0) and arg_587_1.var_.characterEffect1093ui_story == nil then
				arg_587_1.var_.characterEffect1093ui_story = var_590_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_2 = 0.200000002980232

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 and not isNil(var_590_0) then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2

				if arg_587_1.var_.characterEffect1093ui_story and not isNil(var_590_0) then
					local var_590_4 = Mathf.Lerp(0, 0.5, var_590_3)

					arg_587_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_587_1.var_.characterEffect1093ui_story.fillRatio = var_590_4
				end
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 and not isNil(var_590_0) and arg_587_1.var_.characterEffect1093ui_story then
				local var_590_5 = 0.5

				arg_587_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_587_1.var_.characterEffect1093ui_story.fillRatio = var_590_5
			end

			local var_590_6 = 0
			local var_590_7 = 0.175

			if var_590_6 < arg_587_1.time_ and arg_587_1.time_ <= var_590_6 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_8 = arg_587_1:FormatText(StoryNameCfg[7].name)

				arg_587_1.leftNameTxt_.text = var_590_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_9 = arg_587_1:GetWordFromCfg(1109305149)
				local var_590_10 = arg_587_1:FormatText(var_590_9.content)

				arg_587_1.text_.text = var_590_10

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_11 = 7
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
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_14 = math.max(var_590_7, arg_587_1.talkMaxDuration)

			if var_590_6 <= arg_587_1.time_ and arg_587_1.time_ < var_590_6 + var_590_14 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_6) / var_590_14

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_6 + var_590_14 and arg_587_1.time_ < var_590_6 + var_590_14 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305150 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 1109305150
		arg_591_1.duration_ = 2.4

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play1109305151(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["1093ui_story"]
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 and not isNil(var_594_0) and arg_591_1.var_.characterEffect1093ui_story == nil then
				arg_591_1.var_.characterEffect1093ui_story = var_594_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_2 = 0.200000002980232

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 and not isNil(var_594_0) then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2

				if arg_591_1.var_.characterEffect1093ui_story and not isNil(var_594_0) then
					arg_591_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 and not isNil(var_594_0) and arg_591_1.var_.characterEffect1093ui_story then
				arg_591_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_594_4 = 0
			local var_594_5 = 0.3

			if var_594_4 < arg_591_1.time_ and arg_591_1.time_ <= var_594_4 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_6 = arg_591_1:FormatText(StoryNameCfg[73].name)

				arg_591_1.leftNameTxt_.text = var_594_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_7 = arg_591_1:GetWordFromCfg(1109305150)
				local var_594_8 = arg_591_1:FormatText(var_594_7.content)

				arg_591_1.text_.text = var_594_8

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_9 = 12
				local var_594_10 = utf8.len(var_594_8)
				local var_594_11 = var_594_9 <= 0 and var_594_5 or var_594_5 * (var_594_10 / var_594_9)

				if var_594_11 > 0 and var_594_5 < var_594_11 then
					arg_591_1.talkMaxDuration = var_594_11

					if var_594_11 + var_594_4 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_11 + var_594_4
					end
				end

				arg_591_1.text_.text = var_594_8
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305150", "story_v_side_new_1109305.awb") ~= 0 then
					local var_594_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305150", "story_v_side_new_1109305.awb") / 1000

					if var_594_12 + var_594_4 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_12 + var_594_4
					end

					if var_594_7.prefab_name ~= "" and arg_591_1.actors_[var_594_7.prefab_name] ~= nil then
						local var_594_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_7.prefab_name].transform, "story_v_side_new_1109305", "1109305150", "story_v_side_new_1109305.awb")

						arg_591_1:RecordAudio("1109305150", var_594_13)
						arg_591_1:RecordAudio("1109305150", var_594_13)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305150", "story_v_side_new_1109305.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305150", "story_v_side_new_1109305.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_14 = math.max(var_594_5, arg_591_1.talkMaxDuration)

			if var_594_4 <= arg_591_1.time_ and arg_591_1.time_ < var_594_4 + var_594_14 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_4) / var_594_14

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_4 + var_594_14 and arg_591_1.time_ < var_594_4 + var_594_14 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305151 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 1109305151
		arg_595_1.duration_ = 6.57

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play1109305152(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1093ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and not isNil(var_598_0) and arg_595_1.var_.characterEffect1093ui_story == nil then
				arg_595_1.var_.characterEffect1093ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.200000002980232

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 and not isNil(var_598_0) then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1093ui_story and not isNil(var_598_0) then
					local var_598_4 = Mathf.Lerp(0, 0.5, var_598_3)

					arg_595_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_595_1.var_.characterEffect1093ui_story.fillRatio = var_598_4
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and not isNil(var_598_0) and arg_595_1.var_.characterEffect1093ui_story then
				local var_598_5 = 0.5

				arg_595_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_595_1.var_.characterEffect1093ui_story.fillRatio = var_598_5
			end

			local var_598_6 = 0
			local var_598_7 = 0.725

			if var_598_6 < arg_595_1.time_ and arg_595_1.time_ <= var_598_6 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_8 = arg_595_1:FormatText(StoryNameCfg[1056].name)

				arg_595_1.leftNameTxt_.text = var_598_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, true)
				arg_595_1.iconController_:SetSelectedState("hero")

				arg_595_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_595_1.callingController_:SetSelectedState("normal")

				arg_595_1.keyicon_.color = Color.New(1, 1, 1)
				arg_595_1.icon_.color = Color.New(1, 1, 1)

				local var_598_9 = arg_595_1:GetWordFromCfg(1109305151)
				local var_598_10 = arg_595_1:FormatText(var_598_9.content)

				arg_595_1.text_.text = var_598_10

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_11 = 29
				local var_598_12 = utf8.len(var_598_10)
				local var_598_13 = var_598_11 <= 0 and var_598_7 or var_598_7 * (var_598_12 / var_598_11)

				if var_598_13 > 0 and var_598_7 < var_598_13 then
					arg_595_1.talkMaxDuration = var_598_13

					if var_598_13 + var_598_6 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_13 + var_598_6
					end
				end

				arg_595_1.text_.text = var_598_10
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305151", "story_v_side_new_1109305.awb") ~= 0 then
					local var_598_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305151", "story_v_side_new_1109305.awb") / 1000

					if var_598_14 + var_598_6 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_14 + var_598_6
					end

					if var_598_9.prefab_name ~= "" and arg_595_1.actors_[var_598_9.prefab_name] ~= nil then
						local var_598_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_9.prefab_name].transform, "story_v_side_new_1109305", "1109305151", "story_v_side_new_1109305.awb")

						arg_595_1:RecordAudio("1109305151", var_598_15)
						arg_595_1:RecordAudio("1109305151", var_598_15)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305151", "story_v_side_new_1109305.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305151", "story_v_side_new_1109305.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_16 = math.max(var_598_7, arg_595_1.talkMaxDuration)

			if var_598_6 <= arg_595_1.time_ and arg_595_1.time_ < var_598_6 + var_598_16 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_6) / var_598_16

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_6 + var_598_16 and arg_595_1.time_ < var_598_6 + var_598_16 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305152 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1109305152
		arg_599_1.duration_ = 6.2

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1109305153(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1093ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.characterEffect1093ui_story == nil then
				arg_599_1.var_.characterEffect1093ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.200000002980232

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 and not isNil(var_602_0) then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1093ui_story and not isNil(var_602_0) then
					arg_599_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and not isNil(var_602_0) and arg_599_1.var_.characterEffect1093ui_story then
				arg_599_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_602_4 = 0
			local var_602_5 = 0.75

			if var_602_4 < arg_599_1.time_ and arg_599_1.time_ <= var_602_4 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_6 = arg_599_1:FormatText(StoryNameCfg[73].name)

				arg_599_1.leftNameTxt_.text = var_602_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_7 = arg_599_1:GetWordFromCfg(1109305152)
				local var_602_8 = arg_599_1:FormatText(var_602_7.content)

				arg_599_1.text_.text = var_602_8

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_9 = 30
				local var_602_10 = utf8.len(var_602_8)
				local var_602_11 = var_602_9 <= 0 and var_602_5 or var_602_5 * (var_602_10 / var_602_9)

				if var_602_11 > 0 and var_602_5 < var_602_11 then
					arg_599_1.talkMaxDuration = var_602_11

					if var_602_11 + var_602_4 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_11 + var_602_4
					end
				end

				arg_599_1.text_.text = var_602_8
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305152", "story_v_side_new_1109305.awb") ~= 0 then
					local var_602_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305152", "story_v_side_new_1109305.awb") / 1000

					if var_602_12 + var_602_4 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_12 + var_602_4
					end

					if var_602_7.prefab_name ~= "" and arg_599_1.actors_[var_602_7.prefab_name] ~= nil then
						local var_602_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_7.prefab_name].transform, "story_v_side_new_1109305", "1109305152", "story_v_side_new_1109305.awb")

						arg_599_1:RecordAudio("1109305152", var_602_13)
						arg_599_1:RecordAudio("1109305152", var_602_13)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305152", "story_v_side_new_1109305.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305152", "story_v_side_new_1109305.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_14 = math.max(var_602_5, arg_599_1.talkMaxDuration)

			if var_602_4 <= arg_599_1.time_ and arg_599_1.time_ < var_602_4 + var_602_14 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_4) / var_602_14

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_4 + var_602_14 and arg_599_1.time_ < var_602_4 + var_602_14 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305153 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1109305153
		arg_603_1.duration_ = 7.13

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1109305154(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["1093ui_story"]
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.characterEffect1093ui_story == nil then
				arg_603_1.var_.characterEffect1093ui_story = var_606_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_606_2 = 0.200000002980232

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 and not isNil(var_606_0) then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2

				if arg_603_1.var_.characterEffect1093ui_story and not isNil(var_606_0) then
					local var_606_4 = Mathf.Lerp(0, 0.5, var_606_3)

					arg_603_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_603_1.var_.characterEffect1093ui_story.fillRatio = var_606_4
				end
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.characterEffect1093ui_story then
				local var_606_5 = 0.5

				arg_603_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_603_1.var_.characterEffect1093ui_story.fillRatio = var_606_5
			end

			local var_606_6 = 0
			local var_606_7 = 0.65

			if var_606_6 < arg_603_1.time_ and arg_603_1.time_ <= var_606_6 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_8 = arg_603_1:FormatText(StoryNameCfg[1056].name)

				arg_603_1.leftNameTxt_.text = var_606_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, true)
				arg_603_1.iconController_:SetSelectedState("hero")

				arg_603_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_603_1.callingController_:SetSelectedState("normal")

				arg_603_1.keyicon_.color = Color.New(1, 1, 1)
				arg_603_1.icon_.color = Color.New(1, 1, 1)

				local var_606_9 = arg_603_1:GetWordFromCfg(1109305153)
				local var_606_10 = arg_603_1:FormatText(var_606_9.content)

				arg_603_1.text_.text = var_606_10

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_11 = 26
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305153", "story_v_side_new_1109305.awb") ~= 0 then
					local var_606_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305153", "story_v_side_new_1109305.awb") / 1000

					if var_606_14 + var_606_6 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_14 + var_606_6
					end

					if var_606_9.prefab_name ~= "" and arg_603_1.actors_[var_606_9.prefab_name] ~= nil then
						local var_606_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_9.prefab_name].transform, "story_v_side_new_1109305", "1109305153", "story_v_side_new_1109305.awb")

						arg_603_1:RecordAudio("1109305153", var_606_15)
						arg_603_1:RecordAudio("1109305153", var_606_15)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305153", "story_v_side_new_1109305.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305153", "story_v_side_new_1109305.awb")
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
	Play1109305154 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1109305154
		arg_607_1.duration_ = 8.97

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1109305155(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1093ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.characterEffect1093ui_story == nil then
				arg_607_1.var_.characterEffect1093ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.200000002980232

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 and not isNil(var_610_0) then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect1093ui_story and not isNil(var_610_0) then
					arg_607_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.characterEffect1093ui_story then
				arg_607_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_610_4 = 0

			if var_610_4 < arg_607_1.time_ and arg_607_1.time_ <= var_610_4 + arg_610_0 then
				arg_607_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_610_5 = 0

			if var_610_5 < arg_607_1.time_ and arg_607_1.time_ <= var_610_5 + arg_610_0 then
				arg_607_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_610_6 = 0
			local var_610_7 = 0.975

			if var_610_6 < arg_607_1.time_ and arg_607_1.time_ <= var_610_6 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_8 = arg_607_1:FormatText(StoryNameCfg[73].name)

				arg_607_1.leftNameTxt_.text = var_610_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_9 = arg_607_1:GetWordFromCfg(1109305154)
				local var_610_10 = arg_607_1:FormatText(var_610_9.content)

				arg_607_1.text_.text = var_610_10

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_11 = 39
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305154", "story_v_side_new_1109305.awb") ~= 0 then
					local var_610_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305154", "story_v_side_new_1109305.awb") / 1000

					if var_610_14 + var_610_6 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_14 + var_610_6
					end

					if var_610_9.prefab_name ~= "" and arg_607_1.actors_[var_610_9.prefab_name] ~= nil then
						local var_610_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_9.prefab_name].transform, "story_v_side_new_1109305", "1109305154", "story_v_side_new_1109305.awb")

						arg_607_1:RecordAudio("1109305154", var_610_15)
						arg_607_1:RecordAudio("1109305154", var_610_15)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305154", "story_v_side_new_1109305.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305154", "story_v_side_new_1109305.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_16 = math.max(var_610_7, arg_607_1.talkMaxDuration)

			if var_610_6 <= arg_607_1.time_ and arg_607_1.time_ < var_610_6 + var_610_16 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_6) / var_610_16

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_6 + var_610_16 and arg_607_1.time_ < var_610_6 + var_610_16 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305155 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1109305155
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1109305156(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["1093ui_story"]
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 and not isNil(var_614_0) and arg_611_1.var_.characterEffect1093ui_story == nil then
				arg_611_1.var_.characterEffect1093ui_story = var_614_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_2 = 0.200000002980232

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 and not isNil(var_614_0) then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2

				if arg_611_1.var_.characterEffect1093ui_story and not isNil(var_614_0) then
					local var_614_4 = Mathf.Lerp(0, 0.5, var_614_3)

					arg_611_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_611_1.var_.characterEffect1093ui_story.fillRatio = var_614_4
				end
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 and not isNil(var_614_0) and arg_611_1.var_.characterEffect1093ui_story then
				local var_614_5 = 0.5

				arg_611_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_611_1.var_.characterEffect1093ui_story.fillRatio = var_614_5
			end

			local var_614_6 = 0
			local var_614_7 = 0.65

			if var_614_6 < arg_611_1.time_ and arg_611_1.time_ <= var_614_6 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_8 = arg_611_1:FormatText(StoryNameCfg[7].name)

				arg_611_1.leftNameTxt_.text = var_614_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_9 = arg_611_1:GetWordFromCfg(1109305155)
				local var_614_10 = arg_611_1:FormatText(var_614_9.content)

				arg_611_1.text_.text = var_614_10

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_11 = 26
				local var_614_12 = utf8.len(var_614_10)
				local var_614_13 = var_614_11 <= 0 and var_614_7 or var_614_7 * (var_614_12 / var_614_11)

				if var_614_13 > 0 and var_614_7 < var_614_13 then
					arg_611_1.talkMaxDuration = var_614_13

					if var_614_13 + var_614_6 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_13 + var_614_6
					end
				end

				arg_611_1.text_.text = var_614_10
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_14 = math.max(var_614_7, arg_611_1.talkMaxDuration)

			if var_614_6 <= arg_611_1.time_ and arg_611_1.time_ < var_614_6 + var_614_14 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_6) / var_614_14

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_6 + var_614_14 and arg_611_1.time_ < var_614_6 + var_614_14 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305156 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1109305156
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1109305157(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 1.025

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_2 = arg_615_1:FormatText(StoryNameCfg[7].name)

				arg_615_1.leftNameTxt_.text = var_618_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_3 = arg_615_1:GetWordFromCfg(1109305156)
				local var_618_4 = arg_615_1:FormatText(var_618_3.content)

				arg_615_1.text_.text = var_618_4

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_5 = 41
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
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_8 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_8 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_8

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_8 and arg_615_1.time_ < var_618_0 + var_618_8 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305157 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 1109305157
		arg_619_1.duration_ = 5

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play1109305158(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_622_1 = 0
			local var_622_2 = 0.9

			if var_622_1 < arg_619_1.time_ and arg_619_1.time_ <= var_622_1 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, false)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(1109305157)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 36
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_2 or var_622_2 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_2 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_1 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_1
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)
				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_8 = math.max(var_622_2, arg_619_1.talkMaxDuration)

			if var_622_1 <= arg_619_1.time_ and arg_619_1.time_ < var_622_1 + var_622_8 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_1) / var_622_8

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_1 + var_622_8 and arg_619_1.time_ < var_622_1 + var_622_8 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305158 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 1109305158
		arg_623_1.duration_ = 5.6

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play1109305159(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_626_1 = arg_623_1.actors_["1093ui_story"]
			local var_626_2 = 0

			if var_626_2 < arg_623_1.time_ and arg_623_1.time_ <= var_626_2 + arg_626_0 and not isNil(var_626_1) and arg_623_1.var_.characterEffect1093ui_story == nil then
				arg_623_1.var_.characterEffect1093ui_story = var_626_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_3 = 0.200000002980232

			if var_626_2 <= arg_623_1.time_ and arg_623_1.time_ < var_626_2 + var_626_3 and not isNil(var_626_1) then
				local var_626_4 = (arg_623_1.time_ - var_626_2) / var_626_3

				if arg_623_1.var_.characterEffect1093ui_story and not isNil(var_626_1) then
					arg_623_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_2 + var_626_3 and arg_623_1.time_ < var_626_2 + var_626_3 + arg_626_0 and not isNil(var_626_1) and arg_623_1.var_.characterEffect1093ui_story then
				arg_623_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_626_5 = 0
			local var_626_6 = 0.525

			if var_626_5 < arg_623_1.time_ and arg_623_1.time_ <= var_626_5 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_7 = arg_623_1:FormatText(StoryNameCfg[73].name)

				arg_623_1.leftNameTxt_.text = var_626_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_8 = arg_623_1:GetWordFromCfg(1109305158)
				local var_626_9 = arg_623_1:FormatText(var_626_8.content)

				arg_623_1.text_.text = var_626_9

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_10 = 21
				local var_626_11 = utf8.len(var_626_9)
				local var_626_12 = var_626_10 <= 0 and var_626_6 or var_626_6 * (var_626_11 / var_626_10)

				if var_626_12 > 0 and var_626_6 < var_626_12 then
					arg_623_1.talkMaxDuration = var_626_12

					if var_626_12 + var_626_5 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_12 + var_626_5
					end
				end

				arg_623_1.text_.text = var_626_9
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305158", "story_v_side_new_1109305.awb") ~= 0 then
					local var_626_13 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305158", "story_v_side_new_1109305.awb") / 1000

					if var_626_13 + var_626_5 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_13 + var_626_5
					end

					if var_626_8.prefab_name ~= "" and arg_623_1.actors_[var_626_8.prefab_name] ~= nil then
						local var_626_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_8.prefab_name].transform, "story_v_side_new_1109305", "1109305158", "story_v_side_new_1109305.awb")

						arg_623_1:RecordAudio("1109305158", var_626_14)
						arg_623_1:RecordAudio("1109305158", var_626_14)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305158", "story_v_side_new_1109305.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305158", "story_v_side_new_1109305.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_15 = math.max(var_626_6, arg_623_1.talkMaxDuration)

			if var_626_5 <= arg_623_1.time_ and arg_623_1.time_ < var_626_5 + var_626_15 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_5) / var_626_15

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_5 + var_626_15 and arg_623_1.time_ < var_626_5 + var_626_15 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305159 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 1109305159
		arg_627_1.duration_ = 4.1

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play1109305160(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1093ui_story"]
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 and not isNil(var_630_0) and arg_627_1.var_.characterEffect1093ui_story == nil then
				arg_627_1.var_.characterEffect1093ui_story = var_630_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_2 = 0.200000002980232

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 and not isNil(var_630_0) then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2

				if arg_627_1.var_.characterEffect1093ui_story and not isNil(var_630_0) then
					local var_630_4 = Mathf.Lerp(0, 0.5, var_630_3)

					arg_627_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1093ui_story.fillRatio = var_630_4
				end
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 and not isNil(var_630_0) and arg_627_1.var_.characterEffect1093ui_story then
				local var_630_5 = 0.5

				arg_627_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1093ui_story.fillRatio = var_630_5
			end

			local var_630_6 = 0
			local var_630_7 = 0.35

			if var_630_6 < arg_627_1.time_ and arg_627_1.time_ <= var_630_6 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_8 = arg_627_1:FormatText(StoryNameCfg[1056].name)

				arg_627_1.leftNameTxt_.text = var_630_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, true)
				arg_627_1.iconController_:SetSelectedState("hero")

				arg_627_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_b")

				arg_627_1.callingController_:SetSelectedState("normal")

				arg_627_1.keyicon_.color = Color.New(1, 1, 1)
				arg_627_1.icon_.color = Color.New(1, 1, 1)

				local var_630_9 = arg_627_1:GetWordFromCfg(1109305159)
				local var_630_10 = arg_627_1:FormatText(var_630_9.content)

				arg_627_1.text_.text = var_630_10

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_11 = 14
				local var_630_12 = utf8.len(var_630_10)
				local var_630_13 = var_630_11 <= 0 and var_630_7 or var_630_7 * (var_630_12 / var_630_11)

				if var_630_13 > 0 and var_630_7 < var_630_13 then
					arg_627_1.talkMaxDuration = var_630_13

					if var_630_13 + var_630_6 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_13 + var_630_6
					end
				end

				arg_627_1.text_.text = var_630_10
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305159", "story_v_side_new_1109305.awb") ~= 0 then
					local var_630_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305159", "story_v_side_new_1109305.awb") / 1000

					if var_630_14 + var_630_6 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_14 + var_630_6
					end

					if var_630_9.prefab_name ~= "" and arg_627_1.actors_[var_630_9.prefab_name] ~= nil then
						local var_630_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_9.prefab_name].transform, "story_v_side_new_1109305", "1109305159", "story_v_side_new_1109305.awb")

						arg_627_1:RecordAudio("1109305159", var_630_15)
						arg_627_1:RecordAudio("1109305159", var_630_15)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305159", "story_v_side_new_1109305.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305159", "story_v_side_new_1109305.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_16 = math.max(var_630_7, arg_627_1.talkMaxDuration)

			if var_630_6 <= arg_627_1.time_ and arg_627_1.time_ < var_630_6 + var_630_16 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_6) / var_630_16

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_6 + var_630_16 and arg_627_1.time_ < var_630_6 + var_630_16 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305160 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 1109305160
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play1109305161(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = 0
			local var_634_1 = 0.175

			if var_634_0 < arg_631_1.time_ and arg_631_1.time_ <= var_634_0 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_2 = arg_631_1:FormatText(StoryNameCfg[7].name)

				arg_631_1.leftNameTxt_.text = var_634_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_3 = arg_631_1:GetWordFromCfg(1109305160)
				local var_634_4 = arg_631_1:FormatText(var_634_3.content)

				arg_631_1.text_.text = var_634_4

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_5 = 7
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
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_8 = math.max(var_634_1, arg_631_1.talkMaxDuration)

			if var_634_0 <= arg_631_1.time_ and arg_631_1.time_ < var_634_0 + var_634_8 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_0) / var_634_8

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_0 + var_634_8 and arg_631_1.time_ < var_634_0 + var_634_8 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305161 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 1109305161
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play1109305162(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = arg_635_1.actors_["1093ui_story"].transform
			local var_638_1 = 0

			if var_638_1 < arg_635_1.time_ and arg_635_1.time_ <= var_638_1 + arg_638_0 then
				arg_635_1.var_.moveOldPos1093ui_story = var_638_0.localPosition
			end

			local var_638_2 = 0.001

			if var_638_1 <= arg_635_1.time_ and arg_635_1.time_ < var_638_1 + var_638_2 then
				local var_638_3 = (arg_635_1.time_ - var_638_1) / var_638_2
				local var_638_4 = Vector3.New(0, 100, 0)

				var_638_0.localPosition = Vector3.Lerp(arg_635_1.var_.moveOldPos1093ui_story, var_638_4, var_638_3)

				local var_638_5 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_5.x, var_638_5.y, var_638_5.z)

				local var_638_6 = var_638_0.localEulerAngles

				var_638_6.z = 0
				var_638_6.x = 0
				var_638_0.localEulerAngles = var_638_6
			end

			if arg_635_1.time_ >= var_638_1 + var_638_2 and arg_635_1.time_ < var_638_1 + var_638_2 + arg_638_0 then
				var_638_0.localPosition = Vector3.New(0, 100, 0)

				local var_638_7 = manager.ui.mainCamera.transform.position - var_638_0.position

				var_638_0.forward = Vector3.New(var_638_7.x, var_638_7.y, var_638_7.z)

				local var_638_8 = var_638_0.localEulerAngles

				var_638_8.z = 0
				var_638_8.x = 0
				var_638_0.localEulerAngles = var_638_8
			end

			local var_638_9 = arg_635_1.actors_["1093ui_story"]
			local var_638_10 = 0

			if var_638_10 < arg_635_1.time_ and arg_635_1.time_ <= var_638_10 + arg_638_0 and not isNil(var_638_9) and arg_635_1.var_.characterEffect1093ui_story == nil then
				arg_635_1.var_.characterEffect1093ui_story = var_638_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_638_11 = 0.200000002980232

			if var_638_10 <= arg_635_1.time_ and arg_635_1.time_ < var_638_10 + var_638_11 and not isNil(var_638_9) then
				local var_638_12 = (arg_635_1.time_ - var_638_10) / var_638_11

				if arg_635_1.var_.characterEffect1093ui_story and not isNil(var_638_9) then
					local var_638_13 = Mathf.Lerp(0, 0.5, var_638_12)

					arg_635_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_635_1.var_.characterEffect1093ui_story.fillRatio = var_638_13
				end
			end

			if arg_635_1.time_ >= var_638_10 + var_638_11 and arg_635_1.time_ < var_638_10 + var_638_11 + arg_638_0 and not isNil(var_638_9) and arg_635_1.var_.characterEffect1093ui_story then
				local var_638_14 = 0.5

				arg_635_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_635_1.var_.characterEffect1093ui_story.fillRatio = var_638_14
			end

			local var_638_15 = 0
			local var_638_16 = 0.475

			if var_638_15 < arg_635_1.time_ and arg_635_1.time_ <= var_638_15 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, false)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_17 = arg_635_1:GetWordFromCfg(1109305161)
				local var_638_18 = arg_635_1:FormatText(var_638_17.content)

				arg_635_1.text_.text = var_638_18

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_19 = 19
				local var_638_20 = utf8.len(var_638_18)
				local var_638_21 = var_638_19 <= 0 and var_638_16 or var_638_16 * (var_638_20 / var_638_19)

				if var_638_21 > 0 and var_638_16 < var_638_21 then
					arg_635_1.talkMaxDuration = var_638_21

					if var_638_21 + var_638_15 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_21 + var_638_15
					end
				end

				arg_635_1.text_.text = var_638_18
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_22 = math.max(var_638_16, arg_635_1.talkMaxDuration)

			if var_638_15 <= arg_635_1.time_ and arg_635_1.time_ < var_638_15 + var_638_22 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_15) / var_638_22

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_15 + var_638_22 and arg_635_1.time_ < var_638_15 + var_638_22 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305162 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 1109305162
		arg_639_1.duration_ = 5

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play1109305163(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 0.75

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[7].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(1109305162)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 30
				local var_642_6 = utf8.len(var_642_4)
				local var_642_7 = var_642_5 <= 0 and var_642_1 or var_642_1 * (var_642_6 / var_642_5)

				if var_642_7 > 0 and var_642_1 < var_642_7 then
					arg_639_1.talkMaxDuration = var_642_7

					if var_642_7 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_7 + var_642_0
					end
				end

				arg_639_1.text_.text = var_642_4
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_8 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_8 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_8

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_8 and arg_639_1.time_ < var_642_0 + var_642_8 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305163 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 1109305163
		arg_643_1.duration_ = 7.57

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play1109305164(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = arg_643_1.actors_["1093ui_story"].transform
			local var_646_1 = 0

			if var_646_1 < arg_643_1.time_ and arg_643_1.time_ <= var_646_1 + arg_646_0 then
				arg_643_1.var_.moveOldPos1093ui_story = var_646_0.localPosition
			end

			local var_646_2 = 0.001

			if var_646_1 <= arg_643_1.time_ and arg_643_1.time_ < var_646_1 + var_646_2 then
				local var_646_3 = (arg_643_1.time_ - var_646_1) / var_646_2
				local var_646_4 = Vector3.New(0, -1.11, -5.88)

				var_646_0.localPosition = Vector3.Lerp(arg_643_1.var_.moveOldPos1093ui_story, var_646_4, var_646_3)

				local var_646_5 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_5.x, var_646_5.y, var_646_5.z)

				local var_646_6 = var_646_0.localEulerAngles

				var_646_6.z = 0
				var_646_6.x = 0
				var_646_0.localEulerAngles = var_646_6
			end

			if arg_643_1.time_ >= var_646_1 + var_646_2 and arg_643_1.time_ < var_646_1 + var_646_2 + arg_646_0 then
				var_646_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_646_7 = manager.ui.mainCamera.transform.position - var_646_0.position

				var_646_0.forward = Vector3.New(var_646_7.x, var_646_7.y, var_646_7.z)

				local var_646_8 = var_646_0.localEulerAngles

				var_646_8.z = 0
				var_646_8.x = 0
				var_646_0.localEulerAngles = var_646_8
			end

			local var_646_9 = arg_643_1.actors_["1093ui_story"]
			local var_646_10 = 0

			if var_646_10 < arg_643_1.time_ and arg_643_1.time_ <= var_646_10 + arg_646_0 and not isNil(var_646_9) and arg_643_1.var_.characterEffect1093ui_story == nil then
				arg_643_1.var_.characterEffect1093ui_story = var_646_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_646_11 = 0.200000002980232

			if var_646_10 <= arg_643_1.time_ and arg_643_1.time_ < var_646_10 + var_646_11 and not isNil(var_646_9) then
				local var_646_12 = (arg_643_1.time_ - var_646_10) / var_646_11

				if arg_643_1.var_.characterEffect1093ui_story and not isNil(var_646_9) then
					arg_643_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_643_1.time_ >= var_646_10 + var_646_11 and arg_643_1.time_ < var_646_10 + var_646_11 + arg_646_0 and not isNil(var_646_9) and arg_643_1.var_.characterEffect1093ui_story then
				arg_643_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_646_13 = 0

			if var_646_13 < arg_643_1.time_ and arg_643_1.time_ <= var_646_13 + arg_646_0 then
				arg_643_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_1")
			end

			local var_646_14 = 0

			if var_646_14 < arg_643_1.time_ and arg_643_1.time_ <= var_646_14 + arg_646_0 then
				arg_643_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_646_15 = 0
			local var_646_16 = 0.75

			if var_646_15 < arg_643_1.time_ and arg_643_1.time_ <= var_646_15 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_17 = arg_643_1:FormatText(StoryNameCfg[73].name)

				arg_643_1.leftNameTxt_.text = var_646_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_18 = arg_643_1:GetWordFromCfg(1109305163)
				local var_646_19 = arg_643_1:FormatText(var_646_18.content)

				arg_643_1.text_.text = var_646_19

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_20 = 30
				local var_646_21 = utf8.len(var_646_19)
				local var_646_22 = var_646_20 <= 0 and var_646_16 or var_646_16 * (var_646_21 / var_646_20)

				if var_646_22 > 0 and var_646_16 < var_646_22 then
					arg_643_1.talkMaxDuration = var_646_22

					if var_646_22 + var_646_15 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_22 + var_646_15
					end
				end

				arg_643_1.text_.text = var_646_19
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305163", "story_v_side_new_1109305.awb") ~= 0 then
					local var_646_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305163", "story_v_side_new_1109305.awb") / 1000

					if var_646_23 + var_646_15 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_23 + var_646_15
					end

					if var_646_18.prefab_name ~= "" and arg_643_1.actors_[var_646_18.prefab_name] ~= nil then
						local var_646_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_18.prefab_name].transform, "story_v_side_new_1109305", "1109305163", "story_v_side_new_1109305.awb")

						arg_643_1:RecordAudio("1109305163", var_646_24)
						arg_643_1:RecordAudio("1109305163", var_646_24)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305163", "story_v_side_new_1109305.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305163", "story_v_side_new_1109305.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_25 = math.max(var_646_16, arg_643_1.talkMaxDuration)

			if var_646_15 <= arg_643_1.time_ and arg_643_1.time_ < var_646_15 + var_646_25 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_15) / var_646_25

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_15 + var_646_25 and arg_643_1.time_ < var_646_15 + var_646_25 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305164 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 1109305164
		arg_647_1.duration_ = 3.6

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play1109305165(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0
			local var_650_1 = 0.425

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_2 = arg_647_1:FormatText(StoryNameCfg[73].name)

				arg_647_1.leftNameTxt_.text = var_650_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_3 = arg_647_1:GetWordFromCfg(1109305164)
				local var_650_4 = arg_647_1:FormatText(var_650_3.content)

				arg_647_1.text_.text = var_650_4

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_5 = 17
				local var_650_6 = utf8.len(var_650_4)
				local var_650_7 = var_650_5 <= 0 and var_650_1 or var_650_1 * (var_650_6 / var_650_5)

				if var_650_7 > 0 and var_650_1 < var_650_7 then
					arg_647_1.talkMaxDuration = var_650_7

					if var_650_7 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_7 + var_650_0
					end
				end

				arg_647_1.text_.text = var_650_4
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305164", "story_v_side_new_1109305.awb") ~= 0 then
					local var_650_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305164", "story_v_side_new_1109305.awb") / 1000

					if var_650_8 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_8 + var_650_0
					end

					if var_650_3.prefab_name ~= "" and arg_647_1.actors_[var_650_3.prefab_name] ~= nil then
						local var_650_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_3.prefab_name].transform, "story_v_side_new_1109305", "1109305164", "story_v_side_new_1109305.awb")

						arg_647_1:RecordAudio("1109305164", var_650_9)
						arg_647_1:RecordAudio("1109305164", var_650_9)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305164", "story_v_side_new_1109305.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305164", "story_v_side_new_1109305.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_10 = math.max(var_650_1, arg_647_1.talkMaxDuration)

			if var_650_0 <= arg_647_1.time_ and arg_647_1.time_ < var_650_0 + var_650_10 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_0) / var_650_10

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_0 + var_650_10 and arg_647_1.time_ < var_650_0 + var_650_10 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305165 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 1109305165
		arg_651_1.duration_ = 5

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play1109305166(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = arg_651_1.actors_["1093ui_story"]
			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 and not isNil(var_654_0) and arg_651_1.var_.characterEffect1093ui_story == nil then
				arg_651_1.var_.characterEffect1093ui_story = var_654_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_654_2 = 0.200000002980232

			if var_654_1 <= arg_651_1.time_ and arg_651_1.time_ < var_654_1 + var_654_2 and not isNil(var_654_0) then
				local var_654_3 = (arg_651_1.time_ - var_654_1) / var_654_2

				if arg_651_1.var_.characterEffect1093ui_story and not isNil(var_654_0) then
					local var_654_4 = Mathf.Lerp(0, 0.5, var_654_3)

					arg_651_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_651_1.var_.characterEffect1093ui_story.fillRatio = var_654_4
				end
			end

			if arg_651_1.time_ >= var_654_1 + var_654_2 and arg_651_1.time_ < var_654_1 + var_654_2 + arg_654_0 and not isNil(var_654_0) and arg_651_1.var_.characterEffect1093ui_story then
				local var_654_5 = 0.5

				arg_651_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_651_1.var_.characterEffect1093ui_story.fillRatio = var_654_5
			end

			local var_654_6 = 0
			local var_654_7 = 0.475

			if var_654_6 < arg_651_1.time_ and arg_651_1.time_ <= var_654_6 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_8 = arg_651_1:FormatText(StoryNameCfg[7].name)

				arg_651_1.leftNameTxt_.text = var_654_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_9 = arg_651_1:GetWordFromCfg(1109305165)
				local var_654_10 = arg_651_1:FormatText(var_654_9.content)

				arg_651_1.text_.text = var_654_10

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_11 = 19
				local var_654_12 = utf8.len(var_654_10)
				local var_654_13 = var_654_11 <= 0 and var_654_7 or var_654_7 * (var_654_12 / var_654_11)

				if var_654_13 > 0 and var_654_7 < var_654_13 then
					arg_651_1.talkMaxDuration = var_654_13

					if var_654_13 + var_654_6 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_13 + var_654_6
					end
				end

				arg_651_1.text_.text = var_654_10
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)
				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_14 = math.max(var_654_7, arg_651_1.talkMaxDuration)

			if var_654_6 <= arg_651_1.time_ and arg_651_1.time_ < var_654_6 + var_654_14 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_6) / var_654_14

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_6 + var_654_14 and arg_651_1.time_ < var_654_6 + var_654_14 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305166 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1109305166
		arg_655_1.duration_ = 6.93

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1109305167(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1093ui_story"].transform
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 then
				arg_655_1.var_.moveOldPos1093ui_story = var_658_0.localPosition
			end

			local var_658_2 = 0.001

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2
				local var_658_4 = Vector3.New(0, -1.11, -5.88)

				var_658_0.localPosition = Vector3.Lerp(arg_655_1.var_.moveOldPos1093ui_story, var_658_4, var_658_3)

				local var_658_5 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_5.x, var_658_5.y, var_658_5.z)

				local var_658_6 = var_658_0.localEulerAngles

				var_658_6.z = 0
				var_658_6.x = 0
				var_658_0.localEulerAngles = var_658_6
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 then
				var_658_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_658_7 = manager.ui.mainCamera.transform.position - var_658_0.position

				var_658_0.forward = Vector3.New(var_658_7.x, var_658_7.y, var_658_7.z)

				local var_658_8 = var_658_0.localEulerAngles

				var_658_8.z = 0
				var_658_8.x = 0
				var_658_0.localEulerAngles = var_658_8
			end

			local var_658_9 = arg_655_1.actors_["1093ui_story"]
			local var_658_10 = 0

			if var_658_10 < arg_655_1.time_ and arg_655_1.time_ <= var_658_10 + arg_658_0 and not isNil(var_658_9) and arg_655_1.var_.characterEffect1093ui_story == nil then
				arg_655_1.var_.characterEffect1093ui_story = var_658_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_11 = 0.200000002980232

			if var_658_10 <= arg_655_1.time_ and arg_655_1.time_ < var_658_10 + var_658_11 and not isNil(var_658_9) then
				local var_658_12 = (arg_655_1.time_ - var_658_10) / var_658_11

				if arg_655_1.var_.characterEffect1093ui_story and not isNil(var_658_9) then
					arg_655_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_655_1.time_ >= var_658_10 + var_658_11 and arg_655_1.time_ < var_658_10 + var_658_11 + arg_658_0 and not isNil(var_658_9) and arg_655_1.var_.characterEffect1093ui_story then
				arg_655_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_658_13 = 0

			if var_658_13 < arg_655_1.time_ and arg_655_1.time_ <= var_658_13 + arg_658_0 then
				arg_655_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_2")
			end

			local var_658_14 = 0

			if var_658_14 < arg_655_1.time_ and arg_655_1.time_ <= var_658_14 + arg_658_0 then
				arg_655_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_658_15 = 0
			local var_658_16 = 0.75

			if var_658_15 < arg_655_1.time_ and arg_655_1.time_ <= var_658_15 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_17 = arg_655_1:FormatText(StoryNameCfg[73].name)

				arg_655_1.leftNameTxt_.text = var_658_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_18 = arg_655_1:GetWordFromCfg(1109305166)
				local var_658_19 = arg_655_1:FormatText(var_658_18.content)

				arg_655_1.text_.text = var_658_19

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_20 = 30
				local var_658_21 = utf8.len(var_658_19)
				local var_658_22 = var_658_20 <= 0 and var_658_16 or var_658_16 * (var_658_21 / var_658_20)

				if var_658_22 > 0 and var_658_16 < var_658_22 then
					arg_655_1.talkMaxDuration = var_658_22

					if var_658_22 + var_658_15 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_22 + var_658_15
					end
				end

				arg_655_1.text_.text = var_658_19
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305166", "story_v_side_new_1109305.awb") ~= 0 then
					local var_658_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305166", "story_v_side_new_1109305.awb") / 1000

					if var_658_23 + var_658_15 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_23 + var_658_15
					end

					if var_658_18.prefab_name ~= "" and arg_655_1.actors_[var_658_18.prefab_name] ~= nil then
						local var_658_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_18.prefab_name].transform, "story_v_side_new_1109305", "1109305166", "story_v_side_new_1109305.awb")

						arg_655_1:RecordAudio("1109305166", var_658_24)
						arg_655_1:RecordAudio("1109305166", var_658_24)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305166", "story_v_side_new_1109305.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305166", "story_v_side_new_1109305.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_25 = math.max(var_658_16, arg_655_1.talkMaxDuration)

			if var_658_15 <= arg_655_1.time_ and arg_655_1.time_ < var_658_15 + var_658_25 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_15) / var_658_25

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_15 + var_658_25 and arg_655_1.time_ < var_658_15 + var_658_25 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305167 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1109305167
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1109305168(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1093ui_story"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and not isNil(var_662_0) and arg_659_1.var_.characterEffect1093ui_story == nil then
				arg_659_1.var_.characterEffect1093ui_story = var_662_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_2 = 0.200000002980232

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 and not isNil(var_662_0) then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.characterEffect1093ui_story and not isNil(var_662_0) then
					local var_662_4 = Mathf.Lerp(0, 0.5, var_662_3)

					arg_659_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_659_1.var_.characterEffect1093ui_story.fillRatio = var_662_4
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and not isNil(var_662_0) and arg_659_1.var_.characterEffect1093ui_story then
				local var_662_5 = 0.5

				arg_659_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_659_1.var_.characterEffect1093ui_story.fillRatio = var_662_5
			end

			local var_662_6 = 0
			local var_662_7 = 0.7

			if var_662_6 < arg_659_1.time_ and arg_659_1.time_ <= var_662_6 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_8 = arg_659_1:FormatText(StoryNameCfg[7].name)

				arg_659_1.leftNameTxt_.text = var_662_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_9 = arg_659_1:GetWordFromCfg(1109305167)
				local var_662_10 = arg_659_1:FormatText(var_662_9.content)

				arg_659_1.text_.text = var_662_10

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_11 = 28
				local var_662_12 = utf8.len(var_662_10)
				local var_662_13 = var_662_11 <= 0 and var_662_7 or var_662_7 * (var_662_12 / var_662_11)

				if var_662_13 > 0 and var_662_7 < var_662_13 then
					arg_659_1.talkMaxDuration = var_662_13

					if var_662_13 + var_662_6 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_13 + var_662_6
					end
				end

				arg_659_1.text_.text = var_662_10
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_14 = math.max(var_662_7, arg_659_1.talkMaxDuration)

			if var_662_6 <= arg_659_1.time_ and arg_659_1.time_ < var_662_6 + var_662_14 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_6) / var_662_14

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_6 + var_662_14 and arg_659_1.time_ < var_662_6 + var_662_14 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305168 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1109305168
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1109305169(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.8

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, false)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_2 = arg_663_1:GetWordFromCfg(1109305168)
				local var_666_3 = arg_663_1:FormatText(var_666_2.content)

				arg_663_1.text_.text = var_666_3

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_4 = 32
				local var_666_5 = utf8.len(var_666_3)
				local var_666_6 = var_666_4 <= 0 and var_666_1 or var_666_1 * (var_666_5 / var_666_4)

				if var_666_6 > 0 and var_666_1 < var_666_6 then
					arg_663_1.talkMaxDuration = var_666_6

					if var_666_6 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_6 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_3
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_7 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_7 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_7

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_7 and arg_663_1.time_ < var_666_0 + var_666_7 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305169 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1109305169
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1109305170(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.775

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_2 = arg_667_1:FormatText(StoryNameCfg[7].name)

				arg_667_1.leftNameTxt_.text = var_670_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_3 = arg_667_1:GetWordFromCfg(1109305169)
				local var_670_4 = arg_667_1:FormatText(var_670_3.content)

				arg_667_1.text_.text = var_670_4

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_5 = 31
				local var_670_6 = utf8.len(var_670_4)
				local var_670_7 = var_670_5 <= 0 and var_670_1 or var_670_1 * (var_670_6 / var_670_5)

				if var_670_7 > 0 and var_670_1 < var_670_7 then
					arg_667_1.talkMaxDuration = var_670_7

					if var_670_7 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_7 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_4
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_8 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_8 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_8

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_8 and arg_667_1.time_ < var_670_0 + var_670_8 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305170 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 1109305170
		arg_671_1.duration_ = 5

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play1109305171(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0
			local var_674_1 = 0.55

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_2 = arg_671_1:FormatText(StoryNameCfg[7].name)

				arg_671_1.leftNameTxt_.text = var_674_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_3 = arg_671_1:GetWordFromCfg(1109305170)
				local var_674_4 = arg_671_1:FormatText(var_674_3.content)

				arg_671_1.text_.text = var_674_4

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_5 = 22
				local var_674_6 = utf8.len(var_674_4)
				local var_674_7 = var_674_5 <= 0 and var_674_1 or var_674_1 * (var_674_6 / var_674_5)

				if var_674_7 > 0 and var_674_1 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end

				arg_671_1.text_.text = var_674_4
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_8 = math.max(var_674_1, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_8 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_0) / var_674_8

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_8 and arg_671_1.time_ < var_674_0 + var_674_8 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305171 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 1109305171
		arg_675_1.duration_ = 6.87

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play1109305172(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["1093ui_story"].transform
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 then
				arg_675_1.var_.moveOldPos1093ui_story = var_678_0.localPosition
			end

			local var_678_2 = 0.001

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_2 then
				local var_678_3 = (arg_675_1.time_ - var_678_1) / var_678_2
				local var_678_4 = Vector3.New(0, -1.11, -5.88)

				var_678_0.localPosition = Vector3.Lerp(arg_675_1.var_.moveOldPos1093ui_story, var_678_4, var_678_3)

				local var_678_5 = manager.ui.mainCamera.transform.position - var_678_0.position

				var_678_0.forward = Vector3.New(var_678_5.x, var_678_5.y, var_678_5.z)

				local var_678_6 = var_678_0.localEulerAngles

				var_678_6.z = 0
				var_678_6.x = 0
				var_678_0.localEulerAngles = var_678_6
			end

			if arg_675_1.time_ >= var_678_1 + var_678_2 and arg_675_1.time_ < var_678_1 + var_678_2 + arg_678_0 then
				var_678_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_678_7 = manager.ui.mainCamera.transform.position - var_678_0.position

				var_678_0.forward = Vector3.New(var_678_7.x, var_678_7.y, var_678_7.z)

				local var_678_8 = var_678_0.localEulerAngles

				var_678_8.z = 0
				var_678_8.x = 0
				var_678_0.localEulerAngles = var_678_8
			end

			local var_678_9 = arg_675_1.actors_["1093ui_story"]
			local var_678_10 = 0

			if var_678_10 < arg_675_1.time_ and arg_675_1.time_ <= var_678_10 + arg_678_0 and not isNil(var_678_9) and arg_675_1.var_.characterEffect1093ui_story == nil then
				arg_675_1.var_.characterEffect1093ui_story = var_678_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_11 = 0.200000002980232

			if var_678_10 <= arg_675_1.time_ and arg_675_1.time_ < var_678_10 + var_678_11 and not isNil(var_678_9) then
				local var_678_12 = (arg_675_1.time_ - var_678_10) / var_678_11

				if arg_675_1.var_.characterEffect1093ui_story and not isNil(var_678_9) then
					arg_675_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_10 + var_678_11 and arg_675_1.time_ < var_678_10 + var_678_11 + arg_678_0 and not isNil(var_678_9) and arg_675_1.var_.characterEffect1093ui_story then
				arg_675_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_678_13 = 0

			if var_678_13 < arg_675_1.time_ and arg_675_1.time_ <= var_678_13 + arg_678_0 then
				arg_675_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_678_14 = 0

			if var_678_14 < arg_675_1.time_ and arg_675_1.time_ <= var_678_14 + arg_678_0 then
				arg_675_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_678_15 = 0
			local var_678_16 = 0.925

			if var_678_15 < arg_675_1.time_ and arg_675_1.time_ <= var_678_15 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_17 = arg_675_1:FormatText(StoryNameCfg[73].name)

				arg_675_1.leftNameTxt_.text = var_678_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_18 = arg_675_1:GetWordFromCfg(1109305171)
				local var_678_19 = arg_675_1:FormatText(var_678_18.content)

				arg_675_1.text_.text = var_678_19

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_20 = 37
				local var_678_21 = utf8.len(var_678_19)
				local var_678_22 = var_678_20 <= 0 and var_678_16 or var_678_16 * (var_678_21 / var_678_20)

				if var_678_22 > 0 and var_678_16 < var_678_22 then
					arg_675_1.talkMaxDuration = var_678_22

					if var_678_22 + var_678_15 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_22 + var_678_15
					end
				end

				arg_675_1.text_.text = var_678_19
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305171", "story_v_side_new_1109305.awb") ~= 0 then
					local var_678_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305171", "story_v_side_new_1109305.awb") / 1000

					if var_678_23 + var_678_15 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_23 + var_678_15
					end

					if var_678_18.prefab_name ~= "" and arg_675_1.actors_[var_678_18.prefab_name] ~= nil then
						local var_678_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_18.prefab_name].transform, "story_v_side_new_1109305", "1109305171", "story_v_side_new_1109305.awb")

						arg_675_1:RecordAudio("1109305171", var_678_24)
						arg_675_1:RecordAudio("1109305171", var_678_24)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305171", "story_v_side_new_1109305.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305171", "story_v_side_new_1109305.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_25 = math.max(var_678_16, arg_675_1.talkMaxDuration)

			if var_678_15 <= arg_675_1.time_ and arg_675_1.time_ < var_678_15 + var_678_25 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_15) / var_678_25

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_15 + var_678_25 and arg_675_1.time_ < var_678_15 + var_678_25 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305172 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 1109305172
		arg_679_1.duration_ = 5

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play1109305173(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = arg_679_1.actors_["1093ui_story"]
			local var_682_1 = 0

			if var_682_1 < arg_679_1.time_ and arg_679_1.time_ <= var_682_1 + arg_682_0 and not isNil(var_682_0) and arg_679_1.var_.characterEffect1093ui_story == nil then
				arg_679_1.var_.characterEffect1093ui_story = var_682_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_682_2 = 0.200000002980232

			if var_682_1 <= arg_679_1.time_ and arg_679_1.time_ < var_682_1 + var_682_2 and not isNil(var_682_0) then
				local var_682_3 = (arg_679_1.time_ - var_682_1) / var_682_2

				if arg_679_1.var_.characterEffect1093ui_story and not isNil(var_682_0) then
					local var_682_4 = Mathf.Lerp(0, 0.5, var_682_3)

					arg_679_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_679_1.var_.characterEffect1093ui_story.fillRatio = var_682_4
				end
			end

			if arg_679_1.time_ >= var_682_1 + var_682_2 and arg_679_1.time_ < var_682_1 + var_682_2 + arg_682_0 and not isNil(var_682_0) and arg_679_1.var_.characterEffect1093ui_story then
				local var_682_5 = 0.5

				arg_679_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_679_1.var_.characterEffect1093ui_story.fillRatio = var_682_5
			end

			local var_682_6 = arg_679_1.actors_["1093ui_story"].transform
			local var_682_7 = 0

			if var_682_7 < arg_679_1.time_ and arg_679_1.time_ <= var_682_7 + arg_682_0 then
				arg_679_1.var_.moveOldPos1093ui_story = var_682_6.localPosition
			end

			local var_682_8 = 0.001

			if var_682_7 <= arg_679_1.time_ and arg_679_1.time_ < var_682_7 + var_682_8 then
				local var_682_9 = (arg_679_1.time_ - var_682_7) / var_682_8
				local var_682_10 = Vector3.New(0, 100, 0)

				var_682_6.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1093ui_story, var_682_10, var_682_9)

				local var_682_11 = manager.ui.mainCamera.transform.position - var_682_6.position

				var_682_6.forward = Vector3.New(var_682_11.x, var_682_11.y, var_682_11.z)

				local var_682_12 = var_682_6.localEulerAngles

				var_682_12.z = 0
				var_682_12.x = 0
				var_682_6.localEulerAngles = var_682_12
			end

			if arg_679_1.time_ >= var_682_7 + var_682_8 and arg_679_1.time_ < var_682_7 + var_682_8 + arg_682_0 then
				var_682_6.localPosition = Vector3.New(0, 100, 0)

				local var_682_13 = manager.ui.mainCamera.transform.position - var_682_6.position

				var_682_6.forward = Vector3.New(var_682_13.x, var_682_13.y, var_682_13.z)

				local var_682_14 = var_682_6.localEulerAngles

				var_682_14.z = 0
				var_682_14.x = 0
				var_682_6.localEulerAngles = var_682_14
			end

			local var_682_15 = 0
			local var_682_16 = 0.6

			if var_682_15 < arg_679_1.time_ and arg_679_1.time_ <= var_682_15 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_17 = arg_679_1:FormatText(StoryNameCfg[7].name)

				arg_679_1.leftNameTxt_.text = var_682_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_18 = arg_679_1:GetWordFromCfg(1109305172)
				local var_682_19 = arg_679_1:FormatText(var_682_18.content)

				arg_679_1.text_.text = var_682_19

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_20 = 24
				local var_682_21 = utf8.len(var_682_19)
				local var_682_22 = var_682_20 <= 0 and var_682_16 or var_682_16 * (var_682_21 / var_682_20)

				if var_682_22 > 0 and var_682_16 < var_682_22 then
					arg_679_1.talkMaxDuration = var_682_22

					if var_682_22 + var_682_15 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_22 + var_682_15
					end
				end

				arg_679_1.text_.text = var_682_19
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)
				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_23 = math.max(var_682_16, arg_679_1.talkMaxDuration)

			if var_682_15 <= arg_679_1.time_ and arg_679_1.time_ < var_682_15 + var_682_23 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_15) / var_682_23

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_15 + var_682_23 and arg_679_1.time_ < var_682_15 + var_682_23 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305173 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 1109305173
		arg_683_1.duration_ = 4.93

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play1109305174(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0
			local var_686_1 = 0.575

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_2 = arg_683_1:FormatText(StoryNameCfg[73].name)

				arg_683_1.leftNameTxt_.text = var_686_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, true)
				arg_683_1.iconController_:SetSelectedState("hero")

				arg_683_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_683_1.callingController_:SetSelectedState("normal")

				arg_683_1.keyicon_.color = Color.New(1, 1, 1)
				arg_683_1.icon_.color = Color.New(1, 1, 1)

				local var_686_3 = arg_683_1:GetWordFromCfg(1109305173)
				local var_686_4 = arg_683_1:FormatText(var_686_3.content)

				arg_683_1.text_.text = var_686_4

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_5 = 23
				local var_686_6 = utf8.len(var_686_4)
				local var_686_7 = var_686_5 <= 0 and var_686_1 or var_686_1 * (var_686_6 / var_686_5)

				if var_686_7 > 0 and var_686_1 < var_686_7 then
					arg_683_1.talkMaxDuration = var_686_7

					if var_686_7 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_7 + var_686_0
					end
				end

				arg_683_1.text_.text = var_686_4
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305173", "story_v_side_new_1109305.awb") ~= 0 then
					local var_686_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305173", "story_v_side_new_1109305.awb") / 1000

					if var_686_8 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_8 + var_686_0
					end

					if var_686_3.prefab_name ~= "" and arg_683_1.actors_[var_686_3.prefab_name] ~= nil then
						local var_686_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_3.prefab_name].transform, "story_v_side_new_1109305", "1109305173", "story_v_side_new_1109305.awb")

						arg_683_1:RecordAudio("1109305173", var_686_9)
						arg_683_1:RecordAudio("1109305173", var_686_9)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305173", "story_v_side_new_1109305.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305173", "story_v_side_new_1109305.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_10 = math.max(var_686_1, arg_683_1.talkMaxDuration)

			if var_686_0 <= arg_683_1.time_ and arg_683_1.time_ < var_686_0 + var_686_10 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_0) / var_686_10

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_0 + var_686_10 and arg_683_1.time_ < var_686_0 + var_686_10 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305174 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 1109305174
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play1109305175(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["1093ui_story"]
			local var_690_1 = 0

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 and not isNil(var_690_0) and arg_687_1.var_.characterEffect1093ui_story == nil then
				arg_687_1.var_.characterEffect1093ui_story = var_690_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_690_2 = 0.200000002980232

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_2 and not isNil(var_690_0) then
				local var_690_3 = (arg_687_1.time_ - var_690_1) / var_690_2

				if arg_687_1.var_.characterEffect1093ui_story and not isNil(var_690_0) then
					local var_690_4 = Mathf.Lerp(0, 0.5, var_690_3)

					arg_687_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_687_1.var_.characterEffect1093ui_story.fillRatio = var_690_4
				end
			end

			if arg_687_1.time_ >= var_690_1 + var_690_2 and arg_687_1.time_ < var_690_1 + var_690_2 + arg_690_0 and not isNil(var_690_0) and arg_687_1.var_.characterEffect1093ui_story then
				local var_690_5 = 0.5

				arg_687_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_687_1.var_.characterEffect1093ui_story.fillRatio = var_690_5
			end

			local var_690_6 = 0
			local var_690_7 = 0.05

			if var_690_6 < arg_687_1.time_ and arg_687_1.time_ <= var_690_6 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, false)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_8 = arg_687_1:GetWordFromCfg(1109305174)
				local var_690_9 = arg_687_1:FormatText(var_690_8.content)

				arg_687_1.text_.text = var_690_9

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_10 = 2
				local var_690_11 = utf8.len(var_690_9)
				local var_690_12 = var_690_10 <= 0 and var_690_7 or var_690_7 * (var_690_11 / var_690_10)

				if var_690_12 > 0 and var_690_7 < var_690_12 then
					arg_687_1.talkMaxDuration = var_690_12

					if var_690_12 + var_690_6 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_12 + var_690_6
					end
				end

				arg_687_1.text_.text = var_690_9
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_13 = math.max(var_690_7, arg_687_1.talkMaxDuration)

			if var_690_6 <= arg_687_1.time_ and arg_687_1.time_ < var_690_6 + var_690_13 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_6) / var_690_13

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_6 + var_690_13 and arg_687_1.time_ < var_690_6 + var_690_13 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305175 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 1109305175
		arg_691_1.duration_ = 8.27

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play1109305176(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = "ST06"

			if arg_691_1.bgs_[var_694_0] == nil then
				local var_694_1 = Object.Instantiate(arg_691_1.paintGo_)

				var_694_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_694_0)
				var_694_1.name = var_694_0
				var_694_1.transform.parent = arg_691_1.stage_.transform
				var_694_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_691_1.bgs_[var_694_0] = var_694_1
			end

			local var_694_2 = 1.66666666666667

			if var_694_2 < arg_691_1.time_ and arg_691_1.time_ <= var_694_2 + arg_694_0 then
				local var_694_3 = manager.ui.mainCamera.transform.localPosition
				local var_694_4 = Vector3.New(0, 0, 10) + Vector3.New(var_694_3.x, var_694_3.y, 0)
				local var_694_5 = arg_691_1.bgs_.ST06

				var_694_5.transform.localPosition = var_694_4
				var_694_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_694_6 = var_694_5:GetComponent("SpriteRenderer")

				if var_694_6 and var_694_6.sprite then
					local var_694_7 = (var_694_5.transform.localPosition - var_694_3).z
					local var_694_8 = manager.ui.mainCameraCom_
					local var_694_9 = 2 * var_694_7 * Mathf.Tan(var_694_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_694_10 = var_694_9 * var_694_8.aspect
					local var_694_11 = var_694_6.sprite.bounds.size.x
					local var_694_12 = var_694_6.sprite.bounds.size.y
					local var_694_13 = var_694_10 / var_694_11
					local var_694_14 = var_694_9 / var_694_12
					local var_694_15 = var_694_14 < var_694_13 and var_694_13 or var_694_14

					var_694_5.transform.localScale = Vector3.New(var_694_15, var_694_15, 0)
				end

				for iter_694_0, iter_694_1 in pairs(arg_691_1.bgs_) do
					if iter_694_0 ~= "ST06" then
						iter_694_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_694_16 = 0

			if var_694_16 < arg_691_1.time_ and arg_691_1.time_ <= var_694_16 + arg_694_0 then
				arg_691_1.mask_.enabled = true
				arg_691_1.mask_.raycastTarget = true

				arg_691_1:SetGaussion(false)
			end

			local var_694_17 = 1.66666666666667

			if var_694_16 <= arg_691_1.time_ and arg_691_1.time_ < var_694_16 + var_694_17 then
				local var_694_18 = (arg_691_1.time_ - var_694_16) / var_694_17
				local var_694_19 = Color.New(0.990566, 0.990566, 0.990566)

				var_694_19.a = Mathf.Lerp(0, 1, var_694_18)
				arg_691_1.mask_.color = var_694_19
			end

			if arg_691_1.time_ >= var_694_16 + var_694_17 and arg_691_1.time_ < var_694_16 + var_694_17 + arg_694_0 then
				local var_694_20 = Color.New(0.990566, 0.990566, 0.990566)

				var_694_20.a = 1
				arg_691_1.mask_.color = var_694_20
			end

			local var_694_21 = 1.66666666666667

			if var_694_21 < arg_691_1.time_ and arg_691_1.time_ <= var_694_21 + arg_694_0 then
				arg_691_1.mask_.enabled = true
				arg_691_1.mask_.raycastTarget = true

				arg_691_1:SetGaussion(false)
			end

			local var_694_22 = 1.23333333333333

			if var_694_21 <= arg_691_1.time_ and arg_691_1.time_ < var_694_21 + var_694_22 then
				local var_694_23 = (arg_691_1.time_ - var_694_21) / var_694_22
				local var_694_24 = Color.New(0.990566, 0.990566, 0.990566)

				var_694_24.a = Mathf.Lerp(1, 0, var_694_23)
				arg_691_1.mask_.color = var_694_24
			end

			if arg_691_1.time_ >= var_694_21 + var_694_22 and arg_691_1.time_ < var_694_21 + var_694_22 + arg_694_0 then
				local var_694_25 = Color.New(0.990566, 0.990566, 0.990566)
				local var_694_26 = 0

				arg_691_1.mask_.enabled = false
				var_694_25.a = var_694_26
				arg_691_1.mask_.color = var_694_25
			end

			if arg_691_1.frameCnt_ <= 1 then
				arg_691_1.dialog_:SetActive(false)
			end

			local var_694_27 = 3.26559620979242
			local var_694_28 = 0.825

			if var_694_27 < arg_691_1.time_ and arg_691_1.time_ <= var_694_27 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0

				arg_691_1.dialog_:SetActive(true)

				local var_694_29 = LeanTween.value(arg_691_1.dialog_, 0, 1, 0.3)

				var_694_29:setOnUpdate(LuaHelper.FloatAction(function(arg_695_0)
					arg_691_1.dialogCg_.alpha = arg_695_0
				end))
				var_694_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_691_1.dialog_)
					var_694_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_691_1.duration_ = arg_691_1.duration_ + 0.3

				SetActive(arg_691_1.leftNameGo_, false)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_30 = arg_691_1:GetWordFromCfg(1109305175)
				local var_694_31 = arg_691_1:FormatText(var_694_30.content)

				arg_691_1.text_.text = var_694_31

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_32 = 33
				local var_694_33 = utf8.len(var_694_31)
				local var_694_34 = var_694_32 <= 0 and var_694_28 or var_694_28 * (var_694_33 / var_694_32)

				if var_694_34 > 0 and var_694_28 < var_694_34 then
					arg_691_1.talkMaxDuration = var_694_34
					var_694_27 = var_694_27 + 0.3

					if var_694_34 + var_694_27 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_34 + var_694_27
					end
				end

				arg_691_1.text_.text = var_694_31
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_35 = var_694_27 + 0.3
			local var_694_36 = math.max(var_694_28, arg_691_1.talkMaxDuration)

			if var_694_35 <= arg_691_1.time_ and arg_691_1.time_ < var_694_35 + var_694_36 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_35) / var_694_36

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_35 + var_694_36 and arg_691_1.time_ < var_694_35 + var_694_36 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305176 = function(arg_697_0, arg_697_1)
		arg_697_1.time_ = 0
		arg_697_1.frameCnt_ = 0
		arg_697_1.state_ = "playing"
		arg_697_1.curTalkId_ = 1109305176
		arg_697_1.duration_ = 5

		SetActive(arg_697_1.tipsGo_, false)

		function arg_697_1.onSingleLineFinish_()
			arg_697_1.onSingleLineUpdate_ = nil
			arg_697_1.onSingleLineFinish_ = nil
			arg_697_1.state_ = "waiting"
		end

		function arg_697_1.playNext_(arg_699_0)
			if arg_699_0 == 1 then
				arg_697_0:Play1109305177(arg_697_1)
			end
		end

		function arg_697_1.onSingleLineUpdate_(arg_700_0)
			local var_700_0 = 0
			local var_700_1 = 0.725

			if var_700_0 < arg_697_1.time_ and arg_697_1.time_ <= var_700_0 + arg_700_0 then
				arg_697_1.talkMaxDuration = 0
				arg_697_1.dialogCg_.alpha = 1

				arg_697_1.dialog_:SetActive(true)
				SetActive(arg_697_1.leftNameGo_, false)

				arg_697_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_697_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_697_1:RecordName(arg_697_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_697_1.iconTrs_.gameObject, false)
				arg_697_1.callingController_:SetSelectedState("normal")

				local var_700_2 = arg_697_1:GetWordFromCfg(1109305176)
				local var_700_3 = arg_697_1:FormatText(var_700_2.content)

				arg_697_1.text_.text = var_700_3

				LuaForUtil.ClearLinePrefixSymbol(arg_697_1.text_)

				local var_700_4 = 29
				local var_700_5 = utf8.len(var_700_3)
				local var_700_6 = var_700_4 <= 0 and var_700_1 or var_700_1 * (var_700_5 / var_700_4)

				if var_700_6 > 0 and var_700_1 < var_700_6 then
					arg_697_1.talkMaxDuration = var_700_6

					if var_700_6 + var_700_0 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_6 + var_700_0
					end
				end

				arg_697_1.text_.text = var_700_3
				arg_697_1.typewritter.percent = 0

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(false)
				arg_697_1:RecordContent(arg_697_1.text_.text)
			end

			local var_700_7 = math.max(var_700_1, arg_697_1.talkMaxDuration)

			if var_700_0 <= arg_697_1.time_ and arg_697_1.time_ < var_700_0 + var_700_7 then
				arg_697_1.typewritter.percent = (arg_697_1.time_ - var_700_0) / var_700_7

				arg_697_1.typewritter:SetDirty()
			end

			if arg_697_1.time_ >= var_700_0 + var_700_7 and arg_697_1.time_ < var_700_0 + var_700_7 + arg_700_0 then
				arg_697_1.typewritter.percent = 1

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305177 = function(arg_701_0, arg_701_1)
		arg_701_1.time_ = 0
		arg_701_1.frameCnt_ = 0
		arg_701_1.state_ = "playing"
		arg_701_1.curTalkId_ = 1109305177
		arg_701_1.duration_ = 5

		SetActive(arg_701_1.tipsGo_, false)

		function arg_701_1.onSingleLineFinish_()
			arg_701_1.onSingleLineUpdate_ = nil
			arg_701_1.onSingleLineFinish_ = nil
			arg_701_1.state_ = "waiting"
		end

		function arg_701_1.playNext_(arg_703_0)
			if arg_703_0 == 1 then
				arg_701_0:Play1109305178(arg_701_1)
			end
		end

		function arg_701_1.onSingleLineUpdate_(arg_704_0)
			local var_704_0 = 0
			local var_704_1 = 0.7

			if var_704_0 < arg_701_1.time_ and arg_701_1.time_ <= var_704_0 + arg_704_0 then
				arg_701_1.talkMaxDuration = 0
				arg_701_1.dialogCg_.alpha = 1

				arg_701_1.dialog_:SetActive(true)
				SetActive(arg_701_1.leftNameGo_, false)

				arg_701_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_701_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_701_1:RecordName(arg_701_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_701_1.iconTrs_.gameObject, false)
				arg_701_1.callingController_:SetSelectedState("normal")

				local var_704_2 = arg_701_1:GetWordFromCfg(1109305177)
				local var_704_3 = arg_701_1:FormatText(var_704_2.content)

				arg_701_1.text_.text = var_704_3

				LuaForUtil.ClearLinePrefixSymbol(arg_701_1.text_)

				local var_704_4 = 28
				local var_704_5 = utf8.len(var_704_3)
				local var_704_6 = var_704_4 <= 0 and var_704_1 or var_704_1 * (var_704_5 / var_704_4)

				if var_704_6 > 0 and var_704_1 < var_704_6 then
					arg_701_1.talkMaxDuration = var_704_6

					if var_704_6 + var_704_0 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_6 + var_704_0
					end
				end

				arg_701_1.text_.text = var_704_3
				arg_701_1.typewritter.percent = 0

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(false)
				arg_701_1:RecordContent(arg_701_1.text_.text)
			end

			local var_704_7 = math.max(var_704_1, arg_701_1.talkMaxDuration)

			if var_704_0 <= arg_701_1.time_ and arg_701_1.time_ < var_704_0 + var_704_7 then
				arg_701_1.typewritter.percent = (arg_701_1.time_ - var_704_0) / var_704_7

				arg_701_1.typewritter:SetDirty()
			end

			if arg_701_1.time_ >= var_704_0 + var_704_7 and arg_701_1.time_ < var_704_0 + var_704_7 + arg_704_0 then
				arg_701_1.typewritter.percent = 1

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305178 = function(arg_705_0, arg_705_1)
		arg_705_1.time_ = 0
		arg_705_1.frameCnt_ = 0
		arg_705_1.state_ = "playing"
		arg_705_1.curTalkId_ = 1109305178
		arg_705_1.duration_ = 3.63

		SetActive(arg_705_1.tipsGo_, false)

		function arg_705_1.onSingleLineFinish_()
			arg_705_1.onSingleLineUpdate_ = nil
			arg_705_1.onSingleLineFinish_ = nil
			arg_705_1.state_ = "waiting"
		end

		function arg_705_1.playNext_(arg_707_0)
			if arg_707_0 == 1 then
				arg_705_0:Play1109305179(arg_705_1)
			end
		end

		function arg_705_1.onSingleLineUpdate_(arg_708_0)
			local var_708_0 = arg_705_1.actors_["1093ui_story"].transform
			local var_708_1 = 0

			if var_708_1 < arg_705_1.time_ and arg_705_1.time_ <= var_708_1 + arg_708_0 then
				arg_705_1.var_.moveOldPos1093ui_story = var_708_0.localPosition
			end

			local var_708_2 = 0.001

			if var_708_1 <= arg_705_1.time_ and arg_705_1.time_ < var_708_1 + var_708_2 then
				local var_708_3 = (arg_705_1.time_ - var_708_1) / var_708_2
				local var_708_4 = Vector3.New(0, -1.11, -5.88)

				var_708_0.localPosition = Vector3.Lerp(arg_705_1.var_.moveOldPos1093ui_story, var_708_4, var_708_3)

				local var_708_5 = manager.ui.mainCamera.transform.position - var_708_0.position

				var_708_0.forward = Vector3.New(var_708_5.x, var_708_5.y, var_708_5.z)

				local var_708_6 = var_708_0.localEulerAngles

				var_708_6.z = 0
				var_708_6.x = 0
				var_708_0.localEulerAngles = var_708_6
			end

			if arg_705_1.time_ >= var_708_1 + var_708_2 and arg_705_1.time_ < var_708_1 + var_708_2 + arg_708_0 then
				var_708_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_708_7 = manager.ui.mainCamera.transform.position - var_708_0.position

				var_708_0.forward = Vector3.New(var_708_7.x, var_708_7.y, var_708_7.z)

				local var_708_8 = var_708_0.localEulerAngles

				var_708_8.z = 0
				var_708_8.x = 0
				var_708_0.localEulerAngles = var_708_8
			end

			local var_708_9 = arg_705_1.actors_["1093ui_story"]
			local var_708_10 = 0

			if var_708_10 < arg_705_1.time_ and arg_705_1.time_ <= var_708_10 + arg_708_0 and not isNil(var_708_9) and arg_705_1.var_.characterEffect1093ui_story == nil then
				arg_705_1.var_.characterEffect1093ui_story = var_708_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_708_11 = 0.200000002980232

			if var_708_10 <= arg_705_1.time_ and arg_705_1.time_ < var_708_10 + var_708_11 and not isNil(var_708_9) then
				local var_708_12 = (arg_705_1.time_ - var_708_10) / var_708_11

				if arg_705_1.var_.characterEffect1093ui_story and not isNil(var_708_9) then
					arg_705_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_705_1.time_ >= var_708_10 + var_708_11 and arg_705_1.time_ < var_708_10 + var_708_11 + arg_708_0 and not isNil(var_708_9) and arg_705_1.var_.characterEffect1093ui_story then
				arg_705_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_708_13 = 0

			if var_708_13 < arg_705_1.time_ and arg_705_1.time_ <= var_708_13 + arg_708_0 then
				arg_705_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action476")
			end

			local var_708_14 = 0

			if var_708_14 < arg_705_1.time_ and arg_705_1.time_ <= var_708_14 + arg_708_0 then
				arg_705_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_708_15 = 0
			local var_708_16 = 0.325

			if var_708_15 < arg_705_1.time_ and arg_705_1.time_ <= var_708_15 + arg_708_0 then
				arg_705_1.talkMaxDuration = 0
				arg_705_1.dialogCg_.alpha = 1

				arg_705_1.dialog_:SetActive(true)
				SetActive(arg_705_1.leftNameGo_, true)

				local var_708_17 = arg_705_1:FormatText(StoryNameCfg[73].name)

				arg_705_1.leftNameTxt_.text = var_708_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_705_1.leftNameTxt_.transform)

				arg_705_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_705_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_705_1:RecordName(arg_705_1.leftNameTxt_.text)
				SetActive(arg_705_1.iconTrs_.gameObject, false)
				arg_705_1.callingController_:SetSelectedState("normal")

				local var_708_18 = arg_705_1:GetWordFromCfg(1109305178)
				local var_708_19 = arg_705_1:FormatText(var_708_18.content)

				arg_705_1.text_.text = var_708_19

				LuaForUtil.ClearLinePrefixSymbol(arg_705_1.text_)

				local var_708_20 = 13
				local var_708_21 = utf8.len(var_708_19)
				local var_708_22 = var_708_20 <= 0 and var_708_16 or var_708_16 * (var_708_21 / var_708_20)

				if var_708_22 > 0 and var_708_16 < var_708_22 then
					arg_705_1.talkMaxDuration = var_708_22

					if var_708_22 + var_708_15 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_22 + var_708_15
					end
				end

				arg_705_1.text_.text = var_708_19
				arg_705_1.typewritter.percent = 0

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305178", "story_v_side_new_1109305.awb") ~= 0 then
					local var_708_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305178", "story_v_side_new_1109305.awb") / 1000

					if var_708_23 + var_708_15 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_23 + var_708_15
					end

					if var_708_18.prefab_name ~= "" and arg_705_1.actors_[var_708_18.prefab_name] ~= nil then
						local var_708_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_705_1.actors_[var_708_18.prefab_name].transform, "story_v_side_new_1109305", "1109305178", "story_v_side_new_1109305.awb")

						arg_705_1:RecordAudio("1109305178", var_708_24)
						arg_705_1:RecordAudio("1109305178", var_708_24)
					else
						arg_705_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305178", "story_v_side_new_1109305.awb")
					end

					arg_705_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305178", "story_v_side_new_1109305.awb")
				end

				arg_705_1:RecordContent(arg_705_1.text_.text)
			end

			local var_708_25 = math.max(var_708_16, arg_705_1.talkMaxDuration)

			if var_708_15 <= arg_705_1.time_ and arg_705_1.time_ < var_708_15 + var_708_25 then
				arg_705_1.typewritter.percent = (arg_705_1.time_ - var_708_15) / var_708_25

				arg_705_1.typewritter:SetDirty()
			end

			if arg_705_1.time_ >= var_708_15 + var_708_25 and arg_705_1.time_ < var_708_15 + var_708_25 + arg_708_0 then
				arg_705_1.typewritter.percent = 1

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305179 = function(arg_709_0, arg_709_1)
		arg_709_1.time_ = 0
		arg_709_1.frameCnt_ = 0
		arg_709_1.state_ = "playing"
		arg_709_1.curTalkId_ = 1109305179
		arg_709_1.duration_ = 5

		SetActive(arg_709_1.tipsGo_, false)

		function arg_709_1.onSingleLineFinish_()
			arg_709_1.onSingleLineUpdate_ = nil
			arg_709_1.onSingleLineFinish_ = nil
			arg_709_1.state_ = "waiting"
		end

		function arg_709_1.playNext_(arg_711_0)
			if arg_711_0 == 1 then
				arg_709_0:Play1109305180(arg_709_1)
			end
		end

		function arg_709_1.onSingleLineUpdate_(arg_712_0)
			local var_712_0 = arg_709_1.actors_["1093ui_story"]
			local var_712_1 = 0

			if var_712_1 < arg_709_1.time_ and arg_709_1.time_ <= var_712_1 + arg_712_0 and not isNil(var_712_0) and arg_709_1.var_.characterEffect1093ui_story == nil then
				arg_709_1.var_.characterEffect1093ui_story = var_712_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_712_2 = 0.200000002980232

			if var_712_1 <= arg_709_1.time_ and arg_709_1.time_ < var_712_1 + var_712_2 and not isNil(var_712_0) then
				local var_712_3 = (arg_709_1.time_ - var_712_1) / var_712_2

				if arg_709_1.var_.characterEffect1093ui_story and not isNil(var_712_0) then
					local var_712_4 = Mathf.Lerp(0, 0.5, var_712_3)

					arg_709_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_709_1.var_.characterEffect1093ui_story.fillRatio = var_712_4
				end
			end

			if arg_709_1.time_ >= var_712_1 + var_712_2 and arg_709_1.time_ < var_712_1 + var_712_2 + arg_712_0 and not isNil(var_712_0) and arg_709_1.var_.characterEffect1093ui_story then
				local var_712_5 = 0.5

				arg_709_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_709_1.var_.characterEffect1093ui_story.fillRatio = var_712_5
			end

			local var_712_6 = 0
			local var_712_7 = 0.6

			if var_712_6 < arg_709_1.time_ and arg_709_1.time_ <= var_712_6 + arg_712_0 then
				arg_709_1.talkMaxDuration = 0
				arg_709_1.dialogCg_.alpha = 1

				arg_709_1.dialog_:SetActive(true)
				SetActive(arg_709_1.leftNameGo_, true)

				local var_712_8 = arg_709_1:FormatText(StoryNameCfg[7].name)

				arg_709_1.leftNameTxt_.text = var_712_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_709_1.leftNameTxt_.transform)

				arg_709_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_709_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_709_1:RecordName(arg_709_1.leftNameTxt_.text)
				SetActive(arg_709_1.iconTrs_.gameObject, false)
				arg_709_1.callingController_:SetSelectedState("normal")

				local var_712_9 = arg_709_1:GetWordFromCfg(1109305179)
				local var_712_10 = arg_709_1:FormatText(var_712_9.content)

				arg_709_1.text_.text = var_712_10

				LuaForUtil.ClearLinePrefixSymbol(arg_709_1.text_)

				local var_712_11 = 24
				local var_712_12 = utf8.len(var_712_10)
				local var_712_13 = var_712_11 <= 0 and var_712_7 or var_712_7 * (var_712_12 / var_712_11)

				if var_712_13 > 0 and var_712_7 < var_712_13 then
					arg_709_1.talkMaxDuration = var_712_13

					if var_712_13 + var_712_6 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_13 + var_712_6
					end
				end

				arg_709_1.text_.text = var_712_10
				arg_709_1.typewritter.percent = 0

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(false)
				arg_709_1:RecordContent(arg_709_1.text_.text)
			end

			local var_712_14 = math.max(var_712_7, arg_709_1.talkMaxDuration)

			if var_712_6 <= arg_709_1.time_ and arg_709_1.time_ < var_712_6 + var_712_14 then
				arg_709_1.typewritter.percent = (arg_709_1.time_ - var_712_6) / var_712_14

				arg_709_1.typewritter:SetDirty()
			end

			if arg_709_1.time_ >= var_712_6 + var_712_14 and arg_709_1.time_ < var_712_6 + var_712_14 + arg_712_0 then
				arg_709_1.typewritter.percent = 1

				arg_709_1.typewritter:SetDirty()
				arg_709_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305180 = function(arg_713_0, arg_713_1)
		arg_713_1.time_ = 0
		arg_713_1.frameCnt_ = 0
		arg_713_1.state_ = "playing"
		arg_713_1.curTalkId_ = 1109305180
		arg_713_1.duration_ = 5

		SetActive(arg_713_1.tipsGo_, false)

		function arg_713_1.onSingleLineFinish_()
			arg_713_1.onSingleLineUpdate_ = nil
			arg_713_1.onSingleLineFinish_ = nil
			arg_713_1.state_ = "waiting"
		end

		function arg_713_1.playNext_(arg_715_0)
			if arg_715_0 == 1 then
				arg_713_0:Play1109305181(arg_713_1)
			end
		end

		function arg_713_1.onSingleLineUpdate_(arg_716_0)
			local var_716_0 = 0
			local var_716_1 = 0.7

			if var_716_0 < arg_713_1.time_ and arg_713_1.time_ <= var_716_0 + arg_716_0 then
				arg_713_1.talkMaxDuration = 0
				arg_713_1.dialogCg_.alpha = 1

				arg_713_1.dialog_:SetActive(true)
				SetActive(arg_713_1.leftNameGo_, true)

				local var_716_2 = arg_713_1:FormatText(StoryNameCfg[7].name)

				arg_713_1.leftNameTxt_.text = var_716_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_713_1.leftNameTxt_.transform)

				arg_713_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_713_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_713_1:RecordName(arg_713_1.leftNameTxt_.text)
				SetActive(arg_713_1.iconTrs_.gameObject, false)
				arg_713_1.callingController_:SetSelectedState("normal")

				local var_716_3 = arg_713_1:GetWordFromCfg(1109305180)
				local var_716_4 = arg_713_1:FormatText(var_716_3.content)

				arg_713_1.text_.text = var_716_4

				LuaForUtil.ClearLinePrefixSymbol(arg_713_1.text_)

				local var_716_5 = 28
				local var_716_6 = utf8.len(var_716_4)
				local var_716_7 = var_716_5 <= 0 and var_716_1 or var_716_1 * (var_716_6 / var_716_5)

				if var_716_7 > 0 and var_716_1 < var_716_7 then
					arg_713_1.talkMaxDuration = var_716_7

					if var_716_7 + var_716_0 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_7 + var_716_0
					end
				end

				arg_713_1.text_.text = var_716_4
				arg_713_1.typewritter.percent = 0

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(false)
				arg_713_1:RecordContent(arg_713_1.text_.text)
			end

			local var_716_8 = math.max(var_716_1, arg_713_1.talkMaxDuration)

			if var_716_0 <= arg_713_1.time_ and arg_713_1.time_ < var_716_0 + var_716_8 then
				arg_713_1.typewritter.percent = (arg_713_1.time_ - var_716_0) / var_716_8

				arg_713_1.typewritter:SetDirty()
			end

			if arg_713_1.time_ >= var_716_0 + var_716_8 and arg_713_1.time_ < var_716_0 + var_716_8 + arg_716_0 then
				arg_713_1.typewritter.percent = 1

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305181 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 1109305181
		arg_717_1.duration_ = 5

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play1109305182(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = 0
			local var_720_1 = 0.65

			if var_720_0 < arg_717_1.time_ and arg_717_1.time_ <= var_720_0 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0
				arg_717_1.dialogCg_.alpha = 1

				arg_717_1.dialog_:SetActive(true)
				SetActive(arg_717_1.leftNameGo_, true)

				local var_720_2 = arg_717_1:FormatText(StoryNameCfg[7].name)

				arg_717_1.leftNameTxt_.text = var_720_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_717_1.leftNameTxt_.transform)

				arg_717_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_717_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_717_1:RecordName(arg_717_1.leftNameTxt_.text)
				SetActive(arg_717_1.iconTrs_.gameObject, false)
				arg_717_1.callingController_:SetSelectedState("normal")

				local var_720_3 = arg_717_1:GetWordFromCfg(1109305181)
				local var_720_4 = arg_717_1:FormatText(var_720_3.content)

				arg_717_1.text_.text = var_720_4

				LuaForUtil.ClearLinePrefixSymbol(arg_717_1.text_)

				local var_720_5 = 26
				local var_720_6 = utf8.len(var_720_4)
				local var_720_7 = var_720_5 <= 0 and var_720_1 or var_720_1 * (var_720_6 / var_720_5)

				if var_720_7 > 0 and var_720_1 < var_720_7 then
					arg_717_1.talkMaxDuration = var_720_7

					if var_720_7 + var_720_0 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_7 + var_720_0
					end
				end

				arg_717_1.text_.text = var_720_4
				arg_717_1.typewritter.percent = 0

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(false)
				arg_717_1:RecordContent(arg_717_1.text_.text)
			end

			local var_720_8 = math.max(var_720_1, arg_717_1.talkMaxDuration)

			if var_720_0 <= arg_717_1.time_ and arg_717_1.time_ < var_720_0 + var_720_8 then
				arg_717_1.typewritter.percent = (arg_717_1.time_ - var_720_0) / var_720_8

				arg_717_1.typewritter:SetDirty()
			end

			if arg_717_1.time_ >= var_720_0 + var_720_8 and arg_717_1.time_ < var_720_0 + var_720_8 + arg_720_0 then
				arg_717_1.typewritter.percent = 1

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305182 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 1109305182
		arg_721_1.duration_ = 6

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play1109305183(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = arg_721_1.actors_["1093ui_story"].transform
			local var_724_1 = 0

			if var_724_1 < arg_721_1.time_ and arg_721_1.time_ <= var_724_1 + arg_724_0 then
				arg_721_1.var_.moveOldPos1093ui_story = var_724_0.localPosition
			end

			local var_724_2 = 0.001

			if var_724_1 <= arg_721_1.time_ and arg_721_1.time_ < var_724_1 + var_724_2 then
				local var_724_3 = (arg_721_1.time_ - var_724_1) / var_724_2
				local var_724_4 = Vector3.New(0, -1.11, -5.88)

				var_724_0.localPosition = Vector3.Lerp(arg_721_1.var_.moveOldPos1093ui_story, var_724_4, var_724_3)

				local var_724_5 = manager.ui.mainCamera.transform.position - var_724_0.position

				var_724_0.forward = Vector3.New(var_724_5.x, var_724_5.y, var_724_5.z)

				local var_724_6 = var_724_0.localEulerAngles

				var_724_6.z = 0
				var_724_6.x = 0
				var_724_0.localEulerAngles = var_724_6
			end

			if arg_721_1.time_ >= var_724_1 + var_724_2 and arg_721_1.time_ < var_724_1 + var_724_2 + arg_724_0 then
				var_724_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_724_7 = manager.ui.mainCamera.transform.position - var_724_0.position

				var_724_0.forward = Vector3.New(var_724_7.x, var_724_7.y, var_724_7.z)

				local var_724_8 = var_724_0.localEulerAngles

				var_724_8.z = 0
				var_724_8.x = 0
				var_724_0.localEulerAngles = var_724_8
			end

			local var_724_9 = arg_721_1.actors_["1093ui_story"]
			local var_724_10 = 0

			if var_724_10 < arg_721_1.time_ and arg_721_1.time_ <= var_724_10 + arg_724_0 and not isNil(var_724_9) and arg_721_1.var_.characterEffect1093ui_story == nil then
				arg_721_1.var_.characterEffect1093ui_story = var_724_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_724_11 = 0.200000002980232

			if var_724_10 <= arg_721_1.time_ and arg_721_1.time_ < var_724_10 + var_724_11 and not isNil(var_724_9) then
				local var_724_12 = (arg_721_1.time_ - var_724_10) / var_724_11

				if arg_721_1.var_.characterEffect1093ui_story and not isNil(var_724_9) then
					arg_721_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_721_1.time_ >= var_724_10 + var_724_11 and arg_721_1.time_ < var_724_10 + var_724_11 + arg_724_0 and not isNil(var_724_9) and arg_721_1.var_.characterEffect1093ui_story then
				arg_721_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_724_13 = 0

			if var_724_13 < arg_721_1.time_ and arg_721_1.time_ <= var_724_13 + arg_724_0 then
				arg_721_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action469")
			end

			local var_724_14 = 0

			if var_724_14 < arg_721_1.time_ and arg_721_1.time_ <= var_724_14 + arg_724_0 then
				arg_721_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_724_15 = 0
			local var_724_16 = 0.725

			if var_724_15 < arg_721_1.time_ and arg_721_1.time_ <= var_724_15 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0
				arg_721_1.dialogCg_.alpha = 1

				arg_721_1.dialog_:SetActive(true)
				SetActive(arg_721_1.leftNameGo_, true)

				local var_724_17 = arg_721_1:FormatText(StoryNameCfg[73].name)

				arg_721_1.leftNameTxt_.text = var_724_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_721_1.leftNameTxt_.transform)

				arg_721_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_721_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_721_1:RecordName(arg_721_1.leftNameTxt_.text)
				SetActive(arg_721_1.iconTrs_.gameObject, false)
				arg_721_1.callingController_:SetSelectedState("normal")

				local var_724_18 = arg_721_1:GetWordFromCfg(1109305182)
				local var_724_19 = arg_721_1:FormatText(var_724_18.content)

				arg_721_1.text_.text = var_724_19

				LuaForUtil.ClearLinePrefixSymbol(arg_721_1.text_)

				local var_724_20 = 29
				local var_724_21 = utf8.len(var_724_19)
				local var_724_22 = var_724_20 <= 0 and var_724_16 or var_724_16 * (var_724_21 / var_724_20)

				if var_724_22 > 0 and var_724_16 < var_724_22 then
					arg_721_1.talkMaxDuration = var_724_22

					if var_724_22 + var_724_15 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_22 + var_724_15
					end
				end

				arg_721_1.text_.text = var_724_19
				arg_721_1.typewritter.percent = 0

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305182", "story_v_side_new_1109305.awb") ~= 0 then
					local var_724_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305182", "story_v_side_new_1109305.awb") / 1000

					if var_724_23 + var_724_15 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_23 + var_724_15
					end

					if var_724_18.prefab_name ~= "" and arg_721_1.actors_[var_724_18.prefab_name] ~= nil then
						local var_724_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_721_1.actors_[var_724_18.prefab_name].transform, "story_v_side_new_1109305", "1109305182", "story_v_side_new_1109305.awb")

						arg_721_1:RecordAudio("1109305182", var_724_24)
						arg_721_1:RecordAudio("1109305182", var_724_24)
					else
						arg_721_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305182", "story_v_side_new_1109305.awb")
					end

					arg_721_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305182", "story_v_side_new_1109305.awb")
				end

				arg_721_1:RecordContent(arg_721_1.text_.text)
			end

			local var_724_25 = math.max(var_724_16, arg_721_1.talkMaxDuration)

			if var_724_15 <= arg_721_1.time_ and arg_721_1.time_ < var_724_15 + var_724_25 then
				arg_721_1.typewritter.percent = (arg_721_1.time_ - var_724_15) / var_724_25

				arg_721_1.typewritter:SetDirty()
			end

			if arg_721_1.time_ >= var_724_15 + var_724_25 and arg_721_1.time_ < var_724_15 + var_724_25 + arg_724_0 then
				arg_721_1.typewritter.percent = 1

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305183 = function(arg_725_0, arg_725_1)
		arg_725_1.time_ = 0
		arg_725_1.frameCnt_ = 0
		arg_725_1.state_ = "playing"
		arg_725_1.curTalkId_ = 1109305183
		arg_725_1.duration_ = 4.6

		SetActive(arg_725_1.tipsGo_, false)

		function arg_725_1.onSingleLineFinish_()
			arg_725_1.onSingleLineUpdate_ = nil
			arg_725_1.onSingleLineFinish_ = nil
			arg_725_1.state_ = "waiting"
		end

		function arg_725_1.playNext_(arg_727_0)
			if arg_727_0 == 1 then
				arg_725_0:Play1109305184(arg_725_1)
			end
		end

		function arg_725_1.onSingleLineUpdate_(arg_728_0)
			local var_728_0 = 0
			local var_728_1 = 0.55

			if var_728_0 < arg_725_1.time_ and arg_725_1.time_ <= var_728_0 + arg_728_0 then
				arg_725_1.talkMaxDuration = 0
				arg_725_1.dialogCg_.alpha = 1

				arg_725_1.dialog_:SetActive(true)
				SetActive(arg_725_1.leftNameGo_, true)

				local var_728_2 = arg_725_1:FormatText(StoryNameCfg[73].name)

				arg_725_1.leftNameTxt_.text = var_728_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_725_1.leftNameTxt_.transform)

				arg_725_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_725_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_725_1:RecordName(arg_725_1.leftNameTxt_.text)
				SetActive(arg_725_1.iconTrs_.gameObject, false)
				arg_725_1.callingController_:SetSelectedState("normal")

				local var_728_3 = arg_725_1:GetWordFromCfg(1109305183)
				local var_728_4 = arg_725_1:FormatText(var_728_3.content)

				arg_725_1.text_.text = var_728_4

				LuaForUtil.ClearLinePrefixSymbol(arg_725_1.text_)

				local var_728_5 = 22
				local var_728_6 = utf8.len(var_728_4)
				local var_728_7 = var_728_5 <= 0 and var_728_1 or var_728_1 * (var_728_6 / var_728_5)

				if var_728_7 > 0 and var_728_1 < var_728_7 then
					arg_725_1.talkMaxDuration = var_728_7

					if var_728_7 + var_728_0 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_7 + var_728_0
					end
				end

				arg_725_1.text_.text = var_728_4
				arg_725_1.typewritter.percent = 0

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305183", "story_v_side_new_1109305.awb") ~= 0 then
					local var_728_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305183", "story_v_side_new_1109305.awb") / 1000

					if var_728_8 + var_728_0 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_8 + var_728_0
					end

					if var_728_3.prefab_name ~= "" and arg_725_1.actors_[var_728_3.prefab_name] ~= nil then
						local var_728_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_725_1.actors_[var_728_3.prefab_name].transform, "story_v_side_new_1109305", "1109305183", "story_v_side_new_1109305.awb")

						arg_725_1:RecordAudio("1109305183", var_728_9)
						arg_725_1:RecordAudio("1109305183", var_728_9)
					else
						arg_725_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305183", "story_v_side_new_1109305.awb")
					end

					arg_725_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305183", "story_v_side_new_1109305.awb")
				end

				arg_725_1:RecordContent(arg_725_1.text_.text)
			end

			local var_728_10 = math.max(var_728_1, arg_725_1.talkMaxDuration)

			if var_728_0 <= arg_725_1.time_ and arg_725_1.time_ < var_728_0 + var_728_10 then
				arg_725_1.typewritter.percent = (arg_725_1.time_ - var_728_0) / var_728_10

				arg_725_1.typewritter:SetDirty()
			end

			if arg_725_1.time_ >= var_728_0 + var_728_10 and arg_725_1.time_ < var_728_0 + var_728_10 + arg_728_0 then
				arg_725_1.typewritter.percent = 1

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305184 = function(arg_729_0, arg_729_1)
		arg_729_1.time_ = 0
		arg_729_1.frameCnt_ = 0
		arg_729_1.state_ = "playing"
		arg_729_1.curTalkId_ = 1109305184
		arg_729_1.duration_ = 8.93

		SetActive(arg_729_1.tipsGo_, false)

		function arg_729_1.onSingleLineFinish_()
			arg_729_1.onSingleLineUpdate_ = nil
			arg_729_1.onSingleLineFinish_ = nil
			arg_729_1.state_ = "waiting"
		end

		function arg_729_1.playNext_(arg_731_0)
			if arg_731_0 == 1 then
				arg_729_0:Play1109305185(arg_729_1)
			end
		end

		function arg_729_1.onSingleLineUpdate_(arg_732_0)
			local var_732_0 = 0
			local var_732_1 = 1.05

			if var_732_0 < arg_729_1.time_ and arg_729_1.time_ <= var_732_0 + arg_732_0 then
				arg_729_1.talkMaxDuration = 0
				arg_729_1.dialogCg_.alpha = 1

				arg_729_1.dialog_:SetActive(true)
				SetActive(arg_729_1.leftNameGo_, true)

				local var_732_2 = arg_729_1:FormatText(StoryNameCfg[73].name)

				arg_729_1.leftNameTxt_.text = var_732_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_729_1.leftNameTxt_.transform)

				arg_729_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_729_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_729_1:RecordName(arg_729_1.leftNameTxt_.text)
				SetActive(arg_729_1.iconTrs_.gameObject, false)
				arg_729_1.callingController_:SetSelectedState("normal")

				local var_732_3 = arg_729_1:GetWordFromCfg(1109305184)
				local var_732_4 = arg_729_1:FormatText(var_732_3.content)

				arg_729_1.text_.text = var_732_4

				LuaForUtil.ClearLinePrefixSymbol(arg_729_1.text_)

				local var_732_5 = 42
				local var_732_6 = utf8.len(var_732_4)
				local var_732_7 = var_732_5 <= 0 and var_732_1 or var_732_1 * (var_732_6 / var_732_5)

				if var_732_7 > 0 and var_732_1 < var_732_7 then
					arg_729_1.talkMaxDuration = var_732_7

					if var_732_7 + var_732_0 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_7 + var_732_0
					end
				end

				arg_729_1.text_.text = var_732_4
				arg_729_1.typewritter.percent = 0

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305184", "story_v_side_new_1109305.awb") ~= 0 then
					local var_732_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305184", "story_v_side_new_1109305.awb") / 1000

					if var_732_8 + var_732_0 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_8 + var_732_0
					end

					if var_732_3.prefab_name ~= "" and arg_729_1.actors_[var_732_3.prefab_name] ~= nil then
						local var_732_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_729_1.actors_[var_732_3.prefab_name].transform, "story_v_side_new_1109305", "1109305184", "story_v_side_new_1109305.awb")

						arg_729_1:RecordAudio("1109305184", var_732_9)
						arg_729_1:RecordAudio("1109305184", var_732_9)
					else
						arg_729_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305184", "story_v_side_new_1109305.awb")
					end

					arg_729_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305184", "story_v_side_new_1109305.awb")
				end

				arg_729_1:RecordContent(arg_729_1.text_.text)
			end

			local var_732_10 = math.max(var_732_1, arg_729_1.talkMaxDuration)

			if var_732_0 <= arg_729_1.time_ and arg_729_1.time_ < var_732_0 + var_732_10 then
				arg_729_1.typewritter.percent = (arg_729_1.time_ - var_732_0) / var_732_10

				arg_729_1.typewritter:SetDirty()
			end

			if arg_729_1.time_ >= var_732_0 + var_732_10 and arg_729_1.time_ < var_732_0 + var_732_10 + arg_732_0 then
				arg_729_1.typewritter.percent = 1

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305185 = function(arg_733_0, arg_733_1)
		arg_733_1.time_ = 0
		arg_733_1.frameCnt_ = 0
		arg_733_1.state_ = "playing"
		arg_733_1.curTalkId_ = 1109305185
		arg_733_1.duration_ = 11.63

		SetActive(arg_733_1.tipsGo_, false)

		function arg_733_1.onSingleLineFinish_()
			arg_733_1.onSingleLineUpdate_ = nil
			arg_733_1.onSingleLineFinish_ = nil
			arg_733_1.state_ = "waiting"
		end

		function arg_733_1.playNext_(arg_735_0)
			if arg_735_0 == 1 then
				arg_733_0:Play1109305186(arg_733_1)
			end
		end

		function arg_733_1.onSingleLineUpdate_(arg_736_0)
			local var_736_0 = 0

			if var_736_0 < arg_733_1.time_ and arg_733_1.time_ <= var_736_0 + arg_736_0 then
				arg_733_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_2")
			end

			local var_736_1 = 0

			if var_736_1 < arg_733_1.time_ and arg_733_1.time_ <= var_736_1 + arg_736_0 then
				arg_733_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_736_2 = 0
			local var_736_3 = 1.225

			if var_736_2 < arg_733_1.time_ and arg_733_1.time_ <= var_736_2 + arg_736_0 then
				arg_733_1.talkMaxDuration = 0
				arg_733_1.dialogCg_.alpha = 1

				arg_733_1.dialog_:SetActive(true)
				SetActive(arg_733_1.leftNameGo_, true)

				local var_736_4 = arg_733_1:FormatText(StoryNameCfg[73].name)

				arg_733_1.leftNameTxt_.text = var_736_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_733_1.leftNameTxt_.transform)

				arg_733_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_733_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_733_1:RecordName(arg_733_1.leftNameTxt_.text)
				SetActive(arg_733_1.iconTrs_.gameObject, false)
				arg_733_1.callingController_:SetSelectedState("normal")

				local var_736_5 = arg_733_1:GetWordFromCfg(1109305185)
				local var_736_6 = arg_733_1:FormatText(var_736_5.content)

				arg_733_1.text_.text = var_736_6

				LuaForUtil.ClearLinePrefixSymbol(arg_733_1.text_)

				local var_736_7 = 49
				local var_736_8 = utf8.len(var_736_6)
				local var_736_9 = var_736_7 <= 0 and var_736_3 or var_736_3 * (var_736_8 / var_736_7)

				if var_736_9 > 0 and var_736_3 < var_736_9 then
					arg_733_1.talkMaxDuration = var_736_9

					if var_736_9 + var_736_2 > arg_733_1.duration_ then
						arg_733_1.duration_ = var_736_9 + var_736_2
					end
				end

				arg_733_1.text_.text = var_736_6
				arg_733_1.typewritter.percent = 0

				arg_733_1.typewritter:SetDirty()
				arg_733_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305185", "story_v_side_new_1109305.awb") ~= 0 then
					local var_736_10 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305185", "story_v_side_new_1109305.awb") / 1000

					if var_736_10 + var_736_2 > arg_733_1.duration_ then
						arg_733_1.duration_ = var_736_10 + var_736_2
					end

					if var_736_5.prefab_name ~= "" and arg_733_1.actors_[var_736_5.prefab_name] ~= nil then
						local var_736_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_733_1.actors_[var_736_5.prefab_name].transform, "story_v_side_new_1109305", "1109305185", "story_v_side_new_1109305.awb")

						arg_733_1:RecordAudio("1109305185", var_736_11)
						arg_733_1:RecordAudio("1109305185", var_736_11)
					else
						arg_733_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305185", "story_v_side_new_1109305.awb")
					end

					arg_733_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305185", "story_v_side_new_1109305.awb")
				end

				arg_733_1:RecordContent(arg_733_1.text_.text)
			end

			local var_736_12 = math.max(var_736_3, arg_733_1.talkMaxDuration)

			if var_736_2 <= arg_733_1.time_ and arg_733_1.time_ < var_736_2 + var_736_12 then
				arg_733_1.typewritter.percent = (arg_733_1.time_ - var_736_2) / var_736_12

				arg_733_1.typewritter:SetDirty()
			end

			if arg_733_1.time_ >= var_736_2 + var_736_12 and arg_733_1.time_ < var_736_2 + var_736_12 + arg_736_0 then
				arg_733_1.typewritter.percent = 1

				arg_733_1.typewritter:SetDirty()
				arg_733_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305186 = function(arg_737_0, arg_737_1)
		arg_737_1.time_ = 0
		arg_737_1.frameCnt_ = 0
		arg_737_1.state_ = "playing"
		arg_737_1.curTalkId_ = 1109305186
		arg_737_1.duration_ = 5

		SetActive(arg_737_1.tipsGo_, false)

		function arg_737_1.onSingleLineFinish_()
			arg_737_1.onSingleLineUpdate_ = nil
			arg_737_1.onSingleLineFinish_ = nil
			arg_737_1.state_ = "waiting"
		end

		function arg_737_1.playNext_(arg_739_0)
			if arg_739_0 == 1 then
				arg_737_0:Play1109305187(arg_737_1)
			end
		end

		function arg_737_1.onSingleLineUpdate_(arg_740_0)
			local var_740_0 = arg_737_1.actors_["1093ui_story"]
			local var_740_1 = 0

			if var_740_1 < arg_737_1.time_ and arg_737_1.time_ <= var_740_1 + arg_740_0 and not isNil(var_740_0) and arg_737_1.var_.characterEffect1093ui_story == nil then
				arg_737_1.var_.characterEffect1093ui_story = var_740_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_740_2 = 0.200000002980232

			if var_740_1 <= arg_737_1.time_ and arg_737_1.time_ < var_740_1 + var_740_2 and not isNil(var_740_0) then
				local var_740_3 = (arg_737_1.time_ - var_740_1) / var_740_2

				if arg_737_1.var_.characterEffect1093ui_story and not isNil(var_740_0) then
					local var_740_4 = Mathf.Lerp(0, 0.5, var_740_3)

					arg_737_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_737_1.var_.characterEffect1093ui_story.fillRatio = var_740_4
				end
			end

			if arg_737_1.time_ >= var_740_1 + var_740_2 and arg_737_1.time_ < var_740_1 + var_740_2 + arg_740_0 and not isNil(var_740_0) and arg_737_1.var_.characterEffect1093ui_story then
				local var_740_5 = 0.5

				arg_737_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_737_1.var_.characterEffect1093ui_story.fillRatio = var_740_5
			end

			local var_740_6 = 0
			local var_740_7 = 0.225

			if var_740_6 < arg_737_1.time_ and arg_737_1.time_ <= var_740_6 + arg_740_0 then
				arg_737_1.talkMaxDuration = 0
				arg_737_1.dialogCg_.alpha = 1

				arg_737_1.dialog_:SetActive(true)
				SetActive(arg_737_1.leftNameGo_, true)

				local var_740_8 = arg_737_1:FormatText(StoryNameCfg[7].name)

				arg_737_1.leftNameTxt_.text = var_740_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_737_1.leftNameTxt_.transform)

				arg_737_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_737_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_737_1:RecordName(arg_737_1.leftNameTxt_.text)
				SetActive(arg_737_1.iconTrs_.gameObject, false)
				arg_737_1.callingController_:SetSelectedState("normal")

				local var_740_9 = arg_737_1:GetWordFromCfg(1109305186)
				local var_740_10 = arg_737_1:FormatText(var_740_9.content)

				arg_737_1.text_.text = var_740_10

				LuaForUtil.ClearLinePrefixSymbol(arg_737_1.text_)

				local var_740_11 = 9
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
				arg_737_1:RecordContent(arg_737_1.text_.text)
			end

			local var_740_14 = math.max(var_740_7, arg_737_1.talkMaxDuration)

			if var_740_6 <= arg_737_1.time_ and arg_737_1.time_ < var_740_6 + var_740_14 then
				arg_737_1.typewritter.percent = (arg_737_1.time_ - var_740_6) / var_740_14

				arg_737_1.typewritter:SetDirty()
			end

			if arg_737_1.time_ >= var_740_6 + var_740_14 and arg_737_1.time_ < var_740_6 + var_740_14 + arg_740_0 then
				arg_737_1.typewritter.percent = 1

				arg_737_1.typewritter:SetDirty()
				arg_737_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305187 = function(arg_741_0, arg_741_1)
		arg_741_1.time_ = 0
		arg_741_1.frameCnt_ = 0
		arg_741_1.state_ = "playing"
		arg_741_1.curTalkId_ = 1109305187
		arg_741_1.duration_ = 2.73

		SetActive(arg_741_1.tipsGo_, false)

		function arg_741_1.onSingleLineFinish_()
			arg_741_1.onSingleLineUpdate_ = nil
			arg_741_1.onSingleLineFinish_ = nil
			arg_741_1.state_ = "waiting"
		end

		function arg_741_1.playNext_(arg_743_0)
			if arg_743_0 == 1 then
				arg_741_0:Play1109305188(arg_741_1)
			end
		end

		function arg_741_1.onSingleLineUpdate_(arg_744_0)
			local var_744_0 = arg_741_1.actors_["1093ui_story"]
			local var_744_1 = 0

			if var_744_1 < arg_741_1.time_ and arg_741_1.time_ <= var_744_1 + arg_744_0 and not isNil(var_744_0) and arg_741_1.var_.characterEffect1093ui_story == nil then
				arg_741_1.var_.characterEffect1093ui_story = var_744_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_744_2 = 0.200000002980232

			if var_744_1 <= arg_741_1.time_ and arg_741_1.time_ < var_744_1 + var_744_2 and not isNil(var_744_0) then
				local var_744_3 = (arg_741_1.time_ - var_744_1) / var_744_2

				if arg_741_1.var_.characterEffect1093ui_story and not isNil(var_744_0) then
					arg_741_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_741_1.time_ >= var_744_1 + var_744_2 and arg_741_1.time_ < var_744_1 + var_744_2 + arg_744_0 and not isNil(var_744_0) and arg_741_1.var_.characterEffect1093ui_story then
				arg_741_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_744_4 = 0
			local var_744_5 = 0.3

			if var_744_4 < arg_741_1.time_ and arg_741_1.time_ <= var_744_4 + arg_744_0 then
				arg_741_1.talkMaxDuration = 0
				arg_741_1.dialogCg_.alpha = 1

				arg_741_1.dialog_:SetActive(true)
				SetActive(arg_741_1.leftNameGo_, true)

				local var_744_6 = arg_741_1:FormatText(StoryNameCfg[73].name)

				arg_741_1.leftNameTxt_.text = var_744_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_741_1.leftNameTxt_.transform)

				arg_741_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_741_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_741_1:RecordName(arg_741_1.leftNameTxt_.text)
				SetActive(arg_741_1.iconTrs_.gameObject, false)
				arg_741_1.callingController_:SetSelectedState("normal")

				local var_744_7 = arg_741_1:GetWordFromCfg(1109305187)
				local var_744_8 = arg_741_1:FormatText(var_744_7.content)

				arg_741_1.text_.text = var_744_8

				LuaForUtil.ClearLinePrefixSymbol(arg_741_1.text_)

				local var_744_9 = 12
				local var_744_10 = utf8.len(var_744_8)
				local var_744_11 = var_744_9 <= 0 and var_744_5 or var_744_5 * (var_744_10 / var_744_9)

				if var_744_11 > 0 and var_744_5 < var_744_11 then
					arg_741_1.talkMaxDuration = var_744_11

					if var_744_11 + var_744_4 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_11 + var_744_4
					end
				end

				arg_741_1.text_.text = var_744_8
				arg_741_1.typewritter.percent = 0

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305187", "story_v_side_new_1109305.awb") ~= 0 then
					local var_744_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305187", "story_v_side_new_1109305.awb") / 1000

					if var_744_12 + var_744_4 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_12 + var_744_4
					end

					if var_744_7.prefab_name ~= "" and arg_741_1.actors_[var_744_7.prefab_name] ~= nil then
						local var_744_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_741_1.actors_[var_744_7.prefab_name].transform, "story_v_side_new_1109305", "1109305187", "story_v_side_new_1109305.awb")

						arg_741_1:RecordAudio("1109305187", var_744_13)
						arg_741_1:RecordAudio("1109305187", var_744_13)
					else
						arg_741_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305187", "story_v_side_new_1109305.awb")
					end

					arg_741_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305187", "story_v_side_new_1109305.awb")
				end

				arg_741_1:RecordContent(arg_741_1.text_.text)
			end

			local var_744_14 = math.max(var_744_5, arg_741_1.talkMaxDuration)

			if var_744_4 <= arg_741_1.time_ and arg_741_1.time_ < var_744_4 + var_744_14 then
				arg_741_1.typewritter.percent = (arg_741_1.time_ - var_744_4) / var_744_14

				arg_741_1.typewritter:SetDirty()
			end

			if arg_741_1.time_ >= var_744_4 + var_744_14 and arg_741_1.time_ < var_744_4 + var_744_14 + arg_744_0 then
				arg_741_1.typewritter.percent = 1

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305188 = function(arg_745_0, arg_745_1)
		arg_745_1.time_ = 0
		arg_745_1.frameCnt_ = 0
		arg_745_1.state_ = "playing"
		arg_745_1.curTalkId_ = 1109305188
		arg_745_1.duration_ = 4.43

		SetActive(arg_745_1.tipsGo_, false)

		function arg_745_1.onSingleLineFinish_()
			arg_745_1.onSingleLineUpdate_ = nil
			arg_745_1.onSingleLineFinish_ = nil
			arg_745_1.state_ = "waiting"
		end

		function arg_745_1.playNext_(arg_747_0)
			if arg_747_0 == 1 then
				arg_745_0:Play1109305189(arg_745_1)
			end
		end

		function arg_745_1.onSingleLineUpdate_(arg_748_0)
			local var_748_0 = arg_745_1.actors_["1093ui_story"].transform
			local var_748_1 = 0

			if var_748_1 < arg_745_1.time_ and arg_745_1.time_ <= var_748_1 + arg_748_0 then
				arg_745_1.var_.moveOldPos1093ui_story = var_748_0.localPosition
			end

			local var_748_2 = 0.001

			if var_748_1 <= arg_745_1.time_ and arg_745_1.time_ < var_748_1 + var_748_2 then
				local var_748_3 = (arg_745_1.time_ - var_748_1) / var_748_2
				local var_748_4 = Vector3.New(0, -1.11, -5.88)

				var_748_0.localPosition = Vector3.Lerp(arg_745_1.var_.moveOldPos1093ui_story, var_748_4, var_748_3)

				local var_748_5 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_5.x, var_748_5.y, var_748_5.z)

				local var_748_6 = var_748_0.localEulerAngles

				var_748_6.z = 0
				var_748_6.x = 0
				var_748_0.localEulerAngles = var_748_6
			end

			if arg_745_1.time_ >= var_748_1 + var_748_2 and arg_745_1.time_ < var_748_1 + var_748_2 + arg_748_0 then
				var_748_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_748_7 = manager.ui.mainCamera.transform.position - var_748_0.position

				var_748_0.forward = Vector3.New(var_748_7.x, var_748_7.y, var_748_7.z)

				local var_748_8 = var_748_0.localEulerAngles

				var_748_8.z = 0
				var_748_8.x = 0
				var_748_0.localEulerAngles = var_748_8
			end

			local var_748_9 = 0

			if var_748_9 < arg_745_1.time_ and arg_745_1.time_ <= var_748_9 + arg_748_0 then
				arg_745_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_1")
			end

			local var_748_10 = 0

			if var_748_10 < arg_745_1.time_ and arg_745_1.time_ <= var_748_10 + arg_748_0 then
				arg_745_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_748_11 = 0
			local var_748_12 = 0.475

			if var_748_11 < arg_745_1.time_ and arg_745_1.time_ <= var_748_11 + arg_748_0 then
				arg_745_1.talkMaxDuration = 0
				arg_745_1.dialogCg_.alpha = 1

				arg_745_1.dialog_:SetActive(true)
				SetActive(arg_745_1.leftNameGo_, true)

				local var_748_13 = arg_745_1:FormatText(StoryNameCfg[73].name)

				arg_745_1.leftNameTxt_.text = var_748_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_745_1.leftNameTxt_.transform)

				arg_745_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_745_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_745_1:RecordName(arg_745_1.leftNameTxt_.text)
				SetActive(arg_745_1.iconTrs_.gameObject, false)
				arg_745_1.callingController_:SetSelectedState("normal")

				local var_748_14 = arg_745_1:GetWordFromCfg(1109305188)
				local var_748_15 = arg_745_1:FormatText(var_748_14.content)

				arg_745_1.text_.text = var_748_15

				LuaForUtil.ClearLinePrefixSymbol(arg_745_1.text_)

				local var_748_16 = 19
				local var_748_17 = utf8.len(var_748_15)
				local var_748_18 = var_748_16 <= 0 and var_748_12 or var_748_12 * (var_748_17 / var_748_16)

				if var_748_18 > 0 and var_748_12 < var_748_18 then
					arg_745_1.talkMaxDuration = var_748_18

					if var_748_18 + var_748_11 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_18 + var_748_11
					end
				end

				arg_745_1.text_.text = var_748_15
				arg_745_1.typewritter.percent = 0

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305188", "story_v_side_new_1109305.awb") ~= 0 then
					local var_748_19 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305188", "story_v_side_new_1109305.awb") / 1000

					if var_748_19 + var_748_11 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_19 + var_748_11
					end

					if var_748_14.prefab_name ~= "" and arg_745_1.actors_[var_748_14.prefab_name] ~= nil then
						local var_748_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_745_1.actors_[var_748_14.prefab_name].transform, "story_v_side_new_1109305", "1109305188", "story_v_side_new_1109305.awb")

						arg_745_1:RecordAudio("1109305188", var_748_20)
						arg_745_1:RecordAudio("1109305188", var_748_20)
					else
						arg_745_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305188", "story_v_side_new_1109305.awb")
					end

					arg_745_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305188", "story_v_side_new_1109305.awb")
				end

				arg_745_1:RecordContent(arg_745_1.text_.text)
			end

			local var_748_21 = math.max(var_748_12, arg_745_1.talkMaxDuration)

			if var_748_11 <= arg_745_1.time_ and arg_745_1.time_ < var_748_11 + var_748_21 then
				arg_745_1.typewritter.percent = (arg_745_1.time_ - var_748_11) / var_748_21

				arg_745_1.typewritter:SetDirty()
			end

			if arg_745_1.time_ >= var_748_11 + var_748_21 and arg_745_1.time_ < var_748_11 + var_748_21 + arg_748_0 then
				arg_745_1.typewritter.percent = 1

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305189 = function(arg_749_0, arg_749_1)
		arg_749_1.time_ = 0
		arg_749_1.frameCnt_ = 0
		arg_749_1.state_ = "playing"
		arg_749_1.curTalkId_ = 1109305189
		arg_749_1.duration_ = 5

		SetActive(arg_749_1.tipsGo_, false)

		function arg_749_1.onSingleLineFinish_()
			arg_749_1.onSingleLineUpdate_ = nil
			arg_749_1.onSingleLineFinish_ = nil
			arg_749_1.state_ = "waiting"
		end

		function arg_749_1.playNext_(arg_751_0)
			if arg_751_0 == 1 then
				arg_749_0:Play1109305190(arg_749_1)
			end
		end

		function arg_749_1.onSingleLineUpdate_(arg_752_0)
			local var_752_0 = arg_749_1.actors_["1093ui_story"].transform
			local var_752_1 = 0

			if var_752_1 < arg_749_1.time_ and arg_749_1.time_ <= var_752_1 + arg_752_0 then
				arg_749_1.var_.moveOldPos1093ui_story = var_752_0.localPosition
			end

			local var_752_2 = 0.001

			if var_752_1 <= arg_749_1.time_ and arg_749_1.time_ < var_752_1 + var_752_2 then
				local var_752_3 = (arg_749_1.time_ - var_752_1) / var_752_2
				local var_752_4 = Vector3.New(0, 100, 0)

				var_752_0.localPosition = Vector3.Lerp(arg_749_1.var_.moveOldPos1093ui_story, var_752_4, var_752_3)

				local var_752_5 = manager.ui.mainCamera.transform.position - var_752_0.position

				var_752_0.forward = Vector3.New(var_752_5.x, var_752_5.y, var_752_5.z)

				local var_752_6 = var_752_0.localEulerAngles

				var_752_6.z = 0
				var_752_6.x = 0
				var_752_0.localEulerAngles = var_752_6
			end

			if arg_749_1.time_ >= var_752_1 + var_752_2 and arg_749_1.time_ < var_752_1 + var_752_2 + arg_752_0 then
				var_752_0.localPosition = Vector3.New(0, 100, 0)

				local var_752_7 = manager.ui.mainCamera.transform.position - var_752_0.position

				var_752_0.forward = Vector3.New(var_752_7.x, var_752_7.y, var_752_7.z)

				local var_752_8 = var_752_0.localEulerAngles

				var_752_8.z = 0
				var_752_8.x = 0
				var_752_0.localEulerAngles = var_752_8
			end

			local var_752_9 = arg_749_1.actors_["1093ui_story"]
			local var_752_10 = 0

			if var_752_10 < arg_749_1.time_ and arg_749_1.time_ <= var_752_10 + arg_752_0 and not isNil(var_752_9) and arg_749_1.var_.characterEffect1093ui_story == nil then
				arg_749_1.var_.characterEffect1093ui_story = var_752_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_752_11 = 0.200000002980232

			if var_752_10 <= arg_749_1.time_ and arg_749_1.time_ < var_752_10 + var_752_11 and not isNil(var_752_9) then
				local var_752_12 = (arg_749_1.time_ - var_752_10) / var_752_11

				if arg_749_1.var_.characterEffect1093ui_story and not isNil(var_752_9) then
					local var_752_13 = Mathf.Lerp(0, 0.5, var_752_12)

					arg_749_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_749_1.var_.characterEffect1093ui_story.fillRatio = var_752_13
				end
			end

			if arg_749_1.time_ >= var_752_10 + var_752_11 and arg_749_1.time_ < var_752_10 + var_752_11 + arg_752_0 and not isNil(var_752_9) and arg_749_1.var_.characterEffect1093ui_story then
				local var_752_14 = 0.5

				arg_749_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_749_1.var_.characterEffect1093ui_story.fillRatio = var_752_14
			end

			local var_752_15 = 0
			local var_752_16 = 0.825

			if var_752_15 < arg_749_1.time_ and arg_749_1.time_ <= var_752_15 + arg_752_0 then
				arg_749_1.talkMaxDuration = 0
				arg_749_1.dialogCg_.alpha = 1

				arg_749_1.dialog_:SetActive(true)
				SetActive(arg_749_1.leftNameGo_, false)

				arg_749_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_749_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_749_1:RecordName(arg_749_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_749_1.iconTrs_.gameObject, false)
				arg_749_1.callingController_:SetSelectedState("normal")

				local var_752_17 = arg_749_1:GetWordFromCfg(1109305189)
				local var_752_18 = arg_749_1:FormatText(var_752_17.content)

				arg_749_1.text_.text = var_752_18

				LuaForUtil.ClearLinePrefixSymbol(arg_749_1.text_)

				local var_752_19 = 33
				local var_752_20 = utf8.len(var_752_18)
				local var_752_21 = var_752_19 <= 0 and var_752_16 or var_752_16 * (var_752_20 / var_752_19)

				if var_752_21 > 0 and var_752_16 < var_752_21 then
					arg_749_1.talkMaxDuration = var_752_21

					if var_752_21 + var_752_15 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_21 + var_752_15
					end
				end

				arg_749_1.text_.text = var_752_18
				arg_749_1.typewritter.percent = 0

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(false)
				arg_749_1:RecordContent(arg_749_1.text_.text)
			end

			local var_752_22 = math.max(var_752_16, arg_749_1.talkMaxDuration)

			if var_752_15 <= arg_749_1.time_ and arg_749_1.time_ < var_752_15 + var_752_22 then
				arg_749_1.typewritter.percent = (arg_749_1.time_ - var_752_15) / var_752_22

				arg_749_1.typewritter:SetDirty()
			end

			if arg_749_1.time_ >= var_752_15 + var_752_22 and arg_749_1.time_ < var_752_15 + var_752_22 + arg_752_0 then
				arg_749_1.typewritter.percent = 1

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305190 = function(arg_753_0, arg_753_1)
		arg_753_1.time_ = 0
		arg_753_1.frameCnt_ = 0
		arg_753_1.state_ = "playing"
		arg_753_1.curTalkId_ = 1109305190
		arg_753_1.duration_ = 5

		SetActive(arg_753_1.tipsGo_, false)

		function arg_753_1.onSingleLineFinish_()
			arg_753_1.onSingleLineUpdate_ = nil
			arg_753_1.onSingleLineFinish_ = nil
			arg_753_1.state_ = "waiting"
		end

		function arg_753_1.playNext_(arg_755_0)
			if arg_755_0 == 1 then
				arg_753_0:Play1109305191(arg_753_1)
			end
		end

		function arg_753_1.onSingleLineUpdate_(arg_756_0)
			local var_756_0 = 0
			local var_756_1 = 0.75

			if var_756_0 < arg_753_1.time_ and arg_753_1.time_ <= var_756_0 + arg_756_0 then
				arg_753_1.talkMaxDuration = 0
				arg_753_1.dialogCg_.alpha = 1

				arg_753_1.dialog_:SetActive(true)
				SetActive(arg_753_1.leftNameGo_, false)

				arg_753_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_753_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_753_1:RecordName(arg_753_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_753_1.iconTrs_.gameObject, false)
				arg_753_1.callingController_:SetSelectedState("normal")

				local var_756_2 = arg_753_1:GetWordFromCfg(1109305190)
				local var_756_3 = arg_753_1:FormatText(var_756_2.content)

				arg_753_1.text_.text = var_756_3

				LuaForUtil.ClearLinePrefixSymbol(arg_753_1.text_)

				local var_756_4 = 30
				local var_756_5 = utf8.len(var_756_3)
				local var_756_6 = var_756_4 <= 0 and var_756_1 or var_756_1 * (var_756_5 / var_756_4)

				if var_756_6 > 0 and var_756_1 < var_756_6 then
					arg_753_1.talkMaxDuration = var_756_6

					if var_756_6 + var_756_0 > arg_753_1.duration_ then
						arg_753_1.duration_ = var_756_6 + var_756_0
					end
				end

				arg_753_1.text_.text = var_756_3
				arg_753_1.typewritter.percent = 0

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(false)
				arg_753_1:RecordContent(arg_753_1.text_.text)
			end

			local var_756_7 = math.max(var_756_1, arg_753_1.talkMaxDuration)

			if var_756_0 <= arg_753_1.time_ and arg_753_1.time_ < var_756_0 + var_756_7 then
				arg_753_1.typewritter.percent = (arg_753_1.time_ - var_756_0) / var_756_7

				arg_753_1.typewritter:SetDirty()
			end

			if arg_753_1.time_ >= var_756_0 + var_756_7 and arg_753_1.time_ < var_756_0 + var_756_7 + arg_756_0 then
				arg_753_1.typewritter.percent = 1

				arg_753_1.typewritter:SetDirty()
				arg_753_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305191 = function(arg_757_0, arg_757_1)
		arg_757_1.time_ = 0
		arg_757_1.frameCnt_ = 0
		arg_757_1.state_ = "playing"
		arg_757_1.curTalkId_ = 1109305191
		arg_757_1.duration_ = 5

		SetActive(arg_757_1.tipsGo_, false)

		function arg_757_1.onSingleLineFinish_()
			arg_757_1.onSingleLineUpdate_ = nil
			arg_757_1.onSingleLineFinish_ = nil
			arg_757_1.state_ = "waiting"
		end

		function arg_757_1.playNext_(arg_759_0)
			if arg_759_0 == 1 then
				arg_757_0:Play1109305192(arg_757_1)
			end
		end

		function arg_757_1.onSingleLineUpdate_(arg_760_0)
			local var_760_0 = 0
			local var_760_1 = 0.775

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

				local var_760_3 = arg_757_1:GetWordFromCfg(1109305191)
				local var_760_4 = arg_757_1:FormatText(var_760_3.content)

				arg_757_1.text_.text = var_760_4

				LuaForUtil.ClearLinePrefixSymbol(arg_757_1.text_)

				local var_760_5 = 31
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
	Play1109305192 = function(arg_761_0, arg_761_1)
		arg_761_1.time_ = 0
		arg_761_1.frameCnt_ = 0
		arg_761_1.state_ = "playing"
		arg_761_1.curTalkId_ = 1109305192
		arg_761_1.duration_ = 2

		SetActive(arg_761_1.tipsGo_, false)

		function arg_761_1.onSingleLineFinish_()
			arg_761_1.onSingleLineUpdate_ = nil
			arg_761_1.onSingleLineFinish_ = nil
			arg_761_1.state_ = "waiting"
		end

		function arg_761_1.playNext_(arg_763_0)
			if arg_763_0 == 1 then
				arg_761_0:Play1109305193(arg_761_1)
			end
		end

		function arg_761_1.onSingleLineUpdate_(arg_764_0)
			local var_764_0 = arg_761_1.actors_["1093ui_story"].transform
			local var_764_1 = 0

			if var_764_1 < arg_761_1.time_ and arg_761_1.time_ <= var_764_1 + arg_764_0 then
				arg_761_1.var_.moveOldPos1093ui_story = var_764_0.localPosition
			end

			local var_764_2 = 0.001

			if var_764_1 <= arg_761_1.time_ and arg_761_1.time_ < var_764_1 + var_764_2 then
				local var_764_3 = (arg_761_1.time_ - var_764_1) / var_764_2
				local var_764_4 = Vector3.New(0, -1.11, -5.88)

				var_764_0.localPosition = Vector3.Lerp(arg_761_1.var_.moveOldPos1093ui_story, var_764_4, var_764_3)

				local var_764_5 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_5.x, var_764_5.y, var_764_5.z)

				local var_764_6 = var_764_0.localEulerAngles

				var_764_6.z = 0
				var_764_6.x = 0
				var_764_0.localEulerAngles = var_764_6
			end

			if arg_761_1.time_ >= var_764_1 + var_764_2 and arg_761_1.time_ < var_764_1 + var_764_2 + arg_764_0 then
				var_764_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_764_7 = manager.ui.mainCamera.transform.position - var_764_0.position

				var_764_0.forward = Vector3.New(var_764_7.x, var_764_7.y, var_764_7.z)

				local var_764_8 = var_764_0.localEulerAngles

				var_764_8.z = 0
				var_764_8.x = 0
				var_764_0.localEulerAngles = var_764_8
			end

			local var_764_9 = arg_761_1.actors_["1093ui_story"]
			local var_764_10 = 0

			if var_764_10 < arg_761_1.time_ and arg_761_1.time_ <= var_764_10 + arg_764_0 and not isNil(var_764_9) and arg_761_1.var_.characterEffect1093ui_story == nil then
				arg_761_1.var_.characterEffect1093ui_story = var_764_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_764_11 = 0.200000002980232

			if var_764_10 <= arg_761_1.time_ and arg_761_1.time_ < var_764_10 + var_764_11 and not isNil(var_764_9) then
				local var_764_12 = (arg_761_1.time_ - var_764_10) / var_764_11

				if arg_761_1.var_.characterEffect1093ui_story and not isNil(var_764_9) then
					arg_761_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_761_1.time_ >= var_764_10 + var_764_11 and arg_761_1.time_ < var_764_10 + var_764_11 + arg_764_0 and not isNil(var_764_9) and arg_761_1.var_.characterEffect1093ui_story then
				arg_761_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_764_13 = 0

			if var_764_13 < arg_761_1.time_ and arg_761_1.time_ <= var_764_13 + arg_764_0 then
				arg_761_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action8_2")
			end

			local var_764_14 = 0

			if var_764_14 < arg_761_1.time_ and arg_761_1.time_ <= var_764_14 + arg_764_0 then
				arg_761_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_764_15 = 0
			local var_764_16 = 0.175

			if var_764_15 < arg_761_1.time_ and arg_761_1.time_ <= var_764_15 + arg_764_0 then
				arg_761_1.talkMaxDuration = 0
				arg_761_1.dialogCg_.alpha = 1

				arg_761_1.dialog_:SetActive(true)
				SetActive(arg_761_1.leftNameGo_, true)

				local var_764_17 = arg_761_1:FormatText(StoryNameCfg[73].name)

				arg_761_1.leftNameTxt_.text = var_764_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_761_1.leftNameTxt_.transform)

				arg_761_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_761_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_761_1:RecordName(arg_761_1.leftNameTxt_.text)
				SetActive(arg_761_1.iconTrs_.gameObject, false)
				arg_761_1.callingController_:SetSelectedState("normal")

				local var_764_18 = arg_761_1:GetWordFromCfg(1109305192)
				local var_764_19 = arg_761_1:FormatText(var_764_18.content)

				arg_761_1.text_.text = var_764_19

				LuaForUtil.ClearLinePrefixSymbol(arg_761_1.text_)

				local var_764_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305192", "story_v_side_new_1109305.awb") ~= 0 then
					local var_764_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305192", "story_v_side_new_1109305.awb") / 1000

					if var_764_23 + var_764_15 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_23 + var_764_15
					end

					if var_764_18.prefab_name ~= "" and arg_761_1.actors_[var_764_18.prefab_name] ~= nil then
						local var_764_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_761_1.actors_[var_764_18.prefab_name].transform, "story_v_side_new_1109305", "1109305192", "story_v_side_new_1109305.awb")

						arg_761_1:RecordAudio("1109305192", var_764_24)
						arg_761_1:RecordAudio("1109305192", var_764_24)
					else
						arg_761_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305192", "story_v_side_new_1109305.awb")
					end

					arg_761_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305192", "story_v_side_new_1109305.awb")
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
	Play1109305193 = function(arg_765_0, arg_765_1)
		arg_765_1.time_ = 0
		arg_765_1.frameCnt_ = 0
		arg_765_1.state_ = "playing"
		arg_765_1.curTalkId_ = 1109305193
		arg_765_1.duration_ = 5

		SetActive(arg_765_1.tipsGo_, false)

		function arg_765_1.onSingleLineFinish_()
			arg_765_1.onSingleLineUpdate_ = nil
			arg_765_1.onSingleLineFinish_ = nil
			arg_765_1.state_ = "waiting"
		end

		function arg_765_1.playNext_(arg_767_0)
			if arg_767_0 == 1 then
				arg_765_0:Play1109305194(arg_765_1)
			end
		end

		function arg_765_1.onSingleLineUpdate_(arg_768_0)
			local var_768_0 = arg_765_1.actors_["1093ui_story"]
			local var_768_1 = 0

			if var_768_1 < arg_765_1.time_ and arg_765_1.time_ <= var_768_1 + arg_768_0 and not isNil(var_768_0) and arg_765_1.var_.characterEffect1093ui_story == nil then
				arg_765_1.var_.characterEffect1093ui_story = var_768_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_768_2 = 0.200000002980232

			if var_768_1 <= arg_765_1.time_ and arg_765_1.time_ < var_768_1 + var_768_2 and not isNil(var_768_0) then
				local var_768_3 = (arg_765_1.time_ - var_768_1) / var_768_2

				if arg_765_1.var_.characterEffect1093ui_story and not isNil(var_768_0) then
					local var_768_4 = Mathf.Lerp(0, 0.5, var_768_3)

					arg_765_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_765_1.var_.characterEffect1093ui_story.fillRatio = var_768_4
				end
			end

			if arg_765_1.time_ >= var_768_1 + var_768_2 and arg_765_1.time_ < var_768_1 + var_768_2 + arg_768_0 and not isNil(var_768_0) and arg_765_1.var_.characterEffect1093ui_story then
				local var_768_5 = 0.5

				arg_765_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_765_1.var_.characterEffect1093ui_story.fillRatio = var_768_5
			end

			local var_768_6 = 0
			local var_768_7 = 0.775

			if var_768_6 < arg_765_1.time_ and arg_765_1.time_ <= var_768_6 + arg_768_0 then
				arg_765_1.talkMaxDuration = 0
				arg_765_1.dialogCg_.alpha = 1

				arg_765_1.dialog_:SetActive(true)
				SetActive(arg_765_1.leftNameGo_, true)

				local var_768_8 = arg_765_1:FormatText(StoryNameCfg[7].name)

				arg_765_1.leftNameTxt_.text = var_768_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_765_1.leftNameTxt_.transform)

				arg_765_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_765_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_765_1:RecordName(arg_765_1.leftNameTxt_.text)
				SetActive(arg_765_1.iconTrs_.gameObject, false)
				arg_765_1.callingController_:SetSelectedState("normal")

				local var_768_9 = arg_765_1:GetWordFromCfg(1109305193)
				local var_768_10 = arg_765_1:FormatText(var_768_9.content)

				arg_765_1.text_.text = var_768_10

				LuaForUtil.ClearLinePrefixSymbol(arg_765_1.text_)

				local var_768_11 = 31
				local var_768_12 = utf8.len(var_768_10)
				local var_768_13 = var_768_11 <= 0 and var_768_7 or var_768_7 * (var_768_12 / var_768_11)

				if var_768_13 > 0 and var_768_7 < var_768_13 then
					arg_765_1.talkMaxDuration = var_768_13

					if var_768_13 + var_768_6 > arg_765_1.duration_ then
						arg_765_1.duration_ = var_768_13 + var_768_6
					end
				end

				arg_765_1.text_.text = var_768_10
				arg_765_1.typewritter.percent = 0

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(false)
				arg_765_1:RecordContent(arg_765_1.text_.text)
			end

			local var_768_14 = math.max(var_768_7, arg_765_1.talkMaxDuration)

			if var_768_6 <= arg_765_1.time_ and arg_765_1.time_ < var_768_6 + var_768_14 then
				arg_765_1.typewritter.percent = (arg_765_1.time_ - var_768_6) / var_768_14

				arg_765_1.typewritter:SetDirty()
			end

			if arg_765_1.time_ >= var_768_6 + var_768_14 and arg_765_1.time_ < var_768_6 + var_768_14 + arg_768_0 then
				arg_765_1.typewritter.percent = 1

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305194 = function(arg_769_0, arg_769_1)
		arg_769_1.time_ = 0
		arg_769_1.frameCnt_ = 0
		arg_769_1.state_ = "playing"
		arg_769_1.curTalkId_ = 1109305194
		arg_769_1.duration_ = 8.13

		SetActive(arg_769_1.tipsGo_, false)

		function arg_769_1.onSingleLineFinish_()
			arg_769_1.onSingleLineUpdate_ = nil
			arg_769_1.onSingleLineFinish_ = nil
			arg_769_1.state_ = "waiting"
		end

		function arg_769_1.playNext_(arg_771_0)
			if arg_771_0 == 1 then
				arg_769_0:Play1109305195(arg_769_1)
			end
		end

		function arg_769_1.onSingleLineUpdate_(arg_772_0)
			local var_772_0 = arg_769_1.actors_["1093ui_story"]
			local var_772_1 = 0

			if var_772_1 < arg_769_1.time_ and arg_769_1.time_ <= var_772_1 + arg_772_0 and not isNil(var_772_0) and arg_769_1.var_.characterEffect1093ui_story == nil then
				arg_769_1.var_.characterEffect1093ui_story = var_772_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_772_2 = 0.200000002980232

			if var_772_1 <= arg_769_1.time_ and arg_769_1.time_ < var_772_1 + var_772_2 and not isNil(var_772_0) then
				local var_772_3 = (arg_769_1.time_ - var_772_1) / var_772_2

				if arg_769_1.var_.characterEffect1093ui_story and not isNil(var_772_0) then
					arg_769_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_769_1.time_ >= var_772_1 + var_772_2 and arg_769_1.time_ < var_772_1 + var_772_2 + arg_772_0 and not isNil(var_772_0) and arg_769_1.var_.characterEffect1093ui_story then
				arg_769_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_772_4 = 0
			local var_772_5 = 0.925

			if var_772_4 < arg_769_1.time_ and arg_769_1.time_ <= var_772_4 + arg_772_0 then
				arg_769_1.talkMaxDuration = 0
				arg_769_1.dialogCg_.alpha = 1

				arg_769_1.dialog_:SetActive(true)
				SetActive(arg_769_1.leftNameGo_, true)

				local var_772_6 = arg_769_1:FormatText(StoryNameCfg[73].name)

				arg_769_1.leftNameTxt_.text = var_772_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_769_1.leftNameTxt_.transform)

				arg_769_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_769_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_769_1:RecordName(arg_769_1.leftNameTxt_.text)
				SetActive(arg_769_1.iconTrs_.gameObject, false)
				arg_769_1.callingController_:SetSelectedState("normal")

				local var_772_7 = arg_769_1:GetWordFromCfg(1109305194)
				local var_772_8 = arg_769_1:FormatText(var_772_7.content)

				arg_769_1.text_.text = var_772_8

				LuaForUtil.ClearLinePrefixSymbol(arg_769_1.text_)

				local var_772_9 = 37
				local var_772_10 = utf8.len(var_772_8)
				local var_772_11 = var_772_9 <= 0 and var_772_5 or var_772_5 * (var_772_10 / var_772_9)

				if var_772_11 > 0 and var_772_5 < var_772_11 then
					arg_769_1.talkMaxDuration = var_772_11

					if var_772_11 + var_772_4 > arg_769_1.duration_ then
						arg_769_1.duration_ = var_772_11 + var_772_4
					end
				end

				arg_769_1.text_.text = var_772_8
				arg_769_1.typewritter.percent = 0

				arg_769_1.typewritter:SetDirty()
				arg_769_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305194", "story_v_side_new_1109305.awb") ~= 0 then
					local var_772_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305194", "story_v_side_new_1109305.awb") / 1000

					if var_772_12 + var_772_4 > arg_769_1.duration_ then
						arg_769_1.duration_ = var_772_12 + var_772_4
					end

					if var_772_7.prefab_name ~= "" and arg_769_1.actors_[var_772_7.prefab_name] ~= nil then
						local var_772_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_769_1.actors_[var_772_7.prefab_name].transform, "story_v_side_new_1109305", "1109305194", "story_v_side_new_1109305.awb")

						arg_769_1:RecordAudio("1109305194", var_772_13)
						arg_769_1:RecordAudio("1109305194", var_772_13)
					else
						arg_769_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305194", "story_v_side_new_1109305.awb")
					end

					arg_769_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305194", "story_v_side_new_1109305.awb")
				end

				arg_769_1:RecordContent(arg_769_1.text_.text)
			end

			local var_772_14 = math.max(var_772_5, arg_769_1.talkMaxDuration)

			if var_772_4 <= arg_769_1.time_ and arg_769_1.time_ < var_772_4 + var_772_14 then
				arg_769_1.typewritter.percent = (arg_769_1.time_ - var_772_4) / var_772_14

				arg_769_1.typewritter:SetDirty()
			end

			if arg_769_1.time_ >= var_772_4 + var_772_14 and arg_769_1.time_ < var_772_4 + var_772_14 + arg_772_0 then
				arg_769_1.typewritter.percent = 1

				arg_769_1.typewritter:SetDirty()
				arg_769_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305195 = function(arg_773_0, arg_773_1)
		arg_773_1.time_ = 0
		arg_773_1.frameCnt_ = 0
		arg_773_1.state_ = "playing"
		arg_773_1.curTalkId_ = 1109305195
		arg_773_1.duration_ = 5

		SetActive(arg_773_1.tipsGo_, false)

		function arg_773_1.onSingleLineFinish_()
			arg_773_1.onSingleLineUpdate_ = nil
			arg_773_1.onSingleLineFinish_ = nil
			arg_773_1.state_ = "waiting"
		end

		function arg_773_1.playNext_(arg_775_0)
			if arg_775_0 == 1 then
				arg_773_0:Play1109305196(arg_773_1)
			end
		end

		function arg_773_1.onSingleLineUpdate_(arg_776_0)
			local var_776_0 = arg_773_1.actors_["1093ui_story"].transform
			local var_776_1 = 0

			if var_776_1 < arg_773_1.time_ and arg_773_1.time_ <= var_776_1 + arg_776_0 then
				arg_773_1.var_.moveOldPos1093ui_story = var_776_0.localPosition
			end

			local var_776_2 = 0.001

			if var_776_1 <= arg_773_1.time_ and arg_773_1.time_ < var_776_1 + var_776_2 then
				local var_776_3 = (arg_773_1.time_ - var_776_1) / var_776_2
				local var_776_4 = Vector3.New(0, 100, 0)

				var_776_0.localPosition = Vector3.Lerp(arg_773_1.var_.moveOldPos1093ui_story, var_776_4, var_776_3)

				local var_776_5 = manager.ui.mainCamera.transform.position - var_776_0.position

				var_776_0.forward = Vector3.New(var_776_5.x, var_776_5.y, var_776_5.z)

				local var_776_6 = var_776_0.localEulerAngles

				var_776_6.z = 0
				var_776_6.x = 0
				var_776_0.localEulerAngles = var_776_6
			end

			if arg_773_1.time_ >= var_776_1 + var_776_2 and arg_773_1.time_ < var_776_1 + var_776_2 + arg_776_0 then
				var_776_0.localPosition = Vector3.New(0, 100, 0)

				local var_776_7 = manager.ui.mainCamera.transform.position - var_776_0.position

				var_776_0.forward = Vector3.New(var_776_7.x, var_776_7.y, var_776_7.z)

				local var_776_8 = var_776_0.localEulerAngles

				var_776_8.z = 0
				var_776_8.x = 0
				var_776_0.localEulerAngles = var_776_8
			end

			local var_776_9 = arg_773_1.actors_["1093ui_story"]
			local var_776_10 = 0

			if var_776_10 < arg_773_1.time_ and arg_773_1.time_ <= var_776_10 + arg_776_0 and not isNil(var_776_9) and arg_773_1.var_.characterEffect1093ui_story == nil then
				arg_773_1.var_.characterEffect1093ui_story = var_776_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_776_11 = 0.200000002980232

			if var_776_10 <= arg_773_1.time_ and arg_773_1.time_ < var_776_10 + var_776_11 and not isNil(var_776_9) then
				local var_776_12 = (arg_773_1.time_ - var_776_10) / var_776_11

				if arg_773_1.var_.characterEffect1093ui_story and not isNil(var_776_9) then
					local var_776_13 = Mathf.Lerp(0, 0.5, var_776_12)

					arg_773_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_773_1.var_.characterEffect1093ui_story.fillRatio = var_776_13
				end
			end

			if arg_773_1.time_ >= var_776_10 + var_776_11 and arg_773_1.time_ < var_776_10 + var_776_11 + arg_776_0 and not isNil(var_776_9) and arg_773_1.var_.characterEffect1093ui_story then
				local var_776_14 = 0.5

				arg_773_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_773_1.var_.characterEffect1093ui_story.fillRatio = var_776_14
			end

			local var_776_15 = 0
			local var_776_16 = 1.025

			if var_776_15 < arg_773_1.time_ and arg_773_1.time_ <= var_776_15 + arg_776_0 then
				arg_773_1.talkMaxDuration = 0
				arg_773_1.dialogCg_.alpha = 1

				arg_773_1.dialog_:SetActive(true)
				SetActive(arg_773_1.leftNameGo_, false)

				arg_773_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_773_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_773_1:RecordName(arg_773_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_773_1.iconTrs_.gameObject, false)
				arg_773_1.callingController_:SetSelectedState("normal")

				local var_776_17 = arg_773_1:GetWordFromCfg(1109305195)
				local var_776_18 = arg_773_1:FormatText(var_776_17.content)

				arg_773_1.text_.text = var_776_18

				LuaForUtil.ClearLinePrefixSymbol(arg_773_1.text_)

				local var_776_19 = 41
				local var_776_20 = utf8.len(var_776_18)
				local var_776_21 = var_776_19 <= 0 and var_776_16 or var_776_16 * (var_776_20 / var_776_19)

				if var_776_21 > 0 and var_776_16 < var_776_21 then
					arg_773_1.talkMaxDuration = var_776_21

					if var_776_21 + var_776_15 > arg_773_1.duration_ then
						arg_773_1.duration_ = var_776_21 + var_776_15
					end
				end

				arg_773_1.text_.text = var_776_18
				arg_773_1.typewritter.percent = 0

				arg_773_1.typewritter:SetDirty()
				arg_773_1:ShowNextGo(false)
				arg_773_1:RecordContent(arg_773_1.text_.text)
			end

			local var_776_22 = math.max(var_776_16, arg_773_1.talkMaxDuration)

			if var_776_15 <= arg_773_1.time_ and arg_773_1.time_ < var_776_15 + var_776_22 then
				arg_773_1.typewritter.percent = (arg_773_1.time_ - var_776_15) / var_776_22

				arg_773_1.typewritter:SetDirty()
			end

			if arg_773_1.time_ >= var_776_15 + var_776_22 and arg_773_1.time_ < var_776_15 + var_776_22 + arg_776_0 then
				arg_773_1.typewritter.percent = 1

				arg_773_1.typewritter:SetDirty()
				arg_773_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305196 = function(arg_777_0, arg_777_1)
		arg_777_1.time_ = 0
		arg_777_1.frameCnt_ = 0
		arg_777_1.state_ = "playing"
		arg_777_1.curTalkId_ = 1109305196
		arg_777_1.duration_ = 5

		SetActive(arg_777_1.tipsGo_, false)

		function arg_777_1.onSingleLineFinish_()
			arg_777_1.onSingleLineUpdate_ = nil
			arg_777_1.onSingleLineFinish_ = nil
			arg_777_1.state_ = "waiting"
		end

		function arg_777_1.playNext_(arg_779_0)
			if arg_779_0 == 1 then
				arg_777_0:Play1109305197(arg_777_1)
			end
		end

		function arg_777_1.onSingleLineUpdate_(arg_780_0)
			local var_780_0 = 0
			local var_780_1 = 0.35

			if var_780_0 < arg_777_1.time_ and arg_777_1.time_ <= var_780_0 + arg_780_0 then
				arg_777_1.talkMaxDuration = 0
				arg_777_1.dialogCg_.alpha = 1

				arg_777_1.dialog_:SetActive(true)
				SetActive(arg_777_1.leftNameGo_, true)

				local var_780_2 = arg_777_1:FormatText(StoryNameCfg[7].name)

				arg_777_1.leftNameTxt_.text = var_780_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_777_1.leftNameTxt_.transform)

				arg_777_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_777_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_777_1:RecordName(arg_777_1.leftNameTxt_.text)
				SetActive(arg_777_1.iconTrs_.gameObject, false)
				arg_777_1.callingController_:SetSelectedState("normal")

				local var_780_3 = arg_777_1:GetWordFromCfg(1109305196)
				local var_780_4 = arg_777_1:FormatText(var_780_3.content)

				arg_777_1.text_.text = var_780_4

				LuaForUtil.ClearLinePrefixSymbol(arg_777_1.text_)

				local var_780_5 = 14
				local var_780_6 = utf8.len(var_780_4)
				local var_780_7 = var_780_5 <= 0 and var_780_1 or var_780_1 * (var_780_6 / var_780_5)

				if var_780_7 > 0 and var_780_1 < var_780_7 then
					arg_777_1.talkMaxDuration = var_780_7

					if var_780_7 + var_780_0 > arg_777_1.duration_ then
						arg_777_1.duration_ = var_780_7 + var_780_0
					end
				end

				arg_777_1.text_.text = var_780_4
				arg_777_1.typewritter.percent = 0

				arg_777_1.typewritter:SetDirty()
				arg_777_1:ShowNextGo(false)
				arg_777_1:RecordContent(arg_777_1.text_.text)
			end

			local var_780_8 = math.max(var_780_1, arg_777_1.talkMaxDuration)

			if var_780_0 <= arg_777_1.time_ and arg_777_1.time_ < var_780_0 + var_780_8 then
				arg_777_1.typewritter.percent = (arg_777_1.time_ - var_780_0) / var_780_8

				arg_777_1.typewritter:SetDirty()
			end

			if arg_777_1.time_ >= var_780_0 + var_780_8 and arg_777_1.time_ < var_780_0 + var_780_8 + arg_780_0 then
				arg_777_1.typewritter.percent = 1

				arg_777_1.typewritter:SetDirty()
				arg_777_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305197 = function(arg_781_0, arg_781_1)
		arg_781_1.time_ = 0
		arg_781_1.frameCnt_ = 0
		arg_781_1.state_ = "playing"
		arg_781_1.curTalkId_ = 1109305197
		arg_781_1.duration_ = 5

		SetActive(arg_781_1.tipsGo_, false)

		function arg_781_1.onSingleLineFinish_()
			arg_781_1.onSingleLineUpdate_ = nil
			arg_781_1.onSingleLineFinish_ = nil
			arg_781_1.state_ = "waiting"
		end

		function arg_781_1.playNext_(arg_783_0)
			if arg_783_0 == 1 then
				arg_781_0:Play1109305198(arg_781_1)
			end
		end

		function arg_781_1.onSingleLineUpdate_(arg_784_0)
			local var_784_0 = 0
			local var_784_1 = 0.575

			if var_784_0 < arg_781_1.time_ and arg_781_1.time_ <= var_784_0 + arg_784_0 then
				arg_781_1.talkMaxDuration = 0
				arg_781_1.dialogCg_.alpha = 1

				arg_781_1.dialog_:SetActive(true)
				SetActive(arg_781_1.leftNameGo_, false)

				arg_781_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_781_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_781_1:RecordName(arg_781_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_781_1.iconTrs_.gameObject, false)
				arg_781_1.callingController_:SetSelectedState("normal")

				local var_784_2 = arg_781_1:GetWordFromCfg(1109305197)
				local var_784_3 = arg_781_1:FormatText(var_784_2.content)

				arg_781_1.text_.text = var_784_3

				LuaForUtil.ClearLinePrefixSymbol(arg_781_1.text_)

				local var_784_4 = 23
				local var_784_5 = utf8.len(var_784_3)
				local var_784_6 = var_784_4 <= 0 and var_784_1 or var_784_1 * (var_784_5 / var_784_4)

				if var_784_6 > 0 and var_784_1 < var_784_6 then
					arg_781_1.talkMaxDuration = var_784_6

					if var_784_6 + var_784_0 > arg_781_1.duration_ then
						arg_781_1.duration_ = var_784_6 + var_784_0
					end
				end

				arg_781_1.text_.text = var_784_3
				arg_781_1.typewritter.percent = 0

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(false)
				arg_781_1:RecordContent(arg_781_1.text_.text)
			end

			local var_784_7 = math.max(var_784_1, arg_781_1.talkMaxDuration)

			if var_784_0 <= arg_781_1.time_ and arg_781_1.time_ < var_784_0 + var_784_7 then
				arg_781_1.typewritter.percent = (arg_781_1.time_ - var_784_0) / var_784_7

				arg_781_1.typewritter:SetDirty()
			end

			if arg_781_1.time_ >= var_784_0 + var_784_7 and arg_781_1.time_ < var_784_0 + var_784_7 + arg_784_0 then
				arg_781_1.typewritter.percent = 1

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305198 = function(arg_785_0, arg_785_1)
		arg_785_1.time_ = 0
		arg_785_1.frameCnt_ = 0
		arg_785_1.state_ = "playing"
		arg_785_1.curTalkId_ = 1109305198
		arg_785_1.duration_ = 6.83

		SetActive(arg_785_1.tipsGo_, false)

		function arg_785_1.onSingleLineFinish_()
			arg_785_1.onSingleLineUpdate_ = nil
			arg_785_1.onSingleLineFinish_ = nil
			arg_785_1.state_ = "waiting"
		end

		function arg_785_1.playNext_(arg_787_0)
			if arg_787_0 == 1 then
				arg_785_0:Play1109305199(arg_785_1)
			end
		end

		function arg_785_1.onSingleLineUpdate_(arg_788_0)
			local var_788_0 = arg_785_1.actors_["1093ui_story"].transform
			local var_788_1 = 0

			if var_788_1 < arg_785_1.time_ and arg_785_1.time_ <= var_788_1 + arg_788_0 then
				arg_785_1.var_.moveOldPos1093ui_story = var_788_0.localPosition
			end

			local var_788_2 = 0.001

			if var_788_1 <= arg_785_1.time_ and arg_785_1.time_ < var_788_1 + var_788_2 then
				local var_788_3 = (arg_785_1.time_ - var_788_1) / var_788_2
				local var_788_4 = Vector3.New(0, -1.11, -5.88)

				var_788_0.localPosition = Vector3.Lerp(arg_785_1.var_.moveOldPos1093ui_story, var_788_4, var_788_3)

				local var_788_5 = manager.ui.mainCamera.transform.position - var_788_0.position

				var_788_0.forward = Vector3.New(var_788_5.x, var_788_5.y, var_788_5.z)

				local var_788_6 = var_788_0.localEulerAngles

				var_788_6.z = 0
				var_788_6.x = 0
				var_788_0.localEulerAngles = var_788_6
			end

			if arg_785_1.time_ >= var_788_1 + var_788_2 and arg_785_1.time_ < var_788_1 + var_788_2 + arg_788_0 then
				var_788_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_788_7 = manager.ui.mainCamera.transform.position - var_788_0.position

				var_788_0.forward = Vector3.New(var_788_7.x, var_788_7.y, var_788_7.z)

				local var_788_8 = var_788_0.localEulerAngles

				var_788_8.z = 0
				var_788_8.x = 0
				var_788_0.localEulerAngles = var_788_8
			end

			local var_788_9 = arg_785_1.actors_["1093ui_story"]
			local var_788_10 = 0

			if var_788_10 < arg_785_1.time_ and arg_785_1.time_ <= var_788_10 + arg_788_0 and not isNil(var_788_9) and arg_785_1.var_.characterEffect1093ui_story == nil then
				arg_785_1.var_.characterEffect1093ui_story = var_788_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_788_11 = 0.200000002980232

			if var_788_10 <= arg_785_1.time_ and arg_785_1.time_ < var_788_10 + var_788_11 and not isNil(var_788_9) then
				local var_788_12 = (arg_785_1.time_ - var_788_10) / var_788_11

				if arg_785_1.var_.characterEffect1093ui_story and not isNil(var_788_9) then
					arg_785_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_785_1.time_ >= var_788_10 + var_788_11 and arg_785_1.time_ < var_788_10 + var_788_11 + arg_788_0 and not isNil(var_788_9) and arg_785_1.var_.characterEffect1093ui_story then
				arg_785_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_788_13 = 0

			if var_788_13 < arg_785_1.time_ and arg_785_1.time_ <= var_788_13 + arg_788_0 then
				arg_785_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_1")
			end

			local var_788_14 = 0

			if var_788_14 < arg_785_1.time_ and arg_785_1.time_ <= var_788_14 + arg_788_0 then
				arg_785_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_788_15 = 0
			local var_788_16 = 0.825

			if var_788_15 < arg_785_1.time_ and arg_785_1.time_ <= var_788_15 + arg_788_0 then
				arg_785_1.talkMaxDuration = 0
				arg_785_1.dialogCg_.alpha = 1

				arg_785_1.dialog_:SetActive(true)
				SetActive(arg_785_1.leftNameGo_, true)

				local var_788_17 = arg_785_1:FormatText(StoryNameCfg[73].name)

				arg_785_1.leftNameTxt_.text = var_788_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_785_1.leftNameTxt_.transform)

				arg_785_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_785_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_785_1:RecordName(arg_785_1.leftNameTxt_.text)
				SetActive(arg_785_1.iconTrs_.gameObject, false)
				arg_785_1.callingController_:SetSelectedState("normal")

				local var_788_18 = arg_785_1:GetWordFromCfg(1109305198)
				local var_788_19 = arg_785_1:FormatText(var_788_18.content)

				arg_785_1.text_.text = var_788_19

				LuaForUtil.ClearLinePrefixSymbol(arg_785_1.text_)

				local var_788_20 = 33
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305198", "story_v_side_new_1109305.awb") ~= 0 then
					local var_788_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305198", "story_v_side_new_1109305.awb") / 1000

					if var_788_23 + var_788_15 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_23 + var_788_15
					end

					if var_788_18.prefab_name ~= "" and arg_785_1.actors_[var_788_18.prefab_name] ~= nil then
						local var_788_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_785_1.actors_[var_788_18.prefab_name].transform, "story_v_side_new_1109305", "1109305198", "story_v_side_new_1109305.awb")

						arg_785_1:RecordAudio("1109305198", var_788_24)
						arg_785_1:RecordAudio("1109305198", var_788_24)
					else
						arg_785_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305198", "story_v_side_new_1109305.awb")
					end

					arg_785_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305198", "story_v_side_new_1109305.awb")
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
	Play1109305199 = function(arg_789_0, arg_789_1)
		arg_789_1.time_ = 0
		arg_789_1.frameCnt_ = 0
		arg_789_1.state_ = "playing"
		arg_789_1.curTalkId_ = 1109305199
		arg_789_1.duration_ = 5

		SetActive(arg_789_1.tipsGo_, false)

		function arg_789_1.onSingleLineFinish_()
			arg_789_1.onSingleLineUpdate_ = nil
			arg_789_1.onSingleLineFinish_ = nil
			arg_789_1.state_ = "waiting"
		end

		function arg_789_1.playNext_(arg_791_0)
			if arg_791_0 == 1 then
				arg_789_0:Play1109305200(arg_789_1)
			end
		end

		function arg_789_1.onSingleLineUpdate_(arg_792_0)
			local var_792_0 = arg_789_1.actors_["1093ui_story"]
			local var_792_1 = 0

			if var_792_1 < arg_789_1.time_ and arg_789_1.time_ <= var_792_1 + arg_792_0 and not isNil(var_792_0) and arg_789_1.var_.characterEffect1093ui_story == nil then
				arg_789_1.var_.characterEffect1093ui_story = var_792_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_792_2 = 0.200000002980232

			if var_792_1 <= arg_789_1.time_ and arg_789_1.time_ < var_792_1 + var_792_2 and not isNil(var_792_0) then
				local var_792_3 = (arg_789_1.time_ - var_792_1) / var_792_2

				if arg_789_1.var_.characterEffect1093ui_story and not isNil(var_792_0) then
					local var_792_4 = Mathf.Lerp(0, 0.5, var_792_3)

					arg_789_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_789_1.var_.characterEffect1093ui_story.fillRatio = var_792_4
				end
			end

			if arg_789_1.time_ >= var_792_1 + var_792_2 and arg_789_1.time_ < var_792_1 + var_792_2 + arg_792_0 and not isNil(var_792_0) and arg_789_1.var_.characterEffect1093ui_story then
				local var_792_5 = 0.5

				arg_789_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_789_1.var_.characterEffect1093ui_story.fillRatio = var_792_5
			end

			local var_792_6 = 0
			local var_792_7 = 0.75

			if var_792_6 < arg_789_1.time_ and arg_789_1.time_ <= var_792_6 + arg_792_0 then
				arg_789_1.talkMaxDuration = 0
				arg_789_1.dialogCg_.alpha = 1

				arg_789_1.dialog_:SetActive(true)
				SetActive(arg_789_1.leftNameGo_, false)

				arg_789_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_789_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_789_1:RecordName(arg_789_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_789_1.iconTrs_.gameObject, false)
				arg_789_1.callingController_:SetSelectedState("normal")

				local var_792_8 = arg_789_1:GetWordFromCfg(1109305199)
				local var_792_9 = arg_789_1:FormatText(var_792_8.content)

				arg_789_1.text_.text = var_792_9

				LuaForUtil.ClearLinePrefixSymbol(arg_789_1.text_)

				local var_792_10 = 30
				local var_792_11 = utf8.len(var_792_9)
				local var_792_12 = var_792_10 <= 0 and var_792_7 or var_792_7 * (var_792_11 / var_792_10)

				if var_792_12 > 0 and var_792_7 < var_792_12 then
					arg_789_1.talkMaxDuration = var_792_12

					if var_792_12 + var_792_6 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_12 + var_792_6
					end
				end

				arg_789_1.text_.text = var_792_9
				arg_789_1.typewritter.percent = 0

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(false)
				arg_789_1:RecordContent(arg_789_1.text_.text)
			end

			local var_792_13 = math.max(var_792_7, arg_789_1.talkMaxDuration)

			if var_792_6 <= arg_789_1.time_ and arg_789_1.time_ < var_792_6 + var_792_13 then
				arg_789_1.typewritter.percent = (arg_789_1.time_ - var_792_6) / var_792_13

				arg_789_1.typewritter:SetDirty()
			end

			if arg_789_1.time_ >= var_792_6 + var_792_13 and arg_789_1.time_ < var_792_6 + var_792_13 + arg_792_0 then
				arg_789_1.typewritter.percent = 1

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305200 = function(arg_793_0, arg_793_1)
		arg_793_1.time_ = 0
		arg_793_1.frameCnt_ = 0
		arg_793_1.state_ = "playing"
		arg_793_1.curTalkId_ = 1109305200
		arg_793_1.duration_ = 5

		SetActive(arg_793_1.tipsGo_, false)

		function arg_793_1.onSingleLineFinish_()
			arg_793_1.onSingleLineUpdate_ = nil
			arg_793_1.onSingleLineFinish_ = nil
			arg_793_1.state_ = "waiting"
		end

		function arg_793_1.playNext_(arg_795_0)
			if arg_795_0 == 1 then
				arg_793_0:Play1109305201(arg_793_1)
			end
		end

		function arg_793_1.onSingleLineUpdate_(arg_796_0)
			local var_796_0 = 0
			local var_796_1 = 0.2

			if var_796_0 < arg_793_1.time_ and arg_793_1.time_ <= var_796_0 + arg_796_0 then
				arg_793_1.talkMaxDuration = 0
				arg_793_1.dialogCg_.alpha = 1

				arg_793_1.dialog_:SetActive(true)
				SetActive(arg_793_1.leftNameGo_, true)

				local var_796_2 = arg_793_1:FormatText(StoryNameCfg[7].name)

				arg_793_1.leftNameTxt_.text = var_796_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_793_1.leftNameTxt_.transform)

				arg_793_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_793_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_793_1:RecordName(arg_793_1.leftNameTxt_.text)
				SetActive(arg_793_1.iconTrs_.gameObject, false)
				arg_793_1.callingController_:SetSelectedState("normal")

				local var_796_3 = arg_793_1:GetWordFromCfg(1109305200)
				local var_796_4 = arg_793_1:FormatText(var_796_3.content)

				arg_793_1.text_.text = var_796_4

				LuaForUtil.ClearLinePrefixSymbol(arg_793_1.text_)

				local var_796_5 = 8
				local var_796_6 = utf8.len(var_796_4)
				local var_796_7 = var_796_5 <= 0 and var_796_1 or var_796_1 * (var_796_6 / var_796_5)

				if var_796_7 > 0 and var_796_1 < var_796_7 then
					arg_793_1.talkMaxDuration = var_796_7

					if var_796_7 + var_796_0 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_7 + var_796_0
					end
				end

				arg_793_1.text_.text = var_796_4
				arg_793_1.typewritter.percent = 0

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(false)
				arg_793_1:RecordContent(arg_793_1.text_.text)
			end

			local var_796_8 = math.max(var_796_1, arg_793_1.talkMaxDuration)

			if var_796_0 <= arg_793_1.time_ and arg_793_1.time_ < var_796_0 + var_796_8 then
				arg_793_1.typewritter.percent = (arg_793_1.time_ - var_796_0) / var_796_8

				arg_793_1.typewritter:SetDirty()
			end

			if arg_793_1.time_ >= var_796_0 + var_796_8 and arg_793_1.time_ < var_796_0 + var_796_8 + arg_796_0 then
				arg_793_1.typewritter.percent = 1

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305201 = function(arg_797_0, arg_797_1)
		arg_797_1.time_ = 0
		arg_797_1.frameCnt_ = 0
		arg_797_1.state_ = "playing"
		arg_797_1.curTalkId_ = 1109305201
		arg_797_1.duration_ = 4.4

		SetActive(arg_797_1.tipsGo_, false)

		function arg_797_1.onSingleLineFinish_()
			arg_797_1.onSingleLineUpdate_ = nil
			arg_797_1.onSingleLineFinish_ = nil
			arg_797_1.state_ = "waiting"
		end

		function arg_797_1.playNext_(arg_799_0)
			if arg_799_0 == 1 then
				arg_797_0:Play1109305202(arg_797_1)
			end
		end

		function arg_797_1.onSingleLineUpdate_(arg_800_0)
			local var_800_0 = arg_797_1.actors_["1093ui_story"].transform
			local var_800_1 = 0

			if var_800_1 < arg_797_1.time_ and arg_797_1.time_ <= var_800_1 + arg_800_0 then
				arg_797_1.var_.moveOldPos1093ui_story = var_800_0.localPosition
			end

			local var_800_2 = 0.001

			if var_800_1 <= arg_797_1.time_ and arg_797_1.time_ < var_800_1 + var_800_2 then
				local var_800_3 = (arg_797_1.time_ - var_800_1) / var_800_2
				local var_800_4 = Vector3.New(0, -1.11, -5.88)

				var_800_0.localPosition = Vector3.Lerp(arg_797_1.var_.moveOldPos1093ui_story, var_800_4, var_800_3)

				local var_800_5 = manager.ui.mainCamera.transform.position - var_800_0.position

				var_800_0.forward = Vector3.New(var_800_5.x, var_800_5.y, var_800_5.z)

				local var_800_6 = var_800_0.localEulerAngles

				var_800_6.z = 0
				var_800_6.x = 0
				var_800_0.localEulerAngles = var_800_6
			end

			if arg_797_1.time_ >= var_800_1 + var_800_2 and arg_797_1.time_ < var_800_1 + var_800_2 + arg_800_0 then
				var_800_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_800_7 = manager.ui.mainCamera.transform.position - var_800_0.position

				var_800_0.forward = Vector3.New(var_800_7.x, var_800_7.y, var_800_7.z)

				local var_800_8 = var_800_0.localEulerAngles

				var_800_8.z = 0
				var_800_8.x = 0
				var_800_0.localEulerAngles = var_800_8
			end

			local var_800_9 = arg_797_1.actors_["1093ui_story"]
			local var_800_10 = 0

			if var_800_10 < arg_797_1.time_ and arg_797_1.time_ <= var_800_10 + arg_800_0 and not isNil(var_800_9) and arg_797_1.var_.characterEffect1093ui_story == nil then
				arg_797_1.var_.characterEffect1093ui_story = var_800_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_800_11 = 0.200000002980232

			if var_800_10 <= arg_797_1.time_ and arg_797_1.time_ < var_800_10 + var_800_11 and not isNil(var_800_9) then
				local var_800_12 = (arg_797_1.time_ - var_800_10) / var_800_11

				if arg_797_1.var_.characterEffect1093ui_story and not isNil(var_800_9) then
					arg_797_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_797_1.time_ >= var_800_10 + var_800_11 and arg_797_1.time_ < var_800_10 + var_800_11 + arg_800_0 and not isNil(var_800_9) and arg_797_1.var_.characterEffect1093ui_story then
				arg_797_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_800_13 = 0

			if var_800_13 < arg_797_1.time_ and arg_797_1.time_ <= var_800_13 + arg_800_0 then
				arg_797_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_800_14 = 0
			local var_800_15 = 0.5

			if var_800_14 < arg_797_1.time_ and arg_797_1.time_ <= var_800_14 + arg_800_0 then
				arg_797_1.talkMaxDuration = 0
				arg_797_1.dialogCg_.alpha = 1

				arg_797_1.dialog_:SetActive(true)
				SetActive(arg_797_1.leftNameGo_, true)

				local var_800_16 = arg_797_1:FormatText(StoryNameCfg[73].name)

				arg_797_1.leftNameTxt_.text = var_800_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_797_1.leftNameTxt_.transform)

				arg_797_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_797_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_797_1:RecordName(arg_797_1.leftNameTxt_.text)
				SetActive(arg_797_1.iconTrs_.gameObject, false)
				arg_797_1.callingController_:SetSelectedState("normal")

				local var_800_17 = arg_797_1:GetWordFromCfg(1109305201)
				local var_800_18 = arg_797_1:FormatText(var_800_17.content)

				arg_797_1.text_.text = var_800_18

				LuaForUtil.ClearLinePrefixSymbol(arg_797_1.text_)

				local var_800_19 = 20
				local var_800_20 = utf8.len(var_800_18)
				local var_800_21 = var_800_19 <= 0 and var_800_15 or var_800_15 * (var_800_20 / var_800_19)

				if var_800_21 > 0 and var_800_15 < var_800_21 then
					arg_797_1.talkMaxDuration = var_800_21

					if var_800_21 + var_800_14 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_21 + var_800_14
					end
				end

				arg_797_1.text_.text = var_800_18
				arg_797_1.typewritter.percent = 0

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305201", "story_v_side_new_1109305.awb") ~= 0 then
					local var_800_22 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305201", "story_v_side_new_1109305.awb") / 1000

					if var_800_22 + var_800_14 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_22 + var_800_14
					end

					if var_800_17.prefab_name ~= "" and arg_797_1.actors_[var_800_17.prefab_name] ~= nil then
						local var_800_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_797_1.actors_[var_800_17.prefab_name].transform, "story_v_side_new_1109305", "1109305201", "story_v_side_new_1109305.awb")

						arg_797_1:RecordAudio("1109305201", var_800_23)
						arg_797_1:RecordAudio("1109305201", var_800_23)
					else
						arg_797_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305201", "story_v_side_new_1109305.awb")
					end

					arg_797_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305201", "story_v_side_new_1109305.awb")
				end

				arg_797_1:RecordContent(arg_797_1.text_.text)
			end

			local var_800_24 = math.max(var_800_15, arg_797_1.talkMaxDuration)

			if var_800_14 <= arg_797_1.time_ and arg_797_1.time_ < var_800_14 + var_800_24 then
				arg_797_1.typewritter.percent = (arg_797_1.time_ - var_800_14) / var_800_24

				arg_797_1.typewritter:SetDirty()
			end

			if arg_797_1.time_ >= var_800_14 + var_800_24 and arg_797_1.time_ < var_800_14 + var_800_24 + arg_800_0 then
				arg_797_1.typewritter.percent = 1

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305202 = function(arg_801_0, arg_801_1)
		arg_801_1.time_ = 0
		arg_801_1.frameCnt_ = 0
		arg_801_1.state_ = "playing"
		arg_801_1.curTalkId_ = 1109305202
		arg_801_1.duration_ = 5

		SetActive(arg_801_1.tipsGo_, false)

		function arg_801_1.onSingleLineFinish_()
			arg_801_1.onSingleLineUpdate_ = nil
			arg_801_1.onSingleLineFinish_ = nil
			arg_801_1.state_ = "waiting"
		end

		function arg_801_1.playNext_(arg_803_0)
			if arg_803_0 == 1 then
				arg_801_0:Play1109305203(arg_801_1)
			end
		end

		function arg_801_1.onSingleLineUpdate_(arg_804_0)
			local var_804_0 = arg_801_1.actors_["1093ui_story"]
			local var_804_1 = 0

			if var_804_1 < arg_801_1.time_ and arg_801_1.time_ <= var_804_1 + arg_804_0 and not isNil(var_804_0) and arg_801_1.var_.characterEffect1093ui_story == nil then
				arg_801_1.var_.characterEffect1093ui_story = var_804_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_804_2 = 0.200000002980232

			if var_804_1 <= arg_801_1.time_ and arg_801_1.time_ < var_804_1 + var_804_2 and not isNil(var_804_0) then
				local var_804_3 = (arg_801_1.time_ - var_804_1) / var_804_2

				if arg_801_1.var_.characterEffect1093ui_story and not isNil(var_804_0) then
					local var_804_4 = Mathf.Lerp(0, 0.5, var_804_3)

					arg_801_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_801_1.var_.characterEffect1093ui_story.fillRatio = var_804_4
				end
			end

			if arg_801_1.time_ >= var_804_1 + var_804_2 and arg_801_1.time_ < var_804_1 + var_804_2 + arg_804_0 and not isNil(var_804_0) and arg_801_1.var_.characterEffect1093ui_story then
				local var_804_5 = 0.5

				arg_801_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_801_1.var_.characterEffect1093ui_story.fillRatio = var_804_5
			end

			local var_804_6 = 0
			local var_804_7 = 0.4

			if var_804_6 < arg_801_1.time_ and arg_801_1.time_ <= var_804_6 + arg_804_0 then
				arg_801_1.talkMaxDuration = 0
				arg_801_1.dialogCg_.alpha = 1

				arg_801_1.dialog_:SetActive(true)
				SetActive(arg_801_1.leftNameGo_, true)

				local var_804_8 = arg_801_1:FormatText(StoryNameCfg[7].name)

				arg_801_1.leftNameTxt_.text = var_804_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_801_1.leftNameTxt_.transform)

				arg_801_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_801_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_801_1:RecordName(arg_801_1.leftNameTxt_.text)
				SetActive(arg_801_1.iconTrs_.gameObject, false)
				arg_801_1.callingController_:SetSelectedState("normal")

				local var_804_9 = arg_801_1:GetWordFromCfg(1109305202)
				local var_804_10 = arg_801_1:FormatText(var_804_9.content)

				arg_801_1.text_.text = var_804_10

				LuaForUtil.ClearLinePrefixSymbol(arg_801_1.text_)

				local var_804_11 = 16
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
				arg_801_1:RecordContent(arg_801_1.text_.text)
			end

			local var_804_14 = math.max(var_804_7, arg_801_1.talkMaxDuration)

			if var_804_6 <= arg_801_1.time_ and arg_801_1.time_ < var_804_6 + var_804_14 then
				arg_801_1.typewritter.percent = (arg_801_1.time_ - var_804_6) / var_804_14

				arg_801_1.typewritter:SetDirty()
			end

			if arg_801_1.time_ >= var_804_6 + var_804_14 and arg_801_1.time_ < var_804_6 + var_804_14 + arg_804_0 then
				arg_801_1.typewritter.percent = 1

				arg_801_1.typewritter:SetDirty()
				arg_801_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305203 = function(arg_805_0, arg_805_1)
		arg_805_1.time_ = 0
		arg_805_1.frameCnt_ = 0
		arg_805_1.state_ = "playing"
		arg_805_1.curTalkId_ = 1109305203
		arg_805_1.duration_ = 5

		SetActive(arg_805_1.tipsGo_, false)

		function arg_805_1.onSingleLineFinish_()
			arg_805_1.onSingleLineUpdate_ = nil
			arg_805_1.onSingleLineFinish_ = nil
			arg_805_1.state_ = "waiting"
		end

		function arg_805_1.playNext_(arg_807_0)
			if arg_807_0 == 1 then
				arg_805_0:Play1109305204(arg_805_1)
			end
		end

		function arg_805_1.onSingleLineUpdate_(arg_808_0)
			local var_808_0 = arg_805_1.actors_["1093ui_story"].transform
			local var_808_1 = 0

			if var_808_1 < arg_805_1.time_ and arg_805_1.time_ <= var_808_1 + arg_808_0 then
				arg_805_1.var_.moveOldPos1093ui_story = var_808_0.localPosition
			end

			local var_808_2 = 0.001

			if var_808_1 <= arg_805_1.time_ and arg_805_1.time_ < var_808_1 + var_808_2 then
				local var_808_3 = (arg_805_1.time_ - var_808_1) / var_808_2
				local var_808_4 = Vector3.New(0, 100, 0)

				var_808_0.localPosition = Vector3.Lerp(arg_805_1.var_.moveOldPos1093ui_story, var_808_4, var_808_3)

				local var_808_5 = manager.ui.mainCamera.transform.position - var_808_0.position

				var_808_0.forward = Vector3.New(var_808_5.x, var_808_5.y, var_808_5.z)

				local var_808_6 = var_808_0.localEulerAngles

				var_808_6.z = 0
				var_808_6.x = 0
				var_808_0.localEulerAngles = var_808_6
			end

			if arg_805_1.time_ >= var_808_1 + var_808_2 and arg_805_1.time_ < var_808_1 + var_808_2 + arg_808_0 then
				var_808_0.localPosition = Vector3.New(0, 100, 0)

				local var_808_7 = manager.ui.mainCamera.transform.position - var_808_0.position

				var_808_0.forward = Vector3.New(var_808_7.x, var_808_7.y, var_808_7.z)

				local var_808_8 = var_808_0.localEulerAngles

				var_808_8.z = 0
				var_808_8.x = 0
				var_808_0.localEulerAngles = var_808_8
			end

			local var_808_9 = arg_805_1.actors_["1093ui_story"]
			local var_808_10 = 0

			if var_808_10 < arg_805_1.time_ and arg_805_1.time_ <= var_808_10 + arg_808_0 and not isNil(var_808_9) and arg_805_1.var_.characterEffect1093ui_story == nil then
				arg_805_1.var_.characterEffect1093ui_story = var_808_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_808_11 = 0.200000002980232

			if var_808_10 <= arg_805_1.time_ and arg_805_1.time_ < var_808_10 + var_808_11 and not isNil(var_808_9) then
				local var_808_12 = (arg_805_1.time_ - var_808_10) / var_808_11

				if arg_805_1.var_.characterEffect1093ui_story and not isNil(var_808_9) then
					local var_808_13 = Mathf.Lerp(0, 0.5, var_808_12)

					arg_805_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_805_1.var_.characterEffect1093ui_story.fillRatio = var_808_13
				end
			end

			if arg_805_1.time_ >= var_808_10 + var_808_11 and arg_805_1.time_ < var_808_10 + var_808_11 + arg_808_0 and not isNil(var_808_9) and arg_805_1.var_.characterEffect1093ui_story then
				local var_808_14 = 0.5

				arg_805_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_805_1.var_.characterEffect1093ui_story.fillRatio = var_808_14
			end

			local var_808_15 = 0
			local var_808_16 = 0.75

			if var_808_15 < arg_805_1.time_ and arg_805_1.time_ <= var_808_15 + arg_808_0 then
				arg_805_1.talkMaxDuration = 0
				arg_805_1.dialogCg_.alpha = 1

				arg_805_1.dialog_:SetActive(true)
				SetActive(arg_805_1.leftNameGo_, false)

				arg_805_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_805_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_805_1:RecordName(arg_805_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_805_1.iconTrs_.gameObject, false)
				arg_805_1.callingController_:SetSelectedState("normal")

				local var_808_17 = arg_805_1:GetWordFromCfg(1109305203)
				local var_808_18 = arg_805_1:FormatText(var_808_17.content)

				arg_805_1.text_.text = var_808_18

				LuaForUtil.ClearLinePrefixSymbol(arg_805_1.text_)

				local var_808_19 = 30
				local var_808_20 = utf8.len(var_808_18)
				local var_808_21 = var_808_19 <= 0 and var_808_16 or var_808_16 * (var_808_20 / var_808_19)

				if var_808_21 > 0 and var_808_16 < var_808_21 then
					arg_805_1.talkMaxDuration = var_808_21

					if var_808_21 + var_808_15 > arg_805_1.duration_ then
						arg_805_1.duration_ = var_808_21 + var_808_15
					end
				end

				arg_805_1.text_.text = var_808_18
				arg_805_1.typewritter.percent = 0

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(false)
				arg_805_1:RecordContent(arg_805_1.text_.text)
			end

			local var_808_22 = math.max(var_808_16, arg_805_1.talkMaxDuration)

			if var_808_15 <= arg_805_1.time_ and arg_805_1.time_ < var_808_15 + var_808_22 then
				arg_805_1.typewritter.percent = (arg_805_1.time_ - var_808_15) / var_808_22

				arg_805_1.typewritter:SetDirty()
			end

			if arg_805_1.time_ >= var_808_15 + var_808_22 and arg_805_1.time_ < var_808_15 + var_808_22 + arg_808_0 then
				arg_805_1.typewritter.percent = 1

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305204 = function(arg_809_0, arg_809_1)
		arg_809_1.time_ = 0
		arg_809_1.frameCnt_ = 0
		arg_809_1.state_ = "playing"
		arg_809_1.curTalkId_ = 1109305204
		arg_809_1.duration_ = 5

		SetActive(arg_809_1.tipsGo_, false)

		function arg_809_1.onSingleLineFinish_()
			arg_809_1.onSingleLineUpdate_ = nil
			arg_809_1.onSingleLineFinish_ = nil
			arg_809_1.state_ = "waiting"
		end

		function arg_809_1.playNext_(arg_811_0)
			if arg_811_0 == 1 then
				arg_809_0:Play1109305205(arg_809_1)
			end
		end

		function arg_809_1.onSingleLineUpdate_(arg_812_0)
			local var_812_0 = 0
			local var_812_1 = 0.45

			if var_812_0 < arg_809_1.time_ and arg_809_1.time_ <= var_812_0 + arg_812_0 then
				arg_809_1.talkMaxDuration = 0
				arg_809_1.dialogCg_.alpha = 1

				arg_809_1.dialog_:SetActive(true)
				SetActive(arg_809_1.leftNameGo_, true)

				local var_812_2 = arg_809_1:FormatText(StoryNameCfg[7].name)

				arg_809_1.leftNameTxt_.text = var_812_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_809_1.leftNameTxt_.transform)

				arg_809_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_809_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_809_1:RecordName(arg_809_1.leftNameTxt_.text)
				SetActive(arg_809_1.iconTrs_.gameObject, false)
				arg_809_1.callingController_:SetSelectedState("normal")

				local var_812_3 = arg_809_1:GetWordFromCfg(1109305204)
				local var_812_4 = arg_809_1:FormatText(var_812_3.content)

				arg_809_1.text_.text = var_812_4

				LuaForUtil.ClearLinePrefixSymbol(arg_809_1.text_)

				local var_812_5 = 18
				local var_812_6 = utf8.len(var_812_4)
				local var_812_7 = var_812_5 <= 0 and var_812_1 or var_812_1 * (var_812_6 / var_812_5)

				if var_812_7 > 0 and var_812_1 < var_812_7 then
					arg_809_1.talkMaxDuration = var_812_7

					if var_812_7 + var_812_0 > arg_809_1.duration_ then
						arg_809_1.duration_ = var_812_7 + var_812_0
					end
				end

				arg_809_1.text_.text = var_812_4
				arg_809_1.typewritter.percent = 0

				arg_809_1.typewritter:SetDirty()
				arg_809_1:ShowNextGo(false)
				arg_809_1:RecordContent(arg_809_1.text_.text)
			end

			local var_812_8 = math.max(var_812_1, arg_809_1.talkMaxDuration)

			if var_812_0 <= arg_809_1.time_ and arg_809_1.time_ < var_812_0 + var_812_8 then
				arg_809_1.typewritter.percent = (arg_809_1.time_ - var_812_0) / var_812_8

				arg_809_1.typewritter:SetDirty()
			end

			if arg_809_1.time_ >= var_812_0 + var_812_8 and arg_809_1.time_ < var_812_0 + var_812_8 + arg_812_0 then
				arg_809_1.typewritter.percent = 1

				arg_809_1.typewritter:SetDirty()
				arg_809_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305205 = function(arg_813_0, arg_813_1)
		arg_813_1.time_ = 0
		arg_813_1.frameCnt_ = 0
		arg_813_1.state_ = "playing"
		arg_813_1.curTalkId_ = 1109305205
		arg_813_1.duration_ = 7.07

		SetActive(arg_813_1.tipsGo_, false)

		function arg_813_1.onSingleLineFinish_()
			arg_813_1.onSingleLineUpdate_ = nil
			arg_813_1.onSingleLineFinish_ = nil
			arg_813_1.state_ = "waiting"
		end

		function arg_813_1.playNext_(arg_815_0)
			if arg_815_0 == 1 then
				arg_813_0:Play1109305206(arg_813_1)
			end
		end

		function arg_813_1.onSingleLineUpdate_(arg_816_0)
			local var_816_0 = arg_813_1.actors_["1093ui_story"].transform
			local var_816_1 = 0

			if var_816_1 < arg_813_1.time_ and arg_813_1.time_ <= var_816_1 + arg_816_0 then
				arg_813_1.var_.moveOldPos1093ui_story = var_816_0.localPosition
			end

			local var_816_2 = 0.001

			if var_816_1 <= arg_813_1.time_ and arg_813_1.time_ < var_816_1 + var_816_2 then
				local var_816_3 = (arg_813_1.time_ - var_816_1) / var_816_2
				local var_816_4 = Vector3.New(0, -1.11, -5.88)

				var_816_0.localPosition = Vector3.Lerp(arg_813_1.var_.moveOldPos1093ui_story, var_816_4, var_816_3)

				local var_816_5 = manager.ui.mainCamera.transform.position - var_816_0.position

				var_816_0.forward = Vector3.New(var_816_5.x, var_816_5.y, var_816_5.z)

				local var_816_6 = var_816_0.localEulerAngles

				var_816_6.z = 0
				var_816_6.x = 0
				var_816_0.localEulerAngles = var_816_6
			end

			if arg_813_1.time_ >= var_816_1 + var_816_2 and arg_813_1.time_ < var_816_1 + var_816_2 + arg_816_0 then
				var_816_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_816_7 = manager.ui.mainCamera.transform.position - var_816_0.position

				var_816_0.forward = Vector3.New(var_816_7.x, var_816_7.y, var_816_7.z)

				local var_816_8 = var_816_0.localEulerAngles

				var_816_8.z = 0
				var_816_8.x = 0
				var_816_0.localEulerAngles = var_816_8
			end

			local var_816_9 = arg_813_1.actors_["1093ui_story"]
			local var_816_10 = 0

			if var_816_10 < arg_813_1.time_ and arg_813_1.time_ <= var_816_10 + arg_816_0 and not isNil(var_816_9) and arg_813_1.var_.characterEffect1093ui_story == nil then
				arg_813_1.var_.characterEffect1093ui_story = var_816_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_816_11 = 0.200000002980232

			if var_816_10 <= arg_813_1.time_ and arg_813_1.time_ < var_816_10 + var_816_11 and not isNil(var_816_9) then
				local var_816_12 = (arg_813_1.time_ - var_816_10) / var_816_11

				if arg_813_1.var_.characterEffect1093ui_story and not isNil(var_816_9) then
					arg_813_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_813_1.time_ >= var_816_10 + var_816_11 and arg_813_1.time_ < var_816_10 + var_816_11 + arg_816_0 and not isNil(var_816_9) and arg_813_1.var_.characterEffect1093ui_story then
				arg_813_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_816_13 = 0

			if var_816_13 < arg_813_1.time_ and arg_813_1.time_ <= var_816_13 + arg_816_0 then
				arg_813_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action4_2")
			end

			local var_816_14 = 0

			if var_816_14 < arg_813_1.time_ and arg_813_1.time_ <= var_816_14 + arg_816_0 then
				arg_813_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_816_15 = 0
			local var_816_16 = 0.725

			if var_816_15 < arg_813_1.time_ and arg_813_1.time_ <= var_816_15 + arg_816_0 then
				arg_813_1.talkMaxDuration = 0
				arg_813_1.dialogCg_.alpha = 1

				arg_813_1.dialog_:SetActive(true)
				SetActive(arg_813_1.leftNameGo_, true)

				local var_816_17 = arg_813_1:FormatText(StoryNameCfg[73].name)

				arg_813_1.leftNameTxt_.text = var_816_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_813_1.leftNameTxt_.transform)

				arg_813_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_813_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_813_1:RecordName(arg_813_1.leftNameTxt_.text)
				SetActive(arg_813_1.iconTrs_.gameObject, false)
				arg_813_1.callingController_:SetSelectedState("normal")

				local var_816_18 = arg_813_1:GetWordFromCfg(1109305205)
				local var_816_19 = arg_813_1:FormatText(var_816_18.content)

				arg_813_1.text_.text = var_816_19

				LuaForUtil.ClearLinePrefixSymbol(arg_813_1.text_)

				local var_816_20 = 29
				local var_816_21 = utf8.len(var_816_19)
				local var_816_22 = var_816_20 <= 0 and var_816_16 or var_816_16 * (var_816_21 / var_816_20)

				if var_816_22 > 0 and var_816_16 < var_816_22 then
					arg_813_1.talkMaxDuration = var_816_22

					if var_816_22 + var_816_15 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_22 + var_816_15
					end
				end

				arg_813_1.text_.text = var_816_19
				arg_813_1.typewritter.percent = 0

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305205", "story_v_side_new_1109305.awb") ~= 0 then
					local var_816_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305205", "story_v_side_new_1109305.awb") / 1000

					if var_816_23 + var_816_15 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_23 + var_816_15
					end

					if var_816_18.prefab_name ~= "" and arg_813_1.actors_[var_816_18.prefab_name] ~= nil then
						local var_816_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_813_1.actors_[var_816_18.prefab_name].transform, "story_v_side_new_1109305", "1109305205", "story_v_side_new_1109305.awb")

						arg_813_1:RecordAudio("1109305205", var_816_24)
						arg_813_1:RecordAudio("1109305205", var_816_24)
					else
						arg_813_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305205", "story_v_side_new_1109305.awb")
					end

					arg_813_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305205", "story_v_side_new_1109305.awb")
				end

				arg_813_1:RecordContent(arg_813_1.text_.text)
			end

			local var_816_25 = math.max(var_816_16, arg_813_1.talkMaxDuration)

			if var_816_15 <= arg_813_1.time_ and arg_813_1.time_ < var_816_15 + var_816_25 then
				arg_813_1.typewritter.percent = (arg_813_1.time_ - var_816_15) / var_816_25

				arg_813_1.typewritter:SetDirty()
			end

			if arg_813_1.time_ >= var_816_15 + var_816_25 and arg_813_1.time_ < var_816_15 + var_816_25 + arg_816_0 then
				arg_813_1.typewritter.percent = 1

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305206 = function(arg_817_0, arg_817_1)
		arg_817_1.time_ = 0
		arg_817_1.frameCnt_ = 0
		arg_817_1.state_ = "playing"
		arg_817_1.curTalkId_ = 1109305206
		arg_817_1.duration_ = 5

		SetActive(arg_817_1.tipsGo_, false)

		function arg_817_1.onSingleLineFinish_()
			arg_817_1.onSingleLineUpdate_ = nil
			arg_817_1.onSingleLineFinish_ = nil
			arg_817_1.state_ = "waiting"
		end

		function arg_817_1.playNext_(arg_819_0)
			if arg_819_0 == 1 then
				arg_817_0:Play1109305207(arg_817_1)
			end
		end

		function arg_817_1.onSingleLineUpdate_(arg_820_0)
			local var_820_0 = arg_817_1.actors_["1093ui_story"]
			local var_820_1 = 0

			if var_820_1 < arg_817_1.time_ and arg_817_1.time_ <= var_820_1 + arg_820_0 and not isNil(var_820_0) and arg_817_1.var_.characterEffect1093ui_story == nil then
				arg_817_1.var_.characterEffect1093ui_story = var_820_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_820_2 = 0.200000002980232

			if var_820_1 <= arg_817_1.time_ and arg_817_1.time_ < var_820_1 + var_820_2 and not isNil(var_820_0) then
				local var_820_3 = (arg_817_1.time_ - var_820_1) / var_820_2

				if arg_817_1.var_.characterEffect1093ui_story and not isNil(var_820_0) then
					local var_820_4 = Mathf.Lerp(0, 0.5, var_820_3)

					arg_817_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_817_1.var_.characterEffect1093ui_story.fillRatio = var_820_4
				end
			end

			if arg_817_1.time_ >= var_820_1 + var_820_2 and arg_817_1.time_ < var_820_1 + var_820_2 + arg_820_0 and not isNil(var_820_0) and arg_817_1.var_.characterEffect1093ui_story then
				local var_820_5 = 0.5

				arg_817_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_817_1.var_.characterEffect1093ui_story.fillRatio = var_820_5
			end

			local var_820_6 = 0
			local var_820_7 = 0.225

			if var_820_6 < arg_817_1.time_ and arg_817_1.time_ <= var_820_6 + arg_820_0 then
				arg_817_1.talkMaxDuration = 0
				arg_817_1.dialogCg_.alpha = 1

				arg_817_1.dialog_:SetActive(true)
				SetActive(arg_817_1.leftNameGo_, true)

				local var_820_8 = arg_817_1:FormatText(StoryNameCfg[7].name)

				arg_817_1.leftNameTxt_.text = var_820_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_817_1.leftNameTxt_.transform)

				arg_817_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_817_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_817_1:RecordName(arg_817_1.leftNameTxt_.text)
				SetActive(arg_817_1.iconTrs_.gameObject, false)
				arg_817_1.callingController_:SetSelectedState("normal")

				local var_820_9 = arg_817_1:GetWordFromCfg(1109305206)
				local var_820_10 = arg_817_1:FormatText(var_820_9.content)

				arg_817_1.text_.text = var_820_10

				LuaForUtil.ClearLinePrefixSymbol(arg_817_1.text_)

				local var_820_11 = 9
				local var_820_12 = utf8.len(var_820_10)
				local var_820_13 = var_820_11 <= 0 and var_820_7 or var_820_7 * (var_820_12 / var_820_11)

				if var_820_13 > 0 and var_820_7 < var_820_13 then
					arg_817_1.talkMaxDuration = var_820_13

					if var_820_13 + var_820_6 > arg_817_1.duration_ then
						arg_817_1.duration_ = var_820_13 + var_820_6
					end
				end

				arg_817_1.text_.text = var_820_10
				arg_817_1.typewritter.percent = 0

				arg_817_1.typewritter:SetDirty()
				arg_817_1:ShowNextGo(false)
				arg_817_1:RecordContent(arg_817_1.text_.text)
			end

			local var_820_14 = math.max(var_820_7, arg_817_1.talkMaxDuration)

			if var_820_6 <= arg_817_1.time_ and arg_817_1.time_ < var_820_6 + var_820_14 then
				arg_817_1.typewritter.percent = (arg_817_1.time_ - var_820_6) / var_820_14

				arg_817_1.typewritter:SetDirty()
			end

			if arg_817_1.time_ >= var_820_6 + var_820_14 and arg_817_1.time_ < var_820_6 + var_820_14 + arg_820_0 then
				arg_817_1.typewritter.percent = 1

				arg_817_1.typewritter:SetDirty()
				arg_817_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305207 = function(arg_821_0, arg_821_1)
		arg_821_1.time_ = 0
		arg_821_1.frameCnt_ = 0
		arg_821_1.state_ = "playing"
		arg_821_1.curTalkId_ = 1109305207
		arg_821_1.duration_ = 1.37

		SetActive(arg_821_1.tipsGo_, false)

		function arg_821_1.onSingleLineFinish_()
			arg_821_1.onSingleLineUpdate_ = nil
			arg_821_1.onSingleLineFinish_ = nil
			arg_821_1.state_ = "waiting"
		end

		function arg_821_1.playNext_(arg_823_0)
			if arg_823_0 == 1 then
				arg_821_0:Play1109305208(arg_821_1)
			end
		end

		function arg_821_1.onSingleLineUpdate_(arg_824_0)
			local var_824_0 = arg_821_1.actors_["1093ui_story"]
			local var_824_1 = 0

			if var_824_1 < arg_821_1.time_ and arg_821_1.time_ <= var_824_1 + arg_824_0 and not isNil(var_824_0) and arg_821_1.var_.characterEffect1093ui_story == nil then
				arg_821_1.var_.characterEffect1093ui_story = var_824_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_824_2 = 0.200000002980232

			if var_824_1 <= arg_821_1.time_ and arg_821_1.time_ < var_824_1 + var_824_2 and not isNil(var_824_0) then
				local var_824_3 = (arg_821_1.time_ - var_824_1) / var_824_2

				if arg_821_1.var_.characterEffect1093ui_story and not isNil(var_824_0) then
					arg_821_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_821_1.time_ >= var_824_1 + var_824_2 and arg_821_1.time_ < var_824_1 + var_824_2 + arg_824_0 and not isNil(var_824_0) and arg_821_1.var_.characterEffect1093ui_story then
				arg_821_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_824_4 = 0
			local var_824_5 = 0.125

			if var_824_4 < arg_821_1.time_ and arg_821_1.time_ <= var_824_4 + arg_824_0 then
				arg_821_1.talkMaxDuration = 0
				arg_821_1.dialogCg_.alpha = 1

				arg_821_1.dialog_:SetActive(true)
				SetActive(arg_821_1.leftNameGo_, true)

				local var_824_6 = arg_821_1:FormatText(StoryNameCfg[73].name)

				arg_821_1.leftNameTxt_.text = var_824_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_821_1.leftNameTxt_.transform)

				arg_821_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_821_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_821_1:RecordName(arg_821_1.leftNameTxt_.text)
				SetActive(arg_821_1.iconTrs_.gameObject, false)
				arg_821_1.callingController_:SetSelectedState("normal")

				local var_824_7 = arg_821_1:GetWordFromCfg(1109305207)
				local var_824_8 = arg_821_1:FormatText(var_824_7.content)

				arg_821_1.text_.text = var_824_8

				LuaForUtil.ClearLinePrefixSymbol(arg_821_1.text_)

				local var_824_9 = 5
				local var_824_10 = utf8.len(var_824_8)
				local var_824_11 = var_824_9 <= 0 and var_824_5 or var_824_5 * (var_824_10 / var_824_9)

				if var_824_11 > 0 and var_824_5 < var_824_11 then
					arg_821_1.talkMaxDuration = var_824_11

					if var_824_11 + var_824_4 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_11 + var_824_4
					end
				end

				arg_821_1.text_.text = var_824_8
				arg_821_1.typewritter.percent = 0

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305207", "story_v_side_new_1109305.awb") ~= 0 then
					local var_824_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305207", "story_v_side_new_1109305.awb") / 1000

					if var_824_12 + var_824_4 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_12 + var_824_4
					end

					if var_824_7.prefab_name ~= "" and arg_821_1.actors_[var_824_7.prefab_name] ~= nil then
						local var_824_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_821_1.actors_[var_824_7.prefab_name].transform, "story_v_side_new_1109305", "1109305207", "story_v_side_new_1109305.awb")

						arg_821_1:RecordAudio("1109305207", var_824_13)
						arg_821_1:RecordAudio("1109305207", var_824_13)
					else
						arg_821_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305207", "story_v_side_new_1109305.awb")
					end

					arg_821_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305207", "story_v_side_new_1109305.awb")
				end

				arg_821_1:RecordContent(arg_821_1.text_.text)
			end

			local var_824_14 = math.max(var_824_5, arg_821_1.talkMaxDuration)

			if var_824_4 <= arg_821_1.time_ and arg_821_1.time_ < var_824_4 + var_824_14 then
				arg_821_1.typewritter.percent = (arg_821_1.time_ - var_824_4) / var_824_14

				arg_821_1.typewritter:SetDirty()
			end

			if arg_821_1.time_ >= var_824_4 + var_824_14 and arg_821_1.time_ < var_824_4 + var_824_14 + arg_824_0 then
				arg_821_1.typewritter.percent = 1

				arg_821_1.typewritter:SetDirty()
				arg_821_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305208 = function(arg_825_0, arg_825_1)
		arg_825_1.time_ = 0
		arg_825_1.frameCnt_ = 0
		arg_825_1.state_ = "playing"
		arg_825_1.curTalkId_ = 1109305208
		arg_825_1.duration_ = 5

		SetActive(arg_825_1.tipsGo_, false)

		function arg_825_1.onSingleLineFinish_()
			arg_825_1.onSingleLineUpdate_ = nil
			arg_825_1.onSingleLineFinish_ = nil
			arg_825_1.state_ = "waiting"
		end

		function arg_825_1.playNext_(arg_827_0)
			if arg_827_0 == 1 then
				arg_825_0:Play1109305209(arg_825_1)
			end
		end

		function arg_825_1.onSingleLineUpdate_(arg_828_0)
			local var_828_0 = arg_825_1.actors_["1093ui_story"]
			local var_828_1 = 0

			if var_828_1 < arg_825_1.time_ and arg_825_1.time_ <= var_828_1 + arg_828_0 and not isNil(var_828_0) and arg_825_1.var_.characterEffect1093ui_story == nil then
				arg_825_1.var_.characterEffect1093ui_story = var_828_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_828_2 = 0.200000002980232

			if var_828_1 <= arg_825_1.time_ and arg_825_1.time_ < var_828_1 + var_828_2 and not isNil(var_828_0) then
				local var_828_3 = (arg_825_1.time_ - var_828_1) / var_828_2

				if arg_825_1.var_.characterEffect1093ui_story and not isNil(var_828_0) then
					local var_828_4 = Mathf.Lerp(0, 0.5, var_828_3)

					arg_825_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_825_1.var_.characterEffect1093ui_story.fillRatio = var_828_4
				end
			end

			if arg_825_1.time_ >= var_828_1 + var_828_2 and arg_825_1.time_ < var_828_1 + var_828_2 + arg_828_0 and not isNil(var_828_0) and arg_825_1.var_.characterEffect1093ui_story then
				local var_828_5 = 0.5

				arg_825_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_825_1.var_.characterEffect1093ui_story.fillRatio = var_828_5
			end

			local var_828_6 = 0
			local var_828_7 = 0.825

			if var_828_6 < arg_825_1.time_ and arg_825_1.time_ <= var_828_6 + arg_828_0 then
				arg_825_1.talkMaxDuration = 0
				arg_825_1.dialogCg_.alpha = 1

				arg_825_1.dialog_:SetActive(true)
				SetActive(arg_825_1.leftNameGo_, true)

				local var_828_8 = arg_825_1:FormatText(StoryNameCfg[7].name)

				arg_825_1.leftNameTxt_.text = var_828_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_825_1.leftNameTxt_.transform)

				arg_825_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_825_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_825_1:RecordName(arg_825_1.leftNameTxt_.text)
				SetActive(arg_825_1.iconTrs_.gameObject, false)
				arg_825_1.callingController_:SetSelectedState("normal")

				local var_828_9 = arg_825_1:GetWordFromCfg(1109305208)
				local var_828_10 = arg_825_1:FormatText(var_828_9.content)

				arg_825_1.text_.text = var_828_10

				LuaForUtil.ClearLinePrefixSymbol(arg_825_1.text_)

				local var_828_11 = 33
				local var_828_12 = utf8.len(var_828_10)
				local var_828_13 = var_828_11 <= 0 and var_828_7 or var_828_7 * (var_828_12 / var_828_11)

				if var_828_13 > 0 and var_828_7 < var_828_13 then
					arg_825_1.talkMaxDuration = var_828_13

					if var_828_13 + var_828_6 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_13 + var_828_6
					end
				end

				arg_825_1.text_.text = var_828_10
				arg_825_1.typewritter.percent = 0

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(false)
				arg_825_1:RecordContent(arg_825_1.text_.text)
			end

			local var_828_14 = math.max(var_828_7, arg_825_1.talkMaxDuration)

			if var_828_6 <= arg_825_1.time_ and arg_825_1.time_ < var_828_6 + var_828_14 then
				arg_825_1.typewritter.percent = (arg_825_1.time_ - var_828_6) / var_828_14

				arg_825_1.typewritter:SetDirty()
			end

			if arg_825_1.time_ >= var_828_6 + var_828_14 and arg_825_1.time_ < var_828_6 + var_828_14 + arg_828_0 then
				arg_825_1.typewritter.percent = 1

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305209 = function(arg_829_0, arg_829_1)
		arg_829_1.time_ = 0
		arg_829_1.frameCnt_ = 0
		arg_829_1.state_ = "playing"
		arg_829_1.curTalkId_ = 1109305209
		arg_829_1.duration_ = 5

		SetActive(arg_829_1.tipsGo_, false)

		function arg_829_1.onSingleLineFinish_()
			arg_829_1.onSingleLineUpdate_ = nil
			arg_829_1.onSingleLineFinish_ = nil
			arg_829_1.state_ = "waiting"
		end

		function arg_829_1.playNext_(arg_831_0)
			if arg_831_0 == 1 then
				arg_829_0:Play1109305210(arg_829_1)
			end
		end

		function arg_829_1.onSingleLineUpdate_(arg_832_0)
			local var_832_0 = 0
			local var_832_1 = 1.125

			if var_832_0 < arg_829_1.time_ and arg_829_1.time_ <= var_832_0 + arg_832_0 then
				arg_829_1.talkMaxDuration = 0
				arg_829_1.dialogCg_.alpha = 1

				arg_829_1.dialog_:SetActive(true)
				SetActive(arg_829_1.leftNameGo_, true)

				local var_832_2 = arg_829_1:FormatText(StoryNameCfg[7].name)

				arg_829_1.leftNameTxt_.text = var_832_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_829_1.leftNameTxt_.transform)

				arg_829_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_829_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_829_1:RecordName(arg_829_1.leftNameTxt_.text)
				SetActive(arg_829_1.iconTrs_.gameObject, false)
				arg_829_1.callingController_:SetSelectedState("normal")

				local var_832_3 = arg_829_1:GetWordFromCfg(1109305209)
				local var_832_4 = arg_829_1:FormatText(var_832_3.content)

				arg_829_1.text_.text = var_832_4

				LuaForUtil.ClearLinePrefixSymbol(arg_829_1.text_)

				local var_832_5 = 45
				local var_832_6 = utf8.len(var_832_4)
				local var_832_7 = var_832_5 <= 0 and var_832_1 or var_832_1 * (var_832_6 / var_832_5)

				if var_832_7 > 0 and var_832_1 < var_832_7 then
					arg_829_1.talkMaxDuration = var_832_7

					if var_832_7 + var_832_0 > arg_829_1.duration_ then
						arg_829_1.duration_ = var_832_7 + var_832_0
					end
				end

				arg_829_1.text_.text = var_832_4
				arg_829_1.typewritter.percent = 0

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(false)
				arg_829_1:RecordContent(arg_829_1.text_.text)
			end

			local var_832_8 = math.max(var_832_1, arg_829_1.talkMaxDuration)

			if var_832_0 <= arg_829_1.time_ and arg_829_1.time_ < var_832_0 + var_832_8 then
				arg_829_1.typewritter.percent = (arg_829_1.time_ - var_832_0) / var_832_8

				arg_829_1.typewritter:SetDirty()
			end

			if arg_829_1.time_ >= var_832_0 + var_832_8 and arg_829_1.time_ < var_832_0 + var_832_8 + arg_832_0 then
				arg_829_1.typewritter.percent = 1

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305210 = function(arg_833_0, arg_833_1)
		arg_833_1.time_ = 0
		arg_833_1.frameCnt_ = 0
		arg_833_1.state_ = "playing"
		arg_833_1.curTalkId_ = 1109305210
		arg_833_1.duration_ = 7.7

		SetActive(arg_833_1.tipsGo_, false)

		function arg_833_1.onSingleLineFinish_()
			arg_833_1.onSingleLineUpdate_ = nil
			arg_833_1.onSingleLineFinish_ = nil
			arg_833_1.state_ = "waiting"
		end

		function arg_833_1.playNext_(arg_835_0)
			if arg_835_0 == 1 then
				arg_833_0:Play1109305211(arg_833_1)
			end
		end

		function arg_833_1.onSingleLineUpdate_(arg_836_0)
			local var_836_0 = arg_833_1.actors_["1093ui_story"].transform
			local var_836_1 = 0

			if var_836_1 < arg_833_1.time_ and arg_833_1.time_ <= var_836_1 + arg_836_0 then
				arg_833_1.var_.moveOldPos1093ui_story = var_836_0.localPosition
			end

			local var_836_2 = 0.001

			if var_836_1 <= arg_833_1.time_ and arg_833_1.time_ < var_836_1 + var_836_2 then
				local var_836_3 = (arg_833_1.time_ - var_836_1) / var_836_2
				local var_836_4 = Vector3.New(0, -1.11, -5.88)

				var_836_0.localPosition = Vector3.Lerp(arg_833_1.var_.moveOldPos1093ui_story, var_836_4, var_836_3)

				local var_836_5 = manager.ui.mainCamera.transform.position - var_836_0.position

				var_836_0.forward = Vector3.New(var_836_5.x, var_836_5.y, var_836_5.z)

				local var_836_6 = var_836_0.localEulerAngles

				var_836_6.z = 0
				var_836_6.x = 0
				var_836_0.localEulerAngles = var_836_6
			end

			if arg_833_1.time_ >= var_836_1 + var_836_2 and arg_833_1.time_ < var_836_1 + var_836_2 + arg_836_0 then
				var_836_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_836_7 = manager.ui.mainCamera.transform.position - var_836_0.position

				var_836_0.forward = Vector3.New(var_836_7.x, var_836_7.y, var_836_7.z)

				local var_836_8 = var_836_0.localEulerAngles

				var_836_8.z = 0
				var_836_8.x = 0
				var_836_0.localEulerAngles = var_836_8
			end

			local var_836_9 = arg_833_1.actors_["1093ui_story"]
			local var_836_10 = 0

			if var_836_10 < arg_833_1.time_ and arg_833_1.time_ <= var_836_10 + arg_836_0 and not isNil(var_836_9) and arg_833_1.var_.characterEffect1093ui_story == nil then
				arg_833_1.var_.characterEffect1093ui_story = var_836_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_836_11 = 0.200000002980232

			if var_836_10 <= arg_833_1.time_ and arg_833_1.time_ < var_836_10 + var_836_11 and not isNil(var_836_9) then
				local var_836_12 = (arg_833_1.time_ - var_836_10) / var_836_11

				if arg_833_1.var_.characterEffect1093ui_story and not isNil(var_836_9) then
					arg_833_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_833_1.time_ >= var_836_10 + var_836_11 and arg_833_1.time_ < var_836_10 + var_836_11 + arg_836_0 and not isNil(var_836_9) and arg_833_1.var_.characterEffect1093ui_story then
				arg_833_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_836_13 = 0

			if var_836_13 < arg_833_1.time_ and arg_833_1.time_ <= var_836_13 + arg_836_0 then
				arg_833_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action7_1")
			end

			local var_836_14 = 0

			if var_836_14 < arg_833_1.time_ and arg_833_1.time_ <= var_836_14 + arg_836_0 then
				arg_833_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_833_1.frameCnt_ <= 1 then
				arg_833_1.dialog_:SetActive(false)
			end

			local var_836_15 = 0.466666666666667
			local var_836_16 = 0.825

			if var_836_15 < arg_833_1.time_ and arg_833_1.time_ <= var_836_15 + arg_836_0 then
				arg_833_1.talkMaxDuration = 0

				arg_833_1.dialog_:SetActive(true)

				local var_836_17 = LeanTween.value(arg_833_1.dialog_, 0, 1, 0.3)

				var_836_17:setOnUpdate(LuaHelper.FloatAction(function(arg_837_0)
					arg_833_1.dialogCg_.alpha = arg_837_0
				end))
				var_836_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_833_1.dialog_)
					var_836_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_833_1.duration_ = arg_833_1.duration_ + 0.3

				SetActive(arg_833_1.leftNameGo_, true)

				local var_836_18 = arg_833_1:FormatText(StoryNameCfg[73].name)

				arg_833_1.leftNameTxt_.text = var_836_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_833_1.leftNameTxt_.transform)

				arg_833_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_833_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_833_1:RecordName(arg_833_1.leftNameTxt_.text)
				SetActive(arg_833_1.iconTrs_.gameObject, false)
				arg_833_1.callingController_:SetSelectedState("normal")

				local var_836_19 = arg_833_1:GetWordFromCfg(1109305210)
				local var_836_20 = arg_833_1:FormatText(var_836_19.content)

				arg_833_1.text_.text = var_836_20

				LuaForUtil.ClearLinePrefixSymbol(arg_833_1.text_)

				local var_836_21 = 33
				local var_836_22 = utf8.len(var_836_20)
				local var_836_23 = var_836_21 <= 0 and var_836_16 or var_836_16 * (var_836_22 / var_836_21)

				if var_836_23 > 0 and var_836_16 < var_836_23 then
					arg_833_1.talkMaxDuration = var_836_23
					var_836_15 = var_836_15 + 0.3

					if var_836_23 + var_836_15 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_23 + var_836_15
					end
				end

				arg_833_1.text_.text = var_836_20
				arg_833_1.typewritter.percent = 0

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305210", "story_v_side_new_1109305.awb") ~= 0 then
					local var_836_24 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305210", "story_v_side_new_1109305.awb") / 1000

					if var_836_24 + var_836_15 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_24 + var_836_15
					end

					if var_836_19.prefab_name ~= "" and arg_833_1.actors_[var_836_19.prefab_name] ~= nil then
						local var_836_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_833_1.actors_[var_836_19.prefab_name].transform, "story_v_side_new_1109305", "1109305210", "story_v_side_new_1109305.awb")

						arg_833_1:RecordAudio("1109305210", var_836_25)
						arg_833_1:RecordAudio("1109305210", var_836_25)
					else
						arg_833_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305210", "story_v_side_new_1109305.awb")
					end

					arg_833_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305210", "story_v_side_new_1109305.awb")
				end

				arg_833_1:RecordContent(arg_833_1.text_.text)
			end

			local var_836_26 = var_836_15 + 0.3
			local var_836_27 = math.max(var_836_16, arg_833_1.talkMaxDuration)

			if var_836_26 <= arg_833_1.time_ and arg_833_1.time_ < var_836_26 + var_836_27 then
				arg_833_1.typewritter.percent = (arg_833_1.time_ - var_836_26) / var_836_27

				arg_833_1.typewritter:SetDirty()
			end

			if arg_833_1.time_ >= var_836_26 + var_836_27 and arg_833_1.time_ < var_836_26 + var_836_27 + arg_836_0 then
				arg_833_1.typewritter.percent = 1

				arg_833_1.typewritter:SetDirty()
				arg_833_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305211 = function(arg_839_0, arg_839_1)
		arg_839_1.time_ = 0
		arg_839_1.frameCnt_ = 0
		arg_839_1.state_ = "playing"
		arg_839_1.curTalkId_ = 1109305211
		arg_839_1.duration_ = 5

		SetActive(arg_839_1.tipsGo_, false)

		function arg_839_1.onSingleLineFinish_()
			arg_839_1.onSingleLineUpdate_ = nil
			arg_839_1.onSingleLineFinish_ = nil
			arg_839_1.state_ = "waiting"
		end

		function arg_839_1.playNext_(arg_841_0)
			if arg_841_0 == 1 then
				arg_839_0:Play1109305212(arg_839_1)
			end
		end

		function arg_839_1.onSingleLineUpdate_(arg_842_0)
			local var_842_0 = arg_839_1.actors_["1093ui_story"]
			local var_842_1 = 0

			if var_842_1 < arg_839_1.time_ and arg_839_1.time_ <= var_842_1 + arg_842_0 and not isNil(var_842_0) and arg_839_1.var_.characterEffect1093ui_story == nil then
				arg_839_1.var_.characterEffect1093ui_story = var_842_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_842_2 = 0.200000002980232

			if var_842_1 <= arg_839_1.time_ and arg_839_1.time_ < var_842_1 + var_842_2 and not isNil(var_842_0) then
				local var_842_3 = (arg_839_1.time_ - var_842_1) / var_842_2

				if arg_839_1.var_.characterEffect1093ui_story and not isNil(var_842_0) then
					local var_842_4 = Mathf.Lerp(0, 0.5, var_842_3)

					arg_839_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_839_1.var_.characterEffect1093ui_story.fillRatio = var_842_4
				end
			end

			if arg_839_1.time_ >= var_842_1 + var_842_2 and arg_839_1.time_ < var_842_1 + var_842_2 + arg_842_0 and not isNil(var_842_0) and arg_839_1.var_.characterEffect1093ui_story then
				local var_842_5 = 0.5

				arg_839_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_839_1.var_.characterEffect1093ui_story.fillRatio = var_842_5
			end

			local var_842_6 = 0
			local var_842_7 = 0.65

			if var_842_6 < arg_839_1.time_ and arg_839_1.time_ <= var_842_6 + arg_842_0 then
				arg_839_1.talkMaxDuration = 0
				arg_839_1.dialogCg_.alpha = 1

				arg_839_1.dialog_:SetActive(true)
				SetActive(arg_839_1.leftNameGo_, true)

				local var_842_8 = arg_839_1:FormatText(StoryNameCfg[7].name)

				arg_839_1.leftNameTxt_.text = var_842_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_839_1.leftNameTxt_.transform)

				arg_839_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_839_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_839_1:RecordName(arg_839_1.leftNameTxt_.text)
				SetActive(arg_839_1.iconTrs_.gameObject, false)
				arg_839_1.callingController_:SetSelectedState("normal")

				local var_842_9 = arg_839_1:GetWordFromCfg(1109305211)
				local var_842_10 = arg_839_1:FormatText(var_842_9.content)

				arg_839_1.text_.text = var_842_10

				LuaForUtil.ClearLinePrefixSymbol(arg_839_1.text_)

				local var_842_11 = 26
				local var_842_12 = utf8.len(var_842_10)
				local var_842_13 = var_842_11 <= 0 and var_842_7 or var_842_7 * (var_842_12 / var_842_11)

				if var_842_13 > 0 and var_842_7 < var_842_13 then
					arg_839_1.talkMaxDuration = var_842_13

					if var_842_13 + var_842_6 > arg_839_1.duration_ then
						arg_839_1.duration_ = var_842_13 + var_842_6
					end
				end

				arg_839_1.text_.text = var_842_10
				arg_839_1.typewritter.percent = 0

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(false)
				arg_839_1:RecordContent(arg_839_1.text_.text)
			end

			local var_842_14 = math.max(var_842_7, arg_839_1.talkMaxDuration)

			if var_842_6 <= arg_839_1.time_ and arg_839_1.time_ < var_842_6 + var_842_14 then
				arg_839_1.typewritter.percent = (arg_839_1.time_ - var_842_6) / var_842_14

				arg_839_1.typewritter:SetDirty()
			end

			if arg_839_1.time_ >= var_842_6 + var_842_14 and arg_839_1.time_ < var_842_6 + var_842_14 + arg_842_0 then
				arg_839_1.typewritter.percent = 1

				arg_839_1.typewritter:SetDirty()
				arg_839_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305212 = function(arg_843_0, arg_843_1)
		arg_843_1.time_ = 0
		arg_843_1.frameCnt_ = 0
		arg_843_1.state_ = "playing"
		arg_843_1.curTalkId_ = 1109305212
		arg_843_1.duration_ = 5

		SetActive(arg_843_1.tipsGo_, false)

		function arg_843_1.onSingleLineFinish_()
			arg_843_1.onSingleLineUpdate_ = nil
			arg_843_1.onSingleLineFinish_ = nil
			arg_843_1.state_ = "waiting"
		end

		function arg_843_1.playNext_(arg_845_0)
			if arg_845_0 == 1 then
				arg_843_0:Play1109305213(arg_843_1)
			end
		end

		function arg_843_1.onSingleLineUpdate_(arg_846_0)
			local var_846_0 = arg_843_1.actors_["1093ui_story"].transform
			local var_846_1 = 0

			if var_846_1 < arg_843_1.time_ and arg_843_1.time_ <= var_846_1 + arg_846_0 then
				arg_843_1.var_.moveOldPos1093ui_story = var_846_0.localPosition
			end

			local var_846_2 = 0.001

			if var_846_1 <= arg_843_1.time_ and arg_843_1.time_ < var_846_1 + var_846_2 then
				local var_846_3 = (arg_843_1.time_ - var_846_1) / var_846_2
				local var_846_4 = Vector3.New(0, 100, 0)

				var_846_0.localPosition = Vector3.Lerp(arg_843_1.var_.moveOldPos1093ui_story, var_846_4, var_846_3)

				local var_846_5 = manager.ui.mainCamera.transform.position - var_846_0.position

				var_846_0.forward = Vector3.New(var_846_5.x, var_846_5.y, var_846_5.z)

				local var_846_6 = var_846_0.localEulerAngles

				var_846_6.z = 0
				var_846_6.x = 0
				var_846_0.localEulerAngles = var_846_6
			end

			if arg_843_1.time_ >= var_846_1 + var_846_2 and arg_843_1.time_ < var_846_1 + var_846_2 + arg_846_0 then
				var_846_0.localPosition = Vector3.New(0, 100, 0)

				local var_846_7 = manager.ui.mainCamera.transform.position - var_846_0.position

				var_846_0.forward = Vector3.New(var_846_7.x, var_846_7.y, var_846_7.z)

				local var_846_8 = var_846_0.localEulerAngles

				var_846_8.z = 0
				var_846_8.x = 0
				var_846_0.localEulerAngles = var_846_8
			end

			local var_846_9 = 0
			local var_846_10 = 0.575

			if var_846_9 < arg_843_1.time_ and arg_843_1.time_ <= var_846_9 + arg_846_0 then
				arg_843_1.talkMaxDuration = 0
				arg_843_1.dialogCg_.alpha = 1

				arg_843_1.dialog_:SetActive(true)
				SetActive(arg_843_1.leftNameGo_, false)

				arg_843_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_843_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_843_1:RecordName(arg_843_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_843_1.iconTrs_.gameObject, false)
				arg_843_1.callingController_:SetSelectedState("normal")

				local var_846_11 = arg_843_1:GetWordFromCfg(1109305212)
				local var_846_12 = arg_843_1:FormatText(var_846_11.content)

				arg_843_1.text_.text = var_846_12

				LuaForUtil.ClearLinePrefixSymbol(arg_843_1.text_)

				local var_846_13 = 23
				local var_846_14 = utf8.len(var_846_12)
				local var_846_15 = var_846_13 <= 0 and var_846_10 or var_846_10 * (var_846_14 / var_846_13)

				if var_846_15 > 0 and var_846_10 < var_846_15 then
					arg_843_1.talkMaxDuration = var_846_15

					if var_846_15 + var_846_9 > arg_843_1.duration_ then
						arg_843_1.duration_ = var_846_15 + var_846_9
					end
				end

				arg_843_1.text_.text = var_846_12
				arg_843_1.typewritter.percent = 0

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(false)
				arg_843_1:RecordContent(arg_843_1.text_.text)
			end

			local var_846_16 = math.max(var_846_10, arg_843_1.talkMaxDuration)

			if var_846_9 <= arg_843_1.time_ and arg_843_1.time_ < var_846_9 + var_846_16 then
				arg_843_1.typewritter.percent = (arg_843_1.time_ - var_846_9) / var_846_16

				arg_843_1.typewritter:SetDirty()
			end

			if arg_843_1.time_ >= var_846_9 + var_846_16 and arg_843_1.time_ < var_846_9 + var_846_16 + arg_846_0 then
				arg_843_1.typewritter.percent = 1

				arg_843_1.typewritter:SetDirty()
				arg_843_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305213 = function(arg_847_0, arg_847_1)
		arg_847_1.time_ = 0
		arg_847_1.frameCnt_ = 0
		arg_847_1.state_ = "playing"
		arg_847_1.curTalkId_ = 1109305213
		arg_847_1.duration_ = 3.67

		SetActive(arg_847_1.tipsGo_, false)

		function arg_847_1.onSingleLineFinish_()
			arg_847_1.onSingleLineUpdate_ = nil
			arg_847_1.onSingleLineFinish_ = nil
			arg_847_1.state_ = "waiting"
		end

		function arg_847_1.playNext_(arg_849_0)
			if arg_849_0 == 1 then
				arg_847_0:Play1109305214(arg_847_1)
			end
		end

		function arg_847_1.onSingleLineUpdate_(arg_850_0)
			local var_850_0 = arg_847_1.actors_["1093ui_story"].transform
			local var_850_1 = 0

			if var_850_1 < arg_847_1.time_ and arg_847_1.time_ <= var_850_1 + arg_850_0 then
				arg_847_1.var_.moveOldPos1093ui_story = var_850_0.localPosition
			end

			local var_850_2 = 0.001

			if var_850_1 <= arg_847_1.time_ and arg_847_1.time_ < var_850_1 + var_850_2 then
				local var_850_3 = (arg_847_1.time_ - var_850_1) / var_850_2
				local var_850_4 = Vector3.New(0, -1.11, -5.88)

				var_850_0.localPosition = Vector3.Lerp(arg_847_1.var_.moveOldPos1093ui_story, var_850_4, var_850_3)

				local var_850_5 = manager.ui.mainCamera.transform.position - var_850_0.position

				var_850_0.forward = Vector3.New(var_850_5.x, var_850_5.y, var_850_5.z)

				local var_850_6 = var_850_0.localEulerAngles

				var_850_6.z = 0
				var_850_6.x = 0
				var_850_0.localEulerAngles = var_850_6
			end

			if arg_847_1.time_ >= var_850_1 + var_850_2 and arg_847_1.time_ < var_850_1 + var_850_2 + arg_850_0 then
				var_850_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_850_7 = manager.ui.mainCamera.transform.position - var_850_0.position

				var_850_0.forward = Vector3.New(var_850_7.x, var_850_7.y, var_850_7.z)

				local var_850_8 = var_850_0.localEulerAngles

				var_850_8.z = 0
				var_850_8.x = 0
				var_850_0.localEulerAngles = var_850_8
			end

			local var_850_9 = arg_847_1.actors_["1093ui_story"]
			local var_850_10 = 0

			if var_850_10 < arg_847_1.time_ and arg_847_1.time_ <= var_850_10 + arg_850_0 and not isNil(var_850_9) and arg_847_1.var_.characterEffect1093ui_story == nil then
				arg_847_1.var_.characterEffect1093ui_story = var_850_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_850_11 = 0.200000002980232

			if var_850_10 <= arg_847_1.time_ and arg_847_1.time_ < var_850_10 + var_850_11 and not isNil(var_850_9) then
				local var_850_12 = (arg_847_1.time_ - var_850_10) / var_850_11

				if arg_847_1.var_.characterEffect1093ui_story and not isNil(var_850_9) then
					arg_847_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_847_1.time_ >= var_850_10 + var_850_11 and arg_847_1.time_ < var_850_10 + var_850_11 + arg_850_0 and not isNil(var_850_9) and arg_847_1.var_.characterEffect1093ui_story then
				arg_847_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_850_13 = 0

			if var_850_13 < arg_847_1.time_ and arg_847_1.time_ <= var_850_13 + arg_850_0 then
				arg_847_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093actionlink/1093action479")
			end

			local var_850_14 = 0

			if var_850_14 < arg_847_1.time_ and arg_847_1.time_ <= var_850_14 + arg_850_0 then
				arg_847_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_850_15 = 0
			local var_850_16 = 0.45

			if var_850_15 < arg_847_1.time_ and arg_847_1.time_ <= var_850_15 + arg_850_0 then
				arg_847_1.talkMaxDuration = 0
				arg_847_1.dialogCg_.alpha = 1

				arg_847_1.dialog_:SetActive(true)
				SetActive(arg_847_1.leftNameGo_, true)

				local var_850_17 = arg_847_1:FormatText(StoryNameCfg[73].name)

				arg_847_1.leftNameTxt_.text = var_850_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_847_1.leftNameTxt_.transform)

				arg_847_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_847_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_847_1:RecordName(arg_847_1.leftNameTxt_.text)
				SetActive(arg_847_1.iconTrs_.gameObject, false)
				arg_847_1.callingController_:SetSelectedState("normal")

				local var_850_18 = arg_847_1:GetWordFromCfg(1109305213)
				local var_850_19 = arg_847_1:FormatText(var_850_18.content)

				arg_847_1.text_.text = var_850_19

				LuaForUtil.ClearLinePrefixSymbol(arg_847_1.text_)

				local var_850_20 = 18
				local var_850_21 = utf8.len(var_850_19)
				local var_850_22 = var_850_20 <= 0 and var_850_16 or var_850_16 * (var_850_21 / var_850_20)

				if var_850_22 > 0 and var_850_16 < var_850_22 then
					arg_847_1.talkMaxDuration = var_850_22

					if var_850_22 + var_850_15 > arg_847_1.duration_ then
						arg_847_1.duration_ = var_850_22 + var_850_15
					end
				end

				arg_847_1.text_.text = var_850_19
				arg_847_1.typewritter.percent = 0

				arg_847_1.typewritter:SetDirty()
				arg_847_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305213", "story_v_side_new_1109305.awb") ~= 0 then
					local var_850_23 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305213", "story_v_side_new_1109305.awb") / 1000

					if var_850_23 + var_850_15 > arg_847_1.duration_ then
						arg_847_1.duration_ = var_850_23 + var_850_15
					end

					if var_850_18.prefab_name ~= "" and arg_847_1.actors_[var_850_18.prefab_name] ~= nil then
						local var_850_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_847_1.actors_[var_850_18.prefab_name].transform, "story_v_side_new_1109305", "1109305213", "story_v_side_new_1109305.awb")

						arg_847_1:RecordAudio("1109305213", var_850_24)
						arg_847_1:RecordAudio("1109305213", var_850_24)
					else
						arg_847_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305213", "story_v_side_new_1109305.awb")
					end

					arg_847_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305213", "story_v_side_new_1109305.awb")
				end

				arg_847_1:RecordContent(arg_847_1.text_.text)
			end

			local var_850_25 = math.max(var_850_16, arg_847_1.talkMaxDuration)

			if var_850_15 <= arg_847_1.time_ and arg_847_1.time_ < var_850_15 + var_850_25 then
				arg_847_1.typewritter.percent = (arg_847_1.time_ - var_850_15) / var_850_25

				arg_847_1.typewritter:SetDirty()
			end

			if arg_847_1.time_ >= var_850_15 + var_850_25 and arg_847_1.time_ < var_850_15 + var_850_25 + arg_850_0 then
				arg_847_1.typewritter.percent = 1

				arg_847_1.typewritter:SetDirty()
				arg_847_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305214 = function(arg_851_0, arg_851_1)
		arg_851_1.time_ = 0
		arg_851_1.frameCnt_ = 0
		arg_851_1.state_ = "playing"
		arg_851_1.curTalkId_ = 1109305214
		arg_851_1.duration_ = 0.8

		SetActive(arg_851_1.tipsGo_, true)

		arg_851_1.tipsText_.text = StoryTipsCfg[109301].name

		function arg_851_1.onSingleLineFinish_()
			arg_851_1.onSingleLineUpdate_ = nil
			arg_851_1.onSingleLineFinish_ = nil
			arg_851_1.state_ = "waiting"

			SetActive(arg_851_1.choicesGo_, true)

			for iter_852_0, iter_852_1 in ipairs(arg_851_1.choices_) do
				local var_852_0 = iter_852_0 <= 2

				SetActive(iter_852_1.go, var_852_0)
			end

			arg_851_1.choices_[1].txt.text = arg_851_1:FormatText(StoryChoiceCfg[1033].name)
			arg_851_1.choices_[2].txt.text = arg_851_1:FormatText(StoryChoiceCfg[1034].name)
		end

		function arg_851_1.playNext_(arg_853_0)
			if arg_853_0 == 1 then
				arg_851_0:Play1109305215(arg_851_1)
			end

			if arg_853_0 == 2 then
				PlayerAction.UseStoryTrigger(1093013, 210930105, 1109305214, 2)
				arg_851_0:Play1109305216(arg_851_1)
			end
		end

		function arg_851_1.onSingleLineUpdate_(arg_854_0)
			local var_854_0 = arg_851_1.actors_["1093ui_story"]
			local var_854_1 = 0

			if var_854_1 < arg_851_1.time_ and arg_851_1.time_ <= var_854_1 + arg_854_0 and not isNil(var_854_0) and arg_851_1.var_.characterEffect1093ui_story == nil then
				arg_851_1.var_.characterEffect1093ui_story = var_854_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_854_2 = 0.200000002980232

			if var_854_1 <= arg_851_1.time_ and arg_851_1.time_ < var_854_1 + var_854_2 and not isNil(var_854_0) then
				local var_854_3 = (arg_851_1.time_ - var_854_1) / var_854_2

				if arg_851_1.var_.characterEffect1093ui_story and not isNil(var_854_0) then
					local var_854_4 = Mathf.Lerp(0, 0.5, var_854_3)

					arg_851_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_851_1.var_.characterEffect1093ui_story.fillRatio = var_854_4
				end
			end

			if arg_851_1.time_ >= var_854_1 + var_854_2 and arg_851_1.time_ < var_854_1 + var_854_2 + arg_854_0 and not isNil(var_854_0) and arg_851_1.var_.characterEffect1093ui_story then
				local var_854_5 = 0.5

				arg_851_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_851_1.var_.characterEffect1093ui_story.fillRatio = var_854_5
			end
		end
	end,
	Play1109305215 = function(arg_855_0, arg_855_1)
		arg_855_1.time_ = 0
		arg_855_1.frameCnt_ = 0
		arg_855_1.state_ = "playing"
		arg_855_1.curTalkId_ = 1109305215
		arg_855_1.duration_ = 4.3

		SetActive(arg_855_1.tipsGo_, false)

		function arg_855_1.onSingleLineFinish_()
			arg_855_1.onSingleLineUpdate_ = nil
			arg_855_1.onSingleLineFinish_ = nil
			arg_855_1.state_ = "waiting"
		end

		function arg_855_1.playNext_(arg_857_0)
			if arg_857_0 == 1 then
				arg_855_0:Play1109305221(arg_855_1)
			end
		end

		function arg_855_1.onSingleLineUpdate_(arg_858_0)
			local var_858_0 = arg_855_1.actors_["1093ui_story"]
			local var_858_1 = 0

			if var_858_1 < arg_855_1.time_ and arg_855_1.time_ <= var_858_1 + arg_858_0 and not isNil(var_858_0) and arg_855_1.var_.characterEffect1093ui_story == nil then
				arg_855_1.var_.characterEffect1093ui_story = var_858_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_858_2 = 0.200000002980232

			if var_858_1 <= arg_855_1.time_ and arg_855_1.time_ < var_858_1 + var_858_2 and not isNil(var_858_0) then
				local var_858_3 = (arg_855_1.time_ - var_858_1) / var_858_2

				if arg_855_1.var_.characterEffect1093ui_story and not isNil(var_858_0) then
					arg_855_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_855_1.time_ >= var_858_1 + var_858_2 and arg_855_1.time_ < var_858_1 + var_858_2 + arg_858_0 and not isNil(var_858_0) and arg_855_1.var_.characterEffect1093ui_story then
				arg_855_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_858_4 = 0

			if var_858_4 < arg_855_1.time_ and arg_855_1.time_ <= var_858_4 + arg_858_0 then
				arg_855_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action9_2")
			end

			local var_858_5 = 0

			if var_858_5 < arg_855_1.time_ and arg_855_1.time_ <= var_858_5 + arg_858_0 then
				arg_855_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_858_6 = 0
			local var_858_7 = 0.45

			if var_858_6 < arg_855_1.time_ and arg_855_1.time_ <= var_858_6 + arg_858_0 then
				arg_855_1.talkMaxDuration = 0
				arg_855_1.dialogCg_.alpha = 1

				arg_855_1.dialog_:SetActive(true)
				SetActive(arg_855_1.leftNameGo_, true)

				local var_858_8 = arg_855_1:FormatText(StoryNameCfg[73].name)

				arg_855_1.leftNameTxt_.text = var_858_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_855_1.leftNameTxt_.transform)

				arg_855_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_855_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_855_1:RecordName(arg_855_1.leftNameTxt_.text)
				SetActive(arg_855_1.iconTrs_.gameObject, false)
				arg_855_1.callingController_:SetSelectedState("normal")

				local var_858_9 = arg_855_1:GetWordFromCfg(1109305215)
				local var_858_10 = arg_855_1:FormatText(var_858_9.content)

				arg_855_1.text_.text = var_858_10

				LuaForUtil.ClearLinePrefixSymbol(arg_855_1.text_)

				local var_858_11 = 18
				local var_858_12 = utf8.len(var_858_10)
				local var_858_13 = var_858_11 <= 0 and var_858_7 or var_858_7 * (var_858_12 / var_858_11)

				if var_858_13 > 0 and var_858_7 < var_858_13 then
					arg_855_1.talkMaxDuration = var_858_13

					if var_858_13 + var_858_6 > arg_855_1.duration_ then
						arg_855_1.duration_ = var_858_13 + var_858_6
					end
				end

				arg_855_1.text_.text = var_858_10
				arg_855_1.typewritter.percent = 0

				arg_855_1.typewritter:SetDirty()
				arg_855_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305215", "story_v_side_new_1109305.awb") ~= 0 then
					local var_858_14 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305215", "story_v_side_new_1109305.awb") / 1000

					if var_858_14 + var_858_6 > arg_855_1.duration_ then
						arg_855_1.duration_ = var_858_14 + var_858_6
					end

					if var_858_9.prefab_name ~= "" and arg_855_1.actors_[var_858_9.prefab_name] ~= nil then
						local var_858_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_855_1.actors_[var_858_9.prefab_name].transform, "story_v_side_new_1109305", "1109305215", "story_v_side_new_1109305.awb")

						arg_855_1:RecordAudio("1109305215", var_858_15)
						arg_855_1:RecordAudio("1109305215", var_858_15)
					else
						arg_855_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305215", "story_v_side_new_1109305.awb")
					end

					arg_855_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305215", "story_v_side_new_1109305.awb")
				end

				arg_855_1:RecordContent(arg_855_1.text_.text)
			end

			local var_858_16 = math.max(var_858_7, arg_855_1.talkMaxDuration)

			if var_858_6 <= arg_855_1.time_ and arg_855_1.time_ < var_858_6 + var_858_16 then
				arg_855_1.typewritter.percent = (arg_855_1.time_ - var_858_6) / var_858_16

				arg_855_1.typewritter:SetDirty()
			end

			if arg_855_1.time_ >= var_858_6 + var_858_16 and arg_855_1.time_ < var_858_6 + var_858_16 + arg_858_0 then
				arg_855_1.typewritter.percent = 1

				arg_855_1.typewritter:SetDirty()
				arg_855_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305221 = function(arg_859_0, arg_859_1)
		arg_859_1.time_ = 0
		arg_859_1.frameCnt_ = 0
		arg_859_1.state_ = "playing"
		arg_859_1.curTalkId_ = 1109305221
		arg_859_1.duration_ = 6.83

		SetActive(arg_859_1.tipsGo_, false)

		function arg_859_1.onSingleLineFinish_()
			arg_859_1.onSingleLineUpdate_ = nil
			arg_859_1.onSingleLineFinish_ = nil
			arg_859_1.state_ = "waiting"
			arg_859_1.auto_ = false
		end

		function arg_859_1.playNext_(arg_861_0)
			arg_859_1.onStoryFinished_()
		end

		function arg_859_1.onSingleLineUpdate_(arg_862_0)
			local var_862_0 = arg_859_1.actors_["1093ui_story"].transform
			local var_862_1 = 0

			if var_862_1 < arg_859_1.time_ and arg_859_1.time_ <= var_862_1 + arg_862_0 then
				arg_859_1.var_.moveOldPos1093ui_story = var_862_0.localPosition
			end

			local var_862_2 = 0.001

			if var_862_1 <= arg_859_1.time_ and arg_859_1.time_ < var_862_1 + var_862_2 then
				local var_862_3 = (arg_859_1.time_ - var_862_1) / var_862_2
				local var_862_4 = Vector3.New(0, 100, 0)

				var_862_0.localPosition = Vector3.Lerp(arg_859_1.var_.moveOldPos1093ui_story, var_862_4, var_862_3)

				local var_862_5 = manager.ui.mainCamera.transform.position - var_862_0.position

				var_862_0.forward = Vector3.New(var_862_5.x, var_862_5.y, var_862_5.z)

				local var_862_6 = var_862_0.localEulerAngles

				var_862_6.z = 0
				var_862_6.x = 0
				var_862_0.localEulerAngles = var_862_6
			end

			if arg_859_1.time_ >= var_862_1 + var_862_2 and arg_859_1.time_ < var_862_1 + var_862_2 + arg_862_0 then
				var_862_0.localPosition = Vector3.New(0, 100, 0)

				local var_862_7 = manager.ui.mainCamera.transform.position - var_862_0.position

				var_862_0.forward = Vector3.New(var_862_7.x, var_862_7.y, var_862_7.z)

				local var_862_8 = var_862_0.localEulerAngles

				var_862_8.z = 0
				var_862_8.x = 0
				var_862_0.localEulerAngles = var_862_8
			end

			local var_862_9 = arg_859_1.actors_["1093ui_story"]
			local var_862_10 = 1.133333333332

			if var_862_10 < arg_859_1.time_ and arg_859_1.time_ <= var_862_10 + arg_862_0 and not isNil(var_862_9) and arg_859_1.var_.characterEffect1093ui_story == nil then
				arg_859_1.var_.characterEffect1093ui_story = var_862_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_862_11 = 0.200000002980232

			if var_862_10 <= arg_859_1.time_ and arg_859_1.time_ < var_862_10 + var_862_11 and not isNil(var_862_9) then
				local var_862_12 = (arg_859_1.time_ - var_862_10) / var_862_11

				if arg_859_1.var_.characterEffect1093ui_story and not isNil(var_862_9) then
					local var_862_13 = Mathf.Lerp(0, 0.5, var_862_12)

					arg_859_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_859_1.var_.characterEffect1093ui_story.fillRatio = var_862_13
				end
			end

			if arg_859_1.time_ >= var_862_10 + var_862_11 and arg_859_1.time_ < var_862_10 + var_862_11 + arg_862_0 and not isNil(var_862_9) and arg_859_1.var_.characterEffect1093ui_story then
				local var_862_14 = 0.5

				arg_859_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_859_1.var_.characterEffect1093ui_story.fillRatio = var_862_14
			end

			local var_862_15 = 0

			if var_862_15 < arg_859_1.time_ and arg_859_1.time_ <= var_862_15 + arg_862_0 then
				arg_859_1.mask_.enabled = true
				arg_859_1.mask_.raycastTarget = true

				arg_859_1:SetGaussion(false)
			end

			local var_862_16 = 1.13333333333333

			if var_862_15 <= arg_859_1.time_ and arg_859_1.time_ < var_862_15 + var_862_16 then
				local var_862_17 = (arg_859_1.time_ - var_862_15) / var_862_16
				local var_862_18 = Color.New(1, 1, 1)

				var_862_18.a = Mathf.Lerp(0, 1, var_862_17)
				arg_859_1.mask_.color = var_862_18
			end

			if arg_859_1.time_ >= var_862_15 + var_862_16 and arg_859_1.time_ < var_862_15 + var_862_16 + arg_862_0 then
				local var_862_19 = Color.New(1, 1, 1)

				var_862_19.a = 1
				arg_859_1.mask_.color = var_862_19
			end

			local var_862_20 = 1.13333333333333

			if var_862_20 < arg_859_1.time_ and arg_859_1.time_ <= var_862_20 + arg_862_0 then
				arg_859_1.mask_.enabled = true
				arg_859_1.mask_.raycastTarget = true

				arg_859_1:SetGaussion(false)
			end

			local var_862_21 = 0.633333333333333

			if var_862_20 <= arg_859_1.time_ and arg_859_1.time_ < var_862_20 + var_862_21 then
				local var_862_22 = (arg_859_1.time_ - var_862_20) / var_862_21
				local var_862_23 = Color.New(1, 1, 1)

				var_862_23.a = Mathf.Lerp(1, 0, var_862_22)
				arg_859_1.mask_.color = var_862_23
			end

			if arg_859_1.time_ >= var_862_20 + var_862_21 and arg_859_1.time_ < var_862_20 + var_862_21 + arg_862_0 then
				local var_862_24 = Color.New(1, 1, 1)
				local var_862_25 = 0

				arg_859_1.mask_.enabled = false
				var_862_24.a = var_862_25
				arg_859_1.mask_.color = var_862_24
			end

			local var_862_26 = 1.13333333333333

			if var_862_26 < arg_859_1.time_ and arg_859_1.time_ <= var_862_26 + arg_862_0 then
				local var_862_27 = manager.ui.mainCamera.transform.localPosition
				local var_862_28 = Vector3.New(0, 0, 10) + Vector3.New(var_862_27.x, var_862_27.y, 0)
				local var_862_29 = arg_859_1.bgs_.STblack

				var_862_29.transform.localPosition = var_862_28
				var_862_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_862_30 = var_862_29:GetComponent("SpriteRenderer")

				if var_862_30 and var_862_30.sprite then
					local var_862_31 = (var_862_29.transform.localPosition - var_862_27).z
					local var_862_32 = manager.ui.mainCameraCom_
					local var_862_33 = 2 * var_862_31 * Mathf.Tan(var_862_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_862_34 = var_862_33 * var_862_32.aspect
					local var_862_35 = var_862_30.sprite.bounds.size.x
					local var_862_36 = var_862_30.sprite.bounds.size.y
					local var_862_37 = var_862_34 / var_862_35
					local var_862_38 = var_862_33 / var_862_36
					local var_862_39 = var_862_38 < var_862_37 and var_862_37 or var_862_38

					var_862_29.transform.localScale = Vector3.New(var_862_39, var_862_39, 0)
				end

				for iter_862_0, iter_862_1 in pairs(arg_859_1.bgs_) do
					if iter_862_0 ~= "STblack" then
						iter_862_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_862_40
			local var_862_41 = 1.133333333332

			if var_862_41 < arg_859_1.time_ and arg_859_1.time_ <= var_862_41 + arg_862_0 then
				local var_862_42 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_862_42 then
					var_862_42.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_862_42.radialBlurScale = 0
					var_862_42.radialBlurGradient = 1
					var_862_42.radialBlurIntensity = 0.457

					if var_862_40 then
						var_862_42.radialBlurTarget = var_862_40.transform
					end
				end
			end

			local var_862_43 = 0.100000000001333

			if var_862_41 <= arg_859_1.time_ and arg_859_1.time_ < var_862_41 + var_862_43 then
				local var_862_44 = (arg_859_1.time_ - var_862_41) / var_862_43
				local var_862_45 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_862_45 then
					var_862_45.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_862_45.radialBlurScale = Mathf.Lerp(0, 0, var_862_44)
					var_862_45.radialBlurGradient = Mathf.Lerp(1, 0.675, var_862_44)
					var_862_45.radialBlurIntensity = Mathf.Lerp(0.457, 1, var_862_44)
				end
			end

			if arg_859_1.time_ >= var_862_41 + var_862_43 and arg_859_1.time_ < var_862_41 + var_862_43 + arg_862_0 then
				local var_862_46 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_862_46 then
					var_862_46.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_862_46.radialBlurScale = 0
					var_862_46.radialBlurGradient = 0.675
					var_862_46.radialBlurIntensity = 1
				end
			end

			if arg_859_1.frameCnt_ <= 1 then
				arg_859_1.dialog_:SetActive(false)
			end

			local var_862_47 = 1.83333333333333
			local var_862_48 = 0.05

			if var_862_47 < arg_859_1.time_ and arg_859_1.time_ <= var_862_47 + arg_862_0 then
				arg_859_1.talkMaxDuration = 0

				arg_859_1.dialog_:SetActive(true)

				local var_862_49 = LeanTween.value(arg_859_1.dialog_, 0, 1, 0.3)

				var_862_49:setOnUpdate(LuaHelper.FloatAction(function(arg_863_0)
					arg_859_1.dialogCg_.alpha = arg_863_0
				end))
				var_862_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_859_1.dialog_)
					var_862_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_859_1.duration_ = arg_859_1.duration_ + 0.3

				SetActive(arg_859_1.leftNameGo_, false)

				arg_859_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_859_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_859_1:RecordName(arg_859_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_859_1.iconTrs_.gameObject, false)
				arg_859_1.callingController_:SetSelectedState("normal")

				local var_862_50 = arg_859_1:GetWordFromCfg(1109305221)
				local var_862_51 = arg_859_1:FormatText(var_862_50.content)

				arg_859_1.text_.text = var_862_51

				LuaForUtil.ClearLinePrefixSymbol(arg_859_1.text_)

				local var_862_52 = 2
				local var_862_53 = utf8.len(var_862_51)
				local var_862_54 = var_862_52 <= 0 and var_862_48 or var_862_48 * (var_862_53 / var_862_52)

				if var_862_54 > 0 and var_862_48 < var_862_54 then
					arg_859_1.talkMaxDuration = var_862_54
					var_862_47 = var_862_47 + 0.3

					if var_862_54 + var_862_47 > arg_859_1.duration_ then
						arg_859_1.duration_ = var_862_54 + var_862_47
					end
				end

				arg_859_1.text_.text = var_862_51
				arg_859_1.typewritter.percent = 0

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(false)
				arg_859_1:RecordContent(arg_859_1.text_.text)
			end

			local var_862_55 = var_862_47 + 0.3
			local var_862_56 = math.max(var_862_48, arg_859_1.talkMaxDuration)

			if var_862_55 <= arg_859_1.time_ and arg_859_1.time_ < var_862_55 + var_862_56 then
				arg_859_1.typewritter.percent = (arg_859_1.time_ - var_862_55) / var_862_56

				arg_859_1.typewritter:SetDirty()
			end

			if arg_859_1.time_ >= var_862_55 + var_862_56 and arg_859_1.time_ < var_862_55 + var_862_56 + arg_862_0 then
				arg_859_1.typewritter.percent = 1

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305216 = function(arg_865_0, arg_865_1)
		arg_865_1.time_ = 0
		arg_865_1.frameCnt_ = 0
		arg_865_1.state_ = "playing"
		arg_865_1.curTalkId_ = 1109305216
		arg_865_1.duration_ = 6.27

		SetActive(arg_865_1.tipsGo_, false)

		function arg_865_1.onSingleLineFinish_()
			arg_865_1.onSingleLineUpdate_ = nil
			arg_865_1.onSingleLineFinish_ = nil
			arg_865_1.state_ = "waiting"
		end

		function arg_865_1.playNext_(arg_867_0)
			if arg_867_0 == 1 then
				arg_865_0:Play1109305217(arg_865_1)
			end
		end

		function arg_865_1.onSingleLineUpdate_(arg_868_0)
			local var_868_0 = arg_865_1.actors_["1093ui_story"].transform
			local var_868_1 = 0

			if var_868_1 < arg_865_1.time_ and arg_865_1.time_ <= var_868_1 + arg_868_0 then
				arg_865_1.var_.moveOldPos1093ui_story = var_868_0.localPosition
			end

			local var_868_2 = 0.001

			if var_868_1 <= arg_865_1.time_ and arg_865_1.time_ < var_868_1 + var_868_2 then
				local var_868_3 = (arg_865_1.time_ - var_868_1) / var_868_2
				local var_868_4 = Vector3.New(0, 100, 0)

				var_868_0.localPosition = Vector3.Lerp(arg_865_1.var_.moveOldPos1093ui_story, var_868_4, var_868_3)

				local var_868_5 = manager.ui.mainCamera.transform.position - var_868_0.position

				var_868_0.forward = Vector3.New(var_868_5.x, var_868_5.y, var_868_5.z)

				local var_868_6 = var_868_0.localEulerAngles

				var_868_6.z = 0
				var_868_6.x = 0
				var_868_0.localEulerAngles = var_868_6
			end

			if arg_865_1.time_ >= var_868_1 + var_868_2 and arg_865_1.time_ < var_868_1 + var_868_2 + arg_868_0 then
				var_868_0.localPosition = Vector3.New(0, 100, 0)

				local var_868_7 = manager.ui.mainCamera.transform.position - var_868_0.position

				var_868_0.forward = Vector3.New(var_868_7.x, var_868_7.y, var_868_7.z)

				local var_868_8 = var_868_0.localEulerAngles

				var_868_8.z = 0
				var_868_8.x = 0
				var_868_0.localEulerAngles = var_868_8
			end

			local var_868_9 = arg_865_1.actors_["1093ui_story"]
			local var_868_10 = 0

			if var_868_10 < arg_865_1.time_ and arg_865_1.time_ <= var_868_10 + arg_868_0 and not isNil(var_868_9) and arg_865_1.var_.characterEffect1093ui_story == nil then
				arg_865_1.var_.characterEffect1093ui_story = var_868_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_868_11 = 0.200000002980232

			if var_868_10 <= arg_865_1.time_ and arg_865_1.time_ < var_868_10 + var_868_11 and not isNil(var_868_9) then
				local var_868_12 = (arg_865_1.time_ - var_868_10) / var_868_11

				if arg_865_1.var_.characterEffect1093ui_story and not isNil(var_868_9) then
					local var_868_13 = Mathf.Lerp(0, 0.5, var_868_12)

					arg_865_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_865_1.var_.characterEffect1093ui_story.fillRatio = var_868_13
				end
			end

			if arg_865_1.time_ >= var_868_10 + var_868_11 and arg_865_1.time_ < var_868_10 + var_868_11 + arg_868_0 and not isNil(var_868_9) and arg_865_1.var_.characterEffect1093ui_story then
				local var_868_14 = 0.5

				arg_865_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_865_1.var_.characterEffect1093ui_story.fillRatio = var_868_14
			end

			local var_868_15
			local var_868_16 = 0

			if var_868_16 < arg_865_1.time_ and arg_865_1.time_ <= var_868_16 + arg_868_0 then
				local var_868_17 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_868_17 then
					var_868_17.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_868_17.radialBlurScale = 0
					var_868_17.radialBlurGradient = 1
					var_868_17.radialBlurIntensity = 0.457

					if var_868_15 then
						var_868_17.radialBlurTarget = var_868_15.transform
					end
				end
			end

			local var_868_18 = 1.56666666666667

			if var_868_16 <= arg_865_1.time_ and arg_865_1.time_ < var_868_16 + var_868_18 then
				local var_868_19 = (arg_865_1.time_ - var_868_16) / var_868_18
				local var_868_20 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_868_20 then
					var_868_20.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_868_20.radialBlurScale = Mathf.Lerp(0, 0, var_868_19)
					var_868_20.radialBlurGradient = Mathf.Lerp(1, 0.675, var_868_19)
					var_868_20.radialBlurIntensity = Mathf.Lerp(0.457, 1, var_868_19)
				end
			end

			if arg_865_1.time_ >= var_868_16 + var_868_18 and arg_865_1.time_ < var_868_16 + var_868_18 + arg_868_0 then
				local var_868_21 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_868_21 then
					var_868_21.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_868_21.radialBlurScale = 0
					var_868_21.radialBlurGradient = 0.675
					var_868_21.radialBlurIntensity = 1
				end
			end

			if arg_865_1.frameCnt_ <= 1 then
				arg_865_1.dialog_:SetActive(false)
			end

			local var_868_22 = 1.26666666666667
			local var_868_23 = 0.8

			if var_868_22 < arg_865_1.time_ and arg_865_1.time_ <= var_868_22 + arg_868_0 then
				arg_865_1.talkMaxDuration = 0

				arg_865_1.dialog_:SetActive(true)

				local var_868_24 = LeanTween.value(arg_865_1.dialog_, 0, 1, 0.3)

				var_868_24:setOnUpdate(LuaHelper.FloatAction(function(arg_869_0)
					arg_865_1.dialogCg_.alpha = arg_869_0
				end))
				var_868_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_865_1.dialog_)
					var_868_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_865_1.duration_ = arg_865_1.duration_ + 0.3

				SetActive(arg_865_1.leftNameGo_, false)

				arg_865_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_865_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_865_1:RecordName(arg_865_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_865_1.iconTrs_.gameObject, false)
				arg_865_1.callingController_:SetSelectedState("normal")

				local var_868_25 = arg_865_1:GetWordFromCfg(1109305216)
				local var_868_26 = arg_865_1:FormatText(var_868_25.content)

				arg_865_1.text_.text = var_868_26

				LuaForUtil.ClearLinePrefixSymbol(arg_865_1.text_)

				local var_868_27 = 32
				local var_868_28 = utf8.len(var_868_26)
				local var_868_29 = var_868_27 <= 0 and var_868_23 or var_868_23 * (var_868_28 / var_868_27)

				if var_868_29 > 0 and var_868_23 < var_868_29 then
					arg_865_1.talkMaxDuration = var_868_29
					var_868_22 = var_868_22 + 0.3

					if var_868_29 + var_868_22 > arg_865_1.duration_ then
						arg_865_1.duration_ = var_868_29 + var_868_22
					end
				end

				arg_865_1.text_.text = var_868_26
				arg_865_1.typewritter.percent = 0

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(false)
				arg_865_1:RecordContent(arg_865_1.text_.text)
			end

			local var_868_30 = var_868_22 + 0.3
			local var_868_31 = math.max(var_868_23, arg_865_1.talkMaxDuration)

			if var_868_30 <= arg_865_1.time_ and arg_865_1.time_ < var_868_30 + var_868_31 then
				arg_865_1.typewritter.percent = (arg_865_1.time_ - var_868_30) / var_868_31

				arg_865_1.typewritter:SetDirty()
			end

			if arg_865_1.time_ >= var_868_30 + var_868_31 and arg_865_1.time_ < var_868_30 + var_868_31 + arg_868_0 then
				arg_865_1.typewritter.percent = 1

				arg_865_1.typewritter:SetDirty()
				arg_865_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305217 = function(arg_871_0, arg_871_1)
		arg_871_1.time_ = 0
		arg_871_1.frameCnt_ = 0
		arg_871_1.state_ = "playing"
		arg_871_1.curTalkId_ = 1109305217
		arg_871_1.duration_ = 5.3

		SetActive(arg_871_1.tipsGo_, false)

		function arg_871_1.onSingleLineFinish_()
			arg_871_1.onSingleLineUpdate_ = nil
			arg_871_1.onSingleLineFinish_ = nil
			arg_871_1.state_ = "waiting"
		end

		function arg_871_1.playNext_(arg_873_0)
			if arg_873_0 == 1 then
				arg_871_0:Play1109305218(arg_871_1)
			end
		end

		function arg_871_1.onSingleLineUpdate_(arg_874_0)
			local var_874_0 = 0
			local var_874_1 = 0.225

			if var_874_0 < arg_871_1.time_ and arg_871_1.time_ <= var_874_0 + arg_874_0 then
				arg_871_1.talkMaxDuration = 0
				arg_871_1.dialogCg_.alpha = 1

				arg_871_1.dialog_:SetActive(true)
				SetActive(arg_871_1.leftNameGo_, true)

				local var_874_2 = arg_871_1:FormatText(StoryNameCfg[73].name)

				arg_871_1.leftNameTxt_.text = var_874_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_871_1.leftNameTxt_.transform)

				arg_871_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_871_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_871_1:RecordName(arg_871_1.leftNameTxt_.text)
				SetActive(arg_871_1.iconTrs_.gameObject, true)
				arg_871_1.iconController_:SetSelectedState("hero")

				arg_871_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_871_1.callingController_:SetSelectedState("normal")

				arg_871_1.keyicon_.color = Color.New(1, 1, 1)
				arg_871_1.icon_.color = Color.New(1, 1, 1)

				local var_874_3 = arg_871_1:GetWordFromCfg(1109305217)
				local var_874_4 = arg_871_1:FormatText(var_874_3.content)

				arg_871_1.text_.text = var_874_4

				LuaForUtil.ClearLinePrefixSymbol(arg_871_1.text_)

				local var_874_5 = 9
				local var_874_6 = utf8.len(var_874_4)
				local var_874_7 = var_874_5 <= 0 and var_874_1 or var_874_1 * (var_874_6 / var_874_5)

				if var_874_7 > 0 and var_874_1 < var_874_7 then
					arg_871_1.talkMaxDuration = var_874_7

					if var_874_7 + var_874_0 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_7 + var_874_0
					end
				end

				arg_871_1.text_.text = var_874_4
				arg_871_1.typewritter.percent = 0

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305217", "story_v_side_new_1109305.awb") ~= 0 then
					local var_874_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305217", "story_v_side_new_1109305.awb") / 1000

					if var_874_8 + var_874_0 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_8 + var_874_0
					end

					if var_874_3.prefab_name ~= "" and arg_871_1.actors_[var_874_3.prefab_name] ~= nil then
						local var_874_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_871_1.actors_[var_874_3.prefab_name].transform, "story_v_side_new_1109305", "1109305217", "story_v_side_new_1109305.awb")

						arg_871_1:RecordAudio("1109305217", var_874_9)
						arg_871_1:RecordAudio("1109305217", var_874_9)
					else
						arg_871_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305217", "story_v_side_new_1109305.awb")
					end

					arg_871_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305217", "story_v_side_new_1109305.awb")
				end

				arg_871_1:RecordContent(arg_871_1.text_.text)
			end

			local var_874_10 = math.max(var_874_1, arg_871_1.talkMaxDuration)

			if var_874_0 <= arg_871_1.time_ and arg_871_1.time_ < var_874_0 + var_874_10 then
				arg_871_1.typewritter.percent = (arg_871_1.time_ - var_874_0) / var_874_10

				arg_871_1.typewritter:SetDirty()
			end

			if arg_871_1.time_ >= var_874_0 + var_874_10 and arg_871_1.time_ < var_874_0 + var_874_10 + arg_874_0 then
				arg_871_1.typewritter.percent = 1

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305218 = function(arg_875_0, arg_875_1)
		arg_875_1.time_ = 0
		arg_875_1.frameCnt_ = 0
		arg_875_1.state_ = "playing"
		arg_875_1.curTalkId_ = 1109305218
		arg_875_1.duration_ = 5

		SetActive(arg_875_1.tipsGo_, false)

		function arg_875_1.onSingleLineFinish_()
			arg_875_1.onSingleLineUpdate_ = nil
			arg_875_1.onSingleLineFinish_ = nil
			arg_875_1.state_ = "waiting"
		end

		function arg_875_1.playNext_(arg_877_0)
			if arg_877_0 == 1 then
				arg_875_0:Play1109305219(arg_875_1)
			end
		end

		function arg_875_1.onSingleLineUpdate_(arg_878_0)
			local var_878_0 = 0
			local var_878_1 = 0.275

			if var_878_0 < arg_875_1.time_ and arg_875_1.time_ <= var_878_0 + arg_878_0 then
				arg_875_1.talkMaxDuration = 0
				arg_875_1.dialogCg_.alpha = 1

				arg_875_1.dialog_:SetActive(true)
				SetActive(arg_875_1.leftNameGo_, true)

				local var_878_2 = arg_875_1:FormatText(StoryNameCfg[7].name)

				arg_875_1.leftNameTxt_.text = var_878_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_875_1.leftNameTxt_.transform)

				arg_875_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_875_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_875_1:RecordName(arg_875_1.leftNameTxt_.text)
				SetActive(arg_875_1.iconTrs_.gameObject, false)
				arg_875_1.callingController_:SetSelectedState("normal")

				local var_878_3 = arg_875_1:GetWordFromCfg(1109305218)
				local var_878_4 = arg_875_1:FormatText(var_878_3.content)

				arg_875_1.text_.text = var_878_4

				LuaForUtil.ClearLinePrefixSymbol(arg_875_1.text_)

				local var_878_5 = 11
				local var_878_6 = utf8.len(var_878_4)
				local var_878_7 = var_878_5 <= 0 and var_878_1 or var_878_1 * (var_878_6 / var_878_5)

				if var_878_7 > 0 and var_878_1 < var_878_7 then
					arg_875_1.talkMaxDuration = var_878_7

					if var_878_7 + var_878_0 > arg_875_1.duration_ then
						arg_875_1.duration_ = var_878_7 + var_878_0
					end
				end

				arg_875_1.text_.text = var_878_4
				arg_875_1.typewritter.percent = 0

				arg_875_1.typewritter:SetDirty()
				arg_875_1:ShowNextGo(false)
				arg_875_1:RecordContent(arg_875_1.text_.text)
			end

			local var_878_8 = math.max(var_878_1, arg_875_1.talkMaxDuration)

			if var_878_0 <= arg_875_1.time_ and arg_875_1.time_ < var_878_0 + var_878_8 then
				arg_875_1.typewritter.percent = (arg_875_1.time_ - var_878_0) / var_878_8

				arg_875_1.typewritter:SetDirty()
			end

			if arg_875_1.time_ >= var_878_0 + var_878_8 and arg_875_1.time_ < var_878_0 + var_878_8 + arg_878_0 then
				arg_875_1.typewritter.percent = 1

				arg_875_1.typewritter:SetDirty()
				arg_875_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305219 = function(arg_879_0, arg_879_1)
		arg_879_1.time_ = 0
		arg_879_1.frameCnt_ = 0
		arg_879_1.state_ = "playing"
		arg_879_1.curTalkId_ = 1109305219
		arg_879_1.duration_ = 2.47

		SetActive(arg_879_1.tipsGo_, false)

		function arg_879_1.onSingleLineFinish_()
			arg_879_1.onSingleLineUpdate_ = nil
			arg_879_1.onSingleLineFinish_ = nil
			arg_879_1.state_ = "waiting"
		end

		function arg_879_1.playNext_(arg_881_0)
			if arg_881_0 == 1 then
				arg_879_0:Play1109305220(arg_879_1)
			end
		end

		function arg_879_1.onSingleLineUpdate_(arg_882_0)
			local var_882_0 = 0
			local var_882_1 = 0.275

			if var_882_0 < arg_879_1.time_ and arg_879_1.time_ <= var_882_0 + arg_882_0 then
				arg_879_1.talkMaxDuration = 0
				arg_879_1.dialogCg_.alpha = 1

				arg_879_1.dialog_:SetActive(true)
				SetActive(arg_879_1.leftNameGo_, true)

				local var_882_2 = arg_879_1:FormatText(StoryNameCfg[73].name)

				arg_879_1.leftNameTxt_.text = var_882_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_879_1.leftNameTxt_.transform)

				arg_879_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_879_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_879_1:RecordName(arg_879_1.leftNameTxt_.text)
				SetActive(arg_879_1.iconTrs_.gameObject, true)
				arg_879_1.iconController_:SetSelectedState("hero")

				arg_879_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_879_1.callingController_:SetSelectedState("normal")

				arg_879_1.keyicon_.color = Color.New(1, 1, 1)
				arg_879_1.icon_.color = Color.New(1, 1, 1)

				local var_882_3 = arg_879_1:GetWordFromCfg(1109305219)
				local var_882_4 = arg_879_1:FormatText(var_882_3.content)

				arg_879_1.text_.text = var_882_4

				LuaForUtil.ClearLinePrefixSymbol(arg_879_1.text_)

				local var_882_5 = 11
				local var_882_6 = utf8.len(var_882_4)
				local var_882_7 = var_882_5 <= 0 and var_882_1 or var_882_1 * (var_882_6 / var_882_5)

				if var_882_7 > 0 and var_882_1 < var_882_7 then
					arg_879_1.talkMaxDuration = var_882_7

					if var_882_7 + var_882_0 > arg_879_1.duration_ then
						arg_879_1.duration_ = var_882_7 + var_882_0
					end
				end

				arg_879_1.text_.text = var_882_4
				arg_879_1.typewritter.percent = 0

				arg_879_1.typewritter:SetDirty()
				arg_879_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305219", "story_v_side_new_1109305.awb") ~= 0 then
					local var_882_8 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305219", "story_v_side_new_1109305.awb") / 1000

					if var_882_8 + var_882_0 > arg_879_1.duration_ then
						arg_879_1.duration_ = var_882_8 + var_882_0
					end

					if var_882_3.prefab_name ~= "" and arg_879_1.actors_[var_882_3.prefab_name] ~= nil then
						local var_882_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_879_1.actors_[var_882_3.prefab_name].transform, "story_v_side_new_1109305", "1109305219", "story_v_side_new_1109305.awb")

						arg_879_1:RecordAudio("1109305219", var_882_9)
						arg_879_1:RecordAudio("1109305219", var_882_9)
					else
						arg_879_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305219", "story_v_side_new_1109305.awb")
					end

					arg_879_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305219", "story_v_side_new_1109305.awb")
				end

				arg_879_1:RecordContent(arg_879_1.text_.text)
			end

			local var_882_10 = math.max(var_882_1, arg_879_1.talkMaxDuration)

			if var_882_0 <= arg_879_1.time_ and arg_879_1.time_ < var_882_0 + var_882_10 then
				arg_879_1.typewritter.percent = (arg_879_1.time_ - var_882_0) / var_882_10

				arg_879_1.typewritter:SetDirty()
			end

			if arg_879_1.time_ >= var_882_0 + var_882_10 and arg_879_1.time_ < var_882_0 + var_882_10 + arg_882_0 then
				arg_879_1.typewritter.percent = 1

				arg_879_1.typewritter:SetDirty()
				arg_879_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305220 = function(arg_883_0, arg_883_1)
		arg_883_1.time_ = 0
		arg_883_1.frameCnt_ = 0
		arg_883_1.state_ = "playing"
		arg_883_1.curTalkId_ = 1109305220
		arg_883_1.duration_ = 5

		SetActive(arg_883_1.tipsGo_, false)

		function arg_883_1.onSingleLineFinish_()
			arg_883_1.onSingleLineUpdate_ = nil
			arg_883_1.onSingleLineFinish_ = nil
			arg_883_1.state_ = "waiting"
		end

		function arg_883_1.playNext_(arg_885_0)
			if arg_885_0 == 1 then
				arg_883_0:Play1109305221(arg_883_1)
			end
		end

		function arg_883_1.onSingleLineUpdate_(arg_886_0)
			local var_886_0 = 0
			local var_886_1 = 0.425

			if var_886_0 < arg_883_1.time_ and arg_883_1.time_ <= var_886_0 + arg_886_0 then
				arg_883_1.talkMaxDuration = 0
				arg_883_1.dialogCg_.alpha = 1

				arg_883_1.dialog_:SetActive(true)
				SetActive(arg_883_1.leftNameGo_, true)

				local var_886_2 = arg_883_1:FormatText(StoryNameCfg[7].name)

				arg_883_1.leftNameTxt_.text = var_886_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_883_1.leftNameTxt_.transform)

				arg_883_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_883_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_883_1:RecordName(arg_883_1.leftNameTxt_.text)
				SetActive(arg_883_1.iconTrs_.gameObject, false)
				arg_883_1.callingController_:SetSelectedState("normal")

				local var_886_3 = arg_883_1:GetWordFromCfg(1109305220)
				local var_886_4 = arg_883_1:FormatText(var_886_3.content)

				arg_883_1.text_.text = var_886_4

				LuaForUtil.ClearLinePrefixSymbol(arg_883_1.text_)

				local var_886_5 = 17
				local var_886_6 = utf8.len(var_886_4)
				local var_886_7 = var_886_5 <= 0 and var_886_1 or var_886_1 * (var_886_6 / var_886_5)

				if var_886_7 > 0 and var_886_1 < var_886_7 then
					arg_883_1.talkMaxDuration = var_886_7

					if var_886_7 + var_886_0 > arg_883_1.duration_ then
						arg_883_1.duration_ = var_886_7 + var_886_0
					end
				end

				arg_883_1.text_.text = var_886_4
				arg_883_1.typewritter.percent = 0

				arg_883_1.typewritter:SetDirty()
				arg_883_1:ShowNextGo(false)
				arg_883_1:RecordContent(arg_883_1.text_.text)
			end

			local var_886_8 = math.max(var_886_1, arg_883_1.talkMaxDuration)

			if var_886_0 <= arg_883_1.time_ and arg_883_1.time_ < var_886_0 + var_886_8 then
				arg_883_1.typewritter.percent = (arg_883_1.time_ - var_886_0) / var_886_8

				arg_883_1.typewritter:SetDirty()
			end

			if arg_883_1.time_ >= var_886_0 + var_886_8 and arg_883_1.time_ < var_886_0 + var_886_8 + arg_886_0 then
				arg_883_1.typewritter.percent = 1

				arg_883_1.typewritter:SetDirty()
				arg_883_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305082 = function(arg_887_0, arg_887_1)
		arg_887_1.time_ = 0
		arg_887_1.frameCnt_ = 0
		arg_887_1.state_ = "playing"
		arg_887_1.curTalkId_ = 1109305082
		arg_887_1.duration_ = 4.07

		SetActive(arg_887_1.tipsGo_, false)

		function arg_887_1.onSingleLineFinish_()
			arg_887_1.onSingleLineUpdate_ = nil
			arg_887_1.onSingleLineFinish_ = nil
			arg_887_1.state_ = "waiting"
		end

		function arg_887_1.playNext_(arg_889_0)
			if arg_889_0 == 1 then
				arg_887_0:Play1109305083(arg_887_1)
			end
		end

		function arg_887_1.onSingleLineUpdate_(arg_890_0)
			local var_890_0 = arg_887_1.actors_["1093ui_story"].transform
			local var_890_1 = 0

			if var_890_1 < arg_887_1.time_ and arg_887_1.time_ <= var_890_1 + arg_890_0 then
				arg_887_1.var_.moveOldPos1093ui_story = var_890_0.localPosition
			end

			local var_890_2 = 0.001

			if var_890_1 <= arg_887_1.time_ and arg_887_1.time_ < var_890_1 + var_890_2 then
				local var_890_3 = (arg_887_1.time_ - var_890_1) / var_890_2
				local var_890_4 = Vector3.New(0, -1.11, -5.88)

				var_890_0.localPosition = Vector3.Lerp(arg_887_1.var_.moveOldPos1093ui_story, var_890_4, var_890_3)

				local var_890_5 = manager.ui.mainCamera.transform.position - var_890_0.position

				var_890_0.forward = Vector3.New(var_890_5.x, var_890_5.y, var_890_5.z)

				local var_890_6 = var_890_0.localEulerAngles

				var_890_6.z = 0
				var_890_6.x = 0
				var_890_0.localEulerAngles = var_890_6
			end

			if arg_887_1.time_ >= var_890_1 + var_890_2 and arg_887_1.time_ < var_890_1 + var_890_2 + arg_890_0 then
				var_890_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_890_7 = manager.ui.mainCamera.transform.position - var_890_0.position

				var_890_0.forward = Vector3.New(var_890_7.x, var_890_7.y, var_890_7.z)

				local var_890_8 = var_890_0.localEulerAngles

				var_890_8.z = 0
				var_890_8.x = 0
				var_890_0.localEulerAngles = var_890_8
			end

			local var_890_9 = arg_887_1.actors_["1093ui_story"]
			local var_890_10 = 0

			if var_890_10 < arg_887_1.time_ and arg_887_1.time_ <= var_890_10 + arg_890_0 and not isNil(var_890_9) and arg_887_1.var_.characterEffect1093ui_story == nil then
				arg_887_1.var_.characterEffect1093ui_story = var_890_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_890_11 = 0.200000002980232

			if var_890_10 <= arg_887_1.time_ and arg_887_1.time_ < var_890_10 + var_890_11 and not isNil(var_890_9) then
				local var_890_12 = (arg_887_1.time_ - var_890_10) / var_890_11

				if arg_887_1.var_.characterEffect1093ui_story and not isNil(var_890_9) then
					arg_887_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_887_1.time_ >= var_890_10 + var_890_11 and arg_887_1.time_ < var_890_10 + var_890_11 + arg_890_0 and not isNil(var_890_9) and arg_887_1.var_.characterEffect1093ui_story then
				arg_887_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_890_13 = 0
			local var_890_14 = 0.425

			if var_890_13 < arg_887_1.time_ and arg_887_1.time_ <= var_890_13 + arg_890_0 then
				arg_887_1.talkMaxDuration = 0
				arg_887_1.dialogCg_.alpha = 1

				arg_887_1.dialog_:SetActive(true)
				SetActive(arg_887_1.leftNameGo_, true)

				local var_890_15 = arg_887_1:FormatText(StoryNameCfg[73].name)

				arg_887_1.leftNameTxt_.text = var_890_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_887_1.leftNameTxt_.transform)

				arg_887_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_887_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_887_1:RecordName(arg_887_1.leftNameTxt_.text)
				SetActive(arg_887_1.iconTrs_.gameObject, false)
				arg_887_1.callingController_:SetSelectedState("normal")

				local var_890_16 = arg_887_1:GetWordFromCfg(1109305082)
				local var_890_17 = arg_887_1:FormatText(var_890_16.content)

				arg_887_1.text_.text = var_890_17

				LuaForUtil.ClearLinePrefixSymbol(arg_887_1.text_)

				local var_890_18 = 17
				local var_890_19 = utf8.len(var_890_17)
				local var_890_20 = var_890_18 <= 0 and var_890_14 or var_890_14 * (var_890_19 / var_890_18)

				if var_890_20 > 0 and var_890_14 < var_890_20 then
					arg_887_1.talkMaxDuration = var_890_20

					if var_890_20 + var_890_13 > arg_887_1.duration_ then
						arg_887_1.duration_ = var_890_20 + var_890_13
					end
				end

				arg_887_1.text_.text = var_890_17
				arg_887_1.typewritter.percent = 0

				arg_887_1.typewritter:SetDirty()
				arg_887_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305082", "story_v_side_new_1109305.awb") ~= 0 then
					local var_890_21 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305082", "story_v_side_new_1109305.awb") / 1000

					if var_890_21 + var_890_13 > arg_887_1.duration_ then
						arg_887_1.duration_ = var_890_21 + var_890_13
					end

					if var_890_16.prefab_name ~= "" and arg_887_1.actors_[var_890_16.prefab_name] ~= nil then
						local var_890_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_887_1.actors_[var_890_16.prefab_name].transform, "story_v_side_new_1109305", "1109305082", "story_v_side_new_1109305.awb")

						arg_887_1:RecordAudio("1109305082", var_890_22)
						arg_887_1:RecordAudio("1109305082", var_890_22)
					else
						arg_887_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305082", "story_v_side_new_1109305.awb")
					end

					arg_887_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305082", "story_v_side_new_1109305.awb")
				end

				arg_887_1:RecordContent(arg_887_1.text_.text)
			end

			local var_890_23 = math.max(var_890_14, arg_887_1.talkMaxDuration)

			if var_890_13 <= arg_887_1.time_ and arg_887_1.time_ < var_890_13 + var_890_23 then
				arg_887_1.typewritter.percent = (arg_887_1.time_ - var_890_13) / var_890_23

				arg_887_1.typewritter:SetDirty()
			end

			if arg_887_1.time_ >= var_890_13 + var_890_23 and arg_887_1.time_ < var_890_13 + var_890_23 + arg_890_0 then
				arg_887_1.typewritter.percent = 1

				arg_887_1.typewritter:SetDirty()
				arg_887_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305083 = function(arg_891_0, arg_891_1)
		arg_891_1.time_ = 0
		arg_891_1.frameCnt_ = 0
		arg_891_1.state_ = "playing"
		arg_891_1.curTalkId_ = 1109305083
		arg_891_1.duration_ = 5

		SetActive(arg_891_1.tipsGo_, false)

		function arg_891_1.onSingleLineFinish_()
			arg_891_1.onSingleLineUpdate_ = nil
			arg_891_1.onSingleLineFinish_ = nil
			arg_891_1.state_ = "waiting"
		end

		function arg_891_1.playNext_(arg_893_0)
			if arg_893_0 == 1 then
				arg_891_0:Play1109305084(arg_891_1)
			end
		end

		function arg_891_1.onSingleLineUpdate_(arg_894_0)
			local var_894_0 = arg_891_1.actors_["1093ui_story"]
			local var_894_1 = 0

			if var_894_1 < arg_891_1.time_ and arg_891_1.time_ <= var_894_1 + arg_894_0 and not isNil(var_894_0) and arg_891_1.var_.characterEffect1093ui_story == nil then
				arg_891_1.var_.characterEffect1093ui_story = var_894_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_894_2 = 0.200000002980232

			if var_894_1 <= arg_891_1.time_ and arg_891_1.time_ < var_894_1 + var_894_2 and not isNil(var_894_0) then
				local var_894_3 = (arg_891_1.time_ - var_894_1) / var_894_2

				if arg_891_1.var_.characterEffect1093ui_story and not isNil(var_894_0) then
					local var_894_4 = Mathf.Lerp(0, 0.5, var_894_3)

					arg_891_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_891_1.var_.characterEffect1093ui_story.fillRatio = var_894_4
				end
			end

			if arg_891_1.time_ >= var_894_1 + var_894_2 and arg_891_1.time_ < var_894_1 + var_894_2 + arg_894_0 and not isNil(var_894_0) and arg_891_1.var_.characterEffect1093ui_story then
				local var_894_5 = 0.5

				arg_891_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_891_1.var_.characterEffect1093ui_story.fillRatio = var_894_5
			end

			local var_894_6 = 0
			local var_894_7 = 0.3

			if var_894_6 < arg_891_1.time_ and arg_891_1.time_ <= var_894_6 + arg_894_0 then
				arg_891_1.talkMaxDuration = 0
				arg_891_1.dialogCg_.alpha = 1

				arg_891_1.dialog_:SetActive(true)
				SetActive(arg_891_1.leftNameGo_, true)

				local var_894_8 = arg_891_1:FormatText(StoryNameCfg[7].name)

				arg_891_1.leftNameTxt_.text = var_894_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_891_1.leftNameTxt_.transform)

				arg_891_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_891_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_891_1:RecordName(arg_891_1.leftNameTxt_.text)
				SetActive(arg_891_1.iconTrs_.gameObject, false)
				arg_891_1.callingController_:SetSelectedState("normal")

				local var_894_9 = arg_891_1:GetWordFromCfg(1109305083)
				local var_894_10 = arg_891_1:FormatText(var_894_9.content)

				arg_891_1.text_.text = var_894_10

				LuaForUtil.ClearLinePrefixSymbol(arg_891_1.text_)

				local var_894_11 = 12
				local var_894_12 = utf8.len(var_894_10)
				local var_894_13 = var_894_11 <= 0 and var_894_7 or var_894_7 * (var_894_12 / var_894_11)

				if var_894_13 > 0 and var_894_7 < var_894_13 then
					arg_891_1.talkMaxDuration = var_894_13

					if var_894_13 + var_894_6 > arg_891_1.duration_ then
						arg_891_1.duration_ = var_894_13 + var_894_6
					end
				end

				arg_891_1.text_.text = var_894_10
				arg_891_1.typewritter.percent = 0

				arg_891_1.typewritter:SetDirty()
				arg_891_1:ShowNextGo(false)
				arg_891_1:RecordContent(arg_891_1.text_.text)
			end

			local var_894_14 = math.max(var_894_7, arg_891_1.talkMaxDuration)

			if var_894_6 <= arg_891_1.time_ and arg_891_1.time_ < var_894_6 + var_894_14 then
				arg_891_1.typewritter.percent = (arg_891_1.time_ - var_894_6) / var_894_14

				arg_891_1.typewritter:SetDirty()
			end

			if arg_891_1.time_ >= var_894_6 + var_894_14 and arg_891_1.time_ < var_894_6 + var_894_14 + arg_894_0 then
				arg_891_1.typewritter.percent = 1

				arg_891_1.typewritter:SetDirty()
				arg_891_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305084 = function(arg_895_0, arg_895_1)
		arg_895_1.time_ = 0
		arg_895_1.frameCnt_ = 0
		arg_895_1.state_ = "playing"
		arg_895_1.curTalkId_ = 1109305084
		arg_895_1.duration_ = 3.73

		SetActive(arg_895_1.tipsGo_, false)

		function arg_895_1.onSingleLineFinish_()
			arg_895_1.onSingleLineUpdate_ = nil
			arg_895_1.onSingleLineFinish_ = nil
			arg_895_1.state_ = "waiting"
		end

		function arg_895_1.playNext_(arg_897_0)
			if arg_897_0 == 1 then
				arg_895_0:Play1109305085(arg_895_1)
			end
		end

		function arg_895_1.onSingleLineUpdate_(arg_898_0)
			local var_898_0 = arg_895_1.actors_["1093ui_story"]
			local var_898_1 = 0

			if var_898_1 < arg_895_1.time_ and arg_895_1.time_ <= var_898_1 + arg_898_0 and not isNil(var_898_0) and arg_895_1.var_.characterEffect1093ui_story == nil then
				arg_895_1.var_.characterEffect1093ui_story = var_898_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_898_2 = 0.200000002980232

			if var_898_1 <= arg_895_1.time_ and arg_895_1.time_ < var_898_1 + var_898_2 and not isNil(var_898_0) then
				local var_898_3 = (arg_895_1.time_ - var_898_1) / var_898_2

				if arg_895_1.var_.characterEffect1093ui_story and not isNil(var_898_0) then
					arg_895_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_895_1.time_ >= var_898_1 + var_898_2 and arg_895_1.time_ < var_898_1 + var_898_2 + arg_898_0 and not isNil(var_898_0) and arg_895_1.var_.characterEffect1093ui_story then
				arg_895_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_898_4 = 0
			local var_898_5 = 0.425

			if var_898_4 < arg_895_1.time_ and arg_895_1.time_ <= var_898_4 + arg_898_0 then
				arg_895_1.talkMaxDuration = 0
				arg_895_1.dialogCg_.alpha = 1

				arg_895_1.dialog_:SetActive(true)
				SetActive(arg_895_1.leftNameGo_, true)

				local var_898_6 = arg_895_1:FormatText(StoryNameCfg[73].name)

				arg_895_1.leftNameTxt_.text = var_898_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_895_1.leftNameTxt_.transform)

				arg_895_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_895_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_895_1:RecordName(arg_895_1.leftNameTxt_.text)
				SetActive(arg_895_1.iconTrs_.gameObject, false)
				arg_895_1.callingController_:SetSelectedState("normal")

				local var_898_7 = arg_895_1:GetWordFromCfg(1109305084)
				local var_898_8 = arg_895_1:FormatText(var_898_7.content)

				arg_895_1.text_.text = var_898_8

				LuaForUtil.ClearLinePrefixSymbol(arg_895_1.text_)

				local var_898_9 = 17
				local var_898_10 = utf8.len(var_898_8)
				local var_898_11 = var_898_9 <= 0 and var_898_5 or var_898_5 * (var_898_10 / var_898_9)

				if var_898_11 > 0 and var_898_5 < var_898_11 then
					arg_895_1.talkMaxDuration = var_898_11

					if var_898_11 + var_898_4 > arg_895_1.duration_ then
						arg_895_1.duration_ = var_898_11 + var_898_4
					end
				end

				arg_895_1.text_.text = var_898_8
				arg_895_1.typewritter.percent = 0

				arg_895_1.typewritter:SetDirty()
				arg_895_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305084", "story_v_side_new_1109305.awb") ~= 0 then
					local var_898_12 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305084", "story_v_side_new_1109305.awb") / 1000

					if var_898_12 + var_898_4 > arg_895_1.duration_ then
						arg_895_1.duration_ = var_898_12 + var_898_4
					end

					if var_898_7.prefab_name ~= "" and arg_895_1.actors_[var_898_7.prefab_name] ~= nil then
						local var_898_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_895_1.actors_[var_898_7.prefab_name].transform, "story_v_side_new_1109305", "1109305084", "story_v_side_new_1109305.awb")

						arg_895_1:RecordAudio("1109305084", var_898_13)
						arg_895_1:RecordAudio("1109305084", var_898_13)
					else
						arg_895_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305084", "story_v_side_new_1109305.awb")
					end

					arg_895_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305084", "story_v_side_new_1109305.awb")
				end

				arg_895_1:RecordContent(arg_895_1.text_.text)
			end

			local var_898_14 = math.max(var_898_5, arg_895_1.talkMaxDuration)

			if var_898_4 <= arg_895_1.time_ and arg_895_1.time_ < var_898_4 + var_898_14 then
				arg_895_1.typewritter.percent = (arg_895_1.time_ - var_898_4) / var_898_14

				arg_895_1.typewritter:SetDirty()
			end

			if arg_895_1.time_ >= var_898_4 + var_898_14 and arg_895_1.time_ < var_898_4 + var_898_14 + arg_898_0 then
				arg_895_1.typewritter.percent = 1

				arg_895_1.typewritter:SetDirty()
				arg_895_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305085 = function(arg_899_0, arg_899_1)
		arg_899_1.time_ = 0
		arg_899_1.frameCnt_ = 0
		arg_899_1.state_ = "playing"
		arg_899_1.curTalkId_ = 1109305085
		arg_899_1.duration_ = 5

		SetActive(arg_899_1.tipsGo_, false)

		function arg_899_1.onSingleLineFinish_()
			arg_899_1.onSingleLineUpdate_ = nil
			arg_899_1.onSingleLineFinish_ = nil
			arg_899_1.state_ = "waiting"
		end

		function arg_899_1.playNext_(arg_901_0)
			if arg_901_0 == 1 then
				arg_899_0:Play1109305086(arg_899_1)
			end
		end

		function arg_899_1.onSingleLineUpdate_(arg_902_0)
			local var_902_0 = arg_899_1.actors_["1093ui_story"]
			local var_902_1 = 0

			if var_902_1 < arg_899_1.time_ and arg_899_1.time_ <= var_902_1 + arg_902_0 and not isNil(var_902_0) and arg_899_1.var_.characterEffect1093ui_story == nil then
				arg_899_1.var_.characterEffect1093ui_story = var_902_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_902_2 = 0.200000002980232

			if var_902_1 <= arg_899_1.time_ and arg_899_1.time_ < var_902_1 + var_902_2 and not isNil(var_902_0) then
				local var_902_3 = (arg_899_1.time_ - var_902_1) / var_902_2

				if arg_899_1.var_.characterEffect1093ui_story and not isNil(var_902_0) then
					local var_902_4 = Mathf.Lerp(0, 0.5, var_902_3)

					arg_899_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_899_1.var_.characterEffect1093ui_story.fillRatio = var_902_4
				end
			end

			if arg_899_1.time_ >= var_902_1 + var_902_2 and arg_899_1.time_ < var_902_1 + var_902_2 + arg_902_0 and not isNil(var_902_0) and arg_899_1.var_.characterEffect1093ui_story then
				local var_902_5 = 0.5

				arg_899_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_899_1.var_.characterEffect1093ui_story.fillRatio = var_902_5
			end

			local var_902_6 = 0
			local var_902_7 = 0.875

			if var_902_6 < arg_899_1.time_ and arg_899_1.time_ <= var_902_6 + arg_902_0 then
				arg_899_1.talkMaxDuration = 0
				arg_899_1.dialogCg_.alpha = 1

				arg_899_1.dialog_:SetActive(true)
				SetActive(arg_899_1.leftNameGo_, true)

				local var_902_8 = arg_899_1:FormatText(StoryNameCfg[7].name)

				arg_899_1.leftNameTxt_.text = var_902_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_899_1.leftNameTxt_.transform)

				arg_899_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_899_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_899_1:RecordName(arg_899_1.leftNameTxt_.text)
				SetActive(arg_899_1.iconTrs_.gameObject, false)
				arg_899_1.callingController_:SetSelectedState("normal")

				local var_902_9 = arg_899_1:GetWordFromCfg(1109305085)
				local var_902_10 = arg_899_1:FormatText(var_902_9.content)

				arg_899_1.text_.text = var_902_10

				LuaForUtil.ClearLinePrefixSymbol(arg_899_1.text_)

				local var_902_11 = 35
				local var_902_12 = utf8.len(var_902_10)
				local var_902_13 = var_902_11 <= 0 and var_902_7 or var_902_7 * (var_902_12 / var_902_11)

				if var_902_13 > 0 and var_902_7 < var_902_13 then
					arg_899_1.talkMaxDuration = var_902_13

					if var_902_13 + var_902_6 > arg_899_1.duration_ then
						arg_899_1.duration_ = var_902_13 + var_902_6
					end
				end

				arg_899_1.text_.text = var_902_10
				arg_899_1.typewritter.percent = 0

				arg_899_1.typewritter:SetDirty()
				arg_899_1:ShowNextGo(false)
				arg_899_1:RecordContent(arg_899_1.text_.text)
			end

			local var_902_14 = math.max(var_902_7, arg_899_1.talkMaxDuration)

			if var_902_6 <= arg_899_1.time_ and arg_899_1.time_ < var_902_6 + var_902_14 then
				arg_899_1.typewritter.percent = (arg_899_1.time_ - var_902_6) / var_902_14

				arg_899_1.typewritter:SetDirty()
			end

			if arg_899_1.time_ >= var_902_6 + var_902_14 and arg_899_1.time_ < var_902_6 + var_902_14 + arg_902_0 then
				arg_899_1.typewritter.percent = 1

				arg_899_1.typewritter:SetDirty()
				arg_899_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305086 = function(arg_903_0, arg_903_1)
		arg_903_1.time_ = 0
		arg_903_1.frameCnt_ = 0
		arg_903_1.state_ = "playing"
		arg_903_1.curTalkId_ = 1109305086
		arg_903_1.duration_ = 5.4

		SetActive(arg_903_1.tipsGo_, false)

		function arg_903_1.onSingleLineFinish_()
			arg_903_1.onSingleLineUpdate_ = nil
			arg_903_1.onSingleLineFinish_ = nil
			arg_903_1.state_ = "waiting"
		end

		function arg_903_1.playNext_(arg_905_0)
			if arg_905_0 == 1 then
				arg_903_0:Play1109305087(arg_903_1)
			end
		end

		function arg_903_1.onSingleLineUpdate_(arg_906_0)
			local var_906_0 = arg_903_1.actors_["1093ui_story"].transform
			local var_906_1 = 0

			if var_906_1 < arg_903_1.time_ and arg_903_1.time_ <= var_906_1 + arg_906_0 then
				arg_903_1.var_.moveOldPos1093ui_story = var_906_0.localPosition
			end

			local var_906_2 = 0.001

			if var_906_1 <= arg_903_1.time_ and arg_903_1.time_ < var_906_1 + var_906_2 then
				local var_906_3 = (arg_903_1.time_ - var_906_1) / var_906_2
				local var_906_4 = Vector3.New(0, -1.11, -5.88)

				var_906_0.localPosition = Vector3.Lerp(arg_903_1.var_.moveOldPos1093ui_story, var_906_4, var_906_3)

				local var_906_5 = manager.ui.mainCamera.transform.position - var_906_0.position

				var_906_0.forward = Vector3.New(var_906_5.x, var_906_5.y, var_906_5.z)

				local var_906_6 = var_906_0.localEulerAngles

				var_906_6.z = 0
				var_906_6.x = 0
				var_906_0.localEulerAngles = var_906_6
			end

			if arg_903_1.time_ >= var_906_1 + var_906_2 and arg_903_1.time_ < var_906_1 + var_906_2 + arg_906_0 then
				var_906_0.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_906_7 = manager.ui.mainCamera.transform.position - var_906_0.position

				var_906_0.forward = Vector3.New(var_906_7.x, var_906_7.y, var_906_7.z)

				local var_906_8 = var_906_0.localEulerAngles

				var_906_8.z = 0
				var_906_8.x = 0
				var_906_0.localEulerAngles = var_906_8
			end

			local var_906_9 = arg_903_1.actors_["1093ui_story"]
			local var_906_10 = 0

			if var_906_10 < arg_903_1.time_ and arg_903_1.time_ <= var_906_10 + arg_906_0 and not isNil(var_906_9) and arg_903_1.var_.characterEffect1093ui_story == nil then
				arg_903_1.var_.characterEffect1093ui_story = var_906_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_906_11 = 0.200000002980232

			if var_906_10 <= arg_903_1.time_ and arg_903_1.time_ < var_906_10 + var_906_11 and not isNil(var_906_9) then
				local var_906_12 = (arg_903_1.time_ - var_906_10) / var_906_11

				if arg_903_1.var_.characterEffect1093ui_story and not isNil(var_906_9) then
					arg_903_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_903_1.time_ >= var_906_10 + var_906_11 and arg_903_1.time_ < var_906_10 + var_906_11 + arg_906_0 and not isNil(var_906_9) and arg_903_1.var_.characterEffect1093ui_story then
				arg_903_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_906_13 = 0

			if var_906_13 < arg_903_1.time_ and arg_903_1.time_ <= var_906_13 + arg_906_0 then
				arg_903_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_906_14 = 0
			local var_906_15 = 0.45

			if var_906_14 < arg_903_1.time_ and arg_903_1.time_ <= var_906_14 + arg_906_0 then
				arg_903_1.talkMaxDuration = 0
				arg_903_1.dialogCg_.alpha = 1

				arg_903_1.dialog_:SetActive(true)
				SetActive(arg_903_1.leftNameGo_, true)

				local var_906_16 = arg_903_1:FormatText(StoryNameCfg[73].name)

				arg_903_1.leftNameTxt_.text = var_906_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_903_1.leftNameTxt_.transform)

				arg_903_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_903_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_903_1:RecordName(arg_903_1.leftNameTxt_.text)
				SetActive(arg_903_1.iconTrs_.gameObject, false)
				arg_903_1.callingController_:SetSelectedState("normal")

				local var_906_17 = arg_903_1:GetWordFromCfg(1109305086)
				local var_906_18 = arg_903_1:FormatText(var_906_17.content)

				arg_903_1.text_.text = var_906_18

				LuaForUtil.ClearLinePrefixSymbol(arg_903_1.text_)

				local var_906_19 = 18
				local var_906_20 = utf8.len(var_906_18)
				local var_906_21 = var_906_19 <= 0 and var_906_15 or var_906_15 * (var_906_20 / var_906_19)

				if var_906_21 > 0 and var_906_15 < var_906_21 then
					arg_903_1.talkMaxDuration = var_906_21

					if var_906_21 + var_906_14 > arg_903_1.duration_ then
						arg_903_1.duration_ = var_906_21 + var_906_14
					end
				end

				arg_903_1.text_.text = var_906_18
				arg_903_1.typewritter.percent = 0

				arg_903_1.typewritter:SetDirty()
				arg_903_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305086", "story_v_side_new_1109305.awb") ~= 0 then
					local var_906_22 = manager.audio:GetVoiceLength("story_v_side_new_1109305", "1109305086", "story_v_side_new_1109305.awb") / 1000

					if var_906_22 + var_906_14 > arg_903_1.duration_ then
						arg_903_1.duration_ = var_906_22 + var_906_14
					end

					if var_906_17.prefab_name ~= "" and arg_903_1.actors_[var_906_17.prefab_name] ~= nil then
						local var_906_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_903_1.actors_[var_906_17.prefab_name].transform, "story_v_side_new_1109305", "1109305086", "story_v_side_new_1109305.awb")

						arg_903_1:RecordAudio("1109305086", var_906_23)
						arg_903_1:RecordAudio("1109305086", var_906_23)
					else
						arg_903_1:AudioAction("play", "voice", "story_v_side_new_1109305", "1109305086", "story_v_side_new_1109305.awb")
					end

					arg_903_1:RecordHistoryTalkVoice("story_v_side_new_1109305", "1109305086", "story_v_side_new_1109305.awb")
				end

				arg_903_1:RecordContent(arg_903_1.text_.text)
			end

			local var_906_24 = math.max(var_906_15, arg_903_1.talkMaxDuration)

			if var_906_14 <= arg_903_1.time_ and arg_903_1.time_ < var_906_14 + var_906_24 then
				arg_903_1.typewritter.percent = (arg_903_1.time_ - var_906_14) / var_906_24

				arg_903_1.typewritter:SetDirty()
			end

			if arg_903_1.time_ >= var_906_14 + var_906_24 and arg_903_1.time_ < var_906_14 + var_906_24 + arg_906_0 then
				arg_903_1.typewritter.percent = 1

				arg_903_1.typewritter:SetDirty()
				arg_903_1:ShowNextGo(true)
			end
		end
	end,
	Play1109305087 = function(arg_907_0, arg_907_1)
		arg_907_1.time_ = 0
		arg_907_1.frameCnt_ = 0
		arg_907_1.state_ = "playing"
		arg_907_1.curTalkId_ = 1109305087
		arg_907_1.duration_ = 5

		SetActive(arg_907_1.tipsGo_, false)

		function arg_907_1.onSingleLineFinish_()
			arg_907_1.onSingleLineUpdate_ = nil
			arg_907_1.onSingleLineFinish_ = nil
			arg_907_1.state_ = "waiting"
		end

		function arg_907_1.playNext_(arg_909_0)
			if arg_909_0 == 1 then
				arg_907_0:Play1109305088(arg_907_1)
			end
		end

		function arg_907_1.onSingleLineUpdate_(arg_910_0)
			local var_910_0 = arg_907_1.actors_["1093ui_story"]
			local var_910_1 = 0

			if var_910_1 < arg_907_1.time_ and arg_907_1.time_ <= var_910_1 + arg_910_0 and not isNil(var_910_0) and arg_907_1.var_.characterEffect1093ui_story == nil then
				arg_907_1.var_.characterEffect1093ui_story = var_910_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_910_2 = 0.200000002980232

			if var_910_1 <= arg_907_1.time_ and arg_907_1.time_ < var_910_1 + var_910_2 and not isNil(var_910_0) then
				local var_910_3 = (arg_907_1.time_ - var_910_1) / var_910_2

				if arg_907_1.var_.characterEffect1093ui_story and not isNil(var_910_0) then
					local var_910_4 = Mathf.Lerp(0, 0.5, var_910_3)

					arg_907_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_907_1.var_.characterEffect1093ui_story.fillRatio = var_910_4
				end
			end

			if arg_907_1.time_ >= var_910_1 + var_910_2 and arg_907_1.time_ < var_910_1 + var_910_2 + arg_910_0 and not isNil(var_910_0) and arg_907_1.var_.characterEffect1093ui_story then
				local var_910_5 = 0.5

				arg_907_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_907_1.var_.characterEffect1093ui_story.fillRatio = var_910_5
			end

			local var_910_6 = 0
			local var_910_7 = 0.375

			if var_910_6 < arg_907_1.time_ and arg_907_1.time_ <= var_910_6 + arg_910_0 then
				arg_907_1.talkMaxDuration = 0
				arg_907_1.dialogCg_.alpha = 1

				arg_907_1.dialog_:SetActive(true)
				SetActive(arg_907_1.leftNameGo_, true)

				local var_910_8 = arg_907_1:FormatText(StoryNameCfg[7].name)

				arg_907_1.leftNameTxt_.text = var_910_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_907_1.leftNameTxt_.transform)

				arg_907_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_907_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_907_1:RecordName(arg_907_1.leftNameTxt_.text)
				SetActive(arg_907_1.iconTrs_.gameObject, false)
				arg_907_1.callingController_:SetSelectedState("normal")

				local var_910_9 = arg_907_1:GetWordFromCfg(1109305087)
				local var_910_10 = arg_907_1:FormatText(var_910_9.content)

				arg_907_1.text_.text = var_910_10

				LuaForUtil.ClearLinePrefixSymbol(arg_907_1.text_)

				local var_910_11 = 15
				local var_910_12 = utf8.len(var_910_10)
				local var_910_13 = var_910_11 <= 0 and var_910_7 or var_910_7 * (var_910_12 / var_910_11)

				if var_910_13 > 0 and var_910_7 < var_910_13 then
					arg_907_1.talkMaxDuration = var_910_13

					if var_910_13 + var_910_6 > arg_907_1.duration_ then
						arg_907_1.duration_ = var_910_13 + var_910_6
					end
				end

				arg_907_1.text_.text = var_910_10
				arg_907_1.typewritter.percent = 0

				arg_907_1.typewritter:SetDirty()
				arg_907_1:ShowNextGo(false)
				arg_907_1:RecordContent(arg_907_1.text_.text)
			end

			local var_910_14 = math.max(var_910_7, arg_907_1.talkMaxDuration)

			if var_910_6 <= arg_907_1.time_ and arg_907_1.time_ < var_910_6 + var_910_14 then
				arg_907_1.typewritter.percent = (arg_907_1.time_ - var_910_6) / var_910_14

				arg_907_1.typewritter:SetDirty()
			end

			if arg_907_1.time_ >= var_910_6 + var_910_14 and arg_907_1.time_ < var_910_6 + var_910_14 + arg_910_0 then
				arg_907_1.typewritter.percent = 1

				arg_907_1.typewritter:SetDirty()
				arg_907_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06"
	},
	voices = {
		"story_v_side_new_1109305.awb"
	}
}
