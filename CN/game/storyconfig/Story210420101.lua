﻿return {
	Play1104201001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1104201001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1104201002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F01a"

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
				local var_4_5 = arg_1_1.bgs_.F01a

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
					if iter_4_0 ~= "F01a" then
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
			local var_4_23 = 0.5

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

			local var_4_28 = 1.53333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")

				local var_4_32 = ""
				local var_4_33 = manager.audio:GetAudioName("bgm_side_daily02", "bgm_side_daily02")

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

			local var_4_34 = 1.999999999999
			local var_4_35 = 0.975

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

				local var_4_37 = arg_1_1:GetWordFromCfg(1104201001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 39
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
	Play1104201002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 1104201002
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play1104201003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 1.25

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

				local var_12_2 = arg_9_1:GetWordFromCfg(1104201002)
				local var_12_3 = arg_9_1:FormatText(var_12_2.content)

				arg_9_1.text_.text = var_12_3

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_4 = 50
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
	Play1104201003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 1104201003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play1104201004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.9

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
				SetActive(arg_13_1.iconTrs_.gameObject, true)
				arg_13_1.iconController_:SetSelectedState("hero")

				arg_13_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_13_1.callingController_:SetSelectedState("normal")

				arg_13_1.keyicon_.color = Color.New(1, 1, 1)
				arg_13_1.icon_.color = Color.New(1, 1, 1)

				local var_16_3 = arg_13_1:GetWordFromCfg(1104201003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 36
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
	Play1104201004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 1104201004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play1104201005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.975

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
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_17_1.callingController_:SetSelectedState("normal")

				arg_17_1.keyicon_.color = Color.New(1, 1, 1)
				arg_17_1.icon_.color = Color.New(1, 1, 1)

				local var_20_3 = arg_17_1:GetWordFromCfg(1104201004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 39
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
	Play1104201005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 1104201005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play1104201006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.775

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[7].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_21_1.callingController_:SetSelectedState("normal")

				arg_21_1.keyicon_.color = Color.New(1, 1, 1)
				arg_21_1.icon_.color = Color.New(1, 1, 1)

				local var_24_3 = arg_21_1:GetWordFromCfg(1104201005)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 31
				local var_24_6 = utf8.len(var_24_4)
				local var_24_7 = var_24_5 <= 0 and var_24_1 or var_24_1 * (var_24_6 / var_24_5)

				if var_24_7 > 0 and var_24_1 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_4
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_8 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_8 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_8

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_8 and arg_21_1.time_ < var_24_0 + var_24_8 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 1104201006
		arg_25_1.duration_ = 1.93

		local var_25_0 = {
			ja = 1.166,
			ko = 1.933,
			zh = 1.933
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
				arg_25_0:Play1104201007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "6045_story"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Asset.Load("Char/" .. "6045_story")

				if not isNil(var_28_1) then
					local var_28_2 = Object.Instantiate(Asset.Load("Char/" .. "6045_story"), arg_25_1.stage_.transform)

					var_28_2.name = var_28_0
					var_28_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_25_1.actors_[var_28_0] = var_28_2

					local var_28_3 = var_28_2:GetComponentInChildren(typeof(CharacterEffect))

					var_28_3.enabled = true

					local var_28_4 = GameObjectTools.GetOrAddComponent(var_28_2, typeof(DynamicBoneHelper))

					if var_28_4 then
						var_28_4:EnableDynamicBone(false)
					end

					arg_25_1:ShowWeapon(var_28_3.transform, false)

					arg_25_1.var_[var_28_0 .. "Animator"] = var_28_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_25_1.var_[var_28_0 .. "Animator"].applyRootMotion = true
					arg_25_1.var_[var_28_0 .. "LipSync"] = var_28_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_28_5 = arg_25_1.actors_["6045_story"].transform
			local var_28_6 = 0

			if var_28_6 < arg_25_1.time_ and arg_25_1.time_ <= var_28_6 + arg_28_0 then
				arg_25_1.var_.moveOldPos6045_story = var_28_5.localPosition
			end

			local var_28_7 = 0.001

			if var_28_6 <= arg_25_1.time_ and arg_25_1.time_ < var_28_6 + var_28_7 then
				local var_28_8 = (arg_25_1.time_ - var_28_6) / var_28_7
				local var_28_9 = Vector3.New(0, -0.5, -6.3)

				var_28_5.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos6045_story, var_28_9, var_28_8)

				local var_28_10 = manager.ui.mainCamera.transform.position - var_28_5.position

				var_28_5.forward = Vector3.New(var_28_10.x, var_28_10.y, var_28_10.z)

				local var_28_11 = var_28_5.localEulerAngles

				var_28_11.z = 0
				var_28_11.x = 0
				var_28_5.localEulerAngles = var_28_11
			end

			if arg_25_1.time_ >= var_28_6 + var_28_7 and arg_25_1.time_ < var_28_6 + var_28_7 + arg_28_0 then
				var_28_5.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_28_12 = manager.ui.mainCamera.transform.position - var_28_5.position

				var_28_5.forward = Vector3.New(var_28_12.x, var_28_12.y, var_28_12.z)

				local var_28_13 = var_28_5.localEulerAngles

				var_28_13.z = 0
				var_28_13.x = 0
				var_28_5.localEulerAngles = var_28_13
			end

			local var_28_14 = arg_25_1.actors_["6045_story"]
			local var_28_15 = 0

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 and not isNil(var_28_14) and arg_25_1.var_.characterEffect6045_story == nil then
				arg_25_1.var_.characterEffect6045_story = var_28_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_16 = 0.200000002980232

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_16 and not isNil(var_28_14) then
				local var_28_17 = (arg_25_1.time_ - var_28_15) / var_28_16

				if arg_25_1.var_.characterEffect6045_story and not isNil(var_28_14) then
					arg_25_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_15 + var_28_16 and arg_25_1.time_ < var_28_15 + var_28_16 + arg_28_0 and not isNil(var_28_14) and arg_25_1.var_.characterEffect6045_story then
				arg_25_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_28_18 = 0

			if var_28_18 < arg_25_1.time_ and arg_25_1.time_ <= var_28_18 + arg_28_0 then
				arg_25_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_28_19 = 0

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 then
				arg_25_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_20 = 0
			local var_28_21 = 0.125

			if var_28_20 < arg_25_1.time_ and arg_25_1.time_ <= var_28_20 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_22 = arg_25_1:FormatText(StoryNameCfg[215].name)

				arg_25_1.leftNameTxt_.text = var_28_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_23 = arg_25_1:GetWordFromCfg(1104201006)
				local var_28_24 = arg_25_1:FormatText(var_28_23.content)

				arg_25_1.text_.text = var_28_24

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_25 = 5
				local var_28_26 = utf8.len(var_28_24)
				local var_28_27 = var_28_25 <= 0 and var_28_21 or var_28_21 * (var_28_26 / var_28_25)

				if var_28_27 > 0 and var_28_21 < var_28_27 then
					arg_25_1.talkMaxDuration = var_28_27

					if var_28_27 + var_28_20 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_27 + var_28_20
					end
				end

				arg_25_1.text_.text = var_28_24
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201006", "story_v_side_new_1104201.awb") ~= 0 then
					local var_28_28 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201006", "story_v_side_new_1104201.awb") / 1000

					if var_28_28 + var_28_20 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_28 + var_28_20
					end

					if var_28_23.prefab_name ~= "" and arg_25_1.actors_[var_28_23.prefab_name] ~= nil then
						local var_28_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_23.prefab_name].transform, "story_v_side_new_1104201", "1104201006", "story_v_side_new_1104201.awb")

						arg_25_1:RecordAudio("1104201006", var_28_29)
						arg_25_1:RecordAudio("1104201006", var_28_29)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201006", "story_v_side_new_1104201.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201006", "story_v_side_new_1104201.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_30 = math.max(var_28_21, arg_25_1.talkMaxDuration)

			if var_28_20 <= arg_25_1.time_ and arg_25_1.time_ < var_28_20 + var_28_30 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_20) / var_28_30

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_20 + var_28_30 and arg_25_1.time_ < var_28_20 + var_28_30 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 1104201007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play1104201008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["6045_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and not isNil(var_32_0) and arg_29_1.var_.characterEffect6045_story == nil then
				arg_29_1.var_.characterEffect6045_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.200000002980232

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 and not isNil(var_32_0) then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect6045_story and not isNil(var_32_0) then
					local var_32_4 = Mathf.Lerp(0, 0.5, var_32_3)

					arg_29_1.var_.characterEffect6045_story.fillFlat = true
					arg_29_1.var_.characterEffect6045_story.fillRatio = var_32_4
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and not isNil(var_32_0) and arg_29_1.var_.characterEffect6045_story then
				local var_32_5 = 0.5

				arg_29_1.var_.characterEffect6045_story.fillFlat = true
				arg_29_1.var_.characterEffect6045_story.fillRatio = var_32_5
			end

			local var_32_6 = 0
			local var_32_7 = 0.45

			if var_32_6 < arg_29_1.time_ and arg_29_1.time_ <= var_32_6 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_8 = arg_29_1:FormatText(StoryNameCfg[7].name)

				arg_29_1.leftNameTxt_.text = var_32_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_29_1.callingController_:SetSelectedState("normal")

				arg_29_1.keyicon_.color = Color.New(1, 1, 1)
				arg_29_1.icon_.color = Color.New(1, 1, 1)

				local var_32_9 = arg_29_1:GetWordFromCfg(1104201007)
				local var_32_10 = arg_29_1:FormatText(var_32_9.content)

				arg_29_1.text_.text = var_32_10

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_11 = 18
				local var_32_12 = utf8.len(var_32_10)
				local var_32_13 = var_32_11 <= 0 and var_32_7 or var_32_7 * (var_32_12 / var_32_11)

				if var_32_13 > 0 and var_32_7 < var_32_13 then
					arg_29_1.talkMaxDuration = var_32_13

					if var_32_13 + var_32_6 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_13 + var_32_6
					end
				end

				arg_29_1.text_.text = var_32_10
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_14 = math.max(var_32_7, arg_29_1.talkMaxDuration)

			if var_32_6 <= arg_29_1.time_ and arg_29_1.time_ < var_32_6 + var_32_14 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_6) / var_32_14

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_6 + var_32_14 and arg_29_1.time_ < var_32_6 + var_32_14 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 1104201008
		arg_33_1.duration_ = 7.53

		local var_33_0 = {
			ja = 7.333,
			ko = 7.533,
			zh = 7.533
		}
		local var_33_1 = manager.audio:GetLocalizationFlag()

		if var_33_0[var_33_1] ~= nil then
			arg_33_1.duration_ = var_33_0[var_33_1]
		end

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play1104201009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["6045_story"].transform
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 then
				arg_33_1.var_.moveOldPos6045_story = var_36_0.localPosition
			end

			local var_36_2 = 0.001

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2
				local var_36_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_36_0.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos6045_story, var_36_4, var_36_3)

				local var_36_5 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_5.x, var_36_5.y, var_36_5.z)

				local var_36_6 = var_36_0.localEulerAngles

				var_36_6.z = 0
				var_36_6.x = 0
				var_36_0.localEulerAngles = var_36_6
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 then
				var_36_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_36_7 = manager.ui.mainCamera.transform.position - var_36_0.position

				var_36_0.forward = Vector3.New(var_36_7.x, var_36_7.y, var_36_7.z)

				local var_36_8 = var_36_0.localEulerAngles

				var_36_8.z = 0
				var_36_8.x = 0
				var_36_0.localEulerAngles = var_36_8
			end

			local var_36_9 = arg_33_1.actors_["6045_story"]
			local var_36_10 = 0

			if var_36_10 < arg_33_1.time_ and arg_33_1.time_ <= var_36_10 + arg_36_0 and not isNil(var_36_9) and arg_33_1.var_.characterEffect6045_story == nil then
				arg_33_1.var_.characterEffect6045_story = var_36_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_11 = 0.200000002980232

			if var_36_10 <= arg_33_1.time_ and arg_33_1.time_ < var_36_10 + var_36_11 and not isNil(var_36_9) then
				local var_36_12 = (arg_33_1.time_ - var_36_10) / var_36_11

				if arg_33_1.var_.characterEffect6045_story and not isNil(var_36_9) then
					local var_36_13 = Mathf.Lerp(0, 0.5, var_36_12)

					arg_33_1.var_.characterEffect6045_story.fillFlat = true
					arg_33_1.var_.characterEffect6045_story.fillRatio = var_36_13
				end
			end

			if arg_33_1.time_ >= var_36_10 + var_36_11 and arg_33_1.time_ < var_36_10 + var_36_11 + arg_36_0 and not isNil(var_36_9) and arg_33_1.var_.characterEffect6045_story then
				local var_36_14 = 0.5

				arg_33_1.var_.characterEffect6045_story.fillFlat = true
				arg_33_1.var_.characterEffect6045_story.fillRatio = var_36_14
			end

			local var_36_15 = "6046_story"

			if arg_33_1.actors_[var_36_15] == nil then
				local var_36_16 = Asset.Load("Char/" .. "6046_story")

				if not isNil(var_36_16) then
					local var_36_17 = Object.Instantiate(Asset.Load("Char/" .. "6046_story"), arg_33_1.stage_.transform)

					var_36_17.name = var_36_15
					var_36_17.transform.localPosition = Vector3.New(0, 100, 0)
					arg_33_1.actors_[var_36_15] = var_36_17

					local var_36_18 = var_36_17:GetComponentInChildren(typeof(CharacterEffect))

					var_36_18.enabled = true

					local var_36_19 = GameObjectTools.GetOrAddComponent(var_36_17, typeof(DynamicBoneHelper))

					if var_36_19 then
						var_36_19:EnableDynamicBone(false)
					end

					arg_33_1:ShowWeapon(var_36_18.transform, false)

					arg_33_1.var_[var_36_15 .. "Animator"] = var_36_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_33_1.var_[var_36_15 .. "Animator"].applyRootMotion = true
					arg_33_1.var_[var_36_15 .. "LipSync"] = var_36_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_36_20 = arg_33_1.actors_["6046_story"].transform
			local var_36_21 = 0

			if var_36_21 < arg_33_1.time_ and arg_33_1.time_ <= var_36_21 + arg_36_0 then
				arg_33_1.var_.moveOldPos6046_story = var_36_20.localPosition
			end

			local var_36_22 = 0.001

			if var_36_21 <= arg_33_1.time_ and arg_33_1.time_ < var_36_21 + var_36_22 then
				local var_36_23 = (arg_33_1.time_ - var_36_21) / var_36_22
				local var_36_24 = Vector3.New(0.7, -0.5, -6.3)

				var_36_20.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos6046_story, var_36_24, var_36_23)

				local var_36_25 = manager.ui.mainCamera.transform.position - var_36_20.position

				var_36_20.forward = Vector3.New(var_36_25.x, var_36_25.y, var_36_25.z)

				local var_36_26 = var_36_20.localEulerAngles

				var_36_26.z = 0
				var_36_26.x = 0
				var_36_20.localEulerAngles = var_36_26
			end

			if arg_33_1.time_ >= var_36_21 + var_36_22 and arg_33_1.time_ < var_36_21 + var_36_22 + arg_36_0 then
				var_36_20.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_36_27 = manager.ui.mainCamera.transform.position - var_36_20.position

				var_36_20.forward = Vector3.New(var_36_27.x, var_36_27.y, var_36_27.z)

				local var_36_28 = var_36_20.localEulerAngles

				var_36_28.z = 0
				var_36_28.x = 0
				var_36_20.localEulerAngles = var_36_28
			end

			local var_36_29 = arg_33_1.actors_["6046_story"]
			local var_36_30 = 0

			if var_36_30 < arg_33_1.time_ and arg_33_1.time_ <= var_36_30 + arg_36_0 and not isNil(var_36_29) and arg_33_1.var_.characterEffect6046_story == nil then
				arg_33_1.var_.characterEffect6046_story = var_36_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_31 = 0.200000002980232

			if var_36_30 <= arg_33_1.time_ and arg_33_1.time_ < var_36_30 + var_36_31 and not isNil(var_36_29) then
				local var_36_32 = (arg_33_1.time_ - var_36_30) / var_36_31

				if arg_33_1.var_.characterEffect6046_story and not isNil(var_36_29) then
					arg_33_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_30 + var_36_31 and arg_33_1.time_ < var_36_30 + var_36_31 + arg_36_0 and not isNil(var_36_29) and arg_33_1.var_.characterEffect6046_story then
				arg_33_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_36_33 = 0

			if var_36_33 < arg_33_1.time_ and arg_33_1.time_ <= var_36_33 + arg_36_0 then
				arg_33_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_36_34 = 0

			if var_36_34 < arg_33_1.time_ and arg_33_1.time_ <= var_36_34 + arg_36_0 then
				arg_33_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_36_35 = 0
			local var_36_36 = 0.725

			if var_36_35 < arg_33_1.time_ and arg_33_1.time_ <= var_36_35 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_37 = arg_33_1:FormatText(StoryNameCfg[214].name)

				arg_33_1.leftNameTxt_.text = var_36_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_38 = arg_33_1:GetWordFromCfg(1104201008)
				local var_36_39 = arg_33_1:FormatText(var_36_38.content)

				arg_33_1.text_.text = var_36_39

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_40 = 29
				local var_36_41 = utf8.len(var_36_39)
				local var_36_42 = var_36_40 <= 0 and var_36_36 or var_36_36 * (var_36_41 / var_36_40)

				if var_36_42 > 0 and var_36_36 < var_36_42 then
					arg_33_1.talkMaxDuration = var_36_42

					if var_36_42 + var_36_35 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_42 + var_36_35
					end
				end

				arg_33_1.text_.text = var_36_39
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201008", "story_v_side_new_1104201.awb") ~= 0 then
					local var_36_43 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201008", "story_v_side_new_1104201.awb") / 1000

					if var_36_43 + var_36_35 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_43 + var_36_35
					end

					if var_36_38.prefab_name ~= "" and arg_33_1.actors_[var_36_38.prefab_name] ~= nil then
						local var_36_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_38.prefab_name].transform, "story_v_side_new_1104201", "1104201008", "story_v_side_new_1104201.awb")

						arg_33_1:RecordAudio("1104201008", var_36_44)
						arg_33_1:RecordAudio("1104201008", var_36_44)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201008", "story_v_side_new_1104201.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201008", "story_v_side_new_1104201.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_45 = math.max(var_36_36, arg_33_1.talkMaxDuration)

			if var_36_35 <= arg_33_1.time_ and arg_33_1.time_ < var_36_35 + var_36_45 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_35) / var_36_45

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_35 + var_36_45 and arg_33_1.time_ < var_36_35 + var_36_45 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 1104201009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play1104201010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["6046_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect6046_story == nil then
				arg_37_1.var_.characterEffect6046_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 and not isNil(var_40_0) then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect6046_story and not isNil(var_40_0) then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect6046_story.fillFlat = true
					arg_37_1.var_.characterEffect6046_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect6046_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect6046_story.fillFlat = true
				arg_37_1.var_.characterEffect6046_story.fillRatio = var_40_5
			end

			local var_40_6 = 0
			local var_40_7 = 0.425

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_8 = arg_37_1:FormatText(StoryNameCfg[7].name)

				arg_37_1.leftNameTxt_.text = var_40_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, true)
				arg_37_1.iconController_:SetSelectedState("hero")

				arg_37_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_37_1.callingController_:SetSelectedState("normal")

				arg_37_1.keyicon_.color = Color.New(1, 1, 1)
				arg_37_1.icon_.color = Color.New(1, 1, 1)

				local var_40_9 = arg_37_1:GetWordFromCfg(1104201009)
				local var_40_10 = arg_37_1:FormatText(var_40_9.content)

				arg_37_1.text_.text = var_40_10

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_11 = 17
				local var_40_12 = utf8.len(var_40_10)
				local var_40_13 = var_40_11 <= 0 and var_40_7 or var_40_7 * (var_40_12 / var_40_11)

				if var_40_13 > 0 and var_40_7 < var_40_13 then
					arg_37_1.talkMaxDuration = var_40_13

					if var_40_13 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_13 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_10
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_14 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_14 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_14

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_14 and arg_37_1.time_ < var_40_6 + var_40_14 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 1104201010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play1104201011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.65

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[7].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_41_1.callingController_:SetSelectedState("normal")

				arg_41_1.keyicon_.color = Color.New(1, 1, 1)
				arg_41_1.icon_.color = Color.New(1, 1, 1)

				local var_44_3 = arg_41_1:GetWordFromCfg(1104201010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 26
				local var_44_6 = utf8.len(var_44_4)
				local var_44_7 = var_44_5 <= 0 and var_44_1 or var_44_1 * (var_44_6 / var_44_5)

				if var_44_7 > 0 and var_44_1 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_4
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_8 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_8 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_8

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_8 and arg_41_1.time_ < var_44_0 + var_44_8 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 1104201011
		arg_45_1.duration_ = 12.13

		local var_45_0 = {
			ja = 12.133,
			ko = 9.233,
			zh = 9.233
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play1104201012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["6046_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and not isNil(var_48_0) and arg_45_1.var_.characterEffect6046_story == nil then
				arg_45_1.var_.characterEffect6046_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 and not isNil(var_48_0) then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect6046_story and not isNil(var_48_0) then
					arg_45_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and not isNil(var_48_0) and arg_45_1.var_.characterEffect6046_story then
				arg_45_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_48_4 = 0

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_2")
			end

			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_48_6 = 0
			local var_48_7 = 0.925

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_8 = arg_45_1:FormatText(StoryNameCfg[214].name)

				arg_45_1.leftNameTxt_.text = var_48_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_9 = arg_45_1:GetWordFromCfg(1104201011)
				local var_48_10 = arg_45_1:FormatText(var_48_9.content)

				arg_45_1.text_.text = var_48_10

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_11 = 37
				local var_48_12 = utf8.len(var_48_10)
				local var_48_13 = var_48_11 <= 0 and var_48_7 or var_48_7 * (var_48_12 / var_48_11)

				if var_48_13 > 0 and var_48_7 < var_48_13 then
					arg_45_1.talkMaxDuration = var_48_13

					if var_48_13 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_13 + var_48_6
					end
				end

				arg_45_1.text_.text = var_48_10
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201011", "story_v_side_new_1104201.awb") ~= 0 then
					local var_48_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201011", "story_v_side_new_1104201.awb") / 1000

					if var_48_14 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_14 + var_48_6
					end

					if var_48_9.prefab_name ~= "" and arg_45_1.actors_[var_48_9.prefab_name] ~= nil then
						local var_48_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_9.prefab_name].transform, "story_v_side_new_1104201", "1104201011", "story_v_side_new_1104201.awb")

						arg_45_1:RecordAudio("1104201011", var_48_15)
						arg_45_1:RecordAudio("1104201011", var_48_15)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201011", "story_v_side_new_1104201.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201011", "story_v_side_new_1104201.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_7, arg_45_1.talkMaxDuration)

			if var_48_6 <= arg_45_1.time_ and arg_45_1.time_ < var_48_6 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_6) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_6 + var_48_16 and arg_45_1.time_ < var_48_6 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 1104201012
		arg_49_1.duration_ = 4.4

		local var_49_0 = {
			ja = 3.566,
			ko = 4.4,
			zh = 4.4
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
				arg_49_0:Play1104201013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["6045_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect6045_story == nil then
				arg_49_1.var_.characterEffect6045_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 and not isNil(var_52_0) then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect6045_story and not isNil(var_52_0) then
					arg_49_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect6045_story then
				arg_49_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_52_4 = 0

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_52_6 = arg_49_1.actors_["6046_story"]
			local var_52_7 = 0

			if var_52_7 < arg_49_1.time_ and arg_49_1.time_ <= var_52_7 + arg_52_0 and not isNil(var_52_6) and arg_49_1.var_.characterEffect6046_story == nil then
				arg_49_1.var_.characterEffect6046_story = var_52_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_8 = 0.200000002980232

			if var_52_7 <= arg_49_1.time_ and arg_49_1.time_ < var_52_7 + var_52_8 and not isNil(var_52_6) then
				local var_52_9 = (arg_49_1.time_ - var_52_7) / var_52_8

				if arg_49_1.var_.characterEffect6046_story and not isNil(var_52_6) then
					local var_52_10 = Mathf.Lerp(0, 0.5, var_52_9)

					arg_49_1.var_.characterEffect6046_story.fillFlat = true
					arg_49_1.var_.characterEffect6046_story.fillRatio = var_52_10
				end
			end

			if arg_49_1.time_ >= var_52_7 + var_52_8 and arg_49_1.time_ < var_52_7 + var_52_8 + arg_52_0 and not isNil(var_52_6) and arg_49_1.var_.characterEffect6046_story then
				local var_52_11 = 0.5

				arg_49_1.var_.characterEffect6046_story.fillFlat = true
				arg_49_1.var_.characterEffect6046_story.fillRatio = var_52_11
			end

			local var_52_12 = 0
			local var_52_13 = 0.4

			if var_52_12 < arg_49_1.time_ and arg_49_1.time_ <= var_52_12 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_14 = arg_49_1:FormatText(StoryNameCfg[215].name)

				arg_49_1.leftNameTxt_.text = var_52_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_15 = arg_49_1:GetWordFromCfg(1104201012)
				local var_52_16 = arg_49_1:FormatText(var_52_15.content)

				arg_49_1.text_.text = var_52_16

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_17 = 16
				local var_52_18 = utf8.len(var_52_16)
				local var_52_19 = var_52_17 <= 0 and var_52_13 or var_52_13 * (var_52_18 / var_52_17)

				if var_52_19 > 0 and var_52_13 < var_52_19 then
					arg_49_1.talkMaxDuration = var_52_19

					if var_52_19 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_19 + var_52_12
					end
				end

				arg_49_1.text_.text = var_52_16
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201012", "story_v_side_new_1104201.awb") ~= 0 then
					local var_52_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201012", "story_v_side_new_1104201.awb") / 1000

					if var_52_20 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_20 + var_52_12
					end

					if var_52_15.prefab_name ~= "" and arg_49_1.actors_[var_52_15.prefab_name] ~= nil then
						local var_52_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_15.prefab_name].transform, "story_v_side_new_1104201", "1104201012", "story_v_side_new_1104201.awb")

						arg_49_1:RecordAudio("1104201012", var_52_21)
						arg_49_1:RecordAudio("1104201012", var_52_21)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201012", "story_v_side_new_1104201.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201012", "story_v_side_new_1104201.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_13, arg_49_1.talkMaxDuration)

			if var_52_12 <= arg_49_1.time_ and arg_49_1.time_ < var_52_12 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_12) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_12 + var_52_22 and arg_49_1.time_ < var_52_12 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 1104201013
		arg_53_1.duration_ = 5.07

		local var_53_0 = {
			ja = 5.066,
			ko = 3.866,
			zh = 3.866
		}
		local var_53_1 = manager.audio:GetLocalizationFlag()

		if var_53_0[var_53_1] ~= nil then
			arg_53_1.duration_ = var_53_0[var_53_1]
		end

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play1104201014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["6046_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and not isNil(var_56_0) and arg_53_1.var_.characterEffect6046_story == nil then
				arg_53_1.var_.characterEffect6046_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 and not isNil(var_56_0) then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect6046_story and not isNil(var_56_0) then
					arg_53_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and not isNil(var_56_0) and arg_53_1.var_.characterEffect6046_story then
				arg_53_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_56_4 = 0

			if var_56_4 < arg_53_1.time_ and arg_53_1.time_ <= var_56_4 + arg_56_0 then
				arg_53_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_56_5 = 0

			if var_56_5 < arg_53_1.time_ and arg_53_1.time_ <= var_56_5 + arg_56_0 then
				arg_53_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_6 = arg_53_1.actors_["6045_story"]
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 and not isNil(var_56_6) and arg_53_1.var_.characterEffect6045_story == nil then
				arg_53_1.var_.characterEffect6045_story = var_56_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_8 = 0.200000002980232

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 and not isNil(var_56_6) then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8

				if arg_53_1.var_.characterEffect6045_story and not isNil(var_56_6) then
					local var_56_10 = Mathf.Lerp(0, 0.5, var_56_9)

					arg_53_1.var_.characterEffect6045_story.fillFlat = true
					arg_53_1.var_.characterEffect6045_story.fillRatio = var_56_10
				end
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 and not isNil(var_56_6) and arg_53_1.var_.characterEffect6045_story then
				local var_56_11 = 0.5

				arg_53_1.var_.characterEffect6045_story.fillFlat = true
				arg_53_1.var_.characterEffect6045_story.fillRatio = var_56_11
			end

			local var_56_12 = 0
			local var_56_13 = 0.4

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_14 = arg_53_1:FormatText(StoryNameCfg[214].name)

				arg_53_1.leftNameTxt_.text = var_56_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_15 = arg_53_1:GetWordFromCfg(1104201013)
				local var_56_16 = arg_53_1:FormatText(var_56_15.content)

				arg_53_1.text_.text = var_56_16

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_17 = 16
				local var_56_18 = utf8.len(var_56_16)
				local var_56_19 = var_56_17 <= 0 and var_56_13 or var_56_13 * (var_56_18 / var_56_17)

				if var_56_19 > 0 and var_56_13 < var_56_19 then
					arg_53_1.talkMaxDuration = var_56_19

					if var_56_19 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_19 + var_56_12
					end
				end

				arg_53_1.text_.text = var_56_16
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201013", "story_v_side_new_1104201.awb") ~= 0 then
					local var_56_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201013", "story_v_side_new_1104201.awb") / 1000

					if var_56_20 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_20 + var_56_12
					end

					if var_56_15.prefab_name ~= "" and arg_53_1.actors_[var_56_15.prefab_name] ~= nil then
						local var_56_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_15.prefab_name].transform, "story_v_side_new_1104201", "1104201013", "story_v_side_new_1104201.awb")

						arg_53_1:RecordAudio("1104201013", var_56_21)
						arg_53_1:RecordAudio("1104201013", var_56_21)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201013", "story_v_side_new_1104201.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201013", "story_v_side_new_1104201.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_22 = math.max(var_56_13, arg_53_1.talkMaxDuration)

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_22 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_12) / var_56_22

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_12 + var_56_22 and arg_53_1.time_ < var_56_12 + var_56_22 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 1104201014
		arg_57_1.duration_ = 5.97

		local var_57_0 = {
			ja = 5.966,
			ko = 5.866,
			zh = 5.866
		}
		local var_57_1 = manager.audio:GetLocalizationFlag()

		if var_57_0[var_57_1] ~= nil then
			arg_57_1.duration_ = var_57_0[var_57_1]
		end

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play1104201015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["6045_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and not isNil(var_60_0) and arg_57_1.var_.characterEffect6045_story == nil then
				arg_57_1.var_.characterEffect6045_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.200000002980232

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 and not isNil(var_60_0) then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect6045_story and not isNil(var_60_0) then
					arg_57_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and not isNil(var_60_0) and arg_57_1.var_.characterEffect6045_story then
				arg_57_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_60_4 = 0

			if var_60_4 < arg_57_1.time_ and arg_57_1.time_ <= var_60_4 + arg_60_0 then
				arg_57_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_2")
			end

			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 then
				arg_57_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_60_6 = arg_57_1.actors_["6046_story"]
			local var_60_7 = 0

			if var_60_7 < arg_57_1.time_ and arg_57_1.time_ <= var_60_7 + arg_60_0 and not isNil(var_60_6) and arg_57_1.var_.characterEffect6046_story == nil then
				arg_57_1.var_.characterEffect6046_story = var_60_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_8 = 0.200000002980232

			if var_60_7 <= arg_57_1.time_ and arg_57_1.time_ < var_60_7 + var_60_8 and not isNil(var_60_6) then
				local var_60_9 = (arg_57_1.time_ - var_60_7) / var_60_8

				if arg_57_1.var_.characterEffect6046_story and not isNil(var_60_6) then
					local var_60_10 = Mathf.Lerp(0, 0.5, var_60_9)

					arg_57_1.var_.characterEffect6046_story.fillFlat = true
					arg_57_1.var_.characterEffect6046_story.fillRatio = var_60_10
				end
			end

			if arg_57_1.time_ >= var_60_7 + var_60_8 and arg_57_1.time_ < var_60_7 + var_60_8 + arg_60_0 and not isNil(var_60_6) and arg_57_1.var_.characterEffect6046_story then
				local var_60_11 = 0.5

				arg_57_1.var_.characterEffect6046_story.fillFlat = true
				arg_57_1.var_.characterEffect6046_story.fillRatio = var_60_11
			end

			local var_60_12 = 0
			local var_60_13 = 0.475

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_14 = arg_57_1:FormatText(StoryNameCfg[215].name)

				arg_57_1.leftNameTxt_.text = var_60_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_15 = arg_57_1:GetWordFromCfg(1104201014)
				local var_60_16 = arg_57_1:FormatText(var_60_15.content)

				arg_57_1.text_.text = var_60_16

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_17 = 19
				local var_60_18 = utf8.len(var_60_16)
				local var_60_19 = var_60_17 <= 0 and var_60_13 or var_60_13 * (var_60_18 / var_60_17)

				if var_60_19 > 0 and var_60_13 < var_60_19 then
					arg_57_1.talkMaxDuration = var_60_19

					if var_60_19 + var_60_12 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_12
					end
				end

				arg_57_1.text_.text = var_60_16
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201014", "story_v_side_new_1104201.awb") ~= 0 then
					local var_60_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201014", "story_v_side_new_1104201.awb") / 1000

					if var_60_20 + var_60_12 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_20 + var_60_12
					end

					if var_60_15.prefab_name ~= "" and arg_57_1.actors_[var_60_15.prefab_name] ~= nil then
						local var_60_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_15.prefab_name].transform, "story_v_side_new_1104201", "1104201014", "story_v_side_new_1104201.awb")

						arg_57_1:RecordAudio("1104201014", var_60_21)
						arg_57_1:RecordAudio("1104201014", var_60_21)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201014", "story_v_side_new_1104201.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201014", "story_v_side_new_1104201.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_22 = math.max(var_60_13, arg_57_1.talkMaxDuration)

			if var_60_12 <= arg_57_1.time_ and arg_57_1.time_ < var_60_12 + var_60_22 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_12) / var_60_22

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_12 + var_60_22 and arg_57_1.time_ < var_60_12 + var_60_22 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 1104201015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play1104201016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["6045_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect6045_story == nil then
				arg_61_1.var_.characterEffect6045_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 and not isNil(var_64_0) then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect6045_story and not isNil(var_64_0) then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect6045_story.fillFlat = true
					arg_61_1.var_.characterEffect6045_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect6045_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect6045_story.fillFlat = true
				arg_61_1.var_.characterEffect6045_story.fillRatio = var_64_5
			end

			local var_64_6 = 0
			local var_64_7 = 0.05

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_8 = arg_61_1:FormatText(StoryNameCfg[7].name)

				arg_61_1.leftNameTxt_.text = var_64_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_61_1.callingController_:SetSelectedState("normal")

				arg_61_1.keyicon_.color = Color.New(1, 1, 1)
				arg_61_1.icon_.color = Color.New(1, 1, 1)

				local var_64_9 = arg_61_1:GetWordFromCfg(1104201015)
				local var_64_10 = arg_61_1:FormatText(var_64_9.content)

				arg_61_1.text_.text = var_64_10

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_11 = 2
				local var_64_12 = utf8.len(var_64_10)
				local var_64_13 = var_64_11 <= 0 and var_64_7 or var_64_7 * (var_64_12 / var_64_11)

				if var_64_13 > 0 and var_64_7 < var_64_13 then
					arg_61_1.talkMaxDuration = var_64_13

					if var_64_13 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_13 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_10
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_14 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_14 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_14

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_14 and arg_61_1.time_ < var_64_6 + var_64_14 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 1104201016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play1104201017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.8

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_65_1.callingController_:SetSelectedState("normal")

				arg_65_1.keyicon_.color = Color.New(1, 1, 1)
				arg_65_1.icon_.color = Color.New(1, 1, 1)

				local var_68_3 = arg_65_1:GetWordFromCfg(1104201016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 32
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_8 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_8 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_8

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_8 and arg_65_1.time_ < var_68_0 + var_68_8 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1104201017
		arg_69_1.duration_ = 7.67

		local var_69_0 = {
			ja = 7.666,
			ko = 6.333,
			zh = 6.333
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
				arg_69_0:Play1104201018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["6045_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.characterEffect6045_story == nil then
				arg_69_1.var_.characterEffect6045_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 and not isNil(var_72_0) then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect6045_story and not isNil(var_72_0) then
					arg_69_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.characterEffect6045_story then
				arg_69_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_72_4 = 0

			if var_72_4 < arg_69_1.time_ and arg_69_1.time_ <= var_72_4 + arg_72_0 then
				arg_69_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_72_6 = 0
			local var_72_7 = 0.5

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_8 = arg_69_1:FormatText(StoryNameCfg[215].name)

				arg_69_1.leftNameTxt_.text = var_72_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_9 = arg_69_1:GetWordFromCfg(1104201017)
				local var_72_10 = arg_69_1:FormatText(var_72_9.content)

				arg_69_1.text_.text = var_72_10

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_11 = 20
				local var_72_12 = utf8.len(var_72_10)
				local var_72_13 = var_72_11 <= 0 and var_72_7 or var_72_7 * (var_72_12 / var_72_11)

				if var_72_13 > 0 and var_72_7 < var_72_13 then
					arg_69_1.talkMaxDuration = var_72_13

					if var_72_13 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_10
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201017", "story_v_side_new_1104201.awb") ~= 0 then
					local var_72_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201017", "story_v_side_new_1104201.awb") / 1000

					if var_72_14 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_14 + var_72_6
					end

					if var_72_9.prefab_name ~= "" and arg_69_1.actors_[var_72_9.prefab_name] ~= nil then
						local var_72_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_9.prefab_name].transform, "story_v_side_new_1104201", "1104201017", "story_v_side_new_1104201.awb")

						arg_69_1:RecordAudio("1104201017", var_72_15)
						arg_69_1:RecordAudio("1104201017", var_72_15)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201017", "story_v_side_new_1104201.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201017", "story_v_side_new_1104201.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_16 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_16 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_16

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_16 and arg_69_1.time_ < var_72_6 + var_72_16 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1104201018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play1104201019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["6045_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect6045_story == nil then
				arg_73_1.var_.characterEffect6045_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 and not isNil(var_76_0) then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect6045_story and not isNil(var_76_0) then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect6045_story.fillFlat = true
					arg_73_1.var_.characterEffect6045_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and not isNil(var_76_0) and arg_73_1.var_.characterEffect6045_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect6045_story.fillFlat = true
				arg_73_1.var_.characterEffect6045_story.fillRatio = var_76_5
			end

			local var_76_6 = 0
			local var_76_7 = 0.1

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_73_1.callingController_:SetSelectedState("normal")

				arg_73_1.keyicon_.color = Color.New(1, 1, 1)
				arg_73_1.icon_.color = Color.New(1, 1, 1)

				local var_76_9 = arg_73_1:GetWordFromCfg(1104201018)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 4
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_14 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_14 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_14

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_14 and arg_73_1.time_ < var_76_6 + var_76_14 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1104201019
		arg_77_1.duration_ = 7.87

		local var_77_0 = {
			ja = 6.466,
			ko = 7.866,
			zh = 7.866
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1104201020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["6046_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and not isNil(var_80_0) and arg_77_1.var_.characterEffect6046_story == nil then
				arg_77_1.var_.characterEffect6046_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 and not isNil(var_80_0) then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect6046_story and not isNil(var_80_0) then
					arg_77_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and not isNil(var_80_0) and arg_77_1.var_.characterEffect6046_story then
				arg_77_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_6 = 0
			local var_80_7 = 0.775

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[214].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(1104201019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 31
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201019", "story_v_side_new_1104201.awb") ~= 0 then
					local var_80_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201019", "story_v_side_new_1104201.awb") / 1000

					if var_80_14 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_14 + var_80_6
					end

					if var_80_9.prefab_name ~= "" and arg_77_1.actors_[var_80_9.prefab_name] ~= nil then
						local var_80_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_9.prefab_name].transform, "story_v_side_new_1104201", "1104201019", "story_v_side_new_1104201.awb")

						arg_77_1:RecordAudio("1104201019", var_80_15)
						arg_77_1:RecordAudio("1104201019", var_80_15)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201019", "story_v_side_new_1104201.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201019", "story_v_side_new_1104201.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_16 and arg_77_1.time_ < var_80_6 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1104201020
		arg_81_1.duration_ = 5

		local var_81_0 = {
			ja = 4.566,
			ko = 5,
			zh = 5
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1104201021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["6045_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and not isNil(var_84_0) and arg_81_1.var_.characterEffect6045_story == nil then
				arg_81_1.var_.characterEffect6045_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 and not isNil(var_84_0) then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect6045_story and not isNil(var_84_0) then
					arg_81_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and not isNil(var_84_0) and arg_81_1.var_.characterEffect6045_story then
				arg_81_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_84_4 = 0

			if var_84_4 < arg_81_1.time_ and arg_81_1.time_ <= var_84_4 + arg_84_0 then
				arg_81_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 then
				arg_81_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_84_6 = arg_81_1.actors_["6046_story"]
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 and not isNil(var_84_6) and arg_81_1.var_.characterEffect6046_story == nil then
				arg_81_1.var_.characterEffect6046_story = var_84_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_8 = 0.200000002980232

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_8 and not isNil(var_84_6) then
				local var_84_9 = (arg_81_1.time_ - var_84_7) / var_84_8

				if arg_81_1.var_.characterEffect6046_story and not isNil(var_84_6) then
					local var_84_10 = Mathf.Lerp(0, 0.5, var_84_9)

					arg_81_1.var_.characterEffect6046_story.fillFlat = true
					arg_81_1.var_.characterEffect6046_story.fillRatio = var_84_10
				end
			end

			if arg_81_1.time_ >= var_84_7 + var_84_8 and arg_81_1.time_ < var_84_7 + var_84_8 + arg_84_0 and not isNil(var_84_6) and arg_81_1.var_.characterEffect6046_story then
				local var_84_11 = 0.5

				arg_81_1.var_.characterEffect6046_story.fillFlat = true
				arg_81_1.var_.characterEffect6046_story.fillRatio = var_84_11
			end

			local var_84_12 = 0
			local var_84_13 = 0.475

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_14 = arg_81_1:FormatText(StoryNameCfg[215].name)

				arg_81_1.leftNameTxt_.text = var_84_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_15 = arg_81_1:GetWordFromCfg(1104201020)
				local var_84_16 = arg_81_1:FormatText(var_84_15.content)

				arg_81_1.text_.text = var_84_16

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_17 = 19
				local var_84_18 = utf8.len(var_84_16)
				local var_84_19 = var_84_17 <= 0 and var_84_13 or var_84_13 * (var_84_18 / var_84_17)

				if var_84_19 > 0 and var_84_13 < var_84_19 then
					arg_81_1.talkMaxDuration = var_84_19

					if var_84_19 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_12
					end
				end

				arg_81_1.text_.text = var_84_16
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201020", "story_v_side_new_1104201.awb") ~= 0 then
					local var_84_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201020", "story_v_side_new_1104201.awb") / 1000

					if var_84_20 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_12
					end

					if var_84_15.prefab_name ~= "" and arg_81_1.actors_[var_84_15.prefab_name] ~= nil then
						local var_84_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_15.prefab_name].transform, "story_v_side_new_1104201", "1104201020", "story_v_side_new_1104201.awb")

						arg_81_1:RecordAudio("1104201020", var_84_21)
						arg_81_1:RecordAudio("1104201020", var_84_21)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201020", "story_v_side_new_1104201.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201020", "story_v_side_new_1104201.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_22 = math.max(var_84_13, arg_81_1.talkMaxDuration)

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_22 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_12) / var_84_22

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_12 + var_84_22 and arg_81_1.time_ < var_84_12 + var_84_22 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1104201021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1104201022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["6045_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and not isNil(var_88_0) and arg_85_1.var_.characterEffect6045_story == nil then
				arg_85_1.var_.characterEffect6045_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 and not isNil(var_88_0) then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect6045_story and not isNil(var_88_0) then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect6045_story.fillFlat = true
					arg_85_1.var_.characterEffect6045_story.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and not isNil(var_88_0) and arg_85_1.var_.characterEffect6045_story then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect6045_story.fillFlat = true
				arg_85_1.var_.characterEffect6045_story.fillRatio = var_88_5
			end

			local var_88_6 = 0
			local var_88_7 = 0.125

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_8 = arg_85_1:FormatText(StoryNameCfg[7].name)

				arg_85_1.leftNameTxt_.text = var_88_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_85_1.callingController_:SetSelectedState("normal")

				arg_85_1.keyicon_.color = Color.New(1, 1, 1)
				arg_85_1.icon_.color = Color.New(1, 1, 1)

				local var_88_9 = arg_85_1:GetWordFromCfg(1104201021)
				local var_88_10 = arg_85_1:FormatText(var_88_9.content)

				arg_85_1.text_.text = var_88_10

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_11 = 5
				local var_88_12 = utf8.len(var_88_10)
				local var_88_13 = var_88_11 <= 0 and var_88_7 or var_88_7 * (var_88_12 / var_88_11)

				if var_88_13 > 0 and var_88_7 < var_88_13 then
					arg_85_1.talkMaxDuration = var_88_13

					if var_88_13 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_13 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_10
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_14 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_14 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_14

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_14 and arg_85_1.time_ < var_88_6 + var_88_14 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1104201022
		arg_89_1.duration_ = 3.63

		local var_89_0 = {
			ja = 2.6,
			ko = 3.633,
			zh = 3.633
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1104201023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["6045_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos6045_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, 100, 0)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos6045_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, 100, 0)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = arg_89_1.actors_["6045_story"]
			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 and not isNil(var_92_9) and arg_89_1.var_.characterEffect6045_story == nil then
				arg_89_1.var_.characterEffect6045_story = var_92_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_11 = 0.200000002980232

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_11 and not isNil(var_92_9) then
				local var_92_12 = (arg_89_1.time_ - var_92_10) / var_92_11

				if arg_89_1.var_.characterEffect6045_story and not isNil(var_92_9) then
					local var_92_13 = Mathf.Lerp(0, 0.5, var_92_12)

					arg_89_1.var_.characterEffect6045_story.fillFlat = true
					arg_89_1.var_.characterEffect6045_story.fillRatio = var_92_13
				end
			end

			if arg_89_1.time_ >= var_92_10 + var_92_11 and arg_89_1.time_ < var_92_10 + var_92_11 + arg_92_0 and not isNil(var_92_9) and arg_89_1.var_.characterEffect6045_story then
				local var_92_14 = 0.5

				arg_89_1.var_.characterEffect6045_story.fillFlat = true
				arg_89_1.var_.characterEffect6045_story.fillRatio = var_92_14
			end

			local var_92_15 = arg_89_1.actors_["6046_story"].transform
			local var_92_16 = 0

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.var_.moveOldPos6046_story = var_92_15.localPosition
			end

			local var_92_17 = 0.001

			if var_92_16 <= arg_89_1.time_ and arg_89_1.time_ < var_92_16 + var_92_17 then
				local var_92_18 = (arg_89_1.time_ - var_92_16) / var_92_17
				local var_92_19 = Vector3.New(0, 100, 0)

				var_92_15.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos6046_story, var_92_19, var_92_18)

				local var_92_20 = manager.ui.mainCamera.transform.position - var_92_15.position

				var_92_15.forward = Vector3.New(var_92_20.x, var_92_20.y, var_92_20.z)

				local var_92_21 = var_92_15.localEulerAngles

				var_92_21.z = 0
				var_92_21.x = 0
				var_92_15.localEulerAngles = var_92_21
			end

			if arg_89_1.time_ >= var_92_16 + var_92_17 and arg_89_1.time_ < var_92_16 + var_92_17 + arg_92_0 then
				var_92_15.localPosition = Vector3.New(0, 100, 0)

				local var_92_22 = manager.ui.mainCamera.transform.position - var_92_15.position

				var_92_15.forward = Vector3.New(var_92_22.x, var_92_22.y, var_92_22.z)

				local var_92_23 = var_92_15.localEulerAngles

				var_92_23.z = 0
				var_92_23.x = 0
				var_92_15.localEulerAngles = var_92_23
			end

			local var_92_24 = arg_89_1.actors_["6046_story"]
			local var_92_25 = 0

			if var_92_25 < arg_89_1.time_ and arg_89_1.time_ <= var_92_25 + arg_92_0 and not isNil(var_92_24) and arg_89_1.var_.characterEffect6046_story == nil then
				arg_89_1.var_.characterEffect6046_story = var_92_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_26 = 0.200000002980232

			if var_92_25 <= arg_89_1.time_ and arg_89_1.time_ < var_92_25 + var_92_26 and not isNil(var_92_24) then
				local var_92_27 = (arg_89_1.time_ - var_92_25) / var_92_26

				if arg_89_1.var_.characterEffect6046_story and not isNil(var_92_24) then
					local var_92_28 = Mathf.Lerp(0, 0.5, var_92_27)

					arg_89_1.var_.characterEffect6046_story.fillFlat = true
					arg_89_1.var_.characterEffect6046_story.fillRatio = var_92_28
				end
			end

			if arg_89_1.time_ >= var_92_25 + var_92_26 and arg_89_1.time_ < var_92_25 + var_92_26 + arg_92_0 and not isNil(var_92_24) and arg_89_1.var_.characterEffect6046_story then
				local var_92_29 = 0.5

				arg_89_1.var_.characterEffect6046_story.fillFlat = true
				arg_89_1.var_.characterEffect6046_story.fillRatio = var_92_29
			end

			local var_92_30 = "1042ui_story"

			if arg_89_1.actors_[var_92_30] == nil then
				local var_92_31 = Asset.Load("Char/" .. "1042ui_story")

				if not isNil(var_92_31) then
					local var_92_32 = Object.Instantiate(Asset.Load("Char/" .. "1042ui_story"), arg_89_1.stage_.transform)

					var_92_32.name = var_92_30
					var_92_32.transform.localPosition = Vector3.New(0, 100, 0)
					arg_89_1.actors_[var_92_30] = var_92_32

					local var_92_33 = var_92_32:GetComponentInChildren(typeof(CharacterEffect))

					var_92_33.enabled = true

					local var_92_34 = GameObjectTools.GetOrAddComponent(var_92_32, typeof(DynamicBoneHelper))

					if var_92_34 then
						var_92_34:EnableDynamicBone(false)
					end

					arg_89_1:ShowWeapon(var_92_33.transform, false)

					arg_89_1.var_[var_92_30 .. "Animator"] = var_92_33.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_89_1.var_[var_92_30 .. "Animator"].applyRootMotion = true
					arg_89_1.var_[var_92_30 .. "LipSync"] = var_92_33.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_92_35 = arg_89_1.actors_["1042ui_story"].transform
			local var_92_36 = 0

			if var_92_36 < arg_89_1.time_ and arg_89_1.time_ <= var_92_36 + arg_92_0 then
				arg_89_1.var_.moveOldPos1042ui_story = var_92_35.localPosition
			end

			local var_92_37 = 0.001

			if var_92_36 <= arg_89_1.time_ and arg_89_1.time_ < var_92_36 + var_92_37 then
				local var_92_38 = (arg_89_1.time_ - var_92_36) / var_92_37
				local var_92_39 = Vector3.New(0, -1.06, -6.2)

				var_92_35.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1042ui_story, var_92_39, var_92_38)

				local var_92_40 = manager.ui.mainCamera.transform.position - var_92_35.position

				var_92_35.forward = Vector3.New(var_92_40.x, var_92_40.y, var_92_40.z)

				local var_92_41 = var_92_35.localEulerAngles

				var_92_41.z = 0
				var_92_41.x = 0
				var_92_35.localEulerAngles = var_92_41
			end

			if arg_89_1.time_ >= var_92_36 + var_92_37 and arg_89_1.time_ < var_92_36 + var_92_37 + arg_92_0 then
				var_92_35.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_92_42 = manager.ui.mainCamera.transform.position - var_92_35.position

				var_92_35.forward = Vector3.New(var_92_42.x, var_92_42.y, var_92_42.z)

				local var_92_43 = var_92_35.localEulerAngles

				var_92_43.z = 0
				var_92_43.x = 0
				var_92_35.localEulerAngles = var_92_43
			end

			local var_92_44 = arg_89_1.actors_["1042ui_story"]
			local var_92_45 = 0

			if var_92_45 < arg_89_1.time_ and arg_89_1.time_ <= var_92_45 + arg_92_0 and not isNil(var_92_44) and arg_89_1.var_.characterEffect1042ui_story == nil then
				arg_89_1.var_.characterEffect1042ui_story = var_92_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_46 = 0.200000002980232

			if var_92_45 <= arg_89_1.time_ and arg_89_1.time_ < var_92_45 + var_92_46 and not isNil(var_92_44) then
				local var_92_47 = (arg_89_1.time_ - var_92_45) / var_92_46

				if arg_89_1.var_.characterEffect1042ui_story and not isNil(var_92_44) then
					arg_89_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_45 + var_92_46 and arg_89_1.time_ < var_92_45 + var_92_46 + arg_92_0 and not isNil(var_92_44) and arg_89_1.var_.characterEffect1042ui_story then
				arg_89_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_92_48 = 0

			if var_92_48 < arg_89_1.time_ and arg_89_1.time_ <= var_92_48 + arg_92_0 then
				arg_89_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_92_49 = 0
			local var_92_50 = 0.425

			if var_92_49 < arg_89_1.time_ and arg_89_1.time_ <= var_92_49 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_51 = arg_89_1:FormatText(StoryNameCfg[205].name)

				arg_89_1.leftNameTxt_.text = var_92_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_52 = arg_89_1:GetWordFromCfg(1104201022)
				local var_92_53 = arg_89_1:FormatText(var_92_52.content)

				arg_89_1.text_.text = var_92_53

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_54 = 17
				local var_92_55 = utf8.len(var_92_53)
				local var_92_56 = var_92_54 <= 0 and var_92_50 or var_92_50 * (var_92_55 / var_92_54)

				if var_92_56 > 0 and var_92_50 < var_92_56 then
					arg_89_1.talkMaxDuration = var_92_56

					if var_92_56 + var_92_49 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_56 + var_92_49
					end
				end

				arg_89_1.text_.text = var_92_53
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201022", "story_v_side_new_1104201.awb") ~= 0 then
					local var_92_57 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201022", "story_v_side_new_1104201.awb") / 1000

					if var_92_57 + var_92_49 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_57 + var_92_49
					end

					if var_92_52.prefab_name ~= "" and arg_89_1.actors_[var_92_52.prefab_name] ~= nil then
						local var_92_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_52.prefab_name].transform, "story_v_side_new_1104201", "1104201022", "story_v_side_new_1104201.awb")

						arg_89_1:RecordAudio("1104201022", var_92_58)
						arg_89_1:RecordAudio("1104201022", var_92_58)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201022", "story_v_side_new_1104201.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201022", "story_v_side_new_1104201.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_59 = math.max(var_92_50, arg_89_1.talkMaxDuration)

			if var_92_49 <= arg_89_1.time_ and arg_89_1.time_ < var_92_49 + var_92_59 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_49) / var_92_59

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_49 + var_92_59 and arg_89_1.time_ < var_92_49 + var_92_59 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1104201023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1104201024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1042ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and not isNil(var_96_0) and arg_93_1.var_.characterEffect1042ui_story == nil then
				arg_93_1.var_.characterEffect1042ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 and not isNil(var_96_0) then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1042ui_story and not isNil(var_96_0) then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1042ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and not isNil(var_96_0) and arg_93_1.var_.characterEffect1042ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1042ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0
			local var_96_7 = 1.05

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_93_1.callingController_:SetSelectedState("normal")

				arg_93_1.keyicon_.color = Color.New(1, 1, 1)
				arg_93_1.icon_.color = Color.New(1, 1, 1)

				local var_96_9 = arg_93_1:GetWordFromCfg(1104201023)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 42
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
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_14 and arg_93_1.time_ < var_96_6 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1104201024
		arg_97_1.duration_ = 10.03

		local var_97_0 = {
			ja = 9.566,
			ko = 10.033,
			zh = 10.033
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1104201025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1042ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and not isNil(var_100_0) and arg_97_1.var_.characterEffect1042ui_story == nil then
				arg_97_1.var_.characterEffect1042ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 and not isNil(var_100_0) then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1042ui_story and not isNil(var_100_0) then
					arg_97_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and not isNil(var_100_0) and arg_97_1.var_.characterEffect1042ui_story then
				arg_97_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_100_4 = 0
			local var_100_5 = 1.05

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_6 = arg_97_1:FormatText(StoryNameCfg[205].name)

				arg_97_1.leftNameTxt_.text = var_100_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_7 = arg_97_1:GetWordFromCfg(1104201024)
				local var_100_8 = arg_97_1:FormatText(var_100_7.content)

				arg_97_1.text_.text = var_100_8

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_9 = 42
				local var_100_10 = utf8.len(var_100_8)
				local var_100_11 = var_100_9 <= 0 and var_100_5 or var_100_5 * (var_100_10 / var_100_9)

				if var_100_11 > 0 and var_100_5 < var_100_11 then
					arg_97_1.talkMaxDuration = var_100_11

					if var_100_11 + var_100_4 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_11 + var_100_4
					end
				end

				arg_97_1.text_.text = var_100_8
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201024", "story_v_side_new_1104201.awb") ~= 0 then
					local var_100_12 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201024", "story_v_side_new_1104201.awb") / 1000

					if var_100_12 + var_100_4 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_4
					end

					if var_100_7.prefab_name ~= "" and arg_97_1.actors_[var_100_7.prefab_name] ~= nil then
						local var_100_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_7.prefab_name].transform, "story_v_side_new_1104201", "1104201024", "story_v_side_new_1104201.awb")

						arg_97_1:RecordAudio("1104201024", var_100_13)
						arg_97_1:RecordAudio("1104201024", var_100_13)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201024", "story_v_side_new_1104201.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201024", "story_v_side_new_1104201.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_14 = math.max(var_100_5, arg_97_1.talkMaxDuration)

			if var_100_4 <= arg_97_1.time_ and arg_97_1.time_ < var_100_4 + var_100_14 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_4) / var_100_14

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_4 + var_100_14 and arg_97_1.time_ < var_100_4 + var_100_14 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1104201025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play1104201026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1042ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and not isNil(var_104_0) and arg_101_1.var_.characterEffect1042ui_story == nil then
				arg_101_1.var_.characterEffect1042ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 and not isNil(var_104_0) then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1042ui_story and not isNil(var_104_0) then
					local var_104_4 = Mathf.Lerp(0, 0.5, var_104_3)

					arg_101_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1042ui_story.fillRatio = var_104_4
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and not isNil(var_104_0) and arg_101_1.var_.characterEffect1042ui_story then
				local var_104_5 = 0.5

				arg_101_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1042ui_story.fillRatio = var_104_5
			end

			local var_104_6 = 0
			local var_104_7 = 0.825

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[7].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_101_1.callingController_:SetSelectedState("normal")

				arg_101_1.keyicon_.color = Color.New(1, 1, 1)
				arg_101_1.icon_.color = Color.New(1, 1, 1)

				local var_104_9 = arg_101_1:GetWordFromCfg(1104201025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 33
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
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_14 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_14 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_14

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_14 and arg_101_1.time_ < var_104_6 + var_104_14 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1104201026
		arg_105_1.duration_ = 8.33

		local var_105_0 = {
			ja = 8.333,
			ko = 7.9,
			zh = 7.9
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1104201027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1042ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and not isNil(var_108_0) and arg_105_1.var_.characterEffect1042ui_story == nil then
				arg_105_1.var_.characterEffect1042ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 and not isNil(var_108_0) then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1042ui_story and not isNil(var_108_0) then
					arg_105_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and not isNil(var_108_0) and arg_105_1.var_.characterEffect1042ui_story then
				arg_105_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action5_1")
			end

			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_108_6 = 0
			local var_108_7 = 0.875

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[205].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(1104201026)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 35
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201026", "story_v_side_new_1104201.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201026", "story_v_side_new_1104201.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_side_new_1104201", "1104201026", "story_v_side_new_1104201.awb")

						arg_105_1:RecordAudio("1104201026", var_108_15)
						arg_105_1:RecordAudio("1104201026", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201026", "story_v_side_new_1104201.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201026", "story_v_side_new_1104201.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_16 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_16 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_16

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_16 and arg_105_1.time_ < var_108_6 + var_108_16 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1104201027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1104201028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1042ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1042ui_story == nil then
				arg_109_1.var_.characterEffect1042ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 and not isNil(var_112_0) then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1042ui_story and not isNil(var_112_0) then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1042ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1042ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1042ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.175

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
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_109_1.callingController_:SetSelectedState("normal")

				arg_109_1.keyicon_.color = Color.New(1, 1, 1)
				arg_109_1.icon_.color = Color.New(1, 1, 1)

				local var_112_9 = arg_109_1:GetWordFromCfg(1104201027)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 7
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
	Play1104201028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1104201028
		arg_113_1.duration_ = 9.07

		local var_113_0 = {
			ja = 9.066,
			ko = 7.166,
			zh = 7.166
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1104201029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042actionlink/1042action457")
			end

			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_116_2 = arg_113_1.actors_["1042ui_story"]
			local var_116_3 = 0

			if var_116_3 < arg_113_1.time_ and arg_113_1.time_ <= var_116_3 + arg_116_0 and not isNil(var_116_2) and arg_113_1.var_.characterEffect1042ui_story == nil then
				arg_113_1.var_.characterEffect1042ui_story = var_116_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_4 = 0.200000002980232

			if var_116_3 <= arg_113_1.time_ and arg_113_1.time_ < var_116_3 + var_116_4 and not isNil(var_116_2) then
				local var_116_5 = (arg_113_1.time_ - var_116_3) / var_116_4

				if arg_113_1.var_.characterEffect1042ui_story and not isNil(var_116_2) then
					arg_113_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_3 + var_116_4 and arg_113_1.time_ < var_116_3 + var_116_4 + arg_116_0 and not isNil(var_116_2) and arg_113_1.var_.characterEffect1042ui_story then
				arg_113_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_116_6 = 0
			local var_116_7 = 0.725

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[205].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(1104201028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 29
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201028", "story_v_side_new_1104201.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201028", "story_v_side_new_1104201.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_side_new_1104201", "1104201028", "story_v_side_new_1104201.awb")

						arg_113_1:RecordAudio("1104201028", var_116_15)
						arg_113_1:RecordAudio("1104201028", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201028", "story_v_side_new_1104201.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201028", "story_v_side_new_1104201.awb")
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
	Play1104201029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1104201029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1104201030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1042ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and not isNil(var_120_0) and arg_117_1.var_.characterEffect1042ui_story == nil then
				arg_117_1.var_.characterEffect1042ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 and not isNil(var_120_0) then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1042ui_story and not isNil(var_120_0) then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1042ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and not isNil(var_120_0) and arg_117_1.var_.characterEffect1042ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1042ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.325

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[7].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, true)
				arg_117_1.iconController_:SetSelectedState("hero")

				arg_117_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_117_1.callingController_:SetSelectedState("normal")

				arg_117_1.keyicon_.color = Color.New(1, 1, 1)
				arg_117_1.icon_.color = Color.New(1, 1, 1)

				local var_120_9 = arg_117_1:GetWordFromCfg(1104201029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 13
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
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_14 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_14 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_14

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_14 and arg_117_1.time_ < var_120_6 + var_120_14 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1104201030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play1104201031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1.25

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_2 = arg_121_1:GetWordFromCfg(1104201030)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 50
				local var_124_5 = utf8.len(var_124_3)
				local var_124_6 = var_124_4 <= 0 and var_124_1 or var_124_1 * (var_124_5 / var_124_4)

				if var_124_6 > 0 and var_124_1 < var_124_6 then
					arg_121_1.talkMaxDuration = var_124_6

					if var_124_6 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_6 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_3
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_7 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_7 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_7

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_7 and arg_121_1.time_ < var_124_0 + var_124_7 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1104201031
		arg_125_1.duration_ = 12.1

		local var_125_0 = {
			ja = 12.1,
			ko = 8.1,
			zh = 8.1
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1104201032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1042ui_story"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1042ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, 100, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1042ui_story, var_128_4, var_128_3)

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

			local var_128_9 = arg_125_1.actors_["1042ui_story"]
			local var_128_10 = 0

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 and not isNil(var_128_9) and arg_125_1.var_.characterEffect1042ui_story == nil then
				arg_125_1.var_.characterEffect1042ui_story = var_128_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_11 = 0.200000002980232

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_11 and not isNil(var_128_9) then
				local var_128_12 = (arg_125_1.time_ - var_128_10) / var_128_11

				if arg_125_1.var_.characterEffect1042ui_story and not isNil(var_128_9) then
					local var_128_13 = Mathf.Lerp(0, 0.5, var_128_12)

					arg_125_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1042ui_story.fillRatio = var_128_13
				end
			end

			if arg_125_1.time_ >= var_128_10 + var_128_11 and arg_125_1.time_ < var_128_10 + var_128_11 + arg_128_0 and not isNil(var_128_9) and arg_125_1.var_.characterEffect1042ui_story then
				local var_128_14 = 0.5

				arg_125_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1042ui_story.fillRatio = var_128_14
			end

			local var_128_15 = arg_125_1.actors_["6045_story"].transform
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.var_.moveOldPos6045_story = var_128_15.localPosition
			end

			local var_128_17 = 0.001

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Vector3.New(-0.7, -0.5, -6.3)

				var_128_15.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos6045_story, var_128_19, var_128_18)

				local var_128_20 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_20.x, var_128_20.y, var_128_20.z)

				local var_128_21 = var_128_15.localEulerAngles

				var_128_21.z = 0
				var_128_21.x = 0
				var_128_15.localEulerAngles = var_128_21
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				var_128_15.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_128_22 = manager.ui.mainCamera.transform.position - var_128_15.position

				var_128_15.forward = Vector3.New(var_128_22.x, var_128_22.y, var_128_22.z)

				local var_128_23 = var_128_15.localEulerAngles

				var_128_23.z = 0
				var_128_23.x = 0
				var_128_15.localEulerAngles = var_128_23
			end

			local var_128_24 = arg_125_1.actors_["6045_story"]
			local var_128_25 = 0

			if var_128_25 < arg_125_1.time_ and arg_125_1.time_ <= var_128_25 + arg_128_0 and not isNil(var_128_24) and arg_125_1.var_.characterEffect6045_story == nil then
				arg_125_1.var_.characterEffect6045_story = var_128_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_26 = 0.200000002980232

			if var_128_25 <= arg_125_1.time_ and arg_125_1.time_ < var_128_25 + var_128_26 and not isNil(var_128_24) then
				local var_128_27 = (arg_125_1.time_ - var_128_25) / var_128_26

				if arg_125_1.var_.characterEffect6045_story and not isNil(var_128_24) then
					arg_125_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_25 + var_128_26 and arg_125_1.time_ < var_128_25 + var_128_26 + arg_128_0 and not isNil(var_128_24) and arg_125_1.var_.characterEffect6045_story then
				arg_125_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_128_28 = 0

			if var_128_28 < arg_125_1.time_ and arg_125_1.time_ <= var_128_28 + arg_128_0 then
				arg_125_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_128_29 = 0

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				arg_125_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_30 = arg_125_1.actors_["6046_story"].transform
			local var_128_31 = 0

			if var_128_31 < arg_125_1.time_ and arg_125_1.time_ <= var_128_31 + arg_128_0 then
				arg_125_1.var_.moveOldPos6046_story = var_128_30.localPosition
			end

			local var_128_32 = 0.001

			if var_128_31 <= arg_125_1.time_ and arg_125_1.time_ < var_128_31 + var_128_32 then
				local var_128_33 = (arg_125_1.time_ - var_128_31) / var_128_32
				local var_128_34 = Vector3.New(0.7, -0.5, -6.3)

				var_128_30.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos6046_story, var_128_34, var_128_33)

				local var_128_35 = manager.ui.mainCamera.transform.position - var_128_30.position

				var_128_30.forward = Vector3.New(var_128_35.x, var_128_35.y, var_128_35.z)

				local var_128_36 = var_128_30.localEulerAngles

				var_128_36.z = 0
				var_128_36.x = 0
				var_128_30.localEulerAngles = var_128_36
			end

			if arg_125_1.time_ >= var_128_31 + var_128_32 and arg_125_1.time_ < var_128_31 + var_128_32 + arg_128_0 then
				var_128_30.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_128_37 = manager.ui.mainCamera.transform.position - var_128_30.position

				var_128_30.forward = Vector3.New(var_128_37.x, var_128_37.y, var_128_37.z)

				local var_128_38 = var_128_30.localEulerAngles

				var_128_38.z = 0
				var_128_38.x = 0
				var_128_30.localEulerAngles = var_128_38
			end

			local var_128_39 = arg_125_1.actors_["6046_story"]
			local var_128_40 = 0

			if var_128_40 < arg_125_1.time_ and arg_125_1.time_ <= var_128_40 + arg_128_0 and not isNil(var_128_39) and arg_125_1.var_.characterEffect6046_story == nil then
				arg_125_1.var_.characterEffect6046_story = var_128_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_41 = 0.200000002980232

			if var_128_40 <= arg_125_1.time_ and arg_125_1.time_ < var_128_40 + var_128_41 and not isNil(var_128_39) then
				local var_128_42 = (arg_125_1.time_ - var_128_40) / var_128_41

				if arg_125_1.var_.characterEffect6046_story and not isNil(var_128_39) then
					local var_128_43 = Mathf.Lerp(0, 0.5, var_128_42)

					arg_125_1.var_.characterEffect6046_story.fillFlat = true
					arg_125_1.var_.characterEffect6046_story.fillRatio = var_128_43
				end
			end

			if arg_125_1.time_ >= var_128_40 + var_128_41 and arg_125_1.time_ < var_128_40 + var_128_41 + arg_128_0 and not isNil(var_128_39) and arg_125_1.var_.characterEffect6046_story then
				local var_128_44 = 0.5

				arg_125_1.var_.characterEffect6046_story.fillFlat = true
				arg_125_1.var_.characterEffect6046_story.fillRatio = var_128_44
			end

			local var_128_45 = 0
			local var_128_46 = 0.725

			if var_128_45 < arg_125_1.time_ and arg_125_1.time_ <= var_128_45 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_47 = arg_125_1:FormatText(StoryNameCfg[215].name)

				arg_125_1.leftNameTxt_.text = var_128_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_48 = arg_125_1:GetWordFromCfg(1104201031)
				local var_128_49 = arg_125_1:FormatText(var_128_48.content)

				arg_125_1.text_.text = var_128_49

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_50 = 29
				local var_128_51 = utf8.len(var_128_49)
				local var_128_52 = var_128_50 <= 0 and var_128_46 or var_128_46 * (var_128_51 / var_128_50)

				if var_128_52 > 0 and var_128_46 < var_128_52 then
					arg_125_1.talkMaxDuration = var_128_52

					if var_128_52 + var_128_45 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_52 + var_128_45
					end
				end

				arg_125_1.text_.text = var_128_49
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201031", "story_v_side_new_1104201.awb") ~= 0 then
					local var_128_53 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201031", "story_v_side_new_1104201.awb") / 1000

					if var_128_53 + var_128_45 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_53 + var_128_45
					end

					if var_128_48.prefab_name ~= "" and arg_125_1.actors_[var_128_48.prefab_name] ~= nil then
						local var_128_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_48.prefab_name].transform, "story_v_side_new_1104201", "1104201031", "story_v_side_new_1104201.awb")

						arg_125_1:RecordAudio("1104201031", var_128_54)
						arg_125_1:RecordAudio("1104201031", var_128_54)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201031", "story_v_side_new_1104201.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201031", "story_v_side_new_1104201.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_55 = math.max(var_128_46, arg_125_1.talkMaxDuration)

			if var_128_45 <= arg_125_1.time_ and arg_125_1.time_ < var_128_45 + var_128_55 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_45) / var_128_55

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_45 + var_128_55 and arg_125_1.time_ < var_128_45 + var_128_55 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1104201032
		arg_129_1.duration_ = 3.73

		local var_129_0 = {
			ja = 2.966,
			ko = 3.733,
			zh = 3.733
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
				arg_129_0:Play1104201033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["6046_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and not isNil(var_132_0) and arg_129_1.var_.characterEffect6046_story == nil then
				arg_129_1.var_.characterEffect6046_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 and not isNil(var_132_0) then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect6046_story and not isNil(var_132_0) then
					arg_129_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and not isNil(var_132_0) and arg_129_1.var_.characterEffect6046_story then
				arg_129_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_132_4 = 0

			if var_132_4 < arg_129_1.time_ and arg_129_1.time_ <= var_132_4 + arg_132_0 then
				arg_129_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_6 = arg_129_1.actors_["6045_story"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and not isNil(var_132_6) and arg_129_1.var_.characterEffect6045_story == nil then
				arg_129_1.var_.characterEffect6045_story = var_132_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_8 = 0.200000002980232

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 and not isNil(var_132_6) then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.characterEffect6045_story and not isNil(var_132_6) then
					local var_132_10 = Mathf.Lerp(0, 0.5, var_132_9)

					arg_129_1.var_.characterEffect6045_story.fillFlat = true
					arg_129_1.var_.characterEffect6045_story.fillRatio = var_132_10
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and not isNil(var_132_6) and arg_129_1.var_.characterEffect6045_story then
				local var_132_11 = 0.5

				arg_129_1.var_.characterEffect6045_story.fillFlat = true
				arg_129_1.var_.characterEffect6045_story.fillRatio = var_132_11
			end

			local var_132_12 = 0
			local var_132_13 = 0.325

			if var_132_12 < arg_129_1.time_ and arg_129_1.time_ <= var_132_12 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_14 = arg_129_1:FormatText(StoryNameCfg[214].name)

				arg_129_1.leftNameTxt_.text = var_132_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_15 = arg_129_1:GetWordFromCfg(1104201032)
				local var_132_16 = arg_129_1:FormatText(var_132_15.content)

				arg_129_1.text_.text = var_132_16

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_17 = 13
				local var_132_18 = utf8.len(var_132_16)
				local var_132_19 = var_132_17 <= 0 and var_132_13 or var_132_13 * (var_132_18 / var_132_17)

				if var_132_19 > 0 and var_132_13 < var_132_19 then
					arg_129_1.talkMaxDuration = var_132_19

					if var_132_19 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_19 + var_132_12
					end
				end

				arg_129_1.text_.text = var_132_16
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201032", "story_v_side_new_1104201.awb") ~= 0 then
					local var_132_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201032", "story_v_side_new_1104201.awb") / 1000

					if var_132_20 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_20 + var_132_12
					end

					if var_132_15.prefab_name ~= "" and arg_129_1.actors_[var_132_15.prefab_name] ~= nil then
						local var_132_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_15.prefab_name].transform, "story_v_side_new_1104201", "1104201032", "story_v_side_new_1104201.awb")

						arg_129_1:RecordAudio("1104201032", var_132_21)
						arg_129_1:RecordAudio("1104201032", var_132_21)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201032", "story_v_side_new_1104201.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201032", "story_v_side_new_1104201.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_13, arg_129_1.talkMaxDuration)

			if var_132_12 <= arg_129_1.time_ and arg_129_1.time_ < var_132_12 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_12) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_12 + var_132_22 and arg_129_1.time_ < var_132_12 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1104201033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1104201034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["6046_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect6046_story == nil then
				arg_133_1.var_.characterEffect6046_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 and not isNil(var_136_0) then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect6046_story and not isNil(var_136_0) then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect6046_story.fillFlat = true
					arg_133_1.var_.characterEffect6046_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect6046_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect6046_story.fillFlat = true
				arg_133_1.var_.characterEffect6046_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.2

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
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_133_1.callingController_:SetSelectedState("normal")

				arg_133_1.keyicon_.color = Color.New(1, 1, 1)
				arg_133_1.icon_.color = Color.New(1, 1, 1)

				local var_136_9 = arg_133_1:GetWordFromCfg(1104201033)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 8
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
	Play1104201034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1104201034
		arg_137_1.duration_ = 8.8

		local var_137_0 = {
			ja = 8.8,
			ko = 6.433,
			zh = 6.433
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1104201035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["6045_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.characterEffect6045_story == nil then
				arg_137_1.var_.characterEffect6045_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 and not isNil(var_140_0) then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect6045_story and not isNil(var_140_0) then
					arg_137_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.characterEffect6045_story then
				arg_137_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action2_1")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_6 = 0
			local var_140_7 = 0.575

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[215].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(1104201034)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 23
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201034", "story_v_side_new_1104201.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201034", "story_v_side_new_1104201.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_side_new_1104201", "1104201034", "story_v_side_new_1104201.awb")

						arg_137_1:RecordAudio("1104201034", var_140_15)
						arg_137_1:RecordAudio("1104201034", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201034", "story_v_side_new_1104201.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201034", "story_v_side_new_1104201.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1104201035
		arg_141_1.duration_ = 6.5

		local var_141_0 = {
			ja = 5.133,
			ko = 6.5,
			zh = 6.5
		}
		local var_141_1 = manager.audio:GetLocalizationFlag()

		if var_141_0[var_141_1] ~= nil then
			arg_141_1.duration_ = var_141_0[var_141_1]
		end

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1104201036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["6046_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.characterEffect6046_story == nil then
				arg_141_1.var_.characterEffect6046_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 and not isNil(var_144_0) then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect6046_story and not isNil(var_144_0) then
					arg_141_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.characterEffect6046_story then
				arg_141_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_144_4 = 0

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action5_1")
			end

			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 then
				arg_141_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_6 = arg_141_1.actors_["6045_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and not isNil(var_144_6) and arg_141_1.var_.characterEffect6045_story == nil then
				arg_141_1.var_.characterEffect6045_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.200000002980232

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 and not isNil(var_144_6) then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect6045_story and not isNil(var_144_6) then
					local var_144_10 = Mathf.Lerp(0, 0.5, var_144_9)

					arg_141_1.var_.characterEffect6045_story.fillFlat = true
					arg_141_1.var_.characterEffect6045_story.fillRatio = var_144_10
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and not isNil(var_144_6) and arg_141_1.var_.characterEffect6045_story then
				local var_144_11 = 0.5

				arg_141_1.var_.characterEffect6045_story.fillFlat = true
				arg_141_1.var_.characterEffect6045_story.fillRatio = var_144_11
			end

			local var_144_12 = 0
			local var_144_13 = 0.65

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_14 = arg_141_1:FormatText(StoryNameCfg[214].name)

				arg_141_1.leftNameTxt_.text = var_144_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(1104201035)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 26
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_13 or var_144_13 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_13 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_12
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201035", "story_v_side_new_1104201.awb") ~= 0 then
					local var_144_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201035", "story_v_side_new_1104201.awb") / 1000

					if var_144_20 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_12
					end

					if var_144_15.prefab_name ~= "" and arg_141_1.actors_[var_144_15.prefab_name] ~= nil then
						local var_144_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_15.prefab_name].transform, "story_v_side_new_1104201", "1104201035", "story_v_side_new_1104201.awb")

						arg_141_1:RecordAudio("1104201035", var_144_21)
						arg_141_1:RecordAudio("1104201035", var_144_21)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201035", "story_v_side_new_1104201.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201035", "story_v_side_new_1104201.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_13, arg_141_1.talkMaxDuration)

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_12) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_12 + var_144_22 and arg_141_1.time_ < var_144_12 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1104201036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1104201037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["6046_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.characterEffect6046_story == nil then
				arg_145_1.var_.characterEffect6046_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 and not isNil(var_148_0) then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect6046_story and not isNil(var_148_0) then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect6046_story.fillFlat = true
					arg_145_1.var_.characterEffect6046_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.characterEffect6046_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect6046_story.fillFlat = true
				arg_145_1.var_.characterEffect6046_story.fillRatio = var_148_5
			end

			local var_148_6 = 0
			local var_148_7 = 0.15

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_8 = arg_145_1:FormatText(StoryNameCfg[7].name)

				arg_145_1.leftNameTxt_.text = var_148_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_145_1.callingController_:SetSelectedState("normal")

				arg_145_1.keyicon_.color = Color.New(1, 1, 1)
				arg_145_1.icon_.color = Color.New(1, 1, 1)

				local var_148_9 = arg_145_1:GetWordFromCfg(1104201036)
				local var_148_10 = arg_145_1:FormatText(var_148_9.content)

				arg_145_1.text_.text = var_148_10

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_11 = 6
				local var_148_12 = utf8.len(var_148_10)
				local var_148_13 = var_148_11 <= 0 and var_148_7 or var_148_7 * (var_148_12 / var_148_11)

				if var_148_13 > 0 and var_148_7 < var_148_13 then
					arg_145_1.talkMaxDuration = var_148_13

					if var_148_13 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_13 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_10
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_14 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_14 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_14

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_14 and arg_145_1.time_ < var_148_6 + var_148_14 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1104201037
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1104201038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["6046_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos6046_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0, 100, 0)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos6046_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, 100, 0)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["6046_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and not isNil(var_152_9) and arg_149_1.var_.characterEffect6046_story == nil then
				arg_149_1.var_.characterEffect6046_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 and not isNil(var_152_9) then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect6046_story and not isNil(var_152_9) then
					local var_152_13 = Mathf.Lerp(0, 0.5, var_152_12)

					arg_149_1.var_.characterEffect6046_story.fillFlat = true
					arg_149_1.var_.characterEffect6046_story.fillRatio = var_152_13
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and not isNil(var_152_9) and arg_149_1.var_.characterEffect6046_story then
				local var_152_14 = 0.5

				arg_149_1.var_.characterEffect6046_story.fillFlat = true
				arg_149_1.var_.characterEffect6046_story.fillRatio = var_152_14
			end

			local var_152_15 = arg_149_1.actors_["6045_story"].transform
			local var_152_16 = 0

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				arg_149_1.var_.moveOldPos6045_story = var_152_15.localPosition
			end

			local var_152_17 = 0.001

			if var_152_16 <= arg_149_1.time_ and arg_149_1.time_ < var_152_16 + var_152_17 then
				local var_152_18 = (arg_149_1.time_ - var_152_16) / var_152_17
				local var_152_19 = Vector3.New(0, 100, 0)

				var_152_15.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos6045_story, var_152_19, var_152_18)

				local var_152_20 = manager.ui.mainCamera.transform.position - var_152_15.position

				var_152_15.forward = Vector3.New(var_152_20.x, var_152_20.y, var_152_20.z)

				local var_152_21 = var_152_15.localEulerAngles

				var_152_21.z = 0
				var_152_21.x = 0
				var_152_15.localEulerAngles = var_152_21
			end

			if arg_149_1.time_ >= var_152_16 + var_152_17 and arg_149_1.time_ < var_152_16 + var_152_17 + arg_152_0 then
				var_152_15.localPosition = Vector3.New(0, 100, 0)

				local var_152_22 = manager.ui.mainCamera.transform.position - var_152_15.position

				var_152_15.forward = Vector3.New(var_152_22.x, var_152_22.y, var_152_22.z)

				local var_152_23 = var_152_15.localEulerAngles

				var_152_23.z = 0
				var_152_23.x = 0
				var_152_15.localEulerAngles = var_152_23
			end

			local var_152_24 = arg_149_1.actors_["6045_story"]
			local var_152_25 = 0

			if var_152_25 < arg_149_1.time_ and arg_149_1.time_ <= var_152_25 + arg_152_0 and not isNil(var_152_24) and arg_149_1.var_.characterEffect6045_story == nil then
				arg_149_1.var_.characterEffect6045_story = var_152_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_26 = 0.200000002980232

			if var_152_25 <= arg_149_1.time_ and arg_149_1.time_ < var_152_25 + var_152_26 and not isNil(var_152_24) then
				local var_152_27 = (arg_149_1.time_ - var_152_25) / var_152_26

				if arg_149_1.var_.characterEffect6045_story and not isNil(var_152_24) then
					local var_152_28 = Mathf.Lerp(0, 0.5, var_152_27)

					arg_149_1.var_.characterEffect6045_story.fillFlat = true
					arg_149_1.var_.characterEffect6045_story.fillRatio = var_152_28
				end
			end

			if arg_149_1.time_ >= var_152_25 + var_152_26 and arg_149_1.time_ < var_152_25 + var_152_26 + arg_152_0 and not isNil(var_152_24) and arg_149_1.var_.characterEffect6045_story then
				local var_152_29 = 0.5

				arg_149_1.var_.characterEffect6045_story.fillFlat = true
				arg_149_1.var_.characterEffect6045_story.fillRatio = var_152_29
			end

			local var_152_30 = 0
			local var_152_31 = 1.125

			if var_152_30 < arg_149_1.time_ and arg_149_1.time_ <= var_152_30 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_32 = arg_149_1:GetWordFromCfg(1104201037)
				local var_152_33 = arg_149_1:FormatText(var_152_32.content)

				arg_149_1.text_.text = var_152_33

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_34 = 45
				local var_152_35 = utf8.len(var_152_33)
				local var_152_36 = var_152_34 <= 0 and var_152_31 or var_152_31 * (var_152_35 / var_152_34)

				if var_152_36 > 0 and var_152_31 < var_152_36 then
					arg_149_1.talkMaxDuration = var_152_36

					if var_152_36 + var_152_30 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_36 + var_152_30
					end
				end

				arg_149_1.text_.text = var_152_33
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_37 = math.max(var_152_31, arg_149_1.talkMaxDuration)

			if var_152_30 <= arg_149_1.time_ and arg_149_1.time_ < var_152_30 + var_152_37 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_30) / var_152_37

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_30 + var_152_37 and arg_149_1.time_ < var_152_30 + var_152_37 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1104201038
		arg_153_1.duration_ = 6.27

		local var_153_0 = {
			ja = 6.266,
			ko = 5.633,
			zh = 5.633
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1104201039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1042ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1042ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(0, -1.06, -6.2)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1042ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 then
				arg_153_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_156_11 = arg_153_1.actors_["1042ui_story"]
			local var_156_12 = 0

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 and not isNil(var_156_11) and arg_153_1.var_.characterEffect1042ui_story == nil then
				arg_153_1.var_.characterEffect1042ui_story = var_156_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_13 = 0.200000002980232

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_13 and not isNil(var_156_11) then
				local var_156_14 = (arg_153_1.time_ - var_156_12) / var_156_13

				if arg_153_1.var_.characterEffect1042ui_story and not isNil(var_156_11) then
					arg_153_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_12 + var_156_13 and arg_153_1.time_ < var_156_12 + var_156_13 + arg_156_0 and not isNil(var_156_11) and arg_153_1.var_.characterEffect1042ui_story then
				arg_153_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_156_15 = 0
			local var_156_16 = 0.55

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_17 = arg_153_1:FormatText(StoryNameCfg[205].name)

				arg_153_1.leftNameTxt_.text = var_156_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_18 = arg_153_1:GetWordFromCfg(1104201038)
				local var_156_19 = arg_153_1:FormatText(var_156_18.content)

				arg_153_1.text_.text = var_156_19

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_20 = 22
				local var_156_21 = utf8.len(var_156_19)
				local var_156_22 = var_156_20 <= 0 and var_156_16 or var_156_16 * (var_156_21 / var_156_20)

				if var_156_22 > 0 and var_156_16 < var_156_22 then
					arg_153_1.talkMaxDuration = var_156_22

					if var_156_22 + var_156_15 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_22 + var_156_15
					end
				end

				arg_153_1.text_.text = var_156_19
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201038", "story_v_side_new_1104201.awb") ~= 0 then
					local var_156_23 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201038", "story_v_side_new_1104201.awb") / 1000

					if var_156_23 + var_156_15 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_23 + var_156_15
					end

					if var_156_18.prefab_name ~= "" and arg_153_1.actors_[var_156_18.prefab_name] ~= nil then
						local var_156_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_18.prefab_name].transform, "story_v_side_new_1104201", "1104201038", "story_v_side_new_1104201.awb")

						arg_153_1:RecordAudio("1104201038", var_156_24)
						arg_153_1:RecordAudio("1104201038", var_156_24)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201038", "story_v_side_new_1104201.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201038", "story_v_side_new_1104201.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_25 = math.max(var_156_16, arg_153_1.talkMaxDuration)

			if var_156_15 <= arg_153_1.time_ and arg_153_1.time_ < var_156_15 + var_156_25 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_15) / var_156_25

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_15 + var_156_25 and arg_153_1.time_ < var_156_15 + var_156_25 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1104201039
		arg_157_1.duration_ = 4.77

		local var_157_0 = {
			ja = 4.766,
			ko = 2.766,
			zh = 2.766
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
				arg_157_0:Play1104201040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1042ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1042ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, 100, 0)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1042ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, 100, 0)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1042ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and not isNil(var_160_9) and arg_157_1.var_.characterEffect1042ui_story == nil then
				arg_157_1.var_.characterEffect1042ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 and not isNil(var_160_9) then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1042ui_story and not isNil(var_160_9) then
					local var_160_13 = Mathf.Lerp(0, 0.5, var_160_12)

					arg_157_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1042ui_story.fillRatio = var_160_13
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and not isNil(var_160_9) and arg_157_1.var_.characterEffect1042ui_story then
				local var_160_14 = 0.5

				arg_157_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1042ui_story.fillRatio = var_160_14
			end

			local var_160_15 = arg_157_1.actors_["6045_story"].transform
			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1.var_.moveOldPos6045_story = var_160_15.localPosition
			end

			local var_160_17 = 0.001

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17
				local var_160_19 = Vector3.New(-0.7, -0.5, -6.3)

				var_160_15.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos6045_story, var_160_19, var_160_18)

				local var_160_20 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_20.x, var_160_20.y, var_160_20.z)

				local var_160_21 = var_160_15.localEulerAngles

				var_160_21.z = 0
				var_160_21.x = 0
				var_160_15.localEulerAngles = var_160_21
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 then
				var_160_15.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_160_22 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_22.x, var_160_22.y, var_160_22.z)

				local var_160_23 = var_160_15.localEulerAngles

				var_160_23.z = 0
				var_160_23.x = 0
				var_160_15.localEulerAngles = var_160_23
			end

			local var_160_24 = arg_157_1.actors_["6045_story"]
			local var_160_25 = 0

			if var_160_25 < arg_157_1.time_ and arg_157_1.time_ <= var_160_25 + arg_160_0 and not isNil(var_160_24) and arg_157_1.var_.characterEffect6045_story == nil then
				arg_157_1.var_.characterEffect6045_story = var_160_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_26 = 0.200000002980232

			if var_160_25 <= arg_157_1.time_ and arg_157_1.time_ < var_160_25 + var_160_26 and not isNil(var_160_24) then
				local var_160_27 = (arg_157_1.time_ - var_160_25) / var_160_26

				if arg_157_1.var_.characterEffect6045_story and not isNil(var_160_24) then
					arg_157_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_25 + var_160_26 and arg_157_1.time_ < var_160_25 + var_160_26 + arg_160_0 and not isNil(var_160_24) and arg_157_1.var_.characterEffect6045_story then
				arg_157_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_160_28 = arg_157_1.actors_["6046_story"].transform
			local var_160_29 = 0

			if var_160_29 < arg_157_1.time_ and arg_157_1.time_ <= var_160_29 + arg_160_0 then
				arg_157_1.var_.moveOldPos6046_story = var_160_28.localPosition
			end

			local var_160_30 = 0.001

			if var_160_29 <= arg_157_1.time_ and arg_157_1.time_ < var_160_29 + var_160_30 then
				local var_160_31 = (arg_157_1.time_ - var_160_29) / var_160_30
				local var_160_32 = Vector3.New(0.7, -0.5, -6.3)

				var_160_28.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos6046_story, var_160_32, var_160_31)

				local var_160_33 = manager.ui.mainCamera.transform.position - var_160_28.position

				var_160_28.forward = Vector3.New(var_160_33.x, var_160_33.y, var_160_33.z)

				local var_160_34 = var_160_28.localEulerAngles

				var_160_34.z = 0
				var_160_34.x = 0
				var_160_28.localEulerAngles = var_160_34
			end

			if arg_157_1.time_ >= var_160_29 + var_160_30 and arg_157_1.time_ < var_160_29 + var_160_30 + arg_160_0 then
				var_160_28.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_160_35 = manager.ui.mainCamera.transform.position - var_160_28.position

				var_160_28.forward = Vector3.New(var_160_35.x, var_160_35.y, var_160_35.z)

				local var_160_36 = var_160_28.localEulerAngles

				var_160_36.z = 0
				var_160_36.x = 0
				var_160_28.localEulerAngles = var_160_36
			end

			local var_160_37 = arg_157_1.actors_["6046_story"]
			local var_160_38 = 0

			if var_160_38 < arg_157_1.time_ and arg_157_1.time_ <= var_160_38 + arg_160_0 and not isNil(var_160_37) and arg_157_1.var_.characterEffect6046_story == nil then
				arg_157_1.var_.characterEffect6046_story = var_160_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_39 = 0.200000002980232

			if var_160_38 <= arg_157_1.time_ and arg_157_1.time_ < var_160_38 + var_160_39 and not isNil(var_160_37) then
				local var_160_40 = (arg_157_1.time_ - var_160_38) / var_160_39

				if arg_157_1.var_.characterEffect6046_story and not isNil(var_160_37) then
					arg_157_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_38 + var_160_39 and arg_157_1.time_ < var_160_38 + var_160_39 + arg_160_0 and not isNil(var_160_37) and arg_157_1.var_.characterEffect6046_story then
				arg_157_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_160_41 = 0

			if var_160_41 < arg_157_1.time_ and arg_157_1.time_ <= var_160_41 + arg_160_0 then
				arg_157_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_160_42 = 0
			local var_160_43 = 0.25

			if var_160_42 < arg_157_1.time_ and arg_157_1.time_ <= var_160_42 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_44 = arg_157_1:FormatText(StoryNameCfg[233].name)

				arg_157_1.leftNameTxt_.text = var_160_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_45 = arg_157_1:GetWordFromCfg(1104201039)
				local var_160_46 = arg_157_1:FormatText(var_160_45.content)

				arg_157_1.text_.text = var_160_46

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_47 = 10
				local var_160_48 = utf8.len(var_160_46)
				local var_160_49 = var_160_47 <= 0 and var_160_43 or var_160_43 * (var_160_48 / var_160_47)

				if var_160_49 > 0 and var_160_43 < var_160_49 then
					arg_157_1.talkMaxDuration = var_160_49

					if var_160_49 + var_160_42 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_49 + var_160_42
					end
				end

				arg_157_1.text_.text = var_160_46
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201039", "story_v_side_new_1104201.awb") ~= 0 then
					local var_160_50 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201039", "story_v_side_new_1104201.awb") / 1000

					if var_160_50 + var_160_42 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_50 + var_160_42
					end

					if var_160_45.prefab_name ~= "" and arg_157_1.actors_[var_160_45.prefab_name] ~= nil then
						local var_160_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_45.prefab_name].transform, "story_v_side_new_1104201", "1104201039", "story_v_side_new_1104201.awb")

						arg_157_1:RecordAudio("1104201039", var_160_51)
						arg_157_1:RecordAudio("1104201039", var_160_51)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201039", "story_v_side_new_1104201.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201039", "story_v_side_new_1104201.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_52 = math.max(var_160_43, arg_157_1.talkMaxDuration)

			if var_160_42 <= arg_157_1.time_ and arg_157_1.time_ < var_160_42 + var_160_52 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_42) / var_160_52

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_42 + var_160_52 and arg_157_1.time_ < var_160_42 + var_160_52 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1104201040
		arg_161_1.duration_ = 6

		local var_161_0 = {
			ja = 6,
			ko = 5.866,
			zh = 5.866
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1104201041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1042ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1042ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, -1.06, -6.2)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1042ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["6045_story"].transform
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.var_.moveOldPos6045_story = var_164_9.localPosition
			end

			local var_164_11 = 0.001

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11
				local var_164_13 = Vector3.New(0, 100, 0)

				var_164_9.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos6045_story, var_164_13, var_164_12)

				local var_164_14 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_14.x, var_164_14.y, var_164_14.z)

				local var_164_15 = var_164_9.localEulerAngles

				var_164_15.z = 0
				var_164_15.x = 0
				var_164_9.localEulerAngles = var_164_15
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 then
				var_164_9.localPosition = Vector3.New(0, 100, 0)

				local var_164_16 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_16.x, var_164_16.y, var_164_16.z)

				local var_164_17 = var_164_9.localEulerAngles

				var_164_17.z = 0
				var_164_17.x = 0
				var_164_9.localEulerAngles = var_164_17
			end

			local var_164_18 = arg_161_1.actors_["6045_story"]
			local var_164_19 = 0

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 and not isNil(var_164_18) and arg_161_1.var_.characterEffect6045_story == nil then
				arg_161_1.var_.characterEffect6045_story = var_164_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_20 = 0.200000002980232

			if var_164_19 <= arg_161_1.time_ and arg_161_1.time_ < var_164_19 + var_164_20 and not isNil(var_164_18) then
				local var_164_21 = (arg_161_1.time_ - var_164_19) / var_164_20

				if arg_161_1.var_.characterEffect6045_story and not isNil(var_164_18) then
					local var_164_22 = Mathf.Lerp(0, 0.5, var_164_21)

					arg_161_1.var_.characterEffect6045_story.fillFlat = true
					arg_161_1.var_.characterEffect6045_story.fillRatio = var_164_22
				end
			end

			if arg_161_1.time_ >= var_164_19 + var_164_20 and arg_161_1.time_ < var_164_19 + var_164_20 + arg_164_0 and not isNil(var_164_18) and arg_161_1.var_.characterEffect6045_story then
				local var_164_23 = 0.5

				arg_161_1.var_.characterEffect6045_story.fillFlat = true
				arg_161_1.var_.characterEffect6045_story.fillRatio = var_164_23
			end

			local var_164_24 = arg_161_1.actors_["6046_story"].transform
			local var_164_25 = 0

			if var_164_25 < arg_161_1.time_ and arg_161_1.time_ <= var_164_25 + arg_164_0 then
				arg_161_1.var_.moveOldPos6046_story = var_164_24.localPosition
			end

			local var_164_26 = 0.001

			if var_164_25 <= arg_161_1.time_ and arg_161_1.time_ < var_164_25 + var_164_26 then
				local var_164_27 = (arg_161_1.time_ - var_164_25) / var_164_26
				local var_164_28 = Vector3.New(0, 100, 0)

				var_164_24.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos6046_story, var_164_28, var_164_27)

				local var_164_29 = manager.ui.mainCamera.transform.position - var_164_24.position

				var_164_24.forward = Vector3.New(var_164_29.x, var_164_29.y, var_164_29.z)

				local var_164_30 = var_164_24.localEulerAngles

				var_164_30.z = 0
				var_164_30.x = 0
				var_164_24.localEulerAngles = var_164_30
			end

			if arg_161_1.time_ >= var_164_25 + var_164_26 and arg_161_1.time_ < var_164_25 + var_164_26 + arg_164_0 then
				var_164_24.localPosition = Vector3.New(0, 100, 0)

				local var_164_31 = manager.ui.mainCamera.transform.position - var_164_24.position

				var_164_24.forward = Vector3.New(var_164_31.x, var_164_31.y, var_164_31.z)

				local var_164_32 = var_164_24.localEulerAngles

				var_164_32.z = 0
				var_164_32.x = 0
				var_164_24.localEulerAngles = var_164_32
			end

			local var_164_33 = arg_161_1.actors_["6046_story"]
			local var_164_34 = 0

			if var_164_34 < arg_161_1.time_ and arg_161_1.time_ <= var_164_34 + arg_164_0 and not isNil(var_164_33) and arg_161_1.var_.characterEffect6046_story == nil then
				arg_161_1.var_.characterEffect6046_story = var_164_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_35 = 0.200000002980232

			if var_164_34 <= arg_161_1.time_ and arg_161_1.time_ < var_164_34 + var_164_35 and not isNil(var_164_33) then
				local var_164_36 = (arg_161_1.time_ - var_164_34) / var_164_35

				if arg_161_1.var_.characterEffect6046_story and not isNil(var_164_33) then
					local var_164_37 = Mathf.Lerp(0, 0.5, var_164_36)

					arg_161_1.var_.characterEffect6046_story.fillFlat = true
					arg_161_1.var_.characterEffect6046_story.fillRatio = var_164_37
				end
			end

			if arg_161_1.time_ >= var_164_34 + var_164_35 and arg_161_1.time_ < var_164_34 + var_164_35 + arg_164_0 and not isNil(var_164_33) and arg_161_1.var_.characterEffect6046_story then
				local var_164_38 = 0.5

				arg_161_1.var_.characterEffect6046_story.fillFlat = true
				arg_161_1.var_.characterEffect6046_story.fillRatio = var_164_38
			end

			local var_164_39 = 0

			if var_164_39 < arg_161_1.time_ and arg_161_1.time_ <= var_164_39 + arg_164_0 then
				arg_161_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_164_40 = 0

			if var_164_40 < arg_161_1.time_ and arg_161_1.time_ <= var_164_40 + arg_164_0 then
				arg_161_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_164_41 = arg_161_1.actors_["1042ui_story"]
			local var_164_42 = 0

			if var_164_42 < arg_161_1.time_ and arg_161_1.time_ <= var_164_42 + arg_164_0 and not isNil(var_164_41) and arg_161_1.var_.characterEffect1042ui_story == nil then
				arg_161_1.var_.characterEffect1042ui_story = var_164_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_43 = 0.200000002980232

			if var_164_42 <= arg_161_1.time_ and arg_161_1.time_ < var_164_42 + var_164_43 and not isNil(var_164_41) then
				local var_164_44 = (arg_161_1.time_ - var_164_42) / var_164_43

				if arg_161_1.var_.characterEffect1042ui_story and not isNil(var_164_41) then
					arg_161_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_42 + var_164_43 and arg_161_1.time_ < var_164_42 + var_164_43 + arg_164_0 and not isNil(var_164_41) and arg_161_1.var_.characterEffect1042ui_story then
				arg_161_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_164_45 = 0
			local var_164_46 = 0.6

			if var_164_45 < arg_161_1.time_ and arg_161_1.time_ <= var_164_45 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_47 = arg_161_1:FormatText(StoryNameCfg[205].name)

				arg_161_1.leftNameTxt_.text = var_164_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_48 = arg_161_1:GetWordFromCfg(1104201040)
				local var_164_49 = arg_161_1:FormatText(var_164_48.content)

				arg_161_1.text_.text = var_164_49

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_50 = 24
				local var_164_51 = utf8.len(var_164_49)
				local var_164_52 = var_164_50 <= 0 and var_164_46 or var_164_46 * (var_164_51 / var_164_50)

				if var_164_52 > 0 and var_164_46 < var_164_52 then
					arg_161_1.talkMaxDuration = var_164_52

					if var_164_52 + var_164_45 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_52 + var_164_45
					end
				end

				arg_161_1.text_.text = var_164_49
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201040", "story_v_side_new_1104201.awb") ~= 0 then
					local var_164_53 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201040", "story_v_side_new_1104201.awb") / 1000

					if var_164_53 + var_164_45 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_53 + var_164_45
					end

					if var_164_48.prefab_name ~= "" and arg_161_1.actors_[var_164_48.prefab_name] ~= nil then
						local var_164_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_48.prefab_name].transform, "story_v_side_new_1104201", "1104201040", "story_v_side_new_1104201.awb")

						arg_161_1:RecordAudio("1104201040", var_164_54)
						arg_161_1:RecordAudio("1104201040", var_164_54)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201040", "story_v_side_new_1104201.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201040", "story_v_side_new_1104201.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_55 = math.max(var_164_46, arg_161_1.talkMaxDuration)

			if var_164_45 <= arg_161_1.time_ and arg_161_1.time_ < var_164_45 + var_164_55 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_45) / var_164_55

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_45 + var_164_55 and arg_161_1.time_ < var_164_45 + var_164_55 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1104201041
		arg_165_1.duration_ = 11.57

		local var_165_0 = {
			ja = 11.566,
			ko = 10.9,
			zh = 10.9
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1104201042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1042ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1042ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, 100, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1042ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, 100, 0)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = arg_165_1.actors_["1042ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and not isNil(var_168_9) and arg_165_1.var_.characterEffect1042ui_story == nil then
				arg_165_1.var_.characterEffect1042ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 and not isNil(var_168_9) then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1042ui_story and not isNil(var_168_9) then
					local var_168_13 = Mathf.Lerp(0, 0.5, var_168_12)

					arg_165_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1042ui_story.fillRatio = var_168_13
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and not isNil(var_168_9) and arg_165_1.var_.characterEffect1042ui_story then
				local var_168_14 = 0.5

				arg_165_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1042ui_story.fillRatio = var_168_14
			end

			local var_168_15 = arg_165_1.actors_["6045_story"].transform
			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.var_.moveOldPos6045_story = var_168_15.localPosition
			end

			local var_168_17 = 0.001

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Vector3.New(-0.7, -0.5, -6.3)

				var_168_15.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos6045_story, var_168_19, var_168_18)

				local var_168_20 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_20.x, var_168_20.y, var_168_20.z)

				local var_168_21 = var_168_15.localEulerAngles

				var_168_21.z = 0
				var_168_21.x = 0
				var_168_15.localEulerAngles = var_168_21
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				var_168_15.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_168_22 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_22.x, var_168_22.y, var_168_22.z)

				local var_168_23 = var_168_15.localEulerAngles

				var_168_23.z = 0
				var_168_23.x = 0
				var_168_15.localEulerAngles = var_168_23
			end

			local var_168_24 = arg_165_1.actors_["6045_story"]
			local var_168_25 = 0

			if var_168_25 < arg_165_1.time_ and arg_165_1.time_ <= var_168_25 + arg_168_0 and not isNil(var_168_24) and arg_165_1.var_.characterEffect6045_story == nil then
				arg_165_1.var_.characterEffect6045_story = var_168_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_26 = 0.200000002980232

			if var_168_25 <= arg_165_1.time_ and arg_165_1.time_ < var_168_25 + var_168_26 and not isNil(var_168_24) then
				local var_168_27 = (arg_165_1.time_ - var_168_25) / var_168_26

				if arg_165_1.var_.characterEffect6045_story and not isNil(var_168_24) then
					local var_168_28 = Mathf.Lerp(0, 0.5, var_168_27)

					arg_165_1.var_.characterEffect6045_story.fillFlat = true
					arg_165_1.var_.characterEffect6045_story.fillRatio = var_168_28
				end
			end

			if arg_165_1.time_ >= var_168_25 + var_168_26 and arg_165_1.time_ < var_168_25 + var_168_26 + arg_168_0 and not isNil(var_168_24) and arg_165_1.var_.characterEffect6045_story then
				local var_168_29 = 0.5

				arg_165_1.var_.characterEffect6045_story.fillFlat = true
				arg_165_1.var_.characterEffect6045_story.fillRatio = var_168_29
			end

			local var_168_30 = arg_165_1.actors_["6046_story"].transform
			local var_168_31 = 0

			if var_168_31 < arg_165_1.time_ and arg_165_1.time_ <= var_168_31 + arg_168_0 then
				arg_165_1.var_.moveOldPos6046_story = var_168_30.localPosition
			end

			local var_168_32 = 0.001

			if var_168_31 <= arg_165_1.time_ and arg_165_1.time_ < var_168_31 + var_168_32 then
				local var_168_33 = (arg_165_1.time_ - var_168_31) / var_168_32
				local var_168_34 = Vector3.New(0.7, -0.5, -6.3)

				var_168_30.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos6046_story, var_168_34, var_168_33)

				local var_168_35 = manager.ui.mainCamera.transform.position - var_168_30.position

				var_168_30.forward = Vector3.New(var_168_35.x, var_168_35.y, var_168_35.z)

				local var_168_36 = var_168_30.localEulerAngles

				var_168_36.z = 0
				var_168_36.x = 0
				var_168_30.localEulerAngles = var_168_36
			end

			if arg_165_1.time_ >= var_168_31 + var_168_32 and arg_165_1.time_ < var_168_31 + var_168_32 + arg_168_0 then
				var_168_30.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_168_37 = manager.ui.mainCamera.transform.position - var_168_30.position

				var_168_30.forward = Vector3.New(var_168_37.x, var_168_37.y, var_168_37.z)

				local var_168_38 = var_168_30.localEulerAngles

				var_168_38.z = 0
				var_168_38.x = 0
				var_168_30.localEulerAngles = var_168_38
			end

			local var_168_39 = arg_165_1.actors_["6046_story"]
			local var_168_40 = 0

			if var_168_40 < arg_165_1.time_ and arg_165_1.time_ <= var_168_40 + arg_168_0 and not isNil(var_168_39) and arg_165_1.var_.characterEffect6046_story == nil then
				arg_165_1.var_.characterEffect6046_story = var_168_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_41 = 0.200000002980232

			if var_168_40 <= arg_165_1.time_ and arg_165_1.time_ < var_168_40 + var_168_41 and not isNil(var_168_39) then
				local var_168_42 = (arg_165_1.time_ - var_168_40) / var_168_41

				if arg_165_1.var_.characterEffect6046_story and not isNil(var_168_39) then
					arg_165_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_40 + var_168_41 and arg_165_1.time_ < var_168_40 + var_168_41 + arg_168_0 and not isNil(var_168_39) and arg_165_1.var_.characterEffect6046_story then
				arg_165_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_168_43 = 0

			if var_168_43 < arg_165_1.time_ and arg_165_1.time_ <= var_168_43 + arg_168_0 then
				arg_165_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action3_1")
			end

			local var_168_44 = 0

			if var_168_44 < arg_165_1.time_ and arg_165_1.time_ <= var_168_44 + arg_168_0 then
				arg_165_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_168_45 = 0
			local var_168_46 = 1.05

			if var_168_45 < arg_165_1.time_ and arg_165_1.time_ <= var_168_45 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_47 = arg_165_1:FormatText(StoryNameCfg[214].name)

				arg_165_1.leftNameTxt_.text = var_168_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_48 = arg_165_1:GetWordFromCfg(1104201041)
				local var_168_49 = arg_165_1:FormatText(var_168_48.content)

				arg_165_1.text_.text = var_168_49

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_50 = 42
				local var_168_51 = utf8.len(var_168_49)
				local var_168_52 = var_168_50 <= 0 and var_168_46 or var_168_46 * (var_168_51 / var_168_50)

				if var_168_52 > 0 and var_168_46 < var_168_52 then
					arg_165_1.talkMaxDuration = var_168_52

					if var_168_52 + var_168_45 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_52 + var_168_45
					end
				end

				arg_165_1.text_.text = var_168_49
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201041", "story_v_side_new_1104201.awb") ~= 0 then
					local var_168_53 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201041", "story_v_side_new_1104201.awb") / 1000

					if var_168_53 + var_168_45 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_53 + var_168_45
					end

					if var_168_48.prefab_name ~= "" and arg_165_1.actors_[var_168_48.prefab_name] ~= nil then
						local var_168_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_48.prefab_name].transform, "story_v_side_new_1104201", "1104201041", "story_v_side_new_1104201.awb")

						arg_165_1:RecordAudio("1104201041", var_168_54)
						arg_165_1:RecordAudio("1104201041", var_168_54)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201041", "story_v_side_new_1104201.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201041", "story_v_side_new_1104201.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_55 = math.max(var_168_46, arg_165_1.talkMaxDuration)

			if var_168_45 <= arg_165_1.time_ and arg_165_1.time_ < var_168_45 + var_168_55 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_45) / var_168_55

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_45 + var_168_55 and arg_165_1.time_ < var_168_45 + var_168_55 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1104201042
		arg_169_1.duration_ = 12.47

		local var_169_0 = {
			ja = 11.533,
			ko = 12.466,
			zh = 12.466
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
				arg_169_0:Play1104201043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["6045_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.characterEffect6045_story == nil then
				arg_169_1.var_.characterEffect6045_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.200000002980232

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 and not isNil(var_172_0) then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect6045_story and not isNil(var_172_0) then
					arg_169_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.characterEffect6045_story then
				arg_169_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_172_4 = 0

			if var_172_4 < arg_169_1.time_ and arg_169_1.time_ <= var_172_4 + arg_172_0 then
				arg_169_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action3_1")
			end

			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 then
				arg_169_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_6 = arg_169_1.actors_["6046_story"]
			local var_172_7 = 0

			if var_172_7 < arg_169_1.time_ and arg_169_1.time_ <= var_172_7 + arg_172_0 and not isNil(var_172_6) and arg_169_1.var_.characterEffect6046_story == nil then
				arg_169_1.var_.characterEffect6046_story = var_172_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_8 = 0.200000002980232

			if var_172_7 <= arg_169_1.time_ and arg_169_1.time_ < var_172_7 + var_172_8 and not isNil(var_172_6) then
				local var_172_9 = (arg_169_1.time_ - var_172_7) / var_172_8

				if arg_169_1.var_.characterEffect6046_story and not isNil(var_172_6) then
					local var_172_10 = Mathf.Lerp(0, 0.5, var_172_9)

					arg_169_1.var_.characterEffect6046_story.fillFlat = true
					arg_169_1.var_.characterEffect6046_story.fillRatio = var_172_10
				end
			end

			if arg_169_1.time_ >= var_172_7 + var_172_8 and arg_169_1.time_ < var_172_7 + var_172_8 + arg_172_0 and not isNil(var_172_6) and arg_169_1.var_.characterEffect6046_story then
				local var_172_11 = 0.5

				arg_169_1.var_.characterEffect6046_story.fillFlat = true
				arg_169_1.var_.characterEffect6046_story.fillRatio = var_172_11
			end

			local var_172_12 = 0
			local var_172_13 = 1.125

			if var_172_12 < arg_169_1.time_ and arg_169_1.time_ <= var_172_12 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_14 = arg_169_1:FormatText(StoryNameCfg[215].name)

				arg_169_1.leftNameTxt_.text = var_172_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_15 = arg_169_1:GetWordFromCfg(1104201042)
				local var_172_16 = arg_169_1:FormatText(var_172_15.content)

				arg_169_1.text_.text = var_172_16

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_17 = 45
				local var_172_18 = utf8.len(var_172_16)
				local var_172_19 = var_172_17 <= 0 and var_172_13 or var_172_13 * (var_172_18 / var_172_17)

				if var_172_19 > 0 and var_172_13 < var_172_19 then
					arg_169_1.talkMaxDuration = var_172_19

					if var_172_19 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_12
					end
				end

				arg_169_1.text_.text = var_172_16
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201042", "story_v_side_new_1104201.awb") ~= 0 then
					local var_172_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201042", "story_v_side_new_1104201.awb") / 1000

					if var_172_20 + var_172_12 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_20 + var_172_12
					end

					if var_172_15.prefab_name ~= "" and arg_169_1.actors_[var_172_15.prefab_name] ~= nil then
						local var_172_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_15.prefab_name].transform, "story_v_side_new_1104201", "1104201042", "story_v_side_new_1104201.awb")

						arg_169_1:RecordAudio("1104201042", var_172_21)
						arg_169_1:RecordAudio("1104201042", var_172_21)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201042", "story_v_side_new_1104201.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201042", "story_v_side_new_1104201.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_22 = math.max(var_172_13, arg_169_1.talkMaxDuration)

			if var_172_12 <= arg_169_1.time_ and arg_169_1.time_ < var_172_12 + var_172_22 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_12) / var_172_22

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_12 + var_172_22 and arg_169_1.time_ < var_172_12 + var_172_22 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1104201043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1104201044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["6045_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and not isNil(var_176_0) and arg_173_1.var_.characterEffect6045_story == nil then
				arg_173_1.var_.characterEffect6045_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 and not isNil(var_176_0) then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect6045_story and not isNil(var_176_0) then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect6045_story.fillFlat = true
					arg_173_1.var_.characterEffect6045_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and not isNil(var_176_0) and arg_173_1.var_.characterEffect6045_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect6045_story.fillFlat = true
				arg_173_1.var_.characterEffect6045_story.fillRatio = var_176_5
			end

			local var_176_6 = 0

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 then
				arg_173_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action3_2")
			end

			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action3_2")
			end

			local var_176_8 = 0
			local var_176_9 = 0.75

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_10 = arg_173_1:FormatText(StoryNameCfg[7].name)

				arg_173_1.leftNameTxt_.text = var_176_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_173_1.callingController_:SetSelectedState("normal")

				arg_173_1.keyicon_.color = Color.New(1, 1, 1)
				arg_173_1.icon_.color = Color.New(1, 1, 1)

				local var_176_11 = arg_173_1:GetWordFromCfg(1104201043)
				local var_176_12 = arg_173_1:FormatText(var_176_11.content)

				arg_173_1.text_.text = var_176_12

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_13 = 30
				local var_176_14 = utf8.len(var_176_12)
				local var_176_15 = var_176_13 <= 0 and var_176_9 or var_176_9 * (var_176_14 / var_176_13)

				if var_176_15 > 0 and var_176_9 < var_176_15 then
					arg_173_1.talkMaxDuration = var_176_15

					if var_176_15 + var_176_8 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_15 + var_176_8
					end
				end

				arg_173_1.text_.text = var_176_12
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_16 = math.max(var_176_9, arg_173_1.talkMaxDuration)

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_16 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_8) / var_176_16

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_8 + var_176_16 and arg_173_1.time_ < var_176_8 + var_176_16 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1104201044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1104201045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.85

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[7].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, true)
				arg_177_1.iconController_:SetSelectedState("hero")

				arg_177_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_177_1.callingController_:SetSelectedState("normal")

				arg_177_1.keyicon_.color = Color.New(1, 1, 1)
				arg_177_1.icon_.color = Color.New(1, 1, 1)

				local var_180_3 = arg_177_1:GetWordFromCfg(1104201044)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 34
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_8 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_8 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_8

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_8 and arg_177_1.time_ < var_180_0 + var_180_8 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1104201045
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1104201046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 1.075

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_181_1.callingController_:SetSelectedState("normal")

				arg_181_1.keyicon_.color = Color.New(1, 1, 1)
				arg_181_1.icon_.color = Color.New(1, 1, 1)

				local var_184_3 = arg_181_1:GetWordFromCfg(1104201045)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 43
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_8 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_8 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_8

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_8 and arg_181_1.time_ < var_184_0 + var_184_8 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1104201046
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1104201047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.225

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[7].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_185_1.callingController_:SetSelectedState("normal")

				arg_185_1.keyicon_.color = Color.New(1, 1, 1)
				arg_185_1.icon_.color = Color.New(1, 1, 1)

				local var_188_3 = arg_185_1:GetWordFromCfg(1104201046)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 9
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_8 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_8 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_8

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_8 and arg_185_1.time_ < var_188_0 + var_188_8 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1104201047
		arg_189_1.duration_ = 9.1

		local var_189_0 = {
			ja = 5.233,
			ko = 9.1,
			zh = 9.1
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play1104201048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1042ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1042ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, -1.06, -6.2)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1042ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1042ui_story"]
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 and not isNil(var_192_9) and arg_189_1.var_.characterEffect1042ui_story == nil then
				arg_189_1.var_.characterEffect1042ui_story = var_192_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_11 = 0.200000002980232

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 and not isNil(var_192_9) then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11

				if arg_189_1.var_.characterEffect1042ui_story and not isNil(var_192_9) then
					arg_189_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and not isNil(var_192_9) and arg_189_1.var_.characterEffect1042ui_story then
				arg_189_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_192_13 = arg_189_1.actors_["6045_story"].transform
			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 then
				arg_189_1.var_.moveOldPos6045_story = var_192_13.localPosition
			end

			local var_192_15 = 0.001

			if var_192_14 <= arg_189_1.time_ and arg_189_1.time_ < var_192_14 + var_192_15 then
				local var_192_16 = (arg_189_1.time_ - var_192_14) / var_192_15
				local var_192_17 = Vector3.New(0, 100, 0)

				var_192_13.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos6045_story, var_192_17, var_192_16)

				local var_192_18 = manager.ui.mainCamera.transform.position - var_192_13.position

				var_192_13.forward = Vector3.New(var_192_18.x, var_192_18.y, var_192_18.z)

				local var_192_19 = var_192_13.localEulerAngles

				var_192_19.z = 0
				var_192_19.x = 0
				var_192_13.localEulerAngles = var_192_19
			end

			if arg_189_1.time_ >= var_192_14 + var_192_15 and arg_189_1.time_ < var_192_14 + var_192_15 + arg_192_0 then
				var_192_13.localPosition = Vector3.New(0, 100, 0)

				local var_192_20 = manager.ui.mainCamera.transform.position - var_192_13.position

				var_192_13.forward = Vector3.New(var_192_20.x, var_192_20.y, var_192_20.z)

				local var_192_21 = var_192_13.localEulerAngles

				var_192_21.z = 0
				var_192_21.x = 0
				var_192_13.localEulerAngles = var_192_21
			end

			local var_192_22 = arg_189_1.actors_["6045_story"]
			local var_192_23 = 0

			if var_192_23 < arg_189_1.time_ and arg_189_1.time_ <= var_192_23 + arg_192_0 and not isNil(var_192_22) and arg_189_1.var_.characterEffect6045_story == nil then
				arg_189_1.var_.characterEffect6045_story = var_192_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_24 = 0.200000002980232

			if var_192_23 <= arg_189_1.time_ and arg_189_1.time_ < var_192_23 + var_192_24 and not isNil(var_192_22) then
				local var_192_25 = (arg_189_1.time_ - var_192_23) / var_192_24

				if arg_189_1.var_.characterEffect6045_story and not isNil(var_192_22) then
					local var_192_26 = Mathf.Lerp(0, 0.5, var_192_25)

					arg_189_1.var_.characterEffect6045_story.fillFlat = true
					arg_189_1.var_.characterEffect6045_story.fillRatio = var_192_26
				end
			end

			if arg_189_1.time_ >= var_192_23 + var_192_24 and arg_189_1.time_ < var_192_23 + var_192_24 + arg_192_0 and not isNil(var_192_22) and arg_189_1.var_.characterEffect6045_story then
				local var_192_27 = 0.5

				arg_189_1.var_.characterEffect6045_story.fillFlat = true
				arg_189_1.var_.characterEffect6045_story.fillRatio = var_192_27
			end

			local var_192_28 = arg_189_1.actors_["6046_story"].transform
			local var_192_29 = 0

			if var_192_29 < arg_189_1.time_ and arg_189_1.time_ <= var_192_29 + arg_192_0 then
				arg_189_1.var_.moveOldPos6046_story = var_192_28.localPosition
			end

			local var_192_30 = 0.001

			if var_192_29 <= arg_189_1.time_ and arg_189_1.time_ < var_192_29 + var_192_30 then
				local var_192_31 = (arg_189_1.time_ - var_192_29) / var_192_30
				local var_192_32 = Vector3.New(0, 100, 0)

				var_192_28.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos6046_story, var_192_32, var_192_31)

				local var_192_33 = manager.ui.mainCamera.transform.position - var_192_28.position

				var_192_28.forward = Vector3.New(var_192_33.x, var_192_33.y, var_192_33.z)

				local var_192_34 = var_192_28.localEulerAngles

				var_192_34.z = 0
				var_192_34.x = 0
				var_192_28.localEulerAngles = var_192_34
			end

			if arg_189_1.time_ >= var_192_29 + var_192_30 and arg_189_1.time_ < var_192_29 + var_192_30 + arg_192_0 then
				var_192_28.localPosition = Vector3.New(0, 100, 0)

				local var_192_35 = manager.ui.mainCamera.transform.position - var_192_28.position

				var_192_28.forward = Vector3.New(var_192_35.x, var_192_35.y, var_192_35.z)

				local var_192_36 = var_192_28.localEulerAngles

				var_192_36.z = 0
				var_192_36.x = 0
				var_192_28.localEulerAngles = var_192_36
			end

			local var_192_37 = arg_189_1.actors_["6046_story"]
			local var_192_38 = 0

			if var_192_38 < arg_189_1.time_ and arg_189_1.time_ <= var_192_38 + arg_192_0 and not isNil(var_192_37) and arg_189_1.var_.characterEffect6046_story == nil then
				arg_189_1.var_.characterEffect6046_story = var_192_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_39 = 0.200000002980232

			if var_192_38 <= arg_189_1.time_ and arg_189_1.time_ < var_192_38 + var_192_39 and not isNil(var_192_37) then
				local var_192_40 = (arg_189_1.time_ - var_192_38) / var_192_39

				if arg_189_1.var_.characterEffect6046_story and not isNil(var_192_37) then
					local var_192_41 = Mathf.Lerp(0, 0.5, var_192_40)

					arg_189_1.var_.characterEffect6046_story.fillFlat = true
					arg_189_1.var_.characterEffect6046_story.fillRatio = var_192_41
				end
			end

			if arg_189_1.time_ >= var_192_38 + var_192_39 and arg_189_1.time_ < var_192_38 + var_192_39 + arg_192_0 and not isNil(var_192_37) and arg_189_1.var_.characterEffect6046_story then
				local var_192_42 = 0.5

				arg_189_1.var_.characterEffect6046_story.fillFlat = true
				arg_189_1.var_.characterEffect6046_story.fillRatio = var_192_42
			end

			local var_192_43 = 0

			if var_192_43 < arg_189_1.time_ and arg_189_1.time_ <= var_192_43 + arg_192_0 then
				arg_189_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action1_1")
			end

			local var_192_44 = 0
			local var_192_45 = 0.95

			if var_192_44 < arg_189_1.time_ and arg_189_1.time_ <= var_192_44 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_46 = arg_189_1:FormatText(StoryNameCfg[205].name)

				arg_189_1.leftNameTxt_.text = var_192_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_47 = arg_189_1:GetWordFromCfg(1104201047)
				local var_192_48 = arg_189_1:FormatText(var_192_47.content)

				arg_189_1.text_.text = var_192_48

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_49 = 38
				local var_192_50 = utf8.len(var_192_48)
				local var_192_51 = var_192_49 <= 0 and var_192_45 or var_192_45 * (var_192_50 / var_192_49)

				if var_192_51 > 0 and var_192_45 < var_192_51 then
					arg_189_1.talkMaxDuration = var_192_51

					if var_192_51 + var_192_44 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_51 + var_192_44
					end
				end

				arg_189_1.text_.text = var_192_48
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201047", "story_v_side_new_1104201.awb") ~= 0 then
					local var_192_52 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201047", "story_v_side_new_1104201.awb") / 1000

					if var_192_52 + var_192_44 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_52 + var_192_44
					end

					if var_192_47.prefab_name ~= "" and arg_189_1.actors_[var_192_47.prefab_name] ~= nil then
						local var_192_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_47.prefab_name].transform, "story_v_side_new_1104201", "1104201047", "story_v_side_new_1104201.awb")

						arg_189_1:RecordAudio("1104201047", var_192_53)
						arg_189_1:RecordAudio("1104201047", var_192_53)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201047", "story_v_side_new_1104201.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201047", "story_v_side_new_1104201.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_54 = math.max(var_192_45, arg_189_1.talkMaxDuration)

			if var_192_44 <= arg_189_1.time_ and arg_189_1.time_ < var_192_44 + var_192_54 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_44) / var_192_54

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_44 + var_192_54 and arg_189_1.time_ < var_192_44 + var_192_54 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1104201048
		arg_193_1.duration_ = 7.43

		local var_193_0 = {
			ja = 4.966,
			ko = 7.433,
			zh = 7.433
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1104201049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action6_1")
			end

			local var_196_1 = 0
			local var_196_2 = 0.6

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_3 = arg_193_1:FormatText(StoryNameCfg[205].name)

				arg_193_1.leftNameTxt_.text = var_196_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_4 = arg_193_1:GetWordFromCfg(1104201048)
				local var_196_5 = arg_193_1:FormatText(var_196_4.content)

				arg_193_1.text_.text = var_196_5

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_6 = 24
				local var_196_7 = utf8.len(var_196_5)
				local var_196_8 = var_196_6 <= 0 and var_196_2 or var_196_2 * (var_196_7 / var_196_6)

				if var_196_8 > 0 and var_196_2 < var_196_8 then
					arg_193_1.talkMaxDuration = var_196_8

					if var_196_8 + var_196_1 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_1
					end
				end

				arg_193_1.text_.text = var_196_5
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201048", "story_v_side_new_1104201.awb") ~= 0 then
					local var_196_9 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201048", "story_v_side_new_1104201.awb") / 1000

					if var_196_9 + var_196_1 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_9 + var_196_1
					end

					if var_196_4.prefab_name ~= "" and arg_193_1.actors_[var_196_4.prefab_name] ~= nil then
						local var_196_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_4.prefab_name].transform, "story_v_side_new_1104201", "1104201048", "story_v_side_new_1104201.awb")

						arg_193_1:RecordAudio("1104201048", var_196_10)
						arg_193_1:RecordAudio("1104201048", var_196_10)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201048", "story_v_side_new_1104201.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201048", "story_v_side_new_1104201.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_11 = math.max(var_196_2, arg_193_1.talkMaxDuration)

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_11 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_1) / var_196_11

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_1 + var_196_11 and arg_193_1.time_ < var_196_1 + var_196_11 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1104201049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1104201050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1042ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1042ui_story == nil then
				arg_197_1.var_.characterEffect1042ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.2

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 and not isNil(var_200_0) then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1042ui_story and not isNil(var_200_0) then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1042ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and not isNil(var_200_0) and arg_197_1.var_.characterEffect1042ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1042ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.625

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
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_197_1.callingController_:SetSelectedState("normal")

				arg_197_1.keyicon_.color = Color.New(1, 1, 1)
				arg_197_1.icon_.color = Color.New(1, 1, 1)

				local var_200_9 = arg_197_1:GetWordFromCfg(1104201049)
				local var_200_10 = arg_197_1:FormatText(var_200_9.content)

				arg_197_1.text_.text = var_200_10

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_11 = 25
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
	Play1104201050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1104201050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1104201051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_2 = arg_201_1:GetWordFromCfg(1104201050)
				local var_204_3 = arg_201_1:FormatText(var_204_2.content)

				arg_201_1.text_.text = var_204_3

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_4 = 40
				local var_204_5 = utf8.len(var_204_3)
				local var_204_6 = var_204_4 <= 0 and var_204_1 or var_204_1 * (var_204_5 / var_204_4)

				if var_204_6 > 0 and var_204_1 < var_204_6 then
					arg_201_1.talkMaxDuration = var_204_6

					if var_204_6 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_6 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_3
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_7 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_7 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_7

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_7 and arg_201_1.time_ < var_204_0 + var_204_7 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1104201051
		arg_205_1.duration_ = 7.93

		local var_205_0 = {
			ja = 7.933,
			ko = 7.166,
			zh = 7.166
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1104201052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1042ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.characterEffect1042ui_story == nil then
				arg_205_1.var_.characterEffect1042ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 and not isNil(var_208_0) then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1042ui_story and not isNil(var_208_0) then
					arg_205_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.characterEffect1042ui_story then
				arg_205_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_208_4 = 0
			local var_208_5 = 0.575

			if var_208_4 < arg_205_1.time_ and arg_205_1.time_ <= var_208_4 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_6 = arg_205_1:FormatText(StoryNameCfg[205].name)

				arg_205_1.leftNameTxt_.text = var_208_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_7 = arg_205_1:GetWordFromCfg(1104201051)
				local var_208_8 = arg_205_1:FormatText(var_208_7.content)

				arg_205_1.text_.text = var_208_8

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_9 = 23
				local var_208_10 = utf8.len(var_208_8)
				local var_208_11 = var_208_9 <= 0 and var_208_5 or var_208_5 * (var_208_10 / var_208_9)

				if var_208_11 > 0 and var_208_5 < var_208_11 then
					arg_205_1.talkMaxDuration = var_208_11

					if var_208_11 + var_208_4 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_11 + var_208_4
					end
				end

				arg_205_1.text_.text = var_208_8
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201051", "story_v_side_new_1104201.awb") ~= 0 then
					local var_208_12 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201051", "story_v_side_new_1104201.awb") / 1000

					if var_208_12 + var_208_4 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_12 + var_208_4
					end

					if var_208_7.prefab_name ~= "" and arg_205_1.actors_[var_208_7.prefab_name] ~= nil then
						local var_208_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_7.prefab_name].transform, "story_v_side_new_1104201", "1104201051", "story_v_side_new_1104201.awb")

						arg_205_1:RecordAudio("1104201051", var_208_13)
						arg_205_1:RecordAudio("1104201051", var_208_13)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201051", "story_v_side_new_1104201.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201051", "story_v_side_new_1104201.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_14 = math.max(var_208_5, arg_205_1.talkMaxDuration)

			if var_208_4 <= arg_205_1.time_ and arg_205_1.time_ < var_208_4 + var_208_14 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_4) / var_208_14

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_4 + var_208_14 and arg_205_1.time_ < var_208_4 + var_208_14 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1104201052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1104201053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1042ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and not isNil(var_212_0) and arg_209_1.var_.characterEffect1042ui_story == nil then
				arg_209_1.var_.characterEffect1042ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 and not isNil(var_212_0) then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1042ui_story and not isNil(var_212_0) then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1042ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and not isNil(var_212_0) and arg_209_1.var_.characterEffect1042ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1042ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0
			local var_212_7 = 0.6

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_8 = arg_209_1:GetWordFromCfg(1104201052)
				local var_212_9 = arg_209_1:FormatText(var_212_8.content)

				arg_209_1.text_.text = var_212_9

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_10 = 24
				local var_212_11 = utf8.len(var_212_9)
				local var_212_12 = var_212_10 <= 0 and var_212_7 or var_212_7 * (var_212_11 / var_212_10)

				if var_212_12 > 0 and var_212_7 < var_212_12 then
					arg_209_1.talkMaxDuration = var_212_12

					if var_212_12 + var_212_6 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_12 + var_212_6
					end
				end

				arg_209_1.text_.text = var_212_9
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_13 = math.max(var_212_7, arg_209_1.talkMaxDuration)

			if var_212_6 <= arg_209_1.time_ and arg_209_1.time_ < var_212_6 + var_212_13 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_6) / var_212_13

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_6 + var_212_13 and arg_209_1.time_ < var_212_6 + var_212_13 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1104201053
		arg_213_1.duration_ = 10.87

		local var_213_0 = {
			ja = 10.866,
			ko = 7.633,
			zh = 7.633
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1104201054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1042ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.characterEffect1042ui_story == nil then
				arg_213_1.var_.characterEffect1042ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 and not isNil(var_216_0) then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1042ui_story and not isNil(var_216_0) then
					arg_213_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.characterEffect1042ui_story then
				arg_213_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action6_2")
			end

			local var_216_5 = 0
			local var_216_6 = 0.85

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_7 = arg_213_1:FormatText(StoryNameCfg[205].name)

				arg_213_1.leftNameTxt_.text = var_216_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(1104201053)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 34
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_6 or var_216_6 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_6 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_5
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201053", "story_v_side_new_1104201.awb") ~= 0 then
					local var_216_13 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201053", "story_v_side_new_1104201.awb") / 1000

					if var_216_13 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_5
					end

					if var_216_8.prefab_name ~= "" and arg_213_1.actors_[var_216_8.prefab_name] ~= nil then
						local var_216_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_8.prefab_name].transform, "story_v_side_new_1104201", "1104201053", "story_v_side_new_1104201.awb")

						arg_213_1:RecordAudio("1104201053", var_216_14)
						arg_213_1:RecordAudio("1104201053", var_216_14)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201053", "story_v_side_new_1104201.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201053", "story_v_side_new_1104201.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_15 = math.max(var_216_6, arg_213_1.talkMaxDuration)

			if var_216_5 <= arg_213_1.time_ and arg_213_1.time_ < var_216_5 + var_216_15 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_5) / var_216_15

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_5 + var_216_15 and arg_213_1.time_ < var_216_5 + var_216_15 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1104201054
		arg_217_1.duration_ = 12.07

		local var_217_0 = {
			ja = 12.066,
			ko = 11.733,
			zh = 11.733
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1104201055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.125

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[205].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(1104201054)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 45
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201054", "story_v_side_new_1104201.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201054", "story_v_side_new_1104201.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_side_new_1104201", "1104201054", "story_v_side_new_1104201.awb")

						arg_217_1:RecordAudio("1104201054", var_220_9)
						arg_217_1:RecordAudio("1104201054", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201054", "story_v_side_new_1104201.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201054", "story_v_side_new_1104201.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1104201055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1104201056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1042ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1042ui_story == nil then
				arg_221_1.var_.characterEffect1042ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 and not isNil(var_224_0) then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1042ui_story and not isNil(var_224_0) then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1042ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and not isNil(var_224_0) and arg_221_1.var_.characterEffect1042ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1042ui_story.fillRatio = var_224_5
			end

			local var_224_6 = 0
			local var_224_7 = 0.3

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_221_1.callingController_:SetSelectedState("normal")

				arg_221_1.keyicon_.color = Color.New(1, 1, 1)
				arg_221_1.icon_.color = Color.New(1, 1, 1)

				local var_224_9 = arg_221_1:GetWordFromCfg(1104201055)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 12
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
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_14 and arg_221_1.time_ < var_224_6 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1104201056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1104201057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.9

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(1104201056)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 36
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1104201057
		arg_229_1.duration_ = 5.6

		local var_229_0 = {
			ja = 5.6,
			ko = 2.966,
			zh = 2.966
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1104201058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1042ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and not isNil(var_232_0) and arg_229_1.var_.characterEffect1042ui_story == nil then
				arg_229_1.var_.characterEffect1042ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 and not isNil(var_232_0) then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1042ui_story and not isNil(var_232_0) then
					arg_229_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and not isNil(var_232_0) and arg_229_1.var_.characterEffect1042ui_story then
				arg_229_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_232_4 = 0
			local var_232_5 = 0.225

			if var_232_4 < arg_229_1.time_ and arg_229_1.time_ <= var_232_4 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_6 = arg_229_1:FormatText(StoryNameCfg[205].name)

				arg_229_1.leftNameTxt_.text = var_232_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_7 = arg_229_1:GetWordFromCfg(1104201057)
				local var_232_8 = arg_229_1:FormatText(var_232_7.content)

				arg_229_1.text_.text = var_232_8

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_9 = 9
				local var_232_10 = utf8.len(var_232_8)
				local var_232_11 = var_232_9 <= 0 and var_232_5 or var_232_5 * (var_232_10 / var_232_9)

				if var_232_11 > 0 and var_232_5 < var_232_11 then
					arg_229_1.talkMaxDuration = var_232_11

					if var_232_11 + var_232_4 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_11 + var_232_4
					end
				end

				arg_229_1.text_.text = var_232_8
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201057", "story_v_side_new_1104201.awb") ~= 0 then
					local var_232_12 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201057", "story_v_side_new_1104201.awb") / 1000

					if var_232_12 + var_232_4 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_12 + var_232_4
					end

					if var_232_7.prefab_name ~= "" and arg_229_1.actors_[var_232_7.prefab_name] ~= nil then
						local var_232_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_7.prefab_name].transform, "story_v_side_new_1104201", "1104201057", "story_v_side_new_1104201.awb")

						arg_229_1:RecordAudio("1104201057", var_232_13)
						arg_229_1:RecordAudio("1104201057", var_232_13)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201057", "story_v_side_new_1104201.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201057", "story_v_side_new_1104201.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_14 = math.max(var_232_5, arg_229_1.talkMaxDuration)

			if var_232_4 <= arg_229_1.time_ and arg_229_1.time_ < var_232_4 + var_232_14 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_4) / var_232_14

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_4 + var_232_14 and arg_229_1.time_ < var_232_4 + var_232_14 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1104201058
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1104201059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1042ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and not isNil(var_236_0) and arg_233_1.var_.characterEffect1042ui_story == nil then
				arg_233_1.var_.characterEffect1042ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 and not isNil(var_236_0) then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1042ui_story and not isNil(var_236_0) then
					local var_236_4 = Mathf.Lerp(0, 0.5, var_236_3)

					arg_233_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1042ui_story.fillRatio = var_236_4
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and not isNil(var_236_0) and arg_233_1.var_.characterEffect1042ui_story then
				local var_236_5 = 0.5

				arg_233_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1042ui_story.fillRatio = var_236_5
			end

			local var_236_6 = 0
			local var_236_7 = 0.425

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[7].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, true)
				arg_233_1.iconController_:SetSelectedState("hero")

				arg_233_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_233_1.callingController_:SetSelectedState("normal")

				arg_233_1.keyicon_.color = Color.New(1, 1, 1)
				arg_233_1.icon_.color = Color.New(1, 1, 1)

				local var_236_9 = arg_233_1:GetWordFromCfg(1104201058)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 17
				local var_236_12 = utf8.len(var_236_10)
				local var_236_13 = var_236_11 <= 0 and var_236_7 or var_236_7 * (var_236_12 / var_236_11)

				if var_236_13 > 0 and var_236_7 < var_236_13 then
					arg_233_1.talkMaxDuration = var_236_13

					if var_236_13 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_13 + var_236_6
					end
				end

				arg_233_1.text_.text = var_236_10
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_14 = math.max(var_236_7, arg_233_1.talkMaxDuration)

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_14 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_6) / var_236_14

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_6 + var_236_14 and arg_233_1.time_ < var_236_6 + var_236_14 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1104201059
		arg_237_1.duration_ = 8.43

		local var_237_0 = {
			ja = 8.433,
			ko = 4.9,
			zh = 4.9
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1104201060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1042ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and not isNil(var_240_0) and arg_237_1.var_.characterEffect1042ui_story == nil then
				arg_237_1.var_.characterEffect1042ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 and not isNil(var_240_0) then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1042ui_story and not isNil(var_240_0) then
					arg_237_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and not isNil(var_240_0) and arg_237_1.var_.characterEffect1042ui_story then
				arg_237_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_240_4 = 0
			local var_240_5 = 0.4

			if var_240_4 < arg_237_1.time_ and arg_237_1.time_ <= var_240_4 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_6 = arg_237_1:FormatText(StoryNameCfg[205].name)

				arg_237_1.leftNameTxt_.text = var_240_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_7 = arg_237_1:GetWordFromCfg(1104201059)
				local var_240_8 = arg_237_1:FormatText(var_240_7.content)

				arg_237_1.text_.text = var_240_8

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_9 = 16
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201059", "story_v_side_new_1104201.awb") ~= 0 then
					local var_240_12 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201059", "story_v_side_new_1104201.awb") / 1000

					if var_240_12 + var_240_4 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_4
					end

					if var_240_7.prefab_name ~= "" and arg_237_1.actors_[var_240_7.prefab_name] ~= nil then
						local var_240_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_7.prefab_name].transform, "story_v_side_new_1104201", "1104201059", "story_v_side_new_1104201.awb")

						arg_237_1:RecordAudio("1104201059", var_240_13)
						arg_237_1:RecordAudio("1104201059", var_240_13)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201059", "story_v_side_new_1104201.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201059", "story_v_side_new_1104201.awb")
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
	Play1104201060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1104201060
		arg_241_1.duration_ = 4.87

		local var_241_0 = {
			ja = 3.233,
			ko = 4.866,
			zh = 4.866
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1104201061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1042ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1042ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0, 100, 0)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1042ui_story, var_244_4, var_244_3)

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

			local var_244_9 = arg_241_1.actors_["1042ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and not isNil(var_244_9) and arg_241_1.var_.characterEffect1042ui_story == nil then
				arg_241_1.var_.characterEffect1042ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 and not isNil(var_244_9) then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect1042ui_story and not isNil(var_244_9) then
					local var_244_13 = Mathf.Lerp(0, 0.5, var_244_12)

					arg_241_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1042ui_story.fillRatio = var_244_13
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and not isNil(var_244_9) and arg_241_1.var_.characterEffect1042ui_story then
				local var_244_14 = 0.5

				arg_241_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1042ui_story.fillRatio = var_244_14
			end

			local var_244_15 = arg_241_1.actors_["6045_story"].transform
			local var_244_16 = 0

			if var_244_16 < arg_241_1.time_ and arg_241_1.time_ <= var_244_16 + arg_244_0 then
				arg_241_1.var_.moveOldPos6045_story = var_244_15.localPosition
			end

			local var_244_17 = 0.001

			if var_244_16 <= arg_241_1.time_ and arg_241_1.time_ < var_244_16 + var_244_17 then
				local var_244_18 = (arg_241_1.time_ - var_244_16) / var_244_17
				local var_244_19 = Vector3.New(-0.7, -0.5, -6.3)

				var_244_15.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos6045_story, var_244_19, var_244_18)

				local var_244_20 = manager.ui.mainCamera.transform.position - var_244_15.position

				var_244_15.forward = Vector3.New(var_244_20.x, var_244_20.y, var_244_20.z)

				local var_244_21 = var_244_15.localEulerAngles

				var_244_21.z = 0
				var_244_21.x = 0
				var_244_15.localEulerAngles = var_244_21
			end

			if arg_241_1.time_ >= var_244_16 + var_244_17 and arg_241_1.time_ < var_244_16 + var_244_17 + arg_244_0 then
				var_244_15.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_244_22 = manager.ui.mainCamera.transform.position - var_244_15.position

				var_244_15.forward = Vector3.New(var_244_22.x, var_244_22.y, var_244_22.z)

				local var_244_23 = var_244_15.localEulerAngles

				var_244_23.z = 0
				var_244_23.x = 0
				var_244_15.localEulerAngles = var_244_23
			end

			local var_244_24 = arg_241_1.actors_["6045_story"]
			local var_244_25 = 0

			if var_244_25 < arg_241_1.time_ and arg_241_1.time_ <= var_244_25 + arg_244_0 and not isNil(var_244_24) and arg_241_1.var_.characterEffect6045_story == nil then
				arg_241_1.var_.characterEffect6045_story = var_244_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_26 = 0.200000002980232

			if var_244_25 <= arg_241_1.time_ and arg_241_1.time_ < var_244_25 + var_244_26 and not isNil(var_244_24) then
				local var_244_27 = (arg_241_1.time_ - var_244_25) / var_244_26

				if arg_241_1.var_.characterEffect6045_story and not isNil(var_244_24) then
					local var_244_28 = Mathf.Lerp(0, 0.5, var_244_27)

					arg_241_1.var_.characterEffect6045_story.fillFlat = true
					arg_241_1.var_.characterEffect6045_story.fillRatio = var_244_28
				end
			end

			if arg_241_1.time_ >= var_244_25 + var_244_26 and arg_241_1.time_ < var_244_25 + var_244_26 + arg_244_0 and not isNil(var_244_24) and arg_241_1.var_.characterEffect6045_story then
				local var_244_29 = 0.5

				arg_241_1.var_.characterEffect6045_story.fillFlat = true
				arg_241_1.var_.characterEffect6045_story.fillRatio = var_244_29
			end

			local var_244_30 = arg_241_1.actors_["6046_story"].transform
			local var_244_31 = 0

			if var_244_31 < arg_241_1.time_ and arg_241_1.time_ <= var_244_31 + arg_244_0 then
				arg_241_1.var_.moveOldPos6046_story = var_244_30.localPosition
			end

			local var_244_32 = 0.001

			if var_244_31 <= arg_241_1.time_ and arg_241_1.time_ < var_244_31 + var_244_32 then
				local var_244_33 = (arg_241_1.time_ - var_244_31) / var_244_32
				local var_244_34 = Vector3.New(0.7, -0.5, -6.3)

				var_244_30.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos6046_story, var_244_34, var_244_33)

				local var_244_35 = manager.ui.mainCamera.transform.position - var_244_30.position

				var_244_30.forward = Vector3.New(var_244_35.x, var_244_35.y, var_244_35.z)

				local var_244_36 = var_244_30.localEulerAngles

				var_244_36.z = 0
				var_244_36.x = 0
				var_244_30.localEulerAngles = var_244_36
			end

			if arg_241_1.time_ >= var_244_31 + var_244_32 and arg_241_1.time_ < var_244_31 + var_244_32 + arg_244_0 then
				var_244_30.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_244_37 = manager.ui.mainCamera.transform.position - var_244_30.position

				var_244_30.forward = Vector3.New(var_244_37.x, var_244_37.y, var_244_37.z)

				local var_244_38 = var_244_30.localEulerAngles

				var_244_38.z = 0
				var_244_38.x = 0
				var_244_30.localEulerAngles = var_244_38
			end

			local var_244_39 = arg_241_1.actors_["6046_story"]
			local var_244_40 = 0

			if var_244_40 < arg_241_1.time_ and arg_241_1.time_ <= var_244_40 + arg_244_0 and not isNil(var_244_39) and arg_241_1.var_.characterEffect6046_story == nil then
				arg_241_1.var_.characterEffect6046_story = var_244_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_41 = 0.200000002980232

			if var_244_40 <= arg_241_1.time_ and arg_241_1.time_ < var_244_40 + var_244_41 and not isNil(var_244_39) then
				local var_244_42 = (arg_241_1.time_ - var_244_40) / var_244_41

				if arg_241_1.var_.characterEffect6046_story and not isNil(var_244_39) then
					arg_241_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_40 + var_244_41 and arg_241_1.time_ < var_244_40 + var_244_41 + arg_244_0 and not isNil(var_244_39) and arg_241_1.var_.characterEffect6046_story then
				arg_241_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_244_43 = 0

			if var_244_43 < arg_241_1.time_ and arg_241_1.time_ <= var_244_43 + arg_244_0 then
				arg_241_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_244_44 = 0

			if var_244_44 < arg_241_1.time_ and arg_241_1.time_ <= var_244_44 + arg_244_0 then
				arg_241_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_244_45 = 0
			local var_244_46 = 0.475

			if var_244_45 < arg_241_1.time_ and arg_241_1.time_ <= var_244_45 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_47 = arg_241_1:FormatText(StoryNameCfg[214].name)

				arg_241_1.leftNameTxt_.text = var_244_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_48 = arg_241_1:GetWordFromCfg(1104201060)
				local var_244_49 = arg_241_1:FormatText(var_244_48.content)

				arg_241_1.text_.text = var_244_49

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_50 = 19
				local var_244_51 = utf8.len(var_244_49)
				local var_244_52 = var_244_50 <= 0 and var_244_46 or var_244_46 * (var_244_51 / var_244_50)

				if var_244_52 > 0 and var_244_46 < var_244_52 then
					arg_241_1.talkMaxDuration = var_244_52

					if var_244_52 + var_244_45 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_52 + var_244_45
					end
				end

				arg_241_1.text_.text = var_244_49
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201060", "story_v_side_new_1104201.awb") ~= 0 then
					local var_244_53 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201060", "story_v_side_new_1104201.awb") / 1000

					if var_244_53 + var_244_45 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_53 + var_244_45
					end

					if var_244_48.prefab_name ~= "" and arg_241_1.actors_[var_244_48.prefab_name] ~= nil then
						local var_244_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_48.prefab_name].transform, "story_v_side_new_1104201", "1104201060", "story_v_side_new_1104201.awb")

						arg_241_1:RecordAudio("1104201060", var_244_54)
						arg_241_1:RecordAudio("1104201060", var_244_54)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201060", "story_v_side_new_1104201.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201060", "story_v_side_new_1104201.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_55 = math.max(var_244_46, arg_241_1.talkMaxDuration)

			if var_244_45 <= arg_241_1.time_ and arg_241_1.time_ < var_244_45 + var_244_55 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_45) / var_244_55

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_45 + var_244_55 and arg_241_1.time_ < var_244_45 + var_244_55 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1104201061
		arg_245_1.duration_ = 8

		local var_245_0 = {
			ja = 3.2,
			ko = 8,
			zh = 8
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1104201062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["6045_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and not isNil(var_248_0) and arg_245_1.var_.characterEffect6045_story == nil then
				arg_245_1.var_.characterEffect6045_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 and not isNil(var_248_0) then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect6045_story and not isNil(var_248_0) then
					arg_245_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and not isNil(var_248_0) and arg_245_1.var_.characterEffect6045_story then
				arg_245_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_248_4 = 0

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_248_5 = 0

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 then
				arg_245_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_248_6 = arg_245_1.actors_["6046_story"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 and not isNil(var_248_6) and arg_245_1.var_.characterEffect6046_story == nil then
				arg_245_1.var_.characterEffect6046_story = var_248_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_8 = 0.200000002980232

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 and not isNil(var_248_6) then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8

				if arg_245_1.var_.characterEffect6046_story and not isNil(var_248_6) then
					local var_248_10 = Mathf.Lerp(0, 0.5, var_248_9)

					arg_245_1.var_.characterEffect6046_story.fillFlat = true
					arg_245_1.var_.characterEffect6046_story.fillRatio = var_248_10
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 and not isNil(var_248_6) and arg_245_1.var_.characterEffect6046_story then
				local var_248_11 = 0.5

				arg_245_1.var_.characterEffect6046_story.fillFlat = true
				arg_245_1.var_.characterEffect6046_story.fillRatio = var_248_11
			end

			local var_248_12 = 0
			local var_248_13 = 0.675

			if var_248_12 < arg_245_1.time_ and arg_245_1.time_ <= var_248_12 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_14 = arg_245_1:FormatText(StoryNameCfg[215].name)

				arg_245_1.leftNameTxt_.text = var_248_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_15 = arg_245_1:GetWordFromCfg(1104201061)
				local var_248_16 = arg_245_1:FormatText(var_248_15.content)

				arg_245_1.text_.text = var_248_16

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_17 = 27
				local var_248_18 = utf8.len(var_248_16)
				local var_248_19 = var_248_17 <= 0 and var_248_13 or var_248_13 * (var_248_18 / var_248_17)

				if var_248_19 > 0 and var_248_13 < var_248_19 then
					arg_245_1.talkMaxDuration = var_248_19

					if var_248_19 + var_248_12 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_19 + var_248_12
					end
				end

				arg_245_1.text_.text = var_248_16
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201061", "story_v_side_new_1104201.awb") ~= 0 then
					local var_248_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201061", "story_v_side_new_1104201.awb") / 1000

					if var_248_20 + var_248_12 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_20 + var_248_12
					end

					if var_248_15.prefab_name ~= "" and arg_245_1.actors_[var_248_15.prefab_name] ~= nil then
						local var_248_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_15.prefab_name].transform, "story_v_side_new_1104201", "1104201061", "story_v_side_new_1104201.awb")

						arg_245_1:RecordAudio("1104201061", var_248_21)
						arg_245_1:RecordAudio("1104201061", var_248_21)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201061", "story_v_side_new_1104201.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201061", "story_v_side_new_1104201.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_22 = math.max(var_248_13, arg_245_1.talkMaxDuration)

			if var_248_12 <= arg_245_1.time_ and arg_245_1.time_ < var_248_12 + var_248_22 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_12) / var_248_22

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_12 + var_248_22 and arg_245_1.time_ < var_248_12 + var_248_22 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1104201062
		arg_249_1.duration_ = 4.27

		local var_249_0 = {
			ja = 3.766,
			ko = 4.266,
			zh = 4.266
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1104201063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["6046_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and not isNil(var_252_0) and arg_249_1.var_.characterEffect6046_story == nil then
				arg_249_1.var_.characterEffect6046_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 and not isNil(var_252_0) then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect6046_story and not isNil(var_252_0) then
					arg_249_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and not isNil(var_252_0) and arg_249_1.var_.characterEffect6046_story then
				arg_249_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_252_4 = 0

			if var_252_4 < arg_249_1.time_ and arg_249_1.time_ <= var_252_4 + arg_252_0 then
				arg_249_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_252_5 = 0

			if var_252_5 < arg_249_1.time_ and arg_249_1.time_ <= var_252_5 + arg_252_0 then
				arg_249_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_252_6 = arg_249_1.actors_["6045_story"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and not isNil(var_252_6) and arg_249_1.var_.characterEffect6045_story == nil then
				arg_249_1.var_.characterEffect6045_story = var_252_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_8 = 0.200000002980232

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 and not isNil(var_252_6) then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.characterEffect6045_story and not isNil(var_252_6) then
					local var_252_10 = Mathf.Lerp(0, 0.5, var_252_9)

					arg_249_1.var_.characterEffect6045_story.fillFlat = true
					arg_249_1.var_.characterEffect6045_story.fillRatio = var_252_10
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and not isNil(var_252_6) and arg_249_1.var_.characterEffect6045_story then
				local var_252_11 = 0.5

				arg_249_1.var_.characterEffect6045_story.fillFlat = true
				arg_249_1.var_.characterEffect6045_story.fillRatio = var_252_11
			end

			local var_252_12 = 0
			local var_252_13 = 0.425

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[214].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(1104201062)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 17
				local var_252_18 = utf8.len(var_252_16)
				local var_252_19 = var_252_17 <= 0 and var_252_13 or var_252_13 * (var_252_18 / var_252_17)

				if var_252_19 > 0 and var_252_13 < var_252_19 then
					arg_249_1.talkMaxDuration = var_252_19

					if var_252_19 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_19 + var_252_12
					end
				end

				arg_249_1.text_.text = var_252_16
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201062", "story_v_side_new_1104201.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201062", "story_v_side_new_1104201.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_side_new_1104201", "1104201062", "story_v_side_new_1104201.awb")

						arg_249_1:RecordAudio("1104201062", var_252_21)
						arg_249_1:RecordAudio("1104201062", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201062", "story_v_side_new_1104201.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201062", "story_v_side_new_1104201.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_13, arg_249_1.talkMaxDuration)

			if var_252_12 <= arg_249_1.time_ and arg_249_1.time_ < var_252_12 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_12) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_12 + var_252_22 and arg_249_1.time_ < var_252_12 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1104201063
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1104201064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["6046_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and not isNil(var_256_0) and arg_253_1.var_.characterEffect6046_story == nil then
				arg_253_1.var_.characterEffect6046_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.200000002980232

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 and not isNil(var_256_0) then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect6046_story and not isNil(var_256_0) then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect6046_story.fillFlat = true
					arg_253_1.var_.characterEffect6046_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and not isNil(var_256_0) and arg_253_1.var_.characterEffect6046_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect6046_story.fillFlat = true
				arg_253_1.var_.characterEffect6046_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.675

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_8 = arg_253_1:GetWordFromCfg(1104201063)
				local var_256_9 = arg_253_1:FormatText(var_256_8.content)

				arg_253_1.text_.text = var_256_9

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_10 = 27
				local var_256_11 = utf8.len(var_256_9)
				local var_256_12 = var_256_10 <= 0 and var_256_7 or var_256_7 * (var_256_11 / var_256_10)

				if var_256_12 > 0 and var_256_7 < var_256_12 then
					arg_253_1.talkMaxDuration = var_256_12

					if var_256_12 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_12 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_9
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_13 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_13 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_13

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_13 and arg_253_1.time_ < var_256_6 + var_256_13 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1104201064
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1104201065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.475

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
				SetActive(arg_257_1.iconTrs_.gameObject, true)
				arg_257_1.iconController_:SetSelectedState("hero")

				arg_257_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_257_1.callingController_:SetSelectedState("normal")

				arg_257_1.keyicon_.color = Color.New(1, 1, 1)
				arg_257_1.icon_.color = Color.New(1, 1, 1)

				local var_260_3 = arg_257_1:GetWordFromCfg(1104201064)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 19
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
	Play1104201065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1104201065
		arg_261_1.duration_ = 2.77

		local var_261_0 = {
			ja = 1.999999999999,
			ko = 2.766,
			zh = 2.766
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1104201066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["6046_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and not isNil(var_264_0) and arg_261_1.var_.characterEffect6046_story == nil then
				arg_261_1.var_.characterEffect6046_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.200000002980232

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 and not isNil(var_264_0) then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect6046_story and not isNil(var_264_0) then
					arg_261_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and not isNil(var_264_0) and arg_261_1.var_.characterEffect6046_story then
				arg_261_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_264_4 = 0

			if var_264_4 < arg_261_1.time_ and arg_261_1.time_ <= var_264_4 + arg_264_0 then
				arg_261_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action5_1")
			end

			local var_264_5 = 0

			if var_264_5 < arg_261_1.time_ and arg_261_1.time_ <= var_264_5 + arg_264_0 then
				arg_261_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_264_6 = 0
			local var_264_7 = 0.15

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_8 = arg_261_1:FormatText(StoryNameCfg[214].name)

				arg_261_1.leftNameTxt_.text = var_264_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_9 = arg_261_1:GetWordFromCfg(1104201065)
				local var_264_10 = arg_261_1:FormatText(var_264_9.content)

				arg_261_1.text_.text = var_264_10

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_11 = 6
				local var_264_12 = utf8.len(var_264_10)
				local var_264_13 = var_264_11 <= 0 and var_264_7 or var_264_7 * (var_264_12 / var_264_11)

				if var_264_13 > 0 and var_264_7 < var_264_13 then
					arg_261_1.talkMaxDuration = var_264_13

					if var_264_13 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_13 + var_264_6
					end
				end

				arg_261_1.text_.text = var_264_10
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201065", "story_v_side_new_1104201.awb") ~= 0 then
					local var_264_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201065", "story_v_side_new_1104201.awb") / 1000

					if var_264_14 + var_264_6 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_14 + var_264_6
					end

					if var_264_9.prefab_name ~= "" and arg_261_1.actors_[var_264_9.prefab_name] ~= nil then
						local var_264_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_9.prefab_name].transform, "story_v_side_new_1104201", "1104201065", "story_v_side_new_1104201.awb")

						arg_261_1:RecordAudio("1104201065", var_264_15)
						arg_261_1:RecordAudio("1104201065", var_264_15)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201065", "story_v_side_new_1104201.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201065", "story_v_side_new_1104201.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_16 = math.max(var_264_7, arg_261_1.talkMaxDuration)

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_16 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_6) / var_264_16

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_6 + var_264_16 and arg_261_1.time_ < var_264_6 + var_264_16 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1104201066
		arg_265_1.duration_ = 15.07

		local var_265_0 = {
			ja = 15.066,
			ko = 13.866,
			zh = 13.866
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1104201067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["6045_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and not isNil(var_268_0) and arg_265_1.var_.characterEffect6045_story == nil then
				arg_265_1.var_.characterEffect6045_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.200000002980232

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 and not isNil(var_268_0) then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect6045_story and not isNil(var_268_0) then
					arg_265_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and not isNil(var_268_0) and arg_265_1.var_.characterEffect6045_story then
				arg_265_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_268_4 = 0

			if var_268_4 < arg_265_1.time_ and arg_265_1.time_ <= var_268_4 + arg_268_0 then
				arg_265_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_268_5 = 0

			if var_268_5 < arg_265_1.time_ and arg_265_1.time_ <= var_268_5 + arg_268_0 then
				arg_265_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_6 = arg_265_1.actors_["6046_story"]
			local var_268_7 = 0

			if var_268_7 < arg_265_1.time_ and arg_265_1.time_ <= var_268_7 + arg_268_0 and not isNil(var_268_6) and arg_265_1.var_.characterEffect6046_story == nil then
				arg_265_1.var_.characterEffect6046_story = var_268_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_8 = 0.200000002980232

			if var_268_7 <= arg_265_1.time_ and arg_265_1.time_ < var_268_7 + var_268_8 and not isNil(var_268_6) then
				local var_268_9 = (arg_265_1.time_ - var_268_7) / var_268_8

				if arg_265_1.var_.characterEffect6046_story and not isNil(var_268_6) then
					local var_268_10 = Mathf.Lerp(0, 0.5, var_268_9)

					arg_265_1.var_.characterEffect6046_story.fillFlat = true
					arg_265_1.var_.characterEffect6046_story.fillRatio = var_268_10
				end
			end

			if arg_265_1.time_ >= var_268_7 + var_268_8 and arg_265_1.time_ < var_268_7 + var_268_8 + arg_268_0 and not isNil(var_268_6) and arg_265_1.var_.characterEffect6046_story then
				local var_268_11 = 0.5

				arg_265_1.var_.characterEffect6046_story.fillFlat = true
				arg_265_1.var_.characterEffect6046_story.fillRatio = var_268_11
			end

			local var_268_12 = 0
			local var_268_13 = 1.175

			if var_268_12 < arg_265_1.time_ and arg_265_1.time_ <= var_268_12 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_14 = arg_265_1:FormatText(StoryNameCfg[215].name)

				arg_265_1.leftNameTxt_.text = var_268_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_15 = arg_265_1:GetWordFromCfg(1104201066)
				local var_268_16 = arg_265_1:FormatText(var_268_15.content)

				arg_265_1.text_.text = var_268_16

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_17 = 47
				local var_268_18 = utf8.len(var_268_16)
				local var_268_19 = var_268_17 <= 0 and var_268_13 or var_268_13 * (var_268_18 / var_268_17)

				if var_268_19 > 0 and var_268_13 < var_268_19 then
					arg_265_1.talkMaxDuration = var_268_19

					if var_268_19 + var_268_12 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_19 + var_268_12
					end
				end

				arg_265_1.text_.text = var_268_16
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201066", "story_v_side_new_1104201.awb") ~= 0 then
					local var_268_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201066", "story_v_side_new_1104201.awb") / 1000

					if var_268_20 + var_268_12 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_20 + var_268_12
					end

					if var_268_15.prefab_name ~= "" and arg_265_1.actors_[var_268_15.prefab_name] ~= nil then
						local var_268_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_15.prefab_name].transform, "story_v_side_new_1104201", "1104201066", "story_v_side_new_1104201.awb")

						arg_265_1:RecordAudio("1104201066", var_268_21)
						arg_265_1:RecordAudio("1104201066", var_268_21)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201066", "story_v_side_new_1104201.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201066", "story_v_side_new_1104201.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_22 = math.max(var_268_13, arg_265_1.talkMaxDuration)

			if var_268_12 <= arg_265_1.time_ and arg_265_1.time_ < var_268_12 + var_268_22 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_12) / var_268_22

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_12 + var_268_22 and arg_265_1.time_ < var_268_12 + var_268_22 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1104201067
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play1104201068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["6045_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and not isNil(var_272_0) and arg_269_1.var_.characterEffect6045_story == nil then
				arg_269_1.var_.characterEffect6045_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 and not isNil(var_272_0) then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect6045_story and not isNil(var_272_0) then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect6045_story.fillFlat = true
					arg_269_1.var_.characterEffect6045_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and not isNil(var_272_0) and arg_269_1.var_.characterEffect6045_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect6045_story.fillFlat = true
				arg_269_1.var_.characterEffect6045_story.fillRatio = var_272_5
			end

			local var_272_6 = 0
			local var_272_7 = 0.525

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
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_269_1.callingController_:SetSelectedState("normal")

				arg_269_1.keyicon_.color = Color.New(1, 1, 1)
				arg_269_1.icon_.color = Color.New(1, 1, 1)

				local var_272_9 = arg_269_1:GetWordFromCfg(1104201067)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 21
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
	Play1104201068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1104201068
		arg_273_1.duration_ = 3.5

		local var_273_0 = {
			ja = 3.5,
			ko = 2.1,
			zh = 2.1
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1104201069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["6046_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and not isNil(var_276_0) and arg_273_1.var_.characterEffect6046_story == nil then
				arg_273_1.var_.characterEffect6046_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.200000002980232

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 and not isNil(var_276_0) then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect6046_story and not isNil(var_276_0) then
					arg_273_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and not isNil(var_276_0) and arg_273_1.var_.characterEffect6046_story then
				arg_273_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_276_4 = 0

			if var_276_4 < arg_273_1.time_ and arg_273_1.time_ <= var_276_4 + arg_276_0 then
				arg_273_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_276_5 = 0

			if var_276_5 < arg_273_1.time_ and arg_273_1.time_ <= var_276_5 + arg_276_0 then
				arg_273_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_276_6 = 0
			local var_276_7 = 0.2

			if var_276_6 < arg_273_1.time_ and arg_273_1.time_ <= var_276_6 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_8 = arg_273_1:FormatText(StoryNameCfg[214].name)

				arg_273_1.leftNameTxt_.text = var_276_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_9 = arg_273_1:GetWordFromCfg(1104201068)
				local var_276_10 = arg_273_1:FormatText(var_276_9.content)

				arg_273_1.text_.text = var_276_10

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_11 = 8
				local var_276_12 = utf8.len(var_276_10)
				local var_276_13 = var_276_11 <= 0 and var_276_7 or var_276_7 * (var_276_12 / var_276_11)

				if var_276_13 > 0 and var_276_7 < var_276_13 then
					arg_273_1.talkMaxDuration = var_276_13

					if var_276_13 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_13 + var_276_6
					end
				end

				arg_273_1.text_.text = var_276_10
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201068", "story_v_side_new_1104201.awb") ~= 0 then
					local var_276_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201068", "story_v_side_new_1104201.awb") / 1000

					if var_276_14 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_14 + var_276_6
					end

					if var_276_9.prefab_name ~= "" and arg_273_1.actors_[var_276_9.prefab_name] ~= nil then
						local var_276_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_9.prefab_name].transform, "story_v_side_new_1104201", "1104201068", "story_v_side_new_1104201.awb")

						arg_273_1:RecordAudio("1104201068", var_276_15)
						arg_273_1:RecordAudio("1104201068", var_276_15)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201068", "story_v_side_new_1104201.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201068", "story_v_side_new_1104201.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_16 = math.max(var_276_7, arg_273_1.talkMaxDuration)

			if var_276_6 <= arg_273_1.time_ and arg_273_1.time_ < var_276_6 + var_276_16 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_6) / var_276_16

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_6 + var_276_16 and arg_273_1.time_ < var_276_6 + var_276_16 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1104201069
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1104201070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["6046_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and not isNil(var_280_0) and arg_277_1.var_.characterEffect6046_story == nil then
				arg_277_1.var_.characterEffect6046_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.200000002980232

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 and not isNil(var_280_0) then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect6046_story and not isNil(var_280_0) then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect6046_story.fillFlat = true
					arg_277_1.var_.characterEffect6046_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and not isNil(var_280_0) and arg_277_1.var_.characterEffect6046_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect6046_story.fillFlat = true
				arg_277_1.var_.characterEffect6046_story.fillRatio = var_280_5
			end

			local var_280_6 = 0
			local var_280_7 = 0.4

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_8 = arg_277_1:FormatText(StoryNameCfg[7].name)

				arg_277_1.leftNameTxt_.text = var_280_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, true)
				arg_277_1.iconController_:SetSelectedState("hero")

				arg_277_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_277_1.callingController_:SetSelectedState("normal")

				arg_277_1.keyicon_.color = Color.New(1, 1, 1)
				arg_277_1.icon_.color = Color.New(1, 1, 1)

				local var_280_9 = arg_277_1:GetWordFromCfg(1104201069)
				local var_280_10 = arg_277_1:FormatText(var_280_9.content)

				arg_277_1.text_.text = var_280_10

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_11 = 16
				local var_280_12 = utf8.len(var_280_10)
				local var_280_13 = var_280_11 <= 0 and var_280_7 or var_280_7 * (var_280_12 / var_280_11)

				if var_280_13 > 0 and var_280_7 < var_280_13 then
					arg_277_1.talkMaxDuration = var_280_13

					if var_280_13 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_6
					end
				end

				arg_277_1.text_.text = var_280_10
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_14 = math.max(var_280_7, arg_277_1.talkMaxDuration)

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_14 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_6) / var_280_14

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_6 + var_280_14 and arg_277_1.time_ < var_280_6 + var_280_14 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1104201070
		arg_281_1.duration_ = 11.97

		local var_281_0 = {
			ja = 11.966,
			ko = 8.433,
			zh = 8.433
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play1104201071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["6045_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and not isNil(var_284_0) and arg_281_1.var_.characterEffect6045_story == nil then
				arg_281_1.var_.characterEffect6045_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.200000002980232

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 and not isNil(var_284_0) then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect6045_story and not isNil(var_284_0) then
					arg_281_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and not isNil(var_284_0) and arg_281_1.var_.characterEffect6045_story then
				arg_281_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_284_4 = 0

			if var_284_4 < arg_281_1.time_ and arg_281_1.time_ <= var_284_4 + arg_284_0 then
				arg_281_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_284_5 = 0

			if var_284_5 < arg_281_1.time_ and arg_281_1.time_ <= var_284_5 + arg_284_0 then
				arg_281_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_284_6 = 0
			local var_284_7 = 0.75

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_8 = arg_281_1:FormatText(StoryNameCfg[215].name)

				arg_281_1.leftNameTxt_.text = var_284_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_9 = arg_281_1:GetWordFromCfg(1104201070)
				local var_284_10 = arg_281_1:FormatText(var_284_9.content)

				arg_281_1.text_.text = var_284_10

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_11 = 30
				local var_284_12 = utf8.len(var_284_10)
				local var_284_13 = var_284_11 <= 0 and var_284_7 or var_284_7 * (var_284_12 / var_284_11)

				if var_284_13 > 0 and var_284_7 < var_284_13 then
					arg_281_1.talkMaxDuration = var_284_13

					if var_284_13 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_13 + var_284_6
					end
				end

				arg_281_1.text_.text = var_284_10
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201070", "story_v_side_new_1104201.awb") ~= 0 then
					local var_284_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201070", "story_v_side_new_1104201.awb") / 1000

					if var_284_14 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_14 + var_284_6
					end

					if var_284_9.prefab_name ~= "" and arg_281_1.actors_[var_284_9.prefab_name] ~= nil then
						local var_284_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_9.prefab_name].transform, "story_v_side_new_1104201", "1104201070", "story_v_side_new_1104201.awb")

						arg_281_1:RecordAudio("1104201070", var_284_15)
						arg_281_1:RecordAudio("1104201070", var_284_15)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201070", "story_v_side_new_1104201.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201070", "story_v_side_new_1104201.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_16 = math.max(var_284_7, arg_281_1.talkMaxDuration)

			if var_284_6 <= arg_281_1.time_ and arg_281_1.time_ < var_284_6 + var_284_16 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_6) / var_284_16

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_6 + var_284_16 and arg_281_1.time_ < var_284_6 + var_284_16 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1104201071
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1104201072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["6045_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.characterEffect6045_story == nil then
				arg_285_1.var_.characterEffect6045_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 and not isNil(var_288_0) then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect6045_story and not isNil(var_288_0) then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect6045_story.fillFlat = true
					arg_285_1.var_.characterEffect6045_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and not isNil(var_288_0) and arg_285_1.var_.characterEffect6045_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect6045_story.fillFlat = true
				arg_285_1.var_.characterEffect6045_story.fillRatio = var_288_5
			end

			local var_288_6 = 0
			local var_288_7 = 0.325

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
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_285_1.callingController_:SetSelectedState("normal")

				arg_285_1.keyicon_.color = Color.New(1, 1, 1)
				arg_285_1.icon_.color = Color.New(1, 1, 1)

				local var_288_9 = arg_285_1:GetWordFromCfg(1104201071)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 13
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
	Play1104201072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 1104201072
		arg_289_1.duration_ = 4.23

		local var_289_0 = {
			ja = 3.133,
			ko = 4.233,
			zh = 4.233
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play1104201073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["6046_story"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and not isNil(var_292_0) and arg_289_1.var_.characterEffect6046_story == nil then
				arg_289_1.var_.characterEffect6046_story = var_292_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_2 = 0.200000002980232

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 and not isNil(var_292_0) then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.characterEffect6046_story and not isNil(var_292_0) then
					arg_289_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and not isNil(var_292_0) and arg_289_1.var_.characterEffect6046_story then
				arg_289_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_292_4 = 0

			if var_292_4 < arg_289_1.time_ and arg_289_1.time_ <= var_292_4 + arg_292_0 then
				arg_289_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_292_5 = 0

			if var_292_5 < arg_289_1.time_ and arg_289_1.time_ <= var_292_5 + arg_292_0 then
				arg_289_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_292_6 = 0
			local var_292_7 = 0.425

			if var_292_6 < arg_289_1.time_ and arg_289_1.time_ <= var_292_6 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_8 = arg_289_1:FormatText(StoryNameCfg[214].name)

				arg_289_1.leftNameTxt_.text = var_292_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_9 = arg_289_1:GetWordFromCfg(1104201072)
				local var_292_10 = arg_289_1:FormatText(var_292_9.content)

				arg_289_1.text_.text = var_292_10

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_11 = 17
				local var_292_12 = utf8.len(var_292_10)
				local var_292_13 = var_292_11 <= 0 and var_292_7 or var_292_7 * (var_292_12 / var_292_11)

				if var_292_13 > 0 and var_292_7 < var_292_13 then
					arg_289_1.talkMaxDuration = var_292_13

					if var_292_13 + var_292_6 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_13 + var_292_6
					end
				end

				arg_289_1.text_.text = var_292_10
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201072", "story_v_side_new_1104201.awb") ~= 0 then
					local var_292_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201072", "story_v_side_new_1104201.awb") / 1000

					if var_292_14 + var_292_6 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_14 + var_292_6
					end

					if var_292_9.prefab_name ~= "" and arg_289_1.actors_[var_292_9.prefab_name] ~= nil then
						local var_292_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_9.prefab_name].transform, "story_v_side_new_1104201", "1104201072", "story_v_side_new_1104201.awb")

						arg_289_1:RecordAudio("1104201072", var_292_15)
						arg_289_1:RecordAudio("1104201072", var_292_15)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201072", "story_v_side_new_1104201.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201072", "story_v_side_new_1104201.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_16 = math.max(var_292_7, arg_289_1.talkMaxDuration)

			if var_292_6 <= arg_289_1.time_ and arg_289_1.time_ < var_292_6 + var_292_16 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_6) / var_292_16

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_6 + var_292_16 and arg_289_1.time_ < var_292_6 + var_292_16 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 1104201073
		arg_293_1.duration_ = 9

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play1104201074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "ST22"

			if arg_293_1.bgs_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(arg_293_1.paintGo_)

				var_296_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_296_0)
				var_296_1.name = var_296_0
				var_296_1.transform.parent = arg_293_1.stage_.transform
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.bgs_[var_296_0] = var_296_1
			end

			local var_296_2 = 1.999999999999

			if var_296_2 < arg_293_1.time_ and arg_293_1.time_ <= var_296_2 + arg_296_0 then
				local var_296_3 = manager.ui.mainCamera.transform.localPosition
				local var_296_4 = Vector3.New(0, 0, 10) + Vector3.New(var_296_3.x, var_296_3.y, 0)
				local var_296_5 = arg_293_1.bgs_.ST22

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
					if iter_296_0 ~= "ST22" then
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

				var_296_19.a = Mathf.Lerp(0, 1, var_296_18)
				arg_293_1.mask_.color = var_296_19
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				local var_296_20 = Color.New(0, 0, 0)

				var_296_20.a = 1
				arg_293_1.mask_.color = var_296_20
			end

			local var_296_21 = 2

			if var_296_21 < arg_293_1.time_ and arg_293_1.time_ <= var_296_21 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_22 = 2

			if var_296_21 <= arg_293_1.time_ and arg_293_1.time_ < var_296_21 + var_296_22 then
				local var_296_23 = (arg_293_1.time_ - var_296_21) / var_296_22
				local var_296_24 = Color.New(0, 0, 0)

				var_296_24.a = Mathf.Lerp(1, 0, var_296_23)
				arg_293_1.mask_.color = var_296_24
			end

			if arg_293_1.time_ >= var_296_21 + var_296_22 and arg_293_1.time_ < var_296_21 + var_296_22 + arg_296_0 then
				local var_296_25 = Color.New(0, 0, 0)
				local var_296_26 = 0

				arg_293_1.mask_.enabled = false
				var_296_25.a = var_296_26
				arg_293_1.mask_.color = var_296_25
			end

			local var_296_27 = arg_293_1.actors_["6046_story"].transform
			local var_296_28 = 1.96599999815226

			if var_296_28 < arg_293_1.time_ and arg_293_1.time_ <= var_296_28 + arg_296_0 then
				arg_293_1.var_.moveOldPos6046_story = var_296_27.localPosition
			end

			local var_296_29 = 0.001

			if var_296_28 <= arg_293_1.time_ and arg_293_1.time_ < var_296_28 + var_296_29 then
				local var_296_30 = (arg_293_1.time_ - var_296_28) / var_296_29
				local var_296_31 = Vector3.New(0, 100, 0)

				var_296_27.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos6046_story, var_296_31, var_296_30)

				local var_296_32 = manager.ui.mainCamera.transform.position - var_296_27.position

				var_296_27.forward = Vector3.New(var_296_32.x, var_296_32.y, var_296_32.z)

				local var_296_33 = var_296_27.localEulerAngles

				var_296_33.z = 0
				var_296_33.x = 0
				var_296_27.localEulerAngles = var_296_33
			end

			if arg_293_1.time_ >= var_296_28 + var_296_29 and arg_293_1.time_ < var_296_28 + var_296_29 + arg_296_0 then
				var_296_27.localPosition = Vector3.New(0, 100, 0)

				local var_296_34 = manager.ui.mainCamera.transform.position - var_296_27.position

				var_296_27.forward = Vector3.New(var_296_34.x, var_296_34.y, var_296_34.z)

				local var_296_35 = var_296_27.localEulerAngles

				var_296_35.z = 0
				var_296_35.x = 0
				var_296_27.localEulerAngles = var_296_35
			end

			local var_296_36 = arg_293_1.actors_["6046_story"]
			local var_296_37 = 1.96599999815226

			if var_296_37 < arg_293_1.time_ and arg_293_1.time_ <= var_296_37 + arg_296_0 and not isNil(var_296_36) and arg_293_1.var_.characterEffect6046_story == nil then
				arg_293_1.var_.characterEffect6046_story = var_296_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_38 = 0.034000001847744

			if var_296_37 <= arg_293_1.time_ and arg_293_1.time_ < var_296_37 + var_296_38 and not isNil(var_296_36) then
				local var_296_39 = (arg_293_1.time_ - var_296_37) / var_296_38

				if arg_293_1.var_.characterEffect6046_story and not isNil(var_296_36) then
					local var_296_40 = Mathf.Lerp(0, 0.5, var_296_39)

					arg_293_1.var_.characterEffect6046_story.fillFlat = true
					arg_293_1.var_.characterEffect6046_story.fillRatio = var_296_40
				end
			end

			if arg_293_1.time_ >= var_296_37 + var_296_38 and arg_293_1.time_ < var_296_37 + var_296_38 + arg_296_0 and not isNil(var_296_36) and arg_293_1.var_.characterEffect6046_story then
				local var_296_41 = 0.5

				arg_293_1.var_.characterEffect6046_story.fillFlat = true
				arg_293_1.var_.characterEffect6046_story.fillRatio = var_296_41
			end

			local var_296_42 = arg_293_1.actors_["6045_story"].transform
			local var_296_43 = 1.96599999815226

			if var_296_43 < arg_293_1.time_ and arg_293_1.time_ <= var_296_43 + arg_296_0 then
				arg_293_1.var_.moveOldPos6045_story = var_296_42.localPosition
			end

			local var_296_44 = 0.001

			if var_296_43 <= arg_293_1.time_ and arg_293_1.time_ < var_296_43 + var_296_44 then
				local var_296_45 = (arg_293_1.time_ - var_296_43) / var_296_44
				local var_296_46 = Vector3.New(0, 100, 0)

				var_296_42.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos6045_story, var_296_46, var_296_45)

				local var_296_47 = manager.ui.mainCamera.transform.position - var_296_42.position

				var_296_42.forward = Vector3.New(var_296_47.x, var_296_47.y, var_296_47.z)

				local var_296_48 = var_296_42.localEulerAngles

				var_296_48.z = 0
				var_296_48.x = 0
				var_296_42.localEulerAngles = var_296_48
			end

			if arg_293_1.time_ >= var_296_43 + var_296_44 and arg_293_1.time_ < var_296_43 + var_296_44 + arg_296_0 then
				var_296_42.localPosition = Vector3.New(0, 100, 0)

				local var_296_49 = manager.ui.mainCamera.transform.position - var_296_42.position

				var_296_42.forward = Vector3.New(var_296_49.x, var_296_49.y, var_296_49.z)

				local var_296_50 = var_296_42.localEulerAngles

				var_296_50.z = 0
				var_296_50.x = 0
				var_296_42.localEulerAngles = var_296_50
			end

			local var_296_51 = arg_293_1.actors_["6045_story"]
			local var_296_52 = 1.96599999815226

			if var_296_52 < arg_293_1.time_ and arg_293_1.time_ <= var_296_52 + arg_296_0 and not isNil(var_296_51) and arg_293_1.var_.characterEffect6045_story == nil then
				arg_293_1.var_.characterEffect6045_story = var_296_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_53 = 0.034000001847744

			if var_296_52 <= arg_293_1.time_ and arg_293_1.time_ < var_296_52 + var_296_53 and not isNil(var_296_51) then
				local var_296_54 = (arg_293_1.time_ - var_296_52) / var_296_53

				if arg_293_1.var_.characterEffect6045_story and not isNil(var_296_51) then
					local var_296_55 = Mathf.Lerp(0, 0.5, var_296_54)

					arg_293_1.var_.characterEffect6045_story.fillFlat = true
					arg_293_1.var_.characterEffect6045_story.fillRatio = var_296_55
				end
			end

			if arg_293_1.time_ >= var_296_52 + var_296_53 and arg_293_1.time_ < var_296_52 + var_296_53 + arg_296_0 and not isNil(var_296_51) and arg_293_1.var_.characterEffect6045_story then
				local var_296_56 = 0.5

				arg_293_1.var_.characterEffect6045_story.fillFlat = true
				arg_293_1.var_.characterEffect6045_story.fillRatio = var_296_56
			end

			if arg_293_1.frameCnt_ <= 1 then
				arg_293_1.dialog_:SetActive(false)
			end

			local var_296_57 = 3.999999999999
			local var_296_58 = 1.075

			if var_296_57 < arg_293_1.time_ and arg_293_1.time_ <= var_296_57 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				arg_293_1.dialog_:SetActive(true)

				local var_296_59 = LeanTween.value(arg_293_1.dialog_, 0, 1, 0.3)

				var_296_59:setOnUpdate(LuaHelper.FloatAction(function(arg_297_0)
					arg_293_1.dialogCg_.alpha = arg_297_0
				end))
				var_296_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_293_1.dialog_)
					var_296_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_293_1.duration_ = arg_293_1.duration_ + 0.3

				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_60 = arg_293_1:GetWordFromCfg(1104201073)
				local var_296_61 = arg_293_1:FormatText(var_296_60.content)

				arg_293_1.text_.text = var_296_61

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_62 = 43
				local var_296_63 = utf8.len(var_296_61)
				local var_296_64 = var_296_62 <= 0 and var_296_58 or var_296_58 * (var_296_63 / var_296_62)

				if var_296_64 > 0 and var_296_58 < var_296_64 then
					arg_293_1.talkMaxDuration = var_296_64
					var_296_57 = var_296_57 + 0.3

					if var_296_64 + var_296_57 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_64 + var_296_57
					end
				end

				arg_293_1.text_.text = var_296_61
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_65 = var_296_57 + 0.3
			local var_296_66 = math.max(var_296_58, arg_293_1.talkMaxDuration)

			if var_296_65 <= arg_293_1.time_ and arg_293_1.time_ < var_296_65 + var_296_66 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_65) / var_296_66

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_65 + var_296_66 and arg_293_1.time_ < var_296_65 + var_296_66 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 1104201074
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play1104201075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.6

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_2 = arg_299_1:GetWordFromCfg(1104201074)
				local var_302_3 = arg_299_1:FormatText(var_302_2.content)

				arg_299_1.text_.text = var_302_3

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_4 = 24
				local var_302_5 = utf8.len(var_302_3)
				local var_302_6 = var_302_4 <= 0 and var_302_1 or var_302_1 * (var_302_5 / var_302_4)

				if var_302_6 > 0 and var_302_1 < var_302_6 then
					arg_299_1.talkMaxDuration = var_302_6

					if var_302_6 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_6 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_3
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_7 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_7 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_7

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_7 and arg_299_1.time_ < var_302_0 + var_302_7 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 1104201075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play1104201076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.75

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_303_1.callingController_:SetSelectedState("normal")

				arg_303_1.keyicon_.color = Color.New(1, 1, 1)
				arg_303_1.icon_.color = Color.New(1, 1, 1)

				local var_306_3 = arg_303_1:GetWordFromCfg(1104201075)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 30
				local var_306_6 = utf8.len(var_306_4)
				local var_306_7 = var_306_5 <= 0 and var_306_1 or var_306_1 * (var_306_6 / var_306_5)

				if var_306_7 > 0 and var_306_1 < var_306_7 then
					arg_303_1.talkMaxDuration = var_306_7

					if var_306_7 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_7 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_4
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_8 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_8 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_8

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_8 and arg_303_1.time_ < var_306_0 + var_306_8 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 1104201076
		arg_307_1.duration_ = 12.77

		local var_307_0 = {
			ja = 9.266,
			ko = 12.766,
			zh = 12.766
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play1104201077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["6045_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos6045_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, -0.5, -6.3)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos6045_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["6045_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and not isNil(var_310_9) and arg_307_1.var_.characterEffect6045_story == nil then
				arg_307_1.var_.characterEffect6045_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 and not isNil(var_310_9) then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect6045_story and not isNil(var_310_9) then
					arg_307_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and not isNil(var_310_9) and arg_307_1.var_.characterEffect6045_story then
				arg_307_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_310_13 = 0

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 then
				arg_307_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_310_15 = 0
			local var_310_16 = 1.175

			if var_310_15 < arg_307_1.time_ and arg_307_1.time_ <= var_310_15 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_17 = arg_307_1:FormatText(StoryNameCfg[215].name)

				arg_307_1.leftNameTxt_.text = var_310_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_18 = arg_307_1:GetWordFromCfg(1104201076)
				local var_310_19 = arg_307_1:FormatText(var_310_18.content)

				arg_307_1.text_.text = var_310_19

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_20 = 47
				local var_310_21 = utf8.len(var_310_19)
				local var_310_22 = var_310_20 <= 0 and var_310_16 or var_310_16 * (var_310_21 / var_310_20)

				if var_310_22 > 0 and var_310_16 < var_310_22 then
					arg_307_1.talkMaxDuration = var_310_22

					if var_310_22 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_22 + var_310_15
					end
				end

				arg_307_1.text_.text = var_310_19
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201076", "story_v_side_new_1104201.awb") ~= 0 then
					local var_310_23 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201076", "story_v_side_new_1104201.awb") / 1000

					if var_310_23 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_23 + var_310_15
					end

					if var_310_18.prefab_name ~= "" and arg_307_1.actors_[var_310_18.prefab_name] ~= nil then
						local var_310_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_18.prefab_name].transform, "story_v_side_new_1104201", "1104201076", "story_v_side_new_1104201.awb")

						arg_307_1:RecordAudio("1104201076", var_310_24)
						arg_307_1:RecordAudio("1104201076", var_310_24)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201076", "story_v_side_new_1104201.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201076", "story_v_side_new_1104201.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_25 = math.max(var_310_16, arg_307_1.talkMaxDuration)

			if var_310_15 <= arg_307_1.time_ and arg_307_1.time_ < var_310_15 + var_310_25 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_15) / var_310_25

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_15 + var_310_25 and arg_307_1.time_ < var_310_15 + var_310_25 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 1104201077
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play1104201078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["6045_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and not isNil(var_314_0) and arg_311_1.var_.characterEffect6045_story == nil then
				arg_311_1.var_.characterEffect6045_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.200000002980232

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 and not isNil(var_314_0) then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect6045_story and not isNil(var_314_0) then
					local var_314_4 = Mathf.Lerp(0, 0.5, var_314_3)

					arg_311_1.var_.characterEffect6045_story.fillFlat = true
					arg_311_1.var_.characterEffect6045_story.fillRatio = var_314_4
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and not isNil(var_314_0) and arg_311_1.var_.characterEffect6045_story then
				local var_314_5 = 0.5

				arg_311_1.var_.characterEffect6045_story.fillFlat = true
				arg_311_1.var_.characterEffect6045_story.fillRatio = var_314_5
			end

			local var_314_6 = 0
			local var_314_7 = 1.025

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_8 = arg_311_1:FormatText(StoryNameCfg[7].name)

				arg_311_1.leftNameTxt_.text = var_314_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, true)
				arg_311_1.iconController_:SetSelectedState("hero")

				arg_311_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_311_1.callingController_:SetSelectedState("normal")

				arg_311_1.keyicon_.color = Color.New(1, 1, 1)
				arg_311_1.icon_.color = Color.New(1, 1, 1)

				local var_314_9 = arg_311_1:GetWordFromCfg(1104201077)
				local var_314_10 = arg_311_1:FormatText(var_314_9.content)

				arg_311_1.text_.text = var_314_10

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_11 = 41
				local var_314_12 = utf8.len(var_314_10)
				local var_314_13 = var_314_11 <= 0 and var_314_7 or var_314_7 * (var_314_12 / var_314_11)

				if var_314_13 > 0 and var_314_7 < var_314_13 then
					arg_311_1.talkMaxDuration = var_314_13

					if var_314_13 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_13 + var_314_6
					end
				end

				arg_311_1.text_.text = var_314_10
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_14 = math.max(var_314_7, arg_311_1.talkMaxDuration)

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_14 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_6) / var_314_14

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_6 + var_314_14 and arg_311_1.time_ < var_314_6 + var_314_14 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 1104201078
		arg_315_1.duration_ = 3.1

		local var_315_0 = {
			ja = 2.166,
			ko = 3.1,
			zh = 3.1
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play1104201079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["6045_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos6045_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos6045_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["6045_story"]
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 and not isNil(var_318_9) and arg_315_1.var_.characterEffect6045_story == nil then
				arg_315_1.var_.characterEffect6045_story = var_318_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_11 = 0.200000002980232

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 and not isNil(var_318_9) then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11

				if arg_315_1.var_.characterEffect6045_story and not isNil(var_318_9) then
					local var_318_13 = Mathf.Lerp(0, 0.5, var_318_12)

					arg_315_1.var_.characterEffect6045_story.fillFlat = true
					arg_315_1.var_.characterEffect6045_story.fillRatio = var_318_13
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and not isNil(var_318_9) and arg_315_1.var_.characterEffect6045_story then
				local var_318_14 = 0.5

				arg_315_1.var_.characterEffect6045_story.fillFlat = true
				arg_315_1.var_.characterEffect6045_story.fillRatio = var_318_14
			end

			local var_318_15 = arg_315_1.actors_["6046_story"].transform
			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.var_.moveOldPos6046_story = var_318_15.localPosition
			end

			local var_318_17 = 0.001

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Vector3.New(0.7, -0.5, -6.3)

				var_318_15.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos6046_story, var_318_19, var_318_18)

				local var_318_20 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_20.x, var_318_20.y, var_318_20.z)

				local var_318_21 = var_318_15.localEulerAngles

				var_318_21.z = 0
				var_318_21.x = 0
				var_318_15.localEulerAngles = var_318_21
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				var_318_15.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_318_22 = manager.ui.mainCamera.transform.position - var_318_15.position

				var_318_15.forward = Vector3.New(var_318_22.x, var_318_22.y, var_318_22.z)

				local var_318_23 = var_318_15.localEulerAngles

				var_318_23.z = 0
				var_318_23.x = 0
				var_318_15.localEulerAngles = var_318_23
			end

			local var_318_24 = arg_315_1.actors_["6046_story"]
			local var_318_25 = 0

			if var_318_25 < arg_315_1.time_ and arg_315_1.time_ <= var_318_25 + arg_318_0 and not isNil(var_318_24) and arg_315_1.var_.characterEffect6046_story == nil then
				arg_315_1.var_.characterEffect6046_story = var_318_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_26 = 0.200000002980232

			if var_318_25 <= arg_315_1.time_ and arg_315_1.time_ < var_318_25 + var_318_26 and not isNil(var_318_24) then
				local var_318_27 = (arg_315_1.time_ - var_318_25) / var_318_26

				if arg_315_1.var_.characterEffect6046_story and not isNil(var_318_24) then
					arg_315_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_25 + var_318_26 and arg_315_1.time_ < var_318_25 + var_318_26 + arg_318_0 and not isNil(var_318_24) and arg_315_1.var_.characterEffect6046_story then
				arg_315_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_318_28 = 0

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 then
				arg_315_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_30 = 0
			local var_318_31 = 0.25

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_32 = arg_315_1:FormatText(StoryNameCfg[214].name)

				arg_315_1.leftNameTxt_.text = var_318_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_33 = arg_315_1:GetWordFromCfg(1104201078)
				local var_318_34 = arg_315_1:FormatText(var_318_33.content)

				arg_315_1.text_.text = var_318_34

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_35 = 10
				local var_318_36 = utf8.len(var_318_34)
				local var_318_37 = var_318_35 <= 0 and var_318_31 or var_318_31 * (var_318_36 / var_318_35)

				if var_318_37 > 0 and var_318_31 < var_318_37 then
					arg_315_1.talkMaxDuration = var_318_37

					if var_318_37 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_37 + var_318_30
					end
				end

				arg_315_1.text_.text = var_318_34
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201078", "story_v_side_new_1104201.awb") ~= 0 then
					local var_318_38 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201078", "story_v_side_new_1104201.awb") / 1000

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end

					if var_318_33.prefab_name ~= "" and arg_315_1.actors_[var_318_33.prefab_name] ~= nil then
						local var_318_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_33.prefab_name].transform, "story_v_side_new_1104201", "1104201078", "story_v_side_new_1104201.awb")

						arg_315_1:RecordAudio("1104201078", var_318_39)
						arg_315_1:RecordAudio("1104201078", var_318_39)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201078", "story_v_side_new_1104201.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201078", "story_v_side_new_1104201.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_40 = math.max(var_318_31, arg_315_1.talkMaxDuration)

			if var_318_30 <= arg_315_1.time_ and arg_315_1.time_ < var_318_30 + var_318_40 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_30) / var_318_40

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_30 + var_318_40 and arg_315_1.time_ < var_318_30 + var_318_40 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 1104201079
		arg_319_1.duration_ = 9.33

		local var_319_0 = {
			ja = 9.333,
			ko = 9.066,
			zh = 9.066
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
				arg_319_0:Play1104201080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["6045_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and not isNil(var_322_0) and arg_319_1.var_.characterEffect6045_story == nil then
				arg_319_1.var_.characterEffect6045_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.200000002980232

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 and not isNil(var_322_0) then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect6045_story and not isNil(var_322_0) then
					arg_319_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and not isNil(var_322_0) and arg_319_1.var_.characterEffect6045_story then
				arg_319_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_322_4 = 0

			if var_322_4 < arg_319_1.time_ and arg_319_1.time_ <= var_322_4 + arg_322_0 then
				arg_319_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_322_6 = arg_319_1.actors_["6046_story"]
			local var_322_7 = 0

			if var_322_7 < arg_319_1.time_ and arg_319_1.time_ <= var_322_7 + arg_322_0 and not isNil(var_322_6) and arg_319_1.var_.characterEffect6046_story == nil then
				arg_319_1.var_.characterEffect6046_story = var_322_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_8 = 0.200000002980232

			if var_322_7 <= arg_319_1.time_ and arg_319_1.time_ < var_322_7 + var_322_8 and not isNil(var_322_6) then
				local var_322_9 = (arg_319_1.time_ - var_322_7) / var_322_8

				if arg_319_1.var_.characterEffect6046_story and not isNil(var_322_6) then
					local var_322_10 = Mathf.Lerp(0, 0.5, var_322_9)

					arg_319_1.var_.characterEffect6046_story.fillFlat = true
					arg_319_1.var_.characterEffect6046_story.fillRatio = var_322_10
				end
			end

			if arg_319_1.time_ >= var_322_7 + var_322_8 and arg_319_1.time_ < var_322_7 + var_322_8 + arg_322_0 and not isNil(var_322_6) and arg_319_1.var_.characterEffect6046_story then
				local var_322_11 = 0.5

				arg_319_1.var_.characterEffect6046_story.fillFlat = true
				arg_319_1.var_.characterEffect6046_story.fillRatio = var_322_11
			end

			local var_322_12 = 0
			local var_322_13 = 0.825

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_14 = arg_319_1:FormatText(StoryNameCfg[215].name)

				arg_319_1.leftNameTxt_.text = var_322_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_15 = arg_319_1:GetWordFromCfg(1104201079)
				local var_322_16 = arg_319_1:FormatText(var_322_15.content)

				arg_319_1.text_.text = var_322_16

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_17 = 33
				local var_322_18 = utf8.len(var_322_16)
				local var_322_19 = var_322_17 <= 0 and var_322_13 or var_322_13 * (var_322_18 / var_322_17)

				if var_322_19 > 0 and var_322_13 < var_322_19 then
					arg_319_1.talkMaxDuration = var_322_19

					if var_322_19 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_19 + var_322_12
					end
				end

				arg_319_1.text_.text = var_322_16
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201079", "story_v_side_new_1104201.awb") ~= 0 then
					local var_322_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201079", "story_v_side_new_1104201.awb") / 1000

					if var_322_20 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_20 + var_322_12
					end

					if var_322_15.prefab_name ~= "" and arg_319_1.actors_[var_322_15.prefab_name] ~= nil then
						local var_322_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_15.prefab_name].transform, "story_v_side_new_1104201", "1104201079", "story_v_side_new_1104201.awb")

						arg_319_1:RecordAudio("1104201079", var_322_21)
						arg_319_1:RecordAudio("1104201079", var_322_21)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201079", "story_v_side_new_1104201.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201079", "story_v_side_new_1104201.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_22 = math.max(var_322_13, arg_319_1.talkMaxDuration)

			if var_322_12 <= arg_319_1.time_ and arg_319_1.time_ < var_322_12 + var_322_22 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_12) / var_322_22

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_12 + var_322_22 and arg_319_1.time_ < var_322_12 + var_322_22 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 1104201080
		arg_323_1.duration_ = 10.7

		local var_323_0 = {
			ja = 10.7,
			ko = 6.533,
			zh = 6.533
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play1104201081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.575

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_2 = arg_323_1:FormatText(StoryNameCfg[215].name)

				arg_323_1.leftNameTxt_.text = var_326_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_3 = arg_323_1:GetWordFromCfg(1104201080)
				local var_326_4 = arg_323_1:FormatText(var_326_3.content)

				arg_323_1.text_.text = var_326_4

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_5 = 23
				local var_326_6 = utf8.len(var_326_4)
				local var_326_7 = var_326_5 <= 0 and var_326_1 or var_326_1 * (var_326_6 / var_326_5)

				if var_326_7 > 0 and var_326_1 < var_326_7 then
					arg_323_1.talkMaxDuration = var_326_7

					if var_326_7 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_7 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_4
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201080", "story_v_side_new_1104201.awb") ~= 0 then
					local var_326_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201080", "story_v_side_new_1104201.awb") / 1000

					if var_326_8 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_8 + var_326_0
					end

					if var_326_3.prefab_name ~= "" and arg_323_1.actors_[var_326_3.prefab_name] ~= nil then
						local var_326_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_3.prefab_name].transform, "story_v_side_new_1104201", "1104201080", "story_v_side_new_1104201.awb")

						arg_323_1:RecordAudio("1104201080", var_326_9)
						arg_323_1:RecordAudio("1104201080", var_326_9)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201080", "story_v_side_new_1104201.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201080", "story_v_side_new_1104201.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_10 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_10 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_10

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_10 and arg_323_1.time_ < var_326_0 + var_326_10 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 1104201081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play1104201082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["6045_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and not isNil(var_330_0) and arg_327_1.var_.characterEffect6045_story == nil then
				arg_327_1.var_.characterEffect6045_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 and not isNil(var_330_0) then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect6045_story and not isNil(var_330_0) then
					local var_330_4 = Mathf.Lerp(0, 0.5, var_330_3)

					arg_327_1.var_.characterEffect6045_story.fillFlat = true
					arg_327_1.var_.characterEffect6045_story.fillRatio = var_330_4
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and not isNil(var_330_0) and arg_327_1.var_.characterEffect6045_story then
				local var_330_5 = 0.5

				arg_327_1.var_.characterEffect6045_story.fillFlat = true
				arg_327_1.var_.characterEffect6045_story.fillRatio = var_330_5
			end

			local var_330_6 = 0
			local var_330_7 = 1.175

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_8 = arg_327_1:FormatText(StoryNameCfg[7].name)

				arg_327_1.leftNameTxt_.text = var_330_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, true)
				arg_327_1.iconController_:SetSelectedState("hero")

				arg_327_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_327_1.callingController_:SetSelectedState("normal")

				arg_327_1.keyicon_.color = Color.New(1, 1, 1)
				arg_327_1.icon_.color = Color.New(1, 1, 1)

				local var_330_9 = arg_327_1:GetWordFromCfg(1104201081)
				local var_330_10 = arg_327_1:FormatText(var_330_9.content)

				arg_327_1.text_.text = var_330_10

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_11 = 47
				local var_330_12 = utf8.len(var_330_10)
				local var_330_13 = var_330_11 <= 0 and var_330_7 or var_330_7 * (var_330_12 / var_330_11)

				if var_330_13 > 0 and var_330_7 < var_330_13 then
					arg_327_1.talkMaxDuration = var_330_13

					if var_330_13 + var_330_6 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_13 + var_330_6
					end
				end

				arg_327_1.text_.text = var_330_10
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_14 = math.max(var_330_7, arg_327_1.talkMaxDuration)

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_14 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_6) / var_330_14

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_6 + var_330_14 and arg_327_1.time_ < var_330_6 + var_330_14 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 1104201082
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play1104201083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 0.375

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, true)
				arg_331_1.iconController_:SetSelectedState("hero")

				arg_331_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_331_1.callingController_:SetSelectedState("normal")

				arg_331_1.keyicon_.color = Color.New(1, 1, 1)
				arg_331_1.icon_.color = Color.New(1, 1, 1)

				local var_334_3 = arg_331_1:GetWordFromCfg(1104201082)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 15
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
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_8 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_8 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_8

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_8 and arg_331_1.time_ < var_334_0 + var_334_8 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 1104201083
		arg_335_1.duration_ = 12.3

		local var_335_0 = {
			ja = 12.3,
			ko = 8.633,
			zh = 8.633
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play1104201084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["6045_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and not isNil(var_338_0) and arg_335_1.var_.characterEffect6045_story == nil then
				arg_335_1.var_.characterEffect6045_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 and not isNil(var_338_0) then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect6045_story and not isNil(var_338_0) then
					arg_335_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and not isNil(var_338_0) and arg_335_1.var_.characterEffect6045_story then
				arg_335_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_338_4 = 0

			if var_338_4 < arg_335_1.time_ and arg_335_1.time_ <= var_338_4 + arg_338_0 then
				arg_335_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_2")
			end

			local var_338_5 = 0

			if var_338_5 < arg_335_1.time_ and arg_335_1.time_ <= var_338_5 + arg_338_0 then
				arg_335_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_338_6 = 0

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 then
				arg_335_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_2")
			end

			local var_338_7 = 0
			local var_338_8 = 0.85

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_9 = arg_335_1:FormatText(StoryNameCfg[215].name)

				arg_335_1.leftNameTxt_.text = var_338_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_10 = arg_335_1:GetWordFromCfg(1104201083)
				local var_338_11 = arg_335_1:FormatText(var_338_10.content)

				arg_335_1.text_.text = var_338_11

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_12 = 34
				local var_338_13 = utf8.len(var_338_11)
				local var_338_14 = var_338_12 <= 0 and var_338_8 or var_338_8 * (var_338_13 / var_338_12)

				if var_338_14 > 0 and var_338_8 < var_338_14 then
					arg_335_1.talkMaxDuration = var_338_14

					if var_338_14 + var_338_7 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_14 + var_338_7
					end
				end

				arg_335_1.text_.text = var_338_11
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201083", "story_v_side_new_1104201.awb") ~= 0 then
					local var_338_15 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201083", "story_v_side_new_1104201.awb") / 1000

					if var_338_15 + var_338_7 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_15 + var_338_7
					end

					if var_338_10.prefab_name ~= "" and arg_335_1.actors_[var_338_10.prefab_name] ~= nil then
						local var_338_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_10.prefab_name].transform, "story_v_side_new_1104201", "1104201083", "story_v_side_new_1104201.awb")

						arg_335_1:RecordAudio("1104201083", var_338_16)
						arg_335_1:RecordAudio("1104201083", var_338_16)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201083", "story_v_side_new_1104201.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201083", "story_v_side_new_1104201.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_17 = math.max(var_338_8, arg_335_1.talkMaxDuration)

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_17 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_7) / var_338_17

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_7 + var_338_17 and arg_335_1.time_ < var_338_7 + var_338_17 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201084 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 1104201084
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play1104201085(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["6045_story"]
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 and not isNil(var_342_0) and arg_339_1.var_.characterEffect6045_story == nil then
				arg_339_1.var_.characterEffect6045_story = var_342_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_2 = 0.200000002980232

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 and not isNil(var_342_0) then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2

				if arg_339_1.var_.characterEffect6045_story and not isNil(var_342_0) then
					local var_342_4 = Mathf.Lerp(0, 0.5, var_342_3)

					arg_339_1.var_.characterEffect6045_story.fillFlat = true
					arg_339_1.var_.characterEffect6045_story.fillRatio = var_342_4
				end
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 and not isNil(var_342_0) and arg_339_1.var_.characterEffect6045_story then
				local var_342_5 = 0.5

				arg_339_1.var_.characterEffect6045_story.fillFlat = true
				arg_339_1.var_.characterEffect6045_story.fillRatio = var_342_5
			end

			local var_342_6 = 0
			local var_342_7 = 0.125

			if var_342_6 < arg_339_1.time_ and arg_339_1.time_ <= var_342_6 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_8 = arg_339_1:FormatText(StoryNameCfg[7].name)

				arg_339_1.leftNameTxt_.text = var_342_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, true)
				arg_339_1.iconController_:SetSelectedState("hero")

				arg_339_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_339_1.callingController_:SetSelectedState("normal")

				arg_339_1.keyicon_.color = Color.New(1, 1, 1)
				arg_339_1.icon_.color = Color.New(1, 1, 1)

				local var_342_9 = arg_339_1:GetWordFromCfg(1104201084)
				local var_342_10 = arg_339_1:FormatText(var_342_9.content)

				arg_339_1.text_.text = var_342_10

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_11 = 5
				local var_342_12 = utf8.len(var_342_10)
				local var_342_13 = var_342_11 <= 0 and var_342_7 or var_342_7 * (var_342_12 / var_342_11)

				if var_342_13 > 0 and var_342_7 < var_342_13 then
					arg_339_1.talkMaxDuration = var_342_13

					if var_342_13 + var_342_6 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_13 + var_342_6
					end
				end

				arg_339_1.text_.text = var_342_10
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_14 = math.max(var_342_7, arg_339_1.talkMaxDuration)

			if var_342_6 <= arg_339_1.time_ and arg_339_1.time_ < var_342_6 + var_342_14 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_6) / var_342_14

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_6 + var_342_14 and arg_339_1.time_ < var_342_6 + var_342_14 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201085 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 1104201085
		arg_343_1.duration_ = 14.6

		local var_343_0 = {
			ja = 14.6,
			ko = 12.866,
			zh = 12.866
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play1104201086(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["6045_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.characterEffect6045_story == nil then
				arg_343_1.var_.characterEffect6045_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 and not isNil(var_346_0) then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect6045_story and not isNil(var_346_0) then
					arg_343_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.characterEffect6045_story then
				arg_343_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_346_4 = 0

			if var_346_4 < arg_343_1.time_ and arg_343_1.time_ <= var_346_4 + arg_346_0 then
				arg_343_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_346_5 = 0

			if var_346_5 < arg_343_1.time_ and arg_343_1.time_ <= var_346_5 + arg_346_0 then
				arg_343_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_346_6 = 0
			local var_346_7 = 1.175

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_8 = arg_343_1:FormatText(StoryNameCfg[215].name)

				arg_343_1.leftNameTxt_.text = var_346_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_9 = arg_343_1:GetWordFromCfg(1104201085)
				local var_346_10 = arg_343_1:FormatText(var_346_9.content)

				arg_343_1.text_.text = var_346_10

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_11 = 47
				local var_346_12 = utf8.len(var_346_10)
				local var_346_13 = var_346_11 <= 0 and var_346_7 or var_346_7 * (var_346_12 / var_346_11)

				if var_346_13 > 0 and var_346_7 < var_346_13 then
					arg_343_1.talkMaxDuration = var_346_13

					if var_346_13 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_13 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_10
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201085", "story_v_side_new_1104201.awb") ~= 0 then
					local var_346_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201085", "story_v_side_new_1104201.awb") / 1000

					if var_346_14 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_14 + var_346_6
					end

					if var_346_9.prefab_name ~= "" and arg_343_1.actors_[var_346_9.prefab_name] ~= nil then
						local var_346_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_9.prefab_name].transform, "story_v_side_new_1104201", "1104201085", "story_v_side_new_1104201.awb")

						arg_343_1:RecordAudio("1104201085", var_346_15)
						arg_343_1:RecordAudio("1104201085", var_346_15)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201085", "story_v_side_new_1104201.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201085", "story_v_side_new_1104201.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_16 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_16 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_16

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_16 and arg_343_1.time_ < var_346_6 + var_346_16 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201086 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 1104201086
		arg_347_1.duration_ = 18.63

		local var_347_0 = {
			ja = 15.566,
			ko = 18.633,
			zh = 18.633
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
				arg_347_0:Play1104201087(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 1.65

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[215].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(1104201086)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 66
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201086", "story_v_side_new_1104201.awb") ~= 0 then
					local var_350_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201086", "story_v_side_new_1104201.awb") / 1000

					if var_350_8 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_8 + var_350_0
					end

					if var_350_3.prefab_name ~= "" and arg_347_1.actors_[var_350_3.prefab_name] ~= nil then
						local var_350_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_3.prefab_name].transform, "story_v_side_new_1104201", "1104201086", "story_v_side_new_1104201.awb")

						arg_347_1:RecordAudio("1104201086", var_350_9)
						arg_347_1:RecordAudio("1104201086", var_350_9)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201086", "story_v_side_new_1104201.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201086", "story_v_side_new_1104201.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_10 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_10 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_10

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_10 and arg_347_1.time_ < var_350_0 + var_350_10 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201087 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1104201087
		arg_351_1.duration_ = 3.7

		local var_351_0 = {
			ja = 2.866,
			ko = 3.7,
			zh = 3.7
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play1104201088(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["6046_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and not isNil(var_354_0) and arg_351_1.var_.characterEffect6046_story == nil then
				arg_351_1.var_.characterEffect6046_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.200000002980232

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 and not isNil(var_354_0) then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect6046_story and not isNil(var_354_0) then
					arg_351_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and not isNil(var_354_0) and arg_351_1.var_.characterEffect6046_story then
				arg_351_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_354_4 = 0

			if var_354_4 < arg_351_1.time_ and arg_351_1.time_ <= var_354_4 + arg_354_0 then
				arg_351_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_354_5 = 0

			if var_354_5 < arg_351_1.time_ and arg_351_1.time_ <= var_354_5 + arg_354_0 then
				arg_351_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_354_6 = arg_351_1.actors_["6045_story"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and not isNil(var_354_6) and arg_351_1.var_.characterEffect6045_story == nil then
				arg_351_1.var_.characterEffect6045_story = var_354_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_8 = 0.200000002980232

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 and not isNil(var_354_6) then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.characterEffect6045_story and not isNil(var_354_6) then
					local var_354_10 = Mathf.Lerp(0, 0.5, var_354_9)

					arg_351_1.var_.characterEffect6045_story.fillFlat = true
					arg_351_1.var_.characterEffect6045_story.fillRatio = var_354_10
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and not isNil(var_354_6) and arg_351_1.var_.characterEffect6045_story then
				local var_354_11 = 0.5

				arg_351_1.var_.characterEffect6045_story.fillFlat = true
				arg_351_1.var_.characterEffect6045_story.fillRatio = var_354_11
			end

			local var_354_12 = 0
			local var_354_13 = 0.325

			if var_354_12 < arg_351_1.time_ and arg_351_1.time_ <= var_354_12 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_14 = arg_351_1:FormatText(StoryNameCfg[214].name)

				arg_351_1.leftNameTxt_.text = var_354_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_15 = arg_351_1:GetWordFromCfg(1104201087)
				local var_354_16 = arg_351_1:FormatText(var_354_15.content)

				arg_351_1.text_.text = var_354_16

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_17 = 13
				local var_354_18 = utf8.len(var_354_16)
				local var_354_19 = var_354_17 <= 0 and var_354_13 or var_354_13 * (var_354_18 / var_354_17)

				if var_354_19 > 0 and var_354_13 < var_354_19 then
					arg_351_1.talkMaxDuration = var_354_19

					if var_354_19 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_19 + var_354_12
					end
				end

				arg_351_1.text_.text = var_354_16
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201087", "story_v_side_new_1104201.awb") ~= 0 then
					local var_354_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201087", "story_v_side_new_1104201.awb") / 1000

					if var_354_20 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_20 + var_354_12
					end

					if var_354_15.prefab_name ~= "" and arg_351_1.actors_[var_354_15.prefab_name] ~= nil then
						local var_354_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_15.prefab_name].transform, "story_v_side_new_1104201", "1104201087", "story_v_side_new_1104201.awb")

						arg_351_1:RecordAudio("1104201087", var_354_21)
						arg_351_1:RecordAudio("1104201087", var_354_21)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201087", "story_v_side_new_1104201.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201087", "story_v_side_new_1104201.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_22 = math.max(var_354_13, arg_351_1.talkMaxDuration)

			if var_354_12 <= arg_351_1.time_ and arg_351_1.time_ < var_354_12 + var_354_22 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_12) / var_354_22

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_12 + var_354_22 and arg_351_1.time_ < var_354_12 + var_354_22 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201088 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1104201088
		arg_355_1.duration_ = 18.5

		local var_355_0 = {
			ja = 18.5,
			ko = 13.533,
			zh = 13.533
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1104201089(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["6045_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and not isNil(var_358_0) and arg_355_1.var_.characterEffect6045_story == nil then
				arg_355_1.var_.characterEffect6045_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 and not isNil(var_358_0) then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect6045_story and not isNil(var_358_0) then
					arg_355_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and not isNil(var_358_0) and arg_355_1.var_.characterEffect6045_story then
				arg_355_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_358_4 = 0

			if var_358_4 < arg_355_1.time_ and arg_355_1.time_ <= var_358_4 + arg_358_0 then
				arg_355_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 then
				arg_355_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_358_6 = arg_355_1.actors_["6046_story"]
			local var_358_7 = 0

			if var_358_7 < arg_355_1.time_ and arg_355_1.time_ <= var_358_7 + arg_358_0 and not isNil(var_358_6) and arg_355_1.var_.characterEffect6046_story == nil then
				arg_355_1.var_.characterEffect6046_story = var_358_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_8 = 0.200000002980232

			if var_358_7 <= arg_355_1.time_ and arg_355_1.time_ < var_358_7 + var_358_8 and not isNil(var_358_6) then
				local var_358_9 = (arg_355_1.time_ - var_358_7) / var_358_8

				if arg_355_1.var_.characterEffect6046_story and not isNil(var_358_6) then
					local var_358_10 = Mathf.Lerp(0, 0.5, var_358_9)

					arg_355_1.var_.characterEffect6046_story.fillFlat = true
					arg_355_1.var_.characterEffect6046_story.fillRatio = var_358_10
				end
			end

			if arg_355_1.time_ >= var_358_7 + var_358_8 and arg_355_1.time_ < var_358_7 + var_358_8 + arg_358_0 and not isNil(var_358_6) and arg_355_1.var_.characterEffect6046_story then
				local var_358_11 = 0.5

				arg_355_1.var_.characterEffect6046_story.fillFlat = true
				arg_355_1.var_.characterEffect6046_story.fillRatio = var_358_11
			end

			local var_358_12 = 0
			local var_358_13 = 1.15

			if var_358_12 < arg_355_1.time_ and arg_355_1.time_ <= var_358_12 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_14 = arg_355_1:FormatText(StoryNameCfg[215].name)

				arg_355_1.leftNameTxt_.text = var_358_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_15 = arg_355_1:GetWordFromCfg(1104201088)
				local var_358_16 = arg_355_1:FormatText(var_358_15.content)

				arg_355_1.text_.text = var_358_16

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_17 = 45
				local var_358_18 = utf8.len(var_358_16)
				local var_358_19 = var_358_17 <= 0 and var_358_13 or var_358_13 * (var_358_18 / var_358_17)

				if var_358_19 > 0 and var_358_13 < var_358_19 then
					arg_355_1.talkMaxDuration = var_358_19

					if var_358_19 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_19 + var_358_12
					end
				end

				arg_355_1.text_.text = var_358_16
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201088", "story_v_side_new_1104201.awb") ~= 0 then
					local var_358_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201088", "story_v_side_new_1104201.awb") / 1000

					if var_358_20 + var_358_12 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_20 + var_358_12
					end

					if var_358_15.prefab_name ~= "" and arg_355_1.actors_[var_358_15.prefab_name] ~= nil then
						local var_358_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_15.prefab_name].transform, "story_v_side_new_1104201", "1104201088", "story_v_side_new_1104201.awb")

						arg_355_1:RecordAudio("1104201088", var_358_21)
						arg_355_1:RecordAudio("1104201088", var_358_21)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201088", "story_v_side_new_1104201.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201088", "story_v_side_new_1104201.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_22 = math.max(var_358_13, arg_355_1.talkMaxDuration)

			if var_358_12 <= arg_355_1.time_ and arg_355_1.time_ < var_358_12 + var_358_22 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_12) / var_358_22

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_12 + var_358_22 and arg_355_1.time_ < var_358_12 + var_358_22 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201089 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 1104201089
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play1104201090(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["6045_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and not isNil(var_362_0) and arg_359_1.var_.characterEffect6045_story == nil then
				arg_359_1.var_.characterEffect6045_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 and not isNil(var_362_0) then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect6045_story and not isNil(var_362_0) then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect6045_story.fillFlat = true
					arg_359_1.var_.characterEffect6045_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and not isNil(var_362_0) and arg_359_1.var_.characterEffect6045_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect6045_story.fillFlat = true
				arg_359_1.var_.characterEffect6045_story.fillRatio = var_362_5
			end

			local var_362_6 = 0
			local var_362_7 = 0.2

			if var_362_6 < arg_359_1.time_ and arg_359_1.time_ <= var_362_6 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_8 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, true)
				arg_359_1.iconController_:SetSelectedState("hero")

				arg_359_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_359_1.callingController_:SetSelectedState("normal")

				arg_359_1.keyicon_.color = Color.New(1, 1, 1)
				arg_359_1.icon_.color = Color.New(1, 1, 1)

				local var_362_9 = arg_359_1:GetWordFromCfg(1104201089)
				local var_362_10 = arg_359_1:FormatText(var_362_9.content)

				arg_359_1.text_.text = var_362_10

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_11 = 8
				local var_362_12 = utf8.len(var_362_10)
				local var_362_13 = var_362_11 <= 0 and var_362_7 or var_362_7 * (var_362_12 / var_362_11)

				if var_362_13 > 0 and var_362_7 < var_362_13 then
					arg_359_1.talkMaxDuration = var_362_13

					if var_362_13 + var_362_6 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_13 + var_362_6
					end
				end

				arg_359_1.text_.text = var_362_10
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_14 = math.max(var_362_7, arg_359_1.talkMaxDuration)

			if var_362_6 <= arg_359_1.time_ and arg_359_1.time_ < var_362_6 + var_362_14 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_6) / var_362_14

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_6 + var_362_14 and arg_359_1.time_ < var_362_6 + var_362_14 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1104201090
		arg_363_1.duration_ = 11.07

		local var_363_0 = {
			ja = 9.866,
			ko = 11.066,
			zh = 11.066
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1104201091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["6045_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and not isNil(var_366_0) and arg_363_1.var_.characterEffect6045_story == nil then
				arg_363_1.var_.characterEffect6045_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 and not isNil(var_366_0) then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect6045_story and not isNil(var_366_0) then
					arg_363_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and not isNil(var_366_0) and arg_363_1.var_.characterEffect6045_story then
				arg_363_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_366_4 = 0

			if var_366_4 < arg_363_1.time_ and arg_363_1.time_ <= var_366_4 + arg_366_0 then
				arg_363_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_366_5 = 0

			if var_366_5 < arg_363_1.time_ and arg_363_1.time_ <= var_366_5 + arg_366_0 then
				arg_363_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_366_6 = 0
			local var_366_7 = 1.175

			if var_366_6 < arg_363_1.time_ and arg_363_1.time_ <= var_366_6 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_8 = arg_363_1:FormatText(StoryNameCfg[215].name)

				arg_363_1.leftNameTxt_.text = var_366_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_9 = arg_363_1:GetWordFromCfg(1104201090)
				local var_366_10 = arg_363_1:FormatText(var_366_9.content)

				arg_363_1.text_.text = var_366_10

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_11 = 43
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201090", "story_v_side_new_1104201.awb") ~= 0 then
					local var_366_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201090", "story_v_side_new_1104201.awb") / 1000

					if var_366_14 + var_366_6 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_14 + var_366_6
					end

					if var_366_9.prefab_name ~= "" and arg_363_1.actors_[var_366_9.prefab_name] ~= nil then
						local var_366_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_9.prefab_name].transform, "story_v_side_new_1104201", "1104201090", "story_v_side_new_1104201.awb")

						arg_363_1:RecordAudio("1104201090", var_366_15)
						arg_363_1:RecordAudio("1104201090", var_366_15)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201090", "story_v_side_new_1104201.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201090", "story_v_side_new_1104201.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_16 = math.max(var_366_7, arg_363_1.talkMaxDuration)

			if var_366_6 <= arg_363_1.time_ and arg_363_1.time_ < var_366_6 + var_366_16 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_6) / var_366_16

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_6 + var_366_16 and arg_363_1.time_ < var_366_6 + var_366_16 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 1104201091
		arg_367_1.duration_ = 7.17

		local var_367_0 = {
			ja = 7.166,
			ko = 7.133,
			zh = 7.133
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play1104201092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 0
			local var_370_1 = 0.65

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_2 = arg_367_1:FormatText(StoryNameCfg[215].name)

				arg_367_1.leftNameTxt_.text = var_370_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_3 = arg_367_1:GetWordFromCfg(1104201091)
				local var_370_4 = arg_367_1:FormatText(var_370_3.content)

				arg_367_1.text_.text = var_370_4

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_5 = 27
				local var_370_6 = utf8.len(var_370_4)
				local var_370_7 = var_370_5 <= 0 and var_370_1 or var_370_1 * (var_370_6 / var_370_5)

				if var_370_7 > 0 and var_370_1 < var_370_7 then
					arg_367_1.talkMaxDuration = var_370_7

					if var_370_7 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_7 + var_370_0
					end
				end

				arg_367_1.text_.text = var_370_4
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201091", "story_v_side_new_1104201.awb") ~= 0 then
					local var_370_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201091", "story_v_side_new_1104201.awb") / 1000

					if var_370_8 + var_370_0 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_8 + var_370_0
					end

					if var_370_3.prefab_name ~= "" and arg_367_1.actors_[var_370_3.prefab_name] ~= nil then
						local var_370_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_3.prefab_name].transform, "story_v_side_new_1104201", "1104201091", "story_v_side_new_1104201.awb")

						arg_367_1:RecordAudio("1104201091", var_370_9)
						arg_367_1:RecordAudio("1104201091", var_370_9)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201091", "story_v_side_new_1104201.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201091", "story_v_side_new_1104201.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_10 = math.max(var_370_1, arg_367_1.talkMaxDuration)

			if var_370_0 <= arg_367_1.time_ and arg_367_1.time_ < var_370_0 + var_370_10 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_0) / var_370_10

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_0 + var_370_10 and arg_367_1.time_ < var_370_0 + var_370_10 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 1104201092
		arg_371_1.duration_ = 18.17

		local var_371_0 = {
			ja = 18.166,
			ko = 16.2,
			zh = 16.2
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play1104201093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 1.375

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_2 = arg_371_1:FormatText(StoryNameCfg[215].name)

				arg_371_1.leftNameTxt_.text = var_374_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_3 = arg_371_1:GetWordFromCfg(1104201092)
				local var_374_4 = arg_371_1:FormatText(var_374_3.content)

				arg_371_1.text_.text = var_374_4

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201092", "story_v_side_new_1104201.awb") ~= 0 then
					local var_374_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201092", "story_v_side_new_1104201.awb") / 1000

					if var_374_8 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_8 + var_374_0
					end

					if var_374_3.prefab_name ~= "" and arg_371_1.actors_[var_374_3.prefab_name] ~= nil then
						local var_374_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_3.prefab_name].transform, "story_v_side_new_1104201", "1104201092", "story_v_side_new_1104201.awb")

						arg_371_1:RecordAudio("1104201092", var_374_9)
						arg_371_1:RecordAudio("1104201092", var_374_9)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201092", "story_v_side_new_1104201.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201092", "story_v_side_new_1104201.awb")
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
	Play1104201093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 1104201093
		arg_375_1.duration_ = 5

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play1104201094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["6045_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos6045_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, 100, 0)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos6045_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, 100, 0)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["6046_story"].transform
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 then
				arg_375_1.var_.moveOldPos6046_story = var_378_9.localPosition
			end

			local var_378_11 = 0.001

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11
				local var_378_13 = Vector3.New(0, 100, 0)

				var_378_9.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos6046_story, var_378_13, var_378_12)

				local var_378_14 = manager.ui.mainCamera.transform.position - var_378_9.position

				var_378_9.forward = Vector3.New(var_378_14.x, var_378_14.y, var_378_14.z)

				local var_378_15 = var_378_9.localEulerAngles

				var_378_15.z = 0
				var_378_15.x = 0
				var_378_9.localEulerAngles = var_378_15
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 then
				var_378_9.localPosition = Vector3.New(0, 100, 0)

				local var_378_16 = manager.ui.mainCamera.transform.position - var_378_9.position

				var_378_9.forward = Vector3.New(var_378_16.x, var_378_16.y, var_378_16.z)

				local var_378_17 = var_378_9.localEulerAngles

				var_378_17.z = 0
				var_378_17.x = 0
				var_378_9.localEulerAngles = var_378_17
			end

			local var_378_18 = 0
			local var_378_19 = 0.575

			if var_378_18 < arg_375_1.time_ and arg_375_1.time_ <= var_378_18 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, false)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_20 = arg_375_1:GetWordFromCfg(1104201093)
				local var_378_21 = arg_375_1:FormatText(var_378_20.content)

				arg_375_1.text_.text = var_378_21

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_22 = 23
				local var_378_23 = utf8.len(var_378_21)
				local var_378_24 = var_378_22 <= 0 and var_378_19 or var_378_19 * (var_378_23 / var_378_22)

				if var_378_24 > 0 and var_378_19 < var_378_24 then
					arg_375_1.talkMaxDuration = var_378_24

					if var_378_24 + var_378_18 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_24 + var_378_18
					end
				end

				arg_375_1.text_.text = var_378_21
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_25 = math.max(var_378_19, arg_375_1.talkMaxDuration)

			if var_378_18 <= arg_375_1.time_ and arg_375_1.time_ < var_378_18 + var_378_25 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_18) / var_378_25

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_18 + var_378_25 and arg_375_1.time_ < var_378_18 + var_378_25 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 1104201094
		arg_379_1.duration_ = 3.27

		local var_379_0 = {
			ja = 2.166,
			ko = 3.266,
			zh = 3.266
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play1104201095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["6046_story"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 and not isNil(var_382_0) and arg_379_1.var_.characterEffect6046_story == nil then
				arg_379_1.var_.characterEffect6046_story = var_382_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_382_2 = 0.200000002980232

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 and not isNil(var_382_0) then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2

				if arg_379_1.var_.characterEffect6046_story and not isNil(var_382_0) then
					arg_379_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 and not isNil(var_382_0) and arg_379_1.var_.characterEffect6046_story then
				arg_379_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_382_4 = 0

			if var_382_4 < arg_379_1.time_ and arg_379_1.time_ <= var_382_4 + arg_382_0 then
				arg_379_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_382_5 = 0

			if var_382_5 < arg_379_1.time_ and arg_379_1.time_ <= var_382_5 + arg_382_0 then
				arg_379_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_382_6 = arg_379_1.actors_["6046_story"].transform
			local var_382_7 = 0

			if var_382_7 < arg_379_1.time_ and arg_379_1.time_ <= var_382_7 + arg_382_0 then
				arg_379_1.var_.moveOldPos6046_story = var_382_6.localPosition
			end

			local var_382_8 = 0.001

			if var_382_7 <= arg_379_1.time_ and arg_379_1.time_ < var_382_7 + var_382_8 then
				local var_382_9 = (arg_379_1.time_ - var_382_7) / var_382_8
				local var_382_10 = Vector3.New(0, -0.5, -6.3)

				var_382_6.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos6046_story, var_382_10, var_382_9)

				local var_382_11 = manager.ui.mainCamera.transform.position - var_382_6.position

				var_382_6.forward = Vector3.New(var_382_11.x, var_382_11.y, var_382_11.z)

				local var_382_12 = var_382_6.localEulerAngles

				var_382_12.z = 0
				var_382_12.x = 0
				var_382_6.localEulerAngles = var_382_12
			end

			if arg_379_1.time_ >= var_382_7 + var_382_8 and arg_379_1.time_ < var_382_7 + var_382_8 + arg_382_0 then
				var_382_6.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_382_13 = manager.ui.mainCamera.transform.position - var_382_6.position

				var_382_6.forward = Vector3.New(var_382_13.x, var_382_13.y, var_382_13.z)

				local var_382_14 = var_382_6.localEulerAngles

				var_382_14.z = 0
				var_382_14.x = 0
				var_382_6.localEulerAngles = var_382_14
			end

			local var_382_15 = 0
			local var_382_16 = 0.25

			if var_382_15 < arg_379_1.time_ and arg_379_1.time_ <= var_382_15 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_17 = arg_379_1:FormatText(StoryNameCfg[214].name)

				arg_379_1.leftNameTxt_.text = var_382_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_18 = arg_379_1:GetWordFromCfg(1104201094)
				local var_382_19 = arg_379_1:FormatText(var_382_18.content)

				arg_379_1.text_.text = var_382_19

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201094", "story_v_side_new_1104201.awb") ~= 0 then
					local var_382_23 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201094", "story_v_side_new_1104201.awb") / 1000

					if var_382_23 + var_382_15 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_23 + var_382_15
					end

					if var_382_18.prefab_name ~= "" and arg_379_1.actors_[var_382_18.prefab_name] ~= nil then
						local var_382_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_18.prefab_name].transform, "story_v_side_new_1104201", "1104201094", "story_v_side_new_1104201.awb")

						arg_379_1:RecordAudio("1104201094", var_382_24)
						arg_379_1:RecordAudio("1104201094", var_382_24)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201094", "story_v_side_new_1104201.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201094", "story_v_side_new_1104201.awb")
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
	Play1104201095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 1104201095
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play1104201096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["6046_story"]
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 and not isNil(var_386_0) and arg_383_1.var_.characterEffect6046_story == nil then
				arg_383_1.var_.characterEffect6046_story = var_386_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_386_2 = 0.200000002980232

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 and not isNil(var_386_0) then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2

				if arg_383_1.var_.characterEffect6046_story and not isNil(var_386_0) then
					local var_386_4 = Mathf.Lerp(0, 0.5, var_386_3)

					arg_383_1.var_.characterEffect6046_story.fillFlat = true
					arg_383_1.var_.characterEffect6046_story.fillRatio = var_386_4
				end
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 and not isNil(var_386_0) and arg_383_1.var_.characterEffect6046_story then
				local var_386_5 = 0.5

				arg_383_1.var_.characterEffect6046_story.fillFlat = true
				arg_383_1.var_.characterEffect6046_story.fillRatio = var_386_5
			end

			local var_386_6 = 0
			local var_386_7 = 0.45

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
				SetActive(arg_383_1.iconTrs_.gameObject, true)
				arg_383_1.iconController_:SetSelectedState("hero")

				arg_383_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_383_1.callingController_:SetSelectedState("normal")

				arg_383_1.keyicon_.color = Color.New(1, 1, 1)
				arg_383_1.icon_.color = Color.New(1, 1, 1)

				local var_386_9 = arg_383_1:GetWordFromCfg(1104201095)
				local var_386_10 = arg_383_1:FormatText(var_386_9.content)

				arg_383_1.text_.text = var_386_10

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_11 = 18
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
	Play1104201096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 1104201096
		arg_387_1.duration_ = 7.4

		local var_387_0 = {
			ja = 6.566,
			ko = 7.4,
			zh = 7.4
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play1104201097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["6046_story"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 and not isNil(var_390_0) and arg_387_1.var_.characterEffect6046_story == nil then
				arg_387_1.var_.characterEffect6046_story = var_390_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_2 = 0.200000002980232

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 and not isNil(var_390_0) then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2

				if arg_387_1.var_.characterEffect6046_story and not isNil(var_390_0) then
					arg_387_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 and not isNil(var_390_0) and arg_387_1.var_.characterEffect6046_story then
				arg_387_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_390_4 = 0

			if var_390_4 < arg_387_1.time_ and arg_387_1.time_ <= var_390_4 + arg_390_0 then
				arg_387_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_390_5 = 0

			if var_390_5 < arg_387_1.time_ and arg_387_1.time_ <= var_390_5 + arg_390_0 then
				arg_387_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_390_6 = 0
			local var_390_7 = 0.725

			if var_390_6 < arg_387_1.time_ and arg_387_1.time_ <= var_390_6 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_8 = arg_387_1:FormatText(StoryNameCfg[214].name)

				arg_387_1.leftNameTxt_.text = var_390_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_9 = arg_387_1:GetWordFromCfg(1104201096)
				local var_390_10 = arg_387_1:FormatText(var_390_9.content)

				arg_387_1.text_.text = var_390_10

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_11 = 29
				local var_390_12 = utf8.len(var_390_10)
				local var_390_13 = var_390_11 <= 0 and var_390_7 or var_390_7 * (var_390_12 / var_390_11)

				if var_390_13 > 0 and var_390_7 < var_390_13 then
					arg_387_1.talkMaxDuration = var_390_13

					if var_390_13 + var_390_6 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_13 + var_390_6
					end
				end

				arg_387_1.text_.text = var_390_10
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201096", "story_v_side_new_1104201.awb") ~= 0 then
					local var_390_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201096", "story_v_side_new_1104201.awb") / 1000

					if var_390_14 + var_390_6 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_14 + var_390_6
					end

					if var_390_9.prefab_name ~= "" and arg_387_1.actors_[var_390_9.prefab_name] ~= nil then
						local var_390_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_9.prefab_name].transform, "story_v_side_new_1104201", "1104201096", "story_v_side_new_1104201.awb")

						arg_387_1:RecordAudio("1104201096", var_390_15)
						arg_387_1:RecordAudio("1104201096", var_390_15)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201096", "story_v_side_new_1104201.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201096", "story_v_side_new_1104201.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_16 = math.max(var_390_7, arg_387_1.talkMaxDuration)

			if var_390_6 <= arg_387_1.time_ and arg_387_1.time_ < var_390_6 + var_390_16 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_6) / var_390_16

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_6 + var_390_16 and arg_387_1.time_ < var_390_6 + var_390_16 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 1104201097
		arg_391_1.duration_ = 2.07

		local var_391_0 = {
			ja = 2.066,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_391_0:Play1104201098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				arg_391_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_394_1 = 0
			local var_394_2 = 0.15

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_3 = arg_391_1:FormatText(StoryNameCfg[214].name)

				arg_391_1.leftNameTxt_.text = var_394_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_4 = arg_391_1:GetWordFromCfg(1104201097)
				local var_394_5 = arg_391_1:FormatText(var_394_4.content)

				arg_391_1.text_.text = var_394_5

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_6 = 6
				local var_394_7 = utf8.len(var_394_5)
				local var_394_8 = var_394_6 <= 0 and var_394_2 or var_394_2 * (var_394_7 / var_394_6)

				if var_394_8 > 0 and var_394_2 < var_394_8 then
					arg_391_1.talkMaxDuration = var_394_8

					if var_394_8 + var_394_1 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_8 + var_394_1
					end
				end

				arg_391_1.text_.text = var_394_5
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201097", "story_v_side_new_1104201.awb") ~= 0 then
					local var_394_9 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201097", "story_v_side_new_1104201.awb") / 1000

					if var_394_9 + var_394_1 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_9 + var_394_1
					end

					if var_394_4.prefab_name ~= "" and arg_391_1.actors_[var_394_4.prefab_name] ~= nil then
						local var_394_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_4.prefab_name].transform, "story_v_side_new_1104201", "1104201097", "story_v_side_new_1104201.awb")

						arg_391_1:RecordAudio("1104201097", var_394_10)
						arg_391_1:RecordAudio("1104201097", var_394_10)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201097", "story_v_side_new_1104201.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201097", "story_v_side_new_1104201.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_11 = math.max(var_394_2, arg_391_1.talkMaxDuration)

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_11 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_1) / var_394_11

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_1 + var_394_11 and arg_391_1.time_ < var_394_1 + var_394_11 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 1104201098
		arg_395_1.duration_ = 2.83

		local var_395_0 = {
			ja = 2.833,
			ko = 2.033,
			zh = 2.033
		}
		local var_395_1 = manager.audio:GetLocalizationFlag()

		if var_395_0[var_395_1] ~= nil then
			arg_395_1.duration_ = var_395_0[var_395_1]
		end

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play1104201099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["6046_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and not isNil(var_398_0) and arg_395_1.var_.characterEffect6046_story == nil then
				arg_395_1.var_.characterEffect6046_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.2

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 and not isNil(var_398_0) then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect6046_story and not isNil(var_398_0) then
					local var_398_4 = Mathf.Lerp(0, 0.5, var_398_3)

					arg_395_1.var_.characterEffect6046_story.fillFlat = true
					arg_395_1.var_.characterEffect6046_story.fillRatio = var_398_4
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and not isNil(var_398_0) and arg_395_1.var_.characterEffect6046_story then
				local var_398_5 = 0.5

				arg_395_1.var_.characterEffect6046_story.fillFlat = true
				arg_395_1.var_.characterEffect6046_story.fillRatio = var_398_5
			end

			local var_398_6 = 0
			local var_398_7 = 0.1

			if var_398_6 < arg_395_1.time_ and arg_395_1.time_ <= var_398_6 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_8 = arg_395_1:FormatText(StoryNameCfg[215].name)

				arg_395_1.leftNameTxt_.text = var_398_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, true)
				arg_395_1.iconController_:SetSelectedState("hero")

				arg_395_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6045")

				arg_395_1.callingController_:SetSelectedState("normal")

				arg_395_1.keyicon_.color = Color.New(1, 1, 1)
				arg_395_1.icon_.color = Color.New(1, 1, 1)

				local var_398_9 = arg_395_1:GetWordFromCfg(1104201098)
				local var_398_10 = arg_395_1:FormatText(var_398_9.content)

				arg_395_1.text_.text = var_398_10

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_11 = 4
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201098", "story_v_side_new_1104201.awb") ~= 0 then
					local var_398_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201098", "story_v_side_new_1104201.awb") / 1000

					if var_398_14 + var_398_6 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_14 + var_398_6
					end

					if var_398_9.prefab_name ~= "" and arg_395_1.actors_[var_398_9.prefab_name] ~= nil then
						local var_398_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_9.prefab_name].transform, "story_v_side_new_1104201", "1104201098", "story_v_side_new_1104201.awb")

						arg_395_1:RecordAudio("1104201098", var_398_15)
						arg_395_1:RecordAudio("1104201098", var_398_15)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201098", "story_v_side_new_1104201.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201098", "story_v_side_new_1104201.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_16 = math.max(var_398_7, arg_395_1.talkMaxDuration)

			if var_398_6 <= arg_395_1.time_ and arg_395_1.time_ < var_398_6 + var_398_16 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_6) / var_398_16

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_6 + var_398_16 and arg_395_1.time_ < var_398_6 + var_398_16 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 1104201099
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play1104201100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 0.575

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_2 = arg_399_1:FormatText(StoryNameCfg[7].name)

				arg_399_1.leftNameTxt_.text = var_402_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, true)
				arg_399_1.iconController_:SetSelectedState("hero")

				arg_399_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_399_1.callingController_:SetSelectedState("normal")

				arg_399_1.keyicon_.color = Color.New(1, 1, 1)
				arg_399_1.icon_.color = Color.New(1, 1, 1)

				local var_402_3 = arg_399_1:GetWordFromCfg(1104201099)
				local var_402_4 = arg_399_1:FormatText(var_402_3.content)

				arg_399_1.text_.text = var_402_4

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_5 = 23
				local var_402_6 = utf8.len(var_402_4)
				local var_402_7 = var_402_5 <= 0 and var_402_1 or var_402_1 * (var_402_6 / var_402_5)

				if var_402_7 > 0 and var_402_1 < var_402_7 then
					arg_399_1.talkMaxDuration = var_402_7

					if var_402_7 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_7 + var_402_0
					end
				end

				arg_399_1.text_.text = var_402_4
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_8 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_8 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_8

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_8 and arg_399_1.time_ < var_402_0 + var_402_8 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 1104201100
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play1104201101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["6046_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos6046_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, 100, 0)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos6046_story, var_406_4, var_406_3)

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

			local var_406_9 = 0
			local var_406_10 = 0.775

			if var_406_9 < arg_403_1.time_ and arg_403_1.time_ <= var_406_9 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_11 = arg_403_1:GetWordFromCfg(1104201100)
				local var_406_12 = arg_403_1:FormatText(var_406_11.content)

				arg_403_1.text_.text = var_406_12

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_13 = 31
				local var_406_14 = utf8.len(var_406_12)
				local var_406_15 = var_406_13 <= 0 and var_406_10 or var_406_10 * (var_406_14 / var_406_13)

				if var_406_15 > 0 and var_406_10 < var_406_15 then
					arg_403_1.talkMaxDuration = var_406_15

					if var_406_15 + var_406_9 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_15 + var_406_9
					end
				end

				arg_403_1.text_.text = var_406_12
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_16 = math.max(var_406_10, arg_403_1.talkMaxDuration)

			if var_406_9 <= arg_403_1.time_ and arg_403_1.time_ < var_406_9 + var_406_16 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_9) / var_406_16

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_9 + var_406_16 and arg_403_1.time_ < var_406_9 + var_406_16 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 1104201101
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play1104201102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.5

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_2 = arg_407_1:FormatText(StoryNameCfg[7].name)

				arg_407_1.leftNameTxt_.text = var_410_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, true)
				arg_407_1.iconController_:SetSelectedState("hero")

				arg_407_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_407_1.callingController_:SetSelectedState("normal")

				arg_407_1.keyicon_.color = Color.New(1, 1, 1)
				arg_407_1.icon_.color = Color.New(1, 1, 1)

				local var_410_3 = arg_407_1:GetWordFromCfg(1104201101)
				local var_410_4 = arg_407_1:FormatText(var_410_3.content)

				arg_407_1.text_.text = var_410_4

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_5 = 20
				local var_410_6 = utf8.len(var_410_4)
				local var_410_7 = var_410_5 <= 0 and var_410_1 or var_410_1 * (var_410_6 / var_410_5)

				if var_410_7 > 0 and var_410_1 < var_410_7 then
					arg_407_1.talkMaxDuration = var_410_7

					if var_410_7 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_7 + var_410_0
					end
				end

				arg_407_1.text_.text = var_410_4
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_8 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_8 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_8

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_8 and arg_407_1.time_ < var_410_0 + var_410_8 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 1104201102
		arg_411_1.duration_ = 12.13

		local var_411_0 = {
			ja = 8.933,
			ko = 12.133,
			zh = 12.133
		}
		local var_411_1 = manager.audio:GetLocalizationFlag()

		if var_411_0[var_411_1] ~= nil then
			arg_411_1.duration_ = var_411_0[var_411_1]
		end

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play1104201103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["6045_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos6045_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos6045_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["6045_story"]
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect6045_story == nil then
				arg_411_1.var_.characterEffect6045_story = var_414_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_11 = 0.200000002980232

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_11 and not isNil(var_414_9) then
				local var_414_12 = (arg_411_1.time_ - var_414_10) / var_414_11

				if arg_411_1.var_.characterEffect6045_story and not isNil(var_414_9) then
					arg_411_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_10 + var_414_11 and arg_411_1.time_ < var_414_10 + var_414_11 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect6045_story then
				arg_411_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_414_13 = 0

			if var_414_13 < arg_411_1.time_ and arg_411_1.time_ <= var_414_13 + arg_414_0 then
				arg_411_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_414_14 = 0

			if var_414_14 < arg_411_1.time_ and arg_411_1.time_ <= var_414_14 + arg_414_0 then
				arg_411_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_414_15 = arg_411_1.actors_["6046_story"].transform
			local var_414_16 = 0

			if var_414_16 < arg_411_1.time_ and arg_411_1.time_ <= var_414_16 + arg_414_0 then
				arg_411_1.var_.moveOldPos6046_story = var_414_15.localPosition
			end

			local var_414_17 = 0.001

			if var_414_16 <= arg_411_1.time_ and arg_411_1.time_ < var_414_16 + var_414_17 then
				local var_414_18 = (arg_411_1.time_ - var_414_16) / var_414_17
				local var_414_19 = Vector3.New(0.7, -0.5, -6.3)

				var_414_15.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos6046_story, var_414_19, var_414_18)

				local var_414_20 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_20.x, var_414_20.y, var_414_20.z)

				local var_414_21 = var_414_15.localEulerAngles

				var_414_21.z = 0
				var_414_21.x = 0
				var_414_15.localEulerAngles = var_414_21
			end

			if arg_411_1.time_ >= var_414_16 + var_414_17 and arg_411_1.time_ < var_414_16 + var_414_17 + arg_414_0 then
				var_414_15.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_414_22 = manager.ui.mainCamera.transform.position - var_414_15.position

				var_414_15.forward = Vector3.New(var_414_22.x, var_414_22.y, var_414_22.z)

				local var_414_23 = var_414_15.localEulerAngles

				var_414_23.z = 0
				var_414_23.x = 0
				var_414_15.localEulerAngles = var_414_23
			end

			local var_414_24 = 0

			if var_414_24 < arg_411_1.time_ and arg_411_1.time_ <= var_414_24 + arg_414_0 then
				arg_411_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_414_25 = 0
			local var_414_26 = 1.05

			if var_414_25 < arg_411_1.time_ and arg_411_1.time_ <= var_414_25 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_27 = arg_411_1:FormatText(StoryNameCfg[215].name)

				arg_411_1.leftNameTxt_.text = var_414_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_28 = arg_411_1:GetWordFromCfg(1104201102)
				local var_414_29 = arg_411_1:FormatText(var_414_28.content)

				arg_411_1.text_.text = var_414_29

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_30 = 42
				local var_414_31 = utf8.len(var_414_29)
				local var_414_32 = var_414_30 <= 0 and var_414_26 or var_414_26 * (var_414_31 / var_414_30)

				if var_414_32 > 0 and var_414_26 < var_414_32 then
					arg_411_1.talkMaxDuration = var_414_32

					if var_414_32 + var_414_25 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_32 + var_414_25
					end
				end

				arg_411_1.text_.text = var_414_29
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201102", "story_v_side_new_1104201.awb") ~= 0 then
					local var_414_33 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201102", "story_v_side_new_1104201.awb") / 1000

					if var_414_33 + var_414_25 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_33 + var_414_25
					end

					if var_414_28.prefab_name ~= "" and arg_411_1.actors_[var_414_28.prefab_name] ~= nil then
						local var_414_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_28.prefab_name].transform, "story_v_side_new_1104201", "1104201102", "story_v_side_new_1104201.awb")

						arg_411_1:RecordAudio("1104201102", var_414_34)
						arg_411_1:RecordAudio("1104201102", var_414_34)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201102", "story_v_side_new_1104201.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201102", "story_v_side_new_1104201.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_35 = math.max(var_414_26, arg_411_1.talkMaxDuration)

			if var_414_25 <= arg_411_1.time_ and arg_411_1.time_ < var_414_25 + var_414_35 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_25) / var_414_35

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_25 + var_414_35 and arg_411_1.time_ < var_414_25 + var_414_35 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 1104201103
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play1104201104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["6045_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect6045_story == nil then
				arg_415_1.var_.characterEffect6045_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 and not isNil(var_418_0) then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect6045_story and not isNil(var_418_0) then
					local var_418_4 = Mathf.Lerp(0, 0.5, var_418_3)

					arg_415_1.var_.characterEffect6045_story.fillFlat = true
					arg_415_1.var_.characterEffect6045_story.fillRatio = var_418_4
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect6045_story then
				local var_418_5 = 0.5

				arg_415_1.var_.characterEffect6045_story.fillFlat = true
				arg_415_1.var_.characterEffect6045_story.fillRatio = var_418_5
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
				SetActive(arg_415_1.iconTrs_.gameObject, true)
				arg_415_1.iconController_:SetSelectedState("hero")

				arg_415_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_415_1.callingController_:SetSelectedState("normal")

				arg_415_1.keyicon_.color = Color.New(1, 1, 1)
				arg_415_1.icon_.color = Color.New(1, 1, 1)

				local var_418_9 = arg_415_1:GetWordFromCfg(1104201103)
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
	Play1104201104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1104201104
		arg_419_1.duration_ = 12.2

		local var_419_0 = {
			ja = 11.5,
			ko = 12.2,
			zh = 12.2
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
				arg_419_0:Play1104201105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["6046_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and not isNil(var_422_0) and arg_419_1.var_.characterEffect6046_story == nil then
				arg_419_1.var_.characterEffect6046_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.200000002980232

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 and not isNil(var_422_0) then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect6046_story and not isNil(var_422_0) then
					arg_419_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and not isNil(var_422_0) and arg_419_1.var_.characterEffect6046_story then
				arg_419_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_422_4 = 0

			if var_422_4 < arg_419_1.time_ and arg_419_1.time_ <= var_422_4 + arg_422_0 then
				arg_419_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_422_5 = 0

			if var_422_5 < arg_419_1.time_ and arg_419_1.time_ <= var_422_5 + arg_422_0 then
				arg_419_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_422_6 = 0
			local var_422_7 = 1.15

			if var_422_6 < arg_419_1.time_ and arg_419_1.time_ <= var_422_6 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_8 = arg_419_1:FormatText(StoryNameCfg[214].name)

				arg_419_1.leftNameTxt_.text = var_422_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_9 = arg_419_1:GetWordFromCfg(1104201104)
				local var_422_10 = arg_419_1:FormatText(var_422_9.content)

				arg_419_1.text_.text = var_422_10

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_11 = 46
				local var_422_12 = utf8.len(var_422_10)
				local var_422_13 = var_422_11 <= 0 and var_422_7 or var_422_7 * (var_422_12 / var_422_11)

				if var_422_13 > 0 and var_422_7 < var_422_13 then
					arg_419_1.talkMaxDuration = var_422_13

					if var_422_13 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_13 + var_422_6
					end
				end

				arg_419_1.text_.text = var_422_10
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201104", "story_v_side_new_1104201.awb") ~= 0 then
					local var_422_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201104", "story_v_side_new_1104201.awb") / 1000

					if var_422_14 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_14 + var_422_6
					end

					if var_422_9.prefab_name ~= "" and arg_419_1.actors_[var_422_9.prefab_name] ~= nil then
						local var_422_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_9.prefab_name].transform, "story_v_side_new_1104201", "1104201104", "story_v_side_new_1104201.awb")

						arg_419_1:RecordAudio("1104201104", var_422_15)
						arg_419_1:RecordAudio("1104201104", var_422_15)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201104", "story_v_side_new_1104201.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201104", "story_v_side_new_1104201.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_16 = math.max(var_422_7, arg_419_1.talkMaxDuration)

			if var_422_6 <= arg_419_1.time_ and arg_419_1.time_ < var_422_6 + var_422_16 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_6) / var_422_16

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_6 + var_422_16 and arg_419_1.time_ < var_422_6 + var_422_16 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1104201105
		arg_423_1.duration_ = 13.1

		local var_423_0 = {
			ja = 13.1,
			ko = 12.4,
			zh = 12.4
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1104201106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["6045_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and not isNil(var_426_0) and arg_423_1.var_.characterEffect6045_story == nil then
				arg_423_1.var_.characterEffect6045_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.200000002980232

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 and not isNil(var_426_0) then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect6045_story and not isNil(var_426_0) then
					arg_423_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and not isNil(var_426_0) and arg_423_1.var_.characterEffect6045_story then
				arg_423_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_426_4 = 0

			if var_426_4 < arg_423_1.time_ and arg_423_1.time_ <= var_426_4 + arg_426_0 then
				arg_423_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_426_5 = 0

			if var_426_5 < arg_423_1.time_ and arg_423_1.time_ <= var_426_5 + arg_426_0 then
				arg_423_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_426_6 = arg_423_1.actors_["6046_story"]
			local var_426_7 = 0

			if var_426_7 < arg_423_1.time_ and arg_423_1.time_ <= var_426_7 + arg_426_0 and not isNil(var_426_6) and arg_423_1.var_.characterEffect6046_story == nil then
				arg_423_1.var_.characterEffect6046_story = var_426_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_8 = 0.200000002980232

			if var_426_7 <= arg_423_1.time_ and arg_423_1.time_ < var_426_7 + var_426_8 and not isNil(var_426_6) then
				local var_426_9 = (arg_423_1.time_ - var_426_7) / var_426_8

				if arg_423_1.var_.characterEffect6046_story and not isNil(var_426_6) then
					local var_426_10 = Mathf.Lerp(0, 0.5, var_426_9)

					arg_423_1.var_.characterEffect6046_story.fillFlat = true
					arg_423_1.var_.characterEffect6046_story.fillRatio = var_426_10
				end
			end

			if arg_423_1.time_ >= var_426_7 + var_426_8 and arg_423_1.time_ < var_426_7 + var_426_8 + arg_426_0 and not isNil(var_426_6) and arg_423_1.var_.characterEffect6046_story then
				local var_426_11 = 0.5

				arg_423_1.var_.characterEffect6046_story.fillFlat = true
				arg_423_1.var_.characterEffect6046_story.fillRatio = var_426_11
			end

			local var_426_12 = 0
			local var_426_13 = 1.05

			if var_426_12 < arg_423_1.time_ and arg_423_1.time_ <= var_426_12 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_14 = arg_423_1:FormatText(StoryNameCfg[215].name)

				arg_423_1.leftNameTxt_.text = var_426_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_15 = arg_423_1:GetWordFromCfg(1104201105)
				local var_426_16 = arg_423_1:FormatText(var_426_15.content)

				arg_423_1.text_.text = var_426_16

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_17 = 42
				local var_426_18 = utf8.len(var_426_16)
				local var_426_19 = var_426_17 <= 0 and var_426_13 or var_426_13 * (var_426_18 / var_426_17)

				if var_426_19 > 0 and var_426_13 < var_426_19 then
					arg_423_1.talkMaxDuration = var_426_19

					if var_426_19 + var_426_12 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_19 + var_426_12
					end
				end

				arg_423_1.text_.text = var_426_16
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201105", "story_v_side_new_1104201.awb") ~= 0 then
					local var_426_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201105", "story_v_side_new_1104201.awb") / 1000

					if var_426_20 + var_426_12 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_20 + var_426_12
					end

					if var_426_15.prefab_name ~= "" and arg_423_1.actors_[var_426_15.prefab_name] ~= nil then
						local var_426_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_15.prefab_name].transform, "story_v_side_new_1104201", "1104201105", "story_v_side_new_1104201.awb")

						arg_423_1:RecordAudio("1104201105", var_426_21)
						arg_423_1:RecordAudio("1104201105", var_426_21)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201105", "story_v_side_new_1104201.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201105", "story_v_side_new_1104201.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_22 = math.max(var_426_13, arg_423_1.talkMaxDuration)

			if var_426_12 <= arg_423_1.time_ and arg_423_1.time_ < var_426_12 + var_426_22 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_12) / var_426_22

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_12 + var_426_22 and arg_423_1.time_ < var_426_12 + var_426_22 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1104201106
		arg_427_1.duration_ = 9.73

		local var_427_0 = {
			ja = 5.733,
			ko = 9.733,
			zh = 9.733
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1104201107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["6046_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and not isNil(var_430_0) and arg_427_1.var_.characterEffect6046_story == nil then
				arg_427_1.var_.characterEffect6046_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.200000002980232

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 and not isNil(var_430_0) then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect6046_story and not isNil(var_430_0) then
					arg_427_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and not isNil(var_430_0) and arg_427_1.var_.characterEffect6046_story then
				arg_427_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_430_4 = 0

			if var_430_4 < arg_427_1.time_ and arg_427_1.time_ <= var_430_4 + arg_430_0 then
				arg_427_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_430_5 = 0

			if var_430_5 < arg_427_1.time_ and arg_427_1.time_ <= var_430_5 + arg_430_0 then
				arg_427_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_430_6 = arg_427_1.actors_["6045_story"]
			local var_430_7 = 0

			if var_430_7 < arg_427_1.time_ and arg_427_1.time_ <= var_430_7 + arg_430_0 and not isNil(var_430_6) and arg_427_1.var_.characterEffect6045_story == nil then
				arg_427_1.var_.characterEffect6045_story = var_430_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_8 = 0.200000002980232

			if var_430_7 <= arg_427_1.time_ and arg_427_1.time_ < var_430_7 + var_430_8 and not isNil(var_430_6) then
				local var_430_9 = (arg_427_1.time_ - var_430_7) / var_430_8

				if arg_427_1.var_.characterEffect6045_story and not isNil(var_430_6) then
					local var_430_10 = Mathf.Lerp(0, 0.5, var_430_9)

					arg_427_1.var_.characterEffect6045_story.fillFlat = true
					arg_427_1.var_.characterEffect6045_story.fillRatio = var_430_10
				end
			end

			if arg_427_1.time_ >= var_430_7 + var_430_8 and arg_427_1.time_ < var_430_7 + var_430_8 + arg_430_0 and not isNil(var_430_6) and arg_427_1.var_.characterEffect6045_story then
				local var_430_11 = 0.5

				arg_427_1.var_.characterEffect6045_story.fillFlat = true
				arg_427_1.var_.characterEffect6045_story.fillRatio = var_430_11
			end

			local var_430_12 = 0
			local var_430_13 = 0.9

			if var_430_12 < arg_427_1.time_ and arg_427_1.time_ <= var_430_12 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_14 = arg_427_1:FormatText(StoryNameCfg[214].name)

				arg_427_1.leftNameTxt_.text = var_430_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_15 = arg_427_1:GetWordFromCfg(1104201106)
				local var_430_16 = arg_427_1:FormatText(var_430_15.content)

				arg_427_1.text_.text = var_430_16

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_17 = 36
				local var_430_18 = utf8.len(var_430_16)
				local var_430_19 = var_430_17 <= 0 and var_430_13 or var_430_13 * (var_430_18 / var_430_17)

				if var_430_19 > 0 and var_430_13 < var_430_19 then
					arg_427_1.talkMaxDuration = var_430_19

					if var_430_19 + var_430_12 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_19 + var_430_12
					end
				end

				arg_427_1.text_.text = var_430_16
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201106", "story_v_side_new_1104201.awb") ~= 0 then
					local var_430_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201106", "story_v_side_new_1104201.awb") / 1000

					if var_430_20 + var_430_12 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_20 + var_430_12
					end

					if var_430_15.prefab_name ~= "" and arg_427_1.actors_[var_430_15.prefab_name] ~= nil then
						local var_430_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_15.prefab_name].transform, "story_v_side_new_1104201", "1104201106", "story_v_side_new_1104201.awb")

						arg_427_1:RecordAudio("1104201106", var_430_21)
						arg_427_1:RecordAudio("1104201106", var_430_21)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201106", "story_v_side_new_1104201.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201106", "story_v_side_new_1104201.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_22 = math.max(var_430_13, arg_427_1.talkMaxDuration)

			if var_430_12 <= arg_427_1.time_ and arg_427_1.time_ < var_430_12 + var_430_22 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_12) / var_430_22

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_12 + var_430_22 and arg_427_1.time_ < var_430_12 + var_430_22 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1104201107
		arg_431_1.duration_ = 5.67

		local var_431_0 = {
			ja = 1.999999999999,
			ko = 5.666,
			zh = 5.666
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play1104201108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["6045_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and not isNil(var_434_0) and arg_431_1.var_.characterEffect6045_story == nil then
				arg_431_1.var_.characterEffect6045_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.200000002980232

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 and not isNil(var_434_0) then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect6045_story and not isNil(var_434_0) then
					arg_431_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and not isNil(var_434_0) and arg_431_1.var_.characterEffect6045_story then
				arg_431_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_434_4 = 0

			if var_434_4 < arg_431_1.time_ and arg_431_1.time_ <= var_434_4 + arg_434_0 then
				arg_431_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_2")
			end

			local var_434_5 = 0

			if var_434_5 < arg_431_1.time_ and arg_431_1.time_ <= var_434_5 + arg_434_0 then
				arg_431_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_434_6 = arg_431_1.actors_["6046_story"]
			local var_434_7 = 0

			if var_434_7 < arg_431_1.time_ and arg_431_1.time_ <= var_434_7 + arg_434_0 and not isNil(var_434_6) and arg_431_1.var_.characterEffect6046_story == nil then
				arg_431_1.var_.characterEffect6046_story = var_434_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_8 = 0.200000002980232

			if var_434_7 <= arg_431_1.time_ and arg_431_1.time_ < var_434_7 + var_434_8 and not isNil(var_434_6) then
				local var_434_9 = (arg_431_1.time_ - var_434_7) / var_434_8

				if arg_431_1.var_.characterEffect6046_story and not isNil(var_434_6) then
					local var_434_10 = Mathf.Lerp(0, 0.5, var_434_9)

					arg_431_1.var_.characterEffect6046_story.fillFlat = true
					arg_431_1.var_.characterEffect6046_story.fillRatio = var_434_10
				end
			end

			if arg_431_1.time_ >= var_434_7 + var_434_8 and arg_431_1.time_ < var_434_7 + var_434_8 + arg_434_0 and not isNil(var_434_6) and arg_431_1.var_.characterEffect6046_story then
				local var_434_11 = 0.5

				arg_431_1.var_.characterEffect6046_story.fillFlat = true
				arg_431_1.var_.characterEffect6046_story.fillRatio = var_434_11
			end

			local var_434_12 = 0
			local var_434_13 = 0.375

			if var_434_12 < arg_431_1.time_ and arg_431_1.time_ <= var_434_12 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_14 = arg_431_1:FormatText(StoryNameCfg[215].name)

				arg_431_1.leftNameTxt_.text = var_434_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_15 = arg_431_1:GetWordFromCfg(1104201107)
				local var_434_16 = arg_431_1:FormatText(var_434_15.content)

				arg_431_1.text_.text = var_434_16

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_17 = 15
				local var_434_18 = utf8.len(var_434_16)
				local var_434_19 = var_434_17 <= 0 and var_434_13 or var_434_13 * (var_434_18 / var_434_17)

				if var_434_19 > 0 and var_434_13 < var_434_19 then
					arg_431_1.talkMaxDuration = var_434_19

					if var_434_19 + var_434_12 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_19 + var_434_12
					end
				end

				arg_431_1.text_.text = var_434_16
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201107", "story_v_side_new_1104201.awb") ~= 0 then
					local var_434_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201107", "story_v_side_new_1104201.awb") / 1000

					if var_434_20 + var_434_12 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_20 + var_434_12
					end

					if var_434_15.prefab_name ~= "" and arg_431_1.actors_[var_434_15.prefab_name] ~= nil then
						local var_434_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_15.prefab_name].transform, "story_v_side_new_1104201", "1104201107", "story_v_side_new_1104201.awb")

						arg_431_1:RecordAudio("1104201107", var_434_21)
						arg_431_1:RecordAudio("1104201107", var_434_21)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201107", "story_v_side_new_1104201.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201107", "story_v_side_new_1104201.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_22 = math.max(var_434_13, arg_431_1.talkMaxDuration)

			if var_434_12 <= arg_431_1.time_ and arg_431_1.time_ < var_434_12 + var_434_22 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_12) / var_434_22

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_12 + var_434_22 and arg_431_1.time_ < var_434_12 + var_434_22 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 1104201108
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play1104201109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["6045_story"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and not isNil(var_438_0) and arg_435_1.var_.characterEffect6045_story == nil then
				arg_435_1.var_.characterEffect6045_story = var_438_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_2 = 0.200000002980232

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 and not isNil(var_438_0) then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.characterEffect6045_story and not isNil(var_438_0) then
					local var_438_4 = Mathf.Lerp(0, 0.5, var_438_3)

					arg_435_1.var_.characterEffect6045_story.fillFlat = true
					arg_435_1.var_.characterEffect6045_story.fillRatio = var_438_4
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and not isNil(var_438_0) and arg_435_1.var_.characterEffect6045_story then
				local var_438_5 = 0.5

				arg_435_1.var_.characterEffect6045_story.fillFlat = true
				arg_435_1.var_.characterEffect6045_story.fillRatio = var_438_5
			end

			local var_438_6 = 0

			if var_438_6 < arg_435_1.time_ and arg_435_1.time_ <= var_438_6 + arg_438_0 then
				arg_435_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_2")
			end

			local var_438_7 = 0
			local var_438_8 = 0.65

			if var_438_7 < arg_435_1.time_ and arg_435_1.time_ <= var_438_7 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_9 = arg_435_1:FormatText(StoryNameCfg[7].name)

				arg_435_1.leftNameTxt_.text = var_438_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, true)
				arg_435_1.iconController_:SetSelectedState("hero")

				arg_435_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_435_1.callingController_:SetSelectedState("normal")

				arg_435_1.keyicon_.color = Color.New(1, 1, 1)
				arg_435_1.icon_.color = Color.New(1, 1, 1)

				local var_438_10 = arg_435_1:GetWordFromCfg(1104201108)
				local var_438_11 = arg_435_1:FormatText(var_438_10.content)

				arg_435_1.text_.text = var_438_11

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_12 = 26
				local var_438_13 = utf8.len(var_438_11)
				local var_438_14 = var_438_12 <= 0 and var_438_8 or var_438_8 * (var_438_13 / var_438_12)

				if var_438_14 > 0 and var_438_8 < var_438_14 then
					arg_435_1.talkMaxDuration = var_438_14

					if var_438_14 + var_438_7 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_14 + var_438_7
					end
				end

				arg_435_1.text_.text = var_438_11
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_15 = math.max(var_438_8, arg_435_1.talkMaxDuration)

			if var_438_7 <= arg_435_1.time_ and arg_435_1.time_ < var_438_7 + var_438_15 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_7) / var_438_15

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_7 + var_438_15 and arg_435_1.time_ < var_438_7 + var_438_15 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 1104201109
		arg_439_1.duration_ = 7.67

		local var_439_0 = {
			ja = 7.6,
			ko = 7.666,
			zh = 7.666
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play1104201110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["6046_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and not isNil(var_442_0) and arg_439_1.var_.characterEffect6046_story == nil then
				arg_439_1.var_.characterEffect6046_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.200000002980232

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 and not isNil(var_442_0) then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect6046_story and not isNil(var_442_0) then
					arg_439_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and not isNil(var_442_0) and arg_439_1.var_.characterEffect6046_story then
				arg_439_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_442_4 = 0

			if var_442_4 < arg_439_1.time_ and arg_439_1.time_ <= var_442_4 + arg_442_0 then
				arg_439_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_442_5 = 0

			if var_442_5 < arg_439_1.time_ and arg_439_1.time_ <= var_442_5 + arg_442_0 then
				arg_439_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_442_6 = 0
			local var_442_7 = 0.675

			if var_442_6 < arg_439_1.time_ and arg_439_1.time_ <= var_442_6 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_8 = arg_439_1:FormatText(StoryNameCfg[214].name)

				arg_439_1.leftNameTxt_.text = var_442_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_9 = arg_439_1:GetWordFromCfg(1104201109)
				local var_442_10 = arg_439_1:FormatText(var_442_9.content)

				arg_439_1.text_.text = var_442_10

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_11 = 27
				local var_442_12 = utf8.len(var_442_10)
				local var_442_13 = var_442_11 <= 0 and var_442_7 or var_442_7 * (var_442_12 / var_442_11)

				if var_442_13 > 0 and var_442_7 < var_442_13 then
					arg_439_1.talkMaxDuration = var_442_13

					if var_442_13 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_6
					end
				end

				arg_439_1.text_.text = var_442_10
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201109", "story_v_side_new_1104201.awb") ~= 0 then
					local var_442_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201109", "story_v_side_new_1104201.awb") / 1000

					if var_442_14 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_14 + var_442_6
					end

					if var_442_9.prefab_name ~= "" and arg_439_1.actors_[var_442_9.prefab_name] ~= nil then
						local var_442_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_9.prefab_name].transform, "story_v_side_new_1104201", "1104201109", "story_v_side_new_1104201.awb")

						arg_439_1:RecordAudio("1104201109", var_442_15)
						arg_439_1:RecordAudio("1104201109", var_442_15)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201109", "story_v_side_new_1104201.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201109", "story_v_side_new_1104201.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_16 = math.max(var_442_7, arg_439_1.talkMaxDuration)

			if var_442_6 <= arg_439_1.time_ and arg_439_1.time_ < var_442_6 + var_442_16 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_6) / var_442_16

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_6 + var_442_16 and arg_439_1.time_ < var_442_6 + var_442_16 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 1104201110
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play1104201111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["6046_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and not isNil(var_446_0) and arg_443_1.var_.characterEffect6046_story == nil then
				arg_443_1.var_.characterEffect6046_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.200000002980232

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 and not isNil(var_446_0) then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect6046_story and not isNil(var_446_0) then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect6046_story.fillFlat = true
					arg_443_1.var_.characterEffect6046_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and not isNil(var_446_0) and arg_443_1.var_.characterEffect6046_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect6046_story.fillFlat = true
				arg_443_1.var_.characterEffect6046_story.fillRatio = var_446_5
			end

			local var_446_6 = 0
			local var_446_7 = 0.275

			if var_446_6 < arg_443_1.time_ and arg_443_1.time_ <= var_446_6 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_8 = arg_443_1:FormatText(StoryNameCfg[7].name)

				arg_443_1.leftNameTxt_.text = var_446_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, true)
				arg_443_1.iconController_:SetSelectedState("hero")

				arg_443_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_443_1.callingController_:SetSelectedState("normal")

				arg_443_1.keyicon_.color = Color.New(1, 1, 1)
				arg_443_1.icon_.color = Color.New(1, 1, 1)

				local var_446_9 = arg_443_1:GetWordFromCfg(1104201110)
				local var_446_10 = arg_443_1:FormatText(var_446_9.content)

				arg_443_1.text_.text = var_446_10

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_11 = 11
				local var_446_12 = utf8.len(var_446_10)
				local var_446_13 = var_446_11 <= 0 and var_446_7 or var_446_7 * (var_446_12 / var_446_11)

				if var_446_13 > 0 and var_446_7 < var_446_13 then
					arg_443_1.talkMaxDuration = var_446_13

					if var_446_13 + var_446_6 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_13 + var_446_6
					end
				end

				arg_443_1.text_.text = var_446_10
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_14 = math.max(var_446_7, arg_443_1.talkMaxDuration)

			if var_446_6 <= arg_443_1.time_ and arg_443_1.time_ < var_446_6 + var_446_14 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_6) / var_446_14

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_6 + var_446_14 and arg_443_1.time_ < var_446_6 + var_446_14 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 1104201111
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play1104201112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.4

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

				local var_450_2 = arg_447_1:GetWordFromCfg(1104201111)
				local var_450_3 = arg_447_1:FormatText(var_450_2.content)

				arg_447_1.text_.text = var_450_3

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_4 = 16
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
	Play1104201112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 1104201112
		arg_451_1.duration_ = 4.77

		local var_451_0 = {
			ja = 4.766,
			ko = 3.833,
			zh = 3.833
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play1104201113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["6045_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos6045_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos6045_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = arg_451_1.actors_["6045_story"]
			local var_454_10 = 0

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 and not isNil(var_454_9) and arg_451_1.var_.characterEffect6045_story == nil then
				arg_451_1.var_.characterEffect6045_story = var_454_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_11 = 0.200000002980232

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_11 and not isNil(var_454_9) then
				local var_454_12 = (arg_451_1.time_ - var_454_10) / var_454_11

				if arg_451_1.var_.characterEffect6045_story and not isNil(var_454_9) then
					arg_451_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_10 + var_454_11 and arg_451_1.time_ < var_454_10 + var_454_11 + arg_454_0 and not isNil(var_454_9) and arg_451_1.var_.characterEffect6045_story then
				arg_451_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_454_13 = 0

			if var_454_13 < arg_451_1.time_ and arg_451_1.time_ <= var_454_13 + arg_454_0 then
				arg_451_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action2_1")
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_454_15 = 0
			local var_454_16 = 0.3

			if var_454_15 < arg_451_1.time_ and arg_451_1.time_ <= var_454_15 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_17 = arg_451_1:FormatText(StoryNameCfg[215].name)

				arg_451_1.leftNameTxt_.text = var_454_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_18 = arg_451_1:GetWordFromCfg(1104201112)
				local var_454_19 = arg_451_1:FormatText(var_454_18.content)

				arg_451_1.text_.text = var_454_19

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_20 = 12
				local var_454_21 = utf8.len(var_454_19)
				local var_454_22 = var_454_20 <= 0 and var_454_16 or var_454_16 * (var_454_21 / var_454_20)

				if var_454_22 > 0 and var_454_16 < var_454_22 then
					arg_451_1.talkMaxDuration = var_454_22

					if var_454_22 + var_454_15 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_22 + var_454_15
					end
				end

				arg_451_1.text_.text = var_454_19
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201112", "story_v_side_new_1104201.awb") ~= 0 then
					local var_454_23 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201112", "story_v_side_new_1104201.awb") / 1000

					if var_454_23 + var_454_15 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_23 + var_454_15
					end

					if var_454_18.prefab_name ~= "" and arg_451_1.actors_[var_454_18.prefab_name] ~= nil then
						local var_454_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_18.prefab_name].transform, "story_v_side_new_1104201", "1104201112", "story_v_side_new_1104201.awb")

						arg_451_1:RecordAudio("1104201112", var_454_24)
						arg_451_1:RecordAudio("1104201112", var_454_24)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201112", "story_v_side_new_1104201.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201112", "story_v_side_new_1104201.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_25 = math.max(var_454_16, arg_451_1.talkMaxDuration)

			if var_454_15 <= arg_451_1.time_ and arg_451_1.time_ < var_454_15 + var_454_25 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_15) / var_454_25

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_15 + var_454_25 and arg_451_1.time_ < var_454_15 + var_454_25 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 1104201113
		arg_455_1.duration_ = 10.4

		local var_455_0 = {
			ja = 10.2,
			ko = 10.4,
			zh = 10.4
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play1104201114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.875

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[215].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(1104201113)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201113", "story_v_side_new_1104201.awb") ~= 0 then
					local var_458_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201113", "story_v_side_new_1104201.awb") / 1000

					if var_458_8 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_0
					end

					if var_458_3.prefab_name ~= "" and arg_455_1.actors_[var_458_3.prefab_name] ~= nil then
						local var_458_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_3.prefab_name].transform, "story_v_side_new_1104201", "1104201113", "story_v_side_new_1104201.awb")

						arg_455_1:RecordAudio("1104201113", var_458_9)
						arg_455_1:RecordAudio("1104201113", var_458_9)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201113", "story_v_side_new_1104201.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201113", "story_v_side_new_1104201.awb")
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
	Play1104201114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 1104201114
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play1104201115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["6045_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and not isNil(var_462_0) and arg_459_1.var_.characterEffect6045_story == nil then
				arg_459_1.var_.characterEffect6045_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.200000002980232

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 and not isNil(var_462_0) then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect6045_story and not isNil(var_462_0) then
					local var_462_4 = Mathf.Lerp(0, 0.5, var_462_3)

					arg_459_1.var_.characterEffect6045_story.fillFlat = true
					arg_459_1.var_.characterEffect6045_story.fillRatio = var_462_4
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and not isNil(var_462_0) and arg_459_1.var_.characterEffect6045_story then
				local var_462_5 = 0.5

				arg_459_1.var_.characterEffect6045_story.fillFlat = true
				arg_459_1.var_.characterEffect6045_story.fillRatio = var_462_5
			end

			local var_462_6 = 0
			local var_462_7 = 0.625

			if var_462_6 < arg_459_1.time_ and arg_459_1.time_ <= var_462_6 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_8 = arg_459_1:FormatText(StoryNameCfg[7].name)

				arg_459_1.leftNameTxt_.text = var_462_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, true)
				arg_459_1.iconController_:SetSelectedState("hero")

				arg_459_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_459_1.callingController_:SetSelectedState("normal")

				arg_459_1.keyicon_.color = Color.New(1, 1, 1)
				arg_459_1.icon_.color = Color.New(1, 1, 1)

				local var_462_9 = arg_459_1:GetWordFromCfg(1104201114)
				local var_462_10 = arg_459_1:FormatText(var_462_9.content)

				arg_459_1.text_.text = var_462_10

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_11 = 25
				local var_462_12 = utf8.len(var_462_10)
				local var_462_13 = var_462_11 <= 0 and var_462_7 or var_462_7 * (var_462_12 / var_462_11)

				if var_462_13 > 0 and var_462_7 < var_462_13 then
					arg_459_1.talkMaxDuration = var_462_13

					if var_462_13 + var_462_6 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_13 + var_462_6
					end
				end

				arg_459_1.text_.text = var_462_10
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_14 = math.max(var_462_7, arg_459_1.talkMaxDuration)

			if var_462_6 <= arg_459_1.time_ and arg_459_1.time_ < var_462_6 + var_462_14 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_6) / var_462_14

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_6 + var_462_14 and arg_459_1.time_ < var_462_6 + var_462_14 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 1104201115
		arg_463_1.duration_ = 4.3

		local var_463_0 = {
			ja = 4.3,
			ko = 4.133,
			zh = 4.133
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play1104201116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["6045_story"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 and not isNil(var_466_0) and arg_463_1.var_.characterEffect6045_story == nil then
				arg_463_1.var_.characterEffect6045_story = var_466_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_2 = 0.200000002980232

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 and not isNil(var_466_0) then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2

				if arg_463_1.var_.characterEffect6045_story and not isNil(var_466_0) then
					arg_463_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 and not isNil(var_466_0) and arg_463_1.var_.characterEffect6045_story then
				arg_463_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_466_4 = 0

			if var_466_4 < arg_463_1.time_ and arg_463_1.time_ <= var_466_4 + arg_466_0 then
				arg_463_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action2_2")
			end

			local var_466_5 = 0

			if var_466_5 < arg_463_1.time_ and arg_463_1.time_ <= var_466_5 + arg_466_0 then
				arg_463_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_466_6 = 0
			local var_466_7 = 0.325

			if var_466_6 < arg_463_1.time_ and arg_463_1.time_ <= var_466_6 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_8 = arg_463_1:FormatText(StoryNameCfg[215].name)

				arg_463_1.leftNameTxt_.text = var_466_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_9 = arg_463_1:GetWordFromCfg(1104201115)
				local var_466_10 = arg_463_1:FormatText(var_466_9.content)

				arg_463_1.text_.text = var_466_10

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_11 = 13
				local var_466_12 = utf8.len(var_466_10)
				local var_466_13 = var_466_11 <= 0 and var_466_7 or var_466_7 * (var_466_12 / var_466_11)

				if var_466_13 > 0 and var_466_7 < var_466_13 then
					arg_463_1.talkMaxDuration = var_466_13

					if var_466_13 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_13 + var_466_6
					end
				end

				arg_463_1.text_.text = var_466_10
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201115", "story_v_side_new_1104201.awb") ~= 0 then
					local var_466_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201115", "story_v_side_new_1104201.awb") / 1000

					if var_466_14 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_14 + var_466_6
					end

					if var_466_9.prefab_name ~= "" and arg_463_1.actors_[var_466_9.prefab_name] ~= nil then
						local var_466_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_9.prefab_name].transform, "story_v_side_new_1104201", "1104201115", "story_v_side_new_1104201.awb")

						arg_463_1:RecordAudio("1104201115", var_466_15)
						arg_463_1:RecordAudio("1104201115", var_466_15)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201115", "story_v_side_new_1104201.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201115", "story_v_side_new_1104201.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_16 = math.max(var_466_7, arg_463_1.talkMaxDuration)

			if var_466_6 <= arg_463_1.time_ and arg_463_1.time_ < var_466_6 + var_466_16 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_6) / var_466_16

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_6 + var_466_16 and arg_463_1.time_ < var_466_6 + var_466_16 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 1104201116
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play1104201117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["6045_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and not isNil(var_470_0) and arg_467_1.var_.characterEffect6045_story == nil then
				arg_467_1.var_.characterEffect6045_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.200000002980232

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 and not isNil(var_470_0) then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2

				if arg_467_1.var_.characterEffect6045_story and not isNil(var_470_0) then
					local var_470_4 = Mathf.Lerp(0, 0.5, var_470_3)

					arg_467_1.var_.characterEffect6045_story.fillFlat = true
					arg_467_1.var_.characterEffect6045_story.fillRatio = var_470_4
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 and not isNil(var_470_0) and arg_467_1.var_.characterEffect6045_story then
				local var_470_5 = 0.5

				arg_467_1.var_.characterEffect6045_story.fillFlat = true
				arg_467_1.var_.characterEffect6045_story.fillRatio = var_470_5
			end

			local var_470_6 = 0
			local var_470_7 = 0.1

			if var_470_6 < arg_467_1.time_ and arg_467_1.time_ <= var_470_6 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_8 = arg_467_1:FormatText(StoryNameCfg[7].name)

				arg_467_1.leftNameTxt_.text = var_470_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, true)
				arg_467_1.iconController_:SetSelectedState("hero")

				arg_467_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_467_1.callingController_:SetSelectedState("normal")

				arg_467_1.keyicon_.color = Color.New(1, 1, 1)
				arg_467_1.icon_.color = Color.New(1, 1, 1)

				local var_470_9 = arg_467_1:GetWordFromCfg(1104201116)
				local var_470_10 = arg_467_1:FormatText(var_470_9.content)

				arg_467_1.text_.text = var_470_10

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_11 = 4
				local var_470_12 = utf8.len(var_470_10)
				local var_470_13 = var_470_11 <= 0 and var_470_7 or var_470_7 * (var_470_12 / var_470_11)

				if var_470_13 > 0 and var_470_7 < var_470_13 then
					arg_467_1.talkMaxDuration = var_470_13

					if var_470_13 + var_470_6 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_13 + var_470_6
					end
				end

				arg_467_1.text_.text = var_470_10
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_14 = math.max(var_470_7, arg_467_1.talkMaxDuration)

			if var_470_6 <= arg_467_1.time_ and arg_467_1.time_ < var_470_6 + var_470_14 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_6) / var_470_14

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_6 + var_470_14 and arg_467_1.time_ < var_470_6 + var_470_14 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 1104201117
		arg_471_1.duration_ = 9

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play1104201118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["6045_story"].transform
			local var_474_1 = 1.96599999815226

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos6045_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, 100, 0)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos6045_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, 100, 0)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["6045_story"]
			local var_474_10 = 1.96599999815226

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 and not isNil(var_474_9) and arg_471_1.var_.characterEffect6045_story == nil then
				arg_471_1.var_.characterEffect6045_story = var_474_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_11 = 0.034000001847744

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 and not isNil(var_474_9) then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11

				if arg_471_1.var_.characterEffect6045_story and not isNil(var_474_9) then
					local var_474_13 = Mathf.Lerp(0, 0.5, var_474_12)

					arg_471_1.var_.characterEffect6045_story.fillFlat = true
					arg_471_1.var_.characterEffect6045_story.fillRatio = var_474_13
				end
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 and not isNil(var_474_9) and arg_471_1.var_.characterEffect6045_story then
				local var_474_14 = 0.5

				arg_471_1.var_.characterEffect6045_story.fillFlat = true
				arg_471_1.var_.characterEffect6045_story.fillRatio = var_474_14
			end

			local var_474_15 = arg_471_1.actors_["6046_story"].transform
			local var_474_16 = 1.96599999815226

			if var_474_16 < arg_471_1.time_ and arg_471_1.time_ <= var_474_16 + arg_474_0 then
				arg_471_1.var_.moveOldPos6046_story = var_474_15.localPosition
			end

			local var_474_17 = 0.001

			if var_474_16 <= arg_471_1.time_ and arg_471_1.time_ < var_474_16 + var_474_17 then
				local var_474_18 = (arg_471_1.time_ - var_474_16) / var_474_17
				local var_474_19 = Vector3.New(0, 100, 0)

				var_474_15.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos6046_story, var_474_19, var_474_18)

				local var_474_20 = manager.ui.mainCamera.transform.position - var_474_15.position

				var_474_15.forward = Vector3.New(var_474_20.x, var_474_20.y, var_474_20.z)

				local var_474_21 = var_474_15.localEulerAngles

				var_474_21.z = 0
				var_474_21.x = 0
				var_474_15.localEulerAngles = var_474_21
			end

			if arg_471_1.time_ >= var_474_16 + var_474_17 and arg_471_1.time_ < var_474_16 + var_474_17 + arg_474_0 then
				var_474_15.localPosition = Vector3.New(0, 100, 0)

				local var_474_22 = manager.ui.mainCamera.transform.position - var_474_15.position

				var_474_15.forward = Vector3.New(var_474_22.x, var_474_22.y, var_474_22.z)

				local var_474_23 = var_474_15.localEulerAngles

				var_474_23.z = 0
				var_474_23.x = 0
				var_474_15.localEulerAngles = var_474_23
			end

			local var_474_24 = arg_471_1.actors_["6046_story"]
			local var_474_25 = 1.96599999815226

			if var_474_25 < arg_471_1.time_ and arg_471_1.time_ <= var_474_25 + arg_474_0 and not isNil(var_474_24) and arg_471_1.var_.characterEffect6046_story == nil then
				arg_471_1.var_.characterEffect6046_story = var_474_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_26 = 0.034000001847744

			if var_474_25 <= arg_471_1.time_ and arg_471_1.time_ < var_474_25 + var_474_26 and not isNil(var_474_24) then
				local var_474_27 = (arg_471_1.time_ - var_474_25) / var_474_26

				if arg_471_1.var_.characterEffect6046_story and not isNil(var_474_24) then
					local var_474_28 = Mathf.Lerp(0, 0.5, var_474_27)

					arg_471_1.var_.characterEffect6046_story.fillFlat = true
					arg_471_1.var_.characterEffect6046_story.fillRatio = var_474_28
				end
			end

			if arg_471_1.time_ >= var_474_25 + var_474_26 and arg_471_1.time_ < var_474_25 + var_474_26 + arg_474_0 and not isNil(var_474_24) and arg_471_1.var_.characterEffect6046_story then
				local var_474_29 = 0.5

				arg_471_1.var_.characterEffect6046_story.fillFlat = true
				arg_471_1.var_.characterEffect6046_story.fillRatio = var_474_29
			end

			local var_474_30 = 0

			if var_474_30 < arg_471_1.time_ and arg_471_1.time_ <= var_474_30 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_31 = 2

			if var_474_30 <= arg_471_1.time_ and arg_471_1.time_ < var_474_30 + var_474_31 then
				local var_474_32 = (arg_471_1.time_ - var_474_30) / var_474_31
				local var_474_33 = Color.New(0, 0, 0)

				var_474_33.a = Mathf.Lerp(0, 1, var_474_32)
				arg_471_1.mask_.color = var_474_33
			end

			if arg_471_1.time_ >= var_474_30 + var_474_31 and arg_471_1.time_ < var_474_30 + var_474_31 + arg_474_0 then
				local var_474_34 = Color.New(0, 0, 0)

				var_474_34.a = 1
				arg_471_1.mask_.color = var_474_34
			end

			local var_474_35 = 2

			if var_474_35 < arg_471_1.time_ and arg_471_1.time_ <= var_474_35 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_36 = 2

			if var_474_35 <= arg_471_1.time_ and arg_471_1.time_ < var_474_35 + var_474_36 then
				local var_474_37 = (arg_471_1.time_ - var_474_35) / var_474_36
				local var_474_38 = Color.New(0, 0, 0)

				var_474_38.a = Mathf.Lerp(1, 0, var_474_37)
				arg_471_1.mask_.color = var_474_38
			end

			if arg_471_1.time_ >= var_474_35 + var_474_36 and arg_471_1.time_ < var_474_35 + var_474_36 + arg_474_0 then
				local var_474_39 = Color.New(0, 0, 0)
				local var_474_40 = 0

				arg_471_1.mask_.enabled = false
				var_474_39.a = var_474_40
				arg_471_1.mask_.color = var_474_39
			end

			if arg_471_1.frameCnt_ <= 1 then
				arg_471_1.dialog_:SetActive(false)
			end

			local var_474_41 = 3.999999999999
			local var_474_42 = 1.2

			if var_474_41 < arg_471_1.time_ and arg_471_1.time_ <= var_474_41 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0

				arg_471_1.dialog_:SetActive(true)

				local var_474_43 = LeanTween.value(arg_471_1.dialog_, 0, 1, 0.3)

				var_474_43:setOnUpdate(LuaHelper.FloatAction(function(arg_475_0)
					arg_471_1.dialogCg_.alpha = arg_475_0
				end))
				var_474_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_471_1.dialog_)
					var_474_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_471_1.duration_ = arg_471_1.duration_ + 0.3

				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_44 = arg_471_1:GetWordFromCfg(1104201117)
				local var_474_45 = arg_471_1:FormatText(var_474_44.content)

				arg_471_1.text_.text = var_474_45

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_46 = 48
				local var_474_47 = utf8.len(var_474_45)
				local var_474_48 = var_474_46 <= 0 and var_474_42 or var_474_42 * (var_474_47 / var_474_46)

				if var_474_48 > 0 and var_474_42 < var_474_48 then
					arg_471_1.talkMaxDuration = var_474_48
					var_474_41 = var_474_41 + 0.3

					if var_474_48 + var_474_41 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_48 + var_474_41
					end
				end

				arg_471_1.text_.text = var_474_45
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_49 = var_474_41 + 0.3
			local var_474_50 = math.max(var_474_42, arg_471_1.talkMaxDuration)

			if var_474_49 <= arg_471_1.time_ and arg_471_1.time_ < var_474_49 + var_474_50 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_49) / var_474_50

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_49 + var_474_50 and arg_471_1.time_ < var_474_49 + var_474_50 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201118 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1104201118
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1104201119(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 0.875

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_2 = arg_477_1:GetWordFromCfg(1104201118)
				local var_480_3 = arg_477_1:FormatText(var_480_2.content)

				arg_477_1.text_.text = var_480_3

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_4 = 35
				local var_480_5 = utf8.len(var_480_3)
				local var_480_6 = var_480_4 <= 0 and var_480_1 or var_480_1 * (var_480_5 / var_480_4)

				if var_480_6 > 0 and var_480_1 < var_480_6 then
					arg_477_1.talkMaxDuration = var_480_6

					if var_480_6 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_6 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_3
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_7 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_7 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_7

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_7 and arg_477_1.time_ < var_480_0 + var_480_7 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201119 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 1104201119
		arg_481_1.duration_ = 6.03

		local var_481_0 = {
			ja = 6.033,
			ko = 4.9,
			zh = 4.9
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
				arg_481_0:Play1104201120(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["6045_story"].transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPos6045_story = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos6045_story, var_484_4, var_484_3)

				local var_484_5 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_5.x, var_484_5.y, var_484_5.z)

				local var_484_6 = var_484_0.localEulerAngles

				var_484_6.z = 0
				var_484_6.x = 0
				var_484_0.localEulerAngles = var_484_6
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_0.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_0.localEulerAngles = var_484_8
			end

			local var_484_9 = arg_481_1.actors_["6045_story"]
			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 and not isNil(var_484_9) and arg_481_1.var_.characterEffect6045_story == nil then
				arg_481_1.var_.characterEffect6045_story = var_484_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_11 = 0.200000002980232

			if var_484_10 <= arg_481_1.time_ and arg_481_1.time_ < var_484_10 + var_484_11 and not isNil(var_484_9) then
				local var_484_12 = (arg_481_1.time_ - var_484_10) / var_484_11

				if arg_481_1.var_.characterEffect6045_story and not isNil(var_484_9) then
					arg_481_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_10 + var_484_11 and arg_481_1.time_ < var_484_10 + var_484_11 + arg_484_0 and not isNil(var_484_9) and arg_481_1.var_.characterEffect6045_story then
				arg_481_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_484_13 = 0

			if var_484_13 < arg_481_1.time_ and arg_481_1.time_ <= var_484_13 + arg_484_0 then
				arg_481_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_484_14 = 0

			if var_484_14 < arg_481_1.time_ and arg_481_1.time_ <= var_484_14 + arg_484_0 then
				arg_481_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_484_15 = arg_481_1.actors_["6046_story"].transform
			local var_484_16 = 0

			if var_484_16 < arg_481_1.time_ and arg_481_1.time_ <= var_484_16 + arg_484_0 then
				arg_481_1.var_.moveOldPos6046_story = var_484_15.localPosition
			end

			local var_484_17 = 0.001

			if var_484_16 <= arg_481_1.time_ and arg_481_1.time_ < var_484_16 + var_484_17 then
				local var_484_18 = (arg_481_1.time_ - var_484_16) / var_484_17
				local var_484_19 = Vector3.New(0.7, -0.5, -6.3)

				var_484_15.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos6046_story, var_484_19, var_484_18)

				local var_484_20 = manager.ui.mainCamera.transform.position - var_484_15.position

				var_484_15.forward = Vector3.New(var_484_20.x, var_484_20.y, var_484_20.z)

				local var_484_21 = var_484_15.localEulerAngles

				var_484_21.z = 0
				var_484_21.x = 0
				var_484_15.localEulerAngles = var_484_21
			end

			if arg_481_1.time_ >= var_484_16 + var_484_17 and arg_481_1.time_ < var_484_16 + var_484_17 + arg_484_0 then
				var_484_15.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_484_22 = manager.ui.mainCamera.transform.position - var_484_15.position

				var_484_15.forward = Vector3.New(var_484_22.x, var_484_22.y, var_484_22.z)

				local var_484_23 = var_484_15.localEulerAngles

				var_484_23.z = 0
				var_484_23.x = 0
				var_484_15.localEulerAngles = var_484_23
			end

			local var_484_24 = arg_481_1.actors_["6046_story"]
			local var_484_25 = 0

			if var_484_25 < arg_481_1.time_ and arg_481_1.time_ <= var_484_25 + arg_484_0 and not isNil(var_484_24) and arg_481_1.var_.characterEffect6046_story == nil then
				arg_481_1.var_.characterEffect6046_story = var_484_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_26 = 0.200000002980232

			if var_484_25 <= arg_481_1.time_ and arg_481_1.time_ < var_484_25 + var_484_26 and not isNil(var_484_24) then
				local var_484_27 = (arg_481_1.time_ - var_484_25) / var_484_26

				if arg_481_1.var_.characterEffect6046_story and not isNil(var_484_24) then
					local var_484_28 = Mathf.Lerp(0, 0.5, var_484_27)

					arg_481_1.var_.characterEffect6046_story.fillFlat = true
					arg_481_1.var_.characterEffect6046_story.fillRatio = var_484_28
				end
			end

			if arg_481_1.time_ >= var_484_25 + var_484_26 and arg_481_1.time_ < var_484_25 + var_484_26 + arg_484_0 and not isNil(var_484_24) and arg_481_1.var_.characterEffect6046_story then
				local var_484_29 = 0.5

				arg_481_1.var_.characterEffect6046_story.fillFlat = true
				arg_481_1.var_.characterEffect6046_story.fillRatio = var_484_29
			end

			local var_484_30 = 0
			local var_484_31 = 0.4

			if var_484_30 < arg_481_1.time_ and arg_481_1.time_ <= var_484_30 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_32 = arg_481_1:FormatText(StoryNameCfg[215].name)

				arg_481_1.leftNameTxt_.text = var_484_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_33 = arg_481_1:GetWordFromCfg(1104201119)
				local var_484_34 = arg_481_1:FormatText(var_484_33.content)

				arg_481_1.text_.text = var_484_34

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_35 = 16
				local var_484_36 = utf8.len(var_484_34)
				local var_484_37 = var_484_35 <= 0 and var_484_31 or var_484_31 * (var_484_36 / var_484_35)

				if var_484_37 > 0 and var_484_31 < var_484_37 then
					arg_481_1.talkMaxDuration = var_484_37

					if var_484_37 + var_484_30 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_37 + var_484_30
					end
				end

				arg_481_1.text_.text = var_484_34
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201119", "story_v_side_new_1104201.awb") ~= 0 then
					local var_484_38 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201119", "story_v_side_new_1104201.awb") / 1000

					if var_484_38 + var_484_30 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_38 + var_484_30
					end

					if var_484_33.prefab_name ~= "" and arg_481_1.actors_[var_484_33.prefab_name] ~= nil then
						local var_484_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_33.prefab_name].transform, "story_v_side_new_1104201", "1104201119", "story_v_side_new_1104201.awb")

						arg_481_1:RecordAudio("1104201119", var_484_39)
						arg_481_1:RecordAudio("1104201119", var_484_39)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201119", "story_v_side_new_1104201.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201119", "story_v_side_new_1104201.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_40 = math.max(var_484_31, arg_481_1.talkMaxDuration)

			if var_484_30 <= arg_481_1.time_ and arg_481_1.time_ < var_484_30 + var_484_40 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_30) / var_484_40

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_30 + var_484_40 and arg_481_1.time_ < var_484_30 + var_484_40 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201120 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 1104201120
		arg_485_1.duration_ = 9.5

		local var_485_0 = {
			ja = 9.5,
			ko = 9.166,
			zh = 9.166
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play1104201121(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["6046_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect6046_story == nil then
				arg_485_1.var_.characterEffect6046_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.200000002980232

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 and not isNil(var_488_0) then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect6046_story and not isNil(var_488_0) then
					arg_485_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect6046_story then
				arg_485_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_488_4 = 0

			if var_488_4 < arg_485_1.time_ and arg_485_1.time_ <= var_488_4 + arg_488_0 then
				arg_485_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_488_5 = 0

			if var_488_5 < arg_485_1.time_ and arg_485_1.time_ <= var_488_5 + arg_488_0 then
				arg_485_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_488_6 = arg_485_1.actors_["6045_story"]
			local var_488_7 = 0

			if var_488_7 < arg_485_1.time_ and arg_485_1.time_ <= var_488_7 + arg_488_0 and not isNil(var_488_6) and arg_485_1.var_.characterEffect6045_story == nil then
				arg_485_1.var_.characterEffect6045_story = var_488_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_8 = 0.200000002980232

			if var_488_7 <= arg_485_1.time_ and arg_485_1.time_ < var_488_7 + var_488_8 and not isNil(var_488_6) then
				local var_488_9 = (arg_485_1.time_ - var_488_7) / var_488_8

				if arg_485_1.var_.characterEffect6045_story and not isNil(var_488_6) then
					local var_488_10 = Mathf.Lerp(0, 0.5, var_488_9)

					arg_485_1.var_.characterEffect6045_story.fillFlat = true
					arg_485_1.var_.characterEffect6045_story.fillRatio = var_488_10
				end
			end

			if arg_485_1.time_ >= var_488_7 + var_488_8 and arg_485_1.time_ < var_488_7 + var_488_8 + arg_488_0 and not isNil(var_488_6) and arg_485_1.var_.characterEffect6045_story then
				local var_488_11 = 0.5

				arg_485_1.var_.characterEffect6045_story.fillFlat = true
				arg_485_1.var_.characterEffect6045_story.fillRatio = var_488_11
			end

			local var_488_12 = 0
			local var_488_13 = 0.825

			if var_488_12 < arg_485_1.time_ and arg_485_1.time_ <= var_488_12 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_14 = arg_485_1:FormatText(StoryNameCfg[214].name)

				arg_485_1.leftNameTxt_.text = var_488_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_15 = arg_485_1:GetWordFromCfg(1104201120)
				local var_488_16 = arg_485_1:FormatText(var_488_15.content)

				arg_485_1.text_.text = var_488_16

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_17 = 33
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

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201120", "story_v_side_new_1104201.awb") ~= 0 then
					local var_488_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201120", "story_v_side_new_1104201.awb") / 1000

					if var_488_20 + var_488_12 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_20 + var_488_12
					end

					if var_488_15.prefab_name ~= "" and arg_485_1.actors_[var_488_15.prefab_name] ~= nil then
						local var_488_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_15.prefab_name].transform, "story_v_side_new_1104201", "1104201120", "story_v_side_new_1104201.awb")

						arg_485_1:RecordAudio("1104201120", var_488_21)
						arg_485_1:RecordAudio("1104201120", var_488_21)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201120", "story_v_side_new_1104201.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201120", "story_v_side_new_1104201.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_22 = math.max(var_488_13, arg_485_1.talkMaxDuration)

			if var_488_12 <= arg_485_1.time_ and arg_485_1.time_ < var_488_12 + var_488_22 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_12) / var_488_22

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_12 + var_488_22 and arg_485_1.time_ < var_488_12 + var_488_22 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201121 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 1104201121
		arg_489_1.duration_ = 8.8

		local var_489_0 = {
			ja = 7.733,
			ko = 8.8,
			zh = 8.8
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play1104201122(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["6045_story"]
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.characterEffect6045_story == nil then
				arg_489_1.var_.characterEffect6045_story = var_492_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_2 = 0.200000002980232

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 and not isNil(var_492_0) then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2

				if arg_489_1.var_.characterEffect6045_story and not isNil(var_492_0) then
					arg_489_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 and not isNil(var_492_0) and arg_489_1.var_.characterEffect6045_story then
				arg_489_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_492_4 = 0

			if var_492_4 < arg_489_1.time_ and arg_489_1.time_ <= var_492_4 + arg_492_0 then
				arg_489_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_2")
			end

			local var_492_5 = 0

			if var_492_5 < arg_489_1.time_ and arg_489_1.time_ <= var_492_5 + arg_492_0 then
				arg_489_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_492_6 = arg_489_1.actors_["6046_story"]
			local var_492_7 = 0

			if var_492_7 < arg_489_1.time_ and arg_489_1.time_ <= var_492_7 + arg_492_0 and not isNil(var_492_6) and arg_489_1.var_.characterEffect6046_story == nil then
				arg_489_1.var_.characterEffect6046_story = var_492_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_492_8 = 0.200000002980232

			if var_492_7 <= arg_489_1.time_ and arg_489_1.time_ < var_492_7 + var_492_8 and not isNil(var_492_6) then
				local var_492_9 = (arg_489_1.time_ - var_492_7) / var_492_8

				if arg_489_1.var_.characterEffect6046_story and not isNil(var_492_6) then
					local var_492_10 = Mathf.Lerp(0, 0.5, var_492_9)

					arg_489_1.var_.characterEffect6046_story.fillFlat = true
					arg_489_1.var_.characterEffect6046_story.fillRatio = var_492_10
				end
			end

			if arg_489_1.time_ >= var_492_7 + var_492_8 and arg_489_1.time_ < var_492_7 + var_492_8 + arg_492_0 and not isNil(var_492_6) and arg_489_1.var_.characterEffect6046_story then
				local var_492_11 = 0.5

				arg_489_1.var_.characterEffect6046_story.fillFlat = true
				arg_489_1.var_.characterEffect6046_story.fillRatio = var_492_11
			end

			local var_492_12 = 0
			local var_492_13 = 0.575

			if var_492_12 < arg_489_1.time_ and arg_489_1.time_ <= var_492_12 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_14 = arg_489_1:FormatText(StoryNameCfg[215].name)

				arg_489_1.leftNameTxt_.text = var_492_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_15 = arg_489_1:GetWordFromCfg(1104201121)
				local var_492_16 = arg_489_1:FormatText(var_492_15.content)

				arg_489_1.text_.text = var_492_16

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_17 = 23
				local var_492_18 = utf8.len(var_492_16)
				local var_492_19 = var_492_17 <= 0 and var_492_13 or var_492_13 * (var_492_18 / var_492_17)

				if var_492_19 > 0 and var_492_13 < var_492_19 then
					arg_489_1.talkMaxDuration = var_492_19

					if var_492_19 + var_492_12 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_19 + var_492_12
					end
				end

				arg_489_1.text_.text = var_492_16
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201121", "story_v_side_new_1104201.awb") ~= 0 then
					local var_492_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201121", "story_v_side_new_1104201.awb") / 1000

					if var_492_20 + var_492_12 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_20 + var_492_12
					end

					if var_492_15.prefab_name ~= "" and arg_489_1.actors_[var_492_15.prefab_name] ~= nil then
						local var_492_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_15.prefab_name].transform, "story_v_side_new_1104201", "1104201121", "story_v_side_new_1104201.awb")

						arg_489_1:RecordAudio("1104201121", var_492_21)
						arg_489_1:RecordAudio("1104201121", var_492_21)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201121", "story_v_side_new_1104201.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201121", "story_v_side_new_1104201.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_22 = math.max(var_492_13, arg_489_1.talkMaxDuration)

			if var_492_12 <= arg_489_1.time_ and arg_489_1.time_ < var_492_12 + var_492_22 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_12) / var_492_22

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_12 + var_492_22 and arg_489_1.time_ < var_492_12 + var_492_22 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201122 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 1104201122
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play1104201123(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["6045_story"].transform
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1.var_.moveOldPos6045_story = var_496_0.localPosition
			end

			local var_496_2 = 0.001

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2
				local var_496_4 = Vector3.New(0, 100, 0)

				var_496_0.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos6045_story, var_496_4, var_496_3)

				local var_496_5 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_5.x, var_496_5.y, var_496_5.z)

				local var_496_6 = var_496_0.localEulerAngles

				var_496_6.z = 0
				var_496_6.x = 0
				var_496_0.localEulerAngles = var_496_6
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 then
				var_496_0.localPosition = Vector3.New(0, 100, 0)

				local var_496_7 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_7.x, var_496_7.y, var_496_7.z)

				local var_496_8 = var_496_0.localEulerAngles

				var_496_8.z = 0
				var_496_8.x = 0
				var_496_0.localEulerAngles = var_496_8
			end

			local var_496_9 = arg_493_1.actors_["6045_story"]
			local var_496_10 = 0

			if var_496_10 < arg_493_1.time_ and arg_493_1.time_ <= var_496_10 + arg_496_0 and not isNil(var_496_9) and arg_493_1.var_.characterEffect6045_story == nil then
				arg_493_1.var_.characterEffect6045_story = var_496_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_11 = 0.200000002980232

			if var_496_10 <= arg_493_1.time_ and arg_493_1.time_ < var_496_10 + var_496_11 and not isNil(var_496_9) then
				local var_496_12 = (arg_493_1.time_ - var_496_10) / var_496_11

				if arg_493_1.var_.characterEffect6045_story and not isNil(var_496_9) then
					local var_496_13 = Mathf.Lerp(0, 0.5, var_496_12)

					arg_493_1.var_.characterEffect6045_story.fillFlat = true
					arg_493_1.var_.characterEffect6045_story.fillRatio = var_496_13
				end
			end

			if arg_493_1.time_ >= var_496_10 + var_496_11 and arg_493_1.time_ < var_496_10 + var_496_11 + arg_496_0 and not isNil(var_496_9) and arg_493_1.var_.characterEffect6045_story then
				local var_496_14 = 0.5

				arg_493_1.var_.characterEffect6045_story.fillFlat = true
				arg_493_1.var_.characterEffect6045_story.fillRatio = var_496_14
			end

			local var_496_15 = arg_493_1.actors_["6046_story"].transform
			local var_496_16 = 0

			if var_496_16 < arg_493_1.time_ and arg_493_1.time_ <= var_496_16 + arg_496_0 then
				arg_493_1.var_.moveOldPos6046_story = var_496_15.localPosition
			end

			local var_496_17 = 0.001

			if var_496_16 <= arg_493_1.time_ and arg_493_1.time_ < var_496_16 + var_496_17 then
				local var_496_18 = (arg_493_1.time_ - var_496_16) / var_496_17
				local var_496_19 = Vector3.New(0, 100, 0)

				var_496_15.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos6046_story, var_496_19, var_496_18)

				local var_496_20 = manager.ui.mainCamera.transform.position - var_496_15.position

				var_496_15.forward = Vector3.New(var_496_20.x, var_496_20.y, var_496_20.z)

				local var_496_21 = var_496_15.localEulerAngles

				var_496_21.z = 0
				var_496_21.x = 0
				var_496_15.localEulerAngles = var_496_21
			end

			if arg_493_1.time_ >= var_496_16 + var_496_17 and arg_493_1.time_ < var_496_16 + var_496_17 + arg_496_0 then
				var_496_15.localPosition = Vector3.New(0, 100, 0)

				local var_496_22 = manager.ui.mainCamera.transform.position - var_496_15.position

				var_496_15.forward = Vector3.New(var_496_22.x, var_496_22.y, var_496_22.z)

				local var_496_23 = var_496_15.localEulerAngles

				var_496_23.z = 0
				var_496_23.x = 0
				var_496_15.localEulerAngles = var_496_23
			end

			local var_496_24 = arg_493_1.actors_["6046_story"]
			local var_496_25 = 0

			if var_496_25 < arg_493_1.time_ and arg_493_1.time_ <= var_496_25 + arg_496_0 and not isNil(var_496_24) and arg_493_1.var_.characterEffect6046_story == nil then
				arg_493_1.var_.characterEffect6046_story = var_496_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_26 = 0.200000002980232

			if var_496_25 <= arg_493_1.time_ and arg_493_1.time_ < var_496_25 + var_496_26 and not isNil(var_496_24) then
				local var_496_27 = (arg_493_1.time_ - var_496_25) / var_496_26

				if arg_493_1.var_.characterEffect6046_story and not isNil(var_496_24) then
					local var_496_28 = Mathf.Lerp(0, 0.5, var_496_27)

					arg_493_1.var_.characterEffect6046_story.fillFlat = true
					arg_493_1.var_.characterEffect6046_story.fillRatio = var_496_28
				end
			end

			if arg_493_1.time_ >= var_496_25 + var_496_26 and arg_493_1.time_ < var_496_25 + var_496_26 + arg_496_0 and not isNil(var_496_24) and arg_493_1.var_.characterEffect6046_story then
				local var_496_29 = 0.5

				arg_493_1.var_.characterEffect6046_story.fillFlat = true
				arg_493_1.var_.characterEffect6046_story.fillRatio = var_496_29
			end

			local var_496_30 = 0
			local var_496_31 = 0.6

			if var_496_30 < arg_493_1.time_ and arg_493_1.time_ <= var_496_30 + arg_496_0 then
				local var_496_32 = "play"
				local var_496_33 = "effect"

				arg_493_1:AudioAction(var_496_32, var_496_33, "se_story_side_1042", "se_story_1042_head", "")
			end

			local var_496_34 = 0
			local var_496_35 = 0.25

			if var_496_34 < arg_493_1.time_ and arg_493_1.time_ <= var_496_34 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_36 = arg_493_1:GetWordFromCfg(1104201122)
				local var_496_37 = arg_493_1:FormatText(var_496_36.content)

				arg_493_1.text_.text = var_496_37

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_38 = 10
				local var_496_39 = utf8.len(var_496_37)
				local var_496_40 = var_496_38 <= 0 and var_496_35 or var_496_35 * (var_496_39 / var_496_38)

				if var_496_40 > 0 and var_496_35 < var_496_40 then
					arg_493_1.talkMaxDuration = var_496_40

					if var_496_40 + var_496_34 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_40 + var_496_34
					end
				end

				arg_493_1.text_.text = var_496_37
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_41 = math.max(var_496_35, arg_493_1.talkMaxDuration)

			if var_496_34 <= arg_493_1.time_ and arg_493_1.time_ < var_496_34 + var_496_41 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_34) / var_496_41

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_34 + var_496_41 and arg_493_1.time_ < var_496_34 + var_496_41 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201123 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 1104201123
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play1104201124(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 0.875

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, false)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_2 = arg_497_1:GetWordFromCfg(1104201123)
				local var_500_3 = arg_497_1:FormatText(var_500_2.content)

				arg_497_1.text_.text = var_500_3

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_4 = 35
				local var_500_5 = utf8.len(var_500_3)
				local var_500_6 = var_500_4 <= 0 and var_500_1 or var_500_1 * (var_500_5 / var_500_4)

				if var_500_6 > 0 and var_500_1 < var_500_6 then
					arg_497_1.talkMaxDuration = var_500_6

					if var_500_6 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_6 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_3
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_7 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_7 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_7

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_7 and arg_497_1.time_ < var_500_0 + var_500_7 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201124 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 1104201124
		arg_501_1.duration_ = 5.2

		local var_501_0 = {
			ja = 5.2,
			ko = 4.566,
			zh = 4.566
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play1104201125(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["6045_story"].transform
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1.var_.moveOldPos6045_story = var_504_0.localPosition
			end

			local var_504_2 = 0.001

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2
				local var_504_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_504_0.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos6045_story, var_504_4, var_504_3)

				local var_504_5 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_5.x, var_504_5.y, var_504_5.z)

				local var_504_6 = var_504_0.localEulerAngles

				var_504_6.z = 0
				var_504_6.x = 0
				var_504_0.localEulerAngles = var_504_6
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 then
				var_504_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_504_7 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_7.x, var_504_7.y, var_504_7.z)

				local var_504_8 = var_504_0.localEulerAngles

				var_504_8.z = 0
				var_504_8.x = 0
				var_504_0.localEulerAngles = var_504_8
			end

			local var_504_9 = arg_501_1.actors_["6045_story"]
			local var_504_10 = 0

			if var_504_10 < arg_501_1.time_ and arg_501_1.time_ <= var_504_10 + arg_504_0 and not isNil(var_504_9) and arg_501_1.var_.characterEffect6045_story == nil then
				arg_501_1.var_.characterEffect6045_story = var_504_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_11 = 0.200000002980232

			if var_504_10 <= arg_501_1.time_ and arg_501_1.time_ < var_504_10 + var_504_11 and not isNil(var_504_9) then
				local var_504_12 = (arg_501_1.time_ - var_504_10) / var_504_11

				if arg_501_1.var_.characterEffect6045_story and not isNil(var_504_9) then
					local var_504_13 = Mathf.Lerp(0, 0.5, var_504_12)

					arg_501_1.var_.characterEffect6045_story.fillFlat = true
					arg_501_1.var_.characterEffect6045_story.fillRatio = var_504_13
				end
			end

			if arg_501_1.time_ >= var_504_10 + var_504_11 and arg_501_1.time_ < var_504_10 + var_504_11 + arg_504_0 and not isNil(var_504_9) and arg_501_1.var_.characterEffect6045_story then
				local var_504_14 = 0.5

				arg_501_1.var_.characterEffect6045_story.fillFlat = true
				arg_501_1.var_.characterEffect6045_story.fillRatio = var_504_14
			end

			local var_504_15 = arg_501_1.actors_["6046_story"].transform
			local var_504_16 = 0

			if var_504_16 < arg_501_1.time_ and arg_501_1.time_ <= var_504_16 + arg_504_0 then
				arg_501_1.var_.moveOldPos6046_story = var_504_15.localPosition
			end

			local var_504_17 = 0.001

			if var_504_16 <= arg_501_1.time_ and arg_501_1.time_ < var_504_16 + var_504_17 then
				local var_504_18 = (arg_501_1.time_ - var_504_16) / var_504_17
				local var_504_19 = Vector3.New(0.7, -0.5, -6.3)

				var_504_15.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos6046_story, var_504_19, var_504_18)

				local var_504_20 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_20.x, var_504_20.y, var_504_20.z)

				local var_504_21 = var_504_15.localEulerAngles

				var_504_21.z = 0
				var_504_21.x = 0
				var_504_15.localEulerAngles = var_504_21
			end

			if arg_501_1.time_ >= var_504_16 + var_504_17 and arg_501_1.time_ < var_504_16 + var_504_17 + arg_504_0 then
				var_504_15.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_504_22 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_22.x, var_504_22.y, var_504_22.z)

				local var_504_23 = var_504_15.localEulerAngles

				var_504_23.z = 0
				var_504_23.x = 0
				var_504_15.localEulerAngles = var_504_23
			end

			local var_504_24 = arg_501_1.actors_["6046_story"]
			local var_504_25 = 0

			if var_504_25 < arg_501_1.time_ and arg_501_1.time_ <= var_504_25 + arg_504_0 and not isNil(var_504_24) and arg_501_1.var_.characterEffect6046_story == nil then
				arg_501_1.var_.characterEffect6046_story = var_504_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_26 = 0.200000002980232

			if var_504_25 <= arg_501_1.time_ and arg_501_1.time_ < var_504_25 + var_504_26 and not isNil(var_504_24) then
				local var_504_27 = (arg_501_1.time_ - var_504_25) / var_504_26

				if arg_501_1.var_.characterEffect6046_story and not isNil(var_504_24) then
					arg_501_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_25 + var_504_26 and arg_501_1.time_ < var_504_25 + var_504_26 + arg_504_0 and not isNil(var_504_24) and arg_501_1.var_.characterEffect6046_story then
				arg_501_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_504_28 = 0

			if var_504_28 < arg_501_1.time_ and arg_501_1.time_ <= var_504_28 + arg_504_0 then
				arg_501_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_504_29 = 0

			if var_504_29 < arg_501_1.time_ and arg_501_1.time_ <= var_504_29 + arg_504_0 then
				arg_501_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_504_30 = 0
			local var_504_31 = 0.35

			if var_504_30 < arg_501_1.time_ and arg_501_1.time_ <= var_504_30 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_32 = arg_501_1:FormatText(StoryNameCfg[214].name)

				arg_501_1.leftNameTxt_.text = var_504_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_33 = arg_501_1:GetWordFromCfg(1104201124)
				local var_504_34 = arg_501_1:FormatText(var_504_33.content)

				arg_501_1.text_.text = var_504_34

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_35 = 14
				local var_504_36 = utf8.len(var_504_34)
				local var_504_37 = var_504_35 <= 0 and var_504_31 or var_504_31 * (var_504_36 / var_504_35)

				if var_504_37 > 0 and var_504_31 < var_504_37 then
					arg_501_1.talkMaxDuration = var_504_37

					if var_504_37 + var_504_30 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_37 + var_504_30
					end
				end

				arg_501_1.text_.text = var_504_34
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201124", "story_v_side_new_1104201.awb") ~= 0 then
					local var_504_38 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201124", "story_v_side_new_1104201.awb") / 1000

					if var_504_38 + var_504_30 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_38 + var_504_30
					end

					if var_504_33.prefab_name ~= "" and arg_501_1.actors_[var_504_33.prefab_name] ~= nil then
						local var_504_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_33.prefab_name].transform, "story_v_side_new_1104201", "1104201124", "story_v_side_new_1104201.awb")

						arg_501_1:RecordAudio("1104201124", var_504_39)
						arg_501_1:RecordAudio("1104201124", var_504_39)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201124", "story_v_side_new_1104201.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201124", "story_v_side_new_1104201.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_40 = math.max(var_504_31, arg_501_1.talkMaxDuration)

			if var_504_30 <= arg_501_1.time_ and arg_501_1.time_ < var_504_30 + var_504_40 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_30) / var_504_40

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_30 + var_504_40 and arg_501_1.time_ < var_504_30 + var_504_40 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201125 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 1104201125
		arg_505_1.duration_ = 8.43

		local var_505_0 = {
			ja = 8.433,
			ko = 8.1,
			zh = 8.1
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play1104201126(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["6045_story"]
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 and not isNil(var_508_0) and arg_505_1.var_.characterEffect6045_story == nil then
				arg_505_1.var_.characterEffect6045_story = var_508_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_2 = 0.200000002980232

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 and not isNil(var_508_0) then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2

				if arg_505_1.var_.characterEffect6045_story and not isNil(var_508_0) then
					arg_505_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 and not isNil(var_508_0) and arg_505_1.var_.characterEffect6045_story then
				arg_505_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_508_4 = 0

			if var_508_4 < arg_505_1.time_ and arg_505_1.time_ <= var_508_4 + arg_508_0 then
				arg_505_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_508_5 = 0

			if var_508_5 < arg_505_1.time_ and arg_505_1.time_ <= var_508_5 + arg_508_0 then
				arg_505_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_508_6 = arg_505_1.actors_["6046_story"]
			local var_508_7 = 0

			if var_508_7 < arg_505_1.time_ and arg_505_1.time_ <= var_508_7 + arg_508_0 and not isNil(var_508_6) and arg_505_1.var_.characterEffect6046_story == nil then
				arg_505_1.var_.characterEffect6046_story = var_508_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_8 = 0.200000002980232

			if var_508_7 <= arg_505_1.time_ and arg_505_1.time_ < var_508_7 + var_508_8 and not isNil(var_508_6) then
				local var_508_9 = (arg_505_1.time_ - var_508_7) / var_508_8

				if arg_505_1.var_.characterEffect6046_story and not isNil(var_508_6) then
					local var_508_10 = Mathf.Lerp(0, 0.5, var_508_9)

					arg_505_1.var_.characterEffect6046_story.fillFlat = true
					arg_505_1.var_.characterEffect6046_story.fillRatio = var_508_10
				end
			end

			if arg_505_1.time_ >= var_508_7 + var_508_8 and arg_505_1.time_ < var_508_7 + var_508_8 + arg_508_0 and not isNil(var_508_6) and arg_505_1.var_.characterEffect6046_story then
				local var_508_11 = 0.5

				arg_505_1.var_.characterEffect6046_story.fillFlat = true
				arg_505_1.var_.characterEffect6046_story.fillRatio = var_508_11
			end

			local var_508_12 = 0
			local var_508_13 = 0.575

			if var_508_12 < arg_505_1.time_ and arg_505_1.time_ <= var_508_12 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_14 = arg_505_1:FormatText(StoryNameCfg[215].name)

				arg_505_1.leftNameTxt_.text = var_508_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_15 = arg_505_1:GetWordFromCfg(1104201125)
				local var_508_16 = arg_505_1:FormatText(var_508_15.content)

				arg_505_1.text_.text = var_508_16

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_17 = 23
				local var_508_18 = utf8.len(var_508_16)
				local var_508_19 = var_508_17 <= 0 and var_508_13 or var_508_13 * (var_508_18 / var_508_17)

				if var_508_19 > 0 and var_508_13 < var_508_19 then
					arg_505_1.talkMaxDuration = var_508_19

					if var_508_19 + var_508_12 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_19 + var_508_12
					end
				end

				arg_505_1.text_.text = var_508_16
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201125", "story_v_side_new_1104201.awb") ~= 0 then
					local var_508_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201125", "story_v_side_new_1104201.awb") / 1000

					if var_508_20 + var_508_12 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_20 + var_508_12
					end

					if var_508_15.prefab_name ~= "" and arg_505_1.actors_[var_508_15.prefab_name] ~= nil then
						local var_508_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_15.prefab_name].transform, "story_v_side_new_1104201", "1104201125", "story_v_side_new_1104201.awb")

						arg_505_1:RecordAudio("1104201125", var_508_21)
						arg_505_1:RecordAudio("1104201125", var_508_21)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201125", "story_v_side_new_1104201.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201125", "story_v_side_new_1104201.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_22 = math.max(var_508_13, arg_505_1.talkMaxDuration)

			if var_508_12 <= arg_505_1.time_ and arg_505_1.time_ < var_508_12 + var_508_22 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_12) / var_508_22

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_12 + var_508_22 and arg_505_1.time_ < var_508_12 + var_508_22 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201126 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 1104201126
		arg_509_1.duration_ = 10.03

		local var_509_0 = {
			ja = 9.5,
			ko = 10.033,
			zh = 10.033
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play1104201127(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = 0

			if var_512_0 < arg_509_1.time_ and arg_509_1.time_ <= var_512_0 + arg_512_0 then
				arg_509_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_1")
			end

			local var_512_1 = 0
			local var_512_2 = 0.75

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_3 = arg_509_1:FormatText(StoryNameCfg[215].name)

				arg_509_1.leftNameTxt_.text = var_512_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_4 = arg_509_1:GetWordFromCfg(1104201126)
				local var_512_5 = arg_509_1:FormatText(var_512_4.content)

				arg_509_1.text_.text = var_512_5

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_6 = 30
				local var_512_7 = utf8.len(var_512_5)
				local var_512_8 = var_512_6 <= 0 and var_512_2 or var_512_2 * (var_512_7 / var_512_6)

				if var_512_8 > 0 and var_512_2 < var_512_8 then
					arg_509_1.talkMaxDuration = var_512_8

					if var_512_8 + var_512_1 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_8 + var_512_1
					end
				end

				arg_509_1.text_.text = var_512_5
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201126", "story_v_side_new_1104201.awb") ~= 0 then
					local var_512_9 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201126", "story_v_side_new_1104201.awb") / 1000

					if var_512_9 + var_512_1 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_9 + var_512_1
					end

					if var_512_4.prefab_name ~= "" and arg_509_1.actors_[var_512_4.prefab_name] ~= nil then
						local var_512_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_4.prefab_name].transform, "story_v_side_new_1104201", "1104201126", "story_v_side_new_1104201.awb")

						arg_509_1:RecordAudio("1104201126", var_512_10)
						arg_509_1:RecordAudio("1104201126", var_512_10)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201126", "story_v_side_new_1104201.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201126", "story_v_side_new_1104201.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_11 = math.max(var_512_2, arg_509_1.talkMaxDuration)

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_11 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_1) / var_512_11

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_1 + var_512_11 and arg_509_1.time_ < var_512_1 + var_512_11 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201127 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 1104201127
		arg_513_1.duration_ = 4

		local var_513_0 = {
			ja = 4,
			ko = 3.666,
			zh = 3.666
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play1104201128(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["6046_story"]
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 and not isNil(var_516_0) and arg_513_1.var_.characterEffect6046_story == nil then
				arg_513_1.var_.characterEffect6046_story = var_516_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_2 = 0.200000002980232

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 and not isNil(var_516_0) then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2

				if arg_513_1.var_.characterEffect6046_story and not isNil(var_516_0) then
					arg_513_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 and not isNil(var_516_0) and arg_513_1.var_.characterEffect6046_story then
				arg_513_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_516_4 = 0

			if var_516_4 < arg_513_1.time_ and arg_513_1.time_ <= var_516_4 + arg_516_0 then
				arg_513_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action5_1")
			end

			local var_516_5 = 0

			if var_516_5 < arg_513_1.time_ and arg_513_1.time_ <= var_516_5 + arg_516_0 then
				arg_513_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_516_6 = arg_513_1.actors_["6045_story"]
			local var_516_7 = 0

			if var_516_7 < arg_513_1.time_ and arg_513_1.time_ <= var_516_7 + arg_516_0 and not isNil(var_516_6) and arg_513_1.var_.characterEffect6045_story == nil then
				arg_513_1.var_.characterEffect6045_story = var_516_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_8 = 0.200000002980232

			if var_516_7 <= arg_513_1.time_ and arg_513_1.time_ < var_516_7 + var_516_8 and not isNil(var_516_6) then
				local var_516_9 = (arg_513_1.time_ - var_516_7) / var_516_8

				if arg_513_1.var_.characterEffect6045_story and not isNil(var_516_6) then
					local var_516_10 = Mathf.Lerp(0, 0.5, var_516_9)

					arg_513_1.var_.characterEffect6045_story.fillFlat = true
					arg_513_1.var_.characterEffect6045_story.fillRatio = var_516_10
				end
			end

			if arg_513_1.time_ >= var_516_7 + var_516_8 and arg_513_1.time_ < var_516_7 + var_516_8 + arg_516_0 and not isNil(var_516_6) and arg_513_1.var_.characterEffect6045_story then
				local var_516_11 = 0.5

				arg_513_1.var_.characterEffect6045_story.fillFlat = true
				arg_513_1.var_.characterEffect6045_story.fillRatio = var_516_11
			end

			local var_516_12 = 0
			local var_516_13 = 0.35

			if var_516_12 < arg_513_1.time_ and arg_513_1.time_ <= var_516_12 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_14 = arg_513_1:FormatText(StoryNameCfg[214].name)

				arg_513_1.leftNameTxt_.text = var_516_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_15 = arg_513_1:GetWordFromCfg(1104201127)
				local var_516_16 = arg_513_1:FormatText(var_516_15.content)

				arg_513_1.text_.text = var_516_16

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_17 = 14
				local var_516_18 = utf8.len(var_516_16)
				local var_516_19 = var_516_17 <= 0 and var_516_13 or var_516_13 * (var_516_18 / var_516_17)

				if var_516_19 > 0 and var_516_13 < var_516_19 then
					arg_513_1.talkMaxDuration = var_516_19

					if var_516_19 + var_516_12 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_19 + var_516_12
					end
				end

				arg_513_1.text_.text = var_516_16
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201127", "story_v_side_new_1104201.awb") ~= 0 then
					local var_516_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201127", "story_v_side_new_1104201.awb") / 1000

					if var_516_20 + var_516_12 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_20 + var_516_12
					end

					if var_516_15.prefab_name ~= "" and arg_513_1.actors_[var_516_15.prefab_name] ~= nil then
						local var_516_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_15.prefab_name].transform, "story_v_side_new_1104201", "1104201127", "story_v_side_new_1104201.awb")

						arg_513_1:RecordAudio("1104201127", var_516_21)
						arg_513_1:RecordAudio("1104201127", var_516_21)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201127", "story_v_side_new_1104201.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201127", "story_v_side_new_1104201.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_22 = math.max(var_516_13, arg_513_1.talkMaxDuration)

			if var_516_12 <= arg_513_1.time_ and arg_513_1.time_ < var_516_12 + var_516_22 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_12) / var_516_22

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_12 + var_516_22 and arg_513_1.time_ < var_516_12 + var_516_22 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201128 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 1104201128
		arg_517_1.duration_ = 8.2

		local var_517_0 = {
			ja = 7.366,
			ko = 8.2,
			zh = 8.2
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play1104201129(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = 0
			local var_520_1 = 0.65

			if var_520_0 < arg_517_1.time_ and arg_517_1.time_ <= var_520_0 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_2 = arg_517_1:FormatText(StoryNameCfg[214].name)

				arg_517_1.leftNameTxt_.text = var_520_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_3 = arg_517_1:GetWordFromCfg(1104201128)
				local var_520_4 = arg_517_1:FormatText(var_520_3.content)

				arg_517_1.text_.text = var_520_4

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_5 = 26
				local var_520_6 = utf8.len(var_520_4)
				local var_520_7 = var_520_5 <= 0 and var_520_1 or var_520_1 * (var_520_6 / var_520_5)

				if var_520_7 > 0 and var_520_1 < var_520_7 then
					arg_517_1.talkMaxDuration = var_520_7

					if var_520_7 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_7 + var_520_0
					end
				end

				arg_517_1.text_.text = var_520_4
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201128", "story_v_side_new_1104201.awb") ~= 0 then
					local var_520_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201128", "story_v_side_new_1104201.awb") / 1000

					if var_520_8 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_8 + var_520_0
					end

					if var_520_3.prefab_name ~= "" and arg_517_1.actors_[var_520_3.prefab_name] ~= nil then
						local var_520_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_3.prefab_name].transform, "story_v_side_new_1104201", "1104201128", "story_v_side_new_1104201.awb")

						arg_517_1:RecordAudio("1104201128", var_520_9)
						arg_517_1:RecordAudio("1104201128", var_520_9)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201128", "story_v_side_new_1104201.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201128", "story_v_side_new_1104201.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_10 = math.max(var_520_1, arg_517_1.talkMaxDuration)

			if var_520_0 <= arg_517_1.time_ and arg_517_1.time_ < var_520_0 + var_520_10 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_0) / var_520_10

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_0 + var_520_10 and arg_517_1.time_ < var_520_0 + var_520_10 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201129 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 1104201129
		arg_521_1.duration_ = 6.7

		local var_521_0 = {
			ja = 4.4,
			ko = 6.7,
			zh = 6.7
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play1104201130(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["6045_story"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and not isNil(var_524_0) and arg_521_1.var_.characterEffect6045_story == nil then
				arg_521_1.var_.characterEffect6045_story = var_524_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_2 = 0.200000002980232

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 and not isNil(var_524_0) then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.characterEffect6045_story and not isNil(var_524_0) then
					arg_521_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and not isNil(var_524_0) and arg_521_1.var_.characterEffect6045_story then
				arg_521_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_524_4 = 0

			if var_524_4 < arg_521_1.time_ and arg_521_1.time_ <= var_524_4 + arg_524_0 then
				arg_521_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action4_2")
			end

			local var_524_5 = 0

			if var_524_5 < arg_521_1.time_ and arg_521_1.time_ <= var_524_5 + arg_524_0 then
				arg_521_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_524_6 = arg_521_1.actors_["6046_story"]
			local var_524_7 = 0

			if var_524_7 < arg_521_1.time_ and arg_521_1.time_ <= var_524_7 + arg_524_0 and not isNil(var_524_6) and arg_521_1.var_.characterEffect6046_story == nil then
				arg_521_1.var_.characterEffect6046_story = var_524_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_8 = 0.200000002980232

			if var_524_7 <= arg_521_1.time_ and arg_521_1.time_ < var_524_7 + var_524_8 and not isNil(var_524_6) then
				local var_524_9 = (arg_521_1.time_ - var_524_7) / var_524_8

				if arg_521_1.var_.characterEffect6046_story and not isNil(var_524_6) then
					local var_524_10 = Mathf.Lerp(0, 0.5, var_524_9)

					arg_521_1.var_.characterEffect6046_story.fillFlat = true
					arg_521_1.var_.characterEffect6046_story.fillRatio = var_524_10
				end
			end

			if arg_521_1.time_ >= var_524_7 + var_524_8 and arg_521_1.time_ < var_524_7 + var_524_8 + arg_524_0 and not isNil(var_524_6) and arg_521_1.var_.characterEffect6046_story then
				local var_524_11 = 0.5

				arg_521_1.var_.characterEffect6046_story.fillFlat = true
				arg_521_1.var_.characterEffect6046_story.fillRatio = var_524_11
			end

			local var_524_12 = 0
			local var_524_13 = 0.525

			if var_524_12 < arg_521_1.time_ and arg_521_1.time_ <= var_524_12 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_14 = arg_521_1:FormatText(StoryNameCfg[215].name)

				arg_521_1.leftNameTxt_.text = var_524_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_15 = arg_521_1:GetWordFromCfg(1104201129)
				local var_524_16 = arg_521_1:FormatText(var_524_15.content)

				arg_521_1.text_.text = var_524_16

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_17 = 21
				local var_524_18 = utf8.len(var_524_16)
				local var_524_19 = var_524_17 <= 0 and var_524_13 or var_524_13 * (var_524_18 / var_524_17)

				if var_524_19 > 0 and var_524_13 < var_524_19 then
					arg_521_1.talkMaxDuration = var_524_19

					if var_524_19 + var_524_12 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_19 + var_524_12
					end
				end

				arg_521_1.text_.text = var_524_16
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201129", "story_v_side_new_1104201.awb") ~= 0 then
					local var_524_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201129", "story_v_side_new_1104201.awb") / 1000

					if var_524_20 + var_524_12 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_20 + var_524_12
					end

					if var_524_15.prefab_name ~= "" and arg_521_1.actors_[var_524_15.prefab_name] ~= nil then
						local var_524_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_15.prefab_name].transform, "story_v_side_new_1104201", "1104201129", "story_v_side_new_1104201.awb")

						arg_521_1:RecordAudio("1104201129", var_524_21)
						arg_521_1:RecordAudio("1104201129", var_524_21)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201129", "story_v_side_new_1104201.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201129", "story_v_side_new_1104201.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_22 = math.max(var_524_13, arg_521_1.talkMaxDuration)

			if var_524_12 <= arg_521_1.time_ and arg_521_1.time_ < var_524_12 + var_524_22 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_12) / var_524_22

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_12 + var_524_22 and arg_521_1.time_ < var_524_12 + var_524_22 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201130 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 1104201130
		arg_525_1.duration_ = 5.07

		local var_525_0 = {
			ja = 4.333,
			ko = 5.066,
			zh = 5.066
		}
		local var_525_1 = manager.audio:GetLocalizationFlag()

		if var_525_0[var_525_1] ~= nil then
			arg_525_1.duration_ = var_525_0[var_525_1]
		end

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play1104201131(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.425

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_2 = arg_525_1:FormatText(StoryNameCfg[215].name)

				arg_525_1.leftNameTxt_.text = var_528_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_3 = arg_525_1:GetWordFromCfg(1104201130)
				local var_528_4 = arg_525_1:FormatText(var_528_3.content)

				arg_525_1.text_.text = var_528_4

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_5 = 17
				local var_528_6 = utf8.len(var_528_4)
				local var_528_7 = var_528_5 <= 0 and var_528_1 or var_528_1 * (var_528_6 / var_528_5)

				if var_528_7 > 0 and var_528_1 < var_528_7 then
					arg_525_1.talkMaxDuration = var_528_7

					if var_528_7 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_7 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_4
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201130", "story_v_side_new_1104201.awb") ~= 0 then
					local var_528_8 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201130", "story_v_side_new_1104201.awb") / 1000

					if var_528_8 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_8 + var_528_0
					end

					if var_528_3.prefab_name ~= "" and arg_525_1.actors_[var_528_3.prefab_name] ~= nil then
						local var_528_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_3.prefab_name].transform, "story_v_side_new_1104201", "1104201130", "story_v_side_new_1104201.awb")

						arg_525_1:RecordAudio("1104201130", var_528_9)
						arg_525_1:RecordAudio("1104201130", var_528_9)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201130", "story_v_side_new_1104201.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201130", "story_v_side_new_1104201.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_10 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_10 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_10

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_10 and arg_525_1.time_ < var_528_0 + var_528_10 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201131 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 1104201131
		arg_529_1.duration_ = 9

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play1104201132(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["6045_story"].transform
			local var_532_1 = 1.95

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 then
				arg_529_1.var_.moveOldPos6045_story = var_532_0.localPosition
			end

			local var_532_2 = 0.001

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2
				local var_532_4 = Vector3.New(0, 100, 0)

				var_532_0.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos6045_story, var_532_4, var_532_3)

				local var_532_5 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_5.x, var_532_5.y, var_532_5.z)

				local var_532_6 = var_532_0.localEulerAngles

				var_532_6.z = 0
				var_532_6.x = 0
				var_532_0.localEulerAngles = var_532_6
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 then
				var_532_0.localPosition = Vector3.New(0, 100, 0)

				local var_532_7 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_7.x, var_532_7.y, var_532_7.z)

				local var_532_8 = var_532_0.localEulerAngles

				var_532_8.z = 0
				var_532_8.x = 0
				var_532_0.localEulerAngles = var_532_8
			end

			local var_532_9 = arg_529_1.actors_["6045_story"]
			local var_532_10 = 1.95

			if var_532_10 < arg_529_1.time_ and arg_529_1.time_ <= var_532_10 + arg_532_0 and not isNil(var_532_9) and arg_529_1.var_.characterEffect6045_story == nil then
				arg_529_1.var_.characterEffect6045_story = var_532_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_11 = 0.05

			if var_532_10 <= arg_529_1.time_ and arg_529_1.time_ < var_532_10 + var_532_11 and not isNil(var_532_9) then
				local var_532_12 = (arg_529_1.time_ - var_532_10) / var_532_11

				if arg_529_1.var_.characterEffect6045_story and not isNil(var_532_9) then
					local var_532_13 = Mathf.Lerp(0, 0.5, var_532_12)

					arg_529_1.var_.characterEffect6045_story.fillFlat = true
					arg_529_1.var_.characterEffect6045_story.fillRatio = var_532_13
				end
			end

			if arg_529_1.time_ >= var_532_10 + var_532_11 and arg_529_1.time_ < var_532_10 + var_532_11 + arg_532_0 and not isNil(var_532_9) and arg_529_1.var_.characterEffect6045_story then
				local var_532_14 = 0.5

				arg_529_1.var_.characterEffect6045_story.fillFlat = true
				arg_529_1.var_.characterEffect6045_story.fillRatio = var_532_14
			end

			local var_532_15 = arg_529_1.actors_["6046_story"].transform
			local var_532_16 = 1.95

			if var_532_16 < arg_529_1.time_ and arg_529_1.time_ <= var_532_16 + arg_532_0 then
				arg_529_1.var_.moveOldPos6046_story = var_532_15.localPosition
			end

			local var_532_17 = 0.001

			if var_532_16 <= arg_529_1.time_ and arg_529_1.time_ < var_532_16 + var_532_17 then
				local var_532_18 = (arg_529_1.time_ - var_532_16) / var_532_17
				local var_532_19 = Vector3.New(0, 100, 0)

				var_532_15.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos6046_story, var_532_19, var_532_18)

				local var_532_20 = manager.ui.mainCamera.transform.position - var_532_15.position

				var_532_15.forward = Vector3.New(var_532_20.x, var_532_20.y, var_532_20.z)

				local var_532_21 = var_532_15.localEulerAngles

				var_532_21.z = 0
				var_532_21.x = 0
				var_532_15.localEulerAngles = var_532_21
			end

			if arg_529_1.time_ >= var_532_16 + var_532_17 and arg_529_1.time_ < var_532_16 + var_532_17 + arg_532_0 then
				var_532_15.localPosition = Vector3.New(0, 100, 0)

				local var_532_22 = manager.ui.mainCamera.transform.position - var_532_15.position

				var_532_15.forward = Vector3.New(var_532_22.x, var_532_22.y, var_532_22.z)

				local var_532_23 = var_532_15.localEulerAngles

				var_532_23.z = 0
				var_532_23.x = 0
				var_532_15.localEulerAngles = var_532_23
			end

			local var_532_24 = arg_529_1.actors_["6046_story"]
			local var_532_25 = 1.95

			if var_532_25 < arg_529_1.time_ and arg_529_1.time_ <= var_532_25 + arg_532_0 and not isNil(var_532_24) and arg_529_1.var_.characterEffect6046_story == nil then
				arg_529_1.var_.characterEffect6046_story = var_532_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_26 = 0.05

			if var_532_25 <= arg_529_1.time_ and arg_529_1.time_ < var_532_25 + var_532_26 and not isNil(var_532_24) then
				local var_532_27 = (arg_529_1.time_ - var_532_25) / var_532_26

				if arg_529_1.var_.characterEffect6046_story and not isNil(var_532_24) then
					local var_532_28 = Mathf.Lerp(0, 0.5, var_532_27)

					arg_529_1.var_.characterEffect6046_story.fillFlat = true
					arg_529_1.var_.characterEffect6046_story.fillRatio = var_532_28
				end
			end

			if arg_529_1.time_ >= var_532_25 + var_532_26 and arg_529_1.time_ < var_532_25 + var_532_26 + arg_532_0 and not isNil(var_532_24) and arg_529_1.var_.characterEffect6046_story then
				local var_532_29 = 0.5

				arg_529_1.var_.characterEffect6046_story.fillFlat = true
				arg_529_1.var_.characterEffect6046_story.fillRatio = var_532_29
			end

			local var_532_30 = 0

			if var_532_30 < arg_529_1.time_ and arg_529_1.time_ <= var_532_30 + arg_532_0 then
				arg_529_1.mask_.enabled = true
				arg_529_1.mask_.raycastTarget = true

				arg_529_1:SetGaussion(false)
			end

			local var_532_31 = 2

			if var_532_30 <= arg_529_1.time_ and arg_529_1.time_ < var_532_30 + var_532_31 then
				local var_532_32 = (arg_529_1.time_ - var_532_30) / var_532_31
				local var_532_33 = Color.New(0, 0, 0)

				var_532_33.a = Mathf.Lerp(0, 1, var_532_32)
				arg_529_1.mask_.color = var_532_33
			end

			if arg_529_1.time_ >= var_532_30 + var_532_31 and arg_529_1.time_ < var_532_30 + var_532_31 + arg_532_0 then
				local var_532_34 = Color.New(0, 0, 0)

				var_532_34.a = 1
				arg_529_1.mask_.color = var_532_34
			end

			local var_532_35 = 2

			if var_532_35 < arg_529_1.time_ and arg_529_1.time_ <= var_532_35 + arg_532_0 then
				arg_529_1.mask_.enabled = true
				arg_529_1.mask_.raycastTarget = true

				arg_529_1:SetGaussion(false)
			end

			local var_532_36 = 2

			if var_532_35 <= arg_529_1.time_ and arg_529_1.time_ < var_532_35 + var_532_36 then
				local var_532_37 = (arg_529_1.time_ - var_532_35) / var_532_36
				local var_532_38 = Color.New(0, 0, 0)

				var_532_38.a = Mathf.Lerp(1, 0, var_532_37)
				arg_529_1.mask_.color = var_532_38
			end

			if arg_529_1.time_ >= var_532_35 + var_532_36 and arg_529_1.time_ < var_532_35 + var_532_36 + arg_532_0 then
				local var_532_39 = Color.New(0, 0, 0)
				local var_532_40 = 0

				arg_529_1.mask_.enabled = false
				var_532_39.a = var_532_40
				arg_529_1.mask_.color = var_532_39
			end

			if arg_529_1.frameCnt_ <= 1 then
				arg_529_1.dialog_:SetActive(false)
			end

			local var_532_41 = 4
			local var_532_42 = 0.05

			if var_532_41 < arg_529_1.time_ and arg_529_1.time_ <= var_532_41 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0

				arg_529_1.dialog_:SetActive(true)

				local var_532_43 = LeanTween.value(arg_529_1.dialog_, 0, 1, 0.3)

				var_532_43:setOnUpdate(LuaHelper.FloatAction(function(arg_533_0)
					arg_529_1.dialogCg_.alpha = arg_533_0
				end))
				var_532_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_529_1.dialog_)
					var_532_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_529_1.duration_ = arg_529_1.duration_ + 0.3

				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_44 = arg_529_1:GetWordFromCfg(1104201131)
				local var_532_45 = arg_529_1:FormatText(var_532_44.content)

				arg_529_1.text_.text = var_532_45

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_46 = 2
				local var_532_47 = utf8.len(var_532_45)
				local var_532_48 = var_532_46 <= 0 and var_532_42 or var_532_42 * (var_532_47 / var_532_46)

				if var_532_48 > 0 and var_532_42 < var_532_48 then
					arg_529_1.talkMaxDuration = var_532_48
					var_532_41 = var_532_41 + 0.3

					if var_532_48 + var_532_41 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_48 + var_532_41
					end
				end

				arg_529_1.text_.text = var_532_45
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_49 = var_532_41 + 0.3
			local var_532_50 = math.max(var_532_42, arg_529_1.talkMaxDuration)

			if var_532_49 <= arg_529_1.time_ and arg_529_1.time_ < var_532_49 + var_532_50 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_49) / var_532_50

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_49 + var_532_50 and arg_529_1.time_ < var_532_49 + var_532_50 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 1104201132
		arg_535_1.duration_ = 5.83

		local var_535_0 = {
			ja = 3.533,
			ko = 5.833,
			zh = 5.833
		}
		local var_535_1 = manager.audio:GetLocalizationFlag()

		if var_535_0[var_535_1] ~= nil then
			arg_535_1.duration_ = var_535_0[var_535_1]
		end

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play1104201133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["6045_story"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos6045_story = var_538_0.localPosition
			end

			local var_538_2 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2
				local var_538_4 = Vector3.New(-0.7, -0.5, -6.3)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos6045_story, var_538_4, var_538_3)

				local var_538_5 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_5.x, var_538_5.y, var_538_5.z)

				local var_538_6 = var_538_0.localEulerAngles

				var_538_6.z = 0
				var_538_6.x = 0
				var_538_0.localEulerAngles = var_538_6
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(-0.7, -0.5, -6.3)

				local var_538_7 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_7.x, var_538_7.y, var_538_7.z)

				local var_538_8 = var_538_0.localEulerAngles

				var_538_8.z = 0
				var_538_8.x = 0
				var_538_0.localEulerAngles = var_538_8
			end

			local var_538_9 = arg_535_1.actors_["6045_story"]
			local var_538_10 = 0

			if var_538_10 < arg_535_1.time_ and arg_535_1.time_ <= var_538_10 + arg_538_0 and not isNil(var_538_9) and arg_535_1.var_.characterEffect6045_story == nil then
				arg_535_1.var_.characterEffect6045_story = var_538_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_11 = 0.200000002980232

			if var_538_10 <= arg_535_1.time_ and arg_535_1.time_ < var_538_10 + var_538_11 and not isNil(var_538_9) then
				local var_538_12 = (arg_535_1.time_ - var_538_10) / var_538_11

				if arg_535_1.var_.characterEffect6045_story and not isNil(var_538_9) then
					arg_535_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_535_1.time_ >= var_538_10 + var_538_11 and arg_535_1.time_ < var_538_10 + var_538_11 + arg_538_0 and not isNil(var_538_9) and arg_535_1.var_.characterEffect6045_story then
				arg_535_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_538_13 = 0

			if var_538_13 < arg_535_1.time_ and arg_535_1.time_ <= var_538_13 + arg_538_0 then
				arg_535_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_538_14 = 0

			if var_538_14 < arg_535_1.time_ and arg_535_1.time_ <= var_538_14 + arg_538_0 then
				arg_535_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_538_15 = arg_535_1.actors_["6046_story"].transform
			local var_538_16 = 0

			if var_538_16 < arg_535_1.time_ and arg_535_1.time_ <= var_538_16 + arg_538_0 then
				arg_535_1.var_.moveOldPos6046_story = var_538_15.localPosition
			end

			local var_538_17 = 0.001

			if var_538_16 <= arg_535_1.time_ and arg_535_1.time_ < var_538_16 + var_538_17 then
				local var_538_18 = (arg_535_1.time_ - var_538_16) / var_538_17
				local var_538_19 = Vector3.New(0.7, -0.5, -6.3)

				var_538_15.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos6046_story, var_538_19, var_538_18)

				local var_538_20 = manager.ui.mainCamera.transform.position - var_538_15.position

				var_538_15.forward = Vector3.New(var_538_20.x, var_538_20.y, var_538_20.z)

				local var_538_21 = var_538_15.localEulerAngles

				var_538_21.z = 0
				var_538_21.x = 0
				var_538_15.localEulerAngles = var_538_21
			end

			if arg_535_1.time_ >= var_538_16 + var_538_17 and arg_535_1.time_ < var_538_16 + var_538_17 + arg_538_0 then
				var_538_15.localPosition = Vector3.New(0.7, -0.5, -6.3)

				local var_538_22 = manager.ui.mainCamera.transform.position - var_538_15.position

				var_538_15.forward = Vector3.New(var_538_22.x, var_538_22.y, var_538_22.z)

				local var_538_23 = var_538_15.localEulerAngles

				var_538_23.z = 0
				var_538_23.x = 0
				var_538_15.localEulerAngles = var_538_23
			end

			local var_538_24 = arg_535_1.actors_["6046_story"]
			local var_538_25 = 0

			if var_538_25 < arg_535_1.time_ and arg_535_1.time_ <= var_538_25 + arg_538_0 and not isNil(var_538_24) and arg_535_1.var_.characterEffect6046_story == nil then
				arg_535_1.var_.characterEffect6046_story = var_538_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_26 = 0.200000002980232

			if var_538_25 <= arg_535_1.time_ and arg_535_1.time_ < var_538_25 + var_538_26 and not isNil(var_538_24) then
				local var_538_27 = (arg_535_1.time_ - var_538_25) / var_538_26

				if arg_535_1.var_.characterEffect6046_story and not isNil(var_538_24) then
					local var_538_28 = Mathf.Lerp(0, 0.5, var_538_27)

					arg_535_1.var_.characterEffect6046_story.fillFlat = true
					arg_535_1.var_.characterEffect6046_story.fillRatio = var_538_28
				end
			end

			if arg_535_1.time_ >= var_538_25 + var_538_26 and arg_535_1.time_ < var_538_25 + var_538_26 + arg_538_0 and not isNil(var_538_24) and arg_535_1.var_.characterEffect6046_story then
				local var_538_29 = 0.5

				arg_535_1.var_.characterEffect6046_story.fillFlat = true
				arg_535_1.var_.characterEffect6046_story.fillRatio = var_538_29
			end

			local var_538_30 = 0
			local var_538_31 = 0.4

			if var_538_30 < arg_535_1.time_ and arg_535_1.time_ <= var_538_30 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_32 = arg_535_1:FormatText(StoryNameCfg[215].name)

				arg_535_1.leftNameTxt_.text = var_538_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_33 = arg_535_1:GetWordFromCfg(1104201132)
				local var_538_34 = arg_535_1:FormatText(var_538_33.content)

				arg_535_1.text_.text = var_538_34

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_35 = 16
				local var_538_36 = utf8.len(var_538_34)
				local var_538_37 = var_538_35 <= 0 and var_538_31 or var_538_31 * (var_538_36 / var_538_35)

				if var_538_37 > 0 and var_538_31 < var_538_37 then
					arg_535_1.talkMaxDuration = var_538_37

					if var_538_37 + var_538_30 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_37 + var_538_30
					end
				end

				arg_535_1.text_.text = var_538_34
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201132", "story_v_side_new_1104201.awb") ~= 0 then
					local var_538_38 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201132", "story_v_side_new_1104201.awb") / 1000

					if var_538_38 + var_538_30 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_38 + var_538_30
					end

					if var_538_33.prefab_name ~= "" and arg_535_1.actors_[var_538_33.prefab_name] ~= nil then
						local var_538_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_33.prefab_name].transform, "story_v_side_new_1104201", "1104201132", "story_v_side_new_1104201.awb")

						arg_535_1:RecordAudio("1104201132", var_538_39)
						arg_535_1:RecordAudio("1104201132", var_538_39)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201132", "story_v_side_new_1104201.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201132", "story_v_side_new_1104201.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_40 = math.max(var_538_31, arg_535_1.talkMaxDuration)

			if var_538_30 <= arg_535_1.time_ and arg_535_1.time_ < var_538_30 + var_538_40 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_30) / var_538_40

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_30 + var_538_40 and arg_535_1.time_ < var_538_30 + var_538_40 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 1104201133
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play1104201134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["6045_story"]
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 and not isNil(var_542_0) and arg_539_1.var_.characterEffect6045_story == nil then
				arg_539_1.var_.characterEffect6045_story = var_542_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_2 = 0.200000002980232

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 and not isNil(var_542_0) then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2

				if arg_539_1.var_.characterEffect6045_story and not isNil(var_542_0) then
					local var_542_4 = Mathf.Lerp(0, 0.5, var_542_3)

					arg_539_1.var_.characterEffect6045_story.fillFlat = true
					arg_539_1.var_.characterEffect6045_story.fillRatio = var_542_4
				end
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 and not isNil(var_542_0) and arg_539_1.var_.characterEffect6045_story then
				local var_542_5 = 0.5

				arg_539_1.var_.characterEffect6045_story.fillFlat = true
				arg_539_1.var_.characterEffect6045_story.fillRatio = var_542_5
			end

			local var_542_6 = 0
			local var_542_7 = 0.55

			if var_542_6 < arg_539_1.time_ and arg_539_1.time_ <= var_542_6 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_8 = arg_539_1:FormatText(StoryNameCfg[7].name)

				arg_539_1.leftNameTxt_.text = var_542_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, true)
				arg_539_1.iconController_:SetSelectedState("hero")

				arg_539_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_539_1.callingController_:SetSelectedState("normal")

				arg_539_1.keyicon_.color = Color.New(1, 1, 1)
				arg_539_1.icon_.color = Color.New(1, 1, 1)

				local var_542_9 = arg_539_1:GetWordFromCfg(1104201133)
				local var_542_10 = arg_539_1:FormatText(var_542_9.content)

				arg_539_1.text_.text = var_542_10

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_11 = 22
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
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_14 = math.max(var_542_7, arg_539_1.talkMaxDuration)

			if var_542_6 <= arg_539_1.time_ and arg_539_1.time_ < var_542_6 + var_542_14 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_6) / var_542_14

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_6 + var_542_14 and arg_539_1.time_ < var_542_6 + var_542_14 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 1104201134
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play1104201135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 0.525

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_2 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, true)
				arg_543_1.iconController_:SetSelectedState("hero")

				arg_543_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_543_1.callingController_:SetSelectedState("normal")

				arg_543_1.keyicon_.color = Color.New(1, 1, 1)
				arg_543_1.icon_.color = Color.New(1, 1, 1)

				local var_546_3 = arg_543_1:GetWordFromCfg(1104201134)
				local var_546_4 = arg_543_1:FormatText(var_546_3.content)

				arg_543_1.text_.text = var_546_4

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_5 = 21
				local var_546_6 = utf8.len(var_546_4)
				local var_546_7 = var_546_5 <= 0 and var_546_1 or var_546_1 * (var_546_6 / var_546_5)

				if var_546_7 > 0 and var_546_1 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_4
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_8 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_8 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_8

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_8 and arg_543_1.time_ < var_546_0 + var_546_8 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1104201135
		arg_547_1.duration_ = 7.73

		local var_547_0 = {
			ja = 3.433,
			ko = 7.733,
			zh = 7.733
		}
		local var_547_1 = manager.audio:GetLocalizationFlag()

		if var_547_0[var_547_1] ~= nil then
			arg_547_1.duration_ = var_547_0[var_547_1]
		end

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1104201136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["6046_story"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and not isNil(var_550_0) and arg_547_1.var_.characterEffect6046_story == nil then
				arg_547_1.var_.characterEffect6046_story = var_550_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_2 = 0.200000002980232

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 and not isNil(var_550_0) then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.characterEffect6046_story and not isNil(var_550_0) then
					arg_547_1.var_.characterEffect6046_story.fillFlat = false
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and not isNil(var_550_0) and arg_547_1.var_.characterEffect6046_story then
				arg_547_1.var_.characterEffect6046_story.fillFlat = false
			end

			local var_550_4 = 0

			if var_550_4 < arg_547_1.time_ and arg_547_1.time_ <= var_550_4 + arg_550_0 then
				arg_547_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_550_5 = 0

			if var_550_5 < arg_547_1.time_ and arg_547_1.time_ <= var_550_5 + arg_550_0 then
				arg_547_1:PlayTimeline("6046_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_550_6 = 0
			local var_550_7 = 0.75

			if var_550_6 < arg_547_1.time_ and arg_547_1.time_ <= var_550_6 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_8 = arg_547_1:FormatText(StoryNameCfg[214].name)

				arg_547_1.leftNameTxt_.text = var_550_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_9 = arg_547_1:GetWordFromCfg(1104201135)
				local var_550_10 = arg_547_1:FormatText(var_550_9.content)

				arg_547_1.text_.text = var_550_10

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_11 = 30
				local var_550_12 = utf8.len(var_550_10)
				local var_550_13 = var_550_11 <= 0 and var_550_7 or var_550_7 * (var_550_12 / var_550_11)

				if var_550_13 > 0 and var_550_7 < var_550_13 then
					arg_547_1.talkMaxDuration = var_550_13

					if var_550_13 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_13 + var_550_6
					end
				end

				arg_547_1.text_.text = var_550_10
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201135", "story_v_side_new_1104201.awb") ~= 0 then
					local var_550_14 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201135", "story_v_side_new_1104201.awb") / 1000

					if var_550_14 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_14 + var_550_6
					end

					if var_550_9.prefab_name ~= "" and arg_547_1.actors_[var_550_9.prefab_name] ~= nil then
						local var_550_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_9.prefab_name].transform, "story_v_side_new_1104201", "1104201135", "story_v_side_new_1104201.awb")

						arg_547_1:RecordAudio("1104201135", var_550_15)
						arg_547_1:RecordAudio("1104201135", var_550_15)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201135", "story_v_side_new_1104201.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201135", "story_v_side_new_1104201.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_16 = math.max(var_550_7, arg_547_1.talkMaxDuration)

			if var_550_6 <= arg_547_1.time_ and arg_547_1.time_ < var_550_6 + var_550_16 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_6) / var_550_16

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_6 + var_550_16 and arg_547_1.time_ < var_550_6 + var_550_16 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1104201136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1104201136
		arg_551_1.duration_ = 4.8

		local var_551_0 = {
			ja = 4.1,
			ko = 4.8,
			zh = 4.8
		}
		local var_551_1 = manager.audio:GetLocalizationFlag()

		if var_551_0[var_551_1] ~= nil then
			arg_551_1.duration_ = var_551_0[var_551_1]
		end

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
			arg_551_1.auto_ = false
		end

		function arg_551_1.playNext_(arg_553_0)
			arg_551_1.onStoryFinished_()
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["6045_story"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and not isNil(var_554_0) and arg_551_1.var_.characterEffect6045_story == nil then
				arg_551_1.var_.characterEffect6045_story = var_554_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_2 = 0.200000002980232

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 and not isNil(var_554_0) then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.characterEffect6045_story and not isNil(var_554_0) then
					arg_551_1.var_.characterEffect6045_story.fillFlat = false
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and not isNil(var_554_0) and arg_551_1.var_.characterEffect6045_story then
				arg_551_1.var_.characterEffect6045_story.fillFlat = false
			end

			local var_554_4 = 0

			if var_554_4 < arg_551_1.time_ and arg_551_1.time_ <= var_554_4 + arg_554_0 then
				arg_551_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/6045/6045action/6045action1_1")
			end

			local var_554_5 = 0

			if var_554_5 < arg_551_1.time_ and arg_551_1.time_ <= var_554_5 + arg_554_0 then
				arg_551_1:PlayTimeline("6045_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_554_6 = arg_551_1.actors_["6046_story"]
			local var_554_7 = 0

			if var_554_7 < arg_551_1.time_ and arg_551_1.time_ <= var_554_7 + arg_554_0 and not isNil(var_554_6) and arg_551_1.var_.characterEffect6046_story == nil then
				arg_551_1.var_.characterEffect6046_story = var_554_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_8 = 0.200000002980232

			if var_554_7 <= arg_551_1.time_ and arg_551_1.time_ < var_554_7 + var_554_8 and not isNil(var_554_6) then
				local var_554_9 = (arg_551_1.time_ - var_554_7) / var_554_8

				if arg_551_1.var_.characterEffect6046_story and not isNil(var_554_6) then
					local var_554_10 = Mathf.Lerp(0, 0.5, var_554_9)

					arg_551_1.var_.characterEffect6046_story.fillFlat = true
					arg_551_1.var_.characterEffect6046_story.fillRatio = var_554_10
				end
			end

			if arg_551_1.time_ >= var_554_7 + var_554_8 and arg_551_1.time_ < var_554_7 + var_554_8 + arg_554_0 and not isNil(var_554_6) and arg_551_1.var_.characterEffect6046_story then
				local var_554_11 = 0.5

				arg_551_1.var_.characterEffect6046_story.fillFlat = true
				arg_551_1.var_.characterEffect6046_story.fillRatio = var_554_11
			end

			local var_554_12 = 0
			local var_554_13 = 0.4

			if var_554_12 < arg_551_1.time_ and arg_551_1.time_ <= var_554_12 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_14 = arg_551_1:FormatText(StoryNameCfg[215].name)

				arg_551_1.leftNameTxt_.text = var_554_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_15 = arg_551_1:GetWordFromCfg(1104201136)
				local var_554_16 = arg_551_1:FormatText(var_554_15.content)

				arg_551_1.text_.text = var_554_16

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_17 = 16
				local var_554_18 = utf8.len(var_554_16)
				local var_554_19 = var_554_17 <= 0 and var_554_13 or var_554_13 * (var_554_18 / var_554_17)

				if var_554_19 > 0 and var_554_13 < var_554_19 then
					arg_551_1.talkMaxDuration = var_554_19

					if var_554_19 + var_554_12 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_19 + var_554_12
					end
				end

				arg_551_1.text_.text = var_554_16
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201136", "story_v_side_new_1104201.awb") ~= 0 then
					local var_554_20 = manager.audio:GetVoiceLength("story_v_side_new_1104201", "1104201136", "story_v_side_new_1104201.awb") / 1000

					if var_554_20 + var_554_12 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_20 + var_554_12
					end

					if var_554_15.prefab_name ~= "" and arg_551_1.actors_[var_554_15.prefab_name] ~= nil then
						local var_554_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_15.prefab_name].transform, "story_v_side_new_1104201", "1104201136", "story_v_side_new_1104201.awb")

						arg_551_1:RecordAudio("1104201136", var_554_21)
						arg_551_1:RecordAudio("1104201136", var_554_21)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_side_new_1104201", "1104201136", "story_v_side_new_1104201.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_side_new_1104201", "1104201136", "story_v_side_new_1104201.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_22 = math.max(var_554_13, arg_551_1.talkMaxDuration)

			if var_554_12 <= arg_551_1.time_ and arg_551_1.time_ < var_554_12 + var_554_22 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_12) / var_554_22

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_12 + var_554_22 and arg_551_1.time_ < var_554_12 + var_554_22 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22"
	},
	voices = {
		"story_v_side_new_1104201.awb"
	}
}
