return {
	Play410031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410031001
		arg_1_1.duration_ = 5.599999999999

		local var_1_0 = {
			zh = 3.965999999999,
			ja = 5.599999999999
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
				arg_1_0:Play410031002(arg_1_1)
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
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_26 = 1.999999999999
			local var_4_27 = 0.2

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_28 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_28:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_29 = arg_1_1:FormatText(StoryNameCfg[584].name)

				arg_1_1.leftNameTxt_.text = var_4_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_3")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_30 = arg_1_1:GetWordFromCfg(410031001)
				local var_4_31 = arg_1_1:FormatText(var_4_30.content)

				arg_1_1.text_.text = var_4_31

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_32 = 8
				local var_4_33 = utf8.len(var_4_31)
				local var_4_34 = var_4_32 <= 0 and var_4_27 or var_4_27 * (var_4_33 / var_4_32)

				if var_4_34 > 0 and var_4_27 < var_4_34 then
					arg_1_1.talkMaxDuration = var_4_34
					var_4_26 = var_4_26 + 0.3

					if var_4_34 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_34 + var_4_26
					end
				end

				arg_1_1.text_.text = var_4_31
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031001", "story_v_out_410031.awb") ~= 0 then
					local var_4_35 = manager.audio:GetVoiceLength("story_v_out_410031", "410031001", "story_v_out_410031.awb") / 1000

					if var_4_35 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_35 + var_4_26
					end

					if var_4_30.prefab_name ~= "" and arg_1_1.actors_[var_4_30.prefab_name] ~= nil then
						local var_4_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_30.prefab_name].transform, "story_v_out_410031", "410031001", "story_v_out_410031.awb")

						arg_1_1:RecordAudio("410031001", var_4_36)
						arg_1_1:RecordAudio("410031001", var_4_36)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410031", "410031001", "story_v_out_410031.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410031", "410031001", "story_v_out_410031.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_37 = var_4_26 + 0.3
			local var_4_38 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_37) / var_4_38

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410031002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play410031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.mask_.enabled = true
				arg_7_1.mask_.raycastTarget = true

				arg_7_1:SetGaussion(false)
			end

			local var_10_1 = 1

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_1 then
				local var_10_2 = (arg_7_1.time_ - var_10_0) / var_10_1
				local var_10_3 = Color.New(1, 1, 1)

				var_10_3.a = Mathf.Lerp(1, 0, var_10_2)
				arg_7_1.mask_.color = var_10_3
			end

			if arg_7_1.time_ >= var_10_0 + var_10_1 and arg_7_1.time_ < var_10_0 + var_10_1 + arg_10_0 then
				local var_10_4 = Color.New(1, 1, 1)
				local var_10_5 = 0

				arg_7_1.mask_.enabled = false
				var_10_4.a = var_10_5
				arg_7_1.mask_.color = var_10_4
			end

			local var_10_6 = 0
			local var_10_7 = 1

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				local var_10_8 = "play"
				local var_10_9 = "effect"

				arg_7_1:AudioAction(var_10_8, var_10_9, "se_story_side_1148", "se_story_1148_explosion", "")
			end

			local var_10_10 = 0
			local var_10_11 = 0.075

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0

				arg_7_1.dialog_:SetActive(true)

				local var_10_12 = LeanTween.value(arg_7_1.dialog_, 0, 1, 0.3)

				var_10_12:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_7_1.dialogCg_.alpha = arg_11_0
				end))
				var_10_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_7_1.dialog_)
					var_10_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_7_1.duration_ = arg_7_1.duration_ + 0.3

				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_13 = arg_7_1:GetWordFromCfg(410031002)
				local var_10_14 = arg_7_1:FormatText(var_10_13.content)

				arg_7_1.text_.text = var_10_14

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_15 = 3
				local var_10_16 = utf8.len(var_10_14)
				local var_10_17 = var_10_15 <= 0 and var_10_11 or var_10_11 * (var_10_16 / var_10_15)

				if var_10_17 > 0 and var_10_11 < var_10_17 then
					arg_7_1.talkMaxDuration = var_10_17
					var_10_10 = var_10_10 + 0.3

					if var_10_17 + var_10_10 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_17 + var_10_10
					end
				end

				arg_7_1.text_.text = var_10_14
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_18 = var_10_10 + 0.3
			local var_10_19 = math.max(var_10_11, arg_7_1.talkMaxDuration)

			if var_10_18 <= arg_7_1.time_ and arg_7_1.time_ < var_10_18 + var_10_19 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_18) / var_10_19

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_18 + var_10_19 and arg_7_1.time_ < var_10_18 + var_10_19 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play410031003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 410031003
		arg_13_1.duration_ = 5.566

		local var_13_0 = {
			zh = 3.733,
			ja = 5.566
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
				arg_13_0:Play410031004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.525

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[605].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, true)
				arg_13_1.iconController_:SetSelectedState("hero")

				arg_13_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1056_split_4")

				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(410031003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031003", "story_v_out_410031.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031003", "story_v_out_410031.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_410031", "410031003", "story_v_out_410031.awb")

						arg_13_1:RecordAudio("410031003", var_16_9)
						arg_13_1:RecordAudio("410031003", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_410031", "410031003", "story_v_out_410031.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_410031", "410031003", "story_v_out_410031.awb")
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
	Play410031004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 410031004
		arg_17_1.duration_ = 9.433

		local var_17_0 = {
			zh = 9.433,
			ja = 6.133
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play410031005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 1.05

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[584].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_4")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_3 = arg_17_1:GetWordFromCfg(410031004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031004", "story_v_out_410031.awb") ~= 0 then
					local var_20_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031004", "story_v_out_410031.awb") / 1000

					if var_20_8 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_8 + var_20_0
					end

					if var_20_3.prefab_name ~= "" and arg_17_1.actors_[var_20_3.prefab_name] ~= nil then
						local var_20_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_3.prefab_name].transform, "story_v_out_410031", "410031004", "story_v_out_410031.awb")

						arg_17_1:RecordAudio("410031004", var_20_9)
						arg_17_1:RecordAudio("410031004", var_20_9)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_410031", "410031004", "story_v_out_410031.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_410031", "410031004", "story_v_out_410031.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_10 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_10 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_10

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_10 and arg_17_1.time_ < var_20_0 + var_20_10 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play410031005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 410031005
		arg_21_1.duration_ = 5.733

		local var_21_0 = {
			zh = 5.066,
			ja = 5.733
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
				arg_21_0:Play410031006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.575

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[584].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_1")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(410031005)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031005", "story_v_out_410031.awb") ~= 0 then
					local var_24_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031005", "story_v_out_410031.awb") / 1000

					if var_24_8 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_0
					end

					if var_24_3.prefab_name ~= "" and arg_21_1.actors_[var_24_3.prefab_name] ~= nil then
						local var_24_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_3.prefab_name].transform, "story_v_out_410031", "410031005", "story_v_out_410031.awb")

						arg_21_1:RecordAudio("410031005", var_24_9)
						arg_21_1:RecordAudio("410031005", var_24_9)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_410031", "410031005", "story_v_out_410031.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_410031", "410031005", "story_v_out_410031.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_10 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_10 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_10

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_10 and arg_21_1.time_ < var_24_0 + var_24_10 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play410031006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 410031006
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play410031007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.1

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_2 = arg_25_1:GetWordFromCfg(410031006)
				local var_28_3 = arg_25_1:FormatText(var_28_2.content)

				arg_25_1.text_.text = var_28_3

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_4 = 4
				local var_28_5 = utf8.len(var_28_3)
				local var_28_6 = var_28_4 <= 0 and var_28_1 or var_28_1 * (var_28_5 / var_28_4)

				if var_28_6 > 0 and var_28_1 < var_28_6 then
					arg_25_1.talkMaxDuration = var_28_6

					if var_28_6 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_6 + var_28_0
					end
				end

				arg_25_1.text_.text = var_28_3
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_7 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_7 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_7

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_7 and arg_25_1.time_ < var_28_0 + var_28_7 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play410031007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 410031007
		arg_29_1.duration_ = 5.933

		local var_29_0 = {
			zh = 5.933,
			ja = 5.9
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
				arg_29_0:Play410031008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.675

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[605].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1056_split_3")

				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(410031007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 27
				local var_32_6 = utf8.len(var_32_4)
				local var_32_7 = var_32_5 <= 0 and var_32_1 or var_32_1 * (var_32_6 / var_32_5)

				if var_32_7 > 0 and var_32_1 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_4
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031007", "story_v_out_410031.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031007", "story_v_out_410031.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_410031", "410031007", "story_v_out_410031.awb")

						arg_29_1:RecordAudio("410031007", var_32_9)
						arg_29_1:RecordAudio("410031007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_410031", "410031007", "story_v_out_410031.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_410031", "410031007", "story_v_out_410031.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_10 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_10 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_10

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_10 and arg_29_1.time_ < var_32_0 + var_32_10 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play410031008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 410031008
		arg_33_1.duration_ = 4.3

		local var_33_0 = {
			zh = 2.766,
			ja = 4.3
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
				arg_33_0:Play410031009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.275

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[584].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "1060_split_1_4")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(410031008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 11
				local var_36_6 = utf8.len(var_36_4)
				local var_36_7 = var_36_5 <= 0 and var_36_1 or var_36_1 * (var_36_6 / var_36_5)

				if var_36_7 > 0 and var_36_1 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_4
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031008", "story_v_out_410031.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031008", "story_v_out_410031.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_410031", "410031008", "story_v_out_410031.awb")

						arg_33_1:RecordAudio("410031008", var_36_9)
						arg_33_1:RecordAudio("410031008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_410031", "410031008", "story_v_out_410031.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_410031", "410031008", "story_v_out_410031.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play410031009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 410031009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play410031010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1.225

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_2 = arg_37_1:GetWordFromCfg(410031009)
				local var_40_3 = arg_37_1:FormatText(var_40_2.content)

				arg_37_1.text_.text = var_40_3

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_4 = 49
				local var_40_5 = utf8.len(var_40_3)
				local var_40_6 = var_40_4 <= 0 and var_40_1 or var_40_1 * (var_40_5 / var_40_4)

				if var_40_6 > 0 and var_40_1 < var_40_6 then
					arg_37_1.talkMaxDuration = var_40_6

					if var_40_6 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_6 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_3
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_7 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_7 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_7

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_7 and arg_37_1.time_ < var_40_0 + var_40_7 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play410031010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 410031010
		arg_41_1.duration_ = 6.999999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play410031011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = "ST61"

			if arg_41_1.bgs_[var_44_0] == nil then
				local var_44_1 = Object.Instantiate(arg_41_1.paintGo_)

				var_44_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_44_0)
				var_44_1.name = var_44_0
				var_44_1.transform.parent = arg_41_1.stage_.transform
				var_44_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.bgs_[var_44_0] = var_44_1
			end

			local var_44_2 = 0

			if var_44_2 < arg_41_1.time_ and arg_41_1.time_ <= var_44_2 + arg_44_0 then
				local var_44_3 = manager.ui.mainCamera.transform.localPosition
				local var_44_4 = Vector3.New(0, 0, 10) + Vector3.New(var_44_3.x, var_44_3.y, 0)
				local var_44_5 = arg_41_1.bgs_.ST61

				var_44_5.transform.localPosition = var_44_4
				var_44_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_6 = var_44_5:GetComponent("SpriteRenderer")

				if var_44_6 and var_44_6.sprite then
					local var_44_7 = (var_44_5.transform.localPosition - var_44_3).z
					local var_44_8 = manager.ui.mainCameraCom_
					local var_44_9 = 2 * var_44_7 * Mathf.Tan(var_44_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_10 = var_44_9 * var_44_8.aspect
					local var_44_11 = var_44_6.sprite.bounds.size.x
					local var_44_12 = var_44_6.sprite.bounds.size.y
					local var_44_13 = var_44_10 / var_44_11
					local var_44_14 = var_44_9 / var_44_12
					local var_44_15 = var_44_14 < var_44_13 and var_44_13 or var_44_14

					var_44_5.transform.localScale = Vector3.New(var_44_15, var_44_15, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "ST61" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_17 = 2

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17
				local var_44_19 = Color.New(0, 0, 0)

				var_44_19.a = Mathf.Lerp(1, 0, var_44_18)
				arg_41_1.mask_.color = var_44_19
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 then
				local var_44_20 = Color.New(0, 0, 0)
				local var_44_21 = 0

				arg_41_1.mask_.enabled = false
				var_44_20.a = var_44_21
				arg_41_1.mask_.color = var_44_20
			end

			local var_44_22 = 1.999999999999
			local var_44_23 = 1

			if var_44_22 < arg_41_1.time_ and arg_41_1.time_ <= var_44_22 + arg_44_0 then
				local var_44_24 = "play"
				local var_44_25 = "music"

				arg_41_1:AudioAction(var_44_24, var_44_25, "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism", "bgm_activity_2_8_story_meruism.awb")
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_26 = 1.999999999999
			local var_44_27 = 1.45

			if var_44_26 < arg_41_1.time_ and arg_41_1.time_ <= var_44_26 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_28 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_28:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_29 = arg_41_1:GetWordFromCfg(410031010)
				local var_44_30 = arg_41_1:FormatText(var_44_29.content)

				arg_41_1.text_.text = var_44_30

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_31 = 58
				local var_44_32 = utf8.len(var_44_30)
				local var_44_33 = var_44_31 <= 0 and var_44_27 or var_44_27 * (var_44_32 / var_44_31)

				if var_44_33 > 0 and var_44_27 < var_44_33 then
					arg_41_1.talkMaxDuration = var_44_33
					var_44_26 = var_44_26 + 0.3

					if var_44_33 + var_44_26 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_33 + var_44_26
					end
				end

				arg_41_1.text_.text = var_44_30
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_34 = var_44_26 + 0.3
			local var_44_35 = math.max(var_44_27, arg_41_1.talkMaxDuration)

			if var_44_34 <= arg_41_1.time_ and arg_41_1.time_ < var_44_34 + var_44_35 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_34) / var_44_35

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_34 + var_44_35 and arg_41_1.time_ < var_44_34 + var_44_35 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play410031011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410031011
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play410031012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.525

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(410031011)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 61
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410031012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410031012
		arg_51_1.duration_ = 9.4

		local var_51_0 = {
			zh = 7.266,
			ja = 9.4
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
				arg_51_0:Play410031013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "1056"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_54_0), arg_51_1.canvasGo_.transform)

				var_54_1.transform:SetSiblingIndex(1)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_51_1.actors_[var_54_0] = var_54_1
			end

			local var_54_2 = arg_51_1.actors_["1056"].transform
			local var_54_3 = 0

			if var_54_3 < arg_51_1.time_ and arg_51_1.time_ <= var_54_3 + arg_54_0 then
				arg_51_1.var_.moveOldPos1056 = var_54_2.localPosition
				var_54_2.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1056", 4)

				local var_54_4 = var_54_2.childCount

				for iter_54_0 = 0, var_54_4 - 1 do
					local var_54_5 = var_54_2:GetChild(iter_54_0)

					if var_54_5.name == "split_3" or not string.find(var_54_5.name, "split") then
						var_54_5.gameObject:SetActive(true)
					else
						var_54_5.gameObject:SetActive(false)
					end
				end
			end

			local var_54_6 = 0.001

			if var_54_3 <= arg_51_1.time_ and arg_51_1.time_ < var_54_3 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_3) / var_54_6
				local var_54_8 = Vector3.New(390, -350, -180)

				var_54_2.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1056, var_54_8, var_54_7)
			end

			if arg_51_1.time_ >= var_54_3 + var_54_6 and arg_51_1.time_ < var_54_3 + var_54_6 + arg_54_0 then
				var_54_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_54_9 = "1060"

			if arg_51_1.actors_[var_54_9] == nil then
				local var_54_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_54_9), arg_51_1.canvasGo_.transform)

				var_54_10.transform:SetSiblingIndex(1)

				var_54_10.name = var_54_9
				var_54_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_51_1.actors_[var_54_9] = var_54_10
			end

			local var_54_11 = arg_51_1.actors_["1060"].transform
			local var_54_12 = 0

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.var_.moveOldPos1060 = var_54_11.localPosition
				var_54_11.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1060", 2)

				local var_54_13 = var_54_11.childCount

				for iter_54_1 = 0, var_54_13 - 1 do
					local var_54_14 = var_54_11:GetChild(iter_54_1)

					if var_54_14.name == "split_1" or not string.find(var_54_14.name, "split") then
						var_54_14.gameObject:SetActive(true)
					else
						var_54_14.gameObject:SetActive(false)
					end
				end
			end

			local var_54_15 = 0.001

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_12) / var_54_15
				local var_54_17 = Vector3.New(-390, -435, -40)

				var_54_11.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1060, var_54_17, var_54_16)
			end

			if arg_51_1.time_ >= var_54_12 + var_54_15 and arg_51_1.time_ < var_54_12 + var_54_15 + arg_54_0 then
				var_54_11.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_54_18 = arg_51_1.actors_["1056"]
			local var_54_19 = 0

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 == nil then
				arg_51_1.var_.actorSpriteComps1056 = var_54_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_20 = 0.034

			if var_54_19 <= arg_51_1.time_ and arg_51_1.time_ < var_54_19 + var_54_20 then
				local var_54_21 = (arg_51_1.time_ - var_54_19) / var_54_20

				if arg_51_1.var_.actorSpriteComps1056 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_54_3 then
							local var_54_22 = Mathf.Lerp(iter_54_3.color.r, 1, var_54_21)

							iter_54_3.color = Color.New(var_54_22, var_54_22, var_54_22)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_19 + var_54_20 and arg_51_1.time_ < var_54_19 + var_54_20 + arg_54_0 and arg_51_1.var_.actorSpriteComps1056 then
				local var_54_23 = 1

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_23, var_54_23, var_54_23)
					end
				end

				arg_51_1.var_.actorSpriteComps1056 = nil
			end

			local var_54_24 = arg_51_1.actors_["1060"]
			local var_54_25 = 0

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 == nil then
				arg_51_1.var_.actorSpriteComps1060 = var_54_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_26 = 0.034

			if var_54_25 <= arg_51_1.time_ and arg_51_1.time_ < var_54_25 + var_54_26 then
				local var_54_27 = (arg_51_1.time_ - var_54_25) / var_54_26

				if arg_51_1.var_.actorSpriteComps1060 then
					for iter_54_6, iter_54_7 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_54_7 then
							local var_54_28 = Mathf.Lerp(iter_54_7.color.r, 0.5, var_54_27)

							iter_54_7.color = Color.New(var_54_28, var_54_28, var_54_28)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_25 + var_54_26 and arg_51_1.time_ < var_54_25 + var_54_26 + arg_54_0 and arg_51_1.var_.actorSpriteComps1060 then
				local var_54_29 = 0.5

				for iter_54_8, iter_54_9 in pairs(arg_51_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_54_9 then
						iter_54_9.color = Color.New(var_54_29, var_54_29, var_54_29)
					end
				end

				arg_51_1.var_.actorSpriteComps1060 = nil
			end

			local var_54_30 = 0
			local var_54_31 = 0.75

			if var_54_30 < arg_51_1.time_ and arg_51_1.time_ <= var_54_30 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_32 = arg_51_1:FormatText(StoryNameCfg[605].name)

				arg_51_1.leftNameTxt_.text = var_54_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_33 = arg_51_1:GetWordFromCfg(410031012)
				local var_54_34 = arg_51_1:FormatText(var_54_33.content)

				arg_51_1.text_.text = var_54_34

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_35 = 30
				local var_54_36 = utf8.len(var_54_34)
				local var_54_37 = var_54_35 <= 0 and var_54_31 or var_54_31 * (var_54_36 / var_54_35)

				if var_54_37 > 0 and var_54_31 < var_54_37 then
					arg_51_1.talkMaxDuration = var_54_37

					if var_54_37 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_37 + var_54_30
					end
				end

				arg_51_1.text_.text = var_54_34
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031012", "story_v_out_410031.awb") ~= 0 then
					local var_54_38 = manager.audio:GetVoiceLength("story_v_out_410031", "410031012", "story_v_out_410031.awb") / 1000

					if var_54_38 + var_54_30 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_38 + var_54_30
					end

					if var_54_33.prefab_name ~= "" and arg_51_1.actors_[var_54_33.prefab_name] ~= nil then
						local var_54_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_33.prefab_name].transform, "story_v_out_410031", "410031012", "story_v_out_410031.awb")

						arg_51_1:RecordAudio("410031012", var_54_39)
						arg_51_1:RecordAudio("410031012", var_54_39)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410031", "410031012", "story_v_out_410031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410031", "410031012", "story_v_out_410031.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_40 = math.max(var_54_31, arg_51_1.talkMaxDuration)

			if var_54_30 <= arg_51_1.time_ and arg_51_1.time_ < var_54_30 + var_54_40 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_30) / var_54_40

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_30 + var_54_40 and arg_51_1.time_ < var_54_30 + var_54_40 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410031013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410031013
		arg_55_1.duration_ = 13.9

		local var_55_0 = {
			zh = 9.2,
			ja = 13.9
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
				arg_55_0:Play410031014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1060"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1060 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("1060", 2)

				local var_58_2 = var_58_0.childCount

				for iter_58_0 = 0, var_58_2 - 1 do
					local var_58_3 = var_58_0:GetChild(iter_58_0)

					if var_58_3.name == "split_4" or not string.find(var_58_3.name, "split") then
						var_58_3.gameObject:SetActive(true)
					else
						var_58_3.gameObject:SetActive(false)
					end
				end
			end

			local var_58_4 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_1) / var_58_4
				local var_58_6 = Vector3.New(-390, -435, -40)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1060, var_58_6, var_58_5)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_4 and arg_55_1.time_ < var_58_1 + var_58_4 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_58_7 = arg_55_1.actors_["1060"]
			local var_58_8 = 0

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 == nil then
				arg_55_1.var_.actorSpriteComps1060 = var_58_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_9 = 0.034

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_8) / var_58_9

				if arg_55_1.var_.actorSpriteComps1060 then
					for iter_58_1, iter_58_2 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_58_2 then
							local var_58_11 = Mathf.Lerp(iter_58_2.color.r, 1, var_58_10)

							iter_58_2.color = Color.New(var_58_11, var_58_11, var_58_11)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_8 + var_58_9 and arg_55_1.time_ < var_58_8 + var_58_9 + arg_58_0 and arg_55_1.var_.actorSpriteComps1060 then
				local var_58_12 = 1

				for iter_58_3, iter_58_4 in pairs(arg_55_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_58_4 then
						iter_58_4.color = Color.New(var_58_12, var_58_12, var_58_12)
					end
				end

				arg_55_1.var_.actorSpriteComps1060 = nil
			end

			local var_58_13 = arg_55_1.actors_["1056"]
			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 == nil then
				arg_55_1.var_.actorSpriteComps1056 = var_58_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_15 = 0.034

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15

				if arg_55_1.var_.actorSpriteComps1056 then
					for iter_58_5, iter_58_6 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_58_6 then
							local var_58_17 = Mathf.Lerp(iter_58_6.color.r, 0.5, var_58_16)

							iter_58_6.color = Color.New(var_58_17, var_58_17, var_58_17)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 and arg_55_1.var_.actorSpriteComps1056 then
				local var_58_18 = 0.5

				for iter_58_7, iter_58_8 in pairs(arg_55_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_58_8 then
						iter_58_8.color = Color.New(var_58_18, var_58_18, var_58_18)
					end
				end

				arg_55_1.var_.actorSpriteComps1056 = nil
			end

			local var_58_19 = 0
			local var_58_20 = 1.025

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_21 = arg_55_1:FormatText(StoryNameCfg[584].name)

				arg_55_1.leftNameTxt_.text = var_58_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_22 = arg_55_1:GetWordFromCfg(410031013)
				local var_58_23 = arg_55_1:FormatText(var_58_22.content)

				arg_55_1.text_.text = var_58_23

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_24 = 41
				local var_58_25 = utf8.len(var_58_23)
				local var_58_26 = var_58_24 <= 0 and var_58_20 or var_58_20 * (var_58_25 / var_58_24)

				if var_58_26 > 0 and var_58_20 < var_58_26 then
					arg_55_1.talkMaxDuration = var_58_26

					if var_58_26 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_26 + var_58_19
					end
				end

				arg_55_1.text_.text = var_58_23
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031013", "story_v_out_410031.awb") ~= 0 then
					local var_58_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031013", "story_v_out_410031.awb") / 1000

					if var_58_27 + var_58_19 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_27 + var_58_19
					end

					if var_58_22.prefab_name ~= "" and arg_55_1.actors_[var_58_22.prefab_name] ~= nil then
						local var_58_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_22.prefab_name].transform, "story_v_out_410031", "410031013", "story_v_out_410031.awb")

						arg_55_1:RecordAudio("410031013", var_58_28)
						arg_55_1:RecordAudio("410031013", var_58_28)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_410031", "410031013", "story_v_out_410031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_410031", "410031013", "story_v_out_410031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_29 = math.max(var_58_20, arg_55_1.talkMaxDuration)

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_29 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_19) / var_58_29

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_19 + var_58_29 and arg_55_1.time_ < var_58_19 + var_58_29 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410031014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410031014
		arg_59_1.duration_ = 4.666

		local var_59_0 = {
			zh = 1.566,
			ja = 4.666
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
				arg_59_0:Play410031015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1056"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1056 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1056", 4)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_3" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(390, -350, -180)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1056, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_62_7 = arg_59_1.actors_["1056"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 == nil then
				arg_59_1.var_.actorSpriteComps1056 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.034

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps1056 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps1056 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps1056 = nil
			end

			local var_62_13 = arg_59_1.actors_["1060"]
			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 == nil then
				arg_59_1.var_.actorSpriteComps1060 = var_62_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_15 = 0.034

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15

				if arg_59_1.var_.actorSpriteComps1060 then
					for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_62_6 then
							local var_62_17 = Mathf.Lerp(iter_62_6.color.r, 0.5, var_62_16)

							iter_62_6.color = Color.New(var_62_17, var_62_17, var_62_17)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps1060 then
				local var_62_18 = 0.5

				for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_62_8 then
						iter_62_8.color = Color.New(var_62_18, var_62_18, var_62_18)
					end
				end

				arg_59_1.var_.actorSpriteComps1060 = nil
			end

			local var_62_19 = 0
			local var_62_20 = 0.175

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[605].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(410031014)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 7
				local var_62_25 = utf8.len(var_62_23)
				local var_62_26 = var_62_24 <= 0 and var_62_20 or var_62_20 * (var_62_25 / var_62_24)

				if var_62_26 > 0 and var_62_20 < var_62_26 then
					arg_59_1.talkMaxDuration = var_62_26

					if var_62_26 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_26 + var_62_19
					end
				end

				arg_59_1.text_.text = var_62_23
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031014", "story_v_out_410031.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031014", "story_v_out_410031.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_410031", "410031014", "story_v_out_410031.awb")

						arg_59_1:RecordAudio("410031014", var_62_28)
						arg_59_1:RecordAudio("410031014", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_410031", "410031014", "story_v_out_410031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_410031", "410031014", "story_v_out_410031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_29 = math.max(var_62_20, arg_59_1.talkMaxDuration)

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_29 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_19) / var_62_29

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_19 + var_62_29 and arg_59_1.time_ < var_62_19 + var_62_29 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play410031015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410031015
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play410031016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1056"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 == nil then
				arg_63_1.var_.actorSpriteComps1056 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.034

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps1056 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 0.5, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps1056 then
				local var_66_5 = 0.5

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps1056 = nil
			end

			local var_66_6 = arg_63_1.actors_["1060"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 == nil then
				arg_63_1.var_.actorSpriteComps1060 = var_66_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_8 = 0.034

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.actorSpriteComps1060 then
					for iter_66_4, iter_66_5 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_66_5 then
							local var_66_10 = Mathf.Lerp(iter_66_5.color.r, 0.5, var_66_9)

							iter_66_5.color = Color.New(var_66_10, var_66_10, var_66_10)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps1060 then
				local var_66_11 = 0.5

				for iter_66_6, iter_66_7 in pairs(arg_63_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_66_7 then
						iter_66_7.color = Color.New(var_66_11, var_66_11, var_66_11)
					end
				end

				arg_63_1.var_.actorSpriteComps1060 = nil
			end

			local var_66_12 = 0
			local var_66_13 = 1.25

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(410031015)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 50
				local var_66_17 = utf8.len(var_66_15)
				local var_66_18 = var_66_16 <= 0 and var_66_13 or var_66_13 * (var_66_17 / var_66_16)

				if var_66_18 > 0 and var_66_13 < var_66_18 then
					arg_63_1.talkMaxDuration = var_66_18

					if var_66_18 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_15
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_19 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_19 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_19

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_19 and arg_63_1.time_ < var_66_12 + var_66_19 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410031016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410031016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play410031017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.475

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(410031016)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 59
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410031017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410031017
		arg_71_1.duration_ = 8.4

		local var_71_0 = {
			zh = 5.833,
			ja = 8.4
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
				arg_71_0:Play410031018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1060"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1060 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1060", 2)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_4" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(-390, -435, -40)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1060, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_74_7 = arg_71_1.actors_["1060"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 == nil then
				arg_71_1.var_.actorSpriteComps1060 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.034

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1060 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1060 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1060 = nil
			end

			local var_74_13 = 0
			local var_74_14 = 0.675

			if var_74_13 < arg_71_1.time_ and arg_71_1.time_ <= var_74_13 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[584].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(410031017)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 27
				local var_74_19 = utf8.len(var_74_17)
				local var_74_20 = var_74_18 <= 0 and var_74_14 or var_74_14 * (var_74_19 / var_74_18)

				if var_74_20 > 0 and var_74_14 < var_74_20 then
					arg_71_1.talkMaxDuration = var_74_20

					if var_74_20 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_13
					end
				end

				arg_71_1.text_.text = var_74_17
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031017", "story_v_out_410031.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031017", "story_v_out_410031.awb") / 1000

					if var_74_21 + var_74_13 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_13
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_410031", "410031017", "story_v_out_410031.awb")

						arg_71_1:RecordAudio("410031017", var_74_22)
						arg_71_1:RecordAudio("410031017", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_410031", "410031017", "story_v_out_410031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_410031", "410031017", "story_v_out_410031.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = math.max(var_74_14, arg_71_1.talkMaxDuration)

			if var_74_13 <= arg_71_1.time_ and arg_71_1.time_ < var_74_13 + var_74_23 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_13) / var_74_23

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_13 + var_74_23 and arg_71_1.time_ < var_74_13 + var_74_23 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410031018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410031018
		arg_75_1.duration_ = 7.4

		local var_75_0 = {
			zh = 7.4,
			ja = 5
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
				arg_75_0:Play410031019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1056"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1056 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1056", 4)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_3" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(390, -350, -180)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1056, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_78_7 = arg_75_1.actors_["1056"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1056 == nil then
				arg_75_1.var_.actorSpriteComps1056 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps1056 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps1056 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps1056 = nil
			end

			local var_78_13 = arg_75_1.actors_["1060"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 == nil then
				arg_75_1.var_.actorSpriteComps1060 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps1060 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 0.5, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps1060 then
				local var_78_18 = 0.5

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps1060 = nil
			end

			local var_78_19 = 0
			local var_78_20 = 0.95

			if var_78_19 < arg_75_1.time_ and arg_75_1.time_ <= var_78_19 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_21 = arg_75_1:FormatText(StoryNameCfg[605].name)

				arg_75_1.leftNameTxt_.text = var_78_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_22 = arg_75_1:GetWordFromCfg(410031018)
				local var_78_23 = arg_75_1:FormatText(var_78_22.content)

				arg_75_1.text_.text = var_78_23

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_24 = 38
				local var_78_25 = utf8.len(var_78_23)
				local var_78_26 = var_78_24 <= 0 and var_78_20 or var_78_20 * (var_78_25 / var_78_24)

				if var_78_26 > 0 and var_78_20 < var_78_26 then
					arg_75_1.talkMaxDuration = var_78_26

					if var_78_26 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_26 + var_78_19
					end
				end

				arg_75_1.text_.text = var_78_23
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031018", "story_v_out_410031.awb") ~= 0 then
					local var_78_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031018", "story_v_out_410031.awb") / 1000

					if var_78_27 + var_78_19 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_27 + var_78_19
					end

					if var_78_22.prefab_name ~= "" and arg_75_1.actors_[var_78_22.prefab_name] ~= nil then
						local var_78_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_22.prefab_name].transform, "story_v_out_410031", "410031018", "story_v_out_410031.awb")

						arg_75_1:RecordAudio("410031018", var_78_28)
						arg_75_1:RecordAudio("410031018", var_78_28)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410031", "410031018", "story_v_out_410031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410031", "410031018", "story_v_out_410031.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_29 = math.max(var_78_20, arg_75_1.talkMaxDuration)

			if var_78_19 <= arg_75_1.time_ and arg_75_1.time_ < var_78_19 + var_78_29 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_19) / var_78_29

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_19 + var_78_29 and arg_75_1.time_ < var_78_19 + var_78_29 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410031019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410031019
		arg_79_1.duration_ = 13.6

		local var_79_0 = {
			zh = 7.333,
			ja = 13.6
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
				arg_79_0:Play410031020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1056"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1056 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("1056", 4)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(390, -350, -180)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1056, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_82_7 = arg_79_1.actors_["1056"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps1056 == nil then
				arg_79_1.var_.actorSpriteComps1056 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps1056 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps1056 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps1056 = nil
			end

			local var_82_13 = 0
			local var_82_14 = 0.8

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_15 = arg_79_1:FormatText(StoryNameCfg[605].name)

				arg_79_1.leftNameTxt_.text = var_82_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_16 = arg_79_1:GetWordFromCfg(410031019)
				local var_82_17 = arg_79_1:FormatText(var_82_16.content)

				arg_79_1.text_.text = var_82_17

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_18 = 32
				local var_82_19 = utf8.len(var_82_17)
				local var_82_20 = var_82_18 <= 0 and var_82_14 or var_82_14 * (var_82_19 / var_82_18)

				if var_82_20 > 0 and var_82_14 < var_82_20 then
					arg_79_1.talkMaxDuration = var_82_20

					if var_82_20 + var_82_13 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_13
					end
				end

				arg_79_1.text_.text = var_82_17
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031019", "story_v_out_410031.awb") ~= 0 then
					local var_82_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031019", "story_v_out_410031.awb") / 1000

					if var_82_21 + var_82_13 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_13
					end

					if var_82_16.prefab_name ~= "" and arg_79_1.actors_[var_82_16.prefab_name] ~= nil then
						local var_82_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_16.prefab_name].transform, "story_v_out_410031", "410031019", "story_v_out_410031.awb")

						arg_79_1:RecordAudio("410031019", var_82_22)
						arg_79_1:RecordAudio("410031019", var_82_22)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410031", "410031019", "story_v_out_410031.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410031", "410031019", "story_v_out_410031.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_23 = math.max(var_82_14, arg_79_1.talkMaxDuration)

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_23 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_13) / var_82_23

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_13 + var_82_23 and arg_79_1.time_ < var_82_13 + var_82_23 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410031020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410031020
		arg_83_1.duration_ = 4.933

		local var_83_0 = {
			zh = 4.366,
			ja = 4.933
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
				arg_83_0:Play410031021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1056"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1056 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1056", 4)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_1" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(390, -350, -180)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1056, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_86_7 = arg_83_1.actors_["1056"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 == nil then
				arg_83_1.var_.actorSpriteComps1056 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1056 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1056 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1056 = nil
			end

			local var_86_13 = 0
			local var_86_14 = 0.625

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_15 = arg_83_1:FormatText(StoryNameCfg[605].name)

				arg_83_1.leftNameTxt_.text = var_86_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_16 = arg_83_1:GetWordFromCfg(410031020)
				local var_86_17 = arg_83_1:FormatText(var_86_16.content)

				arg_83_1.text_.text = var_86_17

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_18 = 25
				local var_86_19 = utf8.len(var_86_17)
				local var_86_20 = var_86_18 <= 0 and var_86_14 or var_86_14 * (var_86_19 / var_86_18)

				if var_86_20 > 0 and var_86_14 < var_86_20 then
					arg_83_1.talkMaxDuration = var_86_20

					if var_86_20 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_13
					end
				end

				arg_83_1.text_.text = var_86_17
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031020", "story_v_out_410031.awb") ~= 0 then
					local var_86_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031020", "story_v_out_410031.awb") / 1000

					if var_86_21 + var_86_13 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_13
					end

					if var_86_16.prefab_name ~= "" and arg_83_1.actors_[var_86_16.prefab_name] ~= nil then
						local var_86_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_16.prefab_name].transform, "story_v_out_410031", "410031020", "story_v_out_410031.awb")

						arg_83_1:RecordAudio("410031020", var_86_22)
						arg_83_1:RecordAudio("410031020", var_86_22)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410031", "410031020", "story_v_out_410031.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410031", "410031020", "story_v_out_410031.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_23 = math.max(var_86_14, arg_83_1.talkMaxDuration)

			if var_86_13 <= arg_83_1.time_ and arg_83_1.time_ < var_86_13 + var_86_23 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_13) / var_86_23

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_13 + var_86_23 and arg_83_1.time_ < var_86_13 + var_86_23 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410031021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410031021
		arg_87_1.duration_ = 5.4

		local var_87_0 = {
			zh = 3.966,
			ja = 5.4
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
				arg_87_0:Play410031022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1060"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1060 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("1060", 2)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "split_2" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(-390, -435, -40)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1060, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_90_7 = arg_87_1.actors_["1060"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 == nil then
				arg_87_1.var_.actorSpriteComps1060 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps1060 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps1060 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps1060 = nil
			end

			local var_90_13 = arg_87_1.actors_["1056"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 == nil then
				arg_87_1.var_.actorSpriteComps1056 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps1056 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps1056 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps1056 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.45

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[584].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410031021)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 18
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031021", "story_v_out_410031.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031021", "story_v_out_410031.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410031", "410031021", "story_v_out_410031.awb")

						arg_87_1:RecordAudio("410031021", var_90_28)
						arg_87_1:RecordAudio("410031021", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410031", "410031021", "story_v_out_410031.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410031", "410031021", "story_v_out_410031.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410031022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410031022
		arg_91_1.duration_ = 11.766

		local var_91_0 = {
			zh = 8.133,
			ja = 11.766
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
				arg_91_0:Play410031023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1060"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1060 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1060", 2)

				local var_94_2 = var_94_0.childCount

				for iter_94_0 = 0, var_94_2 - 1 do
					local var_94_3 = var_94_0:GetChild(iter_94_0)

					if var_94_3.name == "split_2" or not string.find(var_94_3.name, "split") then
						var_94_3.gameObject:SetActive(true)
					else
						var_94_3.gameObject:SetActive(false)
					end
				end
			end

			local var_94_4 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_4 then
				local var_94_5 = (arg_91_1.time_ - var_94_1) / var_94_4
				local var_94_6 = Vector3.New(-390, -435, -40)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1060, var_94_6, var_94_5)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_4 and arg_91_1.time_ < var_94_1 + var_94_4 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_94_7 = arg_91_1.actors_["1060"]
			local var_94_8 = 0

			if var_94_8 < arg_91_1.time_ and arg_91_1.time_ <= var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 == nil then
				arg_91_1.var_.actorSpriteComps1060 = var_94_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_9 = 0.034

			if var_94_8 <= arg_91_1.time_ and arg_91_1.time_ < var_94_8 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_8) / var_94_9

				if arg_91_1.var_.actorSpriteComps1060 then
					for iter_94_1, iter_94_2 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_94_2 then
							local var_94_11 = Mathf.Lerp(iter_94_2.color.r, 1, var_94_10)

							iter_94_2.color = Color.New(var_94_11, var_94_11, var_94_11)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_8 + var_94_9 and arg_91_1.time_ < var_94_8 + var_94_9 + arg_94_0 and arg_91_1.var_.actorSpriteComps1060 then
				local var_94_12 = 1

				for iter_94_3, iter_94_4 in pairs(arg_91_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_94_4 then
						iter_94_4.color = Color.New(var_94_12, var_94_12, var_94_12)
					end
				end

				arg_91_1.var_.actorSpriteComps1060 = nil
			end

			local var_94_13 = 0
			local var_94_14 = 1.025

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_15 = arg_91_1:FormatText(StoryNameCfg[584].name)

				arg_91_1.leftNameTxt_.text = var_94_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_16 = arg_91_1:GetWordFromCfg(410031022)
				local var_94_17 = arg_91_1:FormatText(var_94_16.content)

				arg_91_1.text_.text = var_94_17

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_18 = 41
				local var_94_19 = utf8.len(var_94_17)
				local var_94_20 = var_94_18 <= 0 and var_94_14 or var_94_14 * (var_94_19 / var_94_18)

				if var_94_20 > 0 and var_94_14 < var_94_20 then
					arg_91_1.talkMaxDuration = var_94_20

					if var_94_20 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_13
					end
				end

				arg_91_1.text_.text = var_94_17
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031022", "story_v_out_410031.awb") ~= 0 then
					local var_94_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031022", "story_v_out_410031.awb") / 1000

					if var_94_21 + var_94_13 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_13
					end

					if var_94_16.prefab_name ~= "" and arg_91_1.actors_[var_94_16.prefab_name] ~= nil then
						local var_94_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_16.prefab_name].transform, "story_v_out_410031", "410031022", "story_v_out_410031.awb")

						arg_91_1:RecordAudio("410031022", var_94_22)
						arg_91_1:RecordAudio("410031022", var_94_22)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410031", "410031022", "story_v_out_410031.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410031", "410031022", "story_v_out_410031.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_23 = math.max(var_94_14, arg_91_1.talkMaxDuration)

			if var_94_13 <= arg_91_1.time_ and arg_91_1.time_ < var_94_13 + var_94_23 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_13) / var_94_23

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_13 + var_94_23 and arg_91_1.time_ < var_94_13 + var_94_23 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410031023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410031023
		arg_95_1.duration_ = 2.533

		local var_95_0 = {
			zh = 1.333,
			ja = 2.533
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
				arg_95_0:Play410031024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1056"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1056 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("1056", 4)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_1" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(390, -350, -180)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1056, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_98_7 = arg_95_1.actors_["1056"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 == nil then
				arg_95_1.var_.actorSpriteComps1056 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.034

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps1056 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps1056 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps1056 = nil
			end

			local var_98_13 = arg_95_1.actors_["1060"]
			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 == nil then
				arg_95_1.var_.actorSpriteComps1060 = var_98_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_15 = 0.034

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_15 then
				local var_98_16 = (arg_95_1.time_ - var_98_14) / var_98_15

				if arg_95_1.var_.actorSpriteComps1060 then
					for iter_98_5, iter_98_6 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_98_6 then
							local var_98_17 = Mathf.Lerp(iter_98_6.color.r, 0.5, var_98_16)

							iter_98_6.color = Color.New(var_98_17, var_98_17, var_98_17)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_14 + var_98_15 and arg_95_1.time_ < var_98_14 + var_98_15 + arg_98_0 and arg_95_1.var_.actorSpriteComps1060 then
				local var_98_18 = 0.5

				for iter_98_7, iter_98_8 in pairs(arg_95_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_98_8 then
						iter_98_8.color = Color.New(var_98_18, var_98_18, var_98_18)
					end
				end

				arg_95_1.var_.actorSpriteComps1060 = nil
			end

			local var_98_19 = 0
			local var_98_20 = 0.15

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_21 = arg_95_1:FormatText(StoryNameCfg[605].name)

				arg_95_1.leftNameTxt_.text = var_98_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_22 = arg_95_1:GetWordFromCfg(410031023)
				local var_98_23 = arg_95_1:FormatText(var_98_22.content)

				arg_95_1.text_.text = var_98_23

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_24 = 6
				local var_98_25 = utf8.len(var_98_23)
				local var_98_26 = var_98_24 <= 0 and var_98_20 or var_98_20 * (var_98_25 / var_98_24)

				if var_98_26 > 0 and var_98_20 < var_98_26 then
					arg_95_1.talkMaxDuration = var_98_26

					if var_98_26 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_26 + var_98_19
					end
				end

				arg_95_1.text_.text = var_98_23
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031023", "story_v_out_410031.awb") ~= 0 then
					local var_98_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031023", "story_v_out_410031.awb") / 1000

					if var_98_27 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_19
					end

					if var_98_22.prefab_name ~= "" and arg_95_1.actors_[var_98_22.prefab_name] ~= nil then
						local var_98_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_22.prefab_name].transform, "story_v_out_410031", "410031023", "story_v_out_410031.awb")

						arg_95_1:RecordAudio("410031023", var_98_28)
						arg_95_1:RecordAudio("410031023", var_98_28)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_410031", "410031023", "story_v_out_410031.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_410031", "410031023", "story_v_out_410031.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_29 = math.max(var_98_20, arg_95_1.talkMaxDuration)

			if var_98_19 <= arg_95_1.time_ and arg_95_1.time_ < var_98_19 + var_98_29 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_19) / var_98_29

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_19 + var_98_29 and arg_95_1.time_ < var_98_19 + var_98_29 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410031024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410031024
		arg_99_1.duration_ = 8.266

		local var_99_0 = {
			zh = 7.833,
			ja = 8.266
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
				arg_99_0:Play410031025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1060"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1060 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("1060", 2)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(-390, -435, -40)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1060, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_102_7 = arg_99_1.actors_["1060"]
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 == nil then
				arg_99_1.var_.actorSpriteComps1060 = var_102_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_9 = 0.034

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_8) / var_102_9

				if arg_99_1.var_.actorSpriteComps1060 then
					for iter_102_1, iter_102_2 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_102_2 then
							local var_102_11 = Mathf.Lerp(iter_102_2.color.r, 1, var_102_10)

							iter_102_2.color = Color.New(var_102_11, var_102_11, var_102_11)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_8 + var_102_9 and arg_99_1.time_ < var_102_8 + var_102_9 + arg_102_0 and arg_99_1.var_.actorSpriteComps1060 then
				local var_102_12 = 1

				for iter_102_3, iter_102_4 in pairs(arg_99_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_102_4 then
						iter_102_4.color = Color.New(var_102_12, var_102_12, var_102_12)
					end
				end

				arg_99_1.var_.actorSpriteComps1060 = nil
			end

			local var_102_13 = arg_99_1.actors_["1056"]
			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 and arg_99_1.var_.actorSpriteComps1056 == nil then
				arg_99_1.var_.actorSpriteComps1056 = var_102_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_15 = 0.034

			if var_102_14 <= arg_99_1.time_ and arg_99_1.time_ < var_102_14 + var_102_15 then
				local var_102_16 = (arg_99_1.time_ - var_102_14) / var_102_15

				if arg_99_1.var_.actorSpriteComps1056 then
					for iter_102_5, iter_102_6 in pairs(arg_99_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_102_6 then
							local var_102_17 = Mathf.Lerp(iter_102_6.color.r, 0.5, var_102_16)

							iter_102_6.color = Color.New(var_102_17, var_102_17, var_102_17)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_14 + var_102_15 and arg_99_1.time_ < var_102_14 + var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps1056 then
				local var_102_18 = 0.5

				for iter_102_7, iter_102_8 in pairs(arg_99_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_102_8 then
						iter_102_8.color = Color.New(var_102_18, var_102_18, var_102_18)
					end
				end

				arg_99_1.var_.actorSpriteComps1056 = nil
			end

			local var_102_19 = 0
			local var_102_20 = 0.975

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[584].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(410031024)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 39
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031024", "story_v_out_410031.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_410031", "410031024", "story_v_out_410031.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_410031", "410031024", "story_v_out_410031.awb")

						arg_99_1:RecordAudio("410031024", var_102_28)
						arg_99_1:RecordAudio("410031024", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_410031", "410031024", "story_v_out_410031.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_410031", "410031024", "story_v_out_410031.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play410031025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410031025
		arg_103_1.duration_ = 12.166

		local var_103_0 = {
			zh = 8.533,
			ja = 12.166
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
				arg_103_0:Play410031026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1060"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1060 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("1060", 2)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(-390, -435, -40)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1060, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_106_7 = arg_103_1.actors_["1060"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 == nil then
				arg_103_1.var_.actorSpriteComps1060 = var_106_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_9 = 0.034

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.actorSpriteComps1060 then
					for iter_106_1, iter_106_2 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_106_2 then
							local var_106_11 = Mathf.Lerp(iter_106_2.color.r, 1, var_106_10)

							iter_106_2.color = Color.New(var_106_11, var_106_11, var_106_11)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.actorSpriteComps1060 then
				local var_106_12 = 1

				for iter_106_3, iter_106_4 in pairs(arg_103_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_106_4 then
						iter_106_4.color = Color.New(var_106_12, var_106_12, var_106_12)
					end
				end

				arg_103_1.var_.actorSpriteComps1060 = nil
			end

			local var_106_13 = 0
			local var_106_14 = 0.875

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_15 = arg_103_1:FormatText(StoryNameCfg[584].name)

				arg_103_1.leftNameTxt_.text = var_106_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_16 = arg_103_1:GetWordFromCfg(410031025)
				local var_106_17 = arg_103_1:FormatText(var_106_16.content)

				arg_103_1.text_.text = var_106_17

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_18 = 35
				local var_106_19 = utf8.len(var_106_17)
				local var_106_20 = var_106_18 <= 0 and var_106_14 or var_106_14 * (var_106_19 / var_106_18)

				if var_106_20 > 0 and var_106_14 < var_106_20 then
					arg_103_1.talkMaxDuration = var_106_20

					if var_106_20 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_20 + var_106_13
					end
				end

				arg_103_1.text_.text = var_106_17
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031025", "story_v_out_410031.awb") ~= 0 then
					local var_106_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031025", "story_v_out_410031.awb") / 1000

					if var_106_21 + var_106_13 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_21 + var_106_13
					end

					if var_106_16.prefab_name ~= "" and arg_103_1.actors_[var_106_16.prefab_name] ~= nil then
						local var_106_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_16.prefab_name].transform, "story_v_out_410031", "410031025", "story_v_out_410031.awb")

						arg_103_1:RecordAudio("410031025", var_106_22)
						arg_103_1:RecordAudio("410031025", var_106_22)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_410031", "410031025", "story_v_out_410031.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_410031", "410031025", "story_v_out_410031.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_23 = math.max(var_106_14, arg_103_1.talkMaxDuration)

			if var_106_13 <= arg_103_1.time_ and arg_103_1.time_ < var_106_13 + var_106_23 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_13) / var_106_23

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_13 + var_106_23 and arg_103_1.time_ < var_106_13 + var_106_23 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410031026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410031026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play410031027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1056"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.actorSpriteComps1056 == nil then
				arg_107_1.var_.actorSpriteComps1056 = var_110_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_2 = 0.034

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.actorSpriteComps1056 then
					for iter_110_0, iter_110_1 in pairs(arg_107_1.var_.actorSpriteComps1056:ToTable()) do
						if iter_110_1 then
							local var_110_4 = Mathf.Lerp(iter_110_1.color.r, 0.5, var_110_3)

							iter_110_1.color = Color.New(var_110_4, var_110_4, var_110_4)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.actorSpriteComps1056 then
				local var_110_5 = 0.5

				for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps1056:ToTable()) do
					if iter_110_3 then
						iter_110_3.color = Color.New(var_110_5, var_110_5, var_110_5)
					end
				end

				arg_107_1.var_.actorSpriteComps1056 = nil
			end

			local var_110_6 = arg_107_1.actors_["1060"]
			local var_110_7 = 0

			if var_110_7 < arg_107_1.time_ and arg_107_1.time_ <= var_110_7 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 == nil then
				arg_107_1.var_.actorSpriteComps1060 = var_110_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_8 = 0.034

			if var_110_7 <= arg_107_1.time_ and arg_107_1.time_ < var_110_7 + var_110_8 then
				local var_110_9 = (arg_107_1.time_ - var_110_7) / var_110_8

				if arg_107_1.var_.actorSpriteComps1060 then
					for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_110_5 then
							local var_110_10 = Mathf.Lerp(iter_110_5.color.r, 0.5, var_110_9)

							iter_110_5.color = Color.New(var_110_10, var_110_10, var_110_10)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_7 + var_110_8 and arg_107_1.time_ < var_110_7 + var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1060 then
				local var_110_11 = 0.5

				for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_110_7 then
						iter_110_7.color = Color.New(var_110_11, var_110_11, var_110_11)
					end
				end

				arg_107_1.var_.actorSpriteComps1060 = nil
			end

			local var_110_12 = arg_107_1.actors_["1056"].transform
			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1.var_.moveOldPos1056 = var_110_12.localPosition
				var_110_12.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1056", 4)

				local var_110_14 = var_110_12.childCount

				for iter_110_8 = 0, var_110_14 - 1 do
					local var_110_15 = var_110_12:GetChild(iter_110_8)

					if var_110_15.name == "split_3" or not string.find(var_110_15.name, "split") then
						var_110_15.gameObject:SetActive(true)
					else
						var_110_15.gameObject:SetActive(false)
					end
				end
			end

			local var_110_16 = 0.001

			if var_110_13 <= arg_107_1.time_ and arg_107_1.time_ < var_110_13 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_13) / var_110_16
				local var_110_18 = Vector3.New(390, -350, -180)

				var_110_12.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1056, var_110_18, var_110_17)
			end

			if arg_107_1.time_ >= var_110_13 + var_110_16 and arg_107_1.time_ < var_110_13 + var_110_16 + arg_110_0 then
				var_110_12.localPosition = Vector3.New(390, -350, -180)
			end

			local var_110_19 = 0
			local var_110_20 = 0.275

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_21 = arg_107_1:GetWordFromCfg(410031026)
				local var_110_22 = arg_107_1:FormatText(var_110_21.content)

				arg_107_1.text_.text = var_110_22

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_23 = 11
				local var_110_24 = utf8.len(var_110_22)
				local var_110_25 = var_110_23 <= 0 and var_110_20 or var_110_20 * (var_110_24 / var_110_23)

				if var_110_25 > 0 and var_110_20 < var_110_25 then
					arg_107_1.talkMaxDuration = var_110_25

					if var_110_25 + var_110_19 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_25 + var_110_19
					end
				end

				arg_107_1.text_.text = var_110_22
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_26 = math.max(var_110_20, arg_107_1.talkMaxDuration)

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_26 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_19) / var_110_26

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_19 + var_110_26 and arg_107_1.time_ < var_110_19 + var_110_26 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play410031027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410031027
		arg_111_1.duration_ = 8.6

		local var_111_0 = {
			zh = 2.4,
			ja = 8.6
		}
		local var_111_1 = manager.audio:GetLocalizationFlag()

		if var_111_0[var_111_1] ~= nil then
			arg_111_1.duration_ = var_111_0[var_111_1]
		end

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play410031028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1060"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1060 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1060", 2)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(-390, -435, -40)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1060, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -435, -40)
			end

			local var_114_7 = arg_111_1.actors_["1060"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 == nil then
				arg_111_1.var_.actorSpriteComps1060 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps1060 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps1060 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps1060 = nil
			end

			local var_114_13 = 0
			local var_114_14 = 0.2

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_15 = arg_111_1:FormatText(StoryNameCfg[584].name)

				arg_111_1.leftNameTxt_.text = var_114_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_16 = arg_111_1:GetWordFromCfg(410031027)
				local var_114_17 = arg_111_1:FormatText(var_114_16.content)

				arg_111_1.text_.text = var_114_17

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_18 = 8
				local var_114_19 = utf8.len(var_114_17)
				local var_114_20 = var_114_18 <= 0 and var_114_14 or var_114_14 * (var_114_19 / var_114_18)

				if var_114_20 > 0 and var_114_14 < var_114_20 then
					arg_111_1.talkMaxDuration = var_114_20

					if var_114_20 + var_114_13 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_13
					end
				end

				arg_111_1.text_.text = var_114_17
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031027", "story_v_out_410031.awb") ~= 0 then
					local var_114_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031027", "story_v_out_410031.awb") / 1000

					if var_114_21 + var_114_13 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_21 + var_114_13
					end

					if var_114_16.prefab_name ~= "" and arg_111_1.actors_[var_114_16.prefab_name] ~= nil then
						local var_114_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_16.prefab_name].transform, "story_v_out_410031", "410031027", "story_v_out_410031.awb")

						arg_111_1:RecordAudio("410031027", var_114_22)
						arg_111_1:RecordAudio("410031027", var_114_22)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410031", "410031027", "story_v_out_410031.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410031", "410031027", "story_v_out_410031.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_23 = math.max(var_114_14, arg_111_1.talkMaxDuration)

			if var_114_13 <= arg_111_1.time_ and arg_111_1.time_ < var_114_13 + var_114_23 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_13) / var_114_23

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_13 + var_114_23 and arg_111_1.time_ < var_114_13 + var_114_23 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410031028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410031028
		arg_115_1.duration_ = 8.999999999998

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play410031029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = "L01g"

			if arg_115_1.bgs_[var_118_0] == nil then
				local var_118_1 = Object.Instantiate(arg_115_1.paintGo_)

				var_118_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_118_0)
				var_118_1.name = var_118_0
				var_118_1.transform.parent = arg_115_1.stage_.transform
				var_118_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_115_1.bgs_[var_118_0] = var_118_1
			end

			local var_118_2 = 1.999999999999

			if var_118_2 < arg_115_1.time_ and arg_115_1.time_ <= var_118_2 + arg_118_0 then
				local var_118_3 = manager.ui.mainCamera.transform.localPosition
				local var_118_4 = Vector3.New(0, 0, 10) + Vector3.New(var_118_3.x, var_118_3.y, 0)
				local var_118_5 = arg_115_1.bgs_.L01g

				var_118_5.transform.localPosition = var_118_4
				var_118_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_118_6 = var_118_5:GetComponent("SpriteRenderer")

				if var_118_6 and var_118_6.sprite then
					local var_118_7 = (var_118_5.transform.localPosition - var_118_3).z
					local var_118_8 = manager.ui.mainCameraCom_
					local var_118_9 = 2 * var_118_7 * Mathf.Tan(var_118_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_118_10 = var_118_9 * var_118_8.aspect
					local var_118_11 = var_118_6.sprite.bounds.size.x
					local var_118_12 = var_118_6.sprite.bounds.size.y
					local var_118_13 = var_118_10 / var_118_11
					local var_118_14 = var_118_9 / var_118_12
					local var_118_15 = var_118_14 < var_118_13 and var_118_13 or var_118_14

					var_118_5.transform.localScale = Vector3.New(var_118_15, var_118_15, 0)
				end

				for iter_118_0, iter_118_1 in pairs(arg_115_1.bgs_) do
					if iter_118_0 ~= "L01g" then
						iter_118_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_118_16 = 0

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 then
				arg_115_1.mask_.enabled = true
				arg_115_1.mask_.raycastTarget = true

				arg_115_1:SetGaussion(false)
			end

			local var_118_17 = 2

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_17 then
				local var_118_18 = (arg_115_1.time_ - var_118_16) / var_118_17
				local var_118_19 = Color.New(0, 0, 0)

				var_118_19.a = Mathf.Lerp(0, 1, var_118_18)
				arg_115_1.mask_.color = var_118_19
			end

			if arg_115_1.time_ >= var_118_16 + var_118_17 and arg_115_1.time_ < var_118_16 + var_118_17 + arg_118_0 then
				local var_118_20 = Color.New(0, 0, 0)

				var_118_20.a = 1
				arg_115_1.mask_.color = var_118_20
			end

			local var_118_21 = 2

			if var_118_21 < arg_115_1.time_ and arg_115_1.time_ <= var_118_21 + arg_118_0 then
				arg_115_1.mask_.enabled = true
				arg_115_1.mask_.raycastTarget = true

				arg_115_1:SetGaussion(false)
			end

			local var_118_22 = 2

			if var_118_21 <= arg_115_1.time_ and arg_115_1.time_ < var_118_21 + var_118_22 then
				local var_118_23 = (arg_115_1.time_ - var_118_21) / var_118_22
				local var_118_24 = Color.New(0, 0, 0)

				var_118_24.a = Mathf.Lerp(1, 0, var_118_23)
				arg_115_1.mask_.color = var_118_24
			end

			if arg_115_1.time_ >= var_118_21 + var_118_22 and arg_115_1.time_ < var_118_21 + var_118_22 + arg_118_0 then
				local var_118_25 = Color.New(0, 0, 0)
				local var_118_26 = 0

				arg_115_1.mask_.enabled = false
				var_118_25.a = var_118_26
				arg_115_1.mask_.color = var_118_25
			end

			local var_118_27 = arg_115_1.actors_["1060"].transform
			local var_118_28 = 1.999999999999

			if var_118_28 < arg_115_1.time_ and arg_115_1.time_ <= var_118_28 + arg_118_0 then
				arg_115_1.var_.moveOldPos1060 = var_118_27.localPosition
				var_118_27.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1060", 7)

				local var_118_29 = var_118_27.childCount

				for iter_118_2 = 0, var_118_29 - 1 do
					local var_118_30 = var_118_27:GetChild(iter_118_2)

					if var_118_30.name == "" or not string.find(var_118_30.name, "split") then
						var_118_30.gameObject:SetActive(true)
					else
						var_118_30.gameObject:SetActive(false)
					end
				end
			end

			local var_118_31 = 0.001

			if var_118_28 <= arg_115_1.time_ and arg_115_1.time_ < var_118_28 + var_118_31 then
				local var_118_32 = (arg_115_1.time_ - var_118_28) / var_118_31
				local var_118_33 = Vector3.New(0, -2000, -40)

				var_118_27.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1060, var_118_33, var_118_32)
			end

			if arg_115_1.time_ >= var_118_28 + var_118_31 and arg_115_1.time_ < var_118_28 + var_118_31 + arg_118_0 then
				var_118_27.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_118_34 = arg_115_1.actors_["1056"].transform
			local var_118_35 = 1.999999999999

			if var_118_35 < arg_115_1.time_ and arg_115_1.time_ <= var_118_35 + arg_118_0 then
				arg_115_1.var_.moveOldPos1056 = var_118_34.localPosition
				var_118_34.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1056", 7)

				local var_118_36 = var_118_34.childCount

				for iter_118_3 = 0, var_118_36 - 1 do
					local var_118_37 = var_118_34:GetChild(iter_118_3)

					if var_118_37.name == "" or not string.find(var_118_37.name, "split") then
						var_118_37.gameObject:SetActive(true)
					else
						var_118_37.gameObject:SetActive(false)
					end
				end
			end

			local var_118_38 = 0.001

			if var_118_35 <= arg_115_1.time_ and arg_115_1.time_ < var_118_35 + var_118_38 then
				local var_118_39 = (arg_115_1.time_ - var_118_35) / var_118_38
				local var_118_40 = Vector3.New(0, -2000, -180)

				var_118_34.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1056, var_118_40, var_118_39)
			end

			if arg_115_1.time_ >= var_118_35 + var_118_38 and arg_115_1.time_ < var_118_35 + var_118_38 + arg_118_0 then
				var_118_34.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_118_41 = 0
			local var_118_42 = 0.133333333333333

			if var_118_41 < arg_115_1.time_ and arg_115_1.time_ <= var_118_41 + arg_118_0 then
				local var_118_43 = "play"
				local var_118_44 = "music"

				arg_115_1:AudioAction(var_118_43, var_118_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_118_45 = 1.999999999999
			local var_118_46 = 0.733333333333333

			if var_118_45 < arg_115_1.time_ and arg_115_1.time_ <= var_118_45 + arg_118_0 then
				local var_118_47 = "play"
				local var_118_48 = "music"

				arg_115_1:AudioAction(var_118_47, var_118_48, "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum", "bgm_activity_2_8_story_jivitabad_slum.awb")
			end

			if arg_115_1.frameCnt_ <= 1 then
				arg_115_1.dialog_:SetActive(false)
			end

			local var_118_49 = 3.999999999998
			local var_118_50 = 0.975

			if var_118_49 < arg_115_1.time_ and arg_115_1.time_ <= var_118_49 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0

				arg_115_1.dialog_:SetActive(true)

				local var_118_51 = LeanTween.value(arg_115_1.dialog_, 0, 1, 0.3)

				var_118_51:setOnUpdate(LuaHelper.FloatAction(function(arg_119_0)
					arg_115_1.dialogCg_.alpha = arg_119_0
				end))
				var_118_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_115_1.dialog_)
					var_118_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_115_1.duration_ = arg_115_1.duration_ + 0.3

				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_52 = arg_115_1:GetWordFromCfg(410031028)
				local var_118_53 = arg_115_1:FormatText(var_118_52.content)

				arg_115_1.text_.text = var_118_53

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_54 = 39
				local var_118_55 = utf8.len(var_118_53)
				local var_118_56 = var_118_54 <= 0 and var_118_50 or var_118_50 * (var_118_55 / var_118_54)

				if var_118_56 > 0 and var_118_50 < var_118_56 then
					arg_115_1.talkMaxDuration = var_118_56
					var_118_49 = var_118_49 + 0.3

					if var_118_56 + var_118_49 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_56 + var_118_49
					end
				end

				arg_115_1.text_.text = var_118_53
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_57 = var_118_49 + 0.3
			local var_118_58 = math.max(var_118_50, arg_115_1.talkMaxDuration)

			if var_118_57 <= arg_115_1.time_ and arg_115_1.time_ < var_118_57 + var_118_58 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_57) / var_118_58

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_57 + var_118_58 and arg_115_1.time_ < var_118_57 + var_118_58 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410031029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 410031029
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play410031030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 1.95

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

				local var_124_2 = arg_121_1:GetWordFromCfg(410031029)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 78
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
	Play410031030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 410031030
		arg_125_1.duration_ = 4.7

		local var_125_0 = {
			zh = 4.7,
			ja = 4.233
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
				arg_125_0:Play410031031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1060"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1060 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1060", 3)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(0, -435, -40)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1060, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_128_7 = arg_125_1.actors_["1060"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 == nil then
				arg_125_1.var_.actorSpriteComps1060 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.034

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps1060 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps1060 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps1060 = nil
			end

			local var_128_13 = 0
			local var_128_14 = 0.325

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_15 = arg_125_1:FormatText(StoryNameCfg[584].name)

				arg_125_1.leftNameTxt_.text = var_128_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_16 = arg_125_1:GetWordFromCfg(410031030)
				local var_128_17 = arg_125_1:FormatText(var_128_16.content)

				arg_125_1.text_.text = var_128_17

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_18 = 13
				local var_128_19 = utf8.len(var_128_17)
				local var_128_20 = var_128_18 <= 0 and var_128_14 or var_128_14 * (var_128_19 / var_128_18)

				if var_128_20 > 0 and var_128_14 < var_128_20 then
					arg_125_1.talkMaxDuration = var_128_20

					if var_128_20 + var_128_13 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_13
					end
				end

				arg_125_1.text_.text = var_128_17
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031030", "story_v_out_410031.awb") ~= 0 then
					local var_128_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031030", "story_v_out_410031.awb") / 1000

					if var_128_21 + var_128_13 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_21 + var_128_13
					end

					if var_128_16.prefab_name ~= "" and arg_125_1.actors_[var_128_16.prefab_name] ~= nil then
						local var_128_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_16.prefab_name].transform, "story_v_out_410031", "410031030", "story_v_out_410031.awb")

						arg_125_1:RecordAudio("410031030", var_128_22)
						arg_125_1:RecordAudio("410031030", var_128_22)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_410031", "410031030", "story_v_out_410031.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_410031", "410031030", "story_v_out_410031.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_23 = math.max(var_128_14, arg_125_1.talkMaxDuration)

			if var_128_13 <= arg_125_1.time_ and arg_125_1.time_ < var_128_13 + var_128_23 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_13) / var_128_23

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_13 + var_128_23 and arg_125_1.time_ < var_128_13 + var_128_23 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play410031031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 410031031
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play410031032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1060"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.actorSpriteComps1060 == nil then
				arg_129_1.var_.actorSpriteComps1060 = var_132_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_2 = 0.034

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.actorSpriteComps1060 then
					for iter_132_0, iter_132_1 in pairs(arg_129_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_132_1 then
							local var_132_4 = Mathf.Lerp(iter_132_1.color.r, 0.5, var_132_3)

							iter_132_1.color = Color.New(var_132_4, var_132_4, var_132_4)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.actorSpriteComps1060 then
				local var_132_5 = 0.5

				for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_132_3 then
						iter_132_3.color = Color.New(var_132_5, var_132_5, var_132_5)
					end
				end

				arg_129_1.var_.actorSpriteComps1060 = nil
			end

			local var_132_6 = 0
			local var_132_7 = 1.175

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_8 = arg_129_1:GetWordFromCfg(410031031)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 47
				local var_132_11 = utf8.len(var_132_9)
				local var_132_12 = var_132_10 <= 0 and var_132_7 or var_132_7 * (var_132_11 / var_132_10)

				if var_132_12 > 0 and var_132_7 < var_132_12 then
					arg_129_1.talkMaxDuration = var_132_12

					if var_132_12 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_12 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_9
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_13 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_13 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_13

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_13 and arg_129_1.time_ < var_132_6 + var_132_13 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play410031032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 410031032
		arg_133_1.duration_ = 5.266

		local var_133_0 = {
			zh = 5.266,
			ja = 3.833
		}
		local var_133_1 = manager.audio:GetLocalizationFlag()

		if var_133_0[var_133_1] ~= nil then
			arg_133_1.duration_ = var_133_0[var_133_1]
		end

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play410031033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1060"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1060 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("1060", 3)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_1" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(0, -435, -40)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1060, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_136_7 = arg_133_1.actors_["1060"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 and arg_133_1.var_.actorSpriteComps1060 == nil then
				arg_133_1.var_.actorSpriteComps1060 = var_136_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_9 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_9 then
				local var_136_10 = (arg_133_1.time_ - var_136_8) / var_136_9

				if arg_133_1.var_.actorSpriteComps1060 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_136_2 then
							local var_136_11 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_10)

							iter_136_2.color = Color.New(var_136_11, var_136_11, var_136_11)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_9 and arg_133_1.time_ < var_136_8 + var_136_9 + arg_136_0 and arg_133_1.var_.actorSpriteComps1060 then
				local var_136_12 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_12, var_136_12, var_136_12)
					end
				end

				arg_133_1.var_.actorSpriteComps1060 = nil
			end

			local var_136_13 = 0
			local var_136_14 = 0.55

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_15 = arg_133_1:FormatText(StoryNameCfg[584].name)

				arg_133_1.leftNameTxt_.text = var_136_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_16 = arg_133_1:GetWordFromCfg(410031032)
				local var_136_17 = arg_133_1:FormatText(var_136_16.content)

				arg_133_1.text_.text = var_136_17

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_18 = 22
				local var_136_19 = utf8.len(var_136_17)
				local var_136_20 = var_136_18 <= 0 and var_136_14 or var_136_14 * (var_136_19 / var_136_18)

				if var_136_20 > 0 and var_136_14 < var_136_20 then
					arg_133_1.talkMaxDuration = var_136_20

					if var_136_20 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_13
					end
				end

				arg_133_1.text_.text = var_136_17
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031032", "story_v_out_410031.awb") ~= 0 then
					local var_136_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031032", "story_v_out_410031.awb") / 1000

					if var_136_21 + var_136_13 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_13
					end

					if var_136_16.prefab_name ~= "" and arg_133_1.actors_[var_136_16.prefab_name] ~= nil then
						local var_136_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_16.prefab_name].transform, "story_v_out_410031", "410031032", "story_v_out_410031.awb")

						arg_133_1:RecordAudio("410031032", var_136_22)
						arg_133_1:RecordAudio("410031032", var_136_22)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_410031", "410031032", "story_v_out_410031.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_410031", "410031032", "story_v_out_410031.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_23 = math.max(var_136_14, arg_133_1.talkMaxDuration)

			if var_136_13 <= arg_133_1.time_ and arg_133_1.time_ < var_136_13 + var_136_23 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_13) / var_136_23

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_13 + var_136_23 and arg_133_1.time_ < var_136_13 + var_136_23 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play410031033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 410031033
		arg_137_1.duration_ = 4.533

		local var_137_0 = {
			zh = 4.166,
			ja = 4.533
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
				arg_137_0:Play410031034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1060"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.actorSpriteComps1060 == nil then
				arg_137_1.var_.actorSpriteComps1060 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.034

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps1060 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_140_1 then
							local var_140_4 = Mathf.Lerp(iter_140_1.color.r, 0.5, var_140_3)

							iter_140_1.color = Color.New(var_140_4, var_140_4, var_140_4)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.actorSpriteComps1060 then
				local var_140_5 = 0.5

				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_140_3 then
						iter_140_3.color = Color.New(var_140_5, var_140_5, var_140_5)
					end
				end

				arg_137_1.var_.actorSpriteComps1060 = nil
			end

			local var_140_6 = 0
			local var_140_7 = 0.35

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[606].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(410031033)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031033", "story_v_out_410031.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031033", "story_v_out_410031.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_out_410031", "410031033", "story_v_out_410031.awb")

						arg_137_1:RecordAudio("410031033", var_140_15)
						arg_137_1:RecordAudio("410031033", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_410031", "410031033", "story_v_out_410031.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_410031", "410031033", "story_v_out_410031.awb")
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
	Play410031034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 410031034
		arg_141_1.duration_ = 15.266

		local var_141_0 = {
			zh = 10.333,
			ja = 15.266
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
				arg_141_0:Play410031035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.95

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[606].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(410031034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031034", "story_v_out_410031.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031034", "story_v_out_410031.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_410031", "410031034", "story_v_out_410031.awb")

						arg_141_1:RecordAudio("410031034", var_144_9)
						arg_141_1:RecordAudio("410031034", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_410031", "410031034", "story_v_out_410031.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_410031", "410031034", "story_v_out_410031.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play410031035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 410031035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play410031036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.475

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_2 = arg_145_1:GetWordFromCfg(410031035)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 59
				local var_148_5 = utf8.len(var_148_3)
				local var_148_6 = var_148_4 <= 0 and var_148_1 or var_148_1 * (var_148_5 / var_148_4)

				if var_148_6 > 0 and var_148_1 < var_148_6 then
					arg_145_1.talkMaxDuration = var_148_6

					if var_148_6 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_6 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_3
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_7 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_7 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_7

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_7 and arg_145_1.time_ < var_148_0 + var_148_7 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play410031036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 410031036
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play410031037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.9

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_2 = arg_149_1:GetWordFromCfg(410031036)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 36
				local var_152_5 = utf8.len(var_152_3)
				local var_152_6 = var_152_4 <= 0 and var_152_1 or var_152_1 * (var_152_5 / var_152_4)

				if var_152_6 > 0 and var_152_1 < var_152_6 then
					arg_149_1.talkMaxDuration = var_152_6

					if var_152_6 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_6 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_3
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_7 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_7 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_7

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_7 and arg_149_1.time_ < var_152_0 + var_152_7 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play410031037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 410031037
		arg_153_1.duration_ = 11.5

		local var_153_0 = {
			zh = 8.866,
			ja = 11.5
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
				arg_153_0:Play410031038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1060"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1060 = var_156_0.localPosition
				var_156_0.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("1060", 3)

				local var_156_2 = var_156_0.childCount

				for iter_156_0 = 0, var_156_2 - 1 do
					local var_156_3 = var_156_0:GetChild(iter_156_0)

					if var_156_3.name == "" or not string.find(var_156_3.name, "split") then
						var_156_3.gameObject:SetActive(true)
					else
						var_156_3.gameObject:SetActive(false)
					end
				end
			end

			local var_156_4 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_4 then
				local var_156_5 = (arg_153_1.time_ - var_156_1) / var_156_4
				local var_156_6 = Vector3.New(0, -435, -40)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1060, var_156_6, var_156_5)
			end

			if arg_153_1.time_ >= var_156_1 + var_156_4 and arg_153_1.time_ < var_156_1 + var_156_4 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_156_7 = arg_153_1.actors_["1060"]
			local var_156_8 = 0

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 and arg_153_1.var_.actorSpriteComps1060 == nil then
				arg_153_1.var_.actorSpriteComps1060 = var_156_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_9 = 0.034

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_9 then
				local var_156_10 = (arg_153_1.time_ - var_156_8) / var_156_9

				if arg_153_1.var_.actorSpriteComps1060 then
					for iter_156_1, iter_156_2 in pairs(arg_153_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_156_2 then
							local var_156_11 = Mathf.Lerp(iter_156_2.color.r, 1, var_156_10)

							iter_156_2.color = Color.New(var_156_11, var_156_11, var_156_11)
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_8 + var_156_9 and arg_153_1.time_ < var_156_8 + var_156_9 + arg_156_0 and arg_153_1.var_.actorSpriteComps1060 then
				local var_156_12 = 1

				for iter_156_3, iter_156_4 in pairs(arg_153_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_156_4 then
						iter_156_4.color = Color.New(var_156_12, var_156_12, var_156_12)
					end
				end

				arg_153_1.var_.actorSpriteComps1060 = nil
			end

			local var_156_13 = 0
			local var_156_14 = 0.9

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_15 = arg_153_1:FormatText(StoryNameCfg[584].name)

				arg_153_1.leftNameTxt_.text = var_156_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_16 = arg_153_1:GetWordFromCfg(410031037)
				local var_156_17 = arg_153_1:FormatText(var_156_16.content)

				arg_153_1.text_.text = var_156_17

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_18 = 36
				local var_156_19 = utf8.len(var_156_17)
				local var_156_20 = var_156_18 <= 0 and var_156_14 or var_156_14 * (var_156_19 / var_156_18)

				if var_156_20 > 0 and var_156_14 < var_156_20 then
					arg_153_1.talkMaxDuration = var_156_20

					if var_156_20 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_13
					end
				end

				arg_153_1.text_.text = var_156_17
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031037", "story_v_out_410031.awb") ~= 0 then
					local var_156_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031037", "story_v_out_410031.awb") / 1000

					if var_156_21 + var_156_13 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_21 + var_156_13
					end

					if var_156_16.prefab_name ~= "" and arg_153_1.actors_[var_156_16.prefab_name] ~= nil then
						local var_156_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_16.prefab_name].transform, "story_v_out_410031", "410031037", "story_v_out_410031.awb")

						arg_153_1:RecordAudio("410031037", var_156_22)
						arg_153_1:RecordAudio("410031037", var_156_22)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_410031", "410031037", "story_v_out_410031.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_410031", "410031037", "story_v_out_410031.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_23 = math.max(var_156_14, arg_153_1.talkMaxDuration)

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_23 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_13) / var_156_23

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_13 + var_156_23 and arg_153_1.time_ < var_156_13 + var_156_23 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play410031038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 410031038
		arg_157_1.duration_ = 3.866

		local var_157_0 = {
			zh = 3.866,
			ja = 3.6
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
				arg_157_0:Play410031039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1060"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.actorSpriteComps1060 == nil then
				arg_157_1.var_.actorSpriteComps1060 = var_160_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_2 = 0.034

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.actorSpriteComps1060 then
					for iter_160_0, iter_160_1 in pairs(arg_157_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_160_1 then
							local var_160_4 = Mathf.Lerp(iter_160_1.color.r, 0.5, var_160_3)

							iter_160_1.color = Color.New(var_160_4, var_160_4, var_160_4)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.actorSpriteComps1060 then
				local var_160_5 = 0.5

				for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_160_3 then
						iter_160_3.color = Color.New(var_160_5, var_160_5, var_160_5)
					end
				end

				arg_157_1.var_.actorSpriteComps1060 = nil
			end

			local var_160_6 = 0
			local var_160_7 = 0.25

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_8 = arg_157_1:FormatText(StoryNameCfg[606].name)

				arg_157_1.leftNameTxt_.text = var_160_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_lolic")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(410031038)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 10
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_7 or var_160_7 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_7 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031038", "story_v_out_410031.awb") ~= 0 then
					local var_160_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031038", "story_v_out_410031.awb") / 1000

					if var_160_14 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_14 + var_160_6
					end

					if var_160_9.prefab_name ~= "" and arg_157_1.actors_[var_160_9.prefab_name] ~= nil then
						local var_160_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_9.prefab_name].transform, "story_v_out_410031", "410031038", "story_v_out_410031.awb")

						arg_157_1:RecordAudio("410031038", var_160_15)
						arg_157_1:RecordAudio("410031038", var_160_15)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_410031", "410031038", "story_v_out_410031.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_410031", "410031038", "story_v_out_410031.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_16 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_16 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_16

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_16 and arg_157_1.time_ < var_160_6 + var_160_16 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play410031039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 410031039
		arg_161_1.duration_ = 6.9

		local var_161_0 = {
			zh = 6.9,
			ja = 5.4
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
				arg_161_0:Play410031040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1060"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1060 = var_164_0.localPosition
				var_164_0.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("1060", 3)

				local var_164_2 = var_164_0.childCount

				for iter_164_0 = 0, var_164_2 - 1 do
					local var_164_3 = var_164_0:GetChild(iter_164_0)

					if var_164_3.name == "split_1" or not string.find(var_164_3.name, "split") then
						var_164_3.gameObject:SetActive(true)
					else
						var_164_3.gameObject:SetActive(false)
					end
				end
			end

			local var_164_4 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_1) / var_164_4
				local var_164_6 = Vector3.New(0, -435, -40)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1060, var_164_6, var_164_5)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_4 and arg_161_1.time_ < var_164_1 + var_164_4 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_164_7 = arg_161_1.actors_["1060"]
			local var_164_8 = 0

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 and arg_161_1.var_.actorSpriteComps1060 == nil then
				arg_161_1.var_.actorSpriteComps1060 = var_164_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_9 = 0.034

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_9 then
				local var_164_10 = (arg_161_1.time_ - var_164_8) / var_164_9

				if arg_161_1.var_.actorSpriteComps1060 then
					for iter_164_1, iter_164_2 in pairs(arg_161_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_164_2 then
							local var_164_11 = Mathf.Lerp(iter_164_2.color.r, 1, var_164_10)

							iter_164_2.color = Color.New(var_164_11, var_164_11, var_164_11)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_8 + var_164_9 and arg_161_1.time_ < var_164_8 + var_164_9 + arg_164_0 and arg_161_1.var_.actorSpriteComps1060 then
				local var_164_12 = 1

				for iter_164_3, iter_164_4 in pairs(arg_161_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_164_4 then
						iter_164_4.color = Color.New(var_164_12, var_164_12, var_164_12)
					end
				end

				arg_161_1.var_.actorSpriteComps1060 = nil
			end

			local var_164_13 = 0
			local var_164_14 = 0.825

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_15 = arg_161_1:FormatText(StoryNameCfg[584].name)

				arg_161_1.leftNameTxt_.text = var_164_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_16 = arg_161_1:GetWordFromCfg(410031039)
				local var_164_17 = arg_161_1:FormatText(var_164_16.content)

				arg_161_1.text_.text = var_164_17

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_18 = 33
				local var_164_19 = utf8.len(var_164_17)
				local var_164_20 = var_164_18 <= 0 and var_164_14 or var_164_14 * (var_164_19 / var_164_18)

				if var_164_20 > 0 and var_164_14 < var_164_20 then
					arg_161_1.talkMaxDuration = var_164_20

					if var_164_20 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_13
					end
				end

				arg_161_1.text_.text = var_164_17
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031039", "story_v_out_410031.awb") ~= 0 then
					local var_164_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031039", "story_v_out_410031.awb") / 1000

					if var_164_21 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_21 + var_164_13
					end

					if var_164_16.prefab_name ~= "" and arg_161_1.actors_[var_164_16.prefab_name] ~= nil then
						local var_164_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_16.prefab_name].transform, "story_v_out_410031", "410031039", "story_v_out_410031.awb")

						arg_161_1:RecordAudio("410031039", var_164_22)
						arg_161_1:RecordAudio("410031039", var_164_22)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_410031", "410031039", "story_v_out_410031.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_410031", "410031039", "story_v_out_410031.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_23 = math.max(var_164_14, arg_161_1.talkMaxDuration)

			if var_164_13 <= arg_161_1.time_ and arg_161_1.time_ < var_164_13 + var_164_23 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_13) / var_164_23

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_13 + var_164_23 and arg_161_1.time_ < var_164_13 + var_164_23 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play410031040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 410031040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play410031041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1060"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 == nil then
				arg_165_1.var_.actorSpriteComps1060 = var_168_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_2 = 0.034

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.actorSpriteComps1060 then
					for iter_168_0, iter_168_1 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_168_1 then
							local var_168_4 = Mathf.Lerp(iter_168_1.color.r, 0.5, var_168_3)

							iter_168_1.color = Color.New(var_168_4, var_168_4, var_168_4)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.actorSpriteComps1060 then
				local var_168_5 = 0.5

				for iter_168_2, iter_168_3 in pairs(arg_165_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_168_3 then
						iter_168_3.color = Color.New(var_168_5, var_168_5, var_168_5)
					end
				end

				arg_165_1.var_.actorSpriteComps1060 = nil
			end

			local var_168_6 = 0
			local var_168_7 = 0.825

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_8 = arg_165_1:GetWordFromCfg(410031040)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 33
				local var_168_11 = utf8.len(var_168_9)
				local var_168_12 = var_168_10 <= 0 and var_168_7 or var_168_7 * (var_168_11 / var_168_10)

				if var_168_12 > 0 and var_168_7 < var_168_12 then
					arg_165_1.talkMaxDuration = var_168_12

					if var_168_12 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_9
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_13 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_13 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_13

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_13 and arg_165_1.time_ < var_168_6 + var_168_13 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play410031041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 410031041
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play410031042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1060"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1060 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("1060", 7)

				local var_172_2 = var_172_0.childCount

				for iter_172_0 = 0, var_172_2 - 1 do
					local var_172_3 = var_172_0:GetChild(iter_172_0)

					if var_172_3.name == "" or not string.find(var_172_3.name, "split") then
						var_172_3.gameObject:SetActive(true)
					else
						var_172_3.gameObject:SetActive(false)
					end
				end
			end

			local var_172_4 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_1) / var_172_4
				local var_172_6 = Vector3.New(0, -2000, -40)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1060, var_172_6, var_172_5)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_4 and arg_169_1.time_ < var_172_1 + var_172_4 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_172_7 = arg_169_1.actors_["1060"]
			local var_172_8 = 0

			if var_172_8 < arg_169_1.time_ and arg_169_1.time_ <= var_172_8 + arg_172_0 and arg_169_1.var_.actorSpriteComps1060 == nil then
				arg_169_1.var_.actorSpriteComps1060 = var_172_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_9 = 0.034

			if var_172_8 <= arg_169_1.time_ and arg_169_1.time_ < var_172_8 + var_172_9 then
				local var_172_10 = (arg_169_1.time_ - var_172_8) / var_172_9

				if arg_169_1.var_.actorSpriteComps1060 then
					for iter_172_1, iter_172_2 in pairs(arg_169_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_172_2 then
							local var_172_11 = Mathf.Lerp(iter_172_2.color.r, 0.5, var_172_10)

							iter_172_2.color = Color.New(var_172_11, var_172_11, var_172_11)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_8 + var_172_9 and arg_169_1.time_ < var_172_8 + var_172_9 + arg_172_0 and arg_169_1.var_.actorSpriteComps1060 then
				local var_172_12 = 0.5

				for iter_172_3, iter_172_4 in pairs(arg_169_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_172_4 then
						iter_172_4.color = Color.New(var_172_12, var_172_12, var_172_12)
					end
				end

				arg_169_1.var_.actorSpriteComps1060 = nil
			end

			local var_172_13 = 0
			local var_172_14 = 1.55

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_15 = arg_169_1:GetWordFromCfg(410031041)
				local var_172_16 = arg_169_1:FormatText(var_172_15.content)

				arg_169_1.text_.text = var_172_16

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_17 = 62
				local var_172_18 = utf8.len(var_172_16)
				local var_172_19 = var_172_17 <= 0 and var_172_14 or var_172_14 * (var_172_18 / var_172_17)

				if var_172_19 > 0 and var_172_14 < var_172_19 then
					arg_169_1.talkMaxDuration = var_172_19

					if var_172_19 + var_172_13 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_19 + var_172_13
					end
				end

				arg_169_1.text_.text = var_172_16
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_20 = math.max(var_172_14, arg_169_1.talkMaxDuration)

			if var_172_13 <= arg_169_1.time_ and arg_169_1.time_ < var_172_13 + var_172_20 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_13) / var_172_20

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_13 + var_172_20 and arg_169_1.time_ < var_172_13 + var_172_20 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play410031042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 410031042
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play410031043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 1.125

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_2 = arg_173_1:GetWordFromCfg(410031042)
				local var_176_3 = arg_173_1:FormatText(var_176_2.content)

				arg_173_1.text_.text = var_176_3

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_4 = 45
				local var_176_5 = utf8.len(var_176_3)
				local var_176_6 = var_176_4 <= 0 and var_176_1 or var_176_1 * (var_176_5 / var_176_4)

				if var_176_6 > 0 and var_176_1 < var_176_6 then
					arg_173_1.talkMaxDuration = var_176_6

					if var_176_6 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_6 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_3
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_7 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_7 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_7

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_7 and arg_173_1.time_ < var_176_0 + var_176_7 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play410031043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 410031043
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play410031044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 1.875

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_2 = arg_177_1:GetWordFromCfg(410031043)
				local var_180_3 = arg_177_1:FormatText(var_180_2.content)

				arg_177_1.text_.text = var_180_3

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_4 = 75
				local var_180_5 = utf8.len(var_180_3)
				local var_180_6 = var_180_4 <= 0 and var_180_1 or var_180_1 * (var_180_5 / var_180_4)

				if var_180_6 > 0 and var_180_1 < var_180_6 then
					arg_177_1.talkMaxDuration = var_180_6

					if var_180_6 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_6 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_3
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_7 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_7 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_7

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_7 and arg_177_1.time_ < var_180_0 + var_180_7 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play410031044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 410031044
		arg_181_1.duration_ = 9.366

		local var_181_0 = {
			zh = 6.7,
			ja = 9.366
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play410031045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1060"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1060 = var_184_0.localPosition
				var_184_0.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("1060", 3)

				local var_184_2 = var_184_0.childCount

				for iter_184_0 = 0, var_184_2 - 1 do
					local var_184_3 = var_184_0:GetChild(iter_184_0)

					if var_184_3.name == "split_1" or not string.find(var_184_3.name, "split") then
						var_184_3.gameObject:SetActive(true)
					else
						var_184_3.gameObject:SetActive(false)
					end
				end
			end

			local var_184_4 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_4 then
				local var_184_5 = (arg_181_1.time_ - var_184_1) / var_184_4
				local var_184_6 = Vector3.New(0, -435, -40)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1060, var_184_6, var_184_5)
			end

			if arg_181_1.time_ >= var_184_1 + var_184_4 and arg_181_1.time_ < var_184_1 + var_184_4 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_184_7 = arg_181_1.actors_["1060"]
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 == nil then
				arg_181_1.var_.actorSpriteComps1060 = var_184_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_9 = 0.034

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9

				if arg_181_1.var_.actorSpriteComps1060 then
					for iter_184_1, iter_184_2 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_184_2 then
							local var_184_11 = Mathf.Lerp(iter_184_2.color.r, 1, var_184_10)

							iter_184_2.color = Color.New(var_184_11, var_184_11, var_184_11)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 and arg_181_1.var_.actorSpriteComps1060 then
				local var_184_12 = 1

				for iter_184_3, iter_184_4 in pairs(arg_181_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_184_4 then
						iter_184_4.color = Color.New(var_184_12, var_184_12, var_184_12)
					end
				end

				arg_181_1.var_.actorSpriteComps1060 = nil
			end

			local var_184_13 = 0
			local var_184_14 = 0.475

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_15 = arg_181_1:FormatText(StoryNameCfg[584].name)

				arg_181_1.leftNameTxt_.text = var_184_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_16 = arg_181_1:GetWordFromCfg(410031044)
				local var_184_17 = arg_181_1:FormatText(var_184_16.content)

				arg_181_1.text_.text = var_184_17

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_18 = 19
				local var_184_19 = utf8.len(var_184_17)
				local var_184_20 = var_184_18 <= 0 and var_184_14 or var_184_14 * (var_184_19 / var_184_18)

				if var_184_20 > 0 and var_184_14 < var_184_20 then
					arg_181_1.talkMaxDuration = var_184_20

					if var_184_20 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_13
					end
				end

				arg_181_1.text_.text = var_184_17
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031044", "story_v_out_410031.awb") ~= 0 then
					local var_184_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031044", "story_v_out_410031.awb") / 1000

					if var_184_21 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_21 + var_184_13
					end

					if var_184_16.prefab_name ~= "" and arg_181_1.actors_[var_184_16.prefab_name] ~= nil then
						local var_184_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_16.prefab_name].transform, "story_v_out_410031", "410031044", "story_v_out_410031.awb")

						arg_181_1:RecordAudio("410031044", var_184_22)
						arg_181_1:RecordAudio("410031044", var_184_22)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_410031", "410031044", "story_v_out_410031.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_410031", "410031044", "story_v_out_410031.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_23 = math.max(var_184_14, arg_181_1.talkMaxDuration)

			if var_184_13 <= arg_181_1.time_ and arg_181_1.time_ < var_184_13 + var_184_23 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_13) / var_184_23

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_13 + var_184_23 and arg_181_1.time_ < var_184_13 + var_184_23 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play410031045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 410031045
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play410031046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1060"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.actorSpriteComps1060 == nil then
				arg_185_1.var_.actorSpriteComps1060 = var_188_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_2 = 0.034

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.actorSpriteComps1060 then
					for iter_188_0, iter_188_1 in pairs(arg_185_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_188_1 then
							local var_188_4 = Mathf.Lerp(iter_188_1.color.r, 0.5, var_188_3)

							iter_188_1.color = Color.New(var_188_4, var_188_4, var_188_4)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.actorSpriteComps1060 then
				local var_188_5 = 0.5

				for iter_188_2, iter_188_3 in pairs(arg_185_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_188_3 then
						iter_188_3.color = Color.New(var_188_5, var_188_5, var_188_5)
					end
				end

				arg_185_1.var_.actorSpriteComps1060 = nil
			end

			local var_188_6 = 0
			local var_188_7 = 0.65

			if var_188_6 < arg_185_1.time_ and arg_185_1.time_ <= var_188_6 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_8 = arg_185_1:GetWordFromCfg(410031045)
				local var_188_9 = arg_185_1:FormatText(var_188_8.content)

				arg_185_1.text_.text = var_188_9

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_10 = 26
				local var_188_11 = utf8.len(var_188_9)
				local var_188_12 = var_188_10 <= 0 and var_188_7 or var_188_7 * (var_188_11 / var_188_10)

				if var_188_12 > 0 and var_188_7 < var_188_12 then
					arg_185_1.talkMaxDuration = var_188_12

					if var_188_12 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_12 + var_188_6
					end
				end

				arg_185_1.text_.text = var_188_9
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_13 = math.max(var_188_7, arg_185_1.talkMaxDuration)

			if var_188_6 <= arg_185_1.time_ and arg_185_1.time_ < var_188_6 + var_188_13 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_6) / var_188_13

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_6 + var_188_13 and arg_185_1.time_ < var_188_6 + var_188_13 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play410031046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 410031046
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play410031047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 1.725

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_2 = arg_189_1:GetWordFromCfg(410031046)
				local var_192_3 = arg_189_1:FormatText(var_192_2.content)

				arg_189_1.text_.text = var_192_3

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_4 = 69
				local var_192_5 = utf8.len(var_192_3)
				local var_192_6 = var_192_4 <= 0 and var_192_1 or var_192_1 * (var_192_5 / var_192_4)

				if var_192_6 > 0 and var_192_1 < var_192_6 then
					arg_189_1.talkMaxDuration = var_192_6

					if var_192_6 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_6 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_3
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_7 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_7 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_7

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_7 and arg_189_1.time_ < var_192_0 + var_192_7 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play410031047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 410031047
		arg_193_1.duration_ = 15.166

		local var_193_0 = {
			zh = 15.166,
			ja = 11.733
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
				arg_193_0:Play410031048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1060"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1060 = var_196_0.localPosition
				var_196_0.localScale = Vector3.New(1, 1, 1)

				arg_193_1:CheckSpriteTmpPos("1060", 3)

				local var_196_2 = var_196_0.childCount

				for iter_196_0 = 0, var_196_2 - 1 do
					local var_196_3 = var_196_0:GetChild(iter_196_0)

					if var_196_3.name == "" or not string.find(var_196_3.name, "split") then
						var_196_3.gameObject:SetActive(true)
					else
						var_196_3.gameObject:SetActive(false)
					end
				end
			end

			local var_196_4 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_4 then
				local var_196_5 = (arg_193_1.time_ - var_196_1) / var_196_4
				local var_196_6 = Vector3.New(0, -435, -40)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1060, var_196_6, var_196_5)
			end

			if arg_193_1.time_ >= var_196_1 + var_196_4 and arg_193_1.time_ < var_196_1 + var_196_4 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_196_7 = arg_193_1.actors_["1060"]
			local var_196_8 = 0

			if var_196_8 < arg_193_1.time_ and arg_193_1.time_ <= var_196_8 + arg_196_0 and arg_193_1.var_.actorSpriteComps1060 == nil then
				arg_193_1.var_.actorSpriteComps1060 = var_196_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_9 = 0.034

			if var_196_8 <= arg_193_1.time_ and arg_193_1.time_ < var_196_8 + var_196_9 then
				local var_196_10 = (arg_193_1.time_ - var_196_8) / var_196_9

				if arg_193_1.var_.actorSpriteComps1060 then
					for iter_196_1, iter_196_2 in pairs(arg_193_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_196_2 then
							local var_196_11 = Mathf.Lerp(iter_196_2.color.r, 1, var_196_10)

							iter_196_2.color = Color.New(var_196_11, var_196_11, var_196_11)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_8 + var_196_9 and arg_193_1.time_ < var_196_8 + var_196_9 + arg_196_0 and arg_193_1.var_.actorSpriteComps1060 then
				local var_196_12 = 1

				for iter_196_3, iter_196_4 in pairs(arg_193_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_196_4 then
						iter_196_4.color = Color.New(var_196_12, var_196_12, var_196_12)
					end
				end

				arg_193_1.var_.actorSpriteComps1060 = nil
			end

			local var_196_13 = 0
			local var_196_14 = 1.475

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_15 = arg_193_1:FormatText(StoryNameCfg[584].name)

				arg_193_1.leftNameTxt_.text = var_196_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_16 = arg_193_1:GetWordFromCfg(410031047)
				local var_196_17 = arg_193_1:FormatText(var_196_16.content)

				arg_193_1.text_.text = var_196_17

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_18 = 59
				local var_196_19 = utf8.len(var_196_17)
				local var_196_20 = var_196_18 <= 0 and var_196_14 or var_196_14 * (var_196_19 / var_196_18)

				if var_196_20 > 0 and var_196_14 < var_196_20 then
					arg_193_1.talkMaxDuration = var_196_20

					if var_196_20 + var_196_13 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_20 + var_196_13
					end
				end

				arg_193_1.text_.text = var_196_17
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031047", "story_v_out_410031.awb") ~= 0 then
					local var_196_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031047", "story_v_out_410031.awb") / 1000

					if var_196_21 + var_196_13 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_21 + var_196_13
					end

					if var_196_16.prefab_name ~= "" and arg_193_1.actors_[var_196_16.prefab_name] ~= nil then
						local var_196_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_16.prefab_name].transform, "story_v_out_410031", "410031047", "story_v_out_410031.awb")

						arg_193_1:RecordAudio("410031047", var_196_22)
						arg_193_1:RecordAudio("410031047", var_196_22)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_410031", "410031047", "story_v_out_410031.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_410031", "410031047", "story_v_out_410031.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_23 = math.max(var_196_14, arg_193_1.talkMaxDuration)

			if var_196_13 <= arg_193_1.time_ and arg_193_1.time_ < var_196_13 + var_196_23 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_13) / var_196_23

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_13 + var_196_23 and arg_193_1.time_ < var_196_13 + var_196_23 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play410031048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 410031048
		arg_197_1.duration_ = 9.466

		local var_197_0 = {
			zh = 7.133,
			ja = 9.466
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play410031049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1060"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1060 = var_200_0.localPosition
				var_200_0.localScale = Vector3.New(1, 1, 1)

				arg_197_1:CheckSpriteTmpPos("1060", 3)

				local var_200_2 = var_200_0.childCount

				for iter_200_0 = 0, var_200_2 - 1 do
					local var_200_3 = var_200_0:GetChild(iter_200_0)

					if var_200_3.name == "" or not string.find(var_200_3.name, "split") then
						var_200_3.gameObject:SetActive(true)
					else
						var_200_3.gameObject:SetActive(false)
					end
				end
			end

			local var_200_4 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_4 then
				local var_200_5 = (arg_197_1.time_ - var_200_1) / var_200_4
				local var_200_6 = Vector3.New(0, -435, -40)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1060, var_200_6, var_200_5)
			end

			if arg_197_1.time_ >= var_200_1 + var_200_4 and arg_197_1.time_ < var_200_1 + var_200_4 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_200_7 = arg_197_1.actors_["1060"]
			local var_200_8 = 0

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 and arg_197_1.var_.actorSpriteComps1060 == nil then
				arg_197_1.var_.actorSpriteComps1060 = var_200_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_200_9 = 0.034

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_9 then
				local var_200_10 = (arg_197_1.time_ - var_200_8) / var_200_9

				if arg_197_1.var_.actorSpriteComps1060 then
					for iter_200_1, iter_200_2 in pairs(arg_197_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_200_2 then
							local var_200_11 = Mathf.Lerp(iter_200_2.color.r, 1, var_200_10)

							iter_200_2.color = Color.New(var_200_11, var_200_11, var_200_11)
						end
					end
				end
			end

			if arg_197_1.time_ >= var_200_8 + var_200_9 and arg_197_1.time_ < var_200_8 + var_200_9 + arg_200_0 and arg_197_1.var_.actorSpriteComps1060 then
				local var_200_12 = 1

				for iter_200_3, iter_200_4 in pairs(arg_197_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_200_4 then
						iter_200_4.color = Color.New(var_200_12, var_200_12, var_200_12)
					end
				end

				arg_197_1.var_.actorSpriteComps1060 = nil
			end

			local var_200_13 = 0
			local var_200_14 = 0.7

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_15 = arg_197_1:FormatText(StoryNameCfg[584].name)

				arg_197_1.leftNameTxt_.text = var_200_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_16 = arg_197_1:GetWordFromCfg(410031048)
				local var_200_17 = arg_197_1:FormatText(var_200_16.content)

				arg_197_1.text_.text = var_200_17

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_18 = 28
				local var_200_19 = utf8.len(var_200_17)
				local var_200_20 = var_200_18 <= 0 and var_200_14 or var_200_14 * (var_200_19 / var_200_18)

				if var_200_20 > 0 and var_200_14 < var_200_20 then
					arg_197_1.talkMaxDuration = var_200_20

					if var_200_20 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_13
					end
				end

				arg_197_1.text_.text = var_200_17
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031048", "story_v_out_410031.awb") ~= 0 then
					local var_200_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031048", "story_v_out_410031.awb") / 1000

					if var_200_21 + var_200_13 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_13
					end

					if var_200_16.prefab_name ~= "" and arg_197_1.actors_[var_200_16.prefab_name] ~= nil then
						local var_200_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_16.prefab_name].transform, "story_v_out_410031", "410031048", "story_v_out_410031.awb")

						arg_197_1:RecordAudio("410031048", var_200_22)
						arg_197_1:RecordAudio("410031048", var_200_22)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_410031", "410031048", "story_v_out_410031.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_410031", "410031048", "story_v_out_410031.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_23 = math.max(var_200_14, arg_197_1.talkMaxDuration)

			if var_200_13 <= arg_197_1.time_ and arg_197_1.time_ < var_200_13 + var_200_23 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_13) / var_200_23

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_13 + var_200_23 and arg_197_1.time_ < var_200_13 + var_200_23 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play410031049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 410031049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play410031050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1060"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.actorSpriteComps1060 == nil then
				arg_201_1.var_.actorSpriteComps1060 = var_204_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_2 = 0.034

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.actorSpriteComps1060 then
					for iter_204_0, iter_204_1 in pairs(arg_201_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_204_1 then
							local var_204_4 = Mathf.Lerp(iter_204_1.color.r, 0.5, var_204_3)

							iter_204_1.color = Color.New(var_204_4, var_204_4, var_204_4)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.actorSpriteComps1060 then
				local var_204_5 = 0.5

				for iter_204_2, iter_204_3 in pairs(arg_201_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_204_3 then
						iter_204_3.color = Color.New(var_204_5, var_204_5, var_204_5)
					end
				end

				arg_201_1.var_.actorSpriteComps1060 = nil
			end

			local var_204_6 = 0
			local var_204_7 = 1.4

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_8 = arg_201_1:GetWordFromCfg(410031049)
				local var_204_9 = arg_201_1:FormatText(var_204_8.content)

				arg_201_1.text_.text = var_204_9

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_10 = 56
				local var_204_11 = utf8.len(var_204_9)
				local var_204_12 = var_204_10 <= 0 and var_204_7 or var_204_7 * (var_204_11 / var_204_10)

				if var_204_12 > 0 and var_204_7 < var_204_12 then
					arg_201_1.talkMaxDuration = var_204_12

					if var_204_12 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_12 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_9
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_13 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_13 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_13

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_13 and arg_201_1.time_ < var_204_6 + var_204_13 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play410031050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 410031050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play410031051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.8

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

				local var_208_2 = arg_205_1:GetWordFromCfg(410031050)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 72
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
	Play410031051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 410031051
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play410031052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1060"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1060 = var_212_0.localPosition
				var_212_0.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("1060", 7)

				local var_212_2 = var_212_0.childCount

				for iter_212_0 = 0, var_212_2 - 1 do
					local var_212_3 = var_212_0:GetChild(iter_212_0)

					if var_212_3.name == "" or not string.find(var_212_3.name, "split") then
						var_212_3.gameObject:SetActive(true)
					else
						var_212_3.gameObject:SetActive(false)
					end
				end
			end

			local var_212_4 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_4 then
				local var_212_5 = (arg_209_1.time_ - var_212_1) / var_212_4
				local var_212_6 = Vector3.New(0, -2000, -40)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1060, var_212_6, var_212_5)
			end

			if arg_209_1.time_ >= var_212_1 + var_212_4 and arg_209_1.time_ < var_212_1 + var_212_4 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_212_7 = arg_209_1.actors_["1060"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.actorSpriteComps1060 == nil then
				arg_209_1.var_.actorSpriteComps1060 = var_212_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_9 = 0.034

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.actorSpriteComps1060 then
					for iter_212_1, iter_212_2 in pairs(arg_209_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_212_2 then
							local var_212_11 = Mathf.Lerp(iter_212_2.color.r, 0.5, var_212_10)

							iter_212_2.color = Color.New(var_212_11, var_212_11, var_212_11)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.actorSpriteComps1060 then
				local var_212_12 = 0.5

				for iter_212_3, iter_212_4 in pairs(arg_209_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_212_4 then
						iter_212_4.color = Color.New(var_212_12, var_212_12, var_212_12)
					end
				end

				arg_209_1.var_.actorSpriteComps1060 = nil
			end

			local var_212_13 = 0
			local var_212_14 = 1.425

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_15 = arg_209_1:GetWordFromCfg(410031051)
				local var_212_16 = arg_209_1:FormatText(var_212_15.content)

				arg_209_1.text_.text = var_212_16

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_17 = 57
				local var_212_18 = utf8.len(var_212_16)
				local var_212_19 = var_212_17 <= 0 and var_212_14 or var_212_14 * (var_212_18 / var_212_17)

				if var_212_19 > 0 and var_212_14 < var_212_19 then
					arg_209_1.talkMaxDuration = var_212_19

					if var_212_19 + var_212_13 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_13
					end
				end

				arg_209_1.text_.text = var_212_16
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_20 = math.max(var_212_14, arg_209_1.talkMaxDuration)

			if var_212_13 <= arg_209_1.time_ and arg_209_1.time_ < var_212_13 + var_212_20 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_13) / var_212_20

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_13 + var_212_20 and arg_209_1.time_ < var_212_13 + var_212_20 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play410031052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 410031052
		arg_213_1.duration_ = 9.333

		local var_213_0 = {
			zh = 6.533,
			ja = 9.333
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
				arg_213_0:Play410031053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.575

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[593].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fatherb")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(410031052)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 23
				local var_216_6 = utf8.len(var_216_4)
				local var_216_7 = var_216_5 <= 0 and var_216_1 or var_216_1 * (var_216_6 / var_216_5)

				if var_216_7 > 0 and var_216_1 < var_216_7 then
					arg_213_1.talkMaxDuration = var_216_7

					if var_216_7 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_7 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_4
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031052", "story_v_out_410031.awb") ~= 0 then
					local var_216_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031052", "story_v_out_410031.awb") / 1000

					if var_216_8 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_8 + var_216_0
					end

					if var_216_3.prefab_name ~= "" and arg_213_1.actors_[var_216_3.prefab_name] ~= nil then
						local var_216_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_3.prefab_name].transform, "story_v_out_410031", "410031052", "story_v_out_410031.awb")

						arg_213_1:RecordAudio("410031052", var_216_9)
						arg_213_1:RecordAudio("410031052", var_216_9)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_410031", "410031052", "story_v_out_410031.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_410031", "410031052", "story_v_out_410031.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_10 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_10 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_10

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_10 and arg_213_1.time_ < var_216_0 + var_216_10 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play410031053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410031053
		arg_217_1.duration_ = 10.033

		local var_217_0 = {
			zh = 9.166,
			ja = 10.033
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
				arg_217_0:Play410031054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.775

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[594].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(410031053)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031053", "story_v_out_410031.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031053", "story_v_out_410031.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_410031", "410031053", "story_v_out_410031.awb")

						arg_217_1:RecordAudio("410031053", var_220_9)
						arg_217_1:RecordAudio("410031053", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_410031", "410031053", "story_v_out_410031.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_410031", "410031053", "story_v_out_410031.awb")
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
	Play410031054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410031054
		arg_221_1.duration_ = 10.033

		local var_221_0 = {
			zh = 3.733,
			ja = 10.033
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play410031055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.325

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[594].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(410031054)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 13
				local var_224_6 = utf8.len(var_224_4)
				local var_224_7 = var_224_5 <= 0 and var_224_1 or var_224_1 * (var_224_6 / var_224_5)

				if var_224_7 > 0 and var_224_1 < var_224_7 then
					arg_221_1.talkMaxDuration = var_224_7

					if var_224_7 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_7 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_4
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031054", "story_v_out_410031.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031054", "story_v_out_410031.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_410031", "410031054", "story_v_out_410031.awb")

						arg_221_1:RecordAudio("410031054", var_224_9)
						arg_221_1:RecordAudio("410031054", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_410031", "410031054", "story_v_out_410031.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_410031", "410031054", "story_v_out_410031.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_10 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_10 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_10

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_10 and arg_221_1.time_ < var_224_0 + var_224_10 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play410031055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410031055
		arg_225_1.duration_ = 3.466

		local var_225_0 = {
			zh = 1.466,
			ja = 3.466
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play410031056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1060"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1060 = var_228_0.localPosition
				var_228_0.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("1060", 3)

				local var_228_2 = var_228_0.childCount

				for iter_228_0 = 0, var_228_2 - 1 do
					local var_228_3 = var_228_0:GetChild(iter_228_0)

					if var_228_3.name == "" or not string.find(var_228_3.name, "split") then
						var_228_3.gameObject:SetActive(true)
					else
						var_228_3.gameObject:SetActive(false)
					end
				end
			end

			local var_228_4 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_4 then
				local var_228_5 = (arg_225_1.time_ - var_228_1) / var_228_4
				local var_228_6 = Vector3.New(0, -435, -40)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1060, var_228_6, var_228_5)
			end

			if arg_225_1.time_ >= var_228_1 + var_228_4 and arg_225_1.time_ < var_228_1 + var_228_4 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_228_7 = arg_225_1.actors_["1060"]
			local var_228_8 = 0

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 == nil then
				arg_225_1.var_.actorSpriteComps1060 = var_228_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_9 = 0.034

			if var_228_8 <= arg_225_1.time_ and arg_225_1.time_ < var_228_8 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_8) / var_228_9

				if arg_225_1.var_.actorSpriteComps1060 then
					for iter_228_1, iter_228_2 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_228_2 then
							local var_228_11 = Mathf.Lerp(iter_228_2.color.r, 1, var_228_10)

							iter_228_2.color = Color.New(var_228_11, var_228_11, var_228_11)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_8 + var_228_9 and arg_225_1.time_ < var_228_8 + var_228_9 + arg_228_0 and arg_225_1.var_.actorSpriteComps1060 then
				local var_228_12 = 1

				for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_228_4 then
						iter_228_4.color = Color.New(var_228_12, var_228_12, var_228_12)
					end
				end

				arg_225_1.var_.actorSpriteComps1060 = nil
			end

			local var_228_13 = 0
			local var_228_14 = 0.225

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_15 = arg_225_1:FormatText(StoryNameCfg[584].name)

				arg_225_1.leftNameTxt_.text = var_228_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_16 = arg_225_1:GetWordFromCfg(410031055)
				local var_228_17 = arg_225_1:FormatText(var_228_16.content)

				arg_225_1.text_.text = var_228_17

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_18 = 9
				local var_228_19 = utf8.len(var_228_17)
				local var_228_20 = var_228_18 <= 0 and var_228_14 or var_228_14 * (var_228_19 / var_228_18)

				if var_228_20 > 0 and var_228_14 < var_228_20 then
					arg_225_1.talkMaxDuration = var_228_20

					if var_228_20 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_13
					end
				end

				arg_225_1.text_.text = var_228_17
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031055", "story_v_out_410031.awb") ~= 0 then
					local var_228_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031055", "story_v_out_410031.awb") / 1000

					if var_228_21 + var_228_13 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_13
					end

					if var_228_16.prefab_name ~= "" and arg_225_1.actors_[var_228_16.prefab_name] ~= nil then
						local var_228_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_16.prefab_name].transform, "story_v_out_410031", "410031055", "story_v_out_410031.awb")

						arg_225_1:RecordAudio("410031055", var_228_22)
						arg_225_1:RecordAudio("410031055", var_228_22)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_410031", "410031055", "story_v_out_410031.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_410031", "410031055", "story_v_out_410031.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_23 = math.max(var_228_14, arg_225_1.talkMaxDuration)

			if var_228_13 <= arg_225_1.time_ and arg_225_1.time_ < var_228_13 + var_228_23 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_13) / var_228_23

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_13 + var_228_23 and arg_225_1.time_ < var_228_13 + var_228_23 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410031056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 410031056
		arg_229_1.duration_ = 7

		local var_229_0 = {
			zh = 5.933,
			ja = 7
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
				arg_229_0:Play410031057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1060"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps1060 == nil then
				arg_229_1.var_.actorSpriteComps1060 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.034

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps1060 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 0.5, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps1060 then
				local var_232_5 = 0.5

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps1060 = nil
			end

			local var_232_6 = 0
			local var_232_7 = 0.3

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[594].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(410031056)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 12
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031056", "story_v_out_410031.awb") ~= 0 then
					local var_232_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031056", "story_v_out_410031.awb") / 1000

					if var_232_14 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_14 + var_232_6
					end

					if var_232_9.prefab_name ~= "" and arg_229_1.actors_[var_232_9.prefab_name] ~= nil then
						local var_232_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_9.prefab_name].transform, "story_v_out_410031", "410031056", "story_v_out_410031.awb")

						arg_229_1:RecordAudio("410031056", var_232_15)
						arg_229_1:RecordAudio("410031056", var_232_15)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_410031", "410031056", "story_v_out_410031.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_410031", "410031056", "story_v_out_410031.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_16 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_16 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_16

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_16 and arg_229_1.time_ < var_232_6 + var_232_16 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play410031057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 410031057
		arg_233_1.duration_ = 8.233

		local var_233_0 = {
			zh = 8.233,
			ja = 4.966
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play410031058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1060"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1060 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("1060", 3)

				local var_236_2 = var_236_0.childCount

				for iter_236_0 = 0, var_236_2 - 1 do
					local var_236_3 = var_236_0:GetChild(iter_236_0)

					if var_236_3.name == "split_3" or not string.find(var_236_3.name, "split") then
						var_236_3.gameObject:SetActive(true)
					else
						var_236_3.gameObject:SetActive(false)
					end
				end
			end

			local var_236_4 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_4 then
				local var_236_5 = (arg_233_1.time_ - var_236_1) / var_236_4
				local var_236_6 = Vector3.New(0, -435, -40)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1060, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_236_7 = arg_233_1.actors_["1060"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps1060 == nil then
				arg_233_1.var_.actorSpriteComps1060 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.034

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps1060 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 1, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps1060 then
				local var_236_12 = 1

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps1060 = nil
			end

			local var_236_13 = 0
			local var_236_14 = 1

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_15 = arg_233_1:FormatText(StoryNameCfg[584].name)

				arg_233_1.leftNameTxt_.text = var_236_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_16 = arg_233_1:GetWordFromCfg(410031057)
				local var_236_17 = arg_233_1:FormatText(var_236_16.content)

				arg_233_1.text_.text = var_236_17

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_18 = 40
				local var_236_19 = utf8.len(var_236_17)
				local var_236_20 = var_236_18 <= 0 and var_236_14 or var_236_14 * (var_236_19 / var_236_18)

				if var_236_20 > 0 and var_236_14 < var_236_20 then
					arg_233_1.talkMaxDuration = var_236_20

					if var_236_20 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_13
					end
				end

				arg_233_1.text_.text = var_236_17
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031057", "story_v_out_410031.awb") ~= 0 then
					local var_236_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031057", "story_v_out_410031.awb") / 1000

					if var_236_21 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_13
					end

					if var_236_16.prefab_name ~= "" and arg_233_1.actors_[var_236_16.prefab_name] ~= nil then
						local var_236_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_16.prefab_name].transform, "story_v_out_410031", "410031057", "story_v_out_410031.awb")

						arg_233_1:RecordAudio("410031057", var_236_22)
						arg_233_1:RecordAudio("410031057", var_236_22)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_410031", "410031057", "story_v_out_410031.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_410031", "410031057", "story_v_out_410031.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_23 = math.max(var_236_14, arg_233_1.talkMaxDuration)

			if var_236_13 <= arg_233_1.time_ and arg_233_1.time_ < var_236_13 + var_236_23 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_13) / var_236_23

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_13 + var_236_23 and arg_233_1.time_ < var_236_13 + var_236_23 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play410031058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410031058
		arg_237_1.duration_ = 9.933

		local var_237_0 = {
			zh = 7.3,
			ja = 9.933
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
				arg_237_0:Play410031059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1060"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps1060 == nil then
				arg_237_1.var_.actorSpriteComps1060 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.034

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps1060 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 0.5, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps1060 then
				local var_240_5 = 0.5

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps1060 = nil
			end

			local var_240_6 = 0
			local var_240_7 = 0.7

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[593].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, true)
				arg_237_1.iconController_:SetSelectedState("hero")

				arg_237_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fatherb")

				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(410031058)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 28
				local var_240_12 = utf8.len(var_240_10)
				local var_240_13 = var_240_11 <= 0 and var_240_7 or var_240_7 * (var_240_12 / var_240_11)

				if var_240_13 > 0 and var_240_7 < var_240_13 then
					arg_237_1.talkMaxDuration = var_240_13

					if var_240_13 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_10
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031058", "story_v_out_410031.awb") ~= 0 then
					local var_240_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031058", "story_v_out_410031.awb") / 1000

					if var_240_14 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_14 + var_240_6
					end

					if var_240_9.prefab_name ~= "" and arg_237_1.actors_[var_240_9.prefab_name] ~= nil then
						local var_240_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_9.prefab_name].transform, "story_v_out_410031", "410031058", "story_v_out_410031.awb")

						arg_237_1:RecordAudio("410031058", var_240_15)
						arg_237_1:RecordAudio("410031058", var_240_15)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_410031", "410031058", "story_v_out_410031.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_410031", "410031058", "story_v_out_410031.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_16 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_16 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_16

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_16 and arg_237_1.time_ < var_240_6 + var_240_16 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410031059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 410031059
		arg_241_1.duration_ = 7.1

		local var_241_0 = {
			zh = 3.533,
			ja = 7.1
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
				arg_241_0:Play410031060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1060"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1060 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("1060", 3)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "split_3" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(0, -435, -40)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1060, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_244_7 = arg_241_1.actors_["1060"]
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 == nil then
				arg_241_1.var_.actorSpriteComps1060 = var_244_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_9 = 0.034

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_9 then
				local var_244_10 = (arg_241_1.time_ - var_244_8) / var_244_9

				if arg_241_1.var_.actorSpriteComps1060 then
					for iter_244_1, iter_244_2 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_244_2 then
							local var_244_11 = Mathf.Lerp(iter_244_2.color.r, 1, var_244_10)

							iter_244_2.color = Color.New(var_244_11, var_244_11, var_244_11)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_8 + var_244_9 and arg_241_1.time_ < var_244_8 + var_244_9 + arg_244_0 and arg_241_1.var_.actorSpriteComps1060 then
				local var_244_12 = 1

				for iter_244_3, iter_244_4 in pairs(arg_241_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_244_4 then
						iter_244_4.color = Color.New(var_244_12, var_244_12, var_244_12)
					end
				end

				arg_241_1.var_.actorSpriteComps1060 = nil
			end

			local var_244_13 = 0
			local var_244_14 = 0.425

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_15 = arg_241_1:FormatText(StoryNameCfg[584].name)

				arg_241_1.leftNameTxt_.text = var_244_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_16 = arg_241_1:GetWordFromCfg(410031059)
				local var_244_17 = arg_241_1:FormatText(var_244_16.content)

				arg_241_1.text_.text = var_244_17

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_18 = 17
				local var_244_19 = utf8.len(var_244_17)
				local var_244_20 = var_244_18 <= 0 and var_244_14 or var_244_14 * (var_244_19 / var_244_18)

				if var_244_20 > 0 and var_244_14 < var_244_20 then
					arg_241_1.talkMaxDuration = var_244_20

					if var_244_20 + var_244_13 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_20 + var_244_13
					end
				end

				arg_241_1.text_.text = var_244_17
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031059", "story_v_out_410031.awb") ~= 0 then
					local var_244_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031059", "story_v_out_410031.awb") / 1000

					if var_244_21 + var_244_13 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_21 + var_244_13
					end

					if var_244_16.prefab_name ~= "" and arg_241_1.actors_[var_244_16.prefab_name] ~= nil then
						local var_244_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_16.prefab_name].transform, "story_v_out_410031", "410031059", "story_v_out_410031.awb")

						arg_241_1:RecordAudio("410031059", var_244_22)
						arg_241_1:RecordAudio("410031059", var_244_22)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_410031", "410031059", "story_v_out_410031.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_410031", "410031059", "story_v_out_410031.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_23 = math.max(var_244_14, arg_241_1.talkMaxDuration)

			if var_244_13 <= arg_241_1.time_ and arg_241_1.time_ < var_244_13 + var_244_23 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_13) / var_244_23

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_13 + var_244_23 and arg_241_1.time_ < var_244_13 + var_244_23 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play410031060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 410031060
		arg_245_1.duration_ = 10.366

		local var_245_0 = {
			zh = 10.366,
			ja = 8.833
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
				arg_245_0:Play410031061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1060"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 == nil then
				arg_245_1.var_.actorSpriteComps1060 = var_248_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_2 = 0.034

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.actorSpriteComps1060 then
					for iter_248_0, iter_248_1 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_248_1 then
							local var_248_4 = Mathf.Lerp(iter_248_1.color.r, 0.5, var_248_3)

							iter_248_1.color = Color.New(var_248_4, var_248_4, var_248_4)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.actorSpriteComps1060 then
				local var_248_5 = 0.5

				for iter_248_2, iter_248_3 in pairs(arg_245_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_248_3 then
						iter_248_3.color = Color.New(var_248_5, var_248_5, var_248_5)
					end
				end

				arg_245_1.var_.actorSpriteComps1060 = nil
			end

			local var_248_6 = 0
			local var_248_7 = 0.8

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[594].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, true)
				arg_245_1.iconController_:SetSelectedState("hero")

				arg_245_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(410031060)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 32
				local var_248_12 = utf8.len(var_248_10)
				local var_248_13 = var_248_11 <= 0 and var_248_7 or var_248_7 * (var_248_12 / var_248_11)

				if var_248_13 > 0 and var_248_7 < var_248_13 then
					arg_245_1.talkMaxDuration = var_248_13

					if var_248_13 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_10
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031060", "story_v_out_410031.awb") ~= 0 then
					local var_248_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031060", "story_v_out_410031.awb") / 1000

					if var_248_14 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_14 + var_248_6
					end

					if var_248_9.prefab_name ~= "" and arg_245_1.actors_[var_248_9.prefab_name] ~= nil then
						local var_248_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_9.prefab_name].transform, "story_v_out_410031", "410031060", "story_v_out_410031.awb")

						arg_245_1:RecordAudio("410031060", var_248_15)
						arg_245_1:RecordAudio("410031060", var_248_15)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_410031", "410031060", "story_v_out_410031.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_410031", "410031060", "story_v_out_410031.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_16 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_16 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_16

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_16 and arg_245_1.time_ < var_248_6 + var_248_16 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play410031061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 410031061
		arg_249_1.duration_ = 14.866

		local var_249_0 = {
			zh = 9.166,
			ja = 14.866
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
				arg_249_0:Play410031062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.7

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[593].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fatherb")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(410031061)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 28
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031061", "story_v_out_410031.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_410031", "410031061", "story_v_out_410031.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_410031", "410031061", "story_v_out_410031.awb")

						arg_249_1:RecordAudio("410031061", var_252_9)
						arg_249_1:RecordAudio("410031061", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_410031", "410031061", "story_v_out_410031.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_410031", "410031061", "story_v_out_410031.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play410031062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 410031062
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play410031063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1060"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1060 = var_256_0.localPosition
				var_256_0.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("1060", 7)

				local var_256_2 = var_256_0.childCount

				for iter_256_0 = 0, var_256_2 - 1 do
					local var_256_3 = var_256_0:GetChild(iter_256_0)

					if var_256_3.name == "" or not string.find(var_256_3.name, "split") then
						var_256_3.gameObject:SetActive(true)
					else
						var_256_3.gameObject:SetActive(false)
					end
				end
			end

			local var_256_4 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_4 then
				local var_256_5 = (arg_253_1.time_ - var_256_1) / var_256_4
				local var_256_6 = Vector3.New(0, -2000, -40)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1060, var_256_6, var_256_5)
			end

			if arg_253_1.time_ >= var_256_1 + var_256_4 and arg_253_1.time_ < var_256_1 + var_256_4 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0, -2000, -40)
			end

			local var_256_7 = arg_253_1.actors_["1060"]
			local var_256_8 = 0

			if var_256_8 < arg_253_1.time_ and arg_253_1.time_ <= var_256_8 + arg_256_0 and arg_253_1.var_.actorSpriteComps1060 == nil then
				arg_253_1.var_.actorSpriteComps1060 = var_256_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_9 = 0.034

			if var_256_8 <= arg_253_1.time_ and arg_253_1.time_ < var_256_8 + var_256_9 then
				local var_256_10 = (arg_253_1.time_ - var_256_8) / var_256_9

				if arg_253_1.var_.actorSpriteComps1060 then
					for iter_256_1, iter_256_2 in pairs(arg_253_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_256_2 then
							local var_256_11 = Mathf.Lerp(iter_256_2.color.r, 0.5, var_256_10)

							iter_256_2.color = Color.New(var_256_11, var_256_11, var_256_11)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_8 + var_256_9 and arg_253_1.time_ < var_256_8 + var_256_9 + arg_256_0 and arg_253_1.var_.actorSpriteComps1060 then
				local var_256_12 = 0.5

				for iter_256_3, iter_256_4 in pairs(arg_253_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_256_4 then
						iter_256_4.color = Color.New(var_256_12, var_256_12, var_256_12)
					end
				end

				arg_253_1.var_.actorSpriteComps1060 = nil
			end

			local var_256_13 = 0
			local var_256_14 = 1.55

			if var_256_13 < arg_253_1.time_ and arg_253_1.time_ <= var_256_13 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_15 = arg_253_1:GetWordFromCfg(410031062)
				local var_256_16 = arg_253_1:FormatText(var_256_15.content)

				arg_253_1.text_.text = var_256_16

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_17 = 62
				local var_256_18 = utf8.len(var_256_16)
				local var_256_19 = var_256_17 <= 0 and var_256_14 or var_256_14 * (var_256_18 / var_256_17)

				if var_256_19 > 0 and var_256_14 < var_256_19 then
					arg_253_1.talkMaxDuration = var_256_19

					if var_256_19 + var_256_13 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_13
					end
				end

				arg_253_1.text_.text = var_256_16
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_20 = math.max(var_256_14, arg_253_1.talkMaxDuration)

			if var_256_13 <= arg_253_1.time_ and arg_253_1.time_ < var_256_13 + var_256_20 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_13) / var_256_20

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_13 + var_256_20 and arg_253_1.time_ < var_256_13 + var_256_20 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play410031063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 410031063
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play410031064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				local var_260_2 = "play"
				local var_260_3 = "effect"

				arg_257_1:AudioAction(var_260_2, var_260_3, "se_story_128", "se_story_128_burn", "")
			end

			local var_260_4 = 0
			local var_260_5 = 1

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				local var_260_6 = "play"
				local var_260_7 = "effect"

				arg_257_1:AudioAction(var_260_6, var_260_7, "se_story_17", "se_story_17_fire_loop", "")
			end

			local var_260_8 = 0
			local var_260_9 = 1.7

			if var_260_8 < arg_257_1.time_ and arg_257_1.time_ <= var_260_8 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_10 = arg_257_1:GetWordFromCfg(410031063)
				local var_260_11 = arg_257_1:FormatText(var_260_10.content)

				arg_257_1.text_.text = var_260_11

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_12 = 68
				local var_260_13 = utf8.len(var_260_11)
				local var_260_14 = var_260_12 <= 0 and var_260_9 or var_260_9 * (var_260_13 / var_260_12)

				if var_260_14 > 0 and var_260_9 < var_260_14 then
					arg_257_1.talkMaxDuration = var_260_14

					if var_260_14 + var_260_8 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_14 + var_260_8
					end
				end

				arg_257_1.text_.text = var_260_11
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_15 = math.max(var_260_9, arg_257_1.talkMaxDuration)

			if var_260_8 <= arg_257_1.time_ and arg_257_1.time_ < var_260_8 + var_260_15 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_8) / var_260_15

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_8 + var_260_15 and arg_257_1.time_ < var_260_8 + var_260_15 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play410031064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 410031064
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play410031065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 1

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				local var_264_2 = "play"
				local var_264_3 = "effect"

				arg_261_1:AudioAction(var_264_2, var_264_3, "se_story_128", "se_story_128_whoosh", "")
			end

			local var_264_4 = 0
			local var_264_5 = 1.45

			if var_264_4 < arg_261_1.time_ and arg_261_1.time_ <= var_264_4 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_6 = arg_261_1:GetWordFromCfg(410031064)
				local var_264_7 = arg_261_1:FormatText(var_264_6.content)

				arg_261_1.text_.text = var_264_7

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_8 = 58
				local var_264_9 = utf8.len(var_264_7)
				local var_264_10 = var_264_8 <= 0 and var_264_5 or var_264_5 * (var_264_9 / var_264_8)

				if var_264_10 > 0 and var_264_5 < var_264_10 then
					arg_261_1.talkMaxDuration = var_264_10

					if var_264_10 + var_264_4 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_10 + var_264_4
					end
				end

				arg_261_1.text_.text = var_264_7
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_11 = math.max(var_264_5, arg_261_1.talkMaxDuration)

			if var_264_4 <= arg_261_1.time_ and arg_261_1.time_ < var_264_4 + var_264_11 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_4) / var_264_11

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_4 + var_264_11 and arg_261_1.time_ < var_264_4 + var_264_11 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play410031065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 410031065
		arg_265_1.duration_ = 8.466

		local var_265_0 = {
			zh = 2.466,
			ja = 8.466
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
				arg_265_0:Play410031066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1060"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1060 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("1060", 3)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(0, -435, -40)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1060, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -435, -40)
			end

			local var_268_7 = arg_265_1.actors_["1060"]
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 and arg_265_1.var_.actorSpriteComps1060 == nil then
				arg_265_1.var_.actorSpriteComps1060 = var_268_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_9 = 0.034

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_9 then
				local var_268_10 = (arg_265_1.time_ - var_268_8) / var_268_9

				if arg_265_1.var_.actorSpriteComps1060 then
					for iter_268_1, iter_268_2 in pairs(arg_265_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_268_2 then
							local var_268_11 = Mathf.Lerp(iter_268_2.color.r, 1, var_268_10)

							iter_268_2.color = Color.New(var_268_11, var_268_11, var_268_11)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_8 + var_268_9 and arg_265_1.time_ < var_268_8 + var_268_9 + arg_268_0 and arg_265_1.var_.actorSpriteComps1060 then
				local var_268_12 = 1

				for iter_268_3, iter_268_4 in pairs(arg_265_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_268_4 then
						iter_268_4.color = Color.New(var_268_12, var_268_12, var_268_12)
					end
				end

				arg_265_1.var_.actorSpriteComps1060 = nil
			end

			local var_268_13 = 0
			local var_268_14 = 0.125

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_15 = arg_265_1:FormatText(StoryNameCfg[584].name)

				arg_265_1.leftNameTxt_.text = var_268_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_16 = arg_265_1:GetWordFromCfg(410031065)
				local var_268_17 = arg_265_1:FormatText(var_268_16.content)

				arg_265_1.text_.text = var_268_17

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_18 = 5
				local var_268_19 = utf8.len(var_268_17)
				local var_268_20 = var_268_18 <= 0 and var_268_14 or var_268_14 * (var_268_19 / var_268_18)

				if var_268_20 > 0 and var_268_14 < var_268_20 then
					arg_265_1.talkMaxDuration = var_268_20

					if var_268_20 + var_268_13 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_20 + var_268_13
					end
				end

				arg_265_1.text_.text = var_268_17
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031065", "story_v_out_410031.awb") ~= 0 then
					local var_268_21 = manager.audio:GetVoiceLength("story_v_out_410031", "410031065", "story_v_out_410031.awb") / 1000

					if var_268_21 + var_268_13 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_21 + var_268_13
					end

					if var_268_16.prefab_name ~= "" and arg_265_1.actors_[var_268_16.prefab_name] ~= nil then
						local var_268_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_16.prefab_name].transform, "story_v_out_410031", "410031065", "story_v_out_410031.awb")

						arg_265_1:RecordAudio("410031065", var_268_22)
						arg_265_1:RecordAudio("410031065", var_268_22)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_410031", "410031065", "story_v_out_410031.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_410031", "410031065", "story_v_out_410031.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_23 = math.max(var_268_14, arg_265_1.talkMaxDuration)

			if var_268_13 <= arg_265_1.time_ and arg_265_1.time_ < var_268_13 + var_268_23 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_13) / var_268_23

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_13 + var_268_23 and arg_265_1.time_ < var_268_13 + var_268_23 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play410031066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 410031066
		arg_269_1.duration_ = 6.966

		local var_269_0 = {
			zh = 5.466,
			ja = 6.966
		}
		local var_269_1 = manager.audio:GetLocalizationFlag()

		if var_269_0[var_269_1] ~= nil then
			arg_269_1.duration_ = var_269_0[var_269_1]
		end

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play410031067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1060"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.actorSpriteComps1060 == nil then
				arg_269_1.var_.actorSpriteComps1060 = var_272_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_2 = 0.034

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.actorSpriteComps1060 then
					for iter_272_0, iter_272_1 in pairs(arg_269_1.var_.actorSpriteComps1060:ToTable()) do
						if iter_272_1 then
							local var_272_4 = Mathf.Lerp(iter_272_1.color.r, 0.5, var_272_3)

							iter_272_1.color = Color.New(var_272_4, var_272_4, var_272_4)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.actorSpriteComps1060 then
				local var_272_5 = 0.5

				for iter_272_2, iter_272_3 in pairs(arg_269_1.var_.actorSpriteComps1060:ToTable()) do
					if iter_272_3 then
						iter_272_3.color = Color.New(var_272_5, var_272_5, var_272_5)
					end
				end

				arg_269_1.var_.actorSpriteComps1060 = nil
			end

			local var_272_6 = 0
			local var_272_7 = 0.475

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[594].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(410031066)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_410031", "410031066", "story_v_out_410031.awb") ~= 0 then
					local var_272_14 = manager.audio:GetVoiceLength("story_v_out_410031", "410031066", "story_v_out_410031.awb") / 1000

					if var_272_14 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_14 + var_272_6
					end

					if var_272_9.prefab_name ~= "" and arg_269_1.actors_[var_272_9.prefab_name] ~= nil then
						local var_272_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_9.prefab_name].transform, "story_v_out_410031", "410031066", "story_v_out_410031.awb")

						arg_269_1:RecordAudio("410031066", var_272_15)
						arg_269_1:RecordAudio("410031066", var_272_15)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_410031", "410031066", "story_v_out_410031.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_410031", "410031066", "story_v_out_410031.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_16 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_16 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_16

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_16 and arg_269_1.time_ < var_272_6 + var_272_16 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play410031067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 410031067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
			arg_273_1.auto_ = false
		end

		function arg_273_1.playNext_(arg_275_0)
			arg_273_1.onStoryFinished_()
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				local var_276_2 = "stop"
				local var_276_3 = "effect"

				arg_273_1:AudioAction(var_276_2, var_276_3, "se_story_17", "se_story_17_fire_loop", "")
			end

			local var_276_4 = 0
			local var_276_5 = 1.025

			if var_276_4 < arg_273_1.time_ and arg_273_1.time_ <= var_276_4 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_6 = arg_273_1:GetWordFromCfg(410031067)
				local var_276_7 = arg_273_1:FormatText(var_276_6.content)

				arg_273_1.text_.text = var_276_7

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_8 = 41
				local var_276_9 = utf8.len(var_276_7)
				local var_276_10 = var_276_8 <= 0 and var_276_5 or var_276_5 * (var_276_9 / var_276_8)

				if var_276_10 > 0 and var_276_5 < var_276_10 then
					arg_273_1.talkMaxDuration = var_276_10

					if var_276_10 + var_276_4 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_10 + var_276_4
					end
				end

				arg_273_1.text_.text = var_276_7
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_11 = math.max(var_276_5, arg_273_1.talkMaxDuration)

			if var_276_4 <= arg_273_1.time_ and arg_273_1.time_ < var_276_4 + var_276_11 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_4) / var_276_11

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_4 + var_276_11 and arg_273_1.time_ < var_276_4 + var_276_11 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST61",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L01g"
	},
	voices = {
		"story_v_out_410031.awb"
	}
}
