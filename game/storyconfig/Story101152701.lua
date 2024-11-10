return {
	Play115271001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115271001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115271002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22"

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
				local var_4_5 = arg_1_1.bgs_.ST22

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
					if iter_4_0 ~= "ST22" then
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
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_activity_1_5_3", "se_story_activity_1_5_3_rain_loop", "")
			end

			local var_4_26 = 0
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 1.33333333333333
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess.awb")
			end

			local var_4_34 = 2
			local var_4_35 = 1.3

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_36 = arg_1_1:GetWordFromCfg(115271001)
				local var_4_37 = arg_1_1:FormatText(var_4_36.content)

				arg_1_1.text_.text = var_4_37

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_38 = 52
				local var_4_39 = utf8.len(var_4_37)
				local var_4_40 = var_4_38 <= 0 and var_4_35 or var_4_35 * (var_4_39 / var_4_38)

				if var_4_40 > 0 and var_4_35 < var_4_40 then
					arg_1_1.talkMaxDuration = var_4_40

					if var_4_40 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_40 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_37
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_41 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_34) / var_4_41

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_34 + var_4_41 and arg_1_1.time_ < var_4_34 + var_4_41 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115271002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 115271002
		arg_5_1.duration_ = 5

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play115271003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0
			local var_8_1 = 1.275

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0
				arg_5_1.dialogCg_.alpha = 1

				arg_5_1.dialog_:SetActive(true)
				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_2 = arg_5_1:GetWordFromCfg(115271002)
				local var_8_3 = arg_5_1:FormatText(var_8_2.content)

				arg_5_1.text_.text = var_8_3

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_4 = 51
				local var_8_5 = utf8.len(var_8_3)
				local var_8_6 = var_8_4 <= 0 and var_8_1 or var_8_1 * (var_8_5 / var_8_4)

				if var_8_6 > 0 and var_8_1 < var_8_6 then
					arg_5_1.talkMaxDuration = var_8_6

					if var_8_6 + var_8_0 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_6 + var_8_0
					end
				end

				arg_5_1.text_.text = var_8_3
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)
				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_7 = math.max(var_8_1, arg_5_1.talkMaxDuration)

			if var_8_0 <= arg_5_1.time_ and arg_5_1.time_ < var_8_0 + var_8_7 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_0) / var_8_7

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_0 + var_8_7 and arg_5_1.time_ < var_8_0 + var_8_7 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play115271003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 115271003
		arg_9_1.duration_ = 3.8

		local var_9_0 = {
			ja = 2.933,
			ko = 3.733,
			zh = 2.7,
			en = 3.8
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
				arg_9_0:Play115271004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 0.325

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_2 = arg_9_1:FormatText(StoryNameCfg[306].name)

				arg_9_1.leftNameTxt_.text = var_12_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_3 = arg_9_1:GetWordFromCfg(115271003)
				local var_12_4 = arg_9_1:FormatText(var_12_3.content)

				arg_9_1.text_.text = var_12_4

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_5 = 13
				local var_12_6 = utf8.len(var_12_4)
				local var_12_7 = var_12_5 <= 0 and var_12_1 or var_12_1 * (var_12_6 / var_12_5)

				if var_12_7 > 0 and var_12_1 < var_12_7 then
					arg_9_1.talkMaxDuration = var_12_7

					if var_12_7 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_7 + var_12_0
					end
				end

				arg_9_1.text_.text = var_12_4
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271003", "story_v_out_115271.awb") ~= 0 then
					local var_12_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271003", "story_v_out_115271.awb") / 1000

					if var_12_8 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_8 + var_12_0
					end

					if var_12_3.prefab_name ~= "" and arg_9_1.actors_[var_12_3.prefab_name] ~= nil then
						local var_12_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_3.prefab_name].transform, "story_v_out_115271", "115271003", "story_v_out_115271.awb")

						arg_9_1:RecordAudio("115271003", var_12_9)
						arg_9_1:RecordAudio("115271003", var_12_9)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_115271", "115271003", "story_v_out_115271.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_115271", "115271003", "story_v_out_115271.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_10 = math.max(var_12_1, arg_9_1.talkMaxDuration)

			if var_12_0 <= arg_9_1.time_ and arg_9_1.time_ < var_12_0 + var_12_10 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_0) / var_12_10

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_0 + var_12_10 and arg_9_1.time_ < var_12_0 + var_12_10 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play115271004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 115271004
		arg_13_1.duration_ = 3.8

		local var_13_0 = {
			ja = 3.233,
			ko = 3.8,
			zh = 2.533,
			en = 3.233
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
				arg_13_0:Play115271005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.325

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[306].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(115271004)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271004", "story_v_out_115271.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271004", "story_v_out_115271.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_115271", "115271004", "story_v_out_115271.awb")

						arg_13_1:RecordAudio("115271004", var_16_9)
						arg_13_1:RecordAudio("115271004", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_115271", "115271004", "story_v_out_115271.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_115271", "115271004", "story_v_out_115271.awb")
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
	Play115271005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 115271005
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play115271006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 1.15

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_2 = arg_17_1:GetWordFromCfg(115271005)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 46
				local var_20_5 = utf8.len(var_20_3)
				local var_20_6 = var_20_4 <= 0 and var_20_1 or var_20_1 * (var_20_5 / var_20_4)

				if var_20_6 > 0 and var_20_1 < var_20_6 then
					arg_17_1.talkMaxDuration = var_20_6

					if var_20_6 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_6 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_3
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_7 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_7 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_7

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_7 and arg_17_1.time_ < var_20_0 + var_20_7 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play115271006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 115271006
		arg_21_1.duration_ = 8.133

		local var_21_0 = {
			ja = 3.866,
			ko = 3.6,
			zh = 2.6,
			en = 8.133
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
				arg_21_0:Play115271007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.3

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[313].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_3 = arg_21_1:GetWordFromCfg(115271006)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271006", "story_v_out_115271.awb") ~= 0 then
					local var_24_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271006", "story_v_out_115271.awb") / 1000

					if var_24_8 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_0
					end

					if var_24_3.prefab_name ~= "" and arg_21_1.actors_[var_24_3.prefab_name] ~= nil then
						local var_24_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_3.prefab_name].transform, "story_v_out_115271", "115271006", "story_v_out_115271.awb")

						arg_21_1:RecordAudio("115271006", var_24_9)
						arg_21_1:RecordAudio("115271006", var_24_9)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_115271", "115271006", "story_v_out_115271.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_115271", "115271006", "story_v_out_115271.awb")
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
	Play115271007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 115271007
		arg_25_1.duration_ = 7.133

		local var_25_0 = {
			ja = 4.866,
			ko = 6.5,
			zh = 5.8,
			en = 7.133
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
				arg_25_0:Play115271008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.725

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[308].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(115271007)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271007", "story_v_out_115271.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271007", "story_v_out_115271.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_115271", "115271007", "story_v_out_115271.awb")

						arg_25_1:RecordAudio("115271007", var_28_9)
						arg_25_1:RecordAudio("115271007", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_115271", "115271007", "story_v_out_115271.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_115271", "115271007", "story_v_out_115271.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_10 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_10 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_10

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_10 and arg_25_1.time_ < var_28_0 + var_28_10 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play115271008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 115271008
		arg_29_1.duration_ = 10.366

		local var_29_0 = {
			ja = 8.066,
			ko = 6.566,
			zh = 4.7,
			en = 10.366
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
				arg_29_0:Play115271009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.625

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[313].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(115271008)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271008", "story_v_out_115271.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271008", "story_v_out_115271.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_115271", "115271008", "story_v_out_115271.awb")

						arg_29_1:RecordAudio("115271008", var_32_9)
						arg_29_1:RecordAudio("115271008", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_115271", "115271008", "story_v_out_115271.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_115271", "115271008", "story_v_out_115271.awb")
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
	Play115271009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 115271009
		arg_33_1.duration_ = 16.6

		local var_33_0 = {
			ja = 7.466,
			ko = 13.3,
			zh = 12.033,
			en = 16.6
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
				arg_33_0:Play115271010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 1.525

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[308].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(115271009)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 61
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271009", "story_v_out_115271.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271009", "story_v_out_115271.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_115271", "115271009", "story_v_out_115271.awb")

						arg_33_1:RecordAudio("115271009", var_36_9)
						arg_33_1:RecordAudio("115271009", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_115271", "115271009", "story_v_out_115271.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_115271", "115271009", "story_v_out_115271.awb")
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
	Play115271010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 115271010
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play115271011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1.3

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

				local var_40_2 = arg_37_1:GetWordFromCfg(115271010)
				local var_40_3 = arg_37_1:FormatText(var_40_2.content)

				arg_37_1.text_.text = var_40_3

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_4 = 52
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
	Play115271011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 115271011
		arg_41_1.duration_ = 9

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play115271012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = "F01a"

			if arg_41_1.bgs_[var_44_0] == nil then
				local var_44_1 = Object.Instantiate(arg_41_1.paintGo_)

				var_44_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_44_0)
				var_44_1.name = var_44_0
				var_44_1.transform.parent = arg_41_1.stage_.transform
				var_44_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.bgs_[var_44_0] = var_44_1
			end

			local var_44_2 = 2

			if var_44_2 < arg_41_1.time_ and arg_41_1.time_ <= var_44_2 + arg_44_0 then
				local var_44_3 = manager.ui.mainCamera.transform.localPosition
				local var_44_4 = Vector3.New(0, 0, 10) + Vector3.New(var_44_3.x, var_44_3.y, 0)
				local var_44_5 = arg_41_1.bgs_.F01a

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
					if iter_44_0 ~= "F01a" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = false

				arg_41_1:SetGaussion(false)
			end

			local var_44_17 = 2

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17
				local var_44_19 = Color.New(0, 0, 0)

				var_44_19.a = Mathf.Lerp(0, 1, var_44_18)
				arg_41_1.mask_.color = var_44_19
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 then
				local var_44_20 = Color.New(0, 0, 0)

				var_44_20.a = 1
				arg_41_1.mask_.color = var_44_20
			end

			local var_44_21 = 2

			if var_44_21 < arg_41_1.time_ and arg_41_1.time_ <= var_44_21 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = false

				arg_41_1:SetGaussion(false)
			end

			local var_44_22 = 2

			if var_44_21 <= arg_41_1.time_ and arg_41_1.time_ < var_44_21 + var_44_22 then
				local var_44_23 = (arg_41_1.time_ - var_44_21) / var_44_22
				local var_44_24 = Color.New(0, 0, 0)

				var_44_24.a = Mathf.Lerp(1, 0, var_44_23)
				arg_41_1.mask_.color = var_44_24
			end

			if arg_41_1.time_ >= var_44_21 + var_44_22 and arg_41_1.time_ < var_44_21 + var_44_22 + arg_44_0 then
				local var_44_25 = Color.New(0, 0, 0)
				local var_44_26 = 0

				arg_41_1.mask_.enabled = false
				var_44_25.a = var_44_26
				arg_41_1.mask_.color = var_44_25
			end

			local var_44_27 = 0
			local var_44_28 = 1

			if var_44_27 < arg_41_1.time_ and arg_41_1.time_ <= var_44_27 + arg_44_0 then
				local var_44_29 = "stop"
				local var_44_30 = "music"

				arg_41_1:AudioAction(var_44_29, var_44_30, "se_story_activity_1_5_3", "se_story_activity_1_5_3_rain_loop", "")
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_31 = 4
			local var_44_32 = 0.85

			if var_44_31 < arg_41_1.time_ and arg_41_1.time_ <= var_44_31 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_33 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_33:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_34 = arg_41_1:GetWordFromCfg(115271011)
				local var_44_35 = arg_41_1:FormatText(var_44_34.content)

				arg_41_1.text_.text = var_44_35

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_36 = 34
				local var_44_37 = utf8.len(var_44_35)
				local var_44_38 = var_44_36 <= 0 and var_44_32 or var_44_32 * (var_44_37 / var_44_36)

				if var_44_38 > 0 and var_44_32 < var_44_38 then
					arg_41_1.talkMaxDuration = var_44_38
					var_44_31 = var_44_31 + 0.3

					if var_44_38 + var_44_31 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_38 + var_44_31
					end
				end

				arg_41_1.text_.text = var_44_35
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_39 = var_44_31 + 0.3
			local var_44_40 = math.max(var_44_32, arg_41_1.talkMaxDuration)

			if var_44_39 <= arg_41_1.time_ and arg_41_1.time_ < var_44_39 + var_44_40 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_39) / var_44_40

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_39 + var_44_40 and arg_41_1.time_ < var_44_39 + var_44_40 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play115271012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115271012
		arg_47_1.duration_ = 3.8

		local var_47_0 = {
			ja = 1.7,
			ko = 2.3,
			zh = 2.4,
			en = 3.8
		}
		local var_47_1 = manager.audio:GetLocalizationFlag()

		if var_47_0[var_47_1] ~= nil then
			arg_47_1.duration_ = var_47_0[var_47_1]
		end

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play115271013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1041_1"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.imageGo_, arg_47_1.canvasGo_.transform)

				var_50_1.transform:SetSiblingIndex(1)

				var_50_1.name = var_50_0

				local var_50_2 = var_50_1:GetComponent(typeof(Image))

				var_50_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_50_0)

				var_50_2:SetNativeSize()

				var_50_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_47_1.actors_[var_50_0] = var_50_1
			end

			local var_50_3 = arg_47_1.actors_["1041_1"].transform
			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1.var_.moveOldPos1041_1 = var_50_3.localPosition
				var_50_3.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_50_5 = 0.001

			if var_50_4 <= arg_47_1.time_ and arg_47_1.time_ < var_50_4 + var_50_5 then
				local var_50_6 = (arg_47_1.time_ - var_50_4) / var_50_5
				local var_50_7 = Vector3.New(440, -310, -370)

				var_50_3.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1041_1, var_50_7, var_50_6)
			end

			if arg_47_1.time_ >= var_50_4 + var_50_5 and arg_47_1.time_ < var_50_4 + var_50_5 + arg_50_0 then
				var_50_3.localPosition = Vector3.New(440, -310, -370)
			end

			local var_50_8 = arg_47_1.actors_["1041_1"]
			local var_50_9 = 0

			if var_50_9 < arg_47_1.time_ and arg_47_1.time_ <= var_50_9 + arg_50_0 then
				local var_50_10 = var_50_8:GetComponent("Image")

				if var_50_10 then
					arg_47_1.var_.alphaMatValue1041_1 = var_50_10
					arg_47_1.var_.alphaOldValue1041_1 = var_50_10.color.a
				end

				arg_47_1.var_.alphaOldValue1041_1 = 0
			end

			local var_50_11 = 0.5

			if var_50_9 <= arg_47_1.time_ and arg_47_1.time_ < var_50_9 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_9) / var_50_11
				local var_50_13 = Mathf.Lerp(arg_47_1.var_.alphaOldValue1041_1, 1, var_50_12)

				if arg_47_1.var_.alphaMatValue1041_1 then
					local var_50_14 = arg_47_1.var_.alphaMatValue1041_1.color

					var_50_14.a = var_50_13
					arg_47_1.var_.alphaMatValue1041_1.color = var_50_14
				end
			end

			if arg_47_1.time_ >= var_50_9 + var_50_11 and arg_47_1.time_ < var_50_9 + var_50_11 + arg_50_0 and arg_47_1.var_.alphaMatValue1041_1 then
				local var_50_15 = arg_47_1.var_.alphaMatValue1041_1
				local var_50_16 = var_50_15.color

				var_50_16.a = 1
				var_50_15.color = var_50_16
			end

			local var_50_17 = arg_47_1.actors_["1041_1"]
			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				local var_50_19 = var_50_17:GetComponent("Image")

				if var_50_19 then
					arg_47_1.var_.highlightMatValue1041_1 = var_50_19
				end
			end

			local var_50_20 = 0.2

			if var_50_18 <= arg_47_1.time_ and arg_47_1.time_ < var_50_18 + var_50_20 then
				local var_50_21 = (arg_47_1.time_ - var_50_18) / var_50_20

				if arg_47_1.var_.highlightMatValue1041_1 then
					local var_50_22 = Mathf.Lerp(0.5, 1, var_50_21)
					local var_50_23 = arg_47_1.var_.highlightMatValue1041_1
					local var_50_24 = var_50_23.color

					var_50_24.r = var_50_22
					var_50_24.g = var_50_22
					var_50_24.b = var_50_22
					var_50_23.color = var_50_24
				end
			end

			if arg_47_1.time_ >= var_50_18 + var_50_20 and arg_47_1.time_ < var_50_18 + var_50_20 + arg_50_0 and arg_47_1.var_.highlightMatValue1041_1 then
				local var_50_25 = 1

				var_50_17.transform:SetSiblingIndex(1)

				local var_50_26 = arg_47_1.var_.highlightMatValue1041_1
				local var_50_27 = var_50_26.color

				var_50_27.r = var_50_25
				var_50_27.g = var_50_25
				var_50_27.b = var_50_25
				var_50_26.color = var_50_27
			end

			local var_50_28 = 0
			local var_50_29 = 0.3

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_30 = arg_47_1:FormatText(StoryNameCfg[208].name)

				arg_47_1.leftNameTxt_.text = var_50_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_31 = arg_47_1:GetWordFromCfg(115271012)
				local var_50_32 = arg_47_1:FormatText(var_50_31.content)

				arg_47_1.text_.text = var_50_32

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_33 = 12
				local var_50_34 = utf8.len(var_50_32)
				local var_50_35 = var_50_33 <= 0 and var_50_29 or var_50_29 * (var_50_34 / var_50_33)

				if var_50_35 > 0 and var_50_29 < var_50_35 then
					arg_47_1.talkMaxDuration = var_50_35

					if var_50_35 + var_50_28 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_35 + var_50_28
					end
				end

				arg_47_1.text_.text = var_50_32
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271012", "story_v_out_115271.awb") ~= 0 then
					local var_50_36 = manager.audio:GetVoiceLength("story_v_out_115271", "115271012", "story_v_out_115271.awb") / 1000

					if var_50_36 + var_50_28 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_36 + var_50_28
					end

					if var_50_31.prefab_name ~= "" and arg_47_1.actors_[var_50_31.prefab_name] ~= nil then
						local var_50_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_31.prefab_name].transform, "story_v_out_115271", "115271012", "story_v_out_115271.awb")

						arg_47_1:RecordAudio("115271012", var_50_37)
						arg_47_1:RecordAudio("115271012", var_50_37)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_115271", "115271012", "story_v_out_115271.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_115271", "115271012", "story_v_out_115271.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_38 = math.max(var_50_29, arg_47_1.talkMaxDuration)

			if var_50_28 <= arg_47_1.time_ and arg_47_1.time_ < var_50_28 + var_50_38 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_28) / var_50_38

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_28 + var_50_38 and arg_47_1.time_ < var_50_28 + var_50_38 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play115271013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115271013
		arg_51_1.duration_ = 9.333

		local var_51_0 = {
			ja = 6.733,
			ko = 6.266,
			zh = 5.2,
			en = 9.333
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
				arg_51_0:Play115271014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "1038"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_54_0), arg_51_1.canvasGo_.transform)

				var_54_1.transform:SetSiblingIndex(1)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_51_1.actors_[var_54_0] = var_54_1
			end

			local var_54_2 = arg_51_1.actors_["1038"].transform
			local var_54_3 = 0

			if var_54_3 < arg_51_1.time_ and arg_51_1.time_ <= var_54_3 + arg_54_0 then
				arg_51_1.var_.moveOldPos1038 = var_54_2.localPosition
				var_54_2.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1038", 2)

				local var_54_4 = var_54_2.childCount

				for iter_54_0 = 0, var_54_4 - 1 do
					local var_54_5 = var_54_2:GetChild(iter_54_0)

					if var_54_5.name == "split_1" or not string.find(var_54_5.name, "split") then
						var_54_5.gameObject:SetActive(true)
					else
						var_54_5.gameObject:SetActive(false)
					end
				end
			end

			local var_54_6 = 0.001

			if var_54_3 <= arg_51_1.time_ and arg_51_1.time_ < var_54_3 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_3) / var_54_6
				local var_54_8 = Vector3.New(-390, -400, 0)

				var_54_2.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1038, var_54_8, var_54_7)
			end

			if arg_51_1.time_ >= var_54_3 + var_54_6 and arg_51_1.time_ < var_54_3 + var_54_6 + arg_54_0 then
				var_54_2.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_54_9 = arg_51_1.actors_["1038"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				local var_54_11 = var_54_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_54_11 then
					arg_51_1.var_.alphaOldValue1038 = var_54_11.alpha
					arg_51_1.var_.characterEffect1038 = var_54_11
				end

				arg_51_1.var_.alphaOldValue1038 = 0
			end

			local var_54_12 = 0.5

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_12 then
				local var_54_13 = (arg_51_1.time_ - var_54_10) / var_54_12
				local var_54_14 = Mathf.Lerp(arg_51_1.var_.alphaOldValue1038, 1, var_54_13)

				if arg_51_1.var_.characterEffect1038 then
					arg_51_1.var_.characterEffect1038.alpha = var_54_14
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_12 and arg_51_1.time_ < var_54_10 + var_54_12 + arg_54_0 and arg_51_1.var_.characterEffect1038 then
				arg_51_1.var_.characterEffect1038.alpha = 1
			end

			local var_54_15 = arg_51_1.actors_["1038"]
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps1038 == nil then
				arg_51_1.var_.actorSpriteComps1038 = var_54_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_17 = 0.2

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17

				if arg_51_1.var_.actorSpriteComps1038 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_54_2 then
							local var_54_19 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_18)

							iter_54_2.color = Color.New(var_54_19, var_54_19, var_54_19)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 and arg_51_1.var_.actorSpriteComps1038 then
				local var_54_20 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_20, var_54_20, var_54_20)
					end
				end

				arg_51_1.var_.actorSpriteComps1038 = nil
			end

			local var_54_21 = arg_51_1.actors_["1041_1"]
			local var_54_22 = 0

			if var_54_22 < arg_51_1.time_ and arg_51_1.time_ <= var_54_22 + arg_54_0 then
				local var_54_23 = var_54_21:GetComponent("Image")

				if var_54_23 then
					arg_51_1.var_.highlightMatValue1041_1 = var_54_23
				end
			end

			local var_54_24 = 0.2

			if var_54_22 <= arg_51_1.time_ and arg_51_1.time_ < var_54_22 + var_54_24 then
				local var_54_25 = (arg_51_1.time_ - var_54_22) / var_54_24

				if arg_51_1.var_.highlightMatValue1041_1 then
					local var_54_26 = Mathf.Lerp(1, 0.5, var_54_25)
					local var_54_27 = arg_51_1.var_.highlightMatValue1041_1
					local var_54_28 = var_54_27.color

					var_54_28.r = var_54_26
					var_54_28.g = var_54_26
					var_54_28.b = var_54_26
					var_54_27.color = var_54_28
				end
			end

			if arg_51_1.time_ >= var_54_22 + var_54_24 and arg_51_1.time_ < var_54_22 + var_54_24 + arg_54_0 and arg_51_1.var_.highlightMatValue1041_1 then
				local var_54_29 = 0.5
				local var_54_30 = arg_51_1.var_.highlightMatValue1041_1
				local var_54_31 = var_54_30.color

				var_54_31.r = var_54_29
				var_54_31.g = var_54_29
				var_54_31.b = var_54_29
				var_54_30.color = var_54_31
			end

			local var_54_32 = 0
			local var_54_33 = 0.575

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_34 = arg_51_1:FormatText(StoryNameCfg[94].name)

				arg_51_1.leftNameTxt_.text = var_54_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_35 = arg_51_1:GetWordFromCfg(115271013)
				local var_54_36 = arg_51_1:FormatText(var_54_35.content)

				arg_51_1.text_.text = var_54_36

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_37 = 23
				local var_54_38 = utf8.len(var_54_36)
				local var_54_39 = var_54_37 <= 0 and var_54_33 or var_54_33 * (var_54_38 / var_54_37)

				if var_54_39 > 0 and var_54_33 < var_54_39 then
					arg_51_1.talkMaxDuration = var_54_39

					if var_54_39 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_39 + var_54_32
					end
				end

				arg_51_1.text_.text = var_54_36
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271013", "story_v_out_115271.awb") ~= 0 then
					local var_54_40 = manager.audio:GetVoiceLength("story_v_out_115271", "115271013", "story_v_out_115271.awb") / 1000

					if var_54_40 + var_54_32 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_40 + var_54_32
					end

					if var_54_35.prefab_name ~= "" and arg_51_1.actors_[var_54_35.prefab_name] ~= nil then
						local var_54_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_35.prefab_name].transform, "story_v_out_115271", "115271013", "story_v_out_115271.awb")

						arg_51_1:RecordAudio("115271013", var_54_41)
						arg_51_1:RecordAudio("115271013", var_54_41)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115271", "115271013", "story_v_out_115271.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115271", "115271013", "story_v_out_115271.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_42 = math.max(var_54_33, arg_51_1.talkMaxDuration)

			if var_54_32 <= arg_51_1.time_ and arg_51_1.time_ < var_54_32 + var_54_42 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_32) / var_54_42

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_32 + var_54_42 and arg_51_1.time_ < var_54_32 + var_54_42 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play115271014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115271014
		arg_55_1.duration_ = 16.6

		local var_55_0 = {
			ja = 10.366,
			ko = 14.566,
			zh = 12.233,
			en = 16.6
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
				arg_55_0:Play115271015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1038"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps1038 == nil then
				arg_55_1.var_.actorSpriteComps1038 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps1038 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps1038 then
				local var_58_5 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps1038 = nil
			end

			local var_58_6 = arg_55_1.actors_["1041_1"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				local var_58_8 = var_58_6:GetComponent("Image")

				if var_58_8 then
					arg_55_1.var_.highlightMatValue1041_1 = var_58_8
				end
			end

			local var_58_9 = 0.2

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_9 then
				local var_58_10 = (arg_55_1.time_ - var_58_7) / var_58_9

				if arg_55_1.var_.highlightMatValue1041_1 then
					local var_58_11 = Mathf.Lerp(0.5, 1, var_58_10)
					local var_58_12 = arg_55_1.var_.highlightMatValue1041_1
					local var_58_13 = var_58_12.color

					var_58_13.r = var_58_11
					var_58_13.g = var_58_11
					var_58_13.b = var_58_11
					var_58_12.color = var_58_13
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_9 and arg_55_1.time_ < var_58_7 + var_58_9 + arg_58_0 and arg_55_1.var_.highlightMatValue1041_1 then
				local var_58_14 = 1

				var_58_6.transform:SetSiblingIndex(1)

				local var_58_15 = arg_55_1.var_.highlightMatValue1041_1
				local var_58_16 = var_58_15.color

				var_58_16.r = var_58_14
				var_58_16.g = var_58_14
				var_58_16.b = var_58_14
				var_58_15.color = var_58_16
			end

			local var_58_17 = 0
			local var_58_18 = 1.475

			if var_58_17 < arg_55_1.time_ and arg_55_1.time_ <= var_58_17 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_19 = arg_55_1:FormatText(StoryNameCfg[208].name)

				arg_55_1.leftNameTxt_.text = var_58_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_20 = arg_55_1:GetWordFromCfg(115271014)
				local var_58_21 = arg_55_1:FormatText(var_58_20.content)

				arg_55_1.text_.text = var_58_21

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_22 = 59
				local var_58_23 = utf8.len(var_58_21)
				local var_58_24 = var_58_22 <= 0 and var_58_18 or var_58_18 * (var_58_23 / var_58_22)

				if var_58_24 > 0 and var_58_18 < var_58_24 then
					arg_55_1.talkMaxDuration = var_58_24

					if var_58_24 + var_58_17 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_24 + var_58_17
					end
				end

				arg_55_1.text_.text = var_58_21
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271014", "story_v_out_115271.awb") ~= 0 then
					local var_58_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271014", "story_v_out_115271.awb") / 1000

					if var_58_25 + var_58_17 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_25 + var_58_17
					end

					if var_58_20.prefab_name ~= "" and arg_55_1.actors_[var_58_20.prefab_name] ~= nil then
						local var_58_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_20.prefab_name].transform, "story_v_out_115271", "115271014", "story_v_out_115271.awb")

						arg_55_1:RecordAudio("115271014", var_58_26)
						arg_55_1:RecordAudio("115271014", var_58_26)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_115271", "115271014", "story_v_out_115271.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_115271", "115271014", "story_v_out_115271.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_27 = math.max(var_58_18, arg_55_1.talkMaxDuration)

			if var_58_17 <= arg_55_1.time_ and arg_55_1.time_ < var_58_17 + var_58_27 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_17) / var_58_27

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_17 + var_58_27 and arg_55_1.time_ < var_58_17 + var_58_27 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115271015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 115271015
		arg_59_1.duration_ = 11.166

		local var_59_0 = {
			ja = 11.166,
			ko = 7.133,
			zh = 6.466,
			en = 7.866
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
				arg_59_0:Play115271016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.85

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[208].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(115271015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 34
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271015", "story_v_out_115271.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271015", "story_v_out_115271.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_115271", "115271015", "story_v_out_115271.awb")

						arg_59_1:RecordAudio("115271015", var_62_9)
						arg_59_1:RecordAudio("115271015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_115271", "115271015", "story_v_out_115271.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_115271", "115271015", "story_v_out_115271.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play115271016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 115271016
		arg_63_1.duration_ = 9.1

		local var_63_0 = {
			ja = 6.666,
			ko = 9.1,
			zh = 8.4,
			en = 8.3
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
				arg_63_0:Play115271017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1038"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps1038 == nil then
				arg_63_1.var_.actorSpriteComps1038 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps1038 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 1, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps1038 then
				local var_66_5 = 1

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps1038 = nil
			end

			local var_66_6 = arg_63_1.actors_["1041_1"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 then
				local var_66_8 = var_66_6:GetComponent("Image")

				if var_66_8 then
					arg_63_1.var_.highlightMatValue1041_1 = var_66_8
				end
			end

			local var_66_9 = 0.2

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_7) / var_66_9

				if arg_63_1.var_.highlightMatValue1041_1 then
					local var_66_11 = Mathf.Lerp(1, 0.5, var_66_10)
					local var_66_12 = arg_63_1.var_.highlightMatValue1041_1
					local var_66_13 = var_66_12.color

					var_66_13.r = var_66_11
					var_66_13.g = var_66_11
					var_66_13.b = var_66_11
					var_66_12.color = var_66_13
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_9 and arg_63_1.time_ < var_66_7 + var_66_9 + arg_66_0 and arg_63_1.var_.highlightMatValue1041_1 then
				local var_66_14 = 0.5
				local var_66_15 = arg_63_1.var_.highlightMatValue1041_1
				local var_66_16 = var_66_15.color

				var_66_16.r = var_66_14
				var_66_16.g = var_66_14
				var_66_16.b = var_66_14
				var_66_15.color = var_66_16
			end

			local var_66_17 = 0
			local var_66_18 = 0.9

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_19 = arg_63_1:FormatText(StoryNameCfg[94].name)

				arg_63_1.leftNameTxt_.text = var_66_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_20 = arg_63_1:GetWordFromCfg(115271016)
				local var_66_21 = arg_63_1:FormatText(var_66_20.content)

				arg_63_1.text_.text = var_66_21

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_22 = 36
				local var_66_23 = utf8.len(var_66_21)
				local var_66_24 = var_66_22 <= 0 and var_66_18 or var_66_18 * (var_66_23 / var_66_22)

				if var_66_24 > 0 and var_66_18 < var_66_24 then
					arg_63_1.talkMaxDuration = var_66_24

					if var_66_24 + var_66_17 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_24 + var_66_17
					end
				end

				arg_63_1.text_.text = var_66_21
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271016", "story_v_out_115271.awb") ~= 0 then
					local var_66_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271016", "story_v_out_115271.awb") / 1000

					if var_66_25 + var_66_17 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_25 + var_66_17
					end

					if var_66_20.prefab_name ~= "" and arg_63_1.actors_[var_66_20.prefab_name] ~= nil then
						local var_66_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_20.prefab_name].transform, "story_v_out_115271", "115271016", "story_v_out_115271.awb")

						arg_63_1:RecordAudio("115271016", var_66_26)
						arg_63_1:RecordAudio("115271016", var_66_26)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_115271", "115271016", "story_v_out_115271.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_115271", "115271016", "story_v_out_115271.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_27 = math.max(var_66_18, arg_63_1.talkMaxDuration)

			if var_66_17 <= arg_63_1.time_ and arg_63_1.time_ < var_66_17 + var_66_27 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_17) / var_66_27

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_17 + var_66_27 and arg_63_1.time_ < var_66_17 + var_66_27 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play115271017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 115271017
		arg_67_1.duration_ = 7.166

		local var_67_0 = {
			ja = 7.166,
			ko = 2.733,
			zh = 3.466,
			en = 2.933
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
				arg_67_0:Play115271018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1038"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps1038 == nil then
				arg_67_1.var_.actorSpriteComps1038 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps1038 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 0.5, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps1038 then
				local var_70_5 = 0.5

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps1038 = nil
			end

			local var_70_6 = arg_67_1.actors_["1041_1"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				local var_70_8 = var_70_6:GetComponent("Image")

				if var_70_8 then
					arg_67_1.var_.highlightMatValue1041_1 = var_70_8
				end
			end

			local var_70_9 = 0.2

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_7) / var_70_9

				if arg_67_1.var_.highlightMatValue1041_1 then
					local var_70_11 = Mathf.Lerp(0.5, 1, var_70_10)
					local var_70_12 = arg_67_1.var_.highlightMatValue1041_1
					local var_70_13 = var_70_12.color

					var_70_13.r = var_70_11
					var_70_13.g = var_70_11
					var_70_13.b = var_70_11
					var_70_12.color = var_70_13
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_9 and arg_67_1.time_ < var_70_7 + var_70_9 + arg_70_0 and arg_67_1.var_.highlightMatValue1041_1 then
				local var_70_14 = 1

				var_70_6.transform:SetSiblingIndex(1)

				local var_70_15 = arg_67_1.var_.highlightMatValue1041_1
				local var_70_16 = var_70_15.color

				var_70_16.r = var_70_14
				var_70_16.g = var_70_14
				var_70_16.b = var_70_14
				var_70_15.color = var_70_16
			end

			local var_70_17 = 0
			local var_70_18 = 0.425

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_19 = arg_67_1:FormatText(StoryNameCfg[208].name)

				arg_67_1.leftNameTxt_.text = var_70_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_20 = arg_67_1:GetWordFromCfg(115271017)
				local var_70_21 = arg_67_1:FormatText(var_70_20.content)

				arg_67_1.text_.text = var_70_21

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_22 = 17
				local var_70_23 = utf8.len(var_70_21)
				local var_70_24 = var_70_22 <= 0 and var_70_18 or var_70_18 * (var_70_23 / var_70_22)

				if var_70_24 > 0 and var_70_18 < var_70_24 then
					arg_67_1.talkMaxDuration = var_70_24

					if var_70_24 + var_70_17 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_24 + var_70_17
					end
				end

				arg_67_1.text_.text = var_70_21
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271017", "story_v_out_115271.awb") ~= 0 then
					local var_70_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271017", "story_v_out_115271.awb") / 1000

					if var_70_25 + var_70_17 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_25 + var_70_17
					end

					if var_70_20.prefab_name ~= "" and arg_67_1.actors_[var_70_20.prefab_name] ~= nil then
						local var_70_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_20.prefab_name].transform, "story_v_out_115271", "115271017", "story_v_out_115271.awb")

						arg_67_1:RecordAudio("115271017", var_70_26)
						arg_67_1:RecordAudio("115271017", var_70_26)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_115271", "115271017", "story_v_out_115271.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_115271", "115271017", "story_v_out_115271.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_27 = math.max(var_70_18, arg_67_1.talkMaxDuration)

			if var_70_17 <= arg_67_1.time_ and arg_67_1.time_ < var_70_17 + var_70_27 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_17) / var_70_27

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_17 + var_70_27 and arg_67_1.time_ < var_70_17 + var_70_27 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play115271018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 115271018
		arg_71_1.duration_ = 9.533

		local var_71_0 = {
			ja = 9.533,
			ko = 6.7,
			zh = 8.4,
			en = 7.166
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
				arg_71_0:Play115271019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1038"].transform
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.var_.moveOldPos1038 = var_74_0.localPosition
				var_74_0.localScale = Vector3.New(1, 1, 1)

				arg_71_1:CheckSpriteTmpPos("1038", 2)

				local var_74_2 = var_74_0.childCount

				for iter_74_0 = 0, var_74_2 - 1 do
					local var_74_3 = var_74_0:GetChild(iter_74_0)

					if var_74_3.name == "split_2" or not string.find(var_74_3.name, "split") then
						var_74_3.gameObject:SetActive(true)
					else
						var_74_3.gameObject:SetActive(false)
					end
				end
			end

			local var_74_4 = 0.001

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_4 then
				local var_74_5 = (arg_71_1.time_ - var_74_1) / var_74_4
				local var_74_6 = Vector3.New(-390, -400, 0)

				var_74_0.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos1038, var_74_6, var_74_5)
			end

			if arg_71_1.time_ >= var_74_1 + var_74_4 and arg_71_1.time_ < var_74_1 + var_74_4 + arg_74_0 then
				var_74_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_74_7 = arg_71_1.actors_["1038"]
			local var_74_8 = 0

			if var_74_8 < arg_71_1.time_ and arg_71_1.time_ <= var_74_8 + arg_74_0 and arg_71_1.var_.actorSpriteComps1038 == nil then
				arg_71_1.var_.actorSpriteComps1038 = var_74_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_9 = 0.2

			if var_74_8 <= arg_71_1.time_ and arg_71_1.time_ < var_74_8 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_8) / var_74_9

				if arg_71_1.var_.actorSpriteComps1038 then
					for iter_74_1, iter_74_2 in pairs(arg_71_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_74_2 then
							local var_74_11 = Mathf.Lerp(iter_74_2.color.r, 1, var_74_10)

							iter_74_2.color = Color.New(var_74_11, var_74_11, var_74_11)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_8 + var_74_9 and arg_71_1.time_ < var_74_8 + var_74_9 + arg_74_0 and arg_71_1.var_.actorSpriteComps1038 then
				local var_74_12 = 1

				for iter_74_3, iter_74_4 in pairs(arg_71_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_74_4 then
						iter_74_4.color = Color.New(var_74_12, var_74_12, var_74_12)
					end
				end

				arg_71_1.var_.actorSpriteComps1038 = nil
			end

			local var_74_13 = arg_71_1.actors_["1041_1"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 then
				local var_74_15 = var_74_13:GetComponent("Image")

				if var_74_15 then
					arg_71_1.var_.highlightMatValue1041_1 = var_74_15
				end
			end

			local var_74_16 = 0.2

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_16 then
				local var_74_17 = (arg_71_1.time_ - var_74_14) / var_74_16

				if arg_71_1.var_.highlightMatValue1041_1 then
					local var_74_18 = Mathf.Lerp(1, 0.5, var_74_17)
					local var_74_19 = arg_71_1.var_.highlightMatValue1041_1
					local var_74_20 = var_74_19.color

					var_74_20.r = var_74_18
					var_74_20.g = var_74_18
					var_74_20.b = var_74_18
					var_74_19.color = var_74_20
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_16 and arg_71_1.time_ < var_74_14 + var_74_16 + arg_74_0 and arg_71_1.var_.highlightMatValue1041_1 then
				local var_74_21 = 0.5
				local var_74_22 = arg_71_1.var_.highlightMatValue1041_1
				local var_74_23 = var_74_22.color

				var_74_23.r = var_74_21
				var_74_23.g = var_74_21
				var_74_23.b = var_74_21
				var_74_22.color = var_74_23
			end

			local var_74_24 = arg_71_1.actors_["1038"]
			local var_74_25 = 0

			if var_74_25 < arg_71_1.time_ and arg_71_1.time_ <= var_74_25 + arg_74_0 and arg_71_1.var_.actorSpriteComps1038 == nil then
				arg_71_1.var_.actorSpriteComps1038 = var_74_24:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_26 = 0.0166666666666667

			if var_74_25 <= arg_71_1.time_ and arg_71_1.time_ < var_74_25 + var_74_26 then
				local var_74_27 = (arg_71_1.time_ - var_74_25) / var_74_26

				if arg_71_1.var_.actorSpriteComps1038 then
					for iter_74_5, iter_74_6 in pairs(arg_71_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_74_6 then
							local var_74_28 = Mathf.Lerp(iter_74_6.color.r, 1, var_74_27)

							iter_74_6.color = Color.New(var_74_28, var_74_28, var_74_28)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_25 + var_74_26 and arg_71_1.time_ < var_74_25 + var_74_26 + arg_74_0 and arg_71_1.var_.actorSpriteComps1038 then
				local var_74_29 = 1

				for iter_74_7, iter_74_8 in pairs(arg_71_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_74_8 then
						iter_74_8.color = Color.New(var_74_29, var_74_29, var_74_29)
					end
				end

				arg_71_1.var_.actorSpriteComps1038 = nil
			end

			local var_74_30 = 0
			local var_74_31 = 0.775

			if var_74_30 < arg_71_1.time_ and arg_71_1.time_ <= var_74_30 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_32 = arg_71_1:FormatText(StoryNameCfg[94].name)

				arg_71_1.leftNameTxt_.text = var_74_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_33 = arg_71_1:GetWordFromCfg(115271018)
				local var_74_34 = arg_71_1:FormatText(var_74_33.content)

				arg_71_1.text_.text = var_74_34

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_35 = 31
				local var_74_36 = utf8.len(var_74_34)
				local var_74_37 = var_74_35 <= 0 and var_74_31 or var_74_31 * (var_74_36 / var_74_35)

				if var_74_37 > 0 and var_74_31 < var_74_37 then
					arg_71_1.talkMaxDuration = var_74_37

					if var_74_37 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_37 + var_74_30
					end
				end

				arg_71_1.text_.text = var_74_34
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271018", "story_v_out_115271.awb") ~= 0 then
					local var_74_38 = manager.audio:GetVoiceLength("story_v_out_115271", "115271018", "story_v_out_115271.awb") / 1000

					if var_74_38 + var_74_30 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_38 + var_74_30
					end

					if var_74_33.prefab_name ~= "" and arg_71_1.actors_[var_74_33.prefab_name] ~= nil then
						local var_74_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_33.prefab_name].transform, "story_v_out_115271", "115271018", "story_v_out_115271.awb")

						arg_71_1:RecordAudio("115271018", var_74_39)
						arg_71_1:RecordAudio("115271018", var_74_39)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_115271", "115271018", "story_v_out_115271.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_115271", "115271018", "story_v_out_115271.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_40 = math.max(var_74_31, arg_71_1.talkMaxDuration)

			if var_74_30 <= arg_71_1.time_ and arg_71_1.time_ < var_74_30 + var_74_40 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_30) / var_74_40

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_30 + var_74_40 and arg_71_1.time_ < var_74_30 + var_74_40 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play115271019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 115271019
		arg_75_1.duration_ = 8.2

		local var_75_0 = {
			ja = 8.2,
			ko = 8.033,
			zh = 7.4,
			en = 4.1
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
				arg_75_0:Play115271020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1038"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1038 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1038", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_1" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -400, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1038, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_78_7 = 0
			local var_78_8 = 0.7

			if var_78_7 < arg_75_1.time_ and arg_75_1.time_ <= var_78_7 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_9 = arg_75_1:FormatText(StoryNameCfg[94].name)

				arg_75_1.leftNameTxt_.text = var_78_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_10 = arg_75_1:GetWordFromCfg(115271019)
				local var_78_11 = arg_75_1:FormatText(var_78_10.content)

				arg_75_1.text_.text = var_78_11

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_12 = 28
				local var_78_13 = utf8.len(var_78_11)
				local var_78_14 = var_78_12 <= 0 and var_78_8 or var_78_8 * (var_78_13 / var_78_12)

				if var_78_14 > 0 and var_78_8 < var_78_14 then
					arg_75_1.talkMaxDuration = var_78_14

					if var_78_14 + var_78_7 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_7
					end
				end

				arg_75_1.text_.text = var_78_11
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271019", "story_v_out_115271.awb") ~= 0 then
					local var_78_15 = manager.audio:GetVoiceLength("story_v_out_115271", "115271019", "story_v_out_115271.awb") / 1000

					if var_78_15 + var_78_7 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_15 + var_78_7
					end

					if var_78_10.prefab_name ~= "" and arg_75_1.actors_[var_78_10.prefab_name] ~= nil then
						local var_78_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_10.prefab_name].transform, "story_v_out_115271", "115271019", "story_v_out_115271.awb")

						arg_75_1:RecordAudio("115271019", var_78_16)
						arg_75_1:RecordAudio("115271019", var_78_16)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_115271", "115271019", "story_v_out_115271.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_115271", "115271019", "story_v_out_115271.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_17 = math.max(var_78_8, arg_75_1.talkMaxDuration)

			if var_78_7 <= arg_75_1.time_ and arg_75_1.time_ < var_78_7 + var_78_17 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_7) / var_78_17

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_7 + var_78_17 and arg_75_1.time_ < var_78_7 + var_78_17 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play115271020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 115271020
		arg_79_1.duration_ = 6.5

		local var_79_0 = {
			ja = 5.2,
			ko = 6.5,
			zh = 6.266,
			en = 6.133
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
				arg_79_0:Play115271021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1038"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps1038 == nil then
				arg_79_1.var_.actorSpriteComps1038 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps1038 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 0.5, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps1038 then
				local var_82_5 = 0.5

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps1038 = nil
			end

			local var_82_6 = arg_79_1.actors_["1041_1"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 then
				local var_82_8 = var_82_6:GetComponent("Image")

				if var_82_8 then
					arg_79_1.var_.highlightMatValue1041_1 = var_82_8
				end
			end

			local var_82_9 = 0.2

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_7) / var_82_9

				if arg_79_1.var_.highlightMatValue1041_1 then
					local var_82_11 = Mathf.Lerp(0.5, 1, var_82_10)
					local var_82_12 = arg_79_1.var_.highlightMatValue1041_1
					local var_82_13 = var_82_12.color

					var_82_13.r = var_82_11
					var_82_13.g = var_82_11
					var_82_13.b = var_82_11
					var_82_12.color = var_82_13
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_9 and arg_79_1.time_ < var_82_7 + var_82_9 + arg_82_0 and arg_79_1.var_.highlightMatValue1041_1 then
				local var_82_14 = 1

				var_82_6.transform:SetSiblingIndex(1)

				local var_82_15 = arg_79_1.var_.highlightMatValue1041_1
				local var_82_16 = var_82_15.color

				var_82_16.r = var_82_14
				var_82_16.g = var_82_14
				var_82_16.b = var_82_14
				var_82_15.color = var_82_16
			end

			local var_82_17 = 0
			local var_82_18 = 0.675

			if var_82_17 < arg_79_1.time_ and arg_79_1.time_ <= var_82_17 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_19 = arg_79_1:FormatText(StoryNameCfg[208].name)

				arg_79_1.leftNameTxt_.text = var_82_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_20 = arg_79_1:GetWordFromCfg(115271020)
				local var_82_21 = arg_79_1:FormatText(var_82_20.content)

				arg_79_1.text_.text = var_82_21

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_22 = 27
				local var_82_23 = utf8.len(var_82_21)
				local var_82_24 = var_82_22 <= 0 and var_82_18 or var_82_18 * (var_82_23 / var_82_22)

				if var_82_24 > 0 and var_82_18 < var_82_24 then
					arg_79_1.talkMaxDuration = var_82_24

					if var_82_24 + var_82_17 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_24 + var_82_17
					end
				end

				arg_79_1.text_.text = var_82_21
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271020", "story_v_out_115271.awb") ~= 0 then
					local var_82_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271020", "story_v_out_115271.awb") / 1000

					if var_82_25 + var_82_17 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_25 + var_82_17
					end

					if var_82_20.prefab_name ~= "" and arg_79_1.actors_[var_82_20.prefab_name] ~= nil then
						local var_82_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_20.prefab_name].transform, "story_v_out_115271", "115271020", "story_v_out_115271.awb")

						arg_79_1:RecordAudio("115271020", var_82_26)
						arg_79_1:RecordAudio("115271020", var_82_26)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_115271", "115271020", "story_v_out_115271.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_115271", "115271020", "story_v_out_115271.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_27 = math.max(var_82_18, arg_79_1.talkMaxDuration)

			if var_82_17 <= arg_79_1.time_ and arg_79_1.time_ < var_82_17 + var_82_27 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_17) / var_82_27

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_17 + var_82_27 and arg_79_1.time_ < var_82_17 + var_82_27 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play115271021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 115271021
		arg_83_1.duration_ = 13.4

		local var_83_0 = {
			ja = 13.4,
			ko = 12.466,
			zh = 12.333,
			en = 12.6
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
				arg_83_0:Play115271022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1.425

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[208].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(115271021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 57
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271021", "story_v_out_115271.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271021", "story_v_out_115271.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_115271", "115271021", "story_v_out_115271.awb")

						arg_83_1:RecordAudio("115271021", var_86_9)
						arg_83_1:RecordAudio("115271021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_115271", "115271021", "story_v_out_115271.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_115271", "115271021", "story_v_out_115271.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play115271022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115271022
		arg_87_1.duration_ = 12.233

		local var_87_0 = {
			ja = 8.7,
			ko = 7.5,
			zh = 8.8,
			en = 12.233
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
				arg_87_0:Play115271023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.175

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[208].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(115271022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 47
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271022", "story_v_out_115271.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271022", "story_v_out_115271.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_115271", "115271022", "story_v_out_115271.awb")

						arg_87_1:RecordAudio("115271022", var_90_9)
						arg_87_1:RecordAudio("115271022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_115271", "115271022", "story_v_out_115271.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_115271", "115271022", "story_v_out_115271.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play115271023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 115271023
		arg_91_1.duration_ = 2.866

		local var_91_0 = {
			ja = 2.866,
			ko = 2.6,
			zh = 2.866,
			en = 2.466
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
				arg_91_0:Play115271024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1038"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps1038 == nil then
				arg_91_1.var_.actorSpriteComps1038 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps1038 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 1, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps1038 then
				local var_94_5 = 1

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps1038 = nil
			end

			local var_94_6 = arg_91_1.actors_["1041_1"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 then
				local var_94_8 = var_94_6:GetComponent("Image")

				if var_94_8 then
					arg_91_1.var_.highlightMatValue1041_1 = var_94_8
				end
			end

			local var_94_9 = 0.2

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_9 then
				local var_94_10 = (arg_91_1.time_ - var_94_7) / var_94_9

				if arg_91_1.var_.highlightMatValue1041_1 then
					local var_94_11 = Mathf.Lerp(1, 0.5, var_94_10)
					local var_94_12 = arg_91_1.var_.highlightMatValue1041_1
					local var_94_13 = var_94_12.color

					var_94_13.r = var_94_11
					var_94_13.g = var_94_11
					var_94_13.b = var_94_11
					var_94_12.color = var_94_13
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_9 and arg_91_1.time_ < var_94_7 + var_94_9 + arg_94_0 and arg_91_1.var_.highlightMatValue1041_1 then
				local var_94_14 = 0.5
				local var_94_15 = arg_91_1.var_.highlightMatValue1041_1
				local var_94_16 = var_94_15.color

				var_94_16.r = var_94_14
				var_94_16.g = var_94_14
				var_94_16.b = var_94_14
				var_94_15.color = var_94_16
			end

			local var_94_17 = arg_91_1.actors_["1038"].transform
			local var_94_18 = 0

			if var_94_18 < arg_91_1.time_ and arg_91_1.time_ <= var_94_18 + arg_94_0 then
				arg_91_1.var_.moveOldPos1038 = var_94_17.localPosition
				var_94_17.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("1038", 2)

				local var_94_19 = var_94_17.childCount

				for iter_94_4 = 0, var_94_19 - 1 do
					local var_94_20 = var_94_17:GetChild(iter_94_4)

					if var_94_20.name == "split_9" or not string.find(var_94_20.name, "split") then
						var_94_20.gameObject:SetActive(true)
					else
						var_94_20.gameObject:SetActive(false)
					end
				end
			end

			local var_94_21 = 0.001

			if var_94_18 <= arg_91_1.time_ and arg_91_1.time_ < var_94_18 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_18) / var_94_21
				local var_94_23 = Vector3.New(-390, -400, 0)

				var_94_17.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1038, var_94_23, var_94_22)
			end

			if arg_91_1.time_ >= var_94_18 + var_94_21 and arg_91_1.time_ < var_94_18 + var_94_21 + arg_94_0 then
				var_94_17.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_94_24 = 0
			local var_94_25 = 0.2

			if var_94_24 < arg_91_1.time_ and arg_91_1.time_ <= var_94_24 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_26 = arg_91_1:FormatText(StoryNameCfg[94].name)

				arg_91_1.leftNameTxt_.text = var_94_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_27 = arg_91_1:GetWordFromCfg(115271023)
				local var_94_28 = arg_91_1:FormatText(var_94_27.content)

				arg_91_1.text_.text = var_94_28

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_29 = 8
				local var_94_30 = utf8.len(var_94_28)
				local var_94_31 = var_94_29 <= 0 and var_94_25 or var_94_25 * (var_94_30 / var_94_29)

				if var_94_31 > 0 and var_94_25 < var_94_31 then
					arg_91_1.talkMaxDuration = var_94_31

					if var_94_31 + var_94_24 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_31 + var_94_24
					end
				end

				arg_91_1.text_.text = var_94_28
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271023", "story_v_out_115271.awb") ~= 0 then
					local var_94_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271023", "story_v_out_115271.awb") / 1000

					if var_94_32 + var_94_24 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_32 + var_94_24
					end

					if var_94_27.prefab_name ~= "" and arg_91_1.actors_[var_94_27.prefab_name] ~= nil then
						local var_94_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_27.prefab_name].transform, "story_v_out_115271", "115271023", "story_v_out_115271.awb")

						arg_91_1:RecordAudio("115271023", var_94_33)
						arg_91_1:RecordAudio("115271023", var_94_33)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_115271", "115271023", "story_v_out_115271.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_115271", "115271023", "story_v_out_115271.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_34 = math.max(var_94_25, arg_91_1.talkMaxDuration)

			if var_94_24 <= arg_91_1.time_ and arg_91_1.time_ < var_94_24 + var_94_34 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_24) / var_94_34

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_24 + var_94_34 and arg_91_1.time_ < var_94_24 + var_94_34 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play115271024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 115271024
		arg_95_1.duration_ = 11.9

		local var_95_0 = {
			ja = 11.9,
			ko = 4.533,
			zh = 6.4,
			en = 5.6
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
				arg_95_0:Play115271025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.675

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[94].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(115271024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 27
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271024", "story_v_out_115271.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271024", "story_v_out_115271.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_115271", "115271024", "story_v_out_115271.awb")

						arg_95_1:RecordAudio("115271024", var_98_9)
						arg_95_1:RecordAudio("115271024", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_115271", "115271024", "story_v_out_115271.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_115271", "115271024", "story_v_out_115271.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play115271025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 115271025
		arg_99_1.duration_ = 13.6

		local var_99_0 = {
			ja = 10.1,
			ko = 9.833,
			zh = 8.333,
			en = 13.6
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
				arg_99_0:Play115271026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1038"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps1038 == nil then
				arg_99_1.var_.actorSpriteComps1038 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps1038 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 0.5, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps1038 then
				local var_102_5 = 0.5

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps1038 = nil
			end

			local var_102_6 = arg_99_1.actors_["1041_1"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 then
				local var_102_8 = var_102_6:GetComponent("Image")

				if var_102_8 then
					arg_99_1.var_.highlightMatValue1041_1 = var_102_8
				end
			end

			local var_102_9 = 0.2

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_9 then
				local var_102_10 = (arg_99_1.time_ - var_102_7) / var_102_9

				if arg_99_1.var_.highlightMatValue1041_1 then
					local var_102_11 = Mathf.Lerp(0.5, 1, var_102_10)
					local var_102_12 = arg_99_1.var_.highlightMatValue1041_1
					local var_102_13 = var_102_12.color

					var_102_13.r = var_102_11
					var_102_13.g = var_102_11
					var_102_13.b = var_102_11
					var_102_12.color = var_102_13
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_9 and arg_99_1.time_ < var_102_7 + var_102_9 + arg_102_0 and arg_99_1.var_.highlightMatValue1041_1 then
				local var_102_14 = 1

				var_102_6.transform:SetSiblingIndex(1)

				local var_102_15 = arg_99_1.var_.highlightMatValue1041_1
				local var_102_16 = var_102_15.color

				var_102_16.r = var_102_14
				var_102_16.g = var_102_14
				var_102_16.b = var_102_14
				var_102_15.color = var_102_16
			end

			local var_102_17 = 0
			local var_102_18 = 0.95

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_19 = arg_99_1:FormatText(StoryNameCfg[208].name)

				arg_99_1.leftNameTxt_.text = var_102_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_20 = arg_99_1:GetWordFromCfg(115271025)
				local var_102_21 = arg_99_1:FormatText(var_102_20.content)

				arg_99_1.text_.text = var_102_21

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_22 = 38
				local var_102_23 = utf8.len(var_102_21)
				local var_102_24 = var_102_22 <= 0 and var_102_18 or var_102_18 * (var_102_23 / var_102_22)

				if var_102_24 > 0 and var_102_18 < var_102_24 then
					arg_99_1.talkMaxDuration = var_102_24

					if var_102_24 + var_102_17 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_24 + var_102_17
					end
				end

				arg_99_1.text_.text = var_102_21
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271025", "story_v_out_115271.awb") ~= 0 then
					local var_102_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271025", "story_v_out_115271.awb") / 1000

					if var_102_25 + var_102_17 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_25 + var_102_17
					end

					if var_102_20.prefab_name ~= "" and arg_99_1.actors_[var_102_20.prefab_name] ~= nil then
						local var_102_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_20.prefab_name].transform, "story_v_out_115271", "115271025", "story_v_out_115271.awb")

						arg_99_1:RecordAudio("115271025", var_102_26)
						arg_99_1:RecordAudio("115271025", var_102_26)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_115271", "115271025", "story_v_out_115271.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_115271", "115271025", "story_v_out_115271.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_27 = math.max(var_102_18, arg_99_1.talkMaxDuration)

			if var_102_17 <= arg_99_1.time_ and arg_99_1.time_ < var_102_17 + var_102_27 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_17) / var_102_27

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_17 + var_102_27 and arg_99_1.time_ < var_102_17 + var_102_27 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play115271026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 115271026
		arg_103_1.duration_ = 14

		local var_103_0 = {
			ja = 14,
			ko = 12.5,
			zh = 12,
			en = 12.866
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
				arg_103_0:Play115271027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.6

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[208].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(115271026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 64
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271026", "story_v_out_115271.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271026", "story_v_out_115271.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_115271", "115271026", "story_v_out_115271.awb")

						arg_103_1:RecordAudio("115271026", var_106_9)
						arg_103_1:RecordAudio("115271026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_115271", "115271026", "story_v_out_115271.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_115271", "115271026", "story_v_out_115271.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play115271027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 115271027
		arg_107_1.duration_ = 15.533

		local var_107_0 = {
			ja = 10.6,
			ko = 10.833,
			zh = 10.933,
			en = 15.533
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
				arg_107_0:Play115271028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1.375

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[208].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(115271027)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 55
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271027", "story_v_out_115271.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271027", "story_v_out_115271.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_115271", "115271027", "story_v_out_115271.awb")

						arg_107_1:RecordAudio("115271027", var_110_9)
						arg_107_1:RecordAudio("115271027", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_115271", "115271027", "story_v_out_115271.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_115271", "115271027", "story_v_out_115271.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play115271028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 115271028
		arg_111_1.duration_ = 6.3

		local var_111_0 = {
			ja = 6.3,
			ko = 3.266,
			zh = 4.233,
			en = 3.266
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
				arg_111_0:Play115271029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1038"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1038 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("1038", 2)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_5" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(-390, -400, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1038, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_114_7 = arg_111_1.actors_["1038"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps1038 == nil then
				arg_111_1.var_.actorSpriteComps1038 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.2

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps1038 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps1038 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps1038 = nil
			end

			local var_114_13 = arg_111_1.actors_["1041_1"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				local var_114_15 = var_114_13:GetComponent("Image")

				if var_114_15 then
					arg_111_1.var_.highlightMatValue1041_1 = var_114_15
				end
			end

			local var_114_16 = 0.2

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_16 then
				local var_114_17 = (arg_111_1.time_ - var_114_14) / var_114_16

				if arg_111_1.var_.highlightMatValue1041_1 then
					local var_114_18 = Mathf.Lerp(1, 0.5, var_114_17)
					local var_114_19 = arg_111_1.var_.highlightMatValue1041_1
					local var_114_20 = var_114_19.color

					var_114_20.r = var_114_18
					var_114_20.g = var_114_18
					var_114_20.b = var_114_18
					var_114_19.color = var_114_20
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_16 and arg_111_1.time_ < var_114_14 + var_114_16 + arg_114_0 and arg_111_1.var_.highlightMatValue1041_1 then
				local var_114_21 = 0.5
				local var_114_22 = arg_111_1.var_.highlightMatValue1041_1
				local var_114_23 = var_114_22.color

				var_114_23.r = var_114_21
				var_114_23.g = var_114_21
				var_114_23.b = var_114_21
				var_114_22.color = var_114_23
			end

			local var_114_24 = 0
			local var_114_25 = 0.25

			if var_114_24 < arg_111_1.time_ and arg_111_1.time_ <= var_114_24 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_26 = arg_111_1:FormatText(StoryNameCfg[94].name)

				arg_111_1.leftNameTxt_.text = var_114_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_27 = arg_111_1:GetWordFromCfg(115271028)
				local var_114_28 = arg_111_1:FormatText(var_114_27.content)

				arg_111_1.text_.text = var_114_28

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_29 = 10
				local var_114_30 = utf8.len(var_114_28)
				local var_114_31 = var_114_29 <= 0 and var_114_25 or var_114_25 * (var_114_30 / var_114_29)

				if var_114_31 > 0 and var_114_25 < var_114_31 then
					arg_111_1.talkMaxDuration = var_114_31

					if var_114_31 + var_114_24 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_31 + var_114_24
					end
				end

				arg_111_1.text_.text = var_114_28
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271028", "story_v_out_115271.awb") ~= 0 then
					local var_114_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271028", "story_v_out_115271.awb") / 1000

					if var_114_32 + var_114_24 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_32 + var_114_24
					end

					if var_114_27.prefab_name ~= "" and arg_111_1.actors_[var_114_27.prefab_name] ~= nil then
						local var_114_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_27.prefab_name].transform, "story_v_out_115271", "115271028", "story_v_out_115271.awb")

						arg_111_1:RecordAudio("115271028", var_114_33)
						arg_111_1:RecordAudio("115271028", var_114_33)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_115271", "115271028", "story_v_out_115271.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_115271", "115271028", "story_v_out_115271.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_34 = math.max(var_114_25, arg_111_1.talkMaxDuration)

			if var_114_24 <= arg_111_1.time_ and arg_111_1.time_ < var_114_24 + var_114_34 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_24) / var_114_34

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_24 + var_114_34 and arg_111_1.time_ < var_114_24 + var_114_34 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play115271029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 115271029
		arg_115_1.duration_ = 3.8

		local var_115_0 = {
			ja = 3.1,
			ko = 2.633,
			zh = 2.733,
			en = 3.8
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
				arg_115_0:Play115271030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1038"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps1038 == nil then
				arg_115_1.var_.actorSpriteComps1038 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps1038 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 0.5, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps1038 then
				local var_118_5 = 0.5

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps1038 = nil
			end

			local var_118_6 = arg_115_1.actors_["1041_1"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 then
				local var_118_8 = var_118_6:GetComponent("Image")

				if var_118_8 then
					arg_115_1.var_.highlightMatValue1041_1 = var_118_8
				end
			end

			local var_118_9 = 0.2

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_7) / var_118_9

				if arg_115_1.var_.highlightMatValue1041_1 then
					local var_118_11 = Mathf.Lerp(0.5, 1, var_118_10)
					local var_118_12 = arg_115_1.var_.highlightMatValue1041_1
					local var_118_13 = var_118_12.color

					var_118_13.r = var_118_11
					var_118_13.g = var_118_11
					var_118_13.b = var_118_11
					var_118_12.color = var_118_13
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_9 and arg_115_1.time_ < var_118_7 + var_118_9 + arg_118_0 and arg_115_1.var_.highlightMatValue1041_1 then
				local var_118_14 = 1

				var_118_6.transform:SetSiblingIndex(1)

				local var_118_15 = arg_115_1.var_.highlightMatValue1041_1
				local var_118_16 = var_118_15.color

				var_118_16.r = var_118_14
				var_118_16.g = var_118_14
				var_118_16.b = var_118_14
				var_118_15.color = var_118_16
			end

			local var_118_17 = 0
			local var_118_18 = 0.3

			if var_118_17 < arg_115_1.time_ and arg_115_1.time_ <= var_118_17 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_19 = arg_115_1:FormatText(StoryNameCfg[208].name)

				arg_115_1.leftNameTxt_.text = var_118_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_20 = arg_115_1:GetWordFromCfg(115271029)
				local var_118_21 = arg_115_1:FormatText(var_118_20.content)

				arg_115_1.text_.text = var_118_21

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_22 = 12
				local var_118_23 = utf8.len(var_118_21)
				local var_118_24 = var_118_22 <= 0 and var_118_18 or var_118_18 * (var_118_23 / var_118_22)

				if var_118_24 > 0 and var_118_18 < var_118_24 then
					arg_115_1.talkMaxDuration = var_118_24

					if var_118_24 + var_118_17 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_24 + var_118_17
					end
				end

				arg_115_1.text_.text = var_118_21
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271029", "story_v_out_115271.awb") ~= 0 then
					local var_118_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271029", "story_v_out_115271.awb") / 1000

					if var_118_25 + var_118_17 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_25 + var_118_17
					end

					if var_118_20.prefab_name ~= "" and arg_115_1.actors_[var_118_20.prefab_name] ~= nil then
						local var_118_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_20.prefab_name].transform, "story_v_out_115271", "115271029", "story_v_out_115271.awb")

						arg_115_1:RecordAudio("115271029", var_118_26)
						arg_115_1:RecordAudio("115271029", var_118_26)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_115271", "115271029", "story_v_out_115271.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_115271", "115271029", "story_v_out_115271.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_27 = math.max(var_118_18, arg_115_1.talkMaxDuration)

			if var_118_17 <= arg_115_1.time_ and arg_115_1.time_ < var_118_17 + var_118_27 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_17) / var_118_27

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_17 + var_118_27 and arg_115_1.time_ < var_118_17 + var_118_27 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play115271030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 115271030
		arg_119_1.duration_ = 11.566

		local var_119_0 = {
			ja = 10.2,
			ko = 8.4,
			zh = 8.366,
			en = 11.566
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
				arg_119_0:Play115271031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1038"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1038 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("1038", 2)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "split_1" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(-390, -400, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1038, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_122_7 = arg_119_1.actors_["1038"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps1038 == nil then
				arg_119_1.var_.actorSpriteComps1038 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.2

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps1038 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps1038 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps1038 = nil
			end

			local var_122_13 = arg_119_1.actors_["1041_1"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				local var_122_15 = var_122_13:GetComponent("Image")

				if var_122_15 then
					arg_119_1.var_.highlightMatValue1041_1 = var_122_15
				end
			end

			local var_122_16 = 0.2

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_16 then
				local var_122_17 = (arg_119_1.time_ - var_122_14) / var_122_16

				if arg_119_1.var_.highlightMatValue1041_1 then
					local var_122_18 = Mathf.Lerp(1, 0.5, var_122_17)
					local var_122_19 = arg_119_1.var_.highlightMatValue1041_1
					local var_122_20 = var_122_19.color

					var_122_20.r = var_122_18
					var_122_20.g = var_122_18
					var_122_20.b = var_122_18
					var_122_19.color = var_122_20
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_16 and arg_119_1.time_ < var_122_14 + var_122_16 + arg_122_0 and arg_119_1.var_.highlightMatValue1041_1 then
				local var_122_21 = 0.5
				local var_122_22 = arg_119_1.var_.highlightMatValue1041_1
				local var_122_23 = var_122_22.color

				var_122_23.r = var_122_21
				var_122_23.g = var_122_21
				var_122_23.b = var_122_21
				var_122_22.color = var_122_23
			end

			local var_122_24 = 0
			local var_122_25 = 0.8

			if var_122_24 < arg_119_1.time_ and arg_119_1.time_ <= var_122_24 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_26 = arg_119_1:FormatText(StoryNameCfg[94].name)

				arg_119_1.leftNameTxt_.text = var_122_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_27 = arg_119_1:GetWordFromCfg(115271030)
				local var_122_28 = arg_119_1:FormatText(var_122_27.content)

				arg_119_1.text_.text = var_122_28

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_29 = 32
				local var_122_30 = utf8.len(var_122_28)
				local var_122_31 = var_122_29 <= 0 and var_122_25 or var_122_25 * (var_122_30 / var_122_29)

				if var_122_31 > 0 and var_122_25 < var_122_31 then
					arg_119_1.talkMaxDuration = var_122_31

					if var_122_31 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_31 + var_122_24
					end
				end

				arg_119_1.text_.text = var_122_28
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271030", "story_v_out_115271.awb") ~= 0 then
					local var_122_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271030", "story_v_out_115271.awb") / 1000

					if var_122_32 + var_122_24 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_32 + var_122_24
					end

					if var_122_27.prefab_name ~= "" and arg_119_1.actors_[var_122_27.prefab_name] ~= nil then
						local var_122_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_27.prefab_name].transform, "story_v_out_115271", "115271030", "story_v_out_115271.awb")

						arg_119_1:RecordAudio("115271030", var_122_33)
						arg_119_1:RecordAudio("115271030", var_122_33)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_115271", "115271030", "story_v_out_115271.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_115271", "115271030", "story_v_out_115271.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_34 = math.max(var_122_25, arg_119_1.talkMaxDuration)

			if var_122_24 <= arg_119_1.time_ and arg_119_1.time_ < var_122_24 + var_122_34 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_24) / var_122_34

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_24 + var_122_34 and arg_119_1.time_ < var_122_24 + var_122_34 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play115271031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 115271031
		arg_123_1.duration_ = 4.933

		local var_123_0 = {
			ja = 3.666,
			ko = 4,
			zh = 4.433,
			en = 4.933
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
				arg_123_0:Play115271032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1038"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps1038 == nil then
				arg_123_1.var_.actorSpriteComps1038 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps1038 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 0.5, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps1038 then
				local var_126_5 = 0.5

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps1038 = nil
			end

			local var_126_6 = arg_123_1.actors_["1041_1"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				local var_126_8 = var_126_6:GetComponent("Image")

				if var_126_8 then
					arg_123_1.var_.highlightMatValue1041_1 = var_126_8
				end
			end

			local var_126_9 = 0.2

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_7) / var_126_9

				if arg_123_1.var_.highlightMatValue1041_1 then
					local var_126_11 = Mathf.Lerp(0.5, 1, var_126_10)
					local var_126_12 = arg_123_1.var_.highlightMatValue1041_1
					local var_126_13 = var_126_12.color

					var_126_13.r = var_126_11
					var_126_13.g = var_126_11
					var_126_13.b = var_126_11
					var_126_12.color = var_126_13
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_9 and arg_123_1.time_ < var_126_7 + var_126_9 + arg_126_0 and arg_123_1.var_.highlightMatValue1041_1 then
				local var_126_14 = 1

				var_126_6.transform:SetSiblingIndex(1)

				local var_126_15 = arg_123_1.var_.highlightMatValue1041_1
				local var_126_16 = var_126_15.color

				var_126_16.r = var_126_14
				var_126_16.g = var_126_14
				var_126_16.b = var_126_14
				var_126_15.color = var_126_16
			end

			local var_126_17 = 0
			local var_126_18 = 0.4

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_19 = arg_123_1:FormatText(StoryNameCfg[208].name)

				arg_123_1.leftNameTxt_.text = var_126_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_20 = arg_123_1:GetWordFromCfg(115271031)
				local var_126_21 = arg_123_1:FormatText(var_126_20.content)

				arg_123_1.text_.text = var_126_21

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_22 = 16
				local var_126_23 = utf8.len(var_126_21)
				local var_126_24 = var_126_22 <= 0 and var_126_18 or var_126_18 * (var_126_23 / var_126_22)

				if var_126_24 > 0 and var_126_18 < var_126_24 then
					arg_123_1.talkMaxDuration = var_126_24

					if var_126_24 + var_126_17 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_24 + var_126_17
					end
				end

				arg_123_1.text_.text = var_126_21
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271031", "story_v_out_115271.awb") ~= 0 then
					local var_126_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271031", "story_v_out_115271.awb") / 1000

					if var_126_25 + var_126_17 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_25 + var_126_17
					end

					if var_126_20.prefab_name ~= "" and arg_123_1.actors_[var_126_20.prefab_name] ~= nil then
						local var_126_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_20.prefab_name].transform, "story_v_out_115271", "115271031", "story_v_out_115271.awb")

						arg_123_1:RecordAudio("115271031", var_126_26)
						arg_123_1:RecordAudio("115271031", var_126_26)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_115271", "115271031", "story_v_out_115271.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_115271", "115271031", "story_v_out_115271.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_27 = math.max(var_126_18, arg_123_1.talkMaxDuration)

			if var_126_17 <= arg_123_1.time_ and arg_123_1.time_ < var_126_17 + var_126_27 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_17) / var_126_27

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_17 + var_126_27 and arg_123_1.time_ < var_126_17 + var_126_27 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play115271032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 115271032
		arg_127_1.duration_ = 12.1

		local var_127_0 = {
			ja = 9.366,
			ko = 8.766,
			zh = 9.266,
			en = 12.1
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
				arg_127_0:Play115271033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 1.25

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[208].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(115271032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271032", "story_v_out_115271.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271032", "story_v_out_115271.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_115271", "115271032", "story_v_out_115271.awb")

						arg_127_1:RecordAudio("115271032", var_130_9)
						arg_127_1:RecordAudio("115271032", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_115271", "115271032", "story_v_out_115271.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_115271", "115271032", "story_v_out_115271.awb")
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
	Play115271033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 115271033
		arg_131_1.duration_ = 6

		local var_131_0 = {
			ja = 6,
			ko = 5.666,
			zh = 5.833,
			en = 4.7
		}
		local var_131_1 = manager.audio:GetLocalizationFlag()

		if var_131_0[var_131_1] ~= nil then
			arg_131_1.duration_ = var_131_0[var_131_1]
		end

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play115271034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1038"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.actorSpriteComps1038 == nil then
				arg_131_1.var_.actorSpriteComps1038 = var_134_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.actorSpriteComps1038 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_134_1 then
							local var_134_4 = Mathf.Lerp(iter_134_1.color.r, 1, var_134_3)

							iter_134_1.color = Color.New(var_134_4, var_134_4, var_134_4)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.actorSpriteComps1038 then
				local var_134_5 = 1

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_5, var_134_5, var_134_5)
					end
				end

				arg_131_1.var_.actorSpriteComps1038 = nil
			end

			local var_134_6 = arg_131_1.actors_["1041_1"]
			local var_134_7 = 0

			if var_134_7 < arg_131_1.time_ and arg_131_1.time_ <= var_134_7 + arg_134_0 then
				local var_134_8 = var_134_6:GetComponent("Image")

				if var_134_8 then
					arg_131_1.var_.highlightMatValue1041_1 = var_134_8
				end
			end

			local var_134_9 = 0.2

			if var_134_7 <= arg_131_1.time_ and arg_131_1.time_ < var_134_7 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_7) / var_134_9

				if arg_131_1.var_.highlightMatValue1041_1 then
					local var_134_11 = Mathf.Lerp(1, 0.5, var_134_10)
					local var_134_12 = arg_131_1.var_.highlightMatValue1041_1
					local var_134_13 = var_134_12.color

					var_134_13.r = var_134_11
					var_134_13.g = var_134_11
					var_134_13.b = var_134_11
					var_134_12.color = var_134_13
				end
			end

			if arg_131_1.time_ >= var_134_7 + var_134_9 and arg_131_1.time_ < var_134_7 + var_134_9 + arg_134_0 and arg_131_1.var_.highlightMatValue1041_1 then
				local var_134_14 = 0.5
				local var_134_15 = arg_131_1.var_.highlightMatValue1041_1
				local var_134_16 = var_134_15.color

				var_134_16.r = var_134_14
				var_134_16.g = var_134_14
				var_134_16.b = var_134_14
				var_134_15.color = var_134_16
			end

			local var_134_17 = arg_131_1.actors_["1038"].transform
			local var_134_18 = 0

			if var_134_18 < arg_131_1.time_ and arg_131_1.time_ <= var_134_18 + arg_134_0 then
				arg_131_1.var_.moveOldPos1038 = var_134_17.localPosition
				var_134_17.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("1038", 2)

				local var_134_19 = var_134_17.childCount

				for iter_134_4 = 0, var_134_19 - 1 do
					local var_134_20 = var_134_17:GetChild(iter_134_4)

					if var_134_20.name == "split_2" or not string.find(var_134_20.name, "split") then
						var_134_20.gameObject:SetActive(true)
					else
						var_134_20.gameObject:SetActive(false)
					end
				end
			end

			local var_134_21 = 0.001

			if var_134_18 <= arg_131_1.time_ and arg_131_1.time_ < var_134_18 + var_134_21 then
				local var_134_22 = (arg_131_1.time_ - var_134_18) / var_134_21
				local var_134_23 = Vector3.New(-390, -400, 0)

				var_134_17.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos1038, var_134_23, var_134_22)
			end

			if arg_131_1.time_ >= var_134_18 + var_134_21 and arg_131_1.time_ < var_134_18 + var_134_21 + arg_134_0 then
				var_134_17.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_134_24 = 0
			local var_134_25 = 0.575

			if var_134_24 < arg_131_1.time_ and arg_131_1.time_ <= var_134_24 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_26 = arg_131_1:FormatText(StoryNameCfg[94].name)

				arg_131_1.leftNameTxt_.text = var_134_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_27 = arg_131_1:GetWordFromCfg(115271033)
				local var_134_28 = arg_131_1:FormatText(var_134_27.content)

				arg_131_1.text_.text = var_134_28

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_29 = 23
				local var_134_30 = utf8.len(var_134_28)
				local var_134_31 = var_134_29 <= 0 and var_134_25 or var_134_25 * (var_134_30 / var_134_29)

				if var_134_31 > 0 and var_134_25 < var_134_31 then
					arg_131_1.talkMaxDuration = var_134_31

					if var_134_31 + var_134_24 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_31 + var_134_24
					end
				end

				arg_131_1.text_.text = var_134_28
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271033", "story_v_out_115271.awb") ~= 0 then
					local var_134_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271033", "story_v_out_115271.awb") / 1000

					if var_134_32 + var_134_24 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_32 + var_134_24
					end

					if var_134_27.prefab_name ~= "" and arg_131_1.actors_[var_134_27.prefab_name] ~= nil then
						local var_134_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_27.prefab_name].transform, "story_v_out_115271", "115271033", "story_v_out_115271.awb")

						arg_131_1:RecordAudio("115271033", var_134_33)
						arg_131_1:RecordAudio("115271033", var_134_33)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_115271", "115271033", "story_v_out_115271.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_115271", "115271033", "story_v_out_115271.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_34 = math.max(var_134_25, arg_131_1.talkMaxDuration)

			if var_134_24 <= arg_131_1.time_ and arg_131_1.time_ < var_134_24 + var_134_34 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_24) / var_134_34

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_24 + var_134_34 and arg_131_1.time_ < var_134_24 + var_134_34 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play115271034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 115271034
		arg_135_1.duration_ = 11.133

		local var_135_0 = {
			ja = 11.133,
			ko = 7.633,
			zh = 7.333,
			en = 9.666
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
				arg_135_0:Play115271035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1038"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1038 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("1038", 2)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_7" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(-390, -400, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1038, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_138_7 = arg_135_1.actors_["1038"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps1038 == nil then
				arg_135_1.var_.actorSpriteComps1038 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 0.034

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps1038 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_138_2 then
							local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 1, var_138_10)

							iter_138_2.color = Color.New(var_138_11, var_138_11, var_138_11)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps1038 then
				local var_138_12 = 1

				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_138_4 then
						iter_138_4.color = Color.New(var_138_12, var_138_12, var_138_12)
					end
				end

				arg_135_1.var_.actorSpriteComps1038 = nil
			end

			local var_138_13 = 0
			local var_138_14 = 0.75

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_15 = arg_135_1:FormatText(StoryNameCfg[94].name)

				arg_135_1.leftNameTxt_.text = var_138_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_16 = arg_135_1:GetWordFromCfg(115271034)
				local var_138_17 = arg_135_1:FormatText(var_138_16.content)

				arg_135_1.text_.text = var_138_17

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_18 = 30
				local var_138_19 = utf8.len(var_138_17)
				local var_138_20 = var_138_18 <= 0 and var_138_14 or var_138_14 * (var_138_19 / var_138_18)

				if var_138_20 > 0 and var_138_14 < var_138_20 then
					arg_135_1.talkMaxDuration = var_138_20

					if var_138_20 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_13
					end
				end

				arg_135_1.text_.text = var_138_17
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271034", "story_v_out_115271.awb") ~= 0 then
					local var_138_21 = manager.audio:GetVoiceLength("story_v_out_115271", "115271034", "story_v_out_115271.awb") / 1000

					if var_138_21 + var_138_13 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_21 + var_138_13
					end

					if var_138_16.prefab_name ~= "" and arg_135_1.actors_[var_138_16.prefab_name] ~= nil then
						local var_138_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_16.prefab_name].transform, "story_v_out_115271", "115271034", "story_v_out_115271.awb")

						arg_135_1:RecordAudio("115271034", var_138_22)
						arg_135_1:RecordAudio("115271034", var_138_22)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_115271", "115271034", "story_v_out_115271.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_115271", "115271034", "story_v_out_115271.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_23 = math.max(var_138_14, arg_135_1.talkMaxDuration)

			if var_138_13 <= arg_135_1.time_ and arg_135_1.time_ < var_138_13 + var_138_23 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_13) / var_138_23

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_13 + var_138_23 and arg_135_1.time_ < var_138_13 + var_138_23 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play115271035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 115271035
		arg_139_1.duration_ = 9.933

		local var_139_0 = {
			ja = 9.933,
			ko = 7.4,
			zh = 9.733,
			en = 7.633
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
				arg_139_0:Play115271036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1038"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1038 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1038", 2)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "split_1" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(-390, -400, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1038, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_142_7 = 0
			local var_142_8 = 0.8

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_9 = arg_139_1:FormatText(StoryNameCfg[94].name)

				arg_139_1.leftNameTxt_.text = var_142_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_10 = arg_139_1:GetWordFromCfg(115271035)
				local var_142_11 = arg_139_1:FormatText(var_142_10.content)

				arg_139_1.text_.text = var_142_11

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_12 = 32
				local var_142_13 = utf8.len(var_142_11)
				local var_142_14 = var_142_12 <= 0 and var_142_8 or var_142_8 * (var_142_13 / var_142_12)

				if var_142_14 > 0 and var_142_8 < var_142_14 then
					arg_139_1.talkMaxDuration = var_142_14

					if var_142_14 + var_142_7 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_14 + var_142_7
					end
				end

				arg_139_1.text_.text = var_142_11
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271035", "story_v_out_115271.awb") ~= 0 then
					local var_142_15 = manager.audio:GetVoiceLength("story_v_out_115271", "115271035", "story_v_out_115271.awb") / 1000

					if var_142_15 + var_142_7 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_15 + var_142_7
					end

					if var_142_10.prefab_name ~= "" and arg_139_1.actors_[var_142_10.prefab_name] ~= nil then
						local var_142_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_10.prefab_name].transform, "story_v_out_115271", "115271035", "story_v_out_115271.awb")

						arg_139_1:RecordAudio("115271035", var_142_16)
						arg_139_1:RecordAudio("115271035", var_142_16)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_115271", "115271035", "story_v_out_115271.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_115271", "115271035", "story_v_out_115271.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_17 = math.max(var_142_8, arg_139_1.talkMaxDuration)

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_17 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_7) / var_142_17

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_7 + var_142_17 and arg_139_1.time_ < var_142_7 + var_142_17 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play115271036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 115271036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play115271037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1038"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.actorSpriteComps1038 == nil then
				arg_143_1.var_.actorSpriteComps1038 = var_146_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.actorSpriteComps1038 then
					for iter_146_0, iter_146_1 in pairs(arg_143_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_146_1 then
							local var_146_4 = Mathf.Lerp(iter_146_1.color.r, 0.5, var_146_3)

							iter_146_1.color = Color.New(var_146_4, var_146_4, var_146_4)
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.actorSpriteComps1038 then
				local var_146_5 = 0.5

				for iter_146_2, iter_146_3 in pairs(arg_143_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_146_3 then
						iter_146_3.color = Color.New(var_146_5, var_146_5, var_146_5)
					end
				end

				arg_143_1.var_.actorSpriteComps1038 = nil
			end

			local var_146_6 = 0
			local var_146_7 = 0.625

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_8 = arg_143_1:GetWordFromCfg(115271036)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 25
				local var_146_11 = utf8.len(var_146_9)
				local var_146_12 = var_146_10 <= 0 and var_146_7 or var_146_7 * (var_146_11 / var_146_10)

				if var_146_12 > 0 and var_146_7 < var_146_12 then
					arg_143_1.talkMaxDuration = var_146_12

					if var_146_12 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_9
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_13 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_13 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_13

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_13 and arg_143_1.time_ < var_146_6 + var_146_13 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play115271037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 115271037
		arg_147_1.duration_ = 12

		local var_147_0 = {
			ja = 7.266,
			ko = 8.5,
			zh = 7.333,
			en = 12
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
				arg_147_0:Play115271038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1041_1"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				local var_150_2 = var_150_0:GetComponent("Image")

				if var_150_2 then
					arg_147_1.var_.highlightMatValue1041_1 = var_150_2
				end
			end

			local var_150_3 = 0.2

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_1) / var_150_3

				if arg_147_1.var_.highlightMatValue1041_1 then
					local var_150_5 = Mathf.Lerp(0.5, 1, var_150_4)
					local var_150_6 = arg_147_1.var_.highlightMatValue1041_1
					local var_150_7 = var_150_6.color

					var_150_7.r = var_150_5
					var_150_7.g = var_150_5
					var_150_7.b = var_150_5
					var_150_6.color = var_150_7
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_3 and arg_147_1.time_ < var_150_1 + var_150_3 + arg_150_0 and arg_147_1.var_.highlightMatValue1041_1 then
				local var_150_8 = 1

				var_150_0.transform:SetSiblingIndex(1)

				local var_150_9 = arg_147_1.var_.highlightMatValue1041_1
				local var_150_10 = var_150_9.color

				var_150_10.r = var_150_8
				var_150_10.g = var_150_8
				var_150_10.b = var_150_8
				var_150_9.color = var_150_10
			end

			local var_150_11 = 0
			local var_150_12 = 0.9

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_13 = arg_147_1:FormatText(StoryNameCfg[208].name)

				arg_147_1.leftNameTxt_.text = var_150_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_14 = arg_147_1:GetWordFromCfg(115271037)
				local var_150_15 = arg_147_1:FormatText(var_150_14.content)

				arg_147_1.text_.text = var_150_15

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_16 = 36
				local var_150_17 = utf8.len(var_150_15)
				local var_150_18 = var_150_16 <= 0 and var_150_12 or var_150_12 * (var_150_17 / var_150_16)

				if var_150_18 > 0 and var_150_12 < var_150_18 then
					arg_147_1.talkMaxDuration = var_150_18

					if var_150_18 + var_150_11 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_11
					end
				end

				arg_147_1.text_.text = var_150_15
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271037", "story_v_out_115271.awb") ~= 0 then
					local var_150_19 = manager.audio:GetVoiceLength("story_v_out_115271", "115271037", "story_v_out_115271.awb") / 1000

					if var_150_19 + var_150_11 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_11
					end

					if var_150_14.prefab_name ~= "" and arg_147_1.actors_[var_150_14.prefab_name] ~= nil then
						local var_150_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_14.prefab_name].transform, "story_v_out_115271", "115271037", "story_v_out_115271.awb")

						arg_147_1:RecordAudio("115271037", var_150_20)
						arg_147_1:RecordAudio("115271037", var_150_20)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_115271", "115271037", "story_v_out_115271.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_115271", "115271037", "story_v_out_115271.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_21 = math.max(var_150_12, arg_147_1.talkMaxDuration)

			if var_150_11 <= arg_147_1.time_ and arg_147_1.time_ < var_150_11 + var_150_21 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_11) / var_150_21

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_11 + var_150_21 and arg_147_1.time_ < var_150_11 + var_150_21 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play115271038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 115271038
		arg_151_1.duration_ = 8.766

		local var_151_0 = {
			ja = 8.766,
			ko = 5.1,
			zh = 5.1,
			en = 6.8
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
				arg_151_0:Play115271039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.525

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[208].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(115271038)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271038", "story_v_out_115271.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271038", "story_v_out_115271.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_115271", "115271038", "story_v_out_115271.awb")

						arg_151_1:RecordAudio("115271038", var_154_9)
						arg_151_1:RecordAudio("115271038", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_115271", "115271038", "story_v_out_115271.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_115271", "115271038", "story_v_out_115271.awb")
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
	Play115271039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 115271039
		arg_155_1.duration_ = 8.5

		local var_155_0 = {
			ja = 4.533,
			ko = 5.566,
			zh = 8.5,
			en = 6.2
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play115271040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1038"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1038 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("1038", 2)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "split_9" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(-390, -400, 0)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1038, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_158_7 = arg_155_1.actors_["1038"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1038 == nil then
				arg_155_1.var_.actorSpriteComps1038 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 0.2

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps1038 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_158_2 then
							local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

							iter_158_2.color = Color.New(var_158_11, var_158_11, var_158_11)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps1038 then
				local var_158_12 = 1

				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_158_4 then
						iter_158_4.color = Color.New(var_158_12, var_158_12, var_158_12)
					end
				end

				arg_155_1.var_.actorSpriteComps1038 = nil
			end

			local var_158_13 = arg_155_1.actors_["1041_1"]
			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				local var_158_15 = var_158_13:GetComponent("Image")

				if var_158_15 then
					arg_155_1.var_.highlightMatValue1041_1 = var_158_15
				end
			end

			local var_158_16 = 0.2

			if var_158_14 <= arg_155_1.time_ and arg_155_1.time_ < var_158_14 + var_158_16 then
				local var_158_17 = (arg_155_1.time_ - var_158_14) / var_158_16

				if arg_155_1.var_.highlightMatValue1041_1 then
					local var_158_18 = Mathf.Lerp(1, 0.5, var_158_17)
					local var_158_19 = arg_155_1.var_.highlightMatValue1041_1
					local var_158_20 = var_158_19.color

					var_158_20.r = var_158_18
					var_158_20.g = var_158_18
					var_158_20.b = var_158_18
					var_158_19.color = var_158_20
				end
			end

			if arg_155_1.time_ >= var_158_14 + var_158_16 and arg_155_1.time_ < var_158_14 + var_158_16 + arg_158_0 and arg_155_1.var_.highlightMatValue1041_1 then
				local var_158_21 = 0.5
				local var_158_22 = arg_155_1.var_.highlightMatValue1041_1
				local var_158_23 = var_158_22.color

				var_158_23.r = var_158_21
				var_158_23.g = var_158_21
				var_158_23.b = var_158_21
				var_158_22.color = var_158_23
			end

			local var_158_24 = 0
			local var_158_25 = 0.725

			if var_158_24 < arg_155_1.time_ and arg_155_1.time_ <= var_158_24 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_26 = arg_155_1:FormatText(StoryNameCfg[94].name)

				arg_155_1.leftNameTxt_.text = var_158_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_27 = arg_155_1:GetWordFromCfg(115271039)
				local var_158_28 = arg_155_1:FormatText(var_158_27.content)

				arg_155_1.text_.text = var_158_28

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_29 = 29
				local var_158_30 = utf8.len(var_158_28)
				local var_158_31 = var_158_29 <= 0 and var_158_25 or var_158_25 * (var_158_30 / var_158_29)

				if var_158_31 > 0 and var_158_25 < var_158_31 then
					arg_155_1.talkMaxDuration = var_158_31

					if var_158_31 + var_158_24 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_31 + var_158_24
					end
				end

				arg_155_1.text_.text = var_158_28
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271039", "story_v_out_115271.awb") ~= 0 then
					local var_158_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271039", "story_v_out_115271.awb") / 1000

					if var_158_32 + var_158_24 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_32 + var_158_24
					end

					if var_158_27.prefab_name ~= "" and arg_155_1.actors_[var_158_27.prefab_name] ~= nil then
						local var_158_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_27.prefab_name].transform, "story_v_out_115271", "115271039", "story_v_out_115271.awb")

						arg_155_1:RecordAudio("115271039", var_158_33)
						arg_155_1:RecordAudio("115271039", var_158_33)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_115271", "115271039", "story_v_out_115271.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_115271", "115271039", "story_v_out_115271.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_34 = math.max(var_158_25, arg_155_1.talkMaxDuration)

			if var_158_24 <= arg_155_1.time_ and arg_155_1.time_ < var_158_24 + var_158_34 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_24) / var_158_34

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_24 + var_158_34 and arg_155_1.time_ < var_158_24 + var_158_34 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play115271040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 115271040
		arg_159_1.duration_ = 14.033

		local var_159_0 = {
			ja = 14.033,
			ko = 11.233,
			zh = 11.866,
			en = 11.566
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
				arg_159_0:Play115271041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.175

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[94].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(115271040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271040", "story_v_out_115271.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271040", "story_v_out_115271.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_115271", "115271040", "story_v_out_115271.awb")

						arg_159_1:RecordAudio("115271040", var_162_9)
						arg_159_1:RecordAudio("115271040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_115271", "115271040", "story_v_out_115271.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_115271", "115271040", "story_v_out_115271.awb")
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
	Play115271041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 115271041
		arg_163_1.duration_ = 2.433

		local var_163_0 = {
			ja = 1.766,
			ko = 1.533,
			zh = 1.233,
			en = 2.433
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
				arg_163_0:Play115271042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1038"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.actorSpriteComps1038 == nil then
				arg_163_1.var_.actorSpriteComps1038 = var_166_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_2 = 0.2

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.actorSpriteComps1038 then
					for iter_166_0, iter_166_1 in pairs(arg_163_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_166_1 then
							local var_166_4 = Mathf.Lerp(iter_166_1.color.r, 0.5, var_166_3)

							iter_166_1.color = Color.New(var_166_4, var_166_4, var_166_4)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.actorSpriteComps1038 then
				local var_166_5 = 0.5

				for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_166_3 then
						iter_166_3.color = Color.New(var_166_5, var_166_5, var_166_5)
					end
				end

				arg_163_1.var_.actorSpriteComps1038 = nil
			end

			local var_166_6 = arg_163_1.actors_["1041_1"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 then
				local var_166_8 = var_166_6:GetComponent("Image")

				if var_166_8 then
					arg_163_1.var_.highlightMatValue1041_1 = var_166_8
				end
			end

			local var_166_9 = 0.2

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_9 then
				local var_166_10 = (arg_163_1.time_ - var_166_7) / var_166_9

				if arg_163_1.var_.highlightMatValue1041_1 then
					local var_166_11 = Mathf.Lerp(0.5, 1, var_166_10)
					local var_166_12 = arg_163_1.var_.highlightMatValue1041_1
					local var_166_13 = var_166_12.color

					var_166_13.r = var_166_11
					var_166_13.g = var_166_11
					var_166_13.b = var_166_11
					var_166_12.color = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_9 and arg_163_1.time_ < var_166_7 + var_166_9 + arg_166_0 and arg_163_1.var_.highlightMatValue1041_1 then
				local var_166_14 = 1

				var_166_6.transform:SetSiblingIndex(1)

				local var_166_15 = arg_163_1.var_.highlightMatValue1041_1
				local var_166_16 = var_166_15.color

				var_166_16.r = var_166_14
				var_166_16.g = var_166_14
				var_166_16.b = var_166_14
				var_166_15.color = var_166_16
			end

			local var_166_17 = 0
			local var_166_18 = 0.125

			if var_166_17 < arg_163_1.time_ and arg_163_1.time_ <= var_166_17 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_19 = arg_163_1:FormatText(StoryNameCfg[208].name)

				arg_163_1.leftNameTxt_.text = var_166_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_20 = arg_163_1:GetWordFromCfg(115271041)
				local var_166_21 = arg_163_1:FormatText(var_166_20.content)

				arg_163_1.text_.text = var_166_21

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_22 = 5
				local var_166_23 = utf8.len(var_166_21)
				local var_166_24 = var_166_22 <= 0 and var_166_18 or var_166_18 * (var_166_23 / var_166_22)

				if var_166_24 > 0 and var_166_18 < var_166_24 then
					arg_163_1.talkMaxDuration = var_166_24

					if var_166_24 + var_166_17 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_24 + var_166_17
					end
				end

				arg_163_1.text_.text = var_166_21
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271041", "story_v_out_115271.awb") ~= 0 then
					local var_166_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271041", "story_v_out_115271.awb") / 1000

					if var_166_25 + var_166_17 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_25 + var_166_17
					end

					if var_166_20.prefab_name ~= "" and arg_163_1.actors_[var_166_20.prefab_name] ~= nil then
						local var_166_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_20.prefab_name].transform, "story_v_out_115271", "115271041", "story_v_out_115271.awb")

						arg_163_1:RecordAudio("115271041", var_166_26)
						arg_163_1:RecordAudio("115271041", var_166_26)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_115271", "115271041", "story_v_out_115271.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_115271", "115271041", "story_v_out_115271.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_27 = math.max(var_166_18, arg_163_1.talkMaxDuration)

			if var_166_17 <= arg_163_1.time_ and arg_163_1.time_ < var_166_17 + var_166_27 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_17) / var_166_27

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_17 + var_166_27 and arg_163_1.time_ < var_166_17 + var_166_27 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play115271042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 115271042
		arg_167_1.duration_ = 2.2

		local var_167_0 = {
			ja = 1.066,
			ko = 0.999999999999,
			zh = 2.2,
			en = 1.566
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
				arg_167_0:Play115271043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1038"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1038 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("1038", 2)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_5" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(-390, -400, 0)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1038, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_170_7 = arg_167_1.actors_["1038"]
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1038 == nil then
				arg_167_1.var_.actorSpriteComps1038 = var_170_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_9 = 0.2

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_9 then
				local var_170_10 = (arg_167_1.time_ - var_170_8) / var_170_9

				if arg_167_1.var_.actorSpriteComps1038 then
					for iter_170_1, iter_170_2 in pairs(arg_167_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_170_2 then
							local var_170_11 = Mathf.Lerp(iter_170_2.color.r, 1, var_170_10)

							iter_170_2.color = Color.New(var_170_11, var_170_11, var_170_11)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_8 + var_170_9 and arg_167_1.time_ < var_170_8 + var_170_9 + arg_170_0 and arg_167_1.var_.actorSpriteComps1038 then
				local var_170_12 = 1

				for iter_170_3, iter_170_4 in pairs(arg_167_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_170_4 then
						iter_170_4.color = Color.New(var_170_12, var_170_12, var_170_12)
					end
				end

				arg_167_1.var_.actorSpriteComps1038 = nil
			end

			local var_170_13 = arg_167_1.actors_["1041_1"]
			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				local var_170_15 = var_170_13:GetComponent("Image")

				if var_170_15 then
					arg_167_1.var_.highlightMatValue1041_1 = var_170_15
				end
			end

			local var_170_16 = 0.2

			if var_170_14 <= arg_167_1.time_ and arg_167_1.time_ < var_170_14 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_14) / var_170_16

				if arg_167_1.var_.highlightMatValue1041_1 then
					local var_170_18 = Mathf.Lerp(1, 0.5, var_170_17)
					local var_170_19 = arg_167_1.var_.highlightMatValue1041_1
					local var_170_20 = var_170_19.color

					var_170_20.r = var_170_18
					var_170_20.g = var_170_18
					var_170_20.b = var_170_18
					var_170_19.color = var_170_20
				end
			end

			if arg_167_1.time_ >= var_170_14 + var_170_16 and arg_167_1.time_ < var_170_14 + var_170_16 + arg_170_0 and arg_167_1.var_.highlightMatValue1041_1 then
				local var_170_21 = 0.5
				local var_170_22 = arg_167_1.var_.highlightMatValue1041_1
				local var_170_23 = var_170_22.color

				var_170_23.r = var_170_21
				var_170_23.g = var_170_21
				var_170_23.b = var_170_21
				var_170_22.color = var_170_23
			end

			local var_170_24 = 0
			local var_170_25 = 0.05

			if var_170_24 < arg_167_1.time_ and arg_167_1.time_ <= var_170_24 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_26 = arg_167_1:FormatText(StoryNameCfg[94].name)

				arg_167_1.leftNameTxt_.text = var_170_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_27 = arg_167_1:GetWordFromCfg(115271042)
				local var_170_28 = arg_167_1:FormatText(var_170_27.content)

				arg_167_1.text_.text = var_170_28

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_29 = 2
				local var_170_30 = utf8.len(var_170_28)
				local var_170_31 = var_170_29 <= 0 and var_170_25 or var_170_25 * (var_170_30 / var_170_29)

				if var_170_31 > 0 and var_170_25 < var_170_31 then
					arg_167_1.talkMaxDuration = var_170_31

					if var_170_31 + var_170_24 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_31 + var_170_24
					end
				end

				arg_167_1.text_.text = var_170_28
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271042", "story_v_out_115271.awb") ~= 0 then
					local var_170_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271042", "story_v_out_115271.awb") / 1000

					if var_170_32 + var_170_24 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_32 + var_170_24
					end

					if var_170_27.prefab_name ~= "" and arg_167_1.actors_[var_170_27.prefab_name] ~= nil then
						local var_170_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_27.prefab_name].transform, "story_v_out_115271", "115271042", "story_v_out_115271.awb")

						arg_167_1:RecordAudio("115271042", var_170_33)
						arg_167_1:RecordAudio("115271042", var_170_33)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_115271", "115271042", "story_v_out_115271.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_115271", "115271042", "story_v_out_115271.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_34 = math.max(var_170_25, arg_167_1.talkMaxDuration)

			if var_170_24 <= arg_167_1.time_ and arg_167_1.time_ < var_170_24 + var_170_34 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_24) / var_170_34

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_24 + var_170_34 and arg_167_1.time_ < var_170_24 + var_170_34 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play115271043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 115271043
		arg_171_1.duration_ = 9.366

		local var_171_0 = {
			ja = 9.366,
			ko = 3.666,
			zh = 4.6,
			en = 5.466
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
				arg_171_0:Play115271044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1038"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps1038 == nil then
				arg_171_1.var_.actorSpriteComps1038 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps1038 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 0.5, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps1038 then
				local var_174_5 = 0.5

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps1038 = nil
			end

			local var_174_6 = arg_171_1.actors_["1041_1"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 then
				local var_174_8 = var_174_6:GetComponent("Image")

				if var_174_8 then
					arg_171_1.var_.highlightMatValue1041_1 = var_174_8
				end
			end

			local var_174_9 = 0.2

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_7) / var_174_9

				if arg_171_1.var_.highlightMatValue1041_1 then
					local var_174_11 = Mathf.Lerp(0.5, 1, var_174_10)
					local var_174_12 = arg_171_1.var_.highlightMatValue1041_1
					local var_174_13 = var_174_12.color

					var_174_13.r = var_174_11
					var_174_13.g = var_174_11
					var_174_13.b = var_174_11
					var_174_12.color = var_174_13
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_9 and arg_171_1.time_ < var_174_7 + var_174_9 + arg_174_0 and arg_171_1.var_.highlightMatValue1041_1 then
				local var_174_14 = 1

				var_174_6.transform:SetSiblingIndex(1)

				local var_174_15 = arg_171_1.var_.highlightMatValue1041_1
				local var_174_16 = var_174_15.color

				var_174_16.r = var_174_14
				var_174_16.g = var_174_14
				var_174_16.b = var_174_14
				var_174_15.color = var_174_16
			end

			local var_174_17 = 0
			local var_174_18 = 0.55

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_19 = arg_171_1:FormatText(StoryNameCfg[208].name)

				arg_171_1.leftNameTxt_.text = var_174_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_20 = arg_171_1:GetWordFromCfg(115271043)
				local var_174_21 = arg_171_1:FormatText(var_174_20.content)

				arg_171_1.text_.text = var_174_21

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_22 = 22
				local var_174_23 = utf8.len(var_174_21)
				local var_174_24 = var_174_22 <= 0 and var_174_18 or var_174_18 * (var_174_23 / var_174_22)

				if var_174_24 > 0 and var_174_18 < var_174_24 then
					arg_171_1.talkMaxDuration = var_174_24

					if var_174_24 + var_174_17 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_24 + var_174_17
					end
				end

				arg_171_1.text_.text = var_174_21
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271043", "story_v_out_115271.awb") ~= 0 then
					local var_174_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271043", "story_v_out_115271.awb") / 1000

					if var_174_25 + var_174_17 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_25 + var_174_17
					end

					if var_174_20.prefab_name ~= "" and arg_171_1.actors_[var_174_20.prefab_name] ~= nil then
						local var_174_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_20.prefab_name].transform, "story_v_out_115271", "115271043", "story_v_out_115271.awb")

						arg_171_1:RecordAudio("115271043", var_174_26)
						arg_171_1:RecordAudio("115271043", var_174_26)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_115271", "115271043", "story_v_out_115271.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_115271", "115271043", "story_v_out_115271.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_27 = math.max(var_174_18, arg_171_1.talkMaxDuration)

			if var_174_17 <= arg_171_1.time_ and arg_171_1.time_ < var_174_17 + var_174_27 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_17) / var_174_27

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_17 + var_174_27 and arg_171_1.time_ < var_174_17 + var_174_27 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play115271044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 115271044
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play115271045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1038"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				local var_178_2 = var_178_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_178_2 then
					arg_175_1.var_.alphaOldValue1038 = var_178_2.alpha
					arg_175_1.var_.characterEffect1038 = var_178_2
				end

				arg_175_1.var_.alphaOldValue1038 = 1
			end

			local var_178_3 = 0.5

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_3 then
				local var_178_4 = (arg_175_1.time_ - var_178_1) / var_178_3
				local var_178_5 = Mathf.Lerp(arg_175_1.var_.alphaOldValue1038, 0, var_178_4)

				if arg_175_1.var_.characterEffect1038 then
					arg_175_1.var_.characterEffect1038.alpha = var_178_5
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_3 and arg_175_1.time_ < var_178_1 + var_178_3 + arg_178_0 and arg_175_1.var_.characterEffect1038 then
				arg_175_1.var_.characterEffect1038.alpha = 0
			end

			local var_178_6 = arg_175_1.actors_["1041_1"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 then
				local var_178_8 = var_178_6:GetComponent("Image")

				if var_178_8 then
					arg_175_1.var_.alphaMatValue1041_1 = var_178_8
					arg_175_1.var_.alphaOldValue1041_1 = var_178_8.color.a
				end

				arg_175_1.var_.alphaOldValue1041_1 = 1
			end

			local var_178_9 = 0.5

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_9 then
				local var_178_10 = (arg_175_1.time_ - var_178_7) / var_178_9
				local var_178_11 = Mathf.Lerp(arg_175_1.var_.alphaOldValue1041_1, 0, var_178_10)

				if arg_175_1.var_.alphaMatValue1041_1 then
					local var_178_12 = arg_175_1.var_.alphaMatValue1041_1.color

					var_178_12.a = var_178_11
					arg_175_1.var_.alphaMatValue1041_1.color = var_178_12
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_9 and arg_175_1.time_ < var_178_7 + var_178_9 + arg_178_0 and arg_175_1.var_.alphaMatValue1041_1 then
				local var_178_13 = arg_175_1.var_.alphaMatValue1041_1
				local var_178_14 = var_178_13.color

				var_178_14.a = 0
				var_178_13.color = var_178_14
			end

			local var_178_15 = 0
			local var_178_16 = 0.775

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_17 = arg_175_1:GetWordFromCfg(115271044)
				local var_178_18 = arg_175_1:FormatText(var_178_17.content)

				arg_175_1.text_.text = var_178_18

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_19 = 31
				local var_178_20 = utf8.len(var_178_18)
				local var_178_21 = var_178_19 <= 0 and var_178_16 or var_178_16 * (var_178_20 / var_178_19)

				if var_178_21 > 0 and var_178_16 < var_178_21 then
					arg_175_1.talkMaxDuration = var_178_21

					if var_178_21 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_21 + var_178_15
					end
				end

				arg_175_1.text_.text = var_178_18
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_16, arg_175_1.talkMaxDuration)

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_15) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_15 + var_178_22 and arg_175_1.time_ < var_178_15 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play115271045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 115271045
		arg_179_1.duration_ = 9.966

		local var_179_0 = {
			ja = 9.966,
			ko = 7.566,
			zh = 7.433,
			en = 7.833
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
				arg_179_0:Play115271046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = "ST28a"

			if arg_179_1.bgs_[var_182_0] == nil then
				local var_182_1 = Object.Instantiate(arg_179_1.paintGo_)

				var_182_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_182_0)
				var_182_1.name = var_182_0
				var_182_1.transform.parent = arg_179_1.stage_.transform
				var_182_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_179_1.bgs_[var_182_0] = var_182_1
			end

			local var_182_2 = 2

			if var_182_2 < arg_179_1.time_ and arg_179_1.time_ <= var_182_2 + arg_182_0 then
				local var_182_3 = manager.ui.mainCamera.transform.localPosition
				local var_182_4 = Vector3.New(0, 0, 10) + Vector3.New(var_182_3.x, var_182_3.y, 0)
				local var_182_5 = arg_179_1.bgs_.ST28a

				var_182_5.transform.localPosition = var_182_4
				var_182_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_182_6 = var_182_5:GetComponent("SpriteRenderer")

				if var_182_6 and var_182_6.sprite then
					local var_182_7 = (var_182_5.transform.localPosition - var_182_3).z
					local var_182_8 = manager.ui.mainCameraCom_
					local var_182_9 = 2 * var_182_7 * Mathf.Tan(var_182_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_182_10 = var_182_9 * var_182_8.aspect
					local var_182_11 = var_182_6.sprite.bounds.size.x
					local var_182_12 = var_182_6.sprite.bounds.size.y
					local var_182_13 = var_182_10 / var_182_11
					local var_182_14 = var_182_9 / var_182_12
					local var_182_15 = var_182_14 < var_182_13 and var_182_13 or var_182_14

					var_182_5.transform.localScale = Vector3.New(var_182_15, var_182_15, 0)
				end

				for iter_182_0, iter_182_1 in pairs(arg_179_1.bgs_) do
					if iter_182_0 ~= "ST28a" then
						iter_182_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_17 = 2

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Color.New(0, 0, 0)

				var_182_19.a = Mathf.Lerp(0, 1, var_182_18)
				arg_179_1.mask_.color = var_182_19
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				local var_182_20 = Color.New(0, 0, 0)

				var_182_20.a = 1
				arg_179_1.mask_.color = var_182_20
			end

			local var_182_21 = 2

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_22 = 2

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_22 then
				local var_182_23 = (arg_179_1.time_ - var_182_21) / var_182_22
				local var_182_24 = Color.New(0, 0, 0)

				var_182_24.a = Mathf.Lerp(1, 0, var_182_23)
				arg_179_1.mask_.color = var_182_24
			end

			if arg_179_1.time_ >= var_182_21 + var_182_22 and arg_179_1.time_ < var_182_21 + var_182_22 + arg_182_0 then
				local var_182_25 = Color.New(0, 0, 0)
				local var_182_26 = 0

				arg_179_1.mask_.enabled = false
				var_182_25.a = var_182_26
				arg_179_1.mask_.color = var_182_25
			end

			local var_182_27 = "10030"

			if arg_179_1.actors_[var_182_27] == nil then
				local var_182_28 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_182_27), arg_179_1.canvasGo_.transform)

				var_182_28.transform:SetSiblingIndex(1)

				var_182_28.name = var_182_27
				var_182_28.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_179_1.actors_[var_182_27] = var_182_28
			end

			local var_182_29 = arg_179_1.actors_["10030"].transform
			local var_182_30 = 3.8

			if var_182_30 < arg_179_1.time_ and arg_179_1.time_ <= var_182_30 + arg_182_0 then
				arg_179_1.var_.moveOldPos10030 = var_182_29.localPosition
				var_182_29.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10030", 4)

				local var_182_31 = var_182_29.childCount

				for iter_182_2 = 0, var_182_31 - 1 do
					local var_182_32 = var_182_29:GetChild(iter_182_2)

					if var_182_32.name == "split_3" or not string.find(var_182_32.name, "split") then
						var_182_32.gameObject:SetActive(true)
					else
						var_182_32.gameObject:SetActive(false)
					end
				end
			end

			local var_182_33 = 0.001

			if var_182_30 <= arg_179_1.time_ and arg_179_1.time_ < var_182_30 + var_182_33 then
				local var_182_34 = (arg_179_1.time_ - var_182_30) / var_182_33
				local var_182_35 = Vector3.New(390, -390, 150)

				var_182_29.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10030, var_182_35, var_182_34)
			end

			if arg_179_1.time_ >= var_182_30 + var_182_33 and arg_179_1.time_ < var_182_30 + var_182_33 + arg_182_0 then
				var_182_29.localPosition = Vector3.New(390, -390, 150)
			end

			local var_182_36 = arg_179_1.actors_["10030"]
			local var_182_37 = 3.8

			if var_182_37 < arg_179_1.time_ and arg_179_1.time_ <= var_182_37 + arg_182_0 then
				local var_182_38 = var_182_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_182_38 then
					arg_179_1.var_.alphaOldValue10030 = var_182_38.alpha
					arg_179_1.var_.characterEffect10030 = var_182_38
				end

				arg_179_1.var_.alphaOldValue10030 = 0
			end

			local var_182_39 = 0.5

			if var_182_37 <= arg_179_1.time_ and arg_179_1.time_ < var_182_37 + var_182_39 then
				local var_182_40 = (arg_179_1.time_ - var_182_37) / var_182_39
				local var_182_41 = Mathf.Lerp(arg_179_1.var_.alphaOldValue10030, 1, var_182_40)

				if arg_179_1.var_.characterEffect10030 then
					arg_179_1.var_.characterEffect10030.alpha = var_182_41
				end
			end

			if arg_179_1.time_ >= var_182_37 + var_182_39 and arg_179_1.time_ < var_182_37 + var_182_39 + arg_182_0 and arg_179_1.var_.characterEffect10030 then
				arg_179_1.var_.characterEffect10030.alpha = 1
			end

			local var_182_42 = arg_179_1.actors_["10030"]
			local var_182_43 = 3.8

			if var_182_43 < arg_179_1.time_ and arg_179_1.time_ <= var_182_43 + arg_182_0 and arg_179_1.var_.actorSpriteComps10030 == nil then
				arg_179_1.var_.actorSpriteComps10030 = var_182_42:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_44 = 0.2

			if var_182_43 <= arg_179_1.time_ and arg_179_1.time_ < var_182_43 + var_182_44 then
				local var_182_45 = (arg_179_1.time_ - var_182_43) / var_182_44

				if arg_179_1.var_.actorSpriteComps10030 then
					for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_182_4 then
							local var_182_46 = Mathf.Lerp(iter_182_4.color.r, 1, var_182_45)

							iter_182_4.color = Color.New(var_182_46, var_182_46, var_182_46)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_43 + var_182_44 and arg_179_1.time_ < var_182_43 + var_182_44 + arg_182_0 and arg_179_1.var_.actorSpriteComps10030 then
				local var_182_47 = 1

				for iter_182_5, iter_182_6 in pairs(arg_179_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_182_6 then
						iter_182_6.color = Color.New(var_182_47, var_182_47, var_182_47)
					end
				end

				arg_179_1.var_.actorSpriteComps10030 = nil
			end

			local var_182_48 = 4
			local var_182_49 = 0.633333333333334

			if var_182_48 < arg_179_1.time_ and arg_179_1.time_ <= var_182_48 + arg_182_0 then
				local var_182_50 = "play"
				local var_182_51 = "music"

				arg_179_1:AudioAction(var_182_50, var_182_51, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_182_52 = 0
			local var_182_53 = 0.633333333333334

			if var_182_52 < arg_179_1.time_ and arg_179_1.time_ <= var_182_52 + arg_182_0 then
				local var_182_54 = "play"
				local var_182_55 = "music"

				arg_179_1:AudioAction(var_182_54, var_182_55, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_179_1.frameCnt_ <= 1 then
				arg_179_1.dialog_:SetActive(false)
			end

			local var_182_56 = 4
			local var_182_57 = 0.225

			if var_182_56 < arg_179_1.time_ and arg_179_1.time_ <= var_182_56 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				arg_179_1.dialog_:SetActive(true)

				local var_182_58 = LeanTween.value(arg_179_1.dialog_, 0, 1, 0.3)

				var_182_58:setOnUpdate(LuaHelper.FloatAction(function(arg_183_0)
					arg_179_1.dialogCg_.alpha = arg_183_0
				end))
				var_182_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_179_1.dialog_)
					var_182_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_179_1.duration_ = arg_179_1.duration_ + 0.3

				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_59 = arg_179_1:FormatText(StoryNameCfg[309].name)

				arg_179_1.leftNameTxt_.text = var_182_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_60 = arg_179_1:GetWordFromCfg(115271045)
				local var_182_61 = arg_179_1:FormatText(var_182_60.content)

				arg_179_1.text_.text = var_182_61

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_62 = 9
				local var_182_63 = utf8.len(var_182_61)
				local var_182_64 = var_182_62 <= 0 and var_182_57 or var_182_57 * (var_182_63 / var_182_62)

				if var_182_64 > 0 and var_182_57 < var_182_64 then
					arg_179_1.talkMaxDuration = var_182_64
					var_182_56 = var_182_56 + 0.3

					if var_182_64 + var_182_56 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_64 + var_182_56
					end
				end

				arg_179_1.text_.text = var_182_61
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271045", "story_v_out_115271.awb") ~= 0 then
					local var_182_65 = manager.audio:GetVoiceLength("story_v_out_115271", "115271045", "story_v_out_115271.awb") / 1000

					if var_182_65 + var_182_56 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_65 + var_182_56
					end

					if var_182_60.prefab_name ~= "" and arg_179_1.actors_[var_182_60.prefab_name] ~= nil then
						local var_182_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_60.prefab_name].transform, "story_v_out_115271", "115271045", "story_v_out_115271.awb")

						arg_179_1:RecordAudio("115271045", var_182_66)
						arg_179_1:RecordAudio("115271045", var_182_66)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_115271", "115271045", "story_v_out_115271.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_115271", "115271045", "story_v_out_115271.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_67 = var_182_56 + 0.3
			local var_182_68 = math.max(var_182_57, arg_179_1.talkMaxDuration)

			if var_182_67 <= arg_179_1.time_ and arg_179_1.time_ < var_182_67 + var_182_68 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_67) / var_182_68

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_67 + var_182_68 and arg_179_1.time_ < var_182_67 + var_182_68 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play115271046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 115271046
		arg_185_1.duration_ = 8.766

		local var_185_0 = {
			ja = 5.266,
			ko = 6.766,
			zh = 6.166,
			en = 8.766
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play115271047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10030"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.actorSpriteComps10030 == nil then
				arg_185_1.var_.actorSpriteComps10030 = var_188_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_2 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.actorSpriteComps10030 then
					for iter_188_0, iter_188_1 in pairs(arg_185_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_188_1 then
							local var_188_4 = Mathf.Lerp(iter_188_1.color.r, 0.5, var_188_3)

							iter_188_1.color = Color.New(var_188_4, var_188_4, var_188_4)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.actorSpriteComps10030 then
				local var_188_5 = 0.5

				for iter_188_2, iter_188_3 in pairs(arg_185_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_188_3 then
						iter_188_3.color = Color.New(var_188_5, var_188_5, var_188_5)
					end
				end

				arg_185_1.var_.actorSpriteComps10030 = nil
			end

			local var_188_6 = "10029"

			if arg_185_1.actors_[var_188_6] == nil then
				local var_188_7 = Object.Instantiate(arg_185_1.imageGo_, arg_185_1.canvasGo_.transform)

				var_188_7.transform:SetSiblingIndex(1)

				var_188_7.name = var_188_6

				local var_188_8 = var_188_7:GetComponent(typeof(Image))

				var_188_8.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_188_6)

				var_188_8:SetNativeSize()

				var_188_7.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_185_1.actors_[var_188_6] = var_188_7
			end

			local var_188_9 = arg_185_1.actors_["10029"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				local var_188_11 = var_188_9:GetComponent("Image")

				if var_188_11 then
					arg_185_1.var_.highlightMatValue10029 = var_188_11
				end
			end

			local var_188_12 = 0.2

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_12 then
				local var_188_13 = (arg_185_1.time_ - var_188_10) / var_188_12

				if arg_185_1.var_.highlightMatValue10029 then
					local var_188_14 = Mathf.Lerp(0.5, 1, var_188_13)
					local var_188_15 = arg_185_1.var_.highlightMatValue10029
					local var_188_16 = var_188_15.color

					var_188_16.r = var_188_14
					var_188_16.g = var_188_14
					var_188_16.b = var_188_14
					var_188_15.color = var_188_16
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_12 and arg_185_1.time_ < var_188_10 + var_188_12 + arg_188_0 and arg_185_1.var_.highlightMatValue10029 then
				local var_188_17 = 1

				var_188_9.transform:SetSiblingIndex(1)

				local var_188_18 = arg_185_1.var_.highlightMatValue10029
				local var_188_19 = var_188_18.color

				var_188_19.r = var_188_17
				var_188_19.g = var_188_17
				var_188_19.b = var_188_17
				var_188_18.color = var_188_19
			end

			local var_188_20 = arg_185_1.actors_["10029"].transform
			local var_188_21 = 0

			if var_188_21 < arg_185_1.time_ and arg_185_1.time_ <= var_188_21 + arg_188_0 then
				arg_185_1.var_.moveOldPos10029 = var_188_20.localPosition
				var_188_20.localScale = Vector3.New(1, 1, 1)

				arg_185_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_188_22 = 0.001

			if var_188_21 <= arg_185_1.time_ and arg_185_1.time_ < var_188_21 + var_188_22 then
				local var_188_23 = (arg_185_1.time_ - var_188_21) / var_188_22
				local var_188_24 = Vector3.New(-390, -350, -180)

				var_188_20.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos10029, var_188_24, var_188_23)
			end

			if arg_185_1.time_ >= var_188_21 + var_188_22 and arg_185_1.time_ < var_188_21 + var_188_22 + arg_188_0 then
				var_188_20.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_188_25 = arg_185_1.actors_["10029"]
			local var_188_26 = 0

			if var_188_26 < arg_185_1.time_ and arg_185_1.time_ <= var_188_26 + arg_188_0 then
				local var_188_27 = var_188_25:GetComponent("Image")

				if var_188_27 then
					arg_185_1.var_.alphaMatValue10029 = var_188_27
					arg_185_1.var_.alphaOldValue10029 = var_188_27.color.a
				end

				arg_185_1.var_.alphaOldValue10029 = 0
			end

			local var_188_28 = 0.5

			if var_188_26 <= arg_185_1.time_ and arg_185_1.time_ < var_188_26 + var_188_28 then
				local var_188_29 = (arg_185_1.time_ - var_188_26) / var_188_28
				local var_188_30 = Mathf.Lerp(arg_185_1.var_.alphaOldValue10029, 1, var_188_29)

				if arg_185_1.var_.alphaMatValue10029 then
					local var_188_31 = arg_185_1.var_.alphaMatValue10029.color

					var_188_31.a = var_188_30
					arg_185_1.var_.alphaMatValue10029.color = var_188_31
				end
			end

			if arg_185_1.time_ >= var_188_26 + var_188_28 and arg_185_1.time_ < var_188_26 + var_188_28 + arg_188_0 and arg_185_1.var_.alphaMatValue10029 then
				local var_188_32 = arg_185_1.var_.alphaMatValue10029
				local var_188_33 = var_188_32.color

				var_188_33.a = 1
				var_188_32.color = var_188_33
			end

			local var_188_34 = 0
			local var_188_35 = 0.633333333333334

			if var_188_34 < arg_185_1.time_ and arg_185_1.time_ <= var_188_34 + arg_188_0 then
				local var_188_36 = "play"
				local var_188_37 = "music"

				arg_185_1:AudioAction(var_188_36, var_188_37, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_188_38 = 0
			local var_188_39 = 0.625

			if var_188_38 < arg_185_1.time_ and arg_185_1.time_ <= var_188_38 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_40 = arg_185_1:FormatText(StoryNameCfg[312].name)

				arg_185_1.leftNameTxt_.text = var_188_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_41 = arg_185_1:GetWordFromCfg(115271046)
				local var_188_42 = arg_185_1:FormatText(var_188_41.content)

				arg_185_1.text_.text = var_188_42

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_43 = 25
				local var_188_44 = utf8.len(var_188_42)
				local var_188_45 = var_188_43 <= 0 and var_188_39 or var_188_39 * (var_188_44 / var_188_43)

				if var_188_45 > 0 and var_188_39 < var_188_45 then
					arg_185_1.talkMaxDuration = var_188_45

					if var_188_45 + var_188_38 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_45 + var_188_38
					end
				end

				arg_185_1.text_.text = var_188_42
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271046", "story_v_out_115271.awb") ~= 0 then
					local var_188_46 = manager.audio:GetVoiceLength("story_v_out_115271", "115271046", "story_v_out_115271.awb") / 1000

					if var_188_46 + var_188_38 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_46 + var_188_38
					end

					if var_188_41.prefab_name ~= "" and arg_185_1.actors_[var_188_41.prefab_name] ~= nil then
						local var_188_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_41.prefab_name].transform, "story_v_out_115271", "115271046", "story_v_out_115271.awb")

						arg_185_1:RecordAudio("115271046", var_188_47)
						arg_185_1:RecordAudio("115271046", var_188_47)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_115271", "115271046", "story_v_out_115271.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_115271", "115271046", "story_v_out_115271.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_48 = math.max(var_188_39, arg_185_1.talkMaxDuration)

			if var_188_38 <= arg_185_1.time_ and arg_185_1.time_ < var_188_38 + var_188_48 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_38) / var_188_48

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_38 + var_188_48 and arg_185_1.time_ < var_188_38 + var_188_48 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play115271047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 115271047
		arg_189_1.duration_ = 3.2

		local var_189_0 = {
			ja = 3.2,
			ko = 1.966,
			zh = 1.933,
			en = 2.5
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
				arg_189_0:Play115271048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10030"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos10030 = var_192_0.localPosition
				var_192_0.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("10030", 4)

				local var_192_2 = var_192_0.childCount

				for iter_192_0 = 0, var_192_2 - 1 do
					local var_192_3 = var_192_0:GetChild(iter_192_0)

					if var_192_3.name == "split_2" or not string.find(var_192_3.name, "split") then
						var_192_3.gameObject:SetActive(true)
					else
						var_192_3.gameObject:SetActive(false)
					end
				end
			end

			local var_192_4 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_4 then
				local var_192_5 = (arg_189_1.time_ - var_192_1) / var_192_4
				local var_192_6 = Vector3.New(390, -390, 150)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10030, var_192_6, var_192_5)
			end

			if arg_189_1.time_ >= var_192_1 + var_192_4 and arg_189_1.time_ < var_192_1 + var_192_4 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_192_7 = arg_189_1.actors_["10030"]
			local var_192_8 = 0

			if var_192_8 < arg_189_1.time_ and arg_189_1.time_ <= var_192_8 + arg_192_0 and arg_189_1.var_.actorSpriteComps10030 == nil then
				arg_189_1.var_.actorSpriteComps10030 = var_192_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_9 = 0.2

			if var_192_8 <= arg_189_1.time_ and arg_189_1.time_ < var_192_8 + var_192_9 then
				local var_192_10 = (arg_189_1.time_ - var_192_8) / var_192_9

				if arg_189_1.var_.actorSpriteComps10030 then
					for iter_192_1, iter_192_2 in pairs(arg_189_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_192_2 then
							local var_192_11 = Mathf.Lerp(iter_192_2.color.r, 1, var_192_10)

							iter_192_2.color = Color.New(var_192_11, var_192_11, var_192_11)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_8 + var_192_9 and arg_189_1.time_ < var_192_8 + var_192_9 + arg_192_0 and arg_189_1.var_.actorSpriteComps10030 then
				local var_192_12 = 1

				for iter_192_3, iter_192_4 in pairs(arg_189_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_192_4 then
						iter_192_4.color = Color.New(var_192_12, var_192_12, var_192_12)
					end
				end

				arg_189_1.var_.actorSpriteComps10030 = nil
			end

			local var_192_13 = arg_189_1.actors_["10029"]
			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 then
				local var_192_15 = var_192_13:GetComponent("Image")

				if var_192_15 then
					arg_189_1.var_.highlightMatValue10029 = var_192_15
				end
			end

			local var_192_16 = 0.2

			if var_192_14 <= arg_189_1.time_ and arg_189_1.time_ < var_192_14 + var_192_16 then
				local var_192_17 = (arg_189_1.time_ - var_192_14) / var_192_16

				if arg_189_1.var_.highlightMatValue10029 then
					local var_192_18 = Mathf.Lerp(1, 0.5, var_192_17)
					local var_192_19 = arg_189_1.var_.highlightMatValue10029
					local var_192_20 = var_192_19.color

					var_192_20.r = var_192_18
					var_192_20.g = var_192_18
					var_192_20.b = var_192_18
					var_192_19.color = var_192_20
				end
			end

			if arg_189_1.time_ >= var_192_14 + var_192_16 and arg_189_1.time_ < var_192_14 + var_192_16 + arg_192_0 and arg_189_1.var_.highlightMatValue10029 then
				local var_192_21 = 0.5
				local var_192_22 = arg_189_1.var_.highlightMatValue10029
				local var_192_23 = var_192_22.color

				var_192_23.r = var_192_21
				var_192_23.g = var_192_21
				var_192_23.b = var_192_21
				var_192_22.color = var_192_23
			end

			local var_192_24 = 0
			local var_192_25 = 0.175

			if var_192_24 < arg_189_1.time_ and arg_189_1.time_ <= var_192_24 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_26 = arg_189_1:FormatText(StoryNameCfg[309].name)

				arg_189_1.leftNameTxt_.text = var_192_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_27 = arg_189_1:GetWordFromCfg(115271047)
				local var_192_28 = arg_189_1:FormatText(var_192_27.content)

				arg_189_1.text_.text = var_192_28

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_29 = 7
				local var_192_30 = utf8.len(var_192_28)
				local var_192_31 = var_192_29 <= 0 and var_192_25 or var_192_25 * (var_192_30 / var_192_29)

				if var_192_31 > 0 and var_192_25 < var_192_31 then
					arg_189_1.talkMaxDuration = var_192_31

					if var_192_31 + var_192_24 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_31 + var_192_24
					end
				end

				arg_189_1.text_.text = var_192_28
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271047", "story_v_out_115271.awb") ~= 0 then
					local var_192_32 = manager.audio:GetVoiceLength("story_v_out_115271", "115271047", "story_v_out_115271.awb") / 1000

					if var_192_32 + var_192_24 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_32 + var_192_24
					end

					if var_192_27.prefab_name ~= "" and arg_189_1.actors_[var_192_27.prefab_name] ~= nil then
						local var_192_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_27.prefab_name].transform, "story_v_out_115271", "115271047", "story_v_out_115271.awb")

						arg_189_1:RecordAudio("115271047", var_192_33)
						arg_189_1:RecordAudio("115271047", var_192_33)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_115271", "115271047", "story_v_out_115271.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_115271", "115271047", "story_v_out_115271.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_34 = math.max(var_192_25, arg_189_1.talkMaxDuration)

			if var_192_24 <= arg_189_1.time_ and arg_189_1.time_ < var_192_24 + var_192_34 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_24) / var_192_34

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_24 + var_192_34 and arg_189_1.time_ < var_192_24 + var_192_34 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play115271048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115271048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play115271049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10030"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				local var_196_2 = var_196_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_196_2 then
					arg_193_1.var_.alphaOldValue10030 = var_196_2.alpha
					arg_193_1.var_.characterEffect10030 = var_196_2
				end

				arg_193_1.var_.alphaOldValue10030 = 1
			end

			local var_196_3 = 0.5

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_3 then
				local var_196_4 = (arg_193_1.time_ - var_196_1) / var_196_3
				local var_196_5 = Mathf.Lerp(arg_193_1.var_.alphaOldValue10030, 0, var_196_4)

				if arg_193_1.var_.characterEffect10030 then
					arg_193_1.var_.characterEffect10030.alpha = var_196_5
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_3 and arg_193_1.time_ < var_196_1 + var_196_3 + arg_196_0 and arg_193_1.var_.characterEffect10030 then
				arg_193_1.var_.characterEffect10030.alpha = 0
			end

			local var_196_6 = arg_193_1.actors_["10029"]
			local var_196_7 = 0

			if var_196_7 < arg_193_1.time_ and arg_193_1.time_ <= var_196_7 + arg_196_0 then
				local var_196_8 = var_196_6:GetComponent("Image")

				if var_196_8 then
					arg_193_1.var_.alphaMatValue10029 = var_196_8
					arg_193_1.var_.alphaOldValue10029 = var_196_8.color.a
				end

				arg_193_1.var_.alphaOldValue10029 = 1
			end

			local var_196_9 = 0.5

			if var_196_7 <= arg_193_1.time_ and arg_193_1.time_ < var_196_7 + var_196_9 then
				local var_196_10 = (arg_193_1.time_ - var_196_7) / var_196_9
				local var_196_11 = Mathf.Lerp(arg_193_1.var_.alphaOldValue10029, 0, var_196_10)

				if arg_193_1.var_.alphaMatValue10029 then
					local var_196_12 = arg_193_1.var_.alphaMatValue10029.color

					var_196_12.a = var_196_11
					arg_193_1.var_.alphaMatValue10029.color = var_196_12
				end
			end

			if arg_193_1.time_ >= var_196_7 + var_196_9 and arg_193_1.time_ < var_196_7 + var_196_9 + arg_196_0 and arg_193_1.var_.alphaMatValue10029 then
				local var_196_13 = arg_193_1.var_.alphaMatValue10029
				local var_196_14 = var_196_13.color

				var_196_14.a = 0
				var_196_13.color = var_196_14
			end

			local var_196_15 = 0
			local var_196_16 = 1.625

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_17 = arg_193_1:GetWordFromCfg(115271048)
				local var_196_18 = arg_193_1:FormatText(var_196_17.content)

				arg_193_1.text_.text = var_196_18

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_19 = 65
				local var_196_20 = utf8.len(var_196_18)
				local var_196_21 = var_196_19 <= 0 and var_196_16 or var_196_16 * (var_196_20 / var_196_19)

				if var_196_21 > 0 and var_196_16 < var_196_21 then
					arg_193_1.talkMaxDuration = var_196_21

					if var_196_21 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_21 + var_196_15
					end
				end

				arg_193_1.text_.text = var_196_18
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_22 = math.max(var_196_16, arg_193_1.talkMaxDuration)

			if var_196_15 <= arg_193_1.time_ and arg_193_1.time_ < var_196_15 + var_196_22 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_15) / var_196_22

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_15 + var_196_22 and arg_193_1.time_ < var_196_15 + var_196_22 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play115271049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115271049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play115271050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.85

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_2 = arg_197_1:GetWordFromCfg(115271049)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 74
				local var_200_5 = utf8.len(var_200_3)
				local var_200_6 = var_200_4 <= 0 and var_200_1 or var_200_1 * (var_200_5 / var_200_4)

				if var_200_6 > 0 and var_200_1 < var_200_6 then
					arg_197_1.talkMaxDuration = var_200_6

					if var_200_6 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_6 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_3
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_7 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_7 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_7

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_7 and arg_197_1.time_ < var_200_0 + var_200_7 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115271050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115271050
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play115271051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 1.8

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

				local var_204_2 = arg_201_1:GetWordFromCfg(115271050)
				local var_204_3 = arg_201_1:FormatText(var_204_2.content)

				arg_201_1.text_.text = var_204_3

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_4 = 72
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
	Play115271051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 115271051
		arg_205_1.duration_ = 4.366

		local var_205_0 = {
			ja = 4.366,
			ko = 1.733,
			zh = 3.766,
			en = 3.3
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
				arg_205_0:Play115271052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10030"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10030 = var_208_0.localPosition
				var_208_0.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10030", 4)

				local var_208_2 = var_208_0.childCount

				for iter_208_0 = 0, var_208_2 - 1 do
					local var_208_3 = var_208_0:GetChild(iter_208_0)

					if var_208_3.name == "split_3" or not string.find(var_208_3.name, "split") then
						var_208_3.gameObject:SetActive(true)
					else
						var_208_3.gameObject:SetActive(false)
					end
				end
			end

			local var_208_4 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_1) / var_208_4
				local var_208_6 = Vector3.New(390, -390, 150)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10030, var_208_6, var_208_5)
			end

			if arg_205_1.time_ >= var_208_1 + var_208_4 and arg_205_1.time_ < var_208_1 + var_208_4 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_208_7 = arg_205_1.actors_["10030"]
			local var_208_8 = 0

			if var_208_8 < arg_205_1.time_ and arg_205_1.time_ <= var_208_8 + arg_208_0 then
				local var_208_9 = var_208_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_208_9 then
					arg_205_1.var_.alphaOldValue10030 = var_208_9.alpha
					arg_205_1.var_.characterEffect10030 = var_208_9
				end

				arg_205_1.var_.alphaOldValue10030 = 0
			end

			local var_208_10 = 0.5

			if var_208_8 <= arg_205_1.time_ and arg_205_1.time_ < var_208_8 + var_208_10 then
				local var_208_11 = (arg_205_1.time_ - var_208_8) / var_208_10
				local var_208_12 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10030, 1, var_208_11)

				if arg_205_1.var_.characterEffect10030 then
					arg_205_1.var_.characterEffect10030.alpha = var_208_12
				end
			end

			if arg_205_1.time_ >= var_208_8 + var_208_10 and arg_205_1.time_ < var_208_8 + var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect10030 then
				arg_205_1.var_.characterEffect10030.alpha = 1
			end

			local var_208_13 = arg_205_1.actors_["10030"]
			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 and arg_205_1.var_.actorSpriteComps10030 == nil then
				arg_205_1.var_.actorSpriteComps10030 = var_208_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_15 = 0.2

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_15 then
				local var_208_16 = (arg_205_1.time_ - var_208_14) / var_208_15

				if arg_205_1.var_.actorSpriteComps10030 then
					for iter_208_1, iter_208_2 in pairs(arg_205_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_208_2 then
							local var_208_17 = Mathf.Lerp(iter_208_2.color.r, 1, var_208_16)

							iter_208_2.color = Color.New(var_208_17, var_208_17, var_208_17)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_14 + var_208_15 and arg_205_1.time_ < var_208_14 + var_208_15 + arg_208_0 and arg_205_1.var_.actorSpriteComps10030 then
				local var_208_18 = 1

				for iter_208_3, iter_208_4 in pairs(arg_205_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_208_4 then
						iter_208_4.color = Color.New(var_208_18, var_208_18, var_208_18)
					end
				end

				arg_205_1.var_.actorSpriteComps10030 = nil
			end

			local var_208_19 = 0
			local var_208_20 = 0.15

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_21 = arg_205_1:FormatText(StoryNameCfg[309].name)

				arg_205_1.leftNameTxt_.text = var_208_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_22 = arg_205_1:GetWordFromCfg(115271051)
				local var_208_23 = arg_205_1:FormatText(var_208_22.content)

				arg_205_1.text_.text = var_208_23

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_24 = 6
				local var_208_25 = utf8.len(var_208_23)
				local var_208_26 = var_208_24 <= 0 and var_208_20 or var_208_20 * (var_208_25 / var_208_24)

				if var_208_26 > 0 and var_208_20 < var_208_26 then
					arg_205_1.talkMaxDuration = var_208_26

					if var_208_26 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_26 + var_208_19
					end
				end

				arg_205_1.text_.text = var_208_23
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271051", "story_v_out_115271.awb") ~= 0 then
					local var_208_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271051", "story_v_out_115271.awb") / 1000

					if var_208_27 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_27 + var_208_19
					end

					if var_208_22.prefab_name ~= "" and arg_205_1.actors_[var_208_22.prefab_name] ~= nil then
						local var_208_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_22.prefab_name].transform, "story_v_out_115271", "115271051", "story_v_out_115271.awb")

						arg_205_1:RecordAudio("115271051", var_208_28)
						arg_205_1:RecordAudio("115271051", var_208_28)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_115271", "115271051", "story_v_out_115271.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_115271", "115271051", "story_v_out_115271.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_29 = math.max(var_208_20, arg_205_1.talkMaxDuration)

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_29 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_19) / var_208_29

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_19 + var_208_29 and arg_205_1.time_ < var_208_19 + var_208_29 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play115271052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 115271052
		arg_209_1.duration_ = 5.4

		local var_209_0 = {
			ja = 4.933,
			ko = 5.2,
			zh = 4.066,
			en = 5.4
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play115271053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10029"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				local var_212_2 = var_212_0:GetComponent("Image")

				if var_212_2 then
					arg_209_1.var_.highlightMatValue10029 = var_212_2
				end
			end

			local var_212_3 = 0.2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_3 then
				local var_212_4 = (arg_209_1.time_ - var_212_1) / var_212_3

				if arg_209_1.var_.highlightMatValue10029 then
					local var_212_5 = Mathf.Lerp(0.5, 1, var_212_4)
					local var_212_6 = arg_209_1.var_.highlightMatValue10029
					local var_212_7 = var_212_6.color

					var_212_7.r = var_212_5
					var_212_7.g = var_212_5
					var_212_7.b = var_212_5
					var_212_6.color = var_212_7
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_3 and arg_209_1.time_ < var_212_1 + var_212_3 + arg_212_0 and arg_209_1.var_.highlightMatValue10029 then
				local var_212_8 = 1

				var_212_0.transform:SetSiblingIndex(1)

				local var_212_9 = arg_209_1.var_.highlightMatValue10029
				local var_212_10 = var_212_9.color

				var_212_10.r = var_212_8
				var_212_10.g = var_212_8
				var_212_10.b = var_212_8
				var_212_9.color = var_212_10
			end

			local var_212_11 = arg_209_1.actors_["10029"].transform
			local var_212_12 = 0

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 then
				arg_209_1.var_.moveOldPos10029 = var_212_11.localPosition
				var_212_11.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_212_13 = 0.001

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_13 then
				local var_212_14 = (arg_209_1.time_ - var_212_12) / var_212_13
				local var_212_15 = Vector3.New(-390, -350, -180)

				var_212_11.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10029, var_212_15, var_212_14)
			end

			if arg_209_1.time_ >= var_212_12 + var_212_13 and arg_209_1.time_ < var_212_12 + var_212_13 + arg_212_0 then
				var_212_11.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_212_16 = arg_209_1.actors_["10029"]
			local var_212_17 = 0

			if var_212_17 < arg_209_1.time_ and arg_209_1.time_ <= var_212_17 + arg_212_0 then
				local var_212_18 = var_212_16:GetComponent("Image")

				if var_212_18 then
					arg_209_1.var_.alphaMatValue10029 = var_212_18
					arg_209_1.var_.alphaOldValue10029 = var_212_18.color.a
				end

				arg_209_1.var_.alphaOldValue10029 = 0
			end

			local var_212_19 = 0.5

			if var_212_17 <= arg_209_1.time_ and arg_209_1.time_ < var_212_17 + var_212_19 then
				local var_212_20 = (arg_209_1.time_ - var_212_17) / var_212_19
				local var_212_21 = Mathf.Lerp(arg_209_1.var_.alphaOldValue10029, 1, var_212_20)

				if arg_209_1.var_.alphaMatValue10029 then
					local var_212_22 = arg_209_1.var_.alphaMatValue10029.color

					var_212_22.a = var_212_21
					arg_209_1.var_.alphaMatValue10029.color = var_212_22
				end
			end

			if arg_209_1.time_ >= var_212_17 + var_212_19 and arg_209_1.time_ < var_212_17 + var_212_19 + arg_212_0 and arg_209_1.var_.alphaMatValue10029 then
				local var_212_23 = arg_209_1.var_.alphaMatValue10029
				local var_212_24 = var_212_23.color

				var_212_24.a = 1
				var_212_23.color = var_212_24
			end

			local var_212_25 = arg_209_1.actors_["10030"]
			local var_212_26 = 0

			if var_212_26 < arg_209_1.time_ and arg_209_1.time_ <= var_212_26 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 == nil then
				arg_209_1.var_.actorSpriteComps10030 = var_212_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_27 = 0.2

			if var_212_26 <= arg_209_1.time_ and arg_209_1.time_ < var_212_26 + var_212_27 then
				local var_212_28 = (arg_209_1.time_ - var_212_26) / var_212_27

				if arg_209_1.var_.actorSpriteComps10030 then
					for iter_212_0, iter_212_1 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_212_1 then
							local var_212_29 = Mathf.Lerp(iter_212_1.color.r, 0.5, var_212_28)

							iter_212_1.color = Color.New(var_212_29, var_212_29, var_212_29)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_26 + var_212_27 and arg_209_1.time_ < var_212_26 + var_212_27 + arg_212_0 and arg_209_1.var_.actorSpriteComps10030 then
				local var_212_30 = 0.5

				for iter_212_2, iter_212_3 in pairs(arg_209_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_212_3 then
						iter_212_3.color = Color.New(var_212_30, var_212_30, var_212_30)
					end
				end

				arg_209_1.var_.actorSpriteComps10030 = nil
			end

			local var_212_31 = 0
			local var_212_32 = 0.375

			if var_212_31 < arg_209_1.time_ and arg_209_1.time_ <= var_212_31 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_33 = arg_209_1:FormatText(StoryNameCfg[312].name)

				arg_209_1.leftNameTxt_.text = var_212_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_34 = arg_209_1:GetWordFromCfg(115271052)
				local var_212_35 = arg_209_1:FormatText(var_212_34.content)

				arg_209_1.text_.text = var_212_35

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_36 = 15
				local var_212_37 = utf8.len(var_212_35)
				local var_212_38 = var_212_36 <= 0 and var_212_32 or var_212_32 * (var_212_37 / var_212_36)

				if var_212_38 > 0 and var_212_32 < var_212_38 then
					arg_209_1.talkMaxDuration = var_212_38

					if var_212_38 + var_212_31 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_38 + var_212_31
					end
				end

				arg_209_1.text_.text = var_212_35
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271052", "story_v_out_115271.awb") ~= 0 then
					local var_212_39 = manager.audio:GetVoiceLength("story_v_out_115271", "115271052", "story_v_out_115271.awb") / 1000

					if var_212_39 + var_212_31 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_39 + var_212_31
					end

					if var_212_34.prefab_name ~= "" and arg_209_1.actors_[var_212_34.prefab_name] ~= nil then
						local var_212_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_34.prefab_name].transform, "story_v_out_115271", "115271052", "story_v_out_115271.awb")

						arg_209_1:RecordAudio("115271052", var_212_40)
						arg_209_1:RecordAudio("115271052", var_212_40)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_115271", "115271052", "story_v_out_115271.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_115271", "115271052", "story_v_out_115271.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_41 = math.max(var_212_32, arg_209_1.talkMaxDuration)

			if var_212_31 <= arg_209_1.time_ and arg_209_1.time_ < var_212_31 + var_212_41 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_31) / var_212_41

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_31 + var_212_41 and arg_209_1.time_ < var_212_31 + var_212_41 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play115271053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 115271053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play115271054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10029"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				local var_216_2 = var_216_0:GetComponent("Image")

				if var_216_2 then
					arg_213_1.var_.highlightMatValue10029 = var_216_2
				end
			end

			local var_216_3 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_3 then
				local var_216_4 = (arg_213_1.time_ - var_216_1) / var_216_3

				if arg_213_1.var_.highlightMatValue10029 then
					local var_216_5 = Mathf.Lerp(1, 0.5, var_216_4)
					local var_216_6 = arg_213_1.var_.highlightMatValue10029
					local var_216_7 = var_216_6.color

					var_216_7.r = var_216_5
					var_216_7.g = var_216_5
					var_216_7.b = var_216_5
					var_216_6.color = var_216_7
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_3 and arg_213_1.time_ < var_216_1 + var_216_3 + arg_216_0 and arg_213_1.var_.highlightMatValue10029 then
				local var_216_8 = 0.5
				local var_216_9 = arg_213_1.var_.highlightMatValue10029
				local var_216_10 = var_216_9.color

				var_216_10.r = var_216_8
				var_216_10.g = var_216_8
				var_216_10.b = var_216_8
				var_216_9.color = var_216_10
			end

			local var_216_11 = 0
			local var_216_12 = 1

			if var_216_11 < arg_213_1.time_ and arg_213_1.time_ <= var_216_11 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_13 = arg_213_1:GetWordFromCfg(115271053)
				local var_216_14 = arg_213_1:FormatText(var_216_13.content)

				arg_213_1.text_.text = var_216_14

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_15 = 40
				local var_216_16 = utf8.len(var_216_14)
				local var_216_17 = var_216_15 <= 0 and var_216_12 or var_216_12 * (var_216_16 / var_216_15)

				if var_216_17 > 0 and var_216_12 < var_216_17 then
					arg_213_1.talkMaxDuration = var_216_17

					if var_216_17 + var_216_11 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_17 + var_216_11
					end
				end

				arg_213_1.text_.text = var_216_14
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_18 = math.max(var_216_12, arg_213_1.talkMaxDuration)

			if var_216_11 <= arg_213_1.time_ and arg_213_1.time_ < var_216_11 + var_216_18 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_11) / var_216_18

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_11 + var_216_18 and arg_213_1.time_ < var_216_11 + var_216_18 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play115271054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 115271054
		arg_217_1.duration_ = 1.9

		local var_217_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.9,
			en = 1.1
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
				arg_217_0:Play115271055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.05

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[94].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(115271054)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271054", "story_v_out_115271.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271054", "story_v_out_115271.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_115271", "115271054", "story_v_out_115271.awb")

						arg_217_1:RecordAudio("115271054", var_220_9)
						arg_217_1:RecordAudio("115271054", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_115271", "115271054", "story_v_out_115271.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_115271", "115271054", "story_v_out_115271.awb")
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
	Play115271055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 115271055
		arg_221_1.duration_ = 2.6

		local var_221_0 = {
			ja = 2.1,
			ko = 1.4,
			zh = 2.6,
			en = 1.566
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
				arg_221_0:Play115271056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10030"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10030 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10030", 4)

				local var_224_2 = var_224_0.childCount

				for iter_224_0 = 0, var_224_2 - 1 do
					local var_224_3 = var_224_0:GetChild(iter_224_0)

					if var_224_3.name == "split_2" or not string.find(var_224_3.name, "split") then
						var_224_3.gameObject:SetActive(true)
					else
						var_224_3.gameObject:SetActive(false)
					end
				end
			end

			local var_224_4 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_4 then
				local var_224_5 = (arg_221_1.time_ - var_224_1) / var_224_4
				local var_224_6 = Vector3.New(390, -390, 150)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10030, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_224_7 = arg_221_1.actors_["10030"]
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 and arg_221_1.var_.actorSpriteComps10030 == nil then
				arg_221_1.var_.actorSpriteComps10030 = var_224_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_9 = 0.2

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_9 then
				local var_224_10 = (arg_221_1.time_ - var_224_8) / var_224_9

				if arg_221_1.var_.actorSpriteComps10030 then
					for iter_224_1, iter_224_2 in pairs(arg_221_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_224_2 then
							local var_224_11 = Mathf.Lerp(iter_224_2.color.r, 1, var_224_10)

							iter_224_2.color = Color.New(var_224_11, var_224_11, var_224_11)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_8 + var_224_9 and arg_221_1.time_ < var_224_8 + var_224_9 + arg_224_0 and arg_221_1.var_.actorSpriteComps10030 then
				local var_224_12 = 1

				for iter_224_3, iter_224_4 in pairs(arg_221_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_224_4 then
						iter_224_4.color = Color.New(var_224_12, var_224_12, var_224_12)
					end
				end

				arg_221_1.var_.actorSpriteComps10030 = nil
			end

			local var_224_13 = arg_221_1.actors_["10030"]
			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				local var_224_15 = var_224_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_224_15 then
					arg_221_1.var_.alphaOldValue10030 = var_224_15.alpha
					arg_221_1.var_.characterEffect10030 = var_224_15
				end

				arg_221_1.var_.alphaOldValue10030 = 0
			end

			local var_224_16 = 0.0166666666666667

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_14) / var_224_16
				local var_224_18 = Mathf.Lerp(arg_221_1.var_.alphaOldValue10030, 1, var_224_17)

				if arg_221_1.var_.characterEffect10030 then
					arg_221_1.var_.characterEffect10030.alpha = var_224_18
				end
			end

			if arg_221_1.time_ >= var_224_14 + var_224_16 and arg_221_1.time_ < var_224_14 + var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect10030 then
				arg_221_1.var_.characterEffect10030.alpha = 1
			end

			local var_224_19 = 0
			local var_224_20 = 0.125

			if var_224_19 < arg_221_1.time_ and arg_221_1.time_ <= var_224_19 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_21 = arg_221_1:FormatText(StoryNameCfg[309].name)

				arg_221_1.leftNameTxt_.text = var_224_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_22 = arg_221_1:GetWordFromCfg(115271055)
				local var_224_23 = arg_221_1:FormatText(var_224_22.content)

				arg_221_1.text_.text = var_224_23

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_24 = 5
				local var_224_25 = utf8.len(var_224_23)
				local var_224_26 = var_224_24 <= 0 and var_224_20 or var_224_20 * (var_224_25 / var_224_24)

				if var_224_26 > 0 and var_224_20 < var_224_26 then
					arg_221_1.talkMaxDuration = var_224_26

					if var_224_26 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_26 + var_224_19
					end
				end

				arg_221_1.text_.text = var_224_23
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271055", "story_v_out_115271.awb") ~= 0 then
					local var_224_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271055", "story_v_out_115271.awb") / 1000

					if var_224_27 + var_224_19 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_27 + var_224_19
					end

					if var_224_22.prefab_name ~= "" and arg_221_1.actors_[var_224_22.prefab_name] ~= nil then
						local var_224_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_22.prefab_name].transform, "story_v_out_115271", "115271055", "story_v_out_115271.awb")

						arg_221_1:RecordAudio("115271055", var_224_28)
						arg_221_1:RecordAudio("115271055", var_224_28)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_115271", "115271055", "story_v_out_115271.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_115271", "115271055", "story_v_out_115271.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_29 = math.max(var_224_20, arg_221_1.talkMaxDuration)

			if var_224_19 <= arg_221_1.time_ and arg_221_1.time_ < var_224_19 + var_224_29 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_19) / var_224_29

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_19 + var_224_29 and arg_221_1.time_ < var_224_19 + var_224_29 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play115271056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115271056
		arg_225_1.duration_ = 13.9

		local var_225_0 = {
			ja = 13.9,
			ko = 10.2,
			zh = 8.266,
			en = 11.6
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
				arg_225_0:Play115271057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10030"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.actorSpriteComps10030 == nil then
				arg_225_1.var_.actorSpriteComps10030 = var_228_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.actorSpriteComps10030 then
					for iter_228_0, iter_228_1 in pairs(arg_225_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_228_1 then
							local var_228_4 = Mathf.Lerp(iter_228_1.color.r, 0.5, var_228_3)

							iter_228_1.color = Color.New(var_228_4, var_228_4, var_228_4)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.actorSpriteComps10030 then
				local var_228_5 = 0.5

				for iter_228_2, iter_228_3 in pairs(arg_225_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_228_3 then
						iter_228_3.color = Color.New(var_228_5, var_228_5, var_228_5)
					end
				end

				arg_225_1.var_.actorSpriteComps10030 = nil
			end

			local var_228_6 = arg_225_1.actors_["10029"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 then
				local var_228_8 = var_228_6:GetComponent("Image")

				if var_228_8 then
					arg_225_1.var_.highlightMatValue10029 = var_228_8
				end
			end

			local var_228_9 = 0.2

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_7) / var_228_9

				if arg_225_1.var_.highlightMatValue10029 then
					local var_228_11 = Mathf.Lerp(0.5, 1, var_228_10)
					local var_228_12 = arg_225_1.var_.highlightMatValue10029
					local var_228_13 = var_228_12.color

					var_228_13.r = var_228_11
					var_228_13.g = var_228_11
					var_228_13.b = var_228_11
					var_228_12.color = var_228_13
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_9 and arg_225_1.time_ < var_228_7 + var_228_9 + arg_228_0 and arg_225_1.var_.highlightMatValue10029 then
				local var_228_14 = 1

				var_228_6.transform:SetSiblingIndex(1)

				local var_228_15 = arg_225_1.var_.highlightMatValue10029
				local var_228_16 = var_228_15.color

				var_228_16.r = var_228_14
				var_228_16.g = var_228_14
				var_228_16.b = var_228_14
				var_228_15.color = var_228_16
			end

			local var_228_17 = 0
			local var_228_18 = 0.9

			if var_228_17 < arg_225_1.time_ and arg_225_1.time_ <= var_228_17 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_19 = arg_225_1:FormatText(StoryNameCfg[312].name)

				arg_225_1.leftNameTxt_.text = var_228_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_20 = arg_225_1:GetWordFromCfg(115271056)
				local var_228_21 = arg_225_1:FormatText(var_228_20.content)

				arg_225_1.text_.text = var_228_21

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_22 = 36
				local var_228_23 = utf8.len(var_228_21)
				local var_228_24 = var_228_22 <= 0 and var_228_18 or var_228_18 * (var_228_23 / var_228_22)

				if var_228_24 > 0 and var_228_18 < var_228_24 then
					arg_225_1.talkMaxDuration = var_228_24

					if var_228_24 + var_228_17 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_24 + var_228_17
					end
				end

				arg_225_1.text_.text = var_228_21
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271056", "story_v_out_115271.awb") ~= 0 then
					local var_228_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271056", "story_v_out_115271.awb") / 1000

					if var_228_25 + var_228_17 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_25 + var_228_17
					end

					if var_228_20.prefab_name ~= "" and arg_225_1.actors_[var_228_20.prefab_name] ~= nil then
						local var_228_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_20.prefab_name].transform, "story_v_out_115271", "115271056", "story_v_out_115271.awb")

						arg_225_1:RecordAudio("115271056", var_228_26)
						arg_225_1:RecordAudio("115271056", var_228_26)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_115271", "115271056", "story_v_out_115271.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_115271", "115271056", "story_v_out_115271.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_27 = math.max(var_228_18, arg_225_1.talkMaxDuration)

			if var_228_17 <= arg_225_1.time_ and arg_225_1.time_ < var_228_17 + var_228_27 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_17) / var_228_27

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_17 + var_228_27 and arg_225_1.time_ < var_228_17 + var_228_27 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play115271057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115271057
		arg_229_1.duration_ = 9.5

		local var_229_0 = {
			ja = 6,
			ko = 9.133,
			zh = 7.9,
			en = 9.5
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
				arg_229_0:Play115271058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.725

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_2 = arg_229_1:FormatText(StoryNameCfg[312].name)

				arg_229_1.leftNameTxt_.text = var_232_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_3 = arg_229_1:GetWordFromCfg(115271057)
				local var_232_4 = arg_229_1:FormatText(var_232_3.content)

				arg_229_1.text_.text = var_232_4

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_5 = 29
				local var_232_6 = utf8.len(var_232_4)
				local var_232_7 = var_232_5 <= 0 and var_232_1 or var_232_1 * (var_232_6 / var_232_5)

				if var_232_7 > 0 and var_232_1 < var_232_7 then
					arg_229_1.talkMaxDuration = var_232_7

					if var_232_7 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_7 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_4
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271057", "story_v_out_115271.awb") ~= 0 then
					local var_232_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271057", "story_v_out_115271.awb") / 1000

					if var_232_8 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_8 + var_232_0
					end

					if var_232_3.prefab_name ~= "" and arg_229_1.actors_[var_232_3.prefab_name] ~= nil then
						local var_232_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_3.prefab_name].transform, "story_v_out_115271", "115271057", "story_v_out_115271.awb")

						arg_229_1:RecordAudio("115271057", var_232_9)
						arg_229_1:RecordAudio("115271057", var_232_9)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115271", "115271057", "story_v_out_115271.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115271", "115271057", "story_v_out_115271.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_10 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_10 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_10

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_10 and arg_229_1.time_ < var_232_0 + var_232_10 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115271058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 115271058
		arg_233_1.duration_ = 7.2

		local var_233_0 = {
			ja = 7.2,
			ko = 5.2,
			zh = 4.9,
			en = 5.1
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
				arg_233_0:Play115271059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10030"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.actorSpriteComps10030 == nil then
				arg_233_1.var_.actorSpriteComps10030 = var_236_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_2 = 0.2

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.actorSpriteComps10030 then
					for iter_236_0, iter_236_1 in pairs(arg_233_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_236_1 then
							local var_236_4 = Mathf.Lerp(iter_236_1.color.r, 1, var_236_3)

							iter_236_1.color = Color.New(var_236_4, var_236_4, var_236_4)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.actorSpriteComps10030 then
				local var_236_5 = 1

				for iter_236_2, iter_236_3 in pairs(arg_233_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_236_3 then
						iter_236_3.color = Color.New(var_236_5, var_236_5, var_236_5)
					end
				end

				arg_233_1.var_.actorSpriteComps10030 = nil
			end

			local var_236_6 = arg_233_1.actors_["10029"]
			local var_236_7 = 0

			if var_236_7 < arg_233_1.time_ and arg_233_1.time_ <= var_236_7 + arg_236_0 then
				local var_236_8 = var_236_6:GetComponent("Image")

				if var_236_8 then
					arg_233_1.var_.highlightMatValue10029 = var_236_8
				end
			end

			local var_236_9 = 0.2

			if var_236_7 <= arg_233_1.time_ and arg_233_1.time_ < var_236_7 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_7) / var_236_9

				if arg_233_1.var_.highlightMatValue10029 then
					local var_236_11 = Mathf.Lerp(1, 0.5, var_236_10)
					local var_236_12 = arg_233_1.var_.highlightMatValue10029
					local var_236_13 = var_236_12.color

					var_236_13.r = var_236_11
					var_236_13.g = var_236_11
					var_236_13.b = var_236_11
					var_236_12.color = var_236_13
				end
			end

			if arg_233_1.time_ >= var_236_7 + var_236_9 and arg_233_1.time_ < var_236_7 + var_236_9 + arg_236_0 and arg_233_1.var_.highlightMatValue10029 then
				local var_236_14 = 0.5
				local var_236_15 = arg_233_1.var_.highlightMatValue10029
				local var_236_16 = var_236_15.color

				var_236_16.r = var_236_14
				var_236_16.g = var_236_14
				var_236_16.b = var_236_14
				var_236_15.color = var_236_16
			end

			local var_236_17 = 0
			local var_236_18 = 0.5

			if var_236_17 < arg_233_1.time_ and arg_233_1.time_ <= var_236_17 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_19 = arg_233_1:FormatText(StoryNameCfg[309].name)

				arg_233_1.leftNameTxt_.text = var_236_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_20 = arg_233_1:GetWordFromCfg(115271058)
				local var_236_21 = arg_233_1:FormatText(var_236_20.content)

				arg_233_1.text_.text = var_236_21

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_22 = 20
				local var_236_23 = utf8.len(var_236_21)
				local var_236_24 = var_236_22 <= 0 and var_236_18 or var_236_18 * (var_236_23 / var_236_22)

				if var_236_24 > 0 and var_236_18 < var_236_24 then
					arg_233_1.talkMaxDuration = var_236_24

					if var_236_24 + var_236_17 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_24 + var_236_17
					end
				end

				arg_233_1.text_.text = var_236_21
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271058", "story_v_out_115271.awb") ~= 0 then
					local var_236_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271058", "story_v_out_115271.awb") / 1000

					if var_236_25 + var_236_17 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_25 + var_236_17
					end

					if var_236_20.prefab_name ~= "" and arg_233_1.actors_[var_236_20.prefab_name] ~= nil then
						local var_236_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_20.prefab_name].transform, "story_v_out_115271", "115271058", "story_v_out_115271.awb")

						arg_233_1:RecordAudio("115271058", var_236_26)
						arg_233_1:RecordAudio("115271058", var_236_26)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_115271", "115271058", "story_v_out_115271.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_115271", "115271058", "story_v_out_115271.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_27 = math.max(var_236_18, arg_233_1.talkMaxDuration)

			if var_236_17 <= arg_233_1.time_ and arg_233_1.time_ < var_236_17 + var_236_27 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_17) / var_236_27

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_17 + var_236_27 and arg_233_1.time_ < var_236_17 + var_236_27 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play115271059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115271059
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play115271060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10030"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 == nil then
				arg_237_1.var_.actorSpriteComps10030 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps10030 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 0.5, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps10030 then
				local var_240_5 = 0.5

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps10030 = nil
			end

			local var_240_6 = 0
			local var_240_7 = 0.625

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_8 = arg_237_1:GetWordFromCfg(115271059)
				local var_240_9 = arg_237_1:FormatText(var_240_8.content)

				arg_237_1.text_.text = var_240_9

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_10 = 25
				local var_240_11 = utf8.len(var_240_9)
				local var_240_12 = var_240_10 <= 0 and var_240_7 or var_240_7 * (var_240_11 / var_240_10)

				if var_240_12 > 0 and var_240_7 < var_240_12 then
					arg_237_1.talkMaxDuration = var_240_12

					if var_240_12 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_9
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_13 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_13 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_13

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_13 and arg_237_1.time_ < var_240_6 + var_240_13 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play115271060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115271060
		arg_241_1.duration_ = 9.566

		local var_241_0 = {
			ja = 9.566,
			ko = 4.366,
			zh = 5.733,
			en = 8.133
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
				arg_241_0:Play115271061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10029"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				local var_244_2 = var_244_0:GetComponent("Image")

				if var_244_2 then
					arg_241_1.var_.highlightMatValue10029 = var_244_2
				end
			end

			local var_244_3 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_3 then
				local var_244_4 = (arg_241_1.time_ - var_244_1) / var_244_3

				if arg_241_1.var_.highlightMatValue10029 then
					local var_244_5 = Mathf.Lerp(0.5, 1, var_244_4)
					local var_244_6 = arg_241_1.var_.highlightMatValue10029
					local var_244_7 = var_244_6.color

					var_244_7.r = var_244_5
					var_244_7.g = var_244_5
					var_244_7.b = var_244_5
					var_244_6.color = var_244_7
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_3 and arg_241_1.time_ < var_244_1 + var_244_3 + arg_244_0 and arg_241_1.var_.highlightMatValue10029 then
				local var_244_8 = 1

				var_244_0.transform:SetSiblingIndex(1)

				local var_244_9 = arg_241_1.var_.highlightMatValue10029
				local var_244_10 = var_244_9.color

				var_244_10.r = var_244_8
				var_244_10.g = var_244_8
				var_244_10.b = var_244_8
				var_244_9.color = var_244_10
			end

			local var_244_11 = 0
			local var_244_12 = 0.325

			if var_244_11 < arg_241_1.time_ and arg_241_1.time_ <= var_244_11 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_13 = arg_241_1:FormatText(StoryNameCfg[312].name)

				arg_241_1.leftNameTxt_.text = var_244_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_14 = arg_241_1:GetWordFromCfg(115271060)
				local var_244_15 = arg_241_1:FormatText(var_244_14.content)

				arg_241_1.text_.text = var_244_15

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_16 = 13
				local var_244_17 = utf8.len(var_244_15)
				local var_244_18 = var_244_16 <= 0 and var_244_12 or var_244_12 * (var_244_17 / var_244_16)

				if var_244_18 > 0 and var_244_12 < var_244_18 then
					arg_241_1.talkMaxDuration = var_244_18

					if var_244_18 + var_244_11 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_18 + var_244_11
					end
				end

				arg_241_1.text_.text = var_244_15
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271060", "story_v_out_115271.awb") ~= 0 then
					local var_244_19 = manager.audio:GetVoiceLength("story_v_out_115271", "115271060", "story_v_out_115271.awb") / 1000

					if var_244_19 + var_244_11 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_19 + var_244_11
					end

					if var_244_14.prefab_name ~= "" and arg_241_1.actors_[var_244_14.prefab_name] ~= nil then
						local var_244_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_14.prefab_name].transform, "story_v_out_115271", "115271060", "story_v_out_115271.awb")

						arg_241_1:RecordAudio("115271060", var_244_20)
						arg_241_1:RecordAudio("115271060", var_244_20)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115271", "115271060", "story_v_out_115271.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115271", "115271060", "story_v_out_115271.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_21 = math.max(var_244_12, arg_241_1.talkMaxDuration)

			if var_244_11 <= arg_241_1.time_ and arg_241_1.time_ < var_244_11 + var_244_21 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_11) / var_244_21

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_11 + var_244_21 and arg_241_1.time_ < var_244_11 + var_244_21 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play115271061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115271061
		arg_245_1.duration_ = 8.866

		local var_245_0 = {
			ja = 8.866,
			ko = 6.6,
			zh = 5.5,
			en = 8.266
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
				arg_245_0:Play115271062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.675

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[312].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(115271061)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271061", "story_v_out_115271.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271061", "story_v_out_115271.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_115271", "115271061", "story_v_out_115271.awb")

						arg_245_1:RecordAudio("115271061", var_248_9)
						arg_245_1:RecordAudio("115271061", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_115271", "115271061", "story_v_out_115271.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_115271", "115271061", "story_v_out_115271.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_10 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_10 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_10

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_10 and arg_245_1.time_ < var_248_0 + var_248_10 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115271062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 115271062
		arg_249_1.duration_ = 12.1

		local var_249_0 = {
			ja = 10.466,
			ko = 10.066,
			zh = 9.933,
			en = 12.1
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
				arg_249_0:Play115271063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10030"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				local var_252_2 = var_252_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_252_2 then
					arg_249_1.var_.alphaOldValue10030 = var_252_2.alpha
					arg_249_1.var_.characterEffect10030 = var_252_2
				end

				arg_249_1.var_.alphaOldValue10030 = 1
			end

			local var_252_3 = 0.5

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_3 then
				local var_252_4 = (arg_249_1.time_ - var_252_1) / var_252_3
				local var_252_5 = Mathf.Lerp(arg_249_1.var_.alphaOldValue10030, 0, var_252_4)

				if arg_249_1.var_.characterEffect10030 then
					arg_249_1.var_.characterEffect10030.alpha = var_252_5
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_3 and arg_249_1.time_ < var_252_1 + var_252_3 + arg_252_0 and arg_249_1.var_.characterEffect10030 then
				arg_249_1.var_.characterEffect10030.alpha = 0
			end

			local var_252_6 = arg_249_1.actors_["10029"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 then
				local var_252_8 = var_252_6:GetComponent("Image")

				if var_252_8 then
					arg_249_1.var_.alphaMatValue10029 = var_252_8
					arg_249_1.var_.alphaOldValue10029 = var_252_8.color.a
				end

				arg_249_1.var_.alphaOldValue10029 = 1
			end

			local var_252_9 = 0.5

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_9 then
				local var_252_10 = (arg_249_1.time_ - var_252_7) / var_252_9
				local var_252_11 = Mathf.Lerp(arg_249_1.var_.alphaOldValue10029, 0, var_252_10)

				if arg_249_1.var_.alphaMatValue10029 then
					local var_252_12 = arg_249_1.var_.alphaMatValue10029.color

					var_252_12.a = var_252_11
					arg_249_1.var_.alphaMatValue10029.color = var_252_12
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_9 and arg_249_1.time_ < var_252_7 + var_252_9 + arg_252_0 and arg_249_1.var_.alphaMatValue10029 then
				local var_252_13 = arg_249_1.var_.alphaMatValue10029
				local var_252_14 = var_252_13.color

				var_252_14.a = 0
				var_252_13.color = var_252_14
			end

			local var_252_15 = 0
			local var_252_16 = 0.85

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_17 = arg_249_1:FormatText(StoryNameCfg[224].name)

				arg_249_1.leftNameTxt_.text = var_252_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, true)
				arg_249_1.iconController_:SetSelectedState("hero")

				arg_249_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerkb")

				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_18 = arg_249_1:GetWordFromCfg(115271062)
				local var_252_19 = arg_249_1:FormatText(var_252_18.content)

				arg_249_1.text_.text = var_252_19

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_20 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271062", "story_v_out_115271.awb") ~= 0 then
					local var_252_23 = manager.audio:GetVoiceLength("story_v_out_115271", "115271062", "story_v_out_115271.awb") / 1000

					if var_252_23 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_23 + var_252_15
					end

					if var_252_18.prefab_name ~= "" and arg_249_1.actors_[var_252_18.prefab_name] ~= nil then
						local var_252_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_18.prefab_name].transform, "story_v_out_115271", "115271062", "story_v_out_115271.awb")

						arg_249_1:RecordAudio("115271062", var_252_24)
						arg_249_1:RecordAudio("115271062", var_252_24)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_115271", "115271062", "story_v_out_115271.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_115271", "115271062", "story_v_out_115271.awb")
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
	Play115271063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 115271063
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play115271064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 1

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_2 = arg_253_1:GetWordFromCfg(115271063)
				local var_256_3 = arg_253_1:FormatText(var_256_2.content)

				arg_253_1.text_.text = var_256_3

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_4 = 40
				local var_256_5 = utf8.len(var_256_3)
				local var_256_6 = var_256_4 <= 0 and var_256_1 or var_256_1 * (var_256_5 / var_256_4)

				if var_256_6 > 0 and var_256_1 < var_256_6 then
					arg_253_1.talkMaxDuration = var_256_6

					if var_256_6 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_6 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_3
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_7 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_7 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_7

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_7 and arg_253_1.time_ < var_256_0 + var_256_7 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play115271064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 115271064
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play115271065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				local var_260_2 = "play"
				local var_260_3 = "effect"

				arg_257_1:AudioAction(var_260_2, var_260_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks", "")
			end

			local var_260_4 = 0
			local var_260_5 = 1.825

			if var_260_4 < arg_257_1.time_ and arg_257_1.time_ <= var_260_4 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_6 = arg_257_1:GetWordFromCfg(115271064)
				local var_260_7 = arg_257_1:FormatText(var_260_6.content)

				arg_257_1.text_.text = var_260_7

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_8 = 73
				local var_260_9 = utf8.len(var_260_7)
				local var_260_10 = var_260_8 <= 0 and var_260_5 or var_260_5 * (var_260_9 / var_260_8)

				if var_260_10 > 0 and var_260_5 < var_260_10 then
					arg_257_1.talkMaxDuration = var_260_10

					if var_260_10 + var_260_4 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_10 + var_260_4
					end
				end

				arg_257_1.text_.text = var_260_7
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_11 = math.max(var_260_5, arg_257_1.talkMaxDuration)

			if var_260_4 <= arg_257_1.time_ and arg_257_1.time_ < var_260_4 + var_260_11 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_4) / var_260_11

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_4 + var_260_11 and arg_257_1.time_ < var_260_4 + var_260_11 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play115271065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 115271065
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play115271066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 1

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				local var_264_2 = "play"
				local var_264_3 = "effect"

				arg_261_1:AudioAction(var_264_2, var_264_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks_loop", "")
			end

			local var_264_4 = 0
			local var_264_5 = 1.55

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

				local var_264_6 = arg_261_1:GetWordFromCfg(115271065)
				local var_264_7 = arg_261_1:FormatText(var_264_6.content)

				arg_261_1.text_.text = var_264_7

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_8 = 62
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
	Play115271066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 115271066
		arg_265_1.duration_ = 4.533

		local var_265_0 = {
			ja = 1.466,
			ko = 3.5,
			zh = 2.6,
			en = 4.533
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
				arg_265_0:Play115271067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10030"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos10030 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("10030", 4)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "split_1" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(390, -390, 150)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10030, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_268_7 = arg_265_1.actors_["10030"]
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 then
				local var_268_9 = var_268_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_268_9 then
					arg_265_1.var_.alphaOldValue10030 = var_268_9.alpha
					arg_265_1.var_.characterEffect10030 = var_268_9
				end

				arg_265_1.var_.alphaOldValue10030 = 0
			end

			local var_268_10 = 0.5

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_10 then
				local var_268_11 = (arg_265_1.time_ - var_268_8) / var_268_10
				local var_268_12 = Mathf.Lerp(arg_265_1.var_.alphaOldValue10030, 1, var_268_11)

				if arg_265_1.var_.characterEffect10030 then
					arg_265_1.var_.characterEffect10030.alpha = var_268_12
				end
			end

			if arg_265_1.time_ >= var_268_8 + var_268_10 and arg_265_1.time_ < var_268_8 + var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect10030 then
				arg_265_1.var_.characterEffect10030.alpha = 1
			end

			local var_268_13 = arg_265_1.actors_["10030"]
			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 and arg_265_1.var_.actorSpriteComps10030 == nil then
				arg_265_1.var_.actorSpriteComps10030 = var_268_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_15 = 0.2

			if var_268_14 <= arg_265_1.time_ and arg_265_1.time_ < var_268_14 + var_268_15 then
				local var_268_16 = (arg_265_1.time_ - var_268_14) / var_268_15

				if arg_265_1.var_.actorSpriteComps10030 then
					for iter_268_1, iter_268_2 in pairs(arg_265_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_268_2 then
							local var_268_17 = Mathf.Lerp(iter_268_2.color.r, 1, var_268_16)

							iter_268_2.color = Color.New(var_268_17, var_268_17, var_268_17)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_14 + var_268_15 and arg_265_1.time_ < var_268_14 + var_268_15 + arg_268_0 and arg_265_1.var_.actorSpriteComps10030 then
				local var_268_18 = 1

				for iter_268_3, iter_268_4 in pairs(arg_265_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_268_4 then
						iter_268_4.color = Color.New(var_268_18, var_268_18, var_268_18)
					end
				end

				arg_265_1.var_.actorSpriteComps10030 = nil
			end

			local var_268_19 = 0
			local var_268_20 = 0.275

			if var_268_19 < arg_265_1.time_ and arg_265_1.time_ <= var_268_19 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_21 = arg_265_1:FormatText(StoryNameCfg[309].name)

				arg_265_1.leftNameTxt_.text = var_268_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_22 = arg_265_1:GetWordFromCfg(115271066)
				local var_268_23 = arg_265_1:FormatText(var_268_22.content)

				arg_265_1.text_.text = var_268_23

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_24 = 11
				local var_268_25 = utf8.len(var_268_23)
				local var_268_26 = var_268_24 <= 0 and var_268_20 or var_268_20 * (var_268_25 / var_268_24)

				if var_268_26 > 0 and var_268_20 < var_268_26 then
					arg_265_1.talkMaxDuration = var_268_26

					if var_268_26 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_26 + var_268_19
					end
				end

				arg_265_1.text_.text = var_268_23
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271066", "story_v_out_115271.awb") ~= 0 then
					local var_268_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271066", "story_v_out_115271.awb") / 1000

					if var_268_27 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_27 + var_268_19
					end

					if var_268_22.prefab_name ~= "" and arg_265_1.actors_[var_268_22.prefab_name] ~= nil then
						local var_268_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_22.prefab_name].transform, "story_v_out_115271", "115271066", "story_v_out_115271.awb")

						arg_265_1:RecordAudio("115271066", var_268_28)
						arg_265_1:RecordAudio("115271066", var_268_28)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_115271", "115271066", "story_v_out_115271.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_115271", "115271066", "story_v_out_115271.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_29 = math.max(var_268_20, arg_265_1.talkMaxDuration)

			if var_268_19 <= arg_265_1.time_ and arg_265_1.time_ < var_268_19 + var_268_29 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_19) / var_268_29

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_19 + var_268_29 and arg_265_1.time_ < var_268_19 + var_268_29 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play115271067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 115271067
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play115271068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10030"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.actorSpriteComps10030 == nil then
				arg_269_1.var_.actorSpriteComps10030 = var_272_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.actorSpriteComps10030 then
					for iter_272_0, iter_272_1 in pairs(arg_269_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_272_1 then
							local var_272_4 = Mathf.Lerp(iter_272_1.color.r, 0.5, var_272_3)

							iter_272_1.color = Color.New(var_272_4, var_272_4, var_272_4)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.actorSpriteComps10030 then
				local var_272_5 = 0.5

				for iter_272_2, iter_272_3 in pairs(arg_269_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_272_3 then
						iter_272_3.color = Color.New(var_272_5, var_272_5, var_272_5)
					end
				end

				arg_269_1.var_.actorSpriteComps10030 = nil
			end

			local var_272_6 = 0
			local var_272_7 = 0.5

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_8 = arg_269_1:GetWordFromCfg(115271067)
				local var_272_9 = arg_269_1:FormatText(var_272_8.content)

				arg_269_1.text_.text = var_272_9

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_10 = 20
				local var_272_11 = utf8.len(var_272_9)
				local var_272_12 = var_272_10 <= 0 and var_272_7 or var_272_7 * (var_272_11 / var_272_10)

				if var_272_12 > 0 and var_272_7 < var_272_12 then
					arg_269_1.talkMaxDuration = var_272_12

					if var_272_12 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_12 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_9
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_13 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_13 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_13

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_13 and arg_269_1.time_ < var_272_6 + var_272_13 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play115271068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 115271068
		arg_273_1.duration_ = 16.666

		local var_273_0 = {
			ja = 9.4,
			ko = 12.1,
			zh = 8.2,
			en = 16.666
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
				arg_273_0:Play115271069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["10029"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 then
				local var_276_2 = var_276_0:GetComponent("Image")

				if var_276_2 then
					arg_273_1.var_.highlightMatValue10029 = var_276_2
				end
			end

			local var_276_3 = 0.2

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_3 then
				local var_276_4 = (arg_273_1.time_ - var_276_1) / var_276_3

				if arg_273_1.var_.highlightMatValue10029 then
					local var_276_5 = Mathf.Lerp(0.5, 1, var_276_4)
					local var_276_6 = arg_273_1.var_.highlightMatValue10029
					local var_276_7 = var_276_6.color

					var_276_7.r = var_276_5
					var_276_7.g = var_276_5
					var_276_7.b = var_276_5
					var_276_6.color = var_276_7
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_3 and arg_273_1.time_ < var_276_1 + var_276_3 + arg_276_0 and arg_273_1.var_.highlightMatValue10029 then
				local var_276_8 = 1

				var_276_0.transform:SetSiblingIndex(1)

				local var_276_9 = arg_273_1.var_.highlightMatValue10029
				local var_276_10 = var_276_9.color

				var_276_10.r = var_276_8
				var_276_10.g = var_276_8
				var_276_10.b = var_276_8
				var_276_9.color = var_276_10
			end

			local var_276_11 = arg_273_1.actors_["10029"]
			local var_276_12 = 0

			if var_276_12 < arg_273_1.time_ and arg_273_1.time_ <= var_276_12 + arg_276_0 then
				local var_276_13 = var_276_11:GetComponent("Image")

				if var_276_13 then
					arg_273_1.var_.alphaMatValue10029 = var_276_13
					arg_273_1.var_.alphaOldValue10029 = var_276_13.color.a
				end

				arg_273_1.var_.alphaOldValue10029 = 0
			end

			local var_276_14 = 0.5

			if var_276_12 <= arg_273_1.time_ and arg_273_1.time_ < var_276_12 + var_276_14 then
				local var_276_15 = (arg_273_1.time_ - var_276_12) / var_276_14
				local var_276_16 = Mathf.Lerp(arg_273_1.var_.alphaOldValue10029, 1, var_276_15)

				if arg_273_1.var_.alphaMatValue10029 then
					local var_276_17 = arg_273_1.var_.alphaMatValue10029.color

					var_276_17.a = var_276_16
					arg_273_1.var_.alphaMatValue10029.color = var_276_17
				end
			end

			if arg_273_1.time_ >= var_276_12 + var_276_14 and arg_273_1.time_ < var_276_12 + var_276_14 + arg_276_0 and arg_273_1.var_.alphaMatValue10029 then
				local var_276_18 = arg_273_1.var_.alphaMatValue10029
				local var_276_19 = var_276_18.color

				var_276_19.a = 1
				var_276_18.color = var_276_19
			end

			local var_276_20 = 0
			local var_276_21 = 0.975

			if var_276_20 < arg_273_1.time_ and arg_273_1.time_ <= var_276_20 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_22 = arg_273_1:FormatText(StoryNameCfg[312].name)

				arg_273_1.leftNameTxt_.text = var_276_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_23 = arg_273_1:GetWordFromCfg(115271068)
				local var_276_24 = arg_273_1:FormatText(var_276_23.content)

				arg_273_1.text_.text = var_276_24

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_25 = 39
				local var_276_26 = utf8.len(var_276_24)
				local var_276_27 = var_276_25 <= 0 and var_276_21 or var_276_21 * (var_276_26 / var_276_25)

				if var_276_27 > 0 and var_276_21 < var_276_27 then
					arg_273_1.talkMaxDuration = var_276_27

					if var_276_27 + var_276_20 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_27 + var_276_20
					end
				end

				arg_273_1.text_.text = var_276_24
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271068", "story_v_out_115271.awb") ~= 0 then
					local var_276_28 = manager.audio:GetVoiceLength("story_v_out_115271", "115271068", "story_v_out_115271.awb") / 1000

					if var_276_28 + var_276_20 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_28 + var_276_20
					end

					if var_276_23.prefab_name ~= "" and arg_273_1.actors_[var_276_23.prefab_name] ~= nil then
						local var_276_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_23.prefab_name].transform, "story_v_out_115271", "115271068", "story_v_out_115271.awb")

						arg_273_1:RecordAudio("115271068", var_276_29)
						arg_273_1:RecordAudio("115271068", var_276_29)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_115271", "115271068", "story_v_out_115271.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_115271", "115271068", "story_v_out_115271.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_30 = math.max(var_276_21, arg_273_1.talkMaxDuration)

			if var_276_20 <= arg_273_1.time_ and arg_273_1.time_ < var_276_20 + var_276_30 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_20) / var_276_30

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_20 + var_276_30 and arg_273_1.time_ < var_276_20 + var_276_30 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play115271069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 115271069
		arg_277_1.duration_ = 6

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play115271070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10029"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				local var_280_2 = var_280_0:GetComponent("Image")

				if var_280_2 then
					arg_277_1.var_.alphaMatValue10029 = var_280_2
					arg_277_1.var_.alphaOldValue10029 = var_280_2.color.a
				end

				arg_277_1.var_.alphaOldValue10029 = 1
			end

			local var_280_3 = 0.5

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_3 then
				local var_280_4 = (arg_277_1.time_ - var_280_1) / var_280_3
				local var_280_5 = Mathf.Lerp(arg_277_1.var_.alphaOldValue10029, 0, var_280_4)

				if arg_277_1.var_.alphaMatValue10029 then
					local var_280_6 = arg_277_1.var_.alphaMatValue10029.color

					var_280_6.a = var_280_5
					arg_277_1.var_.alphaMatValue10029.color = var_280_6
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_3 and arg_277_1.time_ < var_280_1 + var_280_3 + arg_280_0 and arg_277_1.var_.alphaMatValue10029 then
				local var_280_7 = arg_277_1.var_.alphaMatValue10029
				local var_280_8 = var_280_7.color

				var_280_8.a = 0
				var_280_7.color = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["10030"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 then
				local var_280_11 = var_280_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_280_11 then
					arg_277_1.var_.alphaOldValue10030 = var_280_11.alpha
					arg_277_1.var_.characterEffect10030 = var_280_11
				end

				arg_277_1.var_.alphaOldValue10030 = 1
			end

			local var_280_12 = 0.5

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_12 then
				local var_280_13 = (arg_277_1.time_ - var_280_10) / var_280_12
				local var_280_14 = Mathf.Lerp(arg_277_1.var_.alphaOldValue10030, 0, var_280_13)

				if arg_277_1.var_.characterEffect10030 then
					arg_277_1.var_.characterEffect10030.alpha = var_280_14
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_12 and arg_277_1.time_ < var_280_10 + var_280_12 + arg_280_0 and arg_277_1.var_.characterEffect10030 then
				arg_277_1.var_.characterEffect10030.alpha = 0
			end

			local var_280_15 = manager.ui.mainCamera.transform
			local var_280_16 = 1

			if var_280_16 < arg_277_1.time_ and arg_277_1.time_ <= var_280_16 + arg_280_0 then
				arg_277_1.var_.shakeOldPos = var_280_15.localPosition
			end

			local var_280_17 = 0.6

			if var_280_16 <= arg_277_1.time_ and arg_277_1.time_ < var_280_16 + var_280_17 then
				local var_280_18 = (arg_277_1.time_ - var_280_16) / 0.066
				local var_280_19, var_280_20 = math.modf(var_280_18)

				var_280_15.localPosition = Vector3.New(var_280_20 * 0.13, var_280_20 * 0.13, var_280_20 * 0.13) + arg_277_1.var_.shakeOldPos
			end

			if arg_277_1.time_ >= var_280_16 + var_280_17 and arg_277_1.time_ < var_280_16 + var_280_17 + arg_280_0 then
				var_280_15.localPosition = arg_277_1.var_.shakeOldPos
			end

			local var_280_21 = 0

			if var_280_21 < arg_277_1.time_ and arg_277_1.time_ <= var_280_21 + arg_280_0 then
				arg_277_1.allBtn_.enabled = false
			end

			local var_280_22 = 1.6

			if arg_277_1.time_ >= var_280_21 + var_280_22 and arg_277_1.time_ < var_280_21 + var_280_22 + arg_280_0 then
				arg_277_1.allBtn_.enabled = true
			end

			local var_280_23 = 0
			local var_280_24 = 1

			if var_280_23 < arg_277_1.time_ and arg_277_1.time_ <= var_280_23 + arg_280_0 then
				local var_280_25 = "stop"
				local var_280_26 = "music"

				arg_277_1:AudioAction(var_280_25, var_280_26, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks_loop", "")
			end

			local var_280_27 = 0
			local var_280_28 = 1

			if var_280_27 < arg_277_1.time_ and arg_277_1.time_ <= var_280_27 + arg_280_0 then
				local var_280_29 = "play"
				local var_280_30 = "effect"

				arg_277_1:AudioAction(var_280_29, var_280_30, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks03", "")
			end

			local var_280_31 = 1

			if var_280_31 < arg_277_1.time_ and arg_277_1.time_ <= var_280_31 + arg_280_0 then
				arg_277_1.mask_.enabled = true
				arg_277_1.mask_.raycastTarget = false

				arg_277_1:SetGaussion(false)
			end

			local var_280_32 = 0.5

			if var_280_31 <= arg_277_1.time_ and arg_277_1.time_ < var_280_31 + var_280_32 then
				local var_280_33 = (arg_277_1.time_ - var_280_31) / var_280_32
				local var_280_34 = Color.New(1, 1, 1)

				var_280_34.a = Mathf.Lerp(1, 0, var_280_33)
				arg_277_1.mask_.color = var_280_34
			end

			if arg_277_1.time_ >= var_280_31 + var_280_32 and arg_277_1.time_ < var_280_31 + var_280_32 + arg_280_0 then
				local var_280_35 = Color.New(1, 1, 1)
				local var_280_36 = 0

				arg_277_1.mask_.enabled = false
				var_280_35.a = var_280_36
				arg_277_1.mask_.color = var_280_35
			end

			local var_280_37 = 1
			local var_280_38 = 0.075

			if var_280_37 < arg_277_1.time_ and arg_277_1.time_ <= var_280_37 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_39 = arg_277_1:GetWordFromCfg(115271069)
				local var_280_40 = arg_277_1:FormatText(var_280_39.content)

				arg_277_1.text_.text = var_280_40

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_41 = 3
				local var_280_42 = utf8.len(var_280_40)
				local var_280_43 = var_280_41 <= 0 and var_280_38 or var_280_38 * (var_280_42 / var_280_41)

				if var_280_43 > 0 and var_280_38 < var_280_43 then
					arg_277_1.talkMaxDuration = var_280_43

					if var_280_43 + var_280_37 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_43 + var_280_37
					end
				end

				arg_277_1.text_.text = var_280_40
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_44 = math.max(var_280_38, arg_277_1.talkMaxDuration)

			if var_280_37 <= arg_277_1.time_ and arg_277_1.time_ < var_280_37 + var_280_44 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_37) / var_280_44

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_37 + var_280_44 and arg_277_1.time_ < var_280_37 + var_280_44 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play115271070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 115271070
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play115271071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 1.075

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_2 = arg_281_1:GetWordFromCfg(115271070)
				local var_284_3 = arg_281_1:FormatText(var_284_2.content)

				arg_281_1.text_.text = var_284_3

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_4 = 43
				local var_284_5 = utf8.len(var_284_3)
				local var_284_6 = var_284_4 <= 0 and var_284_1 or var_284_1 * (var_284_5 / var_284_4)

				if var_284_6 > 0 and var_284_1 < var_284_6 then
					arg_281_1.talkMaxDuration = var_284_6

					if var_284_6 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_6 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_3
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_7 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_7 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_7

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_7 and arg_281_1.time_ < var_284_0 + var_284_7 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play115271071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 115271071
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play115271072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 1.3

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_2 = arg_285_1:GetWordFromCfg(115271071)
				local var_288_3 = arg_285_1:FormatText(var_288_2.content)

				arg_285_1.text_.text = var_288_3

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_4 = 52
				local var_288_5 = utf8.len(var_288_3)
				local var_288_6 = var_288_4 <= 0 and var_288_1 or var_288_1 * (var_288_5 / var_288_4)

				if var_288_6 > 0 and var_288_1 < var_288_6 then
					arg_285_1.talkMaxDuration = var_288_6

					if var_288_6 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_6 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_3
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_7 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_7 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_7

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_7 and arg_285_1.time_ < var_288_0 + var_288_7 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play115271072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 115271072
		arg_289_1.duration_ = 2.733

		local var_289_0 = {
			ja = 2.5,
			ko = 1.566,
			zh = 2.733,
			en = 1.733
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
				arg_289_0:Play115271073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.125

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[309].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, true)
				arg_289_1.iconController_:SetSelectedState("hero")

				arg_289_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_2")

				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(115271072)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 5
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271072", "story_v_out_115271.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271072", "story_v_out_115271.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_115271", "115271072", "story_v_out_115271.awb")

						arg_289_1:RecordAudio("115271072", var_292_9)
						arg_289_1:RecordAudio("115271072", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_115271", "115271072", "story_v_out_115271.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_115271", "115271072", "story_v_out_115271.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play115271073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 115271073
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play115271074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["10030"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				local var_296_2 = var_296_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_296_2 then
					arg_293_1.var_.alphaOldValue10030 = var_296_2.alpha
					arg_293_1.var_.characterEffect10030 = var_296_2
				end

				arg_293_1.var_.alphaOldValue10030 = 1
			end

			local var_296_3 = 0.5

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_3 then
				local var_296_4 = (arg_293_1.time_ - var_296_1) / var_296_3
				local var_296_5 = Mathf.Lerp(arg_293_1.var_.alphaOldValue10030, 0, var_296_4)

				if arg_293_1.var_.characterEffect10030 then
					arg_293_1.var_.characterEffect10030.alpha = var_296_5
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_3 and arg_293_1.time_ < var_296_1 + var_296_3 + arg_296_0 and arg_293_1.var_.characterEffect10030 then
				arg_293_1.var_.characterEffect10030.alpha = 0
			end

			local var_296_6 = 0
			local var_296_7 = 1.325

			if var_296_6 < arg_293_1.time_ and arg_293_1.time_ <= var_296_6 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_8 = arg_293_1:GetWordFromCfg(115271073)
				local var_296_9 = arg_293_1:FormatText(var_296_8.content)

				arg_293_1.text_.text = var_296_9

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_10 = 53
				local var_296_11 = utf8.len(var_296_9)
				local var_296_12 = var_296_10 <= 0 and var_296_7 or var_296_7 * (var_296_11 / var_296_10)

				if var_296_12 > 0 and var_296_7 < var_296_12 then
					arg_293_1.talkMaxDuration = var_296_12

					if var_296_12 + var_296_6 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_12 + var_296_6
					end
				end

				arg_293_1.text_.text = var_296_9
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_13 = math.max(var_296_7, arg_293_1.talkMaxDuration)

			if var_296_6 <= arg_293_1.time_ and arg_293_1.time_ < var_296_6 + var_296_13 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_6) / var_296_13

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_6 + var_296_13 and arg_293_1.time_ < var_296_6 + var_296_13 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play115271074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 115271074
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play115271075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.05

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_2 = arg_297_1:GetWordFromCfg(115271074)
				local var_300_3 = arg_297_1:FormatText(var_300_2.content)

				arg_297_1.text_.text = var_300_3

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_4 = 42
				local var_300_5 = utf8.len(var_300_3)
				local var_300_6 = var_300_4 <= 0 and var_300_1 or var_300_1 * (var_300_5 / var_300_4)

				if var_300_6 > 0 and var_300_1 < var_300_6 then
					arg_297_1.talkMaxDuration = var_300_6

					if var_300_6 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_6 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_3
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_7 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_7 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_7

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_7 and arg_297_1.time_ < var_300_0 + var_300_7 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play115271075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 115271075
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play115271076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.6

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(115271075)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 24
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play115271076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 115271076
		arg_305_1.duration_ = 6.766

		local var_305_0 = {
			ja = 4.2,
			ko = 2.933,
			zh = 3.366,
			en = 6.766
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play115271077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.325

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[314].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, true)
				arg_305_1.iconController_:SetSelectedState("hero")

				arg_305_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(115271076)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271076", "story_v_out_115271.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271076", "story_v_out_115271.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_115271", "115271076", "story_v_out_115271.awb")

						arg_305_1:RecordAudio("115271076", var_308_9)
						arg_305_1:RecordAudio("115271076", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_115271", "115271076", "story_v_out_115271.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_115271", "115271076", "story_v_out_115271.awb")
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
	Play115271077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 115271077
		arg_309_1.duration_ = 7.5

		local var_309_0 = {
			ja = 4.566,
			ko = 5.933,
			zh = 6,
			en = 7.5
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
				arg_309_0:Play115271078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.575

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[315].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, true)
				arg_309_1.iconController_:SetSelectedState("hero")

				arg_309_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(115271077)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 23
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271077", "story_v_out_115271.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271077", "story_v_out_115271.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_out_115271", "115271077", "story_v_out_115271.awb")

						arg_309_1:RecordAudio("115271077", var_312_9)
						arg_309_1:RecordAudio("115271077", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_115271", "115271077", "story_v_out_115271.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_115271", "115271077", "story_v_out_115271.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_10 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_10 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_10

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_10 and arg_309_1.time_ < var_312_0 + var_312_10 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play115271078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 115271078
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play115271079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 1.2

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_2 = arg_313_1:GetWordFromCfg(115271078)
				local var_316_3 = arg_313_1:FormatText(var_316_2.content)

				arg_313_1.text_.text = var_316_3

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_4 = 48
				local var_316_5 = utf8.len(var_316_3)
				local var_316_6 = var_316_4 <= 0 and var_316_1 or var_316_1 * (var_316_5 / var_316_4)

				if var_316_6 > 0 and var_316_1 < var_316_6 then
					arg_313_1.talkMaxDuration = var_316_6

					if var_316_6 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_6 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_3
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_7 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_7 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_7

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_7 and arg_313_1.time_ < var_316_0 + var_316_7 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play115271079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 115271079
		arg_317_1.duration_ = 5.166

		local var_317_0 = {
			ja = 5.166,
			ko = 2.733,
			zh = 3.3,
			en = 2.5
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play115271080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10030"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos10030 = var_320_0.localPosition
				var_320_0.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("10030", 3)

				local var_320_2 = var_320_0.childCount

				for iter_320_0 = 0, var_320_2 - 1 do
					local var_320_3 = var_320_0:GetChild(iter_320_0)

					if var_320_3.name == "split_2" or not string.find(var_320_3.name, "split") then
						var_320_3.gameObject:SetActive(true)
					else
						var_320_3.gameObject:SetActive(false)
					end
				end
			end

			local var_320_4 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_4 then
				local var_320_5 = (arg_317_1.time_ - var_320_1) / var_320_4
				local var_320_6 = Vector3.New(0, -390, 150)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10030, var_320_6, var_320_5)
			end

			if arg_317_1.time_ >= var_320_1 + var_320_4 and arg_317_1.time_ < var_320_1 + var_320_4 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_320_7 = arg_317_1.actors_["10030"]
			local var_320_8 = 0

			if var_320_8 < arg_317_1.time_ and arg_317_1.time_ <= var_320_8 + arg_320_0 and arg_317_1.var_.actorSpriteComps10030 == nil then
				arg_317_1.var_.actorSpriteComps10030 = var_320_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_9 = 0.2

			if var_320_8 <= arg_317_1.time_ and arg_317_1.time_ < var_320_8 + var_320_9 then
				local var_320_10 = (arg_317_1.time_ - var_320_8) / var_320_9

				if arg_317_1.var_.actorSpriteComps10030 then
					for iter_320_1, iter_320_2 in pairs(arg_317_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_320_2 then
							local var_320_11 = Mathf.Lerp(iter_320_2.color.r, 1, var_320_10)

							iter_320_2.color = Color.New(var_320_11, var_320_11, var_320_11)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_8 + var_320_9 and arg_317_1.time_ < var_320_8 + var_320_9 + arg_320_0 and arg_317_1.var_.actorSpriteComps10030 then
				local var_320_12 = 1

				for iter_320_3, iter_320_4 in pairs(arg_317_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_320_4 then
						iter_320_4.color = Color.New(var_320_12, var_320_12, var_320_12)
					end
				end

				arg_317_1.var_.actorSpriteComps10030 = nil
			end

			local var_320_13 = arg_317_1.actors_["10030"]
			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				local var_320_15 = var_320_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_320_15 then
					arg_317_1.var_.alphaOldValue10030 = var_320_15.alpha
					arg_317_1.var_.characterEffect10030 = var_320_15
				end

				arg_317_1.var_.alphaOldValue10030 = 0
			end

			local var_320_16 = 0.5

			if var_320_14 <= arg_317_1.time_ and arg_317_1.time_ < var_320_14 + var_320_16 then
				local var_320_17 = (arg_317_1.time_ - var_320_14) / var_320_16
				local var_320_18 = Mathf.Lerp(arg_317_1.var_.alphaOldValue10030, 1, var_320_17)

				if arg_317_1.var_.characterEffect10030 then
					arg_317_1.var_.characterEffect10030.alpha = var_320_18
				end
			end

			if arg_317_1.time_ >= var_320_14 + var_320_16 and arg_317_1.time_ < var_320_14 + var_320_16 + arg_320_0 and arg_317_1.var_.characterEffect10030 then
				arg_317_1.var_.characterEffect10030.alpha = 1
			end

			local var_320_19 = 0
			local var_320_20 = 0.2

			if var_320_19 < arg_317_1.time_ and arg_317_1.time_ <= var_320_19 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_21 = arg_317_1:FormatText(StoryNameCfg[309].name)

				arg_317_1.leftNameTxt_.text = var_320_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_22 = arg_317_1:GetWordFromCfg(115271079)
				local var_320_23 = arg_317_1:FormatText(var_320_22.content)

				arg_317_1.text_.text = var_320_23

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_24 = 8
				local var_320_25 = utf8.len(var_320_23)
				local var_320_26 = var_320_24 <= 0 and var_320_20 or var_320_20 * (var_320_25 / var_320_24)

				if var_320_26 > 0 and var_320_20 < var_320_26 then
					arg_317_1.talkMaxDuration = var_320_26

					if var_320_26 + var_320_19 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_26 + var_320_19
					end
				end

				arg_317_1.text_.text = var_320_23
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271079", "story_v_out_115271.awb") ~= 0 then
					local var_320_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271079", "story_v_out_115271.awb") / 1000

					if var_320_27 + var_320_19 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_27 + var_320_19
					end

					if var_320_22.prefab_name ~= "" and arg_317_1.actors_[var_320_22.prefab_name] ~= nil then
						local var_320_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_22.prefab_name].transform, "story_v_out_115271", "115271079", "story_v_out_115271.awb")

						arg_317_1:RecordAudio("115271079", var_320_28)
						arg_317_1:RecordAudio("115271079", var_320_28)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_115271", "115271079", "story_v_out_115271.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_115271", "115271079", "story_v_out_115271.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_29 = math.max(var_320_20, arg_317_1.talkMaxDuration)

			if var_320_19 <= arg_317_1.time_ and arg_317_1.time_ < var_320_19 + var_320_29 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_19) / var_320_29

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_19 + var_320_29 and arg_317_1.time_ < var_320_19 + var_320_29 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play115271080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 115271080
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play115271081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10030"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				local var_324_2 = var_324_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_324_2 then
					arg_321_1.var_.alphaOldValue10030 = var_324_2.alpha
					arg_321_1.var_.characterEffect10030 = var_324_2
				end

				arg_321_1.var_.alphaOldValue10030 = 1
			end

			local var_324_3 = 0.5

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_3 then
				local var_324_4 = (arg_321_1.time_ - var_324_1) / var_324_3
				local var_324_5 = Mathf.Lerp(arg_321_1.var_.alphaOldValue10030, 0, var_324_4)

				if arg_321_1.var_.characterEffect10030 then
					arg_321_1.var_.characterEffect10030.alpha = var_324_5
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_3 and arg_321_1.time_ < var_324_1 + var_324_3 + arg_324_0 and arg_321_1.var_.characterEffect10030 then
				arg_321_1.var_.characterEffect10030.alpha = 0
			end

			local var_324_6 = 0
			local var_324_7 = 0.55

			if var_324_6 < arg_321_1.time_ and arg_321_1.time_ <= var_324_6 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_8 = arg_321_1:GetWordFromCfg(115271080)
				local var_324_9 = arg_321_1:FormatText(var_324_8.content)

				arg_321_1.text_.text = var_324_9

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_10 = 22
				local var_324_11 = utf8.len(var_324_9)
				local var_324_12 = var_324_10 <= 0 and var_324_7 or var_324_7 * (var_324_11 / var_324_10)

				if var_324_12 > 0 and var_324_7 < var_324_12 then
					arg_321_1.talkMaxDuration = var_324_12

					if var_324_12 + var_324_6 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_12 + var_324_6
					end
				end

				arg_321_1.text_.text = var_324_9
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_13 = math.max(var_324_7, arg_321_1.talkMaxDuration)

			if var_324_6 <= arg_321_1.time_ and arg_321_1.time_ < var_324_6 + var_324_13 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_6) / var_324_13

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_6 + var_324_13 and arg_321_1.time_ < var_324_6 + var_324_13 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play115271081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 115271081
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play115271082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1.375

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_2 = arg_325_1:GetWordFromCfg(115271081)
				local var_328_3 = arg_325_1:FormatText(var_328_2.content)

				arg_325_1.text_.text = var_328_3

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_4 = 55
				local var_328_5 = utf8.len(var_328_3)
				local var_328_6 = var_328_4 <= 0 and var_328_1 or var_328_1 * (var_328_5 / var_328_4)

				if var_328_6 > 0 and var_328_1 < var_328_6 then
					arg_325_1.talkMaxDuration = var_328_6

					if var_328_6 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_6 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_3
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_7 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_7 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_7

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_7 and arg_325_1.time_ < var_328_0 + var_328_7 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play115271082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 115271082
		arg_329_1.duration_ = 10.933

		local var_329_0 = {
			ja = 7.666,
			ko = 7.866,
			zh = 7.3,
			en = 10.933
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play115271083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10029"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos10029 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(-390, -350, -180)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10029, var_332_4, var_332_3)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_332_5 = arg_329_1.actors_["10029"]
			local var_332_6 = 0

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				local var_332_7 = var_332_5:GetComponent("Image")

				if var_332_7 then
					arg_329_1.var_.alphaMatValue10029 = var_332_7
					arg_329_1.var_.alphaOldValue10029 = var_332_7.color.a
				end

				arg_329_1.var_.alphaOldValue10029 = 0
			end

			local var_332_8 = 0.5

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_8 then
				local var_332_9 = (arg_329_1.time_ - var_332_6) / var_332_8
				local var_332_10 = Mathf.Lerp(arg_329_1.var_.alphaOldValue10029, 1, var_332_9)

				if arg_329_1.var_.alphaMatValue10029 then
					local var_332_11 = arg_329_1.var_.alphaMatValue10029.color

					var_332_11.a = var_332_10
					arg_329_1.var_.alphaMatValue10029.color = var_332_11
				end
			end

			if arg_329_1.time_ >= var_332_6 + var_332_8 and arg_329_1.time_ < var_332_6 + var_332_8 + arg_332_0 and arg_329_1.var_.alphaMatValue10029 then
				local var_332_12 = arg_329_1.var_.alphaMatValue10029
				local var_332_13 = var_332_12.color

				var_332_13.a = 1
				var_332_12.color = var_332_13
			end

			local var_332_14 = arg_329_1.actors_["10029"]
			local var_332_15 = 0

			if var_332_15 < arg_329_1.time_ and arg_329_1.time_ <= var_332_15 + arg_332_0 then
				local var_332_16 = var_332_14:GetComponent("Image")

				if var_332_16 then
					arg_329_1.var_.highlightMatValue10029 = var_332_16
				end
			end

			local var_332_17 = 0.2

			if var_332_15 <= arg_329_1.time_ and arg_329_1.time_ < var_332_15 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_15) / var_332_17

				if arg_329_1.var_.highlightMatValue10029 then
					local var_332_19 = Mathf.Lerp(0.5, 1, var_332_18)
					local var_332_20 = arg_329_1.var_.highlightMatValue10029
					local var_332_21 = var_332_20.color

					var_332_21.r = var_332_19
					var_332_21.g = var_332_19
					var_332_21.b = var_332_19
					var_332_20.color = var_332_21
				end
			end

			if arg_329_1.time_ >= var_332_15 + var_332_17 and arg_329_1.time_ < var_332_15 + var_332_17 + arg_332_0 and arg_329_1.var_.highlightMatValue10029 then
				local var_332_22 = 1

				var_332_14.transform:SetSiblingIndex(1)

				local var_332_23 = arg_329_1.var_.highlightMatValue10029
				local var_332_24 = var_332_23.color

				var_332_24.r = var_332_22
				var_332_24.g = var_332_22
				var_332_24.b = var_332_22
				var_332_23.color = var_332_24
			end

			local var_332_25 = 0
			local var_332_26 = 0.7

			if var_332_25 < arg_329_1.time_ and arg_329_1.time_ <= var_332_25 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_27 = arg_329_1:FormatText(StoryNameCfg[312].name)

				arg_329_1.leftNameTxt_.text = var_332_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_28 = arg_329_1:GetWordFromCfg(115271082)
				local var_332_29 = arg_329_1:FormatText(var_332_28.content)

				arg_329_1.text_.text = var_332_29

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_30 = 28
				local var_332_31 = utf8.len(var_332_29)
				local var_332_32 = var_332_30 <= 0 and var_332_26 or var_332_26 * (var_332_31 / var_332_30)

				if var_332_32 > 0 and var_332_26 < var_332_32 then
					arg_329_1.talkMaxDuration = var_332_32

					if var_332_32 + var_332_25 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_32 + var_332_25
					end
				end

				arg_329_1.text_.text = var_332_29
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271082", "story_v_out_115271.awb") ~= 0 then
					local var_332_33 = manager.audio:GetVoiceLength("story_v_out_115271", "115271082", "story_v_out_115271.awb") / 1000

					if var_332_33 + var_332_25 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_33 + var_332_25
					end

					if var_332_28.prefab_name ~= "" and arg_329_1.actors_[var_332_28.prefab_name] ~= nil then
						local var_332_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_28.prefab_name].transform, "story_v_out_115271", "115271082", "story_v_out_115271.awb")

						arg_329_1:RecordAudio("115271082", var_332_34)
						arg_329_1:RecordAudio("115271082", var_332_34)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_115271", "115271082", "story_v_out_115271.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_115271", "115271082", "story_v_out_115271.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_35 = math.max(var_332_26, arg_329_1.talkMaxDuration)

			if var_332_25 <= arg_329_1.time_ and arg_329_1.time_ < var_332_25 + var_332_35 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_25) / var_332_35

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_25 + var_332_35 and arg_329_1.time_ < var_332_25 + var_332_35 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play115271083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 115271083
		arg_333_1.duration_ = 7.333

		local var_333_0 = {
			ja = 6.466,
			ko = 7.333,
			zh = 6.4,
			en = 6.2
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play115271084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10030"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos10030 = var_336_0.localPosition
				var_336_0.localScale = Vector3.New(1, 1, 1)

				arg_333_1:CheckSpriteTmpPos("10030", 4)

				local var_336_2 = var_336_0.childCount

				for iter_336_0 = 0, var_336_2 - 1 do
					local var_336_3 = var_336_0:GetChild(iter_336_0)

					if var_336_3.name == "split_2" or not string.find(var_336_3.name, "split") then
						var_336_3.gameObject:SetActive(true)
					else
						var_336_3.gameObject:SetActive(false)
					end
				end
			end

			local var_336_4 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_4 then
				local var_336_5 = (arg_333_1.time_ - var_336_1) / var_336_4
				local var_336_6 = Vector3.New(390, -390, 150)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos10030, var_336_6, var_336_5)
			end

			if arg_333_1.time_ >= var_336_1 + var_336_4 and arg_333_1.time_ < var_336_1 + var_336_4 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_336_7 = arg_333_1.actors_["10030"]
			local var_336_8 = 0

			if var_336_8 < arg_333_1.time_ and arg_333_1.time_ <= var_336_8 + arg_336_0 then
				local var_336_9 = var_336_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_336_9 then
					arg_333_1.var_.alphaOldValue10030 = var_336_9.alpha
					arg_333_1.var_.characterEffect10030 = var_336_9
				end

				arg_333_1.var_.alphaOldValue10030 = 0
			end

			local var_336_10 = 0.5

			if var_336_8 <= arg_333_1.time_ and arg_333_1.time_ < var_336_8 + var_336_10 then
				local var_336_11 = (arg_333_1.time_ - var_336_8) / var_336_10
				local var_336_12 = Mathf.Lerp(arg_333_1.var_.alphaOldValue10030, 1, var_336_11)

				if arg_333_1.var_.characterEffect10030 then
					arg_333_1.var_.characterEffect10030.alpha = var_336_12
				end
			end

			if arg_333_1.time_ >= var_336_8 + var_336_10 and arg_333_1.time_ < var_336_8 + var_336_10 + arg_336_0 and arg_333_1.var_.characterEffect10030 then
				arg_333_1.var_.characterEffect10030.alpha = 1
			end

			local var_336_13 = arg_333_1.actors_["10030"]
			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 and arg_333_1.var_.actorSpriteComps10030 == nil then
				arg_333_1.var_.actorSpriteComps10030 = var_336_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_15 = 0.2

			if var_336_14 <= arg_333_1.time_ and arg_333_1.time_ < var_336_14 + var_336_15 then
				local var_336_16 = (arg_333_1.time_ - var_336_14) / var_336_15

				if arg_333_1.var_.actorSpriteComps10030 then
					for iter_336_1, iter_336_2 in pairs(arg_333_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_336_2 then
							local var_336_17 = Mathf.Lerp(iter_336_2.color.r, 1, var_336_16)

							iter_336_2.color = Color.New(var_336_17, var_336_17, var_336_17)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_14 + var_336_15 and arg_333_1.time_ < var_336_14 + var_336_15 + arg_336_0 and arg_333_1.var_.actorSpriteComps10030 then
				local var_336_18 = 1

				for iter_336_3, iter_336_4 in pairs(arg_333_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_336_4 then
						iter_336_4.color = Color.New(var_336_18, var_336_18, var_336_18)
					end
				end

				arg_333_1.var_.actorSpriteComps10030 = nil
			end

			local var_336_19 = arg_333_1.actors_["10029"]
			local var_336_20 = 0

			if var_336_20 < arg_333_1.time_ and arg_333_1.time_ <= var_336_20 + arg_336_0 then
				local var_336_21 = var_336_19:GetComponent("Image")

				if var_336_21 then
					arg_333_1.var_.highlightMatValue10029 = var_336_21
				end
			end

			local var_336_22 = 0.2

			if var_336_20 <= arg_333_1.time_ and arg_333_1.time_ < var_336_20 + var_336_22 then
				local var_336_23 = (arg_333_1.time_ - var_336_20) / var_336_22

				if arg_333_1.var_.highlightMatValue10029 then
					local var_336_24 = Mathf.Lerp(1, 0.5, var_336_23)
					local var_336_25 = arg_333_1.var_.highlightMatValue10029
					local var_336_26 = var_336_25.color

					var_336_26.r = var_336_24
					var_336_26.g = var_336_24
					var_336_26.b = var_336_24
					var_336_25.color = var_336_26
				end
			end

			if arg_333_1.time_ >= var_336_20 + var_336_22 and arg_333_1.time_ < var_336_20 + var_336_22 + arg_336_0 and arg_333_1.var_.highlightMatValue10029 then
				local var_336_27 = 0.5
				local var_336_28 = arg_333_1.var_.highlightMatValue10029
				local var_336_29 = var_336_28.color

				var_336_29.r = var_336_27
				var_336_29.g = var_336_27
				var_336_29.b = var_336_27
				var_336_28.color = var_336_29
			end

			local var_336_30 = 0
			local var_336_31 = 0.525

			if var_336_30 < arg_333_1.time_ and arg_333_1.time_ <= var_336_30 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_32 = arg_333_1:FormatText(StoryNameCfg[309].name)

				arg_333_1.leftNameTxt_.text = var_336_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_33 = arg_333_1:GetWordFromCfg(115271083)
				local var_336_34 = arg_333_1:FormatText(var_336_33.content)

				arg_333_1.text_.text = var_336_34

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_35 = 21
				local var_336_36 = utf8.len(var_336_34)
				local var_336_37 = var_336_35 <= 0 and var_336_31 or var_336_31 * (var_336_36 / var_336_35)

				if var_336_37 > 0 and var_336_31 < var_336_37 then
					arg_333_1.talkMaxDuration = var_336_37

					if var_336_37 + var_336_30 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_37 + var_336_30
					end
				end

				arg_333_1.text_.text = var_336_34
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271083", "story_v_out_115271.awb") ~= 0 then
					local var_336_38 = manager.audio:GetVoiceLength("story_v_out_115271", "115271083", "story_v_out_115271.awb") / 1000

					if var_336_38 + var_336_30 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_38 + var_336_30
					end

					if var_336_33.prefab_name ~= "" and arg_333_1.actors_[var_336_33.prefab_name] ~= nil then
						local var_336_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_33.prefab_name].transform, "story_v_out_115271", "115271083", "story_v_out_115271.awb")

						arg_333_1:RecordAudio("115271083", var_336_39)
						arg_333_1:RecordAudio("115271083", var_336_39)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_115271", "115271083", "story_v_out_115271.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_115271", "115271083", "story_v_out_115271.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_40 = math.max(var_336_31, arg_333_1.talkMaxDuration)

			if var_336_30 <= arg_333_1.time_ and arg_333_1.time_ < var_336_30 + var_336_40 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_30) / var_336_40

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_30 + var_336_40 and arg_333_1.time_ < var_336_30 + var_336_40 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play115271084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 115271084
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play115271085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["10030"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.actorSpriteComps10030 == nil then
				arg_337_1.var_.actorSpriteComps10030 = var_340_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_2 = 0.2

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.actorSpriteComps10030 then
					for iter_340_0, iter_340_1 in pairs(arg_337_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_340_1 then
							local var_340_4 = Mathf.Lerp(iter_340_1.color.r, 0.5, var_340_3)

							iter_340_1.color = Color.New(var_340_4, var_340_4, var_340_4)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.actorSpriteComps10030 then
				local var_340_5 = 0.5

				for iter_340_2, iter_340_3 in pairs(arg_337_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_340_3 then
						iter_340_3.color = Color.New(var_340_5, var_340_5, var_340_5)
					end
				end

				arg_337_1.var_.actorSpriteComps10030 = nil
			end

			local var_340_6 = 0
			local var_340_7 = 0.75

			if var_340_6 < arg_337_1.time_ and arg_337_1.time_ <= var_340_6 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(115271084)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 30
				local var_340_11 = utf8.len(var_340_9)
				local var_340_12 = var_340_10 <= 0 and var_340_7 or var_340_7 * (var_340_11 / var_340_10)

				if var_340_12 > 0 and var_340_7 < var_340_12 then
					arg_337_1.talkMaxDuration = var_340_12

					if var_340_12 + var_340_6 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_12 + var_340_6
					end
				end

				arg_337_1.text_.text = var_340_9
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_13 = math.max(var_340_7, arg_337_1.talkMaxDuration)

			if var_340_6 <= arg_337_1.time_ and arg_337_1.time_ < var_340_6 + var_340_13 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_6) / var_340_13

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_6 + var_340_13 and arg_337_1.time_ < var_340_6 + var_340_13 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play115271085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115271085
		arg_341_1.duration_ = 10.766

		local var_341_0 = {
			ja = 10.766,
			ko = 7.8,
			zh = 5.4,
			en = 6.466
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play115271086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10030"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos10030 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("10030", 4)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "split_1" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(390, -390, 150)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos10030, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_344_7 = arg_341_1.actors_["10030"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps10030 == nil then
				arg_341_1.var_.actorSpriteComps10030 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 0.2

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps10030 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_344_2 then
							local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

							iter_344_2.color = Color.New(var_344_11, var_344_11, var_344_11)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps10030 then
				local var_344_12 = 1

				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_344_4 then
						iter_344_4.color = Color.New(var_344_12, var_344_12, var_344_12)
					end
				end

				arg_341_1.var_.actorSpriteComps10030 = nil
			end

			local var_344_13 = arg_341_1.actors_["10030"]
			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				local var_344_15 = var_344_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_344_15 then
					arg_341_1.var_.alphaOldValue10030 = var_344_15.alpha
					arg_341_1.var_.characterEffect10030 = var_344_15
				end

				arg_341_1.var_.alphaOldValue10030 = 0
			end

			local var_344_16 = 0.0166666666666667

			if var_344_14 <= arg_341_1.time_ and arg_341_1.time_ < var_344_14 + var_344_16 then
				local var_344_17 = (arg_341_1.time_ - var_344_14) / var_344_16
				local var_344_18 = Mathf.Lerp(arg_341_1.var_.alphaOldValue10030, 1, var_344_17)

				if arg_341_1.var_.characterEffect10030 then
					arg_341_1.var_.characterEffect10030.alpha = var_344_18
				end
			end

			if arg_341_1.time_ >= var_344_14 + var_344_16 and arg_341_1.time_ < var_344_14 + var_344_16 + arg_344_0 and arg_341_1.var_.characterEffect10030 then
				arg_341_1.var_.characterEffect10030.alpha = 1
			end

			local var_344_19 = 0
			local var_344_20 = 0.675

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[309].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(115271085)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 27
				local var_344_25 = utf8.len(var_344_23)
				local var_344_26 = var_344_24 <= 0 and var_344_20 or var_344_20 * (var_344_25 / var_344_24)

				if var_344_26 > 0 and var_344_20 < var_344_26 then
					arg_341_1.talkMaxDuration = var_344_26

					if var_344_26 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_26 + var_344_19
					end
				end

				arg_341_1.text_.text = var_344_23
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271085", "story_v_out_115271.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271085", "story_v_out_115271.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_out_115271", "115271085", "story_v_out_115271.awb")

						arg_341_1:RecordAudio("115271085", var_344_28)
						arg_341_1:RecordAudio("115271085", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_115271", "115271085", "story_v_out_115271.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_115271", "115271085", "story_v_out_115271.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_29 = math.max(var_344_20, arg_341_1.talkMaxDuration)

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_29 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_19) / var_344_29

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_19 + var_344_29 and arg_341_1.time_ < var_344_19 + var_344_29 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115271086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115271086
		arg_345_1.duration_ = 2.766

		local var_345_0 = {
			ja = 2.433,
			ko = 2.766,
			zh = 2.566,
			en = 2.7
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play115271087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10030"]
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 and arg_345_1.var_.actorSpriteComps10030 == nil then
				arg_345_1.var_.actorSpriteComps10030 = var_348_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_2 = 0.2

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2

				if arg_345_1.var_.actorSpriteComps10030 then
					for iter_348_0, iter_348_1 in pairs(arg_345_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_348_1 then
							local var_348_4 = Mathf.Lerp(iter_348_1.color.r, 0.5, var_348_3)

							iter_348_1.color = Color.New(var_348_4, var_348_4, var_348_4)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 and arg_345_1.var_.actorSpriteComps10030 then
				local var_348_5 = 0.5

				for iter_348_2, iter_348_3 in pairs(arg_345_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_348_3 then
						iter_348_3.color = Color.New(var_348_5, var_348_5, var_348_5)
					end
				end

				arg_345_1.var_.actorSpriteComps10030 = nil
			end

			local var_348_6 = arg_345_1.actors_["10029"]
			local var_348_7 = 0

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 then
				local var_348_8 = var_348_6:GetComponent("Image")

				if var_348_8 then
					arg_345_1.var_.highlightMatValue10029 = var_348_8
				end
			end

			local var_348_9 = 0.2

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_7) / var_348_9

				if arg_345_1.var_.highlightMatValue10029 then
					local var_348_11 = Mathf.Lerp(0.5, 1, var_348_10)
					local var_348_12 = arg_345_1.var_.highlightMatValue10029
					local var_348_13 = var_348_12.color

					var_348_13.r = var_348_11
					var_348_13.g = var_348_11
					var_348_13.b = var_348_11
					var_348_12.color = var_348_13
				end
			end

			if arg_345_1.time_ >= var_348_7 + var_348_9 and arg_345_1.time_ < var_348_7 + var_348_9 + arg_348_0 and arg_345_1.var_.highlightMatValue10029 then
				local var_348_14 = 1

				var_348_6.transform:SetSiblingIndex(1)

				local var_348_15 = arg_345_1.var_.highlightMatValue10029
				local var_348_16 = var_348_15.color

				var_348_16.r = var_348_14
				var_348_16.g = var_348_14
				var_348_16.b = var_348_14
				var_348_15.color = var_348_16
			end

			local var_348_17 = 0
			local var_348_18 = 0.175

			if var_348_17 < arg_345_1.time_ and arg_345_1.time_ <= var_348_17 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_19 = arg_345_1:FormatText(StoryNameCfg[312].name)

				arg_345_1.leftNameTxt_.text = var_348_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_20 = arg_345_1:GetWordFromCfg(115271086)
				local var_348_21 = arg_345_1:FormatText(var_348_20.content)

				arg_345_1.text_.text = var_348_21

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_22 = 7
				local var_348_23 = utf8.len(var_348_21)
				local var_348_24 = var_348_22 <= 0 and var_348_18 or var_348_18 * (var_348_23 / var_348_22)

				if var_348_24 > 0 and var_348_18 < var_348_24 then
					arg_345_1.talkMaxDuration = var_348_24

					if var_348_24 + var_348_17 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_24 + var_348_17
					end
				end

				arg_345_1.text_.text = var_348_21
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271086", "story_v_out_115271.awb") ~= 0 then
					local var_348_25 = manager.audio:GetVoiceLength("story_v_out_115271", "115271086", "story_v_out_115271.awb") / 1000

					if var_348_25 + var_348_17 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_25 + var_348_17
					end

					if var_348_20.prefab_name ~= "" and arg_345_1.actors_[var_348_20.prefab_name] ~= nil then
						local var_348_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_20.prefab_name].transform, "story_v_out_115271", "115271086", "story_v_out_115271.awb")

						arg_345_1:RecordAudio("115271086", var_348_26)
						arg_345_1:RecordAudio("115271086", var_348_26)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_115271", "115271086", "story_v_out_115271.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_115271", "115271086", "story_v_out_115271.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_27 = math.max(var_348_18, arg_345_1.talkMaxDuration)

			if var_348_17 <= arg_345_1.time_ and arg_345_1.time_ < var_348_17 + var_348_27 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_17) / var_348_27

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_17 + var_348_27 and arg_345_1.time_ < var_348_17 + var_348_27 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play115271087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 115271087
		arg_349_1.duration_ = 13.033

		local var_349_0 = {
			ja = 10.866,
			ko = 10.533,
			zh = 9.966,
			en = 13.033
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play115271088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 1.15

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[312].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(115271087)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 46
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271087", "story_v_out_115271.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271087", "story_v_out_115271.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_115271", "115271087", "story_v_out_115271.awb")

						arg_349_1:RecordAudio("115271087", var_352_9)
						arg_349_1:RecordAudio("115271087", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_115271", "115271087", "story_v_out_115271.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_115271", "115271087", "story_v_out_115271.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play115271088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 115271088
		arg_353_1.duration_ = 15.933

		local var_353_0 = {
			ja = 15.933,
			ko = 12.766,
			zh = 13.733,
			en = 14.2
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play115271089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 1.275

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[312].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(115271088)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 51
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271088", "story_v_out_115271.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271088", "story_v_out_115271.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_115271", "115271088", "story_v_out_115271.awb")

						arg_353_1:RecordAudio("115271088", var_356_9)
						arg_353_1:RecordAudio("115271088", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_115271", "115271088", "story_v_out_115271.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_115271", "115271088", "story_v_out_115271.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_10 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_10 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_10

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_10 and arg_353_1.time_ < var_356_0 + var_356_10 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play115271089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 115271089
		arg_357_1.duration_ = 8.066

		local var_357_0 = {
			ja = 8.066,
			ko = 7.566,
			zh = 6.933,
			en = 7.133
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play115271090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 2

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				local var_360_1 = manager.ui.mainCamera.transform.localPosition
				local var_360_2 = Vector3.New(0, 0, 10) + Vector3.New(var_360_1.x, var_360_1.y, 0)
				local var_360_3 = arg_357_1.bgs_.ST28a

				var_360_3.transform.localPosition = var_360_2
				var_360_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_360_4 = var_360_3:GetComponent("SpriteRenderer")

				if var_360_4 and var_360_4.sprite then
					local var_360_5 = (var_360_3.transform.localPosition - var_360_1).z
					local var_360_6 = manager.ui.mainCameraCom_
					local var_360_7 = 2 * var_360_5 * Mathf.Tan(var_360_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_360_8 = var_360_7 * var_360_6.aspect
					local var_360_9 = var_360_4.sprite.bounds.size.x
					local var_360_10 = var_360_4.sprite.bounds.size.y
					local var_360_11 = var_360_8 / var_360_9
					local var_360_12 = var_360_7 / var_360_10
					local var_360_13 = var_360_12 < var_360_11 and var_360_11 or var_360_12

					var_360_3.transform.localScale = Vector3.New(var_360_13, var_360_13, 0)
				end

				for iter_360_0, iter_360_1 in pairs(arg_357_1.bgs_) do
					if iter_360_0 ~= "ST28a" then
						iter_360_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_360_14 = 0

			if var_360_14 < arg_357_1.time_ and arg_357_1.time_ <= var_360_14 + arg_360_0 then
				arg_357_1.mask_.enabled = true
				arg_357_1.mask_.raycastTarget = true

				arg_357_1:SetGaussion(false)
			end

			local var_360_15 = 2

			if var_360_14 <= arg_357_1.time_ and arg_357_1.time_ < var_360_14 + var_360_15 then
				local var_360_16 = (arg_357_1.time_ - var_360_14) / var_360_15
				local var_360_17 = Color.New(0, 0, 0)

				var_360_17.a = Mathf.Lerp(0, 1, var_360_16)
				arg_357_1.mask_.color = var_360_17
			end

			if arg_357_1.time_ >= var_360_14 + var_360_15 and arg_357_1.time_ < var_360_14 + var_360_15 + arg_360_0 then
				local var_360_18 = Color.New(0, 0, 0)

				var_360_18.a = 1
				arg_357_1.mask_.color = var_360_18
			end

			local var_360_19 = 2

			if var_360_19 < arg_357_1.time_ and arg_357_1.time_ <= var_360_19 + arg_360_0 then
				arg_357_1.mask_.enabled = true
				arg_357_1.mask_.raycastTarget = true

				arg_357_1:SetGaussion(false)
			end

			local var_360_20 = 2

			if var_360_19 <= arg_357_1.time_ and arg_357_1.time_ < var_360_19 + var_360_20 then
				local var_360_21 = (arg_357_1.time_ - var_360_19) / var_360_20
				local var_360_22 = Color.New(0, 0, 0)

				var_360_22.a = Mathf.Lerp(1, 0, var_360_21)
				arg_357_1.mask_.color = var_360_22
			end

			if arg_357_1.time_ >= var_360_19 + var_360_20 and arg_357_1.time_ < var_360_19 + var_360_20 + arg_360_0 then
				local var_360_23 = Color.New(0, 0, 0)
				local var_360_24 = 0

				arg_357_1.mask_.enabled = false
				var_360_23.a = var_360_24
				arg_357_1.mask_.color = var_360_23
			end

			local var_360_25 = arg_357_1.actors_["10029"].transform
			local var_360_26 = 1.966

			if var_360_26 < arg_357_1.time_ and arg_357_1.time_ <= var_360_26 + arg_360_0 then
				arg_357_1.var_.moveOldPos10029 = var_360_25.localPosition
				var_360_25.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("10029", 7)
			end

			local var_360_27 = 0.001

			if var_360_26 <= arg_357_1.time_ and arg_357_1.time_ < var_360_26 + var_360_27 then
				local var_360_28 = (arg_357_1.time_ - var_360_26) / var_360_27
				local var_360_29 = Vector3.New(0, -2000, -180)

				var_360_25.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10029, var_360_29, var_360_28)
			end

			if arg_357_1.time_ >= var_360_26 + var_360_27 and arg_357_1.time_ < var_360_26 + var_360_27 + arg_360_0 then
				var_360_25.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_360_30 = arg_357_1.actors_["10030"].transform
			local var_360_31 = 1.966

			if var_360_31 < arg_357_1.time_ and arg_357_1.time_ <= var_360_31 + arg_360_0 then
				arg_357_1.var_.moveOldPos10030 = var_360_30.localPosition
				var_360_30.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("10030", 7)

				local var_360_32 = var_360_30.childCount

				for iter_360_2 = 0, var_360_32 - 1 do
					local var_360_33 = var_360_30:GetChild(iter_360_2)

					if var_360_33.name == "split_1" or not string.find(var_360_33.name, "split") then
						var_360_33.gameObject:SetActive(true)
					else
						var_360_33.gameObject:SetActive(false)
					end
				end
			end

			local var_360_34 = 0.001

			if var_360_31 <= arg_357_1.time_ and arg_357_1.time_ < var_360_31 + var_360_34 then
				local var_360_35 = (arg_357_1.time_ - var_360_31) / var_360_34
				local var_360_36 = Vector3.New(0, -2000, 150)

				var_360_30.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10030, var_360_36, var_360_35)
			end

			if arg_357_1.time_ >= var_360_31 + var_360_34 and arg_357_1.time_ < var_360_31 + var_360_34 + arg_360_0 then
				var_360_30.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_360_37 = arg_357_1.actors_["1038"].transform
			local var_360_38 = 3.8

			if var_360_38 < arg_357_1.time_ and arg_357_1.time_ <= var_360_38 + arg_360_0 then
				arg_357_1.var_.moveOldPos1038 = var_360_37.localPosition
				var_360_37.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("1038", 3)

				local var_360_39 = var_360_37.childCount

				for iter_360_3 = 0, var_360_39 - 1 do
					local var_360_40 = var_360_37:GetChild(iter_360_3)

					if var_360_40.name == "split_1" or not string.find(var_360_40.name, "split") then
						var_360_40.gameObject:SetActive(true)
					else
						var_360_40.gameObject:SetActive(false)
					end
				end
			end

			local var_360_41 = 0.001

			if var_360_38 <= arg_357_1.time_ and arg_357_1.time_ < var_360_38 + var_360_41 then
				local var_360_42 = (arg_357_1.time_ - var_360_38) / var_360_41
				local var_360_43 = Vector3.New(0, -400, 0)

				var_360_37.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1038, var_360_43, var_360_42)
			end

			if arg_357_1.time_ >= var_360_38 + var_360_41 and arg_357_1.time_ < var_360_38 + var_360_41 + arg_360_0 then
				var_360_37.localPosition = Vector3.New(0, -400, 0)
			end

			local var_360_44 = arg_357_1.actors_["1038"]
			local var_360_45 = 3.8

			if var_360_45 < arg_357_1.time_ and arg_357_1.time_ <= var_360_45 + arg_360_0 then
				local var_360_46 = var_360_44:GetComponentInChildren(typeof(CanvasGroup))

				if var_360_46 then
					arg_357_1.var_.alphaOldValue1038 = var_360_46.alpha
					arg_357_1.var_.characterEffect1038 = var_360_46
				end

				arg_357_1.var_.alphaOldValue1038 = 0
			end

			local var_360_47 = 0.5

			if var_360_45 <= arg_357_1.time_ and arg_357_1.time_ < var_360_45 + var_360_47 then
				local var_360_48 = (arg_357_1.time_ - var_360_45) / var_360_47
				local var_360_49 = Mathf.Lerp(arg_357_1.var_.alphaOldValue1038, 1, var_360_48)

				if arg_357_1.var_.characterEffect1038 then
					arg_357_1.var_.characterEffect1038.alpha = var_360_49
				end
			end

			if arg_357_1.time_ >= var_360_45 + var_360_47 and arg_357_1.time_ < var_360_45 + var_360_47 + arg_360_0 and arg_357_1.var_.characterEffect1038 then
				arg_357_1.var_.characterEffect1038.alpha = 1
			end

			local var_360_50 = arg_357_1.actors_["1038"]
			local var_360_51 = 3.8

			if var_360_51 < arg_357_1.time_ and arg_357_1.time_ <= var_360_51 + arg_360_0 and arg_357_1.var_.actorSpriteComps1038 == nil then
				arg_357_1.var_.actorSpriteComps1038 = var_360_50:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_52 = 0.2

			if var_360_51 <= arg_357_1.time_ and arg_357_1.time_ < var_360_51 + var_360_52 then
				local var_360_53 = (arg_357_1.time_ - var_360_51) / var_360_52

				if arg_357_1.var_.actorSpriteComps1038 then
					for iter_360_4, iter_360_5 in pairs(arg_357_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_360_5 then
							local var_360_54 = Mathf.Lerp(iter_360_5.color.r, 1, var_360_53)

							iter_360_5.color = Color.New(var_360_54, var_360_54, var_360_54)
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_51 + var_360_52 and arg_357_1.time_ < var_360_51 + var_360_52 + arg_360_0 and arg_357_1.var_.actorSpriteComps1038 then
				local var_360_55 = 1

				for iter_360_6, iter_360_7 in pairs(arg_357_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_360_7 then
						iter_360_7.color = Color.New(var_360_55, var_360_55, var_360_55)
					end
				end

				arg_357_1.var_.actorSpriteComps1038 = nil
			end

			if arg_357_1.frameCnt_ <= 1 then
				arg_357_1.dialog_:SetActive(false)
			end

			local var_360_56 = 4
			local var_360_57 = 0.225

			if var_360_56 < arg_357_1.time_ and arg_357_1.time_ <= var_360_56 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0

				arg_357_1.dialog_:SetActive(true)

				local var_360_58 = LeanTween.value(arg_357_1.dialog_, 0, 1, 0.3)

				var_360_58:setOnUpdate(LuaHelper.FloatAction(function(arg_361_0)
					arg_357_1.dialogCg_.alpha = arg_361_0
				end))
				var_360_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_357_1.dialog_)
					var_360_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_357_1.duration_ = arg_357_1.duration_ + 0.3

				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_59 = arg_357_1:FormatText(StoryNameCfg[94].name)

				arg_357_1.leftNameTxt_.text = var_360_59

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_60 = arg_357_1:GetWordFromCfg(115271089)
				local var_360_61 = arg_357_1:FormatText(var_360_60.content)

				arg_357_1.text_.text = var_360_61

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_62 = 9
				local var_360_63 = utf8.len(var_360_61)
				local var_360_64 = var_360_62 <= 0 and var_360_57 or var_360_57 * (var_360_63 / var_360_62)

				if var_360_64 > 0 and var_360_57 < var_360_64 then
					arg_357_1.talkMaxDuration = var_360_64
					var_360_56 = var_360_56 + 0.3

					if var_360_64 + var_360_56 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_64 + var_360_56
					end
				end

				arg_357_1.text_.text = var_360_61
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271089", "story_v_out_115271.awb") ~= 0 then
					local var_360_65 = manager.audio:GetVoiceLength("story_v_out_115271", "115271089", "story_v_out_115271.awb") / 1000

					if var_360_65 + var_360_56 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_65 + var_360_56
					end

					if var_360_60.prefab_name ~= "" and arg_357_1.actors_[var_360_60.prefab_name] ~= nil then
						local var_360_66 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_60.prefab_name].transform, "story_v_out_115271", "115271089", "story_v_out_115271.awb")

						arg_357_1:RecordAudio("115271089", var_360_66)
						arg_357_1:RecordAudio("115271089", var_360_66)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_115271", "115271089", "story_v_out_115271.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_115271", "115271089", "story_v_out_115271.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_67 = var_360_56 + 0.3
			local var_360_68 = math.max(var_360_57, arg_357_1.talkMaxDuration)

			if var_360_67 <= arg_357_1.time_ and arg_357_1.time_ < var_360_67 + var_360_68 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_67) / var_360_68

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_67 + var_360_68 and arg_357_1.time_ < var_360_67 + var_360_68 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play115271090 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 115271090
		arg_363_1.duration_ = 17.233

		local var_363_0 = {
			ja = 15.2,
			ko = 13.9,
			zh = 14.133,
			en = 17.233
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
				arg_363_0:Play115271091(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 1.45

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_2 = arg_363_1:FormatText(StoryNameCfg[94].name)

				arg_363_1.leftNameTxt_.text = var_366_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_3 = arg_363_1:GetWordFromCfg(115271090)
				local var_366_4 = arg_363_1:FormatText(var_366_3.content)

				arg_363_1.text_.text = var_366_4

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_5 = 58
				local var_366_6 = utf8.len(var_366_4)
				local var_366_7 = var_366_5 <= 0 and var_366_1 or var_366_1 * (var_366_6 / var_366_5)

				if var_366_7 > 0 and var_366_1 < var_366_7 then
					arg_363_1.talkMaxDuration = var_366_7

					if var_366_7 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_7 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_4
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271090", "story_v_out_115271.awb") ~= 0 then
					local var_366_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271090", "story_v_out_115271.awb") / 1000

					if var_366_8 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_8 + var_366_0
					end

					if var_366_3.prefab_name ~= "" and arg_363_1.actors_[var_366_3.prefab_name] ~= nil then
						local var_366_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_3.prefab_name].transform, "story_v_out_115271", "115271090", "story_v_out_115271.awb")

						arg_363_1:RecordAudio("115271090", var_366_9)
						arg_363_1:RecordAudio("115271090", var_366_9)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_115271", "115271090", "story_v_out_115271.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_115271", "115271090", "story_v_out_115271.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_10 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_10 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_10

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_10 and arg_363_1.time_ < var_366_0 + var_366_10 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play115271091 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 115271091
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play115271092(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1038"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				local var_370_2 = var_370_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_370_2 then
					arg_367_1.var_.alphaOldValue1038 = var_370_2.alpha
					arg_367_1.var_.characterEffect1038 = var_370_2
				end

				arg_367_1.var_.alphaOldValue1038 = 1
			end

			local var_370_3 = 0.5

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_3 then
				local var_370_4 = (arg_367_1.time_ - var_370_1) / var_370_3
				local var_370_5 = Mathf.Lerp(arg_367_1.var_.alphaOldValue1038, 0, var_370_4)

				if arg_367_1.var_.characterEffect1038 then
					arg_367_1.var_.characterEffect1038.alpha = var_370_5
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_3 and arg_367_1.time_ < var_370_1 + var_370_3 + arg_370_0 and arg_367_1.var_.characterEffect1038 then
				arg_367_1.var_.characterEffect1038.alpha = 0
			end

			local var_370_6 = 0
			local var_370_7 = 0.975

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_8 = arg_367_1:GetWordFromCfg(115271091)
				local var_370_9 = arg_367_1:FormatText(var_370_8.content)

				arg_367_1.text_.text = var_370_9

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_10 = 39
				local var_370_11 = utf8.len(var_370_9)
				local var_370_12 = var_370_10 <= 0 and var_370_7 or var_370_7 * (var_370_11 / var_370_10)

				if var_370_12 > 0 and var_370_7 < var_370_12 then
					arg_367_1.talkMaxDuration = var_370_12

					if var_370_12 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_12 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_9
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_13 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_13 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_13

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_13 and arg_367_1.time_ < var_370_6 + var_370_13 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play115271092 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 115271092
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play115271093(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.85

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_2 = arg_371_1:GetWordFromCfg(115271092)
				local var_374_3 = arg_371_1:FormatText(var_374_2.content)

				arg_371_1.text_.text = var_374_3

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_4 = 34
				local var_374_5 = utf8.len(var_374_3)
				local var_374_6 = var_374_4 <= 0 and var_374_1 or var_374_1 * (var_374_5 / var_374_4)

				if var_374_6 > 0 and var_374_1 < var_374_6 then
					arg_371_1.talkMaxDuration = var_374_6

					if var_374_6 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_6 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_3
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_7 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_7 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_7

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_7 and arg_371_1.time_ < var_374_0 + var_374_7 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play115271093 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 115271093
		arg_375_1.duration_ = 7.3

		local var_375_0 = {
			ja = 7.3,
			ko = 6.666,
			zh = 5.833,
			en = 4.833
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play115271094(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 0.85

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[144].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, true)
				arg_375_1.iconController_:SetSelectedState("hero")

				arg_375_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(115271093)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 34
				local var_378_6 = utf8.len(var_378_4)
				local var_378_7 = var_378_5 <= 0 and var_378_1 or var_378_1 * (var_378_6 / var_378_5)

				if var_378_7 > 0 and var_378_1 < var_378_7 then
					arg_375_1.talkMaxDuration = var_378_7

					if var_378_7 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_7 + var_378_0
					end
				end

				arg_375_1.text_.text = var_378_4
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271093", "story_v_out_115271.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271093", "story_v_out_115271.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_115271", "115271093", "story_v_out_115271.awb")

						arg_375_1:RecordAudio("115271093", var_378_9)
						arg_375_1:RecordAudio("115271093", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_115271", "115271093", "story_v_out_115271.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_115271", "115271093", "story_v_out_115271.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_10 = math.max(var_378_1, arg_375_1.talkMaxDuration)

			if var_378_0 <= arg_375_1.time_ and arg_375_1.time_ < var_378_0 + var_378_10 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_0) / var_378_10

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_0 + var_378_10 and arg_375_1.time_ < var_378_0 + var_378_10 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play115271094 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 115271094
		arg_379_1.duration_ = 16.666

		local var_379_0 = {
			ja = 14.6,
			ko = 15.066,
			zh = 13.733,
			en = 16.666
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
				arg_379_0:Play115271095(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["10029"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos10029 = var_382_0.localPosition
				var_382_0.localScale = Vector3.New(1, 1, 1)

				arg_379_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(0, -350, -180)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos10029, var_382_4, var_382_3)
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_382_5 = arg_379_1.actors_["10029"]
			local var_382_6 = 0

			if var_382_6 < arg_379_1.time_ and arg_379_1.time_ <= var_382_6 + arg_382_0 then
				local var_382_7 = var_382_5:GetComponent("Image")

				if var_382_7 then
					arg_379_1.var_.alphaMatValue10029 = var_382_7
					arg_379_1.var_.alphaOldValue10029 = var_382_7.color.a
				end

				arg_379_1.var_.alphaOldValue10029 = 0
			end

			local var_382_8 = 0.5

			if var_382_6 <= arg_379_1.time_ and arg_379_1.time_ < var_382_6 + var_382_8 then
				local var_382_9 = (arg_379_1.time_ - var_382_6) / var_382_8
				local var_382_10 = Mathf.Lerp(arg_379_1.var_.alphaOldValue10029, 1, var_382_9)

				if arg_379_1.var_.alphaMatValue10029 then
					local var_382_11 = arg_379_1.var_.alphaMatValue10029.color

					var_382_11.a = var_382_10
					arg_379_1.var_.alphaMatValue10029.color = var_382_11
				end
			end

			if arg_379_1.time_ >= var_382_6 + var_382_8 and arg_379_1.time_ < var_382_6 + var_382_8 + arg_382_0 and arg_379_1.var_.alphaMatValue10029 then
				local var_382_12 = arg_379_1.var_.alphaMatValue10029
				local var_382_13 = var_382_12.color

				var_382_13.a = 1
				var_382_12.color = var_382_13
			end

			local var_382_14 = arg_379_1.actors_["10029"]
			local var_382_15 = 0

			if var_382_15 < arg_379_1.time_ and arg_379_1.time_ <= var_382_15 + arg_382_0 then
				local var_382_16 = var_382_14:GetComponent("Image")

				if var_382_16 then
					arg_379_1.var_.highlightMatValue10029 = var_382_16
				end
			end

			local var_382_17 = 0.2

			if var_382_15 <= arg_379_1.time_ and arg_379_1.time_ < var_382_15 + var_382_17 then
				local var_382_18 = (arg_379_1.time_ - var_382_15) / var_382_17

				if arg_379_1.var_.highlightMatValue10029 then
					local var_382_19 = Mathf.Lerp(0.5, 1, var_382_18)
					local var_382_20 = arg_379_1.var_.highlightMatValue10029
					local var_382_21 = var_382_20.color

					var_382_21.r = var_382_19
					var_382_21.g = var_382_19
					var_382_21.b = var_382_19
					var_382_20.color = var_382_21
				end
			end

			if arg_379_1.time_ >= var_382_15 + var_382_17 and arg_379_1.time_ < var_382_15 + var_382_17 + arg_382_0 and arg_379_1.var_.highlightMatValue10029 then
				local var_382_22 = 1

				var_382_14.transform:SetSiblingIndex(1)

				local var_382_23 = arg_379_1.var_.highlightMatValue10029
				local var_382_24 = var_382_23.color

				var_382_24.r = var_382_22
				var_382_24.g = var_382_22
				var_382_24.b = var_382_22
				var_382_23.color = var_382_24
			end

			local var_382_25 = 0
			local var_382_26 = 1.35

			if var_382_25 < arg_379_1.time_ and arg_379_1.time_ <= var_382_25 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_27 = arg_379_1:FormatText(StoryNameCfg[312].name)

				arg_379_1.leftNameTxt_.text = var_382_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_28 = arg_379_1:GetWordFromCfg(115271094)
				local var_382_29 = arg_379_1:FormatText(var_382_28.content)

				arg_379_1.text_.text = var_382_29

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_30 = 54
				local var_382_31 = utf8.len(var_382_29)
				local var_382_32 = var_382_30 <= 0 and var_382_26 or var_382_26 * (var_382_31 / var_382_30)

				if var_382_32 > 0 and var_382_26 < var_382_32 then
					arg_379_1.talkMaxDuration = var_382_32

					if var_382_32 + var_382_25 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_32 + var_382_25
					end
				end

				arg_379_1.text_.text = var_382_29
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271094", "story_v_out_115271.awb") ~= 0 then
					local var_382_33 = manager.audio:GetVoiceLength("story_v_out_115271", "115271094", "story_v_out_115271.awb") / 1000

					if var_382_33 + var_382_25 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_33 + var_382_25
					end

					if var_382_28.prefab_name ~= "" and arg_379_1.actors_[var_382_28.prefab_name] ~= nil then
						local var_382_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_28.prefab_name].transform, "story_v_out_115271", "115271094", "story_v_out_115271.awb")

						arg_379_1:RecordAudio("115271094", var_382_34)
						arg_379_1:RecordAudio("115271094", var_382_34)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_115271", "115271094", "story_v_out_115271.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_115271", "115271094", "story_v_out_115271.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_35 = math.max(var_382_26, arg_379_1.talkMaxDuration)

			if var_382_25 <= arg_379_1.time_ and arg_379_1.time_ < var_382_25 + var_382_35 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_25) / var_382_35

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_25 + var_382_35 and arg_379_1.time_ < var_382_25 + var_382_35 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play115271095 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 115271095
		arg_383_1.duration_ = 18.466

		local var_383_0 = {
			ja = 12.866,
			ko = 15.533,
			zh = 18,
			en = 18.466
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play115271096(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 1.8

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_2 = arg_383_1:FormatText(StoryNameCfg[312].name)

				arg_383_1.leftNameTxt_.text = var_386_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_3 = arg_383_1:GetWordFromCfg(115271095)
				local var_386_4 = arg_383_1:FormatText(var_386_3.content)

				arg_383_1.text_.text = var_386_4

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_5 = 72
				local var_386_6 = utf8.len(var_386_4)
				local var_386_7 = var_386_5 <= 0 and var_386_1 or var_386_1 * (var_386_6 / var_386_5)

				if var_386_7 > 0 and var_386_1 < var_386_7 then
					arg_383_1.talkMaxDuration = var_386_7

					if var_386_7 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_7 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_4
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271095", "story_v_out_115271.awb") ~= 0 then
					local var_386_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271095", "story_v_out_115271.awb") / 1000

					if var_386_8 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_8 + var_386_0
					end

					if var_386_3.prefab_name ~= "" and arg_383_1.actors_[var_386_3.prefab_name] ~= nil then
						local var_386_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_3.prefab_name].transform, "story_v_out_115271", "115271095", "story_v_out_115271.awb")

						arg_383_1:RecordAudio("115271095", var_386_9)
						arg_383_1:RecordAudio("115271095", var_386_9)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_115271", "115271095", "story_v_out_115271.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_115271", "115271095", "story_v_out_115271.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_10 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_10 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_10

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_10 and arg_383_1.time_ < var_386_0 + var_386_10 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play115271096 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 115271096
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play115271097(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["10029"]
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				local var_390_2 = var_390_0:GetComponent("Image")

				if var_390_2 then
					arg_387_1.var_.alphaMatValue10029 = var_390_2
					arg_387_1.var_.alphaOldValue10029 = var_390_2.color.a
				end

				arg_387_1.var_.alphaOldValue10029 = 1
			end

			local var_390_3 = 0.5

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_3 then
				local var_390_4 = (arg_387_1.time_ - var_390_1) / var_390_3
				local var_390_5 = Mathf.Lerp(arg_387_1.var_.alphaOldValue10029, 0, var_390_4)

				if arg_387_1.var_.alphaMatValue10029 then
					local var_390_6 = arg_387_1.var_.alphaMatValue10029.color

					var_390_6.a = var_390_5
					arg_387_1.var_.alphaMatValue10029.color = var_390_6
				end
			end

			if arg_387_1.time_ >= var_390_1 + var_390_3 and arg_387_1.time_ < var_390_1 + var_390_3 + arg_390_0 and arg_387_1.var_.alphaMatValue10029 then
				local var_390_7 = arg_387_1.var_.alphaMatValue10029
				local var_390_8 = var_390_7.color

				var_390_8.a = 0
				var_390_7.color = var_390_8
			end

			local var_390_9 = 0
			local var_390_10 = 0.725

			if var_390_9 < arg_387_1.time_ and arg_387_1.time_ <= var_390_9 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, false)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_11 = arg_387_1:GetWordFromCfg(115271096)
				local var_390_12 = arg_387_1:FormatText(var_390_11.content)

				arg_387_1.text_.text = var_390_12

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_13 = 29
				local var_390_14 = utf8.len(var_390_12)
				local var_390_15 = var_390_13 <= 0 and var_390_10 or var_390_10 * (var_390_14 / var_390_13)

				if var_390_15 > 0 and var_390_10 < var_390_15 then
					arg_387_1.talkMaxDuration = var_390_15

					if var_390_15 + var_390_9 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_15 + var_390_9
					end
				end

				arg_387_1.text_.text = var_390_12
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_16 = math.max(var_390_10, arg_387_1.talkMaxDuration)

			if var_390_9 <= arg_387_1.time_ and arg_387_1.time_ < var_390_9 + var_390_16 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_9) / var_390_16

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_9 + var_390_16 and arg_387_1.time_ < var_390_9 + var_390_16 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play115271097 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 115271097
		arg_391_1.duration_ = 5.6

		local var_391_0 = {
			ja = 5.6,
			ko = 3.833,
			zh = 4.966,
			en = 3.1
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
				arg_391_0:Play115271098(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1038"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1038 = var_394_0.localPosition
				var_394_0.localScale = Vector3.New(1, 1, 1)

				arg_391_1:CheckSpriteTmpPos("1038", 2)

				local var_394_2 = var_394_0.childCount

				for iter_394_0 = 0, var_394_2 - 1 do
					local var_394_3 = var_394_0:GetChild(iter_394_0)

					if var_394_3.name == "split_1" or not string.find(var_394_3.name, "split") then
						var_394_3.gameObject:SetActive(true)
					else
						var_394_3.gameObject:SetActive(false)
					end
				end
			end

			local var_394_4 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_4 then
				local var_394_5 = (arg_391_1.time_ - var_394_1) / var_394_4
				local var_394_6 = Vector3.New(-390, -400, 0)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1038, var_394_6, var_394_5)
			end

			if arg_391_1.time_ >= var_394_1 + var_394_4 and arg_391_1.time_ < var_394_1 + var_394_4 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_394_7 = arg_391_1.actors_["1038"]
			local var_394_8 = 0

			if var_394_8 < arg_391_1.time_ and arg_391_1.time_ <= var_394_8 + arg_394_0 then
				local var_394_9 = var_394_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_394_9 then
					arg_391_1.var_.alphaOldValue1038 = var_394_9.alpha
					arg_391_1.var_.characterEffect1038 = var_394_9
				end

				arg_391_1.var_.alphaOldValue1038 = 0
			end

			local var_394_10 = 0.5

			if var_394_8 <= arg_391_1.time_ and arg_391_1.time_ < var_394_8 + var_394_10 then
				local var_394_11 = (arg_391_1.time_ - var_394_8) / var_394_10
				local var_394_12 = Mathf.Lerp(arg_391_1.var_.alphaOldValue1038, 1, var_394_11)

				if arg_391_1.var_.characterEffect1038 then
					arg_391_1.var_.characterEffect1038.alpha = var_394_12
				end
			end

			if arg_391_1.time_ >= var_394_8 + var_394_10 and arg_391_1.time_ < var_394_8 + var_394_10 + arg_394_0 and arg_391_1.var_.characterEffect1038 then
				arg_391_1.var_.characterEffect1038.alpha = 1
			end

			local var_394_13 = arg_391_1.actors_["1038"]
			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 and arg_391_1.var_.actorSpriteComps1038 == nil then
				arg_391_1.var_.actorSpriteComps1038 = var_394_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_15 = 0.2

			if var_394_14 <= arg_391_1.time_ and arg_391_1.time_ < var_394_14 + var_394_15 then
				local var_394_16 = (arg_391_1.time_ - var_394_14) / var_394_15

				if arg_391_1.var_.actorSpriteComps1038 then
					for iter_394_1, iter_394_2 in pairs(arg_391_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_394_2 then
							local var_394_17 = Mathf.Lerp(iter_394_2.color.r, 1, var_394_16)

							iter_394_2.color = Color.New(var_394_17, var_394_17, var_394_17)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_14 + var_394_15 and arg_391_1.time_ < var_394_14 + var_394_15 + arg_394_0 and arg_391_1.var_.actorSpriteComps1038 then
				local var_394_18 = 1

				for iter_394_3, iter_394_4 in pairs(arg_391_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_394_4 then
						iter_394_4.color = Color.New(var_394_18, var_394_18, var_394_18)
					end
				end

				arg_391_1.var_.actorSpriteComps1038 = nil
			end

			local var_394_19 = 0
			local var_394_20 = 0.475

			if var_394_19 < arg_391_1.time_ and arg_391_1.time_ <= var_394_19 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_21 = arg_391_1:FormatText(StoryNameCfg[94].name)

				arg_391_1.leftNameTxt_.text = var_394_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_22 = arg_391_1:GetWordFromCfg(115271097)
				local var_394_23 = arg_391_1:FormatText(var_394_22.content)

				arg_391_1.text_.text = var_394_23

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_24 = 19
				local var_394_25 = utf8.len(var_394_23)
				local var_394_26 = var_394_24 <= 0 and var_394_20 or var_394_20 * (var_394_25 / var_394_24)

				if var_394_26 > 0 and var_394_20 < var_394_26 then
					arg_391_1.talkMaxDuration = var_394_26

					if var_394_26 + var_394_19 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_26 + var_394_19
					end
				end

				arg_391_1.text_.text = var_394_23
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271097", "story_v_out_115271.awb") ~= 0 then
					local var_394_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271097", "story_v_out_115271.awb") / 1000

					if var_394_27 + var_394_19 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_27 + var_394_19
					end

					if var_394_22.prefab_name ~= "" and arg_391_1.actors_[var_394_22.prefab_name] ~= nil then
						local var_394_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_22.prefab_name].transform, "story_v_out_115271", "115271097", "story_v_out_115271.awb")

						arg_391_1:RecordAudio("115271097", var_394_28)
						arg_391_1:RecordAudio("115271097", var_394_28)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_115271", "115271097", "story_v_out_115271.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_115271", "115271097", "story_v_out_115271.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_29 = math.max(var_394_20, arg_391_1.talkMaxDuration)

			if var_394_19 <= arg_391_1.time_ and arg_391_1.time_ < var_394_19 + var_394_29 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_19) / var_394_29

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_19 + var_394_29 and arg_391_1.time_ < var_394_19 + var_394_29 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play115271098 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 115271098
		arg_395_1.duration_ = 11.7

		local var_395_0 = {
			ja = 11.7,
			ko = 8.4,
			zh = 8.666,
			en = 8.666
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
				arg_395_0:Play115271099(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["10030"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos10030 = var_398_0.localPosition
				var_398_0.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("10030", 4)

				local var_398_2 = var_398_0.childCount

				for iter_398_0 = 0, var_398_2 - 1 do
					local var_398_3 = var_398_0:GetChild(iter_398_0)

					if var_398_3.name == "split_2" or not string.find(var_398_3.name, "split") then
						var_398_3.gameObject:SetActive(true)
					else
						var_398_3.gameObject:SetActive(false)
					end
				end
			end

			local var_398_4 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_1) / var_398_4
				local var_398_6 = Vector3.New(390, -390, 150)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos10030, var_398_6, var_398_5)
			end

			if arg_395_1.time_ >= var_398_1 + var_398_4 and arg_395_1.time_ < var_398_1 + var_398_4 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_398_7 = arg_395_1.actors_["10030"]
			local var_398_8 = 0

			if var_398_8 < arg_395_1.time_ and arg_395_1.time_ <= var_398_8 + arg_398_0 then
				local var_398_9 = var_398_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_398_9 then
					arg_395_1.var_.alphaOldValue10030 = var_398_9.alpha
					arg_395_1.var_.characterEffect10030 = var_398_9
				end

				arg_395_1.var_.alphaOldValue10030 = 0
			end

			local var_398_10 = 0.5

			if var_398_8 <= arg_395_1.time_ and arg_395_1.time_ < var_398_8 + var_398_10 then
				local var_398_11 = (arg_395_1.time_ - var_398_8) / var_398_10
				local var_398_12 = Mathf.Lerp(arg_395_1.var_.alphaOldValue10030, 1, var_398_11)

				if arg_395_1.var_.characterEffect10030 then
					arg_395_1.var_.characterEffect10030.alpha = var_398_12
				end
			end

			if arg_395_1.time_ >= var_398_8 + var_398_10 and arg_395_1.time_ < var_398_8 + var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect10030 then
				arg_395_1.var_.characterEffect10030.alpha = 1
			end

			local var_398_13 = arg_395_1.actors_["10030"]
			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 and arg_395_1.var_.actorSpriteComps10030 == nil then
				arg_395_1.var_.actorSpriteComps10030 = var_398_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_15 = 0.2

			if var_398_14 <= arg_395_1.time_ and arg_395_1.time_ < var_398_14 + var_398_15 then
				local var_398_16 = (arg_395_1.time_ - var_398_14) / var_398_15

				if arg_395_1.var_.actorSpriteComps10030 then
					for iter_398_1, iter_398_2 in pairs(arg_395_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_398_2 then
							local var_398_17 = Mathf.Lerp(iter_398_2.color.r, 1, var_398_16)

							iter_398_2.color = Color.New(var_398_17, var_398_17, var_398_17)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_14 + var_398_15 and arg_395_1.time_ < var_398_14 + var_398_15 + arg_398_0 and arg_395_1.var_.actorSpriteComps10030 then
				local var_398_18 = 1

				for iter_398_3, iter_398_4 in pairs(arg_395_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_398_4 then
						iter_398_4.color = Color.New(var_398_18, var_398_18, var_398_18)
					end
				end

				arg_395_1.var_.actorSpriteComps10030 = nil
			end

			local var_398_19 = arg_395_1.actors_["1038"]
			local var_398_20 = 0

			if var_398_20 < arg_395_1.time_ and arg_395_1.time_ <= var_398_20 + arg_398_0 and arg_395_1.var_.actorSpriteComps1038 == nil then
				arg_395_1.var_.actorSpriteComps1038 = var_398_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_21 = 0.2

			if var_398_20 <= arg_395_1.time_ and arg_395_1.time_ < var_398_20 + var_398_21 then
				local var_398_22 = (arg_395_1.time_ - var_398_20) / var_398_21

				if arg_395_1.var_.actorSpriteComps1038 then
					for iter_398_5, iter_398_6 in pairs(arg_395_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_398_6 then
							local var_398_23 = Mathf.Lerp(iter_398_6.color.r, 0.5, var_398_22)

							iter_398_6.color = Color.New(var_398_23, var_398_23, var_398_23)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_20 + var_398_21 and arg_395_1.time_ < var_398_20 + var_398_21 + arg_398_0 and arg_395_1.var_.actorSpriteComps1038 then
				local var_398_24 = 0.5

				for iter_398_7, iter_398_8 in pairs(arg_395_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_398_8 then
						iter_398_8.color = Color.New(var_398_24, var_398_24, var_398_24)
					end
				end

				arg_395_1.var_.actorSpriteComps1038 = nil
			end

			local var_398_25 = 0
			local var_398_26 = 0.7

			if var_398_25 < arg_395_1.time_ and arg_395_1.time_ <= var_398_25 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_27 = arg_395_1:FormatText(StoryNameCfg[309].name)

				arg_395_1.leftNameTxt_.text = var_398_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_28 = arg_395_1:GetWordFromCfg(115271098)
				local var_398_29 = arg_395_1:FormatText(var_398_28.content)

				arg_395_1.text_.text = var_398_29

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_30 = 28
				local var_398_31 = utf8.len(var_398_29)
				local var_398_32 = var_398_30 <= 0 and var_398_26 or var_398_26 * (var_398_31 / var_398_30)

				if var_398_32 > 0 and var_398_26 < var_398_32 then
					arg_395_1.talkMaxDuration = var_398_32

					if var_398_32 + var_398_25 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_32 + var_398_25
					end
				end

				arg_395_1.text_.text = var_398_29
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271098", "story_v_out_115271.awb") ~= 0 then
					local var_398_33 = manager.audio:GetVoiceLength("story_v_out_115271", "115271098", "story_v_out_115271.awb") / 1000

					if var_398_33 + var_398_25 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_33 + var_398_25
					end

					if var_398_28.prefab_name ~= "" and arg_395_1.actors_[var_398_28.prefab_name] ~= nil then
						local var_398_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_28.prefab_name].transform, "story_v_out_115271", "115271098", "story_v_out_115271.awb")

						arg_395_1:RecordAudio("115271098", var_398_34)
						arg_395_1:RecordAudio("115271098", var_398_34)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_115271", "115271098", "story_v_out_115271.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_115271", "115271098", "story_v_out_115271.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_35 = math.max(var_398_26, arg_395_1.talkMaxDuration)

			if var_398_25 <= arg_395_1.time_ and arg_395_1.time_ < var_398_25 + var_398_35 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_25) / var_398_35

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_25 + var_398_35 and arg_395_1.time_ < var_398_25 + var_398_35 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play115271099 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 115271099
		arg_399_1.duration_ = 8.966

		local var_399_0 = {
			ja = 8.833,
			ko = 8.7,
			zh = 7.733,
			en = 8.966
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
				arg_399_0:Play115271100(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0
			local var_402_1 = 0.95

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_2 = arg_399_1:FormatText(StoryNameCfg[309].name)

				arg_399_1.leftNameTxt_.text = var_402_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_3 = arg_399_1:GetWordFromCfg(115271099)
				local var_402_4 = arg_399_1:FormatText(var_402_3.content)

				arg_399_1.text_.text = var_402_4

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271099", "story_v_out_115271.awb") ~= 0 then
					local var_402_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271099", "story_v_out_115271.awb") / 1000

					if var_402_8 + var_402_0 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_8 + var_402_0
					end

					if var_402_3.prefab_name ~= "" and arg_399_1.actors_[var_402_3.prefab_name] ~= nil then
						local var_402_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_3.prefab_name].transform, "story_v_out_115271", "115271099", "story_v_out_115271.awb")

						arg_399_1:RecordAudio("115271099", var_402_9)
						arg_399_1:RecordAudio("115271099", var_402_9)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_115271", "115271099", "story_v_out_115271.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_115271", "115271099", "story_v_out_115271.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_10 = math.max(var_402_1, arg_399_1.talkMaxDuration)

			if var_402_0 <= arg_399_1.time_ and arg_399_1.time_ < var_402_0 + var_402_10 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_0) / var_402_10

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_0 + var_402_10 and arg_399_1.time_ < var_402_0 + var_402_10 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play115271100 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 115271100
		arg_403_1.duration_ = 5.033

		local var_403_0 = {
			ja = 3.033,
			ko = 3.966,
			zh = 4.566,
			en = 5.033
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play115271101(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["10030"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.actorSpriteComps10030 == nil then
				arg_403_1.var_.actorSpriteComps10030 = var_406_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_406_2 = 0.2

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.actorSpriteComps10030 then
					for iter_406_0, iter_406_1 in pairs(arg_403_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_406_1 then
							local var_406_4 = Mathf.Lerp(iter_406_1.color.r, 0.5, var_406_3)

							iter_406_1.color = Color.New(var_406_4, var_406_4, var_406_4)
						end
					end
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.actorSpriteComps10030 then
				local var_406_5 = 0.5

				for iter_406_2, iter_406_3 in pairs(arg_403_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_406_3 then
						iter_406_3.color = Color.New(var_406_5, var_406_5, var_406_5)
					end
				end

				arg_403_1.var_.actorSpriteComps10030 = nil
			end

			local var_406_6 = arg_403_1.actors_["1038"].transform
			local var_406_7 = 0

			if var_406_7 < arg_403_1.time_ and arg_403_1.time_ <= var_406_7 + arg_406_0 then
				arg_403_1.var_.moveOldPos1038 = var_406_6.localPosition
				var_406_6.localScale = Vector3.New(1, 1, 1)

				arg_403_1:CheckSpriteTmpPos("1038", 2)

				local var_406_8 = var_406_6.childCount

				for iter_406_4 = 0, var_406_8 - 1 do
					local var_406_9 = var_406_6:GetChild(iter_406_4)

					if var_406_9.name == "split_9" or not string.find(var_406_9.name, "split") then
						var_406_9.gameObject:SetActive(true)
					else
						var_406_9.gameObject:SetActive(false)
					end
				end
			end

			local var_406_10 = 0.001

			if var_406_7 <= arg_403_1.time_ and arg_403_1.time_ < var_406_7 + var_406_10 then
				local var_406_11 = (arg_403_1.time_ - var_406_7) / var_406_10
				local var_406_12 = Vector3.New(-390, -400, 0)

				var_406_6.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1038, var_406_12, var_406_11)
			end

			if arg_403_1.time_ >= var_406_7 + var_406_10 and arg_403_1.time_ < var_406_7 + var_406_10 + arg_406_0 then
				var_406_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_406_13 = arg_403_1.actors_["1038"]
			local var_406_14 = 0

			if var_406_14 < arg_403_1.time_ and arg_403_1.time_ <= var_406_14 + arg_406_0 and arg_403_1.var_.actorSpriteComps1038 == nil then
				arg_403_1.var_.actorSpriteComps1038 = var_406_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_406_15 = 0.2

			if var_406_14 <= arg_403_1.time_ and arg_403_1.time_ < var_406_14 + var_406_15 then
				local var_406_16 = (arg_403_1.time_ - var_406_14) / var_406_15

				if arg_403_1.var_.actorSpriteComps1038 then
					for iter_406_5, iter_406_6 in pairs(arg_403_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_406_6 then
							local var_406_17 = Mathf.Lerp(iter_406_6.color.r, 1, var_406_16)

							iter_406_6.color = Color.New(var_406_17, var_406_17, var_406_17)
						end
					end
				end
			end

			if arg_403_1.time_ >= var_406_14 + var_406_15 and arg_403_1.time_ < var_406_14 + var_406_15 + arg_406_0 and arg_403_1.var_.actorSpriteComps1038 then
				local var_406_18 = 1

				for iter_406_7, iter_406_8 in pairs(arg_403_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_406_8 then
						iter_406_8.color = Color.New(var_406_18, var_406_18, var_406_18)
					end
				end

				arg_403_1.var_.actorSpriteComps1038 = nil
			end

			local var_406_19 = 0
			local var_406_20 = 0.35

			if var_406_19 < arg_403_1.time_ and arg_403_1.time_ <= var_406_19 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_21 = arg_403_1:FormatText(StoryNameCfg[94].name)

				arg_403_1.leftNameTxt_.text = var_406_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_22 = arg_403_1:GetWordFromCfg(115271100)
				local var_406_23 = arg_403_1:FormatText(var_406_22.content)

				arg_403_1.text_.text = var_406_23

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_24 = 14
				local var_406_25 = utf8.len(var_406_23)
				local var_406_26 = var_406_24 <= 0 and var_406_20 or var_406_20 * (var_406_25 / var_406_24)

				if var_406_26 > 0 and var_406_20 < var_406_26 then
					arg_403_1.talkMaxDuration = var_406_26

					if var_406_26 + var_406_19 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_26 + var_406_19
					end
				end

				arg_403_1.text_.text = var_406_23
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271100", "story_v_out_115271.awb") ~= 0 then
					local var_406_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271100", "story_v_out_115271.awb") / 1000

					if var_406_27 + var_406_19 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_27 + var_406_19
					end

					if var_406_22.prefab_name ~= "" and arg_403_1.actors_[var_406_22.prefab_name] ~= nil then
						local var_406_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_22.prefab_name].transform, "story_v_out_115271", "115271100", "story_v_out_115271.awb")

						arg_403_1:RecordAudio("115271100", var_406_28)
						arg_403_1:RecordAudio("115271100", var_406_28)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_115271", "115271100", "story_v_out_115271.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_115271", "115271100", "story_v_out_115271.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_29 = math.max(var_406_20, arg_403_1.talkMaxDuration)

			if var_406_19 <= arg_403_1.time_ and arg_403_1.time_ < var_406_19 + var_406_29 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_19) / var_406_29

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_19 + var_406_29 and arg_403_1.time_ < var_406_19 + var_406_29 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play115271101 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 115271101
		arg_407_1.duration_ = 6.333

		local var_407_0 = {
			ja = 4.6,
			ko = 5.1,
			zh = 5.666,
			en = 6.333
		}
		local var_407_1 = manager.audio:GetLocalizationFlag()

		if var_407_0[var_407_1] ~= nil then
			arg_407_1.duration_ = var_407_0[var_407_1]
		end

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play115271102(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["10030"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.actorSpriteComps10030 == nil then
				arg_407_1.var_.actorSpriteComps10030 = var_410_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_410_2 = 0.2

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.actorSpriteComps10030 then
					for iter_410_0, iter_410_1 in pairs(arg_407_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_410_1 then
							local var_410_4 = Mathf.Lerp(iter_410_1.color.r, 1, var_410_3)

							iter_410_1.color = Color.New(var_410_4, var_410_4, var_410_4)
						end
					end
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.actorSpriteComps10030 then
				local var_410_5 = 1

				for iter_410_2, iter_410_3 in pairs(arg_407_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_410_3 then
						iter_410_3.color = Color.New(var_410_5, var_410_5, var_410_5)
					end
				end

				arg_407_1.var_.actorSpriteComps10030 = nil
			end

			local var_410_6 = arg_407_1.actors_["1038"]
			local var_410_7 = 0

			if var_410_7 < arg_407_1.time_ and arg_407_1.time_ <= var_410_7 + arg_410_0 and arg_407_1.var_.actorSpriteComps1038 == nil then
				arg_407_1.var_.actorSpriteComps1038 = var_410_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_410_8 = 0.2

			if var_410_7 <= arg_407_1.time_ and arg_407_1.time_ < var_410_7 + var_410_8 then
				local var_410_9 = (arg_407_1.time_ - var_410_7) / var_410_8

				if arg_407_1.var_.actorSpriteComps1038 then
					for iter_410_4, iter_410_5 in pairs(arg_407_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_410_5 then
							local var_410_10 = Mathf.Lerp(iter_410_5.color.r, 0.5, var_410_9)

							iter_410_5.color = Color.New(var_410_10, var_410_10, var_410_10)
						end
					end
				end
			end

			if arg_407_1.time_ >= var_410_7 + var_410_8 and arg_407_1.time_ < var_410_7 + var_410_8 + arg_410_0 and arg_407_1.var_.actorSpriteComps1038 then
				local var_410_11 = 0.5

				for iter_410_6, iter_410_7 in pairs(arg_407_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_410_7 then
						iter_410_7.color = Color.New(var_410_11, var_410_11, var_410_11)
					end
				end

				arg_407_1.var_.actorSpriteComps1038 = nil
			end

			local var_410_12 = 0
			local var_410_13 = 0.5

			if var_410_12 < arg_407_1.time_ and arg_407_1.time_ <= var_410_12 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_14 = arg_407_1:FormatText(StoryNameCfg[309].name)

				arg_407_1.leftNameTxt_.text = var_410_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_15 = arg_407_1:GetWordFromCfg(115271101)
				local var_410_16 = arg_407_1:FormatText(var_410_15.content)

				arg_407_1.text_.text = var_410_16

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_17 = 20
				local var_410_18 = utf8.len(var_410_16)
				local var_410_19 = var_410_17 <= 0 and var_410_13 or var_410_13 * (var_410_18 / var_410_17)

				if var_410_19 > 0 and var_410_13 < var_410_19 then
					arg_407_1.talkMaxDuration = var_410_19

					if var_410_19 + var_410_12 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_19 + var_410_12
					end
				end

				arg_407_1.text_.text = var_410_16
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271101", "story_v_out_115271.awb") ~= 0 then
					local var_410_20 = manager.audio:GetVoiceLength("story_v_out_115271", "115271101", "story_v_out_115271.awb") / 1000

					if var_410_20 + var_410_12 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_20 + var_410_12
					end

					if var_410_15.prefab_name ~= "" and arg_407_1.actors_[var_410_15.prefab_name] ~= nil then
						local var_410_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_15.prefab_name].transform, "story_v_out_115271", "115271101", "story_v_out_115271.awb")

						arg_407_1:RecordAudio("115271101", var_410_21)
						arg_407_1:RecordAudio("115271101", var_410_21)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_115271", "115271101", "story_v_out_115271.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_115271", "115271101", "story_v_out_115271.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_22 = math.max(var_410_13, arg_407_1.talkMaxDuration)

			if var_410_12 <= arg_407_1.time_ and arg_407_1.time_ < var_410_12 + var_410_22 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_12) / var_410_22

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_12 + var_410_22 and arg_407_1.time_ < var_410_12 + var_410_22 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play115271102 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 115271102
		arg_411_1.duration_ = 7.3

		local var_411_0 = {
			ja = 7.3,
			ko = 4.533,
			zh = 5.5,
			en = 4.666
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
				arg_411_0:Play115271103(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["10030"]
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 and arg_411_1.var_.actorSpriteComps10030 == nil then
				arg_411_1.var_.actorSpriteComps10030 = var_414_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_414_2 = 0.2

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2

				if arg_411_1.var_.actorSpriteComps10030 then
					for iter_414_0, iter_414_1 in pairs(arg_411_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_414_1 then
							local var_414_4 = Mathf.Lerp(iter_414_1.color.r, 0.5, var_414_3)

							iter_414_1.color = Color.New(var_414_4, var_414_4, var_414_4)
						end
					end
				end
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 and arg_411_1.var_.actorSpriteComps10030 then
				local var_414_5 = 0.5

				for iter_414_2, iter_414_3 in pairs(arg_411_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_414_3 then
						iter_414_3.color = Color.New(var_414_5, var_414_5, var_414_5)
					end
				end

				arg_411_1.var_.actorSpriteComps10030 = nil
			end

			local var_414_6 = arg_411_1.actors_["1038"]
			local var_414_7 = 0

			if var_414_7 < arg_411_1.time_ and arg_411_1.time_ <= var_414_7 + arg_414_0 and arg_411_1.var_.actorSpriteComps1038 == nil then
				arg_411_1.var_.actorSpriteComps1038 = var_414_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_414_8 = 0.2

			if var_414_7 <= arg_411_1.time_ and arg_411_1.time_ < var_414_7 + var_414_8 then
				local var_414_9 = (arg_411_1.time_ - var_414_7) / var_414_8

				if arg_411_1.var_.actorSpriteComps1038 then
					for iter_414_4, iter_414_5 in pairs(arg_411_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_414_5 then
							local var_414_10 = Mathf.Lerp(iter_414_5.color.r, 1, var_414_9)

							iter_414_5.color = Color.New(var_414_10, var_414_10, var_414_10)
						end
					end
				end
			end

			if arg_411_1.time_ >= var_414_7 + var_414_8 and arg_411_1.time_ < var_414_7 + var_414_8 + arg_414_0 and arg_411_1.var_.actorSpriteComps1038 then
				local var_414_11 = 1

				for iter_414_6, iter_414_7 in pairs(arg_411_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_414_7 then
						iter_414_7.color = Color.New(var_414_11, var_414_11, var_414_11)
					end
				end

				arg_411_1.var_.actorSpriteComps1038 = nil
			end

			local var_414_12 = 0
			local var_414_13 = 0.5

			if var_414_12 < arg_411_1.time_ and arg_411_1.time_ <= var_414_12 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_14 = arg_411_1:FormatText(StoryNameCfg[94].name)

				arg_411_1.leftNameTxt_.text = var_414_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_15 = arg_411_1:GetWordFromCfg(115271102)
				local var_414_16 = arg_411_1:FormatText(var_414_15.content)

				arg_411_1.text_.text = var_414_16

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_17 = 20
				local var_414_18 = utf8.len(var_414_16)
				local var_414_19 = var_414_17 <= 0 and var_414_13 or var_414_13 * (var_414_18 / var_414_17)

				if var_414_19 > 0 and var_414_13 < var_414_19 then
					arg_411_1.talkMaxDuration = var_414_19

					if var_414_19 + var_414_12 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_19 + var_414_12
					end
				end

				arg_411_1.text_.text = var_414_16
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271102", "story_v_out_115271.awb") ~= 0 then
					local var_414_20 = manager.audio:GetVoiceLength("story_v_out_115271", "115271102", "story_v_out_115271.awb") / 1000

					if var_414_20 + var_414_12 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_20 + var_414_12
					end

					if var_414_15.prefab_name ~= "" and arg_411_1.actors_[var_414_15.prefab_name] ~= nil then
						local var_414_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_15.prefab_name].transform, "story_v_out_115271", "115271102", "story_v_out_115271.awb")

						arg_411_1:RecordAudio("115271102", var_414_21)
						arg_411_1:RecordAudio("115271102", var_414_21)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_115271", "115271102", "story_v_out_115271.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_115271", "115271102", "story_v_out_115271.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_22 = math.max(var_414_13, arg_411_1.talkMaxDuration)

			if var_414_12 <= arg_411_1.time_ and arg_411_1.time_ < var_414_12 + var_414_22 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_12) / var_414_22

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_12 + var_414_22 and arg_411_1.time_ < var_414_12 + var_414_22 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play115271103 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 115271103
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play115271104(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1038"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.actorSpriteComps1038 == nil then
				arg_415_1.var_.actorSpriteComps1038 = var_418_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_418_2 = 0.2

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.actorSpriteComps1038 then
					for iter_418_0, iter_418_1 in pairs(arg_415_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_418_1 then
							local var_418_4 = Mathf.Lerp(iter_418_1.color.r, 0.5, var_418_3)

							iter_418_1.color = Color.New(var_418_4, var_418_4, var_418_4)
						end
					end
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.actorSpriteComps1038 then
				local var_418_5 = 0.5

				for iter_418_2, iter_418_3 in pairs(arg_415_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_418_3 then
						iter_418_3.color = Color.New(var_418_5, var_418_5, var_418_5)
					end
				end

				arg_415_1.var_.actorSpriteComps1038 = nil
			end

			local var_418_6 = 0
			local var_418_7 = 0.675

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_8 = arg_415_1:GetWordFromCfg(115271103)
				local var_418_9 = arg_415_1:FormatText(var_418_8.content)

				arg_415_1.text_.text = var_418_9

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_10 = 27
				local var_418_11 = utf8.len(var_418_9)
				local var_418_12 = var_418_10 <= 0 and var_418_7 or var_418_7 * (var_418_11 / var_418_10)

				if var_418_12 > 0 and var_418_7 < var_418_12 then
					arg_415_1.talkMaxDuration = var_418_12

					if var_418_12 + var_418_6 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_12 + var_418_6
					end
				end

				arg_415_1.text_.text = var_418_9
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_13 = math.max(var_418_7, arg_415_1.talkMaxDuration)

			if var_418_6 <= arg_415_1.time_ and arg_415_1.time_ < var_418_6 + var_418_13 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_6) / var_418_13

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_6 + var_418_13 and arg_415_1.time_ < var_418_6 + var_418_13 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play115271104 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 115271104
		arg_419_1.duration_ = 3.9

		local var_419_0 = {
			ja = 2.8,
			ko = 2.6,
			zh = 3.466,
			en = 3.9
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
				arg_419_0:Play115271105(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1038"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.actorSpriteComps1038 == nil then
				arg_419_1.var_.actorSpriteComps1038 = var_422_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_422_2 = 0.2

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.actorSpriteComps1038 then
					for iter_422_0, iter_422_1 in pairs(arg_419_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_422_1 then
							local var_422_4 = Mathf.Lerp(iter_422_1.color.r, 1, var_422_3)

							iter_422_1.color = Color.New(var_422_4, var_422_4, var_422_4)
						end
					end
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.actorSpriteComps1038 then
				local var_422_5 = 1

				for iter_422_2, iter_422_3 in pairs(arg_419_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_422_3 then
						iter_422_3.color = Color.New(var_422_5, var_422_5, var_422_5)
					end
				end

				arg_419_1.var_.actorSpriteComps1038 = nil
			end

			local var_422_6 = 0
			local var_422_7 = 0.3

			if var_422_6 < arg_419_1.time_ and arg_419_1.time_ <= var_422_6 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_8 = arg_419_1:FormatText(StoryNameCfg[94].name)

				arg_419_1.leftNameTxt_.text = var_422_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_9 = arg_419_1:GetWordFromCfg(115271104)
				local var_422_10 = arg_419_1:FormatText(var_422_9.content)

				arg_419_1.text_.text = var_422_10

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271104", "story_v_out_115271.awb") ~= 0 then
					local var_422_14 = manager.audio:GetVoiceLength("story_v_out_115271", "115271104", "story_v_out_115271.awb") / 1000

					if var_422_14 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_14 + var_422_6
					end

					if var_422_9.prefab_name ~= "" and arg_419_1.actors_[var_422_9.prefab_name] ~= nil then
						local var_422_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_9.prefab_name].transform, "story_v_out_115271", "115271104", "story_v_out_115271.awb")

						arg_419_1:RecordAudio("115271104", var_422_15)
						arg_419_1:RecordAudio("115271104", var_422_15)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_115271", "115271104", "story_v_out_115271.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_115271", "115271104", "story_v_out_115271.awb")
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
	Play115271105 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 115271105
		arg_423_1.duration_ = 6.6

		local var_423_0 = {
			ja = 3.1,
			ko = 5.833,
			zh = 3.666,
			en = 6.6
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
				arg_423_0:Play115271106(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["10030"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.actorSpriteComps10030 == nil then
				arg_423_1.var_.actorSpriteComps10030 = var_426_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_426_2 = 0.2

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.actorSpriteComps10030 then
					for iter_426_0, iter_426_1 in pairs(arg_423_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_426_1 then
							local var_426_4 = Mathf.Lerp(iter_426_1.color.r, 1, var_426_3)

							iter_426_1.color = Color.New(var_426_4, var_426_4, var_426_4)
						end
					end
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.actorSpriteComps10030 then
				local var_426_5 = 1

				for iter_426_2, iter_426_3 in pairs(arg_423_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_426_3 then
						iter_426_3.color = Color.New(var_426_5, var_426_5, var_426_5)
					end
				end

				arg_423_1.var_.actorSpriteComps10030 = nil
			end

			local var_426_6 = arg_423_1.actors_["1038"]
			local var_426_7 = 0

			if var_426_7 < arg_423_1.time_ and arg_423_1.time_ <= var_426_7 + arg_426_0 and arg_423_1.var_.actorSpriteComps1038 == nil then
				arg_423_1.var_.actorSpriteComps1038 = var_426_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_426_8 = 0.2

			if var_426_7 <= arg_423_1.time_ and arg_423_1.time_ < var_426_7 + var_426_8 then
				local var_426_9 = (arg_423_1.time_ - var_426_7) / var_426_8

				if arg_423_1.var_.actorSpriteComps1038 then
					for iter_426_4, iter_426_5 in pairs(arg_423_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_426_5 then
							local var_426_10 = Mathf.Lerp(iter_426_5.color.r, 0.5, var_426_9)

							iter_426_5.color = Color.New(var_426_10, var_426_10, var_426_10)
						end
					end
				end
			end

			if arg_423_1.time_ >= var_426_7 + var_426_8 and arg_423_1.time_ < var_426_7 + var_426_8 + arg_426_0 and arg_423_1.var_.actorSpriteComps1038 then
				local var_426_11 = 0.5

				for iter_426_6, iter_426_7 in pairs(arg_423_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_426_7 then
						iter_426_7.color = Color.New(var_426_11, var_426_11, var_426_11)
					end
				end

				arg_423_1.var_.actorSpriteComps1038 = nil
			end

			local var_426_12 = arg_423_1.actors_["10030"].transform
			local var_426_13 = 0

			if var_426_13 < arg_423_1.time_ and arg_423_1.time_ <= var_426_13 + arg_426_0 then
				arg_423_1.var_.moveOldPos10030 = var_426_12.localPosition
				var_426_12.localScale = Vector3.New(1, 1, 1)

				arg_423_1:CheckSpriteTmpPos("10030", 4)

				local var_426_14 = var_426_12.childCount

				for iter_426_8 = 0, var_426_14 - 1 do
					local var_426_15 = var_426_12:GetChild(iter_426_8)

					if var_426_15.name == "split_3" or not string.find(var_426_15.name, "split") then
						var_426_15.gameObject:SetActive(true)
					else
						var_426_15.gameObject:SetActive(false)
					end
				end
			end

			local var_426_16 = 0.001

			if var_426_13 <= arg_423_1.time_ and arg_423_1.time_ < var_426_13 + var_426_16 then
				local var_426_17 = (arg_423_1.time_ - var_426_13) / var_426_16
				local var_426_18 = Vector3.New(390, -390, 150)

				var_426_12.localPosition = Vector3.Lerp(arg_423_1.var_.moveOldPos10030, var_426_18, var_426_17)
			end

			if arg_423_1.time_ >= var_426_13 + var_426_16 and arg_423_1.time_ < var_426_13 + var_426_16 + arg_426_0 then
				var_426_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_426_19 = 0
			local var_426_20 = 0.4

			if var_426_19 < arg_423_1.time_ and arg_423_1.time_ <= var_426_19 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_21 = arg_423_1:FormatText(StoryNameCfg[309].name)

				arg_423_1.leftNameTxt_.text = var_426_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_22 = arg_423_1:GetWordFromCfg(115271105)
				local var_426_23 = arg_423_1:FormatText(var_426_22.content)

				arg_423_1.text_.text = var_426_23

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_24 = 16
				local var_426_25 = utf8.len(var_426_23)
				local var_426_26 = var_426_24 <= 0 and var_426_20 or var_426_20 * (var_426_25 / var_426_24)

				if var_426_26 > 0 and var_426_20 < var_426_26 then
					arg_423_1.talkMaxDuration = var_426_26

					if var_426_26 + var_426_19 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_26 + var_426_19
					end
				end

				arg_423_1.text_.text = var_426_23
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271105", "story_v_out_115271.awb") ~= 0 then
					local var_426_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271105", "story_v_out_115271.awb") / 1000

					if var_426_27 + var_426_19 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_27 + var_426_19
					end

					if var_426_22.prefab_name ~= "" and arg_423_1.actors_[var_426_22.prefab_name] ~= nil then
						local var_426_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_22.prefab_name].transform, "story_v_out_115271", "115271105", "story_v_out_115271.awb")

						arg_423_1:RecordAudio("115271105", var_426_28)
						arg_423_1:RecordAudio("115271105", var_426_28)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_115271", "115271105", "story_v_out_115271.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_115271", "115271105", "story_v_out_115271.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_29 = math.max(var_426_20, arg_423_1.talkMaxDuration)

			if var_426_19 <= arg_423_1.time_ and arg_423_1.time_ < var_426_19 + var_426_29 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_19) / var_426_29

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_19 + var_426_29 and arg_423_1.time_ < var_426_19 + var_426_29 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play115271106 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 115271106
		arg_427_1.duration_ = 10.3

		local var_427_0 = {
			ja = 8.233,
			ko = 10.3,
			zh = 9.5,
			en = 8.566
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
				arg_427_0:Play115271107(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["10030"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.actorSpriteComps10030 == nil then
				arg_427_1.var_.actorSpriteComps10030 = var_430_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_430_2 = 0.2

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.actorSpriteComps10030 then
					for iter_430_0, iter_430_1 in pairs(arg_427_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_430_1 then
							local var_430_4 = Mathf.Lerp(iter_430_1.color.r, 0.5, var_430_3)

							iter_430_1.color = Color.New(var_430_4, var_430_4, var_430_4)
						end
					end
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.actorSpriteComps10030 then
				local var_430_5 = 0.5

				for iter_430_2, iter_430_3 in pairs(arg_427_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_430_3 then
						iter_430_3.color = Color.New(var_430_5, var_430_5, var_430_5)
					end
				end

				arg_427_1.var_.actorSpriteComps10030 = nil
			end

			local var_430_6 = arg_427_1.actors_["1038"]
			local var_430_7 = 0

			if var_430_7 < arg_427_1.time_ and arg_427_1.time_ <= var_430_7 + arg_430_0 and arg_427_1.var_.actorSpriteComps1038 == nil then
				arg_427_1.var_.actorSpriteComps1038 = var_430_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_430_8 = 0.2

			if var_430_7 <= arg_427_1.time_ and arg_427_1.time_ < var_430_7 + var_430_8 then
				local var_430_9 = (arg_427_1.time_ - var_430_7) / var_430_8

				if arg_427_1.var_.actorSpriteComps1038 then
					for iter_430_4, iter_430_5 in pairs(arg_427_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_430_5 then
							local var_430_10 = Mathf.Lerp(iter_430_5.color.r, 1, var_430_9)

							iter_430_5.color = Color.New(var_430_10, var_430_10, var_430_10)
						end
					end
				end
			end

			if arg_427_1.time_ >= var_430_7 + var_430_8 and arg_427_1.time_ < var_430_7 + var_430_8 + arg_430_0 and arg_427_1.var_.actorSpriteComps1038 then
				local var_430_11 = 1

				for iter_430_6, iter_430_7 in pairs(arg_427_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_430_7 then
						iter_430_7.color = Color.New(var_430_11, var_430_11, var_430_11)
					end
				end

				arg_427_1.var_.actorSpriteComps1038 = nil
			end

			local var_430_12 = 0
			local var_430_13 = 0.825

			if var_430_12 < arg_427_1.time_ and arg_427_1.time_ <= var_430_12 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_14 = arg_427_1:FormatText(StoryNameCfg[94].name)

				arg_427_1.leftNameTxt_.text = var_430_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_15 = arg_427_1:GetWordFromCfg(115271106)
				local var_430_16 = arg_427_1:FormatText(var_430_15.content)

				arg_427_1.text_.text = var_430_16

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_17 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271106", "story_v_out_115271.awb") ~= 0 then
					local var_430_20 = manager.audio:GetVoiceLength("story_v_out_115271", "115271106", "story_v_out_115271.awb") / 1000

					if var_430_20 + var_430_12 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_20 + var_430_12
					end

					if var_430_15.prefab_name ~= "" and arg_427_1.actors_[var_430_15.prefab_name] ~= nil then
						local var_430_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_15.prefab_name].transform, "story_v_out_115271", "115271106", "story_v_out_115271.awb")

						arg_427_1:RecordAudio("115271106", var_430_21)
						arg_427_1:RecordAudio("115271106", var_430_21)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_115271", "115271106", "story_v_out_115271.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_115271", "115271106", "story_v_out_115271.awb")
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
	Play115271107 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 115271107
		arg_431_1.duration_ = 7.033

		local var_431_0 = {
			ja = 4.6,
			ko = 5.666,
			zh = 7.033,
			en = 5.9
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
				arg_431_0:Play115271108(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 0.7

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_2 = arg_431_1:FormatText(StoryNameCfg[94].name)

				arg_431_1.leftNameTxt_.text = var_434_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_3 = arg_431_1:GetWordFromCfg(115271107)
				local var_434_4 = arg_431_1:FormatText(var_434_3.content)

				arg_431_1.text_.text = var_434_4

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_5 = 28
				local var_434_6 = utf8.len(var_434_4)
				local var_434_7 = var_434_5 <= 0 and var_434_1 or var_434_1 * (var_434_6 / var_434_5)

				if var_434_7 > 0 and var_434_1 < var_434_7 then
					arg_431_1.talkMaxDuration = var_434_7

					if var_434_7 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_7 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_4
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271107", "story_v_out_115271.awb") ~= 0 then
					local var_434_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271107", "story_v_out_115271.awb") / 1000

					if var_434_8 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_8 + var_434_0
					end

					if var_434_3.prefab_name ~= "" and arg_431_1.actors_[var_434_3.prefab_name] ~= nil then
						local var_434_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_3.prefab_name].transform, "story_v_out_115271", "115271107", "story_v_out_115271.awb")

						arg_431_1:RecordAudio("115271107", var_434_9)
						arg_431_1:RecordAudio("115271107", var_434_9)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_115271", "115271107", "story_v_out_115271.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_115271", "115271107", "story_v_out_115271.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_10 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_10 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_10

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_10 and arg_431_1.time_ < var_434_0 + var_434_10 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play115271108 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 115271108
		arg_435_1.duration_ = 9.033

		local var_435_0 = {
			ja = 9.033,
			ko = 6.133,
			zh = 6.066,
			en = 5.766
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play115271109(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["10030"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and arg_435_1.var_.actorSpriteComps10030 == nil then
				arg_435_1.var_.actorSpriteComps10030 = var_438_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_438_2 = 0.2

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.actorSpriteComps10030 then
					for iter_438_0, iter_438_1 in pairs(arg_435_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_438_1 then
							local var_438_4 = Mathf.Lerp(iter_438_1.color.r, 1, var_438_3)

							iter_438_1.color = Color.New(var_438_4, var_438_4, var_438_4)
						end
					end
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and arg_435_1.var_.actorSpriteComps10030 then
				local var_438_5 = 1

				for iter_438_2, iter_438_3 in pairs(arg_435_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_438_3 then
						iter_438_3.color = Color.New(var_438_5, var_438_5, var_438_5)
					end
				end

				arg_435_1.var_.actorSpriteComps10030 = nil
			end

			local var_438_6 = arg_435_1.actors_["1038"]
			local var_438_7 = 0

			if var_438_7 < arg_435_1.time_ and arg_435_1.time_ <= var_438_7 + arg_438_0 and arg_435_1.var_.actorSpriteComps1038 == nil then
				arg_435_1.var_.actorSpriteComps1038 = var_438_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_438_8 = 0.2

			if var_438_7 <= arg_435_1.time_ and arg_435_1.time_ < var_438_7 + var_438_8 then
				local var_438_9 = (arg_435_1.time_ - var_438_7) / var_438_8

				if arg_435_1.var_.actorSpriteComps1038 then
					for iter_438_4, iter_438_5 in pairs(arg_435_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_438_5 then
							local var_438_10 = Mathf.Lerp(iter_438_5.color.r, 0.5, var_438_9)

							iter_438_5.color = Color.New(var_438_10, var_438_10, var_438_10)
						end
					end
				end
			end

			if arg_435_1.time_ >= var_438_7 + var_438_8 and arg_435_1.time_ < var_438_7 + var_438_8 + arg_438_0 and arg_435_1.var_.actorSpriteComps1038 then
				local var_438_11 = 0.5

				for iter_438_6, iter_438_7 in pairs(arg_435_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_438_7 then
						iter_438_7.color = Color.New(var_438_11, var_438_11, var_438_11)
					end
				end

				arg_435_1.var_.actorSpriteComps1038 = nil
			end

			local var_438_12 = 0
			local var_438_13 = 0.5

			if var_438_12 < arg_435_1.time_ and arg_435_1.time_ <= var_438_12 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_14 = arg_435_1:FormatText(StoryNameCfg[309].name)

				arg_435_1.leftNameTxt_.text = var_438_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_15 = arg_435_1:GetWordFromCfg(115271108)
				local var_438_16 = arg_435_1:FormatText(var_438_15.content)

				arg_435_1.text_.text = var_438_16

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_17 = 20
				local var_438_18 = utf8.len(var_438_16)
				local var_438_19 = var_438_17 <= 0 and var_438_13 or var_438_13 * (var_438_18 / var_438_17)

				if var_438_19 > 0 and var_438_13 < var_438_19 then
					arg_435_1.talkMaxDuration = var_438_19

					if var_438_19 + var_438_12 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_19 + var_438_12
					end
				end

				arg_435_1.text_.text = var_438_16
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271108", "story_v_out_115271.awb") ~= 0 then
					local var_438_20 = manager.audio:GetVoiceLength("story_v_out_115271", "115271108", "story_v_out_115271.awb") / 1000

					if var_438_20 + var_438_12 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_20 + var_438_12
					end

					if var_438_15.prefab_name ~= "" and arg_435_1.actors_[var_438_15.prefab_name] ~= nil then
						local var_438_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_15.prefab_name].transform, "story_v_out_115271", "115271108", "story_v_out_115271.awb")

						arg_435_1:RecordAudio("115271108", var_438_21)
						arg_435_1:RecordAudio("115271108", var_438_21)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_115271", "115271108", "story_v_out_115271.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_115271", "115271108", "story_v_out_115271.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_22 = math.max(var_438_13, arg_435_1.talkMaxDuration)

			if var_438_12 <= arg_435_1.time_ and arg_435_1.time_ < var_438_12 + var_438_22 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_12) / var_438_22

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_12 + var_438_22 and arg_435_1.time_ < var_438_12 + var_438_22 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play115271109 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 115271109
		arg_439_1.duration_ = 11.7

		local var_439_0 = {
			ja = 9.5,
			ko = 11.7,
			zh = 10.2,
			en = 10.9
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
				arg_439_0:Play115271110(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["10030"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.actorSpriteComps10030 == nil then
				arg_439_1.var_.actorSpriteComps10030 = var_442_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_442_2 = 0.2

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.actorSpriteComps10030 then
					for iter_442_0, iter_442_1 in pairs(arg_439_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_442_1 then
							local var_442_4 = Mathf.Lerp(iter_442_1.color.r, 0.5, var_442_3)

							iter_442_1.color = Color.New(var_442_4, var_442_4, var_442_4)
						end
					end
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.actorSpriteComps10030 then
				local var_442_5 = 0.5

				for iter_442_2, iter_442_3 in pairs(arg_439_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_442_3 then
						iter_442_3.color = Color.New(var_442_5, var_442_5, var_442_5)
					end
				end

				arg_439_1.var_.actorSpriteComps10030 = nil
			end

			local var_442_6 = arg_439_1.actors_["1038"]
			local var_442_7 = 0

			if var_442_7 < arg_439_1.time_ and arg_439_1.time_ <= var_442_7 + arg_442_0 and arg_439_1.var_.actorSpriteComps1038 == nil then
				arg_439_1.var_.actorSpriteComps1038 = var_442_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_442_8 = 0.2

			if var_442_7 <= arg_439_1.time_ and arg_439_1.time_ < var_442_7 + var_442_8 then
				local var_442_9 = (arg_439_1.time_ - var_442_7) / var_442_8

				if arg_439_1.var_.actorSpriteComps1038 then
					for iter_442_4, iter_442_5 in pairs(arg_439_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_442_5 then
							local var_442_10 = Mathf.Lerp(iter_442_5.color.r, 1, var_442_9)

							iter_442_5.color = Color.New(var_442_10, var_442_10, var_442_10)
						end
					end
				end
			end

			if arg_439_1.time_ >= var_442_7 + var_442_8 and arg_439_1.time_ < var_442_7 + var_442_8 + arg_442_0 and arg_439_1.var_.actorSpriteComps1038 then
				local var_442_11 = 1

				for iter_442_6, iter_442_7 in pairs(arg_439_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_442_7 then
						iter_442_7.color = Color.New(var_442_11, var_442_11, var_442_11)
					end
				end

				arg_439_1.var_.actorSpriteComps1038 = nil
			end

			local var_442_12 = 0
			local var_442_13 = 0.95

			if var_442_12 < arg_439_1.time_ and arg_439_1.time_ <= var_442_12 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_14 = arg_439_1:FormatText(StoryNameCfg[94].name)

				arg_439_1.leftNameTxt_.text = var_442_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_15 = arg_439_1:GetWordFromCfg(115271109)
				local var_442_16 = arg_439_1:FormatText(var_442_15.content)

				arg_439_1.text_.text = var_442_16

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_17 = 38
				local var_442_18 = utf8.len(var_442_16)
				local var_442_19 = var_442_17 <= 0 and var_442_13 or var_442_13 * (var_442_18 / var_442_17)

				if var_442_19 > 0 and var_442_13 < var_442_19 then
					arg_439_1.talkMaxDuration = var_442_19

					if var_442_19 + var_442_12 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_19 + var_442_12
					end
				end

				arg_439_1.text_.text = var_442_16
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271109", "story_v_out_115271.awb") ~= 0 then
					local var_442_20 = manager.audio:GetVoiceLength("story_v_out_115271", "115271109", "story_v_out_115271.awb") / 1000

					if var_442_20 + var_442_12 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_20 + var_442_12
					end

					if var_442_15.prefab_name ~= "" and arg_439_1.actors_[var_442_15.prefab_name] ~= nil then
						local var_442_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_15.prefab_name].transform, "story_v_out_115271", "115271109", "story_v_out_115271.awb")

						arg_439_1:RecordAudio("115271109", var_442_21)
						arg_439_1:RecordAudio("115271109", var_442_21)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_115271", "115271109", "story_v_out_115271.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_115271", "115271109", "story_v_out_115271.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_22 = math.max(var_442_13, arg_439_1.talkMaxDuration)

			if var_442_12 <= arg_439_1.time_ and arg_439_1.time_ < var_442_12 + var_442_22 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_12) / var_442_22

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_12 + var_442_22 and arg_439_1.time_ < var_442_12 + var_442_22 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play115271110 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 115271110
		arg_443_1.duration_ = 8.333

		local var_443_0 = {
			ja = 7.433,
			ko = 7.2,
			zh = 8.333,
			en = 7.233
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play115271111(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.7

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_2 = arg_443_1:FormatText(StoryNameCfg[94].name)

				arg_443_1.leftNameTxt_.text = var_446_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_3 = arg_443_1:GetWordFromCfg(115271110)
				local var_446_4 = arg_443_1:FormatText(var_446_3.content)

				arg_443_1.text_.text = var_446_4

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_5 = 28
				local var_446_6 = utf8.len(var_446_4)
				local var_446_7 = var_446_5 <= 0 and var_446_1 or var_446_1 * (var_446_6 / var_446_5)

				if var_446_7 > 0 and var_446_1 < var_446_7 then
					arg_443_1.talkMaxDuration = var_446_7

					if var_446_7 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_7 + var_446_0
					end
				end

				arg_443_1.text_.text = var_446_4
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271110", "story_v_out_115271.awb") ~= 0 then
					local var_446_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271110", "story_v_out_115271.awb") / 1000

					if var_446_8 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_8 + var_446_0
					end

					if var_446_3.prefab_name ~= "" and arg_443_1.actors_[var_446_3.prefab_name] ~= nil then
						local var_446_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_3.prefab_name].transform, "story_v_out_115271", "115271110", "story_v_out_115271.awb")

						arg_443_1:RecordAudio("115271110", var_446_9)
						arg_443_1:RecordAudio("115271110", var_446_9)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_115271", "115271110", "story_v_out_115271.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_115271", "115271110", "story_v_out_115271.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_10 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_10 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_10

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_10 and arg_443_1.time_ < var_446_0 + var_446_10 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play115271111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 115271111
		arg_447_1.duration_ = 17.666

		local var_447_0 = {
			ja = 13.833,
			ko = 16.933,
			zh = 16.666,
			en = 17.666
		}
		local var_447_1 = manager.audio:GetLocalizationFlag()

		if var_447_0[var_447_1] ~= nil then
			arg_447_1.duration_ = var_447_0[var_447_1]
		end

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play115271112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 1.65

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[94].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(115271111)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 66
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271111", "story_v_out_115271.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271111", "story_v_out_115271.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_out_115271", "115271111", "story_v_out_115271.awb")

						arg_447_1:RecordAudio("115271111", var_450_9)
						arg_447_1:RecordAudio("115271111", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_115271", "115271111", "story_v_out_115271.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_115271", "115271111", "story_v_out_115271.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_10 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_10 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_10

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_10 and arg_447_1.time_ < var_450_0 + var_450_10 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play115271112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 115271112
		arg_451_1.duration_ = 21.733

		local var_451_0 = {
			ja = 18.066,
			ko = 21.733,
			zh = 17.066,
			en = 17.9
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
				arg_451_0:Play115271113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1.575

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_2 = arg_451_1:FormatText(StoryNameCfg[94].name)

				arg_451_1.leftNameTxt_.text = var_454_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_3 = arg_451_1:GetWordFromCfg(115271112)
				local var_454_4 = arg_451_1:FormatText(var_454_3.content)

				arg_451_1.text_.text = var_454_4

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_5 = 63
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271112", "story_v_out_115271.awb") ~= 0 then
					local var_454_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271112", "story_v_out_115271.awb") / 1000

					if var_454_8 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_8 + var_454_0
					end

					if var_454_3.prefab_name ~= "" and arg_451_1.actors_[var_454_3.prefab_name] ~= nil then
						local var_454_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_3.prefab_name].transform, "story_v_out_115271", "115271112", "story_v_out_115271.awb")

						arg_451_1:RecordAudio("115271112", var_454_9)
						arg_451_1:RecordAudio("115271112", var_454_9)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_115271", "115271112", "story_v_out_115271.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_115271", "115271112", "story_v_out_115271.awb")
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
	Play115271113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 115271113
		arg_455_1.duration_ = 14.6

		local var_455_0 = {
			ja = 14.6,
			ko = 11.066,
			zh = 10.7,
			en = 9.066
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
				arg_455_0:Play115271114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 1

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[94].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(115271113)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271113", "story_v_out_115271.awb") ~= 0 then
					local var_458_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271113", "story_v_out_115271.awb") / 1000

					if var_458_8 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_0
					end

					if var_458_3.prefab_name ~= "" and arg_455_1.actors_[var_458_3.prefab_name] ~= nil then
						local var_458_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_3.prefab_name].transform, "story_v_out_115271", "115271113", "story_v_out_115271.awb")

						arg_455_1:RecordAudio("115271113", var_458_9)
						arg_455_1:RecordAudio("115271113", var_458_9)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_115271", "115271113", "story_v_out_115271.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_115271", "115271113", "story_v_out_115271.awb")
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
	Play115271114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 115271114
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play115271115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1038"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.actorSpriteComps1038 == nil then
				arg_459_1.var_.actorSpriteComps1038 = var_462_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_462_2 = 0.2

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.actorSpriteComps1038 then
					for iter_462_0, iter_462_1 in pairs(arg_459_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_462_1 then
							local var_462_4 = Mathf.Lerp(iter_462_1.color.r, 0.5, var_462_3)

							iter_462_1.color = Color.New(var_462_4, var_462_4, var_462_4)
						end
					end
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.actorSpriteComps1038 then
				local var_462_5 = 0.5

				for iter_462_2, iter_462_3 in pairs(arg_459_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_462_3 then
						iter_462_3.color = Color.New(var_462_5, var_462_5, var_462_5)
					end
				end

				arg_459_1.var_.actorSpriteComps1038 = nil
			end

			local var_462_6 = 0
			local var_462_7 = 0.725

			if var_462_6 < arg_459_1.time_ and arg_459_1.time_ <= var_462_6 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, false)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_8 = arg_459_1:GetWordFromCfg(115271114)
				local var_462_9 = arg_459_1:FormatText(var_462_8.content)

				arg_459_1.text_.text = var_462_9

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_10 = 29
				local var_462_11 = utf8.len(var_462_9)
				local var_462_12 = var_462_10 <= 0 and var_462_7 or var_462_7 * (var_462_11 / var_462_10)

				if var_462_12 > 0 and var_462_7 < var_462_12 then
					arg_459_1.talkMaxDuration = var_462_12

					if var_462_12 + var_462_6 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_12 + var_462_6
					end
				end

				arg_459_1.text_.text = var_462_9
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_13 = math.max(var_462_7, arg_459_1.talkMaxDuration)

			if var_462_6 <= arg_459_1.time_ and arg_459_1.time_ < var_462_6 + var_462_13 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_6) / var_462_13

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_6 + var_462_13 and arg_459_1.time_ < var_462_6 + var_462_13 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play115271115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 115271115
		arg_463_1.duration_ = 17.2

		local var_463_0 = {
			ja = 17.2,
			ko = 15.666,
			zh = 15.4,
			en = 15
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
				arg_463_0:Play115271116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1038"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 and arg_463_1.var_.actorSpriteComps1038 == nil then
				arg_463_1.var_.actorSpriteComps1038 = var_466_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_466_2 = 0.2

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2

				if arg_463_1.var_.actorSpriteComps1038 then
					for iter_466_0, iter_466_1 in pairs(arg_463_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_466_1 then
							local var_466_4 = Mathf.Lerp(iter_466_1.color.r, 1, var_466_3)

							iter_466_1.color = Color.New(var_466_4, var_466_4, var_466_4)
						end
					end
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 and arg_463_1.var_.actorSpriteComps1038 then
				local var_466_5 = 1

				for iter_466_2, iter_466_3 in pairs(arg_463_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_466_3 then
						iter_466_3.color = Color.New(var_466_5, var_466_5, var_466_5)
					end
				end

				arg_463_1.var_.actorSpriteComps1038 = nil
			end

			local var_466_6 = 0
			local var_466_7 = 1.575

			if var_466_6 < arg_463_1.time_ and arg_463_1.time_ <= var_466_6 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_8 = arg_463_1:FormatText(StoryNameCfg[94].name)

				arg_463_1.leftNameTxt_.text = var_466_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_9 = arg_463_1:GetWordFromCfg(115271115)
				local var_466_10 = arg_463_1:FormatText(var_466_9.content)

				arg_463_1.text_.text = var_466_10

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_11 = 63
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271115", "story_v_out_115271.awb") ~= 0 then
					local var_466_14 = manager.audio:GetVoiceLength("story_v_out_115271", "115271115", "story_v_out_115271.awb") / 1000

					if var_466_14 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_14 + var_466_6
					end

					if var_466_9.prefab_name ~= "" and arg_463_1.actors_[var_466_9.prefab_name] ~= nil then
						local var_466_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_9.prefab_name].transform, "story_v_out_115271", "115271115", "story_v_out_115271.awb")

						arg_463_1:RecordAudio("115271115", var_466_15)
						arg_463_1:RecordAudio("115271115", var_466_15)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_115271", "115271115", "story_v_out_115271.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_115271", "115271115", "story_v_out_115271.awb")
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
	Play115271116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 115271116
		arg_467_1.duration_ = 11.933

		local var_467_0 = {
			ja = 11.933,
			ko = 10.1,
			zh = 10.7,
			en = 10.5
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play115271117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 1.05

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_2 = arg_467_1:FormatText(StoryNameCfg[94].name)

				arg_467_1.leftNameTxt_.text = var_470_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_3 = arg_467_1:GetWordFromCfg(115271116)
				local var_470_4 = arg_467_1:FormatText(var_470_3.content)

				arg_467_1.text_.text = var_470_4

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271116", "story_v_out_115271.awb") ~= 0 then
					local var_470_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271116", "story_v_out_115271.awb") / 1000

					if var_470_8 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_0
					end

					if var_470_3.prefab_name ~= "" and arg_467_1.actors_[var_470_3.prefab_name] ~= nil then
						local var_470_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_3.prefab_name].transform, "story_v_out_115271", "115271116", "story_v_out_115271.awb")

						arg_467_1:RecordAudio("115271116", var_470_9)
						arg_467_1:RecordAudio("115271116", var_470_9)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_115271", "115271116", "story_v_out_115271.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_115271", "115271116", "story_v_out_115271.awb")
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
	Play115271117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 115271117
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play115271118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1038"]
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				local var_474_2 = var_474_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_474_2 then
					arg_471_1.var_.alphaOldValue1038 = var_474_2.alpha
					arg_471_1.var_.characterEffect1038 = var_474_2
				end

				arg_471_1.var_.alphaOldValue1038 = 1
			end

			local var_474_3 = 0.5

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_3 then
				local var_474_4 = (arg_471_1.time_ - var_474_1) / var_474_3
				local var_474_5 = Mathf.Lerp(arg_471_1.var_.alphaOldValue1038, 0, var_474_4)

				if arg_471_1.var_.characterEffect1038 then
					arg_471_1.var_.characterEffect1038.alpha = var_474_5
				end
			end

			if arg_471_1.time_ >= var_474_1 + var_474_3 and arg_471_1.time_ < var_474_1 + var_474_3 + arg_474_0 and arg_471_1.var_.characterEffect1038 then
				arg_471_1.var_.characterEffect1038.alpha = 0
			end

			local var_474_6 = arg_471_1.actors_["10030"]
			local var_474_7 = 0

			if var_474_7 < arg_471_1.time_ and arg_471_1.time_ <= var_474_7 + arg_474_0 then
				local var_474_8 = var_474_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_474_8 then
					arg_471_1.var_.alphaOldValue10030 = var_474_8.alpha
					arg_471_1.var_.characterEffect10030 = var_474_8
				end

				arg_471_1.var_.alphaOldValue10030 = 1
			end

			local var_474_9 = 0.5

			if var_474_7 <= arg_471_1.time_ and arg_471_1.time_ < var_474_7 + var_474_9 then
				local var_474_10 = (arg_471_1.time_ - var_474_7) / var_474_9
				local var_474_11 = Mathf.Lerp(arg_471_1.var_.alphaOldValue10030, 0, var_474_10)

				if arg_471_1.var_.characterEffect10030 then
					arg_471_1.var_.characterEffect10030.alpha = var_474_11
				end
			end

			if arg_471_1.time_ >= var_474_7 + var_474_9 and arg_471_1.time_ < var_474_7 + var_474_9 + arg_474_0 and arg_471_1.var_.characterEffect10030 then
				arg_471_1.var_.characterEffect10030.alpha = 0
			end

			local var_474_12 = 0
			local var_474_13 = 0.95

			if var_474_12 < arg_471_1.time_ and arg_471_1.time_ <= var_474_12 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_14 = arg_471_1:GetWordFromCfg(115271117)
				local var_474_15 = arg_471_1:FormatText(var_474_14.content)

				arg_471_1.text_.text = var_474_15

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_16 = 38
				local var_474_17 = utf8.len(var_474_15)
				local var_474_18 = var_474_16 <= 0 and var_474_13 or var_474_13 * (var_474_17 / var_474_16)

				if var_474_18 > 0 and var_474_13 < var_474_18 then
					arg_471_1.talkMaxDuration = var_474_18

					if var_474_18 + var_474_12 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_18 + var_474_12
					end
				end

				arg_471_1.text_.text = var_474_15
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_19 = math.max(var_474_13, arg_471_1.talkMaxDuration)

			if var_474_12 <= arg_471_1.time_ and arg_471_1.time_ < var_474_12 + var_474_19 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_12) / var_474_19

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_12 + var_474_19 and arg_471_1.time_ < var_474_12 + var_474_19 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play115271118 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 115271118
		arg_475_1.duration_ = 7.5

		local var_475_0 = {
			ja = 7.5,
			ko = 7.366,
			zh = 5.666,
			en = 5.766
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play115271119(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.8

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[144].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, true)
				arg_475_1.iconController_:SetSelectedState("hero")

				arg_475_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(115271118)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271118", "story_v_out_115271.awb") ~= 0 then
					local var_478_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271118", "story_v_out_115271.awb") / 1000

					if var_478_8 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_0
					end

					if var_478_3.prefab_name ~= "" and arg_475_1.actors_[var_478_3.prefab_name] ~= nil then
						local var_478_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_3.prefab_name].transform, "story_v_out_115271", "115271118", "story_v_out_115271.awb")

						arg_475_1:RecordAudio("115271118", var_478_9)
						arg_475_1:RecordAudio("115271118", var_478_9)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_115271", "115271118", "story_v_out_115271.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_115271", "115271118", "story_v_out_115271.awb")
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
	Play115271119 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 115271119
		arg_479_1.duration_ = 18.8

		local var_479_0 = {
			ja = 14.633,
			ko = 15.566,
			zh = 14.933,
			en = 18.8
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play115271120(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["10029"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos10029 = var_482_0.localPosition
				var_482_0.localScale = Vector3.New(1, 1, 1)

				arg_479_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_482_2 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2
				local var_482_4 = Vector3.New(0, -350, -180)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos10029, var_482_4, var_482_3)
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_482_5 = arg_479_1.actors_["10029"]
			local var_482_6 = 0

			if var_482_6 < arg_479_1.time_ and arg_479_1.time_ <= var_482_6 + arg_482_0 then
				local var_482_7 = var_482_5:GetComponent("Image")

				if var_482_7 then
					arg_479_1.var_.alphaMatValue10029 = var_482_7
					arg_479_1.var_.alphaOldValue10029 = var_482_7.color.a
				end

				arg_479_1.var_.alphaOldValue10029 = 0
			end

			local var_482_8 = 0.5

			if var_482_6 <= arg_479_1.time_ and arg_479_1.time_ < var_482_6 + var_482_8 then
				local var_482_9 = (arg_479_1.time_ - var_482_6) / var_482_8
				local var_482_10 = Mathf.Lerp(arg_479_1.var_.alphaOldValue10029, 1, var_482_9)

				if arg_479_1.var_.alphaMatValue10029 then
					local var_482_11 = arg_479_1.var_.alphaMatValue10029.color

					var_482_11.a = var_482_10
					arg_479_1.var_.alphaMatValue10029.color = var_482_11
				end
			end

			if arg_479_1.time_ >= var_482_6 + var_482_8 and arg_479_1.time_ < var_482_6 + var_482_8 + arg_482_0 and arg_479_1.var_.alphaMatValue10029 then
				local var_482_12 = arg_479_1.var_.alphaMatValue10029
				local var_482_13 = var_482_12.color

				var_482_13.a = 1
				var_482_12.color = var_482_13
			end

			local var_482_14 = arg_479_1.actors_["10029"]
			local var_482_15 = 0

			if var_482_15 < arg_479_1.time_ and arg_479_1.time_ <= var_482_15 + arg_482_0 then
				local var_482_16 = var_482_14:GetComponent("Image")

				if var_482_16 then
					arg_479_1.var_.highlightMatValue10029 = var_482_16
				end
			end

			local var_482_17 = 0.2

			if var_482_15 <= arg_479_1.time_ and arg_479_1.time_ < var_482_15 + var_482_17 then
				local var_482_18 = (arg_479_1.time_ - var_482_15) / var_482_17

				if arg_479_1.var_.highlightMatValue10029 then
					local var_482_19 = Mathf.Lerp(0.5, 1, var_482_18)
					local var_482_20 = arg_479_1.var_.highlightMatValue10029
					local var_482_21 = var_482_20.color

					var_482_21.r = var_482_19
					var_482_21.g = var_482_19
					var_482_21.b = var_482_19
					var_482_20.color = var_482_21
				end
			end

			if arg_479_1.time_ >= var_482_15 + var_482_17 and arg_479_1.time_ < var_482_15 + var_482_17 + arg_482_0 and arg_479_1.var_.highlightMatValue10029 then
				local var_482_22 = 1

				var_482_14.transform:SetSiblingIndex(1)

				local var_482_23 = arg_479_1.var_.highlightMatValue10029
				local var_482_24 = var_482_23.color

				var_482_24.r = var_482_22
				var_482_24.g = var_482_22
				var_482_24.b = var_482_22
				var_482_23.color = var_482_24
			end

			local var_482_25 = 0
			local var_482_26 = 1.6

			if var_482_25 < arg_479_1.time_ and arg_479_1.time_ <= var_482_25 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_27 = arg_479_1:FormatText(StoryNameCfg[312].name)

				arg_479_1.leftNameTxt_.text = var_482_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_28 = arg_479_1:GetWordFromCfg(115271119)
				local var_482_29 = arg_479_1:FormatText(var_482_28.content)

				arg_479_1.text_.text = var_482_29

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_30 = 64
				local var_482_31 = utf8.len(var_482_29)
				local var_482_32 = var_482_30 <= 0 and var_482_26 or var_482_26 * (var_482_31 / var_482_30)

				if var_482_32 > 0 and var_482_26 < var_482_32 then
					arg_479_1.talkMaxDuration = var_482_32

					if var_482_32 + var_482_25 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_32 + var_482_25
					end
				end

				arg_479_1.text_.text = var_482_29
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271119", "story_v_out_115271.awb") ~= 0 then
					local var_482_33 = manager.audio:GetVoiceLength("story_v_out_115271", "115271119", "story_v_out_115271.awb") / 1000

					if var_482_33 + var_482_25 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_33 + var_482_25
					end

					if var_482_28.prefab_name ~= "" and arg_479_1.actors_[var_482_28.prefab_name] ~= nil then
						local var_482_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_28.prefab_name].transform, "story_v_out_115271", "115271119", "story_v_out_115271.awb")

						arg_479_1:RecordAudio("115271119", var_482_34)
						arg_479_1:RecordAudio("115271119", var_482_34)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_115271", "115271119", "story_v_out_115271.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_115271", "115271119", "story_v_out_115271.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_35 = math.max(var_482_26, arg_479_1.talkMaxDuration)

			if var_482_25 <= arg_479_1.time_ and arg_479_1.time_ < var_482_25 + var_482_35 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_25) / var_482_35

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_25 + var_482_35 and arg_479_1.time_ < var_482_25 + var_482_35 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play115271120 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 115271120
		arg_483_1.duration_ = 22.866

		local var_483_0 = {
			ja = 13.4,
			ko = 18,
			zh = 14.1,
			en = 22.866
		}
		local var_483_1 = manager.audio:GetLocalizationFlag()

		if var_483_0[var_483_1] ~= nil then
			arg_483_1.duration_ = var_483_0[var_483_1]
		end

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play115271121(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0
			local var_486_1 = 1.65

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_2 = arg_483_1:FormatText(StoryNameCfg[312].name)

				arg_483_1.leftNameTxt_.text = var_486_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_3 = arg_483_1:GetWordFromCfg(115271120)
				local var_486_4 = arg_483_1:FormatText(var_486_3.content)

				arg_483_1.text_.text = var_486_4

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_5 = 66
				local var_486_6 = utf8.len(var_486_4)
				local var_486_7 = var_486_5 <= 0 and var_486_1 or var_486_1 * (var_486_6 / var_486_5)

				if var_486_7 > 0 and var_486_1 < var_486_7 then
					arg_483_1.talkMaxDuration = var_486_7

					if var_486_7 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_7 + var_486_0
					end
				end

				arg_483_1.text_.text = var_486_4
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271120", "story_v_out_115271.awb") ~= 0 then
					local var_486_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271120", "story_v_out_115271.awb") / 1000

					if var_486_8 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_8 + var_486_0
					end

					if var_486_3.prefab_name ~= "" and arg_483_1.actors_[var_486_3.prefab_name] ~= nil then
						local var_486_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_3.prefab_name].transform, "story_v_out_115271", "115271120", "story_v_out_115271.awb")

						arg_483_1:RecordAudio("115271120", var_486_9)
						arg_483_1:RecordAudio("115271120", var_486_9)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_115271", "115271120", "story_v_out_115271.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_115271", "115271120", "story_v_out_115271.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_10 = math.max(var_486_1, arg_483_1.talkMaxDuration)

			if var_486_0 <= arg_483_1.time_ and arg_483_1.time_ < var_486_0 + var_486_10 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_0) / var_486_10

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_0 + var_486_10 and arg_483_1.time_ < var_486_0 + var_486_10 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play115271121 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 115271121
		arg_487_1.duration_ = 18.966

		local var_487_0 = {
			ja = 15.466,
			ko = 14.9,
			zh = 13.166,
			en = 18.966
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play115271122(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 1.475

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_2 = arg_487_1:FormatText(StoryNameCfg[312].name)

				arg_487_1.leftNameTxt_.text = var_490_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_3 = arg_487_1:GetWordFromCfg(115271121)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 59
				local var_490_6 = utf8.len(var_490_4)
				local var_490_7 = var_490_5 <= 0 and var_490_1 or var_490_1 * (var_490_6 / var_490_5)

				if var_490_7 > 0 and var_490_1 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_4
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271121", "story_v_out_115271.awb") ~= 0 then
					local var_490_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271121", "story_v_out_115271.awb") / 1000

					if var_490_8 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_8 + var_490_0
					end

					if var_490_3.prefab_name ~= "" and arg_487_1.actors_[var_490_3.prefab_name] ~= nil then
						local var_490_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_3.prefab_name].transform, "story_v_out_115271", "115271121", "story_v_out_115271.awb")

						arg_487_1:RecordAudio("115271121", var_490_9)
						arg_487_1:RecordAudio("115271121", var_490_9)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_115271", "115271121", "story_v_out_115271.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_115271", "115271121", "story_v_out_115271.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_10 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_10 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_10

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_10 and arg_487_1.time_ < var_490_0 + var_490_10 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play115271122 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 115271122
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play115271123(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["10029"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				local var_494_2 = var_494_0:GetComponent("Image")

				if var_494_2 then
					arg_491_1.var_.alphaMatValue10029 = var_494_2
					arg_491_1.var_.alphaOldValue10029 = var_494_2.color.a
				end

				arg_491_1.var_.alphaOldValue10029 = 1
			end

			local var_494_3 = 0.5

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_3 then
				local var_494_4 = (arg_491_1.time_ - var_494_1) / var_494_3
				local var_494_5 = Mathf.Lerp(arg_491_1.var_.alphaOldValue10029, 0, var_494_4)

				if arg_491_1.var_.alphaMatValue10029 then
					local var_494_6 = arg_491_1.var_.alphaMatValue10029.color

					var_494_6.a = var_494_5
					arg_491_1.var_.alphaMatValue10029.color = var_494_6
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_3 and arg_491_1.time_ < var_494_1 + var_494_3 + arg_494_0 and arg_491_1.var_.alphaMatValue10029 then
				local var_494_7 = arg_491_1.var_.alphaMatValue10029
				local var_494_8 = var_494_7.color

				var_494_8.a = 0
				var_494_7.color = var_494_8
			end

			local var_494_9 = 0
			local var_494_10 = 0.525

			if var_494_9 < arg_491_1.time_ and arg_491_1.time_ <= var_494_9 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, false)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_11 = arg_491_1:GetWordFromCfg(115271122)
				local var_494_12 = arg_491_1:FormatText(var_494_11.content)

				arg_491_1.text_.text = var_494_12

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_13 = 21
				local var_494_14 = utf8.len(var_494_12)
				local var_494_15 = var_494_13 <= 0 and var_494_10 or var_494_10 * (var_494_14 / var_494_13)

				if var_494_15 > 0 and var_494_10 < var_494_15 then
					arg_491_1.talkMaxDuration = var_494_15

					if var_494_15 + var_494_9 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_15 + var_494_9
					end
				end

				arg_491_1.text_.text = var_494_12
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_16 = math.max(var_494_10, arg_491_1.talkMaxDuration)

			if var_494_9 <= arg_491_1.time_ and arg_491_1.time_ < var_494_9 + var_494_16 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_9) / var_494_16

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_9 + var_494_16 and arg_491_1.time_ < var_494_9 + var_494_16 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play115271123 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 115271123
		arg_495_1.duration_ = 3.2

		local var_495_0 = {
			ja = 3.2,
			ko = 1.366,
			zh = 2.433,
			en = 1.266
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play115271124(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1038"].transform
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 then
				arg_495_1.var_.moveOldPos1038 = var_498_0.localPosition
				var_498_0.localScale = Vector3.New(1, 1, 1)

				arg_495_1:CheckSpriteTmpPos("1038", 2)

				local var_498_2 = var_498_0.childCount

				for iter_498_0 = 0, var_498_2 - 1 do
					local var_498_3 = var_498_0:GetChild(iter_498_0)

					if var_498_3.name == "split_9" or not string.find(var_498_3.name, "split") then
						var_498_3.gameObject:SetActive(true)
					else
						var_498_3.gameObject:SetActive(false)
					end
				end
			end

			local var_498_4 = 0.001

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_4 then
				local var_498_5 = (arg_495_1.time_ - var_498_1) / var_498_4
				local var_498_6 = Vector3.New(-390, -400, 0)

				var_498_0.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos1038, var_498_6, var_498_5)
			end

			if arg_495_1.time_ >= var_498_1 + var_498_4 and arg_495_1.time_ < var_498_1 + var_498_4 + arg_498_0 then
				var_498_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_498_7 = arg_495_1.actors_["1038"]
			local var_498_8 = 0

			if var_498_8 < arg_495_1.time_ and arg_495_1.time_ <= var_498_8 + arg_498_0 then
				local var_498_9 = var_498_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_498_9 then
					arg_495_1.var_.alphaOldValue1038 = var_498_9.alpha
					arg_495_1.var_.characterEffect1038 = var_498_9
				end

				arg_495_1.var_.alphaOldValue1038 = 0
			end

			local var_498_10 = 0.5

			if var_498_8 <= arg_495_1.time_ and arg_495_1.time_ < var_498_8 + var_498_10 then
				local var_498_11 = (arg_495_1.time_ - var_498_8) / var_498_10
				local var_498_12 = Mathf.Lerp(arg_495_1.var_.alphaOldValue1038, 1, var_498_11)

				if arg_495_1.var_.characterEffect1038 then
					arg_495_1.var_.characterEffect1038.alpha = var_498_12
				end
			end

			if arg_495_1.time_ >= var_498_8 + var_498_10 and arg_495_1.time_ < var_498_8 + var_498_10 + arg_498_0 and arg_495_1.var_.characterEffect1038 then
				arg_495_1.var_.characterEffect1038.alpha = 1
			end

			local var_498_13 = arg_495_1.actors_["1038"]
			local var_498_14 = 0

			if var_498_14 < arg_495_1.time_ and arg_495_1.time_ <= var_498_14 + arg_498_0 and arg_495_1.var_.actorSpriteComps1038 == nil then
				arg_495_1.var_.actorSpriteComps1038 = var_498_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_498_15 = 0.2

			if var_498_14 <= arg_495_1.time_ and arg_495_1.time_ < var_498_14 + var_498_15 then
				local var_498_16 = (arg_495_1.time_ - var_498_14) / var_498_15

				if arg_495_1.var_.actorSpriteComps1038 then
					for iter_498_1, iter_498_2 in pairs(arg_495_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_498_2 then
							local var_498_17 = Mathf.Lerp(iter_498_2.color.r, 1, var_498_16)

							iter_498_2.color = Color.New(var_498_17, var_498_17, var_498_17)
						end
					end
				end
			end

			if arg_495_1.time_ >= var_498_14 + var_498_15 and arg_495_1.time_ < var_498_14 + var_498_15 + arg_498_0 and arg_495_1.var_.actorSpriteComps1038 then
				local var_498_18 = 1

				for iter_498_3, iter_498_4 in pairs(arg_495_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_498_4 then
						iter_498_4.color = Color.New(var_498_18, var_498_18, var_498_18)
					end
				end

				arg_495_1.var_.actorSpriteComps1038 = nil
			end

			local var_498_19 = 0
			local var_498_20 = 0.125

			if var_498_19 < arg_495_1.time_ and arg_495_1.time_ <= var_498_19 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_21 = arg_495_1:FormatText(StoryNameCfg[94].name)

				arg_495_1.leftNameTxt_.text = var_498_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_22 = arg_495_1:GetWordFromCfg(115271123)
				local var_498_23 = arg_495_1:FormatText(var_498_22.content)

				arg_495_1.text_.text = var_498_23

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_24 = 5
				local var_498_25 = utf8.len(var_498_23)
				local var_498_26 = var_498_24 <= 0 and var_498_20 or var_498_20 * (var_498_25 / var_498_24)

				if var_498_26 > 0 and var_498_20 < var_498_26 then
					arg_495_1.talkMaxDuration = var_498_26

					if var_498_26 + var_498_19 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_26 + var_498_19
					end
				end

				arg_495_1.text_.text = var_498_23
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271123", "story_v_out_115271.awb") ~= 0 then
					local var_498_27 = manager.audio:GetVoiceLength("story_v_out_115271", "115271123", "story_v_out_115271.awb") / 1000

					if var_498_27 + var_498_19 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_27 + var_498_19
					end

					if var_498_22.prefab_name ~= "" and arg_495_1.actors_[var_498_22.prefab_name] ~= nil then
						local var_498_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_22.prefab_name].transform, "story_v_out_115271", "115271123", "story_v_out_115271.awb")

						arg_495_1:RecordAudio("115271123", var_498_28)
						arg_495_1:RecordAudio("115271123", var_498_28)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_115271", "115271123", "story_v_out_115271.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_115271", "115271123", "story_v_out_115271.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_29 = math.max(var_498_20, arg_495_1.talkMaxDuration)

			if var_498_19 <= arg_495_1.time_ and arg_495_1.time_ < var_498_19 + var_498_29 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_19) / var_498_29

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_19 + var_498_29 and arg_495_1.time_ < var_498_19 + var_498_29 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play115271124 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 115271124
		arg_499_1.duration_ = 6.2

		local var_499_0 = {
			ja = 5.433,
			ko = 5.233,
			zh = 4.5,
			en = 6.2
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play115271125(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["10030"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				local var_502_2 = var_502_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_502_2 then
					arg_499_1.var_.alphaOldValue10030 = var_502_2.alpha
					arg_499_1.var_.characterEffect10030 = var_502_2
				end

				arg_499_1.var_.alphaOldValue10030 = 0
			end

			local var_502_3 = 0.5

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_3 then
				local var_502_4 = (arg_499_1.time_ - var_502_1) / var_502_3
				local var_502_5 = Mathf.Lerp(arg_499_1.var_.alphaOldValue10030, 1, var_502_4)

				if arg_499_1.var_.characterEffect10030 then
					arg_499_1.var_.characterEffect10030.alpha = var_502_5
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_3 and arg_499_1.time_ < var_502_1 + var_502_3 + arg_502_0 and arg_499_1.var_.characterEffect10030 then
				arg_499_1.var_.characterEffect10030.alpha = 1
			end

			local var_502_6 = arg_499_1.actors_["10030"]
			local var_502_7 = 0

			if var_502_7 < arg_499_1.time_ and arg_499_1.time_ <= var_502_7 + arg_502_0 and arg_499_1.var_.actorSpriteComps10030 == nil then
				arg_499_1.var_.actorSpriteComps10030 = var_502_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_502_8 = 0.2

			if var_502_7 <= arg_499_1.time_ and arg_499_1.time_ < var_502_7 + var_502_8 then
				local var_502_9 = (arg_499_1.time_ - var_502_7) / var_502_8

				if arg_499_1.var_.actorSpriteComps10030 then
					for iter_502_0, iter_502_1 in pairs(arg_499_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_502_1 then
							local var_502_10 = Mathf.Lerp(iter_502_1.color.r, 1, var_502_9)

							iter_502_1.color = Color.New(var_502_10, var_502_10, var_502_10)
						end
					end
				end
			end

			if arg_499_1.time_ >= var_502_7 + var_502_8 and arg_499_1.time_ < var_502_7 + var_502_8 + arg_502_0 and arg_499_1.var_.actorSpriteComps10030 then
				local var_502_11 = 1

				for iter_502_2, iter_502_3 in pairs(arg_499_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_502_3 then
						iter_502_3.color = Color.New(var_502_11, var_502_11, var_502_11)
					end
				end

				arg_499_1.var_.actorSpriteComps10030 = nil
			end

			local var_502_12 = arg_499_1.actors_["10030"].transform
			local var_502_13 = 0

			if var_502_13 < arg_499_1.time_ and arg_499_1.time_ <= var_502_13 + arg_502_0 then
				arg_499_1.var_.moveOldPos10030 = var_502_12.localPosition
				var_502_12.localScale = Vector3.New(1, 1, 1)

				arg_499_1:CheckSpriteTmpPos("10030", 4)

				local var_502_14 = var_502_12.childCount

				for iter_502_4 = 0, var_502_14 - 1 do
					local var_502_15 = var_502_12:GetChild(iter_502_4)

					if var_502_15.name == "split_3" or not string.find(var_502_15.name, "split") then
						var_502_15.gameObject:SetActive(true)
					else
						var_502_15.gameObject:SetActive(false)
					end
				end
			end

			local var_502_16 = 0.001

			if var_502_13 <= arg_499_1.time_ and arg_499_1.time_ < var_502_13 + var_502_16 then
				local var_502_17 = (arg_499_1.time_ - var_502_13) / var_502_16
				local var_502_18 = Vector3.New(390, -390, 150)

				var_502_12.localPosition = Vector3.Lerp(arg_499_1.var_.moveOldPos10030, var_502_18, var_502_17)
			end

			if arg_499_1.time_ >= var_502_13 + var_502_16 and arg_499_1.time_ < var_502_13 + var_502_16 + arg_502_0 then
				var_502_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_502_19 = arg_499_1.actors_["1038"]
			local var_502_20 = 0

			if var_502_20 < arg_499_1.time_ and arg_499_1.time_ <= var_502_20 + arg_502_0 and arg_499_1.var_.actorSpriteComps1038 == nil then
				arg_499_1.var_.actorSpriteComps1038 = var_502_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_502_21 = 0.2

			if var_502_20 <= arg_499_1.time_ and arg_499_1.time_ < var_502_20 + var_502_21 then
				local var_502_22 = (arg_499_1.time_ - var_502_20) / var_502_21

				if arg_499_1.var_.actorSpriteComps1038 then
					for iter_502_5, iter_502_6 in pairs(arg_499_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_502_6 then
							local var_502_23 = Mathf.Lerp(iter_502_6.color.r, 0.5, var_502_22)

							iter_502_6.color = Color.New(var_502_23, var_502_23, var_502_23)
						end
					end
				end
			end

			if arg_499_1.time_ >= var_502_20 + var_502_21 and arg_499_1.time_ < var_502_20 + var_502_21 + arg_502_0 and arg_499_1.var_.actorSpriteComps1038 then
				local var_502_24 = 0.5

				for iter_502_7, iter_502_8 in pairs(arg_499_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_502_8 then
						iter_502_8.color = Color.New(var_502_24, var_502_24, var_502_24)
					end
				end

				arg_499_1.var_.actorSpriteComps1038 = nil
			end

			local var_502_25 = 0
			local var_502_26 = 0.5

			if var_502_25 < arg_499_1.time_ and arg_499_1.time_ <= var_502_25 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_27 = arg_499_1:FormatText(StoryNameCfg[309].name)

				arg_499_1.leftNameTxt_.text = var_502_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_28 = arg_499_1:GetWordFromCfg(115271124)
				local var_502_29 = arg_499_1:FormatText(var_502_28.content)

				arg_499_1.text_.text = var_502_29

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_30 = 19
				local var_502_31 = utf8.len(var_502_29)
				local var_502_32 = var_502_30 <= 0 and var_502_26 or var_502_26 * (var_502_31 / var_502_30)

				if var_502_32 > 0 and var_502_26 < var_502_32 then
					arg_499_1.talkMaxDuration = var_502_32

					if var_502_32 + var_502_25 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_32 + var_502_25
					end
				end

				arg_499_1.text_.text = var_502_29
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271124", "story_v_out_115271.awb") ~= 0 then
					local var_502_33 = manager.audio:GetVoiceLength("story_v_out_115271", "115271124", "story_v_out_115271.awb") / 1000

					if var_502_33 + var_502_25 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_33 + var_502_25
					end

					if var_502_28.prefab_name ~= "" and arg_499_1.actors_[var_502_28.prefab_name] ~= nil then
						local var_502_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_28.prefab_name].transform, "story_v_out_115271", "115271124", "story_v_out_115271.awb")

						arg_499_1:RecordAudio("115271124", var_502_34)
						arg_499_1:RecordAudio("115271124", var_502_34)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_115271", "115271124", "story_v_out_115271.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_115271", "115271124", "story_v_out_115271.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_35 = math.max(var_502_26, arg_499_1.talkMaxDuration)

			if var_502_25 <= arg_499_1.time_ and arg_499_1.time_ < var_502_25 + var_502_35 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_25) / var_502_35

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_25 + var_502_35 and arg_499_1.time_ < var_502_25 + var_502_35 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play115271125 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 115271125
		arg_503_1.duration_ = 6.3

		local var_503_0 = {
			ja = 6.3,
			ko = 2.3,
			zh = 3.166,
			en = 2.933
		}
		local var_503_1 = manager.audio:GetLocalizationFlag()

		if var_503_0[var_503_1] ~= nil then
			arg_503_1.duration_ = var_503_0[var_503_1]
		end

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play115271126(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["10030"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.actorSpriteComps10030 == nil then
				arg_503_1.var_.actorSpriteComps10030 = var_506_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_506_2 = 0.2

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.actorSpriteComps10030 then
					for iter_506_0, iter_506_1 in pairs(arg_503_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_506_1 then
							local var_506_4 = Mathf.Lerp(iter_506_1.color.r, 1, var_506_3)

							iter_506_1.color = Color.New(var_506_4, var_506_4, var_506_4)
						end
					end
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.actorSpriteComps10030 then
				local var_506_5 = 1

				for iter_506_2, iter_506_3 in pairs(arg_503_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_506_3 then
						iter_506_3.color = Color.New(var_506_5, var_506_5, var_506_5)
					end
				end

				arg_503_1.var_.actorSpriteComps10030 = nil
			end

			local var_506_6 = arg_503_1.actors_["10030"].transform
			local var_506_7 = 0

			if var_506_7 < arg_503_1.time_ and arg_503_1.time_ <= var_506_7 + arg_506_0 then
				arg_503_1.var_.moveOldPos10030 = var_506_6.localPosition
				var_506_6.localScale = Vector3.New(1, 1, 1)

				arg_503_1:CheckSpriteTmpPos("10030", 3)

				local var_506_8 = var_506_6.childCount

				for iter_506_4 = 0, var_506_8 - 1 do
					local var_506_9 = var_506_6:GetChild(iter_506_4)

					if var_506_9.name == "split_2" or not string.find(var_506_9.name, "split") then
						var_506_9.gameObject:SetActive(true)
					else
						var_506_9.gameObject:SetActive(false)
					end
				end
			end

			local var_506_10 = 0.001

			if var_506_7 <= arg_503_1.time_ and arg_503_1.time_ < var_506_7 + var_506_10 then
				local var_506_11 = (arg_503_1.time_ - var_506_7) / var_506_10
				local var_506_12 = Vector3.New(0, -390, 150)

				var_506_6.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos10030, var_506_12, var_506_11)
			end

			if arg_503_1.time_ >= var_506_7 + var_506_10 and arg_503_1.time_ < var_506_7 + var_506_10 + arg_506_0 then
				var_506_6.localPosition = Vector3.New(0, -390, 150)
			end

			local var_506_13 = arg_503_1.actors_["1038"].transform
			local var_506_14 = 0

			if var_506_14 < arg_503_1.time_ and arg_503_1.time_ <= var_506_14 + arg_506_0 then
				arg_503_1.var_.moveOldPos1038 = var_506_13.localPosition
				var_506_13.localScale = Vector3.New(1, 1, 1)

				arg_503_1:CheckSpriteTmpPos("1038", 7)

				local var_506_15 = var_506_13.childCount

				for iter_506_5 = 0, var_506_15 - 1 do
					local var_506_16 = var_506_13:GetChild(iter_506_5)

					if var_506_16.name == "split_9" or not string.find(var_506_16.name, "split") then
						var_506_16.gameObject:SetActive(true)
					else
						var_506_16.gameObject:SetActive(false)
					end
				end
			end

			local var_506_17 = 0.001

			if var_506_14 <= arg_503_1.time_ and arg_503_1.time_ < var_506_14 + var_506_17 then
				local var_506_18 = (arg_503_1.time_ - var_506_14) / var_506_17
				local var_506_19 = Vector3.New(0, -2000, 150)

				var_506_13.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos1038, var_506_19, var_506_18)
			end

			if arg_503_1.time_ >= var_506_14 + var_506_17 and arg_503_1.time_ < var_506_14 + var_506_17 + arg_506_0 then
				var_506_13.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_506_20 = 0
			local var_506_21 = 0.25

			if var_506_20 < arg_503_1.time_ and arg_503_1.time_ <= var_506_20 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_22 = arg_503_1:FormatText(StoryNameCfg[309].name)

				arg_503_1.leftNameTxt_.text = var_506_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_23 = arg_503_1:GetWordFromCfg(115271125)
				local var_506_24 = arg_503_1:FormatText(var_506_23.content)

				arg_503_1.text_.text = var_506_24

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_25 = 10
				local var_506_26 = utf8.len(var_506_24)
				local var_506_27 = var_506_25 <= 0 and var_506_21 or var_506_21 * (var_506_26 / var_506_25)

				if var_506_27 > 0 and var_506_21 < var_506_27 then
					arg_503_1.talkMaxDuration = var_506_27

					if var_506_27 + var_506_20 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_27 + var_506_20
					end
				end

				arg_503_1.text_.text = var_506_24
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271125", "story_v_out_115271.awb") ~= 0 then
					local var_506_28 = manager.audio:GetVoiceLength("story_v_out_115271", "115271125", "story_v_out_115271.awb") / 1000

					if var_506_28 + var_506_20 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_28 + var_506_20
					end

					if var_506_23.prefab_name ~= "" and arg_503_1.actors_[var_506_23.prefab_name] ~= nil then
						local var_506_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_23.prefab_name].transform, "story_v_out_115271", "115271125", "story_v_out_115271.awb")

						arg_503_1:RecordAudio("115271125", var_506_29)
						arg_503_1:RecordAudio("115271125", var_506_29)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_115271", "115271125", "story_v_out_115271.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_115271", "115271125", "story_v_out_115271.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_30 = math.max(var_506_21, arg_503_1.talkMaxDuration)

			if var_506_20 <= arg_503_1.time_ and arg_503_1.time_ < var_506_20 + var_506_30 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_20) / var_506_30

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_20 + var_506_30 and arg_503_1.time_ < var_506_20 + var_506_30 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play115271126 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 115271126
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play115271127(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["10030"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.actorSpriteComps10030 == nil then
				arg_507_1.var_.actorSpriteComps10030 = var_510_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_510_2 = 0.2

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.actorSpriteComps10030 then
					for iter_510_0, iter_510_1 in pairs(arg_507_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_510_1 then
							local var_510_4 = Mathf.Lerp(iter_510_1.color.r, 0.5, var_510_3)

							iter_510_1.color = Color.New(var_510_4, var_510_4, var_510_4)
						end
					end
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.actorSpriteComps10030 then
				local var_510_5 = 0.5

				for iter_510_2, iter_510_3 in pairs(arg_507_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_510_3 then
						iter_510_3.color = Color.New(var_510_5, var_510_5, var_510_5)
					end
				end

				arg_507_1.var_.actorSpriteComps10030 = nil
			end

			local var_510_6 = 0
			local var_510_7 = 0.5

			if var_510_6 < arg_507_1.time_ and arg_507_1.time_ <= var_510_6 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_8 = arg_507_1:GetWordFromCfg(115271126)
				local var_510_9 = arg_507_1:FormatText(var_510_8.content)

				arg_507_1.text_.text = var_510_9

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_10 = 20
				local var_510_11 = utf8.len(var_510_9)
				local var_510_12 = var_510_10 <= 0 and var_510_7 or var_510_7 * (var_510_11 / var_510_10)

				if var_510_12 > 0 and var_510_7 < var_510_12 then
					arg_507_1.talkMaxDuration = var_510_12

					if var_510_12 + var_510_6 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_12 + var_510_6
					end
				end

				arg_507_1.text_.text = var_510_9
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_13 = math.max(var_510_7, arg_507_1.talkMaxDuration)

			if var_510_6 <= arg_507_1.time_ and arg_507_1.time_ < var_510_6 + var_510_13 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_6) / var_510_13

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_6 + var_510_13 and arg_507_1.time_ < var_510_6 + var_510_13 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play115271127 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 115271127
		arg_511_1.duration_ = 3.333

		local var_511_0 = {
			ja = 3.1,
			ko = 1.4,
			zh = 3.333,
			en = 1.4
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play115271128(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0
			local var_514_1 = 0.125

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_2 = arg_511_1:FormatText(StoryNameCfg[94].name)

				arg_511_1.leftNameTxt_.text = var_514_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, true)
				arg_511_1.iconController_:SetSelectedState("hero")

				arg_511_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_1")

				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_3 = arg_511_1:GetWordFromCfg(115271127)
				local var_514_4 = arg_511_1:FormatText(var_514_3.content)

				arg_511_1.text_.text = var_514_4

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_5 = 5
				local var_514_6 = utf8.len(var_514_4)
				local var_514_7 = var_514_5 <= 0 and var_514_1 or var_514_1 * (var_514_6 / var_514_5)

				if var_514_7 > 0 and var_514_1 < var_514_7 then
					arg_511_1.talkMaxDuration = var_514_7

					if var_514_7 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_7 + var_514_0
					end
				end

				arg_511_1.text_.text = var_514_4
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271127", "story_v_out_115271.awb") ~= 0 then
					local var_514_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271127", "story_v_out_115271.awb") / 1000

					if var_514_8 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_8 + var_514_0
					end

					if var_514_3.prefab_name ~= "" and arg_511_1.actors_[var_514_3.prefab_name] ~= nil then
						local var_514_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_3.prefab_name].transform, "story_v_out_115271", "115271127", "story_v_out_115271.awb")

						arg_511_1:RecordAudio("115271127", var_514_9)
						arg_511_1:RecordAudio("115271127", var_514_9)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_115271", "115271127", "story_v_out_115271.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_115271", "115271127", "story_v_out_115271.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_10 = math.max(var_514_1, arg_511_1.talkMaxDuration)

			if var_514_0 <= arg_511_1.time_ and arg_511_1.time_ < var_514_0 + var_514_10 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_0) / var_514_10

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_0 + var_514_10 and arg_511_1.time_ < var_514_0 + var_514_10 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play115271128 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 115271128
		arg_515_1.duration_ = 3.766

		local var_515_0 = {
			ja = 2.933,
			ko = 3.766,
			zh = 2.1,
			en = 1.6
		}
		local var_515_1 = manager.audio:GetLocalizationFlag()

		if var_515_0[var_515_1] ~= nil then
			arg_515_1.duration_ = var_515_0[var_515_1]
		end

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play115271129(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["10030"]
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 == nil then
				arg_515_1.var_.actorSpriteComps10030 = var_518_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_2 = 0.2

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2

				if arg_515_1.var_.actorSpriteComps10030 then
					for iter_518_0, iter_518_1 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_518_1 then
							local var_518_4 = Mathf.Lerp(iter_518_1.color.r, 1, var_518_3)

							iter_518_1.color = Color.New(var_518_4, var_518_4, var_518_4)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 then
				local var_518_5 = 1

				for iter_518_2, iter_518_3 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_518_3 then
						iter_518_3.color = Color.New(var_518_5, var_518_5, var_518_5)
					end
				end

				arg_515_1.var_.actorSpriteComps10030 = nil
			end

			local var_518_6 = 0
			local var_518_7 = 0.225

			if var_518_6 < arg_515_1.time_ and arg_515_1.time_ <= var_518_6 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_8 = arg_515_1:FormatText(StoryNameCfg[309].name)

				arg_515_1.leftNameTxt_.text = var_518_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_9 = arg_515_1:GetWordFromCfg(115271128)
				local var_518_10 = arg_515_1:FormatText(var_518_9.content)

				arg_515_1.text_.text = var_518_10

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_11 = 9
				local var_518_12 = utf8.len(var_518_10)
				local var_518_13 = var_518_11 <= 0 and var_518_7 or var_518_7 * (var_518_12 / var_518_11)

				if var_518_13 > 0 and var_518_7 < var_518_13 then
					arg_515_1.talkMaxDuration = var_518_13

					if var_518_13 + var_518_6 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_13 + var_518_6
					end
				end

				arg_515_1.text_.text = var_518_10
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271128", "story_v_out_115271.awb") ~= 0 then
					local var_518_14 = manager.audio:GetVoiceLength("story_v_out_115271", "115271128", "story_v_out_115271.awb") / 1000

					if var_518_14 + var_518_6 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_14 + var_518_6
					end

					if var_518_9.prefab_name ~= "" and arg_515_1.actors_[var_518_9.prefab_name] ~= nil then
						local var_518_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_9.prefab_name].transform, "story_v_out_115271", "115271128", "story_v_out_115271.awb")

						arg_515_1:RecordAudio("115271128", var_518_15)
						arg_515_1:RecordAudio("115271128", var_518_15)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_115271", "115271128", "story_v_out_115271.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_115271", "115271128", "story_v_out_115271.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_16 = math.max(var_518_7, arg_515_1.talkMaxDuration)

			if var_518_6 <= arg_515_1.time_ and arg_515_1.time_ < var_518_6 + var_518_16 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_6) / var_518_16

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_6 + var_518_16 and arg_515_1.time_ < var_518_6 + var_518_16 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play115271129 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 115271129
		arg_519_1.duration_ = 12.9

		local var_519_0 = {
			ja = 12.9,
			ko = 6.2,
			zh = 5.666,
			en = 9.066
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play115271130(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 0.7

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_2 = arg_519_1:FormatText(StoryNameCfg[309].name)

				arg_519_1.leftNameTxt_.text = var_522_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_3 = arg_519_1:GetWordFromCfg(115271129)
				local var_522_4 = arg_519_1:FormatText(var_522_3.content)

				arg_519_1.text_.text = var_522_4

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_5 = 28
				local var_522_6 = utf8.len(var_522_4)
				local var_522_7 = var_522_5 <= 0 and var_522_1 or var_522_1 * (var_522_6 / var_522_5)

				if var_522_7 > 0 and var_522_1 < var_522_7 then
					arg_519_1.talkMaxDuration = var_522_7

					if var_522_7 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_7 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_4
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271129", "story_v_out_115271.awb") ~= 0 then
					local var_522_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271129", "story_v_out_115271.awb") / 1000

					if var_522_8 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_0
					end

					if var_522_3.prefab_name ~= "" and arg_519_1.actors_[var_522_3.prefab_name] ~= nil then
						local var_522_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_3.prefab_name].transform, "story_v_out_115271", "115271129", "story_v_out_115271.awb")

						arg_519_1:RecordAudio("115271129", var_522_9)
						arg_519_1:RecordAudio("115271129", var_522_9)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_115271", "115271129", "story_v_out_115271.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_115271", "115271129", "story_v_out_115271.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_10 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_10 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_10

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_10 and arg_519_1.time_ < var_522_0 + var_522_10 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play115271130 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 115271130
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play115271131(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10030"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				local var_526_2 = var_526_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_526_2 then
					arg_523_1.var_.alphaOldValue10030 = var_526_2.alpha
					arg_523_1.var_.characterEffect10030 = var_526_2
				end

				arg_523_1.var_.alphaOldValue10030 = 1
			end

			local var_526_3 = 0.5

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_3 then
				local var_526_4 = (arg_523_1.time_ - var_526_1) / var_526_3
				local var_526_5 = Mathf.Lerp(arg_523_1.var_.alphaOldValue10030, 0, var_526_4)

				if arg_523_1.var_.characterEffect10030 then
					arg_523_1.var_.characterEffect10030.alpha = var_526_5
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_3 and arg_523_1.time_ < var_526_1 + var_526_3 + arg_526_0 and arg_523_1.var_.characterEffect10030 then
				arg_523_1.var_.characterEffect10030.alpha = 0
			end

			local var_526_6 = 0
			local var_526_7 = 0.875

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

				local var_526_8 = arg_523_1:GetWordFromCfg(115271130)
				local var_526_9 = arg_523_1:FormatText(var_526_8.content)

				arg_523_1.text_.text = var_526_9

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_10 = 35
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
	Play115271131 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 115271131
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play115271132(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 0.475

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

				local var_530_2 = arg_527_1:GetWordFromCfg(115271131)
				local var_530_3 = arg_527_1:FormatText(var_530_2.content)

				arg_527_1.text_.text = var_530_3

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_4 = 19
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
	Play115271132 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 115271132
		arg_531_1.duration_ = 9.033

		local var_531_0 = {
			ja = 9.033,
			ko = 6.1,
			zh = 6.966,
			en = 5.033
		}
		local var_531_1 = manager.audio:GetLocalizationFlag()

		if var_531_0[var_531_1] ~= nil then
			arg_531_1.duration_ = var_531_0[var_531_1]
		end

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
			arg_531_1.auto_ = false
		end

		function arg_531_1.playNext_(arg_533_0)
			arg_531_1.onStoryFinished_()
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0
			local var_534_1 = 0.625

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_2 = arg_531_1:FormatText(StoryNameCfg[94].name)

				arg_531_1.leftNameTxt_.text = var_534_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, true)
				arg_531_1.iconController_:SetSelectedState("hero")

				arg_531_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_2")

				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_3 = arg_531_1:GetWordFromCfg(115271132)
				local var_534_4 = arg_531_1:FormatText(var_534_3.content)

				arg_531_1.text_.text = var_534_4

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_115271", "115271132", "story_v_out_115271.awb") ~= 0 then
					local var_534_8 = manager.audio:GetVoiceLength("story_v_out_115271", "115271132", "story_v_out_115271.awb") / 1000

					if var_534_8 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_8 + var_534_0
					end

					if var_534_3.prefab_name ~= "" and arg_531_1.actors_[var_534_3.prefab_name] ~= nil then
						local var_534_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_3.prefab_name].transform, "story_v_out_115271", "115271132", "story_v_out_115271.awb")

						arg_531_1:RecordAudio("115271132", var_534_9)
						arg_531_1:RecordAudio("115271132", var_534_9)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_115271", "115271132", "story_v_out_115271.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_115271", "115271132", "story_v_out_115271.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST28a"
	},
	voices = {
		"story_v_out_115271.awb"
	}
}
