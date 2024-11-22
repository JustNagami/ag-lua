return {
	Play117081001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117081001
		arg_1_1.duration_ = 12.366

		local var_1_0 = {
			zh = 12.366,
			ja = 8.433
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
				arg_1_0:Play117081002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "TI0101"

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
				local var_4_5 = arg_1_1.bgs_.TI0101

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
					if iter_4_0 ~= "TI0101" then
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

			local var_4_26 = 2
			local var_4_27 = 1.25

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

				local var_4_29 = arg_1_1:FormatText(StoryNameCfg[368].name)

				arg_1_1.leftNameTxt_.text = var_4_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_30 = arg_1_1:GetWordFromCfg(117081001)
				local var_4_31 = arg_1_1:FormatText(var_4_30.content)

				arg_1_1.text_.text = var_4_31

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_32 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081001", "story_v_out_117081.awb") ~= 0 then
					local var_4_35 = manager.audio:GetVoiceLength("story_v_out_117081", "117081001", "story_v_out_117081.awb") / 1000

					if var_4_35 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_35 + var_4_26
					end

					if var_4_30.prefab_name ~= "" and arg_1_1.actors_[var_4_30.prefab_name] ~= nil then
						local var_4_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_30.prefab_name].transform, "story_v_out_117081", "117081001", "story_v_out_117081.awb")

						arg_1_1:RecordAudio("117081001", var_4_36)
						arg_1_1:RecordAudio("117081001", var_4_36)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_117081", "117081001", "story_v_out_117081.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_117081", "117081001", "story_v_out_117081.awb")
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
	Play117081002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117081002
		arg_7_1.duration_ = 11

		local var_7_0 = {
			zh = 9.2,
			ja = 11
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play117081003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.2

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[368].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(117081002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 48
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081002", "story_v_out_117081.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081002", "story_v_out_117081.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_117081", "117081002", "story_v_out_117081.awb")

						arg_7_1:RecordAudio("117081002", var_10_9)
						arg_7_1:RecordAudio("117081002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117081", "117081002", "story_v_out_117081.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117081", "117081002", "story_v_out_117081.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117081003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117081003
		arg_11_1.duration_ = 8

		local var_11_0 = {
			zh = 6.9,
			ja = 8
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
				arg_11_0:Play117081004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.9

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[368].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(117081003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 36
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081003", "story_v_out_117081.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081003", "story_v_out_117081.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_117081", "117081003", "story_v_out_117081.awb")

						arg_11_1:RecordAudio("117081003", var_14_9)
						arg_11_1:RecordAudio("117081003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117081", "117081003", "story_v_out_117081.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117081", "117081003", "story_v_out_117081.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play117081004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117081004
		arg_15_1.duration_ = 8.366

		local var_15_0 = {
			zh = 8.366,
			ja = 6.7
		}
		local var_15_1 = manager.audio:GetLocalizationFlag()

		if var_15_0[var_15_1] ~= nil then
			arg_15_1.duration_ = var_15_0[var_15_1]
		end

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play117081005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.15

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[368].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(117081004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 46
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081004", "story_v_out_117081.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081004", "story_v_out_117081.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_117081", "117081004", "story_v_out_117081.awb")

						arg_15_1:RecordAudio("117081004", var_18_9)
						arg_15_1:RecordAudio("117081004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117081", "117081004", "story_v_out_117081.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117081", "117081004", "story_v_out_117081.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117081005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117081005
		arg_19_1.duration_ = 8.999999999999

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play117081006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "ST24a"

			if arg_19_1.bgs_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_0)
				var_22_1.name = var_22_0
				var_22_1.transform.parent = arg_19_1.stage_.transform
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_0] = var_22_1
			end

			local var_22_2 = 1.999999999999

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				local var_22_3 = manager.ui.mainCamera.transform.localPosition
				local var_22_4 = Vector3.New(0, 0, 10) + Vector3.New(var_22_3.x, var_22_3.y, 0)
				local var_22_5 = arg_19_1.bgs_.ST24a

				var_22_5.transform.localPosition = var_22_4
				var_22_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_6 = var_22_5:GetComponent("SpriteRenderer")

				if var_22_6 and var_22_6.sprite then
					local var_22_7 = (var_22_5.transform.localPosition - var_22_3).z
					local var_22_8 = manager.ui.mainCameraCom_
					local var_22_9 = 2 * var_22_7 * Mathf.Tan(var_22_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_10 = var_22_9 * var_22_8.aspect
					local var_22_11 = var_22_6.sprite.bounds.size.x
					local var_22_12 = var_22_6.sprite.bounds.size.y
					local var_22_13 = var_22_10 / var_22_11
					local var_22_14 = var_22_9 / var_22_12
					local var_22_15 = var_22_14 < var_22_13 and var_22_13 or var_22_14

					var_22_5.transform.localScale = Vector3.New(var_22_15, var_22_15, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST24a" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_17 = 1.999999999999

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17
				local var_22_19 = Color.New(0, 0, 0)

				var_22_19.a = Mathf.Lerp(0, 1, var_22_18)
				arg_19_1.mask_.color = var_22_19
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				local var_22_20 = Color.New(0, 0, 0)

				var_22_20.a = 1
				arg_19_1.mask_.color = var_22_20
			end

			local var_22_21 = 2

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_22 = 1.999999999999

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_22 then
				local var_22_23 = (arg_19_1.time_ - var_22_21) / var_22_22
				local var_22_24 = Color.New(0, 0, 0)

				var_22_24.a = Mathf.Lerp(1, 0, var_22_23)
				arg_19_1.mask_.color = var_22_24
			end

			if arg_19_1.time_ >= var_22_21 + var_22_22 and arg_19_1.time_ < var_22_21 + var_22_22 + arg_22_0 then
				local var_22_25 = Color.New(0, 0, 0)
				local var_22_26 = 0

				arg_19_1.mask_.enabled = false
				var_22_25.a = var_22_26
				arg_19_1.mask_.color = var_22_25
			end

			local var_22_27 = 3.999999999999
			local var_22_28 = 1

			if var_22_27 < arg_19_1.time_ and arg_19_1.time_ <= var_22_27 + arg_22_0 then
				local var_22_29 = "play"
				local var_22_30 = "music"

				arg_19_1:AudioAction(var_22_29, var_22_30, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_22_31 = 0
			local var_22_32 = 1

			if var_22_31 < arg_19_1.time_ and arg_19_1.time_ <= var_22_31 + arg_22_0 then
				local var_22_33 = "play"
				local var_22_34 = "music"

				arg_19_1:AudioAction(var_22_33, var_22_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_35 = 3.999999999999
			local var_22_36 = 1.325

			if var_22_35 < arg_19_1.time_ and arg_19_1.time_ <= var_22_35 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_37 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_37:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_38 = arg_19_1:GetWordFromCfg(117081005)
				local var_22_39 = arg_19_1:FormatText(var_22_38.content)

				arg_19_1.text_.text = var_22_39

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_40 = 53
				local var_22_41 = utf8.len(var_22_39)
				local var_22_42 = var_22_40 <= 0 and var_22_36 or var_22_36 * (var_22_41 / var_22_40)

				if var_22_42 > 0 and var_22_36 < var_22_42 then
					arg_19_1.talkMaxDuration = var_22_42
					var_22_35 = var_22_35 + 0.3

					if var_22_42 + var_22_35 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_42 + var_22_35
					end
				end

				arg_19_1.text_.text = var_22_39
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_43 = var_22_35 + 0.3
			local var_22_44 = math.max(var_22_36, arg_19_1.talkMaxDuration)

			if var_22_43 <= arg_19_1.time_ and arg_19_1.time_ < var_22_43 + var_22_44 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_43) / var_22_44

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_43 + var_22_44 and arg_19_1.time_ < var_22_43 + var_22_44 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play117081006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 117081006
		arg_25_1.duration_ = 5.933

		local var_25_0 = {
			zh = 5.933,
			ja = 3.8
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
				arg_25_0:Play117081007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "10034"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_28_0), arg_25_1.canvasGo_.transform)

				var_28_1.transform:SetSiblingIndex(1)

				var_28_1.name = var_28_0
				var_28_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_25_1.actors_[var_28_0] = var_28_1
			end

			local var_28_2 = arg_25_1.actors_["10034"].transform
			local var_28_3 = 0

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				arg_25_1.var_.moveOldPos10034 = var_28_2.localPosition
				var_28_2.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("10034", 2)

				local var_28_4 = var_28_2.childCount

				for iter_28_0 = 0, var_28_4 - 1 do
					local var_28_5 = var_28_2:GetChild(iter_28_0)

					if var_28_5.name == "split_2" or not string.find(var_28_5.name, "split") then
						var_28_5.gameObject:SetActive(true)
					else
						var_28_5.gameObject:SetActive(false)
					end
				end
			end

			local var_28_6 = 0.001

			if var_28_3 <= arg_25_1.time_ and arg_25_1.time_ < var_28_3 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_3) / var_28_6
				local var_28_8 = Vector3.New(-390, -415, -290)

				var_28_2.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos10034, var_28_8, var_28_7)
			end

			if arg_25_1.time_ >= var_28_3 + var_28_6 and arg_25_1.time_ < var_28_3 + var_28_6 + arg_28_0 then
				var_28_2.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_28_9 = "10035"

			if arg_25_1.actors_[var_28_9] == nil then
				local var_28_10 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_28_9), arg_25_1.canvasGo_.transform)

				var_28_10.transform:SetSiblingIndex(1)

				var_28_10.name = var_28_9
				var_28_10.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_25_1.actors_[var_28_9] = var_28_10
			end

			local var_28_11 = arg_25_1.actors_["10035"].transform
			local var_28_12 = 0

			if var_28_12 < arg_25_1.time_ and arg_25_1.time_ <= var_28_12 + arg_28_0 then
				arg_25_1.var_.moveOldPos10035 = var_28_11.localPosition
				var_28_11.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("10035", 4)

				local var_28_13 = var_28_11.childCount

				for iter_28_1 = 0, var_28_13 - 1 do
					local var_28_14 = var_28_11:GetChild(iter_28_1)

					if var_28_14.name == "split_4" or not string.find(var_28_14.name, "split") then
						var_28_14.gameObject:SetActive(true)
					else
						var_28_14.gameObject:SetActive(false)
					end
				end
			end

			local var_28_15 = 0.001

			if var_28_12 <= arg_25_1.time_ and arg_25_1.time_ < var_28_12 + var_28_15 then
				local var_28_16 = (arg_25_1.time_ - var_28_12) / var_28_15
				local var_28_17 = Vector3.New(390, -410, -235)

				var_28_11.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos10035, var_28_17, var_28_16)
			end

			if arg_25_1.time_ >= var_28_12 + var_28_15 and arg_25_1.time_ < var_28_12 + var_28_15 + arg_28_0 then
				var_28_11.localPosition = Vector3.New(390, -410, -235)
			end

			local var_28_18 = arg_25_1.actors_["10034"]
			local var_28_19 = 0

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 then
				local var_28_20 = var_28_18:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_20 then
					arg_25_1.var_.alphaOldValue10034 = var_28_20.alpha
					arg_25_1.var_.characterEffect10034 = var_28_20
				end

				arg_25_1.var_.alphaOldValue10034 = 0
			end

			local var_28_21 = 0.333333333333333

			if var_28_19 <= arg_25_1.time_ and arg_25_1.time_ < var_28_19 + var_28_21 then
				local var_28_22 = (arg_25_1.time_ - var_28_19) / var_28_21
				local var_28_23 = Mathf.Lerp(arg_25_1.var_.alphaOldValue10034, 1, var_28_22)

				if arg_25_1.var_.characterEffect10034 then
					arg_25_1.var_.characterEffect10034.alpha = var_28_23
				end
			end

			if arg_25_1.time_ >= var_28_19 + var_28_21 and arg_25_1.time_ < var_28_19 + var_28_21 + arg_28_0 and arg_25_1.var_.characterEffect10034 then
				arg_25_1.var_.characterEffect10034.alpha = 1
			end

			local var_28_24 = arg_25_1.actors_["10035"]
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 then
				local var_28_26 = var_28_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_26 then
					arg_25_1.var_.alphaOldValue10035 = var_28_26.alpha
					arg_25_1.var_.characterEffect10035 = var_28_26
				end

				arg_25_1.var_.alphaOldValue10035 = 0
			end

			local var_28_27 = 0.333333333333333

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_27 then
				local var_28_28 = (arg_25_1.time_ - var_28_25) / var_28_27
				local var_28_29 = Mathf.Lerp(arg_25_1.var_.alphaOldValue10035, 1, var_28_28)

				if arg_25_1.var_.characterEffect10035 then
					arg_25_1.var_.characterEffect10035.alpha = var_28_29
				end
			end

			if arg_25_1.time_ >= var_28_25 + var_28_27 and arg_25_1.time_ < var_28_25 + var_28_27 + arg_28_0 and arg_25_1.var_.characterEffect10035 then
				arg_25_1.var_.characterEffect10035.alpha = 1
			end

			local var_28_30 = arg_25_1.actors_["10035"]
			local var_28_31 = 0

			if var_28_31 < arg_25_1.time_ and arg_25_1.time_ <= var_28_31 + arg_28_0 and arg_25_1.var_.actorSpriteComps10035 == nil then
				arg_25_1.var_.actorSpriteComps10035 = var_28_30:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_32 = 0.2

			if var_28_31 <= arg_25_1.time_ and arg_25_1.time_ < var_28_31 + var_28_32 then
				local var_28_33 = (arg_25_1.time_ - var_28_31) / var_28_32

				if arg_25_1.var_.actorSpriteComps10035 then
					for iter_28_2, iter_28_3 in pairs(arg_25_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_28_3 then
							local var_28_34 = Mathf.Lerp(iter_28_3.color.r, 0.5, var_28_33)

							iter_28_3.color = Color.New(var_28_34, var_28_34, var_28_34)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_31 + var_28_32 and arg_25_1.time_ < var_28_31 + var_28_32 + arg_28_0 and arg_25_1.var_.actorSpriteComps10035 then
				local var_28_35 = 0.5

				for iter_28_4, iter_28_5 in pairs(arg_25_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_28_5 then
						iter_28_5.color = Color.New(var_28_35, var_28_35, var_28_35)
					end
				end

				arg_25_1.var_.actorSpriteComps10035 = nil
			end

			local var_28_36 = arg_25_1.actors_["10034"]
			local var_28_37 = 0

			if var_28_37 < arg_25_1.time_ and arg_25_1.time_ <= var_28_37 + arg_28_0 and arg_25_1.var_.actorSpriteComps10034 == nil then
				arg_25_1.var_.actorSpriteComps10034 = var_28_36:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_38 = 0.2

			if var_28_37 <= arg_25_1.time_ and arg_25_1.time_ < var_28_37 + var_28_38 then
				local var_28_39 = (arg_25_1.time_ - var_28_37) / var_28_38

				if arg_25_1.var_.actorSpriteComps10034 then
					for iter_28_6, iter_28_7 in pairs(arg_25_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_28_7 then
							local var_28_40 = Mathf.Lerp(iter_28_7.color.r, 1, var_28_39)

							iter_28_7.color = Color.New(var_28_40, var_28_40, var_28_40)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_37 + var_28_38 and arg_25_1.time_ < var_28_37 + var_28_38 + arg_28_0 and arg_25_1.var_.actorSpriteComps10034 then
				local var_28_41 = 1

				for iter_28_8, iter_28_9 in pairs(arg_25_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_28_9 then
						iter_28_9.color = Color.New(var_28_41, var_28_41, var_28_41)
					end
				end

				arg_25_1.var_.actorSpriteComps10034 = nil
			end

			local var_28_42 = 0
			local var_28_43 = 0.55

			if var_28_42 < arg_25_1.time_ and arg_25_1.time_ <= var_28_42 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_44 = arg_25_1:FormatText(StoryNameCfg[367].name)

				arg_25_1.leftNameTxt_.text = var_28_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_45 = arg_25_1:GetWordFromCfg(117081006)
				local var_28_46 = arg_25_1:FormatText(var_28_45.content)

				arg_25_1.text_.text = var_28_46

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_47 = 22
				local var_28_48 = utf8.len(var_28_46)
				local var_28_49 = var_28_47 <= 0 and var_28_43 or var_28_43 * (var_28_48 / var_28_47)

				if var_28_49 > 0 and var_28_43 < var_28_49 then
					arg_25_1.talkMaxDuration = var_28_49

					if var_28_49 + var_28_42 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_49 + var_28_42
					end
				end

				arg_25_1.text_.text = var_28_46
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081006", "story_v_out_117081.awb") ~= 0 then
					local var_28_50 = manager.audio:GetVoiceLength("story_v_out_117081", "117081006", "story_v_out_117081.awb") / 1000

					if var_28_50 + var_28_42 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_50 + var_28_42
					end

					if var_28_45.prefab_name ~= "" and arg_25_1.actors_[var_28_45.prefab_name] ~= nil then
						local var_28_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_45.prefab_name].transform, "story_v_out_117081", "117081006", "story_v_out_117081.awb")

						arg_25_1:RecordAudio("117081006", var_28_51)
						arg_25_1:RecordAudio("117081006", var_28_51)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_117081", "117081006", "story_v_out_117081.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_117081", "117081006", "story_v_out_117081.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_52 = math.max(var_28_43, arg_25_1.talkMaxDuration)

			if var_28_42 <= arg_25_1.time_ and arg_25_1.time_ < var_28_42 + var_28_52 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_42) / var_28_52

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_42 + var_28_52 and arg_25_1.time_ < var_28_42 + var_28_52 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play117081007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 117081007
		arg_29_1.duration_ = 6.033

		local var_29_0 = {
			zh = 3.1,
			ja = 6.033
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
				arg_29_0:Play117081008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10035"]
			local var_32_1 = 0.0333333333333333

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.actorSpriteComps10035 == nil then
				arg_29_1.var_.actorSpriteComps10035 = var_32_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_2 = 0.2

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.actorSpriteComps10035 then
					for iter_32_0, iter_32_1 in pairs(arg_29_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_32_1 then
							local var_32_4 = Mathf.Lerp(iter_32_1.color.r, 1, var_32_3)

							iter_32_1.color = Color.New(var_32_4, var_32_4, var_32_4)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.actorSpriteComps10035 then
				local var_32_5 = 1

				for iter_32_2, iter_32_3 in pairs(arg_29_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_32_3 then
						iter_32_3.color = Color.New(var_32_5, var_32_5, var_32_5)
					end
				end

				arg_29_1.var_.actorSpriteComps10035 = nil
			end

			local var_32_6 = arg_29_1.actors_["10034"]
			local var_32_7 = 0.0333333333333333

			if var_32_7 < arg_29_1.time_ and arg_29_1.time_ <= var_32_7 + arg_32_0 and arg_29_1.var_.actorSpriteComps10034 == nil then
				arg_29_1.var_.actorSpriteComps10034 = var_32_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_8 = 0.2

			if var_32_7 <= arg_29_1.time_ and arg_29_1.time_ < var_32_7 + var_32_8 then
				local var_32_9 = (arg_29_1.time_ - var_32_7) / var_32_8

				if arg_29_1.var_.actorSpriteComps10034 then
					for iter_32_4, iter_32_5 in pairs(arg_29_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_32_5 then
							local var_32_10 = Mathf.Lerp(iter_32_5.color.r, 0.5, var_32_9)

							iter_32_5.color = Color.New(var_32_10, var_32_10, var_32_10)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_7 + var_32_8 and arg_29_1.time_ < var_32_7 + var_32_8 + arg_32_0 and arg_29_1.var_.actorSpriteComps10034 then
				local var_32_11 = 0.5

				for iter_32_6, iter_32_7 in pairs(arg_29_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_32_7 then
						iter_32_7.color = Color.New(var_32_11, var_32_11, var_32_11)
					end
				end

				arg_29_1.var_.actorSpriteComps10034 = nil
			end

			local var_32_12 = 0
			local var_32_13 = 0.3

			if var_32_12 < arg_29_1.time_ and arg_29_1.time_ <= var_32_12 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_14 = arg_29_1:FormatText(StoryNameCfg[369].name)

				arg_29_1.leftNameTxt_.text = var_32_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_15 = arg_29_1:GetWordFromCfg(117081007)
				local var_32_16 = arg_29_1:FormatText(var_32_15.content)

				arg_29_1.text_.text = var_32_16

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_17 = 12
				local var_32_18 = utf8.len(var_32_16)
				local var_32_19 = var_32_17 <= 0 and var_32_13 or var_32_13 * (var_32_18 / var_32_17)

				if var_32_19 > 0 and var_32_13 < var_32_19 then
					arg_29_1.talkMaxDuration = var_32_19

					if var_32_19 + var_32_12 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_19 + var_32_12
					end
				end

				arg_29_1.text_.text = var_32_16
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081007", "story_v_out_117081.awb") ~= 0 then
					local var_32_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081007", "story_v_out_117081.awb") / 1000

					if var_32_20 + var_32_12 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_20 + var_32_12
					end

					if var_32_15.prefab_name ~= "" and arg_29_1.actors_[var_32_15.prefab_name] ~= nil then
						local var_32_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_15.prefab_name].transform, "story_v_out_117081", "117081007", "story_v_out_117081.awb")

						arg_29_1:RecordAudio("117081007", var_32_21)
						arg_29_1:RecordAudio("117081007", var_32_21)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_117081", "117081007", "story_v_out_117081.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_117081", "117081007", "story_v_out_117081.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_22 = math.max(var_32_13, arg_29_1.talkMaxDuration)

			if var_32_12 <= arg_29_1.time_ and arg_29_1.time_ < var_32_12 + var_32_22 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_12) / var_32_22

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_12 + var_32_22 and arg_29_1.time_ < var_32_12 + var_32_22 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play117081008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 117081008
		arg_33_1.duration_ = 6.366

		local var_33_0 = {
			zh = 6.066,
			ja = 6.366
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
				arg_33_0:Play117081009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.8

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[369].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(117081008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081008", "story_v_out_117081.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081008", "story_v_out_117081.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_117081", "117081008", "story_v_out_117081.awb")

						arg_33_1:RecordAudio("117081008", var_36_9)
						arg_33_1:RecordAudio("117081008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_117081", "117081008", "story_v_out_117081.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_117081", "117081008", "story_v_out_117081.awb")
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
	Play117081009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 117081009
		arg_37_1.duration_ = 4.7

		local var_37_0 = {
			zh = 3.966,
			ja = 4.7
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
				arg_37_0:Play117081010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["10035"]
			local var_40_1 = 0.0333333333333333

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.actorSpriteComps10035 == nil then
				arg_37_1.var_.actorSpriteComps10035 = var_40_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.actorSpriteComps10035 then
					for iter_40_0, iter_40_1 in pairs(arg_37_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_40_1 then
							local var_40_4 = Mathf.Lerp(iter_40_1.color.r, 0.5, var_40_3)

							iter_40_1.color = Color.New(var_40_4, var_40_4, var_40_4)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.actorSpriteComps10035 then
				local var_40_5 = 0.5

				for iter_40_2, iter_40_3 in pairs(arg_37_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_40_3 then
						iter_40_3.color = Color.New(var_40_5, var_40_5, var_40_5)
					end
				end

				arg_37_1.var_.actorSpriteComps10035 = nil
			end

			local var_40_6 = arg_37_1.actors_["10034"]
			local var_40_7 = 0.0333333333333333

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 and arg_37_1.var_.actorSpriteComps10034 == nil then
				arg_37_1.var_.actorSpriteComps10034 = var_40_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_8 = 0.2

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_8 then
				local var_40_9 = (arg_37_1.time_ - var_40_7) / var_40_8

				if arg_37_1.var_.actorSpriteComps10034 then
					for iter_40_4, iter_40_5 in pairs(arg_37_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_40_5 then
							local var_40_10 = Mathf.Lerp(iter_40_5.color.r, 1, var_40_9)

							iter_40_5.color = Color.New(var_40_10, var_40_10, var_40_10)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_8 and arg_37_1.time_ < var_40_7 + var_40_8 + arg_40_0 and arg_37_1.var_.actorSpriteComps10034 then
				local var_40_11 = 1

				for iter_40_6, iter_40_7 in pairs(arg_37_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_40_7 then
						iter_40_7.color = Color.New(var_40_11, var_40_11, var_40_11)
					end
				end

				arg_37_1.var_.actorSpriteComps10034 = nil
			end

			local var_40_12 = 0
			local var_40_13 = 0.375

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_14 = arg_37_1:FormatText(StoryNameCfg[367].name)

				arg_37_1.leftNameTxt_.text = var_40_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_15 = arg_37_1:GetWordFromCfg(117081009)
				local var_40_16 = arg_37_1:FormatText(var_40_15.content)

				arg_37_1.text_.text = var_40_16

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_17 = 15
				local var_40_18 = utf8.len(var_40_16)
				local var_40_19 = var_40_17 <= 0 and var_40_13 or var_40_13 * (var_40_18 / var_40_17)

				if var_40_19 > 0 and var_40_13 < var_40_19 then
					arg_37_1.talkMaxDuration = var_40_19

					if var_40_19 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_19 + var_40_12
					end
				end

				arg_37_1.text_.text = var_40_16
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081009", "story_v_out_117081.awb") ~= 0 then
					local var_40_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081009", "story_v_out_117081.awb") / 1000

					if var_40_20 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_20 + var_40_12
					end

					if var_40_15.prefab_name ~= "" and arg_37_1.actors_[var_40_15.prefab_name] ~= nil then
						local var_40_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_15.prefab_name].transform, "story_v_out_117081", "117081009", "story_v_out_117081.awb")

						arg_37_1:RecordAudio("117081009", var_40_21)
						arg_37_1:RecordAudio("117081009", var_40_21)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_117081", "117081009", "story_v_out_117081.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_117081", "117081009", "story_v_out_117081.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_22 = math.max(var_40_13, arg_37_1.talkMaxDuration)

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_22 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_12) / var_40_22

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_12 + var_40_22 and arg_37_1.time_ < var_40_12 + var_40_22 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play117081010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 117081010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play117081011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10034"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.actorSpriteComps10034 == nil then
				arg_41_1.var_.actorSpriteComps10034 = var_44_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.actorSpriteComps10034 then
					for iter_44_0, iter_44_1 in pairs(arg_41_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_44_1 then
							local var_44_4 = Mathf.Lerp(iter_44_1.color.r, 0.5, var_44_3)

							iter_44_1.color = Color.New(var_44_4, var_44_4, var_44_4)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.actorSpriteComps10034 then
				local var_44_5 = 0.5

				for iter_44_2, iter_44_3 in pairs(arg_41_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_44_3 then
						iter_44_3.color = Color.New(var_44_5, var_44_5, var_44_5)
					end
				end

				arg_41_1.var_.actorSpriteComps10034 = nil
			end

			local var_44_6 = 0
			local var_44_7 = 1

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				local var_44_8 = "play"
				local var_44_9 = "effect"

				arg_41_1:AudioAction(var_44_8, var_44_9, "se_story_side_1080", "se_story_1080_knock", "")
			end

			local var_44_10 = 0
			local var_44_11 = 0.475

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_12 = arg_41_1:GetWordFromCfg(117081010)
				local var_44_13 = arg_41_1:FormatText(var_44_12.content)

				arg_41_1.text_.text = var_44_13

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_14 = 19
				local var_44_15 = utf8.len(var_44_13)
				local var_44_16 = var_44_14 <= 0 and var_44_11 or var_44_11 * (var_44_15 / var_44_14)

				if var_44_16 > 0 and var_44_11 < var_44_16 then
					arg_41_1.talkMaxDuration = var_44_16

					if var_44_16 + var_44_10 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_16 + var_44_10
					end
				end

				arg_41_1.text_.text = var_44_13
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_17 = math.max(var_44_11, arg_41_1.talkMaxDuration)

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_17 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_10) / var_44_17

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_10 + var_44_17 and arg_41_1.time_ < var_44_10 + var_44_17 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play117081011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 117081011
		arg_45_1.duration_ = 3

		local var_45_0 = {
			zh = 2.4,
			ja = 3
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
				arg_45_0:Play117081012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10034"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.actorSpriteComps10034 == nil then
				arg_45_1.var_.actorSpriteComps10034 = var_48_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_2 = 0.2

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.actorSpriteComps10034 then
					for iter_48_0, iter_48_1 in pairs(arg_45_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_48_1 then
							local var_48_4 = Mathf.Lerp(iter_48_1.color.r, 1, var_48_3)

							iter_48_1.color = Color.New(var_48_4, var_48_4, var_48_4)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.actorSpriteComps10034 then
				local var_48_5 = 1

				for iter_48_2, iter_48_3 in pairs(arg_45_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_48_3 then
						iter_48_3.color = Color.New(var_48_5, var_48_5, var_48_5)
					end
				end

				arg_45_1.var_.actorSpriteComps10034 = nil
			end

			local var_48_6 = 0
			local var_48_7 = 0.15

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_8 = arg_45_1:FormatText(StoryNameCfg[367].name)

				arg_45_1.leftNameTxt_.text = var_48_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_9 = arg_45_1:GetWordFromCfg(117081011)
				local var_48_10 = arg_45_1:FormatText(var_48_9.content)

				arg_45_1.text_.text = var_48_10

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_11 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081011", "story_v_out_117081.awb") ~= 0 then
					local var_48_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081011", "story_v_out_117081.awb") / 1000

					if var_48_14 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_14 + var_48_6
					end

					if var_48_9.prefab_name ~= "" and arg_45_1.actors_[var_48_9.prefab_name] ~= nil then
						local var_48_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_9.prefab_name].transform, "story_v_out_117081", "117081011", "story_v_out_117081.awb")

						arg_45_1:RecordAudio("117081011", var_48_15)
						arg_45_1:RecordAudio("117081011", var_48_15)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_117081", "117081011", "story_v_out_117081.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_117081", "117081011", "story_v_out_117081.awb")
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
	Play117081012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 117081012
		arg_49_1.duration_ = 2.166

		local var_49_0 = {
			zh = 2.166,
			ja = 1.4
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
				arg_49_0:Play117081013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10035"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos10035 = var_52_0.localPosition
				var_52_0.localScale = Vector3.New(1, 1, 1)

				arg_49_1:CheckSpriteTmpPos("10035", 4)

				local var_52_2 = var_52_0.childCount

				for iter_52_0 = 0, var_52_2 - 1 do
					local var_52_3 = var_52_0:GetChild(iter_52_0)

					if var_52_3.name == "split_1" or not string.find(var_52_3.name, "split") then
						var_52_3.gameObject:SetActive(true)
					else
						var_52_3.gameObject:SetActive(false)
					end
				end
			end

			local var_52_4 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_4 then
				local var_52_5 = (arg_49_1.time_ - var_52_1) / var_52_4
				local var_52_6 = Vector3.New(390, -410, -235)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10035, var_52_6, var_52_5)
			end

			if arg_49_1.time_ >= var_52_1 + var_52_4 and arg_49_1.time_ < var_52_1 + var_52_4 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_52_7 = arg_49_1.actors_["10034"]
			local var_52_8 = 0

			if var_52_8 < arg_49_1.time_ and arg_49_1.time_ <= var_52_8 + arg_52_0 and arg_49_1.var_.actorSpriteComps10034 == nil then
				arg_49_1.var_.actorSpriteComps10034 = var_52_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_9 = 0.2

			if var_52_8 <= arg_49_1.time_ and arg_49_1.time_ < var_52_8 + var_52_9 then
				local var_52_10 = (arg_49_1.time_ - var_52_8) / var_52_9

				if arg_49_1.var_.actorSpriteComps10034 then
					for iter_52_1, iter_52_2 in pairs(arg_49_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_52_2 then
							local var_52_11 = Mathf.Lerp(iter_52_2.color.r, 0.5, var_52_10)

							iter_52_2.color = Color.New(var_52_11, var_52_11, var_52_11)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_8 + var_52_9 and arg_49_1.time_ < var_52_8 + var_52_9 + arg_52_0 and arg_49_1.var_.actorSpriteComps10034 then
				local var_52_12 = 0.5

				for iter_52_3, iter_52_4 in pairs(arg_49_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_52_4 then
						iter_52_4.color = Color.New(var_52_12, var_52_12, var_52_12)
					end
				end

				arg_49_1.var_.actorSpriteComps10034 = nil
			end

			local var_52_13 = arg_49_1.actors_["10035"]
			local var_52_14 = 0

			if var_52_14 < arg_49_1.time_ and arg_49_1.time_ <= var_52_14 + arg_52_0 and arg_49_1.var_.actorSpriteComps10035 == nil then
				arg_49_1.var_.actorSpriteComps10035 = var_52_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_15 = 0.2

			if var_52_14 <= arg_49_1.time_ and arg_49_1.time_ < var_52_14 + var_52_15 then
				local var_52_16 = (arg_49_1.time_ - var_52_14) / var_52_15

				if arg_49_1.var_.actorSpriteComps10035 then
					for iter_52_5, iter_52_6 in pairs(arg_49_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_52_6 then
							local var_52_17 = Mathf.Lerp(iter_52_6.color.r, 1, var_52_16)

							iter_52_6.color = Color.New(var_52_17, var_52_17, var_52_17)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_14 + var_52_15 and arg_49_1.time_ < var_52_14 + var_52_15 + arg_52_0 and arg_49_1.var_.actorSpriteComps10035 then
				local var_52_18 = 1

				for iter_52_7, iter_52_8 in pairs(arg_49_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_52_8 then
						iter_52_8.color = Color.New(var_52_18, var_52_18, var_52_18)
					end
				end

				arg_49_1.var_.actorSpriteComps10035 = nil
			end

			local var_52_19 = 0
			local var_52_20 = 0.125

			if var_52_19 < arg_49_1.time_ and arg_49_1.time_ <= var_52_19 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_21 = arg_49_1:FormatText(StoryNameCfg[369].name)

				arg_49_1.leftNameTxt_.text = var_52_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_22 = arg_49_1:GetWordFromCfg(117081012)
				local var_52_23 = arg_49_1:FormatText(var_52_22.content)

				arg_49_1.text_.text = var_52_23

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_24 = 5
				local var_52_25 = utf8.len(var_52_23)
				local var_52_26 = var_52_24 <= 0 and var_52_20 or var_52_20 * (var_52_25 / var_52_24)

				if var_52_26 > 0 and var_52_20 < var_52_26 then
					arg_49_1.talkMaxDuration = var_52_26

					if var_52_26 + var_52_19 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_26 + var_52_19
					end
				end

				arg_49_1.text_.text = var_52_23
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081012", "story_v_out_117081.awb") ~= 0 then
					local var_52_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081012", "story_v_out_117081.awb") / 1000

					if var_52_27 + var_52_19 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_27 + var_52_19
					end

					if var_52_22.prefab_name ~= "" and arg_49_1.actors_[var_52_22.prefab_name] ~= nil then
						local var_52_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_22.prefab_name].transform, "story_v_out_117081", "117081012", "story_v_out_117081.awb")

						arg_49_1:RecordAudio("117081012", var_52_28)
						arg_49_1:RecordAudio("117081012", var_52_28)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_117081", "117081012", "story_v_out_117081.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_117081", "117081012", "story_v_out_117081.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_29 = math.max(var_52_20, arg_49_1.talkMaxDuration)

			if var_52_19 <= arg_49_1.time_ and arg_49_1.time_ < var_52_19 + var_52_29 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_19) / var_52_29

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_19 + var_52_29 and arg_49_1.time_ < var_52_19 + var_52_29 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play117081013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 117081013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play117081014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10035"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos10035 = var_56_0.localPosition
				var_56_0.localScale = Vector3.New(1, 1, 1)

				arg_53_1:CheckSpriteTmpPos("10035", 4)

				local var_56_2 = var_56_0.childCount

				for iter_56_0 = 0, var_56_2 - 1 do
					local var_56_3 = var_56_0:GetChild(iter_56_0)

					if var_56_3.name == "split_1" or not string.find(var_56_3.name, "split") then
						var_56_3.gameObject:SetActive(true)
					else
						var_56_3.gameObject:SetActive(false)
					end
				end
			end

			local var_56_4 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_4 then
				local var_56_5 = (arg_53_1.time_ - var_56_1) / var_56_4
				local var_56_6 = Vector3.New(390, -410, -235)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos10035, var_56_6, var_56_5)
			end

			if arg_53_1.time_ >= var_56_1 + var_56_4 and arg_53_1.time_ < var_56_1 + var_56_4 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_56_7 = arg_53_1.actors_["10035"]
			local var_56_8 = 0

			if var_56_8 < arg_53_1.time_ and arg_53_1.time_ <= var_56_8 + arg_56_0 and arg_53_1.var_.actorSpriteComps10035 == nil then
				arg_53_1.var_.actorSpriteComps10035 = var_56_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_9 = 0.2

			if var_56_8 <= arg_53_1.time_ and arg_53_1.time_ < var_56_8 + var_56_9 then
				local var_56_10 = (arg_53_1.time_ - var_56_8) / var_56_9

				if arg_53_1.var_.actorSpriteComps10035 then
					for iter_56_1, iter_56_2 in pairs(arg_53_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_56_2 then
							local var_56_11 = Mathf.Lerp(iter_56_2.color.r, 0.5, var_56_10)

							iter_56_2.color = Color.New(var_56_11, var_56_11, var_56_11)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_8 + var_56_9 and arg_53_1.time_ < var_56_8 + var_56_9 + arg_56_0 and arg_53_1.var_.actorSpriteComps10035 then
				local var_56_12 = 0.5

				for iter_56_3, iter_56_4 in pairs(arg_53_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_56_4 then
						iter_56_4.color = Color.New(var_56_12, var_56_12, var_56_12)
					end
				end

				arg_53_1.var_.actorSpriteComps10035 = nil
			end

			local var_56_13 = 0
			local var_56_14 = 1.15

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_15 = arg_53_1:GetWordFromCfg(117081013)
				local var_56_16 = arg_53_1:FormatText(var_56_15.content)

				arg_53_1.text_.text = var_56_16

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_17 = 46
				local var_56_18 = utf8.len(var_56_16)
				local var_56_19 = var_56_17 <= 0 and var_56_14 or var_56_14 * (var_56_18 / var_56_17)

				if var_56_19 > 0 and var_56_14 < var_56_19 then
					arg_53_1.talkMaxDuration = var_56_19

					if var_56_19 + var_56_13 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_19 + var_56_13
					end
				end

				arg_53_1.text_.text = var_56_16
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_20 = math.max(var_56_14, arg_53_1.talkMaxDuration)

			if var_56_13 <= arg_53_1.time_ and arg_53_1.time_ < var_56_13 + var_56_20 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_13) / var_56_20

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_13 + var_56_20 and arg_53_1.time_ < var_56_13 + var_56_20 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play117081014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 117081014
		arg_57_1.duration_ = 5.666

		local var_57_0 = {
			zh = 5.666,
			ja = 4.333
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
				arg_57_0:Play117081015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10034"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10034 = var_60_0.localPosition
				var_60_0.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("10034", 2)

				local var_60_2 = var_60_0.childCount

				for iter_60_0 = 0, var_60_2 - 1 do
					local var_60_3 = var_60_0:GetChild(iter_60_0)

					if var_60_3.name == "split_2" or not string.find(var_60_3.name, "split") then
						var_60_3.gameObject:SetActive(true)
					else
						var_60_3.gameObject:SetActive(false)
					end
				end
			end

			local var_60_4 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_4 then
				local var_60_5 = (arg_57_1.time_ - var_60_1) / var_60_4
				local var_60_6 = Vector3.New(-390, -415, -290)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10034, var_60_6, var_60_5)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_4 and arg_57_1.time_ < var_60_1 + var_60_4 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_60_7 = arg_57_1.actors_["10034"]
			local var_60_8 = 0

			if var_60_8 < arg_57_1.time_ and arg_57_1.time_ <= var_60_8 + arg_60_0 and arg_57_1.var_.actorSpriteComps10034 == nil then
				arg_57_1.var_.actorSpriteComps10034 = var_60_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_9 = 0.2

			if var_60_8 <= arg_57_1.time_ and arg_57_1.time_ < var_60_8 + var_60_9 then
				local var_60_10 = (arg_57_1.time_ - var_60_8) / var_60_9

				if arg_57_1.var_.actorSpriteComps10034 then
					for iter_60_1, iter_60_2 in pairs(arg_57_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_60_2 then
							local var_60_11 = Mathf.Lerp(iter_60_2.color.r, 1, var_60_10)

							iter_60_2.color = Color.New(var_60_11, var_60_11, var_60_11)
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_8 + var_60_9 and arg_57_1.time_ < var_60_8 + var_60_9 + arg_60_0 and arg_57_1.var_.actorSpriteComps10034 then
				local var_60_12 = 1

				for iter_60_3, iter_60_4 in pairs(arg_57_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_60_4 then
						iter_60_4.color = Color.New(var_60_12, var_60_12, var_60_12)
					end
				end

				arg_57_1.var_.actorSpriteComps10034 = nil
			end

			local var_60_13 = 0
			local var_60_14 = 0.425

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_15 = arg_57_1:FormatText(StoryNameCfg[367].name)

				arg_57_1.leftNameTxt_.text = var_60_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_16 = arg_57_1:GetWordFromCfg(117081014)
				local var_60_17 = arg_57_1:FormatText(var_60_16.content)

				arg_57_1.text_.text = var_60_17

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_18 = 17
				local var_60_19 = utf8.len(var_60_17)
				local var_60_20 = var_60_18 <= 0 and var_60_14 or var_60_14 * (var_60_19 / var_60_18)

				if var_60_20 > 0 and var_60_14 < var_60_20 then
					arg_57_1.talkMaxDuration = var_60_20

					if var_60_20 + var_60_13 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_20 + var_60_13
					end
				end

				arg_57_1.text_.text = var_60_17
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081014", "story_v_out_117081.awb") ~= 0 then
					local var_60_21 = manager.audio:GetVoiceLength("story_v_out_117081", "117081014", "story_v_out_117081.awb") / 1000

					if var_60_21 + var_60_13 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_21 + var_60_13
					end

					if var_60_16.prefab_name ~= "" and arg_57_1.actors_[var_60_16.prefab_name] ~= nil then
						local var_60_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_16.prefab_name].transform, "story_v_out_117081", "117081014", "story_v_out_117081.awb")

						arg_57_1:RecordAudio("117081014", var_60_22)
						arg_57_1:RecordAudio("117081014", var_60_22)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_117081", "117081014", "story_v_out_117081.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_117081", "117081014", "story_v_out_117081.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_23 = math.max(var_60_14, arg_57_1.talkMaxDuration)

			if var_60_13 <= arg_57_1.time_ and arg_57_1.time_ < var_60_13 + var_60_23 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_13) / var_60_23

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_13 + var_60_23 and arg_57_1.time_ < var_60_13 + var_60_23 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play117081015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 117081015
		arg_61_1.duration_ = 3.3

		local var_61_0 = {
			zh = 3.3,
			ja = 2.8
		}
		local var_61_1 = manager.audio:GetLocalizationFlag()

		if var_61_0[var_61_1] ~= nil then
			arg_61_1.duration_ = var_61_0[var_61_1]
		end

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play117081016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10035"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos10035 = var_64_0.localPosition
				var_64_0.localScale = Vector3.New(1, 1, 1)

				arg_61_1:CheckSpriteTmpPos("10035", 4)

				local var_64_2 = var_64_0.childCount

				for iter_64_0 = 0, var_64_2 - 1 do
					local var_64_3 = var_64_0:GetChild(iter_64_0)

					if var_64_3.name == "split_4" or not string.find(var_64_3.name, "split") then
						var_64_3.gameObject:SetActive(true)
					else
						var_64_3.gameObject:SetActive(false)
					end
				end
			end

			local var_64_4 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_4 then
				local var_64_5 = (arg_61_1.time_ - var_64_1) / var_64_4
				local var_64_6 = Vector3.New(390, -410, -235)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10035, var_64_6, var_64_5)
			end

			if arg_61_1.time_ >= var_64_1 + var_64_4 and arg_61_1.time_ < var_64_1 + var_64_4 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_64_7 = arg_61_1.actors_["10035"]
			local var_64_8 = 0

			if var_64_8 < arg_61_1.time_ and arg_61_1.time_ <= var_64_8 + arg_64_0 and arg_61_1.var_.actorSpriteComps10035 == nil then
				arg_61_1.var_.actorSpriteComps10035 = var_64_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_9 = 0.2

			if var_64_8 <= arg_61_1.time_ and arg_61_1.time_ < var_64_8 + var_64_9 then
				local var_64_10 = (arg_61_1.time_ - var_64_8) / var_64_9

				if arg_61_1.var_.actorSpriteComps10035 then
					for iter_64_1, iter_64_2 in pairs(arg_61_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_64_2 then
							local var_64_11 = Mathf.Lerp(iter_64_2.color.r, 1, var_64_10)

							iter_64_2.color = Color.New(var_64_11, var_64_11, var_64_11)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_8 + var_64_9 and arg_61_1.time_ < var_64_8 + var_64_9 + arg_64_0 and arg_61_1.var_.actorSpriteComps10035 then
				local var_64_12 = 1

				for iter_64_3, iter_64_4 in pairs(arg_61_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_64_4 then
						iter_64_4.color = Color.New(var_64_12, var_64_12, var_64_12)
					end
				end

				arg_61_1.var_.actorSpriteComps10035 = nil
			end

			local var_64_13 = arg_61_1.actors_["10034"]
			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 and arg_61_1.var_.actorSpriteComps10034 == nil then
				arg_61_1.var_.actorSpriteComps10034 = var_64_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_15 = 0.2

			if var_64_14 <= arg_61_1.time_ and arg_61_1.time_ < var_64_14 + var_64_15 then
				local var_64_16 = (arg_61_1.time_ - var_64_14) / var_64_15

				if arg_61_1.var_.actorSpriteComps10034 then
					for iter_64_5, iter_64_6 in pairs(arg_61_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_64_6 then
							local var_64_17 = Mathf.Lerp(iter_64_6.color.r, 0.5, var_64_16)

							iter_64_6.color = Color.New(var_64_17, var_64_17, var_64_17)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_14 + var_64_15 and arg_61_1.time_ < var_64_14 + var_64_15 + arg_64_0 and arg_61_1.var_.actorSpriteComps10034 then
				local var_64_18 = 0.5

				for iter_64_7, iter_64_8 in pairs(arg_61_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_64_8 then
						iter_64_8.color = Color.New(var_64_18, var_64_18, var_64_18)
					end
				end

				arg_61_1.var_.actorSpriteComps10034 = nil
			end

			local var_64_19 = 0
			local var_64_20 = 0.275

			if var_64_19 < arg_61_1.time_ and arg_61_1.time_ <= var_64_19 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_21 = arg_61_1:FormatText(StoryNameCfg[369].name)

				arg_61_1.leftNameTxt_.text = var_64_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_22 = arg_61_1:GetWordFromCfg(117081015)
				local var_64_23 = arg_61_1:FormatText(var_64_22.content)

				arg_61_1.text_.text = var_64_23

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_24 = 11
				local var_64_25 = utf8.len(var_64_23)
				local var_64_26 = var_64_24 <= 0 and var_64_20 or var_64_20 * (var_64_25 / var_64_24)

				if var_64_26 > 0 and var_64_20 < var_64_26 then
					arg_61_1.talkMaxDuration = var_64_26

					if var_64_26 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_26 + var_64_19
					end
				end

				arg_61_1.text_.text = var_64_23
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081015", "story_v_out_117081.awb") ~= 0 then
					local var_64_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081015", "story_v_out_117081.awb") / 1000

					if var_64_27 + var_64_19 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_27 + var_64_19
					end

					if var_64_22.prefab_name ~= "" and arg_61_1.actors_[var_64_22.prefab_name] ~= nil then
						local var_64_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_22.prefab_name].transform, "story_v_out_117081", "117081015", "story_v_out_117081.awb")

						arg_61_1:RecordAudio("117081015", var_64_28)
						arg_61_1:RecordAudio("117081015", var_64_28)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_117081", "117081015", "story_v_out_117081.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_117081", "117081015", "story_v_out_117081.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_29 = math.max(var_64_20, arg_61_1.talkMaxDuration)

			if var_64_19 <= arg_61_1.time_ and arg_61_1.time_ < var_64_19 + var_64_29 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_19) / var_64_29

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_19 + var_64_29 and arg_61_1.time_ < var_64_19 + var_64_29 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play117081016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 117081016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play117081017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10035"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.actorSpriteComps10035 == nil then
				arg_65_1.var_.actorSpriteComps10035 = var_68_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_2 = 0.2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.actorSpriteComps10035 then
					for iter_68_0, iter_68_1 in pairs(arg_65_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_68_1 then
							local var_68_4 = Mathf.Lerp(iter_68_1.color.r, 0.5, var_68_3)

							iter_68_1.color = Color.New(var_68_4, var_68_4, var_68_4)
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.actorSpriteComps10035 then
				local var_68_5 = 0.5

				for iter_68_2, iter_68_3 in pairs(arg_65_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_68_3 then
						iter_68_3.color = Color.New(var_68_5, var_68_5, var_68_5)
					end
				end

				arg_65_1.var_.actorSpriteComps10035 = nil
			end

			local var_68_6 = 0
			local var_68_7 = 1.4

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_8 = arg_65_1:GetWordFromCfg(117081016)
				local var_68_9 = arg_65_1:FormatText(var_68_8.content)

				arg_65_1.text_.text = var_68_9

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_10 = 56
				local var_68_11 = utf8.len(var_68_9)
				local var_68_12 = var_68_10 <= 0 and var_68_7 or var_68_7 * (var_68_11 / var_68_10)

				if var_68_12 > 0 and var_68_7 < var_68_12 then
					arg_65_1.talkMaxDuration = var_68_12

					if var_68_12 + var_68_6 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_12 + var_68_6
					end
				end

				arg_65_1.text_.text = var_68_9
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_13 = math.max(var_68_7, arg_65_1.talkMaxDuration)

			if var_68_6 <= arg_65_1.time_ and arg_65_1.time_ < var_68_6 + var_68_13 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_6) / var_68_13

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_6 + var_68_13 and arg_65_1.time_ < var_68_6 + var_68_13 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play117081017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 117081017
		arg_69_1.duration_ = 3.933

		local var_69_0 = {
			zh = 3.933,
			ja = 1.033
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
				arg_69_0:Play117081018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1132"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_72_0), arg_69_1.canvasGo_.transform)

				var_72_1.transform:SetSiblingIndex(1)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_69_1.actors_[var_72_0] = var_72_1
			end

			local var_72_2 = arg_69_1.actors_["1132"].transform
			local var_72_3 = 0

			if var_72_3 < arg_69_1.time_ and arg_69_1.time_ <= var_72_3 + arg_72_0 then
				arg_69_1.var_.moveOldPos1132 = var_72_2.localPosition
				var_72_2.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("1132", 2)

				local var_72_4 = var_72_2.childCount

				for iter_72_0 = 0, var_72_4 - 1 do
					local var_72_5 = var_72_2:GetChild(iter_72_0)

					if var_72_5.name == "split_6" or not string.find(var_72_5.name, "split") then
						var_72_5.gameObject:SetActive(true)
					else
						var_72_5.gameObject:SetActive(false)
					end
				end
			end

			local var_72_6 = 0.001

			if var_72_3 <= arg_69_1.time_ and arg_69_1.time_ < var_72_3 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_3) / var_72_6
				local var_72_8 = Vector3.New(-390, -413, -185)

				var_72_2.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1132, var_72_8, var_72_7)
			end

			if arg_69_1.time_ >= var_72_3 + var_72_6 and arg_69_1.time_ < var_72_3 + var_72_6 + arg_72_0 then
				var_72_2.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_72_9 = arg_69_1.actors_["1132"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.actorSpriteComps1132 == nil then
				arg_69_1.var_.actorSpriteComps1132 = var_72_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_11 = 0.2

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.actorSpriteComps1132 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_72_2 then
							local var_72_13 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_12)

							iter_72_2.color = Color.New(var_72_13, var_72_13, var_72_13)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.actorSpriteComps1132 then
				local var_72_14 = 1

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_14, var_72_14, var_72_14)
					end
				end

				arg_69_1.var_.actorSpriteComps1132 = nil
			end

			local var_72_15 = 0
			local var_72_16 = 0.5

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_17 = arg_69_1:FormatText(StoryNameCfg[61].name)

				arg_69_1.leftNameTxt_.text = var_72_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_18 = arg_69_1:GetWordFromCfg(117081017)
				local var_72_19 = arg_69_1:FormatText(var_72_18.content)

				arg_69_1.text_.text = var_72_19

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_20 = 20
				local var_72_21 = utf8.len(var_72_19)
				local var_72_22 = var_72_20 <= 0 and var_72_16 or var_72_16 * (var_72_21 / var_72_20)

				if var_72_22 > 0 and var_72_16 < var_72_22 then
					arg_69_1.talkMaxDuration = var_72_22

					if var_72_22 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_19
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081017", "story_v_out_117081.awb") ~= 0 then
					local var_72_23 = manager.audio:GetVoiceLength("story_v_out_117081", "117081017", "story_v_out_117081.awb") / 1000

					if var_72_23 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_15
					end

					if var_72_18.prefab_name ~= "" and arg_69_1.actors_[var_72_18.prefab_name] ~= nil then
						local var_72_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_18.prefab_name].transform, "story_v_out_117081", "117081017", "story_v_out_117081.awb")

						arg_69_1:RecordAudio("117081017", var_72_24)
						arg_69_1:RecordAudio("117081017", var_72_24)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_117081", "117081017", "story_v_out_117081.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_117081", "117081017", "story_v_out_117081.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_25 and arg_69_1.time_ < var_72_15 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play117081018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 117081018
		arg_73_1.duration_ = 2.233

		local var_73_0 = {
			zh = 2.233,
			ja = 1.233
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play117081019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10035"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10035 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("10035", 4)

				local var_76_2 = var_76_0.childCount

				for iter_76_0 = 0, var_76_2 - 1 do
					local var_76_3 = var_76_0:GetChild(iter_76_0)

					if var_76_3.name == "split_4" or not string.find(var_76_3.name, "split") then
						var_76_3.gameObject:SetActive(true)
					else
						var_76_3.gameObject:SetActive(false)
					end
				end
			end

			local var_76_4 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_4 then
				local var_76_5 = (arg_73_1.time_ - var_76_1) / var_76_4
				local var_76_6 = Vector3.New(390, -410, -235)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10035, var_76_6, var_76_5)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_4 and arg_73_1.time_ < var_76_1 + var_76_4 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_76_7 = arg_73_1.actors_["1132"]
			local var_76_8 = 0

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps1132 == nil then
				arg_73_1.var_.actorSpriteComps1132 = var_76_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_9 = 0.2

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_8) / var_76_9

				if arg_73_1.var_.actorSpriteComps1132 then
					for iter_76_1, iter_76_2 in pairs(arg_73_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_76_2 then
							local var_76_11 = Mathf.Lerp(iter_76_2.color.r, 0.5, var_76_10)

							iter_76_2.color = Color.New(var_76_11, var_76_11, var_76_11)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_8 + var_76_9 and arg_73_1.time_ < var_76_8 + var_76_9 + arg_76_0 and arg_73_1.var_.actorSpriteComps1132 then
				local var_76_12 = 0.5

				for iter_76_3, iter_76_4 in pairs(arg_73_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_76_4 then
						iter_76_4.color = Color.New(var_76_12, var_76_12, var_76_12)
					end
				end

				arg_73_1.var_.actorSpriteComps1132 = nil
			end

			local var_76_13 = arg_73_1.actors_["10035"]
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 and arg_73_1.var_.actorSpriteComps10035 == nil then
				arg_73_1.var_.actorSpriteComps10035 = var_76_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_15 = 0.2

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15

				if arg_73_1.var_.actorSpriteComps10035 then
					for iter_76_5, iter_76_6 in pairs(arg_73_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_76_6 then
							local var_76_17 = Mathf.Lerp(iter_76_6.color.r, 1, var_76_16)

							iter_76_6.color = Color.New(var_76_17, var_76_17, var_76_17)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 and arg_73_1.var_.actorSpriteComps10035 then
				local var_76_18 = 1

				for iter_76_7, iter_76_8 in pairs(arg_73_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_76_8 then
						iter_76_8.color = Color.New(var_76_18, var_76_18, var_76_18)
					end
				end

				arg_73_1.var_.actorSpriteComps10035 = nil
			end

			local var_76_19 = 0
			local var_76_20 = 0.075

			if var_76_19 < arg_73_1.time_ and arg_73_1.time_ <= var_76_19 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_21 = arg_73_1:FormatText(StoryNameCfg[369].name)

				arg_73_1.leftNameTxt_.text = var_76_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_22 = arg_73_1:GetWordFromCfg(117081018)
				local var_76_23 = arg_73_1:FormatText(var_76_22.content)

				arg_73_1.text_.text = var_76_23

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_24 = 3
				local var_76_25 = utf8.len(var_76_23)
				local var_76_26 = var_76_24 <= 0 and var_76_20 or var_76_20 * (var_76_25 / var_76_24)

				if var_76_26 > 0 and var_76_20 < var_76_26 then
					arg_73_1.talkMaxDuration = var_76_26

					if var_76_26 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_26 + var_76_19
					end
				end

				arg_73_1.text_.text = var_76_23
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081018", "story_v_out_117081.awb") ~= 0 then
					local var_76_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081018", "story_v_out_117081.awb") / 1000

					if var_76_27 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_27 + var_76_19
					end

					if var_76_22.prefab_name ~= "" and arg_73_1.actors_[var_76_22.prefab_name] ~= nil then
						local var_76_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_22.prefab_name].transform, "story_v_out_117081", "117081018", "story_v_out_117081.awb")

						arg_73_1:RecordAudio("117081018", var_76_28)
						arg_73_1:RecordAudio("117081018", var_76_28)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_117081", "117081018", "story_v_out_117081.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_117081", "117081018", "story_v_out_117081.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_29 = math.max(var_76_20, arg_73_1.talkMaxDuration)

			if var_76_19 <= arg_73_1.time_ and arg_73_1.time_ < var_76_19 + var_76_29 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_19) / var_76_29

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_19 + var_76_29 and arg_73_1.time_ < var_76_19 + var_76_29 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play117081019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 117081019
		arg_77_1.duration_ = 7.133

		local var_77_0 = {
			zh = 4.666,
			ja = 7.133
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
				arg_77_0:Play117081020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10034"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10034 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10034", 4)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "split_2" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(390, -415, -290)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10034, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_80_7 = arg_77_1.actors_["10034"]
			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 and arg_77_1.var_.actorSpriteComps10034 == nil then
				arg_77_1.var_.actorSpriteComps10034 = var_80_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_9 = 0.2

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_9 then
				local var_80_10 = (arg_77_1.time_ - var_80_8) / var_80_9

				if arg_77_1.var_.actorSpriteComps10034 then
					for iter_80_1, iter_80_2 in pairs(arg_77_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_80_2 then
							local var_80_11 = Mathf.Lerp(iter_80_2.color.r, 1, var_80_10)

							iter_80_2.color = Color.New(var_80_11, var_80_11, var_80_11)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_8 + var_80_9 and arg_77_1.time_ < var_80_8 + var_80_9 + arg_80_0 and arg_77_1.var_.actorSpriteComps10034 then
				local var_80_12 = 1

				for iter_80_3, iter_80_4 in pairs(arg_77_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_80_4 then
						iter_80_4.color = Color.New(var_80_12, var_80_12, var_80_12)
					end
				end

				arg_77_1.var_.actorSpriteComps10034 = nil
			end

			local var_80_13 = 0
			local var_80_14 = 0.45

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_15 = arg_77_1:FormatText(StoryNameCfg[367].name)

				arg_77_1.leftNameTxt_.text = var_80_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_16 = arg_77_1:GetWordFromCfg(117081019)
				local var_80_17 = arg_77_1:FormatText(var_80_16.content)

				arg_77_1.text_.text = var_80_17

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_18 = 18
				local var_80_19 = utf8.len(var_80_17)
				local var_80_20 = var_80_18 <= 0 and var_80_14 or var_80_14 * (var_80_19 / var_80_18)

				if var_80_20 > 0 and var_80_14 < var_80_20 then
					arg_77_1.talkMaxDuration = var_80_20

					if var_80_20 + var_80_13 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_13
					end
				end

				arg_77_1.text_.text = var_80_17
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081019", "story_v_out_117081.awb") ~= 0 then
					local var_80_21 = manager.audio:GetVoiceLength("story_v_out_117081", "117081019", "story_v_out_117081.awb") / 1000

					if var_80_21 + var_80_13 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_21 + var_80_13
					end

					if var_80_16.prefab_name ~= "" and arg_77_1.actors_[var_80_16.prefab_name] ~= nil then
						local var_80_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_16.prefab_name].transform, "story_v_out_117081", "117081019", "story_v_out_117081.awb")

						arg_77_1:RecordAudio("117081019", var_80_22)
						arg_77_1:RecordAudio("117081019", var_80_22)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_117081", "117081019", "story_v_out_117081.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_117081", "117081019", "story_v_out_117081.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_23 = math.max(var_80_14, arg_77_1.talkMaxDuration)

			if var_80_13 <= arg_77_1.time_ and arg_77_1.time_ < var_80_13 + var_80_23 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_13) / var_80_23

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_13 + var_80_23 and arg_77_1.time_ < var_80_13 + var_80_23 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play117081020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 117081020
		arg_81_1.duration_ = 11.7

		local var_81_0 = {
			zh = 11.7,
			ja = 11.566
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
				arg_81_0:Play117081021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1132"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos1132 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("1132", 2)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "split_6" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(-390, -413, -185)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos1132, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_84_7 = arg_81_1.actors_["10034"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps10034 == nil then
				arg_81_1.var_.actorSpriteComps10034 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 0.2

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps10034 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_84_2 then
							local var_84_11 = Mathf.Lerp(iter_84_2.color.r, 0.5, var_84_10)

							iter_84_2.color = Color.New(var_84_11, var_84_11, var_84_11)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and arg_81_1.var_.actorSpriteComps10034 then
				local var_84_12 = 0.5

				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_84_4 then
						iter_84_4.color = Color.New(var_84_12, var_84_12, var_84_12)
					end
				end

				arg_81_1.var_.actorSpriteComps10034 = nil
			end

			local var_84_13 = arg_81_1.actors_["1132"]
			local var_84_14 = 0

			if var_84_14 < arg_81_1.time_ and arg_81_1.time_ <= var_84_14 + arg_84_0 and arg_81_1.var_.actorSpriteComps1132 == nil then
				arg_81_1.var_.actorSpriteComps1132 = var_84_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_15 = 0.2

			if var_84_14 <= arg_81_1.time_ and arg_81_1.time_ < var_84_14 + var_84_15 then
				local var_84_16 = (arg_81_1.time_ - var_84_14) / var_84_15

				if arg_81_1.var_.actorSpriteComps1132 then
					for iter_84_5, iter_84_6 in pairs(arg_81_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_84_6 then
							local var_84_17 = Mathf.Lerp(iter_84_6.color.r, 1, var_84_16)

							iter_84_6.color = Color.New(var_84_17, var_84_17, var_84_17)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_14 + var_84_15 and arg_81_1.time_ < var_84_14 + var_84_15 + arg_84_0 and arg_81_1.var_.actorSpriteComps1132 then
				local var_84_18 = 1

				for iter_84_7, iter_84_8 in pairs(arg_81_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_84_8 then
						iter_84_8.color = Color.New(var_84_18, var_84_18, var_84_18)
					end
				end

				arg_81_1.var_.actorSpriteComps1132 = nil
			end

			local var_84_19 = 0
			local var_84_20 = 1.175

			if var_84_19 < arg_81_1.time_ and arg_81_1.time_ <= var_84_19 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_21 = arg_81_1:FormatText(StoryNameCfg[61].name)

				arg_81_1.leftNameTxt_.text = var_84_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_22 = arg_81_1:GetWordFromCfg(117081020)
				local var_84_23 = arg_81_1:FormatText(var_84_22.content)

				arg_81_1.text_.text = var_84_23

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_24 = 46
				local var_84_25 = utf8.len(var_84_23)
				local var_84_26 = var_84_24 <= 0 and var_84_20 or var_84_20 * (var_84_25 / var_84_24)

				if var_84_26 > 0 and var_84_20 < var_84_26 then
					arg_81_1.talkMaxDuration = var_84_26

					if var_84_26 + var_84_19 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_26 + var_84_19
					end
				end

				arg_81_1.text_.text = var_84_23
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081020", "story_v_out_117081.awb") ~= 0 then
					local var_84_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081020", "story_v_out_117081.awb") / 1000

					if var_84_27 + var_84_19 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_27 + var_84_19
					end

					if var_84_22.prefab_name ~= "" and arg_81_1.actors_[var_84_22.prefab_name] ~= nil then
						local var_84_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_22.prefab_name].transform, "story_v_out_117081", "117081020", "story_v_out_117081.awb")

						arg_81_1:RecordAudio("117081020", var_84_28)
						arg_81_1:RecordAudio("117081020", var_84_28)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_117081", "117081020", "story_v_out_117081.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_117081", "117081020", "story_v_out_117081.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_29 = math.max(var_84_20, arg_81_1.talkMaxDuration)

			if var_84_19 <= arg_81_1.time_ and arg_81_1.time_ < var_84_19 + var_84_29 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_19) / var_84_29

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_19 + var_84_29 and arg_81_1.time_ < var_84_19 + var_84_29 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play117081021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 117081021
		arg_85_1.duration_ = 6.133

		local var_85_0 = {
			zh = 2.433,
			ja = 6.133
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play117081022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10034"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps10034 == nil then
				arg_85_1.var_.actorSpriteComps10034 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps10034 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 1, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps10034 then
				local var_88_5 = 1

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps10034 = nil
			end

			local var_88_6 = arg_85_1.actors_["1132"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.actorSpriteComps1132 == nil then
				arg_85_1.var_.actorSpriteComps1132 = var_88_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_8 = 0.2

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.actorSpriteComps1132 then
					for iter_88_4, iter_88_5 in pairs(arg_85_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_88_5 then
							local var_88_10 = Mathf.Lerp(iter_88_5.color.r, 0.5, var_88_9)

							iter_88_5.color = Color.New(var_88_10, var_88_10, var_88_10)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.actorSpriteComps1132 then
				local var_88_11 = 0.5

				for iter_88_6, iter_88_7 in pairs(arg_85_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_88_7 then
						iter_88_7.color = Color.New(var_88_11, var_88_11, var_88_11)
					end
				end

				arg_85_1.var_.actorSpriteComps1132 = nil
			end

			local var_88_12 = 0
			local var_88_13 = 0.25

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[367].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(117081021)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 10
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081021", "story_v_out_117081.awb") ~= 0 then
					local var_88_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081021", "story_v_out_117081.awb") / 1000

					if var_88_20 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_12
					end

					if var_88_15.prefab_name ~= "" and arg_85_1.actors_[var_88_15.prefab_name] ~= nil then
						local var_88_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_15.prefab_name].transform, "story_v_out_117081", "117081021", "story_v_out_117081.awb")

						arg_85_1:RecordAudio("117081021", var_88_21)
						arg_85_1:RecordAudio("117081021", var_88_21)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_117081", "117081021", "story_v_out_117081.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_117081", "117081021", "story_v_out_117081.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_22 and arg_85_1.time_ < var_88_12 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play117081022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 117081022
		arg_89_1.duration_ = 5.266

		local var_89_0 = {
			zh = 2.3,
			ja = 5.266
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
				arg_89_0:Play117081023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10034"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.actorSpriteComps10034 == nil then
				arg_89_1.var_.actorSpriteComps10034 = var_92_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.actorSpriteComps10034 then
					for iter_92_0, iter_92_1 in pairs(arg_89_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_92_1 then
							local var_92_4 = Mathf.Lerp(iter_92_1.color.r, 0.5, var_92_3)

							iter_92_1.color = Color.New(var_92_4, var_92_4, var_92_4)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.actorSpriteComps10034 then
				local var_92_5 = 0.5

				for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_92_3 then
						iter_92_3.color = Color.New(var_92_5, var_92_5, var_92_5)
					end
				end

				arg_89_1.var_.actorSpriteComps10034 = nil
			end

			local var_92_6 = arg_89_1.actors_["1132"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.actorSpriteComps1132 == nil then
				arg_89_1.var_.actorSpriteComps1132 = var_92_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_8 = 0.2

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.actorSpriteComps1132 then
					for iter_92_4, iter_92_5 in pairs(arg_89_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_92_5 then
							local var_92_10 = Mathf.Lerp(iter_92_5.color.r, 1, var_92_9)

							iter_92_5.color = Color.New(var_92_10, var_92_10, var_92_10)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.actorSpriteComps1132 then
				local var_92_11 = 1

				for iter_92_6, iter_92_7 in pairs(arg_89_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_92_7 then
						iter_92_7.color = Color.New(var_92_11, var_92_11, var_92_11)
					end
				end

				arg_89_1.var_.actorSpriteComps1132 = nil
			end

			local var_92_12 = 0
			local var_92_13 = 0.375

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[61].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(117081022)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 15
				local var_92_18 = utf8.len(var_92_16)
				local var_92_19 = var_92_17 <= 0 and var_92_13 or var_92_13 * (var_92_18 / var_92_17)

				if var_92_19 > 0 and var_92_13 < var_92_19 then
					arg_89_1.talkMaxDuration = var_92_19

					if var_92_19 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_12
					end
				end

				arg_89_1.text_.text = var_92_16
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081022", "story_v_out_117081.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081022", "story_v_out_117081.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_117081", "117081022", "story_v_out_117081.awb")

						arg_89_1:RecordAudio("117081022", var_92_21)
						arg_89_1:RecordAudio("117081022", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_117081", "117081022", "story_v_out_117081.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_117081", "117081022", "story_v_out_117081.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_22 = math.max(var_92_13, arg_89_1.talkMaxDuration)

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_22 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_12) / var_92_22

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_12 + var_92_22 and arg_89_1.time_ < var_92_12 + var_92_22 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play117081023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 117081023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play117081024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1132"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.actorSpriteComps1132 == nil then
				arg_93_1.var_.actorSpriteComps1132 = var_96_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.actorSpriteComps1132 then
					for iter_96_0, iter_96_1 in pairs(arg_93_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_96_1 then
							local var_96_4 = Mathf.Lerp(iter_96_1.color.r, 0.5, var_96_3)

							iter_96_1.color = Color.New(var_96_4, var_96_4, var_96_4)
						end
					end
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.actorSpriteComps1132 then
				local var_96_5 = 0.5

				for iter_96_2, iter_96_3 in pairs(arg_93_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_96_3 then
						iter_96_3.color = Color.New(var_96_5, var_96_5, var_96_5)
					end
				end

				arg_93_1.var_.actorSpriteComps1132 = nil
			end

			local var_96_6 = 0
			local var_96_7 = 0.925

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_8 = arg_93_1:GetWordFromCfg(117081023)
				local var_96_9 = arg_93_1:FormatText(var_96_8.content)

				arg_93_1.text_.text = var_96_9

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_10 = 37
				local var_96_11 = utf8.len(var_96_9)
				local var_96_12 = var_96_10 <= 0 and var_96_7 or var_96_7 * (var_96_11 / var_96_10)

				if var_96_12 > 0 and var_96_7 < var_96_12 then
					arg_93_1.talkMaxDuration = var_96_12

					if var_96_12 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_9
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_13 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_13 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_13

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_13 and arg_93_1.time_ < var_96_6 + var_96_13 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play117081024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 117081024
		arg_97_1.duration_ = 6.333

		local var_97_0 = {
			zh = 6.333,
			ja = 5.933
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
				arg_97_0:Play117081025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10034"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.actorSpriteComps10034 == nil then
				arg_97_1.var_.actorSpriteComps10034 = var_100_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_100_2 = 0.2

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.actorSpriteComps10034 then
					for iter_100_0, iter_100_1 in pairs(arg_97_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_100_1 then
							local var_100_4 = Mathf.Lerp(iter_100_1.color.r, 1, var_100_3)

							iter_100_1.color = Color.New(var_100_4, var_100_4, var_100_4)
						end
					end
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.actorSpriteComps10034 then
				local var_100_5 = 1

				for iter_100_2, iter_100_3 in pairs(arg_97_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_100_3 then
						iter_100_3.color = Color.New(var_100_5, var_100_5, var_100_5)
					end
				end

				arg_97_1.var_.actorSpriteComps10034 = nil
			end

			local var_100_6 = 0
			local var_100_7 = 0.525

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[367].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(117081024)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081024", "story_v_out_117081.awb") ~= 0 then
					local var_100_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081024", "story_v_out_117081.awb") / 1000

					if var_100_14 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_14 + var_100_6
					end

					if var_100_9.prefab_name ~= "" and arg_97_1.actors_[var_100_9.prefab_name] ~= nil then
						local var_100_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_9.prefab_name].transform, "story_v_out_117081", "117081024", "story_v_out_117081.awb")

						arg_97_1:RecordAudio("117081024", var_100_15)
						arg_97_1:RecordAudio("117081024", var_100_15)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_117081", "117081024", "story_v_out_117081.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_117081", "117081024", "story_v_out_117081.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_16 and arg_97_1.time_ < var_100_6 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play117081025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 117081025
		arg_101_1.duration_ = 5.1

		local var_101_0 = {
			zh = 5.1,
			ja = 2.7
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play117081026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10034"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.actorSpriteComps10034 == nil then
				arg_101_1.var_.actorSpriteComps10034 = var_104_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_104_2 = 0.2

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.actorSpriteComps10034 then
					for iter_104_0, iter_104_1 in pairs(arg_101_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_104_1 then
							local var_104_4 = Mathf.Lerp(iter_104_1.color.r, 0.5, var_104_3)

							iter_104_1.color = Color.New(var_104_4, var_104_4, var_104_4)
						end
					end
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.actorSpriteComps10034 then
				local var_104_5 = 0.5

				for iter_104_2, iter_104_3 in pairs(arg_101_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_104_3 then
						iter_104_3.color = Color.New(var_104_5, var_104_5, var_104_5)
					end
				end

				arg_101_1.var_.actorSpriteComps10034 = nil
			end

			local var_104_6 = 0
			local var_104_7 = 0.6

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[369].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_1")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(117081025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081025", "story_v_out_117081.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081025", "story_v_out_117081.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_117081", "117081025", "story_v_out_117081.awb")

						arg_101_1:RecordAudio("117081025", var_104_15)
						arg_101_1:RecordAudio("117081025", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_117081", "117081025", "story_v_out_117081.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_117081", "117081025", "story_v_out_117081.awb")
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
	Play117081026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 117081026
		arg_105_1.duration_ = 8.866

		local var_105_0 = {
			zh = 6.8,
			ja = 8.866
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
				arg_105_0:Play117081027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1132"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.actorSpriteComps1132 == nil then
				arg_105_1.var_.actorSpriteComps1132 = var_108_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_108_2 = 0.2

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.actorSpriteComps1132 then
					for iter_108_0, iter_108_1 in pairs(arg_105_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_108_1 then
							local var_108_4 = Mathf.Lerp(iter_108_1.color.r, 1, var_108_3)

							iter_108_1.color = Color.New(var_108_4, var_108_4, var_108_4)
						end
					end
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.actorSpriteComps1132 then
				local var_108_5 = 1

				for iter_108_2, iter_108_3 in pairs(arg_105_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_108_3 then
						iter_108_3.color = Color.New(var_108_5, var_108_5, var_108_5)
					end
				end

				arg_105_1.var_.actorSpriteComps1132 = nil
			end

			local var_108_6 = 0
			local var_108_7 = 0.8

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[61].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(117081026)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081026", "story_v_out_117081.awb") ~= 0 then
					local var_108_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081026", "story_v_out_117081.awb") / 1000

					if var_108_14 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_14 + var_108_6
					end

					if var_108_9.prefab_name ~= "" and arg_105_1.actors_[var_108_9.prefab_name] ~= nil then
						local var_108_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_9.prefab_name].transform, "story_v_out_117081", "117081026", "story_v_out_117081.awb")

						arg_105_1:RecordAudio("117081026", var_108_15)
						arg_105_1:RecordAudio("117081026", var_108_15)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_117081", "117081026", "story_v_out_117081.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_117081", "117081026", "story_v_out_117081.awb")
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
	Play117081027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 117081027
		arg_109_1.duration_ = 3.966

		local var_109_0 = {
			zh = 3.233,
			ja = 3.966
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play117081028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1132"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.actorSpriteComps1132 == nil then
				arg_109_1.var_.actorSpriteComps1132 = var_112_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.actorSpriteComps1132 then
					for iter_112_0, iter_112_1 in pairs(arg_109_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_112_1 then
							local var_112_4 = Mathf.Lerp(iter_112_1.color.r, 0.5, var_112_3)

							iter_112_1.color = Color.New(var_112_4, var_112_4, var_112_4)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.actorSpriteComps1132 then
				local var_112_5 = 0.5

				for iter_112_2, iter_112_3 in pairs(arg_109_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_112_3 then
						iter_112_3.color = Color.New(var_112_5, var_112_5, var_112_5)
					end
				end

				arg_109_1.var_.actorSpriteComps1132 = nil
			end

			local var_112_6 = arg_109_1.actors_["10034"]
			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 and arg_109_1.var_.actorSpriteComps10034 == nil then
				arg_109_1.var_.actorSpriteComps10034 = var_112_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_112_8 = 0.2

			if var_112_7 <= arg_109_1.time_ and arg_109_1.time_ < var_112_7 + var_112_8 then
				local var_112_9 = (arg_109_1.time_ - var_112_7) / var_112_8

				if arg_109_1.var_.actorSpriteComps10034 then
					for iter_112_4, iter_112_5 in pairs(arg_109_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_112_5 then
							local var_112_10 = Mathf.Lerp(iter_112_5.color.r, 1, var_112_9)

							iter_112_5.color = Color.New(var_112_10, var_112_10, var_112_10)
						end
					end
				end
			end

			if arg_109_1.time_ >= var_112_7 + var_112_8 and arg_109_1.time_ < var_112_7 + var_112_8 + arg_112_0 and arg_109_1.var_.actorSpriteComps10034 then
				local var_112_11 = 1

				for iter_112_6, iter_112_7 in pairs(arg_109_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_112_7 then
						iter_112_7.color = Color.New(var_112_11, var_112_11, var_112_11)
					end
				end

				arg_109_1.var_.actorSpriteComps10034 = nil
			end

			local var_112_12 = arg_109_1.actors_["10034"].transform
			local var_112_13 = 0

			if var_112_13 < arg_109_1.time_ and arg_109_1.time_ <= var_112_13 + arg_112_0 then
				arg_109_1.var_.moveOldPos10034 = var_112_12.localPosition
				var_112_12.localScale = Vector3.New(1, 1, 1)

				arg_109_1:CheckSpriteTmpPos("10034", 4)

				local var_112_14 = var_112_12.childCount

				for iter_112_8 = 0, var_112_14 - 1 do
					local var_112_15 = var_112_12:GetChild(iter_112_8)

					if var_112_15.name == "split_3" or not string.find(var_112_15.name, "split") then
						var_112_15.gameObject:SetActive(true)
					else
						var_112_15.gameObject:SetActive(false)
					end
				end
			end

			local var_112_16 = 0.001

			if var_112_13 <= arg_109_1.time_ and arg_109_1.time_ < var_112_13 + var_112_16 then
				local var_112_17 = (arg_109_1.time_ - var_112_13) / var_112_16
				local var_112_18 = Vector3.New(390, -415, -290)

				var_112_12.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos10034, var_112_18, var_112_17)
			end

			if arg_109_1.time_ >= var_112_13 + var_112_16 and arg_109_1.time_ < var_112_13 + var_112_16 + arg_112_0 then
				var_112_12.localPosition = Vector3.New(390, -415, -290)
			end

			local var_112_19 = 0
			local var_112_20 = 0.4

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_21 = arg_109_1:FormatText(StoryNameCfg[367].name)

				arg_109_1.leftNameTxt_.text = var_112_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_22 = arg_109_1:GetWordFromCfg(117081027)
				local var_112_23 = arg_109_1:FormatText(var_112_22.content)

				arg_109_1.text_.text = var_112_23

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_24 = 16
				local var_112_25 = utf8.len(var_112_23)
				local var_112_26 = var_112_24 <= 0 and var_112_20 or var_112_20 * (var_112_25 / var_112_24)

				if var_112_26 > 0 and var_112_20 < var_112_26 then
					arg_109_1.talkMaxDuration = var_112_26

					if var_112_26 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_26 + var_112_19
					end
				end

				arg_109_1.text_.text = var_112_23
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081027", "story_v_out_117081.awb") ~= 0 then
					local var_112_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081027", "story_v_out_117081.awb") / 1000

					if var_112_27 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_27 + var_112_19
					end

					if var_112_22.prefab_name ~= "" and arg_109_1.actors_[var_112_22.prefab_name] ~= nil then
						local var_112_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_22.prefab_name].transform, "story_v_out_117081", "117081027", "story_v_out_117081.awb")

						arg_109_1:RecordAudio("117081027", var_112_28)
						arg_109_1:RecordAudio("117081027", var_112_28)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_117081", "117081027", "story_v_out_117081.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_117081", "117081027", "story_v_out_117081.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_29 = math.max(var_112_20, arg_109_1.talkMaxDuration)

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_29 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_19) / var_112_29

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_19 + var_112_29 and arg_109_1.time_ < var_112_19 + var_112_29 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play117081028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 117081028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play117081029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10034"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.actorSpriteComps10034 == nil then
				arg_113_1.var_.actorSpriteComps10034 = var_116_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.actorSpriteComps10034 then
					for iter_116_0, iter_116_1 in pairs(arg_113_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_116_1 then
							local var_116_4 = Mathf.Lerp(iter_116_1.color.r, 0.5, var_116_3)

							iter_116_1.color = Color.New(var_116_4, var_116_4, var_116_4)
						end
					end
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.actorSpriteComps10034 then
				local var_116_5 = 0.5

				for iter_116_2, iter_116_3 in pairs(arg_113_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_116_3 then
						iter_116_3.color = Color.New(var_116_5, var_116_5, var_116_5)
					end
				end

				arg_113_1.var_.actorSpriteComps10034 = nil
			end

			local var_116_6 = 0
			local var_116_7 = 0.95

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_8 = arg_113_1:GetWordFromCfg(117081028)
				local var_116_9 = arg_113_1:FormatText(var_116_8.content)

				arg_113_1.text_.text = var_116_9

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_10 = 38
				local var_116_11 = utf8.len(var_116_9)
				local var_116_12 = var_116_10 <= 0 and var_116_7 or var_116_7 * (var_116_11 / var_116_10)

				if var_116_12 > 0 and var_116_7 < var_116_12 then
					arg_113_1.talkMaxDuration = var_116_12

					if var_116_12 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_12 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_9
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_13 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_13 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_13

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_13 and arg_113_1.time_ < var_116_6 + var_116_13 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play117081029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 117081029
		arg_117_1.duration_ = 9.9

		local var_117_0 = {
			zh = 9.9,
			ja = 5.633
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
				arg_117_0:Play117081030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1132"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1132 = var_120_0.localPosition
				var_120_0.localScale = Vector3.New(1, 1, 1)

				arg_117_1:CheckSpriteTmpPos("1132", 2)

				local var_120_2 = var_120_0.childCount

				for iter_120_0 = 0, var_120_2 - 1 do
					local var_120_3 = var_120_0:GetChild(iter_120_0)

					if var_120_3.name == "split_1" or not string.find(var_120_3.name, "split") then
						var_120_3.gameObject:SetActive(true)
					else
						var_120_3.gameObject:SetActive(false)
					end
				end
			end

			local var_120_4 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_4 then
				local var_120_5 = (arg_117_1.time_ - var_120_1) / var_120_4
				local var_120_6 = Vector3.New(-390, -413, -185)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1132, var_120_6, var_120_5)
			end

			if arg_117_1.time_ >= var_120_1 + var_120_4 and arg_117_1.time_ < var_120_1 + var_120_4 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_120_7 = arg_117_1.actors_["1132"]
			local var_120_8 = 0

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 and arg_117_1.var_.actorSpriteComps1132 == nil then
				arg_117_1.var_.actorSpriteComps1132 = var_120_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_9 = 0.2

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_8) / var_120_9

				if arg_117_1.var_.actorSpriteComps1132 then
					for iter_120_1, iter_120_2 in pairs(arg_117_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_120_2 then
							local var_120_11 = Mathf.Lerp(iter_120_2.color.r, 1, var_120_10)

							iter_120_2.color = Color.New(var_120_11, var_120_11, var_120_11)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_8 + var_120_9 and arg_117_1.time_ < var_120_8 + var_120_9 + arg_120_0 and arg_117_1.var_.actorSpriteComps1132 then
				local var_120_12 = 1

				for iter_120_3, iter_120_4 in pairs(arg_117_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_120_4 then
						iter_120_4.color = Color.New(var_120_12, var_120_12, var_120_12)
					end
				end

				arg_117_1.var_.actorSpriteComps1132 = nil
			end

			local var_120_13 = 0
			local var_120_14 = 1.025

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_15 = arg_117_1:FormatText(StoryNameCfg[61].name)

				arg_117_1.leftNameTxt_.text = var_120_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_16 = arg_117_1:GetWordFromCfg(117081029)
				local var_120_17 = arg_117_1:FormatText(var_120_16.content)

				arg_117_1.text_.text = var_120_17

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_18 = 41
				local var_120_19 = utf8.len(var_120_17)
				local var_120_20 = var_120_18 <= 0 and var_120_14 or var_120_14 * (var_120_19 / var_120_18)

				if var_120_20 > 0 and var_120_14 < var_120_20 then
					arg_117_1.talkMaxDuration = var_120_20

					if var_120_20 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_20 + var_120_13
					end
				end

				arg_117_1.text_.text = var_120_17
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081029", "story_v_out_117081.awb") ~= 0 then
					local var_120_21 = manager.audio:GetVoiceLength("story_v_out_117081", "117081029", "story_v_out_117081.awb") / 1000

					if var_120_21 + var_120_13 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_21 + var_120_13
					end

					if var_120_16.prefab_name ~= "" and arg_117_1.actors_[var_120_16.prefab_name] ~= nil then
						local var_120_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_16.prefab_name].transform, "story_v_out_117081", "117081029", "story_v_out_117081.awb")

						arg_117_1:RecordAudio("117081029", var_120_22)
						arg_117_1:RecordAudio("117081029", var_120_22)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_117081", "117081029", "story_v_out_117081.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_117081", "117081029", "story_v_out_117081.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_23 = math.max(var_120_14, arg_117_1.talkMaxDuration)

			if var_120_13 <= arg_117_1.time_ and arg_117_1.time_ < var_120_13 + var_120_23 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_13) / var_120_23

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_13 + var_120_23 and arg_117_1.time_ < var_120_13 + var_120_23 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play117081030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 117081030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play117081031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1132"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.actorSpriteComps1132 == nil then
				arg_121_1.var_.actorSpriteComps1132 = var_124_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_124_2 = 0.2

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.actorSpriteComps1132 then
					for iter_124_0, iter_124_1 in pairs(arg_121_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_124_1 then
							local var_124_4 = Mathf.Lerp(iter_124_1.color.r, 0.5, var_124_3)

							iter_124_1.color = Color.New(var_124_4, var_124_4, var_124_4)
						end
					end
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.actorSpriteComps1132 then
				local var_124_5 = 0.5

				for iter_124_2, iter_124_3 in pairs(arg_121_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_124_3 then
						iter_124_3.color = Color.New(var_124_5, var_124_5, var_124_5)
					end
				end

				arg_121_1.var_.actorSpriteComps1132 = nil
			end

			local var_124_6 = 0
			local var_124_7 = 0.3

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_8 = arg_121_1:GetWordFromCfg(117081030)
				local var_124_9 = arg_121_1:FormatText(var_124_8.content)

				arg_121_1.text_.text = var_124_9

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_10 = 12
				local var_124_11 = utf8.len(var_124_9)
				local var_124_12 = var_124_10 <= 0 and var_124_7 or var_124_7 * (var_124_11 / var_124_10)

				if var_124_12 > 0 and var_124_7 < var_124_12 then
					arg_121_1.talkMaxDuration = var_124_12

					if var_124_12 + var_124_6 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_12 + var_124_6
					end
				end

				arg_121_1.text_.text = var_124_9
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_13 = math.max(var_124_7, arg_121_1.talkMaxDuration)

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_13 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_6) / var_124_13

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_6 + var_124_13 and arg_121_1.time_ < var_124_6 + var_124_13 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play117081031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 117081031
		arg_125_1.duration_ = 5.1

		local var_125_0 = {
			zh = 5.1,
			ja = 2.133
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
				arg_125_0:Play117081032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10035"].transform
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos10035 = var_128_0.localPosition
				var_128_0.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("10035", 4)

				local var_128_2 = var_128_0.childCount

				for iter_128_0 = 0, var_128_2 - 1 do
					local var_128_3 = var_128_0:GetChild(iter_128_0)

					if var_128_3.name == "split_4" or not string.find(var_128_3.name, "split") then
						var_128_3.gameObject:SetActive(true)
					else
						var_128_3.gameObject:SetActive(false)
					end
				end
			end

			local var_128_4 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_1) / var_128_4
				local var_128_6 = Vector3.New(390, -410, -235)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10035, var_128_6, var_128_5)
			end

			if arg_125_1.time_ >= var_128_1 + var_128_4 and arg_125_1.time_ < var_128_1 + var_128_4 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_128_7 = arg_125_1.actors_["10035"]
			local var_128_8 = 0

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 and arg_125_1.var_.actorSpriteComps10035 == nil then
				arg_125_1.var_.actorSpriteComps10035 = var_128_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_9 = 0.2

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_9 then
				local var_128_10 = (arg_125_1.time_ - var_128_8) / var_128_9

				if arg_125_1.var_.actorSpriteComps10035 then
					for iter_128_1, iter_128_2 in pairs(arg_125_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_128_2 then
							local var_128_11 = Mathf.Lerp(iter_128_2.color.r, 1, var_128_10)

							iter_128_2.color = Color.New(var_128_11, var_128_11, var_128_11)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_8 + var_128_9 and arg_125_1.time_ < var_128_8 + var_128_9 + arg_128_0 and arg_125_1.var_.actorSpriteComps10035 then
				local var_128_12 = 1

				for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_128_4 then
						iter_128_4.color = Color.New(var_128_12, var_128_12, var_128_12)
					end
				end

				arg_125_1.var_.actorSpriteComps10035 = nil
			end

			local var_128_13 = 0
			local var_128_14 = 0.625

			if var_128_13 < arg_125_1.time_ and arg_125_1.time_ <= var_128_13 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_15 = arg_125_1:FormatText(StoryNameCfg[369].name)

				arg_125_1.leftNameTxt_.text = var_128_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_16 = arg_125_1:GetWordFromCfg(117081031)
				local var_128_17 = arg_125_1:FormatText(var_128_16.content)

				arg_125_1.text_.text = var_128_17

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_18 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081031", "story_v_out_117081.awb") ~= 0 then
					local var_128_21 = manager.audio:GetVoiceLength("story_v_out_117081", "117081031", "story_v_out_117081.awb") / 1000

					if var_128_21 + var_128_13 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_21 + var_128_13
					end

					if var_128_16.prefab_name ~= "" and arg_125_1.actors_[var_128_16.prefab_name] ~= nil then
						local var_128_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_16.prefab_name].transform, "story_v_out_117081", "117081031", "story_v_out_117081.awb")

						arg_125_1:RecordAudio("117081031", var_128_22)
						arg_125_1:RecordAudio("117081031", var_128_22)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_117081", "117081031", "story_v_out_117081.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_117081", "117081031", "story_v_out_117081.awb")
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
	Play117081032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 117081032
		arg_129_1.duration_ = 13.9

		local var_129_0 = {
			zh = 13.9,
			ja = 9.333
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
				arg_129_0:Play117081033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10035"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.actorSpriteComps10035 == nil then
				arg_129_1.var_.actorSpriteComps10035 = var_132_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_2 = 0.2

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.actorSpriteComps10035 then
					for iter_132_0, iter_132_1 in pairs(arg_129_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_132_1 then
							local var_132_4 = Mathf.Lerp(iter_132_1.color.r, 0.5, var_132_3)

							iter_132_1.color = Color.New(var_132_4, var_132_4, var_132_4)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.actorSpriteComps10035 then
				local var_132_5 = 0.5

				for iter_132_2, iter_132_3 in pairs(arg_129_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_132_3 then
						iter_132_3.color = Color.New(var_132_5, var_132_5, var_132_5)
					end
				end

				arg_129_1.var_.actorSpriteComps10035 = nil
			end

			local var_132_6 = arg_129_1.actors_["1132"]
			local var_132_7 = 0

			if var_132_7 < arg_129_1.time_ and arg_129_1.time_ <= var_132_7 + arg_132_0 and arg_129_1.var_.actorSpriteComps1132 == nil then
				arg_129_1.var_.actorSpriteComps1132 = var_132_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_8 = 0.2

			if var_132_7 <= arg_129_1.time_ and arg_129_1.time_ < var_132_7 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_7) / var_132_8

				if arg_129_1.var_.actorSpriteComps1132 then
					for iter_132_4, iter_132_5 in pairs(arg_129_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_132_5 then
							local var_132_10 = Mathf.Lerp(iter_132_5.color.r, 1, var_132_9)

							iter_132_5.color = Color.New(var_132_10, var_132_10, var_132_10)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_7 + var_132_8 and arg_129_1.time_ < var_132_7 + var_132_8 + arg_132_0 and arg_129_1.var_.actorSpriteComps1132 then
				local var_132_11 = 1

				for iter_132_6, iter_132_7 in pairs(arg_129_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_132_7 then
						iter_132_7.color = Color.New(var_132_11, var_132_11, var_132_11)
					end
				end

				arg_129_1.var_.actorSpriteComps1132 = nil
			end

			local var_132_12 = 0
			local var_132_13 = 1.575

			if var_132_12 < arg_129_1.time_ and arg_129_1.time_ <= var_132_12 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_14 = arg_129_1:FormatText(StoryNameCfg[61].name)

				arg_129_1.leftNameTxt_.text = var_132_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_15 = arg_129_1:GetWordFromCfg(117081032)
				local var_132_16 = arg_129_1:FormatText(var_132_15.content)

				arg_129_1.text_.text = var_132_16

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_17 = 63
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081032", "story_v_out_117081.awb") ~= 0 then
					local var_132_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081032", "story_v_out_117081.awb") / 1000

					if var_132_20 + var_132_12 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_20 + var_132_12
					end

					if var_132_15.prefab_name ~= "" and arg_129_1.actors_[var_132_15.prefab_name] ~= nil then
						local var_132_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_15.prefab_name].transform, "story_v_out_117081", "117081032", "story_v_out_117081.awb")

						arg_129_1:RecordAudio("117081032", var_132_21)
						arg_129_1:RecordAudio("117081032", var_132_21)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_117081", "117081032", "story_v_out_117081.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_117081", "117081032", "story_v_out_117081.awb")
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
	Play117081033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 117081033
		arg_133_1.duration_ = 2.533

		local var_133_0 = {
			zh = 1.866,
			ja = 2.533
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
				arg_133_0:Play117081034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.25

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[61].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(117081033)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 10
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081033", "story_v_out_117081.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081033", "story_v_out_117081.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_117081", "117081033", "story_v_out_117081.awb")

						arg_133_1:RecordAudio("117081033", var_136_9)
						arg_133_1:RecordAudio("117081033", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_117081", "117081033", "story_v_out_117081.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_117081", "117081033", "story_v_out_117081.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play117081034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 117081034
		arg_137_1.duration_ = 8.833

		local var_137_0 = {
			zh = 8.833,
			ja = 3.4
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
				arg_137_0:Play117081035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.875

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[61].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(117081034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 35
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081034", "story_v_out_117081.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081034", "story_v_out_117081.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_117081", "117081034", "story_v_out_117081.awb")

						arg_137_1:RecordAudio("117081034", var_140_9)
						arg_137_1:RecordAudio("117081034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_117081", "117081034", "story_v_out_117081.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_117081", "117081034", "story_v_out_117081.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play117081035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 117081035
		arg_141_1.duration_ = 5.033

		local var_141_0 = {
			zh = 5.033,
			ja = 3.266
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
				arg_141_0:Play117081036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1132"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.actorSpriteComps1132 == nil then
				arg_141_1.var_.actorSpriteComps1132 = var_144_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_2 = 0.2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.actorSpriteComps1132 then
					for iter_144_0, iter_144_1 in pairs(arg_141_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_144_1 then
							local var_144_4 = Mathf.Lerp(iter_144_1.color.r, 0.5, var_144_3)

							iter_144_1.color = Color.New(var_144_4, var_144_4, var_144_4)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.actorSpriteComps1132 then
				local var_144_5 = 0.5

				for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_144_3 then
						iter_144_3.color = Color.New(var_144_5, var_144_5, var_144_5)
					end
				end

				arg_141_1.var_.actorSpriteComps1132 = nil
			end

			local var_144_6 = arg_141_1.actors_["10035"].transform
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 then
				arg_141_1.var_.moveOldPos10035 = var_144_6.localPosition
				var_144_6.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10035", 4)

				local var_144_8 = var_144_6.childCount

				for iter_144_4 = 0, var_144_8 - 1 do
					local var_144_9 = var_144_6:GetChild(iter_144_4)

					if var_144_9.name == "split_1" or not string.find(var_144_9.name, "split") then
						var_144_9.gameObject:SetActive(true)
					else
						var_144_9.gameObject:SetActive(false)
					end
				end
			end

			local var_144_10 = 0.001

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_10 then
				local var_144_11 = (arg_141_1.time_ - var_144_7) / var_144_10
				local var_144_12 = Vector3.New(390, -410, -235)

				var_144_6.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10035, var_144_12, var_144_11)
			end

			if arg_141_1.time_ >= var_144_7 + var_144_10 and arg_141_1.time_ < var_144_7 + var_144_10 + arg_144_0 then
				var_144_6.localPosition = Vector3.New(390, -410, -235)
			end

			local var_144_13 = arg_141_1.actors_["10035"]
			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 == nil then
				arg_141_1.var_.actorSpriteComps10035 = var_144_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_15 = 0.2

			if var_144_14 <= arg_141_1.time_ and arg_141_1.time_ < var_144_14 + var_144_15 then
				local var_144_16 = (arg_141_1.time_ - var_144_14) / var_144_15

				if arg_141_1.var_.actorSpriteComps10035 then
					for iter_144_5, iter_144_6 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_144_6 then
							local var_144_17 = Mathf.Lerp(iter_144_6.color.r, 1, var_144_16)

							iter_144_6.color = Color.New(var_144_17, var_144_17, var_144_17)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_14 + var_144_15 and arg_141_1.time_ < var_144_14 + var_144_15 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 then
				local var_144_18 = 1

				for iter_144_7, iter_144_8 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_144_8 then
						iter_144_8.color = Color.New(var_144_18, var_144_18, var_144_18)
					end
				end

				arg_141_1.var_.actorSpriteComps10035 = nil
			end

			local var_144_19 = 0
			local var_144_20 = 0.225

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_21 = arg_141_1:FormatText(StoryNameCfg[369].name)

				arg_141_1.leftNameTxt_.text = var_144_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_22 = arg_141_1:GetWordFromCfg(117081035)
				local var_144_23 = arg_141_1:FormatText(var_144_22.content)

				arg_141_1.text_.text = var_144_23

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_24 = 9
				local var_144_25 = utf8.len(var_144_23)
				local var_144_26 = var_144_24 <= 0 and var_144_20 or var_144_20 * (var_144_25 / var_144_24)

				if var_144_26 > 0 and var_144_20 < var_144_26 then
					arg_141_1.talkMaxDuration = var_144_26

					if var_144_26 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_26 + var_144_19
					end
				end

				arg_141_1.text_.text = var_144_23
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081035", "story_v_out_117081.awb") ~= 0 then
					local var_144_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081035", "story_v_out_117081.awb") / 1000

					if var_144_27 + var_144_19 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_27 + var_144_19
					end

					if var_144_22.prefab_name ~= "" and arg_141_1.actors_[var_144_22.prefab_name] ~= nil then
						local var_144_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_22.prefab_name].transform, "story_v_out_117081", "117081035", "story_v_out_117081.awb")

						arg_141_1:RecordAudio("117081035", var_144_28)
						arg_141_1:RecordAudio("117081035", var_144_28)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_117081", "117081035", "story_v_out_117081.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_117081", "117081035", "story_v_out_117081.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_29 = math.max(var_144_20, arg_141_1.talkMaxDuration)

			if var_144_19 <= arg_141_1.time_ and arg_141_1.time_ < var_144_19 + var_144_29 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_19) / var_144_29

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_19 + var_144_29 and arg_141_1.time_ < var_144_19 + var_144_29 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play117081036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 117081036
		arg_145_1.duration_ = 3.866

		local var_145_0 = {
			zh = 3.866,
			ja = 3.533
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
				arg_145_0:Play117081037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10035"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.actorSpriteComps10035 == nil then
				arg_145_1.var_.actorSpriteComps10035 = var_148_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_2 = 0.2

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.actorSpriteComps10035 then
					for iter_148_0, iter_148_1 in pairs(arg_145_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_148_1 then
							local var_148_4 = Mathf.Lerp(iter_148_1.color.r, 0.5, var_148_3)

							iter_148_1.color = Color.New(var_148_4, var_148_4, var_148_4)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.actorSpriteComps10035 then
				local var_148_5 = 0.5

				for iter_148_2, iter_148_3 in pairs(arg_145_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_148_3 then
						iter_148_3.color = Color.New(var_148_5, var_148_5, var_148_5)
					end
				end

				arg_145_1.var_.actorSpriteComps10035 = nil
			end

			local var_148_6 = 0
			local var_148_7 = 0.275

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_8 = arg_145_1:FormatText(StoryNameCfg[367].name)

				arg_145_1.leftNameTxt_.text = var_148_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_9 = arg_145_1:GetWordFromCfg(117081036)
				local var_148_10 = arg_145_1:FormatText(var_148_9.content)

				arg_145_1.text_.text = var_148_10

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081036", "story_v_out_117081.awb") ~= 0 then
					local var_148_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081036", "story_v_out_117081.awb") / 1000

					if var_148_14 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_14 + var_148_6
					end

					if var_148_9.prefab_name ~= "" and arg_145_1.actors_[var_148_9.prefab_name] ~= nil then
						local var_148_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_9.prefab_name].transform, "story_v_out_117081", "117081036", "story_v_out_117081.awb")

						arg_145_1:RecordAudio("117081036", var_148_15)
						arg_145_1:RecordAudio("117081036", var_148_15)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_117081", "117081036", "story_v_out_117081.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_117081", "117081036", "story_v_out_117081.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_16 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_16 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_16

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_16 and arg_145_1.time_ < var_148_6 + var_148_16 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play117081037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 117081037
		arg_149_1.duration_ = 9

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play117081038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = "TI0105"

			if arg_149_1.bgs_[var_152_0] == nil then
				local var_152_1 = Object.Instantiate(arg_149_1.paintGo_)

				var_152_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_152_0)
				var_152_1.name = var_152_0
				var_152_1.transform.parent = arg_149_1.stage_.transform
				var_152_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_149_1.bgs_[var_152_0] = var_152_1
			end

			local var_152_2 = 2

			if var_152_2 < arg_149_1.time_ and arg_149_1.time_ <= var_152_2 + arg_152_0 then
				local var_152_3 = manager.ui.mainCamera.transform.localPosition
				local var_152_4 = Vector3.New(0, 0, 10) + Vector3.New(var_152_3.x, var_152_3.y, 0)
				local var_152_5 = arg_149_1.bgs_.TI0105

				var_152_5.transform.localPosition = var_152_4
				var_152_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_6 = var_152_5:GetComponent("SpriteRenderer")

				if var_152_6 and var_152_6.sprite then
					local var_152_7 = (var_152_5.transform.localPosition - var_152_3).z
					local var_152_8 = manager.ui.mainCameraCom_
					local var_152_9 = 2 * var_152_7 * Mathf.Tan(var_152_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_10 = var_152_9 * var_152_8.aspect
					local var_152_11 = var_152_6.sprite.bounds.size.x
					local var_152_12 = var_152_6.sprite.bounds.size.y
					local var_152_13 = var_152_10 / var_152_11
					local var_152_14 = var_152_9 / var_152_12
					local var_152_15 = var_152_14 < var_152_13 and var_152_13 or var_152_14

					var_152_5.transform.localScale = Vector3.New(var_152_15, var_152_15, 0)
				end

				for iter_152_0, iter_152_1 in pairs(arg_149_1.bgs_) do
					if iter_152_0 ~= "TI0105" then
						iter_152_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_152_16 = 0

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_17 = 2

			if var_152_16 <= arg_149_1.time_ and arg_149_1.time_ < var_152_16 + var_152_17 then
				local var_152_18 = (arg_149_1.time_ - var_152_16) / var_152_17
				local var_152_19 = Color.New(0, 0, 0)

				var_152_19.a = Mathf.Lerp(0, 1, var_152_18)
				arg_149_1.mask_.color = var_152_19
			end

			if arg_149_1.time_ >= var_152_16 + var_152_17 and arg_149_1.time_ < var_152_16 + var_152_17 + arg_152_0 then
				local var_152_20 = Color.New(0, 0, 0)

				var_152_20.a = 1
				arg_149_1.mask_.color = var_152_20
			end

			local var_152_21 = 2

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_22 = 2

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_22 then
				local var_152_23 = (arg_149_1.time_ - var_152_21) / var_152_22
				local var_152_24 = Color.New(0, 0, 0)

				var_152_24.a = Mathf.Lerp(1, 0, var_152_23)
				arg_149_1.mask_.color = var_152_24
			end

			if arg_149_1.time_ >= var_152_21 + var_152_22 and arg_149_1.time_ < var_152_21 + var_152_22 + arg_152_0 then
				local var_152_25 = Color.New(0, 0, 0)
				local var_152_26 = 0

				arg_149_1.mask_.enabled = false
				var_152_25.a = var_152_26
				arg_149_1.mask_.color = var_152_25
			end

			local var_152_27 = arg_149_1.actors_["1132"].transform
			local var_152_28 = 2

			if var_152_28 < arg_149_1.time_ and arg_149_1.time_ <= var_152_28 + arg_152_0 then
				arg_149_1.var_.moveOldPos1132 = var_152_27.localPosition
				var_152_27.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("1132", 7)

				local var_152_29 = var_152_27.childCount

				for iter_152_2 = 0, var_152_29 - 1 do
					local var_152_30 = var_152_27:GetChild(iter_152_2)

					if var_152_30.name == "split_1" or not string.find(var_152_30.name, "split") then
						var_152_30.gameObject:SetActive(true)
					else
						var_152_30.gameObject:SetActive(false)
					end
				end
			end

			local var_152_31 = 0.001

			if var_152_28 <= arg_149_1.time_ and arg_149_1.time_ < var_152_28 + var_152_31 then
				local var_152_32 = (arg_149_1.time_ - var_152_28) / var_152_31
				local var_152_33 = Vector3.New(0, -2000, -185)

				var_152_27.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1132, var_152_33, var_152_32)
			end

			if arg_149_1.time_ >= var_152_28 + var_152_31 and arg_149_1.time_ < var_152_28 + var_152_31 + arg_152_0 then
				var_152_27.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_152_34 = arg_149_1.actors_["10035"].transform
			local var_152_35 = 2

			if var_152_35 < arg_149_1.time_ and arg_149_1.time_ <= var_152_35 + arg_152_0 then
				arg_149_1.var_.moveOldPos10035 = var_152_34.localPosition
				var_152_34.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10035", 7)

				local var_152_36 = var_152_34.childCount

				for iter_152_3 = 0, var_152_36 - 1 do
					local var_152_37 = var_152_34:GetChild(iter_152_3)

					if var_152_37.name == "split_1" or not string.find(var_152_37.name, "split") then
						var_152_37.gameObject:SetActive(true)
					else
						var_152_37.gameObject:SetActive(false)
					end
				end
			end

			local var_152_38 = 0.001

			if var_152_35 <= arg_149_1.time_ and arg_149_1.time_ < var_152_35 + var_152_38 then
				local var_152_39 = (arg_149_1.time_ - var_152_35) / var_152_38
				local var_152_40 = Vector3.New(0, -2000, -235)

				var_152_34.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10035, var_152_40, var_152_39)
			end

			if arg_149_1.time_ >= var_152_35 + var_152_38 and arg_149_1.time_ < var_152_35 + var_152_38 + arg_152_0 then
				var_152_34.localPosition = Vector3.New(0, -2000, -235)
			end

			local var_152_41 = arg_149_1.bgs_.TI0105.transform
			local var_152_42 = 2

			if var_152_42 < arg_149_1.time_ and arg_149_1.time_ <= var_152_42 + arg_152_0 then
				arg_149_1.var_.moveOldPosTI0105 = var_152_41.localPosition
			end

			local var_152_43 = 0.001

			if var_152_42 <= arg_149_1.time_ and arg_149_1.time_ < var_152_42 + var_152_43 then
				local var_152_44 = (arg_149_1.time_ - var_152_42) / var_152_43
				local var_152_45 = Vector3.New(0, 1, 9.5)

				var_152_41.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPosTI0105, var_152_45, var_152_44)
			end

			if arg_149_1.time_ >= var_152_42 + var_152_43 and arg_149_1.time_ < var_152_42 + var_152_43 + arg_152_0 then
				var_152_41.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_152_46 = arg_149_1.bgs_.TI0105.transform
			local var_152_47 = 2.034

			if var_152_47 < arg_149_1.time_ and arg_149_1.time_ <= var_152_47 + arg_152_0 then
				arg_149_1.var_.moveOldPosTI0105 = var_152_46.localPosition
			end

			local var_152_48 = 3

			if var_152_47 <= arg_149_1.time_ and arg_149_1.time_ < var_152_47 + var_152_48 then
				local var_152_49 = (arg_149_1.time_ - var_152_47) / var_152_48
				local var_152_50 = Vector3.New(0, 1, 10)

				var_152_46.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPosTI0105, var_152_50, var_152_49)
			end

			if arg_149_1.time_ >= var_152_47 + var_152_48 and arg_149_1.time_ < var_152_47 + var_152_48 + arg_152_0 then
				var_152_46.localPosition = Vector3.New(0, 1, 10)
			end

			local var_152_51 = 4

			if var_152_51 < arg_149_1.time_ and arg_149_1.time_ <= var_152_51 + arg_152_0 then
				arg_149_1.allBtn_.enabled = false
			end

			local var_152_52 = 1.034

			if arg_149_1.time_ >= var_152_51 + var_152_52 and arg_149_1.time_ < var_152_51 + var_152_52 + arg_152_0 then
				arg_149_1.allBtn_.enabled = true
			end

			if arg_149_1.frameCnt_ <= 1 then
				arg_149_1.dialog_:SetActive(false)
			end

			local var_152_53 = 4
			local var_152_54 = 1.425

			if var_152_53 < arg_149_1.time_ and arg_149_1.time_ <= var_152_53 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0

				arg_149_1.dialog_:SetActive(true)

				local var_152_55 = LeanTween.value(arg_149_1.dialog_, 0, 1, 0.3)

				var_152_55:setOnUpdate(LuaHelper.FloatAction(function(arg_153_0)
					arg_149_1.dialogCg_.alpha = arg_153_0
				end))
				var_152_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_149_1.dialog_)
					var_152_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_149_1.duration_ = arg_149_1.duration_ + 0.3

				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_56 = arg_149_1:GetWordFromCfg(117081037)
				local var_152_57 = arg_149_1:FormatText(var_152_56.content)

				arg_149_1.text_.text = var_152_57

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_58 = 57
				local var_152_59 = utf8.len(var_152_57)
				local var_152_60 = var_152_58 <= 0 and var_152_54 or var_152_54 * (var_152_59 / var_152_58)

				if var_152_60 > 0 and var_152_54 < var_152_60 then
					arg_149_1.talkMaxDuration = var_152_60
					var_152_53 = var_152_53 + 0.3

					if var_152_60 + var_152_53 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_60 + var_152_53
					end
				end

				arg_149_1.text_.text = var_152_57
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_61 = var_152_53 + 0.3
			local var_152_62 = math.max(var_152_54, arg_149_1.talkMaxDuration)

			if var_152_61 <= arg_149_1.time_ and arg_149_1.time_ < var_152_61 + var_152_62 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_61) / var_152_62

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_61 + var_152_62 and arg_149_1.time_ < var_152_61 + var_152_62 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play117081038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 117081038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play117081039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.875

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

				local var_158_2 = arg_155_1:GetWordFromCfg(117081038)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 35
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
	Play117081039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 117081039
		arg_159_1.duration_ = 14.633

		local var_159_0 = {
			zh = 14.633,
			ja = 10.066
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
				arg_159_0:Play117081040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.375

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[367].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(117081039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081039", "story_v_out_117081.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081039", "story_v_out_117081.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_117081", "117081039", "story_v_out_117081.awb")

						arg_159_1:RecordAudio("117081039", var_162_9)
						arg_159_1:RecordAudio("117081039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_117081", "117081039", "story_v_out_117081.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_117081", "117081039", "story_v_out_117081.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play117081040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 117081040
		arg_163_1.duration_ = 12.466

		local var_163_0 = {
			zh = 7.666,
			ja = 12.466
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
				arg_163_0:Play117081041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.825

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[369].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(117081040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081040", "story_v_out_117081.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081040", "story_v_out_117081.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_117081", "117081040", "story_v_out_117081.awb")

						arg_163_1:RecordAudio("117081040", var_166_9)
						arg_163_1:RecordAudio("117081040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_117081", "117081040", "story_v_out_117081.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_117081", "117081040", "story_v_out_117081.awb")
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
	Play117081041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 117081041
		arg_167_1.duration_ = 4.566

		local var_167_0 = {
			zh = 4.4,
			ja = 4.566
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
				arg_167_0:Play117081042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.45

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[367].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(117081041)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081041", "story_v_out_117081.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081041", "story_v_out_117081.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_117081", "117081041", "story_v_out_117081.awb")

						arg_167_1:RecordAudio("117081041", var_170_9)
						arg_167_1:RecordAudio("117081041", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_117081", "117081041", "story_v_out_117081.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_117081", "117081041", "story_v_out_117081.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_10 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_10 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_10

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_10 and arg_167_1.time_ < var_170_0 + var_170_10 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play117081042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 117081042
		arg_171_1.duration_ = 15.066

		local var_171_0 = {
			zh = 15.066,
			ja = 14.666
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
				arg_171_0:Play117081043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.775

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[369].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(117081042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 71
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081042", "story_v_out_117081.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081042", "story_v_out_117081.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_117081", "117081042", "story_v_out_117081.awb")

						arg_171_1:RecordAudio("117081042", var_174_9)
						arg_171_1:RecordAudio("117081042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_117081", "117081042", "story_v_out_117081.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_117081", "117081042", "story_v_out_117081.awb")
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
	Play117081043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 117081043
		arg_175_1.duration_ = 4.033

		local var_175_0 = {
			zh = 2.266,
			ja = 4.033
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
				arg_175_0:Play117081044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.275

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[367].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(117081043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081043", "story_v_out_117081.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081043", "story_v_out_117081.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_117081", "117081043", "story_v_out_117081.awb")

						arg_175_1:RecordAudio("117081043", var_178_9)
						arg_175_1:RecordAudio("117081043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_117081", "117081043", "story_v_out_117081.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_117081", "117081043", "story_v_out_117081.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play117081044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 117081044
		arg_179_1.duration_ = 6.366

		local var_179_0 = {
			zh = 2.566,
			ja = 6.366
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
				arg_179_0:Play117081045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.325

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[369].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(117081044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081044", "story_v_out_117081.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081044", "story_v_out_117081.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_117081", "117081044", "story_v_out_117081.awb")

						arg_179_1:RecordAudio("117081044", var_182_9)
						arg_179_1:RecordAudio("117081044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_117081", "117081044", "story_v_out_117081.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_117081", "117081044", "story_v_out_117081.awb")
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
	Play117081045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 117081045
		arg_183_1.duration_ = 3.566

		local var_183_0 = {
			zh = 3.566,
			ja = 2.166
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
				arg_183_0:Play117081046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.225

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[61].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(117081045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081045", "story_v_out_117081.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081045", "story_v_out_117081.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_117081", "117081045", "story_v_out_117081.awb")

						arg_183_1:RecordAudio("117081045", var_186_9)
						arg_183_1:RecordAudio("117081045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_117081", "117081045", "story_v_out_117081.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_117081", "117081045", "story_v_out_117081.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play117081046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 117081046
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play117081047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 1.275

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_2 = arg_187_1:GetWordFromCfg(117081046)
				local var_190_3 = arg_187_1:FormatText(var_190_2.content)

				arg_187_1.text_.text = var_190_3

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_4 = 51
				local var_190_5 = utf8.len(var_190_3)
				local var_190_6 = var_190_4 <= 0 and var_190_1 or var_190_1 * (var_190_5 / var_190_4)

				if var_190_6 > 0 and var_190_1 < var_190_6 then
					arg_187_1.talkMaxDuration = var_190_6

					if var_190_6 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_6 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_3
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_7 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_7 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_7

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_7 and arg_187_1.time_ < var_190_0 + var_190_7 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play117081047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 117081047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play117081048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.575

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_2 = arg_191_1:GetWordFromCfg(117081047)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 57
				local var_194_5 = utf8.len(var_194_3)
				local var_194_6 = var_194_4 <= 0 and var_194_1 or var_194_1 * (var_194_5 / var_194_4)

				if var_194_6 > 0 and var_194_1 < var_194_6 then
					arg_191_1.talkMaxDuration = var_194_6

					if var_194_6 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_6 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_3
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_7 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_7 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_7

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_7 and arg_191_1.time_ < var_194_0 + var_194_7 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play117081048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 117081048
		arg_195_1.duration_ = 8.133

		local var_195_0 = {
			zh = 8.133,
			ja = 8.1
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
				arg_195_0:Play117081049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.55

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[369].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(117081048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 22
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081048", "story_v_out_117081.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081048", "story_v_out_117081.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_117081", "117081048", "story_v_out_117081.awb")

						arg_195_1:RecordAudio("117081048", var_198_9)
						arg_195_1:RecordAudio("117081048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_117081", "117081048", "story_v_out_117081.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_117081", "117081048", "story_v_out_117081.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play117081049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 117081049
		arg_199_1.duration_ = 7.733

		local var_199_0 = {
			zh = 7.733,
			ja = 5.566
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
				arg_199_0:Play117081050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.775

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[369].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(117081049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 31
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081049", "story_v_out_117081.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081049", "story_v_out_117081.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_117081", "117081049", "story_v_out_117081.awb")

						arg_199_1:RecordAudio("117081049", var_202_9)
						arg_199_1:RecordAudio("117081049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_117081", "117081049", "story_v_out_117081.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_117081", "117081049", "story_v_out_117081.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play117081050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 117081050
		arg_203_1.duration_ = 3.233

		local var_203_0 = {
			zh = 3.233,
			ja = 1.8
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
				arg_203_0:Play117081051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.175

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[61].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(117081050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 7
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081050", "story_v_out_117081.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081050", "story_v_out_117081.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_117081", "117081050", "story_v_out_117081.awb")

						arg_203_1:RecordAudio("117081050", var_206_9)
						arg_203_1:RecordAudio("117081050", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_117081", "117081050", "story_v_out_117081.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_117081", "117081050", "story_v_out_117081.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play117081051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 117081051
		arg_207_1.duration_ = 14.1

		local var_207_0 = {
			zh = 14.1,
			ja = 13.566
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
				arg_207_0:Play117081052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.65

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[61].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(117081051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 66
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081051", "story_v_out_117081.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081051", "story_v_out_117081.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_117081", "117081051", "story_v_out_117081.awb")

						arg_207_1:RecordAudio("117081051", var_210_9)
						arg_207_1:RecordAudio("117081051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_117081", "117081051", "story_v_out_117081.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_117081", "117081051", "story_v_out_117081.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play117081052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 117081052
		arg_211_1.duration_ = 9

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play117081053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 2

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				local var_214_1 = manager.ui.mainCamera.transform.localPosition
				local var_214_2 = Vector3.New(0, 0, 10) + Vector3.New(var_214_1.x, var_214_1.y, 0)
				local var_214_3 = arg_211_1.bgs_.ST24a

				var_214_3.transform.localPosition = var_214_2
				var_214_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_214_4 = var_214_3:GetComponent("SpriteRenderer")

				if var_214_4 and var_214_4.sprite then
					local var_214_5 = (var_214_3.transform.localPosition - var_214_1).z
					local var_214_6 = manager.ui.mainCameraCom_
					local var_214_7 = 2 * var_214_5 * Mathf.Tan(var_214_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_214_8 = var_214_7 * var_214_6.aspect
					local var_214_9 = var_214_4.sprite.bounds.size.x
					local var_214_10 = var_214_4.sprite.bounds.size.y
					local var_214_11 = var_214_8 / var_214_9
					local var_214_12 = var_214_7 / var_214_10
					local var_214_13 = var_214_12 < var_214_11 and var_214_11 or var_214_12

					var_214_3.transform.localScale = Vector3.New(var_214_13, var_214_13, 0)
				end

				for iter_214_0, iter_214_1 in pairs(arg_211_1.bgs_) do
					if iter_214_0 ~= "ST24a" then
						iter_214_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_15 = 2

			if var_214_14 <= arg_211_1.time_ and arg_211_1.time_ < var_214_14 + var_214_15 then
				local var_214_16 = (arg_211_1.time_ - var_214_14) / var_214_15
				local var_214_17 = Color.New(0, 0, 0)

				var_214_17.a = Mathf.Lerp(0, 1, var_214_16)
				arg_211_1.mask_.color = var_214_17
			end

			if arg_211_1.time_ >= var_214_14 + var_214_15 and arg_211_1.time_ < var_214_14 + var_214_15 + arg_214_0 then
				local var_214_18 = Color.New(0, 0, 0)

				var_214_18.a = 1
				arg_211_1.mask_.color = var_214_18
			end

			local var_214_19 = 2

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_20 = 2

			if var_214_19 <= arg_211_1.time_ and arg_211_1.time_ < var_214_19 + var_214_20 then
				local var_214_21 = (arg_211_1.time_ - var_214_19) / var_214_20
				local var_214_22 = Color.New(0, 0, 0)

				var_214_22.a = Mathf.Lerp(1, 0, var_214_21)
				arg_211_1.mask_.color = var_214_22
			end

			if arg_211_1.time_ >= var_214_19 + var_214_20 and arg_211_1.time_ < var_214_19 + var_214_20 + arg_214_0 then
				local var_214_23 = Color.New(0, 0, 0)
				local var_214_24 = 0

				arg_211_1.mask_.enabled = false
				var_214_23.a = var_214_24
				arg_211_1.mask_.color = var_214_23
			end

			if arg_211_1.frameCnt_ <= 1 then
				arg_211_1.dialog_:SetActive(false)
			end

			local var_214_25 = 4
			local var_214_26 = 0.625

			if var_214_25 < arg_211_1.time_ and arg_211_1.time_ <= var_214_25 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_27 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_27:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_28 = arg_211_1:GetWordFromCfg(117081052)
				local var_214_29 = arg_211_1:FormatText(var_214_28.content)

				arg_211_1.text_.text = var_214_29

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_30 = 25
				local var_214_31 = utf8.len(var_214_29)
				local var_214_32 = var_214_30 <= 0 and var_214_26 or var_214_26 * (var_214_31 / var_214_30)

				if var_214_32 > 0 and var_214_26 < var_214_32 then
					arg_211_1.talkMaxDuration = var_214_32
					var_214_25 = var_214_25 + 0.3

					if var_214_32 + var_214_25 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_32 + var_214_25
					end
				end

				arg_211_1.text_.text = var_214_29
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_33 = var_214_25 + 0.3
			local var_214_34 = math.max(var_214_26, arg_211_1.talkMaxDuration)

			if var_214_33 <= arg_211_1.time_ and arg_211_1.time_ < var_214_33 + var_214_34 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_33) / var_214_34

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_33 + var_214_34 and arg_211_1.time_ < var_214_33 + var_214_34 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play117081053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 117081053
		arg_217_1.duration_ = 6.533

		local var_217_0 = {
			zh = 6.533,
			ja = 5
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
				arg_217_0:Play117081054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10035"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				local var_220_2 = var_220_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_220_2 then
					arg_217_1.var_.alphaOldValue10035 = var_220_2.alpha
					arg_217_1.var_.characterEffect10035 = var_220_2
				end

				arg_217_1.var_.alphaOldValue10035 = 0
			end

			local var_220_3 = 0.333333333333333

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_1) / var_220_3
				local var_220_5 = Mathf.Lerp(arg_217_1.var_.alphaOldValue10035, 1, var_220_4)

				if arg_217_1.var_.characterEffect10035 then
					arg_217_1.var_.characterEffect10035.alpha = var_220_5
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_3 and arg_217_1.time_ < var_220_1 + var_220_3 + arg_220_0 and arg_217_1.var_.characterEffect10035 then
				arg_217_1.var_.characterEffect10035.alpha = 1
			end

			local var_220_6 = arg_217_1.actors_["10035"]
			local var_220_7 = 0

			if var_220_7 < arg_217_1.time_ and arg_217_1.time_ <= var_220_7 + arg_220_0 and arg_217_1.var_.actorSpriteComps10035 == nil then
				arg_217_1.var_.actorSpriteComps10035 = var_220_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_8 = 0.2

			if var_220_7 <= arg_217_1.time_ and arg_217_1.time_ < var_220_7 + var_220_8 then
				local var_220_9 = (arg_217_1.time_ - var_220_7) / var_220_8

				if arg_217_1.var_.actorSpriteComps10035 then
					for iter_220_0, iter_220_1 in pairs(arg_217_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_220_1 then
							local var_220_10 = Mathf.Lerp(iter_220_1.color.r, 1, var_220_9)

							iter_220_1.color = Color.New(var_220_10, var_220_10, var_220_10)
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_7 + var_220_8 and arg_217_1.time_ < var_220_7 + var_220_8 + arg_220_0 and arg_217_1.var_.actorSpriteComps10035 then
				local var_220_11 = 1

				for iter_220_2, iter_220_3 in pairs(arg_217_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_220_3 then
						iter_220_3.color = Color.New(var_220_11, var_220_11, var_220_11)
					end
				end

				arg_217_1.var_.actorSpriteComps10035 = nil
			end

			local var_220_12 = arg_217_1.actors_["10035"].transform
			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1.var_.moveOldPos10035 = var_220_12.localPosition
				var_220_12.localScale = Vector3.New(1, 1, 1)

				arg_217_1:CheckSpriteTmpPos("10035", 4)

				local var_220_14 = var_220_12.childCount

				for iter_220_4 = 0, var_220_14 - 1 do
					local var_220_15 = var_220_12:GetChild(iter_220_4)

					if var_220_15.name == "split_4" or not string.find(var_220_15.name, "split") then
						var_220_15.gameObject:SetActive(true)
					else
						var_220_15.gameObject:SetActive(false)
					end
				end
			end

			local var_220_16 = 0.001

			if var_220_13 <= arg_217_1.time_ and arg_217_1.time_ < var_220_13 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_13) / var_220_16
				local var_220_18 = Vector3.New(390, -410, -235)

				var_220_12.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10035, var_220_18, var_220_17)
			end

			if arg_217_1.time_ >= var_220_13 + var_220_16 and arg_217_1.time_ < var_220_13 + var_220_16 + arg_220_0 then
				var_220_12.localPosition = Vector3.New(390, -410, -235)
			end

			local var_220_19 = 0
			local var_220_20 = 0.7

			if var_220_19 < arg_217_1.time_ and arg_217_1.time_ <= var_220_19 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_21 = arg_217_1:FormatText(StoryNameCfg[369].name)

				arg_217_1.leftNameTxt_.text = var_220_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_22 = arg_217_1:GetWordFromCfg(117081053)
				local var_220_23 = arg_217_1:FormatText(var_220_22.content)

				arg_217_1.text_.text = var_220_23

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_24 = 28
				local var_220_25 = utf8.len(var_220_23)
				local var_220_26 = var_220_24 <= 0 and var_220_20 or var_220_20 * (var_220_25 / var_220_24)

				if var_220_26 > 0 and var_220_20 < var_220_26 then
					arg_217_1.talkMaxDuration = var_220_26

					if var_220_26 + var_220_19 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_26 + var_220_19
					end
				end

				arg_217_1.text_.text = var_220_23
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081053", "story_v_out_117081.awb") ~= 0 then
					local var_220_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081053", "story_v_out_117081.awb") / 1000

					if var_220_27 + var_220_19 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_27 + var_220_19
					end

					if var_220_22.prefab_name ~= "" and arg_217_1.actors_[var_220_22.prefab_name] ~= nil then
						local var_220_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_22.prefab_name].transform, "story_v_out_117081", "117081053", "story_v_out_117081.awb")

						arg_217_1:RecordAudio("117081053", var_220_28)
						arg_217_1:RecordAudio("117081053", var_220_28)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_117081", "117081053", "story_v_out_117081.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_117081", "117081053", "story_v_out_117081.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_29 = math.max(var_220_20, arg_217_1.talkMaxDuration)

			if var_220_19 <= arg_217_1.time_ and arg_217_1.time_ < var_220_19 + var_220_29 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_19) / var_220_29

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_19 + var_220_29 and arg_217_1.time_ < var_220_19 + var_220_29 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play117081054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 117081054
		arg_221_1.duration_ = 3.5

		local var_221_0 = {
			zh = 3.5,
			ja = 1.7
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
				arg_221_0:Play117081055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1132"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				local var_224_2 = var_224_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_224_2 then
					arg_221_1.var_.alphaOldValue1132 = var_224_2.alpha
					arg_221_1.var_.characterEffect1132 = var_224_2
				end

				arg_221_1.var_.alphaOldValue1132 = 0
			end

			local var_224_3 = 0.333333333333333

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_3 then
				local var_224_4 = (arg_221_1.time_ - var_224_1) / var_224_3
				local var_224_5 = Mathf.Lerp(arg_221_1.var_.alphaOldValue1132, 1, var_224_4)

				if arg_221_1.var_.characterEffect1132 then
					arg_221_1.var_.characterEffect1132.alpha = var_224_5
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_3 and arg_221_1.time_ < var_224_1 + var_224_3 + arg_224_0 and arg_221_1.var_.characterEffect1132 then
				arg_221_1.var_.characterEffect1132.alpha = 1
			end

			local var_224_6 = arg_221_1.actors_["1132"]
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 and arg_221_1.var_.actorSpriteComps1132 == nil then
				arg_221_1.var_.actorSpriteComps1132 = var_224_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_8 = 0.2

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_8 then
				local var_224_9 = (arg_221_1.time_ - var_224_7) / var_224_8

				if arg_221_1.var_.actorSpriteComps1132 then
					for iter_224_0, iter_224_1 in pairs(arg_221_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_224_1 then
							local var_224_10 = Mathf.Lerp(iter_224_1.color.r, 0.5, var_224_9)

							iter_224_1.color = Color.New(var_224_10, var_224_10, var_224_10)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_7 + var_224_8 and arg_221_1.time_ < var_224_7 + var_224_8 + arg_224_0 and arg_221_1.var_.actorSpriteComps1132 then
				local var_224_11 = 0.5

				for iter_224_2, iter_224_3 in pairs(arg_221_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_224_3 then
						iter_224_3.color = Color.New(var_224_11, var_224_11, var_224_11)
					end
				end

				arg_221_1.var_.actorSpriteComps1132 = nil
			end

			local var_224_12 = arg_221_1.actors_["1132"].transform
			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1.var_.moveOldPos1132 = var_224_12.localPosition
				var_224_12.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("1132", 2)

				local var_224_14 = var_224_12.childCount

				for iter_224_4 = 0, var_224_14 - 1 do
					local var_224_15 = var_224_12:GetChild(iter_224_4)

					if var_224_15.name == "split_6" or not string.find(var_224_15.name, "split") then
						var_224_15.gameObject:SetActive(true)
					else
						var_224_15.gameObject:SetActive(false)
					end
				end
			end

			local var_224_16 = 0.001

			if var_224_13 <= arg_221_1.time_ and arg_221_1.time_ < var_224_13 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_13) / var_224_16
				local var_224_18 = Vector3.New(-390, -410, -235)

				var_224_12.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1132, var_224_18, var_224_17)
			end

			if arg_221_1.time_ >= var_224_13 + var_224_16 and arg_221_1.time_ < var_224_13 + var_224_16 + arg_224_0 then
				var_224_12.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_224_19 = arg_221_1.actors_["10035"]
			local var_224_20 = 0

			if var_224_20 < arg_221_1.time_ and arg_221_1.time_ <= var_224_20 + arg_224_0 and arg_221_1.var_.actorSpriteComps10035 == nil then
				arg_221_1.var_.actorSpriteComps10035 = var_224_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_21 = 0.2

			if var_224_20 <= arg_221_1.time_ and arg_221_1.time_ < var_224_20 + var_224_21 then
				local var_224_22 = (arg_221_1.time_ - var_224_20) / var_224_21

				if arg_221_1.var_.actorSpriteComps10035 then
					for iter_224_5, iter_224_6 in pairs(arg_221_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_224_6 then
							local var_224_23 = Mathf.Lerp(iter_224_6.color.r, 0.5, var_224_22)

							iter_224_6.color = Color.New(var_224_23, var_224_23, var_224_23)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_20 + var_224_21 and arg_221_1.time_ < var_224_20 + var_224_21 + arg_224_0 and arg_221_1.var_.actorSpriteComps10035 then
				local var_224_24 = 0.5

				for iter_224_7, iter_224_8 in pairs(arg_221_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_224_8 then
						iter_224_8.color = Color.New(var_224_24, var_224_24, var_224_24)
					end
				end

				arg_221_1.var_.actorSpriteComps10035 = nil
			end

			local var_224_25 = arg_221_1.actors_["1132"]
			local var_224_26 = 0

			if var_224_26 < arg_221_1.time_ and arg_221_1.time_ <= var_224_26 + arg_224_0 and arg_221_1.var_.actorSpriteComps1132 == nil then
				arg_221_1.var_.actorSpriteComps1132 = var_224_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_27 = 0.2

			if var_224_26 <= arg_221_1.time_ and arg_221_1.time_ < var_224_26 + var_224_27 then
				local var_224_28 = (arg_221_1.time_ - var_224_26) / var_224_27

				if arg_221_1.var_.actorSpriteComps1132 then
					for iter_224_9, iter_224_10 in pairs(arg_221_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_224_10 then
							local var_224_29 = Mathf.Lerp(iter_224_10.color.r, 1, var_224_28)

							iter_224_10.color = Color.New(var_224_29, var_224_29, var_224_29)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_26 + var_224_27 and arg_221_1.time_ < var_224_26 + var_224_27 + arg_224_0 and arg_221_1.var_.actorSpriteComps1132 then
				local var_224_30 = 1

				for iter_224_11, iter_224_12 in pairs(arg_221_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_224_12 then
						iter_224_12.color = Color.New(var_224_30, var_224_30, var_224_30)
					end
				end

				arg_221_1.var_.actorSpriteComps1132 = nil
			end

			local var_224_31 = 0
			local var_224_32 = 0.375

			if var_224_31 < arg_221_1.time_ and arg_221_1.time_ <= var_224_31 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_33 = arg_221_1:FormatText(StoryNameCfg[61].name)

				arg_221_1.leftNameTxt_.text = var_224_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_34 = arg_221_1:GetWordFromCfg(117081054)
				local var_224_35 = arg_221_1:FormatText(var_224_34.content)

				arg_221_1.text_.text = var_224_35

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_36 = 15
				local var_224_37 = utf8.len(var_224_35)
				local var_224_38 = var_224_36 <= 0 and var_224_32 or var_224_32 * (var_224_37 / var_224_36)

				if var_224_38 > 0 and var_224_32 < var_224_38 then
					arg_221_1.talkMaxDuration = var_224_38

					if var_224_38 + var_224_31 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_38 + var_224_31
					end
				end

				arg_221_1.text_.text = var_224_35
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081054", "story_v_out_117081.awb") ~= 0 then
					local var_224_39 = manager.audio:GetVoiceLength("story_v_out_117081", "117081054", "story_v_out_117081.awb") / 1000

					if var_224_39 + var_224_31 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_39 + var_224_31
					end

					if var_224_34.prefab_name ~= "" and arg_221_1.actors_[var_224_34.prefab_name] ~= nil then
						local var_224_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_34.prefab_name].transform, "story_v_out_117081", "117081054", "story_v_out_117081.awb")

						arg_221_1:RecordAudio("117081054", var_224_40)
						arg_221_1:RecordAudio("117081054", var_224_40)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_117081", "117081054", "story_v_out_117081.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_117081", "117081054", "story_v_out_117081.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_41 = math.max(var_224_32, arg_221_1.talkMaxDuration)

			if var_224_31 <= arg_221_1.time_ and arg_221_1.time_ < var_224_31 + var_224_41 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_31) / var_224_41

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_31 + var_224_41 and arg_221_1.time_ < var_224_31 + var_224_41 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play117081055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 117081055
		arg_225_1.duration_ = 1

		local var_225_0 = {
			zh = 1,
			ja = 0.999999999999
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
				arg_225_0:Play117081056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10035"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.actorSpriteComps10035 == nil then
				arg_225_1.var_.actorSpriteComps10035 = var_228_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.actorSpriteComps10035 then
					for iter_228_0, iter_228_1 in pairs(arg_225_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_228_1 then
							local var_228_4 = Mathf.Lerp(iter_228_1.color.r, 1, var_228_3)

							iter_228_1.color = Color.New(var_228_4, var_228_4, var_228_4)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.actorSpriteComps10035 then
				local var_228_5 = 1

				for iter_228_2, iter_228_3 in pairs(arg_225_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_228_3 then
						iter_228_3.color = Color.New(var_228_5, var_228_5, var_228_5)
					end
				end

				arg_225_1.var_.actorSpriteComps10035 = nil
			end

			local var_228_6 = arg_225_1.actors_["1132"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.actorSpriteComps1132 == nil then
				arg_225_1.var_.actorSpriteComps1132 = var_228_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_8 = 0.2

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.actorSpriteComps1132 then
					for iter_228_4, iter_228_5 in pairs(arg_225_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_228_5 then
							local var_228_10 = Mathf.Lerp(iter_228_5.color.r, 0.5, var_228_9)

							iter_228_5.color = Color.New(var_228_10, var_228_10, var_228_10)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1132 then
				local var_228_11 = 0.5

				for iter_228_6, iter_228_7 in pairs(arg_225_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_228_7 then
						iter_228_7.color = Color.New(var_228_11, var_228_11, var_228_11)
					end
				end

				arg_225_1.var_.actorSpriteComps1132 = nil
			end

			local var_228_12 = 0
			local var_228_13 = 0.075

			if var_228_12 < arg_225_1.time_ and arg_225_1.time_ <= var_228_12 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_14 = arg_225_1:FormatText(StoryNameCfg[369].name)

				arg_225_1.leftNameTxt_.text = var_228_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_15 = arg_225_1:GetWordFromCfg(117081055)
				local var_228_16 = arg_225_1:FormatText(var_228_15.content)

				arg_225_1.text_.text = var_228_16

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_17 = 3
				local var_228_18 = utf8.len(var_228_16)
				local var_228_19 = var_228_17 <= 0 and var_228_13 or var_228_13 * (var_228_18 / var_228_17)

				if var_228_19 > 0 and var_228_13 < var_228_19 then
					arg_225_1.talkMaxDuration = var_228_19

					if var_228_19 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_12
					end
				end

				arg_225_1.text_.text = var_228_16
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081055", "story_v_out_117081.awb") ~= 0 then
					local var_228_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081055", "story_v_out_117081.awb") / 1000

					if var_228_20 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_12
					end

					if var_228_15.prefab_name ~= "" and arg_225_1.actors_[var_228_15.prefab_name] ~= nil then
						local var_228_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_15.prefab_name].transform, "story_v_out_117081", "117081055", "story_v_out_117081.awb")

						arg_225_1:RecordAudio("117081055", var_228_21)
						arg_225_1:RecordAudio("117081055", var_228_21)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_117081", "117081055", "story_v_out_117081.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_117081", "117081055", "story_v_out_117081.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_13, arg_225_1.talkMaxDuration)

			if var_228_12 <= arg_225_1.time_ and arg_225_1.time_ < var_228_12 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_12) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_12 + var_228_22 and arg_225_1.time_ < var_228_12 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play117081056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 117081056
		arg_229_1.duration_ = 10.3

		local var_229_0 = {
			zh = 10.3,
			ja = 8.566
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
				arg_229_0:Play117081057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10035"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps10035 == nil then
				arg_229_1.var_.actorSpriteComps10035 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps10035 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 0.5, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps10035 then
				local var_232_5 = 0.5

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps10035 = nil
			end

			local var_232_6 = arg_229_1.actors_["1132"]
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 and arg_229_1.var_.actorSpriteComps1132 == nil then
				arg_229_1.var_.actorSpriteComps1132 = var_232_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_8 = 0.2

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_8 then
				local var_232_9 = (arg_229_1.time_ - var_232_7) / var_232_8

				if arg_229_1.var_.actorSpriteComps1132 then
					for iter_232_4, iter_232_5 in pairs(arg_229_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_232_5 then
							local var_232_10 = Mathf.Lerp(iter_232_5.color.r, 1, var_232_9)

							iter_232_5.color = Color.New(var_232_10, var_232_10, var_232_10)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_7 + var_232_8 and arg_229_1.time_ < var_232_7 + var_232_8 + arg_232_0 and arg_229_1.var_.actorSpriteComps1132 then
				local var_232_11 = 1

				for iter_232_6, iter_232_7 in pairs(arg_229_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_232_7 then
						iter_232_7.color = Color.New(var_232_11, var_232_11, var_232_11)
					end
				end

				arg_229_1.var_.actorSpriteComps1132 = nil
			end

			local var_232_12 = 0
			local var_232_13 = 1.1

			if var_232_12 < arg_229_1.time_ and arg_229_1.time_ <= var_232_12 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_14 = arg_229_1:FormatText(StoryNameCfg[61].name)

				arg_229_1.leftNameTxt_.text = var_232_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_15 = arg_229_1:GetWordFromCfg(117081056)
				local var_232_16 = arg_229_1:FormatText(var_232_15.content)

				arg_229_1.text_.text = var_232_16

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_17 = 44
				local var_232_18 = utf8.len(var_232_16)
				local var_232_19 = var_232_17 <= 0 and var_232_13 or var_232_13 * (var_232_18 / var_232_17)

				if var_232_19 > 0 and var_232_13 < var_232_19 then
					arg_229_1.talkMaxDuration = var_232_19

					if var_232_19 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_12
					end
				end

				arg_229_1.text_.text = var_232_16
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081056", "story_v_out_117081.awb") ~= 0 then
					local var_232_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081056", "story_v_out_117081.awb") / 1000

					if var_232_20 + var_232_12 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_20 + var_232_12
					end

					if var_232_15.prefab_name ~= "" and arg_229_1.actors_[var_232_15.prefab_name] ~= nil then
						local var_232_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_15.prefab_name].transform, "story_v_out_117081", "117081056", "story_v_out_117081.awb")

						arg_229_1:RecordAudio("117081056", var_232_21)
						arg_229_1:RecordAudio("117081056", var_232_21)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_117081", "117081056", "story_v_out_117081.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_117081", "117081056", "story_v_out_117081.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_22 = math.max(var_232_13, arg_229_1.talkMaxDuration)

			if var_232_12 <= arg_229_1.time_ and arg_229_1.time_ < var_232_12 + var_232_22 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_12) / var_232_22

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_12 + var_232_22 and arg_229_1.time_ < var_232_12 + var_232_22 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play117081057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 117081057
		arg_233_1.duration_ = 6.6

		local var_233_0 = {
			zh = 6.6,
			ja = 5.633
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
				arg_233_0:Play117081058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.95

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[61].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(117081057)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081057", "story_v_out_117081.awb") ~= 0 then
					local var_236_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081057", "story_v_out_117081.awb") / 1000

					if var_236_8 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_0
					end

					if var_236_3.prefab_name ~= "" and arg_233_1.actors_[var_236_3.prefab_name] ~= nil then
						local var_236_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_3.prefab_name].transform, "story_v_out_117081", "117081057", "story_v_out_117081.awb")

						arg_233_1:RecordAudio("117081057", var_236_9)
						arg_233_1:RecordAudio("117081057", var_236_9)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_117081", "117081057", "story_v_out_117081.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_117081", "117081057", "story_v_out_117081.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_10 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_10 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_10

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_10 and arg_233_1.time_ < var_236_0 + var_236_10 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play117081058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 117081058
		arg_237_1.duration_ = 8.733

		local var_237_0 = {
			zh = 8.733,
			ja = 5.8
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
				arg_237_0:Play117081059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 1.1

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[61].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(117081058)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 44
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081058", "story_v_out_117081.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081058", "story_v_out_117081.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_117081", "117081058", "story_v_out_117081.awb")

						arg_237_1:RecordAudio("117081058", var_240_9)
						arg_237_1:RecordAudio("117081058", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_117081", "117081058", "story_v_out_117081.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_117081", "117081058", "story_v_out_117081.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play117081059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 117081059
		arg_241_1.duration_ = 4.866

		local var_241_0 = {
			zh = 3.233,
			ja = 4.866
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
				arg_241_0:Play117081060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10035"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.actorSpriteComps10035 == nil then
				arg_241_1.var_.actorSpriteComps10035 = var_244_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_2 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.actorSpriteComps10035 then
					for iter_244_0, iter_244_1 in pairs(arg_241_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_244_1 then
							local var_244_4 = Mathf.Lerp(iter_244_1.color.r, 1, var_244_3)

							iter_244_1.color = Color.New(var_244_4, var_244_4, var_244_4)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.actorSpriteComps10035 then
				local var_244_5 = 1

				for iter_244_2, iter_244_3 in pairs(arg_241_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_244_3 then
						iter_244_3.color = Color.New(var_244_5, var_244_5, var_244_5)
					end
				end

				arg_241_1.var_.actorSpriteComps10035 = nil
			end

			local var_244_6 = arg_241_1.actors_["1132"]
			local var_244_7 = 0

			if var_244_7 < arg_241_1.time_ and arg_241_1.time_ <= var_244_7 + arg_244_0 and arg_241_1.var_.actorSpriteComps1132 == nil then
				arg_241_1.var_.actorSpriteComps1132 = var_244_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_8 = 0.2

			if var_244_7 <= arg_241_1.time_ and arg_241_1.time_ < var_244_7 + var_244_8 then
				local var_244_9 = (arg_241_1.time_ - var_244_7) / var_244_8

				if arg_241_1.var_.actorSpriteComps1132 then
					for iter_244_4, iter_244_5 in pairs(arg_241_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_244_5 then
							local var_244_10 = Mathf.Lerp(iter_244_5.color.r, 0.5, var_244_9)

							iter_244_5.color = Color.New(var_244_10, var_244_10, var_244_10)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_7 + var_244_8 and arg_241_1.time_ < var_244_7 + var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps1132 then
				local var_244_11 = 0.5

				for iter_244_6, iter_244_7 in pairs(arg_241_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_244_7 then
						iter_244_7.color = Color.New(var_244_11, var_244_11, var_244_11)
					end
				end

				arg_241_1.var_.actorSpriteComps1132 = nil
			end

			local var_244_12 = 0
			local var_244_13 = 0.4

			if var_244_12 < arg_241_1.time_ and arg_241_1.time_ <= var_244_12 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_14 = arg_241_1:FormatText(StoryNameCfg[369].name)

				arg_241_1.leftNameTxt_.text = var_244_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_15 = arg_241_1:GetWordFromCfg(117081059)
				local var_244_16 = arg_241_1:FormatText(var_244_15.content)

				arg_241_1.text_.text = var_244_16

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_17 = 16
				local var_244_18 = utf8.len(var_244_16)
				local var_244_19 = var_244_17 <= 0 and var_244_13 or var_244_13 * (var_244_18 / var_244_17)

				if var_244_19 > 0 and var_244_13 < var_244_19 then
					arg_241_1.talkMaxDuration = var_244_19

					if var_244_19 + var_244_12 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_19 + var_244_12
					end
				end

				arg_241_1.text_.text = var_244_16
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081059", "story_v_out_117081.awb") ~= 0 then
					local var_244_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081059", "story_v_out_117081.awb") / 1000

					if var_244_20 + var_244_12 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_20 + var_244_12
					end

					if var_244_15.prefab_name ~= "" and arg_241_1.actors_[var_244_15.prefab_name] ~= nil then
						local var_244_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_15.prefab_name].transform, "story_v_out_117081", "117081059", "story_v_out_117081.awb")

						arg_241_1:RecordAudio("117081059", var_244_21)
						arg_241_1:RecordAudio("117081059", var_244_21)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_117081", "117081059", "story_v_out_117081.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_117081", "117081059", "story_v_out_117081.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_22 = math.max(var_244_13, arg_241_1.talkMaxDuration)

			if var_244_12 <= arg_241_1.time_ and arg_241_1.time_ < var_244_12 + var_244_22 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_12) / var_244_22

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_12 + var_244_22 and arg_241_1.time_ < var_244_12 + var_244_22 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play117081060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 117081060
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play117081061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10035"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.actorSpriteComps10035 == nil then
				arg_245_1.var_.actorSpriteComps10035 = var_248_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.actorSpriteComps10035 then
					for iter_248_0, iter_248_1 in pairs(arg_245_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_248_1 then
							local var_248_4 = Mathf.Lerp(iter_248_1.color.r, 0.5, var_248_3)

							iter_248_1.color = Color.New(var_248_4, var_248_4, var_248_4)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.actorSpriteComps10035 then
				local var_248_5 = 0.5

				for iter_248_2, iter_248_3 in pairs(arg_245_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_248_3 then
						iter_248_3.color = Color.New(var_248_5, var_248_5, var_248_5)
					end
				end

				arg_245_1.var_.actorSpriteComps10035 = nil
			end

			local var_248_6 = 0
			local var_248_7 = 0.725

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_8 = arg_245_1:GetWordFromCfg(117081060)
				local var_248_9 = arg_245_1:FormatText(var_248_8.content)

				arg_245_1.text_.text = var_248_9

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_10 = 29
				local var_248_11 = utf8.len(var_248_9)
				local var_248_12 = var_248_10 <= 0 and var_248_7 or var_248_7 * (var_248_11 / var_248_10)

				if var_248_12 > 0 and var_248_7 < var_248_12 then
					arg_245_1.talkMaxDuration = var_248_12

					if var_248_12 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_9
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_13 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_13 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_13

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_13 and arg_245_1.time_ < var_248_6 + var_248_13 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play117081061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 117081061
		arg_249_1.duration_ = 6.333

		local var_249_0 = {
			zh = 4.4,
			ja = 6.333
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
				arg_249_0:Play117081062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10035"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.actorSpriteComps10035 == nil then
				arg_249_1.var_.actorSpriteComps10035 = var_252_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.actorSpriteComps10035 then
					for iter_252_0, iter_252_1 in pairs(arg_249_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_252_1 then
							local var_252_4 = Mathf.Lerp(iter_252_1.color.r, 0.5, var_252_3)

							iter_252_1.color = Color.New(var_252_4, var_252_4, var_252_4)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.actorSpriteComps10035 then
				local var_252_5 = 0.5

				for iter_252_2, iter_252_3 in pairs(arg_249_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_252_3 then
						iter_252_3.color = Color.New(var_252_5, var_252_5, var_252_5)
					end
				end

				arg_249_1.var_.actorSpriteComps10035 = nil
			end

			local var_252_6 = arg_249_1.actors_["1132"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and arg_249_1.var_.actorSpriteComps1132 == nil then
				arg_249_1.var_.actorSpriteComps1132 = var_252_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_8 = 0.2

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.actorSpriteComps1132 then
					for iter_252_4, iter_252_5 in pairs(arg_249_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_252_5 then
							local var_252_10 = Mathf.Lerp(iter_252_5.color.r, 1, var_252_9)

							iter_252_5.color = Color.New(var_252_10, var_252_10, var_252_10)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and arg_249_1.var_.actorSpriteComps1132 then
				local var_252_11 = 1

				for iter_252_6, iter_252_7 in pairs(arg_249_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_252_7 then
						iter_252_7.color = Color.New(var_252_11, var_252_11, var_252_11)
					end
				end

				arg_249_1.var_.actorSpriteComps1132 = nil
			end

			local var_252_12 = 0
			local var_252_13 = 0.475

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[61].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(117081061)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081061", "story_v_out_117081.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081061", "story_v_out_117081.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_out_117081", "117081061", "story_v_out_117081.awb")

						arg_249_1:RecordAudio("117081061", var_252_21)
						arg_249_1:RecordAudio("117081061", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_117081", "117081061", "story_v_out_117081.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_117081", "117081061", "story_v_out_117081.awb")
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
	Play117081062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 117081062
		arg_253_1.duration_ = 15.433

		local var_253_0 = {
			zh = 11.7,
			ja = 15.433
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play117081063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 1.2

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[61].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(117081062)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 48
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081062", "story_v_out_117081.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081062", "story_v_out_117081.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_117081", "117081062", "story_v_out_117081.awb")

						arg_253_1:RecordAudio("117081062", var_256_9)
						arg_253_1:RecordAudio("117081062", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_117081", "117081062", "story_v_out_117081.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_117081", "117081062", "story_v_out_117081.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play117081063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 117081063
		arg_257_1.duration_ = 16.9

		local var_257_0 = {
			zh = 16.9,
			ja = 14.466
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play117081064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 2

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[61].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(117081063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 80
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081063", "story_v_out_117081.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081063", "story_v_out_117081.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_117081", "117081063", "story_v_out_117081.awb")

						arg_257_1:RecordAudio("117081063", var_260_9)
						arg_257_1:RecordAudio("117081063", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_117081", "117081063", "story_v_out_117081.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_117081", "117081063", "story_v_out_117081.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_10 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_10 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_10

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_10 and arg_257_1.time_ < var_260_0 + var_260_10 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play117081064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 117081064
		arg_261_1.duration_ = 14.066

		local var_261_0 = {
			zh = 8.133,
			ja = 14.066
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
				arg_261_0:Play117081065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.95

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[61].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(117081064)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 38
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081064", "story_v_out_117081.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081064", "story_v_out_117081.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_117081", "117081064", "story_v_out_117081.awb")

						arg_261_1:RecordAudio("117081064", var_264_9)
						arg_261_1:RecordAudio("117081064", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_117081", "117081064", "story_v_out_117081.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_117081", "117081064", "story_v_out_117081.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play117081065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 117081065
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play117081066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1132"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.actorSpriteComps1132 == nil then
				arg_265_1.var_.actorSpriteComps1132 = var_268_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_2 = 0.2

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.actorSpriteComps1132 then
					for iter_268_0, iter_268_1 in pairs(arg_265_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_268_1 then
							local var_268_4 = Mathf.Lerp(iter_268_1.color.r, 0.5, var_268_3)

							iter_268_1.color = Color.New(var_268_4, var_268_4, var_268_4)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.actorSpriteComps1132 then
				local var_268_5 = 0.5

				for iter_268_2, iter_268_3 in pairs(arg_265_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_268_3 then
						iter_268_3.color = Color.New(var_268_5, var_268_5, var_268_5)
					end
				end

				arg_265_1.var_.actorSpriteComps1132 = nil
			end

			local var_268_6 = 0
			local var_268_7 = 0.775

			if var_268_6 < arg_265_1.time_ and arg_265_1.time_ <= var_268_6 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_8 = arg_265_1:GetWordFromCfg(117081065)
				local var_268_9 = arg_265_1:FormatText(var_268_8.content)

				arg_265_1.text_.text = var_268_9

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_10 = 31
				local var_268_11 = utf8.len(var_268_9)
				local var_268_12 = var_268_10 <= 0 and var_268_7 or var_268_7 * (var_268_11 / var_268_10)

				if var_268_12 > 0 and var_268_7 < var_268_12 then
					arg_265_1.talkMaxDuration = var_268_12

					if var_268_12 + var_268_6 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_12 + var_268_6
					end
				end

				arg_265_1.text_.text = var_268_9
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_13 = math.max(var_268_7, arg_265_1.talkMaxDuration)

			if var_268_6 <= arg_265_1.time_ and arg_265_1.time_ < var_268_6 + var_268_13 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_6) / var_268_13

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_6 + var_268_13 and arg_265_1.time_ < var_268_6 + var_268_13 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play117081066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 117081066
		arg_269_1.duration_ = 9.166

		local var_269_0 = {
			zh = 9.166,
			ja = 4.566
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
				arg_269_0:Play117081067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10035"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.actorSpriteComps10035 == nil then
				arg_269_1.var_.actorSpriteComps10035 = var_272_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.actorSpriteComps10035 then
					for iter_272_0, iter_272_1 in pairs(arg_269_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_272_1 then
							local var_272_4 = Mathf.Lerp(iter_272_1.color.r, 1, var_272_3)

							iter_272_1.color = Color.New(var_272_4, var_272_4, var_272_4)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.actorSpriteComps10035 then
				local var_272_5 = 1

				for iter_272_2, iter_272_3 in pairs(arg_269_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_272_3 then
						iter_272_3.color = Color.New(var_272_5, var_272_5, var_272_5)
					end
				end

				arg_269_1.var_.actorSpriteComps10035 = nil
			end

			local var_272_6 = 0
			local var_272_7 = 0.95

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_8 = arg_269_1:FormatText(StoryNameCfg[369].name)

				arg_269_1.leftNameTxt_.text = var_272_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_9 = arg_269_1:GetWordFromCfg(117081066)
				local var_272_10 = arg_269_1:FormatText(var_272_9.content)

				arg_269_1.text_.text = var_272_10

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_11 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081066", "story_v_out_117081.awb") ~= 0 then
					local var_272_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081066", "story_v_out_117081.awb") / 1000

					if var_272_14 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_14 + var_272_6
					end

					if var_272_9.prefab_name ~= "" and arg_269_1.actors_[var_272_9.prefab_name] ~= nil then
						local var_272_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_9.prefab_name].transform, "story_v_out_117081", "117081066", "story_v_out_117081.awb")

						arg_269_1:RecordAudio("117081066", var_272_15)
						arg_269_1:RecordAudio("117081066", var_272_15)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_117081", "117081066", "story_v_out_117081.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_117081", "117081066", "story_v_out_117081.awb")
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
	Play117081067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 117081067
		arg_273_1.duration_ = 6.633

		local var_273_0 = {
			zh = 4.033,
			ja = 6.633
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
				arg_273_0:Play117081068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["10035"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.actorSpriteComps10035 == nil then
				arg_273_1.var_.actorSpriteComps10035 = var_276_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_276_2 = 0.2

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.actorSpriteComps10035 then
					for iter_276_0, iter_276_1 in pairs(arg_273_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_276_1 then
							local var_276_4 = Mathf.Lerp(iter_276_1.color.r, 0.5, var_276_3)

							iter_276_1.color = Color.New(var_276_4, var_276_4, var_276_4)
						end
					end
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.actorSpriteComps10035 then
				local var_276_5 = 0.5

				for iter_276_2, iter_276_3 in pairs(arg_273_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_276_3 then
						iter_276_3.color = Color.New(var_276_5, var_276_5, var_276_5)
					end
				end

				arg_273_1.var_.actorSpriteComps10035 = nil
			end

			local var_276_6 = 0
			local var_276_7 = 0.45

			if var_276_6 < arg_273_1.time_ and arg_273_1.time_ <= var_276_6 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_8 = arg_273_1:FormatText(StoryNameCfg[367].name)

				arg_273_1.leftNameTxt_.text = var_276_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, true)
				arg_273_1.iconController_:SetSelectedState("hero")

				arg_273_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_9 = arg_273_1:GetWordFromCfg(117081067)
				local var_276_10 = arg_273_1:FormatText(var_276_9.content)

				arg_273_1.text_.text = var_276_10

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081067", "story_v_out_117081.awb") ~= 0 then
					local var_276_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081067", "story_v_out_117081.awb") / 1000

					if var_276_14 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_14 + var_276_6
					end

					if var_276_9.prefab_name ~= "" and arg_273_1.actors_[var_276_9.prefab_name] ~= nil then
						local var_276_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_9.prefab_name].transform, "story_v_out_117081", "117081067", "story_v_out_117081.awb")

						arg_273_1:RecordAudio("117081067", var_276_15)
						arg_273_1:RecordAudio("117081067", var_276_15)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_117081", "117081067", "story_v_out_117081.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_117081", "117081067", "story_v_out_117081.awb")
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
	Play117081068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 117081068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play117081069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.55

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(117081068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 22
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play117081069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 117081069
		arg_281_1.duration_ = 9.933

		local var_281_0 = {
			zh = 9.933,
			ja = 7.2
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
				arg_281_0:Play117081070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1132"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.actorSpriteComps1132 == nil then
				arg_281_1.var_.actorSpriteComps1132 = var_284_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.actorSpriteComps1132 then
					for iter_284_0, iter_284_1 in pairs(arg_281_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_284_1 then
							local var_284_4 = Mathf.Lerp(iter_284_1.color.r, 1, var_284_3)

							iter_284_1.color = Color.New(var_284_4, var_284_4, var_284_4)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.actorSpriteComps1132 then
				local var_284_5 = 1

				for iter_284_2, iter_284_3 in pairs(arg_281_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_284_3 then
						iter_284_3.color = Color.New(var_284_5, var_284_5, var_284_5)
					end
				end

				arg_281_1.var_.actorSpriteComps1132 = nil
			end

			local var_284_6 = 0
			local var_284_7 = 0.9

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_8 = arg_281_1:FormatText(StoryNameCfg[61].name)

				arg_281_1.leftNameTxt_.text = var_284_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_9 = arg_281_1:GetWordFromCfg(117081069)
				local var_284_10 = arg_281_1:FormatText(var_284_9.content)

				arg_281_1.text_.text = var_284_10

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_11 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081069", "story_v_out_117081.awb") ~= 0 then
					local var_284_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081069", "story_v_out_117081.awb") / 1000

					if var_284_14 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_14 + var_284_6
					end

					if var_284_9.prefab_name ~= "" and arg_281_1.actors_[var_284_9.prefab_name] ~= nil then
						local var_284_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_9.prefab_name].transform, "story_v_out_117081", "117081069", "story_v_out_117081.awb")

						arg_281_1:RecordAudio("117081069", var_284_15)
						arg_281_1:RecordAudio("117081069", var_284_15)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_117081", "117081069", "story_v_out_117081.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_117081", "117081069", "story_v_out_117081.awb")
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
	Play117081070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 117081070
		arg_285_1.duration_ = 9.1

		local var_285_0 = {
			zh = 6.8,
			ja = 9.1
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play117081071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.6

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[61].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(117081070)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 24
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081070", "story_v_out_117081.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_117081", "117081070", "story_v_out_117081.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_117081", "117081070", "story_v_out_117081.awb")

						arg_285_1:RecordAudio("117081070", var_288_9)
						arg_285_1:RecordAudio("117081070", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_117081", "117081070", "story_v_out_117081.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_117081", "117081070", "story_v_out_117081.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play117081071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 117081071
		arg_289_1.duration_ = 13.066

		local var_289_0 = {
			zh = 13.066,
			ja = 11.833
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
				arg_289_0:Play117081072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["10035"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and arg_289_1.var_.actorSpriteComps10035 == nil then
				arg_289_1.var_.actorSpriteComps10035 = var_292_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_2 = 0.2

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.actorSpriteComps10035 then
					for iter_292_0, iter_292_1 in pairs(arg_289_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_292_1 then
							local var_292_4 = Mathf.Lerp(iter_292_1.color.r, 1, var_292_3)

							iter_292_1.color = Color.New(var_292_4, var_292_4, var_292_4)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and arg_289_1.var_.actorSpriteComps10035 then
				local var_292_5 = 1

				for iter_292_2, iter_292_3 in pairs(arg_289_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_292_3 then
						iter_292_3.color = Color.New(var_292_5, var_292_5, var_292_5)
					end
				end

				arg_289_1.var_.actorSpriteComps10035 = nil
			end

			local var_292_6 = arg_289_1.actors_["1132"]
			local var_292_7 = 0

			if var_292_7 < arg_289_1.time_ and arg_289_1.time_ <= var_292_7 + arg_292_0 and arg_289_1.var_.actorSpriteComps1132 == nil then
				arg_289_1.var_.actorSpriteComps1132 = var_292_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_292_8 = 0.2

			if var_292_7 <= arg_289_1.time_ and arg_289_1.time_ < var_292_7 + var_292_8 then
				local var_292_9 = (arg_289_1.time_ - var_292_7) / var_292_8

				if arg_289_1.var_.actorSpriteComps1132 then
					for iter_292_4, iter_292_5 in pairs(arg_289_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_292_5 then
							local var_292_10 = Mathf.Lerp(iter_292_5.color.r, 0.5, var_292_9)

							iter_292_5.color = Color.New(var_292_10, var_292_10, var_292_10)
						end
					end
				end
			end

			if arg_289_1.time_ >= var_292_7 + var_292_8 and arg_289_1.time_ < var_292_7 + var_292_8 + arg_292_0 and arg_289_1.var_.actorSpriteComps1132 then
				local var_292_11 = 0.5

				for iter_292_6, iter_292_7 in pairs(arg_289_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_292_7 then
						iter_292_7.color = Color.New(var_292_11, var_292_11, var_292_11)
					end
				end

				arg_289_1.var_.actorSpriteComps1132 = nil
			end

			local var_292_12 = 0
			local var_292_13 = 1.375

			if var_292_12 < arg_289_1.time_ and arg_289_1.time_ <= var_292_12 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_14 = arg_289_1:FormatText(StoryNameCfg[369].name)

				arg_289_1.leftNameTxt_.text = var_292_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_15 = arg_289_1:GetWordFromCfg(117081071)
				local var_292_16 = arg_289_1:FormatText(var_292_15.content)

				arg_289_1.text_.text = var_292_16

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_17 = 55
				local var_292_18 = utf8.len(var_292_16)
				local var_292_19 = var_292_17 <= 0 and var_292_13 or var_292_13 * (var_292_18 / var_292_17)

				if var_292_19 > 0 and var_292_13 < var_292_19 then
					arg_289_1.talkMaxDuration = var_292_19

					if var_292_19 + var_292_12 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_19 + var_292_12
					end
				end

				arg_289_1.text_.text = var_292_16
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081071", "story_v_out_117081.awb") ~= 0 then
					local var_292_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081071", "story_v_out_117081.awb") / 1000

					if var_292_20 + var_292_12 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_20 + var_292_12
					end

					if var_292_15.prefab_name ~= "" and arg_289_1.actors_[var_292_15.prefab_name] ~= nil then
						local var_292_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_15.prefab_name].transform, "story_v_out_117081", "117081071", "story_v_out_117081.awb")

						arg_289_1:RecordAudio("117081071", var_292_21)
						arg_289_1:RecordAudio("117081071", var_292_21)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_117081", "117081071", "story_v_out_117081.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_117081", "117081071", "story_v_out_117081.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_22 = math.max(var_292_13, arg_289_1.talkMaxDuration)

			if var_292_12 <= arg_289_1.time_ and arg_289_1.time_ < var_292_12 + var_292_22 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_12) / var_292_22

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_12 + var_292_22 and arg_289_1.time_ < var_292_12 + var_292_22 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play117081072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 117081072
		arg_293_1.duration_ = 7.966

		local var_293_0 = {
			zh = 7.966,
			ja = 2.166
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play117081073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10035"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.actorSpriteComps10035 == nil then
				arg_293_1.var_.actorSpriteComps10035 = var_296_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_2 = 0.2

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.actorSpriteComps10035 then
					for iter_296_0, iter_296_1 in pairs(arg_293_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_296_1 then
							local var_296_4 = Mathf.Lerp(iter_296_1.color.r, 0.5, var_296_3)

							iter_296_1.color = Color.New(var_296_4, var_296_4, var_296_4)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.actorSpriteComps10035 then
				local var_296_5 = 0.5

				for iter_296_2, iter_296_3 in pairs(arg_293_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_296_3 then
						iter_296_3.color = Color.New(var_296_5, var_296_5, var_296_5)
					end
				end

				arg_293_1.var_.actorSpriteComps10035 = nil
			end

			local var_296_6 = arg_293_1.actors_["1132"]
			local var_296_7 = 0

			if var_296_7 < arg_293_1.time_ and arg_293_1.time_ <= var_296_7 + arg_296_0 and arg_293_1.var_.actorSpriteComps1132 == nil then
				arg_293_1.var_.actorSpriteComps1132 = var_296_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_296_8 = 0.2

			if var_296_7 <= arg_293_1.time_ and arg_293_1.time_ < var_296_7 + var_296_8 then
				local var_296_9 = (arg_293_1.time_ - var_296_7) / var_296_8

				if arg_293_1.var_.actorSpriteComps1132 then
					for iter_296_4, iter_296_5 in pairs(arg_293_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_296_5 then
							local var_296_10 = Mathf.Lerp(iter_296_5.color.r, 1, var_296_9)

							iter_296_5.color = Color.New(var_296_10, var_296_10, var_296_10)
						end
					end
				end
			end

			if arg_293_1.time_ >= var_296_7 + var_296_8 and arg_293_1.time_ < var_296_7 + var_296_8 + arg_296_0 and arg_293_1.var_.actorSpriteComps1132 then
				local var_296_11 = 1

				for iter_296_6, iter_296_7 in pairs(arg_293_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_296_7 then
						iter_296_7.color = Color.New(var_296_11, var_296_11, var_296_11)
					end
				end

				arg_293_1.var_.actorSpriteComps1132 = nil
			end

			local var_296_12 = 0
			local var_296_13 = 0.575

			if var_296_12 < arg_293_1.time_ and arg_293_1.time_ <= var_296_12 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_14 = arg_293_1:FormatText(StoryNameCfg[61].name)

				arg_293_1.leftNameTxt_.text = var_296_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_15 = arg_293_1:GetWordFromCfg(117081072)
				local var_296_16 = arg_293_1:FormatText(var_296_15.content)

				arg_293_1.text_.text = var_296_16

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_17 = 23
				local var_296_18 = utf8.len(var_296_16)
				local var_296_19 = var_296_17 <= 0 and var_296_13 or var_296_13 * (var_296_18 / var_296_17)

				if var_296_19 > 0 and var_296_13 < var_296_19 then
					arg_293_1.talkMaxDuration = var_296_19

					if var_296_19 + var_296_12 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_19 + var_296_12
					end
				end

				arg_293_1.text_.text = var_296_16
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081072", "story_v_out_117081.awb") ~= 0 then
					local var_296_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081072", "story_v_out_117081.awb") / 1000

					if var_296_20 + var_296_12 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_20 + var_296_12
					end

					if var_296_15.prefab_name ~= "" and arg_293_1.actors_[var_296_15.prefab_name] ~= nil then
						local var_296_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_15.prefab_name].transform, "story_v_out_117081", "117081072", "story_v_out_117081.awb")

						arg_293_1:RecordAudio("117081072", var_296_21)
						arg_293_1:RecordAudio("117081072", var_296_21)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_117081", "117081072", "story_v_out_117081.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_117081", "117081072", "story_v_out_117081.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_22 = math.max(var_296_13, arg_293_1.talkMaxDuration)

			if var_296_12 <= arg_293_1.time_ and arg_293_1.time_ < var_296_12 + var_296_22 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_12) / var_296_22

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_12 + var_296_22 and arg_293_1.time_ < var_296_12 + var_296_22 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play117081073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 117081073
		arg_297_1.duration_ = 1.7

		local var_297_0 = {
			zh = 1.7,
			ja = 1.133
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play117081074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["10035"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.actorSpriteComps10035 == nil then
				arg_297_1.var_.actorSpriteComps10035 = var_300_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_2 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.actorSpriteComps10035 then
					for iter_300_0, iter_300_1 in pairs(arg_297_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_300_1 then
							local var_300_4 = Mathf.Lerp(iter_300_1.color.r, 1, var_300_3)

							iter_300_1.color = Color.New(var_300_4, var_300_4, var_300_4)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.actorSpriteComps10035 then
				local var_300_5 = 1

				for iter_300_2, iter_300_3 in pairs(arg_297_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_300_3 then
						iter_300_3.color = Color.New(var_300_5, var_300_5, var_300_5)
					end
				end

				arg_297_1.var_.actorSpriteComps10035 = nil
			end

			local var_300_6 = arg_297_1.actors_["1132"]
			local var_300_7 = 0

			if var_300_7 < arg_297_1.time_ and arg_297_1.time_ <= var_300_7 + arg_300_0 and arg_297_1.var_.actorSpriteComps1132 == nil then
				arg_297_1.var_.actorSpriteComps1132 = var_300_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_8 = 0.2

			if var_300_7 <= arg_297_1.time_ and arg_297_1.time_ < var_300_7 + var_300_8 then
				local var_300_9 = (arg_297_1.time_ - var_300_7) / var_300_8

				if arg_297_1.var_.actorSpriteComps1132 then
					for iter_300_4, iter_300_5 in pairs(arg_297_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_300_5 then
							local var_300_10 = Mathf.Lerp(iter_300_5.color.r, 0.5, var_300_9)

							iter_300_5.color = Color.New(var_300_10, var_300_10, var_300_10)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_7 + var_300_8 and arg_297_1.time_ < var_300_7 + var_300_8 + arg_300_0 and arg_297_1.var_.actorSpriteComps1132 then
				local var_300_11 = 0.5

				for iter_300_6, iter_300_7 in pairs(arg_297_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_300_7 then
						iter_300_7.color = Color.New(var_300_11, var_300_11, var_300_11)
					end
				end

				arg_297_1.var_.actorSpriteComps1132 = nil
			end

			local var_300_12 = 0
			local var_300_13 = 0.1

			if var_300_12 < arg_297_1.time_ and arg_297_1.time_ <= var_300_12 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_14 = arg_297_1:FormatText(StoryNameCfg[369].name)

				arg_297_1.leftNameTxt_.text = var_300_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_15 = arg_297_1:GetWordFromCfg(117081073)
				local var_300_16 = arg_297_1:FormatText(var_300_15.content)

				arg_297_1.text_.text = var_300_16

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_17 = 4
				local var_300_18 = utf8.len(var_300_16)
				local var_300_19 = var_300_17 <= 0 and var_300_13 or var_300_13 * (var_300_18 / var_300_17)

				if var_300_19 > 0 and var_300_13 < var_300_19 then
					arg_297_1.talkMaxDuration = var_300_19

					if var_300_19 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_19 + var_300_12
					end
				end

				arg_297_1.text_.text = var_300_16
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081073", "story_v_out_117081.awb") ~= 0 then
					local var_300_20 = manager.audio:GetVoiceLength("story_v_out_117081", "117081073", "story_v_out_117081.awb") / 1000

					if var_300_20 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_20 + var_300_12
					end

					if var_300_15.prefab_name ~= "" and arg_297_1.actors_[var_300_15.prefab_name] ~= nil then
						local var_300_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_15.prefab_name].transform, "story_v_out_117081", "117081073", "story_v_out_117081.awb")

						arg_297_1:RecordAudio("117081073", var_300_21)
						arg_297_1:RecordAudio("117081073", var_300_21)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_117081", "117081073", "story_v_out_117081.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_117081", "117081073", "story_v_out_117081.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_22 = math.max(var_300_13, arg_297_1.talkMaxDuration)

			if var_300_12 <= arg_297_1.time_ and arg_297_1.time_ < var_300_12 + var_300_22 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_12) / var_300_22

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_12 + var_300_22 and arg_297_1.time_ < var_300_12 + var_300_22 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play117081074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 117081074
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play117081075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1132"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				local var_304_2 = var_304_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_304_2 then
					arg_301_1.var_.alphaOldValue1132 = var_304_2.alpha
					arg_301_1.var_.characterEffect1132 = var_304_2
				end

				arg_301_1.var_.alphaOldValue1132 = 1
			end

			local var_304_3 = 0.5

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_3 then
				local var_304_4 = (arg_301_1.time_ - var_304_1) / var_304_3
				local var_304_5 = Mathf.Lerp(arg_301_1.var_.alphaOldValue1132, 0, var_304_4)

				if arg_301_1.var_.characterEffect1132 then
					arg_301_1.var_.characterEffect1132.alpha = var_304_5
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_3 and arg_301_1.time_ < var_304_1 + var_304_3 + arg_304_0 and arg_301_1.var_.characterEffect1132 then
				arg_301_1.var_.characterEffect1132.alpha = 0
			end

			local var_304_6 = arg_301_1.actors_["10035"]
			local var_304_7 = 0

			if var_304_7 < arg_301_1.time_ and arg_301_1.time_ <= var_304_7 + arg_304_0 then
				local var_304_8 = var_304_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_304_8 then
					arg_301_1.var_.alphaOldValue10035 = var_304_8.alpha
					arg_301_1.var_.characterEffect10035 = var_304_8
				end

				arg_301_1.var_.alphaOldValue10035 = 1
			end

			local var_304_9 = 0.5

			if var_304_7 <= arg_301_1.time_ and arg_301_1.time_ < var_304_7 + var_304_9 then
				local var_304_10 = (arg_301_1.time_ - var_304_7) / var_304_9
				local var_304_11 = Mathf.Lerp(arg_301_1.var_.alphaOldValue10035, 0, var_304_10)

				if arg_301_1.var_.characterEffect10035 then
					arg_301_1.var_.characterEffect10035.alpha = var_304_11
				end
			end

			if arg_301_1.time_ >= var_304_7 + var_304_9 and arg_301_1.time_ < var_304_7 + var_304_9 + arg_304_0 and arg_301_1.var_.characterEffect10035 then
				arg_301_1.var_.characterEffect10035.alpha = 0
			end

			local var_304_12 = 0
			local var_304_13 = 1

			if var_304_12 < arg_301_1.time_ and arg_301_1.time_ <= var_304_12 + arg_304_0 then
				local var_304_14 = "play"
				local var_304_15 = "effect"

				arg_301_1:AudioAction(var_304_14, var_304_15, "se_story_17", "se_story_17_elecclock", "")
			end

			local var_304_16 = 0
			local var_304_17 = 1.3

			if var_304_16 < arg_301_1.time_ and arg_301_1.time_ <= var_304_16 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_18 = arg_301_1:GetWordFromCfg(117081074)
				local var_304_19 = arg_301_1:FormatText(var_304_18.content)

				arg_301_1.text_.text = var_304_19

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_20 = 52
				local var_304_21 = utf8.len(var_304_19)
				local var_304_22 = var_304_20 <= 0 and var_304_17 or var_304_17 * (var_304_21 / var_304_20)

				if var_304_22 > 0 and var_304_17 < var_304_22 then
					arg_301_1.talkMaxDuration = var_304_22

					if var_304_22 + var_304_16 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_22 + var_304_16
					end
				end

				arg_301_1.text_.text = var_304_19
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_23 = math.max(var_304_17, arg_301_1.talkMaxDuration)

			if var_304_16 <= arg_301_1.time_ and arg_301_1.time_ < var_304_16 + var_304_23 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_16) / var_304_23

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_16 + var_304_23 and arg_301_1.time_ < var_304_16 + var_304_23 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play117081075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 117081075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play117081076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.65

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_2 = arg_305_1:GetWordFromCfg(117081075)
				local var_308_3 = arg_305_1:FormatText(var_308_2.content)

				arg_305_1.text_.text = var_308_3

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_4 = 26
				local var_308_5 = utf8.len(var_308_3)
				local var_308_6 = var_308_4 <= 0 and var_308_1 or var_308_1 * (var_308_5 / var_308_4)

				if var_308_6 > 0 and var_308_1 < var_308_6 then
					arg_305_1.talkMaxDuration = var_308_6

					if var_308_6 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_6 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_3
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_7 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_7 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_7

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_7 and arg_305_1.time_ < var_308_0 + var_308_7 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play117081076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 117081076
		arg_309_1.duration_ = 6.6

		local var_309_0 = {
			zh = 6.6,
			ja = 3.466
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play117081077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1132"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.actorSpriteComps1132 == nil then
				arg_309_1.var_.actorSpriteComps1132 = var_312_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_2 = 0.2

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.actorSpriteComps1132 then
					for iter_312_0, iter_312_1 in pairs(arg_309_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_312_1 then
							local var_312_4 = Mathf.Lerp(iter_312_1.color.r, 1, var_312_3)

							iter_312_1.color = Color.New(var_312_4, var_312_4, var_312_4)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.actorSpriteComps1132 then
				local var_312_5 = 1

				for iter_312_2, iter_312_3 in pairs(arg_309_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_312_3 then
						iter_312_3.color = Color.New(var_312_5, var_312_5, var_312_5)
					end
				end

				arg_309_1.var_.actorSpriteComps1132 = nil
			end

			local var_312_6 = arg_309_1.actors_["1132"].transform
			local var_312_7 = 0

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 then
				arg_309_1.var_.moveOldPos1132 = var_312_6.localPosition
				var_312_6.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("1132", 2)

				local var_312_8 = var_312_6.childCount

				for iter_312_4 = 0, var_312_8 - 1 do
					local var_312_9 = var_312_6:GetChild(iter_312_4)

					if var_312_9.name == "split_6" or not string.find(var_312_9.name, "split") then
						var_312_9.gameObject:SetActive(true)
					else
						var_312_9.gameObject:SetActive(false)
					end
				end
			end

			local var_312_10 = 0.001

			if var_312_7 <= arg_309_1.time_ and arg_309_1.time_ < var_312_7 + var_312_10 then
				local var_312_11 = (arg_309_1.time_ - var_312_7) / var_312_10
				local var_312_12 = Vector3.New(-390, -413, -185)

				var_312_6.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1132, var_312_12, var_312_11)
			end

			if arg_309_1.time_ >= var_312_7 + var_312_10 and arg_309_1.time_ < var_312_7 + var_312_10 + arg_312_0 then
				var_312_6.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_312_13 = arg_309_1.actors_["1132"]
			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				local var_312_15 = var_312_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_312_15 then
					arg_309_1.var_.alphaOldValue1132 = var_312_15.alpha
					arg_309_1.var_.characterEffect1132 = var_312_15
				end

				arg_309_1.var_.alphaOldValue1132 = 0
			end

			local var_312_16 = 0.5

			if var_312_14 <= arg_309_1.time_ and arg_309_1.time_ < var_312_14 + var_312_16 then
				local var_312_17 = (arg_309_1.time_ - var_312_14) / var_312_16
				local var_312_18 = Mathf.Lerp(arg_309_1.var_.alphaOldValue1132, 1, var_312_17)

				if arg_309_1.var_.characterEffect1132 then
					arg_309_1.var_.characterEffect1132.alpha = var_312_18
				end
			end

			if arg_309_1.time_ >= var_312_14 + var_312_16 and arg_309_1.time_ < var_312_14 + var_312_16 + arg_312_0 and arg_309_1.var_.characterEffect1132 then
				arg_309_1.var_.characterEffect1132.alpha = 1
			end

			local var_312_19 = 0
			local var_312_20 = 0.475

			if var_312_19 < arg_309_1.time_ and arg_309_1.time_ <= var_312_19 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_21 = arg_309_1:FormatText(StoryNameCfg[61].name)

				arg_309_1.leftNameTxt_.text = var_312_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_22 = arg_309_1:GetWordFromCfg(117081076)
				local var_312_23 = arg_309_1:FormatText(var_312_22.content)

				arg_309_1.text_.text = var_312_23

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_24 = 19
				local var_312_25 = utf8.len(var_312_23)
				local var_312_26 = var_312_24 <= 0 and var_312_20 or var_312_20 * (var_312_25 / var_312_24)

				if var_312_26 > 0 and var_312_20 < var_312_26 then
					arg_309_1.talkMaxDuration = var_312_26

					if var_312_26 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_26 + var_312_19
					end
				end

				arg_309_1.text_.text = var_312_23
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081076", "story_v_out_117081.awb") ~= 0 then
					local var_312_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081076", "story_v_out_117081.awb") / 1000

					if var_312_27 + var_312_19 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_27 + var_312_19
					end

					if var_312_22.prefab_name ~= "" and arg_309_1.actors_[var_312_22.prefab_name] ~= nil then
						local var_312_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_22.prefab_name].transform, "story_v_out_117081", "117081076", "story_v_out_117081.awb")

						arg_309_1:RecordAudio("117081076", var_312_28)
						arg_309_1:RecordAudio("117081076", var_312_28)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_117081", "117081076", "story_v_out_117081.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_117081", "117081076", "story_v_out_117081.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_29 = math.max(var_312_20, arg_309_1.talkMaxDuration)

			if var_312_19 <= arg_309_1.time_ and arg_309_1.time_ < var_312_19 + var_312_29 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_19) / var_312_29

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_19 + var_312_29 and arg_309_1.time_ < var_312_19 + var_312_29 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play117081077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 117081077
		arg_313_1.duration_ = 2.233

		local var_313_0 = {
			zh = 2.233,
			ja = 1.6
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play117081078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10034"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.actorSpriteComps10034 == nil then
				arg_313_1.var_.actorSpriteComps10034 = var_316_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.actorSpriteComps10034 then
					for iter_316_0, iter_316_1 in pairs(arg_313_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_316_1 then
							local var_316_4 = Mathf.Lerp(iter_316_1.color.r, 1, var_316_3)

							iter_316_1.color = Color.New(var_316_4, var_316_4, var_316_4)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.actorSpriteComps10034 then
				local var_316_5 = 1

				for iter_316_2, iter_316_3 in pairs(arg_313_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_316_3 then
						iter_316_3.color = Color.New(var_316_5, var_316_5, var_316_5)
					end
				end

				arg_313_1.var_.actorSpriteComps10034 = nil
			end

			local var_316_6 = arg_313_1.actors_["10034"].transform
			local var_316_7 = 0

			if var_316_7 < arg_313_1.time_ and arg_313_1.time_ <= var_316_7 + arg_316_0 then
				arg_313_1.var_.moveOldPos10034 = var_316_6.localPosition
				var_316_6.localScale = Vector3.New(1, 1, 1)

				arg_313_1:CheckSpriteTmpPos("10034", 4)

				local var_316_8 = var_316_6.childCount

				for iter_316_4 = 0, var_316_8 - 1 do
					local var_316_9 = var_316_6:GetChild(iter_316_4)

					if var_316_9.name == "split_2" or not string.find(var_316_9.name, "split") then
						var_316_9.gameObject:SetActive(true)
					else
						var_316_9.gameObject:SetActive(false)
					end
				end
			end

			local var_316_10 = 0.001

			if var_316_7 <= arg_313_1.time_ and arg_313_1.time_ < var_316_7 + var_316_10 then
				local var_316_11 = (arg_313_1.time_ - var_316_7) / var_316_10
				local var_316_12 = Vector3.New(390, -413, -185)

				var_316_6.localPosition = Vector3.Lerp(arg_313_1.var_.moveOldPos10034, var_316_12, var_316_11)
			end

			if arg_313_1.time_ >= var_316_7 + var_316_10 and arg_313_1.time_ < var_316_7 + var_316_10 + arg_316_0 then
				var_316_6.localPosition = Vector3.New(390, -413, -185)
			end

			local var_316_13 = arg_313_1.actors_["10034"]
			local var_316_14 = 0

			if var_316_14 < arg_313_1.time_ and arg_313_1.time_ <= var_316_14 + arg_316_0 then
				local var_316_15 = var_316_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_316_15 then
					arg_313_1.var_.alphaOldValue10034 = var_316_15.alpha
					arg_313_1.var_.characterEffect10034 = var_316_15
				end

				arg_313_1.var_.alphaOldValue10034 = 0
			end

			local var_316_16 = 0.5

			if var_316_14 <= arg_313_1.time_ and arg_313_1.time_ < var_316_14 + var_316_16 then
				local var_316_17 = (arg_313_1.time_ - var_316_14) / var_316_16
				local var_316_18 = Mathf.Lerp(arg_313_1.var_.alphaOldValue10034, 1, var_316_17)

				if arg_313_1.var_.characterEffect10034 then
					arg_313_1.var_.characterEffect10034.alpha = var_316_18
				end
			end

			if arg_313_1.time_ >= var_316_14 + var_316_16 and arg_313_1.time_ < var_316_14 + var_316_16 + arg_316_0 and arg_313_1.var_.characterEffect10034 then
				arg_313_1.var_.characterEffect10034.alpha = 1
			end

			local var_316_19 = arg_313_1.actors_["1132"]
			local var_316_20 = 0

			if var_316_20 < arg_313_1.time_ and arg_313_1.time_ <= var_316_20 + arg_316_0 and arg_313_1.var_.actorSpriteComps1132 == nil then
				arg_313_1.var_.actorSpriteComps1132 = var_316_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_21 = 0.2

			if var_316_20 <= arg_313_1.time_ and arg_313_1.time_ < var_316_20 + var_316_21 then
				local var_316_22 = (arg_313_1.time_ - var_316_20) / var_316_21

				if arg_313_1.var_.actorSpriteComps1132 then
					for iter_316_5, iter_316_6 in pairs(arg_313_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_316_6 then
							local var_316_23 = Mathf.Lerp(iter_316_6.color.r, 0.5, var_316_22)

							iter_316_6.color = Color.New(var_316_23, var_316_23, var_316_23)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_20 + var_316_21 and arg_313_1.time_ < var_316_20 + var_316_21 + arg_316_0 and arg_313_1.var_.actorSpriteComps1132 then
				local var_316_24 = 0.5

				for iter_316_7, iter_316_8 in pairs(arg_313_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_316_8 then
						iter_316_8.color = Color.New(var_316_24, var_316_24, var_316_24)
					end
				end

				arg_313_1.var_.actorSpriteComps1132 = nil
			end

			local var_316_25 = 0
			local var_316_26 = 0.15

			if var_316_25 < arg_313_1.time_ and arg_313_1.time_ <= var_316_25 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_27 = arg_313_1:FormatText(StoryNameCfg[367].name)

				arg_313_1.leftNameTxt_.text = var_316_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_28 = arg_313_1:GetWordFromCfg(117081077)
				local var_316_29 = arg_313_1:FormatText(var_316_28.content)

				arg_313_1.text_.text = var_316_29

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_30 = 6
				local var_316_31 = utf8.len(var_316_29)
				local var_316_32 = var_316_30 <= 0 and var_316_26 or var_316_26 * (var_316_31 / var_316_30)

				if var_316_32 > 0 and var_316_26 < var_316_32 then
					arg_313_1.talkMaxDuration = var_316_32

					if var_316_32 + var_316_25 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_32 + var_316_25
					end
				end

				arg_313_1.text_.text = var_316_29
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081077", "story_v_out_117081.awb") ~= 0 then
					local var_316_33 = manager.audio:GetVoiceLength("story_v_out_117081", "117081077", "story_v_out_117081.awb") / 1000

					if var_316_33 + var_316_25 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_33 + var_316_25
					end

					if var_316_28.prefab_name ~= "" and arg_313_1.actors_[var_316_28.prefab_name] ~= nil then
						local var_316_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_28.prefab_name].transform, "story_v_out_117081", "117081077", "story_v_out_117081.awb")

						arg_313_1:RecordAudio("117081077", var_316_34)
						arg_313_1:RecordAudio("117081077", var_316_34)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_117081", "117081077", "story_v_out_117081.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_117081", "117081077", "story_v_out_117081.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_35 = math.max(var_316_26, arg_313_1.talkMaxDuration)

			if var_316_25 <= arg_313_1.time_ and arg_313_1.time_ < var_316_25 + var_316_35 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_25) / var_316_35

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_25 + var_316_35 and arg_313_1.time_ < var_316_25 + var_316_35 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play117081078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 117081078
		arg_317_1.duration_ = 9

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play117081079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = "ST03a"

			if arg_317_1.bgs_[var_320_0] == nil then
				local var_320_1 = Object.Instantiate(arg_317_1.paintGo_)

				var_320_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_320_0)
				var_320_1.name = var_320_0
				var_320_1.transform.parent = arg_317_1.stage_.transform
				var_320_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_317_1.bgs_[var_320_0] = var_320_1
			end

			local var_320_2 = 2

			if var_320_2 < arg_317_1.time_ and arg_317_1.time_ <= var_320_2 + arg_320_0 then
				local var_320_3 = manager.ui.mainCamera.transform.localPosition
				local var_320_4 = Vector3.New(0, 0, 10) + Vector3.New(var_320_3.x, var_320_3.y, 0)
				local var_320_5 = arg_317_1.bgs_.ST03a

				var_320_5.transform.localPosition = var_320_4
				var_320_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_320_6 = var_320_5:GetComponent("SpriteRenderer")

				if var_320_6 and var_320_6.sprite then
					local var_320_7 = (var_320_5.transform.localPosition - var_320_3).z
					local var_320_8 = manager.ui.mainCameraCom_
					local var_320_9 = 2 * var_320_7 * Mathf.Tan(var_320_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_320_10 = var_320_9 * var_320_8.aspect
					local var_320_11 = var_320_6.sprite.bounds.size.x
					local var_320_12 = var_320_6.sprite.bounds.size.y
					local var_320_13 = var_320_10 / var_320_11
					local var_320_14 = var_320_9 / var_320_12
					local var_320_15 = var_320_14 < var_320_13 and var_320_13 or var_320_14

					var_320_5.transform.localScale = Vector3.New(var_320_15, var_320_15, 0)
				end

				for iter_320_0, iter_320_1 in pairs(arg_317_1.bgs_) do
					if iter_320_0 ~= "ST03a" then
						iter_320_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_320_16 = 0

			if var_320_16 < arg_317_1.time_ and arg_317_1.time_ <= var_320_16 + arg_320_0 then
				arg_317_1.mask_.enabled = true
				arg_317_1.mask_.raycastTarget = true

				arg_317_1:SetGaussion(false)
			end

			local var_320_17 = 2

			if var_320_16 <= arg_317_1.time_ and arg_317_1.time_ < var_320_16 + var_320_17 then
				local var_320_18 = (arg_317_1.time_ - var_320_16) / var_320_17
				local var_320_19 = Color.New(0, 0, 0)

				var_320_19.a = Mathf.Lerp(0, 1, var_320_18)
				arg_317_1.mask_.color = var_320_19
			end

			if arg_317_1.time_ >= var_320_16 + var_320_17 and arg_317_1.time_ < var_320_16 + var_320_17 + arg_320_0 then
				local var_320_20 = Color.New(0, 0, 0)

				var_320_20.a = 1
				arg_317_1.mask_.color = var_320_20
			end

			local var_320_21 = 2

			if var_320_21 < arg_317_1.time_ and arg_317_1.time_ <= var_320_21 + arg_320_0 then
				arg_317_1.mask_.enabled = true
				arg_317_1.mask_.raycastTarget = true

				arg_317_1:SetGaussion(false)
			end

			local var_320_22 = 2

			if var_320_21 <= arg_317_1.time_ and arg_317_1.time_ < var_320_21 + var_320_22 then
				local var_320_23 = (arg_317_1.time_ - var_320_21) / var_320_22
				local var_320_24 = Color.New(0, 0, 0)

				var_320_24.a = Mathf.Lerp(1, 0, var_320_23)
				arg_317_1.mask_.color = var_320_24
			end

			if arg_317_1.time_ >= var_320_21 + var_320_22 and arg_317_1.time_ < var_320_21 + var_320_22 + arg_320_0 then
				local var_320_25 = Color.New(0, 0, 0)
				local var_320_26 = 0

				arg_317_1.mask_.enabled = false
				var_320_25.a = var_320_26
				arg_317_1.mask_.color = var_320_25
			end

			local var_320_27 = arg_317_1.actors_["10034"].transform
			local var_320_28 = 1.966

			if var_320_28 < arg_317_1.time_ and arg_317_1.time_ <= var_320_28 + arg_320_0 then
				arg_317_1.var_.moveOldPos10034 = var_320_27.localPosition
				var_320_27.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("10034", 7)

				local var_320_29 = var_320_27.childCount

				for iter_320_2 = 0, var_320_29 - 1 do
					local var_320_30 = var_320_27:GetChild(iter_320_2)

					if var_320_30.name == "split_2" or not string.find(var_320_30.name, "split") then
						var_320_30.gameObject:SetActive(true)
					else
						var_320_30.gameObject:SetActive(false)
					end
				end
			end

			local var_320_31 = 0.001

			if var_320_28 <= arg_317_1.time_ and arg_317_1.time_ < var_320_28 + var_320_31 then
				local var_320_32 = (arg_317_1.time_ - var_320_28) / var_320_31
				local var_320_33 = Vector3.New(0, -2000, -185)

				var_320_27.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10034, var_320_33, var_320_32)
			end

			if arg_317_1.time_ >= var_320_28 + var_320_31 and arg_317_1.time_ < var_320_28 + var_320_31 + arg_320_0 then
				var_320_27.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_320_34 = arg_317_1.actors_["1132"].transform
			local var_320_35 = 1.966

			if var_320_35 < arg_317_1.time_ and arg_317_1.time_ <= var_320_35 + arg_320_0 then
				arg_317_1.var_.moveOldPos1132 = var_320_34.localPosition
				var_320_34.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("1132", 7)

				local var_320_36 = var_320_34.childCount

				for iter_320_3 = 0, var_320_36 - 1 do
					local var_320_37 = var_320_34:GetChild(iter_320_3)

					if var_320_37.name == "split_6" or not string.find(var_320_37.name, "split") then
						var_320_37.gameObject:SetActive(true)
					else
						var_320_37.gameObject:SetActive(false)
					end
				end
			end

			local var_320_38 = 0.001

			if var_320_35 <= arg_317_1.time_ and arg_317_1.time_ < var_320_35 + var_320_38 then
				local var_320_39 = (arg_317_1.time_ - var_320_35) / var_320_38
				local var_320_40 = Vector3.New(0, -2000, -185)

				var_320_34.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1132, var_320_40, var_320_39)
			end

			if arg_317_1.time_ >= var_320_35 + var_320_38 and arg_317_1.time_ < var_320_35 + var_320_38 + arg_320_0 then
				var_320_34.localPosition = Vector3.New(0, -2000, -185)
			end

			if arg_317_1.frameCnt_ <= 1 then
				arg_317_1.dialog_:SetActive(false)
			end

			local var_320_41 = 4
			local var_320_42 = 1

			if var_320_41 < arg_317_1.time_ and arg_317_1.time_ <= var_320_41 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0

				arg_317_1.dialog_:SetActive(true)

				local var_320_43 = LeanTween.value(arg_317_1.dialog_, 0, 1, 0.3)

				var_320_43:setOnUpdate(LuaHelper.FloatAction(function(arg_321_0)
					arg_317_1.dialogCg_.alpha = arg_321_0
				end))
				var_320_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_317_1.dialog_)
					var_320_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_317_1.duration_ = arg_317_1.duration_ + 0.3

				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_44 = arg_317_1:GetWordFromCfg(117081078)
				local var_320_45 = arg_317_1:FormatText(var_320_44.content)

				arg_317_1.text_.text = var_320_45

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_46 = 40
				local var_320_47 = utf8.len(var_320_45)
				local var_320_48 = var_320_46 <= 0 and var_320_42 or var_320_42 * (var_320_47 / var_320_46)

				if var_320_48 > 0 and var_320_42 < var_320_48 then
					arg_317_1.talkMaxDuration = var_320_48
					var_320_41 = var_320_41 + 0.3

					if var_320_48 + var_320_41 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_48 + var_320_41
					end
				end

				arg_317_1.text_.text = var_320_45
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_49 = var_320_41 + 0.3
			local var_320_50 = math.max(var_320_42, arg_317_1.talkMaxDuration)

			if var_320_49 <= arg_317_1.time_ and arg_317_1.time_ < var_320_49 + var_320_50 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_49) / var_320_50

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_49 + var_320_50 and arg_317_1.time_ < var_320_49 + var_320_50 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play117081079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 117081079
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play117081080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.35

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_2 = arg_323_1:GetWordFromCfg(117081079)
				local var_326_3 = arg_323_1:FormatText(var_326_2.content)

				arg_323_1.text_.text = var_326_3

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_4 = 14
				local var_326_5 = utf8.len(var_326_3)
				local var_326_6 = var_326_4 <= 0 and var_326_1 or var_326_1 * (var_326_5 / var_326_4)

				if var_326_6 > 0 and var_326_1 < var_326_6 then
					arg_323_1.talkMaxDuration = var_326_6

					if var_326_6 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_6 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_3
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_7 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_7 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_7

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_7 and arg_323_1.time_ < var_326_0 + var_326_7 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play117081080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 117081080
		arg_327_1.duration_ = 6.266

		local var_327_0 = {
			zh = 5.333,
			ja = 6.266
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play117081081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1132"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1132 = var_330_0.localPosition
				var_330_0.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("1132", 3)

				local var_330_2 = var_330_0.childCount

				for iter_330_0 = 0, var_330_2 - 1 do
					local var_330_3 = var_330_0:GetChild(iter_330_0)

					if var_330_3.name == "split_6" or not string.find(var_330_3.name, "split") then
						var_330_3.gameObject:SetActive(true)
					else
						var_330_3.gameObject:SetActive(false)
					end
				end
			end

			local var_330_4 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_4 then
				local var_330_5 = (arg_327_1.time_ - var_330_1) / var_330_4
				local var_330_6 = Vector3.New(0, -413, -185)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1132, var_330_6, var_330_5)
			end

			if arg_327_1.time_ >= var_330_1 + var_330_4 and arg_327_1.time_ < var_330_1 + var_330_4 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, -413, -185)
			end

			local var_330_7 = arg_327_1.actors_["1132"]
			local var_330_8 = 0

			if var_330_8 < arg_327_1.time_ and arg_327_1.time_ <= var_330_8 + arg_330_0 then
				local var_330_9 = var_330_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_330_9 then
					arg_327_1.var_.alphaOldValue1132 = var_330_9.alpha
					arg_327_1.var_.characterEffect1132 = var_330_9
				end

				arg_327_1.var_.alphaOldValue1132 = 0
			end

			local var_330_10 = 0.333333333333333

			if var_330_8 <= arg_327_1.time_ and arg_327_1.time_ < var_330_8 + var_330_10 then
				local var_330_11 = (arg_327_1.time_ - var_330_8) / var_330_10
				local var_330_12 = Mathf.Lerp(arg_327_1.var_.alphaOldValue1132, 1, var_330_11)

				if arg_327_1.var_.characterEffect1132 then
					arg_327_1.var_.characterEffect1132.alpha = var_330_12
				end
			end

			if arg_327_1.time_ >= var_330_8 + var_330_10 and arg_327_1.time_ < var_330_8 + var_330_10 + arg_330_0 and arg_327_1.var_.characterEffect1132 then
				arg_327_1.var_.characterEffect1132.alpha = 1
			end

			local var_330_13 = arg_327_1.actors_["1132"]
			local var_330_14 = 0

			if var_330_14 < arg_327_1.time_ and arg_327_1.time_ <= var_330_14 + arg_330_0 and arg_327_1.var_.actorSpriteComps1132 == nil then
				arg_327_1.var_.actorSpriteComps1132 = var_330_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_15 = 0.2

			if var_330_14 <= arg_327_1.time_ and arg_327_1.time_ < var_330_14 + var_330_15 then
				local var_330_16 = (arg_327_1.time_ - var_330_14) / var_330_15

				if arg_327_1.var_.actorSpriteComps1132 then
					for iter_330_1, iter_330_2 in pairs(arg_327_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_330_2 then
							local var_330_17 = Mathf.Lerp(iter_330_2.color.r, 1, var_330_16)

							iter_330_2.color = Color.New(var_330_17, var_330_17, var_330_17)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_14 + var_330_15 and arg_327_1.time_ < var_330_14 + var_330_15 + arg_330_0 and arg_327_1.var_.actorSpriteComps1132 then
				local var_330_18 = 1

				for iter_330_3, iter_330_4 in pairs(arg_327_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_330_4 then
						iter_330_4.color = Color.New(var_330_18, var_330_18, var_330_18)
					end
				end

				arg_327_1.var_.actorSpriteComps1132 = nil
			end

			local var_330_19 = 0
			local var_330_20 = 0.525

			if var_330_19 < arg_327_1.time_ and arg_327_1.time_ <= var_330_19 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_21 = arg_327_1:FormatText(StoryNameCfg[61].name)

				arg_327_1.leftNameTxt_.text = var_330_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_22 = arg_327_1:GetWordFromCfg(117081080)
				local var_330_23 = arg_327_1:FormatText(var_330_22.content)

				arg_327_1.text_.text = var_330_23

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_24 = 21
				local var_330_25 = utf8.len(var_330_23)
				local var_330_26 = var_330_24 <= 0 and var_330_20 or var_330_20 * (var_330_25 / var_330_24)

				if var_330_26 > 0 and var_330_20 < var_330_26 then
					arg_327_1.talkMaxDuration = var_330_26

					if var_330_26 + var_330_19 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_26 + var_330_19
					end
				end

				arg_327_1.text_.text = var_330_23
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081080", "story_v_out_117081.awb") ~= 0 then
					local var_330_27 = manager.audio:GetVoiceLength("story_v_out_117081", "117081080", "story_v_out_117081.awb") / 1000

					if var_330_27 + var_330_19 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_27 + var_330_19
					end

					if var_330_22.prefab_name ~= "" and arg_327_1.actors_[var_330_22.prefab_name] ~= nil then
						local var_330_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_22.prefab_name].transform, "story_v_out_117081", "117081080", "story_v_out_117081.awb")

						arg_327_1:RecordAudio("117081080", var_330_28)
						arg_327_1:RecordAudio("117081080", var_330_28)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_117081", "117081080", "story_v_out_117081.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_117081", "117081080", "story_v_out_117081.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_29 = math.max(var_330_20, arg_327_1.talkMaxDuration)

			if var_330_19 <= arg_327_1.time_ and arg_327_1.time_ < var_330_19 + var_330_29 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_19) / var_330_29

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_19 + var_330_29 and arg_327_1.time_ < var_330_19 + var_330_29 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play117081081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 117081081
		arg_331_1.duration_ = 3.333

		local var_331_0 = {
			zh = 3.333,
			ja = 2.733
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
			arg_331_1.auto_ = false
		end

		function arg_331_1.playNext_(arg_333_0)
			arg_331_1.onStoryFinished_()
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1132"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.actorSpriteComps1132 == nil then
				arg_331_1.var_.actorSpriteComps1132 = var_334_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.actorSpriteComps1132 then
					for iter_334_0, iter_334_1 in pairs(arg_331_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_334_1 then
							local var_334_4 = Mathf.Lerp(iter_334_1.color.r, 0.5, var_334_3)

							iter_334_1.color = Color.New(var_334_4, var_334_4, var_334_4)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.actorSpriteComps1132 then
				local var_334_5 = 0.5

				for iter_334_2, iter_334_3 in pairs(arg_331_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_334_3 then
						iter_334_3.color = Color.New(var_334_5, var_334_5, var_334_5)
					end
				end

				arg_331_1.var_.actorSpriteComps1132 = nil
			end

			local var_334_6 = 0
			local var_334_7 = 0.25

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[370].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, true)
				arg_331_1.iconController_:SetSelectedState("hero")

				arg_331_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10036_split_1")

				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(117081081)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 10
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117081", "117081081", "story_v_out_117081.awb") ~= 0 then
					local var_334_14 = manager.audio:GetVoiceLength("story_v_out_117081", "117081081", "story_v_out_117081.awb") / 1000

					if var_334_14 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_14 + var_334_6
					end

					if var_334_9.prefab_name ~= "" and arg_331_1.actors_[var_334_9.prefab_name] ~= nil then
						local var_334_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_9.prefab_name].transform, "story_v_out_117081", "117081081", "story_v_out_117081.awb")

						arg_331_1:RecordAudio("117081081", var_334_15)
						arg_331_1:RecordAudio("117081081", var_334_15)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_117081", "117081081", "story_v_out_117081.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_117081", "117081081", "story_v_out_117081.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_16 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_16 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_16

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_16 and arg_331_1.time_ < var_334_6 + var_334_16 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST24a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0105",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03a"
	},
	voices = {
		"story_v_out_117081.awb"
	}
}
