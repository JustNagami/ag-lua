return {
	Play412031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 412031001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play412031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I09j"

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
				local var_4_5 = arg_1_1.bgs_.I09j

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
					if iter_4_0 ~= "I09j" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 1.999999999999

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

			local var_4_24 = 0
			local var_4_25 = 0.233333333333333

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_28 = 1.1
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_3_2_story_corridor_slow", "bgm_activity_3_2_story_corridor_slow", "bgm_activity_3_2_story_corridor_slow.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 2
			local var_4_33 = 0.475

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_35 = arg_1_1:GetWordFromCfg(412031001)
				local var_4_36 = arg_1_1:FormatText(var_4_35.content)

				arg_1_1.text_.text = var_4_36

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_37 = 19
				local var_4_38 = utf8.len(var_4_36)
				local var_4_39 = var_4_37 <= 0 and var_4_33 or var_4_33 * (var_4_38 / var_4_37)

				if var_4_39 > 0 and var_4_33 < var_4_39 then
					arg_1_1.talkMaxDuration = var_4_39
					var_4_32 = var_4_32 + 0.3

					if var_4_39 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_36
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_40 = var_4_32 + 0.3
			local var_4_41 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_40 <= arg_1_1.time_ and arg_1_1.time_ < var_4_40 + var_4_41 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_40) / var_4_41

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_40 + var_4_41 and arg_1_1.time_ < var_4_40 + var_4_41 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play412031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 412031002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play412031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.875

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_2 = arg_7_1:GetWordFromCfg(412031002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 35
				local var_10_5 = utf8.len(var_10_3)
				local var_10_6 = var_10_4 <= 0 and var_10_1 or var_10_1 * (var_10_5 / var_10_4)

				if var_10_6 > 0 and var_10_1 < var_10_6 then
					arg_7_1.talkMaxDuration = var_10_6

					if var_10_6 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_6 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_3
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_7 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_7 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_7

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_7 and arg_7_1.time_ < var_10_0 + var_10_7 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play412031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 412031003
		arg_11_1.duration_ = 3.666

		local var_11_0 = {
			zh = 3.666,
			ja = 2.9
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
				arg_11_0:Play412031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.25

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[216].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(412031003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031003", "story_v_out_412031.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031003", "story_v_out_412031.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_412031", "412031003", "story_v_out_412031.awb")

						arg_11_1:RecordAudio("412031003", var_14_9)
						arg_11_1:RecordAudio("412031003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_412031", "412031003", "story_v_out_412031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_412031", "412031003", "story_v_out_412031.awb")
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
	Play412031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 412031004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play412031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.05

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(412031004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 42
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play412031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 412031005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play412031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.125

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_2 = arg_19_1:GetWordFromCfg(412031005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 5
				local var_22_5 = utf8.len(var_22_3)
				local var_22_6 = var_22_4 <= 0 and var_22_1 or var_22_1 * (var_22_5 / var_22_4)

				if var_22_6 > 0 and var_22_1 < var_22_6 then
					arg_19_1.talkMaxDuration = var_22_6

					if var_22_6 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_6 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_3
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_7 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_7 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_7

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_7 and arg_19_1.time_ < var_22_0 + var_22_7 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play412031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 412031006
		arg_23_1.duration_ = 5.133

		local var_23_0 = {
			zh = 5.133,
			ja = 4.233
		}
		local var_23_1 = manager.audio:GetLocalizationFlag()

		if var_23_0[var_23_1] ~= nil then
			arg_23_1.duration_ = var_23_0[var_23_1]
		end

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play412031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1097ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["1097ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos1097ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(0, -0.54, -6.3)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1097ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_26_15 = arg_23_1.actors_["1097ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1097ui_story == nil then
				arg_23_1.var_.characterEffect1097ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.2

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect1097ui_story then
					arg_23_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect1097ui_story then
				arg_23_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_26_19 = 0
			local var_26_20 = 0.275

			if var_26_19 < arg_23_1.time_ and arg_23_1.time_ <= var_26_19 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_21 = arg_23_1:FormatText(StoryNameCfg[216].name)

				arg_23_1.leftNameTxt_.text = var_26_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_22 = arg_23_1:GetWordFromCfg(412031006)
				local var_26_23 = arg_23_1:FormatText(var_26_22.content)

				arg_23_1.text_.text = var_26_23

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_24 = 11
				local var_26_25 = utf8.len(var_26_23)
				local var_26_26 = var_26_24 <= 0 and var_26_20 or var_26_20 * (var_26_25 / var_26_24)

				if var_26_26 > 0 and var_26_20 < var_26_26 then
					arg_23_1.talkMaxDuration = var_26_26

					if var_26_26 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_26 + var_26_19
					end
				end

				arg_23_1.text_.text = var_26_23
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031006", "story_v_out_412031.awb") ~= 0 then
					local var_26_27 = manager.audio:GetVoiceLength("story_v_out_412031", "412031006", "story_v_out_412031.awb") / 1000

					if var_26_27 + var_26_19 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_27 + var_26_19
					end

					if var_26_22.prefab_name ~= "" and arg_23_1.actors_[var_26_22.prefab_name] ~= nil then
						local var_26_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_22.prefab_name].transform, "story_v_out_412031", "412031006", "story_v_out_412031.awb")

						arg_23_1:RecordAudio("412031006", var_26_28)
						arg_23_1:RecordAudio("412031006", var_26_28)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_412031", "412031006", "story_v_out_412031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_412031", "412031006", "story_v_out_412031.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_29 = math.max(var_26_20, arg_23_1.talkMaxDuration)

			if var_26_19 <= arg_23_1.time_ and arg_23_1.time_ < var_26_19 + var_26_29 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_19) / var_26_29

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_19 + var_26_29 and arg_23_1.time_ < var_26_19 + var_26_29 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play412031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 412031007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play412031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1097ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1097ui_story == nil then
				arg_27_1.var_.characterEffect1097ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1097ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1097ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1097ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1097ui_story.fillRatio = var_30_5
			end

			local var_30_6 = arg_27_1.actors_["1097ui_story"].transform
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 then
				arg_27_1.var_.moveOldPos1097ui_story = var_30_6.localPosition
			end

			local var_30_8 = 0.001

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_8 then
				local var_30_9 = (arg_27_1.time_ - var_30_7) / var_30_8
				local var_30_10 = Vector3.New(0, 100, 0)

				var_30_6.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1097ui_story, var_30_10, var_30_9)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_6.position

				var_30_6.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_6.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_6.localEulerAngles = var_30_12
			end

			if arg_27_1.time_ >= var_30_7 + var_30_8 and arg_27_1.time_ < var_30_7 + var_30_8 + arg_30_0 then
				var_30_6.localPosition = Vector3.New(0, 100, 0)

				local var_30_13 = manager.ui.mainCamera.transform.position - var_30_6.position

				var_30_6.forward = Vector3.New(var_30_13.x, var_30_13.y, var_30_13.z)

				local var_30_14 = var_30_6.localEulerAngles

				var_30_14.z = 0
				var_30_14.x = 0
				var_30_6.localEulerAngles = var_30_14
			end

			local var_30_15 = 0
			local var_30_16 = 1.35

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_17 = arg_27_1:GetWordFromCfg(412031007)
				local var_30_18 = arg_27_1:FormatText(var_30_17.content)

				arg_27_1.text_.text = var_30_18

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_19 = 54
				local var_30_20 = utf8.len(var_30_18)
				local var_30_21 = var_30_19 <= 0 and var_30_16 or var_30_16 * (var_30_20 / var_30_19)

				if var_30_21 > 0 and var_30_16 < var_30_21 then
					arg_27_1.talkMaxDuration = var_30_21

					if var_30_21 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_21 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_18
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_22 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_22 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_22

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_22 and arg_27_1.time_ < var_30_15 + var_30_22 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play412031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 412031008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play412031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.5

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_2 = arg_31_1:GetWordFromCfg(412031008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 20
				local var_34_5 = utf8.len(var_34_3)
				local var_34_6 = var_34_4 <= 0 and var_34_1 or var_34_1 * (var_34_5 / var_34_4)

				if var_34_6 > 0 and var_34_1 < var_34_6 then
					arg_31_1.talkMaxDuration = var_34_6

					if var_34_6 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_6 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_3
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_7 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_7 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_7

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_7 and arg_31_1.time_ < var_34_0 + var_34_7 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play412031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 412031009
		arg_35_1.duration_ = 5.066

		local var_35_0 = {
			zh = 5.066,
			ja = 4.066
		}
		local var_35_1 = manager.audio:GetLocalizationFlag()

		if var_35_0[var_35_1] ~= nil then
			arg_35_1.duration_ = var_35_0[var_35_1]
		end

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play412031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "3043ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["3043ui_story"].transform
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.var_.moveOldPos3043ui_story = var_38_4.localPosition
			end

			local var_38_6 = 0.001

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6
				local var_38_8 = Vector3.New(0, -1.41, -5.7)

				var_38_4.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3043ui_story, var_38_8, var_38_7)

				local var_38_9 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_9.x, var_38_9.y, var_38_9.z)

				local var_38_10 = var_38_4.localEulerAngles

				var_38_10.z = 0
				var_38_10.x = 0
				var_38_4.localEulerAngles = var_38_10
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 then
				var_38_4.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_38_11 = manager.ui.mainCamera.transform.position - var_38_4.position

				var_38_4.forward = Vector3.New(var_38_11.x, var_38_11.y, var_38_11.z)

				local var_38_12 = var_38_4.localEulerAngles

				var_38_12.z = 0
				var_38_12.x = 0
				var_38_4.localEulerAngles = var_38_12
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_38_14 = arg_35_1.actors_["3043ui_story"]
			local var_38_15 = 0

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 and arg_35_1.var_.characterEffect3043ui_story == nil then
				arg_35_1.var_.characterEffect3043ui_story = var_38_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_16 = 0.2

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_16 then
				local var_38_17 = (arg_35_1.time_ - var_38_15) / var_38_16

				if arg_35_1.var_.characterEffect3043ui_story then
					arg_35_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_15 + var_38_16 and arg_35_1.time_ < var_38_15 + var_38_16 + arg_38_0 and arg_35_1.var_.characterEffect3043ui_story then
				arg_35_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_38_18 = 0
			local var_38_19 = 0.425

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_20 = arg_35_1:FormatText(StoryNameCfg[36].name)

				arg_35_1.leftNameTxt_.text = var_38_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_21 = arg_35_1:GetWordFromCfg(412031009)
				local var_38_22 = arg_35_1:FormatText(var_38_21.content)

				arg_35_1.text_.text = var_38_22

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_23 = 17
				local var_38_24 = utf8.len(var_38_22)
				local var_38_25 = var_38_23 <= 0 and var_38_19 or var_38_19 * (var_38_24 / var_38_23)

				if var_38_25 > 0 and var_38_19 < var_38_25 then
					arg_35_1.talkMaxDuration = var_38_25

					if var_38_25 + var_38_18 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_25 + var_38_18
					end
				end

				arg_35_1.text_.text = var_38_22
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031009", "story_v_out_412031.awb") ~= 0 then
					local var_38_26 = manager.audio:GetVoiceLength("story_v_out_412031", "412031009", "story_v_out_412031.awb") / 1000

					if var_38_26 + var_38_18 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_26 + var_38_18
					end

					if var_38_21.prefab_name ~= "" and arg_35_1.actors_[var_38_21.prefab_name] ~= nil then
						local var_38_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_21.prefab_name].transform, "story_v_out_412031", "412031009", "story_v_out_412031.awb")

						arg_35_1:RecordAudio("412031009", var_38_27)
						arg_35_1:RecordAudio("412031009", var_38_27)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_412031", "412031009", "story_v_out_412031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_412031", "412031009", "story_v_out_412031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_28 = math.max(var_38_19, arg_35_1.talkMaxDuration)

			if var_38_18 <= arg_35_1.time_ and arg_35_1.time_ < var_38_18 + var_38_28 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_18) / var_38_28

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_18 + var_38_28 and arg_35_1.time_ < var_38_18 + var_38_28 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play412031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 412031010
		arg_39_1.duration_ = 5.033

		local var_39_0 = {
			zh = 5.033,
			ja = 3.933
		}
		local var_39_1 = manager.audio:GetLocalizationFlag()

		if var_39_0[var_39_1] ~= nil then
			arg_39_1.duration_ = var_39_0[var_39_1]
		end

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play412031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1097ui_story"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1097ui_story = var_42_0.localPosition
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1097ui_story, var_42_4, var_42_3)

				local var_42_5 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_5.x, var_42_5.y, var_42_5.z)

				local var_42_6 = var_42_0.localEulerAngles

				var_42_6.z = 0
				var_42_6.x = 0
				var_42_0.localEulerAngles = var_42_6
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_42_7 = manager.ui.mainCamera.transform.position - var_42_0.position

				var_42_0.forward = Vector3.New(var_42_7.x, var_42_7.y, var_42_7.z)

				local var_42_8 = var_42_0.localEulerAngles

				var_42_8.z = 0
				var_42_8.x = 0
				var_42_0.localEulerAngles = var_42_8
			end

			local var_42_9 = arg_39_1.actors_["1097ui_story"]
			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 and arg_39_1.var_.characterEffect1097ui_story == nil then
				arg_39_1.var_.characterEffect1097ui_story = var_42_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_11 = 0.200000002980232

			if var_42_10 <= arg_39_1.time_ and arg_39_1.time_ < var_42_10 + var_42_11 then
				local var_42_12 = (arg_39_1.time_ - var_42_10) / var_42_11

				if arg_39_1.var_.characterEffect1097ui_story then
					arg_39_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_10 + var_42_11 and arg_39_1.time_ < var_42_10 + var_42_11 + arg_42_0 and arg_39_1.var_.characterEffect1097ui_story then
				arg_39_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_15 = arg_39_1.actors_["3043ui_story"].transform
			local var_42_16 = 0

			if var_42_16 < arg_39_1.time_ and arg_39_1.time_ <= var_42_16 + arg_42_0 then
				arg_39_1.var_.moveOldPos3043ui_story = var_42_15.localPosition
			end

			local var_42_17 = 0.001

			if var_42_16 <= arg_39_1.time_ and arg_39_1.time_ < var_42_16 + var_42_17 then
				local var_42_18 = (arg_39_1.time_ - var_42_16) / var_42_17
				local var_42_19 = Vector3.New(0.7, -1.41, -5.7)

				var_42_15.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos3043ui_story, var_42_19, var_42_18)

				local var_42_20 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_20.x, var_42_20.y, var_42_20.z)

				local var_42_21 = var_42_15.localEulerAngles

				var_42_21.z = 0
				var_42_21.x = 0
				var_42_15.localEulerAngles = var_42_21
			end

			if arg_39_1.time_ >= var_42_16 + var_42_17 and arg_39_1.time_ < var_42_16 + var_42_17 + arg_42_0 then
				var_42_15.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_42_22 = manager.ui.mainCamera.transform.position - var_42_15.position

				var_42_15.forward = Vector3.New(var_42_22.x, var_42_22.y, var_42_22.z)

				local var_42_23 = var_42_15.localEulerAngles

				var_42_23.z = 0
				var_42_23.x = 0
				var_42_15.localEulerAngles = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["3043ui_story"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and arg_39_1.var_.characterEffect3043ui_story == nil then
				arg_39_1.var_.characterEffect3043ui_story = var_42_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_26 = 0.200000002980232

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_26 then
				local var_42_27 = (arg_39_1.time_ - var_42_25) / var_42_26

				if arg_39_1.var_.characterEffect3043ui_story then
					local var_42_28 = Mathf.Lerp(0, 0.5, var_42_27)

					arg_39_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_39_1.var_.characterEffect3043ui_story.fillRatio = var_42_28
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_26 and arg_39_1.time_ < var_42_25 + var_42_26 + arg_42_0 and arg_39_1.var_.characterEffect3043ui_story then
				local var_42_29 = 0.5

				arg_39_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_39_1.var_.characterEffect3043ui_story.fillRatio = var_42_29
			end

			local var_42_30 = 0
			local var_42_31 = 0.425

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[216].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(412031010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 17
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031010", "story_v_out_412031.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031010", "story_v_out_412031.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_412031", "412031010", "story_v_out_412031.awb")

						arg_39_1:RecordAudio("412031010", var_42_39)
						arg_39_1:RecordAudio("412031010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_412031", "412031010", "story_v_out_412031.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_412031", "412031010", "story_v_out_412031.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play412031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 412031011
		arg_43_1.duration_ = 5

		local var_43_0 = {
			zh = 3.4,
			ja = 5
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play412031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["3043ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos3043ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0.7, -1.41, -5.7)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos3043ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["3043ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect3043ui_story == nil then
				arg_43_1.var_.characterEffect3043ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect3043ui_story then
					arg_43_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect3043ui_story then
				arg_43_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = arg_43_1.actors_["1097ui_story"]
			local var_46_16 = 0

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 and arg_43_1.var_.characterEffect1097ui_story == nil then
				arg_43_1.var_.characterEffect1097ui_story = var_46_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_17 = 0.200000002980232

			if var_46_16 <= arg_43_1.time_ and arg_43_1.time_ < var_46_16 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_16) / var_46_17

				if arg_43_1.var_.characterEffect1097ui_story then
					local var_46_19 = Mathf.Lerp(0, 0.5, var_46_18)

					arg_43_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1097ui_story.fillRatio = var_46_19
				end
			end

			if arg_43_1.time_ >= var_46_16 + var_46_17 and arg_43_1.time_ < var_46_16 + var_46_17 + arg_46_0 and arg_43_1.var_.characterEffect1097ui_story then
				local var_46_20 = 0.5

				arg_43_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1097ui_story.fillRatio = var_46_20
			end

			local var_46_21 = 0
			local var_46_22 = 0.375

			if var_46_21 < arg_43_1.time_ and arg_43_1.time_ <= var_46_21 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_23 = arg_43_1:FormatText(StoryNameCfg[920].name)

				arg_43_1.leftNameTxt_.text = var_46_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_24 = arg_43_1:GetWordFromCfg(412031011)
				local var_46_25 = arg_43_1:FormatText(var_46_24.content)

				arg_43_1.text_.text = var_46_25

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_26 = 15
				local var_46_27 = utf8.len(var_46_25)
				local var_46_28 = var_46_26 <= 0 and var_46_22 or var_46_22 * (var_46_27 / var_46_26)

				if var_46_28 > 0 and var_46_22 < var_46_28 then
					arg_43_1.talkMaxDuration = var_46_28

					if var_46_28 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_28 + var_46_21
					end
				end

				arg_43_1.text_.text = var_46_25
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031011", "story_v_out_412031.awb") ~= 0 then
					local var_46_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031011", "story_v_out_412031.awb") / 1000

					if var_46_29 + var_46_21 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_21
					end

					if var_46_24.prefab_name ~= "" and arg_43_1.actors_[var_46_24.prefab_name] ~= nil then
						local var_46_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_24.prefab_name].transform, "story_v_out_412031", "412031011", "story_v_out_412031.awb")

						arg_43_1:RecordAudio("412031011", var_46_30)
						arg_43_1:RecordAudio("412031011", var_46_30)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_412031", "412031011", "story_v_out_412031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_412031", "412031011", "story_v_out_412031.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_31 = math.max(var_46_22, arg_43_1.talkMaxDuration)

			if var_46_21 <= arg_43_1.time_ and arg_43_1.time_ < var_46_21 + var_46_31 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_21) / var_46_31

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_21 + var_46_31 and arg_43_1.time_ < var_46_21 + var_46_31 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play412031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 412031012
		arg_47_1.duration_ = 8

		local var_47_0 = {
			zh = 6.033,
			ja = 8
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
				arg_47_0:Play412031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1097ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1097ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1097ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1097ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story == nil then
				arg_47_1.var_.characterEffect1097ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1097ui_story then
					arg_47_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1097ui_story then
				arg_47_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_15 = arg_47_1.actors_["3043ui_story"]
			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect3043ui_story == nil then
				arg_47_1.var_.characterEffect3043ui_story = var_50_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_17 = 0.200000002980232

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17

				if arg_47_1.var_.characterEffect3043ui_story then
					local var_50_19 = Mathf.Lerp(0, 0.5, var_50_18)

					arg_47_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_47_1.var_.characterEffect3043ui_story.fillRatio = var_50_19
				end
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 and arg_47_1.var_.characterEffect3043ui_story then
				local var_50_20 = 0.5

				arg_47_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_47_1.var_.characterEffect3043ui_story.fillRatio = var_50_20
			end

			local var_50_21 = 0
			local var_50_22 = 0.475

			if var_50_21 < arg_47_1.time_ and arg_47_1.time_ <= var_50_21 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_23 = arg_47_1:FormatText(StoryNameCfg[216].name)

				arg_47_1.leftNameTxt_.text = var_50_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_24 = arg_47_1:GetWordFromCfg(412031012)
				local var_50_25 = arg_47_1:FormatText(var_50_24.content)

				arg_47_1.text_.text = var_50_25

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_26 = 19
				local var_50_27 = utf8.len(var_50_25)
				local var_50_28 = var_50_26 <= 0 and var_50_22 or var_50_22 * (var_50_27 / var_50_26)

				if var_50_28 > 0 and var_50_22 < var_50_28 then
					arg_47_1.talkMaxDuration = var_50_28

					if var_50_28 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_21
					end
				end

				arg_47_1.text_.text = var_50_25
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031012", "story_v_out_412031.awb") ~= 0 then
					local var_50_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031012", "story_v_out_412031.awb") / 1000

					if var_50_29 + var_50_21 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_29 + var_50_21
					end

					if var_50_24.prefab_name ~= "" and arg_47_1.actors_[var_50_24.prefab_name] ~= nil then
						local var_50_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_24.prefab_name].transform, "story_v_out_412031", "412031012", "story_v_out_412031.awb")

						arg_47_1:RecordAudio("412031012", var_50_30)
						arg_47_1:RecordAudio("412031012", var_50_30)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_412031", "412031012", "story_v_out_412031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_412031", "412031012", "story_v_out_412031.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_31 = math.max(var_50_22, arg_47_1.talkMaxDuration)

			if var_50_21 <= arg_47_1.time_ and arg_47_1.time_ < var_50_21 + var_50_31 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_21) / var_50_31

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_21 + var_50_31 and arg_47_1.time_ < var_50_21 + var_50_31 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play412031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 412031013
		arg_51_1.duration_ = 11.766

		local var_51_0 = {
			zh = 5.666,
			ja = 11.766
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
				arg_51_0:Play412031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["3043ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect3043ui_story == nil then
				arg_51_1.var_.characterEffect3043ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect3043ui_story then
					arg_51_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect3043ui_story then
				arg_51_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_54_4 = 0

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_6 = arg_51_1.actors_["1097ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect1097ui_story == nil then
				arg_51_1.var_.characterEffect1097ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect1097ui_story then
					local var_54_10 = Mathf.Lerp(0, 0.5, var_54_9)

					arg_51_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1097ui_story.fillRatio = var_54_10
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect1097ui_story then
				local var_54_11 = 0.5

				arg_51_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1097ui_story.fillRatio = var_54_11
			end

			local var_54_12 = 0
			local var_54_13 = 0.6

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[920].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(412031013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 24
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031013", "story_v_out_412031.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031013", "story_v_out_412031.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_out_412031", "412031013", "story_v_out_412031.awb")

						arg_51_1:RecordAudio("412031013", var_54_21)
						arg_51_1:RecordAudio("412031013", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_412031", "412031013", "story_v_out_412031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_412031", "412031013", "story_v_out_412031.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play412031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 412031014
		arg_55_1.duration_ = 4.433

		local var_55_0 = {
			zh = 2.766,
			ja = 4.433
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
				arg_55_0:Play412031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1097ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1097ui_story == nil then
				arg_55_1.var_.characterEffect1097ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1097ui_story then
					arg_55_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1097ui_story then
				arg_55_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_58_4 = 0

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_6 = arg_55_1.actors_["3043ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect3043ui_story == nil then
				arg_55_1.var_.characterEffect3043ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.200000002980232

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect3043ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_55_1.var_.characterEffect3043ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect3043ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_55_1.var_.characterEffect3043ui_story.fillRatio = var_58_11
			end

			local var_58_12 = 0
			local var_58_13 = 0.175

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[216].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(412031014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 7
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031014", "story_v_out_412031.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031014", "story_v_out_412031.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_412031", "412031014", "story_v_out_412031.awb")

						arg_55_1:RecordAudio("412031014", var_58_21)
						arg_55_1:RecordAudio("412031014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_412031", "412031014", "story_v_out_412031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_412031", "412031014", "story_v_out_412031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play412031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 412031015
		arg_59_1.duration_ = 8.566

		local var_59_0 = {
			zh = 4.3,
			ja = 8.566
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
				arg_59_0:Play412031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["3043ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect3043ui_story == nil then
				arg_59_1.var_.characterEffect3043ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect3043ui_story then
					arg_59_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect3043ui_story then
				arg_59_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1097ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1097ui_story == nil then
				arg_59_1.var_.characterEffect1097ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.200000002980232

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1097ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1097ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1097ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1097ui_story.fillRatio = var_62_9
			end

			local var_62_10 = 0
			local var_62_11 = 0.375

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_12 = arg_59_1:FormatText(StoryNameCfg[920].name)

				arg_59_1.leftNameTxt_.text = var_62_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_13 = arg_59_1:GetWordFromCfg(412031015)
				local var_62_14 = arg_59_1:FormatText(var_62_13.content)

				arg_59_1.text_.text = var_62_14

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_15 = 15
				local var_62_16 = utf8.len(var_62_14)
				local var_62_17 = var_62_15 <= 0 and var_62_11 or var_62_11 * (var_62_16 / var_62_15)

				if var_62_17 > 0 and var_62_11 < var_62_17 then
					arg_59_1.talkMaxDuration = var_62_17

					if var_62_17 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_17 + var_62_10
					end
				end

				arg_59_1.text_.text = var_62_14
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031015", "story_v_out_412031.awb") ~= 0 then
					local var_62_18 = manager.audio:GetVoiceLength("story_v_out_412031", "412031015", "story_v_out_412031.awb") / 1000

					if var_62_18 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_18 + var_62_10
					end

					if var_62_13.prefab_name ~= "" and arg_59_1.actors_[var_62_13.prefab_name] ~= nil then
						local var_62_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_13.prefab_name].transform, "story_v_out_412031", "412031015", "story_v_out_412031.awb")

						arg_59_1:RecordAudio("412031015", var_62_19)
						arg_59_1:RecordAudio("412031015", var_62_19)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_412031", "412031015", "story_v_out_412031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_412031", "412031015", "story_v_out_412031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_20 = math.max(var_62_11, arg_59_1.talkMaxDuration)

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_20 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_10) / var_62_20

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_10 + var_62_20 and arg_59_1.time_ < var_62_10 + var_62_20 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play412031016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 412031016
		arg_63_1.duration_ = 6.633

		local var_63_0 = {
			zh = 6.333,
			ja = 6.633
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
				arg_63_0:Play412031017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "10083ui_story"

			if arg_63_1.actors_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(Asset.Load("Char/" .. var_66_0), arg_63_1.stage_.transform)

				var_66_1.name = var_66_0
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.actors_[var_66_0] = var_66_1

				local var_66_2 = var_66_1:GetComponentInChildren(typeof(CharacterEffect))

				var_66_2.enabled = true

				local var_66_3 = GameObjectTools.GetOrAddComponent(var_66_1, typeof(DynamicBoneHelper))

				if var_66_3 then
					var_66_3:EnableDynamicBone(false)
				end

				arg_63_1:ShowWeapon(var_66_2.transform, false)

				arg_63_1.var_[var_66_0 .. "Animator"] = var_66_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_63_1.var_[var_66_0 .. "Animator"].applyRootMotion = true
				arg_63_1.var_[var_66_0 .. "LipSync"] = var_66_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_66_4 = arg_63_1.actors_["10083ui_story"].transform
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.var_.moveOldPos10083ui_story = var_66_4.localPosition
			end

			local var_66_6 = 0.001

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6
				local var_66_8 = Vector3.New(0, -2.6, -2.8)

				var_66_4.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10083ui_story, var_66_8, var_66_7)

				local var_66_9 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_9.x, var_66_9.y, var_66_9.z)

				local var_66_10 = var_66_4.localEulerAngles

				var_66_10.z = 0
				var_66_10.x = 0
				var_66_4.localEulerAngles = var_66_10
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 then
				var_66_4.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_66_11 = manager.ui.mainCamera.transform.position - var_66_4.position

				var_66_4.forward = Vector3.New(var_66_11.x, var_66_11.y, var_66_11.z)

				local var_66_12 = var_66_4.localEulerAngles

				var_66_12.z = 0
				var_66_12.x = 0
				var_66_4.localEulerAngles = var_66_12
			end

			local var_66_13 = arg_63_1.actors_["10083ui_story"]
			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 and arg_63_1.var_.characterEffect10083ui_story == nil then
				arg_63_1.var_.characterEffect10083ui_story = var_66_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_15 = 0.200000002980232

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15

				if arg_63_1.var_.characterEffect10083ui_story then
					arg_63_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 and arg_63_1.var_.characterEffect10083ui_story then
				arg_63_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_66_17 = 0

			if var_66_17 < arg_63_1.time_ and arg_63_1.time_ <= var_66_17 + arg_66_0 then
				arg_63_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action4_1")
			end

			local var_66_18 = 0

			if var_66_18 < arg_63_1.time_ and arg_63_1.time_ <= var_66_18 + arg_66_0 then
				arg_63_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_66_19 = arg_63_1.actors_["3043ui_story"].transform
			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1.var_.moveOldPos3043ui_story = var_66_19.localPosition
			end

			local var_66_21 = 0.001

			if var_66_20 <= arg_63_1.time_ and arg_63_1.time_ < var_66_20 + var_66_21 then
				local var_66_22 = (arg_63_1.time_ - var_66_20) / var_66_21
				local var_66_23 = Vector3.New(0, 100, 0)

				var_66_19.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos3043ui_story, var_66_23, var_66_22)

				local var_66_24 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_24.x, var_66_24.y, var_66_24.z)

				local var_66_25 = var_66_19.localEulerAngles

				var_66_25.z = 0
				var_66_25.x = 0
				var_66_19.localEulerAngles = var_66_25
			end

			if arg_63_1.time_ >= var_66_20 + var_66_21 and arg_63_1.time_ < var_66_20 + var_66_21 + arg_66_0 then
				var_66_19.localPosition = Vector3.New(0, 100, 0)

				local var_66_26 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_26.x, var_66_26.y, var_66_26.z)

				local var_66_27 = var_66_19.localEulerAngles

				var_66_27.z = 0
				var_66_27.x = 0
				var_66_19.localEulerAngles = var_66_27
			end

			local var_66_28 = arg_63_1.actors_["3043ui_story"]
			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 and arg_63_1.var_.characterEffect3043ui_story == nil then
				arg_63_1.var_.characterEffect3043ui_story = var_66_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_30 = 0.200000002980232

			if var_66_29 <= arg_63_1.time_ and arg_63_1.time_ < var_66_29 + var_66_30 then
				local var_66_31 = (arg_63_1.time_ - var_66_29) / var_66_30

				if arg_63_1.var_.characterEffect3043ui_story then
					local var_66_32 = Mathf.Lerp(0, 0.5, var_66_31)

					arg_63_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_63_1.var_.characterEffect3043ui_story.fillRatio = var_66_32
				end
			end

			if arg_63_1.time_ >= var_66_29 + var_66_30 and arg_63_1.time_ < var_66_29 + var_66_30 + arg_66_0 and arg_63_1.var_.characterEffect3043ui_story then
				local var_66_33 = 0.5

				arg_63_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_63_1.var_.characterEffect3043ui_story.fillRatio = var_66_33
			end

			local var_66_34 = arg_63_1.actors_["1097ui_story"].transform
			local var_66_35 = 0

			if var_66_35 < arg_63_1.time_ and arg_63_1.time_ <= var_66_35 + arg_66_0 then
				arg_63_1.var_.moveOldPos1097ui_story = var_66_34.localPosition
			end

			local var_66_36 = 0.001

			if var_66_35 <= arg_63_1.time_ and arg_63_1.time_ < var_66_35 + var_66_36 then
				local var_66_37 = (arg_63_1.time_ - var_66_35) / var_66_36
				local var_66_38 = Vector3.New(0, 100, 0)

				var_66_34.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1097ui_story, var_66_38, var_66_37)

				local var_66_39 = manager.ui.mainCamera.transform.position - var_66_34.position

				var_66_34.forward = Vector3.New(var_66_39.x, var_66_39.y, var_66_39.z)

				local var_66_40 = var_66_34.localEulerAngles

				var_66_40.z = 0
				var_66_40.x = 0
				var_66_34.localEulerAngles = var_66_40
			end

			if arg_63_1.time_ >= var_66_35 + var_66_36 and arg_63_1.time_ < var_66_35 + var_66_36 + arg_66_0 then
				var_66_34.localPosition = Vector3.New(0, 100, 0)

				local var_66_41 = manager.ui.mainCamera.transform.position - var_66_34.position

				var_66_34.forward = Vector3.New(var_66_41.x, var_66_41.y, var_66_41.z)

				local var_66_42 = var_66_34.localEulerAngles

				var_66_42.z = 0
				var_66_42.x = 0
				var_66_34.localEulerAngles = var_66_42
			end

			local var_66_43 = arg_63_1.actors_["1097ui_story"]
			local var_66_44 = 0

			if var_66_44 < arg_63_1.time_ and arg_63_1.time_ <= var_66_44 + arg_66_0 and arg_63_1.var_.characterEffect1097ui_story == nil then
				arg_63_1.var_.characterEffect1097ui_story = var_66_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_45 = 0.200000002980232

			if var_66_44 <= arg_63_1.time_ and arg_63_1.time_ < var_66_44 + var_66_45 then
				local var_66_46 = (arg_63_1.time_ - var_66_44) / var_66_45

				if arg_63_1.var_.characterEffect1097ui_story then
					local var_66_47 = Mathf.Lerp(0, 0.5, var_66_46)

					arg_63_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1097ui_story.fillRatio = var_66_47
				end
			end

			if arg_63_1.time_ >= var_66_44 + var_66_45 and arg_63_1.time_ < var_66_44 + var_66_45 + arg_66_0 and arg_63_1.var_.characterEffect1097ui_story then
				local var_66_48 = 0.5

				arg_63_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1097ui_story.fillRatio = var_66_48
			end

			local var_66_49 = 0
			local var_66_50 = 0.625

			if var_66_49 < arg_63_1.time_ and arg_63_1.time_ <= var_66_49 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_51 = arg_63_1:FormatText(StoryNameCfg[918].name)

				arg_63_1.leftNameTxt_.text = var_66_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_52 = arg_63_1:GetWordFromCfg(412031016)
				local var_66_53 = arg_63_1:FormatText(var_66_52.content)

				arg_63_1.text_.text = var_66_53

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_54 = 25
				local var_66_55 = utf8.len(var_66_53)
				local var_66_56 = var_66_54 <= 0 and var_66_50 or var_66_50 * (var_66_55 / var_66_54)

				if var_66_56 > 0 and var_66_50 < var_66_56 then
					arg_63_1.talkMaxDuration = var_66_56

					if var_66_56 + var_66_49 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_56 + var_66_49
					end
				end

				arg_63_1.text_.text = var_66_53
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031016", "story_v_out_412031.awb") ~= 0 then
					local var_66_57 = manager.audio:GetVoiceLength("story_v_out_412031", "412031016", "story_v_out_412031.awb") / 1000

					if var_66_57 + var_66_49 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_57 + var_66_49
					end

					if var_66_52.prefab_name ~= "" and arg_63_1.actors_[var_66_52.prefab_name] ~= nil then
						local var_66_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_52.prefab_name].transform, "story_v_out_412031", "412031016", "story_v_out_412031.awb")

						arg_63_1:RecordAudio("412031016", var_66_58)
						arg_63_1:RecordAudio("412031016", var_66_58)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_412031", "412031016", "story_v_out_412031.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_412031", "412031016", "story_v_out_412031.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_59 = math.max(var_66_50, arg_63_1.talkMaxDuration)

			if var_66_49 <= arg_63_1.time_ and arg_63_1.time_ < var_66_49 + var_66_59 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_49) / var_66_59

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_49 + var_66_59 and arg_63_1.time_ < var_66_49 + var_66_59 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play412031017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 412031017
		arg_67_1.duration_ = 5.466

		local var_67_0 = {
			zh = 5.466,
			ja = 3.833
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
				arg_67_0:Play412031018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "10076ui_story"

			if arg_67_1.actors_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(Asset.Load("Char/" .. var_70_0), arg_67_1.stage_.transform)

				var_70_1.name = var_70_0
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_0] = var_70_1

				local var_70_2 = var_70_1:GetComponentInChildren(typeof(CharacterEffect))

				var_70_2.enabled = true

				local var_70_3 = GameObjectTools.GetOrAddComponent(var_70_1, typeof(DynamicBoneHelper))

				if var_70_3 then
					var_70_3:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_2.transform, false)

				arg_67_1.var_[var_70_0 .. "Animator"] = var_70_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_0 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_0 .. "LipSync"] = var_70_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_4 = arg_67_1.actors_["10076ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos10076ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(0, -0.35, -4)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10076ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -0.35, -4)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = arg_67_1.actors_["10076ui_story"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.characterEffect10076ui_story == nil then
				arg_67_1.var_.characterEffect10076ui_story = var_70_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_15 = 0.200000002980232

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.characterEffect10076ui_story then
					arg_67_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect10076ui_story then
				arg_67_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action2_1")
			end

			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_19 = arg_67_1.actors_["10083ui_story"].transform
			local var_70_20 = 0

			if var_70_20 < arg_67_1.time_ and arg_67_1.time_ <= var_70_20 + arg_70_0 then
				arg_67_1.var_.moveOldPos10083ui_story = var_70_19.localPosition
			end

			local var_70_21 = 0.001

			if var_70_20 <= arg_67_1.time_ and arg_67_1.time_ < var_70_20 + var_70_21 then
				local var_70_22 = (arg_67_1.time_ - var_70_20) / var_70_21
				local var_70_23 = Vector3.New(0, 100, 0)

				var_70_19.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10083ui_story, var_70_23, var_70_22)

				local var_70_24 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_24.x, var_70_24.y, var_70_24.z)

				local var_70_25 = var_70_19.localEulerAngles

				var_70_25.z = 0
				var_70_25.x = 0
				var_70_19.localEulerAngles = var_70_25
			end

			if arg_67_1.time_ >= var_70_20 + var_70_21 and arg_67_1.time_ < var_70_20 + var_70_21 + arg_70_0 then
				var_70_19.localPosition = Vector3.New(0, 100, 0)

				local var_70_26 = manager.ui.mainCamera.transform.position - var_70_19.position

				var_70_19.forward = Vector3.New(var_70_26.x, var_70_26.y, var_70_26.z)

				local var_70_27 = var_70_19.localEulerAngles

				var_70_27.z = 0
				var_70_27.x = 0
				var_70_19.localEulerAngles = var_70_27
			end

			local var_70_28 = arg_67_1.actors_["10083ui_story"]
			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 and arg_67_1.var_.characterEffect10083ui_story == nil then
				arg_67_1.var_.characterEffect10083ui_story = var_70_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_30 = 0.200000002980232

			if var_70_29 <= arg_67_1.time_ and arg_67_1.time_ < var_70_29 + var_70_30 then
				local var_70_31 = (arg_67_1.time_ - var_70_29) / var_70_30

				if arg_67_1.var_.characterEffect10083ui_story then
					local var_70_32 = Mathf.Lerp(0, 0.5, var_70_31)

					arg_67_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10083ui_story.fillRatio = var_70_32
				end
			end

			if arg_67_1.time_ >= var_70_29 + var_70_30 and arg_67_1.time_ < var_70_29 + var_70_30 + arg_70_0 and arg_67_1.var_.characterEffect10083ui_story then
				local var_70_33 = 0.5

				arg_67_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10083ui_story.fillRatio = var_70_33
			end

			local var_70_34 = 0
			local var_70_35 = 0.675

			if var_70_34 < arg_67_1.time_ and arg_67_1.time_ <= var_70_34 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_36 = arg_67_1:FormatText(StoryNameCfg[917].name)

				arg_67_1.leftNameTxt_.text = var_70_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_37 = arg_67_1:GetWordFromCfg(412031017)
				local var_70_38 = arg_67_1:FormatText(var_70_37.content)

				arg_67_1.text_.text = var_70_38

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_39 = 27
				local var_70_40 = utf8.len(var_70_38)
				local var_70_41 = var_70_39 <= 0 and var_70_35 or var_70_35 * (var_70_40 / var_70_39)

				if var_70_41 > 0 and var_70_35 < var_70_41 then
					arg_67_1.talkMaxDuration = var_70_41

					if var_70_41 + var_70_34 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_41 + var_70_34
					end
				end

				arg_67_1.text_.text = var_70_38
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031017", "story_v_out_412031.awb") ~= 0 then
					local var_70_42 = manager.audio:GetVoiceLength("story_v_out_412031", "412031017", "story_v_out_412031.awb") / 1000

					if var_70_42 + var_70_34 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_42 + var_70_34
					end

					if var_70_37.prefab_name ~= "" and arg_67_1.actors_[var_70_37.prefab_name] ~= nil then
						local var_70_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_37.prefab_name].transform, "story_v_out_412031", "412031017", "story_v_out_412031.awb")

						arg_67_1:RecordAudio("412031017", var_70_43)
						arg_67_1:RecordAudio("412031017", var_70_43)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_412031", "412031017", "story_v_out_412031.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_412031", "412031017", "story_v_out_412031.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_44 = math.max(var_70_35, arg_67_1.talkMaxDuration)

			if var_70_34 <= arg_67_1.time_ and arg_67_1.time_ < var_70_34 + var_70_44 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_34) / var_70_44

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_34 + var_70_44 and arg_67_1.time_ < var_70_34 + var_70_44 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play412031018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 412031018
		arg_71_1.duration_ = 1.999999999999

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play412031019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = "10078ui_story"

			if arg_71_1.actors_[var_74_0] == nil then
				local var_74_1 = Object.Instantiate(Asset.Load("Char/" .. var_74_0), arg_71_1.stage_.transform)

				var_74_1.name = var_74_0
				var_74_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_71_1.actors_[var_74_0] = var_74_1

				local var_74_2 = var_74_1:GetComponentInChildren(typeof(CharacterEffect))

				var_74_2.enabled = true

				local var_74_3 = GameObjectTools.GetOrAddComponent(var_74_1, typeof(DynamicBoneHelper))

				if var_74_3 then
					var_74_3:EnableDynamicBone(false)
				end

				arg_71_1:ShowWeapon(var_74_2.transform, false)

				arg_71_1.var_[var_74_0 .. "Animator"] = var_74_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_71_1.var_[var_74_0 .. "Animator"].applyRootMotion = true
				arg_71_1.var_[var_74_0 .. "LipSync"] = var_74_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_74_4 = arg_71_1.actors_["10078ui_story"].transform
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1.var_.moveOldPos10078ui_story = var_74_4.localPosition
			end

			local var_74_6 = 0.001

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6
				local var_74_8 = Vector3.New(0, -0.5, -6.3)

				var_74_4.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10078ui_story, var_74_8, var_74_7)

				local var_74_9 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_9.x, var_74_9.y, var_74_9.z)

				local var_74_10 = var_74_4.localEulerAngles

				var_74_10.z = 0
				var_74_10.x = 0
				var_74_4.localEulerAngles = var_74_10
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 then
				var_74_4.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_74_11 = manager.ui.mainCamera.transform.position - var_74_4.position

				var_74_4.forward = Vector3.New(var_74_11.x, var_74_11.y, var_74_11.z)

				local var_74_12 = var_74_4.localEulerAngles

				var_74_12.z = 0
				var_74_12.x = 0
				var_74_4.localEulerAngles = var_74_12
			end

			local var_74_13 = arg_71_1.actors_["10078ui_story"]
			local var_74_14 = 0

			if var_74_14 < arg_71_1.time_ and arg_71_1.time_ <= var_74_14 + arg_74_0 and arg_71_1.var_.characterEffect10078ui_story == nil then
				arg_71_1.var_.characterEffect10078ui_story = var_74_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_15 = 0.200000002980232

			if var_74_14 <= arg_71_1.time_ and arg_71_1.time_ < var_74_14 + var_74_15 then
				local var_74_16 = (arg_71_1.time_ - var_74_14) / var_74_15

				if arg_71_1.var_.characterEffect10078ui_story then
					arg_71_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_14 + var_74_15 and arg_71_1.time_ < var_74_14 + var_74_15 + arg_74_0 and arg_71_1.var_.characterEffect10078ui_story then
				arg_71_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_74_17 = 0

			if var_74_17 < arg_71_1.time_ and arg_71_1.time_ <= var_74_17 + arg_74_0 then
				arg_71_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_74_18 = 0

			if var_74_18 < arg_71_1.time_ and arg_71_1.time_ <= var_74_18 + arg_74_0 then
				arg_71_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_74_19 = arg_71_1.actors_["10076ui_story"].transform
			local var_74_20 = 0

			if var_74_20 < arg_71_1.time_ and arg_71_1.time_ <= var_74_20 + arg_74_0 then
				arg_71_1.var_.moveOldPos10076ui_story = var_74_19.localPosition
			end

			local var_74_21 = 0.001

			if var_74_20 <= arg_71_1.time_ and arg_71_1.time_ < var_74_20 + var_74_21 then
				local var_74_22 = (arg_71_1.time_ - var_74_20) / var_74_21
				local var_74_23 = Vector3.New(0, 100, 0)

				var_74_19.localPosition = Vector3.Lerp(arg_71_1.var_.moveOldPos10076ui_story, var_74_23, var_74_22)

				local var_74_24 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_24.x, var_74_24.y, var_74_24.z)

				local var_74_25 = var_74_19.localEulerAngles

				var_74_25.z = 0
				var_74_25.x = 0
				var_74_19.localEulerAngles = var_74_25
			end

			if arg_71_1.time_ >= var_74_20 + var_74_21 and arg_71_1.time_ < var_74_20 + var_74_21 + arg_74_0 then
				var_74_19.localPosition = Vector3.New(0, 100, 0)

				local var_74_26 = manager.ui.mainCamera.transform.position - var_74_19.position

				var_74_19.forward = Vector3.New(var_74_26.x, var_74_26.y, var_74_26.z)

				local var_74_27 = var_74_19.localEulerAngles

				var_74_27.z = 0
				var_74_27.x = 0
				var_74_19.localEulerAngles = var_74_27
			end

			local var_74_28 = arg_71_1.actors_["10076ui_story"]
			local var_74_29 = 0

			if var_74_29 < arg_71_1.time_ and arg_71_1.time_ <= var_74_29 + arg_74_0 and arg_71_1.var_.characterEffect10076ui_story == nil then
				arg_71_1.var_.characterEffect10076ui_story = var_74_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_30 = 0.200000002980232

			if var_74_29 <= arg_71_1.time_ and arg_71_1.time_ < var_74_29 + var_74_30 then
				local var_74_31 = (arg_71_1.time_ - var_74_29) / var_74_30

				if arg_71_1.var_.characterEffect10076ui_story then
					local var_74_32 = Mathf.Lerp(0, 0.5, var_74_31)

					arg_71_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10076ui_story.fillRatio = var_74_32
				end
			end

			if arg_71_1.time_ >= var_74_29 + var_74_30 and arg_71_1.time_ < var_74_29 + var_74_30 + arg_74_0 and arg_71_1.var_.characterEffect10076ui_story then
				local var_74_33 = 0.5

				arg_71_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10076ui_story.fillRatio = var_74_33
			end

			local var_74_34 = 0
			local var_74_35 = 0.05

			if var_74_34 < arg_71_1.time_ and arg_71_1.time_ <= var_74_34 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_36 = arg_71_1:FormatText(StoryNameCfg[919].name)

				arg_71_1.leftNameTxt_.text = var_74_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_37 = arg_71_1:GetWordFromCfg(412031018)
				local var_74_38 = arg_71_1:FormatText(var_74_37.content)

				arg_71_1.text_.text = var_74_38

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_39 = 2
				local var_74_40 = utf8.len(var_74_38)
				local var_74_41 = var_74_39 <= 0 and var_74_35 or var_74_35 * (var_74_40 / var_74_39)

				if var_74_41 > 0 and var_74_35 < var_74_41 then
					arg_71_1.talkMaxDuration = var_74_41

					if var_74_41 + var_74_34 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_41 + var_74_34
					end
				end

				arg_71_1.text_.text = var_74_38
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031018", "story_v_out_412031.awb") ~= 0 then
					local var_74_42 = manager.audio:GetVoiceLength("story_v_out_412031", "412031018", "story_v_out_412031.awb") / 1000

					if var_74_42 + var_74_34 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_42 + var_74_34
					end

					if var_74_37.prefab_name ~= "" and arg_71_1.actors_[var_74_37.prefab_name] ~= nil then
						local var_74_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_37.prefab_name].transform, "story_v_out_412031", "412031018", "story_v_out_412031.awb")

						arg_71_1:RecordAudio("412031018", var_74_43)
						arg_71_1:RecordAudio("412031018", var_74_43)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_412031", "412031018", "story_v_out_412031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_412031", "412031018", "story_v_out_412031.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_44 = math.max(var_74_35, arg_71_1.talkMaxDuration)

			if var_74_34 <= arg_71_1.time_ and arg_71_1.time_ < var_74_34 + var_74_44 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_34) / var_74_44

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_34 + var_74_44 and arg_71_1.time_ < var_74_34 + var_74_44 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play412031019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 412031019
		arg_75_1.duration_ = 5.066

		local var_75_0 = {
			zh = 4.966,
			ja = 5.066
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
				arg_75_0:Play412031020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1097ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1097ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1097ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1097ui_story"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 and arg_75_1.var_.characterEffect1097ui_story == nil then
				arg_75_1.var_.characterEffect1097ui_story = var_78_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_11 = 0.200000002980232

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11

				if arg_75_1.var_.characterEffect1097ui_story then
					arg_75_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 and arg_75_1.var_.characterEffect1097ui_story then
				arg_75_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_78_13 = 0

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 then
				arg_75_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_15 = arg_75_1.actors_["10078ui_story"].transform
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 then
				arg_75_1.var_.moveOldPos10078ui_story = var_78_15.localPosition
			end

			local var_78_17 = 0.001

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17
				local var_78_19 = Vector3.New(0, 100, 0)

				var_78_15.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10078ui_story, var_78_19, var_78_18)

				local var_78_20 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_20.x, var_78_20.y, var_78_20.z)

				local var_78_21 = var_78_15.localEulerAngles

				var_78_21.z = 0
				var_78_21.x = 0
				var_78_15.localEulerAngles = var_78_21
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 then
				var_78_15.localPosition = Vector3.New(0, 100, 0)

				local var_78_22 = manager.ui.mainCamera.transform.position - var_78_15.position

				var_78_15.forward = Vector3.New(var_78_22.x, var_78_22.y, var_78_22.z)

				local var_78_23 = var_78_15.localEulerAngles

				var_78_23.z = 0
				var_78_23.x = 0
				var_78_15.localEulerAngles = var_78_23
			end

			local var_78_24 = arg_75_1.actors_["10078ui_story"]
			local var_78_25 = 0

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 and arg_75_1.var_.characterEffect10078ui_story == nil then
				arg_75_1.var_.characterEffect10078ui_story = var_78_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_26 = 0.200000002980232

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_26 then
				local var_78_27 = (arg_75_1.time_ - var_78_25) / var_78_26

				if arg_75_1.var_.characterEffect10078ui_story then
					local var_78_28 = Mathf.Lerp(0, 0.5, var_78_27)

					arg_75_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_75_1.var_.characterEffect10078ui_story.fillRatio = var_78_28
				end
			end

			if arg_75_1.time_ >= var_78_25 + var_78_26 and arg_75_1.time_ < var_78_25 + var_78_26 + arg_78_0 and arg_75_1.var_.characterEffect10078ui_story then
				local var_78_29 = 0.5

				arg_75_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_75_1.var_.characterEffect10078ui_story.fillRatio = var_78_29
			end

			local var_78_30 = 0
			local var_78_31 = 0.45

			if var_78_30 < arg_75_1.time_ and arg_75_1.time_ <= var_78_30 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_32 = arg_75_1:FormatText(StoryNameCfg[216].name)

				arg_75_1.leftNameTxt_.text = var_78_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_33 = arg_75_1:GetWordFromCfg(412031019)
				local var_78_34 = arg_75_1:FormatText(var_78_33.content)

				arg_75_1.text_.text = var_78_34

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_35 = 18
				local var_78_36 = utf8.len(var_78_34)
				local var_78_37 = var_78_35 <= 0 and var_78_31 or var_78_31 * (var_78_36 / var_78_35)

				if var_78_37 > 0 and var_78_31 < var_78_37 then
					arg_75_1.talkMaxDuration = var_78_37

					if var_78_37 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_37 + var_78_30
					end
				end

				arg_75_1.text_.text = var_78_34
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031019", "story_v_out_412031.awb") ~= 0 then
					local var_78_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031019", "story_v_out_412031.awb") / 1000

					if var_78_38 + var_78_30 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_38 + var_78_30
					end

					if var_78_33.prefab_name ~= "" and arg_75_1.actors_[var_78_33.prefab_name] ~= nil then
						local var_78_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_33.prefab_name].transform, "story_v_out_412031", "412031019", "story_v_out_412031.awb")

						arg_75_1:RecordAudio("412031019", var_78_39)
						arg_75_1:RecordAudio("412031019", var_78_39)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_412031", "412031019", "story_v_out_412031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_412031", "412031019", "story_v_out_412031.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_40 = math.max(var_78_31, arg_75_1.talkMaxDuration)

			if var_78_30 <= arg_75_1.time_ and arg_75_1.time_ < var_78_30 + var_78_40 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_30) / var_78_40

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_30 + var_78_40 and arg_75_1.time_ < var_78_30 + var_78_40 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play412031020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 412031020
		arg_79_1.duration_ = 7.366

		local var_79_0 = {
			zh = 5.066,
			ja = 7.366
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
				arg_79_0:Play412031021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["3043ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos3043ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0.7, -1.41, -5.7)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos3043ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["3043ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect3043ui_story == nil then
				arg_79_1.var_.characterEffect3043ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect3043ui_story then
					arg_79_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect3043ui_story then
				arg_79_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action2_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_15 = arg_79_1.actors_["1097ui_story"]
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect1097ui_story == nil then
				arg_79_1.var_.characterEffect1097ui_story = var_82_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_17 = 0.200000002980232

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17

				if arg_79_1.var_.characterEffect1097ui_story then
					local var_82_19 = Mathf.Lerp(0, 0.5, var_82_18)

					arg_79_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1097ui_story.fillRatio = var_82_19
				end
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 and arg_79_1.var_.characterEffect1097ui_story then
				local var_82_20 = 0.5

				arg_79_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1097ui_story.fillRatio = var_82_20
			end

			local var_82_21 = 0
			local var_82_22 = 0.525

			if var_82_21 < arg_79_1.time_ and arg_79_1.time_ <= var_82_21 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_23 = arg_79_1:FormatText(StoryNameCfg[920].name)

				arg_79_1.leftNameTxt_.text = var_82_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_24 = arg_79_1:GetWordFromCfg(412031020)
				local var_82_25 = arg_79_1:FormatText(var_82_24.content)

				arg_79_1.text_.text = var_82_25

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_26 = 21
				local var_82_27 = utf8.len(var_82_25)
				local var_82_28 = var_82_26 <= 0 and var_82_22 or var_82_22 * (var_82_27 / var_82_26)

				if var_82_28 > 0 and var_82_22 < var_82_28 then
					arg_79_1.talkMaxDuration = var_82_28

					if var_82_28 + var_82_21 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_28 + var_82_21
					end
				end

				arg_79_1.text_.text = var_82_25
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031020", "story_v_out_412031.awb") ~= 0 then
					local var_82_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031020", "story_v_out_412031.awb") / 1000

					if var_82_29 + var_82_21 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_29 + var_82_21
					end

					if var_82_24.prefab_name ~= "" and arg_79_1.actors_[var_82_24.prefab_name] ~= nil then
						local var_82_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_24.prefab_name].transform, "story_v_out_412031", "412031020", "story_v_out_412031.awb")

						arg_79_1:RecordAudio("412031020", var_82_30)
						arg_79_1:RecordAudio("412031020", var_82_30)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_412031", "412031020", "story_v_out_412031.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_412031", "412031020", "story_v_out_412031.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_31 = math.max(var_82_22, arg_79_1.talkMaxDuration)

			if var_82_21 <= arg_79_1.time_ and arg_79_1.time_ < var_82_21 + var_82_31 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_21) / var_82_31

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_21 + var_82_31 and arg_79_1.time_ < var_82_21 + var_82_31 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play412031021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 412031021
		arg_83_1.duration_ = 12.7

		local var_83_0 = {
			zh = 10.8,
			ja = 12.7
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
				arg_83_0:Play412031022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "ST30"

			if arg_83_1.bgs_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(arg_83_1.paintGo_)

				var_86_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_86_0)
				var_86_1.name = var_86_0
				var_86_1.transform.parent = arg_83_1.stage_.transform
				var_86_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.bgs_[var_86_0] = var_86_1
			end

			local var_86_2 = 2

			if var_86_2 < arg_83_1.time_ and arg_83_1.time_ <= var_86_2 + arg_86_0 then
				local var_86_3 = manager.ui.mainCamera.transform.localPosition
				local var_86_4 = Vector3.New(0, 0, 10) + Vector3.New(var_86_3.x, var_86_3.y, 0)
				local var_86_5 = arg_83_1.bgs_.ST30

				var_86_5.transform.localPosition = var_86_4
				var_86_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_6 = var_86_5:GetComponent("SpriteRenderer")

				if var_86_6 and var_86_6.sprite then
					local var_86_7 = (var_86_5.transform.localPosition - var_86_3).z
					local var_86_8 = manager.ui.mainCameraCom_
					local var_86_9 = 2 * var_86_7 * Mathf.Tan(var_86_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_10 = var_86_9 * var_86_8.aspect
					local var_86_11 = var_86_6.sprite.bounds.size.x
					local var_86_12 = var_86_6.sprite.bounds.size.y
					local var_86_13 = var_86_10 / var_86_11
					local var_86_14 = var_86_9 / var_86_12
					local var_86_15 = var_86_14 < var_86_13 and var_86_13 or var_86_14

					var_86_5.transform.localScale = Vector3.New(var_86_15, var_86_15, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "ST30" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_16 = 4

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 then
				arg_83_1.allBtn_.enabled = false
			end

			local var_86_17 = 0.3

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 then
				arg_83_1.allBtn_.enabled = true
			end

			local var_86_18 = 0

			if var_86_18 < arg_83_1.time_ and arg_83_1.time_ <= var_86_18 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_19 = 2

			if var_86_18 <= arg_83_1.time_ and arg_83_1.time_ < var_86_18 + var_86_19 then
				local var_86_20 = (arg_83_1.time_ - var_86_18) / var_86_19
				local var_86_21 = Color.New(0, 0, 0)

				var_86_21.a = Mathf.Lerp(0, 1, var_86_20)
				arg_83_1.mask_.color = var_86_21
			end

			if arg_83_1.time_ >= var_86_18 + var_86_19 and arg_83_1.time_ < var_86_18 + var_86_19 + arg_86_0 then
				local var_86_22 = Color.New(0, 0, 0)

				var_86_22.a = 1
				arg_83_1.mask_.color = var_86_22
			end

			local var_86_23 = 2

			if var_86_23 < arg_83_1.time_ and arg_83_1.time_ <= var_86_23 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = true

				arg_83_1:SetGaussion(false)
			end

			local var_86_24 = 2

			if var_86_23 <= arg_83_1.time_ and arg_83_1.time_ < var_86_23 + var_86_24 then
				local var_86_25 = (arg_83_1.time_ - var_86_23) / var_86_24
				local var_86_26 = Color.New(0, 0, 0)

				var_86_26.a = Mathf.Lerp(1, 0, var_86_25)
				arg_83_1.mask_.color = var_86_26
			end

			if arg_83_1.time_ >= var_86_23 + var_86_24 and arg_83_1.time_ < var_86_23 + var_86_24 + arg_86_0 then
				local var_86_27 = Color.New(0, 0, 0)
				local var_86_28 = 0

				arg_83_1.mask_.enabled = false
				var_86_27.a = var_86_28
				arg_83_1.mask_.color = var_86_27
			end

			local var_86_29 = arg_83_1.actors_["3043ui_story"].transform
			local var_86_30 = 3.8

			if var_86_30 < arg_83_1.time_ and arg_83_1.time_ <= var_86_30 + arg_86_0 then
				arg_83_1.var_.moveOldPos3043ui_story = var_86_29.localPosition
			end

			local var_86_31 = 0.001

			if var_86_30 <= arg_83_1.time_ and arg_83_1.time_ < var_86_30 + var_86_31 then
				local var_86_32 = (arg_83_1.time_ - var_86_30) / var_86_31
				local var_86_33 = Vector3.New(0, -1.41, -5.7)

				var_86_29.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos3043ui_story, var_86_33, var_86_32)

				local var_86_34 = manager.ui.mainCamera.transform.position - var_86_29.position

				var_86_29.forward = Vector3.New(var_86_34.x, var_86_34.y, var_86_34.z)

				local var_86_35 = var_86_29.localEulerAngles

				var_86_35.z = 0
				var_86_35.x = 0
				var_86_29.localEulerAngles = var_86_35
			end

			if arg_83_1.time_ >= var_86_30 + var_86_31 and arg_83_1.time_ < var_86_30 + var_86_31 + arg_86_0 then
				var_86_29.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_86_36 = manager.ui.mainCamera.transform.position - var_86_29.position

				var_86_29.forward = Vector3.New(var_86_36.x, var_86_36.y, var_86_36.z)

				local var_86_37 = var_86_29.localEulerAngles

				var_86_37.z = 0
				var_86_37.x = 0
				var_86_29.localEulerAngles = var_86_37
			end

			local var_86_38 = arg_83_1.actors_["3043ui_story"]
			local var_86_39 = 3.8

			if var_86_39 < arg_83_1.time_ and arg_83_1.time_ <= var_86_39 + arg_86_0 and arg_83_1.var_.characterEffect3043ui_story == nil then
				arg_83_1.var_.characterEffect3043ui_story = var_86_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_40 = 0.200000002980232

			if var_86_39 <= arg_83_1.time_ and arg_83_1.time_ < var_86_39 + var_86_40 then
				local var_86_41 = (arg_83_1.time_ - var_86_39) / var_86_40

				if arg_83_1.var_.characterEffect3043ui_story then
					arg_83_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_39 + var_86_40 and arg_83_1.time_ < var_86_39 + var_86_40 + arg_86_0 and arg_83_1.var_.characterEffect3043ui_story then
				arg_83_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_86_42 = 3.8

			if var_86_42 < arg_83_1.time_ and arg_83_1.time_ <= var_86_42 + arg_86_0 then
				arg_83_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_86_43 = 3.8

			if var_86_43 < arg_83_1.time_ and arg_83_1.time_ <= var_86_43 + arg_86_0 then
				arg_83_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_44 = arg_83_1.actors_["3043ui_story"].transform
			local var_86_45 = 1.96599999815226

			if var_86_45 < arg_83_1.time_ and arg_83_1.time_ <= var_86_45 + arg_86_0 then
				arg_83_1.var_.moveOldPos3043ui_story = var_86_44.localPosition
			end

			local var_86_46 = 0.001

			if var_86_45 <= arg_83_1.time_ and arg_83_1.time_ < var_86_45 + var_86_46 then
				local var_86_47 = (arg_83_1.time_ - var_86_45) / var_86_46
				local var_86_48 = Vector3.New(0, 100, 0)

				var_86_44.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos3043ui_story, var_86_48, var_86_47)

				local var_86_49 = manager.ui.mainCamera.transform.position - var_86_44.position

				var_86_44.forward = Vector3.New(var_86_49.x, var_86_49.y, var_86_49.z)

				local var_86_50 = var_86_44.localEulerAngles

				var_86_50.z = 0
				var_86_50.x = 0
				var_86_44.localEulerAngles = var_86_50
			end

			if arg_83_1.time_ >= var_86_45 + var_86_46 and arg_83_1.time_ < var_86_45 + var_86_46 + arg_86_0 then
				var_86_44.localPosition = Vector3.New(0, 100, 0)

				local var_86_51 = manager.ui.mainCamera.transform.position - var_86_44.position

				var_86_44.forward = Vector3.New(var_86_51.x, var_86_51.y, var_86_51.z)

				local var_86_52 = var_86_44.localEulerAngles

				var_86_52.z = 0
				var_86_52.x = 0
				var_86_44.localEulerAngles = var_86_52
			end

			local var_86_53 = arg_83_1.actors_["1097ui_story"].transform
			local var_86_54 = 1.96599999815226

			if var_86_54 < arg_83_1.time_ and arg_83_1.time_ <= var_86_54 + arg_86_0 then
				arg_83_1.var_.moveOldPos1097ui_story = var_86_53.localPosition
			end

			local var_86_55 = 0.001

			if var_86_54 <= arg_83_1.time_ and arg_83_1.time_ < var_86_54 + var_86_55 then
				local var_86_56 = (arg_83_1.time_ - var_86_54) / var_86_55
				local var_86_57 = Vector3.New(0, 100, 0)

				var_86_53.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1097ui_story, var_86_57, var_86_56)

				local var_86_58 = manager.ui.mainCamera.transform.position - var_86_53.position

				var_86_53.forward = Vector3.New(var_86_58.x, var_86_58.y, var_86_58.z)

				local var_86_59 = var_86_53.localEulerAngles

				var_86_59.z = 0
				var_86_59.x = 0
				var_86_53.localEulerAngles = var_86_59
			end

			if arg_83_1.time_ >= var_86_54 + var_86_55 and arg_83_1.time_ < var_86_54 + var_86_55 + arg_86_0 then
				var_86_53.localPosition = Vector3.New(0, 100, 0)

				local var_86_60 = manager.ui.mainCamera.transform.position - var_86_53.position

				var_86_53.forward = Vector3.New(var_86_60.x, var_86_60.y, var_86_60.z)

				local var_86_61 = var_86_53.localEulerAngles

				var_86_61.z = 0
				var_86_61.x = 0
				var_86_53.localEulerAngles = var_86_61
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_62 = 4
			local var_86_63 = 0.675

			if var_86_62 < arg_83_1.time_ and arg_83_1.time_ <= var_86_62 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_64 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_64:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_64:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_64:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_65 = arg_83_1:FormatText(StoryNameCfg[920].name)

				arg_83_1.leftNameTxt_.text = var_86_65

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_66 = arg_83_1:GetWordFromCfg(412031021)
				local var_86_67 = arg_83_1:FormatText(var_86_66.content)

				arg_83_1.text_.text = var_86_67

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_68 = 27
				local var_86_69 = utf8.len(var_86_67)
				local var_86_70 = var_86_68 <= 0 and var_86_63 or var_86_63 * (var_86_69 / var_86_68)

				if var_86_70 > 0 and var_86_63 < var_86_70 then
					arg_83_1.talkMaxDuration = var_86_70
					var_86_62 = var_86_62 + 0.3

					if var_86_70 + var_86_62 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_70 + var_86_62
					end
				end

				arg_83_1.text_.text = var_86_67
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031021", "story_v_out_412031.awb") ~= 0 then
					local var_86_71 = manager.audio:GetVoiceLength("story_v_out_412031", "412031021", "story_v_out_412031.awb") / 1000

					if var_86_71 + var_86_62 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_71 + var_86_62
					end

					if var_86_66.prefab_name ~= "" and arg_83_1.actors_[var_86_66.prefab_name] ~= nil then
						local var_86_72 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_66.prefab_name].transform, "story_v_out_412031", "412031021", "story_v_out_412031.awb")

						arg_83_1:RecordAudio("412031021", var_86_72)
						arg_83_1:RecordAudio("412031021", var_86_72)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_412031", "412031021", "story_v_out_412031.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_412031", "412031021", "story_v_out_412031.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_73 = var_86_62 + 0.3
			local var_86_74 = math.max(var_86_63, arg_83_1.talkMaxDuration)

			if var_86_73 <= arg_83_1.time_ and arg_83_1.time_ < var_86_73 + var_86_74 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_73) / var_86_74

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_73 + var_86_74 and arg_83_1.time_ < var_86_73 + var_86_74 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play412031022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 412031022
		arg_89_1.duration_ = 6.6

		local var_89_0 = {
			zh = 3.466,
			ja = 6.6
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
				arg_89_0:Play412031023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1097ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1097ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1097ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = arg_89_1.actors_["1097ui_story"]
			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 and arg_89_1.var_.characterEffect1097ui_story == nil then
				arg_89_1.var_.characterEffect1097ui_story = var_92_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_11 = 0.200000002980232

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_11 then
				local var_92_12 = (arg_89_1.time_ - var_92_10) / var_92_11

				if arg_89_1.var_.characterEffect1097ui_story then
					arg_89_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_10 + var_92_11 and arg_89_1.time_ < var_92_10 + var_92_11 + arg_92_0 and arg_89_1.var_.characterEffect1097ui_story then
				arg_89_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_92_13 = 0

			if var_92_13 < arg_89_1.time_ and arg_89_1.time_ <= var_92_13 + arg_92_0 then
				arg_89_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 then
				arg_89_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_92_15 = arg_89_1.actors_["3043ui_story"]
			local var_92_16 = 0

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 and arg_89_1.var_.characterEffect3043ui_story == nil then
				arg_89_1.var_.characterEffect3043ui_story = var_92_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_17 = 0.200000002980232

			if var_92_16 <= arg_89_1.time_ and arg_89_1.time_ < var_92_16 + var_92_17 then
				local var_92_18 = (arg_89_1.time_ - var_92_16) / var_92_17

				if arg_89_1.var_.characterEffect3043ui_story then
					local var_92_19 = Mathf.Lerp(0, 0.5, var_92_18)

					arg_89_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_89_1.var_.characterEffect3043ui_story.fillRatio = var_92_19
				end
			end

			if arg_89_1.time_ >= var_92_16 + var_92_17 and arg_89_1.time_ < var_92_16 + var_92_17 + arg_92_0 and arg_89_1.var_.characterEffect3043ui_story then
				local var_92_20 = 0.5

				arg_89_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_89_1.var_.characterEffect3043ui_story.fillRatio = var_92_20
			end

			local var_92_21 = arg_89_1.actors_["3043ui_story"].transform
			local var_92_22 = 0

			if var_92_22 < arg_89_1.time_ and arg_89_1.time_ <= var_92_22 + arg_92_0 then
				arg_89_1.var_.moveOldPos3043ui_story = var_92_21.localPosition
			end

			local var_92_23 = 0.001

			if var_92_22 <= arg_89_1.time_ and arg_89_1.time_ < var_92_22 + var_92_23 then
				local var_92_24 = (arg_89_1.time_ - var_92_22) / var_92_23
				local var_92_25 = Vector3.New(0.7, -1.41, -5.7)

				var_92_21.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos3043ui_story, var_92_25, var_92_24)

				local var_92_26 = manager.ui.mainCamera.transform.position - var_92_21.position

				var_92_21.forward = Vector3.New(var_92_26.x, var_92_26.y, var_92_26.z)

				local var_92_27 = var_92_21.localEulerAngles

				var_92_27.z = 0
				var_92_27.x = 0
				var_92_21.localEulerAngles = var_92_27
			end

			if arg_89_1.time_ >= var_92_22 + var_92_23 and arg_89_1.time_ < var_92_22 + var_92_23 + arg_92_0 then
				var_92_21.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_92_28 = manager.ui.mainCamera.transform.position - var_92_21.position

				var_92_21.forward = Vector3.New(var_92_28.x, var_92_28.y, var_92_28.z)

				local var_92_29 = var_92_21.localEulerAngles

				var_92_29.z = 0
				var_92_29.x = 0
				var_92_21.localEulerAngles = var_92_29
			end

			local var_92_30 = 0
			local var_92_31 = 0.275

			if var_92_30 < arg_89_1.time_ and arg_89_1.time_ <= var_92_30 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_32 = arg_89_1:FormatText(StoryNameCfg[216].name)

				arg_89_1.leftNameTxt_.text = var_92_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_33 = arg_89_1:GetWordFromCfg(412031022)
				local var_92_34 = arg_89_1:FormatText(var_92_33.content)

				arg_89_1.text_.text = var_92_34

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_35 = 11
				local var_92_36 = utf8.len(var_92_34)
				local var_92_37 = var_92_35 <= 0 and var_92_31 or var_92_31 * (var_92_36 / var_92_35)

				if var_92_37 > 0 and var_92_31 < var_92_37 then
					arg_89_1.talkMaxDuration = var_92_37

					if var_92_37 + var_92_30 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_37 + var_92_30
					end
				end

				arg_89_1.text_.text = var_92_34
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031022", "story_v_out_412031.awb") ~= 0 then
					local var_92_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031022", "story_v_out_412031.awb") / 1000

					if var_92_38 + var_92_30 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_38 + var_92_30
					end

					if var_92_33.prefab_name ~= "" and arg_89_1.actors_[var_92_33.prefab_name] ~= nil then
						local var_92_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_33.prefab_name].transform, "story_v_out_412031", "412031022", "story_v_out_412031.awb")

						arg_89_1:RecordAudio("412031022", var_92_39)
						arg_89_1:RecordAudio("412031022", var_92_39)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_412031", "412031022", "story_v_out_412031.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_412031", "412031022", "story_v_out_412031.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_40 = math.max(var_92_31, arg_89_1.talkMaxDuration)

			if var_92_30 <= arg_89_1.time_ and arg_89_1.time_ < var_92_30 + var_92_40 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_30) / var_92_40

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_30 + var_92_40 and arg_89_1.time_ < var_92_30 + var_92_40 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play412031023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 412031023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play412031024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1097ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1097ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0, 100, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1097ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, 100, 0)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1097ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1097ui_story == nil then
				arg_93_1.var_.characterEffect1097ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1097ui_story then
					local var_96_13 = Mathf.Lerp(0, 0.5, var_96_12)

					arg_93_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1097ui_story.fillRatio = var_96_13
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1097ui_story then
				local var_96_14 = 0.5

				arg_93_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1097ui_story.fillRatio = var_96_14
			end

			local var_96_15 = arg_93_1.actors_["3043ui_story"].transform
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.var_.moveOldPos3043ui_story = var_96_15.localPosition
			end

			local var_96_17 = 0.001

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17
				local var_96_19 = Vector3.New(0, 100, 0)

				var_96_15.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos3043ui_story, var_96_19, var_96_18)

				local var_96_20 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_20.x, var_96_20.y, var_96_20.z)

				local var_96_21 = var_96_15.localEulerAngles

				var_96_21.z = 0
				var_96_21.x = 0
				var_96_15.localEulerAngles = var_96_21
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 then
				var_96_15.localPosition = Vector3.New(0, 100, 0)

				local var_96_22 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_22.x, var_96_22.y, var_96_22.z)

				local var_96_23 = var_96_15.localEulerAngles

				var_96_23.z = 0
				var_96_23.x = 0
				var_96_15.localEulerAngles = var_96_23
			end

			local var_96_24 = arg_93_1.actors_["3043ui_story"]
			local var_96_25 = 0

			if var_96_25 < arg_93_1.time_ and arg_93_1.time_ <= var_96_25 + arg_96_0 and arg_93_1.var_.characterEffect3043ui_story == nil then
				arg_93_1.var_.characterEffect3043ui_story = var_96_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_26 = 0.200000002980232

			if var_96_25 <= arg_93_1.time_ and arg_93_1.time_ < var_96_25 + var_96_26 then
				local var_96_27 = (arg_93_1.time_ - var_96_25) / var_96_26

				if arg_93_1.var_.characterEffect3043ui_story then
					local var_96_28 = Mathf.Lerp(0, 0.5, var_96_27)

					arg_93_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_93_1.var_.characterEffect3043ui_story.fillRatio = var_96_28
				end
			end

			if arg_93_1.time_ >= var_96_25 + var_96_26 and arg_93_1.time_ < var_96_25 + var_96_26 + arg_96_0 and arg_93_1.var_.characterEffect3043ui_story then
				local var_96_29 = 0.5

				arg_93_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_93_1.var_.characterEffect3043ui_story.fillRatio = var_96_29
			end

			local var_96_30 = 0
			local var_96_31 = 0.375

			if var_96_30 < arg_93_1.time_ and arg_93_1.time_ <= var_96_30 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_32 = arg_93_1:GetWordFromCfg(412031023)
				local var_96_33 = arg_93_1:FormatText(var_96_32.content)

				arg_93_1.text_.text = var_96_33

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_34 = 15
				local var_96_35 = utf8.len(var_96_33)
				local var_96_36 = var_96_34 <= 0 and var_96_31 or var_96_31 * (var_96_35 / var_96_34)

				if var_96_36 > 0 and var_96_31 < var_96_36 then
					arg_93_1.talkMaxDuration = var_96_36

					if var_96_36 + var_96_30 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_36 + var_96_30
					end
				end

				arg_93_1.text_.text = var_96_33
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_37 = math.max(var_96_31, arg_93_1.talkMaxDuration)

			if var_96_30 <= arg_93_1.time_ and arg_93_1.time_ < var_96_30 + var_96_37 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_30) / var_96_37

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_30 + var_96_37 and arg_93_1.time_ < var_96_30 + var_96_37 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play412031024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 412031024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play412031025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.9

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_2 = arg_97_1:GetWordFromCfg(412031024)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 36
				local var_100_5 = utf8.len(var_100_3)
				local var_100_6 = var_100_4 <= 0 and var_100_1 or var_100_1 * (var_100_5 / var_100_4)

				if var_100_6 > 0 and var_100_1 < var_100_6 then
					arg_97_1.talkMaxDuration = var_100_6

					if var_100_6 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_6 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_3
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_7 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_7 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_7

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_7 and arg_97_1.time_ < var_100_0 + var_100_7 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play412031025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 412031025
		arg_101_1.duration_ = 7.5

		local var_101_0 = {
			zh = 7.233,
			ja = 7.5
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
				arg_101_0:Play412031026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["3043ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos3043ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, -1.41, -5.7)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos3043ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["3043ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect3043ui_story == nil then
				arg_101_1.var_.characterEffect3043ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect3043ui_story then
					arg_101_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect3043ui_story then
				arg_101_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_104_13 = 0

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_15 = 0
			local var_104_16 = 0.8

			if var_104_15 < arg_101_1.time_ and arg_101_1.time_ <= var_104_15 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_17 = arg_101_1:FormatText(StoryNameCfg[920].name)

				arg_101_1.leftNameTxt_.text = var_104_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_18 = arg_101_1:GetWordFromCfg(412031025)
				local var_104_19 = arg_101_1:FormatText(var_104_18.content)

				arg_101_1.text_.text = var_104_19

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_20 = 32
				local var_104_21 = utf8.len(var_104_19)
				local var_104_22 = var_104_20 <= 0 and var_104_16 or var_104_16 * (var_104_21 / var_104_20)

				if var_104_22 > 0 and var_104_16 < var_104_22 then
					arg_101_1.talkMaxDuration = var_104_22

					if var_104_22 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_22 + var_104_15
					end
				end

				arg_101_1.text_.text = var_104_19
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031025", "story_v_out_412031.awb") ~= 0 then
					local var_104_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031025", "story_v_out_412031.awb") / 1000

					if var_104_23 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_23 + var_104_15
					end

					if var_104_18.prefab_name ~= "" and arg_101_1.actors_[var_104_18.prefab_name] ~= nil then
						local var_104_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_18.prefab_name].transform, "story_v_out_412031", "412031025", "story_v_out_412031.awb")

						arg_101_1:RecordAudio("412031025", var_104_24)
						arg_101_1:RecordAudio("412031025", var_104_24)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_412031", "412031025", "story_v_out_412031.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_412031", "412031025", "story_v_out_412031.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_25 = math.max(var_104_16, arg_101_1.talkMaxDuration)

			if var_104_15 <= arg_101_1.time_ and arg_101_1.time_ < var_104_15 + var_104_25 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_15) / var_104_25

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_15 + var_104_25 and arg_101_1.time_ < var_104_15 + var_104_25 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play412031026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 412031026
		arg_105_1.duration_ = 7.2

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play412031027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1097ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1097ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1097ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1097ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1097ui_story == nil then
				arg_105_1.var_.characterEffect1097ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1097ui_story then
					arg_105_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1097ui_story then
				arg_105_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_108_15 = arg_105_1.actors_["3043ui_story"]
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 and arg_105_1.var_.characterEffect3043ui_story == nil then
				arg_105_1.var_.characterEffect3043ui_story = var_108_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_17 = 0.200000002980232

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17

				if arg_105_1.var_.characterEffect3043ui_story then
					local var_108_19 = Mathf.Lerp(0, 0.5, var_108_18)

					arg_105_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_105_1.var_.characterEffect3043ui_story.fillRatio = var_108_19
				end
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 and arg_105_1.var_.characterEffect3043ui_story then
				local var_108_20 = 0.5

				arg_105_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_105_1.var_.characterEffect3043ui_story.fillRatio = var_108_20
			end

			local var_108_21 = arg_105_1.actors_["3043ui_story"].transform
			local var_108_22 = 0

			if var_108_22 < arg_105_1.time_ and arg_105_1.time_ <= var_108_22 + arg_108_0 then
				arg_105_1.var_.moveOldPos3043ui_story = var_108_21.localPosition
			end

			local var_108_23 = 0.001

			if var_108_22 <= arg_105_1.time_ and arg_105_1.time_ < var_108_22 + var_108_23 then
				local var_108_24 = (arg_105_1.time_ - var_108_22) / var_108_23
				local var_108_25 = Vector3.New(0.7, -1.41, -5.7)

				var_108_21.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos3043ui_story, var_108_25, var_108_24)

				local var_108_26 = manager.ui.mainCamera.transform.position - var_108_21.position

				var_108_21.forward = Vector3.New(var_108_26.x, var_108_26.y, var_108_26.z)

				local var_108_27 = var_108_21.localEulerAngles

				var_108_27.z = 0
				var_108_27.x = 0
				var_108_21.localEulerAngles = var_108_27
			end

			if arg_105_1.time_ >= var_108_22 + var_108_23 and arg_105_1.time_ < var_108_22 + var_108_23 + arg_108_0 then
				var_108_21.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_108_28 = manager.ui.mainCamera.transform.position - var_108_21.position

				var_108_21.forward = Vector3.New(var_108_28.x, var_108_28.y, var_108_28.z)

				local var_108_29 = var_108_21.localEulerAngles

				var_108_29.z = 0
				var_108_29.x = 0
				var_108_21.localEulerAngles = var_108_29
			end

			local var_108_30 = 0
			local var_108_31 = 0.575

			if var_108_30 < arg_105_1.time_ and arg_105_1.time_ <= var_108_30 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_32 = arg_105_1:FormatText(StoryNameCfg[216].name)

				arg_105_1.leftNameTxt_.text = var_108_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_33 = arg_105_1:GetWordFromCfg(412031026)
				local var_108_34 = arg_105_1:FormatText(var_108_33.content)

				arg_105_1.text_.text = var_108_34

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_35 = 23
				local var_108_36 = utf8.len(var_108_34)
				local var_108_37 = var_108_35 <= 0 and var_108_31 or var_108_31 * (var_108_36 / var_108_35)

				if var_108_37 > 0 and var_108_31 < var_108_37 then
					arg_105_1.talkMaxDuration = var_108_37

					if var_108_37 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_37 + var_108_30
					end
				end

				arg_105_1.text_.text = var_108_34
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031026", "story_v_out_412031.awb") ~= 0 then
					local var_108_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031026", "story_v_out_412031.awb") / 1000

					if var_108_38 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_38 + var_108_30
					end

					if var_108_33.prefab_name ~= "" and arg_105_1.actors_[var_108_33.prefab_name] ~= nil then
						local var_108_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_33.prefab_name].transform, "story_v_out_412031", "412031026", "story_v_out_412031.awb")

						arg_105_1:RecordAudio("412031026", var_108_39)
						arg_105_1:RecordAudio("412031026", var_108_39)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_412031", "412031026", "story_v_out_412031.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_412031", "412031026", "story_v_out_412031.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_40 = math.max(var_108_31, arg_105_1.talkMaxDuration)

			if var_108_30 <= arg_105_1.time_ and arg_105_1.time_ < var_108_30 + var_108_40 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_30) / var_108_40

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_30 + var_108_40 and arg_105_1.time_ < var_108_30 + var_108_40 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play412031027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 412031027
		arg_109_1.duration_ = 7.4

		local var_109_0 = {
			zh = 7.2,
			ja = 7.4
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
				arg_109_0:Play412031028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1097ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1097ui_story == nil then
				arg_109_1.var_.characterEffect1097ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1097ui_story then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1097ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1097ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1097ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action2_1")
			end

			local var_112_7 = 0

			if var_112_7 < arg_109_1.time_ and arg_109_1.time_ <= var_112_7 + arg_112_0 then
				arg_109_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_112_8 = arg_109_1.actors_["3043ui_story"]
			local var_112_9 = 0

			if var_112_9 < arg_109_1.time_ and arg_109_1.time_ <= var_112_9 + arg_112_0 and arg_109_1.var_.characterEffect3043ui_story == nil then
				arg_109_1.var_.characterEffect3043ui_story = var_112_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_10 = 0.200000002980232

			if var_112_9 <= arg_109_1.time_ and arg_109_1.time_ < var_112_9 + var_112_10 then
				local var_112_11 = (arg_109_1.time_ - var_112_9) / var_112_10

				if arg_109_1.var_.characterEffect3043ui_story then
					arg_109_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_9 + var_112_10 and arg_109_1.time_ < var_112_9 + var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect3043ui_story then
				arg_109_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_112_12 = 0
			local var_112_13 = 0.55

			if var_112_12 < arg_109_1.time_ and arg_109_1.time_ <= var_112_12 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_14 = arg_109_1:FormatText(StoryNameCfg[920].name)

				arg_109_1.leftNameTxt_.text = var_112_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_15 = arg_109_1:GetWordFromCfg(412031027)
				local var_112_16 = arg_109_1:FormatText(var_112_15.content)

				arg_109_1.text_.text = var_112_16

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_17 = 22
				local var_112_18 = utf8.len(var_112_16)
				local var_112_19 = var_112_17 <= 0 and var_112_13 or var_112_13 * (var_112_18 / var_112_17)

				if var_112_19 > 0 and var_112_13 < var_112_19 then
					arg_109_1.talkMaxDuration = var_112_19

					if var_112_19 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_12
					end
				end

				arg_109_1.text_.text = var_112_16
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031027", "story_v_out_412031.awb") ~= 0 then
					local var_112_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031027", "story_v_out_412031.awb") / 1000

					if var_112_20 + var_112_12 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_20 + var_112_12
					end

					if var_112_15.prefab_name ~= "" and arg_109_1.actors_[var_112_15.prefab_name] ~= nil then
						local var_112_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_15.prefab_name].transform, "story_v_out_412031", "412031027", "story_v_out_412031.awb")

						arg_109_1:RecordAudio("412031027", var_112_21)
						arg_109_1:RecordAudio("412031027", var_112_21)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_412031", "412031027", "story_v_out_412031.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_412031", "412031027", "story_v_out_412031.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_22 = math.max(var_112_13, arg_109_1.talkMaxDuration)

			if var_112_12 <= arg_109_1.time_ and arg_109_1.time_ < var_112_12 + var_112_22 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_12) / var_112_22

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_12 + var_112_22 and arg_109_1.time_ < var_112_12 + var_112_22 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play412031028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 412031028
		arg_113_1.duration_ = 3.333

		local var_113_0 = {
			zh = 2.5,
			ja = 3.333
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
				arg_113_0:Play412031029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1097ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1097ui_story == nil then
				arg_113_1.var_.characterEffect1097ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1097ui_story then
					arg_113_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1097ui_story then
				arg_113_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_116_6 = arg_113_1.actors_["3043ui_story"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect3043ui_story == nil then
				arg_113_1.var_.characterEffect3043ui_story = var_116_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_8 = 0.200000002980232

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.characterEffect3043ui_story then
					local var_116_10 = Mathf.Lerp(0, 0.5, var_116_9)

					arg_113_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_113_1.var_.characterEffect3043ui_story.fillRatio = var_116_10
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.characterEffect3043ui_story then
				local var_116_11 = 0.5

				arg_113_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_113_1.var_.characterEffect3043ui_story.fillRatio = var_116_11
			end

			local var_116_12 = 0
			local var_116_13 = 0.125

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[216].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(412031028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031028", "story_v_out_412031.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031028", "story_v_out_412031.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_412031", "412031028", "story_v_out_412031.awb")

						arg_113_1:RecordAudio("412031028", var_116_21)
						arg_113_1:RecordAudio("412031028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_412031", "412031028", "story_v_out_412031.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_412031", "412031028", "story_v_out_412031.awb")
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
	Play412031029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 412031029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play412031030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1097ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1097ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1097ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, 100, 0)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1097ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1097ui_story == nil then
				arg_117_1.var_.characterEffect1097ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1097ui_story then
					local var_120_13 = Mathf.Lerp(0, 0.5, var_120_12)

					arg_117_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1097ui_story.fillRatio = var_120_13
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1097ui_story then
				local var_120_14 = 0.5

				arg_117_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1097ui_story.fillRatio = var_120_14
			end

			local var_120_15 = arg_117_1.actors_["3043ui_story"].transform
			local var_120_16 = 0

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.var_.moveOldPos3043ui_story = var_120_15.localPosition
			end

			local var_120_17 = 0.001

			if var_120_16 <= arg_117_1.time_ and arg_117_1.time_ < var_120_16 + var_120_17 then
				local var_120_18 = (arg_117_1.time_ - var_120_16) / var_120_17
				local var_120_19 = Vector3.New(0, 100, 0)

				var_120_15.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos3043ui_story, var_120_19, var_120_18)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_15.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_15.localEulerAngles = var_120_21
			end

			if arg_117_1.time_ >= var_120_16 + var_120_17 and arg_117_1.time_ < var_120_16 + var_120_17 + arg_120_0 then
				var_120_15.localPosition = Vector3.New(0, 100, 0)

				local var_120_22 = manager.ui.mainCamera.transform.position - var_120_15.position

				var_120_15.forward = Vector3.New(var_120_22.x, var_120_22.y, var_120_22.z)

				local var_120_23 = var_120_15.localEulerAngles

				var_120_23.z = 0
				var_120_23.x = 0
				var_120_15.localEulerAngles = var_120_23
			end

			local var_120_24 = arg_117_1.actors_["3043ui_story"]
			local var_120_25 = 0

			if var_120_25 < arg_117_1.time_ and arg_117_1.time_ <= var_120_25 + arg_120_0 and arg_117_1.var_.characterEffect3043ui_story == nil then
				arg_117_1.var_.characterEffect3043ui_story = var_120_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_26 = 0.200000002980232

			if var_120_25 <= arg_117_1.time_ and arg_117_1.time_ < var_120_25 + var_120_26 then
				local var_120_27 = (arg_117_1.time_ - var_120_25) / var_120_26

				if arg_117_1.var_.characterEffect3043ui_story then
					local var_120_28 = Mathf.Lerp(0, 0.5, var_120_27)

					arg_117_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_117_1.var_.characterEffect3043ui_story.fillRatio = var_120_28
				end
			end

			if arg_117_1.time_ >= var_120_25 + var_120_26 and arg_117_1.time_ < var_120_25 + var_120_26 + arg_120_0 and arg_117_1.var_.characterEffect3043ui_story then
				local var_120_29 = 0.5

				arg_117_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_117_1.var_.characterEffect3043ui_story.fillRatio = var_120_29
			end

			local var_120_30 = 0
			local var_120_31 = 0.925

			if var_120_30 < arg_117_1.time_ and arg_117_1.time_ <= var_120_30 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_32 = arg_117_1:GetWordFromCfg(412031029)
				local var_120_33 = arg_117_1:FormatText(var_120_32.content)

				arg_117_1.text_.text = var_120_33

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_34 = 37
				local var_120_35 = utf8.len(var_120_33)
				local var_120_36 = var_120_34 <= 0 and var_120_31 or var_120_31 * (var_120_35 / var_120_34)

				if var_120_36 > 0 and var_120_31 < var_120_36 then
					arg_117_1.talkMaxDuration = var_120_36

					if var_120_36 + var_120_30 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_36 + var_120_30
					end
				end

				arg_117_1.text_.text = var_120_33
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_37 = math.max(var_120_31, arg_117_1.talkMaxDuration)

			if var_120_30 <= arg_117_1.time_ and arg_117_1.time_ < var_120_30 + var_120_37 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_30) / var_120_37

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_30 + var_120_37 and arg_117_1.time_ < var_120_30 + var_120_37 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play412031030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 412031030
		arg_121_1.duration_ = 6.366

		local var_121_0 = {
			zh = 5.166,
			ja = 6.366
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
				arg_121_0:Play412031031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1097ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1097ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, -0.54, -6.3)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1097ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1097ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1097ui_story == nil then
				arg_121_1.var_.characterEffect1097ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1097ui_story then
					arg_121_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1097ui_story then
				arg_121_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_124_15 = 0
			local var_124_16 = 0.475

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_17 = arg_121_1:FormatText(StoryNameCfg[216].name)

				arg_121_1.leftNameTxt_.text = var_124_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_18 = arg_121_1:GetWordFromCfg(412031030)
				local var_124_19 = arg_121_1:FormatText(var_124_18.content)

				arg_121_1.text_.text = var_124_19

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_20 = 19
				local var_124_21 = utf8.len(var_124_19)
				local var_124_22 = var_124_20 <= 0 and var_124_16 or var_124_16 * (var_124_21 / var_124_20)

				if var_124_22 > 0 and var_124_16 < var_124_22 then
					arg_121_1.talkMaxDuration = var_124_22

					if var_124_22 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_22 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_19
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031030", "story_v_out_412031.awb") ~= 0 then
					local var_124_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031030", "story_v_out_412031.awb") / 1000

					if var_124_23 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_23 + var_124_15
					end

					if var_124_18.prefab_name ~= "" and arg_121_1.actors_[var_124_18.prefab_name] ~= nil then
						local var_124_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_18.prefab_name].transform, "story_v_out_412031", "412031030", "story_v_out_412031.awb")

						arg_121_1:RecordAudio("412031030", var_124_24)
						arg_121_1:RecordAudio("412031030", var_124_24)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_412031", "412031030", "story_v_out_412031.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_412031", "412031030", "story_v_out_412031.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_25 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_25 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_25

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_25 and arg_121_1.time_ < var_124_15 + var_124_25 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play412031031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 412031031
		arg_125_1.duration_ = 10.6

		local var_125_0 = {
			zh = 8.5,
			ja = 10.6
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
				arg_125_0:Play412031032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.75

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[216].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(412031031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 30
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031031", "story_v_out_412031.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031031", "story_v_out_412031.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_412031", "412031031", "story_v_out_412031.awb")

						arg_125_1:RecordAudio("412031031", var_128_9)
						arg_125_1:RecordAudio("412031031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_412031", "412031031", "story_v_out_412031.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_412031", "412031031", "story_v_out_412031.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play412031032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 412031032
		arg_129_1.duration_ = 8.733

		local var_129_0 = {
			zh = 8.733,
			ja = 7.1
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
				arg_129_0:Play412031033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["3043ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos3043ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -1.41, -5.7)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos3043ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["3043ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect3043ui_story == nil then
				arg_129_1.var_.characterEffect3043ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect3043ui_story then
					arg_129_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect3043ui_story then
				arg_129_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_15 = arg_129_1.actors_["1097ui_story"].transform
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.var_.moveOldPos1097ui_story = var_132_15.localPosition
			end

			local var_132_17 = 0.001

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17
				local var_132_19 = Vector3.New(0, 100, 0)

				var_132_15.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1097ui_story, var_132_19, var_132_18)

				local var_132_20 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_20.x, var_132_20.y, var_132_20.z)

				local var_132_21 = var_132_15.localEulerAngles

				var_132_21.z = 0
				var_132_21.x = 0
				var_132_15.localEulerAngles = var_132_21
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 then
				var_132_15.localPosition = Vector3.New(0, 100, 0)

				local var_132_22 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_22.x, var_132_22.y, var_132_22.z)

				local var_132_23 = var_132_15.localEulerAngles

				var_132_23.z = 0
				var_132_23.x = 0
				var_132_15.localEulerAngles = var_132_23
			end

			local var_132_24 = arg_129_1.actors_["1097ui_story"]
			local var_132_25 = 0

			if var_132_25 < arg_129_1.time_ and arg_129_1.time_ <= var_132_25 + arg_132_0 and arg_129_1.var_.characterEffect1097ui_story == nil then
				arg_129_1.var_.characterEffect1097ui_story = var_132_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_26 = 0.200000002980232

			if var_132_25 <= arg_129_1.time_ and arg_129_1.time_ < var_132_25 + var_132_26 then
				local var_132_27 = (arg_129_1.time_ - var_132_25) / var_132_26

				if arg_129_1.var_.characterEffect1097ui_story then
					local var_132_28 = Mathf.Lerp(0, 0.5, var_132_27)

					arg_129_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1097ui_story.fillRatio = var_132_28
				end
			end

			if arg_129_1.time_ >= var_132_25 + var_132_26 and arg_129_1.time_ < var_132_25 + var_132_26 + arg_132_0 and arg_129_1.var_.characterEffect1097ui_story then
				local var_132_29 = 0.5

				arg_129_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1097ui_story.fillRatio = var_132_29
			end

			local var_132_30 = 0
			local var_132_31 = 0.925

			if var_132_30 < arg_129_1.time_ and arg_129_1.time_ <= var_132_30 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_32 = arg_129_1:FormatText(StoryNameCfg[920].name)

				arg_129_1.leftNameTxt_.text = var_132_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_33 = arg_129_1:GetWordFromCfg(412031032)
				local var_132_34 = arg_129_1:FormatText(var_132_33.content)

				arg_129_1.text_.text = var_132_34

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_35 = 37
				local var_132_36 = utf8.len(var_132_34)
				local var_132_37 = var_132_35 <= 0 and var_132_31 or var_132_31 * (var_132_36 / var_132_35)

				if var_132_37 > 0 and var_132_31 < var_132_37 then
					arg_129_1.talkMaxDuration = var_132_37

					if var_132_37 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_37 + var_132_30
					end
				end

				arg_129_1.text_.text = var_132_34
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031032", "story_v_out_412031.awb") ~= 0 then
					local var_132_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031032", "story_v_out_412031.awb") / 1000

					if var_132_38 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_38 + var_132_30
					end

					if var_132_33.prefab_name ~= "" and arg_129_1.actors_[var_132_33.prefab_name] ~= nil then
						local var_132_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_33.prefab_name].transform, "story_v_out_412031", "412031032", "story_v_out_412031.awb")

						arg_129_1:RecordAudio("412031032", var_132_39)
						arg_129_1:RecordAudio("412031032", var_132_39)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_412031", "412031032", "story_v_out_412031.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_412031", "412031032", "story_v_out_412031.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_40 = math.max(var_132_31, arg_129_1.talkMaxDuration)

			if var_132_30 <= arg_129_1.time_ and arg_129_1.time_ < var_132_30 + var_132_40 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_30) / var_132_40

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_30 + var_132_40 and arg_129_1.time_ < var_132_30 + var_132_40 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play412031033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 412031033
		arg_133_1.duration_ = 7.233

		local var_133_0 = {
			zh = 7.233,
			ja = 6.033
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
				arg_133_0:Play412031034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10083ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10083ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, -2.6, -2.8)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10083ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["10083ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect10083ui_story == nil then
				arg_133_1.var_.characterEffect10083ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect10083ui_story then
					arg_133_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect10083ui_story then
				arg_133_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action3_1")
			end

			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_15 = arg_133_1.actors_["3043ui_story"].transform
			local var_136_16 = 0

			if var_136_16 < arg_133_1.time_ and arg_133_1.time_ <= var_136_16 + arg_136_0 then
				arg_133_1.var_.moveOldPos3043ui_story = var_136_15.localPosition
			end

			local var_136_17 = 0.001

			if var_136_16 <= arg_133_1.time_ and arg_133_1.time_ < var_136_16 + var_136_17 then
				local var_136_18 = (arg_133_1.time_ - var_136_16) / var_136_17
				local var_136_19 = Vector3.New(0, 100, 0)

				var_136_15.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos3043ui_story, var_136_19, var_136_18)

				local var_136_20 = manager.ui.mainCamera.transform.position - var_136_15.position

				var_136_15.forward = Vector3.New(var_136_20.x, var_136_20.y, var_136_20.z)

				local var_136_21 = var_136_15.localEulerAngles

				var_136_21.z = 0
				var_136_21.x = 0
				var_136_15.localEulerAngles = var_136_21
			end

			if arg_133_1.time_ >= var_136_16 + var_136_17 and arg_133_1.time_ < var_136_16 + var_136_17 + arg_136_0 then
				var_136_15.localPosition = Vector3.New(0, 100, 0)

				local var_136_22 = manager.ui.mainCamera.transform.position - var_136_15.position

				var_136_15.forward = Vector3.New(var_136_22.x, var_136_22.y, var_136_22.z)

				local var_136_23 = var_136_15.localEulerAngles

				var_136_23.z = 0
				var_136_23.x = 0
				var_136_15.localEulerAngles = var_136_23
			end

			local var_136_24 = arg_133_1.actors_["3043ui_story"]
			local var_136_25 = 0

			if var_136_25 < arg_133_1.time_ and arg_133_1.time_ <= var_136_25 + arg_136_0 and arg_133_1.var_.characterEffect3043ui_story == nil then
				arg_133_1.var_.characterEffect3043ui_story = var_136_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_26 = 0.200000002980232

			if var_136_25 <= arg_133_1.time_ and arg_133_1.time_ < var_136_25 + var_136_26 then
				local var_136_27 = (arg_133_1.time_ - var_136_25) / var_136_26

				if arg_133_1.var_.characterEffect3043ui_story then
					local var_136_28 = Mathf.Lerp(0, 0.5, var_136_27)

					arg_133_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_133_1.var_.characterEffect3043ui_story.fillRatio = var_136_28
				end
			end

			if arg_133_1.time_ >= var_136_25 + var_136_26 and arg_133_1.time_ < var_136_25 + var_136_26 + arg_136_0 and arg_133_1.var_.characterEffect3043ui_story then
				local var_136_29 = 0.5

				arg_133_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_133_1.var_.characterEffect3043ui_story.fillRatio = var_136_29
			end

			local var_136_30 = 0
			local var_136_31 = 0.925

			if var_136_30 < arg_133_1.time_ and arg_133_1.time_ <= var_136_30 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_32 = arg_133_1:FormatText(StoryNameCfg[918].name)

				arg_133_1.leftNameTxt_.text = var_136_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_33 = arg_133_1:GetWordFromCfg(412031033)
				local var_136_34 = arg_133_1:FormatText(var_136_33.content)

				arg_133_1.text_.text = var_136_34

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_35 = 37
				local var_136_36 = utf8.len(var_136_34)
				local var_136_37 = var_136_35 <= 0 and var_136_31 or var_136_31 * (var_136_36 / var_136_35)

				if var_136_37 > 0 and var_136_31 < var_136_37 then
					arg_133_1.talkMaxDuration = var_136_37

					if var_136_37 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_37 + var_136_30
					end
				end

				arg_133_1.text_.text = var_136_34
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031033", "story_v_out_412031.awb") ~= 0 then
					local var_136_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031033", "story_v_out_412031.awb") / 1000

					if var_136_38 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_38 + var_136_30
					end

					if var_136_33.prefab_name ~= "" and arg_133_1.actors_[var_136_33.prefab_name] ~= nil then
						local var_136_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_33.prefab_name].transform, "story_v_out_412031", "412031033", "story_v_out_412031.awb")

						arg_133_1:RecordAudio("412031033", var_136_39)
						arg_133_1:RecordAudio("412031033", var_136_39)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_412031", "412031033", "story_v_out_412031.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_412031", "412031033", "story_v_out_412031.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_40 = math.max(var_136_31, arg_133_1.talkMaxDuration)

			if var_136_30 <= arg_133_1.time_ and arg_133_1.time_ < var_136_30 + var_136_40 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_30) / var_136_40

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_30 + var_136_40 and arg_133_1.time_ < var_136_30 + var_136_40 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play412031034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 412031034
		arg_137_1.duration_ = 8.866

		local var_137_0 = {
			zh = 8.866,
			ja = 5.4
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
				arg_137_0:Play412031035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.95

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[918].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(412031034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031034", "story_v_out_412031.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031034", "story_v_out_412031.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_412031", "412031034", "story_v_out_412031.awb")

						arg_137_1:RecordAudio("412031034", var_140_9)
						arg_137_1:RecordAudio("412031034", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_412031", "412031034", "story_v_out_412031.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_412031", "412031034", "story_v_out_412031.awb")
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
	Play412031035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 412031035
		arg_141_1.duration_ = 5.4

		local var_141_0 = {
			zh = 1.999999999999,
			ja = 5.4
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
				arg_141_0:Play412031036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["3043ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos3043ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -1.41, -5.7)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos3043ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["3043ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect3043ui_story == nil then
				arg_141_1.var_.characterEffect3043ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect3043ui_story then
					arg_141_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect3043ui_story then
				arg_141_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_15 = arg_141_1.actors_["10083ui_story"].transform
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 then
				arg_141_1.var_.moveOldPos10083ui_story = var_144_15.localPosition
			end

			local var_144_17 = 0.001

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17
				local var_144_19 = Vector3.New(0, 100, 0)

				var_144_15.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10083ui_story, var_144_19, var_144_18)

				local var_144_20 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_20.x, var_144_20.y, var_144_20.z)

				local var_144_21 = var_144_15.localEulerAngles

				var_144_21.z = 0
				var_144_21.x = 0
				var_144_15.localEulerAngles = var_144_21
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 then
				var_144_15.localPosition = Vector3.New(0, 100, 0)

				local var_144_22 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_22.x, var_144_22.y, var_144_22.z)

				local var_144_23 = var_144_15.localEulerAngles

				var_144_23.z = 0
				var_144_23.x = 0
				var_144_15.localEulerAngles = var_144_23
			end

			local var_144_24 = arg_141_1.actors_["10083ui_story"]
			local var_144_25 = 0

			if var_144_25 < arg_141_1.time_ and arg_141_1.time_ <= var_144_25 + arg_144_0 and arg_141_1.var_.characterEffect10083ui_story == nil then
				arg_141_1.var_.characterEffect10083ui_story = var_144_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_26 = 0.200000002980232

			if var_144_25 <= arg_141_1.time_ and arg_141_1.time_ < var_144_25 + var_144_26 then
				local var_144_27 = (arg_141_1.time_ - var_144_25) / var_144_26

				if arg_141_1.var_.characterEffect10083ui_story then
					local var_144_28 = Mathf.Lerp(0, 0.5, var_144_27)

					arg_141_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10083ui_story.fillRatio = var_144_28
				end
			end

			if arg_141_1.time_ >= var_144_25 + var_144_26 and arg_141_1.time_ < var_144_25 + var_144_26 + arg_144_0 and arg_141_1.var_.characterEffect10083ui_story then
				local var_144_29 = 0.5

				arg_141_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10083ui_story.fillRatio = var_144_29
			end

			local var_144_30 = 0
			local var_144_31 = 0.25

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_32 = arg_141_1:FormatText(StoryNameCfg[920].name)

				arg_141_1.leftNameTxt_.text = var_144_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_33 = arg_141_1:GetWordFromCfg(412031035)
				local var_144_34 = arg_141_1:FormatText(var_144_33.content)

				arg_141_1.text_.text = var_144_34

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_35 = 10
				local var_144_36 = utf8.len(var_144_34)
				local var_144_37 = var_144_35 <= 0 and var_144_31 or var_144_31 * (var_144_36 / var_144_35)

				if var_144_37 > 0 and var_144_31 < var_144_37 then
					arg_141_1.talkMaxDuration = var_144_37

					if var_144_37 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_37 + var_144_30
					end
				end

				arg_141_1.text_.text = var_144_34
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031035", "story_v_out_412031.awb") ~= 0 then
					local var_144_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031035", "story_v_out_412031.awb") / 1000

					if var_144_38 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_38 + var_144_30
					end

					if var_144_33.prefab_name ~= "" and arg_141_1.actors_[var_144_33.prefab_name] ~= nil then
						local var_144_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_33.prefab_name].transform, "story_v_out_412031", "412031035", "story_v_out_412031.awb")

						arg_141_1:RecordAudio("412031035", var_144_39)
						arg_141_1:RecordAudio("412031035", var_144_39)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_412031", "412031035", "story_v_out_412031.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_412031", "412031035", "story_v_out_412031.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_40 = math.max(var_144_31, arg_141_1.talkMaxDuration)

			if var_144_30 <= arg_141_1.time_ and arg_141_1.time_ < var_144_30 + var_144_40 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_30) / var_144_40

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_30 + var_144_40 and arg_141_1.time_ < var_144_30 + var_144_40 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play412031036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 412031036
		arg_145_1.duration_ = 7

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play412031037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = "EN0101"

			if arg_145_1.bgs_[var_148_0] == nil then
				local var_148_1 = Object.Instantiate(arg_145_1.paintGo_)

				var_148_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_148_0)
				var_148_1.name = var_148_0
				var_148_1.transform.parent = arg_145_1.stage_.transform
				var_148_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_145_1.bgs_[var_148_0] = var_148_1
			end

			local var_148_2 = 0.5

			if var_148_2 < arg_145_1.time_ and arg_145_1.time_ <= var_148_2 + arg_148_0 then
				local var_148_3 = manager.ui.mainCamera.transform.localPosition
				local var_148_4 = Vector3.New(0, 0, 10) + Vector3.New(var_148_3.x, var_148_3.y, 0)
				local var_148_5 = arg_145_1.bgs_.EN0101

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
					if iter_148_0 ~= "EN0101" then
						iter_148_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_148_16 = 2

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

			local var_148_19 = 0.5

			if var_148_18 <= arg_145_1.time_ and arg_145_1.time_ < var_148_18 + var_148_19 then
				local var_148_20 = (arg_145_1.time_ - var_148_18) / var_148_19
				local var_148_21 = Color.New(0, 0, 0)

				var_148_21.a = Mathf.Lerp(0, 1, var_148_20)
				arg_145_1.mask_.color = var_148_21
			end

			if arg_145_1.time_ >= var_148_18 + var_148_19 and arg_145_1.time_ < var_148_18 + var_148_19 + arg_148_0 then
				local var_148_22 = Color.New(0, 0, 0)

				var_148_22.a = 1
				arg_145_1.mask_.color = var_148_22
			end

			local var_148_23 = 0.5

			if var_148_23 < arg_145_1.time_ and arg_145_1.time_ <= var_148_23 + arg_148_0 then
				arg_145_1.mask_.enabled = true
				arg_145_1.mask_.raycastTarget = true

				arg_145_1:SetGaussion(false)
			end

			local var_148_24 = 1.5

			if var_148_23 <= arg_145_1.time_ and arg_145_1.time_ < var_148_23 + var_148_24 then
				local var_148_25 = (arg_145_1.time_ - var_148_23) / var_148_24
				local var_148_26 = Color.New(0, 0, 0)

				var_148_26.a = Mathf.Lerp(1, 0, var_148_25)
				arg_145_1.mask_.color = var_148_26
			end

			if arg_145_1.time_ >= var_148_23 + var_148_24 and arg_145_1.time_ < var_148_23 + var_148_24 + arg_148_0 then
				local var_148_27 = Color.New(0, 0, 0)
				local var_148_28 = 0

				arg_145_1.mask_.enabled = false
				var_148_27.a = var_148_28
				arg_145_1.mask_.color = var_148_27
			end

			local var_148_29 = arg_145_1.actors_["3043ui_story"].transform
			local var_148_30 = 0

			if var_148_30 < arg_145_1.time_ and arg_145_1.time_ <= var_148_30 + arg_148_0 then
				arg_145_1.var_.moveOldPos3043ui_story = var_148_29.localPosition
			end

			local var_148_31 = 0.001

			if var_148_30 <= arg_145_1.time_ and arg_145_1.time_ < var_148_30 + var_148_31 then
				local var_148_32 = (arg_145_1.time_ - var_148_30) / var_148_31
				local var_148_33 = Vector3.New(0, 100, 0)

				var_148_29.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos3043ui_story, var_148_33, var_148_32)

				local var_148_34 = manager.ui.mainCamera.transform.position - var_148_29.position

				var_148_29.forward = Vector3.New(var_148_34.x, var_148_34.y, var_148_34.z)

				local var_148_35 = var_148_29.localEulerAngles

				var_148_35.z = 0
				var_148_35.x = 0
				var_148_29.localEulerAngles = var_148_35
			end

			if arg_145_1.time_ >= var_148_30 + var_148_31 and arg_145_1.time_ < var_148_30 + var_148_31 + arg_148_0 then
				var_148_29.localPosition = Vector3.New(0, 100, 0)

				local var_148_36 = manager.ui.mainCamera.transform.position - var_148_29.position

				var_148_29.forward = Vector3.New(var_148_36.x, var_148_36.y, var_148_36.z)

				local var_148_37 = var_148_29.localEulerAngles

				var_148_37.z = 0
				var_148_37.x = 0
				var_148_29.localEulerAngles = var_148_37
			end

			local var_148_38 = arg_145_1.actors_["3043ui_story"]
			local var_148_39 = 0

			if var_148_39 < arg_145_1.time_ and arg_145_1.time_ <= var_148_39 + arg_148_0 and arg_145_1.var_.characterEffect3043ui_story == nil then
				arg_145_1.var_.characterEffect3043ui_story = var_148_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_40 = 0.034000001847744

			if var_148_39 <= arg_145_1.time_ and arg_145_1.time_ < var_148_39 + var_148_40 then
				local var_148_41 = (arg_145_1.time_ - var_148_39) / var_148_40

				if arg_145_1.var_.characterEffect3043ui_story then
					local var_148_42 = Mathf.Lerp(0, 0.5, var_148_41)

					arg_145_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_145_1.var_.characterEffect3043ui_story.fillRatio = var_148_42
				end
			end

			if arg_145_1.time_ >= var_148_39 + var_148_40 and arg_145_1.time_ < var_148_39 + var_148_40 + arg_148_0 and arg_145_1.var_.characterEffect3043ui_story then
				local var_148_43 = 0.5

				arg_145_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_145_1.var_.characterEffect3043ui_story.fillRatio = var_148_43
			end

			local var_148_44 = arg_145_1.bgs_.EN0101.transform
			local var_148_45 = 0.5

			if var_148_45 < arg_145_1.time_ and arg_145_1.time_ <= var_148_45 + arg_148_0 then
				arg_145_1.var_.moveOldPosEN0101 = var_148_44.localPosition
			end

			local var_148_46 = 0.001

			if var_148_45 <= arg_145_1.time_ and arg_145_1.time_ < var_148_45 + var_148_46 then
				local var_148_47 = (arg_145_1.time_ - var_148_45) / var_148_46
				local var_148_48 = Vector3.New(0, 1, 9)

				var_148_44.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPosEN0101, var_148_48, var_148_47)
			end

			if arg_145_1.time_ >= var_148_45 + var_148_46 and arg_145_1.time_ < var_148_45 + var_148_46 + arg_148_0 then
				var_148_44.localPosition = Vector3.New(0, 1, 9)
			end

			local var_148_49 = arg_145_1.bgs_.EN0101.transform
			local var_148_50 = 0.534000001847744

			if var_148_50 < arg_145_1.time_ and arg_145_1.time_ <= var_148_50 + arg_148_0 then
				arg_145_1.var_.moveOldPosEN0101 = var_148_49.localPosition
			end

			local var_148_51 = 4.5

			if var_148_50 <= arg_145_1.time_ and arg_145_1.time_ < var_148_50 + var_148_51 then
				local var_148_52 = (arg_145_1.time_ - var_148_50) / var_148_51
				local var_148_53 = Vector3.New(0, 1, 10)

				var_148_49.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPosEN0101, var_148_53, var_148_52)
			end

			if arg_145_1.time_ >= var_148_50 + var_148_51 and arg_145_1.time_ < var_148_50 + var_148_51 + arg_148_0 then
				var_148_49.localPosition = Vector3.New(0, 1, 10)
			end

			local var_148_54 = 2

			if var_148_54 < arg_145_1.time_ and arg_145_1.time_ <= var_148_54 + arg_148_0 then
				arg_145_1.allBtn_.enabled = false
			end

			local var_148_55 = 2.53400000184774

			if arg_145_1.time_ >= var_148_54 + var_148_55 and arg_145_1.time_ < var_148_54 + var_148_55 + arg_148_0 then
				arg_145_1.allBtn_.enabled = true
			end

			if arg_145_1.frameCnt_ <= 1 then
				arg_145_1.dialog_:SetActive(false)
			end

			local var_148_56 = 2
			local var_148_57 = 0.95

			if var_148_56 < arg_145_1.time_ and arg_145_1.time_ <= var_148_56 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0

				arg_145_1.dialog_:SetActive(true)

				local var_148_58 = LeanTween.value(arg_145_1.dialog_, 0, 1, 0.3)

				var_148_58:setOnUpdate(LuaHelper.FloatAction(function(arg_149_0)
					arg_145_1.dialogCg_.alpha = arg_149_0
				end))
				var_148_58:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_145_1.dialog_)
					var_148_58:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_145_1.duration_ = arg_145_1.duration_ + 0.3

				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_59 = arg_145_1:GetWordFromCfg(412031036)
				local var_148_60 = arg_145_1:FormatText(var_148_59.content)

				arg_145_1.text_.text = var_148_60

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_61 = 38
				local var_148_62 = utf8.len(var_148_60)
				local var_148_63 = var_148_61 <= 0 and var_148_57 or var_148_57 * (var_148_62 / var_148_61)

				if var_148_63 > 0 and var_148_57 < var_148_63 then
					arg_145_1.talkMaxDuration = var_148_63
					var_148_56 = var_148_56 + 0.3

					if var_148_63 + var_148_56 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_63 + var_148_56
					end
				end

				arg_145_1.text_.text = var_148_60
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_64 = var_148_56 + 0.3
			local var_148_65 = math.max(var_148_57, arg_145_1.talkMaxDuration)

			if var_148_64 <= arg_145_1.time_ and arg_145_1.time_ < var_148_64 + var_148_65 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_64) / var_148_65

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_64 + var_148_65 and arg_145_1.time_ < var_148_64 + var_148_65 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play412031037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 412031037
		arg_151_1.duration_ = 4.633

		local var_151_0 = {
			zh = 3.5,
			ja = 4.633
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
				arg_151_0:Play412031038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.4

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[920].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(412031037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031037", "story_v_out_412031.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031037", "story_v_out_412031.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_412031", "412031037", "story_v_out_412031.awb")

						arg_151_1:RecordAudio("412031037", var_154_9)
						arg_151_1:RecordAudio("412031037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_412031", "412031037", "story_v_out_412031.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_412031", "412031037", "story_v_out_412031.awb")
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
	Play412031038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 412031038
		arg_155_1.duration_ = 7.066

		local var_155_0 = {
			zh = 5.6,
			ja = 7.066
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
				arg_155_0:Play412031039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.425

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[216].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, true)
				arg_155_1.iconController_:SetSelectedState("hero")

				arg_155_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(412031038)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 17
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031038", "story_v_out_412031.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031038", "story_v_out_412031.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_412031", "412031038", "story_v_out_412031.awb")

						arg_155_1:RecordAudio("412031038", var_158_9)
						arg_155_1:RecordAudio("412031038", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_412031", "412031038", "story_v_out_412031.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_412031", "412031038", "story_v_out_412031.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play412031039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 412031039
		arg_159_1.duration_ = 1.9

		local var_159_0 = {
			zh = 1.2,
			ja = 1.9
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
				arg_159_0:Play412031040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.1

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[920].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(412031039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031039", "story_v_out_412031.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031039", "story_v_out_412031.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_412031", "412031039", "story_v_out_412031.awb")

						arg_159_1:RecordAudio("412031039", var_162_9)
						arg_159_1:RecordAudio("412031039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_412031", "412031039", "story_v_out_412031.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_412031", "412031039", "story_v_out_412031.awb")
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
	Play412031040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 412031040
		arg_163_1.duration_ = 8.966

		local var_163_0 = {
			zh = 7.333,
			ja = 8.966
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
				arg_163_0:Play412031041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.55

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[216].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, true)
				arg_163_1.iconController_:SetSelectedState("hero")

				arg_163_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(412031040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031040", "story_v_out_412031.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031040", "story_v_out_412031.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_412031", "412031040", "story_v_out_412031.awb")

						arg_163_1:RecordAudio("412031040", var_166_9)
						arg_163_1:RecordAudio("412031040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_412031", "412031040", "story_v_out_412031.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_412031", "412031040", "story_v_out_412031.awb")
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
	Play412031041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 412031041
		arg_167_1.duration_ = 6.233

		local var_167_0 = {
			zh = 3.466,
			ja = 6.233
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
				arg_167_0:Play412031042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.35

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[920].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(412031041)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031041", "story_v_out_412031.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031041", "story_v_out_412031.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_412031", "412031041", "story_v_out_412031.awb")

						arg_167_1:RecordAudio("412031041", var_170_9)
						arg_167_1:RecordAudio("412031041", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_412031", "412031041", "story_v_out_412031.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_412031", "412031041", "story_v_out_412031.awb")
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
	Play412031042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 412031042
		arg_171_1.duration_ = 4.933

		local var_171_0 = {
			zh = 3,
			ja = 4.933
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
				arg_171_0:Play412031043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.2

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[216].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, true)
				arg_171_1.iconController_:SetSelectedState("hero")

				arg_171_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(412031042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031042", "story_v_out_412031.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031042", "story_v_out_412031.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_412031", "412031042", "story_v_out_412031.awb")

						arg_171_1:RecordAudio("412031042", var_174_9)
						arg_171_1:RecordAudio("412031042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_412031", "412031042", "story_v_out_412031.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_412031", "412031042", "story_v_out_412031.awb")
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
	Play412031043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 412031043
		arg_175_1.duration_ = 4.866

		local var_175_0 = {
			zh = 3.3,
			ja = 4.866
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
				arg_175_0:Play412031044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.35

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[920].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(412031043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031043", "story_v_out_412031.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031043", "story_v_out_412031.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_412031", "412031043", "story_v_out_412031.awb")

						arg_175_1:RecordAudio("412031043", var_178_9)
						arg_175_1:RecordAudio("412031043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_412031", "412031043", "story_v_out_412031.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_412031", "412031043", "story_v_out_412031.awb")
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
	Play412031044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 412031044
		arg_179_1.duration_ = 9.7

		local var_179_0 = {
			zh = 9.7,
			ja = 6.8
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
				arg_179_0:Play412031045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.975

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[920].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(412031044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031044", "story_v_out_412031.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031044", "story_v_out_412031.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_412031", "412031044", "story_v_out_412031.awb")

						arg_179_1:RecordAudio("412031044", var_182_9)
						arg_179_1:RecordAudio("412031044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_412031", "412031044", "story_v_out_412031.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_412031", "412031044", "story_v_out_412031.awb")
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
	Play412031045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 412031045
		arg_183_1.duration_ = 9.9

		local var_183_0 = {
			zh = 8.333,
			ja = 9.9
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
				arg_183_0:Play412031046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.65

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[920].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(412031045)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031045", "story_v_out_412031.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031045", "story_v_out_412031.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_412031", "412031045", "story_v_out_412031.awb")

						arg_183_1:RecordAudio("412031045", var_186_9)
						arg_183_1:RecordAudio("412031045", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_412031", "412031045", "story_v_out_412031.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_412031", "412031045", "story_v_out_412031.awb")
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
	Play412031046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 412031046
		arg_187_1.duration_ = 7

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play412031047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				local var_190_1 = manager.ui.mainCamera.transform.localPosition
				local var_190_2 = Vector3.New(0, 0, 10) + Vector3.New(var_190_1.x, var_190_1.y, 0)
				local var_190_3 = arg_187_1.bgs_.ST30

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
					if iter_190_0 ~= "ST30" then
						iter_190_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_190_14 = 1.999999999999

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1.allBtn_.enabled = false
			end

			local var_190_15 = 0.3

			if arg_187_1.time_ >= var_190_14 + var_190_15 and arg_187_1.time_ < var_190_14 + var_190_15 + arg_190_0 then
				arg_187_1.allBtn_.enabled = true
			end

			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_17 = 2

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Color.New(1, 1, 1)

				var_190_19.a = Mathf.Lerp(1, 0, var_190_18)
				arg_187_1.mask_.color = var_190_19
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				local var_190_20 = Color.New(1, 1, 1)
				local var_190_21 = 0

				arg_187_1.mask_.enabled = false
				var_190_20.a = var_190_21
				arg_187_1.mask_.color = var_190_20
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_22 = 2
			local var_190_23 = 0.375

			if var_190_22 < arg_187_1.time_ and arg_187_1.time_ <= var_190_22 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_24 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_24:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_25 = arg_187_1:GetWordFromCfg(412031046)
				local var_190_26 = arg_187_1:FormatText(var_190_25.content)

				arg_187_1.text_.text = var_190_26

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_27 = 15
				local var_190_28 = utf8.len(var_190_26)
				local var_190_29 = var_190_27 <= 0 and var_190_23 or var_190_23 * (var_190_28 / var_190_27)

				if var_190_29 > 0 and var_190_23 < var_190_29 then
					arg_187_1.talkMaxDuration = var_190_29
					var_190_22 = var_190_22 + 0.3

					if var_190_29 + var_190_22 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_29 + var_190_22
					end
				end

				arg_187_1.text_.text = var_190_26
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_30 = var_190_22 + 0.3
			local var_190_31 = math.max(var_190_23, arg_187_1.talkMaxDuration)

			if var_190_30 <= arg_187_1.time_ and arg_187_1.time_ < var_190_30 + var_190_31 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_30) / var_190_31

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_30 + var_190_31 and arg_187_1.time_ < var_190_30 + var_190_31 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play412031047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 412031047
		arg_193_1.duration_ = 8.566

		local var_193_0 = {
			zh = 6.633,
			ja = 8.566
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
				arg_193_0:Play412031048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10076ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos10076ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(0, -0.35, -4)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos10076ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(0, -0.35, -4)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["10076ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect10076ui_story == nil then
				arg_193_1.var_.characterEffect10076ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.200000002980232

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect10076ui_story then
					arg_193_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect10076ui_story then
				arg_193_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action1_1")
			end

			local var_196_14 = 0

			if var_196_14 < arg_193_1.time_ and arg_193_1.time_ <= var_196_14 + arg_196_0 then
				arg_193_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_196_15 = 0
			local var_196_16 = 0.75

			if var_196_15 < arg_193_1.time_ and arg_193_1.time_ <= var_196_15 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_17 = arg_193_1:FormatText(StoryNameCfg[917].name)

				arg_193_1.leftNameTxt_.text = var_196_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_18 = arg_193_1:GetWordFromCfg(412031047)
				local var_196_19 = arg_193_1:FormatText(var_196_18.content)

				arg_193_1.text_.text = var_196_19

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_20 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031047", "story_v_out_412031.awb") ~= 0 then
					local var_196_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031047", "story_v_out_412031.awb") / 1000

					if var_196_23 + var_196_15 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_23 + var_196_15
					end

					if var_196_18.prefab_name ~= "" and arg_193_1.actors_[var_196_18.prefab_name] ~= nil then
						local var_196_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_18.prefab_name].transform, "story_v_out_412031", "412031047", "story_v_out_412031.awb")

						arg_193_1:RecordAudio("412031047", var_196_24)
						arg_193_1:RecordAudio("412031047", var_196_24)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_412031", "412031047", "story_v_out_412031.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_412031", "412031047", "story_v_out_412031.awb")
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
	Play412031048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 412031048
		arg_197_1.duration_ = 9.7

		local var_197_0 = {
			zh = 6.933,
			ja = 9.7
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
				arg_197_0:Play412031049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1097ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1097ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, -0.54, -6.3)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1097ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["1097ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect1097ui_story == nil then
				arg_197_1.var_.characterEffect1097ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect1097ui_story then
					arg_197_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect1097ui_story then
				arg_197_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_200_13 = 0

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_200_14 = 0

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_200_15 = arg_197_1.actors_["10076ui_story"].transform
			local var_200_16 = 0

			if var_200_16 < arg_197_1.time_ and arg_197_1.time_ <= var_200_16 + arg_200_0 then
				arg_197_1.var_.moveOldPos10076ui_story = var_200_15.localPosition
			end

			local var_200_17 = 0.001

			if var_200_16 <= arg_197_1.time_ and arg_197_1.time_ < var_200_16 + var_200_17 then
				local var_200_18 = (arg_197_1.time_ - var_200_16) / var_200_17
				local var_200_19 = Vector3.New(0, 100, 0)

				var_200_15.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos10076ui_story, var_200_19, var_200_18)

				local var_200_20 = manager.ui.mainCamera.transform.position - var_200_15.position

				var_200_15.forward = Vector3.New(var_200_20.x, var_200_20.y, var_200_20.z)

				local var_200_21 = var_200_15.localEulerAngles

				var_200_21.z = 0
				var_200_21.x = 0
				var_200_15.localEulerAngles = var_200_21
			end

			if arg_197_1.time_ >= var_200_16 + var_200_17 and arg_197_1.time_ < var_200_16 + var_200_17 + arg_200_0 then
				var_200_15.localPosition = Vector3.New(0, 100, 0)

				local var_200_22 = manager.ui.mainCamera.transform.position - var_200_15.position

				var_200_15.forward = Vector3.New(var_200_22.x, var_200_22.y, var_200_22.z)

				local var_200_23 = var_200_15.localEulerAngles

				var_200_23.z = 0
				var_200_23.x = 0
				var_200_15.localEulerAngles = var_200_23
			end

			local var_200_24 = arg_197_1.actors_["10076ui_story"]
			local var_200_25 = 0

			if var_200_25 < arg_197_1.time_ and arg_197_1.time_ <= var_200_25 + arg_200_0 and arg_197_1.var_.characterEffect10076ui_story == nil then
				arg_197_1.var_.characterEffect10076ui_story = var_200_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_26 = 0.200000002980232

			if var_200_25 <= arg_197_1.time_ and arg_197_1.time_ < var_200_25 + var_200_26 then
				local var_200_27 = (arg_197_1.time_ - var_200_25) / var_200_26

				if arg_197_1.var_.characterEffect10076ui_story then
					local var_200_28 = Mathf.Lerp(0, 0.5, var_200_27)

					arg_197_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_197_1.var_.characterEffect10076ui_story.fillRatio = var_200_28
				end
			end

			if arg_197_1.time_ >= var_200_25 + var_200_26 and arg_197_1.time_ < var_200_25 + var_200_26 + arg_200_0 and arg_197_1.var_.characterEffect10076ui_story then
				local var_200_29 = 0.5

				arg_197_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_197_1.var_.characterEffect10076ui_story.fillRatio = var_200_29
			end

			local var_200_30 = 0
			local var_200_31 = 0.55

			if var_200_30 < arg_197_1.time_ and arg_197_1.time_ <= var_200_30 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_32 = arg_197_1:FormatText(StoryNameCfg[216].name)

				arg_197_1.leftNameTxt_.text = var_200_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_33 = arg_197_1:GetWordFromCfg(412031048)
				local var_200_34 = arg_197_1:FormatText(var_200_33.content)

				arg_197_1.text_.text = var_200_34

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_35 = 22
				local var_200_36 = utf8.len(var_200_34)
				local var_200_37 = var_200_35 <= 0 and var_200_31 or var_200_31 * (var_200_36 / var_200_35)

				if var_200_37 > 0 and var_200_31 < var_200_37 then
					arg_197_1.talkMaxDuration = var_200_37

					if var_200_37 + var_200_30 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_37 + var_200_30
					end
				end

				arg_197_1.text_.text = var_200_34
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031048", "story_v_out_412031.awb") ~= 0 then
					local var_200_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031048", "story_v_out_412031.awb") / 1000

					if var_200_38 + var_200_30 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_38 + var_200_30
					end

					if var_200_33.prefab_name ~= "" and arg_197_1.actors_[var_200_33.prefab_name] ~= nil then
						local var_200_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_33.prefab_name].transform, "story_v_out_412031", "412031048", "story_v_out_412031.awb")

						arg_197_1:RecordAudio("412031048", var_200_39)
						arg_197_1:RecordAudio("412031048", var_200_39)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_412031", "412031048", "story_v_out_412031.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_412031", "412031048", "story_v_out_412031.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_40 = math.max(var_200_31, arg_197_1.talkMaxDuration)

			if var_200_30 <= arg_197_1.time_ and arg_197_1.time_ < var_200_30 + var_200_40 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_30) / var_200_40

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_30 + var_200_40 and arg_197_1.time_ < var_200_30 + var_200_40 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play412031049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 412031049
		arg_201_1.duration_ = 6.4

		local var_201_0 = {
			zh = 4.833,
			ja = 6.4
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
				arg_201_0:Play412031050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10078ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10078ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -0.5, -6.3)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10078ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["10078ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect10078ui_story == nil then
				arg_201_1.var_.characterEffect10078ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect10078ui_story then
					arg_201_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect10078ui_story then
				arg_201_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_15 = arg_201_1.actors_["1097ui_story"].transform
			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 then
				arg_201_1.var_.moveOldPos1097ui_story = var_204_15.localPosition
			end

			local var_204_17 = 0.001

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Vector3.New(0, 100, 0)

				var_204_15.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1097ui_story, var_204_19, var_204_18)

				local var_204_20 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_20.x, var_204_20.y, var_204_20.z)

				local var_204_21 = var_204_15.localEulerAngles

				var_204_21.z = 0
				var_204_21.x = 0
				var_204_15.localEulerAngles = var_204_21
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				var_204_15.localPosition = Vector3.New(0, 100, 0)

				local var_204_22 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_22.x, var_204_22.y, var_204_22.z)

				local var_204_23 = var_204_15.localEulerAngles

				var_204_23.z = 0
				var_204_23.x = 0
				var_204_15.localEulerAngles = var_204_23
			end

			local var_204_24 = arg_201_1.actors_["1097ui_story"]
			local var_204_25 = 0

			if var_204_25 < arg_201_1.time_ and arg_201_1.time_ <= var_204_25 + arg_204_0 and arg_201_1.var_.characterEffect1097ui_story == nil then
				arg_201_1.var_.characterEffect1097ui_story = var_204_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_26 = 0.200000002980232

			if var_204_25 <= arg_201_1.time_ and arg_201_1.time_ < var_204_25 + var_204_26 then
				local var_204_27 = (arg_201_1.time_ - var_204_25) / var_204_26

				if arg_201_1.var_.characterEffect1097ui_story then
					local var_204_28 = Mathf.Lerp(0, 0.5, var_204_27)

					arg_201_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1097ui_story.fillRatio = var_204_28
				end
			end

			if arg_201_1.time_ >= var_204_25 + var_204_26 and arg_201_1.time_ < var_204_25 + var_204_26 + arg_204_0 and arg_201_1.var_.characterEffect1097ui_story then
				local var_204_29 = 0.5

				arg_201_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1097ui_story.fillRatio = var_204_29
			end

			local var_204_30 = 0
			local var_204_31 = 0.375

			if var_204_30 < arg_201_1.time_ and arg_201_1.time_ <= var_204_30 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_32 = arg_201_1:FormatText(StoryNameCfg[919].name)

				arg_201_1.leftNameTxt_.text = var_204_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_33 = arg_201_1:GetWordFromCfg(412031049)
				local var_204_34 = arg_201_1:FormatText(var_204_33.content)

				arg_201_1.text_.text = var_204_34

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_35 = 15
				local var_204_36 = utf8.len(var_204_34)
				local var_204_37 = var_204_35 <= 0 and var_204_31 or var_204_31 * (var_204_36 / var_204_35)

				if var_204_37 > 0 and var_204_31 < var_204_37 then
					arg_201_1.talkMaxDuration = var_204_37

					if var_204_37 + var_204_30 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_37 + var_204_30
					end
				end

				arg_201_1.text_.text = var_204_34
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031049", "story_v_out_412031.awb") ~= 0 then
					local var_204_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031049", "story_v_out_412031.awb") / 1000

					if var_204_38 + var_204_30 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_38 + var_204_30
					end

					if var_204_33.prefab_name ~= "" and arg_201_1.actors_[var_204_33.prefab_name] ~= nil then
						local var_204_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_33.prefab_name].transform, "story_v_out_412031", "412031049", "story_v_out_412031.awb")

						arg_201_1:RecordAudio("412031049", var_204_39)
						arg_201_1:RecordAudio("412031049", var_204_39)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_412031", "412031049", "story_v_out_412031.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_412031", "412031049", "story_v_out_412031.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_40 = math.max(var_204_31, arg_201_1.talkMaxDuration)

			if var_204_30 <= arg_201_1.time_ and arg_201_1.time_ < var_204_30 + var_204_40 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_30) / var_204_40

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_30 + var_204_40 and arg_201_1.time_ < var_204_30 + var_204_40 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play412031050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 412031050
		arg_205_1.duration_ = 13.166

		local var_205_0 = {
			zh = 13.166,
			ja = 11.933
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
				arg_205_0:Play412031051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10083ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10083ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(-1, -2.6, -2.8)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10083ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(-1, -2.6, -2.8)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["10083ui_story"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect10083ui_story == nil then
				arg_205_1.var_.characterEffect10083ui_story = var_208_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_11 = 0.200000002980232

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_10) / var_208_11

				if arg_205_1.var_.characterEffect10083ui_story then
					arg_205_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_11 and arg_205_1.time_ < var_208_10 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect10083ui_story then
				arg_205_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_208_13 = 0

			if var_208_13 < arg_205_1.time_ and arg_205_1.time_ <= var_208_13 + arg_208_0 then
				arg_205_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action1_1")
			end

			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 then
				arg_205_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_208_15 = arg_205_1.actors_["10078ui_story"].transform
			local var_208_16 = 0

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 then
				arg_205_1.var_.moveOldPos10078ui_story = var_208_15.localPosition
			end

			local var_208_17 = 0.001

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17
				local var_208_19 = Vector3.New(0, 100, 0)

				var_208_15.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10078ui_story, var_208_19, var_208_18)

				local var_208_20 = manager.ui.mainCamera.transform.position - var_208_15.position

				var_208_15.forward = Vector3.New(var_208_20.x, var_208_20.y, var_208_20.z)

				local var_208_21 = var_208_15.localEulerAngles

				var_208_21.z = 0
				var_208_21.x = 0
				var_208_15.localEulerAngles = var_208_21
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 then
				var_208_15.localPosition = Vector3.New(0, 100, 0)

				local var_208_22 = manager.ui.mainCamera.transform.position - var_208_15.position

				var_208_15.forward = Vector3.New(var_208_22.x, var_208_22.y, var_208_22.z)

				local var_208_23 = var_208_15.localEulerAngles

				var_208_23.z = 0
				var_208_23.x = 0
				var_208_15.localEulerAngles = var_208_23
			end

			local var_208_24 = arg_205_1.actors_["10078ui_story"]
			local var_208_25 = 0

			if var_208_25 < arg_205_1.time_ and arg_205_1.time_ <= var_208_25 + arg_208_0 and arg_205_1.var_.characterEffect10078ui_story == nil then
				arg_205_1.var_.characterEffect10078ui_story = var_208_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_26 = 0.200000002980232

			if var_208_25 <= arg_205_1.time_ and arg_205_1.time_ < var_208_25 + var_208_26 then
				local var_208_27 = (arg_205_1.time_ - var_208_25) / var_208_26

				if arg_205_1.var_.characterEffect10078ui_story then
					local var_208_28 = Mathf.Lerp(0, 0.5, var_208_27)

					arg_205_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_205_1.var_.characterEffect10078ui_story.fillRatio = var_208_28
				end
			end

			if arg_205_1.time_ >= var_208_25 + var_208_26 and arg_205_1.time_ < var_208_25 + var_208_26 + arg_208_0 and arg_205_1.var_.characterEffect10078ui_story then
				local var_208_29 = 0.5

				arg_205_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_205_1.var_.characterEffect10078ui_story.fillRatio = var_208_29
			end

			local var_208_30 = 0
			local var_208_31 = 1.475

			if var_208_30 < arg_205_1.time_ and arg_205_1.time_ <= var_208_30 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_32 = arg_205_1:FormatText(StoryNameCfg[918].name)

				arg_205_1.leftNameTxt_.text = var_208_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_33 = arg_205_1:GetWordFromCfg(412031050)
				local var_208_34 = arg_205_1:FormatText(var_208_33.content)

				arg_205_1.text_.text = var_208_34

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_35 = 58
				local var_208_36 = utf8.len(var_208_34)
				local var_208_37 = var_208_35 <= 0 and var_208_31 or var_208_31 * (var_208_36 / var_208_35)

				if var_208_37 > 0 and var_208_31 < var_208_37 then
					arg_205_1.talkMaxDuration = var_208_37

					if var_208_37 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_37 + var_208_30
					end
				end

				arg_205_1.text_.text = var_208_34
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031050", "story_v_out_412031.awb") ~= 0 then
					local var_208_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031050", "story_v_out_412031.awb") / 1000

					if var_208_38 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_38 + var_208_30
					end

					if var_208_33.prefab_name ~= "" and arg_205_1.actors_[var_208_33.prefab_name] ~= nil then
						local var_208_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_33.prefab_name].transform, "story_v_out_412031", "412031050", "story_v_out_412031.awb")

						arg_205_1:RecordAudio("412031050", var_208_39)
						arg_205_1:RecordAudio("412031050", var_208_39)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_412031", "412031050", "story_v_out_412031.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_412031", "412031050", "story_v_out_412031.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_40 = math.max(var_208_31, arg_205_1.talkMaxDuration)

			if var_208_30 <= arg_205_1.time_ and arg_205_1.time_ < var_208_30 + var_208_40 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_30) / var_208_40

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_30 + var_208_40 and arg_205_1.time_ < var_208_30 + var_208_40 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play412031051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 412031051
		arg_209_1.duration_ = 9.033

		local var_209_0 = {
			zh = 9.033,
			ja = 5.466
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
				arg_209_0:Play412031052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1097ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1097ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0.7, -0.54, -6.3)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1097ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1097ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect1097ui_story == nil then
				arg_209_1.var_.characterEffect1097ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1097ui_story then
					arg_209_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect1097ui_story then
				arg_209_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_212_15 = arg_209_1.actors_["10083ui_story"]
			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 and arg_209_1.var_.characterEffect10083ui_story == nil then
				arg_209_1.var_.characterEffect10083ui_story = var_212_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_17 = 0.200000002980232

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_17 then
				local var_212_18 = (arg_209_1.time_ - var_212_16) / var_212_17

				if arg_209_1.var_.characterEffect10083ui_story then
					local var_212_19 = Mathf.Lerp(0, 0.5, var_212_18)

					arg_209_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_209_1.var_.characterEffect10083ui_story.fillRatio = var_212_19
				end
			end

			if arg_209_1.time_ >= var_212_16 + var_212_17 and arg_209_1.time_ < var_212_16 + var_212_17 + arg_212_0 and arg_209_1.var_.characterEffect10083ui_story then
				local var_212_20 = 0.5

				arg_209_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_209_1.var_.characterEffect10083ui_story.fillRatio = var_212_20
			end

			local var_212_21 = 0
			local var_212_22 = 0.65

			if var_212_21 < arg_209_1.time_ and arg_209_1.time_ <= var_212_21 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_23 = arg_209_1:FormatText(StoryNameCfg[216].name)

				arg_209_1.leftNameTxt_.text = var_212_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_24 = arg_209_1:GetWordFromCfg(412031051)
				local var_212_25 = arg_209_1:FormatText(var_212_24.content)

				arg_209_1.text_.text = var_212_25

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_26 = 26
				local var_212_27 = utf8.len(var_212_25)
				local var_212_28 = var_212_26 <= 0 and var_212_22 or var_212_22 * (var_212_27 / var_212_26)

				if var_212_28 > 0 and var_212_22 < var_212_28 then
					arg_209_1.talkMaxDuration = var_212_28

					if var_212_28 + var_212_21 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_28 + var_212_21
					end
				end

				arg_209_1.text_.text = var_212_25
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031051", "story_v_out_412031.awb") ~= 0 then
					local var_212_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031051", "story_v_out_412031.awb") / 1000

					if var_212_29 + var_212_21 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_29 + var_212_21
					end

					if var_212_24.prefab_name ~= "" and arg_209_1.actors_[var_212_24.prefab_name] ~= nil then
						local var_212_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_24.prefab_name].transform, "story_v_out_412031", "412031051", "story_v_out_412031.awb")

						arg_209_1:RecordAudio("412031051", var_212_30)
						arg_209_1:RecordAudio("412031051", var_212_30)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_412031", "412031051", "story_v_out_412031.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_412031", "412031051", "story_v_out_412031.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_31 = math.max(var_212_22, arg_209_1.talkMaxDuration)

			if var_212_21 <= arg_209_1.time_ and arg_209_1.time_ < var_212_21 + var_212_31 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_21) / var_212_31

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_21 + var_212_31 and arg_209_1.time_ < var_212_21 + var_212_31 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play412031052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 412031052
		arg_213_1.duration_ = 5.2

		local var_213_0 = {
			zh = 5.2,
			ja = 4.666
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
				arg_213_0:Play412031053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10083ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos10083ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(-1, -2.6, -2.8)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10083ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(-1, -2.6, -2.8)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["10083ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect10083ui_story == nil then
				arg_213_1.var_.characterEffect10083ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect10083ui_story then
					arg_213_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect10083ui_story then
				arg_213_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_216_13 = 0

			if var_216_13 < arg_213_1.time_ and arg_213_1.time_ <= var_216_13 + arg_216_0 then
				arg_213_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action4_1")
			end

			local var_216_14 = 0

			if var_216_14 < arg_213_1.time_ and arg_213_1.time_ <= var_216_14 + arg_216_0 then
				arg_213_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_216_15 = arg_213_1.actors_["1097ui_story"]
			local var_216_16 = 0

			if var_216_16 < arg_213_1.time_ and arg_213_1.time_ <= var_216_16 + arg_216_0 and arg_213_1.var_.characterEffect1097ui_story == nil then
				arg_213_1.var_.characterEffect1097ui_story = var_216_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_17 = 0.200000002980232

			if var_216_16 <= arg_213_1.time_ and arg_213_1.time_ < var_216_16 + var_216_17 then
				local var_216_18 = (arg_213_1.time_ - var_216_16) / var_216_17

				if arg_213_1.var_.characterEffect1097ui_story then
					local var_216_19 = Mathf.Lerp(0, 0.5, var_216_18)

					arg_213_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1097ui_story.fillRatio = var_216_19
				end
			end

			if arg_213_1.time_ >= var_216_16 + var_216_17 and arg_213_1.time_ < var_216_16 + var_216_17 + arg_216_0 and arg_213_1.var_.characterEffect1097ui_story then
				local var_216_20 = 0.5

				arg_213_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1097ui_story.fillRatio = var_216_20
			end

			local var_216_21 = 0
			local var_216_22 = 0.625

			if var_216_21 < arg_213_1.time_ and arg_213_1.time_ <= var_216_21 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_23 = arg_213_1:FormatText(StoryNameCfg[918].name)

				arg_213_1.leftNameTxt_.text = var_216_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_24 = arg_213_1:GetWordFromCfg(412031052)
				local var_216_25 = arg_213_1:FormatText(var_216_24.content)

				arg_213_1.text_.text = var_216_25

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_26 = 25
				local var_216_27 = utf8.len(var_216_25)
				local var_216_28 = var_216_26 <= 0 and var_216_22 or var_216_22 * (var_216_27 / var_216_26)

				if var_216_28 > 0 and var_216_22 < var_216_28 then
					arg_213_1.talkMaxDuration = var_216_28

					if var_216_28 + var_216_21 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_28 + var_216_21
					end
				end

				arg_213_1.text_.text = var_216_25
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031052", "story_v_out_412031.awb") ~= 0 then
					local var_216_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031052", "story_v_out_412031.awb") / 1000

					if var_216_29 + var_216_21 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_29 + var_216_21
					end

					if var_216_24.prefab_name ~= "" and arg_213_1.actors_[var_216_24.prefab_name] ~= nil then
						local var_216_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_24.prefab_name].transform, "story_v_out_412031", "412031052", "story_v_out_412031.awb")

						arg_213_1:RecordAudio("412031052", var_216_30)
						arg_213_1:RecordAudio("412031052", var_216_30)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_412031", "412031052", "story_v_out_412031.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_412031", "412031052", "story_v_out_412031.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_31 = math.max(var_216_22, arg_213_1.talkMaxDuration)

			if var_216_21 <= arg_213_1.time_ and arg_213_1.time_ < var_216_21 + var_216_31 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_21) / var_216_31

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_21 + var_216_31 and arg_213_1.time_ < var_216_21 + var_216_31 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play412031053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 412031053
		arg_217_1.duration_ = 10.966

		local var_217_0 = {
			zh = 5.233,
			ja = 10.966
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
				arg_217_0:Play412031054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1097ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1097ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(0.7, -0.54, -6.3)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1097ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["1097ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect1097ui_story == nil then
				arg_217_1.var_.characterEffect1097ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect1097ui_story then
					arg_217_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect1097ui_story then
				arg_217_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_220_15 = arg_217_1.actors_["10083ui_story"]
			local var_220_16 = 0

			if var_220_16 < arg_217_1.time_ and arg_217_1.time_ <= var_220_16 + arg_220_0 and arg_217_1.var_.characterEffect10083ui_story == nil then
				arg_217_1.var_.characterEffect10083ui_story = var_220_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_17 = 0.200000002980232

			if var_220_16 <= arg_217_1.time_ and arg_217_1.time_ < var_220_16 + var_220_17 then
				local var_220_18 = (arg_217_1.time_ - var_220_16) / var_220_17

				if arg_217_1.var_.characterEffect10083ui_story then
					local var_220_19 = Mathf.Lerp(0, 0.5, var_220_18)

					arg_217_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_217_1.var_.characterEffect10083ui_story.fillRatio = var_220_19
				end
			end

			if arg_217_1.time_ >= var_220_16 + var_220_17 and arg_217_1.time_ < var_220_16 + var_220_17 + arg_220_0 and arg_217_1.var_.characterEffect10083ui_story then
				local var_220_20 = 0.5

				arg_217_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_217_1.var_.characterEffect10083ui_story.fillRatio = var_220_20
			end

			local var_220_21 = 0
			local var_220_22 = 0.4

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_23 = arg_217_1:FormatText(StoryNameCfg[216].name)

				arg_217_1.leftNameTxt_.text = var_220_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_24 = arg_217_1:GetWordFromCfg(412031053)
				local var_220_25 = arg_217_1:FormatText(var_220_24.content)

				arg_217_1.text_.text = var_220_25

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_26 = 16
				local var_220_27 = utf8.len(var_220_25)
				local var_220_28 = var_220_26 <= 0 and var_220_22 or var_220_22 * (var_220_27 / var_220_26)

				if var_220_28 > 0 and var_220_22 < var_220_28 then
					arg_217_1.talkMaxDuration = var_220_28

					if var_220_28 + var_220_21 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_28 + var_220_21
					end
				end

				arg_217_1.text_.text = var_220_25
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031053", "story_v_out_412031.awb") ~= 0 then
					local var_220_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031053", "story_v_out_412031.awb") / 1000

					if var_220_29 + var_220_21 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_29 + var_220_21
					end

					if var_220_24.prefab_name ~= "" and arg_217_1.actors_[var_220_24.prefab_name] ~= nil then
						local var_220_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_24.prefab_name].transform, "story_v_out_412031", "412031053", "story_v_out_412031.awb")

						arg_217_1:RecordAudio("412031053", var_220_30)
						arg_217_1:RecordAudio("412031053", var_220_30)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_412031", "412031053", "story_v_out_412031.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_412031", "412031053", "story_v_out_412031.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_31 = math.max(var_220_22, arg_217_1.talkMaxDuration)

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_31 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_21) / var_220_31

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_21 + var_220_31 and arg_217_1.time_ < var_220_21 + var_220_31 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play412031054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 412031054
		arg_221_1.duration_ = 10.165999999999

		local var_221_0 = {
			zh = 10.165999999999,
			ja = 9.265999999999
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
				arg_221_0:Play412031055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = "STblack"

			if arg_221_1.bgs_[var_224_0] == nil then
				local var_224_1 = Object.Instantiate(arg_221_1.paintGo_)

				var_224_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_224_0)
				var_224_1.name = var_224_0
				var_224_1.transform.parent = arg_221_1.stage_.transform
				var_224_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_221_1.bgs_[var_224_0] = var_224_1
			end

			local var_224_2 = 2

			if var_224_2 < arg_221_1.time_ and arg_221_1.time_ <= var_224_2 + arg_224_0 then
				local var_224_3 = manager.ui.mainCamera.transform.localPosition
				local var_224_4 = Vector3.New(0, 0, 10) + Vector3.New(var_224_3.x, var_224_3.y, 0)
				local var_224_5 = arg_221_1.bgs_.STblack

				var_224_5.transform.localPosition = var_224_4
				var_224_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_224_6 = var_224_5:GetComponent("SpriteRenderer")

				if var_224_6 and var_224_6.sprite then
					local var_224_7 = (var_224_5.transform.localPosition - var_224_3).z
					local var_224_8 = manager.ui.mainCameraCom_
					local var_224_9 = 2 * var_224_7 * Mathf.Tan(var_224_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_224_10 = var_224_9 * var_224_8.aspect
					local var_224_11 = var_224_6.sprite.bounds.size.x
					local var_224_12 = var_224_6.sprite.bounds.size.y
					local var_224_13 = var_224_10 / var_224_11
					local var_224_14 = var_224_9 / var_224_12
					local var_224_15 = var_224_14 < var_224_13 and var_224_13 or var_224_14

					var_224_5.transform.localScale = Vector3.New(var_224_15, var_224_15, 0)
				end

				for iter_224_0, iter_224_1 in pairs(arg_221_1.bgs_) do
					if iter_224_0 ~= "STblack" then
						iter_224_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_224_16 = 3.999999999999

			if var_224_16 < arg_221_1.time_ and arg_221_1.time_ <= var_224_16 + arg_224_0 then
				arg_221_1.allBtn_.enabled = false
			end

			local var_224_17 = 0.3

			if arg_221_1.time_ >= var_224_16 + var_224_17 and arg_221_1.time_ < var_224_16 + var_224_17 + arg_224_0 then
				arg_221_1.allBtn_.enabled = true
			end

			local var_224_18 = 0

			if var_224_18 < arg_221_1.time_ and arg_221_1.time_ <= var_224_18 + arg_224_0 then
				arg_221_1.mask_.enabled = true
				arg_221_1.mask_.raycastTarget = true

				arg_221_1:SetGaussion(false)
			end

			local var_224_19 = 2

			if var_224_18 <= arg_221_1.time_ and arg_221_1.time_ < var_224_18 + var_224_19 then
				local var_224_20 = (arg_221_1.time_ - var_224_18) / var_224_19
				local var_224_21 = Color.New(0, 0, 0)

				var_224_21.a = Mathf.Lerp(0, 1, var_224_20)
				arg_221_1.mask_.color = var_224_21
			end

			if arg_221_1.time_ >= var_224_18 + var_224_19 and arg_221_1.time_ < var_224_18 + var_224_19 + arg_224_0 then
				local var_224_22 = Color.New(0, 0, 0)

				var_224_22.a = 1
				arg_221_1.mask_.color = var_224_22
			end

			local var_224_23 = 2

			if var_224_23 < arg_221_1.time_ and arg_221_1.time_ <= var_224_23 + arg_224_0 then
				arg_221_1.mask_.enabled = true
				arg_221_1.mask_.raycastTarget = true

				arg_221_1:SetGaussion(false)
			end

			local var_224_24 = 2

			if var_224_23 <= arg_221_1.time_ and arg_221_1.time_ < var_224_23 + var_224_24 then
				local var_224_25 = (arg_221_1.time_ - var_224_23) / var_224_24
				local var_224_26 = Color.New(0, 0, 0)

				var_224_26.a = Mathf.Lerp(1, 0, var_224_25)
				arg_221_1.mask_.color = var_224_26
			end

			if arg_221_1.time_ >= var_224_23 + var_224_24 and arg_221_1.time_ < var_224_23 + var_224_24 + arg_224_0 then
				local var_224_27 = Color.New(0, 0, 0)
				local var_224_28 = 0

				arg_221_1.mask_.enabled = false
				var_224_27.a = var_224_28
				arg_221_1.mask_.color = var_224_27
			end

			local var_224_29 = arg_221_1.actors_["1097ui_story"].transform
			local var_224_30 = 1.966

			if var_224_30 < arg_221_1.time_ and arg_221_1.time_ <= var_224_30 + arg_224_0 then
				arg_221_1.var_.moveOldPos1097ui_story = var_224_29.localPosition
			end

			local var_224_31 = 0.001

			if var_224_30 <= arg_221_1.time_ and arg_221_1.time_ < var_224_30 + var_224_31 then
				local var_224_32 = (arg_221_1.time_ - var_224_30) / var_224_31
				local var_224_33 = Vector3.New(0, 100, 0)

				var_224_29.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1097ui_story, var_224_33, var_224_32)

				local var_224_34 = manager.ui.mainCamera.transform.position - var_224_29.position

				var_224_29.forward = Vector3.New(var_224_34.x, var_224_34.y, var_224_34.z)

				local var_224_35 = var_224_29.localEulerAngles

				var_224_35.z = 0
				var_224_35.x = 0
				var_224_29.localEulerAngles = var_224_35
			end

			if arg_221_1.time_ >= var_224_30 + var_224_31 and arg_221_1.time_ < var_224_30 + var_224_31 + arg_224_0 then
				var_224_29.localPosition = Vector3.New(0, 100, 0)

				local var_224_36 = manager.ui.mainCamera.transform.position - var_224_29.position

				var_224_29.forward = Vector3.New(var_224_36.x, var_224_36.y, var_224_36.z)

				local var_224_37 = var_224_29.localEulerAngles

				var_224_37.z = 0
				var_224_37.x = 0
				var_224_29.localEulerAngles = var_224_37
			end

			local var_224_38 = arg_221_1.actors_["10083ui_story"].transform
			local var_224_39 = 1.966

			if var_224_39 < arg_221_1.time_ and arg_221_1.time_ <= var_224_39 + arg_224_0 then
				arg_221_1.var_.moveOldPos10083ui_story = var_224_38.localPosition
			end

			local var_224_40 = 0.001

			if var_224_39 <= arg_221_1.time_ and arg_221_1.time_ < var_224_39 + var_224_40 then
				local var_224_41 = (arg_221_1.time_ - var_224_39) / var_224_40
				local var_224_42 = Vector3.New(0, 100, 0)

				var_224_38.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10083ui_story, var_224_42, var_224_41)

				local var_224_43 = manager.ui.mainCamera.transform.position - var_224_38.position

				var_224_38.forward = Vector3.New(var_224_43.x, var_224_43.y, var_224_43.z)

				local var_224_44 = var_224_38.localEulerAngles

				var_224_44.z = 0
				var_224_44.x = 0
				var_224_38.localEulerAngles = var_224_44
			end

			if arg_221_1.time_ >= var_224_39 + var_224_40 and arg_221_1.time_ < var_224_39 + var_224_40 + arg_224_0 then
				var_224_38.localPosition = Vector3.New(0, 100, 0)

				local var_224_45 = manager.ui.mainCamera.transform.position - var_224_38.position

				var_224_38.forward = Vector3.New(var_224_45.x, var_224_45.y, var_224_45.z)

				local var_224_46 = var_224_38.localEulerAngles

				var_224_46.z = 0
				var_224_46.x = 0
				var_224_38.localEulerAngles = var_224_46
			end

			if arg_221_1.frameCnt_ <= 1 then
				arg_221_1.dialog_:SetActive(false)
			end

			local var_224_47 = 3.999999999999
			local var_224_48 = 0.55

			if var_224_47 < arg_221_1.time_ and arg_221_1.time_ <= var_224_47 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				arg_221_1.dialog_:SetActive(true)

				local var_224_49 = LeanTween.value(arg_221_1.dialog_, 0, 1, 0.3)

				var_224_49:setOnUpdate(LuaHelper.FloatAction(function(arg_225_0)
					arg_221_1.dialogCg_.alpha = arg_225_0
				end))
				var_224_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_221_1.dialog_)
					var_224_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_221_1.duration_ = arg_221_1.duration_ + 0.3

				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_50 = arg_221_1:FormatText(StoryNameCfg[216].name)

				arg_221_1.leftNameTxt_.text = var_224_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_51 = arg_221_1:GetWordFromCfg(412031054)
				local var_224_52 = arg_221_1:FormatText(var_224_51.content)

				arg_221_1.text_.text = var_224_52

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_53 = 22
				local var_224_54 = utf8.len(var_224_52)
				local var_224_55 = var_224_53 <= 0 and var_224_48 or var_224_48 * (var_224_54 / var_224_53)

				if var_224_55 > 0 and var_224_48 < var_224_55 then
					arg_221_1.talkMaxDuration = var_224_55
					var_224_47 = var_224_47 + 0.3

					if var_224_55 + var_224_47 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_55 + var_224_47
					end
				end

				arg_221_1.text_.text = var_224_52
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031054", "story_v_out_412031.awb") ~= 0 then
					local var_224_56 = manager.audio:GetVoiceLength("story_v_out_412031", "412031054", "story_v_out_412031.awb") / 1000

					if var_224_56 + var_224_47 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_56 + var_224_47
					end

					if var_224_51.prefab_name ~= "" and arg_221_1.actors_[var_224_51.prefab_name] ~= nil then
						local var_224_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_51.prefab_name].transform, "story_v_out_412031", "412031054", "story_v_out_412031.awb")

						arg_221_1:RecordAudio("412031054", var_224_57)
						arg_221_1:RecordAudio("412031054", var_224_57)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_412031", "412031054", "story_v_out_412031.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_412031", "412031054", "story_v_out_412031.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_58 = var_224_47 + 0.3
			local var_224_59 = math.max(var_224_48, arg_221_1.talkMaxDuration)

			if var_224_58 <= arg_221_1.time_ and arg_221_1.time_ < var_224_58 + var_224_59 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_58) / var_224_59

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_58 + var_224_59 and arg_221_1.time_ < var_224_58 + var_224_59 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play412031055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 412031055
		arg_227_1.duration_ = 6.899999999999

		local var_227_0 = {
			zh = 6.765999999999,
			ja = 6.899999999999
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
				arg_227_0:Play412031056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 1.999999999999

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				local var_230_1 = manager.ui.mainCamera.transform.localPosition
				local var_230_2 = Vector3.New(0, 0, 10) + Vector3.New(var_230_1.x, var_230_1.y, 0)
				local var_230_3 = arg_227_1.bgs_.ST30

				var_230_3.transform.localPosition = var_230_2
				var_230_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_230_4 = var_230_3:GetComponent("SpriteRenderer")

				if var_230_4 and var_230_4.sprite then
					local var_230_5 = (var_230_3.transform.localPosition - var_230_1).z
					local var_230_6 = manager.ui.mainCameraCom_
					local var_230_7 = 2 * var_230_5 * Mathf.Tan(var_230_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_230_8 = var_230_7 * var_230_6.aspect
					local var_230_9 = var_230_4.sprite.bounds.size.x
					local var_230_10 = var_230_4.sprite.bounds.size.y
					local var_230_11 = var_230_8 / var_230_9
					local var_230_12 = var_230_7 / var_230_10
					local var_230_13 = var_230_12 < var_230_11 and var_230_11 or var_230_12

					var_230_3.transform.localScale = Vector3.New(var_230_13, var_230_13, 0)
				end

				for iter_230_0, iter_230_1 in pairs(arg_227_1.bgs_) do
					if iter_230_0 ~= "ST30" then
						iter_230_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_230_14 = 3.999999999999

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1.allBtn_.enabled = false
			end

			local var_230_15 = 0.299999997018768

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 then
				arg_227_1.allBtn_.enabled = true
			end

			local var_230_16 = 0

			if var_230_16 < arg_227_1.time_ and arg_227_1.time_ <= var_230_16 + arg_230_0 then
				arg_227_1.mask_.enabled = true
				arg_227_1.mask_.raycastTarget = true

				arg_227_1:SetGaussion(false)
			end

			local var_230_17 = 2

			if var_230_16 <= arg_227_1.time_ and arg_227_1.time_ < var_230_16 + var_230_17 then
				local var_230_18 = (arg_227_1.time_ - var_230_16) / var_230_17
				local var_230_19 = Color.New(0, 0, 0)

				var_230_19.a = Mathf.Lerp(0, 1, var_230_18)
				arg_227_1.mask_.color = var_230_19
			end

			if arg_227_1.time_ >= var_230_16 + var_230_17 and arg_227_1.time_ < var_230_16 + var_230_17 + arg_230_0 then
				local var_230_20 = Color.New(0, 0, 0)

				var_230_20.a = 1
				arg_227_1.mask_.color = var_230_20
			end

			local var_230_21 = 1.999999999999

			if var_230_21 < arg_227_1.time_ and arg_227_1.time_ <= var_230_21 + arg_230_0 then
				arg_227_1.mask_.enabled = true
				arg_227_1.mask_.raycastTarget = true

				arg_227_1:SetGaussion(false)
			end

			local var_230_22 = 2

			if var_230_21 <= arg_227_1.time_ and arg_227_1.time_ < var_230_21 + var_230_22 then
				local var_230_23 = (arg_227_1.time_ - var_230_21) / var_230_22
				local var_230_24 = Color.New(0, 0, 0)

				var_230_24.a = Mathf.Lerp(1, 0, var_230_23)
				arg_227_1.mask_.color = var_230_24
			end

			if arg_227_1.time_ >= var_230_21 + var_230_22 and arg_227_1.time_ < var_230_21 + var_230_22 + arg_230_0 then
				local var_230_25 = Color.New(0, 0, 0)
				local var_230_26 = 0

				arg_227_1.mask_.enabled = false
				var_230_25.a = var_230_26
				arg_227_1.mask_.color = var_230_25
			end

			local var_230_27 = arg_227_1.actors_["10078ui_story"].transform
			local var_230_28 = 3.8

			if var_230_28 < arg_227_1.time_ and arg_227_1.time_ <= var_230_28 + arg_230_0 then
				arg_227_1.var_.moveOldPos10078ui_story = var_230_27.localPosition
			end

			local var_230_29 = 0.001

			if var_230_28 <= arg_227_1.time_ and arg_227_1.time_ < var_230_28 + var_230_29 then
				local var_230_30 = (arg_227_1.time_ - var_230_28) / var_230_29
				local var_230_31 = Vector3.New(0, -0.5, -6.3)

				var_230_27.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10078ui_story, var_230_31, var_230_30)

				local var_230_32 = manager.ui.mainCamera.transform.position - var_230_27.position

				var_230_27.forward = Vector3.New(var_230_32.x, var_230_32.y, var_230_32.z)

				local var_230_33 = var_230_27.localEulerAngles

				var_230_33.z = 0
				var_230_33.x = 0
				var_230_27.localEulerAngles = var_230_33
			end

			if arg_227_1.time_ >= var_230_28 + var_230_29 and arg_227_1.time_ < var_230_28 + var_230_29 + arg_230_0 then
				var_230_27.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_230_34 = manager.ui.mainCamera.transform.position - var_230_27.position

				var_230_27.forward = Vector3.New(var_230_34.x, var_230_34.y, var_230_34.z)

				local var_230_35 = var_230_27.localEulerAngles

				var_230_35.z = 0
				var_230_35.x = 0
				var_230_27.localEulerAngles = var_230_35
			end

			local var_230_36 = arg_227_1.actors_["10078ui_story"]
			local var_230_37 = 3.8

			if var_230_37 < arg_227_1.time_ and arg_227_1.time_ <= var_230_37 + arg_230_0 and arg_227_1.var_.characterEffect10078ui_story == nil then
				arg_227_1.var_.characterEffect10078ui_story = var_230_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_38 = 0.200000002980232

			if var_230_37 <= arg_227_1.time_ and arg_227_1.time_ < var_230_37 + var_230_38 then
				local var_230_39 = (arg_227_1.time_ - var_230_37) / var_230_38

				if arg_227_1.var_.characterEffect10078ui_story then
					arg_227_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_37 + var_230_38 and arg_227_1.time_ < var_230_37 + var_230_38 + arg_230_0 and arg_227_1.var_.characterEffect10078ui_story then
				arg_227_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_230_40 = 3.8

			if var_230_40 < arg_227_1.time_ and arg_227_1.time_ <= var_230_40 + arg_230_0 then
				arg_227_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_230_41 = 3.8

			if var_230_41 < arg_227_1.time_ and arg_227_1.time_ <= var_230_41 + arg_230_0 then
				arg_227_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_42 = arg_227_1.actors_["1097ui_story"].transform
			local var_230_43 = 1.966

			if var_230_43 < arg_227_1.time_ and arg_227_1.time_ <= var_230_43 + arg_230_0 then
				arg_227_1.var_.moveOldPos1097ui_story = var_230_42.localPosition
			end

			local var_230_44 = 0.001

			if var_230_43 <= arg_227_1.time_ and arg_227_1.time_ < var_230_43 + var_230_44 then
				local var_230_45 = (arg_227_1.time_ - var_230_43) / var_230_44
				local var_230_46 = Vector3.New(0, 100, 0)

				var_230_42.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1097ui_story, var_230_46, var_230_45)

				local var_230_47 = manager.ui.mainCamera.transform.position - var_230_42.position

				var_230_42.forward = Vector3.New(var_230_47.x, var_230_47.y, var_230_47.z)

				local var_230_48 = var_230_42.localEulerAngles

				var_230_48.z = 0
				var_230_48.x = 0
				var_230_42.localEulerAngles = var_230_48
			end

			if arg_227_1.time_ >= var_230_43 + var_230_44 and arg_227_1.time_ < var_230_43 + var_230_44 + arg_230_0 then
				var_230_42.localPosition = Vector3.New(0, 100, 0)

				local var_230_49 = manager.ui.mainCamera.transform.position - var_230_42.position

				var_230_42.forward = Vector3.New(var_230_49.x, var_230_49.y, var_230_49.z)

				local var_230_50 = var_230_42.localEulerAngles

				var_230_50.z = 0
				var_230_50.x = 0
				var_230_42.localEulerAngles = var_230_50
			end

			local var_230_51 = arg_227_1.actors_["10083ui_story"].transform
			local var_230_52 = 1.966

			if var_230_52 < arg_227_1.time_ and arg_227_1.time_ <= var_230_52 + arg_230_0 then
				arg_227_1.var_.moveOldPos10083ui_story = var_230_51.localPosition
			end

			local var_230_53 = 0.001

			if var_230_52 <= arg_227_1.time_ and arg_227_1.time_ < var_230_52 + var_230_53 then
				local var_230_54 = (arg_227_1.time_ - var_230_52) / var_230_53
				local var_230_55 = Vector3.New(0, 100, 0)

				var_230_51.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10083ui_story, var_230_55, var_230_54)

				local var_230_56 = manager.ui.mainCamera.transform.position - var_230_51.position

				var_230_51.forward = Vector3.New(var_230_56.x, var_230_56.y, var_230_56.z)

				local var_230_57 = var_230_51.localEulerAngles

				var_230_57.z = 0
				var_230_57.x = 0
				var_230_51.localEulerAngles = var_230_57
			end

			if arg_227_1.time_ >= var_230_52 + var_230_53 and arg_227_1.time_ < var_230_52 + var_230_53 + arg_230_0 then
				var_230_51.localPosition = Vector3.New(0, 100, 0)

				local var_230_58 = manager.ui.mainCamera.transform.position - var_230_51.position

				var_230_51.forward = Vector3.New(var_230_58.x, var_230_58.y, var_230_58.z)

				local var_230_59 = var_230_51.localEulerAngles

				var_230_59.z = 0
				var_230_59.x = 0
				var_230_51.localEulerAngles = var_230_59
			end

			if arg_227_1.frameCnt_ <= 1 then
				arg_227_1.dialog_:SetActive(false)
			end

			local var_230_60 = 3.999999999999
			local var_230_61 = 0.2

			if var_230_60 < arg_227_1.time_ and arg_227_1.time_ <= var_230_60 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0

				arg_227_1.dialog_:SetActive(true)

				local var_230_62 = LeanTween.value(arg_227_1.dialog_, 0, 1, 0.3)

				var_230_62:setOnUpdate(LuaHelper.FloatAction(function(arg_231_0)
					arg_227_1.dialogCg_.alpha = arg_231_0
				end))
				var_230_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_227_1.dialog_)
					var_230_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_227_1.duration_ = arg_227_1.duration_ + 0.3

				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_63 = arg_227_1:FormatText(StoryNameCfg[919].name)

				arg_227_1.leftNameTxt_.text = var_230_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_64 = arg_227_1:GetWordFromCfg(412031055)
				local var_230_65 = arg_227_1:FormatText(var_230_64.content)

				arg_227_1.text_.text = var_230_65

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_66 = 8
				local var_230_67 = utf8.len(var_230_65)
				local var_230_68 = var_230_66 <= 0 and var_230_61 or var_230_61 * (var_230_67 / var_230_66)

				if var_230_68 > 0 and var_230_61 < var_230_68 then
					arg_227_1.talkMaxDuration = var_230_68
					var_230_60 = var_230_60 + 0.3

					if var_230_68 + var_230_60 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_68 + var_230_60
					end
				end

				arg_227_1.text_.text = var_230_65
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031055", "story_v_out_412031.awb") ~= 0 then
					local var_230_69 = manager.audio:GetVoiceLength("story_v_out_412031", "412031055", "story_v_out_412031.awb") / 1000

					if var_230_69 + var_230_60 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_69 + var_230_60
					end

					if var_230_64.prefab_name ~= "" and arg_227_1.actors_[var_230_64.prefab_name] ~= nil then
						local var_230_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_64.prefab_name].transform, "story_v_out_412031", "412031055", "story_v_out_412031.awb")

						arg_227_1:RecordAudio("412031055", var_230_70)
						arg_227_1:RecordAudio("412031055", var_230_70)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_412031", "412031055", "story_v_out_412031.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_412031", "412031055", "story_v_out_412031.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_71 = var_230_60 + 0.3
			local var_230_72 = math.max(var_230_61, arg_227_1.talkMaxDuration)

			if var_230_71 <= arg_227_1.time_ and arg_227_1.time_ < var_230_71 + var_230_72 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_71) / var_230_72

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_71 + var_230_72 and arg_227_1.time_ < var_230_71 + var_230_72 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play412031056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 412031056
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play412031057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10078ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10078ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(0, 100, 0)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10078ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, 100, 0)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["10078ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect10078ui_story == nil then
				arg_233_1.var_.characterEffect10078ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect10078ui_story then
					local var_236_13 = Mathf.Lerp(0, 0.5, var_236_12)

					arg_233_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_233_1.var_.characterEffect10078ui_story.fillRatio = var_236_13
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect10078ui_story then
				local var_236_14 = 0.5

				arg_233_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_233_1.var_.characterEffect10078ui_story.fillRatio = var_236_14
			end

			local var_236_15 = 0
			local var_236_16 = 1.35

			if var_236_15 < arg_233_1.time_ and arg_233_1.time_ <= var_236_15 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_17 = arg_233_1:GetWordFromCfg(412031056)
				local var_236_18 = arg_233_1:FormatText(var_236_17.content)

				arg_233_1.text_.text = var_236_18

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_19 = 54
				local var_236_20 = utf8.len(var_236_18)
				local var_236_21 = var_236_19 <= 0 and var_236_16 or var_236_16 * (var_236_20 / var_236_19)

				if var_236_21 > 0 and var_236_16 < var_236_21 then
					arg_233_1.talkMaxDuration = var_236_21

					if var_236_21 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_15
					end
				end

				arg_233_1.text_.text = var_236_18
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_22 = math.max(var_236_16, arg_233_1.talkMaxDuration)

			if var_236_15 <= arg_233_1.time_ and arg_233_1.time_ < var_236_15 + var_236_22 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_15) / var_236_22

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_15 + var_236_22 and arg_233_1.time_ < var_236_15 + var_236_22 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play412031057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 412031057
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play412031058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.925

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_2 = arg_237_1:GetWordFromCfg(412031057)
				local var_240_3 = arg_237_1:FormatText(var_240_2.content)

				arg_237_1.text_.text = var_240_3

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_4 = 37
				local var_240_5 = utf8.len(var_240_3)
				local var_240_6 = var_240_4 <= 0 and var_240_1 or var_240_1 * (var_240_5 / var_240_4)

				if var_240_6 > 0 and var_240_1 < var_240_6 then
					arg_237_1.talkMaxDuration = var_240_6

					if var_240_6 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_6 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_3
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_7 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_7 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_7

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_7 and arg_237_1.time_ < var_240_0 + var_240_7 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play412031058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 412031058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play412031059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.675

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_2 = arg_241_1:GetWordFromCfg(412031058)
				local var_244_3 = arg_241_1:FormatText(var_244_2.content)

				arg_241_1.text_.text = var_244_3

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_4 = 27
				local var_244_5 = utf8.len(var_244_3)
				local var_244_6 = var_244_4 <= 0 and var_244_1 or var_244_1 * (var_244_5 / var_244_4)

				if var_244_6 > 0 and var_244_1 < var_244_6 then
					arg_241_1.talkMaxDuration = var_244_6

					if var_244_6 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_6 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_3
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_7 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_7 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_7

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_7 and arg_241_1.time_ < var_244_0 + var_244_7 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play412031059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 412031059
		arg_245_1.duration_ = 11.033

		local var_245_0 = {
			zh = 5.5,
			ja = 11.033
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
				arg_245_0:Play412031060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10078ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos10078ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(0, -0.5, -6.3)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10078ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["10078ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect10078ui_story == nil then
				arg_245_1.var_.characterEffect10078ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect10078ui_story then
					arg_245_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect10078ui_story then
				arg_245_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action4_2")
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_248_15 = 0
			local var_248_16 = 0.375

			if var_248_15 < arg_245_1.time_ and arg_245_1.time_ <= var_248_15 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_17 = arg_245_1:FormatText(StoryNameCfg[919].name)

				arg_245_1.leftNameTxt_.text = var_248_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_18 = arg_245_1:GetWordFromCfg(412031059)
				local var_248_19 = arg_245_1:FormatText(var_248_18.content)

				arg_245_1.text_.text = var_248_19

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_20 = 15
				local var_248_21 = utf8.len(var_248_19)
				local var_248_22 = var_248_20 <= 0 and var_248_16 or var_248_16 * (var_248_21 / var_248_20)

				if var_248_22 > 0 and var_248_16 < var_248_22 then
					arg_245_1.talkMaxDuration = var_248_22

					if var_248_22 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_22 + var_248_15
					end
				end

				arg_245_1.text_.text = var_248_19
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031059", "story_v_out_412031.awb") ~= 0 then
					local var_248_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031059", "story_v_out_412031.awb") / 1000

					if var_248_23 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_23 + var_248_15
					end

					if var_248_18.prefab_name ~= "" and arg_245_1.actors_[var_248_18.prefab_name] ~= nil then
						local var_248_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_18.prefab_name].transform, "story_v_out_412031", "412031059", "story_v_out_412031.awb")

						arg_245_1:RecordAudio("412031059", var_248_24)
						arg_245_1:RecordAudio("412031059", var_248_24)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_412031", "412031059", "story_v_out_412031.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_412031", "412031059", "story_v_out_412031.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_25 = math.max(var_248_16, arg_245_1.talkMaxDuration)

			if var_248_15 <= arg_245_1.time_ and arg_245_1.time_ < var_248_15 + var_248_25 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_15) / var_248_25

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_15 + var_248_25 and arg_245_1.time_ < var_248_15 + var_248_25 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play412031060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 412031060
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play412031061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10078ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos10078ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, 100, 0)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos10078ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, 100, 0)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["10078ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect10078ui_story == nil then
				arg_249_1.var_.characterEffect10078ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect10078ui_story then
					local var_252_13 = Mathf.Lerp(0, 0.5, var_252_12)

					arg_249_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_249_1.var_.characterEffect10078ui_story.fillRatio = var_252_13
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect10078ui_story then
				local var_252_14 = 0.5

				arg_249_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_249_1.var_.characterEffect10078ui_story.fillRatio = var_252_14
			end

			local var_252_15 = 0
			local var_252_16 = 0.725

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_17 = arg_249_1:GetWordFromCfg(412031060)
				local var_252_18 = arg_249_1:FormatText(var_252_17.content)

				arg_249_1.text_.text = var_252_18

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_19 = 29
				local var_252_20 = utf8.len(var_252_18)
				local var_252_21 = var_252_19 <= 0 and var_252_16 or var_252_16 * (var_252_20 / var_252_19)

				if var_252_21 > 0 and var_252_16 < var_252_21 then
					arg_249_1.talkMaxDuration = var_252_21

					if var_252_21 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_21 + var_252_15
					end
				end

				arg_249_1.text_.text = var_252_18
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_16, arg_249_1.talkMaxDuration)

			if var_252_15 <= arg_249_1.time_ and arg_249_1.time_ < var_252_15 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_15) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_15 + var_252_22 and arg_249_1.time_ < var_252_15 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play412031061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 412031061
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play412031062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.55

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				arg_253_1.dialog_:SetActive(true)

				local var_256_2 = LeanTween.value(arg_253_1.dialog_, 0, 1, 0.3)

				var_256_2:setOnUpdate(LuaHelper.FloatAction(function(arg_257_0)
					arg_253_1.dialogCg_.alpha = arg_257_0
				end))
				var_256_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_253_1.dialog_)
					var_256_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_253_1.duration_ = arg_253_1.duration_ + 0.3

				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(412031061)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 22
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7
					var_256_0 = var_256_0 + 0.3

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_8 = var_256_0 + 0.3
			local var_256_9 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_8 <= arg_253_1.time_ and arg_253_1.time_ < var_256_8 + var_256_9 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_8) / var_256_9

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_8 + var_256_9 and arg_253_1.time_ < var_256_8 + var_256_9 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play412031062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 412031062
		arg_259_1.duration_ = 13.933

		local var_259_0 = {
			zh = 12.166,
			ja = 13.933
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
				arg_259_0:Play412031063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 2.00000000298023

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				local var_262_1 = manager.ui.mainCamera.transform.localPosition
				local var_262_2 = Vector3.New(0, 0, 10) + Vector3.New(var_262_1.x, var_262_1.y, 0)
				local var_262_3 = arg_259_1.bgs_.ST30

				var_262_3.transform.localPosition = var_262_2
				var_262_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_262_4 = var_262_3:GetComponent("SpriteRenderer")

				if var_262_4 and var_262_4.sprite then
					local var_262_5 = (var_262_3.transform.localPosition - var_262_1).z
					local var_262_6 = manager.ui.mainCameraCom_
					local var_262_7 = 2 * var_262_5 * Mathf.Tan(var_262_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_262_8 = var_262_7 * var_262_6.aspect
					local var_262_9 = var_262_4.sprite.bounds.size.x
					local var_262_10 = var_262_4.sprite.bounds.size.y
					local var_262_11 = var_262_8 / var_262_9
					local var_262_12 = var_262_7 / var_262_10
					local var_262_13 = var_262_12 < var_262_11 and var_262_11 or var_262_12

					var_262_3.transform.localScale = Vector3.New(var_262_13, var_262_13, 0)
				end

				for iter_262_0, iter_262_1 in pairs(arg_259_1.bgs_) do
					if iter_262_0 ~= "ST30" then
						iter_262_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_262_14 = 4.00000000298023

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 then
				arg_259_1.allBtn_.enabled = false
			end

			local var_262_15 = 0.3

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 then
				arg_259_1.allBtn_.enabled = true
			end

			local var_262_16 = 0

			if var_262_16 < arg_259_1.time_ and arg_259_1.time_ <= var_262_16 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_17 = 2

			if var_262_16 <= arg_259_1.time_ and arg_259_1.time_ < var_262_16 + var_262_17 then
				local var_262_18 = (arg_259_1.time_ - var_262_16) / var_262_17
				local var_262_19 = Color.New(0, 0, 0)

				var_262_19.a = Mathf.Lerp(0, 1, var_262_18)
				arg_259_1.mask_.color = var_262_19
			end

			if arg_259_1.time_ >= var_262_16 + var_262_17 and arg_259_1.time_ < var_262_16 + var_262_17 + arg_262_0 then
				local var_262_20 = Color.New(0, 0, 0)

				var_262_20.a = 1
				arg_259_1.mask_.color = var_262_20
			end

			local var_262_21 = 2

			if var_262_21 < arg_259_1.time_ and arg_259_1.time_ <= var_262_21 + arg_262_0 then
				arg_259_1.mask_.enabled = true
				arg_259_1.mask_.raycastTarget = true

				arg_259_1:SetGaussion(false)
			end

			local var_262_22 = 2

			if var_262_21 <= arg_259_1.time_ and arg_259_1.time_ < var_262_21 + var_262_22 then
				local var_262_23 = (arg_259_1.time_ - var_262_21) / var_262_22
				local var_262_24 = Color.New(0, 0, 0)

				var_262_24.a = Mathf.Lerp(1, 0, var_262_23)
				arg_259_1.mask_.color = var_262_24
			end

			if arg_259_1.time_ >= var_262_21 + var_262_22 and arg_259_1.time_ < var_262_21 + var_262_22 + arg_262_0 then
				local var_262_25 = Color.New(0, 0, 0)
				local var_262_26 = 0

				arg_259_1.mask_.enabled = false
				var_262_25.a = var_262_26
				arg_259_1.mask_.color = var_262_25
			end

			local var_262_27 = arg_259_1.actors_["10083ui_story"].transform
			local var_262_28 = 3.8

			if var_262_28 < arg_259_1.time_ and arg_259_1.time_ <= var_262_28 + arg_262_0 then
				arg_259_1.var_.moveOldPos10083ui_story = var_262_27.localPosition
			end

			local var_262_29 = 0.001

			if var_262_28 <= arg_259_1.time_ and arg_259_1.time_ < var_262_28 + var_262_29 then
				local var_262_30 = (arg_259_1.time_ - var_262_28) / var_262_29
				local var_262_31 = Vector3.New(0, -2.6, -2.8)

				var_262_27.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10083ui_story, var_262_31, var_262_30)

				local var_262_32 = manager.ui.mainCamera.transform.position - var_262_27.position

				var_262_27.forward = Vector3.New(var_262_32.x, var_262_32.y, var_262_32.z)

				local var_262_33 = var_262_27.localEulerAngles

				var_262_33.z = 0
				var_262_33.x = 0
				var_262_27.localEulerAngles = var_262_33
			end

			if arg_259_1.time_ >= var_262_28 + var_262_29 and arg_259_1.time_ < var_262_28 + var_262_29 + arg_262_0 then
				var_262_27.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_262_34 = manager.ui.mainCamera.transform.position - var_262_27.position

				var_262_27.forward = Vector3.New(var_262_34.x, var_262_34.y, var_262_34.z)

				local var_262_35 = var_262_27.localEulerAngles

				var_262_35.z = 0
				var_262_35.x = 0
				var_262_27.localEulerAngles = var_262_35
			end

			local var_262_36 = arg_259_1.actors_["10083ui_story"]
			local var_262_37 = 3.8

			if var_262_37 < arg_259_1.time_ and arg_259_1.time_ <= var_262_37 + arg_262_0 and arg_259_1.var_.characterEffect10083ui_story == nil then
				arg_259_1.var_.characterEffect10083ui_story = var_262_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_38 = 0.200000002980232

			if var_262_37 <= arg_259_1.time_ and arg_259_1.time_ < var_262_37 + var_262_38 then
				local var_262_39 = (arg_259_1.time_ - var_262_37) / var_262_38

				if arg_259_1.var_.characterEffect10083ui_story then
					arg_259_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_37 + var_262_38 and arg_259_1.time_ < var_262_37 + var_262_38 + arg_262_0 and arg_259_1.var_.characterEffect10083ui_story then
				arg_259_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_262_40 = 3.8

			if var_262_40 < arg_259_1.time_ and arg_259_1.time_ <= var_262_40 + arg_262_0 then
				arg_259_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action4_1")
			end

			local var_262_41 = 3.8

			if var_262_41 < arg_259_1.time_ and arg_259_1.time_ <= var_262_41 + arg_262_0 then
				arg_259_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_262_42 = arg_259_1.actors_["10078ui_story"].transform
			local var_262_43 = 1.96599999815226

			if var_262_43 < arg_259_1.time_ and arg_259_1.time_ <= var_262_43 + arg_262_0 then
				arg_259_1.var_.moveOldPos10078ui_story = var_262_42.localPosition
			end

			local var_262_44 = 0.001

			if var_262_43 <= arg_259_1.time_ and arg_259_1.time_ < var_262_43 + var_262_44 then
				local var_262_45 = (arg_259_1.time_ - var_262_43) / var_262_44
				local var_262_46 = Vector3.New(0, 100, 0)

				var_262_42.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10078ui_story, var_262_46, var_262_45)

				local var_262_47 = manager.ui.mainCamera.transform.position - var_262_42.position

				var_262_42.forward = Vector3.New(var_262_47.x, var_262_47.y, var_262_47.z)

				local var_262_48 = var_262_42.localEulerAngles

				var_262_48.z = 0
				var_262_48.x = 0
				var_262_42.localEulerAngles = var_262_48
			end

			if arg_259_1.time_ >= var_262_43 + var_262_44 and arg_259_1.time_ < var_262_43 + var_262_44 + arg_262_0 then
				var_262_42.localPosition = Vector3.New(0, 100, 0)

				local var_262_49 = manager.ui.mainCamera.transform.position - var_262_42.position

				var_262_42.forward = Vector3.New(var_262_49.x, var_262_49.y, var_262_49.z)

				local var_262_50 = var_262_42.localEulerAngles

				var_262_50.z = 0
				var_262_50.x = 0
				var_262_42.localEulerAngles = var_262_50
			end

			if arg_259_1.frameCnt_ <= 1 then
				arg_259_1.dialog_:SetActive(false)
			end

			local var_262_51 = 4
			local var_262_52 = 0.875

			if var_262_51 < arg_259_1.time_ and arg_259_1.time_ <= var_262_51 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0

				arg_259_1.dialog_:SetActive(true)

				local var_262_53 = LeanTween.value(arg_259_1.dialog_, 0, 1, 0.3)

				var_262_53:setOnUpdate(LuaHelper.FloatAction(function(arg_263_0)
					arg_259_1.dialogCg_.alpha = arg_263_0
				end))
				var_262_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_259_1.dialog_)
					var_262_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_259_1.duration_ = arg_259_1.duration_ + 0.3

				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_54 = arg_259_1:FormatText(StoryNameCfg[918].name)

				arg_259_1.leftNameTxt_.text = var_262_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_55 = arg_259_1:GetWordFromCfg(412031062)
				local var_262_56 = arg_259_1:FormatText(var_262_55.content)

				arg_259_1.text_.text = var_262_56

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_57 = 35
				local var_262_58 = utf8.len(var_262_56)
				local var_262_59 = var_262_57 <= 0 and var_262_52 or var_262_52 * (var_262_58 / var_262_57)

				if var_262_59 > 0 and var_262_52 < var_262_59 then
					arg_259_1.talkMaxDuration = var_262_59
					var_262_51 = var_262_51 + 0.3

					if var_262_59 + var_262_51 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_59 + var_262_51
					end
				end

				arg_259_1.text_.text = var_262_56
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031062", "story_v_out_412031.awb") ~= 0 then
					local var_262_60 = manager.audio:GetVoiceLength("story_v_out_412031", "412031062", "story_v_out_412031.awb") / 1000

					if var_262_60 + var_262_51 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_60 + var_262_51
					end

					if var_262_55.prefab_name ~= "" and arg_259_1.actors_[var_262_55.prefab_name] ~= nil then
						local var_262_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_55.prefab_name].transform, "story_v_out_412031", "412031062", "story_v_out_412031.awb")

						arg_259_1:RecordAudio("412031062", var_262_61)
						arg_259_1:RecordAudio("412031062", var_262_61)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_412031", "412031062", "story_v_out_412031.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_412031", "412031062", "story_v_out_412031.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_62 = var_262_51 + 0.3
			local var_262_63 = math.max(var_262_52, arg_259_1.talkMaxDuration)

			if var_262_62 <= arg_259_1.time_ and arg_259_1.time_ < var_262_62 + var_262_63 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_62) / var_262_63

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_62 + var_262_63 and arg_259_1.time_ < var_262_62 + var_262_63 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play412031063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 412031063
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play412031064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10083ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos10083ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(0, 100, 0)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10083ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, 100, 0)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["10083ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect10083ui_story == nil then
				arg_265_1.var_.characterEffect10083ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect10083ui_story then
					local var_268_13 = Mathf.Lerp(0, 0.5, var_268_12)

					arg_265_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_265_1.var_.characterEffect10083ui_story.fillRatio = var_268_13
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and arg_265_1.var_.characterEffect10083ui_story then
				local var_268_14 = 0.5

				arg_265_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_265_1.var_.characterEffect10083ui_story.fillRatio = var_268_14
			end

			local var_268_15 = 0
			local var_268_16 = 1.475

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_17 = arg_265_1:GetWordFromCfg(412031063)
				local var_268_18 = arg_265_1:FormatText(var_268_17.content)

				arg_265_1.text_.text = var_268_18

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_19 = 59
				local var_268_20 = utf8.len(var_268_18)
				local var_268_21 = var_268_19 <= 0 and var_268_16 or var_268_16 * (var_268_20 / var_268_19)

				if var_268_21 > 0 and var_268_16 < var_268_21 then
					arg_265_1.talkMaxDuration = var_268_21

					if var_268_21 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_21 + var_268_15
					end
				end

				arg_265_1.text_.text = var_268_18
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_22 = math.max(var_268_16, arg_265_1.talkMaxDuration)

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_22 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_15) / var_268_22

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_15 + var_268_22 and arg_265_1.time_ < var_268_15 + var_268_22 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play412031064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 412031064
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play412031065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 1.4

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_2 = arg_269_1:GetWordFromCfg(412031064)
				local var_272_3 = arg_269_1:FormatText(var_272_2.content)

				arg_269_1.text_.text = var_272_3

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_4 = 56
				local var_272_5 = utf8.len(var_272_3)
				local var_272_6 = var_272_4 <= 0 and var_272_1 or var_272_1 * (var_272_5 / var_272_4)

				if var_272_6 > 0 and var_272_1 < var_272_6 then
					arg_269_1.talkMaxDuration = var_272_6

					if var_272_6 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_6 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_3
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_7 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_7 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_7

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_7 and arg_269_1.time_ < var_272_0 + var_272_7 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play412031065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 412031065
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play412031066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.75

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

				local var_276_2 = arg_273_1:GetWordFromCfg(412031065)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 30
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
	Play412031066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 412031066
		arg_277_1.duration_ = 9.566

		local var_277_0 = {
			zh = 9.566,
			ja = 5.733
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play412031067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10083ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos10083ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, -2.6, -2.8)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10083ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["10083ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect10083ui_story == nil then
				arg_277_1.var_.characterEffect10083ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.200000002980232

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect10083ui_story then
					arg_277_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect10083ui_story then
				arg_277_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083actionlink/10083action445")
			end

			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_280_15 = 0
			local var_280_16 = 1.1

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_17 = arg_277_1:FormatText(StoryNameCfg[918].name)

				arg_277_1.leftNameTxt_.text = var_280_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_18 = arg_277_1:GetWordFromCfg(412031066)
				local var_280_19 = arg_277_1:FormatText(var_280_18.content)

				arg_277_1.text_.text = var_280_19

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_20 = 44
				local var_280_21 = utf8.len(var_280_19)
				local var_280_22 = var_280_20 <= 0 and var_280_16 or var_280_16 * (var_280_21 / var_280_20)

				if var_280_22 > 0 and var_280_16 < var_280_22 then
					arg_277_1.talkMaxDuration = var_280_22

					if var_280_22 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_22 + var_280_15
					end
				end

				arg_277_1.text_.text = var_280_19
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031066", "story_v_out_412031.awb") ~= 0 then
					local var_280_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031066", "story_v_out_412031.awb") / 1000

					if var_280_23 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_23 + var_280_15
					end

					if var_280_18.prefab_name ~= "" and arg_277_1.actors_[var_280_18.prefab_name] ~= nil then
						local var_280_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_18.prefab_name].transform, "story_v_out_412031", "412031066", "story_v_out_412031.awb")

						arg_277_1:RecordAudio("412031066", var_280_24)
						arg_277_1:RecordAudio("412031066", var_280_24)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_412031", "412031066", "story_v_out_412031.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_412031", "412031066", "story_v_out_412031.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_25 = math.max(var_280_16, arg_277_1.talkMaxDuration)

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_25 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_15) / var_280_25

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_15 + var_280_25 and arg_277_1.time_ < var_280_15 + var_280_25 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play412031067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 412031067
		arg_281_1.duration_ = 8.533

		local var_281_0 = {
			zh = 8.533,
			ja = 7.4
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
				arg_281_0:Play412031068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.875

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[918].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(412031067)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031067", "story_v_out_412031.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031067", "story_v_out_412031.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_412031", "412031067", "story_v_out_412031.awb")

						arg_281_1:RecordAudio("412031067", var_284_9)
						arg_281_1:RecordAudio("412031067", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_412031", "412031067", "story_v_out_412031.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_412031", "412031067", "story_v_out_412031.awb")
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
	Play412031068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 412031068
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play412031069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["10083ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos10083ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0, 100, 0)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos10083ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, 100, 0)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = arg_285_1.actors_["10083ui_story"]
			local var_288_10 = 0

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 and arg_285_1.var_.characterEffect10083ui_story == nil then
				arg_285_1.var_.characterEffect10083ui_story = var_288_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_11 = 0.034000001847744

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_11 then
				local var_288_12 = (arg_285_1.time_ - var_288_10) / var_288_11

				if arg_285_1.var_.characterEffect10083ui_story then
					local var_288_13 = Mathf.Lerp(0, 0.5, var_288_12)

					arg_285_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_285_1.var_.characterEffect10083ui_story.fillRatio = var_288_13
				end
			end

			if arg_285_1.time_ >= var_288_10 + var_288_11 and arg_285_1.time_ < var_288_10 + var_288_11 + arg_288_0 and arg_285_1.var_.characterEffect10083ui_story then
				local var_288_14 = 0.5

				arg_285_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_285_1.var_.characterEffect10083ui_story.fillRatio = var_288_14
			end

			local var_288_15 = 0
			local var_288_16 = 0.475

			if var_288_15 < arg_285_1.time_ and arg_285_1.time_ <= var_288_15 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0

				arg_285_1.dialog_:SetActive(true)

				local var_288_17 = LeanTween.value(arg_285_1.dialog_, 0, 1, 0.3)

				var_288_17:setOnUpdate(LuaHelper.FloatAction(function(arg_289_0)
					arg_285_1.dialogCg_.alpha = arg_289_0
				end))
				var_288_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_285_1.dialog_)
					var_288_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_285_1.duration_ = arg_285_1.duration_ + 0.3

				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_18 = arg_285_1:GetWordFromCfg(412031068)
				local var_288_19 = arg_285_1:FormatText(var_288_18.content)

				arg_285_1.text_.text = var_288_19

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_20 = 19
				local var_288_21 = utf8.len(var_288_19)
				local var_288_22 = var_288_20 <= 0 and var_288_16 or var_288_16 * (var_288_21 / var_288_20)

				if var_288_22 > 0 and var_288_16 < var_288_22 then
					arg_285_1.talkMaxDuration = var_288_22
					var_288_15 = var_288_15 + 0.3

					if var_288_22 + var_288_15 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_22 + var_288_15
					end
				end

				arg_285_1.text_.text = var_288_19
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_23 = var_288_15 + 0.3
			local var_288_24 = math.max(var_288_16, arg_285_1.talkMaxDuration)

			if var_288_23 <= arg_285_1.time_ and arg_285_1.time_ < var_288_23 + var_288_24 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_23) / var_288_24

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_23 + var_288_24 and arg_285_1.time_ < var_288_23 + var_288_24 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play412031069 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 412031069
		arg_291_1.duration_ = 10.832999999999

		local var_291_0 = {
			zh = 10.832999999999,
			ja = 9.99999999999899
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
				arg_291_0:Play412031070(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 4

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				local var_294_1 = manager.ui.mainCamera.transform.localPosition
				local var_294_2 = Vector3.New(0, 0, 10) + Vector3.New(var_294_1.x, var_294_1.y, 0)
				local var_294_3 = arg_291_1.bgs_.ST30

				var_294_3.transform.localPosition = var_294_2
				var_294_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_294_4 = var_294_3:GetComponent("SpriteRenderer")

				if var_294_4 and var_294_4.sprite then
					local var_294_5 = (var_294_3.transform.localPosition - var_294_1).z
					local var_294_6 = manager.ui.mainCameraCom_
					local var_294_7 = 2 * var_294_5 * Mathf.Tan(var_294_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_294_8 = var_294_7 * var_294_6.aspect
					local var_294_9 = var_294_4.sprite.bounds.size.x
					local var_294_10 = var_294_4.sprite.bounds.size.y
					local var_294_11 = var_294_8 / var_294_9
					local var_294_12 = var_294_7 / var_294_10
					local var_294_13 = var_294_12 < var_294_11 and var_294_11 or var_294_12

					var_294_3.transform.localScale = Vector3.New(var_294_13, var_294_13, 0)
				end

				for iter_294_0, iter_294_1 in pairs(arg_291_1.bgs_) do
					if iter_294_0 ~= "ST30" then
						iter_294_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_294_14 = 5.99999999999999

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1.allBtn_.enabled = false
			end

			local var_294_15 = 0.3

			if arg_291_1.time_ >= var_294_14 + var_294_15 and arg_291_1.time_ < var_294_14 + var_294_15 + arg_294_0 then
				arg_291_1.allBtn_.enabled = true
			end

			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.mask_.enabled = true
				arg_291_1.mask_.raycastTarget = true

				arg_291_1:SetGaussion(false)
			end

			local var_294_17 = 3

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Color.New(0, 0, 0)

				var_294_19.a = Mathf.Lerp(0, 1, var_294_18)
				arg_291_1.mask_.color = var_294_19
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				local var_294_20 = Color.New(0, 0, 0)

				var_294_20.a = 1
				arg_291_1.mask_.color = var_294_20
			end

			local var_294_21 = 3

			if var_294_21 < arg_291_1.time_ and arg_291_1.time_ <= var_294_21 + arg_294_0 then
				arg_291_1.mask_.enabled = true
				arg_291_1.mask_.raycastTarget = true

				arg_291_1:SetGaussion(false)
			end

			local var_294_22 = 3

			if var_294_21 <= arg_291_1.time_ and arg_291_1.time_ < var_294_21 + var_294_22 then
				local var_294_23 = (arg_291_1.time_ - var_294_21) / var_294_22
				local var_294_24 = Color.New(0, 0, 0)

				var_294_24.a = Mathf.Lerp(1, 0, var_294_23)
				arg_291_1.mask_.color = var_294_24
			end

			if arg_291_1.time_ >= var_294_21 + var_294_22 and arg_291_1.time_ < var_294_21 + var_294_22 + arg_294_0 then
				local var_294_25 = Color.New(0, 0, 0)
				local var_294_26 = 0

				arg_291_1.mask_.enabled = false
				var_294_25.a = var_294_26
				arg_291_1.mask_.color = var_294_25
			end

			local var_294_27 = arg_291_1.actors_["10076ui_story"].transform
			local var_294_28 = 5.8

			if var_294_28 < arg_291_1.time_ and arg_291_1.time_ <= var_294_28 + arg_294_0 then
				arg_291_1.var_.moveOldPos10076ui_story = var_294_27.localPosition
			end

			local var_294_29 = 0.001

			if var_294_28 <= arg_291_1.time_ and arg_291_1.time_ < var_294_28 + var_294_29 then
				local var_294_30 = (arg_291_1.time_ - var_294_28) / var_294_29
				local var_294_31 = Vector3.New(-1, -0.35, -4)

				var_294_27.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10076ui_story, var_294_31, var_294_30)

				local var_294_32 = manager.ui.mainCamera.transform.position - var_294_27.position

				var_294_27.forward = Vector3.New(var_294_32.x, var_294_32.y, var_294_32.z)

				local var_294_33 = var_294_27.localEulerAngles

				var_294_33.z = 0
				var_294_33.x = 0
				var_294_27.localEulerAngles = var_294_33
			end

			if arg_291_1.time_ >= var_294_28 + var_294_29 and arg_291_1.time_ < var_294_28 + var_294_29 + arg_294_0 then
				var_294_27.localPosition = Vector3.New(-1, -0.35, -4)

				local var_294_34 = manager.ui.mainCamera.transform.position - var_294_27.position

				var_294_27.forward = Vector3.New(var_294_34.x, var_294_34.y, var_294_34.z)

				local var_294_35 = var_294_27.localEulerAngles

				var_294_35.z = 0
				var_294_35.x = 0
				var_294_27.localEulerAngles = var_294_35
			end

			local var_294_36 = arg_291_1.actors_["10076ui_story"]
			local var_294_37 = 5.8

			if var_294_37 < arg_291_1.time_ and arg_291_1.time_ <= var_294_37 + arg_294_0 and arg_291_1.var_.characterEffect10076ui_story == nil then
				arg_291_1.var_.characterEffect10076ui_story = var_294_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_38 = 0.200000002980232

			if var_294_37 <= arg_291_1.time_ and arg_291_1.time_ < var_294_37 + var_294_38 then
				local var_294_39 = (arg_291_1.time_ - var_294_37) / var_294_38

				if arg_291_1.var_.characterEffect10076ui_story then
					arg_291_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_37 + var_294_38 and arg_291_1.time_ < var_294_37 + var_294_38 + arg_294_0 and arg_291_1.var_.characterEffect10076ui_story then
				arg_291_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_294_40 = 5.8

			if var_294_40 < arg_291_1.time_ and arg_291_1.time_ <= var_294_40 + arg_294_0 then
				arg_291_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action1_1")
			end

			local var_294_41 = 5.8

			if var_294_41 < arg_291_1.time_ and arg_291_1.time_ <= var_294_41 + arg_294_0 then
				arg_291_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_291_1.frameCnt_ <= 1 then
				arg_291_1.dialog_:SetActive(false)
			end

			local var_294_42 = 5.99999999999899
			local var_294_43 = 0.5

			if var_294_42 < arg_291_1.time_ and arg_291_1.time_ <= var_294_42 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0

				arg_291_1.dialog_:SetActive(true)

				local var_294_44 = LeanTween.value(arg_291_1.dialog_, 0, 1, 0.3)

				var_294_44:setOnUpdate(LuaHelper.FloatAction(function(arg_295_0)
					arg_291_1.dialogCg_.alpha = arg_295_0
				end))
				var_294_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_291_1.dialog_)
					var_294_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_291_1.duration_ = arg_291_1.duration_ + 0.3

				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_45 = arg_291_1:FormatText(StoryNameCfg[917].name)

				arg_291_1.leftNameTxt_.text = var_294_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_46 = arg_291_1:GetWordFromCfg(412031069)
				local var_294_47 = arg_291_1:FormatText(var_294_46.content)

				arg_291_1.text_.text = var_294_47

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_48 = 20
				local var_294_49 = utf8.len(var_294_47)
				local var_294_50 = var_294_48 <= 0 and var_294_43 or var_294_43 * (var_294_49 / var_294_48)

				if var_294_50 > 0 and var_294_43 < var_294_50 then
					arg_291_1.talkMaxDuration = var_294_50
					var_294_42 = var_294_42 + 0.3

					if var_294_50 + var_294_42 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_50 + var_294_42
					end
				end

				arg_291_1.text_.text = var_294_47
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031069", "story_v_out_412031.awb") ~= 0 then
					local var_294_51 = manager.audio:GetVoiceLength("story_v_out_412031", "412031069", "story_v_out_412031.awb") / 1000

					if var_294_51 + var_294_42 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_51 + var_294_42
					end

					if var_294_46.prefab_name ~= "" and arg_291_1.actors_[var_294_46.prefab_name] ~= nil then
						local var_294_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_46.prefab_name].transform, "story_v_out_412031", "412031069", "story_v_out_412031.awb")

						arg_291_1:RecordAudio("412031069", var_294_52)
						arg_291_1:RecordAudio("412031069", var_294_52)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_412031", "412031069", "story_v_out_412031.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_412031", "412031069", "story_v_out_412031.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_53 = var_294_42 + 0.3
			local var_294_54 = math.max(var_294_43, arg_291_1.talkMaxDuration)

			if var_294_53 <= arg_291_1.time_ and arg_291_1.time_ < var_294_53 + var_294_54 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_53) / var_294_54

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_53 + var_294_54 and arg_291_1.time_ < var_294_53 + var_294_54 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play412031070 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 412031070
		arg_297_1.duration_ = 3.2

		local var_297_0 = {
			zh = 2.6,
			ja = 3.2
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
				arg_297_0:Play412031071(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1097ui_story"].transform
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1.var_.moveOldPos1097ui_story = var_300_0.localPosition
			end

			local var_300_2 = 0.001

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2
				local var_300_4 = Vector3.New(0.7, -0.54, -6.3)

				var_300_0.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1097ui_story, var_300_4, var_300_3)

				local var_300_5 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_5.x, var_300_5.y, var_300_5.z)

				local var_300_6 = var_300_0.localEulerAngles

				var_300_6.z = 0
				var_300_6.x = 0
				var_300_0.localEulerAngles = var_300_6
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 then
				var_300_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_300_7 = manager.ui.mainCamera.transform.position - var_300_0.position

				var_300_0.forward = Vector3.New(var_300_7.x, var_300_7.y, var_300_7.z)

				local var_300_8 = var_300_0.localEulerAngles

				var_300_8.z = 0
				var_300_8.x = 0
				var_300_0.localEulerAngles = var_300_8
			end

			local var_300_9 = arg_297_1.actors_["1097ui_story"]
			local var_300_10 = 0

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 and arg_297_1.var_.characterEffect1097ui_story == nil then
				arg_297_1.var_.characterEffect1097ui_story = var_300_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_11 = 0.200000002980232

			if var_300_10 <= arg_297_1.time_ and arg_297_1.time_ < var_300_10 + var_300_11 then
				local var_300_12 = (arg_297_1.time_ - var_300_10) / var_300_11

				if arg_297_1.var_.characterEffect1097ui_story then
					arg_297_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_10 + var_300_11 and arg_297_1.time_ < var_300_10 + var_300_11 + arg_300_0 and arg_297_1.var_.characterEffect1097ui_story then
				arg_297_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_300_13 = 0

			if var_300_13 < arg_297_1.time_ and arg_297_1.time_ <= var_300_13 + arg_300_0 then
				arg_297_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_300_14 = 0

			if var_300_14 < arg_297_1.time_ and arg_297_1.time_ <= var_300_14 + arg_300_0 then
				arg_297_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_300_15 = arg_297_1.actors_["10076ui_story"]
			local var_300_16 = 0

			if var_300_16 < arg_297_1.time_ and arg_297_1.time_ <= var_300_16 + arg_300_0 and arg_297_1.var_.characterEffect10076ui_story == nil then
				arg_297_1.var_.characterEffect10076ui_story = var_300_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_17 = 0.200000002980232

			if var_300_16 <= arg_297_1.time_ and arg_297_1.time_ < var_300_16 + var_300_17 then
				local var_300_18 = (arg_297_1.time_ - var_300_16) / var_300_17

				if arg_297_1.var_.characterEffect10076ui_story then
					local var_300_19 = Mathf.Lerp(0, 0.5, var_300_18)

					arg_297_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_297_1.var_.characterEffect10076ui_story.fillRatio = var_300_19
				end
			end

			if arg_297_1.time_ >= var_300_16 + var_300_17 and arg_297_1.time_ < var_300_16 + var_300_17 + arg_300_0 and arg_297_1.var_.characterEffect10076ui_story then
				local var_300_20 = 0.5

				arg_297_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_297_1.var_.characterEffect10076ui_story.fillRatio = var_300_20
			end

			local var_300_21 = 0
			local var_300_22 = 0.15

			if var_300_21 < arg_297_1.time_ and arg_297_1.time_ <= var_300_21 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_23 = arg_297_1:FormatText(StoryNameCfg[216].name)

				arg_297_1.leftNameTxt_.text = var_300_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_24 = arg_297_1:GetWordFromCfg(412031070)
				local var_300_25 = arg_297_1:FormatText(var_300_24.content)

				arg_297_1.text_.text = var_300_25

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_26 = 6
				local var_300_27 = utf8.len(var_300_25)
				local var_300_28 = var_300_26 <= 0 and var_300_22 or var_300_22 * (var_300_27 / var_300_26)

				if var_300_28 > 0 and var_300_22 < var_300_28 then
					arg_297_1.talkMaxDuration = var_300_28

					if var_300_28 + var_300_21 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_28 + var_300_21
					end
				end

				arg_297_1.text_.text = var_300_25
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031070", "story_v_out_412031.awb") ~= 0 then
					local var_300_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031070", "story_v_out_412031.awb") / 1000

					if var_300_29 + var_300_21 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_29 + var_300_21
					end

					if var_300_24.prefab_name ~= "" and arg_297_1.actors_[var_300_24.prefab_name] ~= nil then
						local var_300_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_24.prefab_name].transform, "story_v_out_412031", "412031070", "story_v_out_412031.awb")

						arg_297_1:RecordAudio("412031070", var_300_30)
						arg_297_1:RecordAudio("412031070", var_300_30)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_412031", "412031070", "story_v_out_412031.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_412031", "412031070", "story_v_out_412031.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_31 = math.max(var_300_22, arg_297_1.talkMaxDuration)

			if var_300_21 <= arg_297_1.time_ and arg_297_1.time_ < var_300_21 + var_300_31 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_21) / var_300_31

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_21 + var_300_31 and arg_297_1.time_ < var_300_21 + var_300_31 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play412031071 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 412031071
		arg_301_1.duration_ = 10.666

		local var_301_0 = {
			zh = 9.566,
			ja = 10.666
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play412031072(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["10076ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos10076ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(-1, -0.35, -4)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos10076ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(-1, -0.35, -4)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["10076ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect10076ui_story == nil then
				arg_301_1.var_.characterEffect10076ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect10076ui_story then
					arg_301_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect10076ui_story then
				arg_301_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action3_1")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_304_15 = arg_301_1.actors_["1097ui_story"]
			local var_304_16 = 0

			if var_304_16 < arg_301_1.time_ and arg_301_1.time_ <= var_304_16 + arg_304_0 and arg_301_1.var_.characterEffect1097ui_story == nil then
				arg_301_1.var_.characterEffect1097ui_story = var_304_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_17 = 0.200000002980232

			if var_304_16 <= arg_301_1.time_ and arg_301_1.time_ < var_304_16 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_16) / var_304_17

				if arg_301_1.var_.characterEffect1097ui_story then
					local var_304_19 = Mathf.Lerp(0, 0.5, var_304_18)

					arg_301_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1097ui_story.fillRatio = var_304_19
				end
			end

			if arg_301_1.time_ >= var_304_16 + var_304_17 and arg_301_1.time_ < var_304_16 + var_304_17 + arg_304_0 and arg_301_1.var_.characterEffect1097ui_story then
				local var_304_20 = 0.5

				arg_301_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1097ui_story.fillRatio = var_304_20
			end

			local var_304_21 = 0
			local var_304_22 = 1.2

			if var_304_21 < arg_301_1.time_ and arg_301_1.time_ <= var_304_21 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_23 = arg_301_1:FormatText(StoryNameCfg[917].name)

				arg_301_1.leftNameTxt_.text = var_304_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_24 = arg_301_1:GetWordFromCfg(412031071)
				local var_304_25 = arg_301_1:FormatText(var_304_24.content)

				arg_301_1.text_.text = var_304_25

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_26 = 48
				local var_304_27 = utf8.len(var_304_25)
				local var_304_28 = var_304_26 <= 0 and var_304_22 or var_304_22 * (var_304_27 / var_304_26)

				if var_304_28 > 0 and var_304_22 < var_304_28 then
					arg_301_1.talkMaxDuration = var_304_28

					if var_304_28 + var_304_21 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_28 + var_304_21
					end
				end

				arg_301_1.text_.text = var_304_25
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031071", "story_v_out_412031.awb") ~= 0 then
					local var_304_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031071", "story_v_out_412031.awb") / 1000

					if var_304_29 + var_304_21 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_29 + var_304_21
					end

					if var_304_24.prefab_name ~= "" and arg_301_1.actors_[var_304_24.prefab_name] ~= nil then
						local var_304_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_24.prefab_name].transform, "story_v_out_412031", "412031071", "story_v_out_412031.awb")

						arg_301_1:RecordAudio("412031071", var_304_30)
						arg_301_1:RecordAudio("412031071", var_304_30)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_412031", "412031071", "story_v_out_412031.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_412031", "412031071", "story_v_out_412031.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_31 = math.max(var_304_22, arg_301_1.talkMaxDuration)

			if var_304_21 <= arg_301_1.time_ and arg_301_1.time_ < var_304_21 + var_304_31 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_21) / var_304_31

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_21 + var_304_31 and arg_301_1.time_ < var_304_21 + var_304_31 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play412031072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 412031072
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play412031073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["10076ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect10076ui_story == nil then
				arg_305_1.var_.characterEffect10076ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.200000002980232

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect10076ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_305_1.var_.characterEffect10076ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect10076ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_305_1.var_.characterEffect10076ui_story.fillRatio = var_308_5
			end

			local var_308_6 = 0
			local var_308_7 = 1.3

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_8 = arg_305_1:GetWordFromCfg(412031072)
				local var_308_9 = arg_305_1:FormatText(var_308_8.content)

				arg_305_1.text_.text = var_308_9

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_10 = 52
				local var_308_11 = utf8.len(var_308_9)
				local var_308_12 = var_308_10 <= 0 and var_308_7 or var_308_7 * (var_308_11 / var_308_10)

				if var_308_12 > 0 and var_308_7 < var_308_12 then
					arg_305_1.talkMaxDuration = var_308_12

					if var_308_12 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_12 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_9
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_13 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_13 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_13

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_13 and arg_305_1.time_ < var_308_6 + var_308_13 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play412031073 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 412031073
		arg_309_1.duration_ = 9.433

		local var_309_0 = {
			zh = 9.433,
			ja = 7.933
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
				arg_309_0:Play412031074(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1097ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1097ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0.7, -0.54, -6.3)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1097ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1097ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1097ui_story == nil then
				arg_309_1.var_.characterEffect1097ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1097ui_story then
					arg_309_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1097ui_story then
				arg_309_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_312_15 = 0
			local var_312_16 = 0.775

			if var_312_15 < arg_309_1.time_ and arg_309_1.time_ <= var_312_15 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_17 = arg_309_1:FormatText(StoryNameCfg[216].name)

				arg_309_1.leftNameTxt_.text = var_312_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_18 = arg_309_1:GetWordFromCfg(412031073)
				local var_312_19 = arg_309_1:FormatText(var_312_18.content)

				arg_309_1.text_.text = var_312_19

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_20 = 31
				local var_312_21 = utf8.len(var_312_19)
				local var_312_22 = var_312_20 <= 0 and var_312_16 or var_312_16 * (var_312_21 / var_312_20)

				if var_312_22 > 0 and var_312_16 < var_312_22 then
					arg_309_1.talkMaxDuration = var_312_22

					if var_312_22 + var_312_15 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_22 + var_312_15
					end
				end

				arg_309_1.text_.text = var_312_19
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031073", "story_v_out_412031.awb") ~= 0 then
					local var_312_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031073", "story_v_out_412031.awb") / 1000

					if var_312_23 + var_312_15 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_23 + var_312_15
					end

					if var_312_18.prefab_name ~= "" and arg_309_1.actors_[var_312_18.prefab_name] ~= nil then
						local var_312_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_18.prefab_name].transform, "story_v_out_412031", "412031073", "story_v_out_412031.awb")

						arg_309_1:RecordAudio("412031073", var_312_24)
						arg_309_1:RecordAudio("412031073", var_312_24)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_412031", "412031073", "story_v_out_412031.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_412031", "412031073", "story_v_out_412031.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_25 = math.max(var_312_16, arg_309_1.talkMaxDuration)

			if var_312_15 <= arg_309_1.time_ and arg_309_1.time_ < var_312_15 + var_312_25 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_15) / var_312_25

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_15 + var_312_25 and arg_309_1.time_ < var_312_15 + var_312_25 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play412031074 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 412031074
		arg_313_1.duration_ = 14.4

		local var_313_0 = {
			zh = 10.566,
			ja = 14.4
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
				arg_313_0:Play412031075(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.975

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[216].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(412031074)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 39
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031074", "story_v_out_412031.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031074", "story_v_out_412031.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_412031", "412031074", "story_v_out_412031.awb")

						arg_313_1:RecordAudio("412031074", var_316_9)
						arg_313_1:RecordAudio("412031074", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_412031", "412031074", "story_v_out_412031.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_412031", "412031074", "story_v_out_412031.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play412031075 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 412031075
		arg_317_1.duration_ = 5.966

		local var_317_0 = {
			zh = 5.966,
			ja = 3.5
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
				arg_317_0:Play412031076(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10076ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect10076ui_story == nil then
				arg_317_1.var_.characterEffect10076ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.200000002980232

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect10076ui_story then
					arg_317_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect10076ui_story then
				arg_317_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_320_4 = 0

			if var_320_4 < arg_317_1.time_ and arg_317_1.time_ <= var_320_4 + arg_320_0 then
				arg_317_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action3_2")
			end

			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 then
				arg_317_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_320_6 = arg_317_1.actors_["1097ui_story"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 and arg_317_1.var_.characterEffect1097ui_story == nil then
				arg_317_1.var_.characterEffect1097ui_story = var_320_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_8 = 0.200000002980232

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_8 then
				local var_320_9 = (arg_317_1.time_ - var_320_7) / var_320_8

				if arg_317_1.var_.characterEffect1097ui_story then
					local var_320_10 = Mathf.Lerp(0, 0.5, var_320_9)

					arg_317_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1097ui_story.fillRatio = var_320_10
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_8 and arg_317_1.time_ < var_320_7 + var_320_8 + arg_320_0 and arg_317_1.var_.characterEffect1097ui_story then
				local var_320_11 = 0.5

				arg_317_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1097ui_story.fillRatio = var_320_11
			end

			local var_320_12 = 0
			local var_320_13 = 0.675

			if var_320_12 < arg_317_1.time_ and arg_317_1.time_ <= var_320_12 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_14 = arg_317_1:FormatText(StoryNameCfg[917].name)

				arg_317_1.leftNameTxt_.text = var_320_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_15 = arg_317_1:GetWordFromCfg(412031075)
				local var_320_16 = arg_317_1:FormatText(var_320_15.content)

				arg_317_1.text_.text = var_320_16

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_17 = 27
				local var_320_18 = utf8.len(var_320_16)
				local var_320_19 = var_320_17 <= 0 and var_320_13 or var_320_13 * (var_320_18 / var_320_17)

				if var_320_19 > 0 and var_320_13 < var_320_19 then
					arg_317_1.talkMaxDuration = var_320_19

					if var_320_19 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_19 + var_320_12
					end
				end

				arg_317_1.text_.text = var_320_16
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031075", "story_v_out_412031.awb") ~= 0 then
					local var_320_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031075", "story_v_out_412031.awb") / 1000

					if var_320_20 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_20 + var_320_12
					end

					if var_320_15.prefab_name ~= "" and arg_317_1.actors_[var_320_15.prefab_name] ~= nil then
						local var_320_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_15.prefab_name].transform, "story_v_out_412031", "412031075", "story_v_out_412031.awb")

						arg_317_1:RecordAudio("412031075", var_320_21)
						arg_317_1:RecordAudio("412031075", var_320_21)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_412031", "412031075", "story_v_out_412031.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_412031", "412031075", "story_v_out_412031.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_22 = math.max(var_320_13, arg_317_1.talkMaxDuration)

			if var_320_12 <= arg_317_1.time_ and arg_317_1.time_ < var_320_12 + var_320_22 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_12) / var_320_22

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_12 + var_320_22 and arg_317_1.time_ < var_320_12 + var_320_22 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play412031076 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 412031076
		arg_321_1.duration_ = 13.1

		local var_321_0 = {
			zh = 13.1,
			ja = 12
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play412031077(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10083ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos10083ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(0, -2.6, -2.8)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10083ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["10083ui_story"]
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 and arg_321_1.var_.characterEffect10083ui_story == nil then
				arg_321_1.var_.characterEffect10083ui_story = var_324_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_11 = 0.200000002980232

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11

				if arg_321_1.var_.characterEffect10083ui_story then
					arg_321_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 and arg_321_1.var_.characterEffect10083ui_story then
				arg_321_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_324_13 = 0

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action2_1")
			end

			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_324_15 = arg_321_1.actors_["1097ui_story"].transform
			local var_324_16 = 0

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.var_.moveOldPos1097ui_story = var_324_15.localPosition
			end

			local var_324_17 = 0.001

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_17 then
				local var_324_18 = (arg_321_1.time_ - var_324_16) / var_324_17
				local var_324_19 = Vector3.New(0, 100, 0)

				var_324_15.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1097ui_story, var_324_19, var_324_18)

				local var_324_20 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_20.x, var_324_20.y, var_324_20.z)

				local var_324_21 = var_324_15.localEulerAngles

				var_324_21.z = 0
				var_324_21.x = 0
				var_324_15.localEulerAngles = var_324_21
			end

			if arg_321_1.time_ >= var_324_16 + var_324_17 and arg_321_1.time_ < var_324_16 + var_324_17 + arg_324_0 then
				var_324_15.localPosition = Vector3.New(0, 100, 0)

				local var_324_22 = manager.ui.mainCamera.transform.position - var_324_15.position

				var_324_15.forward = Vector3.New(var_324_22.x, var_324_22.y, var_324_22.z)

				local var_324_23 = var_324_15.localEulerAngles

				var_324_23.z = 0
				var_324_23.x = 0
				var_324_15.localEulerAngles = var_324_23
			end

			local var_324_24 = arg_321_1.actors_["1097ui_story"]
			local var_324_25 = 0

			if var_324_25 < arg_321_1.time_ and arg_321_1.time_ <= var_324_25 + arg_324_0 and arg_321_1.var_.characterEffect1097ui_story == nil then
				arg_321_1.var_.characterEffect1097ui_story = var_324_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_26 = 0.200000002980232

			if var_324_25 <= arg_321_1.time_ and arg_321_1.time_ < var_324_25 + var_324_26 then
				local var_324_27 = (arg_321_1.time_ - var_324_25) / var_324_26

				if arg_321_1.var_.characterEffect1097ui_story then
					local var_324_28 = Mathf.Lerp(0, 0.5, var_324_27)

					arg_321_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1097ui_story.fillRatio = var_324_28
				end
			end

			if arg_321_1.time_ >= var_324_25 + var_324_26 and arg_321_1.time_ < var_324_25 + var_324_26 + arg_324_0 and arg_321_1.var_.characterEffect1097ui_story then
				local var_324_29 = 0.5

				arg_321_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1097ui_story.fillRatio = var_324_29
			end

			local var_324_30 = arg_321_1.actors_["10076ui_story"].transform
			local var_324_31 = 0

			if var_324_31 < arg_321_1.time_ and arg_321_1.time_ <= var_324_31 + arg_324_0 then
				arg_321_1.var_.moveOldPos10076ui_story = var_324_30.localPosition
			end

			local var_324_32 = 0.001

			if var_324_31 <= arg_321_1.time_ and arg_321_1.time_ < var_324_31 + var_324_32 then
				local var_324_33 = (arg_321_1.time_ - var_324_31) / var_324_32
				local var_324_34 = Vector3.New(0, 100, 0)

				var_324_30.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10076ui_story, var_324_34, var_324_33)

				local var_324_35 = manager.ui.mainCamera.transform.position - var_324_30.position

				var_324_30.forward = Vector3.New(var_324_35.x, var_324_35.y, var_324_35.z)

				local var_324_36 = var_324_30.localEulerAngles

				var_324_36.z = 0
				var_324_36.x = 0
				var_324_30.localEulerAngles = var_324_36
			end

			if arg_321_1.time_ >= var_324_31 + var_324_32 and arg_321_1.time_ < var_324_31 + var_324_32 + arg_324_0 then
				var_324_30.localPosition = Vector3.New(0, 100, 0)

				local var_324_37 = manager.ui.mainCamera.transform.position - var_324_30.position

				var_324_30.forward = Vector3.New(var_324_37.x, var_324_37.y, var_324_37.z)

				local var_324_38 = var_324_30.localEulerAngles

				var_324_38.z = 0
				var_324_38.x = 0
				var_324_30.localEulerAngles = var_324_38
			end

			local var_324_39 = arg_321_1.actors_["10076ui_story"]
			local var_324_40 = 0

			if var_324_40 < arg_321_1.time_ and arg_321_1.time_ <= var_324_40 + arg_324_0 and arg_321_1.var_.characterEffect10076ui_story == nil then
				arg_321_1.var_.characterEffect10076ui_story = var_324_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_41 = 0.200000002980232

			if var_324_40 <= arg_321_1.time_ and arg_321_1.time_ < var_324_40 + var_324_41 then
				local var_324_42 = (arg_321_1.time_ - var_324_40) / var_324_41

				if arg_321_1.var_.characterEffect10076ui_story then
					local var_324_43 = Mathf.Lerp(0, 0.5, var_324_42)

					arg_321_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_321_1.var_.characterEffect10076ui_story.fillRatio = var_324_43
				end
			end

			if arg_321_1.time_ >= var_324_40 + var_324_41 and arg_321_1.time_ < var_324_40 + var_324_41 + arg_324_0 and arg_321_1.var_.characterEffect10076ui_story then
				local var_324_44 = 0.5

				arg_321_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_321_1.var_.characterEffect10076ui_story.fillRatio = var_324_44
			end

			local var_324_45 = 0
			local var_324_46 = 1.675

			if var_324_45 < arg_321_1.time_ and arg_321_1.time_ <= var_324_45 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_47 = arg_321_1:FormatText(StoryNameCfg[918].name)

				arg_321_1.leftNameTxt_.text = var_324_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_48 = arg_321_1:GetWordFromCfg(412031076)
				local var_324_49 = arg_321_1:FormatText(var_324_48.content)

				arg_321_1.text_.text = var_324_49

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_50 = 67
				local var_324_51 = utf8.len(var_324_49)
				local var_324_52 = var_324_50 <= 0 and var_324_46 or var_324_46 * (var_324_51 / var_324_50)

				if var_324_52 > 0 and var_324_46 < var_324_52 then
					arg_321_1.talkMaxDuration = var_324_52

					if var_324_52 + var_324_45 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_52 + var_324_45
					end
				end

				arg_321_1.text_.text = var_324_49
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031076", "story_v_out_412031.awb") ~= 0 then
					local var_324_53 = manager.audio:GetVoiceLength("story_v_out_412031", "412031076", "story_v_out_412031.awb") / 1000

					if var_324_53 + var_324_45 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_53 + var_324_45
					end

					if var_324_48.prefab_name ~= "" and arg_321_1.actors_[var_324_48.prefab_name] ~= nil then
						local var_324_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_48.prefab_name].transform, "story_v_out_412031", "412031076", "story_v_out_412031.awb")

						arg_321_1:RecordAudio("412031076", var_324_54)
						arg_321_1:RecordAudio("412031076", var_324_54)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_412031", "412031076", "story_v_out_412031.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_412031", "412031076", "story_v_out_412031.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_55 = math.max(var_324_46, arg_321_1.talkMaxDuration)

			if var_324_45 <= arg_321_1.time_ and arg_321_1.time_ < var_324_45 + var_324_55 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_45) / var_324_55

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_45 + var_324_55 and arg_321_1.time_ < var_324_45 + var_324_55 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play412031077 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 412031077
		arg_325_1.duration_ = 5.033

		local var_325_0 = {
			zh = 3.433,
			ja = 5.033
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play412031078(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10078ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos10078ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(0, -0.5, -6.3)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10078ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["10078ui_story"]
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 and arg_325_1.var_.characterEffect10078ui_story == nil then
				arg_325_1.var_.characterEffect10078ui_story = var_328_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_11 = 0.200000002980232

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11

				if arg_325_1.var_.characterEffect10078ui_story then
					arg_325_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 and arg_325_1.var_.characterEffect10078ui_story then
				arg_325_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_328_13 = 0

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action1_1")
			end

			local var_328_14 = 0

			if var_328_14 < arg_325_1.time_ and arg_325_1.time_ <= var_328_14 + arg_328_0 then
				arg_325_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_328_15 = arg_325_1.actors_["10083ui_story"].transform
			local var_328_16 = 0

			if var_328_16 < arg_325_1.time_ and arg_325_1.time_ <= var_328_16 + arg_328_0 then
				arg_325_1.var_.moveOldPos10083ui_story = var_328_15.localPosition
			end

			local var_328_17 = 0.001

			if var_328_16 <= arg_325_1.time_ and arg_325_1.time_ < var_328_16 + var_328_17 then
				local var_328_18 = (arg_325_1.time_ - var_328_16) / var_328_17
				local var_328_19 = Vector3.New(0, 100, 0)

				var_328_15.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10083ui_story, var_328_19, var_328_18)

				local var_328_20 = manager.ui.mainCamera.transform.position - var_328_15.position

				var_328_15.forward = Vector3.New(var_328_20.x, var_328_20.y, var_328_20.z)

				local var_328_21 = var_328_15.localEulerAngles

				var_328_21.z = 0
				var_328_21.x = 0
				var_328_15.localEulerAngles = var_328_21
			end

			if arg_325_1.time_ >= var_328_16 + var_328_17 and arg_325_1.time_ < var_328_16 + var_328_17 + arg_328_0 then
				var_328_15.localPosition = Vector3.New(0, 100, 0)

				local var_328_22 = manager.ui.mainCamera.transform.position - var_328_15.position

				var_328_15.forward = Vector3.New(var_328_22.x, var_328_22.y, var_328_22.z)

				local var_328_23 = var_328_15.localEulerAngles

				var_328_23.z = 0
				var_328_23.x = 0
				var_328_15.localEulerAngles = var_328_23
			end

			local var_328_24 = arg_325_1.actors_["10083ui_story"]
			local var_328_25 = 0

			if var_328_25 < arg_325_1.time_ and arg_325_1.time_ <= var_328_25 + arg_328_0 and arg_325_1.var_.characterEffect10083ui_story == nil then
				arg_325_1.var_.characterEffect10083ui_story = var_328_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_26 = 0.200000002980232

			if var_328_25 <= arg_325_1.time_ and arg_325_1.time_ < var_328_25 + var_328_26 then
				local var_328_27 = (arg_325_1.time_ - var_328_25) / var_328_26

				if arg_325_1.var_.characterEffect10083ui_story then
					local var_328_28 = Mathf.Lerp(0, 0.5, var_328_27)

					arg_325_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_325_1.var_.characterEffect10083ui_story.fillRatio = var_328_28
				end
			end

			if arg_325_1.time_ >= var_328_25 + var_328_26 and arg_325_1.time_ < var_328_25 + var_328_26 + arg_328_0 and arg_325_1.var_.characterEffect10083ui_story then
				local var_328_29 = 0.5

				arg_325_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_325_1.var_.characterEffect10083ui_story.fillRatio = var_328_29
			end

			local var_328_30 = 0
			local var_328_31 = 0.2

			if var_328_30 < arg_325_1.time_ and arg_325_1.time_ <= var_328_30 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_32 = arg_325_1:FormatText(StoryNameCfg[919].name)

				arg_325_1.leftNameTxt_.text = var_328_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_33 = arg_325_1:GetWordFromCfg(412031077)
				local var_328_34 = arg_325_1:FormatText(var_328_33.content)

				arg_325_1.text_.text = var_328_34

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_35 = 8
				local var_328_36 = utf8.len(var_328_34)
				local var_328_37 = var_328_35 <= 0 and var_328_31 or var_328_31 * (var_328_36 / var_328_35)

				if var_328_37 > 0 and var_328_31 < var_328_37 then
					arg_325_1.talkMaxDuration = var_328_37

					if var_328_37 + var_328_30 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_37 + var_328_30
					end
				end

				arg_325_1.text_.text = var_328_34
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031077", "story_v_out_412031.awb") ~= 0 then
					local var_328_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031077", "story_v_out_412031.awb") / 1000

					if var_328_38 + var_328_30 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_38 + var_328_30
					end

					if var_328_33.prefab_name ~= "" and arg_325_1.actors_[var_328_33.prefab_name] ~= nil then
						local var_328_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_33.prefab_name].transform, "story_v_out_412031", "412031077", "story_v_out_412031.awb")

						arg_325_1:RecordAudio("412031077", var_328_39)
						arg_325_1:RecordAudio("412031077", var_328_39)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_412031", "412031077", "story_v_out_412031.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_412031", "412031077", "story_v_out_412031.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_40 = math.max(var_328_31, arg_325_1.talkMaxDuration)

			if var_328_30 <= arg_325_1.time_ and arg_325_1.time_ < var_328_30 + var_328_40 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_30) / var_328_40

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_30 + var_328_40 and arg_325_1.time_ < var_328_30 + var_328_40 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play412031078 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 412031078
		arg_329_1.duration_ = 13.566

		local var_329_0 = {
			zh = 8.766,
			ja = 13.566
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
				arg_329_0:Play412031079(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1097ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1097ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, -0.54, -6.3)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1097ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1097ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect1097ui_story == nil then
				arg_329_1.var_.characterEffect1097ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.200000002980232

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1097ui_story then
					arg_329_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect1097ui_story then
				arg_329_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_332_13 = 0

			if var_332_13 < arg_329_1.time_ and arg_329_1.time_ <= var_332_13 + arg_332_0 then
				arg_329_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_332_14 = 0

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				arg_329_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_332_15 = arg_329_1.actors_["10078ui_story"].transform
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.var_.moveOldPos10078ui_story = var_332_15.localPosition
			end

			local var_332_17 = 0.001

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Vector3.New(0, 100, 0)

				var_332_15.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10078ui_story, var_332_19, var_332_18)

				local var_332_20 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_20.x, var_332_20.y, var_332_20.z)

				local var_332_21 = var_332_15.localEulerAngles

				var_332_21.z = 0
				var_332_21.x = 0
				var_332_15.localEulerAngles = var_332_21
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				var_332_15.localPosition = Vector3.New(0, 100, 0)

				local var_332_22 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_22.x, var_332_22.y, var_332_22.z)

				local var_332_23 = var_332_15.localEulerAngles

				var_332_23.z = 0
				var_332_23.x = 0
				var_332_15.localEulerAngles = var_332_23
			end

			local var_332_24 = arg_329_1.actors_["10078ui_story"]
			local var_332_25 = 0

			if var_332_25 < arg_329_1.time_ and arg_329_1.time_ <= var_332_25 + arg_332_0 and arg_329_1.var_.characterEffect10078ui_story == nil then
				arg_329_1.var_.characterEffect10078ui_story = var_332_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_26 = 0.200000002980232

			if var_332_25 <= arg_329_1.time_ and arg_329_1.time_ < var_332_25 + var_332_26 then
				local var_332_27 = (arg_329_1.time_ - var_332_25) / var_332_26

				if arg_329_1.var_.characterEffect10078ui_story then
					local var_332_28 = Mathf.Lerp(0, 0.5, var_332_27)

					arg_329_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10078ui_story.fillRatio = var_332_28
				end
			end

			if arg_329_1.time_ >= var_332_25 + var_332_26 and arg_329_1.time_ < var_332_25 + var_332_26 + arg_332_0 and arg_329_1.var_.characterEffect10078ui_story then
				local var_332_29 = 0.5

				arg_329_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10078ui_story.fillRatio = var_332_29
			end

			local var_332_30 = 0
			local var_332_31 = 0.85

			if var_332_30 < arg_329_1.time_ and arg_329_1.time_ <= var_332_30 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_32 = arg_329_1:FormatText(StoryNameCfg[216].name)

				arg_329_1.leftNameTxt_.text = var_332_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_33 = arg_329_1:GetWordFromCfg(412031078)
				local var_332_34 = arg_329_1:FormatText(var_332_33.content)

				arg_329_1.text_.text = var_332_34

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_35 = 34
				local var_332_36 = utf8.len(var_332_34)
				local var_332_37 = var_332_35 <= 0 and var_332_31 or var_332_31 * (var_332_36 / var_332_35)

				if var_332_37 > 0 and var_332_31 < var_332_37 then
					arg_329_1.talkMaxDuration = var_332_37

					if var_332_37 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_37 + var_332_30
					end
				end

				arg_329_1.text_.text = var_332_34
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031078", "story_v_out_412031.awb") ~= 0 then
					local var_332_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031078", "story_v_out_412031.awb") / 1000

					if var_332_38 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_38 + var_332_30
					end

					if var_332_33.prefab_name ~= "" and arg_329_1.actors_[var_332_33.prefab_name] ~= nil then
						local var_332_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_33.prefab_name].transform, "story_v_out_412031", "412031078", "story_v_out_412031.awb")

						arg_329_1:RecordAudio("412031078", var_332_39)
						arg_329_1:RecordAudio("412031078", var_332_39)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_412031", "412031078", "story_v_out_412031.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_412031", "412031078", "story_v_out_412031.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_40 = math.max(var_332_31, arg_329_1.talkMaxDuration)

			if var_332_30 <= arg_329_1.time_ and arg_329_1.time_ < var_332_30 + var_332_40 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_30) / var_332_40

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_30 + var_332_40 and arg_329_1.time_ < var_332_30 + var_332_40 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play412031079 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 412031079
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play412031080(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1097ui_story"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1097ui_story = var_336_0.localPosition
			end

			local var_336_2 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2
				local var_336_4 = Vector3.New(0, 100, 0)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1097ui_story, var_336_4, var_336_3)

				local var_336_5 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_5.x, var_336_5.y, var_336_5.z)

				local var_336_6 = var_336_0.localEulerAngles

				var_336_6.z = 0
				var_336_6.x = 0
				var_336_0.localEulerAngles = var_336_6
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(0, 100, 0)

				local var_336_7 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_7.x, var_336_7.y, var_336_7.z)

				local var_336_8 = var_336_0.localEulerAngles

				var_336_8.z = 0
				var_336_8.x = 0
				var_336_0.localEulerAngles = var_336_8
			end

			local var_336_9 = arg_333_1.actors_["1097ui_story"]
			local var_336_10 = 0

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 and arg_333_1.var_.characterEffect1097ui_story == nil then
				arg_333_1.var_.characterEffect1097ui_story = var_336_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_11 = 0.200000002980232

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_11 then
				local var_336_12 = (arg_333_1.time_ - var_336_10) / var_336_11

				if arg_333_1.var_.characterEffect1097ui_story then
					local var_336_13 = Mathf.Lerp(0, 0.5, var_336_12)

					arg_333_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1097ui_story.fillRatio = var_336_13
				end
			end

			if arg_333_1.time_ >= var_336_10 + var_336_11 and arg_333_1.time_ < var_336_10 + var_336_11 + arg_336_0 and arg_333_1.var_.characterEffect1097ui_story then
				local var_336_14 = 0.5

				arg_333_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1097ui_story.fillRatio = var_336_14
			end

			local var_336_15 = 0
			local var_336_16 = 1.075

			if var_336_15 < arg_333_1.time_ and arg_333_1.time_ <= var_336_15 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_17 = arg_333_1:GetWordFromCfg(412031079)
				local var_336_18 = arg_333_1:FormatText(var_336_17.content)

				arg_333_1.text_.text = var_336_18

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_19 = 43
				local var_336_20 = utf8.len(var_336_18)
				local var_336_21 = var_336_19 <= 0 and var_336_16 or var_336_16 * (var_336_20 / var_336_19)

				if var_336_21 > 0 and var_336_16 < var_336_21 then
					arg_333_1.talkMaxDuration = var_336_21

					if var_336_21 + var_336_15 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_21 + var_336_15
					end
				end

				arg_333_1.text_.text = var_336_18
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_22 = math.max(var_336_16, arg_333_1.talkMaxDuration)

			if var_336_15 <= arg_333_1.time_ and arg_333_1.time_ < var_336_15 + var_336_22 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_15) / var_336_22

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_15 + var_336_22 and arg_333_1.time_ < var_336_15 + var_336_22 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play412031080 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 412031080
		arg_337_1.duration_ = 2

		local var_337_0 = {
			zh = 2,
			ja = 1.999999999999
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play412031081(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1097ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1097ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0, -0.54, -6.3)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1097ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["1097ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and arg_337_1.var_.characterEffect1097ui_story == nil then
				arg_337_1.var_.characterEffect1097ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.200000002980232

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect1097ui_story then
					arg_337_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and arg_337_1.var_.characterEffect1097ui_story then
				arg_337_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_340_13 = 0

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 then
				arg_337_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_340_15 = 0
			local var_340_16 = 0.15

			if var_340_15 < arg_337_1.time_ and arg_337_1.time_ <= var_340_15 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_17 = arg_337_1:FormatText(StoryNameCfg[216].name)

				arg_337_1.leftNameTxt_.text = var_340_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_18 = arg_337_1:GetWordFromCfg(412031080)
				local var_340_19 = arg_337_1:FormatText(var_340_18.content)

				arg_337_1.text_.text = var_340_19

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_20 = 6
				local var_340_21 = utf8.len(var_340_19)
				local var_340_22 = var_340_20 <= 0 and var_340_16 or var_340_16 * (var_340_21 / var_340_20)

				if var_340_22 > 0 and var_340_16 < var_340_22 then
					arg_337_1.talkMaxDuration = var_340_22

					if var_340_22 + var_340_15 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_22 + var_340_15
					end
				end

				arg_337_1.text_.text = var_340_19
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031080", "story_v_out_412031.awb") ~= 0 then
					local var_340_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031080", "story_v_out_412031.awb") / 1000

					if var_340_23 + var_340_15 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_23 + var_340_15
					end

					if var_340_18.prefab_name ~= "" and arg_337_1.actors_[var_340_18.prefab_name] ~= nil then
						local var_340_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_18.prefab_name].transform, "story_v_out_412031", "412031080", "story_v_out_412031.awb")

						arg_337_1:RecordAudio("412031080", var_340_24)
						arg_337_1:RecordAudio("412031080", var_340_24)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_412031", "412031080", "story_v_out_412031.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_412031", "412031080", "story_v_out_412031.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_25 = math.max(var_340_16, arg_337_1.talkMaxDuration)

			if var_340_15 <= arg_337_1.time_ and arg_337_1.time_ < var_340_15 + var_340_25 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_15) / var_340_25

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_15 + var_340_25 and arg_337_1.time_ < var_340_15 + var_340_25 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play412031081 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 412031081
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play412031082(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1097ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1097ui_story == nil then
				arg_341_1.var_.characterEffect1097ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1097ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1097ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1097ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1097ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 1.125

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_8 = arg_341_1:GetWordFromCfg(412031081)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 45
				local var_344_11 = utf8.len(var_344_9)
				local var_344_12 = var_344_10 <= 0 and var_344_7 or var_344_7 * (var_344_11 / var_344_10)

				if var_344_12 > 0 and var_344_7 < var_344_12 then
					arg_341_1.talkMaxDuration = var_344_12

					if var_344_12 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_9
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_13 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_13 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_13

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_13 and arg_341_1.time_ < var_344_6 + var_344_13 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play412031082 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 412031082
		arg_345_1.duration_ = 3.866

		local var_345_0 = {
			zh = 3.866,
			ja = 3.1
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
				arg_345_0:Play412031083(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10076ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos10076ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(-1, -0.35, -4)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10076ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(-1, -0.35, -4)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["10076ui_story"]
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 and arg_345_1.var_.characterEffect10076ui_story == nil then
				arg_345_1.var_.characterEffect10076ui_story = var_348_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_11 = 0.200000002980232

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11

				if arg_345_1.var_.characterEffect10076ui_story then
					arg_345_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 and arg_345_1.var_.characterEffect10076ui_story then
				arg_345_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_348_13 = 0

			if var_348_13 < arg_345_1.time_ and arg_345_1.time_ <= var_348_13 + arg_348_0 then
				arg_345_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action1_1")
			end

			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 then
				arg_345_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_348_15 = arg_345_1.actors_["1097ui_story"].transform
			local var_348_16 = 0

			if var_348_16 < arg_345_1.time_ and arg_345_1.time_ <= var_348_16 + arg_348_0 then
				arg_345_1.var_.moveOldPos1097ui_story = var_348_15.localPosition
			end

			local var_348_17 = 0.001

			if var_348_16 <= arg_345_1.time_ and arg_345_1.time_ < var_348_16 + var_348_17 then
				local var_348_18 = (arg_345_1.time_ - var_348_16) / var_348_17
				local var_348_19 = Vector3.New(0.7, -0.54, -6.3)

				var_348_15.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1097ui_story, var_348_19, var_348_18)

				local var_348_20 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_20.x, var_348_20.y, var_348_20.z)

				local var_348_21 = var_348_15.localEulerAngles

				var_348_21.z = 0
				var_348_21.x = 0
				var_348_15.localEulerAngles = var_348_21
			end

			if arg_345_1.time_ >= var_348_16 + var_348_17 and arg_345_1.time_ < var_348_16 + var_348_17 + arg_348_0 then
				var_348_15.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_348_22 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_22.x, var_348_22.y, var_348_22.z)

				local var_348_23 = var_348_15.localEulerAngles

				var_348_23.z = 0
				var_348_23.x = 0
				var_348_15.localEulerAngles = var_348_23
			end

			local var_348_24 = 0
			local var_348_25 = 0.45

			if var_348_24 < arg_345_1.time_ and arg_345_1.time_ <= var_348_24 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_26 = arg_345_1:FormatText(StoryNameCfg[917].name)

				arg_345_1.leftNameTxt_.text = var_348_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_27 = arg_345_1:GetWordFromCfg(412031082)
				local var_348_28 = arg_345_1:FormatText(var_348_27.content)

				arg_345_1.text_.text = var_348_28

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_29 = 18
				local var_348_30 = utf8.len(var_348_28)
				local var_348_31 = var_348_29 <= 0 and var_348_25 or var_348_25 * (var_348_30 / var_348_29)

				if var_348_31 > 0 and var_348_25 < var_348_31 then
					arg_345_1.talkMaxDuration = var_348_31

					if var_348_31 + var_348_24 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_31 + var_348_24
					end
				end

				arg_345_1.text_.text = var_348_28
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031082", "story_v_out_412031.awb") ~= 0 then
					local var_348_32 = manager.audio:GetVoiceLength("story_v_out_412031", "412031082", "story_v_out_412031.awb") / 1000

					if var_348_32 + var_348_24 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_32 + var_348_24
					end

					if var_348_27.prefab_name ~= "" and arg_345_1.actors_[var_348_27.prefab_name] ~= nil then
						local var_348_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_27.prefab_name].transform, "story_v_out_412031", "412031082", "story_v_out_412031.awb")

						arg_345_1:RecordAudio("412031082", var_348_33)
						arg_345_1:RecordAudio("412031082", var_348_33)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_412031", "412031082", "story_v_out_412031.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_412031", "412031082", "story_v_out_412031.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_34 = math.max(var_348_25, arg_345_1.talkMaxDuration)

			if var_348_24 <= arg_345_1.time_ and arg_345_1.time_ < var_348_24 + var_348_34 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_24) / var_348_34

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_24 + var_348_34 and arg_345_1.time_ < var_348_24 + var_348_34 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play412031083 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 412031083
		arg_349_1.duration_ = 12.666

		local var_349_0 = {
			zh = 6.666,
			ja = 12.666
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
				arg_349_0:Play412031084(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1097ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1097ui_story == nil then
				arg_349_1.var_.characterEffect1097ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1097ui_story then
					arg_349_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1097ui_story then
				arg_349_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_352_4 = 0

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_352_5 = 0

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_352_6 = arg_349_1.actors_["10076ui_story"]
			local var_352_7 = 0

			if var_352_7 < arg_349_1.time_ and arg_349_1.time_ <= var_352_7 + arg_352_0 and arg_349_1.var_.characterEffect10076ui_story == nil then
				arg_349_1.var_.characterEffect10076ui_story = var_352_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_8 = 0.200000002980232

			if var_352_7 <= arg_349_1.time_ and arg_349_1.time_ < var_352_7 + var_352_8 then
				local var_352_9 = (arg_349_1.time_ - var_352_7) / var_352_8

				if arg_349_1.var_.characterEffect10076ui_story then
					local var_352_10 = Mathf.Lerp(0, 0.5, var_352_9)

					arg_349_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_349_1.var_.characterEffect10076ui_story.fillRatio = var_352_10
				end
			end

			if arg_349_1.time_ >= var_352_7 + var_352_8 and arg_349_1.time_ < var_352_7 + var_352_8 + arg_352_0 and arg_349_1.var_.characterEffect10076ui_story then
				local var_352_11 = 0.5

				arg_349_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_349_1.var_.characterEffect10076ui_story.fillRatio = var_352_11
			end

			local var_352_12 = 0
			local var_352_13 = 0.6

			if var_352_12 < arg_349_1.time_ and arg_349_1.time_ <= var_352_12 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_14 = arg_349_1:FormatText(StoryNameCfg[216].name)

				arg_349_1.leftNameTxt_.text = var_352_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_15 = arg_349_1:GetWordFromCfg(412031083)
				local var_352_16 = arg_349_1:FormatText(var_352_15.content)

				arg_349_1.text_.text = var_352_16

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_17 = 24
				local var_352_18 = utf8.len(var_352_16)
				local var_352_19 = var_352_17 <= 0 and var_352_13 or var_352_13 * (var_352_18 / var_352_17)

				if var_352_19 > 0 and var_352_13 < var_352_19 then
					arg_349_1.talkMaxDuration = var_352_19

					if var_352_19 + var_352_12 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_19 + var_352_12
					end
				end

				arg_349_1.text_.text = var_352_16
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031083", "story_v_out_412031.awb") ~= 0 then
					local var_352_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031083", "story_v_out_412031.awb") / 1000

					if var_352_20 + var_352_12 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_20 + var_352_12
					end

					if var_352_15.prefab_name ~= "" and arg_349_1.actors_[var_352_15.prefab_name] ~= nil then
						local var_352_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_15.prefab_name].transform, "story_v_out_412031", "412031083", "story_v_out_412031.awb")

						arg_349_1:RecordAudio("412031083", var_352_21)
						arg_349_1:RecordAudio("412031083", var_352_21)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_412031", "412031083", "story_v_out_412031.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_412031", "412031083", "story_v_out_412031.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_22 = math.max(var_352_13, arg_349_1.talkMaxDuration)

			if var_352_12 <= arg_349_1.time_ and arg_349_1.time_ < var_352_12 + var_352_22 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_12) / var_352_22

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_12 + var_352_22 and arg_349_1.time_ < var_352_12 + var_352_22 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play412031084 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 412031084
		arg_353_1.duration_ = 5.666

		local var_353_0 = {
			zh = 5.666,
			ja = 2.833
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
				arg_353_0:Play412031085(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.35

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[216].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(412031084)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031084", "story_v_out_412031.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031084", "story_v_out_412031.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_412031", "412031084", "story_v_out_412031.awb")

						arg_353_1:RecordAudio("412031084", var_356_9)
						arg_353_1:RecordAudio("412031084", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_412031", "412031084", "story_v_out_412031.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_412031", "412031084", "story_v_out_412031.awb")
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
	Play412031085 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 412031085
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play412031086(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10076ui_story"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos10076ui_story = var_360_0.localPosition
			end

			local var_360_2 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2
				local var_360_4 = Vector3.New(0, 100, 0)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10076ui_story, var_360_4, var_360_3)

				local var_360_5 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_5.x, var_360_5.y, var_360_5.z)

				local var_360_6 = var_360_0.localEulerAngles

				var_360_6.z = 0
				var_360_6.x = 0
				var_360_0.localEulerAngles = var_360_6
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(0, 100, 0)

				local var_360_7 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_7.x, var_360_7.y, var_360_7.z)

				local var_360_8 = var_360_0.localEulerAngles

				var_360_8.z = 0
				var_360_8.x = 0
				var_360_0.localEulerAngles = var_360_8
			end

			local var_360_9 = arg_357_1.actors_["10076ui_story"]
			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 and arg_357_1.var_.characterEffect10076ui_story == nil then
				arg_357_1.var_.characterEffect10076ui_story = var_360_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_11 = 0.200000002980232

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_11 then
				local var_360_12 = (arg_357_1.time_ - var_360_10) / var_360_11

				if arg_357_1.var_.characterEffect10076ui_story then
					local var_360_13 = Mathf.Lerp(0, 0.5, var_360_12)

					arg_357_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_357_1.var_.characterEffect10076ui_story.fillRatio = var_360_13
				end
			end

			if arg_357_1.time_ >= var_360_10 + var_360_11 and arg_357_1.time_ < var_360_10 + var_360_11 + arg_360_0 and arg_357_1.var_.characterEffect10076ui_story then
				local var_360_14 = 0.5

				arg_357_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_357_1.var_.characterEffect10076ui_story.fillRatio = var_360_14
			end

			local var_360_15 = arg_357_1.actors_["1097ui_story"].transform
			local var_360_16 = 0

			if var_360_16 < arg_357_1.time_ and arg_357_1.time_ <= var_360_16 + arg_360_0 then
				arg_357_1.var_.moveOldPos1097ui_story = var_360_15.localPosition
			end

			local var_360_17 = 0.001

			if var_360_16 <= arg_357_1.time_ and arg_357_1.time_ < var_360_16 + var_360_17 then
				local var_360_18 = (arg_357_1.time_ - var_360_16) / var_360_17
				local var_360_19 = Vector3.New(0, 100, 0)

				var_360_15.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1097ui_story, var_360_19, var_360_18)

				local var_360_20 = manager.ui.mainCamera.transform.position - var_360_15.position

				var_360_15.forward = Vector3.New(var_360_20.x, var_360_20.y, var_360_20.z)

				local var_360_21 = var_360_15.localEulerAngles

				var_360_21.z = 0
				var_360_21.x = 0
				var_360_15.localEulerAngles = var_360_21
			end

			if arg_357_1.time_ >= var_360_16 + var_360_17 and arg_357_1.time_ < var_360_16 + var_360_17 + arg_360_0 then
				var_360_15.localPosition = Vector3.New(0, 100, 0)

				local var_360_22 = manager.ui.mainCamera.transform.position - var_360_15.position

				var_360_15.forward = Vector3.New(var_360_22.x, var_360_22.y, var_360_22.z)

				local var_360_23 = var_360_15.localEulerAngles

				var_360_23.z = 0
				var_360_23.x = 0
				var_360_15.localEulerAngles = var_360_23
			end

			local var_360_24 = arg_357_1.actors_["1097ui_story"]
			local var_360_25 = 0

			if var_360_25 < arg_357_1.time_ and arg_357_1.time_ <= var_360_25 + arg_360_0 and arg_357_1.var_.characterEffect1097ui_story == nil then
				arg_357_1.var_.characterEffect1097ui_story = var_360_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_26 = 0.200000002980232

			if var_360_25 <= arg_357_1.time_ and arg_357_1.time_ < var_360_25 + var_360_26 then
				local var_360_27 = (arg_357_1.time_ - var_360_25) / var_360_26

				if arg_357_1.var_.characterEffect1097ui_story then
					local var_360_28 = Mathf.Lerp(0, 0.5, var_360_27)

					arg_357_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1097ui_story.fillRatio = var_360_28
				end
			end

			if arg_357_1.time_ >= var_360_25 + var_360_26 and arg_357_1.time_ < var_360_25 + var_360_26 + arg_360_0 and arg_357_1.var_.characterEffect1097ui_story then
				local var_360_29 = 0.5

				arg_357_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1097ui_story.fillRatio = var_360_29
			end

			local var_360_30 = 0
			local var_360_31 = 0.375

			if var_360_30 < arg_357_1.time_ and arg_357_1.time_ <= var_360_30 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, false)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_32 = arg_357_1:GetWordFromCfg(412031085)
				local var_360_33 = arg_357_1:FormatText(var_360_32.content)

				arg_357_1.text_.text = var_360_33

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_34 = 15
				local var_360_35 = utf8.len(var_360_33)
				local var_360_36 = var_360_34 <= 0 and var_360_31 or var_360_31 * (var_360_35 / var_360_34)

				if var_360_36 > 0 and var_360_31 < var_360_36 then
					arg_357_1.talkMaxDuration = var_360_36

					if var_360_36 + var_360_30 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_36 + var_360_30
					end
				end

				arg_357_1.text_.text = var_360_33
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_37 = math.max(var_360_31, arg_357_1.talkMaxDuration)

			if var_360_30 <= arg_357_1.time_ and arg_357_1.time_ < var_360_30 + var_360_37 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_30) / var_360_37

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_30 + var_360_37 and arg_357_1.time_ < var_360_30 + var_360_37 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play412031086 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 412031086
		arg_361_1.duration_ = 2.466

		local var_361_0 = {
			zh = 1.999999999999,
			ja = 2.466
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play412031087(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["3043ui_story"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos3043ui_story = var_364_0.localPosition
			end

			local var_364_2 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2
				local var_364_4 = Vector3.New(0, -1.41, -5.7)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos3043ui_story, var_364_4, var_364_3)

				local var_364_5 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_5.x, var_364_5.y, var_364_5.z)

				local var_364_6 = var_364_0.localEulerAngles

				var_364_6.z = 0
				var_364_6.x = 0
				var_364_0.localEulerAngles = var_364_6
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_364_7 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_7.x, var_364_7.y, var_364_7.z)

				local var_364_8 = var_364_0.localEulerAngles

				var_364_8.z = 0
				var_364_8.x = 0
				var_364_0.localEulerAngles = var_364_8
			end

			local var_364_9 = arg_361_1.actors_["3043ui_story"]
			local var_364_10 = 0

			if var_364_10 < arg_361_1.time_ and arg_361_1.time_ <= var_364_10 + arg_364_0 and arg_361_1.var_.characterEffect3043ui_story == nil then
				arg_361_1.var_.characterEffect3043ui_story = var_364_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_11 = 0.200000002980232

			if var_364_10 <= arg_361_1.time_ and arg_361_1.time_ < var_364_10 + var_364_11 then
				local var_364_12 = (arg_361_1.time_ - var_364_10) / var_364_11

				if arg_361_1.var_.characterEffect3043ui_story then
					arg_361_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_10 + var_364_11 and arg_361_1.time_ < var_364_10 + var_364_11 + arg_364_0 and arg_361_1.var_.characterEffect3043ui_story then
				arg_361_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_364_13 = 0

			if var_364_13 < arg_361_1.time_ and arg_361_1.time_ <= var_364_13 + arg_364_0 then
				arg_361_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_364_14 = 0

			if var_364_14 < arg_361_1.time_ and arg_361_1.time_ <= var_364_14 + arg_364_0 then
				arg_361_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_364_15 = 0
			local var_364_16 = 0.15

			if var_364_15 < arg_361_1.time_ and arg_361_1.time_ <= var_364_15 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_17 = arg_361_1:FormatText(StoryNameCfg[920].name)

				arg_361_1.leftNameTxt_.text = var_364_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_18 = arg_361_1:GetWordFromCfg(412031086)
				local var_364_19 = arg_361_1:FormatText(var_364_18.content)

				arg_361_1.text_.text = var_364_19

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_20 = 6
				local var_364_21 = utf8.len(var_364_19)
				local var_364_22 = var_364_20 <= 0 and var_364_16 or var_364_16 * (var_364_21 / var_364_20)

				if var_364_22 > 0 and var_364_16 < var_364_22 then
					arg_361_1.talkMaxDuration = var_364_22

					if var_364_22 + var_364_15 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_22 + var_364_15
					end
				end

				arg_361_1.text_.text = var_364_19
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031086", "story_v_out_412031.awb") ~= 0 then
					local var_364_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031086", "story_v_out_412031.awb") / 1000

					if var_364_23 + var_364_15 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_23 + var_364_15
					end

					if var_364_18.prefab_name ~= "" and arg_361_1.actors_[var_364_18.prefab_name] ~= nil then
						local var_364_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_18.prefab_name].transform, "story_v_out_412031", "412031086", "story_v_out_412031.awb")

						arg_361_1:RecordAudio("412031086", var_364_24)
						arg_361_1:RecordAudio("412031086", var_364_24)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_412031", "412031086", "story_v_out_412031.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_412031", "412031086", "story_v_out_412031.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_25 = math.max(var_364_16, arg_361_1.talkMaxDuration)

			if var_364_15 <= arg_361_1.time_ and arg_361_1.time_ < var_364_15 + var_364_25 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_15) / var_364_25

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_15 + var_364_25 and arg_361_1.time_ < var_364_15 + var_364_25 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play412031087 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 412031087
		arg_365_1.duration_ = 10.3

		local var_365_0 = {
			zh = 5.966,
			ja = 10.3
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play412031088(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1097ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1097ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(0.7, -0.54, -6.3)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1097ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = arg_365_1.actors_["1097ui_story"]
			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 and arg_365_1.var_.characterEffect1097ui_story == nil then
				arg_365_1.var_.characterEffect1097ui_story = var_368_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_11 = 0.200000002980232

			if var_368_10 <= arg_365_1.time_ and arg_365_1.time_ < var_368_10 + var_368_11 then
				local var_368_12 = (arg_365_1.time_ - var_368_10) / var_368_11

				if arg_365_1.var_.characterEffect1097ui_story then
					arg_365_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_10 + var_368_11 and arg_365_1.time_ < var_368_10 + var_368_11 + arg_368_0 and arg_365_1.var_.characterEffect1097ui_story then
				arg_365_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_368_13 = 0

			if var_368_13 < arg_365_1.time_ and arg_365_1.time_ <= var_368_13 + arg_368_0 then
				arg_365_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_368_14 = 0

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 then
				arg_365_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_368_15 = arg_365_1.actors_["3043ui_story"]
			local var_368_16 = 0

			if var_368_16 < arg_365_1.time_ and arg_365_1.time_ <= var_368_16 + arg_368_0 and arg_365_1.var_.characterEffect3043ui_story == nil then
				arg_365_1.var_.characterEffect3043ui_story = var_368_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_17 = 0.200000002980232

			if var_368_16 <= arg_365_1.time_ and arg_365_1.time_ < var_368_16 + var_368_17 then
				local var_368_18 = (arg_365_1.time_ - var_368_16) / var_368_17

				if arg_365_1.var_.characterEffect3043ui_story then
					local var_368_19 = Mathf.Lerp(0, 0.5, var_368_18)

					arg_365_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_365_1.var_.characterEffect3043ui_story.fillRatio = var_368_19
				end
			end

			if arg_365_1.time_ >= var_368_16 + var_368_17 and arg_365_1.time_ < var_368_16 + var_368_17 + arg_368_0 and arg_365_1.var_.characterEffect3043ui_story then
				local var_368_20 = 0.5

				arg_365_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_365_1.var_.characterEffect3043ui_story.fillRatio = var_368_20
			end

			local var_368_21 = arg_365_1.actors_["3043ui_story"].transform
			local var_368_22 = 0

			if var_368_22 < arg_365_1.time_ and arg_365_1.time_ <= var_368_22 + arg_368_0 then
				arg_365_1.var_.moveOldPos3043ui_story = var_368_21.localPosition
			end

			local var_368_23 = 0.001

			if var_368_22 <= arg_365_1.time_ and arg_365_1.time_ < var_368_22 + var_368_23 then
				local var_368_24 = (arg_365_1.time_ - var_368_22) / var_368_23
				local var_368_25 = Vector3.New(-0.7, -1.41, -5.7)

				var_368_21.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos3043ui_story, var_368_25, var_368_24)

				local var_368_26 = manager.ui.mainCamera.transform.position - var_368_21.position

				var_368_21.forward = Vector3.New(var_368_26.x, var_368_26.y, var_368_26.z)

				local var_368_27 = var_368_21.localEulerAngles

				var_368_27.z = 0
				var_368_27.x = 0
				var_368_21.localEulerAngles = var_368_27
			end

			if arg_365_1.time_ >= var_368_22 + var_368_23 and arg_365_1.time_ < var_368_22 + var_368_23 + arg_368_0 then
				var_368_21.localPosition = Vector3.New(-0.7, -1.41, -5.7)

				local var_368_28 = manager.ui.mainCamera.transform.position - var_368_21.position

				var_368_21.forward = Vector3.New(var_368_28.x, var_368_28.y, var_368_28.z)

				local var_368_29 = var_368_21.localEulerAngles

				var_368_29.z = 0
				var_368_29.x = 0
				var_368_21.localEulerAngles = var_368_29
			end

			local var_368_30 = 0
			local var_368_31 = 0.525

			if var_368_30 < arg_365_1.time_ and arg_365_1.time_ <= var_368_30 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_32 = arg_365_1:FormatText(StoryNameCfg[216].name)

				arg_365_1.leftNameTxt_.text = var_368_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_33 = arg_365_1:GetWordFromCfg(412031087)
				local var_368_34 = arg_365_1:FormatText(var_368_33.content)

				arg_365_1.text_.text = var_368_34

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_35 = 21
				local var_368_36 = utf8.len(var_368_34)
				local var_368_37 = var_368_35 <= 0 and var_368_31 or var_368_31 * (var_368_36 / var_368_35)

				if var_368_37 > 0 and var_368_31 < var_368_37 then
					arg_365_1.talkMaxDuration = var_368_37

					if var_368_37 + var_368_30 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_37 + var_368_30
					end
				end

				arg_365_1.text_.text = var_368_34
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031087", "story_v_out_412031.awb") ~= 0 then
					local var_368_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031087", "story_v_out_412031.awb") / 1000

					if var_368_38 + var_368_30 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_38 + var_368_30
					end

					if var_368_33.prefab_name ~= "" and arg_365_1.actors_[var_368_33.prefab_name] ~= nil then
						local var_368_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_33.prefab_name].transform, "story_v_out_412031", "412031087", "story_v_out_412031.awb")

						arg_365_1:RecordAudio("412031087", var_368_39)
						arg_365_1:RecordAudio("412031087", var_368_39)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_412031", "412031087", "story_v_out_412031.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_412031", "412031087", "story_v_out_412031.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_40 = math.max(var_368_31, arg_365_1.talkMaxDuration)

			if var_368_30 <= arg_365_1.time_ and arg_365_1.time_ < var_368_30 + var_368_40 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_30) / var_368_40

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_30 + var_368_40 and arg_365_1.time_ < var_368_30 + var_368_40 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play412031088 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 412031088
		arg_369_1.duration_ = 7.266

		local var_369_0 = {
			zh = 3.333,
			ja = 7.266
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play412031089(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["3043ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and arg_369_1.var_.characterEffect3043ui_story == nil then
				arg_369_1.var_.characterEffect3043ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.200000002980232

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect3043ui_story then
					arg_369_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and arg_369_1.var_.characterEffect3043ui_story then
				arg_369_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_372_4 = 0

			if var_372_4 < arg_369_1.time_ and arg_369_1.time_ <= var_372_4 + arg_372_0 then
				arg_369_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_372_5 = 0

			if var_372_5 < arg_369_1.time_ and arg_369_1.time_ <= var_372_5 + arg_372_0 then
				arg_369_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_372_6 = arg_369_1.actors_["1097ui_story"]
			local var_372_7 = 0

			if var_372_7 < arg_369_1.time_ and arg_369_1.time_ <= var_372_7 + arg_372_0 and arg_369_1.var_.characterEffect1097ui_story == nil then
				arg_369_1.var_.characterEffect1097ui_story = var_372_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_8 = 0.200000002980232

			if var_372_7 <= arg_369_1.time_ and arg_369_1.time_ < var_372_7 + var_372_8 then
				local var_372_9 = (arg_369_1.time_ - var_372_7) / var_372_8

				if arg_369_1.var_.characterEffect1097ui_story then
					local var_372_10 = Mathf.Lerp(0, 0.5, var_372_9)

					arg_369_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1097ui_story.fillRatio = var_372_10
				end
			end

			if arg_369_1.time_ >= var_372_7 + var_372_8 and arg_369_1.time_ < var_372_7 + var_372_8 + arg_372_0 and arg_369_1.var_.characterEffect1097ui_story then
				local var_372_11 = 0.5

				arg_369_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1097ui_story.fillRatio = var_372_11
			end

			local var_372_12 = 0
			local var_372_13 = 0.275

			if var_372_12 < arg_369_1.time_ and arg_369_1.time_ <= var_372_12 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_14 = arg_369_1:FormatText(StoryNameCfg[920].name)

				arg_369_1.leftNameTxt_.text = var_372_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_15 = arg_369_1:GetWordFromCfg(412031088)
				local var_372_16 = arg_369_1:FormatText(var_372_15.content)

				arg_369_1.text_.text = var_372_16

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_17 = 11
				local var_372_18 = utf8.len(var_372_16)
				local var_372_19 = var_372_17 <= 0 and var_372_13 or var_372_13 * (var_372_18 / var_372_17)

				if var_372_19 > 0 and var_372_13 < var_372_19 then
					arg_369_1.talkMaxDuration = var_372_19

					if var_372_19 + var_372_12 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_19 + var_372_12
					end
				end

				arg_369_1.text_.text = var_372_16
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031088", "story_v_out_412031.awb") ~= 0 then
					local var_372_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031088", "story_v_out_412031.awb") / 1000

					if var_372_20 + var_372_12 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_20 + var_372_12
					end

					if var_372_15.prefab_name ~= "" and arg_369_1.actors_[var_372_15.prefab_name] ~= nil then
						local var_372_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_15.prefab_name].transform, "story_v_out_412031", "412031088", "story_v_out_412031.awb")

						arg_369_1:RecordAudio("412031088", var_372_21)
						arg_369_1:RecordAudio("412031088", var_372_21)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_412031", "412031088", "story_v_out_412031.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_412031", "412031088", "story_v_out_412031.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_22 = math.max(var_372_13, arg_369_1.talkMaxDuration)

			if var_372_12 <= arg_369_1.time_ and arg_369_1.time_ < var_372_12 + var_372_22 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_12) / var_372_22

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_12 + var_372_22 and arg_369_1.time_ < var_372_12 + var_372_22 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play412031089 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 412031089
		arg_373_1.duration_ = 3.933

		local var_373_0 = {
			zh = 2.633,
			ja = 3.933
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play412031090(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1097ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect1097ui_story == nil then
				arg_373_1.var_.characterEffect1097ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.200000002980232

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect1097ui_story then
					arg_373_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect1097ui_story then
				arg_373_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_376_4 = 0

			if var_376_4 < arg_373_1.time_ and arg_373_1.time_ <= var_376_4 + arg_376_0 then
				arg_373_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_376_5 = 0

			if var_376_5 < arg_373_1.time_ and arg_373_1.time_ <= var_376_5 + arg_376_0 then
				arg_373_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_376_6 = arg_373_1.actors_["3043ui_story"]
			local var_376_7 = 0

			if var_376_7 < arg_373_1.time_ and arg_373_1.time_ <= var_376_7 + arg_376_0 and arg_373_1.var_.characterEffect3043ui_story == nil then
				arg_373_1.var_.characterEffect3043ui_story = var_376_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_8 = 0.200000002980232

			if var_376_7 <= arg_373_1.time_ and arg_373_1.time_ < var_376_7 + var_376_8 then
				local var_376_9 = (arg_373_1.time_ - var_376_7) / var_376_8

				if arg_373_1.var_.characterEffect3043ui_story then
					local var_376_10 = Mathf.Lerp(0, 0.5, var_376_9)

					arg_373_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_373_1.var_.characterEffect3043ui_story.fillRatio = var_376_10
				end
			end

			if arg_373_1.time_ >= var_376_7 + var_376_8 and arg_373_1.time_ < var_376_7 + var_376_8 + arg_376_0 and arg_373_1.var_.characterEffect3043ui_story then
				local var_376_11 = 0.5

				arg_373_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_373_1.var_.characterEffect3043ui_story.fillRatio = var_376_11
			end

			local var_376_12 = 0
			local var_376_13 = 0.175

			if var_376_12 < arg_373_1.time_ and arg_373_1.time_ <= var_376_12 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_14 = arg_373_1:FormatText(StoryNameCfg[216].name)

				arg_373_1.leftNameTxt_.text = var_376_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_15 = arg_373_1:GetWordFromCfg(412031089)
				local var_376_16 = arg_373_1:FormatText(var_376_15.content)

				arg_373_1.text_.text = var_376_16

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_17 = 7
				local var_376_18 = utf8.len(var_376_16)
				local var_376_19 = var_376_17 <= 0 and var_376_13 or var_376_13 * (var_376_18 / var_376_17)

				if var_376_19 > 0 and var_376_13 < var_376_19 then
					arg_373_1.talkMaxDuration = var_376_19

					if var_376_19 + var_376_12 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_19 + var_376_12
					end
				end

				arg_373_1.text_.text = var_376_16
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031089", "story_v_out_412031.awb") ~= 0 then
					local var_376_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031089", "story_v_out_412031.awb") / 1000

					if var_376_20 + var_376_12 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_20 + var_376_12
					end

					if var_376_15.prefab_name ~= "" and arg_373_1.actors_[var_376_15.prefab_name] ~= nil then
						local var_376_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_15.prefab_name].transform, "story_v_out_412031", "412031089", "story_v_out_412031.awb")

						arg_373_1:RecordAudio("412031089", var_376_21)
						arg_373_1:RecordAudio("412031089", var_376_21)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_412031", "412031089", "story_v_out_412031.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_412031", "412031089", "story_v_out_412031.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_22 = math.max(var_376_13, arg_373_1.talkMaxDuration)

			if var_376_12 <= arg_373_1.time_ and arg_373_1.time_ < var_376_12 + var_376_22 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_12) / var_376_22

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_12 + var_376_22 and arg_373_1.time_ < var_376_12 + var_376_22 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play412031090 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 412031090
		arg_377_1.duration_ = 7.9

		local var_377_0 = {
			zh = 5.9,
			ja = 7.9
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play412031091(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["3043ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect3043ui_story == nil then
				arg_377_1.var_.characterEffect3043ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.200000002980232

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect3043ui_story then
					arg_377_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect3043ui_story then
				arg_377_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_380_4 = 0

			if var_380_4 < arg_377_1.time_ and arg_377_1.time_ <= var_380_4 + arg_380_0 then
				arg_377_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_380_5 = 0

			if var_380_5 < arg_377_1.time_ and arg_377_1.time_ <= var_380_5 + arg_380_0 then
				arg_377_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_380_6 = arg_377_1.actors_["1097ui_story"]
			local var_380_7 = 0

			if var_380_7 < arg_377_1.time_ and arg_377_1.time_ <= var_380_7 + arg_380_0 and arg_377_1.var_.characterEffect1097ui_story == nil then
				arg_377_1.var_.characterEffect1097ui_story = var_380_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_8 = 0.200000002980232

			if var_380_7 <= arg_377_1.time_ and arg_377_1.time_ < var_380_7 + var_380_8 then
				local var_380_9 = (arg_377_1.time_ - var_380_7) / var_380_8

				if arg_377_1.var_.characterEffect1097ui_story then
					local var_380_10 = Mathf.Lerp(0, 0.5, var_380_9)

					arg_377_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1097ui_story.fillRatio = var_380_10
				end
			end

			if arg_377_1.time_ >= var_380_7 + var_380_8 and arg_377_1.time_ < var_380_7 + var_380_8 + arg_380_0 and arg_377_1.var_.characterEffect1097ui_story then
				local var_380_11 = 0.5

				arg_377_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1097ui_story.fillRatio = var_380_11
			end

			local var_380_12 = 0
			local var_380_13 = 0.55

			if var_380_12 < arg_377_1.time_ and arg_377_1.time_ <= var_380_12 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_14 = arg_377_1:FormatText(StoryNameCfg[920].name)

				arg_377_1.leftNameTxt_.text = var_380_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_15 = arg_377_1:GetWordFromCfg(412031090)
				local var_380_16 = arg_377_1:FormatText(var_380_15.content)

				arg_377_1.text_.text = var_380_16

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_17 = 22
				local var_380_18 = utf8.len(var_380_16)
				local var_380_19 = var_380_17 <= 0 and var_380_13 or var_380_13 * (var_380_18 / var_380_17)

				if var_380_19 > 0 and var_380_13 < var_380_19 then
					arg_377_1.talkMaxDuration = var_380_19

					if var_380_19 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_19 + var_380_12
					end
				end

				arg_377_1.text_.text = var_380_16
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031090", "story_v_out_412031.awb") ~= 0 then
					local var_380_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031090", "story_v_out_412031.awb") / 1000

					if var_380_20 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_20 + var_380_12
					end

					if var_380_15.prefab_name ~= "" and arg_377_1.actors_[var_380_15.prefab_name] ~= nil then
						local var_380_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_15.prefab_name].transform, "story_v_out_412031", "412031090", "story_v_out_412031.awb")

						arg_377_1:RecordAudio("412031090", var_380_21)
						arg_377_1:RecordAudio("412031090", var_380_21)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_412031", "412031090", "story_v_out_412031.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_412031", "412031090", "story_v_out_412031.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_22 = math.max(var_380_13, arg_377_1.talkMaxDuration)

			if var_380_12 <= arg_377_1.time_ and arg_377_1.time_ < var_380_12 + var_380_22 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_12) / var_380_22

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_12 + var_380_22 and arg_377_1.time_ < var_380_12 + var_380_22 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play412031091 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 412031091
		arg_381_1.duration_ = 8.533

		local var_381_0 = {
			zh = 4.966,
			ja = 8.533
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play412031092(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10078ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos10078ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(0, -0.5, -6.3)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos10078ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = arg_381_1.actors_["10078ui_story"]
			local var_384_10 = 0

			if var_384_10 < arg_381_1.time_ and arg_381_1.time_ <= var_384_10 + arg_384_0 and arg_381_1.var_.characterEffect10078ui_story == nil then
				arg_381_1.var_.characterEffect10078ui_story = var_384_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_11 = 0.200000002980232

			if var_384_10 <= arg_381_1.time_ and arg_381_1.time_ < var_384_10 + var_384_11 then
				local var_384_12 = (arg_381_1.time_ - var_384_10) / var_384_11

				if arg_381_1.var_.characterEffect10078ui_story then
					arg_381_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_10 + var_384_11 and arg_381_1.time_ < var_384_10 + var_384_11 + arg_384_0 and arg_381_1.var_.characterEffect10078ui_story then
				arg_381_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_384_13 = 0

			if var_384_13 < arg_381_1.time_ and arg_381_1.time_ <= var_384_13 + arg_384_0 then
				arg_381_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action4_1")
			end

			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 then
				arg_381_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_384_15 = arg_381_1.actors_["1097ui_story"].transform
			local var_384_16 = 0

			if var_384_16 < arg_381_1.time_ and arg_381_1.time_ <= var_384_16 + arg_384_0 then
				arg_381_1.var_.moveOldPos1097ui_story = var_384_15.localPosition
			end

			local var_384_17 = 0.001

			if var_384_16 <= arg_381_1.time_ and arg_381_1.time_ < var_384_16 + var_384_17 then
				local var_384_18 = (arg_381_1.time_ - var_384_16) / var_384_17
				local var_384_19 = Vector3.New(0, 100, 0)

				var_384_15.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1097ui_story, var_384_19, var_384_18)

				local var_384_20 = manager.ui.mainCamera.transform.position - var_384_15.position

				var_384_15.forward = Vector3.New(var_384_20.x, var_384_20.y, var_384_20.z)

				local var_384_21 = var_384_15.localEulerAngles

				var_384_21.z = 0
				var_384_21.x = 0
				var_384_15.localEulerAngles = var_384_21
			end

			if arg_381_1.time_ >= var_384_16 + var_384_17 and arg_381_1.time_ < var_384_16 + var_384_17 + arg_384_0 then
				var_384_15.localPosition = Vector3.New(0, 100, 0)

				local var_384_22 = manager.ui.mainCamera.transform.position - var_384_15.position

				var_384_15.forward = Vector3.New(var_384_22.x, var_384_22.y, var_384_22.z)

				local var_384_23 = var_384_15.localEulerAngles

				var_384_23.z = 0
				var_384_23.x = 0
				var_384_15.localEulerAngles = var_384_23
			end

			local var_384_24 = arg_381_1.actors_["1097ui_story"]
			local var_384_25 = 0

			if var_384_25 < arg_381_1.time_ and arg_381_1.time_ <= var_384_25 + arg_384_0 and arg_381_1.var_.characterEffect1097ui_story == nil then
				arg_381_1.var_.characterEffect1097ui_story = var_384_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_26 = 0.200000002980232

			if var_384_25 <= arg_381_1.time_ and arg_381_1.time_ < var_384_25 + var_384_26 then
				local var_384_27 = (arg_381_1.time_ - var_384_25) / var_384_26

				if arg_381_1.var_.characterEffect1097ui_story then
					local var_384_28 = Mathf.Lerp(0, 0.5, var_384_27)

					arg_381_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_381_1.var_.characterEffect1097ui_story.fillRatio = var_384_28
				end
			end

			if arg_381_1.time_ >= var_384_25 + var_384_26 and arg_381_1.time_ < var_384_25 + var_384_26 + arg_384_0 and arg_381_1.var_.characterEffect1097ui_story then
				local var_384_29 = 0.5

				arg_381_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_381_1.var_.characterEffect1097ui_story.fillRatio = var_384_29
			end

			local var_384_30 = arg_381_1.actors_["3043ui_story"].transform
			local var_384_31 = 0

			if var_384_31 < arg_381_1.time_ and arg_381_1.time_ <= var_384_31 + arg_384_0 then
				arg_381_1.var_.moveOldPos3043ui_story = var_384_30.localPosition
			end

			local var_384_32 = 0.001

			if var_384_31 <= arg_381_1.time_ and arg_381_1.time_ < var_384_31 + var_384_32 then
				local var_384_33 = (arg_381_1.time_ - var_384_31) / var_384_32
				local var_384_34 = Vector3.New(0, 100, 0)

				var_384_30.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos3043ui_story, var_384_34, var_384_33)

				local var_384_35 = manager.ui.mainCamera.transform.position - var_384_30.position

				var_384_30.forward = Vector3.New(var_384_35.x, var_384_35.y, var_384_35.z)

				local var_384_36 = var_384_30.localEulerAngles

				var_384_36.z = 0
				var_384_36.x = 0
				var_384_30.localEulerAngles = var_384_36
			end

			if arg_381_1.time_ >= var_384_31 + var_384_32 and arg_381_1.time_ < var_384_31 + var_384_32 + arg_384_0 then
				var_384_30.localPosition = Vector3.New(0, 100, 0)

				local var_384_37 = manager.ui.mainCamera.transform.position - var_384_30.position

				var_384_30.forward = Vector3.New(var_384_37.x, var_384_37.y, var_384_37.z)

				local var_384_38 = var_384_30.localEulerAngles

				var_384_38.z = 0
				var_384_38.x = 0
				var_384_30.localEulerAngles = var_384_38
			end

			local var_384_39 = arg_381_1.actors_["3043ui_story"]
			local var_384_40 = 0

			if var_384_40 < arg_381_1.time_ and arg_381_1.time_ <= var_384_40 + arg_384_0 and arg_381_1.var_.characterEffect3043ui_story == nil then
				arg_381_1.var_.characterEffect3043ui_story = var_384_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_41 = 0.200000002980232

			if var_384_40 <= arg_381_1.time_ and arg_381_1.time_ < var_384_40 + var_384_41 then
				local var_384_42 = (arg_381_1.time_ - var_384_40) / var_384_41

				if arg_381_1.var_.characterEffect3043ui_story then
					local var_384_43 = Mathf.Lerp(0, 0.5, var_384_42)

					arg_381_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_381_1.var_.characterEffect3043ui_story.fillRatio = var_384_43
				end
			end

			if arg_381_1.time_ >= var_384_40 + var_384_41 and arg_381_1.time_ < var_384_40 + var_384_41 + arg_384_0 and arg_381_1.var_.characterEffect3043ui_story then
				local var_384_44 = 0.5

				arg_381_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_381_1.var_.characterEffect3043ui_story.fillRatio = var_384_44
			end

			local var_384_45 = 0
			local var_384_46 = 0.475

			if var_384_45 < arg_381_1.time_ and arg_381_1.time_ <= var_384_45 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_47 = arg_381_1:FormatText(StoryNameCfg[919].name)

				arg_381_1.leftNameTxt_.text = var_384_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_48 = arg_381_1:GetWordFromCfg(412031091)
				local var_384_49 = arg_381_1:FormatText(var_384_48.content)

				arg_381_1.text_.text = var_384_49

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_50 = 19
				local var_384_51 = utf8.len(var_384_49)
				local var_384_52 = var_384_50 <= 0 and var_384_46 or var_384_46 * (var_384_51 / var_384_50)

				if var_384_52 > 0 and var_384_46 < var_384_52 then
					arg_381_1.talkMaxDuration = var_384_52

					if var_384_52 + var_384_45 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_52 + var_384_45
					end
				end

				arg_381_1.text_.text = var_384_49
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031091", "story_v_out_412031.awb") ~= 0 then
					local var_384_53 = manager.audio:GetVoiceLength("story_v_out_412031", "412031091", "story_v_out_412031.awb") / 1000

					if var_384_53 + var_384_45 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_53 + var_384_45
					end

					if var_384_48.prefab_name ~= "" and arg_381_1.actors_[var_384_48.prefab_name] ~= nil then
						local var_384_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_48.prefab_name].transform, "story_v_out_412031", "412031091", "story_v_out_412031.awb")

						arg_381_1:RecordAudio("412031091", var_384_54)
						arg_381_1:RecordAudio("412031091", var_384_54)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_412031", "412031091", "story_v_out_412031.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_412031", "412031091", "story_v_out_412031.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_55 = math.max(var_384_46, arg_381_1.talkMaxDuration)

			if var_384_45 <= arg_381_1.time_ and arg_381_1.time_ < var_384_45 + var_384_55 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_45) / var_384_55

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_45 + var_384_55 and arg_381_1.time_ < var_384_45 + var_384_55 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play412031092 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 412031092
		arg_385_1.duration_ = 3.266

		local var_385_0 = {
			zh = 1.999999999999,
			ja = 3.266
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play412031093(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10076ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos10076ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(0, -0.35, -4)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos10076ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, -0.35, -4)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["10076ui_story"]
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect10076ui_story == nil then
				arg_385_1.var_.characterEffect10076ui_story = var_388_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_11 = 0.200000002980232

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11

				if arg_385_1.var_.characterEffect10076ui_story then
					arg_385_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect10076ui_story then
				arg_385_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_388_13 = 0

			if var_388_13 < arg_385_1.time_ and arg_385_1.time_ <= var_388_13 + arg_388_0 then
				arg_385_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action2_1")
			end

			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_388_15 = arg_385_1.actors_["10078ui_story"].transform
			local var_388_16 = 0

			if var_388_16 < arg_385_1.time_ and arg_385_1.time_ <= var_388_16 + arg_388_0 then
				arg_385_1.var_.moveOldPos10078ui_story = var_388_15.localPosition
			end

			local var_388_17 = 0.001

			if var_388_16 <= arg_385_1.time_ and arg_385_1.time_ < var_388_16 + var_388_17 then
				local var_388_18 = (arg_385_1.time_ - var_388_16) / var_388_17
				local var_388_19 = Vector3.New(0, 100, 0)

				var_388_15.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos10078ui_story, var_388_19, var_388_18)

				local var_388_20 = manager.ui.mainCamera.transform.position - var_388_15.position

				var_388_15.forward = Vector3.New(var_388_20.x, var_388_20.y, var_388_20.z)

				local var_388_21 = var_388_15.localEulerAngles

				var_388_21.z = 0
				var_388_21.x = 0
				var_388_15.localEulerAngles = var_388_21
			end

			if arg_385_1.time_ >= var_388_16 + var_388_17 and arg_385_1.time_ < var_388_16 + var_388_17 + arg_388_0 then
				var_388_15.localPosition = Vector3.New(0, 100, 0)

				local var_388_22 = manager.ui.mainCamera.transform.position - var_388_15.position

				var_388_15.forward = Vector3.New(var_388_22.x, var_388_22.y, var_388_22.z)

				local var_388_23 = var_388_15.localEulerAngles

				var_388_23.z = 0
				var_388_23.x = 0
				var_388_15.localEulerAngles = var_388_23
			end

			local var_388_24 = arg_385_1.actors_["10078ui_story"]
			local var_388_25 = 0

			if var_388_25 < arg_385_1.time_ and arg_385_1.time_ <= var_388_25 + arg_388_0 and arg_385_1.var_.characterEffect10078ui_story == nil then
				arg_385_1.var_.characterEffect10078ui_story = var_388_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_26 = 0.200000002980232

			if var_388_25 <= arg_385_1.time_ and arg_385_1.time_ < var_388_25 + var_388_26 then
				local var_388_27 = (arg_385_1.time_ - var_388_25) / var_388_26

				if arg_385_1.var_.characterEffect10078ui_story then
					local var_388_28 = Mathf.Lerp(0, 0.5, var_388_27)

					arg_385_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_385_1.var_.characterEffect10078ui_story.fillRatio = var_388_28
				end
			end

			if arg_385_1.time_ >= var_388_25 + var_388_26 and arg_385_1.time_ < var_388_25 + var_388_26 + arg_388_0 and arg_385_1.var_.characterEffect10078ui_story then
				local var_388_29 = 0.5

				arg_385_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_385_1.var_.characterEffect10078ui_story.fillRatio = var_388_29
			end

			local var_388_30 = 0
			local var_388_31 = 0.25

			if var_388_30 < arg_385_1.time_ and arg_385_1.time_ <= var_388_30 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_32 = arg_385_1:FormatText(StoryNameCfg[917].name)

				arg_385_1.leftNameTxt_.text = var_388_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_33 = arg_385_1:GetWordFromCfg(412031092)
				local var_388_34 = arg_385_1:FormatText(var_388_33.content)

				arg_385_1.text_.text = var_388_34

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_35 = 10
				local var_388_36 = utf8.len(var_388_34)
				local var_388_37 = var_388_35 <= 0 and var_388_31 or var_388_31 * (var_388_36 / var_388_35)

				if var_388_37 > 0 and var_388_31 < var_388_37 then
					arg_385_1.talkMaxDuration = var_388_37

					if var_388_37 + var_388_30 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_37 + var_388_30
					end
				end

				arg_385_1.text_.text = var_388_34
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031092", "story_v_out_412031.awb") ~= 0 then
					local var_388_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031092", "story_v_out_412031.awb") / 1000

					if var_388_38 + var_388_30 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_38 + var_388_30
					end

					if var_388_33.prefab_name ~= "" and arg_385_1.actors_[var_388_33.prefab_name] ~= nil then
						local var_388_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_33.prefab_name].transform, "story_v_out_412031", "412031092", "story_v_out_412031.awb")

						arg_385_1:RecordAudio("412031092", var_388_39)
						arg_385_1:RecordAudio("412031092", var_388_39)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_412031", "412031092", "story_v_out_412031.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_412031", "412031092", "story_v_out_412031.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_40 = math.max(var_388_31, arg_385_1.talkMaxDuration)

			if var_388_30 <= arg_385_1.time_ and arg_385_1.time_ < var_388_30 + var_388_40 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_30) / var_388_40

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_30 + var_388_40 and arg_385_1.time_ < var_388_30 + var_388_40 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play412031093 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 412031093
		arg_389_1.duration_ = 9.533

		local var_389_0 = {
			zh = 6.133,
			ja = 9.533
		}
		local var_389_1 = manager.audio:GetLocalizationFlag()

		if var_389_0[var_389_1] ~= nil then
			arg_389_1.duration_ = var_389_0[var_389_1]
		end

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play412031094(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1097ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1097ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1097ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1097ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1097ui_story == nil then
				arg_389_1.var_.characterEffect1097ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1097ui_story then
					arg_389_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1097ui_story then
				arg_389_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_392_15 = arg_389_1.actors_["10076ui_story"].transform
			local var_392_16 = 0

			if var_392_16 < arg_389_1.time_ and arg_389_1.time_ <= var_392_16 + arg_392_0 then
				arg_389_1.var_.moveOldPos10076ui_story = var_392_15.localPosition
			end

			local var_392_17 = 0.001

			if var_392_16 <= arg_389_1.time_ and arg_389_1.time_ < var_392_16 + var_392_17 then
				local var_392_18 = (arg_389_1.time_ - var_392_16) / var_392_17
				local var_392_19 = Vector3.New(0, 100, 0)

				var_392_15.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos10076ui_story, var_392_19, var_392_18)

				local var_392_20 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_20.x, var_392_20.y, var_392_20.z)

				local var_392_21 = var_392_15.localEulerAngles

				var_392_21.z = 0
				var_392_21.x = 0
				var_392_15.localEulerAngles = var_392_21
			end

			if arg_389_1.time_ >= var_392_16 + var_392_17 and arg_389_1.time_ < var_392_16 + var_392_17 + arg_392_0 then
				var_392_15.localPosition = Vector3.New(0, 100, 0)

				local var_392_22 = manager.ui.mainCamera.transform.position - var_392_15.position

				var_392_15.forward = Vector3.New(var_392_22.x, var_392_22.y, var_392_22.z)

				local var_392_23 = var_392_15.localEulerAngles

				var_392_23.z = 0
				var_392_23.x = 0
				var_392_15.localEulerAngles = var_392_23
			end

			local var_392_24 = arg_389_1.actors_["10076ui_story"]
			local var_392_25 = 0

			if var_392_25 < arg_389_1.time_ and arg_389_1.time_ <= var_392_25 + arg_392_0 and arg_389_1.var_.characterEffect10076ui_story == nil then
				arg_389_1.var_.characterEffect10076ui_story = var_392_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_26 = 0.200000002980232

			if var_392_25 <= arg_389_1.time_ and arg_389_1.time_ < var_392_25 + var_392_26 then
				local var_392_27 = (arg_389_1.time_ - var_392_25) / var_392_26

				if arg_389_1.var_.characterEffect10076ui_story then
					local var_392_28 = Mathf.Lerp(0, 0.5, var_392_27)

					arg_389_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_389_1.var_.characterEffect10076ui_story.fillRatio = var_392_28
				end
			end

			if arg_389_1.time_ >= var_392_25 + var_392_26 and arg_389_1.time_ < var_392_25 + var_392_26 + arg_392_0 and arg_389_1.var_.characterEffect10076ui_story then
				local var_392_29 = 0.5

				arg_389_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_389_1.var_.characterEffect10076ui_story.fillRatio = var_392_29
			end

			local var_392_30 = 0
			local var_392_31 = 0.575

			if var_392_30 < arg_389_1.time_ and arg_389_1.time_ <= var_392_30 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_32 = arg_389_1:FormatText(StoryNameCfg[216].name)

				arg_389_1.leftNameTxt_.text = var_392_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_33 = arg_389_1:GetWordFromCfg(412031093)
				local var_392_34 = arg_389_1:FormatText(var_392_33.content)

				arg_389_1.text_.text = var_392_34

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_35 = 23
				local var_392_36 = utf8.len(var_392_34)
				local var_392_37 = var_392_35 <= 0 and var_392_31 or var_392_31 * (var_392_36 / var_392_35)

				if var_392_37 > 0 and var_392_31 < var_392_37 then
					arg_389_1.talkMaxDuration = var_392_37

					if var_392_37 + var_392_30 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_37 + var_392_30
					end
				end

				arg_389_1.text_.text = var_392_34
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031093", "story_v_out_412031.awb") ~= 0 then
					local var_392_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031093", "story_v_out_412031.awb") / 1000

					if var_392_38 + var_392_30 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_38 + var_392_30
					end

					if var_392_33.prefab_name ~= "" and arg_389_1.actors_[var_392_33.prefab_name] ~= nil then
						local var_392_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_33.prefab_name].transform, "story_v_out_412031", "412031093", "story_v_out_412031.awb")

						arg_389_1:RecordAudio("412031093", var_392_39)
						arg_389_1:RecordAudio("412031093", var_392_39)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_412031", "412031093", "story_v_out_412031.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_412031", "412031093", "story_v_out_412031.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_40 = math.max(var_392_31, arg_389_1.talkMaxDuration)

			if var_392_30 <= arg_389_1.time_ and arg_389_1.time_ < var_392_30 + var_392_40 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_30) / var_392_40

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_30 + var_392_40 and arg_389_1.time_ < var_392_30 + var_392_40 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play412031094 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 412031094
		arg_393_1.duration_ = 8.1

		local var_393_0 = {
			zh = 7.033,
			ja = 8.1
		}
		local var_393_1 = manager.audio:GetLocalizationFlag()

		if var_393_0[var_393_1] ~= nil then
			arg_393_1.duration_ = var_393_0[var_393_1]
		end

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play412031095(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["3043ui_story"].transform
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1.var_.moveOldPos3043ui_story = var_396_0.localPosition
			end

			local var_396_2 = 0.001

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2
				local var_396_4 = Vector3.New(0.7, -1.41, -5.7)

				var_396_0.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos3043ui_story, var_396_4, var_396_3)

				local var_396_5 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_5.x, var_396_5.y, var_396_5.z)

				local var_396_6 = var_396_0.localEulerAngles

				var_396_6.z = 0
				var_396_6.x = 0
				var_396_0.localEulerAngles = var_396_6
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 then
				var_396_0.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_396_7 = manager.ui.mainCamera.transform.position - var_396_0.position

				var_396_0.forward = Vector3.New(var_396_7.x, var_396_7.y, var_396_7.z)

				local var_396_8 = var_396_0.localEulerAngles

				var_396_8.z = 0
				var_396_8.x = 0
				var_396_0.localEulerAngles = var_396_8
			end

			local var_396_9 = arg_393_1.actors_["3043ui_story"]
			local var_396_10 = 0

			if var_396_10 < arg_393_1.time_ and arg_393_1.time_ <= var_396_10 + arg_396_0 and arg_393_1.var_.characterEffect3043ui_story == nil then
				arg_393_1.var_.characterEffect3043ui_story = var_396_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_11 = 0.200000002980232

			if var_396_10 <= arg_393_1.time_ and arg_393_1.time_ < var_396_10 + var_396_11 then
				local var_396_12 = (arg_393_1.time_ - var_396_10) / var_396_11

				if arg_393_1.var_.characterEffect3043ui_story then
					arg_393_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_10 + var_396_11 and arg_393_1.time_ < var_396_10 + var_396_11 + arg_396_0 and arg_393_1.var_.characterEffect3043ui_story then
				arg_393_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_396_13 = 0

			if var_396_13 < arg_393_1.time_ and arg_393_1.time_ <= var_396_13 + arg_396_0 then
				arg_393_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_396_14 = 0

			if var_396_14 < arg_393_1.time_ and arg_393_1.time_ <= var_396_14 + arg_396_0 then
				arg_393_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_396_15 = arg_393_1.actors_["1097ui_story"]
			local var_396_16 = 0

			if var_396_16 < arg_393_1.time_ and arg_393_1.time_ <= var_396_16 + arg_396_0 and arg_393_1.var_.characterEffect1097ui_story == nil then
				arg_393_1.var_.characterEffect1097ui_story = var_396_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_17 = 0.200000002980232

			if var_396_16 <= arg_393_1.time_ and arg_393_1.time_ < var_396_16 + var_396_17 then
				local var_396_18 = (arg_393_1.time_ - var_396_16) / var_396_17

				if arg_393_1.var_.characterEffect1097ui_story then
					local var_396_19 = Mathf.Lerp(0, 0.5, var_396_18)

					arg_393_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1097ui_story.fillRatio = var_396_19
				end
			end

			if arg_393_1.time_ >= var_396_16 + var_396_17 and arg_393_1.time_ < var_396_16 + var_396_17 + arg_396_0 and arg_393_1.var_.characterEffect1097ui_story then
				local var_396_20 = 0.5

				arg_393_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1097ui_story.fillRatio = var_396_20
			end

			local var_396_21 = 0
			local var_396_22 = 0.75

			if var_396_21 < arg_393_1.time_ and arg_393_1.time_ <= var_396_21 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_23 = arg_393_1:FormatText(StoryNameCfg[920].name)

				arg_393_1.leftNameTxt_.text = var_396_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_24 = arg_393_1:GetWordFromCfg(412031094)
				local var_396_25 = arg_393_1:FormatText(var_396_24.content)

				arg_393_1.text_.text = var_396_25

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_26 = 30
				local var_396_27 = utf8.len(var_396_25)
				local var_396_28 = var_396_26 <= 0 and var_396_22 or var_396_22 * (var_396_27 / var_396_26)

				if var_396_28 > 0 and var_396_22 < var_396_28 then
					arg_393_1.talkMaxDuration = var_396_28

					if var_396_28 + var_396_21 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_28 + var_396_21
					end
				end

				arg_393_1.text_.text = var_396_25
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031094", "story_v_out_412031.awb") ~= 0 then
					local var_396_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031094", "story_v_out_412031.awb") / 1000

					if var_396_29 + var_396_21 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_29 + var_396_21
					end

					if var_396_24.prefab_name ~= "" and arg_393_1.actors_[var_396_24.prefab_name] ~= nil then
						local var_396_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_24.prefab_name].transform, "story_v_out_412031", "412031094", "story_v_out_412031.awb")

						arg_393_1:RecordAudio("412031094", var_396_30)
						arg_393_1:RecordAudio("412031094", var_396_30)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_412031", "412031094", "story_v_out_412031.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_412031", "412031094", "story_v_out_412031.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_31 = math.max(var_396_22, arg_393_1.talkMaxDuration)

			if var_396_21 <= arg_393_1.time_ and arg_393_1.time_ < var_396_21 + var_396_31 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_21) / var_396_31

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_21 + var_396_31 and arg_393_1.time_ < var_396_21 + var_396_31 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play412031095 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 412031095
		arg_397_1.duration_ = 6.333

		local var_397_0 = {
			zh = 6.333,
			ja = 6
		}
		local var_397_1 = manager.audio:GetLocalizationFlag()

		if var_397_0[var_397_1] ~= nil then
			arg_397_1.duration_ = var_397_0[var_397_1]
		end

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play412031096(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1097ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1097ui_story == nil then
				arg_397_1.var_.characterEffect1097ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1097ui_story then
					arg_397_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1097ui_story then
				arg_397_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_400_4 = 0

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 then
				arg_397_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_400_6 = arg_397_1.actors_["3043ui_story"]
			local var_400_7 = 0

			if var_400_7 < arg_397_1.time_ and arg_397_1.time_ <= var_400_7 + arg_400_0 and arg_397_1.var_.characterEffect3043ui_story == nil then
				arg_397_1.var_.characterEffect3043ui_story = var_400_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_8 = 0.200000002980232

			if var_400_7 <= arg_397_1.time_ and arg_397_1.time_ < var_400_7 + var_400_8 then
				local var_400_9 = (arg_397_1.time_ - var_400_7) / var_400_8

				if arg_397_1.var_.characterEffect3043ui_story then
					local var_400_10 = Mathf.Lerp(0, 0.5, var_400_9)

					arg_397_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_397_1.var_.characterEffect3043ui_story.fillRatio = var_400_10
				end
			end

			if arg_397_1.time_ >= var_400_7 + var_400_8 and arg_397_1.time_ < var_400_7 + var_400_8 + arg_400_0 and arg_397_1.var_.characterEffect3043ui_story then
				local var_400_11 = 0.5

				arg_397_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_397_1.var_.characterEffect3043ui_story.fillRatio = var_400_11
			end

			local var_400_12 = 0
			local var_400_13 = 0.575

			if var_400_12 < arg_397_1.time_ and arg_397_1.time_ <= var_400_12 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_14 = arg_397_1:FormatText(StoryNameCfg[216].name)

				arg_397_1.leftNameTxt_.text = var_400_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_15 = arg_397_1:GetWordFromCfg(412031095)
				local var_400_16 = arg_397_1:FormatText(var_400_15.content)

				arg_397_1.text_.text = var_400_16

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_17 = 23
				local var_400_18 = utf8.len(var_400_16)
				local var_400_19 = var_400_17 <= 0 and var_400_13 or var_400_13 * (var_400_18 / var_400_17)

				if var_400_19 > 0 and var_400_13 < var_400_19 then
					arg_397_1.talkMaxDuration = var_400_19

					if var_400_19 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_19 + var_400_12
					end
				end

				arg_397_1.text_.text = var_400_16
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031095", "story_v_out_412031.awb") ~= 0 then
					local var_400_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031095", "story_v_out_412031.awb") / 1000

					if var_400_20 + var_400_12 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_20 + var_400_12
					end

					if var_400_15.prefab_name ~= "" and arg_397_1.actors_[var_400_15.prefab_name] ~= nil then
						local var_400_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_15.prefab_name].transform, "story_v_out_412031", "412031095", "story_v_out_412031.awb")

						arg_397_1:RecordAudio("412031095", var_400_21)
						arg_397_1:RecordAudio("412031095", var_400_21)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_412031", "412031095", "story_v_out_412031.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_412031", "412031095", "story_v_out_412031.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_22 = math.max(var_400_13, arg_397_1.talkMaxDuration)

			if var_400_12 <= arg_397_1.time_ and arg_397_1.time_ < var_400_12 + var_400_22 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_12) / var_400_22

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_12 + var_400_22 and arg_397_1.time_ < var_400_12 + var_400_22 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play412031096 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 412031096
		arg_401_1.duration_ = 9.6

		local var_401_0 = {
			zh = 9.6,
			ja = 7.6
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play412031097(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["3043ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect3043ui_story == nil then
				arg_401_1.var_.characterEffect3043ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.200000002980232

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect3043ui_story then
					arg_401_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect3043ui_story then
				arg_401_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_404_4 = 0

			if var_404_4 < arg_401_1.time_ and arg_401_1.time_ <= var_404_4 + arg_404_0 then
				arg_401_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_404_5 = 0

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_404_6 = arg_401_1.actors_["1097ui_story"]
			local var_404_7 = 0

			if var_404_7 < arg_401_1.time_ and arg_401_1.time_ <= var_404_7 + arg_404_0 and arg_401_1.var_.characterEffect1097ui_story == nil then
				arg_401_1.var_.characterEffect1097ui_story = var_404_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_8 = 0.200000002980232

			if var_404_7 <= arg_401_1.time_ and arg_401_1.time_ < var_404_7 + var_404_8 then
				local var_404_9 = (arg_401_1.time_ - var_404_7) / var_404_8

				if arg_401_1.var_.characterEffect1097ui_story then
					local var_404_10 = Mathf.Lerp(0, 0.5, var_404_9)

					arg_401_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1097ui_story.fillRatio = var_404_10
				end
			end

			if arg_401_1.time_ >= var_404_7 + var_404_8 and arg_401_1.time_ < var_404_7 + var_404_8 + arg_404_0 and arg_401_1.var_.characterEffect1097ui_story then
				local var_404_11 = 0.5

				arg_401_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1097ui_story.fillRatio = var_404_11
			end

			local var_404_12 = 0
			local var_404_13 = 0.95

			if var_404_12 < arg_401_1.time_ and arg_401_1.time_ <= var_404_12 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_14 = arg_401_1:FormatText(StoryNameCfg[920].name)

				arg_401_1.leftNameTxt_.text = var_404_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_15 = arg_401_1:GetWordFromCfg(412031096)
				local var_404_16 = arg_401_1:FormatText(var_404_15.content)

				arg_401_1.text_.text = var_404_16

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_17 = 38
				local var_404_18 = utf8.len(var_404_16)
				local var_404_19 = var_404_17 <= 0 and var_404_13 or var_404_13 * (var_404_18 / var_404_17)

				if var_404_19 > 0 and var_404_13 < var_404_19 then
					arg_401_1.talkMaxDuration = var_404_19

					if var_404_19 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_19 + var_404_12
					end
				end

				arg_401_1.text_.text = var_404_16
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031096", "story_v_out_412031.awb") ~= 0 then
					local var_404_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031096", "story_v_out_412031.awb") / 1000

					if var_404_20 + var_404_12 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_20 + var_404_12
					end

					if var_404_15.prefab_name ~= "" and arg_401_1.actors_[var_404_15.prefab_name] ~= nil then
						local var_404_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_15.prefab_name].transform, "story_v_out_412031", "412031096", "story_v_out_412031.awb")

						arg_401_1:RecordAudio("412031096", var_404_21)
						arg_401_1:RecordAudio("412031096", var_404_21)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_412031", "412031096", "story_v_out_412031.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_412031", "412031096", "story_v_out_412031.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_22 = math.max(var_404_13, arg_401_1.talkMaxDuration)

			if var_404_12 <= arg_401_1.time_ and arg_401_1.time_ < var_404_12 + var_404_22 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_12) / var_404_22

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_12 + var_404_22 and arg_401_1.time_ < var_404_12 + var_404_22 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play412031097 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 412031097
		arg_405_1.duration_ = 3.166

		local var_405_0 = {
			zh = 3.133,
			ja = 3.166
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play412031098(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1097ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1097ui_story == nil then
				arg_405_1.var_.characterEffect1097ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.200000002980232

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1097ui_story then
					arg_405_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1097ui_story then
				arg_405_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_408_4 = 0

			if var_408_4 < arg_405_1.time_ and arg_405_1.time_ <= var_408_4 + arg_408_0 then
				arg_405_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_408_5 = 0

			if var_408_5 < arg_405_1.time_ and arg_405_1.time_ <= var_408_5 + arg_408_0 then
				arg_405_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_408_6 = arg_405_1.actors_["3043ui_story"]
			local var_408_7 = 0

			if var_408_7 < arg_405_1.time_ and arg_405_1.time_ <= var_408_7 + arg_408_0 and arg_405_1.var_.characterEffect3043ui_story == nil then
				arg_405_1.var_.characterEffect3043ui_story = var_408_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_8 = 0.200000002980232

			if var_408_7 <= arg_405_1.time_ and arg_405_1.time_ < var_408_7 + var_408_8 then
				local var_408_9 = (arg_405_1.time_ - var_408_7) / var_408_8

				if arg_405_1.var_.characterEffect3043ui_story then
					local var_408_10 = Mathf.Lerp(0, 0.5, var_408_9)

					arg_405_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_405_1.var_.characterEffect3043ui_story.fillRatio = var_408_10
				end
			end

			if arg_405_1.time_ >= var_408_7 + var_408_8 and arg_405_1.time_ < var_408_7 + var_408_8 + arg_408_0 and arg_405_1.var_.characterEffect3043ui_story then
				local var_408_11 = 0.5

				arg_405_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_405_1.var_.characterEffect3043ui_story.fillRatio = var_408_11
			end

			local var_408_12 = 0
			local var_408_13 = 0.2

			if var_408_12 < arg_405_1.time_ and arg_405_1.time_ <= var_408_12 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_14 = arg_405_1:FormatText(StoryNameCfg[216].name)

				arg_405_1.leftNameTxt_.text = var_408_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_15 = arg_405_1:GetWordFromCfg(412031097)
				local var_408_16 = arg_405_1:FormatText(var_408_15.content)

				arg_405_1.text_.text = var_408_16

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_17 = 8
				local var_408_18 = utf8.len(var_408_16)
				local var_408_19 = var_408_17 <= 0 and var_408_13 or var_408_13 * (var_408_18 / var_408_17)

				if var_408_19 > 0 and var_408_13 < var_408_19 then
					arg_405_1.talkMaxDuration = var_408_19

					if var_408_19 + var_408_12 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_19 + var_408_12
					end
				end

				arg_405_1.text_.text = var_408_16
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031097", "story_v_out_412031.awb") ~= 0 then
					local var_408_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031097", "story_v_out_412031.awb") / 1000

					if var_408_20 + var_408_12 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_20 + var_408_12
					end

					if var_408_15.prefab_name ~= "" and arg_405_1.actors_[var_408_15.prefab_name] ~= nil then
						local var_408_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_15.prefab_name].transform, "story_v_out_412031", "412031097", "story_v_out_412031.awb")

						arg_405_1:RecordAudio("412031097", var_408_21)
						arg_405_1:RecordAudio("412031097", var_408_21)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_412031", "412031097", "story_v_out_412031.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_412031", "412031097", "story_v_out_412031.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_22 = math.max(var_408_13, arg_405_1.talkMaxDuration)

			if var_408_12 <= arg_405_1.time_ and arg_405_1.time_ < var_408_12 + var_408_22 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_12) / var_408_22

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_12 + var_408_22 and arg_405_1.time_ < var_408_12 + var_408_22 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play412031098 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 412031098
		arg_409_1.duration_ = 4.1

		local var_409_0 = {
			zh = 2.533,
			ja = 4.1
		}
		local var_409_1 = manager.audio:GetLocalizationFlag()

		if var_409_0[var_409_1] ~= nil then
			arg_409_1.duration_ = var_409_0[var_409_1]
		end

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play412031099(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["3043ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect3043ui_story == nil then
				arg_409_1.var_.characterEffect3043ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.200000002980232

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect3043ui_story then
					arg_409_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect3043ui_story then
				arg_409_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_412_4 = arg_409_1.actors_["1097ui_story"]
			local var_412_5 = 0

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 and arg_409_1.var_.characterEffect1097ui_story == nil then
				arg_409_1.var_.characterEffect1097ui_story = var_412_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_6 = 0.200000002980232

			if var_412_5 <= arg_409_1.time_ and arg_409_1.time_ < var_412_5 + var_412_6 then
				local var_412_7 = (arg_409_1.time_ - var_412_5) / var_412_6

				if arg_409_1.var_.characterEffect1097ui_story then
					local var_412_8 = Mathf.Lerp(0, 0.5, var_412_7)

					arg_409_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1097ui_story.fillRatio = var_412_8
				end
			end

			if arg_409_1.time_ >= var_412_5 + var_412_6 and arg_409_1.time_ < var_412_5 + var_412_6 + arg_412_0 and arg_409_1.var_.characterEffect1097ui_story then
				local var_412_9 = 0.5

				arg_409_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1097ui_story.fillRatio = var_412_9
			end

			local var_412_10 = 0
			local var_412_11 = 0.25

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_12 = arg_409_1:FormatText(StoryNameCfg[920].name)

				arg_409_1.leftNameTxt_.text = var_412_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_13 = arg_409_1:GetWordFromCfg(412031098)
				local var_412_14 = arg_409_1:FormatText(var_412_13.content)

				arg_409_1.text_.text = var_412_14

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_15 = 10
				local var_412_16 = utf8.len(var_412_14)
				local var_412_17 = var_412_15 <= 0 and var_412_11 or var_412_11 * (var_412_16 / var_412_15)

				if var_412_17 > 0 and var_412_11 < var_412_17 then
					arg_409_1.talkMaxDuration = var_412_17

					if var_412_17 + var_412_10 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_17 + var_412_10
					end
				end

				arg_409_1.text_.text = var_412_14
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031098", "story_v_out_412031.awb") ~= 0 then
					local var_412_18 = manager.audio:GetVoiceLength("story_v_out_412031", "412031098", "story_v_out_412031.awb") / 1000

					if var_412_18 + var_412_10 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_18 + var_412_10
					end

					if var_412_13.prefab_name ~= "" and arg_409_1.actors_[var_412_13.prefab_name] ~= nil then
						local var_412_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_13.prefab_name].transform, "story_v_out_412031", "412031098", "story_v_out_412031.awb")

						arg_409_1:RecordAudio("412031098", var_412_19)
						arg_409_1:RecordAudio("412031098", var_412_19)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_412031", "412031098", "story_v_out_412031.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_412031", "412031098", "story_v_out_412031.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_20 = math.max(var_412_11, arg_409_1.talkMaxDuration)

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_20 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_10) / var_412_20

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_10 + var_412_20 and arg_409_1.time_ < var_412_10 + var_412_20 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play412031099 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 412031099
		arg_413_1.duration_ = 4.533

		local var_413_0 = {
			zh = 3.233,
			ja = 4.533
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play412031100(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["3043ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect3043ui_story == nil then
				arg_413_1.var_.characterEffect3043ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect3043ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_413_1.var_.characterEffect3043ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect3043ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_413_1.var_.characterEffect3043ui_story.fillRatio = var_416_5
			end

			local var_416_6 = arg_413_1.actors_["1097ui_story"]
			local var_416_7 = 0

			if var_416_7 < arg_413_1.time_ and arg_413_1.time_ <= var_416_7 + arg_416_0 and arg_413_1.var_.characterEffect1097ui_story == nil then
				arg_413_1.var_.characterEffect1097ui_story = var_416_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_8 = 0.200000002980232

			if var_416_7 <= arg_413_1.time_ and arg_413_1.time_ < var_416_7 + var_416_8 then
				local var_416_9 = (arg_413_1.time_ - var_416_7) / var_416_8

				if arg_413_1.var_.characterEffect1097ui_story then
					arg_413_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_7 + var_416_8 and arg_413_1.time_ < var_416_7 + var_416_8 + arg_416_0 and arg_413_1.var_.characterEffect1097ui_story then
				arg_413_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_416_10 = 0
			local var_416_11 = 0.35

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_12 = arg_413_1:FormatText(StoryNameCfg[216].name)

				arg_413_1.leftNameTxt_.text = var_416_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_13 = arg_413_1:GetWordFromCfg(412031099)
				local var_416_14 = arg_413_1:FormatText(var_416_13.content)

				arg_413_1.text_.text = var_416_14

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_15 = 13
				local var_416_16 = utf8.len(var_416_14)
				local var_416_17 = var_416_15 <= 0 and var_416_11 or var_416_11 * (var_416_16 / var_416_15)

				if var_416_17 > 0 and var_416_11 < var_416_17 then
					arg_413_1.talkMaxDuration = var_416_17

					if var_416_17 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_17 + var_416_10
					end
				end

				arg_413_1.text_.text = var_416_14
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031099", "story_v_out_412031.awb") ~= 0 then
					local var_416_18 = manager.audio:GetVoiceLength("story_v_out_412031", "412031099", "story_v_out_412031.awb") / 1000

					if var_416_18 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_18 + var_416_10
					end

					if var_416_13.prefab_name ~= "" and arg_413_1.actors_[var_416_13.prefab_name] ~= nil then
						local var_416_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_13.prefab_name].transform, "story_v_out_412031", "412031099", "story_v_out_412031.awb")

						arg_413_1:RecordAudio("412031099", var_416_19)
						arg_413_1:RecordAudio("412031099", var_416_19)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_412031", "412031099", "story_v_out_412031.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_412031", "412031099", "story_v_out_412031.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_20 = math.max(var_416_11, arg_413_1.talkMaxDuration)

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_20 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_10) / var_416_20

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_10 + var_416_20 and arg_413_1.time_ < var_416_10 + var_416_20 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play412031100 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 412031100
		arg_417_1.duration_ = 1.4

		local var_417_0 = {
			zh = 1.4,
			ja = 1.3
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play412031101(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["3043ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect3043ui_story == nil then
				arg_417_1.var_.characterEffect3043ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.200000002980232

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect3043ui_story then
					arg_417_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect3043ui_story then
				arg_417_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_420_4 = arg_417_1.actors_["1097ui_story"]
			local var_420_5 = 0

			if var_420_5 < arg_417_1.time_ and arg_417_1.time_ <= var_420_5 + arg_420_0 and arg_417_1.var_.characterEffect1097ui_story == nil then
				arg_417_1.var_.characterEffect1097ui_story = var_420_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_6 = 0.200000002980232

			if var_420_5 <= arg_417_1.time_ and arg_417_1.time_ < var_420_5 + var_420_6 then
				local var_420_7 = (arg_417_1.time_ - var_420_5) / var_420_6

				if arg_417_1.var_.characterEffect1097ui_story then
					local var_420_8 = Mathf.Lerp(0, 0.5, var_420_7)

					arg_417_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1097ui_story.fillRatio = var_420_8
				end
			end

			if arg_417_1.time_ >= var_420_5 + var_420_6 and arg_417_1.time_ < var_420_5 + var_420_6 + arg_420_0 and arg_417_1.var_.characterEffect1097ui_story then
				local var_420_9 = 0.5

				arg_417_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1097ui_story.fillRatio = var_420_9
			end

			local var_420_10 = 0
			local var_420_11 = 0.1

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_12 = arg_417_1:FormatText(StoryNameCfg[920].name)

				arg_417_1.leftNameTxt_.text = var_420_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_13 = arg_417_1:GetWordFromCfg(412031100)
				local var_420_14 = arg_417_1:FormatText(var_420_13.content)

				arg_417_1.text_.text = var_420_14

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_15 = 4
				local var_420_16 = utf8.len(var_420_14)
				local var_420_17 = var_420_15 <= 0 and var_420_11 or var_420_11 * (var_420_16 / var_420_15)

				if var_420_17 > 0 and var_420_11 < var_420_17 then
					arg_417_1.talkMaxDuration = var_420_17

					if var_420_17 + var_420_10 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_17 + var_420_10
					end
				end

				arg_417_1.text_.text = var_420_14
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031100", "story_v_out_412031.awb") ~= 0 then
					local var_420_18 = manager.audio:GetVoiceLength("story_v_out_412031", "412031100", "story_v_out_412031.awb") / 1000

					if var_420_18 + var_420_10 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_18 + var_420_10
					end

					if var_420_13.prefab_name ~= "" and arg_417_1.actors_[var_420_13.prefab_name] ~= nil then
						local var_420_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_13.prefab_name].transform, "story_v_out_412031", "412031100", "story_v_out_412031.awb")

						arg_417_1:RecordAudio("412031100", var_420_19)
						arg_417_1:RecordAudio("412031100", var_420_19)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_412031", "412031100", "story_v_out_412031.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_412031", "412031100", "story_v_out_412031.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_20 = math.max(var_420_11, arg_417_1.talkMaxDuration)

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_20 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_10) / var_420_20

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_10 + var_420_20 and arg_417_1.time_ < var_420_10 + var_420_20 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play412031101 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 412031101
		arg_421_1.duration_ = 6.5

		local var_421_0 = {
			zh = 3.566,
			ja = 6.5
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play412031102(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1097ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1097ui_story == nil then
				arg_421_1.var_.characterEffect1097ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.200000002980232

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1097ui_story then
					arg_421_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1097ui_story then
				arg_421_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_424_4 = 0

			if var_424_4 < arg_421_1.time_ and arg_421_1.time_ <= var_424_4 + arg_424_0 then
				arg_421_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_424_5 = 0

			if var_424_5 < arg_421_1.time_ and arg_421_1.time_ <= var_424_5 + arg_424_0 then
				arg_421_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_424_6 = arg_421_1.actors_["3043ui_story"]
			local var_424_7 = 0

			if var_424_7 < arg_421_1.time_ and arg_421_1.time_ <= var_424_7 + arg_424_0 and arg_421_1.var_.characterEffect3043ui_story == nil then
				arg_421_1.var_.characterEffect3043ui_story = var_424_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_8 = 0.200000002980232

			if var_424_7 <= arg_421_1.time_ and arg_421_1.time_ < var_424_7 + var_424_8 then
				local var_424_9 = (arg_421_1.time_ - var_424_7) / var_424_8

				if arg_421_1.var_.characterEffect3043ui_story then
					local var_424_10 = Mathf.Lerp(0, 0.5, var_424_9)

					arg_421_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_421_1.var_.characterEffect3043ui_story.fillRatio = var_424_10
				end
			end

			if arg_421_1.time_ >= var_424_7 + var_424_8 and arg_421_1.time_ < var_424_7 + var_424_8 + arg_424_0 and arg_421_1.var_.characterEffect3043ui_story then
				local var_424_11 = 0.5

				arg_421_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_421_1.var_.characterEffect3043ui_story.fillRatio = var_424_11
			end

			local var_424_12 = 0
			local var_424_13 = 0.3

			if var_424_12 < arg_421_1.time_ and arg_421_1.time_ <= var_424_12 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_14 = arg_421_1:FormatText(StoryNameCfg[216].name)

				arg_421_1.leftNameTxt_.text = var_424_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_15 = arg_421_1:GetWordFromCfg(412031101)
				local var_424_16 = arg_421_1:FormatText(var_424_15.content)

				arg_421_1.text_.text = var_424_16

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_17 = 12
				local var_424_18 = utf8.len(var_424_16)
				local var_424_19 = var_424_17 <= 0 and var_424_13 or var_424_13 * (var_424_18 / var_424_17)

				if var_424_19 > 0 and var_424_13 < var_424_19 then
					arg_421_1.talkMaxDuration = var_424_19

					if var_424_19 + var_424_12 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_12
					end
				end

				arg_421_1.text_.text = var_424_16
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031101", "story_v_out_412031.awb") ~= 0 then
					local var_424_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031101", "story_v_out_412031.awb") / 1000

					if var_424_20 + var_424_12 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_20 + var_424_12
					end

					if var_424_15.prefab_name ~= "" and arg_421_1.actors_[var_424_15.prefab_name] ~= nil then
						local var_424_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_15.prefab_name].transform, "story_v_out_412031", "412031101", "story_v_out_412031.awb")

						arg_421_1:RecordAudio("412031101", var_424_21)
						arg_421_1:RecordAudio("412031101", var_424_21)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_412031", "412031101", "story_v_out_412031.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_412031", "412031101", "story_v_out_412031.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_22 = math.max(var_424_13, arg_421_1.talkMaxDuration)

			if var_424_12 <= arg_421_1.time_ and arg_421_1.time_ < var_424_12 + var_424_22 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_12) / var_424_22

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_12 + var_424_22 and arg_421_1.time_ < var_424_12 + var_424_22 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play412031102 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 412031102
		arg_425_1.duration_ = 2.933

		local var_425_0 = {
			zh = 1.999999999999,
			ja = 2.933
		}
		local var_425_1 = manager.audio:GetLocalizationFlag()

		if var_425_0[var_425_1] ~= nil then
			arg_425_1.duration_ = var_425_0[var_425_1]
		end

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play412031103(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["3043ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect3043ui_story == nil then
				arg_425_1.var_.characterEffect3043ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.200000002980232

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect3043ui_story then
					arg_425_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect3043ui_story then
				arg_425_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_428_4 = 0

			if var_428_4 < arg_425_1.time_ and arg_425_1.time_ <= var_428_4 + arg_428_0 then
				arg_425_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_428_5 = 0

			if var_428_5 < arg_425_1.time_ and arg_425_1.time_ <= var_428_5 + arg_428_0 then
				arg_425_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_428_6 = arg_425_1.actors_["1097ui_story"]
			local var_428_7 = 0

			if var_428_7 < arg_425_1.time_ and arg_425_1.time_ <= var_428_7 + arg_428_0 and arg_425_1.var_.characterEffect1097ui_story == nil then
				arg_425_1.var_.characterEffect1097ui_story = var_428_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_8 = 0.200000002980232

			if var_428_7 <= arg_425_1.time_ and arg_425_1.time_ < var_428_7 + var_428_8 then
				local var_428_9 = (arg_425_1.time_ - var_428_7) / var_428_8

				if arg_425_1.var_.characterEffect1097ui_story then
					local var_428_10 = Mathf.Lerp(0, 0.5, var_428_9)

					arg_425_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1097ui_story.fillRatio = var_428_10
				end
			end

			if arg_425_1.time_ >= var_428_7 + var_428_8 and arg_425_1.time_ < var_428_7 + var_428_8 + arg_428_0 and arg_425_1.var_.characterEffect1097ui_story then
				local var_428_11 = 0.5

				arg_425_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1097ui_story.fillRatio = var_428_11
			end

			local var_428_12 = 0
			local var_428_13 = 0.125

			if var_428_12 < arg_425_1.time_ and arg_425_1.time_ <= var_428_12 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_14 = arg_425_1:FormatText(StoryNameCfg[920].name)

				arg_425_1.leftNameTxt_.text = var_428_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_15 = arg_425_1:GetWordFromCfg(412031102)
				local var_428_16 = arg_425_1:FormatText(var_428_15.content)

				arg_425_1.text_.text = var_428_16

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_17 = 5
				local var_428_18 = utf8.len(var_428_16)
				local var_428_19 = var_428_17 <= 0 and var_428_13 or var_428_13 * (var_428_18 / var_428_17)

				if var_428_19 > 0 and var_428_13 < var_428_19 then
					arg_425_1.talkMaxDuration = var_428_19

					if var_428_19 + var_428_12 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_19 + var_428_12
					end
				end

				arg_425_1.text_.text = var_428_16
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031102", "story_v_out_412031.awb") ~= 0 then
					local var_428_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031102", "story_v_out_412031.awb") / 1000

					if var_428_20 + var_428_12 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_20 + var_428_12
					end

					if var_428_15.prefab_name ~= "" and arg_425_1.actors_[var_428_15.prefab_name] ~= nil then
						local var_428_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_15.prefab_name].transform, "story_v_out_412031", "412031102", "story_v_out_412031.awb")

						arg_425_1:RecordAudio("412031102", var_428_21)
						arg_425_1:RecordAudio("412031102", var_428_21)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_412031", "412031102", "story_v_out_412031.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_412031", "412031102", "story_v_out_412031.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_22 = math.max(var_428_13, arg_425_1.talkMaxDuration)

			if var_428_12 <= arg_425_1.time_ and arg_425_1.time_ < var_428_12 + var_428_22 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_12) / var_428_22

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_12 + var_428_22 and arg_425_1.time_ < var_428_12 + var_428_22 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play412031103 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 412031103
		arg_429_1.duration_ = 4.133

		local var_429_0 = {
			zh = 4.133,
			ja = 1.999999999999
		}
		local var_429_1 = manager.audio:GetLocalizationFlag()

		if var_429_0[var_429_1] ~= nil then
			arg_429_1.duration_ = var_429_0[var_429_1]
		end

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play412031104(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1097ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1097ui_story == nil then
				arg_429_1.var_.characterEffect1097ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.200000002980232

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1097ui_story then
					arg_429_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1097ui_story then
				arg_429_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_432_4 = 0

			if var_432_4 < arg_429_1.time_ and arg_429_1.time_ <= var_432_4 + arg_432_0 then
				arg_429_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 then
				arg_429_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_432_6 = arg_429_1.actors_["3043ui_story"]
			local var_432_7 = 0

			if var_432_7 < arg_429_1.time_ and arg_429_1.time_ <= var_432_7 + arg_432_0 and arg_429_1.var_.characterEffect3043ui_story == nil then
				arg_429_1.var_.characterEffect3043ui_story = var_432_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_8 = 0.200000002980232

			if var_432_7 <= arg_429_1.time_ and arg_429_1.time_ < var_432_7 + var_432_8 then
				local var_432_9 = (arg_429_1.time_ - var_432_7) / var_432_8

				if arg_429_1.var_.characterEffect3043ui_story then
					local var_432_10 = Mathf.Lerp(0, 0.5, var_432_9)

					arg_429_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_429_1.var_.characterEffect3043ui_story.fillRatio = var_432_10
				end
			end

			if arg_429_1.time_ >= var_432_7 + var_432_8 and arg_429_1.time_ < var_432_7 + var_432_8 + arg_432_0 and arg_429_1.var_.characterEffect3043ui_story then
				local var_432_11 = 0.5

				arg_429_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_429_1.var_.characterEffect3043ui_story.fillRatio = var_432_11
			end

			local var_432_12 = 0
			local var_432_13 = 0.325

			if var_432_12 < arg_429_1.time_ and arg_429_1.time_ <= var_432_12 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_14 = arg_429_1:FormatText(StoryNameCfg[216].name)

				arg_429_1.leftNameTxt_.text = var_432_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_15 = arg_429_1:GetWordFromCfg(412031103)
				local var_432_16 = arg_429_1:FormatText(var_432_15.content)

				arg_429_1.text_.text = var_432_16

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_17 = 13
				local var_432_18 = utf8.len(var_432_16)
				local var_432_19 = var_432_17 <= 0 and var_432_13 or var_432_13 * (var_432_18 / var_432_17)

				if var_432_19 > 0 and var_432_13 < var_432_19 then
					arg_429_1.talkMaxDuration = var_432_19

					if var_432_19 + var_432_12 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_19 + var_432_12
					end
				end

				arg_429_1.text_.text = var_432_16
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031103", "story_v_out_412031.awb") ~= 0 then
					local var_432_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031103", "story_v_out_412031.awb") / 1000

					if var_432_20 + var_432_12 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_20 + var_432_12
					end

					if var_432_15.prefab_name ~= "" and arg_429_1.actors_[var_432_15.prefab_name] ~= nil then
						local var_432_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_15.prefab_name].transform, "story_v_out_412031", "412031103", "story_v_out_412031.awb")

						arg_429_1:RecordAudio("412031103", var_432_21)
						arg_429_1:RecordAudio("412031103", var_432_21)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_412031", "412031103", "story_v_out_412031.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_412031", "412031103", "story_v_out_412031.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_22 = math.max(var_432_13, arg_429_1.talkMaxDuration)

			if var_432_12 <= arg_429_1.time_ and arg_429_1.time_ < var_432_12 + var_432_22 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_12) / var_432_22

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_12 + var_432_22 and arg_429_1.time_ < var_432_12 + var_432_22 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play412031104 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 412031104
		arg_433_1.duration_ = 5

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play412031105(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1097ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1097ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(0, 100, 0)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1097ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(0, 100, 0)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = arg_433_1.actors_["1097ui_story"]
			local var_436_10 = 0

			if var_436_10 < arg_433_1.time_ and arg_433_1.time_ <= var_436_10 + arg_436_0 and arg_433_1.var_.characterEffect1097ui_story == nil then
				arg_433_1.var_.characterEffect1097ui_story = var_436_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_11 = 0.034000001847744

			if var_436_10 <= arg_433_1.time_ and arg_433_1.time_ < var_436_10 + var_436_11 then
				local var_436_12 = (arg_433_1.time_ - var_436_10) / var_436_11

				if arg_433_1.var_.characterEffect1097ui_story then
					local var_436_13 = Mathf.Lerp(0, 0.5, var_436_12)

					arg_433_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1097ui_story.fillRatio = var_436_13
				end
			end

			if arg_433_1.time_ >= var_436_10 + var_436_11 and arg_433_1.time_ < var_436_10 + var_436_11 + arg_436_0 and arg_433_1.var_.characterEffect1097ui_story then
				local var_436_14 = 0.5

				arg_433_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1097ui_story.fillRatio = var_436_14
			end

			local var_436_15 = arg_433_1.actors_["3043ui_story"].transform
			local var_436_16 = 0

			if var_436_16 < arg_433_1.time_ and arg_433_1.time_ <= var_436_16 + arg_436_0 then
				arg_433_1.var_.moveOldPos3043ui_story = var_436_15.localPosition
			end

			local var_436_17 = 0.001

			if var_436_16 <= arg_433_1.time_ and arg_433_1.time_ < var_436_16 + var_436_17 then
				local var_436_18 = (arg_433_1.time_ - var_436_16) / var_436_17
				local var_436_19 = Vector3.New(0, 100, 0)

				var_436_15.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos3043ui_story, var_436_19, var_436_18)

				local var_436_20 = manager.ui.mainCamera.transform.position - var_436_15.position

				var_436_15.forward = Vector3.New(var_436_20.x, var_436_20.y, var_436_20.z)

				local var_436_21 = var_436_15.localEulerAngles

				var_436_21.z = 0
				var_436_21.x = 0
				var_436_15.localEulerAngles = var_436_21
			end

			if arg_433_1.time_ >= var_436_16 + var_436_17 and arg_433_1.time_ < var_436_16 + var_436_17 + arg_436_0 then
				var_436_15.localPosition = Vector3.New(0, 100, 0)

				local var_436_22 = manager.ui.mainCamera.transform.position - var_436_15.position

				var_436_15.forward = Vector3.New(var_436_22.x, var_436_22.y, var_436_22.z)

				local var_436_23 = var_436_15.localEulerAngles

				var_436_23.z = 0
				var_436_23.x = 0
				var_436_15.localEulerAngles = var_436_23
			end

			local var_436_24 = arg_433_1.actors_["3043ui_story"]
			local var_436_25 = 0

			if var_436_25 < arg_433_1.time_ and arg_433_1.time_ <= var_436_25 + arg_436_0 and arg_433_1.var_.characterEffect3043ui_story == nil then
				arg_433_1.var_.characterEffect3043ui_story = var_436_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_26 = 0.034000001847744

			if var_436_25 <= arg_433_1.time_ and arg_433_1.time_ < var_436_25 + var_436_26 then
				local var_436_27 = (arg_433_1.time_ - var_436_25) / var_436_26

				if arg_433_1.var_.characterEffect3043ui_story then
					local var_436_28 = Mathf.Lerp(0, 0.5, var_436_27)

					arg_433_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_433_1.var_.characterEffect3043ui_story.fillRatio = var_436_28
				end
			end

			if arg_433_1.time_ >= var_436_25 + var_436_26 and arg_433_1.time_ < var_436_25 + var_436_26 + arg_436_0 and arg_433_1.var_.characterEffect3043ui_story then
				local var_436_29 = 0.5

				arg_433_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_433_1.var_.characterEffect3043ui_story.fillRatio = var_436_29
			end

			local var_436_30 = 0
			local var_436_31 = 0.15

			if var_436_30 < arg_433_1.time_ and arg_433_1.time_ <= var_436_30 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, false)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_32 = arg_433_1:GetWordFromCfg(412031104)
				local var_436_33 = arg_433_1:FormatText(var_436_32.content)

				arg_433_1.text_.text = var_436_33

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_34 = 6
				local var_436_35 = utf8.len(var_436_33)
				local var_436_36 = var_436_34 <= 0 and var_436_31 or var_436_31 * (var_436_35 / var_436_34)

				if var_436_36 > 0 and var_436_31 < var_436_36 then
					arg_433_1.talkMaxDuration = var_436_36

					if var_436_36 + var_436_30 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_36 + var_436_30
					end
				end

				arg_433_1.text_.text = var_436_33
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_37 = math.max(var_436_31, arg_433_1.talkMaxDuration)

			if var_436_30 <= arg_433_1.time_ and arg_433_1.time_ < var_436_30 + var_436_37 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_30) / var_436_37

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_30 + var_436_37 and arg_433_1.time_ < var_436_30 + var_436_37 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play412031105 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 412031105
		arg_437_1.duration_ = 1.999999999999

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play412031106(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1097ui_story"].transform
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 then
				arg_437_1.var_.moveOldPos1097ui_story = var_440_0.localPosition
			end

			local var_440_2 = 0.001

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2
				local var_440_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_440_0.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos1097ui_story, var_440_4, var_440_3)

				local var_440_5 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_5.x, var_440_5.y, var_440_5.z)

				local var_440_6 = var_440_0.localEulerAngles

				var_440_6.z = 0
				var_440_6.x = 0
				var_440_0.localEulerAngles = var_440_6
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 then
				var_440_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_440_7 = manager.ui.mainCamera.transform.position - var_440_0.position

				var_440_0.forward = Vector3.New(var_440_7.x, var_440_7.y, var_440_7.z)

				local var_440_8 = var_440_0.localEulerAngles

				var_440_8.z = 0
				var_440_8.x = 0
				var_440_0.localEulerAngles = var_440_8
			end

			local var_440_9 = arg_437_1.actors_["1097ui_story"]
			local var_440_10 = 0

			if var_440_10 < arg_437_1.time_ and arg_437_1.time_ <= var_440_10 + arg_440_0 and arg_437_1.var_.characterEffect1097ui_story == nil then
				arg_437_1.var_.characterEffect1097ui_story = var_440_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_11 = 0.200000002980232

			if var_440_10 <= arg_437_1.time_ and arg_437_1.time_ < var_440_10 + var_440_11 then
				local var_440_12 = (arg_437_1.time_ - var_440_10) / var_440_11

				if arg_437_1.var_.characterEffect1097ui_story then
					arg_437_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_10 + var_440_11 and arg_437_1.time_ < var_440_10 + var_440_11 + arg_440_0 and arg_437_1.var_.characterEffect1097ui_story then
				arg_437_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_440_13 = 0

			if var_440_13 < arg_437_1.time_ and arg_437_1.time_ <= var_440_13 + arg_440_0 then
				arg_437_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_440_14 = 0

			if var_440_14 < arg_437_1.time_ and arg_437_1.time_ <= var_440_14 + arg_440_0 then
				arg_437_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_440_15 = 0
			local var_440_16 = 0.1

			if var_440_15 < arg_437_1.time_ and arg_437_1.time_ <= var_440_15 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_17 = arg_437_1:FormatText(StoryNameCfg[216].name)

				arg_437_1.leftNameTxt_.text = var_440_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_18 = arg_437_1:GetWordFromCfg(412031105)
				local var_440_19 = arg_437_1:FormatText(var_440_18.content)

				arg_437_1.text_.text = var_440_19

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_20 = 4
				local var_440_21 = utf8.len(var_440_19)
				local var_440_22 = var_440_20 <= 0 and var_440_16 or var_440_16 * (var_440_21 / var_440_20)

				if var_440_22 > 0 and var_440_16 < var_440_22 then
					arg_437_1.talkMaxDuration = var_440_22

					if var_440_22 + var_440_15 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_22 + var_440_15
					end
				end

				arg_437_1.text_.text = var_440_19
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031105", "story_v_out_412031.awb") ~= 0 then
					local var_440_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031105", "story_v_out_412031.awb") / 1000

					if var_440_23 + var_440_15 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_23 + var_440_15
					end

					if var_440_18.prefab_name ~= "" and arg_437_1.actors_[var_440_18.prefab_name] ~= nil then
						local var_440_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_18.prefab_name].transform, "story_v_out_412031", "412031105", "story_v_out_412031.awb")

						arg_437_1:RecordAudio("412031105", var_440_24)
						arg_437_1:RecordAudio("412031105", var_440_24)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_412031", "412031105", "story_v_out_412031.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_412031", "412031105", "story_v_out_412031.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_25 = math.max(var_440_16, arg_437_1.talkMaxDuration)

			if var_440_15 <= arg_437_1.time_ and arg_437_1.time_ < var_440_15 + var_440_25 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_15) / var_440_25

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_15 + var_440_25 and arg_437_1.time_ < var_440_15 + var_440_25 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play412031106 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 412031106
		arg_441_1.duration_ = 6.5

		local var_441_0 = {
			zh = 5.966,
			ja = 6.5
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play412031107(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["3043ui_story"].transform
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1.var_.moveOldPos3043ui_story = var_444_0.localPosition
			end

			local var_444_2 = 0.001

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2
				local var_444_4 = Vector3.New(0.7, -1.41, -5.7)

				var_444_0.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos3043ui_story, var_444_4, var_444_3)

				local var_444_5 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_5.x, var_444_5.y, var_444_5.z)

				local var_444_6 = var_444_0.localEulerAngles

				var_444_6.z = 0
				var_444_6.x = 0
				var_444_0.localEulerAngles = var_444_6
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 then
				var_444_0.localPosition = Vector3.New(0.7, -1.41, -5.7)

				local var_444_7 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_7.x, var_444_7.y, var_444_7.z)

				local var_444_8 = var_444_0.localEulerAngles

				var_444_8.z = 0
				var_444_8.x = 0
				var_444_0.localEulerAngles = var_444_8
			end

			local var_444_9 = arg_441_1.actors_["3043ui_story"]
			local var_444_10 = 0

			if var_444_10 < arg_441_1.time_ and arg_441_1.time_ <= var_444_10 + arg_444_0 and arg_441_1.var_.characterEffect3043ui_story == nil then
				arg_441_1.var_.characterEffect3043ui_story = var_444_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_11 = 0.200000002980232

			if var_444_10 <= arg_441_1.time_ and arg_441_1.time_ < var_444_10 + var_444_11 then
				local var_444_12 = (arg_441_1.time_ - var_444_10) / var_444_11

				if arg_441_1.var_.characterEffect3043ui_story then
					arg_441_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_10 + var_444_11 and arg_441_1.time_ < var_444_10 + var_444_11 + arg_444_0 and arg_441_1.var_.characterEffect3043ui_story then
				arg_441_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_444_13 = 0

			if var_444_13 < arg_441_1.time_ and arg_441_1.time_ <= var_444_13 + arg_444_0 then
				arg_441_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_444_14 = 0

			if var_444_14 < arg_441_1.time_ and arg_441_1.time_ <= var_444_14 + arg_444_0 then
				arg_441_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_444_15 = arg_441_1.actors_["1097ui_story"]
			local var_444_16 = 0

			if var_444_16 < arg_441_1.time_ and arg_441_1.time_ <= var_444_16 + arg_444_0 and arg_441_1.var_.characterEffect1097ui_story == nil then
				arg_441_1.var_.characterEffect1097ui_story = var_444_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_17 = 0.200000002980232

			if var_444_16 <= arg_441_1.time_ and arg_441_1.time_ < var_444_16 + var_444_17 then
				local var_444_18 = (arg_441_1.time_ - var_444_16) / var_444_17

				if arg_441_1.var_.characterEffect1097ui_story then
					local var_444_19 = Mathf.Lerp(0, 0.5, var_444_18)

					arg_441_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1097ui_story.fillRatio = var_444_19
				end
			end

			if arg_441_1.time_ >= var_444_16 + var_444_17 and arg_441_1.time_ < var_444_16 + var_444_17 + arg_444_0 and arg_441_1.var_.characterEffect1097ui_story then
				local var_444_20 = 0.5

				arg_441_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1097ui_story.fillRatio = var_444_20
			end

			local var_444_21 = 0
			local var_444_22 = 0.625

			if var_444_21 < arg_441_1.time_ and arg_441_1.time_ <= var_444_21 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_23 = arg_441_1:FormatText(StoryNameCfg[920].name)

				arg_441_1.leftNameTxt_.text = var_444_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_24 = arg_441_1:GetWordFromCfg(412031106)
				local var_444_25 = arg_441_1:FormatText(var_444_24.content)

				arg_441_1.text_.text = var_444_25

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_26 = 25
				local var_444_27 = utf8.len(var_444_25)
				local var_444_28 = var_444_26 <= 0 and var_444_22 or var_444_22 * (var_444_27 / var_444_26)

				if var_444_28 > 0 and var_444_22 < var_444_28 then
					arg_441_1.talkMaxDuration = var_444_28

					if var_444_28 + var_444_21 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_28 + var_444_21
					end
				end

				arg_441_1.text_.text = var_444_25
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031106", "story_v_out_412031.awb") ~= 0 then
					local var_444_29 = manager.audio:GetVoiceLength("story_v_out_412031", "412031106", "story_v_out_412031.awb") / 1000

					if var_444_29 + var_444_21 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_29 + var_444_21
					end

					if var_444_24.prefab_name ~= "" and arg_441_1.actors_[var_444_24.prefab_name] ~= nil then
						local var_444_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_24.prefab_name].transform, "story_v_out_412031", "412031106", "story_v_out_412031.awb")

						arg_441_1:RecordAudio("412031106", var_444_30)
						arg_441_1:RecordAudio("412031106", var_444_30)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_412031", "412031106", "story_v_out_412031.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_412031", "412031106", "story_v_out_412031.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_31 = math.max(var_444_22, arg_441_1.talkMaxDuration)

			if var_444_21 <= arg_441_1.time_ and arg_441_1.time_ < var_444_21 + var_444_31 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_21) / var_444_31

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_21 + var_444_31 and arg_441_1.time_ < var_444_21 + var_444_31 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play412031107 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 412031107
		arg_445_1.duration_ = 8.6

		local var_445_0 = {
			zh = 8.6,
			ja = 8.4
		}
		local var_445_1 = manager.audio:GetLocalizationFlag()

		if var_445_0[var_445_1] ~= nil then
			arg_445_1.duration_ = var_445_0[var_445_1]
		end

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play412031108(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.8

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[920].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(412031107)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 32
				local var_448_6 = utf8.len(var_448_4)
				local var_448_7 = var_448_5 <= 0 and var_448_1 or var_448_1 * (var_448_6 / var_448_5)

				if var_448_7 > 0 and var_448_1 < var_448_7 then
					arg_445_1.talkMaxDuration = var_448_7

					if var_448_7 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_7 + var_448_0
					end
				end

				arg_445_1.text_.text = var_448_4
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031107", "story_v_out_412031.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031107", "story_v_out_412031.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_out_412031", "412031107", "story_v_out_412031.awb")

						arg_445_1:RecordAudio("412031107", var_448_9)
						arg_445_1:RecordAudio("412031107", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_412031", "412031107", "story_v_out_412031.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_412031", "412031107", "story_v_out_412031.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_10 = math.max(var_448_1, arg_445_1.talkMaxDuration)

			if var_448_0 <= arg_445_1.time_ and arg_445_1.time_ < var_448_0 + var_448_10 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_0) / var_448_10

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_0 + var_448_10 and arg_445_1.time_ < var_448_0 + var_448_10 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play412031108 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 412031108
		arg_449_1.duration_ = 12.666

		local var_449_0 = {
			zh = 12.666,
			ja = 7.466
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play412031109(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 1.2

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[920].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(412031108)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 48
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031108", "story_v_out_412031.awb") ~= 0 then
					local var_452_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031108", "story_v_out_412031.awb") / 1000

					if var_452_8 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_8 + var_452_0
					end

					if var_452_3.prefab_name ~= "" and arg_449_1.actors_[var_452_3.prefab_name] ~= nil then
						local var_452_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_3.prefab_name].transform, "story_v_out_412031", "412031108", "story_v_out_412031.awb")

						arg_449_1:RecordAudio("412031108", var_452_9)
						arg_449_1:RecordAudio("412031108", var_452_9)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_412031", "412031108", "story_v_out_412031.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_412031", "412031108", "story_v_out_412031.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_10 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_10 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_10

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_10 and arg_449_1.time_ < var_452_0 + var_452_10 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play412031109 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 412031109
		arg_453_1.duration_ = 7.433

		local var_453_0 = {
			zh = 7.333,
			ja = 7.433
		}
		local var_453_1 = manager.audio:GetLocalizationFlag()

		if var_453_0[var_453_1] ~= nil then
			arg_453_1.duration_ = var_453_0[var_453_1]
		end

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play412031110(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1097ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect1097ui_story == nil then
				arg_453_1.var_.characterEffect1097ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect1097ui_story then
					arg_453_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect1097ui_story then
				arg_453_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_456_4 = 0

			if var_456_4 < arg_453_1.time_ and arg_453_1.time_ <= var_456_4 + arg_456_0 then
				arg_453_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_456_5 = 0

			if var_456_5 < arg_453_1.time_ and arg_453_1.time_ <= var_456_5 + arg_456_0 then
				arg_453_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_456_6 = arg_453_1.actors_["3043ui_story"]
			local var_456_7 = 0

			if var_456_7 < arg_453_1.time_ and arg_453_1.time_ <= var_456_7 + arg_456_0 and arg_453_1.var_.characterEffect3043ui_story == nil then
				arg_453_1.var_.characterEffect3043ui_story = var_456_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_8 = 0.200000002980232

			if var_456_7 <= arg_453_1.time_ and arg_453_1.time_ < var_456_7 + var_456_8 then
				local var_456_9 = (arg_453_1.time_ - var_456_7) / var_456_8

				if arg_453_1.var_.characterEffect3043ui_story then
					local var_456_10 = Mathf.Lerp(0, 0.5, var_456_9)

					arg_453_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_453_1.var_.characterEffect3043ui_story.fillRatio = var_456_10
				end
			end

			if arg_453_1.time_ >= var_456_7 + var_456_8 and arg_453_1.time_ < var_456_7 + var_456_8 + arg_456_0 and arg_453_1.var_.characterEffect3043ui_story then
				local var_456_11 = 0.5

				arg_453_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_453_1.var_.characterEffect3043ui_story.fillRatio = var_456_11
			end

			local var_456_12 = 0
			local var_456_13 = 0.675

			if var_456_12 < arg_453_1.time_ and arg_453_1.time_ <= var_456_12 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_14 = arg_453_1:FormatText(StoryNameCfg[216].name)

				arg_453_1.leftNameTxt_.text = var_456_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_15 = arg_453_1:GetWordFromCfg(412031109)
				local var_456_16 = arg_453_1:FormatText(var_456_15.content)

				arg_453_1.text_.text = var_456_16

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_17 = 27
				local var_456_18 = utf8.len(var_456_16)
				local var_456_19 = var_456_17 <= 0 and var_456_13 or var_456_13 * (var_456_18 / var_456_17)

				if var_456_19 > 0 and var_456_13 < var_456_19 then
					arg_453_1.talkMaxDuration = var_456_19

					if var_456_19 + var_456_12 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_19 + var_456_12
					end
				end

				arg_453_1.text_.text = var_456_16
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031109", "story_v_out_412031.awb") ~= 0 then
					local var_456_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031109", "story_v_out_412031.awb") / 1000

					if var_456_20 + var_456_12 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_20 + var_456_12
					end

					if var_456_15.prefab_name ~= "" and arg_453_1.actors_[var_456_15.prefab_name] ~= nil then
						local var_456_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_15.prefab_name].transform, "story_v_out_412031", "412031109", "story_v_out_412031.awb")

						arg_453_1:RecordAudio("412031109", var_456_21)
						arg_453_1:RecordAudio("412031109", var_456_21)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_412031", "412031109", "story_v_out_412031.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_412031", "412031109", "story_v_out_412031.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_22 = math.max(var_456_13, arg_453_1.talkMaxDuration)

			if var_456_12 <= arg_453_1.time_ and arg_453_1.time_ < var_456_12 + var_456_22 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_12) / var_456_22

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_12 + var_456_22 and arg_453_1.time_ < var_456_12 + var_456_22 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play412031110 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 412031110
		arg_457_1.duration_ = 10.233

		local var_457_0 = {
			zh = 10.233,
			ja = 6.3
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play412031111(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.95

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[216].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(412031110)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 38
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031110", "story_v_out_412031.awb") ~= 0 then
					local var_460_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031110", "story_v_out_412031.awb") / 1000

					if var_460_8 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_8 + var_460_0
					end

					if var_460_3.prefab_name ~= "" and arg_457_1.actors_[var_460_3.prefab_name] ~= nil then
						local var_460_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_3.prefab_name].transform, "story_v_out_412031", "412031110", "story_v_out_412031.awb")

						arg_457_1:RecordAudio("412031110", var_460_9)
						arg_457_1:RecordAudio("412031110", var_460_9)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_412031", "412031110", "story_v_out_412031.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_412031", "412031110", "story_v_out_412031.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_10 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_10 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_10

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_10 and arg_457_1.time_ < var_460_0 + var_460_10 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play412031111 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 412031111
		arg_461_1.duration_ = 8.6

		local var_461_0 = {
			zh = 8.6,
			ja = 4.166
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play412031112(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.85

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[216].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(412031111)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 34
				local var_464_6 = utf8.len(var_464_4)
				local var_464_7 = var_464_5 <= 0 and var_464_1 or var_464_1 * (var_464_6 / var_464_5)

				if var_464_7 > 0 and var_464_1 < var_464_7 then
					arg_461_1.talkMaxDuration = var_464_7

					if var_464_7 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_7 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_4
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031111", "story_v_out_412031.awb") ~= 0 then
					local var_464_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031111", "story_v_out_412031.awb") / 1000

					if var_464_8 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_8 + var_464_0
					end

					if var_464_3.prefab_name ~= "" and arg_461_1.actors_[var_464_3.prefab_name] ~= nil then
						local var_464_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_3.prefab_name].transform, "story_v_out_412031", "412031111", "story_v_out_412031.awb")

						arg_461_1:RecordAudio("412031111", var_464_9)
						arg_461_1:RecordAudio("412031111", var_464_9)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_412031", "412031111", "story_v_out_412031.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_412031", "412031111", "story_v_out_412031.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_10 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_10 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_10

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_10 and arg_461_1.time_ < var_464_0 + var_464_10 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play412031112 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 412031112
		arg_465_1.duration_ = 8.3

		local var_465_0 = {
			zh = 8.3,
			ja = 4.9
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play412031113(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["3043ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect3043ui_story == nil then
				arg_465_1.var_.characterEffect3043ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect3043ui_story then
					arg_465_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect3043ui_story then
				arg_465_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_468_4 = 0

			if var_468_4 < arg_465_1.time_ and arg_465_1.time_ <= var_468_4 + arg_468_0 then
				arg_465_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action2_1")
			end

			local var_468_5 = 0

			if var_468_5 < arg_465_1.time_ and arg_465_1.time_ <= var_468_5 + arg_468_0 then
				arg_465_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_468_6 = arg_465_1.actors_["1097ui_story"]
			local var_468_7 = 0

			if var_468_7 < arg_465_1.time_ and arg_465_1.time_ <= var_468_7 + arg_468_0 and arg_465_1.var_.characterEffect1097ui_story == nil then
				arg_465_1.var_.characterEffect1097ui_story = var_468_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_8 = 0.200000002980232

			if var_468_7 <= arg_465_1.time_ and arg_465_1.time_ < var_468_7 + var_468_8 then
				local var_468_9 = (arg_465_1.time_ - var_468_7) / var_468_8

				if arg_465_1.var_.characterEffect1097ui_story then
					local var_468_10 = Mathf.Lerp(0, 0.5, var_468_9)

					arg_465_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1097ui_story.fillRatio = var_468_10
				end
			end

			if arg_465_1.time_ >= var_468_7 + var_468_8 and arg_465_1.time_ < var_468_7 + var_468_8 + arg_468_0 and arg_465_1.var_.characterEffect1097ui_story then
				local var_468_11 = 0.5

				arg_465_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1097ui_story.fillRatio = var_468_11
			end

			local var_468_12 = 0
			local var_468_13 = 0.7

			if var_468_12 < arg_465_1.time_ and arg_465_1.time_ <= var_468_12 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_14 = arg_465_1:FormatText(StoryNameCfg[920].name)

				arg_465_1.leftNameTxt_.text = var_468_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_15 = arg_465_1:GetWordFromCfg(412031112)
				local var_468_16 = arg_465_1:FormatText(var_468_15.content)

				arg_465_1.text_.text = var_468_16

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_17 = 28
				local var_468_18 = utf8.len(var_468_16)
				local var_468_19 = var_468_17 <= 0 and var_468_13 or var_468_13 * (var_468_18 / var_468_17)

				if var_468_19 > 0 and var_468_13 < var_468_19 then
					arg_465_1.talkMaxDuration = var_468_19

					if var_468_19 + var_468_12 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_19 + var_468_12
					end
				end

				arg_465_1.text_.text = var_468_16
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031112", "story_v_out_412031.awb") ~= 0 then
					local var_468_20 = manager.audio:GetVoiceLength("story_v_out_412031", "412031112", "story_v_out_412031.awb") / 1000

					if var_468_20 + var_468_12 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_20 + var_468_12
					end

					if var_468_15.prefab_name ~= "" and arg_465_1.actors_[var_468_15.prefab_name] ~= nil then
						local var_468_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_15.prefab_name].transform, "story_v_out_412031", "412031112", "story_v_out_412031.awb")

						arg_465_1:RecordAudio("412031112", var_468_21)
						arg_465_1:RecordAudio("412031112", var_468_21)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_412031", "412031112", "story_v_out_412031.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_412031", "412031112", "story_v_out_412031.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_22 = math.max(var_468_13, arg_465_1.talkMaxDuration)

			if var_468_12 <= arg_465_1.time_ and arg_465_1.time_ < var_468_12 + var_468_22 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_12) / var_468_22

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_12 + var_468_22 and arg_465_1.time_ < var_468_12 + var_468_22 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play412031113 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 412031113
		arg_469_1.duration_ = 4.566

		local var_469_0 = {
			zh = 4.566,
			ja = 3.5
		}
		local var_469_1 = manager.audio:GetLocalizationFlag()

		if var_469_0[var_469_1] ~= nil then
			arg_469_1.duration_ = var_469_0[var_469_1]
		end

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play412031114(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["10076ui_story"].transform
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 then
				arg_469_1.var_.moveOldPos10076ui_story = var_472_0.localPosition
			end

			local var_472_2 = 0.001

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2
				local var_472_4 = Vector3.New(0, -0.35, -4)

				var_472_0.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos10076ui_story, var_472_4, var_472_3)

				local var_472_5 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_5.x, var_472_5.y, var_472_5.z)

				local var_472_6 = var_472_0.localEulerAngles

				var_472_6.z = 0
				var_472_6.x = 0
				var_472_0.localEulerAngles = var_472_6
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 then
				var_472_0.localPosition = Vector3.New(0, -0.35, -4)

				local var_472_7 = manager.ui.mainCamera.transform.position - var_472_0.position

				var_472_0.forward = Vector3.New(var_472_7.x, var_472_7.y, var_472_7.z)

				local var_472_8 = var_472_0.localEulerAngles

				var_472_8.z = 0
				var_472_8.x = 0
				var_472_0.localEulerAngles = var_472_8
			end

			local var_472_9 = arg_469_1.actors_["10076ui_story"]
			local var_472_10 = 0

			if var_472_10 < arg_469_1.time_ and arg_469_1.time_ <= var_472_10 + arg_472_0 and arg_469_1.var_.characterEffect10076ui_story == nil then
				arg_469_1.var_.characterEffect10076ui_story = var_472_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_11 = 0.200000002980232

			if var_472_10 <= arg_469_1.time_ and arg_469_1.time_ < var_472_10 + var_472_11 then
				local var_472_12 = (arg_469_1.time_ - var_472_10) / var_472_11

				if arg_469_1.var_.characterEffect10076ui_story then
					arg_469_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_10 + var_472_11 and arg_469_1.time_ < var_472_10 + var_472_11 + arg_472_0 and arg_469_1.var_.characterEffect10076ui_story then
				arg_469_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_472_13 = 0

			if var_472_13 < arg_469_1.time_ and arg_469_1.time_ <= var_472_13 + arg_472_0 then
				arg_469_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action3_1")
			end

			local var_472_14 = 0

			if var_472_14 < arg_469_1.time_ and arg_469_1.time_ <= var_472_14 + arg_472_0 then
				arg_469_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_472_15 = arg_469_1.actors_["1097ui_story"].transform
			local var_472_16 = 0

			if var_472_16 < arg_469_1.time_ and arg_469_1.time_ <= var_472_16 + arg_472_0 then
				arg_469_1.var_.moveOldPos1097ui_story = var_472_15.localPosition
			end

			local var_472_17 = 0.001

			if var_472_16 <= arg_469_1.time_ and arg_469_1.time_ < var_472_16 + var_472_17 then
				local var_472_18 = (arg_469_1.time_ - var_472_16) / var_472_17
				local var_472_19 = Vector3.New(0, 100, 0)

				var_472_15.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos1097ui_story, var_472_19, var_472_18)

				local var_472_20 = manager.ui.mainCamera.transform.position - var_472_15.position

				var_472_15.forward = Vector3.New(var_472_20.x, var_472_20.y, var_472_20.z)

				local var_472_21 = var_472_15.localEulerAngles

				var_472_21.z = 0
				var_472_21.x = 0
				var_472_15.localEulerAngles = var_472_21
			end

			if arg_469_1.time_ >= var_472_16 + var_472_17 and arg_469_1.time_ < var_472_16 + var_472_17 + arg_472_0 then
				var_472_15.localPosition = Vector3.New(0, 100, 0)

				local var_472_22 = manager.ui.mainCamera.transform.position - var_472_15.position

				var_472_15.forward = Vector3.New(var_472_22.x, var_472_22.y, var_472_22.z)

				local var_472_23 = var_472_15.localEulerAngles

				var_472_23.z = 0
				var_472_23.x = 0
				var_472_15.localEulerAngles = var_472_23
			end

			local var_472_24 = arg_469_1.actors_["1097ui_story"]
			local var_472_25 = 0

			if var_472_25 < arg_469_1.time_ and arg_469_1.time_ <= var_472_25 + arg_472_0 and arg_469_1.var_.characterEffect1097ui_story == nil then
				arg_469_1.var_.characterEffect1097ui_story = var_472_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_26 = 0.200000002980232

			if var_472_25 <= arg_469_1.time_ and arg_469_1.time_ < var_472_25 + var_472_26 then
				local var_472_27 = (arg_469_1.time_ - var_472_25) / var_472_26

				if arg_469_1.var_.characterEffect1097ui_story then
					local var_472_28 = Mathf.Lerp(0, 0.5, var_472_27)

					arg_469_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1097ui_story.fillRatio = var_472_28
				end
			end

			if arg_469_1.time_ >= var_472_25 + var_472_26 and arg_469_1.time_ < var_472_25 + var_472_26 + arg_472_0 and arg_469_1.var_.characterEffect1097ui_story then
				local var_472_29 = 0.5

				arg_469_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1097ui_story.fillRatio = var_472_29
			end

			local var_472_30 = arg_469_1.actors_["3043ui_story"].transform
			local var_472_31 = 0

			if var_472_31 < arg_469_1.time_ and arg_469_1.time_ <= var_472_31 + arg_472_0 then
				arg_469_1.var_.moveOldPos3043ui_story = var_472_30.localPosition
			end

			local var_472_32 = 0.001

			if var_472_31 <= arg_469_1.time_ and arg_469_1.time_ < var_472_31 + var_472_32 then
				local var_472_33 = (arg_469_1.time_ - var_472_31) / var_472_32
				local var_472_34 = Vector3.New(0, 100, 0)

				var_472_30.localPosition = Vector3.Lerp(arg_469_1.var_.moveOldPos3043ui_story, var_472_34, var_472_33)

				local var_472_35 = manager.ui.mainCamera.transform.position - var_472_30.position

				var_472_30.forward = Vector3.New(var_472_35.x, var_472_35.y, var_472_35.z)

				local var_472_36 = var_472_30.localEulerAngles

				var_472_36.z = 0
				var_472_36.x = 0
				var_472_30.localEulerAngles = var_472_36
			end

			if arg_469_1.time_ >= var_472_31 + var_472_32 and arg_469_1.time_ < var_472_31 + var_472_32 + arg_472_0 then
				var_472_30.localPosition = Vector3.New(0, 100, 0)

				local var_472_37 = manager.ui.mainCamera.transform.position - var_472_30.position

				var_472_30.forward = Vector3.New(var_472_37.x, var_472_37.y, var_472_37.z)

				local var_472_38 = var_472_30.localEulerAngles

				var_472_38.z = 0
				var_472_38.x = 0
				var_472_30.localEulerAngles = var_472_38
			end

			local var_472_39 = arg_469_1.actors_["3043ui_story"]
			local var_472_40 = 0

			if var_472_40 < arg_469_1.time_ and arg_469_1.time_ <= var_472_40 + arg_472_0 and arg_469_1.var_.characterEffect3043ui_story == nil then
				arg_469_1.var_.characterEffect3043ui_story = var_472_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_41 = 0.200000002980232

			if var_472_40 <= arg_469_1.time_ and arg_469_1.time_ < var_472_40 + var_472_41 then
				local var_472_42 = (arg_469_1.time_ - var_472_40) / var_472_41

				if arg_469_1.var_.characterEffect3043ui_story then
					local var_472_43 = Mathf.Lerp(0, 0.5, var_472_42)

					arg_469_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_469_1.var_.characterEffect3043ui_story.fillRatio = var_472_43
				end
			end

			if arg_469_1.time_ >= var_472_40 + var_472_41 and arg_469_1.time_ < var_472_40 + var_472_41 + arg_472_0 and arg_469_1.var_.characterEffect3043ui_story then
				local var_472_44 = 0.5

				arg_469_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_469_1.var_.characterEffect3043ui_story.fillRatio = var_472_44
			end

			local var_472_45 = 0
			local var_472_46 = 0.6

			if var_472_45 < arg_469_1.time_ and arg_469_1.time_ <= var_472_45 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_47 = arg_469_1:FormatText(StoryNameCfg[917].name)

				arg_469_1.leftNameTxt_.text = var_472_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_48 = arg_469_1:GetWordFromCfg(412031113)
				local var_472_49 = arg_469_1:FormatText(var_472_48.content)

				arg_469_1.text_.text = var_472_49

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_50 = 24
				local var_472_51 = utf8.len(var_472_49)
				local var_472_52 = var_472_50 <= 0 and var_472_46 or var_472_46 * (var_472_51 / var_472_50)

				if var_472_52 > 0 and var_472_46 < var_472_52 then
					arg_469_1.talkMaxDuration = var_472_52

					if var_472_52 + var_472_45 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_52 + var_472_45
					end
				end

				arg_469_1.text_.text = var_472_49
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031113", "story_v_out_412031.awb") ~= 0 then
					local var_472_53 = manager.audio:GetVoiceLength("story_v_out_412031", "412031113", "story_v_out_412031.awb") / 1000

					if var_472_53 + var_472_45 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_53 + var_472_45
					end

					if var_472_48.prefab_name ~= "" and arg_469_1.actors_[var_472_48.prefab_name] ~= nil then
						local var_472_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_48.prefab_name].transform, "story_v_out_412031", "412031113", "story_v_out_412031.awb")

						arg_469_1:RecordAudio("412031113", var_472_54)
						arg_469_1:RecordAudio("412031113", var_472_54)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_412031", "412031113", "story_v_out_412031.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_412031", "412031113", "story_v_out_412031.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_55 = math.max(var_472_46, arg_469_1.talkMaxDuration)

			if var_472_45 <= arg_469_1.time_ and arg_469_1.time_ < var_472_45 + var_472_55 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_45) / var_472_55

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_45 + var_472_55 and arg_469_1.time_ < var_472_45 + var_472_55 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play412031114 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 412031114
		arg_473_1.duration_ = 1.999999999999

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play412031115(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1097ui_story"].transform
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.var_.moveOldPos1097ui_story = var_476_0.localPosition
			end

			local var_476_2 = 0.001

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2
				local var_476_4 = Vector3.New(0, -0.54, -6.3)

				var_476_0.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos1097ui_story, var_476_4, var_476_3)

				local var_476_5 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_5.x, var_476_5.y, var_476_5.z)

				local var_476_6 = var_476_0.localEulerAngles

				var_476_6.z = 0
				var_476_6.x = 0
				var_476_0.localEulerAngles = var_476_6
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 then
				var_476_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_476_7 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_7.x, var_476_7.y, var_476_7.z)

				local var_476_8 = var_476_0.localEulerAngles

				var_476_8.z = 0
				var_476_8.x = 0
				var_476_0.localEulerAngles = var_476_8
			end

			local var_476_9 = arg_473_1.actors_["1097ui_story"]
			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 and arg_473_1.var_.characterEffect1097ui_story == nil then
				arg_473_1.var_.characterEffect1097ui_story = var_476_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_11 = 0.200000002980232

			if var_476_10 <= arg_473_1.time_ and arg_473_1.time_ < var_476_10 + var_476_11 then
				local var_476_12 = (arg_473_1.time_ - var_476_10) / var_476_11

				if arg_473_1.var_.characterEffect1097ui_story then
					arg_473_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_473_1.time_ >= var_476_10 + var_476_11 and arg_473_1.time_ < var_476_10 + var_476_11 + arg_476_0 and arg_473_1.var_.characterEffect1097ui_story then
				arg_473_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_476_13 = 0

			if var_476_13 < arg_473_1.time_ and arg_473_1.time_ <= var_476_13 + arg_476_0 then
				arg_473_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_476_14 = 0

			if var_476_14 < arg_473_1.time_ and arg_473_1.time_ <= var_476_14 + arg_476_0 then
				arg_473_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_476_15 = arg_473_1.actors_["10076ui_story"].transform
			local var_476_16 = 0

			if var_476_16 < arg_473_1.time_ and arg_473_1.time_ <= var_476_16 + arg_476_0 then
				arg_473_1.var_.moveOldPos10076ui_story = var_476_15.localPosition
			end

			local var_476_17 = 0.001

			if var_476_16 <= arg_473_1.time_ and arg_473_1.time_ < var_476_16 + var_476_17 then
				local var_476_18 = (arg_473_1.time_ - var_476_16) / var_476_17
				local var_476_19 = Vector3.New(0, 100, 0)

				var_476_15.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos10076ui_story, var_476_19, var_476_18)

				local var_476_20 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_20.x, var_476_20.y, var_476_20.z)

				local var_476_21 = var_476_15.localEulerAngles

				var_476_21.z = 0
				var_476_21.x = 0
				var_476_15.localEulerAngles = var_476_21
			end

			if arg_473_1.time_ >= var_476_16 + var_476_17 and arg_473_1.time_ < var_476_16 + var_476_17 + arg_476_0 then
				var_476_15.localPosition = Vector3.New(0, 100, 0)

				local var_476_22 = manager.ui.mainCamera.transform.position - var_476_15.position

				var_476_15.forward = Vector3.New(var_476_22.x, var_476_22.y, var_476_22.z)

				local var_476_23 = var_476_15.localEulerAngles

				var_476_23.z = 0
				var_476_23.x = 0
				var_476_15.localEulerAngles = var_476_23
			end

			local var_476_24 = arg_473_1.actors_["10076ui_story"]
			local var_476_25 = 0

			if var_476_25 < arg_473_1.time_ and arg_473_1.time_ <= var_476_25 + arg_476_0 and arg_473_1.var_.characterEffect10076ui_story == nil then
				arg_473_1.var_.characterEffect10076ui_story = var_476_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_26 = 0.200000002980232

			if var_476_25 <= arg_473_1.time_ and arg_473_1.time_ < var_476_25 + var_476_26 then
				local var_476_27 = (arg_473_1.time_ - var_476_25) / var_476_26

				if arg_473_1.var_.characterEffect10076ui_story then
					local var_476_28 = Mathf.Lerp(0, 0.5, var_476_27)

					arg_473_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_473_1.var_.characterEffect10076ui_story.fillRatio = var_476_28
				end
			end

			if arg_473_1.time_ >= var_476_25 + var_476_26 and arg_473_1.time_ < var_476_25 + var_476_26 + arg_476_0 and arg_473_1.var_.characterEffect10076ui_story then
				local var_476_29 = 0.5

				arg_473_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_473_1.var_.characterEffect10076ui_story.fillRatio = var_476_29
			end

			local var_476_30 = 0
			local var_476_31 = 0.125

			if var_476_30 < arg_473_1.time_ and arg_473_1.time_ <= var_476_30 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_32 = arg_473_1:FormatText(StoryNameCfg[216].name)

				arg_473_1.leftNameTxt_.text = var_476_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_33 = arg_473_1:GetWordFromCfg(412031114)
				local var_476_34 = arg_473_1:FormatText(var_476_33.content)

				arg_473_1.text_.text = var_476_34

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_35 = 5
				local var_476_36 = utf8.len(var_476_34)
				local var_476_37 = var_476_35 <= 0 and var_476_31 or var_476_31 * (var_476_36 / var_476_35)

				if var_476_37 > 0 and var_476_31 < var_476_37 then
					arg_473_1.talkMaxDuration = var_476_37

					if var_476_37 + var_476_30 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_37 + var_476_30
					end
				end

				arg_473_1.text_.text = var_476_34
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031114", "story_v_out_412031.awb") ~= 0 then
					local var_476_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031114", "story_v_out_412031.awb") / 1000

					if var_476_38 + var_476_30 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_38 + var_476_30
					end

					if var_476_33.prefab_name ~= "" and arg_473_1.actors_[var_476_33.prefab_name] ~= nil then
						local var_476_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_33.prefab_name].transform, "story_v_out_412031", "412031114", "story_v_out_412031.awb")

						arg_473_1:RecordAudio("412031114", var_476_39)
						arg_473_1:RecordAudio("412031114", var_476_39)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_412031", "412031114", "story_v_out_412031.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_412031", "412031114", "story_v_out_412031.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_40 = math.max(var_476_31, arg_473_1.talkMaxDuration)

			if var_476_30 <= arg_473_1.time_ and arg_473_1.time_ < var_476_30 + var_476_40 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_30) / var_476_40

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_30 + var_476_40 and arg_473_1.time_ < var_476_30 + var_476_40 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play412031115 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 412031115
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play412031116(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1097ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1097ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(0, 100, 0)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1097ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(0, 100, 0)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["1097ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1097ui_story == nil then
				arg_477_1.var_.characterEffect1097ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1097ui_story then
					local var_480_13 = Mathf.Lerp(0, 0.5, var_480_12)

					arg_477_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1097ui_story.fillRatio = var_480_13
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect1097ui_story then
				local var_480_14 = 0.5

				arg_477_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1097ui_story.fillRatio = var_480_14
			end

			local var_480_15 = 0
			local var_480_16 = 1.25

			if var_480_15 < arg_477_1.time_ and arg_477_1.time_ <= var_480_15 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, false)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_17 = arg_477_1:GetWordFromCfg(412031115)
				local var_480_18 = arg_477_1:FormatText(var_480_17.content)

				arg_477_1.text_.text = var_480_18

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_19 = 50
				local var_480_20 = utf8.len(var_480_18)
				local var_480_21 = var_480_19 <= 0 and var_480_16 or var_480_16 * (var_480_20 / var_480_19)

				if var_480_21 > 0 and var_480_16 < var_480_21 then
					arg_477_1.talkMaxDuration = var_480_21

					if var_480_21 + var_480_15 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_21 + var_480_15
					end
				end

				arg_477_1.text_.text = var_480_18
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_22 = math.max(var_480_16, arg_477_1.talkMaxDuration)

			if var_480_15 <= arg_477_1.time_ and arg_477_1.time_ < var_480_15 + var_480_22 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_15) / var_480_22

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_15 + var_480_22 and arg_477_1.time_ < var_480_15 + var_480_22 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play412031116 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 412031116
		arg_481_1.duration_ = 5.466

		local var_481_0 = {
			zh = 3.933,
			ja = 5.466
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
				arg_481_0:Play412031117(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["10076ui_story"].transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPos10076ui_story = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(0, -0.35, -4)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos10076ui_story, var_484_4, var_484_3)

				local var_484_5 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_5.x, var_484_5.y, var_484_5.z)

				local var_484_6 = var_484_0.localEulerAngles

				var_484_6.z = 0
				var_484_6.x = 0
				var_484_0.localEulerAngles = var_484_6
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(0, -0.35, -4)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_0.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_0.localEulerAngles = var_484_8
			end

			local var_484_9 = arg_481_1.actors_["10076ui_story"]
			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 and arg_481_1.var_.characterEffect10076ui_story == nil then
				arg_481_1.var_.characterEffect10076ui_story = var_484_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_11 = 0.200000002980232

			if var_484_10 <= arg_481_1.time_ and arg_481_1.time_ < var_484_10 + var_484_11 then
				local var_484_12 = (arg_481_1.time_ - var_484_10) / var_484_11

				if arg_481_1.var_.characterEffect10076ui_story then
					arg_481_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_10 + var_484_11 and arg_481_1.time_ < var_484_10 + var_484_11 + arg_484_0 and arg_481_1.var_.characterEffect10076ui_story then
				arg_481_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_484_13 = 0

			if var_484_13 < arg_481_1.time_ and arg_481_1.time_ <= var_484_13 + arg_484_0 then
				arg_481_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action1_1")
			end

			local var_484_14 = 0

			if var_484_14 < arg_481_1.time_ and arg_481_1.time_ <= var_484_14 + arg_484_0 then
				arg_481_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_484_15 = 0
			local var_484_16 = 0.5

			if var_484_15 < arg_481_1.time_ and arg_481_1.time_ <= var_484_15 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_17 = arg_481_1:FormatText(StoryNameCfg[917].name)

				arg_481_1.leftNameTxt_.text = var_484_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_18 = arg_481_1:GetWordFromCfg(412031116)
				local var_484_19 = arg_481_1:FormatText(var_484_18.content)

				arg_481_1.text_.text = var_484_19

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_20 = 20
				local var_484_21 = utf8.len(var_484_19)
				local var_484_22 = var_484_20 <= 0 and var_484_16 or var_484_16 * (var_484_21 / var_484_20)

				if var_484_22 > 0 and var_484_16 < var_484_22 then
					arg_481_1.talkMaxDuration = var_484_22

					if var_484_22 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_22 + var_484_15
					end
				end

				arg_481_1.text_.text = var_484_19
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031116", "story_v_out_412031.awb") ~= 0 then
					local var_484_23 = manager.audio:GetVoiceLength("story_v_out_412031", "412031116", "story_v_out_412031.awb") / 1000

					if var_484_23 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_23 + var_484_15
					end

					if var_484_18.prefab_name ~= "" and arg_481_1.actors_[var_484_18.prefab_name] ~= nil then
						local var_484_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_18.prefab_name].transform, "story_v_out_412031", "412031116", "story_v_out_412031.awb")

						arg_481_1:RecordAudio("412031116", var_484_24)
						arg_481_1:RecordAudio("412031116", var_484_24)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_412031", "412031116", "story_v_out_412031.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_412031", "412031116", "story_v_out_412031.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_25 = math.max(var_484_16, arg_481_1.talkMaxDuration)

			if var_484_15 <= arg_481_1.time_ and arg_481_1.time_ < var_484_15 + var_484_25 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_15) / var_484_25

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_15 + var_484_25 and arg_481_1.time_ < var_484_15 + var_484_25 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play412031117 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 412031117
		arg_485_1.duration_ = 8.8

		local var_485_0 = {
			zh = 6.066,
			ja = 8.8
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
				arg_485_0:Play412031118(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.85

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[917].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(412031117)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 34
				local var_488_6 = utf8.len(var_488_4)
				local var_488_7 = var_488_5 <= 0 and var_488_1 or var_488_1 * (var_488_6 / var_488_5)

				if var_488_7 > 0 and var_488_1 < var_488_7 then
					arg_485_1.talkMaxDuration = var_488_7

					if var_488_7 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_7 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_4
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031117", "story_v_out_412031.awb") ~= 0 then
					local var_488_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031117", "story_v_out_412031.awb") / 1000

					if var_488_8 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_8 + var_488_0
					end

					if var_488_3.prefab_name ~= "" and arg_485_1.actors_[var_488_3.prefab_name] ~= nil then
						local var_488_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_3.prefab_name].transform, "story_v_out_412031", "412031117", "story_v_out_412031.awb")

						arg_485_1:RecordAudio("412031117", var_488_9)
						arg_485_1:RecordAudio("412031117", var_488_9)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_412031", "412031117", "story_v_out_412031.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_412031", "412031117", "story_v_out_412031.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_10 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_10 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_10

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_10 and arg_485_1.time_ < var_488_0 + var_488_10 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play412031118 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 412031118
		arg_489_1.duration_ = 11.366

		local var_489_0 = {
			zh = 11.366,
			ja = 8.633
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
				arg_489_0:Play412031119(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 1.425

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_2 = arg_489_1:FormatText(StoryNameCfg[917].name)

				arg_489_1.leftNameTxt_.text = var_492_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_3 = arg_489_1:GetWordFromCfg(412031118)
				local var_492_4 = arg_489_1:FormatText(var_492_3.content)

				arg_489_1.text_.text = var_492_4

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_5 = 57
				local var_492_6 = utf8.len(var_492_4)
				local var_492_7 = var_492_5 <= 0 and var_492_1 or var_492_1 * (var_492_6 / var_492_5)

				if var_492_7 > 0 and var_492_1 < var_492_7 then
					arg_489_1.talkMaxDuration = var_492_7

					if var_492_7 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_7 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_4
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031118", "story_v_out_412031.awb") ~= 0 then
					local var_492_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031118", "story_v_out_412031.awb") / 1000

					if var_492_8 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_8 + var_492_0
					end

					if var_492_3.prefab_name ~= "" and arg_489_1.actors_[var_492_3.prefab_name] ~= nil then
						local var_492_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_3.prefab_name].transform, "story_v_out_412031", "412031118", "story_v_out_412031.awb")

						arg_489_1:RecordAudio("412031118", var_492_9)
						arg_489_1:RecordAudio("412031118", var_492_9)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_412031", "412031118", "story_v_out_412031.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_412031", "412031118", "story_v_out_412031.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_10 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_10 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_10

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_10 and arg_489_1.time_ < var_492_0 + var_492_10 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play412031119 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 412031119
		arg_493_1.duration_ = 4.8

		local var_493_0 = {
			zh = 4.8,
			ja = 3.133
		}
		local var_493_1 = manager.audio:GetLocalizationFlag()

		if var_493_0[var_493_1] ~= nil then
			arg_493_1.duration_ = var_493_0[var_493_1]
		end

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play412031120(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["3043ui_story"].transform
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1.var_.moveOldPos3043ui_story = var_496_0.localPosition
			end

			local var_496_2 = 0.001

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2
				local var_496_4 = Vector3.New(0, -1.41, -5.7)

				var_496_0.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos3043ui_story, var_496_4, var_496_3)

				local var_496_5 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_5.x, var_496_5.y, var_496_5.z)

				local var_496_6 = var_496_0.localEulerAngles

				var_496_6.z = 0
				var_496_6.x = 0
				var_496_0.localEulerAngles = var_496_6
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 then
				var_496_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_496_7 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_7.x, var_496_7.y, var_496_7.z)

				local var_496_8 = var_496_0.localEulerAngles

				var_496_8.z = 0
				var_496_8.x = 0
				var_496_0.localEulerAngles = var_496_8
			end

			local var_496_9 = arg_493_1.actors_["3043ui_story"]
			local var_496_10 = 0

			if var_496_10 < arg_493_1.time_ and arg_493_1.time_ <= var_496_10 + arg_496_0 and arg_493_1.var_.characterEffect3043ui_story == nil then
				arg_493_1.var_.characterEffect3043ui_story = var_496_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_11 = 0.200000002980232

			if var_496_10 <= arg_493_1.time_ and arg_493_1.time_ < var_496_10 + var_496_11 then
				local var_496_12 = (arg_493_1.time_ - var_496_10) / var_496_11

				if arg_493_1.var_.characterEffect3043ui_story then
					arg_493_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_10 + var_496_11 and arg_493_1.time_ < var_496_10 + var_496_11 + arg_496_0 and arg_493_1.var_.characterEffect3043ui_story then
				arg_493_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_496_13 = 0

			if var_496_13 < arg_493_1.time_ and arg_493_1.time_ <= var_496_13 + arg_496_0 then
				arg_493_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_496_14 = 0

			if var_496_14 < arg_493_1.time_ and arg_493_1.time_ <= var_496_14 + arg_496_0 then
				arg_493_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_496_15 = arg_493_1.actors_["10076ui_story"].transform
			local var_496_16 = 0

			if var_496_16 < arg_493_1.time_ and arg_493_1.time_ <= var_496_16 + arg_496_0 then
				arg_493_1.var_.moveOldPos10076ui_story = var_496_15.localPosition
			end

			local var_496_17 = 0.001

			if var_496_16 <= arg_493_1.time_ and arg_493_1.time_ < var_496_16 + var_496_17 then
				local var_496_18 = (arg_493_1.time_ - var_496_16) / var_496_17
				local var_496_19 = Vector3.New(0, 100, 0)

				var_496_15.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos10076ui_story, var_496_19, var_496_18)

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

			local var_496_24 = arg_493_1.actors_["10076ui_story"]
			local var_496_25 = 0

			if var_496_25 < arg_493_1.time_ and arg_493_1.time_ <= var_496_25 + arg_496_0 and arg_493_1.var_.characterEffect10076ui_story == nil then
				arg_493_1.var_.characterEffect10076ui_story = var_496_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_26 = 0.200000002980232

			if var_496_25 <= arg_493_1.time_ and arg_493_1.time_ < var_496_25 + var_496_26 then
				local var_496_27 = (arg_493_1.time_ - var_496_25) / var_496_26

				if arg_493_1.var_.characterEffect10076ui_story then
					local var_496_28 = Mathf.Lerp(0, 0.5, var_496_27)

					arg_493_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_493_1.var_.characterEffect10076ui_story.fillRatio = var_496_28
				end
			end

			if arg_493_1.time_ >= var_496_25 + var_496_26 and arg_493_1.time_ < var_496_25 + var_496_26 + arg_496_0 and arg_493_1.var_.characterEffect10076ui_story then
				local var_496_29 = 0.5

				arg_493_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_493_1.var_.characterEffect10076ui_story.fillRatio = var_496_29
			end

			local var_496_30 = 0
			local var_496_31 = 0.525

			if var_496_30 < arg_493_1.time_ and arg_493_1.time_ <= var_496_30 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_32 = arg_493_1:FormatText(StoryNameCfg[920].name)

				arg_493_1.leftNameTxt_.text = var_496_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_33 = arg_493_1:GetWordFromCfg(412031119)
				local var_496_34 = arg_493_1:FormatText(var_496_33.content)

				arg_493_1.text_.text = var_496_34

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_35 = 21
				local var_496_36 = utf8.len(var_496_34)
				local var_496_37 = var_496_35 <= 0 and var_496_31 or var_496_31 * (var_496_36 / var_496_35)

				if var_496_37 > 0 and var_496_31 < var_496_37 then
					arg_493_1.talkMaxDuration = var_496_37

					if var_496_37 + var_496_30 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_37 + var_496_30
					end
				end

				arg_493_1.text_.text = var_496_34
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031119", "story_v_out_412031.awb") ~= 0 then
					local var_496_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031119", "story_v_out_412031.awb") / 1000

					if var_496_38 + var_496_30 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_38 + var_496_30
					end

					if var_496_33.prefab_name ~= "" and arg_493_1.actors_[var_496_33.prefab_name] ~= nil then
						local var_496_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_33.prefab_name].transform, "story_v_out_412031", "412031119", "story_v_out_412031.awb")

						arg_493_1:RecordAudio("412031119", var_496_39)
						arg_493_1:RecordAudio("412031119", var_496_39)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_412031", "412031119", "story_v_out_412031.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_412031", "412031119", "story_v_out_412031.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_40 = math.max(var_496_31, arg_493_1.talkMaxDuration)

			if var_496_30 <= arg_493_1.time_ and arg_493_1.time_ < var_496_30 + var_496_40 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_30) / var_496_40

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_30 + var_496_40 and arg_493_1.time_ < var_496_30 + var_496_40 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play412031120 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 412031120
		arg_497_1.duration_ = 6.666

		local var_497_0 = {
			zh = 2.7,
			ja = 6.666
		}
		local var_497_1 = manager.audio:GetLocalizationFlag()

		if var_497_0[var_497_1] ~= nil then
			arg_497_1.duration_ = var_497_0[var_497_1]
		end

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play412031121(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["10076ui_story"].transform
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 then
				arg_497_1.var_.moveOldPos10076ui_story = var_500_0.localPosition
			end

			local var_500_2 = 0.001

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2
				local var_500_4 = Vector3.New(0, -0.35, -4)

				var_500_0.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos10076ui_story, var_500_4, var_500_3)

				local var_500_5 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_5.x, var_500_5.y, var_500_5.z)

				local var_500_6 = var_500_0.localEulerAngles

				var_500_6.z = 0
				var_500_6.x = 0
				var_500_0.localEulerAngles = var_500_6
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 then
				var_500_0.localPosition = Vector3.New(0, -0.35, -4)

				local var_500_7 = manager.ui.mainCamera.transform.position - var_500_0.position

				var_500_0.forward = Vector3.New(var_500_7.x, var_500_7.y, var_500_7.z)

				local var_500_8 = var_500_0.localEulerAngles

				var_500_8.z = 0
				var_500_8.x = 0
				var_500_0.localEulerAngles = var_500_8
			end

			local var_500_9 = arg_497_1.actors_["10076ui_story"]
			local var_500_10 = 0

			if var_500_10 < arg_497_1.time_ and arg_497_1.time_ <= var_500_10 + arg_500_0 and arg_497_1.var_.characterEffect10076ui_story == nil then
				arg_497_1.var_.characterEffect10076ui_story = var_500_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_11 = 0.200000002980232

			if var_500_10 <= arg_497_1.time_ and arg_497_1.time_ < var_500_10 + var_500_11 then
				local var_500_12 = (arg_497_1.time_ - var_500_10) / var_500_11

				if arg_497_1.var_.characterEffect10076ui_story then
					arg_497_1.var_.characterEffect10076ui_story.fillFlat = false
				end
			end

			if arg_497_1.time_ >= var_500_10 + var_500_11 and arg_497_1.time_ < var_500_10 + var_500_11 + arg_500_0 and arg_497_1.var_.characterEffect10076ui_story then
				arg_497_1.var_.characterEffect10076ui_story.fillFlat = false
			end

			local var_500_13 = 0

			if var_500_13 < arg_497_1.time_ and arg_497_1.time_ <= var_500_13 + arg_500_0 then
				arg_497_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/story10076/story10076action/10076action2_1")
			end

			local var_500_14 = 0

			if var_500_14 < arg_497_1.time_ and arg_497_1.time_ <= var_500_14 + arg_500_0 then
				arg_497_1:PlayTimeline("10076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_500_15 = arg_497_1.actors_["3043ui_story"].transform
			local var_500_16 = 0

			if var_500_16 < arg_497_1.time_ and arg_497_1.time_ <= var_500_16 + arg_500_0 then
				arg_497_1.var_.moveOldPos3043ui_story = var_500_15.localPosition
			end

			local var_500_17 = 0.001

			if var_500_16 <= arg_497_1.time_ and arg_497_1.time_ < var_500_16 + var_500_17 then
				local var_500_18 = (arg_497_1.time_ - var_500_16) / var_500_17
				local var_500_19 = Vector3.New(0, 100, 0)

				var_500_15.localPosition = Vector3.Lerp(arg_497_1.var_.moveOldPos3043ui_story, var_500_19, var_500_18)

				local var_500_20 = manager.ui.mainCamera.transform.position - var_500_15.position

				var_500_15.forward = Vector3.New(var_500_20.x, var_500_20.y, var_500_20.z)

				local var_500_21 = var_500_15.localEulerAngles

				var_500_21.z = 0
				var_500_21.x = 0
				var_500_15.localEulerAngles = var_500_21
			end

			if arg_497_1.time_ >= var_500_16 + var_500_17 and arg_497_1.time_ < var_500_16 + var_500_17 + arg_500_0 then
				var_500_15.localPosition = Vector3.New(0, 100, 0)

				local var_500_22 = manager.ui.mainCamera.transform.position - var_500_15.position

				var_500_15.forward = Vector3.New(var_500_22.x, var_500_22.y, var_500_22.z)

				local var_500_23 = var_500_15.localEulerAngles

				var_500_23.z = 0
				var_500_23.x = 0
				var_500_15.localEulerAngles = var_500_23
			end

			local var_500_24 = arg_497_1.actors_["3043ui_story"]
			local var_500_25 = 0

			if var_500_25 < arg_497_1.time_ and arg_497_1.time_ <= var_500_25 + arg_500_0 and arg_497_1.var_.characterEffect3043ui_story == nil then
				arg_497_1.var_.characterEffect3043ui_story = var_500_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_26 = 0.200000002980232

			if var_500_25 <= arg_497_1.time_ and arg_497_1.time_ < var_500_25 + var_500_26 then
				local var_500_27 = (arg_497_1.time_ - var_500_25) / var_500_26

				if arg_497_1.var_.characterEffect3043ui_story then
					local var_500_28 = Mathf.Lerp(0, 0.5, var_500_27)

					arg_497_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_497_1.var_.characterEffect3043ui_story.fillRatio = var_500_28
				end
			end

			if arg_497_1.time_ >= var_500_25 + var_500_26 and arg_497_1.time_ < var_500_25 + var_500_26 + arg_500_0 and arg_497_1.var_.characterEffect3043ui_story then
				local var_500_29 = 0.5

				arg_497_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_497_1.var_.characterEffect3043ui_story.fillRatio = var_500_29
			end

			local var_500_30 = 0
			local var_500_31 = 0.35

			if var_500_30 < arg_497_1.time_ and arg_497_1.time_ <= var_500_30 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_32 = arg_497_1:FormatText(StoryNameCfg[917].name)

				arg_497_1.leftNameTxt_.text = var_500_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_33 = arg_497_1:GetWordFromCfg(412031120)
				local var_500_34 = arg_497_1:FormatText(var_500_33.content)

				arg_497_1.text_.text = var_500_34

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_35 = 14
				local var_500_36 = utf8.len(var_500_34)
				local var_500_37 = var_500_35 <= 0 and var_500_31 or var_500_31 * (var_500_36 / var_500_35)

				if var_500_37 > 0 and var_500_31 < var_500_37 then
					arg_497_1.talkMaxDuration = var_500_37

					if var_500_37 + var_500_30 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_37 + var_500_30
					end
				end

				arg_497_1.text_.text = var_500_34
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031120", "story_v_out_412031.awb") ~= 0 then
					local var_500_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031120", "story_v_out_412031.awb") / 1000

					if var_500_38 + var_500_30 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_38 + var_500_30
					end

					if var_500_33.prefab_name ~= "" and arg_497_1.actors_[var_500_33.prefab_name] ~= nil then
						local var_500_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_33.prefab_name].transform, "story_v_out_412031", "412031120", "story_v_out_412031.awb")

						arg_497_1:RecordAudio("412031120", var_500_39)
						arg_497_1:RecordAudio("412031120", var_500_39)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_412031", "412031120", "story_v_out_412031.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_412031", "412031120", "story_v_out_412031.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_40 = math.max(var_500_31, arg_497_1.talkMaxDuration)

			if var_500_30 <= arg_497_1.time_ and arg_497_1.time_ < var_500_30 + var_500_40 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_30) / var_500_40

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_30 + var_500_40 and arg_497_1.time_ < var_500_30 + var_500_40 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play412031121 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 412031121
		arg_501_1.duration_ = 4.133

		local var_501_0 = {
			zh = 4.133,
			ja = 2.7
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
				arg_501_0:Play412031122(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["3043ui_story"].transform
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1.var_.moveOldPos3043ui_story = var_504_0.localPosition
			end

			local var_504_2 = 0.001

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2
				local var_504_4 = Vector3.New(0, -1.41, -5.7)

				var_504_0.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos3043ui_story, var_504_4, var_504_3)

				local var_504_5 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_5.x, var_504_5.y, var_504_5.z)

				local var_504_6 = var_504_0.localEulerAngles

				var_504_6.z = 0
				var_504_6.x = 0
				var_504_0.localEulerAngles = var_504_6
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 then
				var_504_0.localPosition = Vector3.New(0, -1.41, -5.7)

				local var_504_7 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_7.x, var_504_7.y, var_504_7.z)

				local var_504_8 = var_504_0.localEulerAngles

				var_504_8.z = 0
				var_504_8.x = 0
				var_504_0.localEulerAngles = var_504_8
			end

			local var_504_9 = arg_501_1.actors_["3043ui_story"]
			local var_504_10 = 0

			if var_504_10 < arg_501_1.time_ and arg_501_1.time_ <= var_504_10 + arg_504_0 and arg_501_1.var_.characterEffect3043ui_story == nil then
				arg_501_1.var_.characterEffect3043ui_story = var_504_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_11 = 0.200000002980232

			if var_504_10 <= arg_501_1.time_ and arg_501_1.time_ < var_504_10 + var_504_11 then
				local var_504_12 = (arg_501_1.time_ - var_504_10) / var_504_11

				if arg_501_1.var_.characterEffect3043ui_story then
					arg_501_1.var_.characterEffect3043ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_10 + var_504_11 and arg_501_1.time_ < var_504_10 + var_504_11 + arg_504_0 and arg_501_1.var_.characterEffect3043ui_story then
				arg_501_1.var_.characterEffect3043ui_story.fillFlat = false
			end

			local var_504_13 = 0

			if var_504_13 < arg_501_1.time_ and arg_501_1.time_ <= var_504_13 + arg_504_0 then
				arg_501_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/story3043/3043action/3043action1_1")
			end

			local var_504_14 = 0

			if var_504_14 < arg_501_1.time_ and arg_501_1.time_ <= var_504_14 + arg_504_0 then
				arg_501_1:PlayTimeline("3043ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_504_15 = arg_501_1.actors_["10076ui_story"].transform
			local var_504_16 = 0

			if var_504_16 < arg_501_1.time_ and arg_501_1.time_ <= var_504_16 + arg_504_0 then
				arg_501_1.var_.moveOldPos10076ui_story = var_504_15.localPosition
			end

			local var_504_17 = 0.001

			if var_504_16 <= arg_501_1.time_ and arg_501_1.time_ < var_504_16 + var_504_17 then
				local var_504_18 = (arg_501_1.time_ - var_504_16) / var_504_17
				local var_504_19 = Vector3.New(0, 100, 0)

				var_504_15.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos10076ui_story, var_504_19, var_504_18)

				local var_504_20 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_20.x, var_504_20.y, var_504_20.z)

				local var_504_21 = var_504_15.localEulerAngles

				var_504_21.z = 0
				var_504_21.x = 0
				var_504_15.localEulerAngles = var_504_21
			end

			if arg_501_1.time_ >= var_504_16 + var_504_17 and arg_501_1.time_ < var_504_16 + var_504_17 + arg_504_0 then
				var_504_15.localPosition = Vector3.New(0, 100, 0)

				local var_504_22 = manager.ui.mainCamera.transform.position - var_504_15.position

				var_504_15.forward = Vector3.New(var_504_22.x, var_504_22.y, var_504_22.z)

				local var_504_23 = var_504_15.localEulerAngles

				var_504_23.z = 0
				var_504_23.x = 0
				var_504_15.localEulerAngles = var_504_23
			end

			local var_504_24 = arg_501_1.actors_["10076ui_story"]
			local var_504_25 = 0

			if var_504_25 < arg_501_1.time_ and arg_501_1.time_ <= var_504_25 + arg_504_0 and arg_501_1.var_.characterEffect10076ui_story == nil then
				arg_501_1.var_.characterEffect10076ui_story = var_504_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_26 = 0.200000002980232

			if var_504_25 <= arg_501_1.time_ and arg_501_1.time_ < var_504_25 + var_504_26 then
				local var_504_27 = (arg_501_1.time_ - var_504_25) / var_504_26

				if arg_501_1.var_.characterEffect10076ui_story then
					local var_504_28 = Mathf.Lerp(0, 0.5, var_504_27)

					arg_501_1.var_.characterEffect10076ui_story.fillFlat = true
					arg_501_1.var_.characterEffect10076ui_story.fillRatio = var_504_28
				end
			end

			if arg_501_1.time_ >= var_504_25 + var_504_26 and arg_501_1.time_ < var_504_25 + var_504_26 + arg_504_0 and arg_501_1.var_.characterEffect10076ui_story then
				local var_504_29 = 0.5

				arg_501_1.var_.characterEffect10076ui_story.fillFlat = true
				arg_501_1.var_.characterEffect10076ui_story.fillRatio = var_504_29
			end

			local var_504_30 = 0
			local var_504_31 = 0.475

			if var_504_30 < arg_501_1.time_ and arg_501_1.time_ <= var_504_30 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_32 = arg_501_1:FormatText(StoryNameCfg[920].name)

				arg_501_1.leftNameTxt_.text = var_504_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_33 = arg_501_1:GetWordFromCfg(412031121)
				local var_504_34 = arg_501_1:FormatText(var_504_33.content)

				arg_501_1.text_.text = var_504_34

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_35 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031121", "story_v_out_412031.awb") ~= 0 then
					local var_504_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031121", "story_v_out_412031.awb") / 1000

					if var_504_38 + var_504_30 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_38 + var_504_30
					end

					if var_504_33.prefab_name ~= "" and arg_501_1.actors_[var_504_33.prefab_name] ~= nil then
						local var_504_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_33.prefab_name].transform, "story_v_out_412031", "412031121", "story_v_out_412031.awb")

						arg_501_1:RecordAudio("412031121", var_504_39)
						arg_501_1:RecordAudio("412031121", var_504_39)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_412031", "412031121", "story_v_out_412031.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_412031", "412031121", "story_v_out_412031.awb")
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
	Play412031122 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 412031122
		arg_505_1.duration_ = 9.666

		local var_505_0 = {
			zh = 8.533,
			ja = 9.666
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
				arg_505_0:Play412031123(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = 0
			local var_508_1 = 0.8

			if var_508_0 < arg_505_1.time_ and arg_505_1.time_ <= var_508_0 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_2 = arg_505_1:FormatText(StoryNameCfg[920].name)

				arg_505_1.leftNameTxt_.text = var_508_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_3 = arg_505_1:GetWordFromCfg(412031122)
				local var_508_4 = arg_505_1:FormatText(var_508_3.content)

				arg_505_1.text_.text = var_508_4

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_5 = 32
				local var_508_6 = utf8.len(var_508_4)
				local var_508_7 = var_508_5 <= 0 and var_508_1 or var_508_1 * (var_508_6 / var_508_5)

				if var_508_7 > 0 and var_508_1 < var_508_7 then
					arg_505_1.talkMaxDuration = var_508_7

					if var_508_7 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_7 + var_508_0
					end
				end

				arg_505_1.text_.text = var_508_4
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031122", "story_v_out_412031.awb") ~= 0 then
					local var_508_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031122", "story_v_out_412031.awb") / 1000

					if var_508_8 + var_508_0 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_8 + var_508_0
					end

					if var_508_3.prefab_name ~= "" and arg_505_1.actors_[var_508_3.prefab_name] ~= nil then
						local var_508_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_3.prefab_name].transform, "story_v_out_412031", "412031122", "story_v_out_412031.awb")

						arg_505_1:RecordAudio("412031122", var_508_9)
						arg_505_1:RecordAudio("412031122", var_508_9)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_412031", "412031122", "story_v_out_412031.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_412031", "412031122", "story_v_out_412031.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_10 = math.max(var_508_1, arg_505_1.talkMaxDuration)

			if var_508_0 <= arg_505_1.time_ and arg_505_1.time_ < var_508_0 + var_508_10 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_0) / var_508_10

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_0 + var_508_10 and arg_505_1.time_ < var_508_0 + var_508_10 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play412031123 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 412031123
		arg_509_1.duration_ = 5

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play412031124(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["3043ui_story"].transform
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.var_.moveOldPos3043ui_story = var_512_0.localPosition
			end

			local var_512_2 = 0.001

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2
				local var_512_4 = Vector3.New(0, 100, 0)

				var_512_0.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos3043ui_story, var_512_4, var_512_3)

				local var_512_5 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_5.x, var_512_5.y, var_512_5.z)

				local var_512_6 = var_512_0.localEulerAngles

				var_512_6.z = 0
				var_512_6.x = 0
				var_512_0.localEulerAngles = var_512_6
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 then
				var_512_0.localPosition = Vector3.New(0, 100, 0)

				local var_512_7 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_7.x, var_512_7.y, var_512_7.z)

				local var_512_8 = var_512_0.localEulerAngles

				var_512_8.z = 0
				var_512_8.x = 0
				var_512_0.localEulerAngles = var_512_8
			end

			local var_512_9 = arg_509_1.actors_["3043ui_story"]
			local var_512_10 = 0

			if var_512_10 < arg_509_1.time_ and arg_509_1.time_ <= var_512_10 + arg_512_0 and arg_509_1.var_.characterEffect3043ui_story == nil then
				arg_509_1.var_.characterEffect3043ui_story = var_512_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_11 = 0.200000002980232

			if var_512_10 <= arg_509_1.time_ and arg_509_1.time_ < var_512_10 + var_512_11 then
				local var_512_12 = (arg_509_1.time_ - var_512_10) / var_512_11

				if arg_509_1.var_.characterEffect3043ui_story then
					local var_512_13 = Mathf.Lerp(0, 0.5, var_512_12)

					arg_509_1.var_.characterEffect3043ui_story.fillFlat = true
					arg_509_1.var_.characterEffect3043ui_story.fillRatio = var_512_13
				end
			end

			if arg_509_1.time_ >= var_512_10 + var_512_11 and arg_509_1.time_ < var_512_10 + var_512_11 + arg_512_0 and arg_509_1.var_.characterEffect3043ui_story then
				local var_512_14 = 0.5

				arg_509_1.var_.characterEffect3043ui_story.fillFlat = true
				arg_509_1.var_.characterEffect3043ui_story.fillRatio = var_512_14
			end

			local var_512_15 = 0
			local var_512_16 = 0.35

			if var_512_15 < arg_509_1.time_ and arg_509_1.time_ <= var_512_15 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, false)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_17 = arg_509_1:GetWordFromCfg(412031123)
				local var_512_18 = arg_509_1:FormatText(var_512_17.content)

				arg_509_1.text_.text = var_512_18

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_19 = 14
				local var_512_20 = utf8.len(var_512_18)
				local var_512_21 = var_512_19 <= 0 and var_512_16 or var_512_16 * (var_512_20 / var_512_19)

				if var_512_21 > 0 and var_512_16 < var_512_21 then
					arg_509_1.talkMaxDuration = var_512_21

					if var_512_21 + var_512_15 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_21 + var_512_15
					end
				end

				arg_509_1.text_.text = var_512_18
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)
				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_22 = math.max(var_512_16, arg_509_1.talkMaxDuration)

			if var_512_15 <= arg_509_1.time_ and arg_509_1.time_ < var_512_15 + var_512_22 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_15) / var_512_22

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_15 + var_512_22 and arg_509_1.time_ < var_512_15 + var_512_22 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play412031124 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 412031124
		arg_513_1.duration_ = 3.233

		local var_513_0 = {
			zh = 3.233,
			ja = 1.999999999999
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
				arg_513_0:Play412031125(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = arg_513_1.actors_["1097ui_story"].transform
			local var_516_1 = 0

			if var_516_1 < arg_513_1.time_ and arg_513_1.time_ <= var_516_1 + arg_516_0 then
				arg_513_1.var_.moveOldPos1097ui_story = var_516_0.localPosition
			end

			local var_516_2 = 0.001

			if var_516_1 <= arg_513_1.time_ and arg_513_1.time_ < var_516_1 + var_516_2 then
				local var_516_3 = (arg_513_1.time_ - var_516_1) / var_516_2
				local var_516_4 = Vector3.New(0, -0.54, -6.3)

				var_516_0.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos1097ui_story, var_516_4, var_516_3)

				local var_516_5 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_5.x, var_516_5.y, var_516_5.z)

				local var_516_6 = var_516_0.localEulerAngles

				var_516_6.z = 0
				var_516_6.x = 0
				var_516_0.localEulerAngles = var_516_6
			end

			if arg_513_1.time_ >= var_516_1 + var_516_2 and arg_513_1.time_ < var_516_1 + var_516_2 + arg_516_0 then
				var_516_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_516_7 = manager.ui.mainCamera.transform.position - var_516_0.position

				var_516_0.forward = Vector3.New(var_516_7.x, var_516_7.y, var_516_7.z)

				local var_516_8 = var_516_0.localEulerAngles

				var_516_8.z = 0
				var_516_8.x = 0
				var_516_0.localEulerAngles = var_516_8
			end

			local var_516_9 = arg_513_1.actors_["1097ui_story"]
			local var_516_10 = 0

			if var_516_10 < arg_513_1.time_ and arg_513_1.time_ <= var_516_10 + arg_516_0 and arg_513_1.var_.characterEffect1097ui_story == nil then
				arg_513_1.var_.characterEffect1097ui_story = var_516_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_516_11 = 0.200000002980232

			if var_516_10 <= arg_513_1.time_ and arg_513_1.time_ < var_516_10 + var_516_11 then
				local var_516_12 = (arg_513_1.time_ - var_516_10) / var_516_11

				if arg_513_1.var_.characterEffect1097ui_story then
					arg_513_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_513_1.time_ >= var_516_10 + var_516_11 and arg_513_1.time_ < var_516_10 + var_516_11 + arg_516_0 and arg_513_1.var_.characterEffect1097ui_story then
				arg_513_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_516_13 = 0

			if var_516_13 < arg_513_1.time_ and arg_513_1.time_ <= var_516_13 + arg_516_0 then
				arg_513_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action3_1")
			end

			local var_516_14 = 0

			if var_516_14 < arg_513_1.time_ and arg_513_1.time_ <= var_516_14 + arg_516_0 then
				arg_513_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_516_15 = arg_513_1.actors_["3043ui_story"].transform
			local var_516_16 = 0

			if var_516_16 < arg_513_1.time_ and arg_513_1.time_ <= var_516_16 + arg_516_0 then
				arg_513_1.var_.moveOldPos3043ui_story = var_516_15.localPosition
			end

			local var_516_17 = 0.001

			if var_516_16 <= arg_513_1.time_ and arg_513_1.time_ < var_516_16 + var_516_17 then
				local var_516_18 = (arg_513_1.time_ - var_516_16) / var_516_17
				local var_516_19 = Vector3.New(0, 100, 0)

				var_516_15.localPosition = Vector3.Lerp(arg_513_1.var_.moveOldPos3043ui_story, var_516_19, var_516_18)

				local var_516_20 = manager.ui.mainCamera.transform.position - var_516_15.position

				var_516_15.forward = Vector3.New(var_516_20.x, var_516_20.y, var_516_20.z)

				local var_516_21 = var_516_15.localEulerAngles

				var_516_21.z = 0
				var_516_21.x = 0
				var_516_15.localEulerAngles = var_516_21
			end

			if arg_513_1.time_ >= var_516_16 + var_516_17 and arg_513_1.time_ < var_516_16 + var_516_17 + arg_516_0 then
				var_516_15.localPosition = Vector3.New(0, 100, 0)

				local var_516_22 = manager.ui.mainCamera.transform.position - var_516_15.position

				var_516_15.forward = Vector3.New(var_516_22.x, var_516_22.y, var_516_22.z)

				local var_516_23 = var_516_15.localEulerAngles

				var_516_23.z = 0
				var_516_23.x = 0
				var_516_15.localEulerAngles = var_516_23
			end

			local var_516_24 = 0
			local var_516_25 = 0.3

			if var_516_24 < arg_513_1.time_ and arg_513_1.time_ <= var_516_24 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_26 = arg_513_1:FormatText(StoryNameCfg[216].name)

				arg_513_1.leftNameTxt_.text = var_516_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_27 = arg_513_1:GetWordFromCfg(412031124)
				local var_516_28 = arg_513_1:FormatText(var_516_27.content)

				arg_513_1.text_.text = var_516_28

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_29 = 12
				local var_516_30 = utf8.len(var_516_28)
				local var_516_31 = var_516_29 <= 0 and var_516_25 or var_516_25 * (var_516_30 / var_516_29)

				if var_516_31 > 0 and var_516_25 < var_516_31 then
					arg_513_1.talkMaxDuration = var_516_31

					if var_516_31 + var_516_24 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_31 + var_516_24
					end
				end

				arg_513_1.text_.text = var_516_28
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031124", "story_v_out_412031.awb") ~= 0 then
					local var_516_32 = manager.audio:GetVoiceLength("story_v_out_412031", "412031124", "story_v_out_412031.awb") / 1000

					if var_516_32 + var_516_24 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_32 + var_516_24
					end

					if var_516_27.prefab_name ~= "" and arg_513_1.actors_[var_516_27.prefab_name] ~= nil then
						local var_516_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_27.prefab_name].transform, "story_v_out_412031", "412031124", "story_v_out_412031.awb")

						arg_513_1:RecordAudio("412031124", var_516_33)
						arg_513_1:RecordAudio("412031124", var_516_33)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_412031", "412031124", "story_v_out_412031.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_412031", "412031124", "story_v_out_412031.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_34 = math.max(var_516_25, arg_513_1.talkMaxDuration)

			if var_516_24 <= arg_513_1.time_ and arg_513_1.time_ < var_516_24 + var_516_34 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_24) / var_516_34

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_24 + var_516_34 and arg_513_1.time_ < var_516_24 + var_516_34 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play412031125 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 412031125
		arg_517_1.duration_ = 3.5

		local var_517_0 = {
			zh = 2.6,
			ja = 3.5
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
				arg_517_0:Play412031126(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["10078ui_story"].transform
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 then
				arg_517_1.var_.moveOldPos10078ui_story = var_520_0.localPosition
			end

			local var_520_2 = 0.001

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2
				local var_520_4 = Vector3.New(0, -0.5, -6.3)

				var_520_0.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos10078ui_story, var_520_4, var_520_3)

				local var_520_5 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_5.x, var_520_5.y, var_520_5.z)

				local var_520_6 = var_520_0.localEulerAngles

				var_520_6.z = 0
				var_520_6.x = 0
				var_520_0.localEulerAngles = var_520_6
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 then
				var_520_0.localPosition = Vector3.New(0, -0.5, -6.3)

				local var_520_7 = manager.ui.mainCamera.transform.position - var_520_0.position

				var_520_0.forward = Vector3.New(var_520_7.x, var_520_7.y, var_520_7.z)

				local var_520_8 = var_520_0.localEulerAngles

				var_520_8.z = 0
				var_520_8.x = 0
				var_520_0.localEulerAngles = var_520_8
			end

			local var_520_9 = arg_517_1.actors_["10078ui_story"]
			local var_520_10 = 0

			if var_520_10 < arg_517_1.time_ and arg_517_1.time_ <= var_520_10 + arg_520_0 and arg_517_1.var_.characterEffect10078ui_story == nil then
				arg_517_1.var_.characterEffect10078ui_story = var_520_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_11 = 0.200000002980232

			if var_520_10 <= arg_517_1.time_ and arg_517_1.time_ < var_520_10 + var_520_11 then
				local var_520_12 = (arg_517_1.time_ - var_520_10) / var_520_11

				if arg_517_1.var_.characterEffect10078ui_story then
					arg_517_1.var_.characterEffect10078ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_10 + var_520_11 and arg_517_1.time_ < var_520_10 + var_520_11 + arg_520_0 and arg_517_1.var_.characterEffect10078ui_story then
				arg_517_1.var_.characterEffect10078ui_story.fillFlat = false
			end

			local var_520_13 = 0

			if var_520_13 < arg_517_1.time_ and arg_517_1.time_ <= var_520_13 + arg_520_0 then
				arg_517_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/6046/6046action/6046action4_2")
			end

			local var_520_14 = 0

			if var_520_14 < arg_517_1.time_ and arg_517_1.time_ <= var_520_14 + arg_520_0 then
				arg_517_1:PlayTimeline("10078ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_520_15 = arg_517_1.actors_["1097ui_story"].transform
			local var_520_16 = 0

			if var_520_16 < arg_517_1.time_ and arg_517_1.time_ <= var_520_16 + arg_520_0 then
				arg_517_1.var_.moveOldPos1097ui_story = var_520_15.localPosition
			end

			local var_520_17 = 0.001

			if var_520_16 <= arg_517_1.time_ and arg_517_1.time_ < var_520_16 + var_520_17 then
				local var_520_18 = (arg_517_1.time_ - var_520_16) / var_520_17
				local var_520_19 = Vector3.New(0, 100, 0)

				var_520_15.localPosition = Vector3.Lerp(arg_517_1.var_.moveOldPos1097ui_story, var_520_19, var_520_18)

				local var_520_20 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_20.x, var_520_20.y, var_520_20.z)

				local var_520_21 = var_520_15.localEulerAngles

				var_520_21.z = 0
				var_520_21.x = 0
				var_520_15.localEulerAngles = var_520_21
			end

			if arg_517_1.time_ >= var_520_16 + var_520_17 and arg_517_1.time_ < var_520_16 + var_520_17 + arg_520_0 then
				var_520_15.localPosition = Vector3.New(0, 100, 0)

				local var_520_22 = manager.ui.mainCamera.transform.position - var_520_15.position

				var_520_15.forward = Vector3.New(var_520_22.x, var_520_22.y, var_520_22.z)

				local var_520_23 = var_520_15.localEulerAngles

				var_520_23.z = 0
				var_520_23.x = 0
				var_520_15.localEulerAngles = var_520_23
			end

			local var_520_24 = arg_517_1.actors_["1097ui_story"]
			local var_520_25 = 0

			if var_520_25 < arg_517_1.time_ and arg_517_1.time_ <= var_520_25 + arg_520_0 and arg_517_1.var_.characterEffect1097ui_story == nil then
				arg_517_1.var_.characterEffect1097ui_story = var_520_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_26 = 0.200000002980232

			if var_520_25 <= arg_517_1.time_ and arg_517_1.time_ < var_520_25 + var_520_26 then
				local var_520_27 = (arg_517_1.time_ - var_520_25) / var_520_26

				if arg_517_1.var_.characterEffect1097ui_story then
					local var_520_28 = Mathf.Lerp(0, 0.5, var_520_27)

					arg_517_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_517_1.var_.characterEffect1097ui_story.fillRatio = var_520_28
				end
			end

			if arg_517_1.time_ >= var_520_25 + var_520_26 and arg_517_1.time_ < var_520_25 + var_520_26 + arg_520_0 and arg_517_1.var_.characterEffect1097ui_story then
				local var_520_29 = 0.5

				arg_517_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_517_1.var_.characterEffect1097ui_story.fillRatio = var_520_29
			end

			local var_520_30 = 0
			local var_520_31 = 0.175

			if var_520_30 < arg_517_1.time_ and arg_517_1.time_ <= var_520_30 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_32 = arg_517_1:FormatText(StoryNameCfg[919].name)

				arg_517_1.leftNameTxt_.text = var_520_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_33 = arg_517_1:GetWordFromCfg(412031125)
				local var_520_34 = arg_517_1:FormatText(var_520_33.content)

				arg_517_1.text_.text = var_520_34

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_35 = 7
				local var_520_36 = utf8.len(var_520_34)
				local var_520_37 = var_520_35 <= 0 and var_520_31 or var_520_31 * (var_520_36 / var_520_35)

				if var_520_37 > 0 and var_520_31 < var_520_37 then
					arg_517_1.talkMaxDuration = var_520_37

					if var_520_37 + var_520_30 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_37 + var_520_30
					end
				end

				arg_517_1.text_.text = var_520_34
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031125", "story_v_out_412031.awb") ~= 0 then
					local var_520_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031125", "story_v_out_412031.awb") / 1000

					if var_520_38 + var_520_30 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_38 + var_520_30
					end

					if var_520_33.prefab_name ~= "" and arg_517_1.actors_[var_520_33.prefab_name] ~= nil then
						local var_520_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_33.prefab_name].transform, "story_v_out_412031", "412031125", "story_v_out_412031.awb")

						arg_517_1:RecordAudio("412031125", var_520_39)
						arg_517_1:RecordAudio("412031125", var_520_39)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_412031", "412031125", "story_v_out_412031.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_412031", "412031125", "story_v_out_412031.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_40 = math.max(var_520_31, arg_517_1.talkMaxDuration)

			if var_520_30 <= arg_517_1.time_ and arg_517_1.time_ < var_520_30 + var_520_40 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_30) / var_520_40

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_30 + var_520_40 and arg_517_1.time_ < var_520_30 + var_520_40 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play412031126 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 412031126
		arg_521_1.duration_ = 9.166

		local var_521_0 = {
			zh = 8.266,
			ja = 9.166
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
				arg_521_0:Play412031127(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["10083ui_story"].transform
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 then
				arg_521_1.var_.moveOldPos10083ui_story = var_524_0.localPosition
			end

			local var_524_2 = 0.001

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2
				local var_524_4 = Vector3.New(0, -2.6, -2.8)

				var_524_0.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos10083ui_story, var_524_4, var_524_3)

				local var_524_5 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_5.x, var_524_5.y, var_524_5.z)

				local var_524_6 = var_524_0.localEulerAngles

				var_524_6.z = 0
				var_524_6.x = 0
				var_524_0.localEulerAngles = var_524_6
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 then
				var_524_0.localPosition = Vector3.New(0, -2.6, -2.8)

				local var_524_7 = manager.ui.mainCamera.transform.position - var_524_0.position

				var_524_0.forward = Vector3.New(var_524_7.x, var_524_7.y, var_524_7.z)

				local var_524_8 = var_524_0.localEulerAngles

				var_524_8.z = 0
				var_524_8.x = 0
				var_524_0.localEulerAngles = var_524_8
			end

			local var_524_9 = arg_521_1.actors_["10083ui_story"]
			local var_524_10 = 0

			if var_524_10 < arg_521_1.time_ and arg_521_1.time_ <= var_524_10 + arg_524_0 and arg_521_1.var_.characterEffect10083ui_story == nil then
				arg_521_1.var_.characterEffect10083ui_story = var_524_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_11 = 0.200000002980232

			if var_524_10 <= arg_521_1.time_ and arg_521_1.time_ < var_524_10 + var_524_11 then
				local var_524_12 = (arg_521_1.time_ - var_524_10) / var_524_11

				if arg_521_1.var_.characterEffect10083ui_story then
					arg_521_1.var_.characterEffect10083ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_10 + var_524_11 and arg_521_1.time_ < var_524_10 + var_524_11 + arg_524_0 and arg_521_1.var_.characterEffect10083ui_story then
				arg_521_1.var_.characterEffect10083ui_story.fillFlat = false
			end

			local var_524_13 = 0

			if var_524_13 < arg_521_1.time_ and arg_521_1.time_ <= var_524_13 + arg_524_0 then
				arg_521_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/story10083/story10083action/10083action1_1")
			end

			local var_524_14 = 0

			if var_524_14 < arg_521_1.time_ and arg_521_1.time_ <= var_524_14 + arg_524_0 then
				arg_521_1:PlayTimeline("10083ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_524_15 = arg_521_1.actors_["10078ui_story"].transform
			local var_524_16 = 0

			if var_524_16 < arg_521_1.time_ and arg_521_1.time_ <= var_524_16 + arg_524_0 then
				arg_521_1.var_.moveOldPos10078ui_story = var_524_15.localPosition
			end

			local var_524_17 = 0.001

			if var_524_16 <= arg_521_1.time_ and arg_521_1.time_ < var_524_16 + var_524_17 then
				local var_524_18 = (arg_521_1.time_ - var_524_16) / var_524_17
				local var_524_19 = Vector3.New(0, 100, 0)

				var_524_15.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos10078ui_story, var_524_19, var_524_18)

				local var_524_20 = manager.ui.mainCamera.transform.position - var_524_15.position

				var_524_15.forward = Vector3.New(var_524_20.x, var_524_20.y, var_524_20.z)

				local var_524_21 = var_524_15.localEulerAngles

				var_524_21.z = 0
				var_524_21.x = 0
				var_524_15.localEulerAngles = var_524_21
			end

			if arg_521_1.time_ >= var_524_16 + var_524_17 and arg_521_1.time_ < var_524_16 + var_524_17 + arg_524_0 then
				var_524_15.localPosition = Vector3.New(0, 100, 0)

				local var_524_22 = manager.ui.mainCamera.transform.position - var_524_15.position

				var_524_15.forward = Vector3.New(var_524_22.x, var_524_22.y, var_524_22.z)

				local var_524_23 = var_524_15.localEulerAngles

				var_524_23.z = 0
				var_524_23.x = 0
				var_524_15.localEulerAngles = var_524_23
			end

			local var_524_24 = arg_521_1.actors_["10078ui_story"]
			local var_524_25 = 0

			if var_524_25 < arg_521_1.time_ and arg_521_1.time_ <= var_524_25 + arg_524_0 and arg_521_1.var_.characterEffect10078ui_story == nil then
				arg_521_1.var_.characterEffect10078ui_story = var_524_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_26 = 0.200000002980232

			if var_524_25 <= arg_521_1.time_ and arg_521_1.time_ < var_524_25 + var_524_26 then
				local var_524_27 = (arg_521_1.time_ - var_524_25) / var_524_26

				if arg_521_1.var_.characterEffect10078ui_story then
					local var_524_28 = Mathf.Lerp(0, 0.5, var_524_27)

					arg_521_1.var_.characterEffect10078ui_story.fillFlat = true
					arg_521_1.var_.characterEffect10078ui_story.fillRatio = var_524_28
				end
			end

			if arg_521_1.time_ >= var_524_25 + var_524_26 and arg_521_1.time_ < var_524_25 + var_524_26 + arg_524_0 and arg_521_1.var_.characterEffect10078ui_story then
				local var_524_29 = 0.5

				arg_521_1.var_.characterEffect10078ui_story.fillFlat = true
				arg_521_1.var_.characterEffect10078ui_story.fillRatio = var_524_29
			end

			local var_524_30 = 0
			local var_524_31 = 0.85

			if var_524_30 < arg_521_1.time_ and arg_521_1.time_ <= var_524_30 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_32 = arg_521_1:FormatText(StoryNameCfg[918].name)

				arg_521_1.leftNameTxt_.text = var_524_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_33 = arg_521_1:GetWordFromCfg(412031126)
				local var_524_34 = arg_521_1:FormatText(var_524_33.content)

				arg_521_1.text_.text = var_524_34

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_35 = 34
				local var_524_36 = utf8.len(var_524_34)
				local var_524_37 = var_524_35 <= 0 and var_524_31 or var_524_31 * (var_524_36 / var_524_35)

				if var_524_37 > 0 and var_524_31 < var_524_37 then
					arg_521_1.talkMaxDuration = var_524_37

					if var_524_37 + var_524_30 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_37 + var_524_30
					end
				end

				arg_521_1.text_.text = var_524_34
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031126", "story_v_out_412031.awb") ~= 0 then
					local var_524_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031126", "story_v_out_412031.awb") / 1000

					if var_524_38 + var_524_30 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_38 + var_524_30
					end

					if var_524_33.prefab_name ~= "" and arg_521_1.actors_[var_524_33.prefab_name] ~= nil then
						local var_524_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_33.prefab_name].transform, "story_v_out_412031", "412031126", "story_v_out_412031.awb")

						arg_521_1:RecordAudio("412031126", var_524_39)
						arg_521_1:RecordAudio("412031126", var_524_39)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_412031", "412031126", "story_v_out_412031.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_412031", "412031126", "story_v_out_412031.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_40 = math.max(var_524_31, arg_521_1.talkMaxDuration)

			if var_524_30 <= arg_521_1.time_ and arg_521_1.time_ < var_524_30 + var_524_40 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_30) / var_524_40

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_30 + var_524_40 and arg_521_1.time_ < var_524_30 + var_524_40 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play412031127 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 412031127
		arg_525_1.duration_ = 10.966

		local var_525_0 = {
			zh = 4.833,
			ja = 10.966
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
				arg_525_0:Play412031128(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1097ui_story"].transform
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 then
				arg_525_1.var_.moveOldPos1097ui_story = var_528_0.localPosition
			end

			local var_528_2 = 0.001

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2
				local var_528_4 = Vector3.New(0, -0.54, -6.3)

				var_528_0.localPosition = Vector3.Lerp(arg_525_1.var_.moveOldPos1097ui_story, var_528_4, var_528_3)

				local var_528_5 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_5.x, var_528_5.y, var_528_5.z)

				local var_528_6 = var_528_0.localEulerAngles

				var_528_6.z = 0
				var_528_6.x = 0
				var_528_0.localEulerAngles = var_528_6
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 then
				var_528_0.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_528_7 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_7.x, var_528_7.y, var_528_7.z)

				local var_528_8 = var_528_0.localEulerAngles

				var_528_8.z = 0
				var_528_8.x = 0
				var_528_0.localEulerAngles = var_528_8
			end

			local var_528_9 = arg_525_1.actors_["1097ui_story"]
			local var_528_10 = 0

			if var_528_10 < arg_525_1.time_ and arg_525_1.time_ <= var_528_10 + arg_528_0 and arg_525_1.var_.characterEffect1097ui_story == nil then
				arg_525_1.var_.characterEffect1097ui_story = var_528_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_11 = 0.200000002980232

			if var_528_10 <= arg_525_1.time_ and arg_525_1.time_ < var_528_10 + var_528_11 then
				local var_528_12 = (arg_525_1.time_ - var_528_10) / var_528_11

				if arg_525_1.var_.characterEffect1097ui_story then
					arg_525_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_525_1.time_ >= var_528_10 + var_528_11 and arg_525_1.time_ < var_528_10 + var_528_11 + arg_528_0 and arg_525_1.var_.characterEffect1097ui_story then
				arg_525_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_528_13 = 0

			if var_528_13 < arg_525_1.time_ and arg_525_1.time_ <= var_528_13 + arg_528_0 then
				arg_525_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_528_14 = 0

			if var_528_14 < arg_525_1.time_ and arg_525_1.time_ <= var_528_14 + arg_528_0 then
				arg_525_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_528_15 = arg_525_1.actors_["10083ui_story"].transform
			local var_528_16 = 0

			if var_528_16 < arg_525_1.time_ and arg_525_1.time_ <= var_528_16 + arg_528_0 then
				arg_525_1.var_.moveOldPos10083ui_story = var_528_15.localPosition
			end

			local var_528_17 = 0.001

			if var_528_16 <= arg_525_1.time_ and arg_525_1.time_ < var_528_16 + var_528_17 then
				local var_528_18 = (arg_525_1.time_ - var_528_16) / var_528_17
				local var_528_19 = Vector3.New(0, 100, 0)

				var_528_15.localPosition = Vector3.Lerp(arg_525_1.var_.moveOldPos10083ui_story, var_528_19, var_528_18)

				local var_528_20 = manager.ui.mainCamera.transform.position - var_528_15.position

				var_528_15.forward = Vector3.New(var_528_20.x, var_528_20.y, var_528_20.z)

				local var_528_21 = var_528_15.localEulerAngles

				var_528_21.z = 0
				var_528_21.x = 0
				var_528_15.localEulerAngles = var_528_21
			end

			if arg_525_1.time_ >= var_528_16 + var_528_17 and arg_525_1.time_ < var_528_16 + var_528_17 + arg_528_0 then
				var_528_15.localPosition = Vector3.New(0, 100, 0)

				local var_528_22 = manager.ui.mainCamera.transform.position - var_528_15.position

				var_528_15.forward = Vector3.New(var_528_22.x, var_528_22.y, var_528_22.z)

				local var_528_23 = var_528_15.localEulerAngles

				var_528_23.z = 0
				var_528_23.x = 0
				var_528_15.localEulerAngles = var_528_23
			end

			local var_528_24 = arg_525_1.actors_["10083ui_story"]
			local var_528_25 = 0

			if var_528_25 < arg_525_1.time_ and arg_525_1.time_ <= var_528_25 + arg_528_0 and arg_525_1.var_.characterEffect10083ui_story == nil then
				arg_525_1.var_.characterEffect10083ui_story = var_528_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_26 = 0.200000002980232

			if var_528_25 <= arg_525_1.time_ and arg_525_1.time_ < var_528_25 + var_528_26 then
				local var_528_27 = (arg_525_1.time_ - var_528_25) / var_528_26

				if arg_525_1.var_.characterEffect10083ui_story then
					local var_528_28 = Mathf.Lerp(0, 0.5, var_528_27)

					arg_525_1.var_.characterEffect10083ui_story.fillFlat = true
					arg_525_1.var_.characterEffect10083ui_story.fillRatio = var_528_28
				end
			end

			if arg_525_1.time_ >= var_528_25 + var_528_26 and arg_525_1.time_ < var_528_25 + var_528_26 + arg_528_0 and arg_525_1.var_.characterEffect10083ui_story then
				local var_528_29 = 0.5

				arg_525_1.var_.characterEffect10083ui_story.fillFlat = true
				arg_525_1.var_.characterEffect10083ui_story.fillRatio = var_528_29
			end

			local var_528_30 = 0
			local var_528_31 = 0.425

			if var_528_30 < arg_525_1.time_ and arg_525_1.time_ <= var_528_30 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_32 = arg_525_1:FormatText(StoryNameCfg[216].name)

				arg_525_1.leftNameTxt_.text = var_528_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_33 = arg_525_1:GetWordFromCfg(412031127)
				local var_528_34 = arg_525_1:FormatText(var_528_33.content)

				arg_525_1.text_.text = var_528_34

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_35 = 17
				local var_528_36 = utf8.len(var_528_34)
				local var_528_37 = var_528_35 <= 0 and var_528_31 or var_528_31 * (var_528_36 / var_528_35)

				if var_528_37 > 0 and var_528_31 < var_528_37 then
					arg_525_1.talkMaxDuration = var_528_37

					if var_528_37 + var_528_30 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_37 + var_528_30
					end
				end

				arg_525_1.text_.text = var_528_34
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031127", "story_v_out_412031.awb") ~= 0 then
					local var_528_38 = manager.audio:GetVoiceLength("story_v_out_412031", "412031127", "story_v_out_412031.awb") / 1000

					if var_528_38 + var_528_30 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_38 + var_528_30
					end

					if var_528_33.prefab_name ~= "" and arg_525_1.actors_[var_528_33.prefab_name] ~= nil then
						local var_528_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_33.prefab_name].transform, "story_v_out_412031", "412031127", "story_v_out_412031.awb")

						arg_525_1:RecordAudio("412031127", var_528_39)
						arg_525_1:RecordAudio("412031127", var_528_39)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_412031", "412031127", "story_v_out_412031.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_412031", "412031127", "story_v_out_412031.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_40 = math.max(var_528_31, arg_525_1.talkMaxDuration)

			if var_528_30 <= arg_525_1.time_ and arg_525_1.time_ < var_528_30 + var_528_40 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_30) / var_528_40

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_30 + var_528_40 and arg_525_1.time_ < var_528_30 + var_528_40 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play412031128 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 412031128
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play412031129(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["1097ui_story"].transform
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 then
				arg_529_1.var_.moveOldPos1097ui_story = var_532_0.localPosition
			end

			local var_532_2 = 0.001

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2
				local var_532_4 = Vector3.New(0, 100, 0)

				var_532_0.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos1097ui_story, var_532_4, var_532_3)

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

			local var_532_9 = arg_529_1.actors_["1097ui_story"]
			local var_532_10 = 0

			if var_532_10 < arg_529_1.time_ and arg_529_1.time_ <= var_532_10 + arg_532_0 and arg_529_1.var_.characterEffect1097ui_story == nil then
				arg_529_1.var_.characterEffect1097ui_story = var_532_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_11 = 0.200000002980232

			if var_532_10 <= arg_529_1.time_ and arg_529_1.time_ < var_532_10 + var_532_11 then
				local var_532_12 = (arg_529_1.time_ - var_532_10) / var_532_11

				if arg_529_1.var_.characterEffect1097ui_story then
					local var_532_13 = Mathf.Lerp(0, 0.5, var_532_12)

					arg_529_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_529_1.var_.characterEffect1097ui_story.fillRatio = var_532_13
				end
			end

			if arg_529_1.time_ >= var_532_10 + var_532_11 and arg_529_1.time_ < var_532_10 + var_532_11 + arg_532_0 and arg_529_1.var_.characterEffect1097ui_story then
				local var_532_14 = 0.5

				arg_529_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_529_1.var_.characterEffect1097ui_story.fillRatio = var_532_14
			end

			local var_532_15 = 0
			local var_532_16 = 1.1

			if var_532_15 < arg_529_1.time_ and arg_529_1.time_ <= var_532_15 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_17 = arg_529_1:GetWordFromCfg(412031128)
				local var_532_18 = arg_529_1:FormatText(var_532_17.content)

				arg_529_1.text_.text = var_532_18

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_19 = 44
				local var_532_20 = utf8.len(var_532_18)
				local var_532_21 = var_532_19 <= 0 and var_532_16 or var_532_16 * (var_532_20 / var_532_19)

				if var_532_21 > 0 and var_532_16 < var_532_21 then
					arg_529_1.talkMaxDuration = var_532_21

					if var_532_21 + var_532_15 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_21 + var_532_15
					end
				end

				arg_529_1.text_.text = var_532_18
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_22 = math.max(var_532_16, arg_529_1.talkMaxDuration)

			if var_532_15 <= arg_529_1.time_ and arg_529_1.time_ < var_532_15 + var_532_22 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_15) / var_532_22

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_15 + var_532_22 and arg_529_1.time_ < var_532_15 + var_532_22 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play412031129 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 412031129
		arg_533_1.duration_ = 9

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play412031130(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = "EN0103"

			if arg_533_1.bgs_[var_536_0] == nil then
				local var_536_1 = Object.Instantiate(arg_533_1.paintGo_)

				var_536_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_536_0)
				var_536_1.name = var_536_0
				var_536_1.transform.parent = arg_533_1.stage_.transform
				var_536_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_533_1.bgs_[var_536_0] = var_536_1
			end

			local var_536_2 = 2

			if var_536_2 < arg_533_1.time_ and arg_533_1.time_ <= var_536_2 + arg_536_0 then
				local var_536_3 = manager.ui.mainCamera.transform.localPosition
				local var_536_4 = Vector3.New(0, 0, 10) + Vector3.New(var_536_3.x, var_536_3.y, 0)
				local var_536_5 = arg_533_1.bgs_.EN0103

				var_536_5.transform.localPosition = var_536_4
				var_536_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_536_6 = var_536_5:GetComponent("SpriteRenderer")

				if var_536_6 and var_536_6.sprite then
					local var_536_7 = (var_536_5.transform.localPosition - var_536_3).z
					local var_536_8 = manager.ui.mainCameraCom_
					local var_536_9 = 2 * var_536_7 * Mathf.Tan(var_536_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_536_10 = var_536_9 * var_536_8.aspect
					local var_536_11 = var_536_6.sprite.bounds.size.x
					local var_536_12 = var_536_6.sprite.bounds.size.y
					local var_536_13 = var_536_10 / var_536_11
					local var_536_14 = var_536_9 / var_536_12
					local var_536_15 = var_536_14 < var_536_13 and var_536_13 or var_536_14

					var_536_5.transform.localScale = Vector3.New(var_536_15, var_536_15, 0)
				end

				for iter_536_0, iter_536_1 in pairs(arg_533_1.bgs_) do
					if iter_536_0 ~= "EN0103" then
						iter_536_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_536_16 = 4

			if var_536_16 < arg_533_1.time_ and arg_533_1.time_ <= var_536_16 + arg_536_0 then
				arg_533_1.allBtn_.enabled = false
			end

			local var_536_17 = 0.3

			if arg_533_1.time_ >= var_536_16 + var_536_17 and arg_533_1.time_ < var_536_16 + var_536_17 + arg_536_0 then
				arg_533_1.allBtn_.enabled = true
			end

			local var_536_18 = 0

			if var_536_18 < arg_533_1.time_ and arg_533_1.time_ <= var_536_18 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_19 = 2

			if var_536_18 <= arg_533_1.time_ and arg_533_1.time_ < var_536_18 + var_536_19 then
				local var_536_20 = (arg_533_1.time_ - var_536_18) / var_536_19
				local var_536_21 = Color.New(0, 0, 0)

				var_536_21.a = Mathf.Lerp(0, 1, var_536_20)
				arg_533_1.mask_.color = var_536_21
			end

			if arg_533_1.time_ >= var_536_18 + var_536_19 and arg_533_1.time_ < var_536_18 + var_536_19 + arg_536_0 then
				local var_536_22 = Color.New(0, 0, 0)

				var_536_22.a = 1
				arg_533_1.mask_.color = var_536_22
			end

			local var_536_23 = 2

			if var_536_23 < arg_533_1.time_ and arg_533_1.time_ <= var_536_23 + arg_536_0 then
				arg_533_1.mask_.enabled = true
				arg_533_1.mask_.raycastTarget = true

				arg_533_1:SetGaussion(false)
			end

			local var_536_24 = 2

			if var_536_23 <= arg_533_1.time_ and arg_533_1.time_ < var_536_23 + var_536_24 then
				local var_536_25 = (arg_533_1.time_ - var_536_23) / var_536_24
				local var_536_26 = Color.New(0, 0, 0)

				var_536_26.a = Mathf.Lerp(1, 0, var_536_25)
				arg_533_1.mask_.color = var_536_26
			end

			if arg_533_1.time_ >= var_536_23 + var_536_24 and arg_533_1.time_ < var_536_23 + var_536_24 + arg_536_0 then
				local var_536_27 = Color.New(0, 0, 0)
				local var_536_28 = 0

				arg_533_1.mask_.enabled = false
				var_536_27.a = var_536_28
				arg_533_1.mask_.color = var_536_27
			end

			local var_536_29 = 0
			local var_536_30 = 0.233333333333333

			if var_536_29 < arg_533_1.time_ and arg_533_1.time_ <= var_536_29 + arg_536_0 then
				local var_536_31 = "play"
				local var_536_32 = "music"

				arg_533_1:AudioAction(var_536_31, var_536_32, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_536_33 = arg_533_1.bgs_.EN0103.transform
			local var_536_34 = 2

			if var_536_34 < arg_533_1.time_ and arg_533_1.time_ <= var_536_34 + arg_536_0 then
				arg_533_1.var_.moveOldPosEN0103 = var_536_33.localPosition
			end

			local var_536_35 = 3

			if var_536_34 <= arg_533_1.time_ and arg_533_1.time_ < var_536_34 + var_536_35 then
				local var_536_36 = (arg_533_1.time_ - var_536_34) / var_536_35
				local var_536_37 = Vector3.New(0, 1, 9)

				var_536_33.localPosition = Vector3.Lerp(arg_533_1.var_.moveOldPosEN0103, var_536_37, var_536_36)
			end

			if arg_533_1.time_ >= var_536_34 + var_536_35 and arg_533_1.time_ < var_536_34 + var_536_35 + arg_536_0 then
				var_536_33.localPosition = Vector3.New(0, 1, 9)
			end

			local var_536_38 = 4

			if var_536_38 < arg_533_1.time_ and arg_533_1.time_ <= var_536_38 + arg_536_0 then
				arg_533_1.allBtn_.enabled = false
			end

			local var_536_39 = 1

			if arg_533_1.time_ >= var_536_38 + var_536_39 and arg_533_1.time_ < var_536_38 + var_536_39 + arg_536_0 then
				arg_533_1.allBtn_.enabled = true
			end

			if arg_533_1.frameCnt_ <= 1 then
				arg_533_1.dialog_:SetActive(false)
			end

			local var_536_40 = 4
			local var_536_41 = 0.45

			if var_536_40 < arg_533_1.time_ and arg_533_1.time_ <= var_536_40 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0

				arg_533_1.dialog_:SetActive(true)

				local var_536_42 = LeanTween.value(arg_533_1.dialog_, 0, 1, 0.3)

				var_536_42:setOnUpdate(LuaHelper.FloatAction(function(arg_537_0)
					arg_533_1.dialogCg_.alpha = arg_537_0
				end))
				var_536_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_533_1.dialog_)
					var_536_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_533_1.duration_ = arg_533_1.duration_ + 0.3

				SetActive(arg_533_1.leftNameGo_, false)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_43 = arg_533_1:GetWordFromCfg(412031129)
				local var_536_44 = arg_533_1:FormatText(var_536_43.content)

				arg_533_1.text_.text = var_536_44

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_45 = 18
				local var_536_46 = utf8.len(var_536_44)
				local var_536_47 = var_536_45 <= 0 and var_536_41 or var_536_41 * (var_536_46 / var_536_45)

				if var_536_47 > 0 and var_536_41 < var_536_47 then
					arg_533_1.talkMaxDuration = var_536_47
					var_536_40 = var_536_40 + 0.3

					if var_536_47 + var_536_40 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_47 + var_536_40
					end
				end

				arg_533_1.text_.text = var_536_44
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_48 = var_536_40 + 0.3
			local var_536_49 = math.max(var_536_41, arg_533_1.talkMaxDuration)

			if var_536_48 <= arg_533_1.time_ and arg_533_1.time_ < var_536_48 + var_536_49 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_48) / var_536_49

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_48 + var_536_49 and arg_533_1.time_ < var_536_48 + var_536_49 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play412031130 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 412031130
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play412031131(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.85

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_2 = arg_539_1:GetWordFromCfg(412031130)
				local var_542_3 = arg_539_1:FormatText(var_542_2.content)

				arg_539_1.text_.text = var_542_3

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_4 = 34
				local var_542_5 = utf8.len(var_542_3)
				local var_542_6 = var_542_4 <= 0 and var_542_1 or var_542_1 * (var_542_5 / var_542_4)

				if var_542_6 > 0 and var_542_1 < var_542_6 then
					arg_539_1.talkMaxDuration = var_542_6

					if var_542_6 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_6 + var_542_0
					end
				end

				arg_539_1.text_.text = var_542_3
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_7 = math.max(var_542_1, arg_539_1.talkMaxDuration)

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_7 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_0) / var_542_7

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_0 + var_542_7 and arg_539_1.time_ < var_542_0 + var_542_7 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play412031131 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 412031131
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play412031132(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 0.45

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_2 = arg_543_1:GetWordFromCfg(412031131)
				local var_546_3 = arg_543_1:FormatText(var_546_2.content)

				arg_543_1.text_.text = var_546_3

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_4 = 18
				local var_546_5 = utf8.len(var_546_3)
				local var_546_6 = var_546_4 <= 0 and var_546_1 or var_546_1 * (var_546_5 / var_546_4)

				if var_546_6 > 0 and var_546_1 < var_546_6 then
					arg_543_1.talkMaxDuration = var_546_6

					if var_546_6 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_6 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_3
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_7 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_7 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_7

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_7 and arg_543_1.time_ < var_546_0 + var_546_7 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play412031132 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 412031132
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play412031133(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 1.075

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, false)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_2 = arg_547_1:GetWordFromCfg(412031132)
				local var_550_3 = arg_547_1:FormatText(var_550_2.content)

				arg_547_1.text_.text = var_550_3

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_4 = 43
				local var_550_5 = utf8.len(var_550_3)
				local var_550_6 = var_550_4 <= 0 and var_550_1 or var_550_1 * (var_550_5 / var_550_4)

				if var_550_6 > 0 and var_550_1 < var_550_6 then
					arg_547_1.talkMaxDuration = var_550_6

					if var_550_6 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_6 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_3
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_7 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_7 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_7

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_7 and arg_547_1.time_ < var_550_0 + var_550_7 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play412031133 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 412031133
		arg_551_1.duration_ = 6.333

		local var_551_0 = {
			zh = 6.1,
			ja = 6.333
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
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play412031134(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.6

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_2 = arg_551_1:FormatText(StoryNameCfg[917].name)

				arg_551_1.leftNameTxt_.text = var_554_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, true)
				arg_551_1.iconController_:SetSelectedState("hero")

				arg_551_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10076")

				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_3 = arg_551_1:GetWordFromCfg(412031133)
				local var_554_4 = arg_551_1:FormatText(var_554_3.content)

				arg_551_1.text_.text = var_554_4

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_5 = 24
				local var_554_6 = utf8.len(var_554_4)
				local var_554_7 = var_554_5 <= 0 and var_554_1 or var_554_1 * (var_554_6 / var_554_5)

				if var_554_7 > 0 and var_554_1 < var_554_7 then
					arg_551_1.talkMaxDuration = var_554_7

					if var_554_7 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_7 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_4
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031133", "story_v_out_412031.awb") ~= 0 then
					local var_554_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031133", "story_v_out_412031.awb") / 1000

					if var_554_8 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_8 + var_554_0
					end

					if var_554_3.prefab_name ~= "" and arg_551_1.actors_[var_554_3.prefab_name] ~= nil then
						local var_554_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_3.prefab_name].transform, "story_v_out_412031", "412031133", "story_v_out_412031.awb")

						arg_551_1:RecordAudio("412031133", var_554_9)
						arg_551_1:RecordAudio("412031133", var_554_9)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_412031", "412031133", "story_v_out_412031.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_412031", "412031133", "story_v_out_412031.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_10 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_10 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_10

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_10 and arg_551_1.time_ < var_554_0 + var_554_10 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play412031134 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 412031134
		arg_555_1.duration_ = 5

		local var_555_0 = {
			zh = 4,
			ja = 5
		}
		local var_555_1 = manager.audio:GetLocalizationFlag()

		if var_555_0[var_555_1] ~= nil then
			arg_555_1.duration_ = var_555_0[var_555_1]
		end

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play412031135(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.275

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_2 = arg_555_1:FormatText(StoryNameCfg[216].name)

				arg_555_1.leftNameTxt_.text = var_558_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_3 = arg_555_1:GetWordFromCfg(412031134)
				local var_558_4 = arg_555_1:FormatText(var_558_3.content)

				arg_555_1.text_.text = var_558_4

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031134", "story_v_out_412031.awb") ~= 0 then
					local var_558_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031134", "story_v_out_412031.awb") / 1000

					if var_558_8 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_8 + var_558_0
					end

					if var_558_3.prefab_name ~= "" and arg_555_1.actors_[var_558_3.prefab_name] ~= nil then
						local var_558_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_3.prefab_name].transform, "story_v_out_412031", "412031134", "story_v_out_412031.awb")

						arg_555_1:RecordAudio("412031134", var_558_9)
						arg_555_1:RecordAudio("412031134", var_558_9)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_412031", "412031134", "story_v_out_412031.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_412031", "412031134", "story_v_out_412031.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_10 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_10 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_10

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_10 and arg_555_1.time_ < var_558_0 + var_558_10 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play412031135 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 412031135
		arg_559_1.duration_ = 5.133

		local var_559_0 = {
			zh = 3.833,
			ja = 5.133
		}
		local var_559_1 = manager.audio:GetLocalizationFlag()

		if var_559_0[var_559_1] ~= nil then
			arg_559_1.duration_ = var_559_0[var_559_1]
		end

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
			arg_559_1.auto_ = false
		end

		function arg_559_1.playNext_(arg_561_0)
			arg_559_1.onStoryFinished_()
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.25

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_2 = arg_559_1:FormatText(StoryNameCfg[216].name)

				arg_559_1.leftNameTxt_.text = var_562_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_3 = arg_559_1:GetWordFromCfg(412031135)
				local var_562_4 = arg_559_1:FormatText(var_562_3.content)

				arg_559_1.text_.text = var_562_4

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_412031", "412031135", "story_v_out_412031.awb") ~= 0 then
					local var_562_8 = manager.audio:GetVoiceLength("story_v_out_412031", "412031135", "story_v_out_412031.awb") / 1000

					if var_562_8 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_8 + var_562_0
					end

					if var_562_3.prefab_name ~= "" and arg_559_1.actors_[var_562_3.prefab_name] ~= nil then
						local var_562_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_3.prefab_name].transform, "story_v_out_412031", "412031135", "story_v_out_412031.awb")

						arg_559_1:RecordAudio("412031135", var_562_9)
						arg_559_1:RecordAudio("412031135", var_562_9)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_412031", "412031135", "story_v_out_412031.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_412031", "412031135", "story_v_out_412031.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I09j",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST30",
		"Assets/UIResources/UI_AB/TextureConfig/Background/EN0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/EN0103"
	},
	voices = {
		"story_v_out_412031.awb"
	}
}
