return {
	Play113071001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 113071001
		arg_1_1.duration_ = 6.566

		local var_1_0 = {
			ja = 5.233,
			ko = 5,
			zh = 6.566,
			en = 5.866
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
				arg_1_0:Play113071002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_1 = 2

			if var_4_0 <= arg_1_1.time_ and arg_1_1.time_ < var_4_0 + var_4_1 then
				local var_4_2 = (arg_1_1.time_ - var_4_0) / var_4_1
				local var_4_3 = Color.New(0, 0, 0)

				var_4_3.a = Mathf.Lerp(1, 0, var_4_2)
				arg_1_1.mask_.color = var_4_3
			end

			if arg_1_1.time_ >= var_4_0 + var_4_1 and arg_1_1.time_ < var_4_0 + var_4_1 + arg_4_0 then
				local var_4_4 = Color.New(0, 0, 0)
				local var_4_5 = 0

				arg_1_1.mask_.enabled = false
				var_4_4.a = var_4_5
				arg_1_1.mask_.color = var_4_4
			end

			local var_4_6 = 0
			local var_4_7 = 1

			if var_4_6 < arg_1_1.time_ and arg_1_1.time_ <= var_4_6 + arg_4_0 then
				local var_4_8 = "play"
				local var_4_9 = "music"

				arg_1_1:AudioAction(var_4_8, var_4_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_10 = 2
			local var_4_11 = 0.5

			if var_4_10 < arg_1_1.time_ and arg_1_1.time_ <= var_4_10 + arg_4_0 then
				local var_4_12 = "play"
				local var_4_13 = "music"

				arg_1_1:AudioAction(var_4_12, var_4_13, "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor", "bgm_activity_1_3_story_indoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_14 = 2
			local var_4_15 = 0.275

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_16 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_16:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_16:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_16:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_17 = arg_1_1:FormatText(StoryNameCfg[36].name)

				arg_1_1.leftNameTxt_.text = var_4_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_18 = arg_1_1:GetWordFromCfg(113071001)
				local var_4_19 = arg_1_1:FormatText(var_4_18.content)

				arg_1_1.text_.text = var_4_19

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_20 = 11
				local var_4_21 = utf8.len(var_4_19)
				local var_4_22 = var_4_20 <= 0 and var_4_15 or var_4_15 * (var_4_21 / var_4_20)

				if var_4_22 > 0 and var_4_15 < var_4_22 then
					arg_1_1.talkMaxDuration = var_4_22
					var_4_14 = var_4_14 + 0.3

					if var_4_22 + var_4_14 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_22 + var_4_14
					end
				end

				arg_1_1.text_.text = var_4_19
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071001", "story_v_out_113071.awb") ~= 0 then
					local var_4_23 = manager.audio:GetVoiceLength("story_v_out_113071", "113071001", "story_v_out_113071.awb") / 1000

					if var_4_23 + var_4_14 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_23 + var_4_14
					end

					if var_4_18.prefab_name ~= "" and arg_1_1.actors_[var_4_18.prefab_name] ~= nil then
						local var_4_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_18.prefab_name].transform, "story_v_out_113071", "113071001", "story_v_out_113071.awb")

						arg_1_1:RecordAudio("113071001", var_4_24)
						arg_1_1:RecordAudio("113071001", var_4_24)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_113071", "113071001", "story_v_out_113071.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_113071", "113071001", "story_v_out_113071.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_25 = var_4_14 + 0.3
			local var_4_26 = math.max(var_4_15, arg_1_1.talkMaxDuration)

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_26 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_25) / var_4_26

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_25 + var_4_26 and arg_1_1.time_ < var_4_25 + var_4_26 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play113071002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 113071002
		arg_7_1.duration_ = 5.9

		local var_7_0 = {
			ja = 5.9,
			ko = 4,
			zh = 4.266,
			en = 5.866
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
				arg_7_0:Play113071003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.45

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[36].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(113071002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071002", "story_v_out_113071.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071002", "story_v_out_113071.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_113071", "113071002", "story_v_out_113071.awb")

						arg_7_1:RecordAudio("113071002", var_10_9)
						arg_7_1:RecordAudio("113071002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_113071", "113071002", "story_v_out_113071.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_113071", "113071002", "story_v_out_113071.awb")
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
	Play113071003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 113071003
		arg_11_1.duration_ = 6.3

		local var_11_0 = {
			ja = 6.3,
			ko = 3.366,
			zh = 4.7,
			en = 3.566
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
				arg_11_0:Play113071004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.575

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[36].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(113071003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071003", "story_v_out_113071.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071003", "story_v_out_113071.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_113071", "113071003", "story_v_out_113071.awb")

						arg_11_1:RecordAudio("113071003", var_14_9)
						arg_11_1:RecordAudio("113071003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_113071", "113071003", "story_v_out_113071.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_113071", "113071003", "story_v_out_113071.awb")
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
	Play113071004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 113071004
		arg_15_1.duration_ = 10.733

		local var_15_0 = {
			ja = 10.733,
			ko = 4.766,
			zh = 5.6,
			en = 7.1
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
				arg_15_0:Play113071005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.625

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[36].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(113071004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071004", "story_v_out_113071.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071004", "story_v_out_113071.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_113071", "113071004", "story_v_out_113071.awb")

						arg_15_1:RecordAudio("113071004", var_18_9)
						arg_15_1:RecordAudio("113071004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_113071", "113071004", "story_v_out_113071.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_113071", "113071004", "story_v_out_113071.awb")
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
	Play113071005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 113071005
		arg_19_1.duration_ = 7.633

		local var_19_0 = {
			ja = 4.9,
			ko = 7.633,
			zh = 5.6,
			en = 5.2
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
				arg_19_0:Play113071006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "F01"

			if arg_19_1.bgs_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_0)
				var_22_1.name = var_22_0
				var_22_1.transform.parent = arg_19_1.stage_.transform
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_0] = var_22_1
			end

			local var_22_2 = 2

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				local var_22_3 = manager.ui.mainCamera.transform.localPosition
				local var_22_4 = Vector3.New(0, 0, 10) + Vector3.New(var_22_3.x, var_22_3.y, 0)
				local var_22_5 = arg_19_1.bgs_.F01

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
					if iter_22_0 ~= "F01" then
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

			local var_22_17 = 2

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

			local var_22_22 = 2

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

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_27 = 4
			local var_22_28 = 0.1

			if var_22_27 < arg_19_1.time_ and arg_19_1.time_ <= var_22_27 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_29 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_29:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_30 = arg_19_1:FormatText(StoryNameCfg[208].name)

				arg_19_1.leftNameTxt_.text = var_22_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_31 = arg_19_1:GetWordFromCfg(113071005)
				local var_22_32 = arg_19_1:FormatText(var_22_31.content)

				arg_19_1.text_.text = var_22_32

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_33 = 4
				local var_22_34 = utf8.len(var_22_32)
				local var_22_35 = var_22_33 <= 0 and var_22_28 or var_22_28 * (var_22_34 / var_22_33)

				if var_22_35 > 0 and var_22_28 < var_22_35 then
					arg_19_1.talkMaxDuration = var_22_35
					var_22_27 = var_22_27 + 0.3

					if var_22_35 + var_22_27 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_35 + var_22_27
					end
				end

				arg_19_1.text_.text = var_22_32
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071005", "story_v_out_113071.awb") ~= 0 then
					local var_22_36 = manager.audio:GetVoiceLength("story_v_out_113071", "113071005", "story_v_out_113071.awb") / 1000

					if var_22_36 + var_22_27 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_36 + var_22_27
					end

					if var_22_31.prefab_name ~= "" and arg_19_1.actors_[var_22_31.prefab_name] ~= nil then
						local var_22_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_31.prefab_name].transform, "story_v_out_113071", "113071005", "story_v_out_113071.awb")

						arg_19_1:RecordAudio("113071005", var_22_37)
						arg_19_1:RecordAudio("113071005", var_22_37)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_113071", "113071005", "story_v_out_113071.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_113071", "113071005", "story_v_out_113071.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_38 = var_22_27 + 0.3
			local var_22_39 = math.max(var_22_28, arg_19_1.talkMaxDuration)

			if var_22_38 <= arg_19_1.time_ and arg_19_1.time_ < var_22_38 + var_22_39 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_38) / var_22_39

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_38 + var_22_39 and arg_19_1.time_ < var_22_38 + var_22_39 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play113071006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 113071006
		arg_25_1.duration_ = 3.466

		local var_25_0 = {
			ja = 2.733,
			ko = 3.466,
			zh = 2.933,
			en = 3.3
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
				arg_25_0:Play113071007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "1038ui_story"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(Asset.Load("Char/" .. var_28_0), arg_25_1.stage_.transform)

				var_28_1.name = var_28_0
				var_28_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.actors_[var_28_0] = var_28_1

				local var_28_2 = var_28_1:GetComponentInChildren(typeof(CharacterEffect))

				var_28_2.enabled = true

				local var_28_3 = GameObjectTools.GetOrAddComponent(var_28_1, typeof(DynamicBoneHelper))

				if var_28_3 then
					var_28_3:EnableDynamicBone(false)
				end

				arg_25_1:ShowWeapon(var_28_2.transform, false)

				arg_25_1.var_[var_28_0 .. "Animator"] = var_28_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_25_1.var_[var_28_0 .. "Animator"].applyRootMotion = true
				arg_25_1.var_[var_28_0 .. "LipSync"] = var_28_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_28_4 = arg_25_1.actors_["1038ui_story"].transform
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 then
				arg_25_1.var_.moveOldPos1038ui_story = var_28_4.localPosition
			end

			local var_28_6 = 0.001

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6
				local var_28_8 = Vector3.New(-0.7, -1.11, -5.9)

				var_28_4.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1038ui_story, var_28_8, var_28_7)

				local var_28_9 = manager.ui.mainCamera.transform.position - var_28_4.position

				var_28_4.forward = Vector3.New(var_28_9.x, var_28_9.y, var_28_9.z)

				local var_28_10 = var_28_4.localEulerAngles

				var_28_10.z = 0
				var_28_10.x = 0
				var_28_4.localEulerAngles = var_28_10
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 then
				var_28_4.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_28_11 = manager.ui.mainCamera.transform.position - var_28_4.position

				var_28_4.forward = Vector3.New(var_28_11.x, var_28_11.y, var_28_11.z)

				local var_28_12 = var_28_4.localEulerAngles

				var_28_12.z = 0
				var_28_12.x = 0
				var_28_4.localEulerAngles = var_28_12
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_28_15 = arg_25_1.actors_["1038ui_story"]
			local var_28_16 = 0

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 and arg_25_1.var_.characterEffect1038ui_story == nil then
				arg_25_1.var_.characterEffect1038ui_story = var_28_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_17 = 0.2

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_17 then
				local var_28_18 = (arg_25_1.time_ - var_28_16) / var_28_17

				if arg_25_1.var_.characterEffect1038ui_story then
					arg_25_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_16 + var_28_17 and arg_25_1.time_ < var_28_16 + var_28_17 + arg_28_0 and arg_25_1.var_.characterEffect1038ui_story then
				arg_25_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_28_19 = 0
			local var_28_20 = 0.25

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_21 = arg_25_1:FormatText(StoryNameCfg[94].name)

				arg_25_1.leftNameTxt_.text = var_28_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_22 = arg_25_1:GetWordFromCfg(113071006)
				local var_28_23 = arg_25_1:FormatText(var_28_22.content)

				arg_25_1.text_.text = var_28_23

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_24 = 10
				local var_28_25 = utf8.len(var_28_23)
				local var_28_26 = var_28_24 <= 0 and var_28_20 or var_28_20 * (var_28_25 / var_28_24)

				if var_28_26 > 0 and var_28_20 < var_28_26 then
					arg_25_1.talkMaxDuration = var_28_26

					if var_28_26 + var_28_19 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_26 + var_28_19
					end
				end

				arg_25_1.text_.text = var_28_23
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071006", "story_v_out_113071.awb") ~= 0 then
					local var_28_27 = manager.audio:GetVoiceLength("story_v_out_113071", "113071006", "story_v_out_113071.awb") / 1000

					if var_28_27 + var_28_19 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_27 + var_28_19
					end

					if var_28_22.prefab_name ~= "" and arg_25_1.actors_[var_28_22.prefab_name] ~= nil then
						local var_28_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_22.prefab_name].transform, "story_v_out_113071", "113071006", "story_v_out_113071.awb")

						arg_25_1:RecordAudio("113071006", var_28_28)
						arg_25_1:RecordAudio("113071006", var_28_28)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_113071", "113071006", "story_v_out_113071.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_113071", "113071006", "story_v_out_113071.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_29 = math.max(var_28_20, arg_25_1.talkMaxDuration)

			if var_28_19 <= arg_25_1.time_ and arg_25_1.time_ < var_28_19 + var_28_29 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_19) / var_28_29

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_19 + var_28_29 and arg_25_1.time_ < var_28_19 + var_28_29 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play113071007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 113071007
		arg_29_1.duration_ = 3.766

		local var_29_0 = {
			ja = 2.166,
			ko = 3.766,
			zh = 2.666,
			en = 3.033
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
				arg_29_0:Play113071008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1038ui_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.characterEffect1038ui_story == nil then
				arg_29_1.var_.characterEffect1038ui_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.2

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect1038ui_story then
					local var_32_4 = Mathf.Lerp(0, 0.5, var_32_3)

					arg_29_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1038ui_story.fillRatio = var_32_4
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect1038ui_story then
				local var_32_5 = 0.5

				arg_29_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1038ui_story.fillRatio = var_32_5
			end

			local var_32_6 = "1041ui_story"

			if arg_29_1.actors_[var_32_6] == nil then
				local var_32_7 = Object.Instantiate(Asset.Load("Char/" .. var_32_6), arg_29_1.stage_.transform)

				var_32_7.name = var_32_6
				var_32_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_6] = var_32_7

				local var_32_8 = var_32_7:GetComponentInChildren(typeof(CharacterEffect))

				var_32_8.enabled = true

				local var_32_9 = GameObjectTools.GetOrAddComponent(var_32_7, typeof(DynamicBoneHelper))

				if var_32_9 then
					var_32_9:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_8.transform, false)

				arg_29_1.var_[var_32_6 .. "Animator"] = var_32_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_6 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_6 .. "LipSync"] = var_32_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_10 = arg_29_1.actors_["1041ui_story"].transform
			local var_32_11 = 0

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				arg_29_1.var_.moveOldPos1041ui_story = var_32_10.localPosition
			end

			local var_32_12 = 0.001

			if var_32_11 <= arg_29_1.time_ and arg_29_1.time_ < var_32_11 + var_32_12 then
				local var_32_13 = (arg_29_1.time_ - var_32_11) / var_32_12
				local var_32_14 = Vector3.New(0.7, -1.11, -5.9)

				var_32_10.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1041ui_story, var_32_14, var_32_13)

				local var_32_15 = manager.ui.mainCamera.transform.position - var_32_10.position

				var_32_10.forward = Vector3.New(var_32_15.x, var_32_15.y, var_32_15.z)

				local var_32_16 = var_32_10.localEulerAngles

				var_32_16.z = 0
				var_32_16.x = 0
				var_32_10.localEulerAngles = var_32_16
			end

			if arg_29_1.time_ >= var_32_11 + var_32_12 and arg_29_1.time_ < var_32_11 + var_32_12 + arg_32_0 then
				var_32_10.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_32_17 = manager.ui.mainCamera.transform.position - var_32_10.position

				var_32_10.forward = Vector3.New(var_32_17.x, var_32_17.y, var_32_17.z)

				local var_32_18 = var_32_10.localEulerAngles

				var_32_18.z = 0
				var_32_18.x = 0
				var_32_10.localEulerAngles = var_32_18
			end

			local var_32_19 = 0

			if var_32_19 < arg_29_1.time_ and arg_29_1.time_ <= var_32_19 + arg_32_0 then
				arg_29_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_32_20 = 0

			if var_32_20 < arg_29_1.time_ and arg_29_1.time_ <= var_32_20 + arg_32_0 then
				arg_29_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_32_21 = arg_29_1.actors_["1041ui_story"]
			local var_32_22 = 0

			if var_32_22 < arg_29_1.time_ and arg_29_1.time_ <= var_32_22 + arg_32_0 and arg_29_1.var_.characterEffect1041ui_story == nil then
				arg_29_1.var_.characterEffect1041ui_story = var_32_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_23 = 0.2

			if var_32_22 <= arg_29_1.time_ and arg_29_1.time_ < var_32_22 + var_32_23 then
				local var_32_24 = (arg_29_1.time_ - var_32_22) / var_32_23

				if arg_29_1.var_.characterEffect1041ui_story then
					arg_29_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_22 + var_32_23 and arg_29_1.time_ < var_32_22 + var_32_23 + arg_32_0 and arg_29_1.var_.characterEffect1041ui_story then
				arg_29_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_32_25 = 0
			local var_32_26 = 0.25

			if var_32_25 < arg_29_1.time_ and arg_29_1.time_ <= var_32_25 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_27 = arg_29_1:FormatText(StoryNameCfg[208].name)

				arg_29_1.leftNameTxt_.text = var_32_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_28 = arg_29_1:GetWordFromCfg(113071007)
				local var_32_29 = arg_29_1:FormatText(var_32_28.content)

				arg_29_1.text_.text = var_32_29

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_30 = 10
				local var_32_31 = utf8.len(var_32_29)
				local var_32_32 = var_32_30 <= 0 and var_32_26 or var_32_26 * (var_32_31 / var_32_30)

				if var_32_32 > 0 and var_32_26 < var_32_32 then
					arg_29_1.talkMaxDuration = var_32_32

					if var_32_32 + var_32_25 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_32 + var_32_25
					end
				end

				arg_29_1.text_.text = var_32_29
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071007", "story_v_out_113071.awb") ~= 0 then
					local var_32_33 = manager.audio:GetVoiceLength("story_v_out_113071", "113071007", "story_v_out_113071.awb") / 1000

					if var_32_33 + var_32_25 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_33 + var_32_25
					end

					if var_32_28.prefab_name ~= "" and arg_29_1.actors_[var_32_28.prefab_name] ~= nil then
						local var_32_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_28.prefab_name].transform, "story_v_out_113071", "113071007", "story_v_out_113071.awb")

						arg_29_1:RecordAudio("113071007", var_32_34)
						arg_29_1:RecordAudio("113071007", var_32_34)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_113071", "113071007", "story_v_out_113071.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_113071", "113071007", "story_v_out_113071.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_35 = math.max(var_32_26, arg_29_1.talkMaxDuration)

			if var_32_25 <= arg_29_1.time_ and arg_29_1.time_ < var_32_25 + var_32_35 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_25) / var_32_35

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_25 + var_32_35 and arg_29_1.time_ < var_32_25 + var_32_35 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play113071008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 113071008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play113071009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1041ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1041ui_story == nil then
				arg_33_1.var_.characterEffect1041ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1041ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1041ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1041ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1041ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 1.4

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_8 = arg_33_1:GetWordFromCfg(113071008)
				local var_36_9 = arg_33_1:FormatText(var_36_8.content)

				arg_33_1.text_.text = var_36_9

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_10 = 56
				local var_36_11 = utf8.len(var_36_9)
				local var_36_12 = var_36_10 <= 0 and var_36_7 or var_36_7 * (var_36_11 / var_36_10)

				if var_36_12 > 0 and var_36_7 < var_36_12 then
					arg_33_1.talkMaxDuration = var_36_12

					if var_36_12 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_12 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_9
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_13 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_13 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_13

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_13 and arg_33_1.time_ < var_36_6 + var_36_13 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play113071009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 113071009
		arg_37_1.duration_ = 3.2

		local var_37_0 = {
			ja = 3.2,
			ko = 2.8,
			zh = 1.999999999999,
			en = 2.9
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
				arg_37_0:Play113071010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_40_1 = arg_37_1.actors_["1041ui_story"]
			local var_40_2 = 0

			if var_40_2 < arg_37_1.time_ and arg_37_1.time_ <= var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1041ui_story == nil then
				arg_37_1.var_.characterEffect1041ui_story = var_40_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_3 = 0.2

			if var_40_2 <= arg_37_1.time_ and arg_37_1.time_ < var_40_2 + var_40_3 then
				local var_40_4 = (arg_37_1.time_ - var_40_2) / var_40_3

				if arg_37_1.var_.characterEffect1041ui_story then
					arg_37_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_2 + var_40_3 and arg_37_1.time_ < var_40_2 + var_40_3 + arg_40_0 and arg_37_1.var_.characterEffect1041ui_story then
				arg_37_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_40_5 = 0
			local var_40_6 = 0.225

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_7 = arg_37_1:FormatText(StoryNameCfg[208].name)

				arg_37_1.leftNameTxt_.text = var_40_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_8 = arg_37_1:GetWordFromCfg(113071009)
				local var_40_9 = arg_37_1:FormatText(var_40_8.content)

				arg_37_1.text_.text = var_40_9

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_10 = 9
				local var_40_11 = utf8.len(var_40_9)
				local var_40_12 = var_40_10 <= 0 and var_40_6 or var_40_6 * (var_40_11 / var_40_10)

				if var_40_12 > 0 and var_40_6 < var_40_12 then
					arg_37_1.talkMaxDuration = var_40_12

					if var_40_12 + var_40_5 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_5
					end
				end

				arg_37_1.text_.text = var_40_9
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071009", "story_v_out_113071.awb") ~= 0 then
					local var_40_13 = manager.audio:GetVoiceLength("story_v_out_113071", "113071009", "story_v_out_113071.awb") / 1000

					if var_40_13 + var_40_5 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_13 + var_40_5
					end

					if var_40_8.prefab_name ~= "" and arg_37_1.actors_[var_40_8.prefab_name] ~= nil then
						local var_40_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_8.prefab_name].transform, "story_v_out_113071", "113071009", "story_v_out_113071.awb")

						arg_37_1:RecordAudio("113071009", var_40_14)
						arg_37_1:RecordAudio("113071009", var_40_14)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_113071", "113071009", "story_v_out_113071.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_113071", "113071009", "story_v_out_113071.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_15 = math.max(var_40_6, arg_37_1.talkMaxDuration)

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_15 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_5) / var_40_15

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_5 + var_40_15 and arg_37_1.time_ < var_40_5 + var_40_15 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play113071010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 113071010
		arg_41_1.duration_ = 5.9

		local var_41_0 = {
			ja = 5.9,
			ko = 5.366,
			zh = 3.666,
			en = 3.166
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play113071011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1041ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1041ui_story == nil then
				arg_41_1.var_.characterEffect1041ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1041ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1041ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1041ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1041ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_44_7 = 0

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 then
				arg_41_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_44_8 = arg_41_1.actors_["1038ui_story"]
			local var_44_9 = 0

			if var_44_9 < arg_41_1.time_ and arg_41_1.time_ <= var_44_9 + arg_44_0 and arg_41_1.var_.characterEffect1038ui_story == nil then
				arg_41_1.var_.characterEffect1038ui_story = var_44_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_10 = 0.2

			if var_44_9 <= arg_41_1.time_ and arg_41_1.time_ < var_44_9 + var_44_10 then
				local var_44_11 = (arg_41_1.time_ - var_44_9) / var_44_10

				if arg_41_1.var_.characterEffect1038ui_story then
					arg_41_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_9 + var_44_10 and arg_41_1.time_ < var_44_9 + var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect1038ui_story then
				arg_41_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_44_12 = 0
			local var_44_13 = 0.35

			if var_44_12 < arg_41_1.time_ and arg_41_1.time_ <= var_44_12 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_14 = arg_41_1:FormatText(StoryNameCfg[94].name)

				arg_41_1.leftNameTxt_.text = var_44_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_15 = arg_41_1:GetWordFromCfg(113071010)
				local var_44_16 = arg_41_1:FormatText(var_44_15.content)

				arg_41_1.text_.text = var_44_16

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_17 = 14
				local var_44_18 = utf8.len(var_44_16)
				local var_44_19 = var_44_17 <= 0 and var_44_13 or var_44_13 * (var_44_18 / var_44_17)

				if var_44_19 > 0 and var_44_13 < var_44_19 then
					arg_41_1.talkMaxDuration = var_44_19

					if var_44_19 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_19 + var_44_12
					end
				end

				arg_41_1.text_.text = var_44_16
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071010", "story_v_out_113071.awb") ~= 0 then
					local var_44_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071010", "story_v_out_113071.awb") / 1000

					if var_44_20 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_20 + var_44_12
					end

					if var_44_15.prefab_name ~= "" and arg_41_1.actors_[var_44_15.prefab_name] ~= nil then
						local var_44_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_15.prefab_name].transform, "story_v_out_113071", "113071010", "story_v_out_113071.awb")

						arg_41_1:RecordAudio("113071010", var_44_21)
						arg_41_1:RecordAudio("113071010", var_44_21)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_113071", "113071010", "story_v_out_113071.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_113071", "113071010", "story_v_out_113071.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_22 = math.max(var_44_13, arg_41_1.talkMaxDuration)

			if var_44_12 <= arg_41_1.time_ and arg_41_1.time_ < var_44_12 + var_44_22 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_12) / var_44_22

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_12 + var_44_22 and arg_41_1.time_ < var_44_12 + var_44_22 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play113071011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 113071011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play113071012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1038ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1038ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, 100, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1038ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, 100, 0)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = arg_45_1.actors_["1041ui_story"].transform
			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 then
				arg_45_1.var_.moveOldPos1041ui_story = var_48_9.localPosition
			end

			local var_48_11 = 0.001

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11
				local var_48_13 = Vector3.New(0, 100, 0)

				var_48_9.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1041ui_story, var_48_13, var_48_12)

				local var_48_14 = manager.ui.mainCamera.transform.position - var_48_9.position

				var_48_9.forward = Vector3.New(var_48_14.x, var_48_14.y, var_48_14.z)

				local var_48_15 = var_48_9.localEulerAngles

				var_48_15.z = 0
				var_48_15.x = 0
				var_48_9.localEulerAngles = var_48_15
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 then
				var_48_9.localPosition = Vector3.New(0, 100, 0)

				local var_48_16 = manager.ui.mainCamera.transform.position - var_48_9.position

				var_48_9.forward = Vector3.New(var_48_16.x, var_48_16.y, var_48_16.z)

				local var_48_17 = var_48_9.localEulerAngles

				var_48_17.z = 0
				var_48_17.x = 0
				var_48_9.localEulerAngles = var_48_17
			end

			local var_48_18 = 0
			local var_48_19 = 0.75

			if var_48_18 < arg_45_1.time_ and arg_45_1.time_ <= var_48_18 + arg_48_0 then
				local var_48_20 = "play"
				local var_48_21 = "effect"

				arg_45_1:AudioAction(var_48_20, var_48_21, "se_story_10", "se_story_10_boiling_loop", "")
			end

			local var_48_22 = 0
			local var_48_23 = 0.75

			if var_48_22 < arg_45_1.time_ and arg_45_1.time_ <= var_48_22 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_24 = arg_45_1:GetWordFromCfg(113071011)
				local var_48_25 = arg_45_1:FormatText(var_48_24.content)

				arg_45_1.text_.text = var_48_25

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_26 = 30
				local var_48_27 = utf8.len(var_48_25)
				local var_48_28 = var_48_26 <= 0 and var_48_23 or var_48_23 * (var_48_27 / var_48_26)

				if var_48_28 > 0 and var_48_23 < var_48_28 then
					arg_45_1.talkMaxDuration = var_48_28

					if var_48_28 + var_48_22 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_28 + var_48_22
					end
				end

				arg_45_1.text_.text = var_48_25
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_29 = math.max(var_48_23, arg_45_1.talkMaxDuration)

			if var_48_22 <= arg_45_1.time_ and arg_45_1.time_ < var_48_22 + var_48_29 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_22) / var_48_29

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_22 + var_48_29 and arg_45_1.time_ < var_48_22 + var_48_29 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play113071012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 113071012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play113071013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.75

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_2 = arg_49_1:GetWordFromCfg(113071012)
				local var_52_3 = arg_49_1:FormatText(var_52_2.content)

				arg_49_1.text_.text = var_52_3

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_4 = 30
				local var_52_5 = utf8.len(var_52_3)
				local var_52_6 = var_52_4 <= 0 and var_52_1 or var_52_1 * (var_52_5 / var_52_4)

				if var_52_6 > 0 and var_52_1 < var_52_6 then
					arg_49_1.talkMaxDuration = var_52_6

					if var_52_6 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_6 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_3
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_7 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_7 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_7

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_7 and arg_49_1.time_ < var_52_0 + var_52_7 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play113071013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 113071013
		arg_53_1.duration_ = 7.633

		local var_53_0 = {
			ja = 7.633,
			ko = 2.533,
			zh = 3.033,
			en = 2.433
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
				arg_53_0:Play113071014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1038ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1038ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1038ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = 0

			if var_56_9 < arg_53_1.time_ and arg_53_1.time_ <= var_56_9 + arg_56_0 then
				arg_53_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 then
				arg_53_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_56_11 = arg_53_1.actors_["1038ui_story"]
			local var_56_12 = 0

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 and arg_53_1.var_.characterEffect1038ui_story == nil then
				arg_53_1.var_.characterEffect1038ui_story = var_56_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_13 = 0.2

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_13 then
				local var_56_14 = (arg_53_1.time_ - var_56_12) / var_56_13

				if arg_53_1.var_.characterEffect1038ui_story then
					arg_53_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_12 + var_56_13 and arg_53_1.time_ < var_56_12 + var_56_13 + arg_56_0 and arg_53_1.var_.characterEffect1038ui_story then
				arg_53_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_56_15 = 0
			local var_56_16 = 0.4

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_17 = arg_53_1:FormatText(StoryNameCfg[94].name)

				arg_53_1.leftNameTxt_.text = var_56_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_18 = arg_53_1:GetWordFromCfg(113071013)
				local var_56_19 = arg_53_1:FormatText(var_56_18.content)

				arg_53_1.text_.text = var_56_19

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_20 = 16
				local var_56_21 = utf8.len(var_56_19)
				local var_56_22 = var_56_20 <= 0 and var_56_16 or var_56_16 * (var_56_21 / var_56_20)

				if var_56_22 > 0 and var_56_16 < var_56_22 then
					arg_53_1.talkMaxDuration = var_56_22

					if var_56_22 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_22 + var_56_15
					end
				end

				arg_53_1.text_.text = var_56_19
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071013", "story_v_out_113071.awb") ~= 0 then
					local var_56_23 = manager.audio:GetVoiceLength("story_v_out_113071", "113071013", "story_v_out_113071.awb") / 1000

					if var_56_23 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_15
					end

					if var_56_18.prefab_name ~= "" and arg_53_1.actors_[var_56_18.prefab_name] ~= nil then
						local var_56_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_18.prefab_name].transform, "story_v_out_113071", "113071013", "story_v_out_113071.awb")

						arg_53_1:RecordAudio("113071013", var_56_24)
						arg_53_1:RecordAudio("113071013", var_56_24)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_113071", "113071013", "story_v_out_113071.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_113071", "113071013", "story_v_out_113071.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_25 = math.max(var_56_16, arg_53_1.talkMaxDuration)

			if var_56_15 <= arg_53_1.time_ and arg_53_1.time_ < var_56_15 + var_56_25 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_15) / var_56_25

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_15 + var_56_25 and arg_53_1.time_ < var_56_15 + var_56_25 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play113071014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 113071014
		arg_57_1.duration_ = 2.7

		local var_57_0 = {
			ja = 2.7,
			ko = 1.999999999999,
			zh = 2.3,
			en = 2.433
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
				arg_57_0:Play113071015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1038ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1038ui_story == nil then
				arg_57_1.var_.characterEffect1038ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1038ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1038ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1038ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1038ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 0

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_60_7 = arg_57_1.actors_["1041ui_story"]
			local var_60_8 = 0

			if var_60_8 < arg_57_1.time_ and arg_57_1.time_ <= var_60_8 + arg_60_0 and arg_57_1.var_.characterEffect1041ui_story == nil then
				arg_57_1.var_.characterEffect1041ui_story = var_60_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_9 = 0.2

			if var_60_8 <= arg_57_1.time_ and arg_57_1.time_ < var_60_8 + var_60_9 then
				local var_60_10 = (arg_57_1.time_ - var_60_8) / var_60_9

				if arg_57_1.var_.characterEffect1041ui_story then
					arg_57_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_8 + var_60_9 and arg_57_1.time_ < var_60_8 + var_60_9 + arg_60_0 and arg_57_1.var_.characterEffect1041ui_story then
				arg_57_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_60_11 = arg_57_1.actors_["1041ui_story"].transform
			local var_60_12 = 0

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 then
				arg_57_1.var_.moveOldPos1041ui_story = var_60_11.localPosition
			end

			local var_60_13 = 0.001

			if var_60_12 <= arg_57_1.time_ and arg_57_1.time_ < var_60_12 + var_60_13 then
				local var_60_14 = (arg_57_1.time_ - var_60_12) / var_60_13
				local var_60_15 = Vector3.New(0.7, -1.11, -5.9)

				var_60_11.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1041ui_story, var_60_15, var_60_14)

				local var_60_16 = manager.ui.mainCamera.transform.position - var_60_11.position

				var_60_11.forward = Vector3.New(var_60_16.x, var_60_16.y, var_60_16.z)

				local var_60_17 = var_60_11.localEulerAngles

				var_60_17.z = 0
				var_60_17.x = 0
				var_60_11.localEulerAngles = var_60_17
			end

			if arg_57_1.time_ >= var_60_12 + var_60_13 and arg_57_1.time_ < var_60_12 + var_60_13 + arg_60_0 then
				var_60_11.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_60_18 = manager.ui.mainCamera.transform.position - var_60_11.position

				var_60_11.forward = Vector3.New(var_60_18.x, var_60_18.y, var_60_18.z)

				local var_60_19 = var_60_11.localEulerAngles

				var_60_19.z = 0
				var_60_19.x = 0
				var_60_11.localEulerAngles = var_60_19
			end

			local var_60_20 = 0
			local var_60_21 = 0.125

			if var_60_20 < arg_57_1.time_ and arg_57_1.time_ <= var_60_20 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_22 = arg_57_1:FormatText(StoryNameCfg[208].name)

				arg_57_1.leftNameTxt_.text = var_60_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_23 = arg_57_1:GetWordFromCfg(113071014)
				local var_60_24 = arg_57_1:FormatText(var_60_23.content)

				arg_57_1.text_.text = var_60_24

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_25 = 5
				local var_60_26 = utf8.len(var_60_24)
				local var_60_27 = var_60_25 <= 0 and var_60_21 or var_60_21 * (var_60_26 / var_60_25)

				if var_60_27 > 0 and var_60_21 < var_60_27 then
					arg_57_1.talkMaxDuration = var_60_27

					if var_60_27 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_27 + var_60_20
					end
				end

				arg_57_1.text_.text = var_60_24
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071014", "story_v_out_113071.awb") ~= 0 then
					local var_60_28 = manager.audio:GetVoiceLength("story_v_out_113071", "113071014", "story_v_out_113071.awb") / 1000

					if var_60_28 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_28 + var_60_20
					end

					if var_60_23.prefab_name ~= "" and arg_57_1.actors_[var_60_23.prefab_name] ~= nil then
						local var_60_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_23.prefab_name].transform, "story_v_out_113071", "113071014", "story_v_out_113071.awb")

						arg_57_1:RecordAudio("113071014", var_60_29)
						arg_57_1:RecordAudio("113071014", var_60_29)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_113071", "113071014", "story_v_out_113071.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_113071", "113071014", "story_v_out_113071.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_30 = math.max(var_60_21, arg_57_1.talkMaxDuration)

			if var_60_20 <= arg_57_1.time_ and arg_57_1.time_ < var_60_20 + var_60_30 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_20) / var_60_30

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_20 + var_60_30 and arg_57_1.time_ < var_60_20 + var_60_30 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play113071015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 113071015
		arg_61_1.duration_ = 6.4

		local var_61_0 = {
			ja = 6.366,
			ko = 5.6,
			zh = 4.766,
			en = 6.4
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
				arg_61_0:Play113071016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1038ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1038ui_story == nil then
				arg_61_1.var_.characterEffect1038ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.2

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1038ui_story then
					arg_61_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1038ui_story then
				arg_61_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1041ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and arg_61_1.var_.characterEffect1041ui_story == nil then
				arg_61_1.var_.characterEffect1041ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.2

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1041ui_story then
					local var_64_8 = Mathf.Lerp(0, 0.5, var_64_7)

					arg_61_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1041ui_story.fillRatio = var_64_8
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and arg_61_1.var_.characterEffect1041ui_story then
				local var_64_9 = 0.5

				arg_61_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1041ui_story.fillRatio = var_64_9
			end

			local var_64_10 = 0

			if var_64_10 < arg_61_1.time_ and arg_61_1.time_ <= var_64_10 + arg_64_0 then
				arg_61_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_64_11 = 0

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 then
				arg_61_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_64_12 = 0
			local var_64_13 = 0.6

			if var_64_12 < arg_61_1.time_ and arg_61_1.time_ <= var_64_12 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_14 = arg_61_1:FormatText(StoryNameCfg[94].name)

				arg_61_1.leftNameTxt_.text = var_64_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_15 = arg_61_1:GetWordFromCfg(113071015)
				local var_64_16 = arg_61_1:FormatText(var_64_15.content)

				arg_61_1.text_.text = var_64_16

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_17 = 24
				local var_64_18 = utf8.len(var_64_16)
				local var_64_19 = var_64_17 <= 0 and var_64_13 or var_64_13 * (var_64_18 / var_64_17)

				if var_64_19 > 0 and var_64_13 < var_64_19 then
					arg_61_1.talkMaxDuration = var_64_19

					if var_64_19 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_19 + var_64_12
					end
				end

				arg_61_1.text_.text = var_64_16
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071015", "story_v_out_113071.awb") ~= 0 then
					local var_64_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071015", "story_v_out_113071.awb") / 1000

					if var_64_20 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_20 + var_64_12
					end

					if var_64_15.prefab_name ~= "" and arg_61_1.actors_[var_64_15.prefab_name] ~= nil then
						local var_64_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_15.prefab_name].transform, "story_v_out_113071", "113071015", "story_v_out_113071.awb")

						arg_61_1:RecordAudio("113071015", var_64_21)
						arg_61_1:RecordAudio("113071015", var_64_21)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_113071", "113071015", "story_v_out_113071.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_113071", "113071015", "story_v_out_113071.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_22 = math.max(var_64_13, arg_61_1.talkMaxDuration)

			if var_64_12 <= arg_61_1.time_ and arg_61_1.time_ < var_64_12 + var_64_22 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_12) / var_64_22

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_12 + var_64_22 and arg_61_1.time_ < var_64_12 + var_64_22 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play113071016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 113071016
		arg_65_1.duration_ = 7.633

		local var_65_0 = {
			ja = 6.9,
			ko = 6.066,
			zh = 5.2,
			en = 7.633
		}
		local var_65_1 = manager.audio:GetLocalizationFlag()

		if var_65_0[var_65_1] ~= nil then
			arg_65_1.duration_ = var_65_0[var_65_1]
		end

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play113071017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1038ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1038ui_story == nil then
				arg_65_1.var_.characterEffect1038ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1038ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1038ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1038ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1038ui_story.fillRatio = var_68_5
			end

			local var_68_6 = arg_65_1.actors_["1041ui_story"]
			local var_68_7 = 0

			if var_68_7 < arg_65_1.time_ and arg_65_1.time_ <= var_68_7 + arg_68_0 and arg_65_1.var_.characterEffect1041ui_story == nil then
				arg_65_1.var_.characterEffect1041ui_story = var_68_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_8 = 0.2

			if var_68_7 <= arg_65_1.time_ and arg_65_1.time_ < var_68_7 + var_68_8 then
				local var_68_9 = (arg_65_1.time_ - var_68_7) / var_68_8

				if arg_65_1.var_.characterEffect1041ui_story then
					arg_65_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_7 + var_68_8 and arg_65_1.time_ < var_68_7 + var_68_8 + arg_68_0 and arg_65_1.var_.characterEffect1041ui_story then
				arg_65_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_68_10 = 0

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action7_1")
			end

			local var_68_11 = 0

			if var_68_11 < arg_65_1.time_ and arg_65_1.time_ <= var_68_11 + arg_68_0 then
				arg_65_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_68_12 = 0
			local var_68_13 = 0.625

			if var_68_12 < arg_65_1.time_ and arg_65_1.time_ <= var_68_12 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_14 = arg_65_1:FormatText(StoryNameCfg[208].name)

				arg_65_1.leftNameTxt_.text = var_68_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_15 = arg_65_1:GetWordFromCfg(113071016)
				local var_68_16 = arg_65_1:FormatText(var_68_15.content)

				arg_65_1.text_.text = var_68_16

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_17 = 25
				local var_68_18 = utf8.len(var_68_16)
				local var_68_19 = var_68_17 <= 0 and var_68_13 or var_68_13 * (var_68_18 / var_68_17)

				if var_68_19 > 0 and var_68_13 < var_68_19 then
					arg_65_1.talkMaxDuration = var_68_19

					if var_68_19 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_19 + var_68_12
					end
				end

				arg_65_1.text_.text = var_68_16
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071016", "story_v_out_113071.awb") ~= 0 then
					local var_68_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071016", "story_v_out_113071.awb") / 1000

					if var_68_20 + var_68_12 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_20 + var_68_12
					end

					if var_68_15.prefab_name ~= "" and arg_65_1.actors_[var_68_15.prefab_name] ~= nil then
						local var_68_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_15.prefab_name].transform, "story_v_out_113071", "113071016", "story_v_out_113071.awb")

						arg_65_1:RecordAudio("113071016", var_68_21)
						arg_65_1:RecordAudio("113071016", var_68_21)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_113071", "113071016", "story_v_out_113071.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_113071", "113071016", "story_v_out_113071.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_22 = math.max(var_68_13, arg_65_1.talkMaxDuration)

			if var_68_12 <= arg_65_1.time_ and arg_65_1.time_ < var_68_12 + var_68_22 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_12) / var_68_22

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_12 + var_68_22 and arg_65_1.time_ < var_68_12 + var_68_22 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play113071017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 113071017
		arg_69_1.duration_ = 6.166

		local var_69_0 = {
			ja = 6.166,
			ko = 4.566,
			zh = 3.666,
			en = 2.866
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
				arg_69_0:Play113071018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1041ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1041ui_story == nil then
				arg_69_1.var_.characterEffect1041ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.2

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1041ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1041ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1041ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1041ui_story.fillRatio = var_72_5
			end

			local var_72_6 = arg_69_1.actors_["1038ui_story"]
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 and arg_69_1.var_.characterEffect1038ui_story == nil then
				arg_69_1.var_.characterEffect1038ui_story = var_72_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_8 = 0.2

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8

				if arg_69_1.var_.characterEffect1038ui_story then
					arg_69_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 and arg_69_1.var_.characterEffect1038ui_story then
				arg_69_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 then
				arg_69_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_11 = 0
			local var_72_12 = 0.45

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_13 = arg_69_1:FormatText(StoryNameCfg[94].name)

				arg_69_1.leftNameTxt_.text = var_72_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_14 = arg_69_1:GetWordFromCfg(113071017)
				local var_72_15 = arg_69_1:FormatText(var_72_14.content)

				arg_69_1.text_.text = var_72_15

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_16 = 18
				local var_72_17 = utf8.len(var_72_15)
				local var_72_18 = var_72_16 <= 0 and var_72_12 or var_72_12 * (var_72_17 / var_72_16)

				if var_72_18 > 0 and var_72_12 < var_72_18 then
					arg_69_1.talkMaxDuration = var_72_18

					if var_72_18 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_18 + var_72_11
					end
				end

				arg_69_1.text_.text = var_72_15
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071017", "story_v_out_113071.awb") ~= 0 then
					local var_72_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071017", "story_v_out_113071.awb") / 1000

					if var_72_19 + var_72_11 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_11
					end

					if var_72_14.prefab_name ~= "" and arg_69_1.actors_[var_72_14.prefab_name] ~= nil then
						local var_72_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_14.prefab_name].transform, "story_v_out_113071", "113071017", "story_v_out_113071.awb")

						arg_69_1:RecordAudio("113071017", var_72_20)
						arg_69_1:RecordAudio("113071017", var_72_20)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_113071", "113071017", "story_v_out_113071.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_113071", "113071017", "story_v_out_113071.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_21 = math.max(var_72_12, arg_69_1.talkMaxDuration)

			if var_72_11 <= arg_69_1.time_ and arg_69_1.time_ < var_72_11 + var_72_21 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_11) / var_72_21

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_11 + var_72_21 and arg_69_1.time_ < var_72_11 + var_72_21 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play113071018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 113071018
		arg_73_1.duration_ = 7.7

		local var_73_0 = {
			ja = 6.866,
			ko = 5.5,
			zh = 5.166,
			en = 7.7
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
				arg_73_0:Play113071019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1041ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1041ui_story == nil then
				arg_73_1.var_.characterEffect1041ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1041ui_story then
					arg_73_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1041ui_story then
				arg_73_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1038ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect1038ui_story == nil then
				arg_73_1.var_.characterEffect1038ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.2

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1038ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1038ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect1038ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1038ui_story.fillRatio = var_76_9
			end

			local var_76_10 = 0

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action7_2")
			end

			local var_76_11 = 0

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				arg_73_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_76_12 = 0
			local var_76_13 = 0.7

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_14 = arg_73_1:FormatText(StoryNameCfg[208].name)

				arg_73_1.leftNameTxt_.text = var_76_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(113071018)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 28
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_13 or var_76_13 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_13 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071018", "story_v_out_113071.awb") ~= 0 then
					local var_76_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071018", "story_v_out_113071.awb") / 1000

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end

					if var_76_15.prefab_name ~= "" and arg_73_1.actors_[var_76_15.prefab_name] ~= nil then
						local var_76_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_15.prefab_name].transform, "story_v_out_113071", "113071018", "story_v_out_113071.awb")

						arg_73_1:RecordAudio("113071018", var_76_21)
						arg_73_1:RecordAudio("113071018", var_76_21)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_113071", "113071018", "story_v_out_113071.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_113071", "113071018", "story_v_out_113071.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_12 <= arg_73_1.time_ and arg_73_1.time_ < var_76_12 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_12) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_12 + var_76_22 and arg_73_1.time_ < var_76_12 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play113071019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 113071019
		arg_77_1.duration_ = 8.633

		local var_77_0 = {
			ja = 8.633,
			ko = 5.6,
			zh = 5.3,
			en = 5.7
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
				arg_77_0:Play113071020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1041ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1041ui_story == nil then
				arg_77_1.var_.characterEffect1041ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1041ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1041ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1041ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1041ui_story.fillRatio = var_80_5
			end

			local var_80_6 = arg_77_1.actors_["1038ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1038ui_story == nil then
				arg_77_1.var_.characterEffect1038ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.2

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1038ui_story then
					arg_77_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1038ui_story then
				arg_77_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_80_11 = 0
			local var_80_12 = 0.575

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_13 = arg_77_1:FormatText(StoryNameCfg[94].name)

				arg_77_1.leftNameTxt_.text = var_80_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_14 = arg_77_1:GetWordFromCfg(113071019)
				local var_80_15 = arg_77_1:FormatText(var_80_14.content)

				arg_77_1.text_.text = var_80_15

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_16 = 23
				local var_80_17 = utf8.len(var_80_15)
				local var_80_18 = var_80_16 <= 0 and var_80_12 or var_80_12 * (var_80_17 / var_80_16)

				if var_80_18 > 0 and var_80_12 < var_80_18 then
					arg_77_1.talkMaxDuration = var_80_18

					if var_80_18 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_11
					end
				end

				arg_77_1.text_.text = var_80_15
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071019", "story_v_out_113071.awb") ~= 0 then
					local var_80_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071019", "story_v_out_113071.awb") / 1000

					if var_80_19 + var_80_11 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_11
					end

					if var_80_14.prefab_name ~= "" and arg_77_1.actors_[var_80_14.prefab_name] ~= nil then
						local var_80_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_14.prefab_name].transform, "story_v_out_113071", "113071019", "story_v_out_113071.awb")

						arg_77_1:RecordAudio("113071019", var_80_20)
						arg_77_1:RecordAudio("113071019", var_80_20)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_113071", "113071019", "story_v_out_113071.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_113071", "113071019", "story_v_out_113071.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_21 = math.max(var_80_12, arg_77_1.talkMaxDuration)

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_21 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_11) / var_80_21

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_11 + var_80_21 and arg_77_1.time_ < var_80_11 + var_80_21 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play113071020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 113071020
		arg_81_1.duration_ = 7.566

		local var_81_0 = {
			ja = 7.566,
			ko = 4.7,
			zh = 5.3,
			en = 6.933
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
				arg_81_0:Play113071021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1038ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1038ui_story == nil then
				arg_81_1.var_.characterEffect1038ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1038ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1038ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1038ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1038ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action6_1")
			end

			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 then
				arg_81_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_84_8 = arg_81_1.actors_["1041ui_story"]
			local var_84_9 = 0

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 and arg_81_1.var_.characterEffect1041ui_story == nil then
				arg_81_1.var_.characterEffect1041ui_story = var_84_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_10 = 0.2

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_10 then
				local var_84_11 = (arg_81_1.time_ - var_84_9) / var_84_10

				if arg_81_1.var_.characterEffect1041ui_story then
					arg_81_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_9 + var_84_10 and arg_81_1.time_ < var_84_9 + var_84_10 + arg_84_0 and arg_81_1.var_.characterEffect1041ui_story then
				arg_81_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_84_12 = 0
			local var_84_13 = 0.65

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_14 = arg_81_1:FormatText(StoryNameCfg[208].name)

				arg_81_1.leftNameTxt_.text = var_84_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_15 = arg_81_1:GetWordFromCfg(113071020)
				local var_84_16 = arg_81_1:FormatText(var_84_15.content)

				arg_81_1.text_.text = var_84_16

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_17 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071020", "story_v_out_113071.awb") ~= 0 then
					local var_84_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071020", "story_v_out_113071.awb") / 1000

					if var_84_20 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_12
					end

					if var_84_15.prefab_name ~= "" and arg_81_1.actors_[var_84_15.prefab_name] ~= nil then
						local var_84_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_15.prefab_name].transform, "story_v_out_113071", "113071020", "story_v_out_113071.awb")

						arg_81_1:RecordAudio("113071020", var_84_21)
						arg_81_1:RecordAudio("113071020", var_84_21)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_113071", "113071020", "story_v_out_113071.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_113071", "113071020", "story_v_out_113071.awb")
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
	Play113071021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 113071021
		arg_85_1.duration_ = 9.366

		local var_85_0 = {
			ja = 9.366,
			ko = 8.366,
			zh = 7.7,
			en = 8.033
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
				arg_85_0:Play113071022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1041ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1041ui_story == nil then
				arg_85_1.var_.characterEffect1041ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1041ui_story then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1041ui_story.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1041ui_story then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1041ui_story.fillRatio = var_88_5
			end

			local var_88_6 = arg_85_1.actors_["1038ui_story"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.characterEffect1038ui_story == nil then
				arg_85_1.var_.characterEffect1038ui_story = var_88_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_8 = 0.2

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.characterEffect1038ui_story then
					arg_85_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.characterEffect1038ui_story then
				arg_85_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_88_11 = 0
			local var_88_12 = 0.775

			if var_88_11 < arg_85_1.time_ and arg_85_1.time_ <= var_88_11 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_13 = arg_85_1:FormatText(StoryNameCfg[94].name)

				arg_85_1.leftNameTxt_.text = var_88_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_14 = arg_85_1:GetWordFromCfg(113071021)
				local var_88_15 = arg_85_1:FormatText(var_88_14.content)

				arg_85_1.text_.text = var_88_15

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_16 = 31
				local var_88_17 = utf8.len(var_88_15)
				local var_88_18 = var_88_16 <= 0 and var_88_12 or var_88_12 * (var_88_17 / var_88_16)

				if var_88_18 > 0 and var_88_12 < var_88_18 then
					arg_85_1.talkMaxDuration = var_88_18

					if var_88_18 + var_88_11 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_18 + var_88_11
					end
				end

				arg_85_1.text_.text = var_88_15
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071021", "story_v_out_113071.awb") ~= 0 then
					local var_88_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071021", "story_v_out_113071.awb") / 1000

					if var_88_19 + var_88_11 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_11
					end

					if var_88_14.prefab_name ~= "" and arg_85_1.actors_[var_88_14.prefab_name] ~= nil then
						local var_88_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_14.prefab_name].transform, "story_v_out_113071", "113071021", "story_v_out_113071.awb")

						arg_85_1:RecordAudio("113071021", var_88_20)
						arg_85_1:RecordAudio("113071021", var_88_20)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_113071", "113071021", "story_v_out_113071.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_113071", "113071021", "story_v_out_113071.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_21 = math.max(var_88_12, arg_85_1.talkMaxDuration)

			if var_88_11 <= arg_85_1.time_ and arg_85_1.time_ < var_88_11 + var_88_21 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_11) / var_88_21

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_11 + var_88_21 and arg_85_1.time_ < var_88_11 + var_88_21 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play113071022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 113071022
		arg_89_1.duration_ = 1.999999999999

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play113071023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1038ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1038ui_story == nil then
				arg_89_1.var_.characterEffect1038ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1038ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1038ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1038ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1038ui_story.fillRatio = var_92_5
			end

			local var_92_6 = arg_89_1.actors_["1041ui_story"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.characterEffect1041ui_story == nil then
				arg_89_1.var_.characterEffect1041ui_story = var_92_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_8 = 0.2

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.characterEffect1041ui_story then
					arg_89_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.characterEffect1041ui_story then
				arg_89_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action6_2")
			end

			local var_92_12 = 0
			local var_92_13 = 0.05

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[208].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(113071022)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071022", "story_v_out_113071.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071022", "story_v_out_113071.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_113071", "113071022", "story_v_out_113071.awb")

						arg_89_1:RecordAudio("113071022", var_92_21)
						arg_89_1:RecordAudio("113071022", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_113071", "113071022", "story_v_out_113071.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_113071", "113071022", "story_v_out_113071.awb")
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
	Play113071023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 113071023
		arg_93_1.duration_ = 7.8

		local var_93_0 = {
			ja = 7.8,
			ko = 6.633,
			zh = 6.066,
			en = 5.966
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play113071024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1041ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1041ui_story == nil then
				arg_93_1.var_.characterEffect1041ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1041ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1041ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1041ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1041ui_story.fillRatio = var_96_5
			end

			local var_96_6 = arg_93_1.actors_["1038ui_story"]
			local var_96_7 = 0

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 and arg_93_1.var_.characterEffect1038ui_story == nil then
				arg_93_1.var_.characterEffect1038ui_story = var_96_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_8 = 0.2

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_8 then
				local var_96_9 = (arg_93_1.time_ - var_96_7) / var_96_8

				if arg_93_1.var_.characterEffect1038ui_story then
					arg_93_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_7 + var_96_8 and arg_93_1.time_ < var_96_7 + var_96_8 + arg_96_0 and arg_93_1.var_.characterEffect1038ui_story then
				arg_93_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_96_11 = 0
			local var_96_12 = 0.625

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_13 = arg_93_1:FormatText(StoryNameCfg[94].name)

				arg_93_1.leftNameTxt_.text = var_96_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_14 = arg_93_1:GetWordFromCfg(113071023)
				local var_96_15 = arg_93_1:FormatText(var_96_14.content)

				arg_93_1.text_.text = var_96_15

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_16 = 25
				local var_96_17 = utf8.len(var_96_15)
				local var_96_18 = var_96_16 <= 0 and var_96_12 or var_96_12 * (var_96_17 / var_96_16)

				if var_96_18 > 0 and var_96_12 < var_96_18 then
					arg_93_1.talkMaxDuration = var_96_18

					if var_96_18 + var_96_11 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_18 + var_96_11
					end
				end

				arg_93_1.text_.text = var_96_15
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071023", "story_v_out_113071.awb") ~= 0 then
					local var_96_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071023", "story_v_out_113071.awb") / 1000

					if var_96_19 + var_96_11 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_11
					end

					if var_96_14.prefab_name ~= "" and arg_93_1.actors_[var_96_14.prefab_name] ~= nil then
						local var_96_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_14.prefab_name].transform, "story_v_out_113071", "113071023", "story_v_out_113071.awb")

						arg_93_1:RecordAudio("113071023", var_96_20)
						arg_93_1:RecordAudio("113071023", var_96_20)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_113071", "113071023", "story_v_out_113071.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_113071", "113071023", "story_v_out_113071.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_21 = math.max(var_96_12, arg_93_1.talkMaxDuration)

			if var_96_11 <= arg_93_1.time_ and arg_93_1.time_ < var_96_11 + var_96_21 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_11) / var_96_21

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_11 + var_96_21 and arg_93_1.time_ < var_96_11 + var_96_21 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play113071024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 113071024
		arg_97_1.duration_ = 8.2

		local var_97_0 = {
			ja = 8.2,
			ko = 4,
			zh = 4.8,
			en = 5.566
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
				arg_97_0:Play113071025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1038ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1038ui_story == nil then
				arg_97_1.var_.characterEffect1038ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.2

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1038ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1038ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1038ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1038ui_story.fillRatio = var_100_5
			end

			local var_100_6 = arg_97_1.actors_["1041ui_story"]
			local var_100_7 = 0

			if var_100_7 < arg_97_1.time_ and arg_97_1.time_ <= var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1041ui_story == nil then
				arg_97_1.var_.characterEffect1041ui_story = var_100_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_8 = 0.2

			if var_100_7 <= arg_97_1.time_ and arg_97_1.time_ < var_100_7 + var_100_8 then
				local var_100_9 = (arg_97_1.time_ - var_100_7) / var_100_8

				if arg_97_1.var_.characterEffect1041ui_story then
					arg_97_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_7 + var_100_8 and arg_97_1.time_ < var_100_7 + var_100_8 + arg_100_0 and arg_97_1.var_.characterEffect1041ui_story then
				arg_97_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 then
				arg_97_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_100_11 = 0
			local var_100_12 = 0.45

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_13 = arg_97_1:FormatText(StoryNameCfg[208].name)

				arg_97_1.leftNameTxt_.text = var_100_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(113071024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 18
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_12 or var_100_12 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_12 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_11
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071024", "story_v_out_113071.awb") ~= 0 then
					local var_100_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071024", "story_v_out_113071.awb") / 1000

					if var_100_19 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_11
					end

					if var_100_14.prefab_name ~= "" and arg_97_1.actors_[var_100_14.prefab_name] ~= nil then
						local var_100_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_14.prefab_name].transform, "story_v_out_113071", "113071024", "story_v_out_113071.awb")

						arg_97_1:RecordAudio("113071024", var_100_20)
						arg_97_1:RecordAudio("113071024", var_100_20)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_113071", "113071024", "story_v_out_113071.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_113071", "113071024", "story_v_out_113071.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_21 = math.max(var_100_12, arg_97_1.talkMaxDuration)

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_21 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_11) / var_100_21

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_11 + var_100_21 and arg_97_1.time_ < var_100_11 + var_100_21 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play113071025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 113071025
		arg_101_1.duration_ = 3.566

		local var_101_0 = {
			ja = 2.933,
			ko = 2.366,
			zh = 2.133,
			en = 3.566
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
				arg_101_0:Play113071026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_104_1 = arg_101_1.actors_["1041ui_story"]
			local var_104_2 = 0

			if var_104_2 < arg_101_1.time_ and arg_101_1.time_ <= var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1041ui_story == nil then
				arg_101_1.var_.characterEffect1041ui_story = var_104_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_3 = 0.2

			if var_104_2 <= arg_101_1.time_ and arg_101_1.time_ < var_104_2 + var_104_3 then
				local var_104_4 = (arg_101_1.time_ - var_104_2) / var_104_3

				if arg_101_1.var_.characterEffect1041ui_story then
					local var_104_5 = Mathf.Lerp(0, 0.5, var_104_4)

					arg_101_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1041ui_story.fillRatio = var_104_5
				end
			end

			if arg_101_1.time_ >= var_104_2 + var_104_3 and arg_101_1.time_ < var_104_2 + var_104_3 + arg_104_0 and arg_101_1.var_.characterEffect1041ui_story then
				local var_104_6 = 0.5

				arg_101_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1041ui_story.fillRatio = var_104_6
			end

			local var_104_7 = arg_101_1.actors_["1038ui_story"]
			local var_104_8 = 0

			if var_104_8 < arg_101_1.time_ and arg_101_1.time_ <= var_104_8 + arg_104_0 and arg_101_1.var_.characterEffect1038ui_story == nil then
				arg_101_1.var_.characterEffect1038ui_story = var_104_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_9 = 0.2

			if var_104_8 <= arg_101_1.time_ and arg_101_1.time_ < var_104_8 + var_104_9 then
				local var_104_10 = (arg_101_1.time_ - var_104_8) / var_104_9

				if arg_101_1.var_.characterEffect1038ui_story then
					arg_101_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_8 + var_104_9 and arg_101_1.time_ < var_104_8 + var_104_9 + arg_104_0 and arg_101_1.var_.characterEffect1038ui_story then
				arg_101_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_104_11 = 0
			local var_104_12 = 0.225

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_13 = arg_101_1:FormatText(StoryNameCfg[94].name)

				arg_101_1.leftNameTxt_.text = var_104_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_14 = arg_101_1:GetWordFromCfg(113071025)
				local var_104_15 = arg_101_1:FormatText(var_104_14.content)

				arg_101_1.text_.text = var_104_15

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_16 = 8
				local var_104_17 = utf8.len(var_104_15)
				local var_104_18 = var_104_16 <= 0 and var_104_12 or var_104_12 * (var_104_17 / var_104_16)

				if var_104_18 > 0 and var_104_12 < var_104_18 then
					arg_101_1.talkMaxDuration = var_104_18

					if var_104_18 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_18 + var_104_11
					end
				end

				arg_101_1.text_.text = var_104_15
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071025", "story_v_out_113071.awb") ~= 0 then
					local var_104_19 = manager.audio:GetVoiceLength("story_v_out_113071", "113071025", "story_v_out_113071.awb") / 1000

					if var_104_19 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_11
					end

					if var_104_14.prefab_name ~= "" and arg_101_1.actors_[var_104_14.prefab_name] ~= nil then
						local var_104_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_14.prefab_name].transform, "story_v_out_113071", "113071025", "story_v_out_113071.awb")

						arg_101_1:RecordAudio("113071025", var_104_20)
						arg_101_1:RecordAudio("113071025", var_104_20)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_113071", "113071025", "story_v_out_113071.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_113071", "113071025", "story_v_out_113071.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_21 = math.max(var_104_12, arg_101_1.talkMaxDuration)

			if var_104_11 <= arg_101_1.time_ and arg_101_1.time_ < var_104_11 + var_104_21 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_11) / var_104_21

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_11 + var_104_21 and arg_101_1.time_ < var_104_11 + var_104_21 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play113071026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 113071026
		arg_105_1.duration_ = 9

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play113071027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_1 = 2

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_1 then
				local var_108_2 = (arg_105_1.time_ - var_108_0) / var_108_1
				local var_108_3 = Color.New(0, 0, 0)

				var_108_3.a = Mathf.Lerp(0, 1, var_108_2)
				arg_105_1.mask_.color = var_108_3
			end

			if arg_105_1.time_ >= var_108_0 + var_108_1 and arg_105_1.time_ < var_108_0 + var_108_1 + arg_108_0 then
				local var_108_4 = Color.New(0, 0, 0)

				var_108_4.a = 1
				arg_105_1.mask_.color = var_108_4
			end

			local var_108_5 = 2

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_6 = 2

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6
				local var_108_8 = Color.New(0, 0, 0)

				var_108_8.a = Mathf.Lerp(1, 0, var_108_7)
				arg_105_1.mask_.color = var_108_8
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 then
				local var_108_9 = Color.New(0, 0, 0)
				local var_108_10 = 0

				arg_105_1.mask_.enabled = false
				var_108_9.a = var_108_10
				arg_105_1.mask_.color = var_108_9
			end

			local var_108_11 = "OM0110"

			if arg_105_1.bgs_[var_108_11] == nil then
				local var_108_12 = Object.Instantiate(arg_105_1.paintGo_)

				var_108_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_108_11)
				var_108_12.name = var_108_11
				var_108_12.transform.parent = arg_105_1.stage_.transform
				var_108_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.bgs_[var_108_11] = var_108_12
			end

			local var_108_13 = 2

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				local var_108_14 = manager.ui.mainCamera.transform.localPosition
				local var_108_15 = Vector3.New(0, 0, 10) + Vector3.New(var_108_14.x, var_108_14.y, 0)
				local var_108_16 = arg_105_1.bgs_.OM0110

				var_108_16.transform.localPosition = var_108_15
				var_108_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_108_17 = var_108_16:GetComponent("SpriteRenderer")

				if var_108_17 and var_108_17.sprite then
					local var_108_18 = (var_108_16.transform.localPosition - var_108_14).z
					local var_108_19 = manager.ui.mainCameraCom_
					local var_108_20 = 2 * var_108_18 * Mathf.Tan(var_108_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_108_21 = var_108_20 * var_108_19.aspect
					local var_108_22 = var_108_17.sprite.bounds.size.x
					local var_108_23 = var_108_17.sprite.bounds.size.y
					local var_108_24 = var_108_21 / var_108_22
					local var_108_25 = var_108_20 / var_108_23
					local var_108_26 = var_108_25 < var_108_24 and var_108_24 or var_108_25

					var_108_16.transform.localScale = Vector3.New(var_108_26, var_108_26, 0)
				end

				for iter_108_0, iter_108_1 in pairs(arg_105_1.bgs_) do
					if iter_108_0 ~= "OM0110" then
						iter_108_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_108_27 = arg_105_1.actors_["1038ui_story"].transform
			local var_108_28 = 1.966

			if var_108_28 < arg_105_1.time_ and arg_105_1.time_ <= var_108_28 + arg_108_0 then
				arg_105_1.var_.moveOldPos1038ui_story = var_108_27.localPosition
			end

			local var_108_29 = 0.001

			if var_108_28 <= arg_105_1.time_ and arg_105_1.time_ < var_108_28 + var_108_29 then
				local var_108_30 = (arg_105_1.time_ - var_108_28) / var_108_29
				local var_108_31 = Vector3.New(0, 100, 0)

				var_108_27.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1038ui_story, var_108_31, var_108_30)

				local var_108_32 = manager.ui.mainCamera.transform.position - var_108_27.position

				var_108_27.forward = Vector3.New(var_108_32.x, var_108_32.y, var_108_32.z)

				local var_108_33 = var_108_27.localEulerAngles

				var_108_33.z = 0
				var_108_33.x = 0
				var_108_27.localEulerAngles = var_108_33
			end

			if arg_105_1.time_ >= var_108_28 + var_108_29 and arg_105_1.time_ < var_108_28 + var_108_29 + arg_108_0 then
				var_108_27.localPosition = Vector3.New(0, 100, 0)

				local var_108_34 = manager.ui.mainCamera.transform.position - var_108_27.position

				var_108_27.forward = Vector3.New(var_108_34.x, var_108_34.y, var_108_34.z)

				local var_108_35 = var_108_27.localEulerAngles

				var_108_35.z = 0
				var_108_35.x = 0
				var_108_27.localEulerAngles = var_108_35
			end

			local var_108_36 = arg_105_1.actors_["1041ui_story"].transform
			local var_108_37 = 1.966

			if var_108_37 < arg_105_1.time_ and arg_105_1.time_ <= var_108_37 + arg_108_0 then
				arg_105_1.var_.moveOldPos1041ui_story = var_108_36.localPosition
			end

			local var_108_38 = 0.001

			if var_108_37 <= arg_105_1.time_ and arg_105_1.time_ < var_108_37 + var_108_38 then
				local var_108_39 = (arg_105_1.time_ - var_108_37) / var_108_38
				local var_108_40 = Vector3.New(0, 100, 0)

				var_108_36.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1041ui_story, var_108_40, var_108_39)

				local var_108_41 = manager.ui.mainCamera.transform.position - var_108_36.position

				var_108_36.forward = Vector3.New(var_108_41.x, var_108_41.y, var_108_41.z)

				local var_108_42 = var_108_36.localEulerAngles

				var_108_42.z = 0
				var_108_42.x = 0
				var_108_36.localEulerAngles = var_108_42
			end

			if arg_105_1.time_ >= var_108_37 + var_108_38 and arg_105_1.time_ < var_108_37 + var_108_38 + arg_108_0 then
				var_108_36.localPosition = Vector3.New(0, 100, 0)

				local var_108_43 = manager.ui.mainCamera.transform.position - var_108_36.position

				var_108_36.forward = Vector3.New(var_108_43.x, var_108_43.y, var_108_43.z)

				local var_108_44 = var_108_36.localEulerAngles

				var_108_44.z = 0
				var_108_44.x = 0
				var_108_36.localEulerAngles = var_108_44
			end

			if arg_105_1.frameCnt_ <= 1 then
				arg_105_1.dialog_:SetActive(false)
			end

			local var_108_45 = 4
			local var_108_46 = 0.925

			if var_108_45 < arg_105_1.time_ and arg_105_1.time_ <= var_108_45 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				arg_105_1.dialog_:SetActive(true)

				local var_108_47 = LeanTween.value(arg_105_1.dialog_, 0, 1, 0.3)

				var_108_47:setOnUpdate(LuaHelper.FloatAction(function(arg_109_0)
					arg_105_1.dialogCg_.alpha = arg_109_0
				end))
				var_108_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_105_1.dialog_)
					var_108_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_105_1.duration_ = arg_105_1.duration_ + 0.3

				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_48 = arg_105_1:GetWordFromCfg(113071026)
				local var_108_49 = arg_105_1:FormatText(var_108_48.content)

				arg_105_1.text_.text = var_108_49

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_50 = 37
				local var_108_51 = utf8.len(var_108_49)
				local var_108_52 = var_108_50 <= 0 and var_108_46 or var_108_46 * (var_108_51 / var_108_50)

				if var_108_52 > 0 and var_108_46 < var_108_52 then
					arg_105_1.talkMaxDuration = var_108_52
					var_108_45 = var_108_45 + 0.3

					if var_108_52 + var_108_45 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_52 + var_108_45
					end
				end

				arg_105_1.text_.text = var_108_49
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_53 = var_108_45 + 0.3
			local var_108_54 = math.max(var_108_46, arg_105_1.talkMaxDuration)

			if var_108_53 <= arg_105_1.time_ and arg_105_1.time_ < var_108_53 + var_108_54 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_53) / var_108_54

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_53 + var_108_54 and arg_105_1.time_ < var_108_53 + var_108_54 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play113071027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 113071027
		arg_111_1.duration_ = 6.5

		local var_111_0 = {
			ja = 6.4,
			ko = 4.3,
			zh = 4.633,
			en = 6.5
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
				arg_111_0:Play113071028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.5

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[94].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(113071027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 20
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071027", "story_v_out_113071.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071027", "story_v_out_113071.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_113071", "113071027", "story_v_out_113071.awb")

						arg_111_1:RecordAudio("113071027", var_114_9)
						arg_111_1:RecordAudio("113071027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_113071", "113071027", "story_v_out_113071.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_113071", "113071027", "story_v_out_113071.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play113071028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 113071028
		arg_115_1.duration_ = 7.533

		local var_115_0 = {
			ja = 7.533,
			ko = 7.233,
			zh = 6.8,
			en = 5.933
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
				arg_115_0:Play113071029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.85

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[94].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(113071028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 33
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071028", "story_v_out_113071.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071028", "story_v_out_113071.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_113071", "113071028", "story_v_out_113071.awb")

						arg_115_1:RecordAudio("113071028", var_118_9)
						arg_115_1:RecordAudio("113071028", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_113071", "113071028", "story_v_out_113071.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_113071", "113071028", "story_v_out_113071.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_10 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_10 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_10

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_10 and arg_115_1.time_ < var_118_0 + var_118_10 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play113071029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 113071029
		arg_119_1.duration_ = 2.933

		local var_119_0 = {
			ja = 2.933,
			ko = 2.2,
			zh = 2.7,
			en = 1.6
		}
		local var_119_1 = manager.audio:GetLocalizationFlag()

		if var_119_0[var_119_1] ~= nil then
			arg_119_1.duration_ = var_119_0[var_119_1]
		end

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play113071030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.225

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[94].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(113071029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 9
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071029", "story_v_out_113071.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071029", "story_v_out_113071.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_113071", "113071029", "story_v_out_113071.awb")

						arg_119_1:RecordAudio("113071029", var_122_9)
						arg_119_1:RecordAudio("113071029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_113071", "113071029", "story_v_out_113071.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_113071", "113071029", "story_v_out_113071.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play113071030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 113071030
		arg_123_1.duration_ = 3.4

		local var_123_0 = {
			ja = 3.4,
			ko = 2.4,
			zh = 3.033,
			en = 3.4
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
				arg_123_0:Play113071031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.325

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[208].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(113071030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 13
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071030", "story_v_out_113071.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071030", "story_v_out_113071.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_113071", "113071030", "story_v_out_113071.awb")

						arg_123_1:RecordAudio("113071030", var_126_9)
						arg_123_1:RecordAudio("113071030", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_113071", "113071030", "story_v_out_113071.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_113071", "113071030", "story_v_out_113071.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play113071031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 113071031
		arg_127_1.duration_ = 3.566

		local var_127_0 = {
			ja = 3.566,
			ko = 3.466,
			zh = 2.766,
			en = 2.733
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
				arg_127_0:Play113071032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.275

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[94].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(113071031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 11
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071031", "story_v_out_113071.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071031", "story_v_out_113071.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_113071", "113071031", "story_v_out_113071.awb")

						arg_127_1:RecordAudio("113071031", var_130_9)
						arg_127_1:RecordAudio("113071031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_113071", "113071031", "story_v_out_113071.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_113071", "113071031", "story_v_out_113071.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play113071032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 113071032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play113071033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.575

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_2 = arg_131_1:GetWordFromCfg(113071032)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 23
				local var_134_5 = utf8.len(var_134_3)
				local var_134_6 = var_134_4 <= 0 and var_134_1 or var_134_1 * (var_134_5 / var_134_4)

				if var_134_6 > 0 and var_134_1 < var_134_6 then
					arg_131_1.talkMaxDuration = var_134_6

					if var_134_6 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_6 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_3
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_7 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_7 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_7

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_7 and arg_131_1.time_ < var_134_0 + var_134_7 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play113071033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 113071033
		arg_135_1.duration_ = 8.333

		local var_135_0 = {
			ja = 7.5,
			ko = 8.333,
			zh = 7.366,
			en = 6.133
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
				arg_135_0:Play113071034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.775

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[94].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(113071033)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 31
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071033", "story_v_out_113071.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071033", "story_v_out_113071.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_113071", "113071033", "story_v_out_113071.awb")

						arg_135_1:RecordAudio("113071033", var_138_9)
						arg_135_1:RecordAudio("113071033", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_113071", "113071033", "story_v_out_113071.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_113071", "113071033", "story_v_out_113071.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play113071034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 113071034
		arg_139_1.duration_ = 5.033

		local var_139_0 = {
			ja = 3.3,
			ko = 5.033,
			zh = 3.166,
			en = 5
		}
		local var_139_1 = manager.audio:GetLocalizationFlag()

		if var_139_0[var_139_1] ~= nil then
			arg_139_1.duration_ = var_139_0[var_139_1]
		end

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play113071035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.35

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[94].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(113071034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 14
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071034", "story_v_out_113071.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071034", "story_v_out_113071.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_113071", "113071034", "story_v_out_113071.awb")

						arg_139_1:RecordAudio("113071034", var_142_9)
						arg_139_1:RecordAudio("113071034", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_113071", "113071034", "story_v_out_113071.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_113071", "113071034", "story_v_out_113071.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_10 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_10 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_10

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_10 and arg_139_1.time_ < var_142_0 + var_142_10 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play113071035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 113071035
		arg_143_1.duration_ = 1.3

		local var_143_0 = {
			ja = 1.2,
			ko = 0.999999999999,
			zh = 1.233,
			en = 1.3
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
				arg_143_0:Play113071036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.05

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[208].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(113071035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 2
				local var_146_6 = utf8.len(var_146_4)
				local var_146_7 = var_146_5 <= 0 and var_146_1 or var_146_1 * (var_146_6 / var_146_5)

				if var_146_7 > 0 and var_146_1 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_4
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071035", "story_v_out_113071.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_113071", "113071035", "story_v_out_113071.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_113071", "113071035", "story_v_out_113071.awb")

						arg_143_1:RecordAudio("113071035", var_146_9)
						arg_143_1:RecordAudio("113071035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_113071", "113071035", "story_v_out_113071.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_113071", "113071035", "story_v_out_113071.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_10 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_10 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_10

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_10 and arg_143_1.time_ < var_146_0 + var_146_10 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play113071036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 113071036
		arg_147_1.duration_ = 9

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play113071037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_1 = 2

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_1 then
				local var_150_2 = (arg_147_1.time_ - var_150_0) / var_150_1
				local var_150_3 = Color.New(0, 0, 0)

				var_150_3.a = Mathf.Lerp(0, 1, var_150_2)
				arg_147_1.mask_.color = var_150_3
			end

			if arg_147_1.time_ >= var_150_0 + var_150_1 and arg_147_1.time_ < var_150_0 + var_150_1 + arg_150_0 then
				local var_150_4 = Color.New(0, 0, 0)

				var_150_4.a = 1
				arg_147_1.mask_.color = var_150_4
			end

			local var_150_5 = 2

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_6 = 2

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6
				local var_150_8 = Color.New(0, 0, 0)

				var_150_8.a = Mathf.Lerp(1, 0, var_150_7)
				arg_147_1.mask_.color = var_150_8
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 then
				local var_150_9 = Color.New(0, 0, 0)
				local var_150_10 = 0

				arg_147_1.mask_.enabled = false
				var_150_9.a = var_150_10
				arg_147_1.mask_.color = var_150_9
			end

			local var_150_11 = 2

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				local var_150_12 = manager.ui.mainCamera.transform.localPosition
				local var_150_13 = Vector3.New(0, 0, 10) + Vector3.New(var_150_12.x, var_150_12.y, 0)
				local var_150_14 = arg_147_1.bgs_.F01

				var_150_14.transform.localPosition = var_150_13
				var_150_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_150_15 = var_150_14:GetComponent("SpriteRenderer")

				if var_150_15 and var_150_15.sprite then
					local var_150_16 = (var_150_14.transform.localPosition - var_150_12).z
					local var_150_17 = manager.ui.mainCameraCom_
					local var_150_18 = 2 * var_150_16 * Mathf.Tan(var_150_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_150_19 = var_150_18 * var_150_17.aspect
					local var_150_20 = var_150_15.sprite.bounds.size.x
					local var_150_21 = var_150_15.sprite.bounds.size.y
					local var_150_22 = var_150_19 / var_150_20
					local var_150_23 = var_150_18 / var_150_21
					local var_150_24 = var_150_23 < var_150_22 and var_150_22 or var_150_23

					var_150_14.transform.localScale = Vector3.New(var_150_24, var_150_24, 0)
				end

				for iter_150_0, iter_150_1 in pairs(arg_147_1.bgs_) do
					if iter_150_0 ~= "F01" then
						iter_150_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_150_25 = 0
			local var_150_26 = 1.04555149935186

			if var_150_25 < arg_147_1.time_ and arg_147_1.time_ <= var_150_25 + arg_150_0 then
				local var_150_27 = "stop"
				local var_150_28 = "music"

				arg_147_1:AudioAction(var_150_27, var_150_28, "se_story_10", "se_story_10_boiling_loop", "")
			end

			local var_150_29 = 1.04555149935186
			local var_150_30 = 1

			if var_150_29 < arg_147_1.time_ and arg_147_1.time_ <= var_150_29 + arg_150_0 then
				local var_150_31 = "play"
				local var_150_32 = "effect"

				arg_147_1:AudioAction(var_150_31, var_150_32, "se_story_10", "se_story_10_tea", "")
			end

			if arg_147_1.frameCnt_ <= 1 then
				arg_147_1.dialog_:SetActive(false)
			end

			local var_150_33 = 4
			local var_150_34 = 0.575

			if var_150_33 < arg_147_1.time_ and arg_147_1.time_ <= var_150_33 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				arg_147_1.dialog_:SetActive(true)

				local var_150_35 = LeanTween.value(arg_147_1.dialog_, 0, 1, 0.3)

				var_150_35:setOnUpdate(LuaHelper.FloatAction(function(arg_151_0)
					arg_147_1.dialogCg_.alpha = arg_151_0
				end))
				var_150_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_147_1.dialog_)
					var_150_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_147_1.duration_ = arg_147_1.duration_ + 0.3

				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_36 = arg_147_1:GetWordFromCfg(113071036)
				local var_150_37 = arg_147_1:FormatText(var_150_36.content)

				arg_147_1.text_.text = var_150_37

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_38 = 23
				local var_150_39 = utf8.len(var_150_37)
				local var_150_40 = var_150_38 <= 0 and var_150_34 or var_150_34 * (var_150_39 / var_150_38)

				if var_150_40 > 0 and var_150_34 < var_150_40 then
					arg_147_1.talkMaxDuration = var_150_40
					var_150_33 = var_150_33 + 0.3

					if var_150_40 + var_150_33 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_40 + var_150_33
					end
				end

				arg_147_1.text_.text = var_150_37
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_41 = var_150_33 + 0.3
			local var_150_42 = math.max(var_150_34, arg_147_1.talkMaxDuration)

			if var_150_41 <= arg_147_1.time_ and arg_147_1.time_ < var_150_41 + var_150_42 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_41) / var_150_42

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_41 + var_150_42 and arg_147_1.time_ < var_150_41 + var_150_42 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play113071037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 113071037
		arg_153_1.duration_ = 1.999999999999

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play113071038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1038ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1038ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1038ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 then
				arg_153_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_156_11 = arg_153_1.actors_["1038ui_story"]
			local var_156_12 = 0

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 and arg_153_1.var_.characterEffect1038ui_story == nil then
				arg_153_1.var_.characterEffect1038ui_story = var_156_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_13 = 0.2

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_13 then
				local var_156_14 = (arg_153_1.time_ - var_156_12) / var_156_13

				if arg_153_1.var_.characterEffect1038ui_story then
					arg_153_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_12 + var_156_13 and arg_153_1.time_ < var_156_12 + var_156_13 + arg_156_0 and arg_153_1.var_.characterEffect1038ui_story then
				arg_153_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_156_15 = 0
			local var_156_16 = 0.05

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_17 = arg_153_1:FormatText(StoryNameCfg[94].name)

				arg_153_1.leftNameTxt_.text = var_156_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_18 = arg_153_1:GetWordFromCfg(113071037)
				local var_156_19 = arg_153_1:FormatText(var_156_18.content)

				arg_153_1.text_.text = var_156_19

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_20 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071037", "story_v_out_113071.awb") ~= 0 then
					local var_156_23 = manager.audio:GetVoiceLength("story_v_out_113071", "113071037", "story_v_out_113071.awb") / 1000

					if var_156_23 + var_156_15 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_23 + var_156_15
					end

					if var_156_18.prefab_name ~= "" and arg_153_1.actors_[var_156_18.prefab_name] ~= nil then
						local var_156_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_18.prefab_name].transform, "story_v_out_113071", "113071037", "story_v_out_113071.awb")

						arg_153_1:RecordAudio("113071037", var_156_24)
						arg_153_1:RecordAudio("113071037", var_156_24)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_113071", "113071037", "story_v_out_113071.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_113071", "113071037", "story_v_out_113071.awb")
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
	Play113071038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 113071038
		arg_157_1.duration_ = 7.2

		local var_157_0 = {
			ja = 7.2,
			ko = 2.233,
			zh = 3.866,
			en = 6
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
				arg_157_0:Play113071039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1038ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1038ui_story == nil then
				arg_157_1.var_.characterEffect1038ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1038ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1038ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1038ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1038ui_story.fillRatio = var_160_5
			end

			local var_160_6 = arg_157_1.actors_["1041ui_story"].transform
			local var_160_7 = 0

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 then
				arg_157_1.var_.moveOldPos1041ui_story = var_160_6.localPosition
			end

			local var_160_8 = 0.001

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_8 then
				local var_160_9 = (arg_157_1.time_ - var_160_7) / var_160_8
				local var_160_10 = Vector3.New(0.7, -1.11, -5.9)

				var_160_6.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1041ui_story, var_160_10, var_160_9)

				local var_160_11 = manager.ui.mainCamera.transform.position - var_160_6.position

				var_160_6.forward = Vector3.New(var_160_11.x, var_160_11.y, var_160_11.z)

				local var_160_12 = var_160_6.localEulerAngles

				var_160_12.z = 0
				var_160_12.x = 0
				var_160_6.localEulerAngles = var_160_12
			end

			if arg_157_1.time_ >= var_160_7 + var_160_8 and arg_157_1.time_ < var_160_7 + var_160_8 + arg_160_0 then
				var_160_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_160_13 = manager.ui.mainCamera.transform.position - var_160_6.position

				var_160_6.forward = Vector3.New(var_160_13.x, var_160_13.y, var_160_13.z)

				local var_160_14 = var_160_6.localEulerAngles

				var_160_14.z = 0
				var_160_14.x = 0
				var_160_6.localEulerAngles = var_160_14
			end

			local var_160_15 = 0

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 then
				arg_157_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_160_17 = arg_157_1.actors_["1041ui_story"]
			local var_160_18 = 0

			if var_160_18 < arg_157_1.time_ and arg_157_1.time_ <= var_160_18 + arg_160_0 and arg_157_1.var_.characterEffect1041ui_story == nil then
				arg_157_1.var_.characterEffect1041ui_story = var_160_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_19 = 0.2

			if var_160_18 <= arg_157_1.time_ and arg_157_1.time_ < var_160_18 + var_160_19 then
				local var_160_20 = (arg_157_1.time_ - var_160_18) / var_160_19

				if arg_157_1.var_.characterEffect1041ui_story then
					arg_157_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_18 + var_160_19 and arg_157_1.time_ < var_160_18 + var_160_19 + arg_160_0 and arg_157_1.var_.characterEffect1041ui_story then
				arg_157_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_160_21 = 0
			local var_160_22 = 0.225

			if var_160_21 < arg_157_1.time_ and arg_157_1.time_ <= var_160_21 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_23 = arg_157_1:FormatText(StoryNameCfg[208].name)

				arg_157_1.leftNameTxt_.text = var_160_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_24 = arg_157_1:GetWordFromCfg(113071038)
				local var_160_25 = arg_157_1:FormatText(var_160_24.content)

				arg_157_1.text_.text = var_160_25

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_26 = 9
				local var_160_27 = utf8.len(var_160_25)
				local var_160_28 = var_160_26 <= 0 and var_160_22 or var_160_22 * (var_160_27 / var_160_26)

				if var_160_28 > 0 and var_160_22 < var_160_28 then
					arg_157_1.talkMaxDuration = var_160_28

					if var_160_28 + var_160_21 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_28 + var_160_21
					end
				end

				arg_157_1.text_.text = var_160_25
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071038", "story_v_out_113071.awb") ~= 0 then
					local var_160_29 = manager.audio:GetVoiceLength("story_v_out_113071", "113071038", "story_v_out_113071.awb") / 1000

					if var_160_29 + var_160_21 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_29 + var_160_21
					end

					if var_160_24.prefab_name ~= "" and arg_157_1.actors_[var_160_24.prefab_name] ~= nil then
						local var_160_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_24.prefab_name].transform, "story_v_out_113071", "113071038", "story_v_out_113071.awb")

						arg_157_1:RecordAudio("113071038", var_160_30)
						arg_157_1:RecordAudio("113071038", var_160_30)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_113071", "113071038", "story_v_out_113071.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_113071", "113071038", "story_v_out_113071.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_31 = math.max(var_160_22, arg_157_1.talkMaxDuration)

			if var_160_21 <= arg_157_1.time_ and arg_157_1.time_ < var_160_21 + var_160_31 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_21) / var_160_31

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_21 + var_160_31 and arg_157_1.time_ < var_160_21 + var_160_31 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play113071039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 113071039
		arg_161_1.duration_ = 6.766

		local var_161_0 = {
			ja = 5.833,
			ko = 5.866,
			zh = 5.266,
			en = 6.766
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
				arg_161_0:Play113071040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_164_2 = arg_161_1.actors_["1038ui_story"]
			local var_164_3 = 0

			if var_164_3 < arg_161_1.time_ and arg_161_1.time_ <= var_164_3 + arg_164_0 and arg_161_1.var_.characterEffect1038ui_story == nil then
				arg_161_1.var_.characterEffect1038ui_story = var_164_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_4 = 0.2

			if var_164_3 <= arg_161_1.time_ and arg_161_1.time_ < var_164_3 + var_164_4 then
				local var_164_5 = (arg_161_1.time_ - var_164_3) / var_164_4

				if arg_161_1.var_.characterEffect1038ui_story then
					arg_161_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_3 + var_164_4 and arg_161_1.time_ < var_164_3 + var_164_4 + arg_164_0 and arg_161_1.var_.characterEffect1038ui_story then
				arg_161_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_164_6 = arg_161_1.actors_["1041ui_story"]
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 and arg_161_1.var_.characterEffect1041ui_story == nil then
				arg_161_1.var_.characterEffect1041ui_story = var_164_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_8 = 0.2

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_8 then
				local var_164_9 = (arg_161_1.time_ - var_164_7) / var_164_8

				if arg_161_1.var_.characterEffect1041ui_story then
					local var_164_10 = Mathf.Lerp(0, 0.5, var_164_9)

					arg_161_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1041ui_story.fillRatio = var_164_10
				end
			end

			if arg_161_1.time_ >= var_164_7 + var_164_8 and arg_161_1.time_ < var_164_7 + var_164_8 + arg_164_0 and arg_161_1.var_.characterEffect1041ui_story then
				local var_164_11 = 0.5

				arg_161_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1041ui_story.fillRatio = var_164_11
			end

			local var_164_12 = 0
			local var_164_13 = 0.6

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_14 = arg_161_1:FormatText(StoryNameCfg[94].name)

				arg_161_1.leftNameTxt_.text = var_164_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_15 = arg_161_1:GetWordFromCfg(113071039)
				local var_164_16 = arg_161_1:FormatText(var_164_15.content)

				arg_161_1.text_.text = var_164_16

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_17 = 24
				local var_164_18 = utf8.len(var_164_16)
				local var_164_19 = var_164_17 <= 0 and var_164_13 or var_164_13 * (var_164_18 / var_164_17)

				if var_164_19 > 0 and var_164_13 < var_164_19 then
					arg_161_1.talkMaxDuration = var_164_19

					if var_164_19 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_19 + var_164_12
					end
				end

				arg_161_1.text_.text = var_164_16
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071039", "story_v_out_113071.awb") ~= 0 then
					local var_164_20 = manager.audio:GetVoiceLength("story_v_out_113071", "113071039", "story_v_out_113071.awb") / 1000

					if var_164_20 + var_164_12 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_12
					end

					if var_164_15.prefab_name ~= "" and arg_161_1.actors_[var_164_15.prefab_name] ~= nil then
						local var_164_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_15.prefab_name].transform, "story_v_out_113071", "113071039", "story_v_out_113071.awb")

						arg_161_1:RecordAudio("113071039", var_164_21)
						arg_161_1:RecordAudio("113071039", var_164_21)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_113071", "113071039", "story_v_out_113071.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_113071", "113071039", "story_v_out_113071.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_22 = math.max(var_164_13, arg_161_1.talkMaxDuration)

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_22 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_12) / var_164_22

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_12 + var_164_22 and arg_161_1.time_ < var_164_12 + var_164_22 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play113071040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 113071040
		arg_165_1.duration_ = 3.033

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play113071041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1038ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect1038ui_story == nil then
				arg_165_1.var_.characterEffect1038ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.2

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect1038ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1038ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect1038ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1038ui_story.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 1

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				local var_168_8 = "play"
				local var_168_9 = "music"

				arg_165_1:AudioAction(var_168_8, var_168_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_168_10 = 0.175
			local var_168_11 = 1

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				local var_168_12 = "play"
				local var_168_13 = "effect"

				arg_165_1:AudioAction(var_168_12, var_168_13, "se_story", "se_story_robot_e", "")
			end

			local var_168_14 = 0
			local var_168_15 = 0.175

			if var_168_14 < arg_165_1.time_ and arg_165_1.time_ <= var_168_14 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_16 = arg_165_1:FormatText(StoryNameCfg[68].name)

				arg_165_1.leftNameTxt_.text = var_168_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2037")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_17 = arg_165_1:GetWordFromCfg(113071040)
				local var_168_18 = arg_165_1:FormatText(var_168_17.content)

				arg_165_1.text_.text = var_168_18

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_19 = 7
				local var_168_20 = utf8.len(var_168_18)
				local var_168_21 = var_168_19 <= 0 and var_168_15 or var_168_15 * (var_168_20 / var_168_19)

				if var_168_21 > 0 and var_168_15 < var_168_21 then
					arg_165_1.talkMaxDuration = var_168_21

					if var_168_21 + var_168_14 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_21 + var_168_14
					end
				end

				arg_165_1.text_.text = var_168_18
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071040", "story_v_out_113071.awb") ~= 0 then
					local var_168_22 = manager.audio:GetVoiceLength("story_v_out_113071", "113071040", "story_v_out_113071.awb") / 1000

					if var_168_22 + var_168_14 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_22 + var_168_14
					end

					if var_168_17.prefab_name ~= "" and arg_165_1.actors_[var_168_17.prefab_name] ~= nil then
						local var_168_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_17.prefab_name].transform, "story_v_out_113071", "113071040", "story_v_out_113071.awb")

						arg_165_1:RecordAudio("113071040", var_168_23)
						arg_165_1:RecordAudio("113071040", var_168_23)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_113071", "113071040", "story_v_out_113071.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_113071", "113071040", "story_v_out_113071.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_24 = math.max(var_168_15, arg_165_1.talkMaxDuration)

			if var_168_14 <= arg_165_1.time_ and arg_165_1.time_ < var_168_14 + var_168_24 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_14) / var_168_24

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_14 + var_168_24 and arg_165_1.time_ < var_168_14 + var_168_24 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play113071041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 113071041
		arg_169_1.duration_ = 2.733

		local var_169_0 = {
			ja = 1.999999999999,
			ko = 2.733,
			zh = 2.2,
			en = 1.999999999999
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
				arg_169_0:Play113071042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038actionlink/1038action457")
			end

			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_172_2 = arg_169_1.actors_["1038ui_story"]
			local var_172_3 = 0

			if var_172_3 < arg_169_1.time_ and arg_169_1.time_ <= var_172_3 + arg_172_0 and arg_169_1.var_.characterEffect1038ui_story == nil then
				arg_169_1.var_.characterEffect1038ui_story = var_172_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_4 = 0.2

			if var_172_3 <= arg_169_1.time_ and arg_169_1.time_ < var_172_3 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_3) / var_172_4

				if arg_169_1.var_.characterEffect1038ui_story then
					arg_169_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_3 + var_172_4 and arg_169_1.time_ < var_172_3 + var_172_4 + arg_172_0 and arg_169_1.var_.characterEffect1038ui_story then
				arg_169_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_172_6 = 0
			local var_172_7 = 0.5

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				local var_172_8 = "play"
				local var_172_9 = "music"

				arg_169_1:AudioAction(var_172_8, var_172_9, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			local var_172_10 = 0
			local var_172_11 = 0.15

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_12 = arg_169_1:FormatText(StoryNameCfg[94].name)

				arg_169_1.leftNameTxt_.text = var_172_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_13 = arg_169_1:GetWordFromCfg(113071041)
				local var_172_14 = arg_169_1:FormatText(var_172_13.content)

				arg_169_1.text_.text = var_172_14

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_15 = 6
				local var_172_16 = utf8.len(var_172_14)
				local var_172_17 = var_172_15 <= 0 and var_172_11 or var_172_11 * (var_172_16 / var_172_15)

				if var_172_17 > 0 and var_172_11 < var_172_17 then
					arg_169_1.talkMaxDuration = var_172_17

					if var_172_17 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_17 + var_172_10
					end
				end

				arg_169_1.text_.text = var_172_14
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071041", "story_v_out_113071.awb") ~= 0 then
					local var_172_18 = manager.audio:GetVoiceLength("story_v_out_113071", "113071041", "story_v_out_113071.awb") / 1000

					if var_172_18 + var_172_10 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_18 + var_172_10
					end

					if var_172_13.prefab_name ~= "" and arg_169_1.actors_[var_172_13.prefab_name] ~= nil then
						local var_172_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_13.prefab_name].transform, "story_v_out_113071", "113071041", "story_v_out_113071.awb")

						arg_169_1:RecordAudio("113071041", var_172_19)
						arg_169_1:RecordAudio("113071041", var_172_19)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_113071", "113071041", "story_v_out_113071.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_113071", "113071041", "story_v_out_113071.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_20 = math.max(var_172_11, arg_169_1.talkMaxDuration)

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_20 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_10) / var_172_20

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_10 + var_172_20 and arg_169_1.time_ < var_172_10 + var_172_20 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play113071042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 113071042
		arg_173_1.duration_ = 2.333

		local var_173_0 = {
			ja = 2.333,
			ko = 1.999999999999,
			zh = 2,
			en = 1.999999999999
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
				arg_173_0:Play113071043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1038ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1038ui_story == nil then
				arg_173_1.var_.characterEffect1038ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1038ui_story then
					local var_176_4 = Mathf.Lerp(0, 0.5, var_176_3)

					arg_173_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1038ui_story.fillRatio = var_176_4
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1038ui_story then
				local var_176_5 = 0.5

				arg_173_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1038ui_story.fillRatio = var_176_5
			end

			local var_176_6 = 0

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 then
				arg_173_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action4_1")
			end

			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_176_8 = arg_173_1.actors_["1041ui_story"]
			local var_176_9 = 0

			if var_176_9 < arg_173_1.time_ and arg_173_1.time_ <= var_176_9 + arg_176_0 and arg_173_1.var_.characterEffect1041ui_story == nil then
				arg_173_1.var_.characterEffect1041ui_story = var_176_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_10 = 0.2

			if var_176_9 <= arg_173_1.time_ and arg_173_1.time_ < var_176_9 + var_176_10 then
				local var_176_11 = (arg_173_1.time_ - var_176_9) / var_176_10

				if arg_173_1.var_.characterEffect1041ui_story then
					arg_173_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_9 + var_176_10 and arg_173_1.time_ < var_176_9 + var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1041ui_story then
				arg_173_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_176_12 = arg_173_1.actors_["1041ui_story"].transform
			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1.var_.moveOldPos1041ui_story = var_176_12.localPosition

				local var_176_14 = "1041ui_story"

				arg_173_1:ShowWeapon(arg_173_1.var_[var_176_14 .. "Animator"].transform, true)
			end

			local var_176_15 = 0.001

			if var_176_13 <= arg_173_1.time_ and arg_173_1.time_ < var_176_13 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_13) / var_176_15
				local var_176_17 = Vector3.New(0.7, -1.11, -5.9)

				var_176_12.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1041ui_story, var_176_17, var_176_16)

				local var_176_18 = manager.ui.mainCamera.transform.position - var_176_12.position

				var_176_12.forward = Vector3.New(var_176_18.x, var_176_18.y, var_176_18.z)

				local var_176_19 = var_176_12.localEulerAngles

				var_176_19.z = 0
				var_176_19.x = 0
				var_176_12.localEulerAngles = var_176_19
			end

			if arg_173_1.time_ >= var_176_13 + var_176_15 and arg_173_1.time_ < var_176_13 + var_176_15 + arg_176_0 then
				var_176_12.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_176_20 = manager.ui.mainCamera.transform.position - var_176_12.position

				var_176_12.forward = Vector3.New(var_176_20.x, var_176_20.y, var_176_20.z)

				local var_176_21 = var_176_12.localEulerAngles

				var_176_21.z = 0
				var_176_21.x = 0
				var_176_12.localEulerAngles = var_176_21
			end

			local var_176_22 = 0
			local var_176_23 = 0.1

			if var_176_22 < arg_173_1.time_ and arg_173_1.time_ <= var_176_22 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_24 = arg_173_1:FormatText(StoryNameCfg[208].name)

				arg_173_1.leftNameTxt_.text = var_176_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_25 = arg_173_1:GetWordFromCfg(113071042)
				local var_176_26 = arg_173_1:FormatText(var_176_25.content)

				arg_173_1.text_.text = var_176_26

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_27 = 4
				local var_176_28 = utf8.len(var_176_26)
				local var_176_29 = var_176_27 <= 0 and var_176_23 or var_176_23 * (var_176_28 / var_176_27)

				if var_176_29 > 0 and var_176_23 < var_176_29 then
					arg_173_1.talkMaxDuration = var_176_29

					if var_176_29 + var_176_22 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_29 + var_176_22
					end
				end

				arg_173_1.text_.text = var_176_26
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071042", "story_v_out_113071.awb") ~= 0 then
					local var_176_30 = manager.audio:GetVoiceLength("story_v_out_113071", "113071042", "story_v_out_113071.awb") / 1000

					if var_176_30 + var_176_22 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_30 + var_176_22
					end

					if var_176_25.prefab_name ~= "" and arg_173_1.actors_[var_176_25.prefab_name] ~= nil then
						local var_176_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_25.prefab_name].transform, "story_v_out_113071", "113071042", "story_v_out_113071.awb")

						arg_173_1:RecordAudio("113071042", var_176_31)
						arg_173_1:RecordAudio("113071042", var_176_31)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_113071", "113071042", "story_v_out_113071.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_113071", "113071042", "story_v_out_113071.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_32 = math.max(var_176_23, arg_173_1.talkMaxDuration)

			if var_176_22 <= arg_173_1.time_ and arg_173_1.time_ < var_176_22 + var_176_32 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_22) / var_176_32

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_22 + var_176_32 and arg_173_1.time_ < var_176_22 + var_176_32 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play113071043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 113071043
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play113071044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1041ui_story"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1041ui_story = var_180_0.localPosition

				local var_180_2 = "1041ui_story"

				arg_177_1:ShowWeapon(arg_177_1.var_[var_180_2 .. "Animator"].transform, true)
			end

			local var_180_3 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_3 then
				local var_180_4 = (arg_177_1.time_ - var_180_1) / var_180_3
				local var_180_5 = Vector3.New(0, 100, 0)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1041ui_story, var_180_5, var_180_4)

				local var_180_6 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_6.x, var_180_6.y, var_180_6.z)

				local var_180_7 = var_180_0.localEulerAngles

				var_180_7.z = 0
				var_180_7.x = 0
				var_180_0.localEulerAngles = var_180_7
			end

			if arg_177_1.time_ >= var_180_1 + var_180_3 and arg_177_1.time_ < var_180_1 + var_180_3 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(0, 100, 0)

				local var_180_8 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_8.x, var_180_8.y, var_180_8.z)

				local var_180_9 = var_180_0.localEulerAngles

				var_180_9.z = 0
				var_180_9.x = 0
				var_180_0.localEulerAngles = var_180_9
			end

			local var_180_10 = arg_177_1.actors_["1038ui_story"].transform
			local var_180_11 = 0

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.var_.moveOldPos1038ui_story = var_180_10.localPosition

				local var_180_12 = "1038ui_story"

				arg_177_1:ShowWeapon(arg_177_1.var_[var_180_12 .. "Animator"].transform, true)
			end

			local var_180_13 = 0.001

			if var_180_11 <= arg_177_1.time_ and arg_177_1.time_ < var_180_11 + var_180_13 then
				local var_180_14 = (arg_177_1.time_ - var_180_11) / var_180_13
				local var_180_15 = Vector3.New(0, 100, 0)

				var_180_10.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1038ui_story, var_180_15, var_180_14)

				local var_180_16 = manager.ui.mainCamera.transform.position - var_180_10.position

				var_180_10.forward = Vector3.New(var_180_16.x, var_180_16.y, var_180_16.z)

				local var_180_17 = var_180_10.localEulerAngles

				var_180_17.z = 0
				var_180_17.x = 0
				var_180_10.localEulerAngles = var_180_17
			end

			if arg_177_1.time_ >= var_180_11 + var_180_13 and arg_177_1.time_ < var_180_11 + var_180_13 + arg_180_0 then
				var_180_10.localPosition = Vector3.New(0, 100, 0)

				local var_180_18 = manager.ui.mainCamera.transform.position - var_180_10.position

				var_180_10.forward = Vector3.New(var_180_18.x, var_180_18.y, var_180_18.z)

				local var_180_19 = var_180_10.localEulerAngles

				var_180_19.z = 0
				var_180_19.x = 0
				var_180_10.localEulerAngles = var_180_19
			end

			local var_180_20 = 0
			local var_180_21 = 0.6

			if var_180_20 < arg_177_1.time_ and arg_177_1.time_ <= var_180_20 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_22 = arg_177_1:GetWordFromCfg(113071043)
				local var_180_23 = arg_177_1:FormatText(var_180_22.content)

				arg_177_1.text_.text = var_180_23

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_24 = 24
				local var_180_25 = utf8.len(var_180_23)
				local var_180_26 = var_180_24 <= 0 and var_180_21 or var_180_21 * (var_180_25 / var_180_24)

				if var_180_26 > 0 and var_180_21 < var_180_26 then
					arg_177_1.talkMaxDuration = var_180_26

					if var_180_26 + var_180_20 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_26 + var_180_20
					end
				end

				arg_177_1.text_.text = var_180_23
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_27 = math.max(var_180_21, arg_177_1.talkMaxDuration)

			if var_180_20 <= arg_177_1.time_ and arg_177_1.time_ < var_180_20 + var_180_27 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_20) / var_180_27

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_20 + var_180_27 and arg_177_1.time_ < var_180_20 + var_180_27 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play113071044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 113071044
		arg_181_1.duration_ = 2.466

		local var_181_0 = {
			ja = 2.466,
			ko = 2.333,
			zh = 2.433,
			en = 2.433
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
			arg_181_1.auto_ = false
		end

		function arg_181_1.playNext_(arg_183_0)
			arg_181_1.onStoryFinished_()
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_184_1 = arg_181_1.actors_["1041ui_story"]
			local var_184_2 = 0

			if var_184_2 < arg_181_1.time_ and arg_181_1.time_ <= var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1041ui_story == nil then
				arg_181_1.var_.characterEffect1041ui_story = var_184_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_3 = 0.2

			if var_184_2 <= arg_181_1.time_ and arg_181_1.time_ < var_184_2 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_2) / var_184_3

				if arg_181_1.var_.characterEffect1041ui_story then
					arg_181_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_2 + var_184_3 and arg_181_1.time_ < var_184_2 + var_184_3 + arg_184_0 and arg_181_1.var_.characterEffect1041ui_story then
				arg_181_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_184_5 = arg_181_1.actors_["1041ui_story"].transform
			local var_184_6 = 0

			if var_184_6 < arg_181_1.time_ and arg_181_1.time_ <= var_184_6 + arg_184_0 then
				arg_181_1.var_.moveOldPos1041ui_story = var_184_5.localPosition

				local var_184_7 = "1041ui_story"

				arg_181_1:ShowWeapon(arg_181_1.var_[var_184_7 .. "Animator"].transform, true)
			end

			local var_184_8 = 0.001

			if var_184_6 <= arg_181_1.time_ and arg_181_1.time_ < var_184_6 + var_184_8 then
				local var_184_9 = (arg_181_1.time_ - var_184_6) / var_184_8
				local var_184_10 = Vector3.New(0, -1.11, -5.9)

				var_184_5.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1041ui_story, var_184_10, var_184_9)

				local var_184_11 = manager.ui.mainCamera.transform.position - var_184_5.position

				var_184_5.forward = Vector3.New(var_184_11.x, var_184_11.y, var_184_11.z)

				local var_184_12 = var_184_5.localEulerAngles

				var_184_12.z = 0
				var_184_12.x = 0
				var_184_5.localEulerAngles = var_184_12
			end

			if arg_181_1.time_ >= var_184_6 + var_184_8 and arg_181_1.time_ < var_184_6 + var_184_8 + arg_184_0 then
				var_184_5.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_184_13 = manager.ui.mainCamera.transform.position - var_184_5.position

				var_184_5.forward = Vector3.New(var_184_13.x, var_184_13.y, var_184_13.z)

				local var_184_14 = var_184_5.localEulerAngles

				var_184_14.z = 0
				var_184_14.x = 0
				var_184_5.localEulerAngles = var_184_14
			end

			local var_184_15 = 0

			if var_184_15 < arg_181_1.time_ and arg_181_1.time_ <= var_184_15 + arg_184_0 then
				arg_181_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action8_1")
			end

			local var_184_16 = 0
			local var_184_17 = 0.225

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_18 = arg_181_1:FormatText(StoryNameCfg[208].name)

				arg_181_1.leftNameTxt_.text = var_184_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_19 = arg_181_1:GetWordFromCfg(113071044)
				local var_184_20 = arg_181_1:FormatText(var_184_19.content)

				arg_181_1.text_.text = var_184_20

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_21 = 9
				local var_184_22 = utf8.len(var_184_20)
				local var_184_23 = var_184_21 <= 0 and var_184_17 or var_184_17 * (var_184_22 / var_184_21)

				if var_184_23 > 0 and var_184_17 < var_184_23 then
					arg_181_1.talkMaxDuration = var_184_23

					if var_184_23 + var_184_16 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_23 + var_184_16
					end
				end

				arg_181_1.text_.text = var_184_20
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113071", "113071044", "story_v_out_113071.awb") ~= 0 then
					local var_184_24 = manager.audio:GetVoiceLength("story_v_out_113071", "113071044", "story_v_out_113071.awb") / 1000

					if var_184_24 + var_184_16 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_24 + var_184_16
					end

					if var_184_19.prefab_name ~= "" and arg_181_1.actors_[var_184_19.prefab_name] ~= nil then
						local var_184_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_19.prefab_name].transform, "story_v_out_113071", "113071044", "story_v_out_113071.awb")

						arg_181_1:RecordAudio("113071044", var_184_25)
						arg_181_1:RecordAudio("113071044", var_184_25)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_113071", "113071044", "story_v_out_113071.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_113071", "113071044", "story_v_out_113071.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_26 = math.max(var_184_17, arg_181_1.talkMaxDuration)

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_26 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_16) / var_184_26

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_16 + var_184_26 and arg_181_1.time_ < var_184_16 + var_184_26 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0110"
	},
	voices = {
		"story_v_out_113071.awb"
	}
}
