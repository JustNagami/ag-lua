return {
	Play222061001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 222061001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play222061002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST53"

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
				local var_4_5 = arg_1_1.bgs_.ST53

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
					if iter_4_0 ~= "ST53" then
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
			local var_4_23 = 0.4

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.566666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_0_warchess", "bgm_activity_2_0_warchess", "bgm_activity_2_0_warchess.awb")
			end

			local var_4_30 = 2
			local var_4_31 = 1.5

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0
				arg_1_1.dialogCg_.alpha = 1

				arg_1_1.dialog_:SetActive(true)
				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_32 = arg_1_1:GetWordFromCfg(222061001)
				local var_4_33 = arg_1_1:FormatText(var_4_32.content)

				arg_1_1.text_.text = var_4_33

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_34 = 60
				local var_4_35 = utf8.len(var_4_33)
				local var_4_36 = var_4_34 <= 0 and var_4_31 or var_4_31 * (var_4_35 / var_4_34)

				if var_4_36 > 0 and var_4_31 < var_4_36 then
					arg_1_1.talkMaxDuration = var_4_36

					if var_4_36 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_36 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_33
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_37 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_30 <= arg_1_1.time_ and arg_1_1.time_ < var_4_30 + var_4_37 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_30) / var_4_37

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_30 + var_4_37 and arg_1_1.time_ < var_4_30 + var_4_37 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play222061002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 222061002
		arg_5_1.duration_ = 5

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play222061003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0
			local var_8_1 = 0.875

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

				local var_8_2 = arg_5_1:GetWordFromCfg(222061002)
				local var_8_3 = arg_5_1:FormatText(var_8_2.content)

				arg_5_1.text_.text = var_8_3

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_4 = 35
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
	Play222061003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 222061003
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play222061004(arg_9_1)
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

				local var_12_2 = arg_9_1:GetWordFromCfg(222061003)
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
	Play222061004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 222061004
		arg_13_1.duration_ = 12.3

		local var_13_0 = {
			ja = 12.3,
			ko = 6.2,
			zh = 6.2
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
				arg_13_0:Play222061005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.825

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[473].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, true)
				arg_13_1.iconController_:SetSelectedState("hero")

				arg_13_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(222061004)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061004", "story_v_out_222061.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061004", "story_v_out_222061.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_222061", "222061004", "story_v_out_222061.awb")

						arg_13_1:RecordAudio("222061004", var_16_9)
						arg_13_1:RecordAudio("222061004", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_222061", "222061004", "story_v_out_222061.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_222061", "222061004", "story_v_out_222061.awb")
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
	Play222061005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 222061005
		arg_17_1.duration_ = 8.666

		local var_17_0 = {
			ja = 8.666,
			ko = 6.333,
			zh = 6.333
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
				arg_17_0:Play222061006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.8

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[473].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_3 = arg_17_1:GetWordFromCfg(222061005)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061005", "story_v_out_222061.awb") ~= 0 then
					local var_20_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061005", "story_v_out_222061.awb") / 1000

					if var_20_8 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_8 + var_20_0
					end

					if var_20_3.prefab_name ~= "" and arg_17_1.actors_[var_20_3.prefab_name] ~= nil then
						local var_20_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_3.prefab_name].transform, "story_v_out_222061", "222061005", "story_v_out_222061.awb")

						arg_17_1:RecordAudio("222061005", var_20_9)
						arg_17_1:RecordAudio("222061005", var_20_9)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_222061", "222061005", "story_v_out_222061.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_222061", "222061005", "story_v_out_222061.awb")
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
	Play222061006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 222061006
		arg_21_1.duration_ = 4.5

		local var_21_0 = {
			ja = 4.5,
			ko = 3.566,
			zh = 3.533
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
				arg_21_0:Play222061007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = "1074ui_story"

			if arg_21_1.actors_[var_24_0] == nil then
				local var_24_1 = Object.Instantiate(Asset.Load("Char/" .. var_24_0), arg_21_1.stage_.transform)

				var_24_1.name = var_24_0
				var_24_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_21_1.actors_[var_24_0] = var_24_1

				local var_24_2 = var_24_1:GetComponentInChildren(typeof(CharacterEffect))

				var_24_2.enabled = true

				local var_24_3 = GameObjectTools.GetOrAddComponent(var_24_1, typeof(DynamicBoneHelper))

				if var_24_3 then
					var_24_3:EnableDynamicBone(false)
				end

				arg_21_1:ShowWeapon(var_24_2.transform, false)

				arg_21_1.var_[var_24_0 .. "Animator"] = var_24_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_21_1.var_[var_24_0 .. "Animator"].applyRootMotion = true
				arg_21_1.var_[var_24_0 .. "LipSync"] = var_24_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_24_4 = arg_21_1.actors_["1074ui_story"].transform
			local var_24_5 = 0

			if var_24_5 < arg_21_1.time_ and arg_21_1.time_ <= var_24_5 + arg_24_0 then
				arg_21_1.var_.moveOldPos1074ui_story = var_24_4.localPosition
			end

			local var_24_6 = 0.001

			if var_24_5 <= arg_21_1.time_ and arg_21_1.time_ < var_24_5 + var_24_6 then
				local var_24_7 = (arg_21_1.time_ - var_24_5) / var_24_6
				local var_24_8 = Vector3.New(0, -1.055, -6.12)

				var_24_4.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1074ui_story, var_24_8, var_24_7)

				local var_24_9 = manager.ui.mainCamera.transform.position - var_24_4.position

				var_24_4.forward = Vector3.New(var_24_9.x, var_24_9.y, var_24_9.z)

				local var_24_10 = var_24_4.localEulerAngles

				var_24_10.z = 0
				var_24_10.x = 0
				var_24_4.localEulerAngles = var_24_10
			end

			if arg_21_1.time_ >= var_24_5 + var_24_6 and arg_21_1.time_ < var_24_5 + var_24_6 + arg_24_0 then
				var_24_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_24_11 = manager.ui.mainCamera.transform.position - var_24_4.position

				var_24_4.forward = Vector3.New(var_24_11.x, var_24_11.y, var_24_11.z)

				local var_24_12 = var_24_4.localEulerAngles

				var_24_12.z = 0
				var_24_12.x = 0
				var_24_4.localEulerAngles = var_24_12
			end

			local var_24_13 = arg_21_1.actors_["1074ui_story"]
			local var_24_14 = 0

			if var_24_14 < arg_21_1.time_ and arg_21_1.time_ <= var_24_14 + arg_24_0 and arg_21_1.var_.characterEffect1074ui_story == nil then
				arg_21_1.var_.characterEffect1074ui_story = var_24_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_15 = 0.200000002980232

			if var_24_14 <= arg_21_1.time_ and arg_21_1.time_ < var_24_14 + var_24_15 then
				local var_24_16 = (arg_21_1.time_ - var_24_14) / var_24_15

				if arg_21_1.var_.characterEffect1074ui_story then
					arg_21_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_14 + var_24_15 and arg_21_1.time_ < var_24_14 + var_24_15 + arg_24_0 and arg_21_1.var_.characterEffect1074ui_story then
				arg_21_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_24_17 = 0

			if var_24_17 < arg_21_1.time_ and arg_21_1.time_ <= var_24_17 + arg_24_0 then
				arg_21_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_24_18 = 0
			local var_24_19 = 0.3

			if var_24_18 < arg_21_1.time_ and arg_21_1.time_ <= var_24_18 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_20 = arg_21_1:FormatText(StoryNameCfg[410].name)

				arg_21_1.leftNameTxt_.text = var_24_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_21 = arg_21_1:GetWordFromCfg(222061006)
				local var_24_22 = arg_21_1:FormatText(var_24_21.content)

				arg_21_1.text_.text = var_24_22

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_23 = 12
				local var_24_24 = utf8.len(var_24_22)
				local var_24_25 = var_24_23 <= 0 and var_24_19 or var_24_19 * (var_24_24 / var_24_23)

				if var_24_25 > 0 and var_24_19 < var_24_25 then
					arg_21_1.talkMaxDuration = var_24_25

					if var_24_25 + var_24_18 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_25 + var_24_18
					end
				end

				arg_21_1.text_.text = var_24_22
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061006", "story_v_out_222061.awb") ~= 0 then
					local var_24_26 = manager.audio:GetVoiceLength("story_v_out_222061", "222061006", "story_v_out_222061.awb") / 1000

					if var_24_26 + var_24_18 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_26 + var_24_18
					end

					if var_24_21.prefab_name ~= "" and arg_21_1.actors_[var_24_21.prefab_name] ~= nil then
						local var_24_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_21.prefab_name].transform, "story_v_out_222061", "222061006", "story_v_out_222061.awb")

						arg_21_1:RecordAudio("222061006", var_24_27)
						arg_21_1:RecordAudio("222061006", var_24_27)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_222061", "222061006", "story_v_out_222061.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_222061", "222061006", "story_v_out_222061.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_28 = math.max(var_24_19, arg_21_1.talkMaxDuration)

			if var_24_18 <= arg_21_1.time_ and arg_21_1.time_ < var_24_18 + var_24_28 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_18) / var_24_28

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_18 + var_24_28 and arg_21_1.time_ < var_24_18 + var_24_28 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play222061007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 222061007
		arg_25_1.duration_ = 7.433

		local var_25_0 = {
			ja = 7.433,
			ko = 2.633,
			zh = 2.633
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
				arg_25_0:Play222061008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1074ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.characterEffect1074ui_story == nil then
				arg_25_1.var_.characterEffect1074ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.200000002980232

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1074ui_story then
					local var_28_4 = Mathf.Lerp(0, 0.5, var_28_3)

					arg_25_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_25_1.var_.characterEffect1074ui_story.fillRatio = var_28_4
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.characterEffect1074ui_story then
				local var_28_5 = 0.5

				arg_25_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_25_1.var_.characterEffect1074ui_story.fillRatio = var_28_5
			end

			local var_28_6 = 0
			local var_28_7 = 0.325

			if var_28_6 < arg_25_1.time_ and arg_25_1.time_ <= var_28_6 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_8 = arg_25_1:FormatText(StoryNameCfg[473].name)

				arg_25_1.leftNameTxt_.text = var_28_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_9 = arg_25_1:GetWordFromCfg(222061007)
				local var_28_10 = arg_25_1:FormatText(var_28_9.content)

				arg_25_1.text_.text = var_28_10

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_11 = 13
				local var_28_12 = utf8.len(var_28_10)
				local var_28_13 = var_28_11 <= 0 and var_28_7 or var_28_7 * (var_28_12 / var_28_11)

				if var_28_13 > 0 and var_28_7 < var_28_13 then
					arg_25_1.talkMaxDuration = var_28_13

					if var_28_13 + var_28_6 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_13 + var_28_6
					end
				end

				arg_25_1.text_.text = var_28_10
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061007", "story_v_out_222061.awb") ~= 0 then
					local var_28_14 = manager.audio:GetVoiceLength("story_v_out_222061", "222061007", "story_v_out_222061.awb") / 1000

					if var_28_14 + var_28_6 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_14 + var_28_6
					end

					if var_28_9.prefab_name ~= "" and arg_25_1.actors_[var_28_9.prefab_name] ~= nil then
						local var_28_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_9.prefab_name].transform, "story_v_out_222061", "222061007", "story_v_out_222061.awb")

						arg_25_1:RecordAudio("222061007", var_28_15)
						arg_25_1:RecordAudio("222061007", var_28_15)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_222061", "222061007", "story_v_out_222061.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_222061", "222061007", "story_v_out_222061.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_16 = math.max(var_28_7, arg_25_1.talkMaxDuration)

			if var_28_6 <= arg_25_1.time_ and arg_25_1.time_ < var_28_6 + var_28_16 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_6) / var_28_16

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_6 + var_28_16 and arg_25_1.time_ < var_28_6 + var_28_16 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play222061008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 222061008
		arg_29_1.duration_ = 10.633

		local var_29_0 = {
			ja = 10.633,
			ko = 5.366,
			zh = 5.333
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
				arg_29_0:Play222061009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1074ui_story"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.characterEffect1074ui_story == nil then
				arg_29_1.var_.characterEffect1074ui_story = var_32_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_2 = 0.200000002980232

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.characterEffect1074ui_story then
					arg_29_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.characterEffect1074ui_story then
				arg_29_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_32_4 = 0
			local var_32_5 = 0.6

			if var_32_4 < arg_29_1.time_ and arg_29_1.time_ <= var_32_4 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_6 = arg_29_1:FormatText(StoryNameCfg[410].name)

				arg_29_1.leftNameTxt_.text = var_32_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_7 = arg_29_1:GetWordFromCfg(222061008)
				local var_32_8 = arg_29_1:FormatText(var_32_7.content)

				arg_29_1.text_.text = var_32_8

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_9 = 24
				local var_32_10 = utf8.len(var_32_8)
				local var_32_11 = var_32_9 <= 0 and var_32_5 or var_32_5 * (var_32_10 / var_32_9)

				if var_32_11 > 0 and var_32_5 < var_32_11 then
					arg_29_1.talkMaxDuration = var_32_11

					if var_32_11 + var_32_4 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_11 + var_32_4
					end
				end

				arg_29_1.text_.text = var_32_8
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061008", "story_v_out_222061.awb") ~= 0 then
					local var_32_12 = manager.audio:GetVoiceLength("story_v_out_222061", "222061008", "story_v_out_222061.awb") / 1000

					if var_32_12 + var_32_4 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_12 + var_32_4
					end

					if var_32_7.prefab_name ~= "" and arg_29_1.actors_[var_32_7.prefab_name] ~= nil then
						local var_32_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_7.prefab_name].transform, "story_v_out_222061", "222061008", "story_v_out_222061.awb")

						arg_29_1:RecordAudio("222061008", var_32_13)
						arg_29_1:RecordAudio("222061008", var_32_13)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_222061", "222061008", "story_v_out_222061.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_222061", "222061008", "story_v_out_222061.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_14 = math.max(var_32_5, arg_29_1.talkMaxDuration)

			if var_32_4 <= arg_29_1.time_ and arg_29_1.time_ < var_32_4 + var_32_14 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_4) / var_32_14

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_4 + var_32_14 and arg_29_1.time_ < var_32_4 + var_32_14 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play222061009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 222061009
		arg_33_1.duration_ = 7.5

		local var_33_0 = {
			ja = 7.5,
			ko = 5.4,
			zh = 5.4
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
				arg_33_0:Play222061010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1074ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1074ui_story == nil then
				arg_33_1.var_.characterEffect1074ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1074ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1074ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1074ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1074ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.6

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[473].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(222061009)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 24
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061009", "story_v_out_222061.awb") ~= 0 then
					local var_36_14 = manager.audio:GetVoiceLength("story_v_out_222061", "222061009", "story_v_out_222061.awb") / 1000

					if var_36_14 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_14 + var_36_6
					end

					if var_36_9.prefab_name ~= "" and arg_33_1.actors_[var_36_9.prefab_name] ~= nil then
						local var_36_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_9.prefab_name].transform, "story_v_out_222061", "222061009", "story_v_out_222061.awb")

						arg_33_1:RecordAudio("222061009", var_36_15)
						arg_33_1:RecordAudio("222061009", var_36_15)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_222061", "222061009", "story_v_out_222061.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_222061", "222061009", "story_v_out_222061.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_16 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_16 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_16

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_16 and arg_33_1.time_ < var_36_6 + var_36_16 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play222061010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 222061010
		arg_37_1.duration_ = 11.4

		local var_37_0 = {
			ja = 11.4,
			ko = 6.366,
			zh = 6.366
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
				arg_37_0:Play222061011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1074ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1074ui_story == nil then
				arg_37_1.var_.characterEffect1074ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.200000002980232

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1074ui_story then
					arg_37_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1074ui_story then
				arg_37_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_40_4 = 0
			local var_40_5 = 0.7

			if var_40_4 < arg_37_1.time_ and arg_37_1.time_ <= var_40_4 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_6 = arg_37_1:FormatText(StoryNameCfg[410].name)

				arg_37_1.leftNameTxt_.text = var_40_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_7 = arg_37_1:GetWordFromCfg(222061010)
				local var_40_8 = arg_37_1:FormatText(var_40_7.content)

				arg_37_1.text_.text = var_40_8

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_9 = 28
				local var_40_10 = utf8.len(var_40_8)
				local var_40_11 = var_40_9 <= 0 and var_40_5 or var_40_5 * (var_40_10 / var_40_9)

				if var_40_11 > 0 and var_40_5 < var_40_11 then
					arg_37_1.talkMaxDuration = var_40_11

					if var_40_11 + var_40_4 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_11 + var_40_4
					end
				end

				arg_37_1.text_.text = var_40_8
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061010", "story_v_out_222061.awb") ~= 0 then
					local var_40_12 = manager.audio:GetVoiceLength("story_v_out_222061", "222061010", "story_v_out_222061.awb") / 1000

					if var_40_12 + var_40_4 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_4
					end

					if var_40_7.prefab_name ~= "" and arg_37_1.actors_[var_40_7.prefab_name] ~= nil then
						local var_40_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_7.prefab_name].transform, "story_v_out_222061", "222061010", "story_v_out_222061.awb")

						arg_37_1:RecordAudio("222061010", var_40_13)
						arg_37_1:RecordAudio("222061010", var_40_13)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_222061", "222061010", "story_v_out_222061.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_222061", "222061010", "story_v_out_222061.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_14 = math.max(var_40_5, arg_37_1.talkMaxDuration)

			if var_40_4 <= arg_37_1.time_ and arg_37_1.time_ < var_40_4 + var_40_14 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_4) / var_40_14

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_4 + var_40_14 and arg_37_1.time_ < var_40_4 + var_40_14 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play222061011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 222061011
		arg_41_1.duration_ = 9.366

		local var_41_0 = {
			ja = 9.366,
			ko = 3.8,
			zh = 3.8
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
				arg_41_0:Play222061012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1074ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1074ui_story == nil then
				arg_41_1.var_.characterEffect1074ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1074ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1074ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1074ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1074ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 0.5

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[473].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(222061011)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 20
				local var_44_12 = utf8.len(var_44_10)
				local var_44_13 = var_44_11 <= 0 and var_44_7 or var_44_7 * (var_44_12 / var_44_11)

				if var_44_13 > 0 and var_44_7 < var_44_13 then
					arg_41_1.talkMaxDuration = var_44_13

					if var_44_13 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_10
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061011", "story_v_out_222061.awb") ~= 0 then
					local var_44_14 = manager.audio:GetVoiceLength("story_v_out_222061", "222061011", "story_v_out_222061.awb") / 1000

					if var_44_14 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_6
					end

					if var_44_9.prefab_name ~= "" and arg_41_1.actors_[var_44_9.prefab_name] ~= nil then
						local var_44_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_9.prefab_name].transform, "story_v_out_222061", "222061011", "story_v_out_222061.awb")

						arg_41_1:RecordAudio("222061011", var_44_15)
						arg_41_1:RecordAudio("222061011", var_44_15)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_222061", "222061011", "story_v_out_222061.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_222061", "222061011", "story_v_out_222061.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_16 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_16 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_16

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_16 and arg_41_1.time_ < var_44_6 + var_44_16 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play222061012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 222061012
		arg_45_1.duration_ = 13.5

		local var_45_0 = {
			ja = 13.5,
			ko = 6.633,
			zh = 6.666
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
				arg_45_0:Play222061013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1074ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1074ui_story == nil then
				arg_45_1.var_.characterEffect1074ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1074ui_story then
					arg_45_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1074ui_story then
				arg_45_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_48_4 = 0

			if var_48_4 < arg_45_1.time_ and arg_45_1.time_ <= var_48_4 + arg_48_0 then
				arg_45_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_48_6 = 0
			local var_48_7 = 0.85

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_8 = arg_45_1:FormatText(StoryNameCfg[410].name)

				arg_45_1.leftNameTxt_.text = var_48_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_9 = arg_45_1:GetWordFromCfg(222061012)
				local var_48_10 = arg_45_1:FormatText(var_48_9.content)

				arg_45_1.text_.text = var_48_10

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_11 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061012", "story_v_out_222061.awb") ~= 0 then
					local var_48_14 = manager.audio:GetVoiceLength("story_v_out_222061", "222061012", "story_v_out_222061.awb") / 1000

					if var_48_14 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_14 + var_48_6
					end

					if var_48_9.prefab_name ~= "" and arg_45_1.actors_[var_48_9.prefab_name] ~= nil then
						local var_48_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_9.prefab_name].transform, "story_v_out_222061", "222061012", "story_v_out_222061.awb")

						arg_45_1:RecordAudio("222061012", var_48_15)
						arg_45_1:RecordAudio("222061012", var_48_15)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_222061", "222061012", "story_v_out_222061.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_222061", "222061012", "story_v_out_222061.awb")
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
	Play222061013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 222061013
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play222061014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1074ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1074ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, 100, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1074ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, 100, 0)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1074ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and arg_49_1.var_.characterEffect1074ui_story == nil then
				arg_49_1.var_.characterEffect1074ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1074ui_story then
					local var_52_13 = Mathf.Lerp(0, 0.5, var_52_12)

					arg_49_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1074ui_story.fillRatio = var_52_13
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and arg_49_1.var_.characterEffect1074ui_story then
				local var_52_14 = 0.5

				arg_49_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1074ui_story.fillRatio = var_52_14
			end

			local var_52_15 = 0
			local var_52_16 = 1.35

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_17 = arg_49_1:GetWordFromCfg(222061013)
				local var_52_18 = arg_49_1:FormatText(var_52_17.content)

				arg_49_1.text_.text = var_52_18

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_19 = 54
				local var_52_20 = utf8.len(var_52_18)
				local var_52_21 = var_52_19 <= 0 and var_52_16 or var_52_16 * (var_52_20 / var_52_19)

				if var_52_21 > 0 and var_52_16 < var_52_21 then
					arg_49_1.talkMaxDuration = var_52_21

					if var_52_21 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_21 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_18
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_22 and arg_49_1.time_ < var_52_15 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play222061014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 222061014
		arg_53_1.duration_ = 8.8

		local var_53_0 = {
			ja = 8.8,
			ko = 2.833,
			zh = 2.8
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
				arg_53_0:Play222061015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1074ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1074ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0, -1.055, -6.12)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1074ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["1074ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect1074ui_story == nil then
				arg_53_1.var_.characterEffect1074ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect1074ui_story then
					arg_53_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect1074ui_story then
				arg_53_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_56_13 = 0
			local var_56_14 = 0.375

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_15 = arg_53_1:FormatText(StoryNameCfg[410].name)

				arg_53_1.leftNameTxt_.text = var_56_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_16 = arg_53_1:GetWordFromCfg(222061014)
				local var_56_17 = arg_53_1:FormatText(var_56_16.content)

				arg_53_1.text_.text = var_56_17

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_18 = 15
				local var_56_19 = utf8.len(var_56_17)
				local var_56_20 = var_56_18 <= 0 and var_56_14 or var_56_14 * (var_56_19 / var_56_18)

				if var_56_20 > 0 and var_56_14 < var_56_20 then
					arg_53_1.talkMaxDuration = var_56_20

					if var_56_20 + var_56_13 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_20 + var_56_13
					end
				end

				arg_53_1.text_.text = var_56_17
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061014", "story_v_out_222061.awb") ~= 0 then
					local var_56_21 = manager.audio:GetVoiceLength("story_v_out_222061", "222061014", "story_v_out_222061.awb") / 1000

					if var_56_21 + var_56_13 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_21 + var_56_13
					end

					if var_56_16.prefab_name ~= "" and arg_53_1.actors_[var_56_16.prefab_name] ~= nil then
						local var_56_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_16.prefab_name].transform, "story_v_out_222061", "222061014", "story_v_out_222061.awb")

						arg_53_1:RecordAudio("222061014", var_56_22)
						arg_53_1:RecordAudio("222061014", var_56_22)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_222061", "222061014", "story_v_out_222061.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_222061", "222061014", "story_v_out_222061.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_23 = math.max(var_56_14, arg_53_1.talkMaxDuration)

			if var_56_13 <= arg_53_1.time_ and arg_53_1.time_ < var_56_13 + var_56_23 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_13) / var_56_23

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_13 + var_56_23 and arg_53_1.time_ < var_56_13 + var_56_23 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play222061015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 222061015
		arg_57_1.duration_ = 4.8

		local var_57_0 = {
			ja = 4.8,
			ko = 3.1,
			zh = 3.1
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
				arg_57_0:Play222061016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1074ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos1074ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1074ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["1074ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect1074ui_story == nil then
				arg_57_1.var_.characterEffect1074ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect1074ui_story then
					local var_60_13 = Mathf.Lerp(0, 0.5, var_60_12)

					arg_57_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1074ui_story.fillRatio = var_60_13
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect1074ui_story then
				local var_60_14 = 0.5

				arg_57_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1074ui_story.fillRatio = var_60_14
			end

			local var_60_15 = "1070ui_story"

			if arg_57_1.actors_[var_60_15] == nil then
				local var_60_16 = Object.Instantiate(Asset.Load("Char/" .. var_60_15), arg_57_1.stage_.transform)

				var_60_16.name = var_60_15
				var_60_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.actors_[var_60_15] = var_60_16

				local var_60_17 = var_60_16:GetComponentInChildren(typeof(CharacterEffect))

				var_60_17.enabled = true

				local var_60_18 = GameObjectTools.GetOrAddComponent(var_60_16, typeof(DynamicBoneHelper))

				if var_60_18 then
					var_60_18:EnableDynamicBone(false)
				end

				arg_57_1:ShowWeapon(var_60_17.transform, false)

				arg_57_1.var_[var_60_15 .. "Animator"] = var_60_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_57_1.var_[var_60_15 .. "Animator"].applyRootMotion = true
				arg_57_1.var_[var_60_15 .. "LipSync"] = var_60_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_60_19 = arg_57_1.actors_["1070ui_story"].transform
			local var_60_20 = 0

			if var_60_20 < arg_57_1.time_ and arg_57_1.time_ <= var_60_20 + arg_60_0 then
				arg_57_1.var_.moveOldPos1070ui_story = var_60_19.localPosition
			end

			local var_60_21 = 0.001

			if var_60_20 <= arg_57_1.time_ and arg_57_1.time_ < var_60_20 + var_60_21 then
				local var_60_22 = (arg_57_1.time_ - var_60_20) / var_60_21
				local var_60_23 = Vector3.New(0.7, -0.95, -6.05)

				var_60_19.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1070ui_story, var_60_23, var_60_22)

				local var_60_24 = manager.ui.mainCamera.transform.position - var_60_19.position

				var_60_19.forward = Vector3.New(var_60_24.x, var_60_24.y, var_60_24.z)

				local var_60_25 = var_60_19.localEulerAngles

				var_60_25.z = 0
				var_60_25.x = 0
				var_60_19.localEulerAngles = var_60_25
			end

			if arg_57_1.time_ >= var_60_20 + var_60_21 and arg_57_1.time_ < var_60_20 + var_60_21 + arg_60_0 then
				var_60_19.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_60_26 = manager.ui.mainCamera.transform.position - var_60_19.position

				var_60_19.forward = Vector3.New(var_60_26.x, var_60_26.y, var_60_26.z)

				local var_60_27 = var_60_19.localEulerAngles

				var_60_27.z = 0
				var_60_27.x = 0
				var_60_19.localEulerAngles = var_60_27
			end

			local var_60_28 = arg_57_1.actors_["1070ui_story"]
			local var_60_29 = 0

			if var_60_29 < arg_57_1.time_ and arg_57_1.time_ <= var_60_29 + arg_60_0 and arg_57_1.var_.characterEffect1070ui_story == nil then
				arg_57_1.var_.characterEffect1070ui_story = var_60_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_30 = 0.200000002980232

			if var_60_29 <= arg_57_1.time_ and arg_57_1.time_ < var_60_29 + var_60_30 then
				local var_60_31 = (arg_57_1.time_ - var_60_29) / var_60_30

				if arg_57_1.var_.characterEffect1070ui_story then
					arg_57_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_29 + var_60_30 and arg_57_1.time_ < var_60_29 + var_60_30 + arg_60_0 and arg_57_1.var_.characterEffect1070ui_story then
				arg_57_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_60_32 = 0

			if var_60_32 < arg_57_1.time_ and arg_57_1.time_ <= var_60_32 + arg_60_0 then
				arg_57_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action4_1")
			end

			local var_60_33 = 0

			if var_60_33 < arg_57_1.time_ and arg_57_1.time_ <= var_60_33 + arg_60_0 then
				arg_57_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_60_34 = 0
			local var_60_35 = 0.25

			if var_60_34 < arg_57_1.time_ and arg_57_1.time_ <= var_60_34 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_36 = arg_57_1:FormatText(StoryNameCfg[318].name)

				arg_57_1.leftNameTxt_.text = var_60_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_37 = arg_57_1:GetWordFromCfg(222061015)
				local var_60_38 = arg_57_1:FormatText(var_60_37.content)

				arg_57_1.text_.text = var_60_38

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_39 = 10
				local var_60_40 = utf8.len(var_60_38)
				local var_60_41 = var_60_39 <= 0 and var_60_35 or var_60_35 * (var_60_40 / var_60_39)

				if var_60_41 > 0 and var_60_35 < var_60_41 then
					arg_57_1.talkMaxDuration = var_60_41

					if var_60_41 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_41 + var_60_34
					end
				end

				arg_57_1.text_.text = var_60_38
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061015", "story_v_out_222061.awb") ~= 0 then
					local var_60_42 = manager.audio:GetVoiceLength("story_v_out_222061", "222061015", "story_v_out_222061.awb") / 1000

					if var_60_42 + var_60_34 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_42 + var_60_34
					end

					if var_60_37.prefab_name ~= "" and arg_57_1.actors_[var_60_37.prefab_name] ~= nil then
						local var_60_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_37.prefab_name].transform, "story_v_out_222061", "222061015", "story_v_out_222061.awb")

						arg_57_1:RecordAudio("222061015", var_60_43)
						arg_57_1:RecordAudio("222061015", var_60_43)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_222061", "222061015", "story_v_out_222061.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_222061", "222061015", "story_v_out_222061.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_44 = math.max(var_60_35, arg_57_1.talkMaxDuration)

			if var_60_34 <= arg_57_1.time_ and arg_57_1.time_ < var_60_34 + var_60_44 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_34) / var_60_44

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_34 + var_60_44 and arg_57_1.time_ < var_60_34 + var_60_44 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play222061016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 222061016
		arg_61_1.duration_ = 13.866

		local var_61_0 = {
			ja = 13.866,
			ko = 7.3,
			zh = 7.3
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
				arg_61_0:Play222061017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.9

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[318].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(222061016)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 36
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061016", "story_v_out_222061.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061016", "story_v_out_222061.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_222061", "222061016", "story_v_out_222061.awb")

						arg_61_1:RecordAudio("222061016", var_64_9)
						arg_61_1:RecordAudio("222061016", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_222061", "222061016", "story_v_out_222061.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_222061", "222061016", "story_v_out_222061.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play222061017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 222061017
		arg_65_1.duration_ = 12.166

		local var_65_0 = {
			ja = 12.166,
			ko = 4.366,
			zh = 4.4
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
				arg_65_0:Play222061018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1074ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1074ui_story == nil then
				arg_65_1.var_.characterEffect1074ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.200000002980232

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1074ui_story then
					arg_65_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1074ui_story then
				arg_65_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_68_4 = arg_65_1.actors_["1070ui_story"]
			local var_68_5 = 0

			if var_68_5 < arg_65_1.time_ and arg_65_1.time_ <= var_68_5 + arg_68_0 and arg_65_1.var_.characterEffect1070ui_story == nil then
				arg_65_1.var_.characterEffect1070ui_story = var_68_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_6 = 0.200000002980232

			if var_68_5 <= arg_65_1.time_ and arg_65_1.time_ < var_68_5 + var_68_6 then
				local var_68_7 = (arg_65_1.time_ - var_68_5) / var_68_6

				if arg_65_1.var_.characterEffect1070ui_story then
					local var_68_8 = Mathf.Lerp(0, 0.5, var_68_7)

					arg_65_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1070ui_story.fillRatio = var_68_8
				end
			end

			if arg_65_1.time_ >= var_68_5 + var_68_6 and arg_65_1.time_ < var_68_5 + var_68_6 + arg_68_0 and arg_65_1.var_.characterEffect1070ui_story then
				local var_68_9 = 0.5

				arg_65_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1070ui_story.fillRatio = var_68_9
			end

			local var_68_10 = 0
			local var_68_11 = 0.55

			if var_68_10 < arg_65_1.time_ and arg_65_1.time_ <= var_68_10 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_12 = arg_65_1:FormatText(StoryNameCfg[410].name)

				arg_65_1.leftNameTxt_.text = var_68_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_13 = arg_65_1:GetWordFromCfg(222061017)
				local var_68_14 = arg_65_1:FormatText(var_68_13.content)

				arg_65_1.text_.text = var_68_14

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_15 = 22
				local var_68_16 = utf8.len(var_68_14)
				local var_68_17 = var_68_15 <= 0 and var_68_11 or var_68_11 * (var_68_16 / var_68_15)

				if var_68_17 > 0 and var_68_11 < var_68_17 then
					arg_65_1.talkMaxDuration = var_68_17

					if var_68_17 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_17 + var_68_10
					end
				end

				arg_65_1.text_.text = var_68_14
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061017", "story_v_out_222061.awb") ~= 0 then
					local var_68_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061017", "story_v_out_222061.awb") / 1000

					if var_68_18 + var_68_10 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_18 + var_68_10
					end

					if var_68_13.prefab_name ~= "" and arg_65_1.actors_[var_68_13.prefab_name] ~= nil then
						local var_68_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_13.prefab_name].transform, "story_v_out_222061", "222061017", "story_v_out_222061.awb")

						arg_65_1:RecordAudio("222061017", var_68_19)
						arg_65_1:RecordAudio("222061017", var_68_19)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_222061", "222061017", "story_v_out_222061.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_222061", "222061017", "story_v_out_222061.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_20 = math.max(var_68_11, arg_65_1.talkMaxDuration)

			if var_68_10 <= arg_65_1.time_ and arg_65_1.time_ < var_68_10 + var_68_20 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_10) / var_68_20

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_10 + var_68_20 and arg_65_1.time_ < var_68_10 + var_68_20 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play222061018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 222061018
		arg_69_1.duration_ = 3.933

		local var_69_0 = {
			ja = 3.933,
			ko = 3,
			zh = 3
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
				arg_69_0:Play222061019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1070ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1070ui_story == nil then
				arg_69_1.var_.characterEffect1070ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1070ui_story then
					arg_69_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1070ui_story then
				arg_69_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_72_4 = 0

			if var_72_4 < arg_69_1.time_ and arg_69_1.time_ <= var_72_4 + arg_72_0 then
				arg_69_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action4_2")
			end

			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_72_6 = arg_69_1.actors_["1074ui_story"]
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 and arg_69_1.var_.characterEffect1074ui_story == nil then
				arg_69_1.var_.characterEffect1074ui_story = var_72_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_8 = 0.200000002980232

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8

				if arg_69_1.var_.characterEffect1074ui_story then
					local var_72_10 = Mathf.Lerp(0, 0.5, var_72_9)

					arg_69_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1074ui_story.fillRatio = var_72_10
				end
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 and arg_69_1.var_.characterEffect1074ui_story then
				local var_72_11 = 0.5

				arg_69_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1074ui_story.fillRatio = var_72_11
			end

			local var_72_12 = 0
			local var_72_13 = 0.325

			if var_72_12 < arg_69_1.time_ and arg_69_1.time_ <= var_72_12 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_14 = arg_69_1:FormatText(StoryNameCfg[318].name)

				arg_69_1.leftNameTxt_.text = var_72_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_15 = arg_69_1:GetWordFromCfg(222061018)
				local var_72_16 = arg_69_1:FormatText(var_72_15.content)

				arg_69_1.text_.text = var_72_16

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_17 = 13
				local var_72_18 = utf8.len(var_72_16)
				local var_72_19 = var_72_17 <= 0 and var_72_13 or var_72_13 * (var_72_18 / var_72_17)

				if var_72_19 > 0 and var_72_13 < var_72_19 then
					arg_69_1.talkMaxDuration = var_72_19

					if var_72_19 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_12
					end
				end

				arg_69_1.text_.text = var_72_16
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061018", "story_v_out_222061.awb") ~= 0 then
					local var_72_20 = manager.audio:GetVoiceLength("story_v_out_222061", "222061018", "story_v_out_222061.awb") / 1000

					if var_72_20 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_12
					end

					if var_72_15.prefab_name ~= "" and arg_69_1.actors_[var_72_15.prefab_name] ~= nil then
						local var_72_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_15.prefab_name].transform, "story_v_out_222061", "222061018", "story_v_out_222061.awb")

						arg_69_1:RecordAudio("222061018", var_72_21)
						arg_69_1:RecordAudio("222061018", var_72_21)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_222061", "222061018", "story_v_out_222061.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_222061", "222061018", "story_v_out_222061.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_13, arg_69_1.talkMaxDuration)

			if var_72_12 <= arg_69_1.time_ and arg_69_1.time_ < var_72_12 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_12) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_12 + var_72_22 and arg_69_1.time_ < var_72_12 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play222061019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 222061019
		arg_73_1.duration_ = 6.3

		local var_73_0 = {
			ja = 6.3,
			ko = 4.266,
			zh = 4.333
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
				arg_73_0:Play222061020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1074ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1074ui_story == nil then
				arg_73_1.var_.characterEffect1074ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1074ui_story then
					arg_73_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1074ui_story then
				arg_73_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1070ui_story"]
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 and arg_73_1.var_.characterEffect1070ui_story == nil then
				arg_73_1.var_.characterEffect1070ui_story = var_76_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_6 = 0.200000002980232

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6

				if arg_73_1.var_.characterEffect1070ui_story then
					local var_76_8 = Mathf.Lerp(0, 0.5, var_76_7)

					arg_73_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1070ui_story.fillRatio = var_76_8
				end
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 and arg_73_1.var_.characterEffect1070ui_story then
				local var_76_9 = 0.5

				arg_73_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1070ui_story.fillRatio = var_76_9
			end

			local var_76_10 = 0
			local var_76_11 = 0.3

			if var_76_10 < arg_73_1.time_ and arg_73_1.time_ <= var_76_10 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_12 = arg_73_1:FormatText(StoryNameCfg[410].name)

				arg_73_1.leftNameTxt_.text = var_76_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_13 = arg_73_1:GetWordFromCfg(222061019)
				local var_76_14 = arg_73_1:FormatText(var_76_13.content)

				arg_73_1.text_.text = var_76_14

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_15 = 12
				local var_76_16 = utf8.len(var_76_14)
				local var_76_17 = var_76_15 <= 0 and var_76_11 or var_76_11 * (var_76_16 / var_76_15)

				if var_76_17 > 0 and var_76_11 < var_76_17 then
					arg_73_1.talkMaxDuration = var_76_17

					if var_76_17 + var_76_10 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_17 + var_76_10
					end
				end

				arg_73_1.text_.text = var_76_14
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061019", "story_v_out_222061.awb") ~= 0 then
					local var_76_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061019", "story_v_out_222061.awb") / 1000

					if var_76_18 + var_76_10 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_18 + var_76_10
					end

					if var_76_13.prefab_name ~= "" and arg_73_1.actors_[var_76_13.prefab_name] ~= nil then
						local var_76_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_13.prefab_name].transform, "story_v_out_222061", "222061019", "story_v_out_222061.awb")

						arg_73_1:RecordAudio("222061019", var_76_19)
						arg_73_1:RecordAudio("222061019", var_76_19)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_222061", "222061019", "story_v_out_222061.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_222061", "222061019", "story_v_out_222061.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_20 = math.max(var_76_11, arg_73_1.talkMaxDuration)

			if var_76_10 <= arg_73_1.time_ and arg_73_1.time_ < var_76_10 + var_76_20 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_10) / var_76_20

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_10 + var_76_20 and arg_73_1.time_ < var_76_10 + var_76_20 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play222061020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 222061020
		arg_77_1.duration_ = 4.9

		local var_77_0 = {
			ja = 4.9,
			ko = 1.5,
			zh = 1.566
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
				arg_77_0:Play222061021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.175

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[410].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(222061020)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 7
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061020", "story_v_out_222061.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061020", "story_v_out_222061.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_222061", "222061020", "story_v_out_222061.awb")

						arg_77_1:RecordAudio("222061020", var_80_9)
						arg_77_1:RecordAudio("222061020", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_222061", "222061020", "story_v_out_222061.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_222061", "222061020", "story_v_out_222061.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play222061021 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 222061021
		arg_81_1.duration_ = 3.066

		local var_81_0 = {
			ja = 3.066,
			ko = 2.3,
			zh = 2.266
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
				arg_81_0:Play222061022(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1070ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1070ui_story == nil then
				arg_81_1.var_.characterEffect1070ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1070ui_story then
					arg_81_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1070ui_story then
				arg_81_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1074ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1074ui_story == nil then
				arg_81_1.var_.characterEffect1074ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.200000002980232

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1074ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1074ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1074ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1074ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0
			local var_84_11 = 0.225

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_12 = arg_81_1:FormatText(StoryNameCfg[318].name)

				arg_81_1.leftNameTxt_.text = var_84_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_13 = arg_81_1:GetWordFromCfg(222061021)
				local var_84_14 = arg_81_1:FormatText(var_84_13.content)

				arg_81_1.text_.text = var_84_14

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_15 = 9
				local var_84_16 = utf8.len(var_84_14)
				local var_84_17 = var_84_15 <= 0 and var_84_11 or var_84_11 * (var_84_16 / var_84_15)

				if var_84_17 > 0 and var_84_11 < var_84_17 then
					arg_81_1.talkMaxDuration = var_84_17

					if var_84_17 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_17 + var_84_10
					end
				end

				arg_81_1.text_.text = var_84_14
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061021", "story_v_out_222061.awb") ~= 0 then
					local var_84_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061021", "story_v_out_222061.awb") / 1000

					if var_84_18 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_10
					end

					if var_84_13.prefab_name ~= "" and arg_81_1.actors_[var_84_13.prefab_name] ~= nil then
						local var_84_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_13.prefab_name].transform, "story_v_out_222061", "222061021", "story_v_out_222061.awb")

						arg_81_1:RecordAudio("222061021", var_84_19)
						arg_81_1:RecordAudio("222061021", var_84_19)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_222061", "222061021", "story_v_out_222061.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_222061", "222061021", "story_v_out_222061.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_20 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_20 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_10) / var_84_20

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_10 + var_84_20 and arg_81_1.time_ < var_84_10 + var_84_20 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play222061022 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 222061022
		arg_85_1.duration_ = 13.9

		local var_85_0 = {
			ja = 13.9,
			ko = 6.666,
			zh = 6.7
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
				arg_85_0:Play222061023(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1074ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1074ui_story == nil then
				arg_85_1.var_.characterEffect1074ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1074ui_story then
					arg_85_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1074ui_story then
				arg_85_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["1070ui_story"]
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 and arg_85_1.var_.characterEffect1070ui_story == nil then
				arg_85_1.var_.characterEffect1070ui_story = var_88_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_6 = 0.200000002980232

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6

				if arg_85_1.var_.characterEffect1070ui_story then
					local var_88_8 = Mathf.Lerp(0, 0.5, var_88_7)

					arg_85_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1070ui_story.fillRatio = var_88_8
				end
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 and arg_85_1.var_.characterEffect1070ui_story then
				local var_88_9 = 0.5

				arg_85_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1070ui_story.fillRatio = var_88_9
			end

			local var_88_10 = 0
			local var_88_11 = 0.75

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_12 = arg_85_1:FormatText(StoryNameCfg[410].name)

				arg_85_1.leftNameTxt_.text = var_88_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_13 = arg_85_1:GetWordFromCfg(222061022)
				local var_88_14 = arg_85_1:FormatText(var_88_13.content)

				arg_85_1.text_.text = var_88_14

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_15 = 30
				local var_88_16 = utf8.len(var_88_14)
				local var_88_17 = var_88_15 <= 0 and var_88_11 or var_88_11 * (var_88_16 / var_88_15)

				if var_88_17 > 0 and var_88_11 < var_88_17 then
					arg_85_1.talkMaxDuration = var_88_17

					if var_88_17 + var_88_10 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_17 + var_88_10
					end
				end

				arg_85_1.text_.text = var_88_14
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061022", "story_v_out_222061.awb") ~= 0 then
					local var_88_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061022", "story_v_out_222061.awb") / 1000

					if var_88_18 + var_88_10 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_18 + var_88_10
					end

					if var_88_13.prefab_name ~= "" and arg_85_1.actors_[var_88_13.prefab_name] ~= nil then
						local var_88_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_13.prefab_name].transform, "story_v_out_222061", "222061022", "story_v_out_222061.awb")

						arg_85_1:RecordAudio("222061022", var_88_19)
						arg_85_1:RecordAudio("222061022", var_88_19)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_222061", "222061022", "story_v_out_222061.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_222061", "222061022", "story_v_out_222061.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_20 = math.max(var_88_11, arg_85_1.talkMaxDuration)

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_20 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_10) / var_88_20

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_10 + var_88_20 and arg_85_1.time_ < var_88_10 + var_88_20 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play222061023 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 222061023
		arg_89_1.duration_ = 5.866

		local var_89_0 = {
			ja = 5.633,
			ko = 5.866,
			zh = 5.866
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
				arg_89_0:Play222061024(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1070ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1070ui_story == nil then
				arg_89_1.var_.characterEffect1070ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1070ui_story then
					arg_89_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1070ui_story then
				arg_89_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["1074ui_story"]
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 and arg_89_1.var_.characterEffect1074ui_story == nil then
				arg_89_1.var_.characterEffect1074ui_story = var_92_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_6 = 0.200000002980232

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6

				if arg_89_1.var_.characterEffect1074ui_story then
					local var_92_8 = Mathf.Lerp(0, 0.5, var_92_7)

					arg_89_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1074ui_story.fillRatio = var_92_8
				end
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 and arg_89_1.var_.characterEffect1074ui_story then
				local var_92_9 = 0.5

				arg_89_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1074ui_story.fillRatio = var_92_9
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_92_12 = 0
			local var_92_13 = 0.55

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[318].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(222061023)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061023", "story_v_out_222061.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_222061", "222061023", "story_v_out_222061.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_222061", "222061023", "story_v_out_222061.awb")

						arg_89_1:RecordAudio("222061023", var_92_21)
						arg_89_1:RecordAudio("222061023", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_222061", "222061023", "story_v_out_222061.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_222061", "222061023", "story_v_out_222061.awb")
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
	Play222061024 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 222061024
		arg_93_1.duration_ = 12.2

		local var_93_0 = {
			ja = 12.2,
			ko = 7.3,
			zh = 7.3
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
				arg_93_0:Play222061025(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_96_1 = 0
			local var_96_2 = 0.975

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_3 = arg_93_1:FormatText(StoryNameCfg[318].name)

				arg_93_1.leftNameTxt_.text = var_96_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_4 = arg_93_1:GetWordFromCfg(222061024)
				local var_96_5 = arg_93_1:FormatText(var_96_4.content)

				arg_93_1.text_.text = var_96_5

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_6 = 39
				local var_96_7 = utf8.len(var_96_5)
				local var_96_8 = var_96_6 <= 0 and var_96_2 or var_96_2 * (var_96_7 / var_96_6)

				if var_96_8 > 0 and var_96_2 < var_96_8 then
					arg_93_1.talkMaxDuration = var_96_8

					if var_96_8 + var_96_1 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_1
					end
				end

				arg_93_1.text_.text = var_96_5
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061024", "story_v_out_222061.awb") ~= 0 then
					local var_96_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061024", "story_v_out_222061.awb") / 1000

					if var_96_9 + var_96_1 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_9 + var_96_1
					end

					if var_96_4.prefab_name ~= "" and arg_93_1.actors_[var_96_4.prefab_name] ~= nil then
						local var_96_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_4.prefab_name].transform, "story_v_out_222061", "222061024", "story_v_out_222061.awb")

						arg_93_1:RecordAudio("222061024", var_96_10)
						arg_93_1:RecordAudio("222061024", var_96_10)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_222061", "222061024", "story_v_out_222061.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_222061", "222061024", "story_v_out_222061.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_11 = math.max(var_96_2, arg_93_1.talkMaxDuration)

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_11 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_1) / var_96_11

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_1 + var_96_11 and arg_93_1.time_ < var_96_1 + var_96_11 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play222061025 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 222061025
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play222061026(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1070ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1070ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, 100, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1070ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, 100, 0)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["1070ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1070ui_story == nil then
				arg_97_1.var_.characterEffect1070ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect1070ui_story then
					local var_100_13 = Mathf.Lerp(0, 0.5, var_100_12)

					arg_97_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1070ui_story.fillRatio = var_100_13
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect1070ui_story then
				local var_100_14 = 0.5

				arg_97_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1070ui_story.fillRatio = var_100_14
			end

			local var_100_15 = arg_97_1.actors_["1074ui_story"].transform
			local var_100_16 = 0

			if var_100_16 < arg_97_1.time_ and arg_97_1.time_ <= var_100_16 + arg_100_0 then
				arg_97_1.var_.moveOldPos1074ui_story = var_100_15.localPosition
			end

			local var_100_17 = 0.001

			if var_100_16 <= arg_97_1.time_ and arg_97_1.time_ < var_100_16 + var_100_17 then
				local var_100_18 = (arg_97_1.time_ - var_100_16) / var_100_17
				local var_100_19 = Vector3.New(0, 100, 0)

				var_100_15.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1074ui_story, var_100_19, var_100_18)

				local var_100_20 = manager.ui.mainCamera.transform.position - var_100_15.position

				var_100_15.forward = Vector3.New(var_100_20.x, var_100_20.y, var_100_20.z)

				local var_100_21 = var_100_15.localEulerAngles

				var_100_21.z = 0
				var_100_21.x = 0
				var_100_15.localEulerAngles = var_100_21
			end

			if arg_97_1.time_ >= var_100_16 + var_100_17 and arg_97_1.time_ < var_100_16 + var_100_17 + arg_100_0 then
				var_100_15.localPosition = Vector3.New(0, 100, 0)

				local var_100_22 = manager.ui.mainCamera.transform.position - var_100_15.position

				var_100_15.forward = Vector3.New(var_100_22.x, var_100_22.y, var_100_22.z)

				local var_100_23 = var_100_15.localEulerAngles

				var_100_23.z = 0
				var_100_23.x = 0
				var_100_15.localEulerAngles = var_100_23
			end

			local var_100_24 = arg_97_1.actors_["1074ui_story"]
			local var_100_25 = 0

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 and arg_97_1.var_.characterEffect1074ui_story == nil then
				arg_97_1.var_.characterEffect1074ui_story = var_100_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_26 = 0.200000002980232

			if var_100_25 <= arg_97_1.time_ and arg_97_1.time_ < var_100_25 + var_100_26 then
				local var_100_27 = (arg_97_1.time_ - var_100_25) / var_100_26

				if arg_97_1.var_.characterEffect1074ui_story then
					local var_100_28 = Mathf.Lerp(0, 0.5, var_100_27)

					arg_97_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1074ui_story.fillRatio = var_100_28
				end
			end

			if arg_97_1.time_ >= var_100_25 + var_100_26 and arg_97_1.time_ < var_100_25 + var_100_26 + arg_100_0 and arg_97_1.var_.characterEffect1074ui_story then
				local var_100_29 = 0.5

				arg_97_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1074ui_story.fillRatio = var_100_29
			end

			local var_100_30 = 0
			local var_100_31 = 0.5

			if var_100_30 < arg_97_1.time_ and arg_97_1.time_ <= var_100_30 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_32 = arg_97_1:GetWordFromCfg(222061025)
				local var_100_33 = arg_97_1:FormatText(var_100_32.content)

				arg_97_1.text_.text = var_100_33

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_34 = 20
				local var_100_35 = utf8.len(var_100_33)
				local var_100_36 = var_100_34 <= 0 and var_100_31 or var_100_31 * (var_100_35 / var_100_34)

				if var_100_36 > 0 and var_100_31 < var_100_36 then
					arg_97_1.talkMaxDuration = var_100_36

					if var_100_36 + var_100_30 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_36 + var_100_30
					end
				end

				arg_97_1.text_.text = var_100_33
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_37 = math.max(var_100_31, arg_97_1.talkMaxDuration)

			if var_100_30 <= arg_97_1.time_ and arg_97_1.time_ < var_100_30 + var_100_37 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_30) / var_100_37

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_30 + var_100_37 and arg_97_1.time_ < var_100_30 + var_100_37 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play222061026 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 222061026
		arg_101_1.duration_ = 7.266

		local var_101_0 = {
			ja = 7.266,
			ko = 3.766,
			zh = 3.733
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
				arg_101_0:Play222061027(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1074ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1074ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1074ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1074ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1074ui_story == nil then
				arg_101_1.var_.characterEffect1074ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1074ui_story then
					arg_101_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1074ui_story then
				arg_101_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_104_13 = arg_101_1.actors_["1070ui_story"].transform
			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1.var_.moveOldPos1070ui_story = var_104_13.localPosition
			end

			local var_104_15 = 0.001

			if var_104_14 <= arg_101_1.time_ and arg_101_1.time_ < var_104_14 + var_104_15 then
				local var_104_16 = (arg_101_1.time_ - var_104_14) / var_104_15
				local var_104_17 = Vector3.New(0.7, -0.95, -6.05)

				var_104_13.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1070ui_story, var_104_17, var_104_16)

				local var_104_18 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_18.x, var_104_18.y, var_104_18.z)

				local var_104_19 = var_104_13.localEulerAngles

				var_104_19.z = 0
				var_104_19.x = 0
				var_104_13.localEulerAngles = var_104_19
			end

			if arg_101_1.time_ >= var_104_14 + var_104_15 and arg_101_1.time_ < var_104_14 + var_104_15 + arg_104_0 then
				var_104_13.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_104_20 = manager.ui.mainCamera.transform.position - var_104_13.position

				var_104_13.forward = Vector3.New(var_104_20.x, var_104_20.y, var_104_20.z)

				local var_104_21 = var_104_13.localEulerAngles

				var_104_21.z = 0
				var_104_21.x = 0
				var_104_13.localEulerAngles = var_104_21
			end

			local var_104_22 = arg_101_1.actors_["1070ui_story"]
			local var_104_23 = 0

			if var_104_23 < arg_101_1.time_ and arg_101_1.time_ <= var_104_23 + arg_104_0 and arg_101_1.var_.characterEffect1070ui_story == nil then
				arg_101_1.var_.characterEffect1070ui_story = var_104_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_24 = 0.200000002980232

			if var_104_23 <= arg_101_1.time_ and arg_101_1.time_ < var_104_23 + var_104_24 then
				local var_104_25 = (arg_101_1.time_ - var_104_23) / var_104_24

				if arg_101_1.var_.characterEffect1070ui_story then
					local var_104_26 = Mathf.Lerp(0, 0.5, var_104_25)

					arg_101_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1070ui_story.fillRatio = var_104_26
				end
			end

			if arg_101_1.time_ >= var_104_23 + var_104_24 and arg_101_1.time_ < var_104_23 + var_104_24 + arg_104_0 and arg_101_1.var_.characterEffect1070ui_story then
				local var_104_27 = 0.5

				arg_101_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1070ui_story.fillRatio = var_104_27
			end

			local var_104_28 = 0

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action1_1")
			end

			local var_104_29 = 0

			if var_104_29 < arg_101_1.time_ and arg_101_1.time_ <= var_104_29 + arg_104_0 then
				arg_101_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_104_30 = 0
			local var_104_31 = 0.45

			if var_104_30 < arg_101_1.time_ and arg_101_1.time_ <= var_104_30 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_32 = arg_101_1:FormatText(StoryNameCfg[410].name)

				arg_101_1.leftNameTxt_.text = var_104_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_33 = arg_101_1:GetWordFromCfg(222061026)
				local var_104_34 = arg_101_1:FormatText(var_104_33.content)

				arg_101_1.text_.text = var_104_34

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_35 = 18
				local var_104_36 = utf8.len(var_104_34)
				local var_104_37 = var_104_35 <= 0 and var_104_31 or var_104_31 * (var_104_36 / var_104_35)

				if var_104_37 > 0 and var_104_31 < var_104_37 then
					arg_101_1.talkMaxDuration = var_104_37

					if var_104_37 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_37 + var_104_30
					end
				end

				arg_101_1.text_.text = var_104_34
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061026", "story_v_out_222061.awb") ~= 0 then
					local var_104_38 = manager.audio:GetVoiceLength("story_v_out_222061", "222061026", "story_v_out_222061.awb") / 1000

					if var_104_38 + var_104_30 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_38 + var_104_30
					end

					if var_104_33.prefab_name ~= "" and arg_101_1.actors_[var_104_33.prefab_name] ~= nil then
						local var_104_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_33.prefab_name].transform, "story_v_out_222061", "222061026", "story_v_out_222061.awb")

						arg_101_1:RecordAudio("222061026", var_104_39)
						arg_101_1:RecordAudio("222061026", var_104_39)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_222061", "222061026", "story_v_out_222061.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_222061", "222061026", "story_v_out_222061.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_40 = math.max(var_104_31, arg_101_1.talkMaxDuration)

			if var_104_30 <= arg_101_1.time_ and arg_101_1.time_ < var_104_30 + var_104_40 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_30) / var_104_40

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_30 + var_104_40 and arg_101_1.time_ < var_104_30 + var_104_40 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play222061027 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 222061027
		arg_105_1.duration_ = 10.833

		local var_105_0 = {
			ja = 10.833,
			ko = 4.166,
			zh = 4.166
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
				arg_105_0:Play222061028(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1070ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1070ui_story == nil then
				arg_105_1.var_.characterEffect1070ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1070ui_story then
					arg_105_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1070ui_story then
				arg_105_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_108_5 = arg_105_1.actors_["1074ui_story"]
			local var_108_6 = 0

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 and arg_105_1.var_.characterEffect1074ui_story == nil then
				arg_105_1.var_.characterEffect1074ui_story = var_108_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_7 = 0.200000002980232

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_7 then
				local var_108_8 = (arg_105_1.time_ - var_108_6) / var_108_7

				if arg_105_1.var_.characterEffect1074ui_story then
					local var_108_9 = Mathf.Lerp(0, 0.5, var_108_8)

					arg_105_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1074ui_story.fillRatio = var_108_9
				end
			end

			if arg_105_1.time_ >= var_108_6 + var_108_7 and arg_105_1.time_ < var_108_6 + var_108_7 + arg_108_0 and arg_105_1.var_.characterEffect1074ui_story then
				local var_108_10 = 0.5

				arg_105_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1074ui_story.fillRatio = var_108_10
			end

			local var_108_11 = 0
			local var_108_12 = 0.55

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_13 = arg_105_1:FormatText(StoryNameCfg[318].name)

				arg_105_1.leftNameTxt_.text = var_108_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_14 = arg_105_1:GetWordFromCfg(222061027)
				local var_108_15 = arg_105_1:FormatText(var_108_14.content)

				arg_105_1.text_.text = var_108_15

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_16 = 22
				local var_108_17 = utf8.len(var_108_15)
				local var_108_18 = var_108_16 <= 0 and var_108_12 or var_108_12 * (var_108_17 / var_108_16)

				if var_108_18 > 0 and var_108_12 < var_108_18 then
					arg_105_1.talkMaxDuration = var_108_18

					if var_108_18 + var_108_11 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_18 + var_108_11
					end
				end

				arg_105_1.text_.text = var_108_15
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061027", "story_v_out_222061.awb") ~= 0 then
					local var_108_19 = manager.audio:GetVoiceLength("story_v_out_222061", "222061027", "story_v_out_222061.awb") / 1000

					if var_108_19 + var_108_11 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_11
					end

					if var_108_14.prefab_name ~= "" and arg_105_1.actors_[var_108_14.prefab_name] ~= nil then
						local var_108_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_14.prefab_name].transform, "story_v_out_222061", "222061027", "story_v_out_222061.awb")

						arg_105_1:RecordAudio("222061027", var_108_20)
						arg_105_1:RecordAudio("222061027", var_108_20)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_222061", "222061027", "story_v_out_222061.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_222061", "222061027", "story_v_out_222061.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_21 = math.max(var_108_12, arg_105_1.talkMaxDuration)

			if var_108_11 <= arg_105_1.time_ and arg_105_1.time_ < var_108_11 + var_108_21 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_11) / var_108_21

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_11 + var_108_21 and arg_105_1.time_ < var_108_11 + var_108_21 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play222061028 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 222061028
		arg_109_1.duration_ = 3.366

		local var_109_0 = {
			ja = 2.233,
			ko = 3.366,
			zh = 3.333
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
				arg_109_0:Play222061029(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1074ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1074ui_story == nil then
				arg_109_1.var_.characterEffect1074ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1074ui_story then
					arg_109_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1074ui_story then
				arg_109_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_112_4 = arg_109_1.actors_["1070ui_story"]
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 and arg_109_1.var_.characterEffect1070ui_story == nil then
				arg_109_1.var_.characterEffect1070ui_story = var_112_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_6 = 0.200000002980232

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6

				if arg_109_1.var_.characterEffect1070ui_story then
					local var_112_8 = Mathf.Lerp(0, 0.5, var_112_7)

					arg_109_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1070ui_story.fillRatio = var_112_8
				end
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect1070ui_story then
				local var_112_9 = 0.5

				arg_109_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1070ui_story.fillRatio = var_112_9
			end

			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				arg_109_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_112_11 = 0
			local var_112_12 = 0.225

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_13 = arg_109_1:FormatText(StoryNameCfg[410].name)

				arg_109_1.leftNameTxt_.text = var_112_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_14 = arg_109_1:GetWordFromCfg(222061028)
				local var_112_15 = arg_109_1:FormatText(var_112_14.content)

				arg_109_1.text_.text = var_112_15

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_16 = 9
				local var_112_17 = utf8.len(var_112_15)
				local var_112_18 = var_112_16 <= 0 and var_112_12 or var_112_12 * (var_112_17 / var_112_16)

				if var_112_18 > 0 and var_112_12 < var_112_18 then
					arg_109_1.talkMaxDuration = var_112_18

					if var_112_18 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_18 + var_112_11
					end
				end

				arg_109_1.text_.text = var_112_15
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061028", "story_v_out_222061.awb") ~= 0 then
					local var_112_19 = manager.audio:GetVoiceLength("story_v_out_222061", "222061028", "story_v_out_222061.awb") / 1000

					if var_112_19 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_11
					end

					if var_112_14.prefab_name ~= "" and arg_109_1.actors_[var_112_14.prefab_name] ~= nil then
						local var_112_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_14.prefab_name].transform, "story_v_out_222061", "222061028", "story_v_out_222061.awb")

						arg_109_1:RecordAudio("222061028", var_112_20)
						arg_109_1:RecordAudio("222061028", var_112_20)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_222061", "222061028", "story_v_out_222061.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_222061", "222061028", "story_v_out_222061.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_21 = math.max(var_112_12, arg_109_1.talkMaxDuration)

			if var_112_11 <= arg_109_1.time_ and arg_109_1.time_ < var_112_11 + var_112_21 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_11) / var_112_21

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_11 + var_112_21 and arg_109_1.time_ < var_112_11 + var_112_21 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play222061029 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 222061029
		arg_113_1.duration_ = 9.8

		local var_113_0 = {
			ja = 9.4,
			ko = 9.8,
			zh = 9.8
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
				arg_113_0:Play222061030(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1070ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1070ui_story == nil then
				arg_113_1.var_.characterEffect1070ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1070ui_story then
					arg_113_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1070ui_story then
				arg_113_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_116_4 = arg_113_1.actors_["1074ui_story"]
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 and arg_113_1.var_.characterEffect1074ui_story == nil then
				arg_113_1.var_.characterEffect1074ui_story = var_116_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_6 = 0.200000002980232

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6

				if arg_113_1.var_.characterEffect1074ui_story then
					local var_116_8 = Mathf.Lerp(0, 0.5, var_116_7)

					arg_113_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1074ui_story.fillRatio = var_116_8
				end
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 and arg_113_1.var_.characterEffect1074ui_story then
				local var_116_9 = 0.5

				arg_113_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1074ui_story.fillRatio = var_116_9
			end

			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 then
				arg_113_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_116_11 = 0

			if var_116_11 < arg_113_1.time_ and arg_113_1.time_ <= var_116_11 + arg_116_0 then
				arg_113_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_116_12 = 0
			local var_116_13 = 1.3

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[318].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(222061029)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 52
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061029", "story_v_out_222061.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_222061", "222061029", "story_v_out_222061.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_222061", "222061029", "story_v_out_222061.awb")

						arg_113_1:RecordAudio("222061029", var_116_21)
						arg_113_1:RecordAudio("222061029", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_222061", "222061029", "story_v_out_222061.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_222061", "222061029", "story_v_out_222061.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play222061030 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 222061030
		arg_117_1.duration_ = 15

		local var_117_0 = {
			ja = 15,
			ko = 6.833,
			zh = 6.833
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
				arg_117_0:Play222061031(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.85

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[318].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(222061030)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 34
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061030", "story_v_out_222061.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061030", "story_v_out_222061.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_222061", "222061030", "story_v_out_222061.awb")

						arg_117_1:RecordAudio("222061030", var_120_9)
						arg_117_1:RecordAudio("222061030", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_222061", "222061030", "story_v_out_222061.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_222061", "222061030", "story_v_out_222061.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play222061031 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 222061031
		arg_121_1.duration_ = 14.866

		local var_121_0 = {
			ja = 14.866,
			ko = 10.033,
			zh = 10.033
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play222061032(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070actionlink/1070action467")
			end

			local var_124_1 = 0
			local var_124_2 = 1.3

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_3 = arg_121_1:FormatText(StoryNameCfg[318].name)

				arg_121_1.leftNameTxt_.text = var_124_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_4 = arg_121_1:GetWordFromCfg(222061031)
				local var_124_5 = arg_121_1:FormatText(var_124_4.content)

				arg_121_1.text_.text = var_124_5

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_6 = 52
				local var_124_7 = utf8.len(var_124_5)
				local var_124_8 = var_124_6 <= 0 and var_124_2 or var_124_2 * (var_124_7 / var_124_6)

				if var_124_8 > 0 and var_124_2 < var_124_8 then
					arg_121_1.talkMaxDuration = var_124_8

					if var_124_8 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_1
					end
				end

				arg_121_1.text_.text = var_124_5
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061031", "story_v_out_222061.awb") ~= 0 then
					local var_124_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061031", "story_v_out_222061.awb") / 1000

					if var_124_9 + var_124_1 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_9 + var_124_1
					end

					if var_124_4.prefab_name ~= "" and arg_121_1.actors_[var_124_4.prefab_name] ~= nil then
						local var_124_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_4.prefab_name].transform, "story_v_out_222061", "222061031", "story_v_out_222061.awb")

						arg_121_1:RecordAudio("222061031", var_124_10)
						arg_121_1:RecordAudio("222061031", var_124_10)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_222061", "222061031", "story_v_out_222061.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_222061", "222061031", "story_v_out_222061.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_11 = math.max(var_124_2, arg_121_1.talkMaxDuration)

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_11 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_1) / var_124_11

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_1 + var_124_11 and arg_121_1.time_ < var_124_1 + var_124_11 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play222061032 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 222061032
		arg_125_1.duration_ = 3.833

		local var_125_0 = {
			ja = 3.833,
			ko = 2.2,
			zh = 2.2
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
				arg_125_0:Play222061033(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1074ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story == nil then
				arg_125_1.var_.characterEffect1074ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1074ui_story then
					arg_125_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story then
				arg_125_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["1070ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect1070ui_story == nil then
				arg_125_1.var_.characterEffect1070ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.200000002980232

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect1070ui_story then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1070ui_story.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1070ui_story then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1070ui_story.fillRatio = var_128_9
			end

			local var_128_10 = 0
			local var_128_11 = 0.2

			if var_128_10 < arg_125_1.time_ and arg_125_1.time_ <= var_128_10 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_12 = arg_125_1:FormatText(StoryNameCfg[410].name)

				arg_125_1.leftNameTxt_.text = var_128_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_13 = arg_125_1:GetWordFromCfg(222061032)
				local var_128_14 = arg_125_1:FormatText(var_128_13.content)

				arg_125_1.text_.text = var_128_14

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_15 = 8
				local var_128_16 = utf8.len(var_128_14)
				local var_128_17 = var_128_15 <= 0 and var_128_11 or var_128_11 * (var_128_16 / var_128_15)

				if var_128_17 > 0 and var_128_11 < var_128_17 then
					arg_125_1.talkMaxDuration = var_128_17

					if var_128_17 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_17 + var_128_10
					end
				end

				arg_125_1.text_.text = var_128_14
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061032", "story_v_out_222061.awb") ~= 0 then
					local var_128_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061032", "story_v_out_222061.awb") / 1000

					if var_128_18 + var_128_10 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_18 + var_128_10
					end

					if var_128_13.prefab_name ~= "" and arg_125_1.actors_[var_128_13.prefab_name] ~= nil then
						local var_128_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_13.prefab_name].transform, "story_v_out_222061", "222061032", "story_v_out_222061.awb")

						arg_125_1:RecordAudio("222061032", var_128_19)
						arg_125_1:RecordAudio("222061032", var_128_19)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_222061", "222061032", "story_v_out_222061.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_222061", "222061032", "story_v_out_222061.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_20 = math.max(var_128_11, arg_125_1.talkMaxDuration)

			if var_128_10 <= arg_125_1.time_ and arg_125_1.time_ < var_128_10 + var_128_20 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_10) / var_128_20

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_10 + var_128_20 and arg_125_1.time_ < var_128_10 + var_128_20 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play222061033 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 222061033
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play222061034(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1074ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1074ui_story == nil then
				arg_129_1.var_.characterEffect1074ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1074ui_story then
					local var_132_4 = Mathf.Lerp(0, 0.5, var_132_3)

					arg_129_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1074ui_story.fillRatio = var_132_4
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1074ui_story then
				local var_132_5 = 0.5

				arg_129_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1074ui_story.fillRatio = var_132_5
			end

			local var_132_6 = 0
			local var_132_7 = 1.575

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

				local var_132_8 = arg_129_1:GetWordFromCfg(222061033)
				local var_132_9 = arg_129_1:FormatText(var_132_8.content)

				arg_129_1.text_.text = var_132_9

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_10 = 63
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
	Play222061034 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 222061034
		arg_133_1.duration_ = 5.1

		local var_133_0 = {
			ja = 5.1,
			ko = 1.9,
			zh = 1.9
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
				arg_133_0:Play222061035(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1074ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story == nil then
				arg_133_1.var_.characterEffect1074ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1074ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1074ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1074ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["1070ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect1070ui_story == nil then
				arg_133_1.var_.characterEffect1070ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect1070ui_story then
					arg_133_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect1070ui_story then
				arg_133_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_136_10 = 0
			local var_136_11 = 0.225

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_12 = arg_133_1:FormatText(StoryNameCfg[318].name)

				arg_133_1.leftNameTxt_.text = var_136_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_13 = arg_133_1:GetWordFromCfg(222061034)
				local var_136_14 = arg_133_1:FormatText(var_136_13.content)

				arg_133_1.text_.text = var_136_14

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_15 = 9
				local var_136_16 = utf8.len(var_136_14)
				local var_136_17 = var_136_15 <= 0 and var_136_11 or var_136_11 * (var_136_16 / var_136_15)

				if var_136_17 > 0 and var_136_11 < var_136_17 then
					arg_133_1.talkMaxDuration = var_136_17

					if var_136_17 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_17 + var_136_10
					end
				end

				arg_133_1.text_.text = var_136_14
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061034", "story_v_out_222061.awb") ~= 0 then
					local var_136_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061034", "story_v_out_222061.awb") / 1000

					if var_136_18 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_18 + var_136_10
					end

					if var_136_13.prefab_name ~= "" and arg_133_1.actors_[var_136_13.prefab_name] ~= nil then
						local var_136_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_13.prefab_name].transform, "story_v_out_222061", "222061034", "story_v_out_222061.awb")

						arg_133_1:RecordAudio("222061034", var_136_19)
						arg_133_1:RecordAudio("222061034", var_136_19)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_222061", "222061034", "story_v_out_222061.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_222061", "222061034", "story_v_out_222061.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_20 = math.max(var_136_11, arg_133_1.talkMaxDuration)

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_20 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_10) / var_136_20

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_10 + var_136_20 and arg_133_1.time_ < var_136_10 + var_136_20 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play222061035 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 222061035
		arg_137_1.duration_ = 16.866

		local var_137_0 = {
			ja = 16.866,
			ko = 11,
			zh = 11
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
				arg_137_0:Play222061036(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1074ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story == nil then
				arg_137_1.var_.characterEffect1074ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1074ui_story then
					arg_137_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story then
				arg_137_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_140_4 = arg_137_1.actors_["1070ui_story"]
			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 and arg_137_1.var_.characterEffect1070ui_story == nil then
				arg_137_1.var_.characterEffect1070ui_story = var_140_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_6 = 0.200000002980232

			if var_140_5 <= arg_137_1.time_ and arg_137_1.time_ < var_140_5 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_5) / var_140_6

				if arg_137_1.var_.characterEffect1070ui_story then
					local var_140_8 = Mathf.Lerp(0, 0.5, var_140_7)

					arg_137_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1070ui_story.fillRatio = var_140_8
				end
			end

			if arg_137_1.time_ >= var_140_5 + var_140_6 and arg_137_1.time_ < var_140_5 + var_140_6 + arg_140_0 and arg_137_1.var_.characterEffect1070ui_story then
				local var_140_9 = 0.5

				arg_137_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1070ui_story.fillRatio = var_140_9
			end

			local var_140_10 = 0
			local var_140_11 = 1.15

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_12 = arg_137_1:FormatText(StoryNameCfg[410].name)

				arg_137_1.leftNameTxt_.text = var_140_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_13 = arg_137_1:GetWordFromCfg(222061035)
				local var_140_14 = arg_137_1:FormatText(var_140_13.content)

				arg_137_1.text_.text = var_140_14

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_15 = 46
				local var_140_16 = utf8.len(var_140_14)
				local var_140_17 = var_140_15 <= 0 and var_140_11 or var_140_11 * (var_140_16 / var_140_15)

				if var_140_17 > 0 and var_140_11 < var_140_17 then
					arg_137_1.talkMaxDuration = var_140_17

					if var_140_17 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_17 + var_140_10
					end
				end

				arg_137_1.text_.text = var_140_14
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061035", "story_v_out_222061.awb") ~= 0 then
					local var_140_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061035", "story_v_out_222061.awb") / 1000

					if var_140_18 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_10
					end

					if var_140_13.prefab_name ~= "" and arg_137_1.actors_[var_140_13.prefab_name] ~= nil then
						local var_140_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_13.prefab_name].transform, "story_v_out_222061", "222061035", "story_v_out_222061.awb")

						arg_137_1:RecordAudio("222061035", var_140_19)
						arg_137_1:RecordAudio("222061035", var_140_19)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_222061", "222061035", "story_v_out_222061.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_222061", "222061035", "story_v_out_222061.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_20 = math.max(var_140_11, arg_137_1.talkMaxDuration)

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_20 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_10) / var_140_20

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_10 + var_140_20 and arg_137_1.time_ < var_140_10 + var_140_20 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play222061036 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 222061036
		arg_141_1.duration_ = 15.1

		local var_141_0 = {
			ja = 15.1,
			ko = 10.566,
			zh = 10.566
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
				arg_141_0:Play222061037(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1.175

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[410].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(222061036)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061036", "story_v_out_222061.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061036", "story_v_out_222061.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_222061", "222061036", "story_v_out_222061.awb")

						arg_141_1:RecordAudio("222061036", var_144_9)
						arg_141_1:RecordAudio("222061036", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_222061", "222061036", "story_v_out_222061.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_222061", "222061036", "story_v_out_222061.awb")
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
	Play222061037 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 222061037
		arg_145_1.duration_ = 15.733

		local var_145_0 = {
			ja = 15.733,
			ko = 11.866,
			zh = 11.833
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
				arg_145_0:Play222061038(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.125

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[410].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(222061037)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 45
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061037", "story_v_out_222061.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061037", "story_v_out_222061.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_222061", "222061037", "story_v_out_222061.awb")

						arg_145_1:RecordAudio("222061037", var_148_9)
						arg_145_1:RecordAudio("222061037", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_222061", "222061037", "story_v_out_222061.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_222061", "222061037", "story_v_out_222061.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play222061038 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 222061038
		arg_149_1.duration_ = 3.8

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play222061039(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1074ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1074ui_story == nil then
				arg_149_1.var_.characterEffect1074ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1074ui_story then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1074ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1074ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1074ui_story.fillRatio = var_152_5
			end

			local var_152_6 = arg_149_1.actors_["1070ui_story"]
			local var_152_7 = 0

			if var_152_7 < arg_149_1.time_ and arg_149_1.time_ <= var_152_7 + arg_152_0 and arg_149_1.var_.characterEffect1070ui_story == nil then
				arg_149_1.var_.characterEffect1070ui_story = var_152_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_8 = 0.200000002980232

			if var_152_7 <= arg_149_1.time_ and arg_149_1.time_ < var_152_7 + var_152_8 then
				local var_152_9 = (arg_149_1.time_ - var_152_7) / var_152_8

				if arg_149_1.var_.characterEffect1070ui_story then
					arg_149_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_7 + var_152_8 and arg_149_1.time_ < var_152_7 + var_152_8 + arg_152_0 and arg_149_1.var_.characterEffect1070ui_story then
				arg_149_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action7_2")
			end

			local var_152_11 = 0
			local var_152_12 = 0.35

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_13 = arg_149_1:FormatText(StoryNameCfg[318].name)

				arg_149_1.leftNameTxt_.text = var_152_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_14 = arg_149_1:GetWordFromCfg(222061038)
				local var_152_15 = arg_149_1:FormatText(var_152_14.content)

				arg_149_1.text_.text = var_152_15

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_16 = 14
				local var_152_17 = utf8.len(var_152_15)
				local var_152_18 = var_152_16 <= 0 and var_152_12 or var_152_12 * (var_152_17 / var_152_16)

				if var_152_18 > 0 and var_152_12 < var_152_18 then
					arg_149_1.talkMaxDuration = var_152_18

					if var_152_18 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_11
					end
				end

				arg_149_1.text_.text = var_152_15
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061038", "story_v_out_222061.awb") ~= 0 then
					local var_152_19 = manager.audio:GetVoiceLength("story_v_out_222061", "222061038", "story_v_out_222061.awb") / 1000

					if var_152_19 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_11
					end

					if var_152_14.prefab_name ~= "" and arg_149_1.actors_[var_152_14.prefab_name] ~= nil then
						local var_152_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_14.prefab_name].transform, "story_v_out_222061", "222061038", "story_v_out_222061.awb")

						arg_149_1:RecordAudio("222061038", var_152_20)
						arg_149_1:RecordAudio("222061038", var_152_20)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_222061", "222061038", "story_v_out_222061.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_222061", "222061038", "story_v_out_222061.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_21 = math.max(var_152_12, arg_149_1.talkMaxDuration)

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_21 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_11) / var_152_21

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_11 + var_152_21 and arg_149_1.time_ < var_152_11 + var_152_21 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play222061039 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 222061039
		arg_153_1.duration_ = 19.433

		local var_153_0 = {
			ja = 19.433,
			ko = 11.933,
			zh = 11.966
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
				arg_153_0:Play222061040(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1074ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story == nil then
				arg_153_1.var_.characterEffect1074ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1074ui_story then
					arg_153_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story then
				arg_153_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1070ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1070ui_story == nil then
				arg_153_1.var_.characterEffect1070ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.200000002980232

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1070ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1070ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1070ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1070ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0
			local var_156_11 = 1.2

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_12 = arg_153_1:FormatText(StoryNameCfg[410].name)

				arg_153_1.leftNameTxt_.text = var_156_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_13 = arg_153_1:GetWordFromCfg(222061039)
				local var_156_14 = arg_153_1:FormatText(var_156_13.content)

				arg_153_1.text_.text = var_156_14

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_15 = 48
				local var_156_16 = utf8.len(var_156_14)
				local var_156_17 = var_156_15 <= 0 and var_156_11 or var_156_11 * (var_156_16 / var_156_15)

				if var_156_17 > 0 and var_156_11 < var_156_17 then
					arg_153_1.talkMaxDuration = var_156_17

					if var_156_17 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_17 + var_156_10
					end
				end

				arg_153_1.text_.text = var_156_14
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061039", "story_v_out_222061.awb") ~= 0 then
					local var_156_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061039", "story_v_out_222061.awb") / 1000

					if var_156_18 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_10
					end

					if var_156_13.prefab_name ~= "" and arg_153_1.actors_[var_156_13.prefab_name] ~= nil then
						local var_156_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_13.prefab_name].transform, "story_v_out_222061", "222061039", "story_v_out_222061.awb")

						arg_153_1:RecordAudio("222061039", var_156_19)
						arg_153_1:RecordAudio("222061039", var_156_19)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_222061", "222061039", "story_v_out_222061.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_222061", "222061039", "story_v_out_222061.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_20 = math.max(var_156_11, arg_153_1.talkMaxDuration)

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_20 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_10) / var_156_20

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_10 + var_156_20 and arg_153_1.time_ < var_156_10 + var_156_20 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play222061040 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 222061040
		arg_157_1.duration_ = 2.933

		local var_157_0 = {
			ja = 2.933,
			ko = 1.233,
			zh = 1.266
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
				arg_157_0:Play222061041(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1070ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1070ui_story == nil then
				arg_157_1.var_.characterEffect1070ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1070ui_story then
					arg_157_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1070ui_story then
				arg_157_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_160_4 = arg_157_1.actors_["1074ui_story"]
			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story == nil then
				arg_157_1.var_.characterEffect1074ui_story = var_160_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_6 = 0.200000002980232

			if var_160_5 <= arg_157_1.time_ and arg_157_1.time_ < var_160_5 + var_160_6 then
				local var_160_7 = (arg_157_1.time_ - var_160_5) / var_160_6

				if arg_157_1.var_.characterEffect1074ui_story then
					local var_160_8 = Mathf.Lerp(0, 0.5, var_160_7)

					arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_8
				end
			end

			if arg_157_1.time_ >= var_160_5 + var_160_6 and arg_157_1.time_ < var_160_5 + var_160_6 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story then
				local var_160_9 = 0.5

				arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_9
			end

			local var_160_10 = 0
			local var_160_11 = 0.125

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_12 = arg_157_1:FormatText(StoryNameCfg[318].name)

				arg_157_1.leftNameTxt_.text = var_160_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_13 = arg_157_1:GetWordFromCfg(222061040)
				local var_160_14 = arg_157_1:FormatText(var_160_13.content)

				arg_157_1.text_.text = var_160_14

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_15 = 5
				local var_160_16 = utf8.len(var_160_14)
				local var_160_17 = var_160_15 <= 0 and var_160_11 or var_160_11 * (var_160_16 / var_160_15)

				if var_160_17 > 0 and var_160_11 < var_160_17 then
					arg_157_1.talkMaxDuration = var_160_17

					if var_160_17 + var_160_10 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_17 + var_160_10
					end
				end

				arg_157_1.text_.text = var_160_14
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061040", "story_v_out_222061.awb") ~= 0 then
					local var_160_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061040", "story_v_out_222061.awb") / 1000

					if var_160_18 + var_160_10 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_18 + var_160_10
					end

					if var_160_13.prefab_name ~= "" and arg_157_1.actors_[var_160_13.prefab_name] ~= nil then
						local var_160_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_13.prefab_name].transform, "story_v_out_222061", "222061040", "story_v_out_222061.awb")

						arg_157_1:RecordAudio("222061040", var_160_19)
						arg_157_1:RecordAudio("222061040", var_160_19)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_222061", "222061040", "story_v_out_222061.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_222061", "222061040", "story_v_out_222061.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_20 = math.max(var_160_11, arg_157_1.talkMaxDuration)

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_20 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_10) / var_160_20

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_10 + var_160_20 and arg_157_1.time_ < var_160_10 + var_160_20 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play222061041 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 222061041
		arg_161_1.duration_ = 2.633

		local var_161_0 = {
			ja = 1.533,
			ko = 2.5,
			zh = 2.633
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
				arg_161_0:Play222061042(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1074ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.characterEffect1074ui_story == nil then
				arg_161_1.var_.characterEffect1074ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1074ui_story then
					arg_161_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.characterEffect1074ui_story then
				arg_161_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_164_4 = arg_161_1.actors_["1070ui_story"]
			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 and arg_161_1.var_.characterEffect1070ui_story == nil then
				arg_161_1.var_.characterEffect1070ui_story = var_164_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_6 = 0.200000002980232

			if var_164_5 <= arg_161_1.time_ and arg_161_1.time_ < var_164_5 + var_164_6 then
				local var_164_7 = (arg_161_1.time_ - var_164_5) / var_164_6

				if arg_161_1.var_.characterEffect1070ui_story then
					local var_164_8 = Mathf.Lerp(0, 0.5, var_164_7)

					arg_161_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1070ui_story.fillRatio = var_164_8
				end
			end

			if arg_161_1.time_ >= var_164_5 + var_164_6 and arg_161_1.time_ < var_164_5 + var_164_6 + arg_164_0 and arg_161_1.var_.characterEffect1070ui_story then
				local var_164_9 = 0.5

				arg_161_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1070ui_story.fillRatio = var_164_9
			end

			local var_164_10 = 0
			local var_164_11 = 0.175

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_12 = arg_161_1:FormatText(StoryNameCfg[410].name)

				arg_161_1.leftNameTxt_.text = var_164_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_13 = arg_161_1:GetWordFromCfg(222061041)
				local var_164_14 = arg_161_1:FormatText(var_164_13.content)

				arg_161_1.text_.text = var_164_14

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_15 = 7
				local var_164_16 = utf8.len(var_164_14)
				local var_164_17 = var_164_15 <= 0 and var_164_11 or var_164_11 * (var_164_16 / var_164_15)

				if var_164_17 > 0 and var_164_11 < var_164_17 then
					arg_161_1.talkMaxDuration = var_164_17

					if var_164_17 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_17 + var_164_10
					end
				end

				arg_161_1.text_.text = var_164_14
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061041", "story_v_out_222061.awb") ~= 0 then
					local var_164_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061041", "story_v_out_222061.awb") / 1000

					if var_164_18 + var_164_10 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_18 + var_164_10
					end

					if var_164_13.prefab_name ~= "" and arg_161_1.actors_[var_164_13.prefab_name] ~= nil then
						local var_164_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_13.prefab_name].transform, "story_v_out_222061", "222061041", "story_v_out_222061.awb")

						arg_161_1:RecordAudio("222061041", var_164_19)
						arg_161_1:RecordAudio("222061041", var_164_19)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_222061", "222061041", "story_v_out_222061.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_222061", "222061041", "story_v_out_222061.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_20 = math.max(var_164_11, arg_161_1.talkMaxDuration)

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_20 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_10) / var_164_20

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_10 + var_164_20 and arg_161_1.time_ < var_164_10 + var_164_20 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play222061042 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 222061042
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play222061043(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1070ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1070ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, 100, 0)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1070ui_story, var_168_4, var_168_3)

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

			local var_168_9 = arg_165_1.actors_["1070ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and arg_165_1.var_.characterEffect1070ui_story == nil then
				arg_165_1.var_.characterEffect1070ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1070ui_story then
					local var_168_13 = Mathf.Lerp(0, 0.5, var_168_12)

					arg_165_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1070ui_story.fillRatio = var_168_13
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1070ui_story then
				local var_168_14 = 0.5

				arg_165_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1070ui_story.fillRatio = var_168_14
			end

			local var_168_15 = arg_165_1.actors_["1074ui_story"].transform
			local var_168_16 = 0

			if var_168_16 < arg_165_1.time_ and arg_165_1.time_ <= var_168_16 + arg_168_0 then
				arg_165_1.var_.moveOldPos1074ui_story = var_168_15.localPosition
			end

			local var_168_17 = 0.001

			if var_168_16 <= arg_165_1.time_ and arg_165_1.time_ < var_168_16 + var_168_17 then
				local var_168_18 = (arg_165_1.time_ - var_168_16) / var_168_17
				local var_168_19 = Vector3.New(0, 100, 0)

				var_168_15.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1074ui_story, var_168_19, var_168_18)

				local var_168_20 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_20.x, var_168_20.y, var_168_20.z)

				local var_168_21 = var_168_15.localEulerAngles

				var_168_21.z = 0
				var_168_21.x = 0
				var_168_15.localEulerAngles = var_168_21
			end

			if arg_165_1.time_ >= var_168_16 + var_168_17 and arg_165_1.time_ < var_168_16 + var_168_17 + arg_168_0 then
				var_168_15.localPosition = Vector3.New(0, 100, 0)

				local var_168_22 = manager.ui.mainCamera.transform.position - var_168_15.position

				var_168_15.forward = Vector3.New(var_168_22.x, var_168_22.y, var_168_22.z)

				local var_168_23 = var_168_15.localEulerAngles

				var_168_23.z = 0
				var_168_23.x = 0
				var_168_15.localEulerAngles = var_168_23
			end

			local var_168_24 = arg_165_1.actors_["1074ui_story"]
			local var_168_25 = 0

			if var_168_25 < arg_165_1.time_ and arg_165_1.time_ <= var_168_25 + arg_168_0 and arg_165_1.var_.characterEffect1074ui_story == nil then
				arg_165_1.var_.characterEffect1074ui_story = var_168_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_26 = 0.200000002980232

			if var_168_25 <= arg_165_1.time_ and arg_165_1.time_ < var_168_25 + var_168_26 then
				local var_168_27 = (arg_165_1.time_ - var_168_25) / var_168_26

				if arg_165_1.var_.characterEffect1074ui_story then
					local var_168_28 = Mathf.Lerp(0, 0.5, var_168_27)

					arg_165_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1074ui_story.fillRatio = var_168_28
				end
			end

			if arg_165_1.time_ >= var_168_25 + var_168_26 and arg_165_1.time_ < var_168_25 + var_168_26 + arg_168_0 and arg_165_1.var_.characterEffect1074ui_story then
				local var_168_29 = 0.5

				arg_165_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1074ui_story.fillRatio = var_168_29
			end

			local var_168_30 = 0
			local var_168_31 = 0.8

			if var_168_30 < arg_165_1.time_ and arg_165_1.time_ <= var_168_30 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_32 = arg_165_1:GetWordFromCfg(222061042)
				local var_168_33 = arg_165_1:FormatText(var_168_32.content)

				arg_165_1.text_.text = var_168_33

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_34 = 32
				local var_168_35 = utf8.len(var_168_33)
				local var_168_36 = var_168_34 <= 0 and var_168_31 or var_168_31 * (var_168_35 / var_168_34)

				if var_168_36 > 0 and var_168_31 < var_168_36 then
					arg_165_1.talkMaxDuration = var_168_36

					if var_168_36 + var_168_30 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_36 + var_168_30
					end
				end

				arg_165_1.text_.text = var_168_33
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_37 = math.max(var_168_31, arg_165_1.talkMaxDuration)

			if var_168_30 <= arg_165_1.time_ and arg_165_1.time_ < var_168_30 + var_168_37 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_30) / var_168_37

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_30 + var_168_37 and arg_165_1.time_ < var_168_30 + var_168_37 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play222061043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 222061043
		arg_169_1.duration_ = 13.6

		local var_169_0 = {
			ja = 13.6,
			ko = 9.666,
			zh = 9.666
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
				arg_169_0:Play222061044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1070ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1070ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -0.95, -6.05)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1070ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1070ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1070ui_story == nil then
				arg_169_1.var_.characterEffect1070ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1070ui_story then
					arg_169_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1070ui_story then
				arg_169_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_172_13 = 0

			if var_172_13 < arg_169_1.time_ and arg_169_1.time_ <= var_172_13 + arg_172_0 then
				arg_169_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action7_1")
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_172_15 = 0
			local var_172_16 = 1.4

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_17 = arg_169_1:FormatText(StoryNameCfg[318].name)

				arg_169_1.leftNameTxt_.text = var_172_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_18 = arg_169_1:GetWordFromCfg(222061043)
				local var_172_19 = arg_169_1:FormatText(var_172_18.content)

				arg_169_1.text_.text = var_172_19

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_20 = 56
				local var_172_21 = utf8.len(var_172_19)
				local var_172_22 = var_172_20 <= 0 and var_172_16 or var_172_16 * (var_172_21 / var_172_20)

				if var_172_22 > 0 and var_172_16 < var_172_22 then
					arg_169_1.talkMaxDuration = var_172_22

					if var_172_22 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_22 + var_172_15
					end
				end

				arg_169_1.text_.text = var_172_19
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061043", "story_v_out_222061.awb") ~= 0 then
					local var_172_23 = manager.audio:GetVoiceLength("story_v_out_222061", "222061043", "story_v_out_222061.awb") / 1000

					if var_172_23 + var_172_15 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_23 + var_172_15
					end

					if var_172_18.prefab_name ~= "" and arg_169_1.actors_[var_172_18.prefab_name] ~= nil then
						local var_172_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_18.prefab_name].transform, "story_v_out_222061", "222061043", "story_v_out_222061.awb")

						arg_169_1:RecordAudio("222061043", var_172_24)
						arg_169_1:RecordAudio("222061043", var_172_24)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_222061", "222061043", "story_v_out_222061.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_222061", "222061043", "story_v_out_222061.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_25 = math.max(var_172_16, arg_169_1.talkMaxDuration)

			if var_172_15 <= arg_169_1.time_ and arg_169_1.time_ < var_172_15 + var_172_25 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_15) / var_172_25

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_15 + var_172_25 and arg_169_1.time_ < var_172_15 + var_172_25 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play222061044 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 222061044
		arg_173_1.duration_ = 17.9

		local var_173_0 = {
			ja = 17.9,
			ko = 9.633,
			zh = 9.633
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
				arg_173_0:Play222061045(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070actionlink/1070action476")
			end

			local var_176_1 = 0
			local var_176_2 = 1.375

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_3 = arg_173_1:FormatText(StoryNameCfg[318].name)

				arg_173_1.leftNameTxt_.text = var_176_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_4 = arg_173_1:GetWordFromCfg(222061044)
				local var_176_5 = arg_173_1:FormatText(var_176_4.content)

				arg_173_1.text_.text = var_176_5

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_6 = 55
				local var_176_7 = utf8.len(var_176_5)
				local var_176_8 = var_176_6 <= 0 and var_176_2 or var_176_2 * (var_176_7 / var_176_6)

				if var_176_8 > 0 and var_176_2 < var_176_8 then
					arg_173_1.talkMaxDuration = var_176_8

					if var_176_8 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_1
					end
				end

				arg_173_1.text_.text = var_176_5
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061044", "story_v_out_222061.awb") ~= 0 then
					local var_176_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061044", "story_v_out_222061.awb") / 1000

					if var_176_9 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_9 + var_176_1
					end

					if var_176_4.prefab_name ~= "" and arg_173_1.actors_[var_176_4.prefab_name] ~= nil then
						local var_176_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_4.prefab_name].transform, "story_v_out_222061", "222061044", "story_v_out_222061.awb")

						arg_173_1:RecordAudio("222061044", var_176_10)
						arg_173_1:RecordAudio("222061044", var_176_10)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_222061", "222061044", "story_v_out_222061.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_222061", "222061044", "story_v_out_222061.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_11 = math.max(var_176_2, arg_173_1.talkMaxDuration)

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_11 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_1) / var_176_11

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_1 + var_176_11 and arg_173_1.time_ < var_176_1 + var_176_11 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play222061045 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 222061045
		arg_177_1.duration_ = 16.866

		local var_177_0 = {
			ja = 16.866,
			ko = 9.8,
			zh = 9.8
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play222061046(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_180_1 = 0
			local var_180_2 = 1.15

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_3 = arg_177_1:FormatText(StoryNameCfg[318].name)

				arg_177_1.leftNameTxt_.text = var_180_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_4 = arg_177_1:GetWordFromCfg(222061045)
				local var_180_5 = arg_177_1:FormatText(var_180_4.content)

				arg_177_1.text_.text = var_180_5

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_6 = 46
				local var_180_7 = utf8.len(var_180_5)
				local var_180_8 = var_180_6 <= 0 and var_180_2 or var_180_2 * (var_180_7 / var_180_6)

				if var_180_8 > 0 and var_180_2 < var_180_8 then
					arg_177_1.talkMaxDuration = var_180_8

					if var_180_8 + var_180_1 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_1
					end
				end

				arg_177_1.text_.text = var_180_5
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061045", "story_v_out_222061.awb") ~= 0 then
					local var_180_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061045", "story_v_out_222061.awb") / 1000

					if var_180_9 + var_180_1 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_9 + var_180_1
					end

					if var_180_4.prefab_name ~= "" and arg_177_1.actors_[var_180_4.prefab_name] ~= nil then
						local var_180_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_4.prefab_name].transform, "story_v_out_222061", "222061045", "story_v_out_222061.awb")

						arg_177_1:RecordAudio("222061045", var_180_10)
						arg_177_1:RecordAudio("222061045", var_180_10)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_222061", "222061045", "story_v_out_222061.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_222061", "222061045", "story_v_out_222061.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_11 = math.max(var_180_2, arg_177_1.talkMaxDuration)

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_11 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_1) / var_180_11

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_1 + var_180_11 and arg_177_1.time_ < var_180_1 + var_180_11 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play222061046 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 222061046
		arg_181_1.duration_ = 4.3

		local var_181_0 = {
			ja = 4.3,
			ko = 1.3,
			zh = 1.366
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
				arg_181_0:Play222061047(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1070ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1070ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(-0.7, -0.95, -6.05)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1070ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1070ui_story"]
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 and arg_181_1.var_.characterEffect1070ui_story == nil then
				arg_181_1.var_.characterEffect1070ui_story = var_184_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_11 = 0.200000002980232

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11

				if arg_181_1.var_.characterEffect1070ui_story then
					local var_184_13 = Mathf.Lerp(0, 0.5, var_184_12)

					arg_181_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1070ui_story.fillRatio = var_184_13
				end
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 and arg_181_1.var_.characterEffect1070ui_story then
				local var_184_14 = 0.5

				arg_181_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1070ui_story.fillRatio = var_184_14
			end

			local var_184_15 = arg_181_1.actors_["1074ui_story"].transform
			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.var_.moveOldPos1074ui_story = var_184_15.localPosition
			end

			local var_184_17 = 0.001

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17
				local var_184_19 = Vector3.New(0.7, -1.055, -6.12)

				var_184_15.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1074ui_story, var_184_19, var_184_18)

				local var_184_20 = manager.ui.mainCamera.transform.position - var_184_15.position

				var_184_15.forward = Vector3.New(var_184_20.x, var_184_20.y, var_184_20.z)

				local var_184_21 = var_184_15.localEulerAngles

				var_184_21.z = 0
				var_184_21.x = 0
				var_184_15.localEulerAngles = var_184_21
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 then
				var_184_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_184_22 = manager.ui.mainCamera.transform.position - var_184_15.position

				var_184_15.forward = Vector3.New(var_184_22.x, var_184_22.y, var_184_22.z)

				local var_184_23 = var_184_15.localEulerAngles

				var_184_23.z = 0
				var_184_23.x = 0
				var_184_15.localEulerAngles = var_184_23
			end

			local var_184_24 = arg_181_1.actors_["1074ui_story"]
			local var_184_25 = 0

			if var_184_25 < arg_181_1.time_ and arg_181_1.time_ <= var_184_25 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story == nil then
				arg_181_1.var_.characterEffect1074ui_story = var_184_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_26 = 0.200000002980232

			if var_184_25 <= arg_181_1.time_ and arg_181_1.time_ < var_184_25 + var_184_26 then
				local var_184_27 = (arg_181_1.time_ - var_184_25) / var_184_26

				if arg_181_1.var_.characterEffect1074ui_story then
					arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_25 + var_184_26 and arg_181_1.time_ < var_184_25 + var_184_26 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story then
				arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_184_28 = 0
			local var_184_29 = 0.1

			if var_184_28 < arg_181_1.time_ and arg_181_1.time_ <= var_184_28 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_30 = arg_181_1:FormatText(StoryNameCfg[410].name)

				arg_181_1.leftNameTxt_.text = var_184_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_31 = arg_181_1:GetWordFromCfg(222061046)
				local var_184_32 = arg_181_1:FormatText(var_184_31.content)

				arg_181_1.text_.text = var_184_32

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_33 = 4
				local var_184_34 = utf8.len(var_184_32)
				local var_184_35 = var_184_33 <= 0 and var_184_29 or var_184_29 * (var_184_34 / var_184_33)

				if var_184_35 > 0 and var_184_29 < var_184_35 then
					arg_181_1.talkMaxDuration = var_184_35

					if var_184_35 + var_184_28 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_35 + var_184_28
					end
				end

				arg_181_1.text_.text = var_184_32
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061046", "story_v_out_222061.awb") ~= 0 then
					local var_184_36 = manager.audio:GetVoiceLength("story_v_out_222061", "222061046", "story_v_out_222061.awb") / 1000

					if var_184_36 + var_184_28 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_36 + var_184_28
					end

					if var_184_31.prefab_name ~= "" and arg_181_1.actors_[var_184_31.prefab_name] ~= nil then
						local var_184_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_31.prefab_name].transform, "story_v_out_222061", "222061046", "story_v_out_222061.awb")

						arg_181_1:RecordAudio("222061046", var_184_37)
						arg_181_1:RecordAudio("222061046", var_184_37)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_222061", "222061046", "story_v_out_222061.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_222061", "222061046", "story_v_out_222061.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_38 = math.max(var_184_29, arg_181_1.talkMaxDuration)

			if var_184_28 <= arg_181_1.time_ and arg_181_1.time_ < var_184_28 + var_184_38 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_28) / var_184_38

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_28 + var_184_38 and arg_181_1.time_ < var_184_28 + var_184_38 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play222061047 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 222061047
		arg_185_1.duration_ = 11.166

		local var_185_0 = {
			ja = 11.166,
			ko = 6.8,
			zh = 6.766
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
				arg_185_0:Play222061048(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1070ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1070ui_story == nil then
				arg_185_1.var_.characterEffect1070ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1070ui_story then
					arg_185_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1070ui_story then
				arg_185_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_188_4 = arg_185_1.actors_["1074ui_story"]
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 and arg_185_1.var_.characterEffect1074ui_story == nil then
				arg_185_1.var_.characterEffect1074ui_story = var_188_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_6 = 0.200000002980232

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6

				if arg_185_1.var_.characterEffect1074ui_story then
					local var_188_8 = Mathf.Lerp(0, 0.5, var_188_7)

					arg_185_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1074ui_story.fillRatio = var_188_8
				end
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 and arg_185_1.var_.characterEffect1074ui_story then
				local var_188_9 = 0.5

				arg_185_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1074ui_story.fillRatio = var_188_9
			end

			local var_188_10 = 0
			local var_188_11 = 0.925

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_12 = arg_185_1:FormatText(StoryNameCfg[318].name)

				arg_185_1.leftNameTxt_.text = var_188_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_13 = arg_185_1:GetWordFromCfg(222061047)
				local var_188_14 = arg_185_1:FormatText(var_188_13.content)

				arg_185_1.text_.text = var_188_14

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_15 = 33
				local var_188_16 = utf8.len(var_188_14)
				local var_188_17 = var_188_15 <= 0 and var_188_11 or var_188_11 * (var_188_16 / var_188_15)

				if var_188_17 > 0 and var_188_11 < var_188_17 then
					arg_185_1.talkMaxDuration = var_188_17

					if var_188_17 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_17 + var_188_10
					end
				end

				arg_185_1.text_.text = var_188_14
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061047", "story_v_out_222061.awb") ~= 0 then
					local var_188_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061047", "story_v_out_222061.awb") / 1000

					if var_188_18 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_10
					end

					if var_188_13.prefab_name ~= "" and arg_185_1.actors_[var_188_13.prefab_name] ~= nil then
						local var_188_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_13.prefab_name].transform, "story_v_out_222061", "222061047", "story_v_out_222061.awb")

						arg_185_1:RecordAudio("222061047", var_188_19)
						arg_185_1:RecordAudio("222061047", var_188_19)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_222061", "222061047", "story_v_out_222061.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_222061", "222061047", "story_v_out_222061.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_20 = math.max(var_188_11, arg_185_1.talkMaxDuration)

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_20 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_10) / var_188_20

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_10 + var_188_20 and arg_185_1.time_ < var_188_10 + var_188_20 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play222061048 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 222061048
		arg_189_1.duration_ = 15.466

		local var_189_0 = {
			ja = 15.466,
			ko = 14.966,
			zh = 14.966
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
				arg_189_0:Play222061049(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_192_1 = 0
			local var_192_2 = 1.4

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_3 = arg_189_1:FormatText(StoryNameCfg[318].name)

				arg_189_1.leftNameTxt_.text = var_192_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_4 = arg_189_1:GetWordFromCfg(222061048)
				local var_192_5 = arg_189_1:FormatText(var_192_4.content)

				arg_189_1.text_.text = var_192_5

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_6 = 56
				local var_192_7 = utf8.len(var_192_5)
				local var_192_8 = var_192_6 <= 0 and var_192_2 or var_192_2 * (var_192_7 / var_192_6)

				if var_192_8 > 0 and var_192_2 < var_192_8 then
					arg_189_1.talkMaxDuration = var_192_8

					if var_192_8 + var_192_1 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_1
					end
				end

				arg_189_1.text_.text = var_192_5
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061048", "story_v_out_222061.awb") ~= 0 then
					local var_192_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061048", "story_v_out_222061.awb") / 1000

					if var_192_9 + var_192_1 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_9 + var_192_1
					end

					if var_192_4.prefab_name ~= "" and arg_189_1.actors_[var_192_4.prefab_name] ~= nil then
						local var_192_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_4.prefab_name].transform, "story_v_out_222061", "222061048", "story_v_out_222061.awb")

						arg_189_1:RecordAudio("222061048", var_192_10)
						arg_189_1:RecordAudio("222061048", var_192_10)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_222061", "222061048", "story_v_out_222061.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_222061", "222061048", "story_v_out_222061.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_11 = math.max(var_192_2, arg_189_1.talkMaxDuration)

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_11 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_1) / var_192_11

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_1 + var_192_11 and arg_189_1.time_ < var_192_1 + var_192_11 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play222061049 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 222061049
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play222061050(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1070ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1070ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, 100, 0)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1070ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, 100, 0)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1070ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1070ui_story == nil then
				arg_193_1.var_.characterEffect1070ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1070ui_story then
					local var_196_13 = Mathf.Lerp(0, 0.5, var_196_12)

					arg_193_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1070ui_story.fillRatio = var_196_13
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1070ui_story then
				local var_196_14 = 0.5

				arg_193_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1070ui_story.fillRatio = var_196_14
			end

			local var_196_15 = arg_193_1.actors_["1074ui_story"].transform
			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				arg_193_1.var_.moveOldPos1074ui_story = var_196_15.localPosition
			end

			local var_196_17 = 0.001

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17
				local var_196_19 = Vector3.New(0, 100, 0)

				var_196_15.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1074ui_story, var_196_19, var_196_18)

				local var_196_20 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_20.x, var_196_20.y, var_196_20.z)

				local var_196_21 = var_196_15.localEulerAngles

				var_196_21.z = 0
				var_196_21.x = 0
				var_196_15.localEulerAngles = var_196_21
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 then
				var_196_15.localPosition = Vector3.New(0, 100, 0)

				local var_196_22 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_22.x, var_196_22.y, var_196_22.z)

				local var_196_23 = var_196_15.localEulerAngles

				var_196_23.z = 0
				var_196_23.x = 0
				var_196_15.localEulerAngles = var_196_23
			end

			local var_196_24 = arg_193_1.actors_["1074ui_story"]
			local var_196_25 = 0

			if var_196_25 < arg_193_1.time_ and arg_193_1.time_ <= var_196_25 + arg_196_0 and arg_193_1.var_.characterEffect1074ui_story == nil then
				arg_193_1.var_.characterEffect1074ui_story = var_196_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_26 = 0.200000002980232

			if var_196_25 <= arg_193_1.time_ and arg_193_1.time_ < var_196_25 + var_196_26 then
				local var_196_27 = (arg_193_1.time_ - var_196_25) / var_196_26

				if arg_193_1.var_.characterEffect1074ui_story then
					local var_196_28 = Mathf.Lerp(0, 0.5, var_196_27)

					arg_193_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1074ui_story.fillRatio = var_196_28
				end
			end

			if arg_193_1.time_ >= var_196_25 + var_196_26 and arg_193_1.time_ < var_196_25 + var_196_26 + arg_196_0 and arg_193_1.var_.characterEffect1074ui_story then
				local var_196_29 = 0.5

				arg_193_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1074ui_story.fillRatio = var_196_29
			end

			local var_196_30 = 0
			local var_196_31 = 1.05

			if var_196_30 < arg_193_1.time_ and arg_193_1.time_ <= var_196_30 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_32 = arg_193_1:GetWordFromCfg(222061049)
				local var_196_33 = arg_193_1:FormatText(var_196_32.content)

				arg_193_1.text_.text = var_196_33

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_34 = 42
				local var_196_35 = utf8.len(var_196_33)
				local var_196_36 = var_196_34 <= 0 and var_196_31 or var_196_31 * (var_196_35 / var_196_34)

				if var_196_36 > 0 and var_196_31 < var_196_36 then
					arg_193_1.talkMaxDuration = var_196_36

					if var_196_36 + var_196_30 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_36 + var_196_30
					end
				end

				arg_193_1.text_.text = var_196_33
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_37 = math.max(var_196_31, arg_193_1.talkMaxDuration)

			if var_196_30 <= arg_193_1.time_ and arg_193_1.time_ < var_196_30 + var_196_37 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_30) / var_196_37

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_30 + var_196_37 and arg_193_1.time_ < var_196_30 + var_196_37 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play222061050 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 222061050
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play222061051(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 1.275

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

				local var_200_2 = arg_197_1:GetWordFromCfg(222061050)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 51
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
	Play222061051 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 222061051
		arg_201_1.duration_ = 9.2

		local var_201_0 = {
			ja = 9.2,
			ko = 3.766,
			zh = 3.766
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play222061052(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1074ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1074ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -1.055, -6.12)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1074ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1074ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story == nil then
				arg_201_1.var_.characterEffect1074ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1074ui_story then
					arg_201_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story then
				arg_201_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_204_14 = 0
			local var_204_15 = 0.275

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_16 = arg_201_1:FormatText(StoryNameCfg[410].name)

				arg_201_1.leftNameTxt_.text = var_204_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_17 = arg_201_1:GetWordFromCfg(222061051)
				local var_204_18 = arg_201_1:FormatText(var_204_17.content)

				arg_201_1.text_.text = var_204_18

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_19 = 11
				local var_204_20 = utf8.len(var_204_18)
				local var_204_21 = var_204_19 <= 0 and var_204_15 or var_204_15 * (var_204_20 / var_204_19)

				if var_204_21 > 0 and var_204_15 < var_204_21 then
					arg_201_1.talkMaxDuration = var_204_21

					if var_204_21 + var_204_14 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_21 + var_204_14
					end
				end

				arg_201_1.text_.text = var_204_18
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061051", "story_v_out_222061.awb") ~= 0 then
					local var_204_22 = manager.audio:GetVoiceLength("story_v_out_222061", "222061051", "story_v_out_222061.awb") / 1000

					if var_204_22 + var_204_14 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_14
					end

					if var_204_17.prefab_name ~= "" and arg_201_1.actors_[var_204_17.prefab_name] ~= nil then
						local var_204_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_17.prefab_name].transform, "story_v_out_222061", "222061051", "story_v_out_222061.awb")

						arg_201_1:RecordAudio("222061051", var_204_23)
						arg_201_1:RecordAudio("222061051", var_204_23)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_222061", "222061051", "story_v_out_222061.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_222061", "222061051", "story_v_out_222061.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_24 = math.max(var_204_15, arg_201_1.talkMaxDuration)

			if var_204_14 <= arg_201_1.time_ and arg_201_1.time_ < var_204_14 + var_204_24 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_14) / var_204_24

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_14 + var_204_24 and arg_201_1.time_ < var_204_14 + var_204_24 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play222061052 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 222061052
		arg_205_1.duration_ = 8.999999999999

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play222061053(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = "J16f"

			if arg_205_1.bgs_[var_208_0] == nil then
				local var_208_1 = Object.Instantiate(arg_205_1.paintGo_)

				var_208_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_208_0)
				var_208_1.name = var_208_0
				var_208_1.transform.parent = arg_205_1.stage_.transform
				var_208_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_205_1.bgs_[var_208_0] = var_208_1
			end

			local var_208_2 = 2

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				local var_208_3 = manager.ui.mainCamera.transform.localPosition
				local var_208_4 = Vector3.New(0, 0, 10) + Vector3.New(var_208_3.x, var_208_3.y, 0)
				local var_208_5 = arg_205_1.bgs_.J16f

				var_208_5.transform.localPosition = var_208_4
				var_208_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_208_6 = var_208_5:GetComponent("SpriteRenderer")

				if var_208_6 and var_208_6.sprite then
					local var_208_7 = (var_208_5.transform.localPosition - var_208_3).z
					local var_208_8 = manager.ui.mainCameraCom_
					local var_208_9 = 2 * var_208_7 * Mathf.Tan(var_208_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_208_10 = var_208_9 * var_208_8.aspect
					local var_208_11 = var_208_6.sprite.bounds.size.x
					local var_208_12 = var_208_6.sprite.bounds.size.y
					local var_208_13 = var_208_10 / var_208_11
					local var_208_14 = var_208_9 / var_208_12
					local var_208_15 = var_208_14 < var_208_13 and var_208_13 or var_208_14

					var_208_5.transform.localScale = Vector3.New(var_208_15, var_208_15, 0)
				end

				for iter_208_0, iter_208_1 in pairs(arg_205_1.bgs_) do
					if iter_208_0 ~= "J16f" then
						iter_208_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
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

			local var_208_27 = arg_205_1.actors_["1074ui_story"].transform
			local var_208_28 = 1.966

			if var_208_28 < arg_205_1.time_ and arg_205_1.time_ <= var_208_28 + arg_208_0 then
				arg_205_1.var_.moveOldPos1074ui_story = var_208_27.localPosition
			end

			local var_208_29 = 0.001

			if var_208_28 <= arg_205_1.time_ and arg_205_1.time_ < var_208_28 + var_208_29 then
				local var_208_30 = (arg_205_1.time_ - var_208_28) / var_208_29
				local var_208_31 = Vector3.New(0, 100, 0)

				var_208_27.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1074ui_story, var_208_31, var_208_30)

				local var_208_32 = manager.ui.mainCamera.transform.position - var_208_27.position

				var_208_27.forward = Vector3.New(var_208_32.x, var_208_32.y, var_208_32.z)

				local var_208_33 = var_208_27.localEulerAngles

				var_208_33.z = 0
				var_208_33.x = 0
				var_208_27.localEulerAngles = var_208_33
			end

			if arg_205_1.time_ >= var_208_28 + var_208_29 and arg_205_1.time_ < var_208_28 + var_208_29 + arg_208_0 then
				var_208_27.localPosition = Vector3.New(0, 100, 0)

				local var_208_34 = manager.ui.mainCamera.transform.position - var_208_27.position

				var_208_27.forward = Vector3.New(var_208_34.x, var_208_34.y, var_208_34.z)

				local var_208_35 = var_208_27.localEulerAngles

				var_208_35.z = 0
				var_208_35.x = 0
				var_208_27.localEulerAngles = var_208_35
			end

			if arg_205_1.frameCnt_ <= 1 then
				arg_205_1.dialog_:SetActive(false)
			end

			local var_208_36 = 3.999999999999
			local var_208_37 = 0.675

			if var_208_36 < arg_205_1.time_ and arg_205_1.time_ <= var_208_36 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0

				arg_205_1.dialog_:SetActive(true)

				local var_208_38 = LeanTween.value(arg_205_1.dialog_, 0, 1, 0.3)

				var_208_38:setOnUpdate(LuaHelper.FloatAction(function(arg_209_0)
					arg_205_1.dialogCg_.alpha = arg_209_0
				end))
				var_208_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_205_1.dialog_)
					var_208_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_205_1.duration_ = arg_205_1.duration_ + 0.3

				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_39 = arg_205_1:GetWordFromCfg(222061052)
				local var_208_40 = arg_205_1:FormatText(var_208_39.content)

				arg_205_1.text_.text = var_208_40

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_41 = 27
				local var_208_42 = utf8.len(var_208_40)
				local var_208_43 = var_208_41 <= 0 and var_208_37 or var_208_37 * (var_208_42 / var_208_41)

				if var_208_43 > 0 and var_208_37 < var_208_43 then
					arg_205_1.talkMaxDuration = var_208_43
					var_208_36 = var_208_36 + 0.3

					if var_208_43 + var_208_36 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_43 + var_208_36
					end
				end

				arg_205_1.text_.text = var_208_40
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_44 = var_208_36 + 0.3
			local var_208_45 = math.max(var_208_37, arg_205_1.talkMaxDuration)

			if var_208_44 <= arg_205_1.time_ and arg_205_1.time_ < var_208_44 + var_208_45 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_44) / var_208_45

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_44 + var_208_45 and arg_205_1.time_ < var_208_44 + var_208_45 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play222061053 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 222061053
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play222061054(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.075

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(222061053)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 43
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play222061054 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 222061054
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play222061055(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.45

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

				local var_218_2 = arg_215_1:GetWordFromCfg(222061054)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 58
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
	Play222061055 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 222061055
		arg_219_1.duration_ = 5.2

		local var_219_0 = {
			ja = 5.2,
			ko = 3.866,
			zh = 3.866
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
				arg_219_0:Play222061056(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = "1071ui_story"

			if arg_219_1.actors_[var_222_0] == nil then
				local var_222_1 = Object.Instantiate(Asset.Load("Char/" .. var_222_0), arg_219_1.stage_.transform)

				var_222_1.name = var_222_0
				var_222_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_219_1.actors_[var_222_0] = var_222_1

				local var_222_2 = var_222_1:GetComponentInChildren(typeof(CharacterEffect))

				var_222_2.enabled = true

				local var_222_3 = GameObjectTools.GetOrAddComponent(var_222_1, typeof(DynamicBoneHelper))

				if var_222_3 then
					var_222_3:EnableDynamicBone(false)
				end

				arg_219_1:ShowWeapon(var_222_2.transform, false)

				arg_219_1.var_[var_222_0 .. "Animator"] = var_222_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_219_1.var_[var_222_0 .. "Animator"].applyRootMotion = true
				arg_219_1.var_[var_222_0 .. "LipSync"] = var_222_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_222_4 = 0

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_222_5 = manager.ui.mainCamera.transform
			local var_222_6 = 0

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.var_.shakeOldPos = var_222_5.localPosition
			end

			local var_222_7 = 0.6

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_7 then
				local var_222_8 = (arg_219_1.time_ - var_222_6) / 0.066
				local var_222_9, var_222_10 = math.modf(var_222_8)

				var_222_5.localPosition = Vector3.New(var_222_10 * 0.13, var_222_10 * 0.13, var_222_10 * 0.13) + arg_219_1.var_.shakeOldPos
			end

			if arg_219_1.time_ >= var_222_6 + var_222_7 and arg_219_1.time_ < var_222_6 + var_222_7 + arg_222_0 then
				var_222_5.localPosition = arg_219_1.var_.shakeOldPos
			end

			local var_222_11 = 0

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1.allBtn_.enabled = false
			end

			local var_222_12 = 0.6

			if arg_219_1.time_ >= var_222_11 + var_222_12 and arg_219_1.time_ < var_222_11 + var_222_12 + arg_222_0 then
				arg_219_1.allBtn_.enabled = true
			end

			local var_222_13 = 0
			local var_222_14 = 0.3

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[318].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1070_split_7")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(222061055)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 12
				local var_222_19 = utf8.len(var_222_17)
				local var_222_20 = var_222_18 <= 0 and var_222_14 or var_222_14 * (var_222_19 / var_222_18)

				if var_222_20 > 0 and var_222_14 < var_222_20 then
					arg_219_1.talkMaxDuration = var_222_20

					if var_222_20 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_13
					end
				end

				arg_219_1.text_.text = var_222_17
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061055", "story_v_out_222061.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_222061", "222061055", "story_v_out_222061.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_222061", "222061055", "story_v_out_222061.awb")

						arg_219_1:RecordAudio("222061055", var_222_22)
						arg_219_1:RecordAudio("222061055", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_222061", "222061055", "story_v_out_222061.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_222061", "222061055", "story_v_out_222061.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_23 = math.max(var_222_14, arg_219_1.talkMaxDuration)

			if var_222_13 <= arg_219_1.time_ and arg_219_1.time_ < var_222_13 + var_222_23 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_13) / var_222_23

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_13 + var_222_23 and arg_219_1.time_ < var_222_13 + var_222_23 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play222061056 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 222061056
		arg_223_1.duration_ = 3.366

		local var_223_0 = {
			ja = 3.366,
			ko = 2.666,
			zh = 2.666
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
				arg_223_0:Play222061057(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1071ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1071ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, -1.05, -6.2)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1071ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -1.05, -6.2)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["1071ui_story"]
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 and arg_223_1.var_.characterEffect1071ui_story == nil then
				arg_223_1.var_.characterEffect1071ui_story = var_226_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_11 = 0.200000002980232

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11

				if arg_223_1.var_.characterEffect1071ui_story then
					arg_223_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 and arg_223_1.var_.characterEffect1071ui_story then
				arg_223_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_226_13 = 0

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_226_14 = 0
			local var_226_15 = 0.3

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_16 = arg_223_1:FormatText(StoryNameCfg[384].name)

				arg_223_1.leftNameTxt_.text = var_226_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_17 = arg_223_1:GetWordFromCfg(222061056)
				local var_226_18 = arg_223_1:FormatText(var_226_17.content)

				arg_223_1.text_.text = var_226_18

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_19 = 12
				local var_226_20 = utf8.len(var_226_18)
				local var_226_21 = var_226_19 <= 0 and var_226_15 or var_226_15 * (var_226_20 / var_226_19)

				if var_226_21 > 0 and var_226_15 < var_226_21 then
					arg_223_1.talkMaxDuration = var_226_21

					if var_226_21 + var_226_14 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_21 + var_226_14
					end
				end

				arg_223_1.text_.text = var_226_18
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061056", "story_v_out_222061.awb") ~= 0 then
					local var_226_22 = manager.audio:GetVoiceLength("story_v_out_222061", "222061056", "story_v_out_222061.awb") / 1000

					if var_226_22 + var_226_14 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_22 + var_226_14
					end

					if var_226_17.prefab_name ~= "" and arg_223_1.actors_[var_226_17.prefab_name] ~= nil then
						local var_226_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_17.prefab_name].transform, "story_v_out_222061", "222061056", "story_v_out_222061.awb")

						arg_223_1:RecordAudio("222061056", var_226_23)
						arg_223_1:RecordAudio("222061056", var_226_23)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_222061", "222061056", "story_v_out_222061.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_222061", "222061056", "story_v_out_222061.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_24 = math.max(var_226_15, arg_223_1.talkMaxDuration)

			if var_226_14 <= arg_223_1.time_ and arg_223_1.time_ < var_226_14 + var_226_24 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_14) / var_226_24

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_14 + var_226_24 and arg_223_1.time_ < var_226_14 + var_226_24 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play222061057 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 222061057
		arg_227_1.duration_ = 2.566

		local var_227_0 = {
			ja = 2.566,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_227_0:Play222061058(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1071ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1071ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1071ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1071ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect1071ui_story == nil then
				arg_227_1.var_.characterEffect1071ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1071ui_story then
					local var_230_13 = Mathf.Lerp(0, 0.5, var_230_12)

					arg_227_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1071ui_story.fillRatio = var_230_13
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect1071ui_story then
				local var_230_14 = 0.5

				arg_227_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1071ui_story.fillRatio = var_230_14
			end

			local var_230_15 = arg_227_1.actors_["1074ui_story"].transform
			local var_230_16 = 0

			if var_230_16 < arg_227_1.time_ and arg_227_1.time_ <= var_230_16 + arg_230_0 then
				arg_227_1.var_.moveOldPos1074ui_story = var_230_15.localPosition
			end

			local var_230_17 = 0.001

			if var_230_16 <= arg_227_1.time_ and arg_227_1.time_ < var_230_16 + var_230_17 then
				local var_230_18 = (arg_227_1.time_ - var_230_16) / var_230_17
				local var_230_19 = Vector3.New(0.7, -1.055, -6.12)

				var_230_15.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1074ui_story, var_230_19, var_230_18)

				local var_230_20 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_20.x, var_230_20.y, var_230_20.z)

				local var_230_21 = var_230_15.localEulerAngles

				var_230_21.z = 0
				var_230_21.x = 0
				var_230_15.localEulerAngles = var_230_21
			end

			if arg_227_1.time_ >= var_230_16 + var_230_17 and arg_227_1.time_ < var_230_16 + var_230_17 + arg_230_0 then
				var_230_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_230_22 = manager.ui.mainCamera.transform.position - var_230_15.position

				var_230_15.forward = Vector3.New(var_230_22.x, var_230_22.y, var_230_22.z)

				local var_230_23 = var_230_15.localEulerAngles

				var_230_23.z = 0
				var_230_23.x = 0
				var_230_15.localEulerAngles = var_230_23
			end

			local var_230_24 = arg_227_1.actors_["1074ui_story"]
			local var_230_25 = 0

			if var_230_25 < arg_227_1.time_ and arg_227_1.time_ <= var_230_25 + arg_230_0 and arg_227_1.var_.characterEffect1074ui_story == nil then
				arg_227_1.var_.characterEffect1074ui_story = var_230_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_26 = 0.200000002980232

			if var_230_25 <= arg_227_1.time_ and arg_227_1.time_ < var_230_25 + var_230_26 then
				local var_230_27 = (arg_227_1.time_ - var_230_25) / var_230_26

				if arg_227_1.var_.characterEffect1074ui_story then
					arg_227_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_25 + var_230_26 and arg_227_1.time_ < var_230_25 + var_230_26 + arg_230_0 and arg_227_1.var_.characterEffect1074ui_story then
				arg_227_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_230_28 = 0

			if var_230_28 < arg_227_1.time_ and arg_227_1.time_ <= var_230_28 + arg_230_0 then
				arg_227_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_230_29 = 0
			local var_230_30 = 0.125

			if var_230_29 < arg_227_1.time_ and arg_227_1.time_ <= var_230_29 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_31 = arg_227_1:FormatText(StoryNameCfg[410].name)

				arg_227_1.leftNameTxt_.text = var_230_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_32 = arg_227_1:GetWordFromCfg(222061057)
				local var_230_33 = arg_227_1:FormatText(var_230_32.content)

				arg_227_1.text_.text = var_230_33

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_34 = 5
				local var_230_35 = utf8.len(var_230_33)
				local var_230_36 = var_230_34 <= 0 and var_230_30 or var_230_30 * (var_230_35 / var_230_34)

				if var_230_36 > 0 and var_230_30 < var_230_36 then
					arg_227_1.talkMaxDuration = var_230_36

					if var_230_36 + var_230_29 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_36 + var_230_29
					end
				end

				arg_227_1.text_.text = var_230_33
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061057", "story_v_out_222061.awb") ~= 0 then
					local var_230_37 = manager.audio:GetVoiceLength("story_v_out_222061", "222061057", "story_v_out_222061.awb") / 1000

					if var_230_37 + var_230_29 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_37 + var_230_29
					end

					if var_230_32.prefab_name ~= "" and arg_227_1.actors_[var_230_32.prefab_name] ~= nil then
						local var_230_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_32.prefab_name].transform, "story_v_out_222061", "222061057", "story_v_out_222061.awb")

						arg_227_1:RecordAudio("222061057", var_230_38)
						arg_227_1:RecordAudio("222061057", var_230_38)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_222061", "222061057", "story_v_out_222061.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_222061", "222061057", "story_v_out_222061.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_39 = math.max(var_230_30, arg_227_1.talkMaxDuration)

			if var_230_29 <= arg_227_1.time_ and arg_227_1.time_ < var_230_29 + var_230_39 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_29) / var_230_39

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_29 + var_230_39 and arg_227_1.time_ < var_230_29 + var_230_39 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play222061058 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 222061058
		arg_231_1.duration_ = 8.866

		local var_231_0 = {
			ja = 8.866,
			ko = 5.233,
			zh = 5.233
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
				arg_231_0:Play222061059(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1071ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story == nil then
				arg_231_1.var_.characterEffect1071ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1071ui_story then
					arg_231_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1071ui_story then
				arg_231_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_234_4 = arg_231_1.actors_["1074ui_story"]
			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 and arg_231_1.var_.characterEffect1074ui_story == nil then
				arg_231_1.var_.characterEffect1074ui_story = var_234_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_6 = 0.200000002980232

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_6 then
				local var_234_7 = (arg_231_1.time_ - var_234_5) / var_234_6

				if arg_231_1.var_.characterEffect1074ui_story then
					local var_234_8 = Mathf.Lerp(0, 0.5, var_234_7)

					arg_231_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1074ui_story.fillRatio = var_234_8
				end
			end

			if arg_231_1.time_ >= var_234_5 + var_234_6 and arg_231_1.time_ < var_234_5 + var_234_6 + arg_234_0 and arg_231_1.var_.characterEffect1074ui_story then
				local var_234_9 = 0.5

				arg_231_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1074ui_story.fillRatio = var_234_9
			end

			local var_234_10 = 0
			local var_234_11 = 0.6

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_12 = arg_231_1:FormatText(StoryNameCfg[384].name)

				arg_231_1.leftNameTxt_.text = var_234_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_13 = arg_231_1:GetWordFromCfg(222061058)
				local var_234_14 = arg_231_1:FormatText(var_234_13.content)

				arg_231_1.text_.text = var_234_14

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_15 = 24
				local var_234_16 = utf8.len(var_234_14)
				local var_234_17 = var_234_15 <= 0 and var_234_11 or var_234_11 * (var_234_16 / var_234_15)

				if var_234_17 > 0 and var_234_11 < var_234_17 then
					arg_231_1.talkMaxDuration = var_234_17

					if var_234_17 + var_234_10 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_17 + var_234_10
					end
				end

				arg_231_1.text_.text = var_234_14
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061058", "story_v_out_222061.awb") ~= 0 then
					local var_234_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061058", "story_v_out_222061.awb") / 1000

					if var_234_18 + var_234_10 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_18 + var_234_10
					end

					if var_234_13.prefab_name ~= "" and arg_231_1.actors_[var_234_13.prefab_name] ~= nil then
						local var_234_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_13.prefab_name].transform, "story_v_out_222061", "222061058", "story_v_out_222061.awb")

						arg_231_1:RecordAudio("222061058", var_234_19)
						arg_231_1:RecordAudio("222061058", var_234_19)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_222061", "222061058", "story_v_out_222061.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_222061", "222061058", "story_v_out_222061.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_20 = math.max(var_234_11, arg_231_1.talkMaxDuration)

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_20 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_10) / var_234_20

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_10 + var_234_20 and arg_231_1.time_ < var_234_10 + var_234_20 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play222061059 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 222061059
		arg_235_1.duration_ = 11.533

		local var_235_0 = {
			ja = 11.533,
			ko = 7.266,
			zh = 7.3
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
				arg_235_0:Play222061060(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.775

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[384].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(222061059)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061059", "story_v_out_222061.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061059", "story_v_out_222061.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_222061", "222061059", "story_v_out_222061.awb")

						arg_235_1:RecordAudio("222061059", var_238_9)
						arg_235_1:RecordAudio("222061059", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_222061", "222061059", "story_v_out_222061.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_222061", "222061059", "story_v_out_222061.awb")
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
	Play222061060 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 222061060
		arg_239_1.duration_ = 12.766

		local var_239_0 = {
			ja = 12.766,
			ko = 3.633,
			zh = 3.633
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
				arg_239_0:Play222061061(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1074ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1074ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, 100, 0)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1074ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, 100, 0)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1071ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story == nil then
				arg_239_1.var_.characterEffect1071ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1071ui_story then
					local var_242_13 = Mathf.Lerp(0, 0.5, var_242_12)

					arg_239_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1071ui_story.fillRatio = var_242_13
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1071ui_story then
				local var_242_14 = 0.5

				arg_239_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1071ui_story.fillRatio = var_242_14
			end

			local var_242_15 = arg_239_1.actors_["1070ui_story"].transform
			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.var_.moveOldPos1070ui_story = var_242_15.localPosition
			end

			local var_242_17 = 0.001

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17
				local var_242_19 = Vector3.New(0.7, -0.95, -6.05)

				var_242_15.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1070ui_story, var_242_19, var_242_18)

				local var_242_20 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_20.x, var_242_20.y, var_242_20.z)

				local var_242_21 = var_242_15.localEulerAngles

				var_242_21.z = 0
				var_242_21.x = 0
				var_242_15.localEulerAngles = var_242_21
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 then
				var_242_15.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_242_22 = manager.ui.mainCamera.transform.position - var_242_15.position

				var_242_15.forward = Vector3.New(var_242_22.x, var_242_22.y, var_242_22.z)

				local var_242_23 = var_242_15.localEulerAngles

				var_242_23.z = 0
				var_242_23.x = 0
				var_242_15.localEulerAngles = var_242_23
			end

			local var_242_24 = arg_239_1.actors_["1070ui_story"]
			local var_242_25 = 0

			if var_242_25 < arg_239_1.time_ and arg_239_1.time_ <= var_242_25 + arg_242_0 and arg_239_1.var_.characterEffect1070ui_story == nil then
				arg_239_1.var_.characterEffect1070ui_story = var_242_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_26 = 0.200000002980232

			if var_242_25 <= arg_239_1.time_ and arg_239_1.time_ < var_242_25 + var_242_26 then
				local var_242_27 = (arg_239_1.time_ - var_242_25) / var_242_26

				if arg_239_1.var_.characterEffect1070ui_story then
					arg_239_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_25 + var_242_26 and arg_239_1.time_ < var_242_25 + var_242_26 + arg_242_0 and arg_239_1.var_.characterEffect1070ui_story then
				arg_239_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_242_28 = 0

			if var_242_28 < arg_239_1.time_ and arg_239_1.time_ <= var_242_28 + arg_242_0 then
				arg_239_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_242_29 = 0

			if var_242_29 < arg_239_1.time_ and arg_239_1.time_ <= var_242_29 + arg_242_0 then
				arg_239_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_242_30 = 0
			local var_242_31 = 0.4

			if var_242_30 < arg_239_1.time_ and arg_239_1.time_ <= var_242_30 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_32 = arg_239_1:FormatText(StoryNameCfg[318].name)

				arg_239_1.leftNameTxt_.text = var_242_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_33 = arg_239_1:GetWordFromCfg(222061060)
				local var_242_34 = arg_239_1:FormatText(var_242_33.content)

				arg_239_1.text_.text = var_242_34

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_35 = 16
				local var_242_36 = utf8.len(var_242_34)
				local var_242_37 = var_242_35 <= 0 and var_242_31 or var_242_31 * (var_242_36 / var_242_35)

				if var_242_37 > 0 and var_242_31 < var_242_37 then
					arg_239_1.talkMaxDuration = var_242_37

					if var_242_37 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_37 + var_242_30
					end
				end

				arg_239_1.text_.text = var_242_34
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061060", "story_v_out_222061.awb") ~= 0 then
					local var_242_38 = manager.audio:GetVoiceLength("story_v_out_222061", "222061060", "story_v_out_222061.awb") / 1000

					if var_242_38 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_38 + var_242_30
					end

					if var_242_33.prefab_name ~= "" and arg_239_1.actors_[var_242_33.prefab_name] ~= nil then
						local var_242_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_33.prefab_name].transform, "story_v_out_222061", "222061060", "story_v_out_222061.awb")

						arg_239_1:RecordAudio("222061060", var_242_39)
						arg_239_1:RecordAudio("222061060", var_242_39)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_222061", "222061060", "story_v_out_222061.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_222061", "222061060", "story_v_out_222061.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_40 = math.max(var_242_31, arg_239_1.talkMaxDuration)

			if var_242_30 <= arg_239_1.time_ and arg_239_1.time_ < var_242_30 + var_242_40 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_30) / var_242_40

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_30 + var_242_40 and arg_239_1.time_ < var_242_30 + var_242_40 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play222061061 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 222061061
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play222061062(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1070ui_story"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and arg_243_1.var_.characterEffect1070ui_story == nil then
				arg_243_1.var_.characterEffect1070ui_story = var_246_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_2 = 0.200000002980232

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.characterEffect1070ui_story then
					local var_246_4 = Mathf.Lerp(0, 0.5, var_246_3)

					arg_243_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_243_1.var_.characterEffect1070ui_story.fillRatio = var_246_4
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and arg_243_1.var_.characterEffect1070ui_story then
				local var_246_5 = 0.5

				arg_243_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_243_1.var_.characterEffect1070ui_story.fillRatio = var_246_5
			end

			local var_246_6 = 0
			local var_246_7 = 1.15

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_8 = arg_243_1:GetWordFromCfg(222061061)
				local var_246_9 = arg_243_1:FormatText(var_246_8.content)

				arg_243_1.text_.text = var_246_9

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_10 = 46
				local var_246_11 = utf8.len(var_246_9)
				local var_246_12 = var_246_10 <= 0 and var_246_7 or var_246_7 * (var_246_11 / var_246_10)

				if var_246_12 > 0 and var_246_7 < var_246_12 then
					arg_243_1.talkMaxDuration = var_246_12

					if var_246_12 + var_246_6 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_12 + var_246_6
					end
				end

				arg_243_1.text_.text = var_246_9
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_13 = math.max(var_246_7, arg_243_1.talkMaxDuration)

			if var_246_6 <= arg_243_1.time_ and arg_243_1.time_ < var_246_6 + var_246_13 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_6) / var_246_13

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_6 + var_246_13 and arg_243_1.time_ < var_246_6 + var_246_13 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play222061062 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 222061062
		arg_247_1.duration_ = 15

		local var_247_0 = {
			ja = 15,
			ko = 11.566,
			zh = 11.566
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play222061063(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1071ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story == nil then
				arg_247_1.var_.characterEffect1071ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1071ui_story then
					arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1071ui_story then
				arg_247_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_250_4 = 0
			local var_250_5 = 1.5

			if var_250_4 < arg_247_1.time_ and arg_247_1.time_ <= var_250_4 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_6 = arg_247_1:FormatText(StoryNameCfg[384].name)

				arg_247_1.leftNameTxt_.text = var_250_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_7 = arg_247_1:GetWordFromCfg(222061062)
				local var_250_8 = arg_247_1:FormatText(var_250_7.content)

				arg_247_1.text_.text = var_250_8

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_9 = 60
				local var_250_10 = utf8.len(var_250_8)
				local var_250_11 = var_250_9 <= 0 and var_250_5 or var_250_5 * (var_250_10 / var_250_9)

				if var_250_11 > 0 and var_250_5 < var_250_11 then
					arg_247_1.talkMaxDuration = var_250_11

					if var_250_11 + var_250_4 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_11 + var_250_4
					end
				end

				arg_247_1.text_.text = var_250_8
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061062", "story_v_out_222061.awb") ~= 0 then
					local var_250_12 = manager.audio:GetVoiceLength("story_v_out_222061", "222061062", "story_v_out_222061.awb") / 1000

					if var_250_12 + var_250_4 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_4
					end

					if var_250_7.prefab_name ~= "" and arg_247_1.actors_[var_250_7.prefab_name] ~= nil then
						local var_250_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_7.prefab_name].transform, "story_v_out_222061", "222061062", "story_v_out_222061.awb")

						arg_247_1:RecordAudio("222061062", var_250_13)
						arg_247_1:RecordAudio("222061062", var_250_13)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_222061", "222061062", "story_v_out_222061.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_222061", "222061062", "story_v_out_222061.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_14 = math.max(var_250_5, arg_247_1.talkMaxDuration)

			if var_250_4 <= arg_247_1.time_ and arg_247_1.time_ < var_250_4 + var_250_14 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_4) / var_250_14

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_4 + var_250_14 and arg_247_1.time_ < var_250_4 + var_250_14 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play222061063 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 222061063
		arg_251_1.duration_ = 2.433

		local var_251_0 = {
			ja = 2.433,
			ko = 2.133,
			zh = 2.166
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
				arg_251_0:Play222061064(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1070ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1070ui_story == nil then
				arg_251_1.var_.characterEffect1070ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1070ui_story then
					arg_251_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1070ui_story then
				arg_251_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_254_4 = arg_251_1.actors_["1071ui_story"]
			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story == nil then
				arg_251_1.var_.characterEffect1071ui_story = var_254_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_6 = 0.200000002980232

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_6 then
				local var_254_7 = (arg_251_1.time_ - var_254_5) / var_254_6

				if arg_251_1.var_.characterEffect1071ui_story then
					local var_254_8 = Mathf.Lerp(0, 0.5, var_254_7)

					arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_8
				end
			end

			if arg_251_1.time_ >= var_254_5 + var_254_6 and arg_251_1.time_ < var_254_5 + var_254_6 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story then
				local var_254_9 = 0.5

				arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_9
			end

			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 then
				arg_251_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070actionlink/1070action463")
			end

			local var_254_11 = 0

			if var_254_11 < arg_251_1.time_ and arg_251_1.time_ <= var_254_11 + arg_254_0 then
				arg_251_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_254_12 = 0
			local var_254_13 = 0.125

			if var_254_12 < arg_251_1.time_ and arg_251_1.time_ <= var_254_12 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_14 = arg_251_1:FormatText(StoryNameCfg[318].name)

				arg_251_1.leftNameTxt_.text = var_254_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_15 = arg_251_1:GetWordFromCfg(222061063)
				local var_254_16 = arg_251_1:FormatText(var_254_15.content)

				arg_251_1.text_.text = var_254_16

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_17 = 5
				local var_254_18 = utf8.len(var_254_16)
				local var_254_19 = var_254_17 <= 0 and var_254_13 or var_254_13 * (var_254_18 / var_254_17)

				if var_254_19 > 0 and var_254_13 < var_254_19 then
					arg_251_1.talkMaxDuration = var_254_19

					if var_254_19 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_19 + var_254_12
					end
				end

				arg_251_1.text_.text = var_254_16
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061063", "story_v_out_222061.awb") ~= 0 then
					local var_254_20 = manager.audio:GetVoiceLength("story_v_out_222061", "222061063", "story_v_out_222061.awb") / 1000

					if var_254_20 + var_254_12 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_20 + var_254_12
					end

					if var_254_15.prefab_name ~= "" and arg_251_1.actors_[var_254_15.prefab_name] ~= nil then
						local var_254_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_15.prefab_name].transform, "story_v_out_222061", "222061063", "story_v_out_222061.awb")

						arg_251_1:RecordAudio("222061063", var_254_21)
						arg_251_1:RecordAudio("222061063", var_254_21)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_222061", "222061063", "story_v_out_222061.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_222061", "222061063", "story_v_out_222061.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_22 = math.max(var_254_13, arg_251_1.talkMaxDuration)

			if var_254_12 <= arg_251_1.time_ and arg_251_1.time_ < var_254_12 + var_254_22 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_12) / var_254_22

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_12 + var_254_22 and arg_251_1.time_ < var_254_12 + var_254_22 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play222061064 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 222061064
		arg_255_1.duration_ = 12.4

		local var_255_0 = {
			ja = 12.4,
			ko = 6.366,
			zh = 6.366
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play222061065(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1071ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story == nil then
				arg_255_1.var_.characterEffect1071ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1071ui_story then
					arg_255_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story then
				arg_255_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_258_4 = arg_255_1.actors_["1070ui_story"]
			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 and arg_255_1.var_.characterEffect1070ui_story == nil then
				arg_255_1.var_.characterEffect1070ui_story = var_258_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_6 = 0.200000002980232

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_6 then
				local var_258_7 = (arg_255_1.time_ - var_258_5) / var_258_6

				if arg_255_1.var_.characterEffect1070ui_story then
					local var_258_8 = Mathf.Lerp(0, 0.5, var_258_7)

					arg_255_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1070ui_story.fillRatio = var_258_8
				end
			end

			if arg_255_1.time_ >= var_258_5 + var_258_6 and arg_255_1.time_ < var_258_5 + var_258_6 + arg_258_0 and arg_255_1.var_.characterEffect1070ui_story then
				local var_258_9 = 0.5

				arg_255_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1070ui_story.fillRatio = var_258_9
			end

			local var_258_10 = 0
			local var_258_11 = 0.75

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_12 = arg_255_1:FormatText(StoryNameCfg[384].name)

				arg_255_1.leftNameTxt_.text = var_258_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_13 = arg_255_1:GetWordFromCfg(222061064)
				local var_258_14 = arg_255_1:FormatText(var_258_13.content)

				arg_255_1.text_.text = var_258_14

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_15 = 30
				local var_258_16 = utf8.len(var_258_14)
				local var_258_17 = var_258_15 <= 0 and var_258_11 or var_258_11 * (var_258_16 / var_258_15)

				if var_258_17 > 0 and var_258_11 < var_258_17 then
					arg_255_1.talkMaxDuration = var_258_17

					if var_258_17 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_17 + var_258_10
					end
				end

				arg_255_1.text_.text = var_258_14
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061064", "story_v_out_222061.awb") ~= 0 then
					local var_258_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061064", "story_v_out_222061.awb") / 1000

					if var_258_18 + var_258_10 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_18 + var_258_10
					end

					if var_258_13.prefab_name ~= "" and arg_255_1.actors_[var_258_13.prefab_name] ~= nil then
						local var_258_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_13.prefab_name].transform, "story_v_out_222061", "222061064", "story_v_out_222061.awb")

						arg_255_1:RecordAudio("222061064", var_258_19)
						arg_255_1:RecordAudio("222061064", var_258_19)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_222061", "222061064", "story_v_out_222061.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_222061", "222061064", "story_v_out_222061.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_20 = math.max(var_258_11, arg_255_1.talkMaxDuration)

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_20 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_10) / var_258_20

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_10 + var_258_20 and arg_255_1.time_ < var_258_10 + var_258_20 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play222061065 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 222061065
		arg_259_1.duration_ = 3.8

		local var_259_0 = {
			ja = 3.8,
			ko = 2,
			zh = 2
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
				arg_259_0:Play222061066(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1070ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1070ui_story == nil then
				arg_259_1.var_.characterEffect1070ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1070ui_story then
					arg_259_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1070ui_story then
				arg_259_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_262_4 = arg_259_1.actors_["1071ui_story"]
			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story == nil then
				arg_259_1.var_.characterEffect1071ui_story = var_262_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_6 = 0.200000002980232

			if var_262_5 <= arg_259_1.time_ and arg_259_1.time_ < var_262_5 + var_262_6 then
				local var_262_7 = (arg_259_1.time_ - var_262_5) / var_262_6

				if arg_259_1.var_.characterEffect1071ui_story then
					local var_262_8 = Mathf.Lerp(0, 0.5, var_262_7)

					arg_259_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1071ui_story.fillRatio = var_262_8
				end
			end

			if arg_259_1.time_ >= var_262_5 + var_262_6 and arg_259_1.time_ < var_262_5 + var_262_6 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story then
				local var_262_9 = 0.5

				arg_259_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1071ui_story.fillRatio = var_262_9
			end

			local var_262_10 = 0

			if var_262_10 < arg_259_1.time_ and arg_259_1.time_ <= var_262_10 + arg_262_0 then
				arg_259_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action3_2")
			end

			local var_262_11 = 0

			if var_262_11 < arg_259_1.time_ and arg_259_1.time_ <= var_262_11 + arg_262_0 then
				arg_259_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_262_12 = 0
			local var_262_13 = 0.225

			if var_262_12 < arg_259_1.time_ and arg_259_1.time_ <= var_262_12 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_14 = arg_259_1:FormatText(StoryNameCfg[318].name)

				arg_259_1.leftNameTxt_.text = var_262_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_15 = arg_259_1:GetWordFromCfg(222061065)
				local var_262_16 = arg_259_1:FormatText(var_262_15.content)

				arg_259_1.text_.text = var_262_16

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_17 = 9
				local var_262_18 = utf8.len(var_262_16)
				local var_262_19 = var_262_17 <= 0 and var_262_13 or var_262_13 * (var_262_18 / var_262_17)

				if var_262_19 > 0 and var_262_13 < var_262_19 then
					arg_259_1.talkMaxDuration = var_262_19

					if var_262_19 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_19 + var_262_12
					end
				end

				arg_259_1.text_.text = var_262_16
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061065", "story_v_out_222061.awb") ~= 0 then
					local var_262_20 = manager.audio:GetVoiceLength("story_v_out_222061", "222061065", "story_v_out_222061.awb") / 1000

					if var_262_20 + var_262_12 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_20 + var_262_12
					end

					if var_262_15.prefab_name ~= "" and arg_259_1.actors_[var_262_15.prefab_name] ~= nil then
						local var_262_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_15.prefab_name].transform, "story_v_out_222061", "222061065", "story_v_out_222061.awb")

						arg_259_1:RecordAudio("222061065", var_262_21)
						arg_259_1:RecordAudio("222061065", var_262_21)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_222061", "222061065", "story_v_out_222061.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_222061", "222061065", "story_v_out_222061.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_22 = math.max(var_262_13, arg_259_1.talkMaxDuration)

			if var_262_12 <= arg_259_1.time_ and arg_259_1.time_ < var_262_12 + var_262_22 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_12) / var_262_22

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_12 + var_262_22 and arg_259_1.time_ < var_262_12 + var_262_22 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play222061066 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 222061066
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play222061067(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1070ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1070ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, 100, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1070ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, 100, 0)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1071ui_story"].transform
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 then
				arg_263_1.var_.moveOldPos1071ui_story = var_266_9.localPosition
			end

			local var_266_11 = 0.001

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11
				local var_266_13 = Vector3.New(0, 100, 0)

				var_266_9.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1071ui_story, var_266_13, var_266_12)

				local var_266_14 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_14.x, var_266_14.y, var_266_14.z)

				local var_266_15 = var_266_9.localEulerAngles

				var_266_15.z = 0
				var_266_15.x = 0
				var_266_9.localEulerAngles = var_266_15
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 then
				var_266_9.localPosition = Vector3.New(0, 100, 0)

				local var_266_16 = manager.ui.mainCamera.transform.position - var_266_9.position

				var_266_9.forward = Vector3.New(var_266_16.x, var_266_16.y, var_266_16.z)

				local var_266_17 = var_266_9.localEulerAngles

				var_266_17.z = 0
				var_266_17.x = 0
				var_266_9.localEulerAngles = var_266_17
			end

			local var_266_18 = 0
			local var_266_19 = 0.6

			if var_266_18 < arg_263_1.time_ and arg_263_1.time_ <= var_266_18 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_20 = arg_263_1:GetWordFromCfg(222061066)
				local var_266_21 = arg_263_1:FormatText(var_266_20.content)

				arg_263_1.text_.text = var_266_21

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_22 = 24
				local var_266_23 = utf8.len(var_266_21)
				local var_266_24 = var_266_22 <= 0 and var_266_19 or var_266_19 * (var_266_23 / var_266_22)

				if var_266_24 > 0 and var_266_19 < var_266_24 then
					arg_263_1.talkMaxDuration = var_266_24

					if var_266_24 + var_266_18 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_24 + var_266_18
					end
				end

				arg_263_1.text_.text = var_266_21
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_25 = math.max(var_266_19, arg_263_1.talkMaxDuration)

			if var_266_18 <= arg_263_1.time_ and arg_263_1.time_ < var_266_18 + var_266_25 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_18) / var_266_25

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_18 + var_266_25 and arg_263_1.time_ < var_266_18 + var_266_25 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play222061067 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 222061067
		arg_267_1.duration_ = 5.2

		local var_267_0 = {
			ja = 5.2,
			ko = 2.4,
			zh = 2.4
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play222061068(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1070ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1070ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1070ui_story, var_270_4, var_270_3)

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

			local var_270_9 = arg_267_1.actors_["1070ui_story"]
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 and arg_267_1.var_.characterEffect1070ui_story == nil then
				arg_267_1.var_.characterEffect1070ui_story = var_270_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_11 = 0.200000002980232

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11

				if arg_267_1.var_.characterEffect1070ui_story then
					local var_270_13 = Mathf.Lerp(0, 0.5, var_270_12)

					arg_267_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1070ui_story.fillRatio = var_270_13
				end
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 and arg_267_1.var_.characterEffect1070ui_story then
				local var_270_14 = 0.5

				arg_267_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1070ui_story.fillRatio = var_270_14
			end

			local var_270_15 = arg_267_1.actors_["1074ui_story"].transform
			local var_270_16 = 0

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 then
				arg_267_1.var_.moveOldPos1074ui_story = var_270_15.localPosition
			end

			local var_270_17 = 0.001

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_17 then
				local var_270_18 = (arg_267_1.time_ - var_270_16) / var_270_17
				local var_270_19 = Vector3.New(-0.7, -1.055, -6.12)

				var_270_15.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1074ui_story, var_270_19, var_270_18)

				local var_270_20 = manager.ui.mainCamera.transform.position - var_270_15.position

				var_270_15.forward = Vector3.New(var_270_20.x, var_270_20.y, var_270_20.z)

				local var_270_21 = var_270_15.localEulerAngles

				var_270_21.z = 0
				var_270_21.x = 0
				var_270_15.localEulerAngles = var_270_21
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 then
				var_270_15.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_270_22 = manager.ui.mainCamera.transform.position - var_270_15.position

				var_270_15.forward = Vector3.New(var_270_22.x, var_270_22.y, var_270_22.z)

				local var_270_23 = var_270_15.localEulerAngles

				var_270_23.z = 0
				var_270_23.x = 0
				var_270_15.localEulerAngles = var_270_23
			end

			local var_270_24 = arg_267_1.actors_["1074ui_story"]
			local var_270_25 = 0

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 and arg_267_1.var_.characterEffect1074ui_story == nil then
				arg_267_1.var_.characterEffect1074ui_story = var_270_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_26 = 0.200000002980232

			if var_270_25 <= arg_267_1.time_ and arg_267_1.time_ < var_270_25 + var_270_26 then
				local var_270_27 = (arg_267_1.time_ - var_270_25) / var_270_26

				if arg_267_1.var_.characterEffect1074ui_story then
					arg_267_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_25 + var_270_26 and arg_267_1.time_ < var_270_25 + var_270_26 + arg_270_0 and arg_267_1.var_.characterEffect1074ui_story then
				arg_267_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_270_28 = 0
			local var_270_29 = 0.25

			if var_270_28 < arg_267_1.time_ and arg_267_1.time_ <= var_270_28 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_30 = arg_267_1:FormatText(StoryNameCfg[410].name)

				arg_267_1.leftNameTxt_.text = var_270_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_31 = arg_267_1:GetWordFromCfg(222061067)
				local var_270_32 = arg_267_1:FormatText(var_270_31.content)

				arg_267_1.text_.text = var_270_32

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_33 = 10
				local var_270_34 = utf8.len(var_270_32)
				local var_270_35 = var_270_33 <= 0 and var_270_29 or var_270_29 * (var_270_34 / var_270_33)

				if var_270_35 > 0 and var_270_29 < var_270_35 then
					arg_267_1.talkMaxDuration = var_270_35

					if var_270_35 + var_270_28 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_35 + var_270_28
					end
				end

				arg_267_1.text_.text = var_270_32
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061067", "story_v_out_222061.awb") ~= 0 then
					local var_270_36 = manager.audio:GetVoiceLength("story_v_out_222061", "222061067", "story_v_out_222061.awb") / 1000

					if var_270_36 + var_270_28 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_36 + var_270_28
					end

					if var_270_31.prefab_name ~= "" and arg_267_1.actors_[var_270_31.prefab_name] ~= nil then
						local var_270_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_31.prefab_name].transform, "story_v_out_222061", "222061067", "story_v_out_222061.awb")

						arg_267_1:RecordAudio("222061067", var_270_37)
						arg_267_1:RecordAudio("222061067", var_270_37)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_222061", "222061067", "story_v_out_222061.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_222061", "222061067", "story_v_out_222061.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_38 = math.max(var_270_29, arg_267_1.talkMaxDuration)

			if var_270_28 <= arg_267_1.time_ and arg_267_1.time_ < var_270_28 + var_270_38 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_28) / var_270_38

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_28 + var_270_38 and arg_267_1.time_ < var_270_28 + var_270_38 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play222061068 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 222061068
		arg_271_1.duration_ = 11.366

		local var_271_0 = {
			ja = 11.366,
			ko = 8.266,
			zh = 8.266
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
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play222061069(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1071ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1071ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0.7, -1.05, -6.2)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1071ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = arg_271_1.actors_["1071ui_story"]
			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story == nil then
				arg_271_1.var_.characterEffect1071ui_story = var_274_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_11 = 0.200000002980232

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				local var_274_12 = (arg_271_1.time_ - var_274_10) / var_274_11

				if arg_271_1.var_.characterEffect1071ui_story then
					arg_271_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story then
				arg_271_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_274_13 = arg_271_1.actors_["1074ui_story"]
			local var_274_14 = 0

			if var_274_14 < arg_271_1.time_ and arg_271_1.time_ <= var_274_14 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story == nil then
				arg_271_1.var_.characterEffect1074ui_story = var_274_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_15 = 0.200000002980232

			if var_274_14 <= arg_271_1.time_ and arg_271_1.time_ < var_274_14 + var_274_15 then
				local var_274_16 = (arg_271_1.time_ - var_274_14) / var_274_15

				if arg_271_1.var_.characterEffect1074ui_story then
					local var_274_17 = Mathf.Lerp(0, 0.5, var_274_16)

					arg_271_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1074ui_story.fillRatio = var_274_17
				end
			end

			if arg_271_1.time_ >= var_274_14 + var_274_15 and arg_271_1.time_ < var_274_14 + var_274_15 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story then
				local var_274_18 = 0.5

				arg_271_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1074ui_story.fillRatio = var_274_18
			end

			local var_274_19 = 0
			local var_274_20 = 0.7

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_21 = arg_271_1:FormatText(StoryNameCfg[384].name)

				arg_271_1.leftNameTxt_.text = var_274_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_22 = arg_271_1:GetWordFromCfg(222061068)
				local var_274_23 = arg_271_1:FormatText(var_274_22.content)

				arg_271_1.text_.text = var_274_23

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_24 = 28
				local var_274_25 = utf8.len(var_274_23)
				local var_274_26 = var_274_24 <= 0 and var_274_20 or var_274_20 * (var_274_25 / var_274_24)

				if var_274_26 > 0 and var_274_20 < var_274_26 then
					arg_271_1.talkMaxDuration = var_274_26

					if var_274_26 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_26 + var_274_19
					end
				end

				arg_271_1.text_.text = var_274_23
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061068", "story_v_out_222061.awb") ~= 0 then
					local var_274_27 = manager.audio:GetVoiceLength("story_v_out_222061", "222061068", "story_v_out_222061.awb") / 1000

					if var_274_27 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_27 + var_274_19
					end

					if var_274_22.prefab_name ~= "" and arg_271_1.actors_[var_274_22.prefab_name] ~= nil then
						local var_274_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_22.prefab_name].transform, "story_v_out_222061", "222061068", "story_v_out_222061.awb")

						arg_271_1:RecordAudio("222061068", var_274_28)
						arg_271_1:RecordAudio("222061068", var_274_28)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_222061", "222061068", "story_v_out_222061.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_222061", "222061068", "story_v_out_222061.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_29 = math.max(var_274_20, arg_271_1.talkMaxDuration)

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_29 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_19) / var_274_29

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_19 + var_274_29 and arg_271_1.time_ < var_274_19 + var_274_29 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play222061069 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 222061069
		arg_275_1.duration_ = 9.8

		local var_275_0 = {
			ja = 9.8,
			ko = 8.366,
			zh = 8.366
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play222061070(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_278_1 = 0
			local var_278_2 = 0.8

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_3 = arg_275_1:FormatText(StoryNameCfg[384].name)

				arg_275_1.leftNameTxt_.text = var_278_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_4 = arg_275_1:GetWordFromCfg(222061069)
				local var_278_5 = arg_275_1:FormatText(var_278_4.content)

				arg_275_1.text_.text = var_278_5

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_6 = 32
				local var_278_7 = utf8.len(var_278_5)
				local var_278_8 = var_278_6 <= 0 and var_278_2 or var_278_2 * (var_278_7 / var_278_6)

				if var_278_8 > 0 and var_278_2 < var_278_8 then
					arg_275_1.talkMaxDuration = var_278_8

					if var_278_8 + var_278_1 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_1
					end
				end

				arg_275_1.text_.text = var_278_5
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061069", "story_v_out_222061.awb") ~= 0 then
					local var_278_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061069", "story_v_out_222061.awb") / 1000

					if var_278_9 + var_278_1 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_9 + var_278_1
					end

					if var_278_4.prefab_name ~= "" and arg_275_1.actors_[var_278_4.prefab_name] ~= nil then
						local var_278_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_4.prefab_name].transform, "story_v_out_222061", "222061069", "story_v_out_222061.awb")

						arg_275_1:RecordAudio("222061069", var_278_10)
						arg_275_1:RecordAudio("222061069", var_278_10)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_222061", "222061069", "story_v_out_222061.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_222061", "222061069", "story_v_out_222061.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_11 = math.max(var_278_2, arg_275_1.talkMaxDuration)

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_11 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_1) / var_278_11

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_1 + var_278_11 and arg_275_1.time_ < var_278_1 + var_278_11 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play222061070 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 222061070
		arg_279_1.duration_ = 8.2

		local var_279_0 = {
			ja = 5.9,
			ko = 8.166,
			zh = 8.2
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play222061071(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1074ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1074ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0, 100, 0)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1074ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0, 100, 0)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["1071ui_story"]
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story == nil then
				arg_279_1.var_.characterEffect1071ui_story = var_282_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_11 = 0.200000002980232

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11

				if arg_279_1.var_.characterEffect1071ui_story then
					local var_282_13 = Mathf.Lerp(0, 0.5, var_282_12)

					arg_279_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1071ui_story.fillRatio = var_282_13
				end
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story then
				local var_282_14 = 0.5

				arg_279_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1071ui_story.fillRatio = var_282_14
			end

			local var_282_15 = arg_279_1.actors_["1070ui_story"].transform
			local var_282_16 = 0

			if var_282_16 < arg_279_1.time_ and arg_279_1.time_ <= var_282_16 + arg_282_0 then
				arg_279_1.var_.moveOldPos1070ui_story = var_282_15.localPosition
			end

			local var_282_17 = 0.001

			if var_282_16 <= arg_279_1.time_ and arg_279_1.time_ < var_282_16 + var_282_17 then
				local var_282_18 = (arg_279_1.time_ - var_282_16) / var_282_17
				local var_282_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_282_15.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1070ui_story, var_282_19, var_282_18)

				local var_282_20 = manager.ui.mainCamera.transform.position - var_282_15.position

				var_282_15.forward = Vector3.New(var_282_20.x, var_282_20.y, var_282_20.z)

				local var_282_21 = var_282_15.localEulerAngles

				var_282_21.z = 0
				var_282_21.x = 0
				var_282_15.localEulerAngles = var_282_21
			end

			if arg_279_1.time_ >= var_282_16 + var_282_17 and arg_279_1.time_ < var_282_16 + var_282_17 + arg_282_0 then
				var_282_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_282_22 = manager.ui.mainCamera.transform.position - var_282_15.position

				var_282_15.forward = Vector3.New(var_282_22.x, var_282_22.y, var_282_22.z)

				local var_282_23 = var_282_15.localEulerAngles

				var_282_23.z = 0
				var_282_23.x = 0
				var_282_15.localEulerAngles = var_282_23
			end

			local var_282_24 = arg_279_1.actors_["1070ui_story"]
			local var_282_25 = 0

			if var_282_25 < arg_279_1.time_ and arg_279_1.time_ <= var_282_25 + arg_282_0 and arg_279_1.var_.characterEffect1070ui_story == nil then
				arg_279_1.var_.characterEffect1070ui_story = var_282_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_26 = 0.200000002980232

			if var_282_25 <= arg_279_1.time_ and arg_279_1.time_ < var_282_25 + var_282_26 then
				local var_282_27 = (arg_279_1.time_ - var_282_25) / var_282_26

				if arg_279_1.var_.characterEffect1070ui_story then
					arg_279_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_25 + var_282_26 and arg_279_1.time_ < var_282_25 + var_282_26 + arg_282_0 and arg_279_1.var_.characterEffect1070ui_story then
				arg_279_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_282_28 = 0
			local var_282_29 = 0.95

			if var_282_28 < arg_279_1.time_ and arg_279_1.time_ <= var_282_28 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_30 = arg_279_1:FormatText(StoryNameCfg[318].name)

				arg_279_1.leftNameTxt_.text = var_282_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_31 = arg_279_1:GetWordFromCfg(222061070)
				local var_282_32 = arg_279_1:FormatText(var_282_31.content)

				arg_279_1.text_.text = var_282_32

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_33 = 38
				local var_282_34 = utf8.len(var_282_32)
				local var_282_35 = var_282_33 <= 0 and var_282_29 or var_282_29 * (var_282_34 / var_282_33)

				if var_282_35 > 0 and var_282_29 < var_282_35 then
					arg_279_1.talkMaxDuration = var_282_35

					if var_282_35 + var_282_28 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_35 + var_282_28
					end
				end

				arg_279_1.text_.text = var_282_32
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061070", "story_v_out_222061.awb") ~= 0 then
					local var_282_36 = manager.audio:GetVoiceLength("story_v_out_222061", "222061070", "story_v_out_222061.awb") / 1000

					if var_282_36 + var_282_28 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_36 + var_282_28
					end

					if var_282_31.prefab_name ~= "" and arg_279_1.actors_[var_282_31.prefab_name] ~= nil then
						local var_282_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_31.prefab_name].transform, "story_v_out_222061", "222061070", "story_v_out_222061.awb")

						arg_279_1:RecordAudio("222061070", var_282_37)
						arg_279_1:RecordAudio("222061070", var_282_37)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_222061", "222061070", "story_v_out_222061.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_222061", "222061070", "story_v_out_222061.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_38 = math.max(var_282_29, arg_279_1.talkMaxDuration)

			if var_282_28 <= arg_279_1.time_ and arg_279_1.time_ < var_282_28 + var_282_38 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_28) / var_282_38

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_28 + var_282_38 and arg_279_1.time_ < var_282_28 + var_282_38 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play222061071 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 222061071
		arg_283_1.duration_ = 9

		local var_283_0 = {
			ja = 9,
			ko = 4.233,
			zh = 4.233
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play222061072(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_286_1 = 0
			local var_286_2 = 0.475

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_3 = arg_283_1:FormatText(StoryNameCfg[318].name)

				arg_283_1.leftNameTxt_.text = var_286_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_4 = arg_283_1:GetWordFromCfg(222061071)
				local var_286_5 = arg_283_1:FormatText(var_286_4.content)

				arg_283_1.text_.text = var_286_5

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_6 = 19
				local var_286_7 = utf8.len(var_286_5)
				local var_286_8 = var_286_6 <= 0 and var_286_2 or var_286_2 * (var_286_7 / var_286_6)

				if var_286_8 > 0 and var_286_2 < var_286_8 then
					arg_283_1.talkMaxDuration = var_286_8

					if var_286_8 + var_286_1 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_1
					end
				end

				arg_283_1.text_.text = var_286_5
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061071", "story_v_out_222061.awb") ~= 0 then
					local var_286_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061071", "story_v_out_222061.awb") / 1000

					if var_286_9 + var_286_1 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_9 + var_286_1
					end

					if var_286_4.prefab_name ~= "" and arg_283_1.actors_[var_286_4.prefab_name] ~= nil then
						local var_286_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_4.prefab_name].transform, "story_v_out_222061", "222061071", "story_v_out_222061.awb")

						arg_283_1:RecordAudio("222061071", var_286_10)
						arg_283_1:RecordAudio("222061071", var_286_10)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_222061", "222061071", "story_v_out_222061.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_222061", "222061071", "story_v_out_222061.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_11 = math.max(var_286_2, arg_283_1.talkMaxDuration)

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_11 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_1) / var_286_11

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_1 + var_286_11 and arg_283_1.time_ < var_286_1 + var_286_11 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play222061072 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 222061072
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play222061073(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1070ui_story"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos1070ui_story = var_290_0.localPosition
			end

			local var_290_2 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2
				local var_290_4 = Vector3.New(0, 100, 0)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1070ui_story, var_290_4, var_290_3)

				local var_290_5 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_5.x, var_290_5.y, var_290_5.z)

				local var_290_6 = var_290_0.localEulerAngles

				var_290_6.z = 0
				var_290_6.x = 0
				var_290_0.localEulerAngles = var_290_6
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(0, 100, 0)

				local var_290_7 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_7.x, var_290_7.y, var_290_7.z)

				local var_290_8 = var_290_0.localEulerAngles

				var_290_8.z = 0
				var_290_8.x = 0
				var_290_0.localEulerAngles = var_290_8
			end

			local var_290_9 = arg_287_1.actors_["1070ui_story"]
			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 and arg_287_1.var_.characterEffect1070ui_story == nil then
				arg_287_1.var_.characterEffect1070ui_story = var_290_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_11 = 0.200000002980232

			if var_290_10 <= arg_287_1.time_ and arg_287_1.time_ < var_290_10 + var_290_11 then
				local var_290_12 = (arg_287_1.time_ - var_290_10) / var_290_11

				if arg_287_1.var_.characterEffect1070ui_story then
					local var_290_13 = Mathf.Lerp(0, 0.5, var_290_12)

					arg_287_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1070ui_story.fillRatio = var_290_13
				end
			end

			if arg_287_1.time_ >= var_290_10 + var_290_11 and arg_287_1.time_ < var_290_10 + var_290_11 + arg_290_0 and arg_287_1.var_.characterEffect1070ui_story then
				local var_290_14 = 0.5

				arg_287_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1070ui_story.fillRatio = var_290_14
			end

			local var_290_15 = arg_287_1.actors_["1071ui_story"].transform
			local var_290_16 = 0

			if var_290_16 < arg_287_1.time_ and arg_287_1.time_ <= var_290_16 + arg_290_0 then
				arg_287_1.var_.moveOldPos1071ui_story = var_290_15.localPosition
			end

			local var_290_17 = 0.001

			if var_290_16 <= arg_287_1.time_ and arg_287_1.time_ < var_290_16 + var_290_17 then
				local var_290_18 = (arg_287_1.time_ - var_290_16) / var_290_17
				local var_290_19 = Vector3.New(0, 100, 0)

				var_290_15.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1071ui_story, var_290_19, var_290_18)

				local var_290_20 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_20.x, var_290_20.y, var_290_20.z)

				local var_290_21 = var_290_15.localEulerAngles

				var_290_21.z = 0
				var_290_21.x = 0
				var_290_15.localEulerAngles = var_290_21
			end

			if arg_287_1.time_ >= var_290_16 + var_290_17 and arg_287_1.time_ < var_290_16 + var_290_17 + arg_290_0 then
				var_290_15.localPosition = Vector3.New(0, 100, 0)

				local var_290_22 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_22.x, var_290_22.y, var_290_22.z)

				local var_290_23 = var_290_15.localEulerAngles

				var_290_23.z = 0
				var_290_23.x = 0
				var_290_15.localEulerAngles = var_290_23
			end

			local var_290_24 = arg_287_1.actors_["1071ui_story"]
			local var_290_25 = 0

			if var_290_25 < arg_287_1.time_ and arg_287_1.time_ <= var_290_25 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story == nil then
				arg_287_1.var_.characterEffect1071ui_story = var_290_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_26 = 0.200000002980232

			if var_290_25 <= arg_287_1.time_ and arg_287_1.time_ < var_290_25 + var_290_26 then
				local var_290_27 = (arg_287_1.time_ - var_290_25) / var_290_26

				if arg_287_1.var_.characterEffect1071ui_story then
					local var_290_28 = Mathf.Lerp(0, 0.5, var_290_27)

					arg_287_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1071ui_story.fillRatio = var_290_28
				end
			end

			if arg_287_1.time_ >= var_290_25 + var_290_26 and arg_287_1.time_ < var_290_25 + var_290_26 + arg_290_0 and arg_287_1.var_.characterEffect1071ui_story then
				local var_290_29 = 0.5

				arg_287_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1071ui_story.fillRatio = var_290_29
			end

			local var_290_30 = 0
			local var_290_31 = 1

			if var_290_30 < arg_287_1.time_ and arg_287_1.time_ <= var_290_30 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_32 = arg_287_1:GetWordFromCfg(222061072)
				local var_290_33 = arg_287_1:FormatText(var_290_32.content)

				arg_287_1.text_.text = var_290_33

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_34 = 40
				local var_290_35 = utf8.len(var_290_33)
				local var_290_36 = var_290_34 <= 0 and var_290_31 or var_290_31 * (var_290_35 / var_290_34)

				if var_290_36 > 0 and var_290_31 < var_290_36 then
					arg_287_1.talkMaxDuration = var_290_36

					if var_290_36 + var_290_30 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_36 + var_290_30
					end
				end

				arg_287_1.text_.text = var_290_33
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_37 = math.max(var_290_31, arg_287_1.talkMaxDuration)

			if var_290_30 <= arg_287_1.time_ and arg_287_1.time_ < var_290_30 + var_290_37 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_30) / var_290_37

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_30 + var_290_37 and arg_287_1.time_ < var_290_30 + var_290_37 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play222061073 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 222061073
		arg_291_1.duration_ = 11.9

		local var_291_0 = {
			ja = 11.9,
			ko = 3.766,
			zh = 3.766
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play222061074(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1074ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1074ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1074ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1074ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1074ui_story == nil then
				arg_291_1.var_.characterEffect1074ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1074ui_story then
					arg_291_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1074ui_story then
				arg_291_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_294_13 = arg_291_1.actors_["1071ui_story"].transform
			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1.var_.moveOldPos1071ui_story = var_294_13.localPosition
			end

			local var_294_15 = 0.001

			if var_294_14 <= arg_291_1.time_ and arg_291_1.time_ < var_294_14 + var_294_15 then
				local var_294_16 = (arg_291_1.time_ - var_294_14) / var_294_15
				local var_294_17 = Vector3.New(0.7, -1.05, -6.2)

				var_294_13.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1071ui_story, var_294_17, var_294_16)

				local var_294_18 = manager.ui.mainCamera.transform.position - var_294_13.position

				var_294_13.forward = Vector3.New(var_294_18.x, var_294_18.y, var_294_18.z)

				local var_294_19 = var_294_13.localEulerAngles

				var_294_19.z = 0
				var_294_19.x = 0
				var_294_13.localEulerAngles = var_294_19
			end

			if arg_291_1.time_ >= var_294_14 + var_294_15 and arg_291_1.time_ < var_294_14 + var_294_15 + arg_294_0 then
				var_294_13.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_294_20 = manager.ui.mainCamera.transform.position - var_294_13.position

				var_294_13.forward = Vector3.New(var_294_20.x, var_294_20.y, var_294_20.z)

				local var_294_21 = var_294_13.localEulerAngles

				var_294_21.z = 0
				var_294_21.x = 0
				var_294_13.localEulerAngles = var_294_21
			end

			local var_294_22 = arg_291_1.actors_["1071ui_story"]
			local var_294_23 = 0

			if var_294_23 < arg_291_1.time_ and arg_291_1.time_ <= var_294_23 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story == nil then
				arg_291_1.var_.characterEffect1071ui_story = var_294_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_24 = 0.200000002980232

			if var_294_23 <= arg_291_1.time_ and arg_291_1.time_ < var_294_23 + var_294_24 then
				local var_294_25 = (arg_291_1.time_ - var_294_23) / var_294_24

				if arg_291_1.var_.characterEffect1071ui_story then
					local var_294_26 = Mathf.Lerp(0, 0.5, var_294_25)

					arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_26
				end
			end

			if arg_291_1.time_ >= var_294_23 + var_294_24 and arg_291_1.time_ < var_294_23 + var_294_24 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story then
				local var_294_27 = 0.5

				arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_27
			end

			local var_294_28 = 0

			if var_294_28 < arg_291_1.time_ and arg_291_1.time_ <= var_294_28 + arg_294_0 then
				arg_291_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_294_29 = 0
			local var_294_30 = 0.45

			if var_294_29 < arg_291_1.time_ and arg_291_1.time_ <= var_294_29 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_31 = arg_291_1:FormatText(StoryNameCfg[410].name)

				arg_291_1.leftNameTxt_.text = var_294_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_32 = arg_291_1:GetWordFromCfg(222061073)
				local var_294_33 = arg_291_1:FormatText(var_294_32.content)

				arg_291_1.text_.text = var_294_33

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_34 = 18
				local var_294_35 = utf8.len(var_294_33)
				local var_294_36 = var_294_34 <= 0 and var_294_30 or var_294_30 * (var_294_35 / var_294_34)

				if var_294_36 > 0 and var_294_30 < var_294_36 then
					arg_291_1.talkMaxDuration = var_294_36

					if var_294_36 + var_294_29 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_36 + var_294_29
					end
				end

				arg_291_1.text_.text = var_294_33
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061073", "story_v_out_222061.awb") ~= 0 then
					local var_294_37 = manager.audio:GetVoiceLength("story_v_out_222061", "222061073", "story_v_out_222061.awb") / 1000

					if var_294_37 + var_294_29 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_37 + var_294_29
					end

					if var_294_32.prefab_name ~= "" and arg_291_1.actors_[var_294_32.prefab_name] ~= nil then
						local var_294_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_32.prefab_name].transform, "story_v_out_222061", "222061073", "story_v_out_222061.awb")

						arg_291_1:RecordAudio("222061073", var_294_38)
						arg_291_1:RecordAudio("222061073", var_294_38)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_222061", "222061073", "story_v_out_222061.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_222061", "222061073", "story_v_out_222061.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_39 = math.max(var_294_30, arg_291_1.talkMaxDuration)

			if var_294_29 <= arg_291_1.time_ and arg_291_1.time_ < var_294_29 + var_294_39 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_29) / var_294_39

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_29 + var_294_39 and arg_291_1.time_ < var_294_29 + var_294_39 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play222061074 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 222061074
		arg_295_1.duration_ = 9.066

		local var_295_0 = {
			ja = 9.066,
			ko = 4.3,
			zh = 4.3
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play222061075(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1071ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story == nil then
				arg_295_1.var_.characterEffect1071ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1071ui_story then
					arg_295_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1071ui_story then
				arg_295_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_298_4 = arg_295_1.actors_["1074ui_story"]
			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story == nil then
				arg_295_1.var_.characterEffect1074ui_story = var_298_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_6 = 0.200000002980232

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6

				if arg_295_1.var_.characterEffect1074ui_story then
					local var_298_8 = Mathf.Lerp(0, 0.5, var_298_7)

					arg_295_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1074ui_story.fillRatio = var_298_8
				end
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story then
				local var_298_9 = 0.5

				arg_295_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1074ui_story.fillRatio = var_298_9
			end

			local var_298_10 = 0
			local var_298_11 = 0.3

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_12 = arg_295_1:FormatText(StoryNameCfg[384].name)

				arg_295_1.leftNameTxt_.text = var_298_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_13 = arg_295_1:GetWordFromCfg(222061074)
				local var_298_14 = arg_295_1:FormatText(var_298_13.content)

				arg_295_1.text_.text = var_298_14

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_15 = 12
				local var_298_16 = utf8.len(var_298_14)
				local var_298_17 = var_298_15 <= 0 and var_298_11 or var_298_11 * (var_298_16 / var_298_15)

				if var_298_17 > 0 and var_298_11 < var_298_17 then
					arg_295_1.talkMaxDuration = var_298_17

					if var_298_17 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_17 + var_298_10
					end
				end

				arg_295_1.text_.text = var_298_14
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061074", "story_v_out_222061.awb") ~= 0 then
					local var_298_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061074", "story_v_out_222061.awb") / 1000

					if var_298_18 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_10
					end

					if var_298_13.prefab_name ~= "" and arg_295_1.actors_[var_298_13.prefab_name] ~= nil then
						local var_298_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_13.prefab_name].transform, "story_v_out_222061", "222061074", "story_v_out_222061.awb")

						arg_295_1:RecordAudio("222061074", var_298_19)
						arg_295_1:RecordAudio("222061074", var_298_19)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_222061", "222061074", "story_v_out_222061.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_222061", "222061074", "story_v_out_222061.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_20 = math.max(var_298_11, arg_295_1.talkMaxDuration)

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_20 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_10) / var_298_20

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_10 + var_298_20 and arg_295_1.time_ < var_298_10 + var_298_20 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play222061075 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 222061075
		arg_299_1.duration_ = 7.133

		local var_299_0 = {
			ja = 7.033,
			ko = 7.1,
			zh = 7.133
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play222061076(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.7

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[384].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(222061075)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 28
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061075", "story_v_out_222061.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061075", "story_v_out_222061.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_222061", "222061075", "story_v_out_222061.awb")

						arg_299_1:RecordAudio("222061075", var_302_9)
						arg_299_1:RecordAudio("222061075", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_222061", "222061075", "story_v_out_222061.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_222061", "222061075", "story_v_out_222061.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play222061076 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 222061076
		arg_303_1.duration_ = 2.6

		local var_303_0 = {
			ja = 2.6,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play222061077(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1074ui_story"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1074ui_story = var_306_0.localPosition
			end

			local var_306_2 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2
				local var_306_4 = Vector3.New(0, 100, 0)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1074ui_story, var_306_4, var_306_3)

				local var_306_5 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_5.x, var_306_5.y, var_306_5.z)

				local var_306_6 = var_306_0.localEulerAngles

				var_306_6.z = 0
				var_306_6.x = 0
				var_306_0.localEulerAngles = var_306_6
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, 100, 0)

				local var_306_7 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_7.x, var_306_7.y, var_306_7.z)

				local var_306_8 = var_306_0.localEulerAngles

				var_306_8.z = 0
				var_306_8.x = 0
				var_306_0.localEulerAngles = var_306_8
			end

			local var_306_9 = arg_303_1.actors_["1071ui_story"]
			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story == nil then
				arg_303_1.var_.characterEffect1071ui_story = var_306_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_11 = 0.200000002980232

			if var_306_10 <= arg_303_1.time_ and arg_303_1.time_ < var_306_10 + var_306_11 then
				local var_306_12 = (arg_303_1.time_ - var_306_10) / var_306_11

				if arg_303_1.var_.characterEffect1071ui_story then
					local var_306_13 = Mathf.Lerp(0, 0.5, var_306_12)

					arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_13
				end
			end

			if arg_303_1.time_ >= var_306_10 + var_306_11 and arg_303_1.time_ < var_306_10 + var_306_11 + arg_306_0 and arg_303_1.var_.characterEffect1071ui_story then
				local var_306_14 = 0.5

				arg_303_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1071ui_story.fillRatio = var_306_14
			end

			local var_306_15 = arg_303_1.actors_["1070ui_story"].transform
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.var_.moveOldPos1070ui_story = var_306_15.localPosition
			end

			local var_306_17 = 0.001

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Vector3.New(-0.7, -0.95, -6.05)

				var_306_15.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1070ui_story, var_306_19, var_306_18)

				local var_306_20 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_20.x, var_306_20.y, var_306_20.z)

				local var_306_21 = var_306_15.localEulerAngles

				var_306_21.z = 0
				var_306_21.x = 0
				var_306_15.localEulerAngles = var_306_21
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				var_306_15.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_306_22 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_22.x, var_306_22.y, var_306_22.z)

				local var_306_23 = var_306_15.localEulerAngles

				var_306_23.z = 0
				var_306_23.x = 0
				var_306_15.localEulerAngles = var_306_23
			end

			local var_306_24 = 0

			if var_306_24 < arg_303_1.time_ and arg_303_1.time_ <= var_306_24 + arg_306_0 then
				arg_303_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_2")
			end

			local var_306_25 = 0

			if var_306_25 < arg_303_1.time_ and arg_303_1.time_ <= var_306_25 + arg_306_0 then
				arg_303_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_306_26 = arg_303_1.actors_["1070ui_story"]
			local var_306_27 = 0

			if var_306_27 < arg_303_1.time_ and arg_303_1.time_ <= var_306_27 + arg_306_0 and arg_303_1.var_.characterEffect1070ui_story == nil then
				arg_303_1.var_.characterEffect1070ui_story = var_306_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_28 = 0.200000002980232

			if var_306_27 <= arg_303_1.time_ and arg_303_1.time_ < var_306_27 + var_306_28 then
				local var_306_29 = (arg_303_1.time_ - var_306_27) / var_306_28

				if arg_303_1.var_.characterEffect1070ui_story then
					arg_303_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_27 + var_306_28 and arg_303_1.time_ < var_306_27 + var_306_28 + arg_306_0 and arg_303_1.var_.characterEffect1070ui_story then
				arg_303_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_306_30 = 0
			local var_306_31 = 0.175

			if var_306_30 < arg_303_1.time_ and arg_303_1.time_ <= var_306_30 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_32 = arg_303_1:FormatText(StoryNameCfg[318].name)

				arg_303_1.leftNameTxt_.text = var_306_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_33 = arg_303_1:GetWordFromCfg(222061076)
				local var_306_34 = arg_303_1:FormatText(var_306_33.content)

				arg_303_1.text_.text = var_306_34

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_35 = 7
				local var_306_36 = utf8.len(var_306_34)
				local var_306_37 = var_306_35 <= 0 and var_306_31 or var_306_31 * (var_306_36 / var_306_35)

				if var_306_37 > 0 and var_306_31 < var_306_37 then
					arg_303_1.talkMaxDuration = var_306_37

					if var_306_37 + var_306_30 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_37 + var_306_30
					end
				end

				arg_303_1.text_.text = var_306_34
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061076", "story_v_out_222061.awb") ~= 0 then
					local var_306_38 = manager.audio:GetVoiceLength("story_v_out_222061", "222061076", "story_v_out_222061.awb") / 1000

					if var_306_38 + var_306_30 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_38 + var_306_30
					end

					if var_306_33.prefab_name ~= "" and arg_303_1.actors_[var_306_33.prefab_name] ~= nil then
						local var_306_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_33.prefab_name].transform, "story_v_out_222061", "222061076", "story_v_out_222061.awb")

						arg_303_1:RecordAudio("222061076", var_306_39)
						arg_303_1:RecordAudio("222061076", var_306_39)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_222061", "222061076", "story_v_out_222061.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_222061", "222061076", "story_v_out_222061.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_40 = math.max(var_306_31, arg_303_1.talkMaxDuration)

			if var_306_30 <= arg_303_1.time_ and arg_303_1.time_ < var_306_30 + var_306_40 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_30) / var_306_40

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_30 + var_306_40 and arg_303_1.time_ < var_306_30 + var_306_40 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play222061077 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 222061077
		arg_307_1.duration_ = 6.333

		local var_307_0 = {
			ja = 6.333,
			ko = 6.3,
			zh = 6.3
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
				arg_307_0:Play222061078(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1071ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story == nil then
				arg_307_1.var_.characterEffect1071ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1071ui_story then
					arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1071ui_story then
				arg_307_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_310_4 = arg_307_1.actors_["1070ui_story"]
			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 and arg_307_1.var_.characterEffect1070ui_story == nil then
				arg_307_1.var_.characterEffect1070ui_story = var_310_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_6 = 0.200000002980232

			if var_310_5 <= arg_307_1.time_ and arg_307_1.time_ < var_310_5 + var_310_6 then
				local var_310_7 = (arg_307_1.time_ - var_310_5) / var_310_6

				if arg_307_1.var_.characterEffect1070ui_story then
					local var_310_8 = Mathf.Lerp(0, 0.5, var_310_7)

					arg_307_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1070ui_story.fillRatio = var_310_8
				end
			end

			if arg_307_1.time_ >= var_310_5 + var_310_6 and arg_307_1.time_ < var_310_5 + var_310_6 + arg_310_0 and arg_307_1.var_.characterEffect1070ui_story then
				local var_310_9 = 0.5

				arg_307_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1070ui_story.fillRatio = var_310_9
			end

			local var_310_10 = 0
			local var_310_11 = 0.525

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_12 = arg_307_1:FormatText(StoryNameCfg[384].name)

				arg_307_1.leftNameTxt_.text = var_310_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_13 = arg_307_1:GetWordFromCfg(222061077)
				local var_310_14 = arg_307_1:FormatText(var_310_13.content)

				arg_307_1.text_.text = var_310_14

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_15 = 21
				local var_310_16 = utf8.len(var_310_14)
				local var_310_17 = var_310_15 <= 0 and var_310_11 or var_310_11 * (var_310_16 / var_310_15)

				if var_310_17 > 0 and var_310_11 < var_310_17 then
					arg_307_1.talkMaxDuration = var_310_17

					if var_310_17 + var_310_10 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_17 + var_310_10
					end
				end

				arg_307_1.text_.text = var_310_14
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061077", "story_v_out_222061.awb") ~= 0 then
					local var_310_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061077", "story_v_out_222061.awb") / 1000

					if var_310_18 + var_310_10 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_18 + var_310_10
					end

					if var_310_13.prefab_name ~= "" and arg_307_1.actors_[var_310_13.prefab_name] ~= nil then
						local var_310_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_13.prefab_name].transform, "story_v_out_222061", "222061077", "story_v_out_222061.awb")

						arg_307_1:RecordAudio("222061077", var_310_19)
						arg_307_1:RecordAudio("222061077", var_310_19)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_222061", "222061077", "story_v_out_222061.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_222061", "222061077", "story_v_out_222061.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_20 = math.max(var_310_11, arg_307_1.talkMaxDuration)

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_20 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_10) / var_310_20

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_10 + var_310_20 and arg_307_1.time_ < var_310_10 + var_310_20 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play222061078 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 222061078
		arg_311_1.duration_ = 12.833

		local var_311_0 = {
			ja = 12.833,
			ko = 6.466,
			zh = 6.5
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play222061079(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.725

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[384].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(222061078)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 29
				local var_314_6 = utf8.len(var_314_4)
				local var_314_7 = var_314_5 <= 0 and var_314_1 or var_314_1 * (var_314_6 / var_314_5)

				if var_314_7 > 0 and var_314_1 < var_314_7 then
					arg_311_1.talkMaxDuration = var_314_7

					if var_314_7 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_7 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_4
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061078", "story_v_out_222061.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061078", "story_v_out_222061.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_222061", "222061078", "story_v_out_222061.awb")

						arg_311_1:RecordAudio("222061078", var_314_9)
						arg_311_1:RecordAudio("222061078", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_222061", "222061078", "story_v_out_222061.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_222061", "222061078", "story_v_out_222061.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_10 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_10 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_10

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_10 and arg_311_1.time_ < var_314_0 + var_314_10 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play222061079 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 222061079
		arg_315_1.duration_ = 4.666

		local var_315_0 = {
			ja = 4.666,
			ko = 3.433,
			zh = 3.433
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
				arg_315_0:Play222061080(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1074ui_story"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos1074ui_story = var_318_0.localPosition
			end

			local var_318_2 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2
				local var_318_4 = Vector3.New(0, 100, 0)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1074ui_story, var_318_4, var_318_3)

				local var_318_5 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_5.x, var_318_5.y, var_318_5.z)

				local var_318_6 = var_318_0.localEulerAngles

				var_318_6.z = 0
				var_318_6.x = 0
				var_318_0.localEulerAngles = var_318_6
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(0, 100, 0)

				local var_318_7 = manager.ui.mainCamera.transform.position - var_318_0.position

				var_318_0.forward = Vector3.New(var_318_7.x, var_318_7.y, var_318_7.z)

				local var_318_8 = var_318_0.localEulerAngles

				var_318_8.z = 0
				var_318_8.x = 0
				var_318_0.localEulerAngles = var_318_8
			end

			local var_318_9 = arg_315_1.actors_["1070ui_story"]
			local var_318_10 = 0

			if var_318_10 < arg_315_1.time_ and arg_315_1.time_ <= var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect1070ui_story == nil then
				arg_315_1.var_.characterEffect1070ui_story = var_318_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_11 = 0.200000002980232

			if var_318_10 <= arg_315_1.time_ and arg_315_1.time_ < var_318_10 + var_318_11 then
				local var_318_12 = (arg_315_1.time_ - var_318_10) / var_318_11

				if arg_315_1.var_.characterEffect1070ui_story then
					arg_315_1.var_.characterEffect1070ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_10 + var_318_11 and arg_315_1.time_ < var_318_10 + var_318_11 + arg_318_0 and arg_315_1.var_.characterEffect1070ui_story then
				arg_315_1.var_.characterEffect1070ui_story.fillFlat = false
			end

			local var_318_13 = arg_315_1.actors_["1070ui_story"].transform
			local var_318_14 = 0

			if var_318_14 < arg_315_1.time_ and arg_315_1.time_ <= var_318_14 + arg_318_0 then
				arg_315_1.var_.moveOldPos1070ui_story = var_318_13.localPosition
			end

			local var_318_15 = 0.001

			if var_318_14 <= arg_315_1.time_ and arg_315_1.time_ < var_318_14 + var_318_15 then
				local var_318_16 = (arg_315_1.time_ - var_318_14) / var_318_15
				local var_318_17 = Vector3.New(-0.7, -0.95, -6.05)

				var_318_13.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1070ui_story, var_318_17, var_318_16)

				local var_318_18 = manager.ui.mainCamera.transform.position - var_318_13.position

				var_318_13.forward = Vector3.New(var_318_18.x, var_318_18.y, var_318_18.z)

				local var_318_19 = var_318_13.localEulerAngles

				var_318_19.z = 0
				var_318_19.x = 0
				var_318_13.localEulerAngles = var_318_19
			end

			if arg_315_1.time_ >= var_318_14 + var_318_15 and arg_315_1.time_ < var_318_14 + var_318_15 + arg_318_0 then
				var_318_13.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_318_20 = manager.ui.mainCamera.transform.position - var_318_13.position

				var_318_13.forward = Vector3.New(var_318_20.x, var_318_20.y, var_318_20.z)

				local var_318_21 = var_318_13.localEulerAngles

				var_318_21.z = 0
				var_318_21.x = 0
				var_318_13.localEulerAngles = var_318_21
			end

			local var_318_22 = arg_315_1.actors_["1071ui_story"]
			local var_318_23 = 0

			if var_318_23 < arg_315_1.time_ and arg_315_1.time_ <= var_318_23 + arg_318_0 and arg_315_1.var_.characterEffect1071ui_story == nil then
				arg_315_1.var_.characterEffect1071ui_story = var_318_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_24 = 0.200000002980232

			if var_318_23 <= arg_315_1.time_ and arg_315_1.time_ < var_318_23 + var_318_24 then
				local var_318_25 = (arg_315_1.time_ - var_318_23) / var_318_24

				if arg_315_1.var_.characterEffect1071ui_story then
					local var_318_26 = Mathf.Lerp(0, 0.5, var_318_25)

					arg_315_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1071ui_story.fillRatio = var_318_26
				end
			end

			if arg_315_1.time_ >= var_318_23 + var_318_24 and arg_315_1.time_ < var_318_23 + var_318_24 + arg_318_0 and arg_315_1.var_.characterEffect1071ui_story then
				local var_318_27 = 0.5

				arg_315_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1071ui_story.fillRatio = var_318_27
			end

			local var_318_28 = 0

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/story1070/story1070action/1070action6_1")
			end

			local var_318_29 = 0

			if var_318_29 < arg_315_1.time_ and arg_315_1.time_ <= var_318_29 + arg_318_0 then
				arg_315_1:PlayTimeline("1070ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_318_30 = 0
			local var_318_31 = 0.425

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_32 = arg_315_1:FormatText(StoryNameCfg[318].name)

				arg_315_1.leftNameTxt_.text = var_318_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_33 = arg_315_1:GetWordFromCfg(222061079)
				local var_318_34 = arg_315_1:FormatText(var_318_33.content)

				arg_315_1.text_.text = var_318_34

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_35 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061079", "story_v_out_222061.awb") ~= 0 then
					local var_318_38 = manager.audio:GetVoiceLength("story_v_out_222061", "222061079", "story_v_out_222061.awb") / 1000

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end

					if var_318_33.prefab_name ~= "" and arg_315_1.actors_[var_318_33.prefab_name] ~= nil then
						local var_318_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_33.prefab_name].transform, "story_v_out_222061", "222061079", "story_v_out_222061.awb")

						arg_315_1:RecordAudio("222061079", var_318_39)
						arg_315_1:RecordAudio("222061079", var_318_39)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_222061", "222061079", "story_v_out_222061.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_222061", "222061079", "story_v_out_222061.awb")
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
	Play222061080 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 222061080
		arg_319_1.duration_ = 12.2

		local var_319_0 = {
			ja = 12.2,
			ko = 9.966,
			zh = 9.966
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
				arg_319_0:Play222061081(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1071ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story == nil then
				arg_319_1.var_.characterEffect1071ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.200000002980232

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1071ui_story then
					arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1071ui_story then
				arg_319_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_322_4 = arg_319_1.actors_["1070ui_story"]
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 and arg_319_1.var_.characterEffect1070ui_story == nil then
				arg_319_1.var_.characterEffect1070ui_story = var_322_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_6 = 0.200000002980232

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6

				if arg_319_1.var_.characterEffect1070ui_story then
					local var_322_8 = Mathf.Lerp(0, 0.5, var_322_7)

					arg_319_1.var_.characterEffect1070ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1070ui_story.fillRatio = var_322_8
				end
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 and arg_319_1.var_.characterEffect1070ui_story then
				local var_322_9 = 0.5

				arg_319_1.var_.characterEffect1070ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1070ui_story.fillRatio = var_322_9
			end

			local var_322_10 = 0
			local var_322_11 = 0.725

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_12 = arg_319_1:FormatText(StoryNameCfg[384].name)

				arg_319_1.leftNameTxt_.text = var_322_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_13 = arg_319_1:GetWordFromCfg(222061080)
				local var_322_14 = arg_319_1:FormatText(var_322_13.content)

				arg_319_1.text_.text = var_322_14

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_15 = 29
				local var_322_16 = utf8.len(var_322_14)
				local var_322_17 = var_322_15 <= 0 and var_322_11 or var_322_11 * (var_322_16 / var_322_15)

				if var_322_17 > 0 and var_322_11 < var_322_17 then
					arg_319_1.talkMaxDuration = var_322_17

					if var_322_17 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_17 + var_322_10
					end
				end

				arg_319_1.text_.text = var_322_14
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061080", "story_v_out_222061.awb") ~= 0 then
					local var_322_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061080", "story_v_out_222061.awb") / 1000

					if var_322_18 + var_322_10 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_18 + var_322_10
					end

					if var_322_13.prefab_name ~= "" and arg_319_1.actors_[var_322_13.prefab_name] ~= nil then
						local var_322_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_13.prefab_name].transform, "story_v_out_222061", "222061080", "story_v_out_222061.awb")

						arg_319_1:RecordAudio("222061080", var_322_19)
						arg_319_1:RecordAudio("222061080", var_322_19)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_222061", "222061080", "story_v_out_222061.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_222061", "222061080", "story_v_out_222061.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_20 = math.max(var_322_11, arg_319_1.talkMaxDuration)

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_20 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_10) / var_322_20

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_10 + var_322_20 and arg_319_1.time_ < var_322_10 + var_322_20 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play222061081 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 222061081
		arg_323_1.duration_ = 18.633

		local var_323_0 = {
			ja = 18.633,
			ko = 13.366,
			zh = 13.366
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
				arg_323_0:Play222061082(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_326_1 = 0
			local var_326_2 = 1.4

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_3 = arg_323_1:FormatText(StoryNameCfg[384].name)

				arg_323_1.leftNameTxt_.text = var_326_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_4 = arg_323_1:GetWordFromCfg(222061081)
				local var_326_5 = arg_323_1:FormatText(var_326_4.content)

				arg_323_1.text_.text = var_326_5

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_6 = 56
				local var_326_7 = utf8.len(var_326_5)
				local var_326_8 = var_326_6 <= 0 and var_326_2 or var_326_2 * (var_326_7 / var_326_6)

				if var_326_8 > 0 and var_326_2 < var_326_8 then
					arg_323_1.talkMaxDuration = var_326_8

					if var_326_8 + var_326_1 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_8 + var_326_1
					end
				end

				arg_323_1.text_.text = var_326_5
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061081", "story_v_out_222061.awb") ~= 0 then
					local var_326_9 = manager.audio:GetVoiceLength("story_v_out_222061", "222061081", "story_v_out_222061.awb") / 1000

					if var_326_9 + var_326_1 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_9 + var_326_1
					end

					if var_326_4.prefab_name ~= "" and arg_323_1.actors_[var_326_4.prefab_name] ~= nil then
						local var_326_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_4.prefab_name].transform, "story_v_out_222061", "222061081", "story_v_out_222061.awb")

						arg_323_1:RecordAudio("222061081", var_326_10)
						arg_323_1:RecordAudio("222061081", var_326_10)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_222061", "222061081", "story_v_out_222061.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_222061", "222061081", "story_v_out_222061.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_11 = math.max(var_326_2, arg_323_1.talkMaxDuration)

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_11 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_1) / var_326_11

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_1 + var_326_11 and arg_323_1.time_ < var_326_1 + var_326_11 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play222061082 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 222061082
		arg_327_1.duration_ = 12.3

		local var_327_0 = {
			ja = 11.933,
			ko = 12.3,
			zh = 12.3
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
				arg_327_0:Play222061083(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 1.225

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_2 = arg_327_1:FormatText(StoryNameCfg[384].name)

				arg_327_1.leftNameTxt_.text = var_330_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_3 = arg_327_1:GetWordFromCfg(222061082)
				local var_330_4 = arg_327_1:FormatText(var_330_3.content)

				arg_327_1.text_.text = var_330_4

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061082", "story_v_out_222061.awb") ~= 0 then
					local var_330_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061082", "story_v_out_222061.awb") / 1000

					if var_330_8 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_8 + var_330_0
					end

					if var_330_3.prefab_name ~= "" and arg_327_1.actors_[var_330_3.prefab_name] ~= nil then
						local var_330_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_3.prefab_name].transform, "story_v_out_222061", "222061082", "story_v_out_222061.awb")

						arg_327_1:RecordAudio("222061082", var_330_9)
						arg_327_1:RecordAudio("222061082", var_330_9)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_222061", "222061082", "story_v_out_222061.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_222061", "222061082", "story_v_out_222061.awb")
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
	Play222061083 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 222061083
		arg_331_1.duration_ = 10.3

		local var_331_0 = {
			ja = 10.3,
			ko = 3.533,
			zh = 3.5
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
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play222061084(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1074ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1074ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1074ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = arg_331_1.actors_["1074ui_story"]
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story == nil then
				arg_331_1.var_.characterEffect1074ui_story = var_334_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_11 = 0.200000002980232

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / var_334_11

				if arg_331_1.var_.characterEffect1074ui_story then
					arg_331_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story then
				arg_331_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_334_13 = arg_331_1.actors_["1070ui_story"].transform
			local var_334_14 = 0

			if var_334_14 < arg_331_1.time_ and arg_331_1.time_ <= var_334_14 + arg_334_0 then
				arg_331_1.var_.moveOldPos1070ui_story = var_334_13.localPosition
			end

			local var_334_15 = 0.001

			if var_334_14 <= arg_331_1.time_ and arg_331_1.time_ < var_334_14 + var_334_15 then
				local var_334_16 = (arg_331_1.time_ - var_334_14) / var_334_15
				local var_334_17 = Vector3.New(0, 100, 0)

				var_334_13.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1070ui_story, var_334_17, var_334_16)

				local var_334_18 = manager.ui.mainCamera.transform.position - var_334_13.position

				var_334_13.forward = Vector3.New(var_334_18.x, var_334_18.y, var_334_18.z)

				local var_334_19 = var_334_13.localEulerAngles

				var_334_19.z = 0
				var_334_19.x = 0
				var_334_13.localEulerAngles = var_334_19
			end

			if arg_331_1.time_ >= var_334_14 + var_334_15 and arg_331_1.time_ < var_334_14 + var_334_15 + arg_334_0 then
				var_334_13.localPosition = Vector3.New(0, 100, 0)

				local var_334_20 = manager.ui.mainCamera.transform.position - var_334_13.position

				var_334_13.forward = Vector3.New(var_334_20.x, var_334_20.y, var_334_20.z)

				local var_334_21 = var_334_13.localEulerAngles

				var_334_21.z = 0
				var_334_21.x = 0
				var_334_13.localEulerAngles = var_334_21
			end

			local var_334_22 = arg_331_1.actors_["1071ui_story"]
			local var_334_23 = 0

			if var_334_23 < arg_331_1.time_ and arg_331_1.time_ <= var_334_23 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story == nil then
				arg_331_1.var_.characterEffect1071ui_story = var_334_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_24 = 0.200000002980232

			if var_334_23 <= arg_331_1.time_ and arg_331_1.time_ < var_334_23 + var_334_24 then
				local var_334_25 = (arg_331_1.time_ - var_334_23) / var_334_24

				if arg_331_1.var_.characterEffect1071ui_story then
					local var_334_26 = Mathf.Lerp(0, 0.5, var_334_25)

					arg_331_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1071ui_story.fillRatio = var_334_26
				end
			end

			if arg_331_1.time_ >= var_334_23 + var_334_24 and arg_331_1.time_ < var_334_23 + var_334_24 + arg_334_0 and arg_331_1.var_.characterEffect1071ui_story then
				local var_334_27 = 0.5

				arg_331_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1071ui_story.fillRatio = var_334_27
			end

			local var_334_28 = 0
			local var_334_29 = 0.45

			if var_334_28 < arg_331_1.time_ and arg_331_1.time_ <= var_334_28 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_30 = arg_331_1:FormatText(StoryNameCfg[410].name)

				arg_331_1.leftNameTxt_.text = var_334_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_31 = arg_331_1:GetWordFromCfg(222061083)
				local var_334_32 = arg_331_1:FormatText(var_334_31.content)

				arg_331_1.text_.text = var_334_32

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_33 = 18
				local var_334_34 = utf8.len(var_334_32)
				local var_334_35 = var_334_33 <= 0 and var_334_29 or var_334_29 * (var_334_34 / var_334_33)

				if var_334_35 > 0 and var_334_29 < var_334_35 then
					arg_331_1.talkMaxDuration = var_334_35

					if var_334_35 + var_334_28 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_35 + var_334_28
					end
				end

				arg_331_1.text_.text = var_334_32
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061083", "story_v_out_222061.awb") ~= 0 then
					local var_334_36 = manager.audio:GetVoiceLength("story_v_out_222061", "222061083", "story_v_out_222061.awb") / 1000

					if var_334_36 + var_334_28 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_36 + var_334_28
					end

					if var_334_31.prefab_name ~= "" and arg_331_1.actors_[var_334_31.prefab_name] ~= nil then
						local var_334_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_31.prefab_name].transform, "story_v_out_222061", "222061083", "story_v_out_222061.awb")

						arg_331_1:RecordAudio("222061083", var_334_37)
						arg_331_1:RecordAudio("222061083", var_334_37)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_222061", "222061083", "story_v_out_222061.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_222061", "222061083", "story_v_out_222061.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_38 = math.max(var_334_29, arg_331_1.talkMaxDuration)

			if var_334_28 <= arg_331_1.time_ and arg_331_1.time_ < var_334_28 + var_334_38 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_28) / var_334_38

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_28 + var_334_38 and arg_331_1.time_ < var_334_28 + var_334_38 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play222061084 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 222061084
		arg_335_1.duration_ = 15.266

		local var_335_0 = {
			ja = 15.266,
			ko = 11.5,
			zh = 11.5
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
				arg_335_0:Play222061085(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1074ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story == nil then
				arg_335_1.var_.characterEffect1074ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.200000002980232

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1074ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1074ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1074ui_story.fillRatio = var_338_5
			end

			local var_338_6 = arg_335_1.actors_["1071ui_story"]
			local var_338_7 = 0

			if var_338_7 < arg_335_1.time_ and arg_335_1.time_ <= var_338_7 + arg_338_0 and arg_335_1.var_.characterEffect1071ui_story == nil then
				arg_335_1.var_.characterEffect1071ui_story = var_338_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_8 = 0.200000002980232

			if var_338_7 <= arg_335_1.time_ and arg_335_1.time_ < var_338_7 + var_338_8 then
				local var_338_9 = (arg_335_1.time_ - var_338_7) / var_338_8

				if arg_335_1.var_.characterEffect1071ui_story then
					arg_335_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_7 + var_338_8 and arg_335_1.time_ < var_338_7 + var_338_8 + arg_338_0 and arg_335_1.var_.characterEffect1071ui_story then
				arg_335_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_338_10 = 0
			local var_338_11 = 1.2

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_12 = arg_335_1:FormatText(StoryNameCfg[384].name)

				arg_335_1.leftNameTxt_.text = var_338_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_13 = arg_335_1:GetWordFromCfg(222061084)
				local var_338_14 = arg_335_1:FormatText(var_338_13.content)

				arg_335_1.text_.text = var_338_14

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_15 = 48
				local var_338_16 = utf8.len(var_338_14)
				local var_338_17 = var_338_15 <= 0 and var_338_11 or var_338_11 * (var_338_16 / var_338_15)

				if var_338_17 > 0 and var_338_11 < var_338_17 then
					arg_335_1.talkMaxDuration = var_338_17

					if var_338_17 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_17 + var_338_10
					end
				end

				arg_335_1.text_.text = var_338_14
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061084", "story_v_out_222061.awb") ~= 0 then
					local var_338_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061084", "story_v_out_222061.awb") / 1000

					if var_338_18 + var_338_10 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_18 + var_338_10
					end

					if var_338_13.prefab_name ~= "" and arg_335_1.actors_[var_338_13.prefab_name] ~= nil then
						local var_338_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_13.prefab_name].transform, "story_v_out_222061", "222061084", "story_v_out_222061.awb")

						arg_335_1:RecordAudio("222061084", var_338_19)
						arg_335_1:RecordAudio("222061084", var_338_19)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_222061", "222061084", "story_v_out_222061.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_222061", "222061084", "story_v_out_222061.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_20 = math.max(var_338_11, arg_335_1.talkMaxDuration)

			if var_338_10 <= arg_335_1.time_ and arg_335_1.time_ < var_338_10 + var_338_20 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_10) / var_338_20

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_10 + var_338_20 and arg_335_1.time_ < var_338_10 + var_338_20 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play222061085 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 222061085
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play222061086(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1071ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1071ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, 100, 0)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1071ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, 100, 0)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1071ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story == nil then
				arg_339_1.var_.characterEffect1071ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1071ui_story then
					local var_342_13 = Mathf.Lerp(0, 0.5, var_342_12)

					arg_339_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1071ui_story.fillRatio = var_342_13
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1071ui_story then
				local var_342_14 = 0.5

				arg_339_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1071ui_story.fillRatio = var_342_14
			end

			local var_342_15 = arg_339_1.actors_["1074ui_story"].transform
			local var_342_16 = 0

			if var_342_16 < arg_339_1.time_ and arg_339_1.time_ <= var_342_16 + arg_342_0 then
				arg_339_1.var_.moveOldPos1074ui_story = var_342_15.localPosition
			end

			local var_342_17 = 0.001

			if var_342_16 <= arg_339_1.time_ and arg_339_1.time_ < var_342_16 + var_342_17 then
				local var_342_18 = (arg_339_1.time_ - var_342_16) / var_342_17
				local var_342_19 = Vector3.New(0, 100, 0)

				var_342_15.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1074ui_story, var_342_19, var_342_18)

				local var_342_20 = manager.ui.mainCamera.transform.position - var_342_15.position

				var_342_15.forward = Vector3.New(var_342_20.x, var_342_20.y, var_342_20.z)

				local var_342_21 = var_342_15.localEulerAngles

				var_342_21.z = 0
				var_342_21.x = 0
				var_342_15.localEulerAngles = var_342_21
			end

			if arg_339_1.time_ >= var_342_16 + var_342_17 and arg_339_1.time_ < var_342_16 + var_342_17 + arg_342_0 then
				var_342_15.localPosition = Vector3.New(0, 100, 0)

				local var_342_22 = manager.ui.mainCamera.transform.position - var_342_15.position

				var_342_15.forward = Vector3.New(var_342_22.x, var_342_22.y, var_342_22.z)

				local var_342_23 = var_342_15.localEulerAngles

				var_342_23.z = 0
				var_342_23.x = 0
				var_342_15.localEulerAngles = var_342_23
			end

			local var_342_24 = arg_339_1.actors_["1074ui_story"]
			local var_342_25 = 0

			if var_342_25 < arg_339_1.time_ and arg_339_1.time_ <= var_342_25 + arg_342_0 and arg_339_1.var_.characterEffect1074ui_story == nil then
				arg_339_1.var_.characterEffect1074ui_story = var_342_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_26 = 0.200000002980232

			if var_342_25 <= arg_339_1.time_ and arg_339_1.time_ < var_342_25 + var_342_26 then
				local var_342_27 = (arg_339_1.time_ - var_342_25) / var_342_26

				if arg_339_1.var_.characterEffect1074ui_story then
					local var_342_28 = Mathf.Lerp(0, 0.5, var_342_27)

					arg_339_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_339_1.var_.characterEffect1074ui_story.fillRatio = var_342_28
				end
			end

			if arg_339_1.time_ >= var_342_25 + var_342_26 and arg_339_1.time_ < var_342_25 + var_342_26 + arg_342_0 and arg_339_1.var_.characterEffect1074ui_story then
				local var_342_29 = 0.5

				arg_339_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_339_1.var_.characterEffect1074ui_story.fillRatio = var_342_29
			end

			local var_342_30 = 0
			local var_342_31 = 1.325

			if var_342_30 < arg_339_1.time_ and arg_339_1.time_ <= var_342_30 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_32 = arg_339_1:GetWordFromCfg(222061085)
				local var_342_33 = arg_339_1:FormatText(var_342_32.content)

				arg_339_1.text_.text = var_342_33

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_34 = 53
				local var_342_35 = utf8.len(var_342_33)
				local var_342_36 = var_342_34 <= 0 and var_342_31 or var_342_31 * (var_342_35 / var_342_34)

				if var_342_36 > 0 and var_342_31 < var_342_36 then
					arg_339_1.talkMaxDuration = var_342_36

					if var_342_36 + var_342_30 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_36 + var_342_30
					end
				end

				arg_339_1.text_.text = var_342_33
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_37 = math.max(var_342_31, arg_339_1.talkMaxDuration)

			if var_342_30 <= arg_339_1.time_ and arg_339_1.time_ < var_342_30 + var_342_37 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_30) / var_342_37

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_30 + var_342_37 and arg_339_1.time_ < var_342_30 + var_342_37 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play222061086 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 222061086
		arg_343_1.duration_ = 15.7

		local var_343_0 = {
			ja = 15.7,
			ko = 7.266,
			zh = 7.333
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
				arg_343_0:Play222061087(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1071ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1071ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1071ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["1071ui_story"]
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 and arg_343_1.var_.characterEffect1071ui_story == nil then
				arg_343_1.var_.characterEffect1071ui_story = var_346_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_11 = 0.200000002980232

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11

				if arg_343_1.var_.characterEffect1071ui_story then
					arg_343_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 and arg_343_1.var_.characterEffect1071ui_story then
				arg_343_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_346_13 = arg_343_1.actors_["1074ui_story"].transform
			local var_346_14 = 0

			if var_346_14 < arg_343_1.time_ and arg_343_1.time_ <= var_346_14 + arg_346_0 then
				arg_343_1.var_.moveOldPos1074ui_story = var_346_13.localPosition
			end

			local var_346_15 = 0.001

			if var_346_14 <= arg_343_1.time_ and arg_343_1.time_ < var_346_14 + var_346_15 then
				local var_346_16 = (arg_343_1.time_ - var_346_14) / var_346_15
				local var_346_17 = Vector3.New(0.7, -1.055, -6.12)

				var_346_13.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1074ui_story, var_346_17, var_346_16)

				local var_346_18 = manager.ui.mainCamera.transform.position - var_346_13.position

				var_346_13.forward = Vector3.New(var_346_18.x, var_346_18.y, var_346_18.z)

				local var_346_19 = var_346_13.localEulerAngles

				var_346_19.z = 0
				var_346_19.x = 0
				var_346_13.localEulerAngles = var_346_19
			end

			if arg_343_1.time_ >= var_346_14 + var_346_15 and arg_343_1.time_ < var_346_14 + var_346_15 + arg_346_0 then
				var_346_13.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_346_20 = manager.ui.mainCamera.transform.position - var_346_13.position

				var_346_13.forward = Vector3.New(var_346_20.x, var_346_20.y, var_346_20.z)

				local var_346_21 = var_346_13.localEulerAngles

				var_346_21.z = 0
				var_346_21.x = 0
				var_346_13.localEulerAngles = var_346_21
			end

			local var_346_22 = arg_343_1.actors_["1074ui_story"]
			local var_346_23 = 0

			if var_346_23 < arg_343_1.time_ and arg_343_1.time_ <= var_346_23 + arg_346_0 and arg_343_1.var_.characterEffect1074ui_story == nil then
				arg_343_1.var_.characterEffect1074ui_story = var_346_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_24 = 0.200000002980232

			if var_346_23 <= arg_343_1.time_ and arg_343_1.time_ < var_346_23 + var_346_24 then
				local var_346_25 = (arg_343_1.time_ - var_346_23) / var_346_24

				if arg_343_1.var_.characterEffect1074ui_story then
					local var_346_26 = Mathf.Lerp(0, 0.5, var_346_25)

					arg_343_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1074ui_story.fillRatio = var_346_26
				end
			end

			if arg_343_1.time_ >= var_346_23 + var_346_24 and arg_343_1.time_ < var_346_23 + var_346_24 + arg_346_0 and arg_343_1.var_.characterEffect1074ui_story then
				local var_346_27 = 0.5

				arg_343_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1074ui_story.fillRatio = var_346_27
			end

			local var_346_28 = 0

			if var_346_28 < arg_343_1.time_ and arg_343_1.time_ <= var_346_28 + arg_346_0 then
				arg_343_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_346_29 = 0
			local var_346_30 = 0.8

			if var_346_29 < arg_343_1.time_ and arg_343_1.time_ <= var_346_29 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_31 = arg_343_1:FormatText(StoryNameCfg[384].name)

				arg_343_1.leftNameTxt_.text = var_346_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_32 = arg_343_1:GetWordFromCfg(222061086)
				local var_346_33 = arg_343_1:FormatText(var_346_32.content)

				arg_343_1.text_.text = var_346_33

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_34 = 32
				local var_346_35 = utf8.len(var_346_33)
				local var_346_36 = var_346_34 <= 0 and var_346_30 or var_346_30 * (var_346_35 / var_346_34)

				if var_346_36 > 0 and var_346_30 < var_346_36 then
					arg_343_1.talkMaxDuration = var_346_36

					if var_346_36 + var_346_29 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_36 + var_346_29
					end
				end

				arg_343_1.text_.text = var_346_33
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061086", "story_v_out_222061.awb") ~= 0 then
					local var_346_37 = manager.audio:GetVoiceLength("story_v_out_222061", "222061086", "story_v_out_222061.awb") / 1000

					if var_346_37 + var_346_29 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_37 + var_346_29
					end

					if var_346_32.prefab_name ~= "" and arg_343_1.actors_[var_346_32.prefab_name] ~= nil then
						local var_346_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_32.prefab_name].transform, "story_v_out_222061", "222061086", "story_v_out_222061.awb")

						arg_343_1:RecordAudio("222061086", var_346_38)
						arg_343_1:RecordAudio("222061086", var_346_38)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_222061", "222061086", "story_v_out_222061.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_222061", "222061086", "story_v_out_222061.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_39 = math.max(var_346_30, arg_343_1.talkMaxDuration)

			if var_346_29 <= arg_343_1.time_ and arg_343_1.time_ < var_346_29 + var_346_39 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_29) / var_346_39

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_29 + var_346_39 and arg_343_1.time_ < var_346_29 + var_346_39 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play222061087 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 222061087
		arg_347_1.duration_ = 14.733

		local var_347_0 = {
			ja = 14.733,
			ko = 14.2,
			zh = 14.333
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
				arg_347_0:Play222061088(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 1.15

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[384].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(222061087)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061087", "story_v_out_222061.awb") ~= 0 then
					local var_350_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061087", "story_v_out_222061.awb") / 1000

					if var_350_8 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_8 + var_350_0
					end

					if var_350_3.prefab_name ~= "" and arg_347_1.actors_[var_350_3.prefab_name] ~= nil then
						local var_350_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_3.prefab_name].transform, "story_v_out_222061", "222061087", "story_v_out_222061.awb")

						arg_347_1:RecordAudio("222061087", var_350_9)
						arg_347_1:RecordAudio("222061087", var_350_9)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_222061", "222061087", "story_v_out_222061.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_222061", "222061087", "story_v_out_222061.awb")
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
	Play222061088 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 222061088
		arg_351_1.duration_ = 11.8

		local var_351_0 = {
			ja = 11.8,
			ko = 6.066,
			zh = 6.166
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
				arg_351_0:Play222061089(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0
			local var_354_1 = 0.7

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_2 = arg_351_1:FormatText(StoryNameCfg[384].name)

				arg_351_1.leftNameTxt_.text = var_354_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_3 = arg_351_1:GetWordFromCfg(222061088)
				local var_354_4 = arg_351_1:FormatText(var_354_3.content)

				arg_351_1.text_.text = var_354_4

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061088", "story_v_out_222061.awb") ~= 0 then
					local var_354_8 = manager.audio:GetVoiceLength("story_v_out_222061", "222061088", "story_v_out_222061.awb") / 1000

					if var_354_8 + var_354_0 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_8 + var_354_0
					end

					if var_354_3.prefab_name ~= "" and arg_351_1.actors_[var_354_3.prefab_name] ~= nil then
						local var_354_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_3.prefab_name].transform, "story_v_out_222061", "222061088", "story_v_out_222061.awb")

						arg_351_1:RecordAudio("222061088", var_354_9)
						arg_351_1:RecordAudio("222061088", var_354_9)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_222061", "222061088", "story_v_out_222061.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_222061", "222061088", "story_v_out_222061.awb")
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
	Play222061089 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 222061089
		arg_355_1.duration_ = 4.466

		local var_355_0 = {
			ja = 4.466,
			ko = 2.233,
			zh = 2.233
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
				arg_355_0:Play222061090(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1074ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1074ui_story == nil then
				arg_355_1.var_.characterEffect1074ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1074ui_story then
					arg_355_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1074ui_story then
				arg_355_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_358_4 = arg_355_1.actors_["1071ui_story"]
			local var_358_5 = 0

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 and arg_355_1.var_.characterEffect1071ui_story == nil then
				arg_355_1.var_.characterEffect1071ui_story = var_358_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_6 = 0.200000002980232

			if var_358_5 <= arg_355_1.time_ and arg_355_1.time_ < var_358_5 + var_358_6 then
				local var_358_7 = (arg_355_1.time_ - var_358_5) / var_358_6

				if arg_355_1.var_.characterEffect1071ui_story then
					local var_358_8 = Mathf.Lerp(0, 0.5, var_358_7)

					arg_355_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1071ui_story.fillRatio = var_358_8
				end
			end

			if arg_355_1.time_ >= var_358_5 + var_358_6 and arg_355_1.time_ < var_358_5 + var_358_6 + arg_358_0 and arg_355_1.var_.characterEffect1071ui_story then
				local var_358_9 = 0.5

				arg_355_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1071ui_story.fillRatio = var_358_9
			end

			local var_358_10 = 0
			local var_358_11 = 0.175

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_12 = arg_355_1:FormatText(StoryNameCfg[410].name)

				arg_355_1.leftNameTxt_.text = var_358_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_13 = arg_355_1:GetWordFromCfg(222061089)
				local var_358_14 = arg_355_1:FormatText(var_358_13.content)

				arg_355_1.text_.text = var_358_14

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_15 = 7
				local var_358_16 = utf8.len(var_358_14)
				local var_358_17 = var_358_15 <= 0 and var_358_11 or var_358_11 * (var_358_16 / var_358_15)

				if var_358_17 > 0 and var_358_11 < var_358_17 then
					arg_355_1.talkMaxDuration = var_358_17

					if var_358_17 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_17 + var_358_10
					end
				end

				arg_355_1.text_.text = var_358_14
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061089", "story_v_out_222061.awb") ~= 0 then
					local var_358_18 = manager.audio:GetVoiceLength("story_v_out_222061", "222061089", "story_v_out_222061.awb") / 1000

					if var_358_18 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_10
					end

					if var_358_13.prefab_name ~= "" and arg_355_1.actors_[var_358_13.prefab_name] ~= nil then
						local var_358_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_13.prefab_name].transform, "story_v_out_222061", "222061089", "story_v_out_222061.awb")

						arg_355_1:RecordAudio("222061089", var_358_19)
						arg_355_1:RecordAudio("222061089", var_358_19)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_222061", "222061089", "story_v_out_222061.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_222061", "222061089", "story_v_out_222061.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_20 = math.max(var_358_11, arg_355_1.talkMaxDuration)

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_20 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_10) / var_358_20

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_10 + var_358_20 and arg_355_1.time_ < var_358_10 + var_358_20 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play222061090 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 222061090
		arg_359_1.duration_ = 15.233

		local var_359_0 = {
			ja = 15.233,
			ko = 13.166,
			zh = 13.166
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play222061091(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1071ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1071ui_story == nil then
				arg_359_1.var_.characterEffect1071ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.200000002980232

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1071ui_story then
					local var_362_4 = Mathf.Lerp(0, 0.5, var_362_3)

					arg_359_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1071ui_story.fillRatio = var_362_4
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1071ui_story then
				local var_362_5 = 0.5

				arg_359_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1071ui_story.fillRatio = var_362_5
			end

			local var_362_6 = 0

			if var_362_6 < arg_359_1.time_ and arg_359_1.time_ <= var_362_6 + arg_362_0 then
				arg_359_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action5_1")
			end

			local var_362_7 = arg_359_1.actors_["1074ui_story"]
			local var_362_8 = 0

			if var_362_8 < arg_359_1.time_ and arg_359_1.time_ <= var_362_8 + arg_362_0 and arg_359_1.var_.characterEffect1074ui_story == nil then
				arg_359_1.var_.characterEffect1074ui_story = var_362_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_9 = 0.200000002980232

			if var_362_8 <= arg_359_1.time_ and arg_359_1.time_ < var_362_8 + var_362_9 then
				local var_362_10 = (arg_359_1.time_ - var_362_8) / var_362_9

				if arg_359_1.var_.characterEffect1074ui_story then
					local var_362_11 = Mathf.Lerp(0, 0.5, var_362_10)

					arg_359_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_359_1.var_.characterEffect1074ui_story.fillRatio = var_362_11
				end
			end

			if arg_359_1.time_ >= var_362_8 + var_362_9 and arg_359_1.time_ < var_362_8 + var_362_9 + arg_362_0 and arg_359_1.var_.characterEffect1074ui_story then
				local var_362_12 = 0.5

				arg_359_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_359_1.var_.characterEffect1074ui_story.fillRatio = var_362_12
			end

			local var_362_13 = 0
			local var_362_14 = 1.55

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_15 = arg_359_1:FormatText(StoryNameCfg[384].name)

				arg_359_1.leftNameTxt_.text = var_362_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_16 = arg_359_1:GetWordFromCfg(222061090)
				local var_362_17 = arg_359_1:FormatText(var_362_16.content)

				arg_359_1.text_.text = var_362_17

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_18 = 62
				local var_362_19 = utf8.len(var_362_17)
				local var_362_20 = var_362_18 <= 0 and var_362_14 or var_362_14 * (var_362_19 / var_362_18)

				if var_362_20 > 0 and var_362_14 < var_362_20 then
					arg_359_1.talkMaxDuration = var_362_20

					if var_362_20 + var_362_13 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_20 + var_362_13
					end
				end

				arg_359_1.text_.text = var_362_17
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061090", "story_v_out_222061.awb") ~= 0 then
					local var_362_21 = manager.audio:GetVoiceLength("story_v_out_222061", "222061090", "story_v_out_222061.awb") / 1000

					if var_362_21 + var_362_13 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_21 + var_362_13
					end

					if var_362_16.prefab_name ~= "" and arg_359_1.actors_[var_362_16.prefab_name] ~= nil then
						local var_362_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_16.prefab_name].transform, "story_v_out_222061", "222061090", "story_v_out_222061.awb")

						arg_359_1:RecordAudio("222061090", var_362_22)
						arg_359_1:RecordAudio("222061090", var_362_22)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_222061", "222061090", "story_v_out_222061.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_222061", "222061090", "story_v_out_222061.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_23 = math.max(var_362_14, arg_359_1.talkMaxDuration)

			if var_362_13 <= arg_359_1.time_ and arg_359_1.time_ < var_362_13 + var_362_23 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_13) / var_362_23

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_13 + var_362_23 and arg_359_1.time_ < var_362_13 + var_362_23 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play222061091 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 222061091
		arg_363_1.duration_ = 4.633

		local var_363_0 = {
			ja = 4.633,
			ko = 2.1,
			zh = 2.2
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
				arg_363_0:Play222061092(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1074ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1074ui_story == nil then
				arg_363_1.var_.characterEffect1074ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1074ui_story then
					arg_363_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1074ui_story then
				arg_363_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_366_4 = arg_363_1.actors_["1071ui_story"]
			local var_366_5 = 0

			if var_366_5 < arg_363_1.time_ and arg_363_1.time_ <= var_366_5 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story == nil then
				arg_363_1.var_.characterEffect1071ui_story = var_366_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_6 = 0.200000002980232

			if var_366_5 <= arg_363_1.time_ and arg_363_1.time_ < var_366_5 + var_366_6 then
				local var_366_7 = (arg_363_1.time_ - var_366_5) / var_366_6

				if arg_363_1.var_.characterEffect1071ui_story then
					local var_366_8 = Mathf.Lerp(0, 0.5, var_366_7)

					arg_363_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1071ui_story.fillRatio = var_366_8
				end
			end

			if arg_363_1.time_ >= var_366_5 + var_366_6 and arg_363_1.time_ < var_366_5 + var_366_6 + arg_366_0 and arg_363_1.var_.characterEffect1071ui_story then
				local var_366_9 = 0.5

				arg_363_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1071ui_story.fillRatio = var_366_9
			end

			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_366_11 = 0
			local var_366_12 = 0.275

			if var_366_11 < arg_363_1.time_ and arg_363_1.time_ <= var_366_11 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_13 = arg_363_1:FormatText(StoryNameCfg[410].name)

				arg_363_1.leftNameTxt_.text = var_366_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_14 = arg_363_1:GetWordFromCfg(222061091)
				local var_366_15 = arg_363_1:FormatText(var_366_14.content)

				arg_363_1.text_.text = var_366_15

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_16 = 11
				local var_366_17 = utf8.len(var_366_15)
				local var_366_18 = var_366_16 <= 0 and var_366_12 or var_366_12 * (var_366_17 / var_366_16)

				if var_366_18 > 0 and var_366_12 < var_366_18 then
					arg_363_1.talkMaxDuration = var_366_18

					if var_366_18 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_11
					end
				end

				arg_363_1.text_.text = var_366_15
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222061", "222061091", "story_v_out_222061.awb") ~= 0 then
					local var_366_19 = manager.audio:GetVoiceLength("story_v_out_222061", "222061091", "story_v_out_222061.awb") / 1000

					if var_366_19 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_19 + var_366_11
					end

					if var_366_14.prefab_name ~= "" and arg_363_1.actors_[var_366_14.prefab_name] ~= nil then
						local var_366_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_14.prefab_name].transform, "story_v_out_222061", "222061091", "story_v_out_222061.awb")

						arg_363_1:RecordAudio("222061091", var_366_20)
						arg_363_1:RecordAudio("222061091", var_366_20)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_222061", "222061091", "story_v_out_222061.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_222061", "222061091", "story_v_out_222061.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_21 = math.max(var_366_12, arg_363_1.talkMaxDuration)

			if var_366_11 <= arg_363_1.time_ and arg_363_1.time_ < var_366_11 + var_366_21 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_11) / var_366_21

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_11 + var_366_21 and arg_363_1.time_ < var_366_11 + var_366_21 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play222061092 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 222061092
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
			arg_367_1.auto_ = false
		end

		function arg_367_1.playNext_(arg_369_0)
			arg_367_1.onStoryFinished_()
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1074ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos1074ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0, 100, 0)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1074ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0, 100, 0)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["1074ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect1074ui_story == nil then
				arg_367_1.var_.characterEffect1074ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect1074ui_story then
					local var_370_13 = Mathf.Lerp(0, 0.5, var_370_12)

					arg_367_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1074ui_story.fillRatio = var_370_13
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect1074ui_story then
				local var_370_14 = 0.5

				arg_367_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1074ui_story.fillRatio = var_370_14
			end

			local var_370_15 = arg_367_1.actors_["1071ui_story"].transform
			local var_370_16 = 0

			if var_370_16 < arg_367_1.time_ and arg_367_1.time_ <= var_370_16 + arg_370_0 then
				arg_367_1.var_.moveOldPos1071ui_story = var_370_15.localPosition
			end

			local var_370_17 = 0.001

			if var_370_16 <= arg_367_1.time_ and arg_367_1.time_ < var_370_16 + var_370_17 then
				local var_370_18 = (arg_367_1.time_ - var_370_16) / var_370_17
				local var_370_19 = Vector3.New(0, 100, 0)

				var_370_15.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1071ui_story, var_370_19, var_370_18)

				local var_370_20 = manager.ui.mainCamera.transform.position - var_370_15.position

				var_370_15.forward = Vector3.New(var_370_20.x, var_370_20.y, var_370_20.z)

				local var_370_21 = var_370_15.localEulerAngles

				var_370_21.z = 0
				var_370_21.x = 0
				var_370_15.localEulerAngles = var_370_21
			end

			if arg_367_1.time_ >= var_370_16 + var_370_17 and arg_367_1.time_ < var_370_16 + var_370_17 + arg_370_0 then
				var_370_15.localPosition = Vector3.New(0, 100, 0)

				local var_370_22 = manager.ui.mainCamera.transform.position - var_370_15.position

				var_370_15.forward = Vector3.New(var_370_22.x, var_370_22.y, var_370_22.z)

				local var_370_23 = var_370_15.localEulerAngles

				var_370_23.z = 0
				var_370_23.x = 0
				var_370_15.localEulerAngles = var_370_23
			end

			local var_370_24 = arg_367_1.actors_["1071ui_story"]
			local var_370_25 = 0

			if var_370_25 < arg_367_1.time_ and arg_367_1.time_ <= var_370_25 + arg_370_0 and arg_367_1.var_.characterEffect1071ui_story == nil then
				arg_367_1.var_.characterEffect1071ui_story = var_370_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_26 = 0.200000002980232

			if var_370_25 <= arg_367_1.time_ and arg_367_1.time_ < var_370_25 + var_370_26 then
				local var_370_27 = (arg_367_1.time_ - var_370_25) / var_370_26

				if arg_367_1.var_.characterEffect1071ui_story then
					local var_370_28 = Mathf.Lerp(0, 0.5, var_370_27)

					arg_367_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1071ui_story.fillRatio = var_370_28
				end
			end

			if arg_367_1.time_ >= var_370_25 + var_370_26 and arg_367_1.time_ < var_370_25 + var_370_26 + arg_370_0 and arg_367_1.var_.characterEffect1071ui_story then
				local var_370_29 = 0.5

				arg_367_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1071ui_story.fillRatio = var_370_29
			end

			local var_370_30 = 0
			local var_370_31 = 0.8

			if var_370_30 < arg_367_1.time_ and arg_367_1.time_ <= var_370_30 + arg_370_0 then
				local var_370_32 = "play"
				local var_370_33 = "effect"

				arg_367_1:AudioAction(var_370_32, var_370_33, "se_story", "se_story_communication", "")
			end

			local var_370_34 = 0
			local var_370_35 = 1.325

			if var_370_34 < arg_367_1.time_ and arg_367_1.time_ <= var_370_34 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_36 = arg_367_1:GetWordFromCfg(222061092)
				local var_370_37 = arg_367_1:FormatText(var_370_36.content)

				arg_367_1.text_.text = var_370_37

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_38 = 53
				local var_370_39 = utf8.len(var_370_37)
				local var_370_40 = var_370_38 <= 0 and var_370_35 or var_370_35 * (var_370_39 / var_370_38)

				if var_370_40 > 0 and var_370_35 < var_370_40 then
					arg_367_1.talkMaxDuration = var_370_40

					if var_370_40 + var_370_34 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_40 + var_370_34
					end
				end

				arg_367_1.text_.text = var_370_37
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_41 = math.max(var_370_35, arg_367_1.talkMaxDuration)

			if var_370_34 <= arg_367_1.time_ and arg_367_1.time_ < var_370_34 + var_370_41 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_34) / var_370_41

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_34 + var_370_41 and arg_367_1.time_ < var_370_34 + var_370_41 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST53",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J16f"
	},
	voices = {
		"story_v_out_222061.awb"
	}
}
