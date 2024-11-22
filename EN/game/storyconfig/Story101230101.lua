return {
	Play123011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 123011001
		arg_1_1.duration_ = 6.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play123011002(arg_1_1)
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
			local var_4_23 = 0.866666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_26 = 1.999999999999
			local var_4_27 = 1.525

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

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_29 = arg_1_1:GetWordFromCfg(123011001)
				local var_4_30 = arg_1_1:FormatText(var_4_29.content)

				arg_1_1.text_.text = var_4_30

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_31 = 61
				local var_4_32 = utf8.len(var_4_30)
				local var_4_33 = var_4_31 <= 0 and var_4_27 or var_4_27 * (var_4_32 / var_4_31)

				if var_4_33 > 0 and var_4_27 < var_4_33 then
					arg_1_1.talkMaxDuration = var_4_33
					var_4_26 = var_4_26 + 0.3

					if var_4_33 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_33 + var_4_26
					end
				end

				arg_1_1.text_.text = var_4_30
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_34 = var_4_26 + 0.3
			local var_4_35 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_34) / var_4_35

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play123011002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 123011002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play123011003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.05

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

				local var_10_2 = arg_7_1:GetWordFromCfg(123011002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 42
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
	Play123011003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 123011003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play123011004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.7

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(123011003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 28
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play123011004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 123011004
		arg_15_1.duration_ = 5.166

		local var_15_0 = {
			zh = 3.833,
			ja = 5.166
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
				arg_15_0:Play123011005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.35

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[475].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(123011004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011004", "story_v_out_123011.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011004", "story_v_out_123011.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_123011", "123011004", "story_v_out_123011.awb")

						arg_15_1:RecordAudio("123011004", var_18_9)
						arg_15_1:RecordAudio("123011004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_123011", "123011004", "story_v_out_123011.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_123011", "123011004", "story_v_out_123011.awb")
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
	Play123011005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 123011005
		arg_19_1.duration_ = 5.733

		local var_19_0 = {
			zh = 4.533,
			ja = 5.733
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
				arg_19_0:Play123011006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.5

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[475].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(123011005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 20
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011005", "story_v_out_123011.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011005", "story_v_out_123011.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_123011", "123011005", "story_v_out_123011.awb")

						arg_19_1:RecordAudio("123011005", var_22_9)
						arg_19_1:RecordAudio("123011005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_123011", "123011005", "story_v_out_123011.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_123011", "123011005", "story_v_out_123011.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play123011006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 123011006
		arg_23_1.duration_ = 9.366

		local var_23_0 = {
			zh = 5.666,
			ja = 9.366
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
				arg_23_0:Play123011007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.325

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[475].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(123011006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 13
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011006", "story_v_out_123011.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011006", "story_v_out_123011.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_123011", "123011006", "story_v_out_123011.awb")

						arg_23_1:RecordAudio("123011006", var_26_9)
						arg_23_1:RecordAudio("123011006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_123011", "123011006", "story_v_out_123011.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_123011", "123011006", "story_v_out_123011.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play123011007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 123011007
		arg_27_1.duration_ = 7.966

		local var_27_0 = {
			zh = 4.4,
			ja = 7.966
		}
		local var_27_1 = manager.audio:GetLocalizationFlag()

		if var_27_0[var_27_1] ~= nil then
			arg_27_1.duration_ = var_27_0[var_27_1]
		end

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play123011008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.35

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[475].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(123011007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 14
				local var_30_6 = utf8.len(var_30_4)
				local var_30_7 = var_30_5 <= 0 and var_30_1 or var_30_1 * (var_30_6 / var_30_5)

				if var_30_7 > 0 and var_30_1 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_4
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011007", "story_v_out_123011.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011007", "story_v_out_123011.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_123011", "123011007", "story_v_out_123011.awb")

						arg_27_1:RecordAudio("123011007", var_30_9)
						arg_27_1:RecordAudio("123011007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_123011", "123011007", "story_v_out_123011.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_123011", "123011007", "story_v_out_123011.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play123011008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 123011008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play123011009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.575

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

				local var_34_2 = arg_31_1:GetWordFromCfg(123011008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 63
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
	Play123011009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 123011009
		arg_35_1.duration_ = 6.999999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play123011010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "BA0105"

			if arg_35_1.bgs_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(arg_35_1.paintGo_)

				var_38_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_38_0)
				var_38_1.name = var_38_0
				var_38_1.transform.parent = arg_35_1.stage_.transform
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.bgs_[var_38_0] = var_38_1
			end

			local var_38_2 = 0

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 then
				local var_38_3 = manager.ui.mainCamera.transform.localPosition
				local var_38_4 = Vector3.New(0, 0, 10) + Vector3.New(var_38_3.x, var_38_3.y, 0)
				local var_38_5 = arg_35_1.bgs_.BA0105

				var_38_5.transform.localPosition = var_38_4
				var_38_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_38_6 = var_38_5:GetComponent("SpriteRenderer")

				if var_38_6 and var_38_6.sprite then
					local var_38_7 = (var_38_5.transform.localPosition - var_38_3).z
					local var_38_8 = manager.ui.mainCameraCom_
					local var_38_9 = 2 * var_38_7 * Mathf.Tan(var_38_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_38_10 = var_38_9 * var_38_8.aspect
					local var_38_11 = var_38_6.sprite.bounds.size.x
					local var_38_12 = var_38_6.sprite.bounds.size.y
					local var_38_13 = var_38_10 / var_38_11
					local var_38_14 = var_38_9 / var_38_12
					local var_38_15 = var_38_14 < var_38_13 and var_38_13 or var_38_14

					var_38_5.transform.localScale = Vector3.New(var_38_15, var_38_15, 0)
				end

				for iter_38_0, iter_38_1 in pairs(arg_35_1.bgs_) do
					if iter_38_0 ~= "BA0105" then
						iter_38_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_17 = 2

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_16) / var_38_17
				local var_38_19 = Color.New(0, 0, 0)

				var_38_19.a = Mathf.Lerp(1, 0, var_38_18)
				arg_35_1.mask_.color = var_38_19
			end

			if arg_35_1.time_ >= var_38_16 + var_38_17 and arg_35_1.time_ < var_38_16 + var_38_17 + arg_38_0 then
				local var_38_20 = Color.New(0, 0, 0)
				local var_38_21 = 0

				arg_35_1.mask_.enabled = false
				var_38_20.a = var_38_21
				arg_35_1.mask_.color = var_38_20
			end

			local var_38_22 = arg_35_1.bgs_.BA0105.transform
			local var_38_23 = 0

			if var_38_23 < arg_35_1.time_ and arg_35_1.time_ <= var_38_23 + arg_38_0 then
				arg_35_1.var_.moveOldPosBA0105 = var_38_22.localPosition
			end

			local var_38_24 = 0.001

			if var_38_23 <= arg_35_1.time_ and arg_35_1.time_ < var_38_23 + var_38_24 then
				local var_38_25 = (arg_35_1.time_ - var_38_23) / var_38_24
				local var_38_26 = Vector3.New(0, 1, 9.5)

				var_38_22.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPosBA0105, var_38_26, var_38_25)
			end

			if arg_35_1.time_ >= var_38_23 + var_38_24 and arg_35_1.time_ < var_38_23 + var_38_24 + arg_38_0 then
				var_38_22.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_38_27 = arg_35_1.bgs_.BA0105.transform
			local var_38_28 = 0.0166666666666667

			if var_38_28 < arg_35_1.time_ and arg_35_1.time_ <= var_38_28 + arg_38_0 then
				arg_35_1.var_.moveOldPosBA0105 = var_38_27.localPosition
			end

			local var_38_29 = 3.5

			if var_38_28 <= arg_35_1.time_ and arg_35_1.time_ < var_38_28 + var_38_29 then
				local var_38_30 = (arg_35_1.time_ - var_38_28) / var_38_29
				local var_38_31 = Vector3.New(0, 1, 10)

				var_38_27.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPosBA0105, var_38_31, var_38_30)
			end

			if arg_35_1.time_ >= var_38_28 + var_38_29 and arg_35_1.time_ < var_38_28 + var_38_29 + arg_38_0 then
				var_38_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_38_32 = 2

			if var_38_32 < arg_35_1.time_ and arg_35_1.time_ <= var_38_32 + arg_38_0 then
				arg_35_1.allBtn_.enabled = false
			end

			local var_38_33 = 1.51666666666667

			if arg_35_1.time_ >= var_38_32 + var_38_33 and arg_35_1.time_ < var_38_32 + var_38_33 + arg_38_0 then
				arg_35_1.allBtn_.enabled = true
			end

			local var_38_34 = 0
			local var_38_35 = 0.866666666666667

			if var_38_34 < arg_35_1.time_ and arg_35_1.time_ <= var_38_34 + arg_38_0 then
				local var_38_36 = "play"
				local var_38_37 = "music"

				arg_35_1:AudioAction(var_38_36, var_38_37, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_38_38 = 1.8
			local var_38_39 = 1

			if var_38_38 < arg_35_1.time_ and arg_35_1.time_ <= var_38_38 + arg_38_0 then
				local var_38_40 = "play"
				local var_38_41 = "music"

				arg_35_1:AudioAction(var_38_40, var_38_41, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_42 = 1.999999999999
			local var_38_43 = 0.4

			if var_38_42 < arg_35_1.time_ and arg_35_1.time_ <= var_38_42 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_44 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_44:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_45 = arg_35_1:GetWordFromCfg(123011009)
				local var_38_46 = arg_35_1:FormatText(var_38_45.content)

				arg_35_1.text_.text = var_38_46

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_47 = 16
				local var_38_48 = utf8.len(var_38_46)
				local var_38_49 = var_38_47 <= 0 and var_38_43 or var_38_43 * (var_38_48 / var_38_47)

				if var_38_49 > 0 and var_38_43 < var_38_49 then
					arg_35_1.talkMaxDuration = var_38_49
					var_38_42 = var_38_42 + 0.3

					if var_38_49 + var_38_42 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_49 + var_38_42
					end
				end

				arg_35_1.text_.text = var_38_46
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_50 = var_38_42 + 0.3
			local var_38_51 = math.max(var_38_43, arg_35_1.talkMaxDuration)

			if var_38_50 <= arg_35_1.time_ and arg_35_1.time_ < var_38_50 + var_38_51 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_50) / var_38_51

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_50 + var_38_51 and arg_35_1.time_ < var_38_50 + var_38_51 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play123011010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 123011010
		arg_41_1.duration_ = 8.999999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play123011011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 1.999999999999

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				local var_44_1 = manager.ui.mainCamera.transform.localPosition
				local var_44_2 = Vector3.New(0, 0, 10) + Vector3.New(var_44_1.x, var_44_1.y, 0)
				local var_44_3 = arg_41_1.bgs_.STblack

				var_44_3.transform.localPosition = var_44_2
				var_44_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_44_4 = var_44_3:GetComponent("SpriteRenderer")

				if var_44_4 and var_44_4.sprite then
					local var_44_5 = (var_44_3.transform.localPosition - var_44_1).z
					local var_44_6 = manager.ui.mainCameraCom_
					local var_44_7 = 2 * var_44_5 * Mathf.Tan(var_44_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_44_8 = var_44_7 * var_44_6.aspect
					local var_44_9 = var_44_4.sprite.bounds.size.x
					local var_44_10 = var_44_4.sprite.bounds.size.y
					local var_44_11 = var_44_8 / var_44_9
					local var_44_12 = var_44_7 / var_44_10
					local var_44_13 = var_44_12 < var_44_11 and var_44_11 or var_44_12

					var_44_3.transform.localScale = Vector3.New(var_44_13, var_44_13, 0)
				end

				for iter_44_0, iter_44_1 in pairs(arg_41_1.bgs_) do
					if iter_44_0 ~= "STblack" then
						iter_44_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_15 = 2

			if var_44_14 <= arg_41_1.time_ and arg_41_1.time_ < var_44_14 + var_44_15 then
				local var_44_16 = (arg_41_1.time_ - var_44_14) / var_44_15
				local var_44_17 = Color.New(0, 0, 0)

				var_44_17.a = Mathf.Lerp(0, 1, var_44_16)
				arg_41_1.mask_.color = var_44_17
			end

			if arg_41_1.time_ >= var_44_14 + var_44_15 and arg_41_1.time_ < var_44_14 + var_44_15 + arg_44_0 then
				local var_44_18 = Color.New(0, 0, 0)

				var_44_18.a = 1
				arg_41_1.mask_.color = var_44_18
			end

			local var_44_19 = 2

			if var_44_19 < arg_41_1.time_ and arg_41_1.time_ <= var_44_19 + arg_44_0 then
				arg_41_1.mask_.enabled = true
				arg_41_1.mask_.raycastTarget = true

				arg_41_1:SetGaussion(false)
			end

			local var_44_20 = 2

			if var_44_19 <= arg_41_1.time_ and arg_41_1.time_ < var_44_19 + var_44_20 then
				local var_44_21 = (arg_41_1.time_ - var_44_19) / var_44_20
				local var_44_22 = Color.New(0, 0, 0)

				var_44_22.a = Mathf.Lerp(1, 0, var_44_21)
				arg_41_1.mask_.color = var_44_22
			end

			if arg_41_1.time_ >= var_44_19 + var_44_20 and arg_41_1.time_ < var_44_19 + var_44_20 + arg_44_0 then
				local var_44_23 = Color.New(0, 0, 0)
				local var_44_24 = 0

				arg_41_1.mask_.enabled = false
				var_44_23.a = var_44_24
				arg_41_1.mask_.color = var_44_23
			end

			if arg_41_1.frameCnt_ <= 1 then
				arg_41_1.dialog_:SetActive(false)
			end

			local var_44_25 = 3.999999999999
			local var_44_26 = 1.725

			if var_44_25 < arg_41_1.time_ and arg_41_1.time_ <= var_44_25 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				arg_41_1.dialog_:SetActive(true)

				local var_44_27 = LeanTween.value(arg_41_1.dialog_, 0, 1, 0.3)

				var_44_27:setOnUpdate(LuaHelper.FloatAction(function(arg_45_0)
					arg_41_1.dialogCg_.alpha = arg_45_0
				end))
				var_44_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_41_1.dialog_)
					var_44_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_41_1.duration_ = arg_41_1.duration_ + 0.3

				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_28 = arg_41_1:GetWordFromCfg(123011010)
				local var_44_29 = arg_41_1:FormatText(var_44_28.content)

				arg_41_1.text_.text = var_44_29

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_30 = 69
				local var_44_31 = utf8.len(var_44_29)
				local var_44_32 = var_44_30 <= 0 and var_44_26 or var_44_26 * (var_44_31 / var_44_30)

				if var_44_32 > 0 and var_44_26 < var_44_32 then
					arg_41_1.talkMaxDuration = var_44_32
					var_44_25 = var_44_25 + 0.3

					if var_44_32 + var_44_25 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_32 + var_44_25
					end
				end

				arg_41_1.text_.text = var_44_29
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_33 = var_44_25 + 0.3
			local var_44_34 = math.max(var_44_26, arg_41_1.talkMaxDuration)

			if var_44_33 <= arg_41_1.time_ and arg_41_1.time_ < var_44_33 + var_44_34 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_33) / var_44_34

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_33 + var_44_34 and arg_41_1.time_ < var_44_33 + var_44_34 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play123011011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 123011011
		arg_47_1.duration_ = 6.999999999999

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play123011012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "BA0101"

			if arg_47_1.bgs_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_0)
				var_50_1.name = var_50_0
				var_50_1.transform.parent = arg_47_1.stage_.transform
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_0] = var_50_1
			end

			local var_50_2 = 0

			if var_50_2 < arg_47_1.time_ and arg_47_1.time_ <= var_50_2 + arg_50_0 then
				local var_50_3 = manager.ui.mainCamera.transform.localPosition
				local var_50_4 = Vector3.New(0, 0, 10) + Vector3.New(var_50_3.x, var_50_3.y, 0)
				local var_50_5 = arg_47_1.bgs_.BA0101

				var_50_5.transform.localPosition = var_50_4
				var_50_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_6 = var_50_5:GetComponent("SpriteRenderer")

				if var_50_6 and var_50_6.sprite then
					local var_50_7 = (var_50_5.transform.localPosition - var_50_3).z
					local var_50_8 = manager.ui.mainCameraCom_
					local var_50_9 = 2 * var_50_7 * Mathf.Tan(var_50_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_10 = var_50_9 * var_50_8.aspect
					local var_50_11 = var_50_6.sprite.bounds.size.x
					local var_50_12 = var_50_6.sprite.bounds.size.y
					local var_50_13 = var_50_10 / var_50_11
					local var_50_14 = var_50_9 / var_50_12
					local var_50_15 = var_50_14 < var_50_13 and var_50_13 or var_50_14

					var_50_5.transform.localScale = Vector3.New(var_50_15, var_50_15, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "BA0101" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_16 = 0

			if var_50_16 < arg_47_1.time_ and arg_47_1.time_ <= var_50_16 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_17 = 2

			if var_50_16 <= arg_47_1.time_ and arg_47_1.time_ < var_50_16 + var_50_17 then
				local var_50_18 = (arg_47_1.time_ - var_50_16) / var_50_17
				local var_50_19 = Color.New(0, 0, 0)

				var_50_19.a = Mathf.Lerp(1, 0, var_50_18)
				arg_47_1.mask_.color = var_50_19
			end

			if arg_47_1.time_ >= var_50_16 + var_50_17 and arg_47_1.time_ < var_50_16 + var_50_17 + arg_50_0 then
				local var_50_20 = Color.New(0, 0, 0)
				local var_50_21 = 0

				arg_47_1.mask_.enabled = false
				var_50_20.a = var_50_21
				arg_47_1.mask_.color = var_50_20
			end

			local var_50_22 = arg_47_1.bgs_.BA0101.transform
			local var_50_23 = 0

			if var_50_23 < arg_47_1.time_ and arg_47_1.time_ <= var_50_23 + arg_50_0 then
				arg_47_1.var_.moveOldPosBA0101 = var_50_22.localPosition
			end

			local var_50_24 = 0.001

			if var_50_23 <= arg_47_1.time_ and arg_47_1.time_ < var_50_23 + var_50_24 then
				local var_50_25 = (arg_47_1.time_ - var_50_23) / var_50_24
				local var_50_26 = Vector3.New(0, 1, 2)

				var_50_22.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPosBA0101, var_50_26, var_50_25)
			end

			if arg_47_1.time_ >= var_50_23 + var_50_24 and arg_47_1.time_ < var_50_23 + var_50_24 + arg_50_0 then
				var_50_22.localPosition = Vector3.New(0, 1, 2)
			end

			local var_50_27 = arg_47_1.bgs_.BA0101.transform
			local var_50_28 = 0.0166666666666667

			if var_50_28 < arg_47_1.time_ and arg_47_1.time_ <= var_50_28 + arg_50_0 then
				arg_47_1.var_.moveOldPosBA0101 = var_50_27.localPosition
			end

			local var_50_29 = 4

			if var_50_28 <= arg_47_1.time_ and arg_47_1.time_ < var_50_28 + var_50_29 then
				local var_50_30 = (arg_47_1.time_ - var_50_28) / var_50_29
				local var_50_31 = Vector3.New(0, 0.5, 2)

				var_50_27.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPosBA0101, var_50_31, var_50_30)
			end

			if arg_47_1.time_ >= var_50_28 + var_50_29 and arg_47_1.time_ < var_50_28 + var_50_29 + arg_50_0 then
				var_50_27.localPosition = Vector3.New(0, 0.5, 2)
			end

			local var_50_32 = 1.999999999999

			if var_50_32 < arg_47_1.time_ and arg_47_1.time_ <= var_50_32 + arg_50_0 then
				arg_47_1.allBtn_.enabled = false
			end

			local var_50_33 = 2.01666666666767

			if arg_47_1.time_ >= var_50_32 + var_50_33 and arg_47_1.time_ < var_50_32 + var_50_33 + arg_50_0 then
				arg_47_1.allBtn_.enabled = true
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_34 = 1.999999999999
			local var_50_35 = 0.975

			if var_50_34 < arg_47_1.time_ and arg_47_1.time_ <= var_50_34 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_36 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_36:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_37 = arg_47_1:GetWordFromCfg(123011011)
				local var_50_38 = arg_47_1:FormatText(var_50_37.content)

				arg_47_1.text_.text = var_50_38

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_39 = 39
				local var_50_40 = utf8.len(var_50_38)
				local var_50_41 = var_50_39 <= 0 and var_50_35 or var_50_35 * (var_50_40 / var_50_39)

				if var_50_41 > 0 and var_50_35 < var_50_41 then
					arg_47_1.talkMaxDuration = var_50_41
					var_50_34 = var_50_34 + 0.3

					if var_50_41 + var_50_34 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_41 + var_50_34
					end
				end

				arg_47_1.text_.text = var_50_38
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_42 = var_50_34 + 0.3
			local var_50_43 = math.max(var_50_35, arg_47_1.talkMaxDuration)

			if var_50_42 <= arg_47_1.time_ and arg_47_1.time_ < var_50_42 + var_50_43 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_42) / var_50_43

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_42 + var_50_43 and arg_47_1.time_ < var_50_42 + var_50_43 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play123011012 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 123011012
		arg_53_1.duration_ = 10.733

		local var_53_0 = {
			zh = 7.966,
			ja = 10.733
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
				arg_53_0:Play123011013(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.075

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[81].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_3 = arg_53_1:GetWordFromCfg(123011012)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 43
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011012", "story_v_out_123011.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011012", "story_v_out_123011.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_123011", "123011012", "story_v_out_123011.awb")

						arg_53_1:RecordAudio("123011012", var_56_9)
						arg_53_1:RecordAudio("123011012", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_123011", "123011012", "story_v_out_123011.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_123011", "123011012", "story_v_out_123011.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play123011013 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 123011013
		arg_57_1.duration_ = 12.966

		local var_57_0 = {
			zh = 7.533,
			ja = 12.966
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
				arg_57_0:Play123011014(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.8

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[476].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(123011013)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 32
				local var_60_6 = utf8.len(var_60_4)
				local var_60_7 = var_60_5 <= 0 and var_60_1 or var_60_1 * (var_60_6 / var_60_5)

				if var_60_7 > 0 and var_60_1 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_4
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011013", "story_v_out_123011.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011013", "story_v_out_123011.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_123011", "123011013", "story_v_out_123011.awb")

						arg_57_1:RecordAudio("123011013", var_60_9)
						arg_57_1:RecordAudio("123011013", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_123011", "123011013", "story_v_out_123011.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_123011", "123011013", "story_v_out_123011.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play123011014 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 123011014
		arg_61_1.duration_ = 7.833

		local var_61_0 = {
			zh = 5.633,
			ja = 7.833
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
				arg_61_0:Play123011015(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.625

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[81].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(123011014)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011014", "story_v_out_123011.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011014", "story_v_out_123011.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_123011", "123011014", "story_v_out_123011.awb")

						arg_61_1:RecordAudio("123011014", var_64_9)
						arg_61_1:RecordAudio("123011014", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_123011", "123011014", "story_v_out_123011.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_123011", "123011014", "story_v_out_123011.awb")
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
	Play123011015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 123011015
		arg_65_1.duration_ = 17.566

		local var_65_0 = {
			zh = 12.2,
			ja = 17.566
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
				arg_65_0:Play123011016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.4

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[81].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(123011015)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011015", "story_v_out_123011.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011015", "story_v_out_123011.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_123011", "123011015", "story_v_out_123011.awb")

						arg_65_1:RecordAudio("123011015", var_68_9)
						arg_65_1:RecordAudio("123011015", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_123011", "123011015", "story_v_out_123011.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_123011", "123011015", "story_v_out_123011.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play123011016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 123011016
		arg_69_1.duration_ = 11.9

		local var_69_0 = {
			zh = 9.8,
			ja = 11.9
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
				arg_69_0:Play123011017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 1.15

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[81].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(123011016)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 46
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011016", "story_v_out_123011.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011016", "story_v_out_123011.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_123011", "123011016", "story_v_out_123011.awb")

						arg_69_1:RecordAudio("123011016", var_72_9)
						arg_69_1:RecordAudio("123011016", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_123011", "123011016", "story_v_out_123011.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_123011", "123011016", "story_v_out_123011.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play123011017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 123011017
		arg_73_1.duration_ = 11.633

		local var_73_0 = {
			zh = 10.533,
			ja = 11.633
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
				arg_73_0:Play123011018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.925

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[477].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(123011017)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 37
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011017", "story_v_out_123011.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011017", "story_v_out_123011.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_123011", "123011017", "story_v_out_123011.awb")

						arg_73_1:RecordAudio("123011017", var_76_9)
						arg_73_1:RecordAudio("123011017", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_123011", "123011017", "story_v_out_123011.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_123011", "123011017", "story_v_out_123011.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play123011018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 123011018
		arg_77_1.duration_ = 8.5

		local var_77_0 = {
			zh = 7.7,
			ja = 8.5
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
				arg_77_0:Play123011019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[81].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(123011018)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011018", "story_v_out_123011.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011018", "story_v_out_123011.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_123011", "123011018", "story_v_out_123011.awb")

						arg_77_1:RecordAudio("123011018", var_80_9)
						arg_77_1:RecordAudio("123011018", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_123011", "123011018", "story_v_out_123011.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_123011", "123011018", "story_v_out_123011.awb")
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
	Play123011019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 123011019
		arg_81_1.duration_ = 5

		local var_81_0 = {
			zh = 2.966,
			ja = 5
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
				arg_81_0:Play123011020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.375

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[81].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(123011019)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 15
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011019", "story_v_out_123011.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011019", "story_v_out_123011.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_123011", "123011019", "story_v_out_123011.awb")

						arg_81_1:RecordAudio("123011019", var_84_9)
						arg_81_1:RecordAudio("123011019", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_123011", "123011019", "story_v_out_123011.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_123011", "123011019", "story_v_out_123011.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play123011020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 123011020
		arg_85_1.duration_ = 9

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play123011021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_1 = 2

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_1 then
				local var_88_2 = (arg_85_1.time_ - var_88_0) / var_88_1
				local var_88_3 = Color.New(0, 0, 0)

				var_88_3.a = Mathf.Lerp(0, 1, var_88_2)
				arg_85_1.mask_.color = var_88_3
			end

			if arg_85_1.time_ >= var_88_0 + var_88_1 and arg_85_1.time_ < var_88_0 + var_88_1 + arg_88_0 then
				local var_88_4 = Color.New(0, 0, 0)

				var_88_4.a = 1
				arg_85_1.mask_.color = var_88_4
			end

			local var_88_5 = 2

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_6 = 2

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6
				local var_88_8 = Color.New(0, 0, 0)

				var_88_8.a = Mathf.Lerp(1, 0, var_88_7)
				arg_85_1.mask_.color = var_88_8
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 then
				local var_88_9 = Color.New(0, 0, 0)
				local var_88_10 = 0

				arg_85_1.mask_.enabled = false
				var_88_9.a = var_88_10
				arg_85_1.mask_.color = var_88_9
			end

			local var_88_11 = arg_85_1.bgs_.BA0101.transform
			local var_88_12 = 2.01666666666667

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.var_.moveOldPosBA0101 = var_88_11.localPosition
			end

			local var_88_13 = 2

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_13 then
				local var_88_14 = (arg_85_1.time_ - var_88_12) / var_88_13
				local var_88_15 = Vector3.New(0, 1, 8)

				var_88_11.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPosBA0101, var_88_15, var_88_14)
			end

			if arg_85_1.time_ >= var_88_12 + var_88_13 and arg_85_1.time_ < var_88_12 + var_88_13 + arg_88_0 then
				var_88_11.localPosition = Vector3.New(0, 1, 8)
			end

			local var_88_16 = arg_85_1.bgs_.BA0101.transform
			local var_88_17 = 2

			if var_88_17 < arg_85_1.time_ and arg_85_1.time_ <= var_88_17 + arg_88_0 then
				arg_85_1.var_.moveOldPosBA0101 = var_88_16.localPosition
			end

			local var_88_18 = 0.001

			if var_88_17 <= arg_85_1.time_ and arg_85_1.time_ < var_88_17 + var_88_18 then
				local var_88_19 = (arg_85_1.time_ - var_88_17) / var_88_18
				local var_88_20 = Vector3.New(0, 0.5, 7)

				var_88_16.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPosBA0101, var_88_20, var_88_19)
			end

			if arg_85_1.time_ >= var_88_17 + var_88_18 and arg_85_1.time_ < var_88_17 + var_88_18 + arg_88_0 then
				var_88_16.localPosition = Vector3.New(0, 0.5, 7)
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_21 = 4
			local var_88_22 = 0.625

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_23 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_23:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_24 = arg_85_1:GetWordFromCfg(123011020)
				local var_88_25 = arg_85_1:FormatText(var_88_24.content)

				arg_85_1.text_.text = var_88_25

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_26 = 25
				local var_88_27 = utf8.len(var_88_25)
				local var_88_28 = var_88_26 <= 0 and var_88_22 or var_88_22 * (var_88_27 / var_88_26)

				if var_88_28 > 0 and var_88_22 < var_88_28 then
					arg_85_1.talkMaxDuration = var_88_28
					var_88_21 = var_88_21 + 0.3

					if var_88_28 + var_88_21 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_28 + var_88_21
					end
				end

				arg_85_1.text_.text = var_88_25
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_29 = var_88_21 + 0.3
			local var_88_30 = math.max(var_88_22, arg_85_1.talkMaxDuration)

			if var_88_29 <= arg_85_1.time_ and arg_85_1.time_ < var_88_29 + var_88_30 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_29) / var_88_30

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_29 + var_88_30 and arg_85_1.time_ < var_88_29 + var_88_30 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play123011021 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 123011021
		arg_91_1.duration_ = 3.1

		local var_91_0 = {
			zh = 2,
			ja = 3.1
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
				arg_91_0:Play123011022(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.175

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[476].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(123011021)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 7
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011021", "story_v_out_123011.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011021", "story_v_out_123011.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_123011", "123011021", "story_v_out_123011.awb")

						arg_91_1:RecordAudio("123011021", var_94_9)
						arg_91_1:RecordAudio("123011021", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_123011", "123011021", "story_v_out_123011.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_123011", "123011021", "story_v_out_123011.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play123011022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 123011022
		arg_95_1.duration_ = 9.9

		local var_95_0 = {
			zh = 9.266,
			ja = 9.9
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
				arg_95_0:Play123011023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.175

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[81].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(123011022)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011022", "story_v_out_123011.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011022", "story_v_out_123011.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_123011", "123011022", "story_v_out_123011.awb")

						arg_95_1:RecordAudio("123011022", var_98_9)
						arg_95_1:RecordAudio("123011022", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_123011", "123011022", "story_v_out_123011.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_123011", "123011022", "story_v_out_123011.awb")
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
	Play123011023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 123011023
		arg_99_1.duration_ = 4.033

		local var_99_0 = {
			zh = 1.033,
			ja = 4.033
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
				arg_99_0:Play123011024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.075

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[476].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(123011023)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 3
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011023", "story_v_out_123011.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011023", "story_v_out_123011.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_123011", "123011023", "story_v_out_123011.awb")

						arg_99_1:RecordAudio("123011023", var_102_9)
						arg_99_1:RecordAudio("123011023", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_123011", "123011023", "story_v_out_123011.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_123011", "123011023", "story_v_out_123011.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play123011024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 123011024
		arg_103_1.duration_ = 5.166

		local var_103_0 = {
			zh = 4.733,
			ja = 5.166
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
				arg_103_0:Play123011025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.65

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[81].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(123011024)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011024", "story_v_out_123011.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011024", "story_v_out_123011.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_123011", "123011024", "story_v_out_123011.awb")

						arg_103_1:RecordAudio("123011024", var_106_9)
						arg_103_1:RecordAudio("123011024", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_123011", "123011024", "story_v_out_123011.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_123011", "123011024", "story_v_out_123011.awb")
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
	Play123011025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 123011025
		arg_107_1.duration_ = 8.4

		local var_107_0 = {
			zh = 6.466,
			ja = 8.4
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
				arg_107_0:Play123011026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.825

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[81].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(123011025)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011025", "story_v_out_123011.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011025", "story_v_out_123011.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_123011", "123011025", "story_v_out_123011.awb")

						arg_107_1:RecordAudio("123011025", var_110_9)
						arg_107_1:RecordAudio("123011025", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_123011", "123011025", "story_v_out_123011.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_123011", "123011025", "story_v_out_123011.awb")
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
	Play123011026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 123011026
		arg_111_1.duration_ = 3.233

		local var_111_0 = {
			zh = 2.1,
			ja = 3.233
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
				arg_111_0:Play123011027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.275

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[476].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(123011026)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011026", "story_v_out_123011.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011026", "story_v_out_123011.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_123011", "123011026", "story_v_out_123011.awb")

						arg_111_1:RecordAudio("123011026", var_114_9)
						arg_111_1:RecordAudio("123011026", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_123011", "123011026", "story_v_out_123011.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_123011", "123011026", "story_v_out_123011.awb")
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
	Play123011027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 123011027
		arg_115_1.duration_ = 2.133

		local var_115_0 = {
			zh = 2.133,
			ja = 1.8
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
				arg_115_0:Play123011028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.125

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[477].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(123011027)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011027", "story_v_out_123011.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011027", "story_v_out_123011.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_123011", "123011027", "story_v_out_123011.awb")

						arg_115_1:RecordAudio("123011027", var_118_9)
						arg_115_1:RecordAudio("123011027", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_123011", "123011027", "story_v_out_123011.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_123011", "123011027", "story_v_out_123011.awb")
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
	Play123011028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 123011028
		arg_119_1.duration_ = 9.366

		local var_119_0 = {
			zh = 9.033,
			ja = 9.366
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
				arg_119_0:Play123011029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.8

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[81].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(123011028)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011028", "story_v_out_123011.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011028", "story_v_out_123011.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_123011", "123011028", "story_v_out_123011.awb")

						arg_119_1:RecordAudio("123011028", var_122_9)
						arg_119_1:RecordAudio("123011028", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_123011", "123011028", "story_v_out_123011.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_123011", "123011028", "story_v_out_123011.awb")
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
	Play123011029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 123011029
		arg_123_1.duration_ = 6.133

		local var_123_0 = {
			zh = 4.2,
			ja = 6.133
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
				arg_123_0:Play123011030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.4

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[477].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(123011029)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011029", "story_v_out_123011.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011029", "story_v_out_123011.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_123011", "123011029", "story_v_out_123011.awb")

						arg_123_1:RecordAudio("123011029", var_126_9)
						arg_123_1:RecordAudio("123011029", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_123011", "123011029", "story_v_out_123011.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_123011", "123011029", "story_v_out_123011.awb")
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
	Play123011030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 123011030
		arg_127_1.duration_ = 17.866

		local var_127_0 = {
			zh = 16.9,
			ja = 17.866
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
				arg_127_0:Play123011031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 1.825

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[81].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(123011030)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 73
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011030", "story_v_out_123011.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011030", "story_v_out_123011.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_123011", "123011030", "story_v_out_123011.awb")

						arg_127_1:RecordAudio("123011030", var_130_9)
						arg_127_1:RecordAudio("123011030", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_123011", "123011030", "story_v_out_123011.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_123011", "123011030", "story_v_out_123011.awb")
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
	Play123011031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 123011031
		arg_131_1.duration_ = 9.666

		local var_131_0 = {
			zh = 8.5,
			ja = 9.666
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
				arg_131_0:Play123011032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.05

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[476].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(123011031)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 42
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011031", "story_v_out_123011.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011031", "story_v_out_123011.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_123011", "123011031", "story_v_out_123011.awb")

						arg_131_1:RecordAudio("123011031", var_134_9)
						arg_131_1:RecordAudio("123011031", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_123011", "123011031", "story_v_out_123011.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_123011", "123011031", "story_v_out_123011.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play123011032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 123011032
		arg_135_1.duration_ = 3.233

		local var_135_0 = {
			zh = 1.633,
			ja = 3.233
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
				arg_135_0:Play123011033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.175

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[476].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(123011032)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011032", "story_v_out_123011.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011032", "story_v_out_123011.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_123011", "123011032", "story_v_out_123011.awb")

						arg_135_1:RecordAudio("123011032", var_138_9)
						arg_135_1:RecordAudio("123011032", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_123011", "123011032", "story_v_out_123011.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_123011", "123011032", "story_v_out_123011.awb")
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
	Play123011033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 123011033
		arg_139_1.duration_ = 5.933

		local var_139_0 = {
			zh = 3.2,
			ja = 5.933
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
				arg_139_0:Play123011034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.4

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[81].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(123011033)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011033", "story_v_out_123011.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011033", "story_v_out_123011.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_123011", "123011033", "story_v_out_123011.awb")

						arg_139_1:RecordAudio("123011033", var_142_9)
						arg_139_1:RecordAudio("123011033", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_123011", "123011033", "story_v_out_123011.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_123011", "123011033", "story_v_out_123011.awb")
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
	Play123011034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 123011034
		arg_143_1.duration_ = 1.8

		local var_143_0 = {
			zh = 1.233,
			ja = 1.8
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
				arg_143_0:Play123011035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.15

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[476].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(123011034)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011034", "story_v_out_123011.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011034", "story_v_out_123011.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_123011", "123011034", "story_v_out_123011.awb")

						arg_143_1:RecordAudio("123011034", var_146_9)
						arg_143_1:RecordAudio("123011034", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_123011", "123011034", "story_v_out_123011.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_123011", "123011034", "story_v_out_123011.awb")
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
	Play123011035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 123011035
		arg_147_1.duration_ = 12.233

		local var_147_0 = {
			zh = 11.6,
			ja = 12.233
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
				arg_147_0:Play123011036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 1.475

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[81].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(123011035)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 59
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011035", "story_v_out_123011.awb") ~= 0 then
					local var_150_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011035", "story_v_out_123011.awb") / 1000

					if var_150_8 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_8 + var_150_0
					end

					if var_150_3.prefab_name ~= "" and arg_147_1.actors_[var_150_3.prefab_name] ~= nil then
						local var_150_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_3.prefab_name].transform, "story_v_out_123011", "123011035", "story_v_out_123011.awb")

						arg_147_1:RecordAudio("123011035", var_150_9)
						arg_147_1:RecordAudio("123011035", var_150_9)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_123011", "123011035", "story_v_out_123011.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_123011", "123011035", "story_v_out_123011.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_10 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_10 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_10

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_10 and arg_147_1.time_ < var_150_0 + var_150_10 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play123011036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 123011036
		arg_151_1.duration_ = 14.466

		local var_151_0 = {
			zh = 14.433,
			ja = 14.466
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
				arg_151_0:Play123011037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1.825

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[81].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(123011036)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 72
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011036", "story_v_out_123011.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011036", "story_v_out_123011.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_123011", "123011036", "story_v_out_123011.awb")

						arg_151_1:RecordAudio("123011036", var_154_9)
						arg_151_1:RecordAudio("123011036", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_123011", "123011036", "story_v_out_123011.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_123011", "123011036", "story_v_out_123011.awb")
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
	Play123011037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 123011037
		arg_155_1.duration_ = 3.166

		local var_155_0 = {
			zh = 3.033,
			ja = 3.166
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
				arg_155_0:Play123011038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.4

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[476].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(123011037)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011037", "story_v_out_123011.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011037", "story_v_out_123011.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_123011", "123011037", "story_v_out_123011.awb")

						arg_155_1:RecordAudio("123011037", var_158_9)
						arg_155_1:RecordAudio("123011037", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_123011", "123011037", "story_v_out_123011.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_123011", "123011037", "story_v_out_123011.awb")
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
	Play123011038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 123011038
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play123011039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.775

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_2 = arg_159_1:GetWordFromCfg(123011038)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 31
				local var_162_5 = utf8.len(var_162_3)
				local var_162_6 = var_162_4 <= 0 and var_162_1 or var_162_1 * (var_162_5 / var_162_4)

				if var_162_6 > 0 and var_162_1 < var_162_6 then
					arg_159_1.talkMaxDuration = var_162_6

					if var_162_6 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_6 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_3
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_7 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_7 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_7

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_7 and arg_159_1.time_ < var_162_0 + var_162_7 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play123011039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 123011039
		arg_163_1.duration_ = 9.466

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play123011040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.125

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[81].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(123011039)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011039", "story_v_out_123011.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011039", "story_v_out_123011.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_123011", "123011039", "story_v_out_123011.awb")

						arg_163_1:RecordAudio("123011039", var_166_9)
						arg_163_1:RecordAudio("123011039", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_123011", "123011039", "story_v_out_123011.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_123011", "123011039", "story_v_out_123011.awb")
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
	Play123011040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 123011040
		arg_167_1.duration_ = 3.166

		local var_167_0 = {
			zh = 1.666,
			ja = 3.166
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
				arg_167_0:Play123011041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 0.125

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[476].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(123011040)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011040", "story_v_out_123011.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011040", "story_v_out_123011.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_123011", "123011040", "story_v_out_123011.awb")

						arg_167_1:RecordAudio("123011040", var_170_9)
						arg_167_1:RecordAudio("123011040", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_123011", "123011040", "story_v_out_123011.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_123011", "123011040", "story_v_out_123011.awb")
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
	Play123011041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 123011041
		arg_171_1.duration_ = 17.166

		local var_171_0 = {
			zh = 11.133,
			ja = 17.166
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
				arg_171_0:Play123011042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.375

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[81].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(123011041)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011041", "story_v_out_123011.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011041", "story_v_out_123011.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_123011", "123011041", "story_v_out_123011.awb")

						arg_171_1:RecordAudio("123011041", var_174_9)
						arg_171_1:RecordAudio("123011041", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_123011", "123011041", "story_v_out_123011.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_123011", "123011041", "story_v_out_123011.awb")
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
	Play123011042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 123011042
		arg_175_1.duration_ = 7.266

		local var_175_0 = {
			zh = 3.8,
			ja = 7.266
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
				arg_175_0:Play123011043(arg_175_1)
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

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[476].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(123011042)
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011042", "story_v_out_123011.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011042", "story_v_out_123011.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_123011", "123011042", "story_v_out_123011.awb")

						arg_175_1:RecordAudio("123011042", var_178_9)
						arg_175_1:RecordAudio("123011042", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_123011", "123011042", "story_v_out_123011.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_123011", "123011042", "story_v_out_123011.awb")
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
	Play123011043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 123011043
		arg_179_1.duration_ = 9.1

		local var_179_0 = {
			zh = 5.9,
			ja = 9.1
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
				arg_179_0:Play123011044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.625

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[81].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(123011043)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011043", "story_v_out_123011.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011043", "story_v_out_123011.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_123011", "123011043", "story_v_out_123011.awb")

						arg_179_1:RecordAudio("123011043", var_182_9)
						arg_179_1:RecordAudio("123011043", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_123011", "123011043", "story_v_out_123011.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_123011", "123011043", "story_v_out_123011.awb")
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
	Play123011044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 123011044
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play123011045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.225

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(123011044)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 9
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play123011045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 123011045
		arg_187_1.duration_ = 9.2

		local var_187_0 = {
			zh = 6.3,
			ja = 9.2
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play123011046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.875

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[476].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(123011045)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 35
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011045", "story_v_out_123011.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011045", "story_v_out_123011.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_123011", "123011045", "story_v_out_123011.awb")

						arg_187_1:RecordAudio("123011045", var_190_9)
						arg_187_1:RecordAudio("123011045", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_123011", "123011045", "story_v_out_123011.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_123011", "123011045", "story_v_out_123011.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play123011046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 123011046
		arg_191_1.duration_ = 1.5

		local var_191_0 = {
			zh = 1.266,
			ja = 1.5
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play123011047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.075

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[81].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(123011046)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 3
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011046", "story_v_out_123011.awb") ~= 0 then
					local var_194_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011046", "story_v_out_123011.awb") / 1000

					if var_194_8 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_8 + var_194_0
					end

					if var_194_3.prefab_name ~= "" and arg_191_1.actors_[var_194_3.prefab_name] ~= nil then
						local var_194_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_3.prefab_name].transform, "story_v_out_123011", "123011046", "story_v_out_123011.awb")

						arg_191_1:RecordAudio("123011046", var_194_9)
						arg_191_1:RecordAudio("123011046", var_194_9)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_123011", "123011046", "story_v_out_123011.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_123011", "123011046", "story_v_out_123011.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_10 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_10 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_10

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_10 and arg_191_1.time_ < var_194_0 + var_194_10 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play123011047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 123011047
		arg_195_1.duration_ = 16.466

		local var_195_0 = {
			zh = 15.2,
			ja = 16.466
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
				arg_195_0:Play123011048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 1.975

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[476].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(123011047)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 79
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011047", "story_v_out_123011.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011047", "story_v_out_123011.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_123011", "123011047", "story_v_out_123011.awb")

						arg_195_1:RecordAudio("123011047", var_198_9)
						arg_195_1:RecordAudio("123011047", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_123011", "123011047", "story_v_out_123011.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_123011", "123011047", "story_v_out_123011.awb")
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
	Play123011048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 123011048
		arg_199_1.duration_ = 6

		local var_199_0 = {
			zh = 4.833,
			ja = 6
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
				arg_199_0:Play123011049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.55

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[81].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(123011048)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011048", "story_v_out_123011.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011048", "story_v_out_123011.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_123011", "123011048", "story_v_out_123011.awb")

						arg_199_1:RecordAudio("123011048", var_202_9)
						arg_199_1:RecordAudio("123011048", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_123011", "123011048", "story_v_out_123011.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_123011", "123011048", "story_v_out_123011.awb")
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
	Play123011049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 123011049
		arg_203_1.duration_ = 7.833

		local var_203_0 = {
			zh = 5.066,
			ja = 7.833
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
				arg_203_0:Play123011050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.525

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[476].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(123011049)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011049", "story_v_out_123011.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011049", "story_v_out_123011.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_123011", "123011049", "story_v_out_123011.awb")

						arg_203_1:RecordAudio("123011049", var_206_9)
						arg_203_1:RecordAudio("123011049", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_123011", "123011049", "story_v_out_123011.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_123011", "123011049", "story_v_out_123011.awb")
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
	Play123011050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 123011050
		arg_207_1.duration_ = 4.066

		local var_207_0 = {
			zh = 3.833,
			ja = 4.066
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
				arg_207_0:Play123011051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.45

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[81].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(123011050)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011050", "story_v_out_123011.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011050", "story_v_out_123011.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_123011", "123011050", "story_v_out_123011.awb")

						arg_207_1:RecordAudio("123011050", var_210_9)
						arg_207_1:RecordAudio("123011050", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_123011", "123011050", "story_v_out_123011.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_123011", "123011050", "story_v_out_123011.awb")
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
	Play123011051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 123011051
		arg_211_1.duration_ = 7.733

		local var_211_0 = {
			zh = 6.666,
			ja = 7.733
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play123011052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.85

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[476].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(123011051)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 34
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011051", "story_v_out_123011.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011051", "story_v_out_123011.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_123011", "123011051", "story_v_out_123011.awb")

						arg_211_1:RecordAudio("123011051", var_214_9)
						arg_211_1:RecordAudio("123011051", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_123011", "123011051", "story_v_out_123011.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_123011", "123011051", "story_v_out_123011.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_10 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_10 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_10

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_10 and arg_211_1.time_ < var_214_0 + var_214_10 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play123011052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 123011052
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play123011053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.225

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

				local var_218_2 = arg_215_1:GetWordFromCfg(123011052)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 9
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
	Play123011053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 123011053
		arg_219_1.duration_ = 5.966

		local var_219_0 = {
			zh = 5.966,
			ja = 4.866
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
				arg_219_0:Play123011054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 0.725

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[476].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(123011053)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011053", "story_v_out_123011.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011053", "story_v_out_123011.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_123011", "123011053", "story_v_out_123011.awb")

						arg_219_1:RecordAudio("123011053", var_222_9)
						arg_219_1:RecordAudio("123011053", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_123011", "123011053", "story_v_out_123011.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_123011", "123011053", "story_v_out_123011.awb")
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
	Play123011054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 123011054
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play123011055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.3

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_2 = arg_223_1:GetWordFromCfg(123011054)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 52
				local var_226_5 = utf8.len(var_226_3)
				local var_226_6 = var_226_4 <= 0 and var_226_1 or var_226_1 * (var_226_5 / var_226_4)

				if var_226_6 > 0 and var_226_1 < var_226_6 then
					arg_223_1.talkMaxDuration = var_226_6

					if var_226_6 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_6 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_3
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_7 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_7 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_7

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_7 and arg_223_1.time_ < var_226_0 + var_226_7 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play123011055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 123011055
		arg_227_1.duration_ = 10.733

		local var_227_0 = {
			zh = 7.466,
			ja = 10.733
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
				arg_227_0:Play123011056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.875

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[81].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(123011055)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 35
				local var_230_6 = utf8.len(var_230_4)
				local var_230_7 = var_230_5 <= 0 and var_230_1 or var_230_1 * (var_230_6 / var_230_5)

				if var_230_7 > 0 and var_230_1 < var_230_7 then
					arg_227_1.talkMaxDuration = var_230_7

					if var_230_7 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_7 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_4
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011055", "story_v_out_123011.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011055", "story_v_out_123011.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_123011", "123011055", "story_v_out_123011.awb")

						arg_227_1:RecordAudio("123011055", var_230_9)
						arg_227_1:RecordAudio("123011055", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_123011", "123011055", "story_v_out_123011.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_123011", "123011055", "story_v_out_123011.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_10 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_10 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_10

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_10 and arg_227_1.time_ < var_230_0 + var_230_10 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play123011056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 123011056
		arg_231_1.duration_ = 5.9

		local var_231_0 = {
			zh = 3.7,
			ja = 5.9
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
				arg_231_0:Play123011057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.45

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[476].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(123011056)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011056", "story_v_out_123011.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011056", "story_v_out_123011.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_123011", "123011056", "story_v_out_123011.awb")

						arg_231_1:RecordAudio("123011056", var_234_9)
						arg_231_1:RecordAudio("123011056", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_123011", "123011056", "story_v_out_123011.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_123011", "123011056", "story_v_out_123011.awb")
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
	Play123011057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 123011057
		arg_235_1.duration_ = 11.533

		local var_235_0 = {
			zh = 11.366,
			ja = 11.533
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
				arg_235_0:Play123011058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.925

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[81].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(123011057)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011057", "story_v_out_123011.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011057", "story_v_out_123011.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_123011", "123011057", "story_v_out_123011.awb")

						arg_235_1:RecordAudio("123011057", var_238_9)
						arg_235_1:RecordAudio("123011057", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_123011", "123011057", "story_v_out_123011.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_123011", "123011057", "story_v_out_123011.awb")
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
	Play123011058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 123011058
		arg_239_1.duration_ = 2.233

		local var_239_0 = {
			zh = 2,
			ja = 2.233
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
				arg_239_0:Play123011059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.225

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[476].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(123011058)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 9
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011058", "story_v_out_123011.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011058", "story_v_out_123011.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_123011", "123011058", "story_v_out_123011.awb")

						arg_239_1:RecordAudio("123011058", var_242_9)
						arg_239_1:RecordAudio("123011058", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_123011", "123011058", "story_v_out_123011.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_123011", "123011058", "story_v_out_123011.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_10 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_10

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_10 and arg_239_1.time_ < var_242_0 + var_242_10 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play123011059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 123011059
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play123011060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 1.5

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_2 = arg_243_1:GetWordFromCfg(123011059)
				local var_246_3 = arg_243_1:FormatText(var_246_2.content)

				arg_243_1.text_.text = var_246_3

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_4 = 60
				local var_246_5 = utf8.len(var_246_3)
				local var_246_6 = var_246_4 <= 0 and var_246_1 or var_246_1 * (var_246_5 / var_246_4)

				if var_246_6 > 0 and var_246_1 < var_246_6 then
					arg_243_1.talkMaxDuration = var_246_6

					if var_246_6 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_6 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_3
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_7 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_7 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_7

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_7 and arg_243_1.time_ < var_246_0 + var_246_7 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play123011060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 123011060
		arg_247_1.duration_ = 4.133

		local var_247_0 = {
			zh = 3.866,
			ja = 4.133
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
				arg_247_0:Play123011061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.275

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[477].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(123011060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011060", "story_v_out_123011.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011060", "story_v_out_123011.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_123011", "123011060", "story_v_out_123011.awb")

						arg_247_1:RecordAudio("123011060", var_250_9)
						arg_247_1:RecordAudio("123011060", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_123011", "123011060", "story_v_out_123011.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_123011", "123011060", "story_v_out_123011.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_10 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_10 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_10

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_10 and arg_247_1.time_ < var_250_0 + var_250_10 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play123011061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 123011061
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play123011062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.725

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

				local var_254_2 = arg_251_1:GetWordFromCfg(123011061)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 29
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
	Play123011062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 123011062
		arg_255_1.duration_ = 3.366

		local var_255_0 = {
			zh = 3.366,
			ja = 3.133
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
				arg_255_0:Play123011063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = "BA0101a"

			if arg_255_1.bgs_[var_258_0] == nil then
				local var_258_1 = Object.Instantiate(arg_255_1.paintGo_)

				var_258_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_258_0)
				var_258_1.name = var_258_0
				var_258_1.transform.parent = arg_255_1.stage_.transform
				var_258_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_255_1.bgs_[var_258_0] = var_258_1
			end

			local var_258_2 = 0

			if var_258_2 < arg_255_1.time_ and arg_255_1.time_ <= var_258_2 + arg_258_0 then
				local var_258_3 = manager.ui.mainCamera.transform.localPosition
				local var_258_4 = Vector3.New(0, 0, 10) + Vector3.New(var_258_3.x, var_258_3.y, 0)
				local var_258_5 = arg_255_1.bgs_.BA0101a

				var_258_5.transform.localPosition = var_258_4
				var_258_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_258_6 = var_258_5:GetComponent("SpriteRenderer")

				if var_258_6 and var_258_6.sprite then
					local var_258_7 = (var_258_5.transform.localPosition - var_258_3).z
					local var_258_8 = manager.ui.mainCameraCom_
					local var_258_9 = 2 * var_258_7 * Mathf.Tan(var_258_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_258_10 = var_258_9 * var_258_8.aspect
					local var_258_11 = var_258_6.sprite.bounds.size.x
					local var_258_12 = var_258_6.sprite.bounds.size.y
					local var_258_13 = var_258_10 / var_258_11
					local var_258_14 = var_258_9 / var_258_12
					local var_258_15 = var_258_14 < var_258_13 and var_258_13 or var_258_14

					var_258_5.transform.localScale = Vector3.New(var_258_15, var_258_15, 0)
				end

				for iter_258_0, iter_258_1 in pairs(arg_255_1.bgs_) do
					if iter_258_0 ~= "BA0101a" then
						iter_258_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.mask_.enabled = true
				arg_255_1.mask_.raycastTarget = true

				arg_255_1:SetGaussion(false)
			end

			local var_258_17 = 2

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17
				local var_258_19 = Color.New(1, 1, 1)

				var_258_19.a = Mathf.Lerp(1, 0, var_258_18)
				arg_255_1.mask_.color = var_258_19
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				local var_258_20 = Color.New(1, 1, 1)
				local var_258_21 = 0

				arg_255_1.mask_.enabled = false
				var_258_20.a = var_258_21
				arg_255_1.mask_.color = var_258_20
			end

			if arg_255_1.frameCnt_ <= 1 then
				arg_255_1.dialog_:SetActive(false)
			end

			local var_258_22 = 2
			local var_258_23 = 0.125

			if var_258_22 < arg_255_1.time_ and arg_255_1.time_ <= var_258_22 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0

				arg_255_1.dialog_:SetActive(true)

				local var_258_24 = LeanTween.value(arg_255_1.dialog_, 0, 1, 0.3)

				var_258_24:setOnUpdate(LuaHelper.FloatAction(function(arg_259_0)
					arg_255_1.dialogCg_.alpha = arg_259_0
				end))
				var_258_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_255_1.dialog_)
					var_258_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_255_1.duration_ = arg_255_1.duration_ + 0.3

				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_25 = arg_255_1:FormatText(StoryNameCfg[81].name)

				arg_255_1.leftNameTxt_.text = var_258_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_26 = arg_255_1:GetWordFromCfg(123011062)
				local var_258_27 = arg_255_1:FormatText(var_258_26.content)

				arg_255_1.text_.text = var_258_27

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_28 = 5
				local var_258_29 = utf8.len(var_258_27)
				local var_258_30 = var_258_28 <= 0 and var_258_23 or var_258_23 * (var_258_29 / var_258_28)

				if var_258_30 > 0 and var_258_23 < var_258_30 then
					arg_255_1.talkMaxDuration = var_258_30
					var_258_22 = var_258_22 + 0.3

					if var_258_30 + var_258_22 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_30 + var_258_22
					end
				end

				arg_255_1.text_.text = var_258_27
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011062", "story_v_out_123011.awb") ~= 0 then
					local var_258_31 = manager.audio:GetVoiceLength("story_v_out_123011", "123011062", "story_v_out_123011.awb") / 1000

					if var_258_31 + var_258_22 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_31 + var_258_22
					end

					if var_258_26.prefab_name ~= "" and arg_255_1.actors_[var_258_26.prefab_name] ~= nil then
						local var_258_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_26.prefab_name].transform, "story_v_out_123011", "123011062", "story_v_out_123011.awb")

						arg_255_1:RecordAudio("123011062", var_258_32)
						arg_255_1:RecordAudio("123011062", var_258_32)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_123011", "123011062", "story_v_out_123011.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_123011", "123011062", "story_v_out_123011.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_33 = var_258_22 + 0.3
			local var_258_34 = math.max(var_258_23, arg_255_1.talkMaxDuration)

			if var_258_33 <= arg_255_1.time_ and arg_255_1.time_ < var_258_33 + var_258_34 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_33) / var_258_34

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_33 + var_258_34 and arg_255_1.time_ < var_258_33 + var_258_34 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play123011063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 123011063
		arg_261_1.duration_ = 5.666

		local var_261_0 = {
			zh = 4.833,
			ja = 5.666
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
				arg_261_0:Play123011064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.6

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[476].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(123011063)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011063", "story_v_out_123011.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011063", "story_v_out_123011.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_out_123011", "123011063", "story_v_out_123011.awb")

						arg_261_1:RecordAudio("123011063", var_264_9)
						arg_261_1:RecordAudio("123011063", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_123011", "123011063", "story_v_out_123011.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_123011", "123011063", "story_v_out_123011.awb")
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
	Play123011064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 123011064
		arg_265_1.duration_ = 7.233

		local var_265_0 = {
			zh = 5.766,
			ja = 7.233
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
				arg_265_0:Play123011065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.375

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[81].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(123011064)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 15
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011064", "story_v_out_123011.awb") ~= 0 then
					local var_268_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011064", "story_v_out_123011.awb") / 1000

					if var_268_8 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_8 + var_268_0
					end

					if var_268_3.prefab_name ~= "" and arg_265_1.actors_[var_268_3.prefab_name] ~= nil then
						local var_268_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_3.prefab_name].transform, "story_v_out_123011", "123011064", "story_v_out_123011.awb")

						arg_265_1:RecordAudio("123011064", var_268_9)
						arg_265_1:RecordAudio("123011064", var_268_9)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_123011", "123011064", "story_v_out_123011.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_123011", "123011064", "story_v_out_123011.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_10 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_10 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_10

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_10 and arg_265_1.time_ < var_268_0 + var_268_10 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play123011065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 123011065
		arg_269_1.duration_ = 5.066

		local var_269_0 = {
			zh = 2.466,
			ja = 5.066
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
				arg_269_0:Play123011066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.35

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[476].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(123011065)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 14
				local var_272_6 = utf8.len(var_272_4)
				local var_272_7 = var_272_5 <= 0 and var_272_1 or var_272_1 * (var_272_6 / var_272_5)

				if var_272_7 > 0 and var_272_1 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_4
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011065", "story_v_out_123011.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011065", "story_v_out_123011.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_123011", "123011065", "story_v_out_123011.awb")

						arg_269_1:RecordAudio("123011065", var_272_9)
						arg_269_1:RecordAudio("123011065", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_123011", "123011065", "story_v_out_123011.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_123011", "123011065", "story_v_out_123011.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_10 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_10 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_10

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_10 and arg_269_1.time_ < var_272_0 + var_272_10 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play123011066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 123011066
		arg_273_1.duration_ = 11.9

		local var_273_0 = {
			zh = 10.333,
			ja = 11.9
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
				arg_273_0:Play123011067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.85

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[81].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(123011066)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 34
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011066", "story_v_out_123011.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011066", "story_v_out_123011.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_123011", "123011066", "story_v_out_123011.awb")

						arg_273_1:RecordAudio("123011066", var_276_9)
						arg_273_1:RecordAudio("123011066", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_123011", "123011066", "story_v_out_123011.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_123011", "123011066", "story_v_out_123011.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play123011067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 123011067
		arg_277_1.duration_ = 7.9

		local var_277_0 = {
			zh = 5.7,
			ja = 7.9
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
				arg_277_0:Play123011068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.65

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[476].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(123011067)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 26
				local var_280_6 = utf8.len(var_280_4)
				local var_280_7 = var_280_5 <= 0 and var_280_1 or var_280_1 * (var_280_6 / var_280_5)

				if var_280_7 > 0 and var_280_1 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_4
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011067", "story_v_out_123011.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011067", "story_v_out_123011.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_123011", "123011067", "story_v_out_123011.awb")

						arg_277_1:RecordAudio("123011067", var_280_9)
						arg_277_1:RecordAudio("123011067", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_123011", "123011067", "story_v_out_123011.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_123011", "123011067", "story_v_out_123011.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_10 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_10 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_10

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_10 and arg_277_1.time_ < var_280_0 + var_280_10 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play123011068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 123011068
		arg_281_1.duration_ = 2

		local var_281_0 = {
			zh = 1.533,
			ja = 2
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
				arg_281_0:Play123011069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.125

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[81].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(123011068)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011068", "story_v_out_123011.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011068", "story_v_out_123011.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_123011", "123011068", "story_v_out_123011.awb")

						arg_281_1:RecordAudio("123011068", var_284_9)
						arg_281_1:RecordAudio("123011068", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_123011", "123011068", "story_v_out_123011.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_123011", "123011068", "story_v_out_123011.awb")
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
	Play123011069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 123011069
		arg_285_1.duration_ = 16.966

		local var_285_0 = {
			zh = 10.766,
			ja = 16.966
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
				arg_285_0:Play123011070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 1.375

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[476].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(123011069)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 55
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011069", "story_v_out_123011.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011069", "story_v_out_123011.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_123011", "123011069", "story_v_out_123011.awb")

						arg_285_1:RecordAudio("123011069", var_288_9)
						arg_285_1:RecordAudio("123011069", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_123011", "123011069", "story_v_out_123011.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_123011", "123011069", "story_v_out_123011.awb")
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
	Play123011070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 123011070
		arg_289_1.duration_ = 4.166

		local var_289_0 = {
			zh = 3.833,
			ja = 4.166
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
				arg_289_0:Play123011071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.375

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[81].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(123011070)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011070", "story_v_out_123011.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011070", "story_v_out_123011.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_123011", "123011070", "story_v_out_123011.awb")

						arg_289_1:RecordAudio("123011070", var_292_9)
						arg_289_1:RecordAudio("123011070", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_123011", "123011070", "story_v_out_123011.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_123011", "123011070", "story_v_out_123011.awb")
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
	Play123011071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 123011071
		arg_293_1.duration_ = 10.3

		local var_293_0 = {
			zh = 6.666,
			ja = 10.3
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
				arg_293_0:Play123011072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.65

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[476].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(123011071)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 26
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011071", "story_v_out_123011.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011071", "story_v_out_123011.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_123011", "123011071", "story_v_out_123011.awb")

						arg_293_1:RecordAudio("123011071", var_296_9)
						arg_293_1:RecordAudio("123011071", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_123011", "123011071", "story_v_out_123011.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_123011", "123011071", "story_v_out_123011.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_10 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_10 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_10

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_10 and arg_293_1.time_ < var_296_0 + var_296_10 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play123011072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 123011072
		arg_297_1.duration_ = 1.433

		local var_297_0 = {
			zh = 1.1,
			ja = 1.433
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
				arg_297_0:Play123011073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 0.075

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[81].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(123011072)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 3
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011072", "story_v_out_123011.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011072", "story_v_out_123011.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_123011", "123011072", "story_v_out_123011.awb")

						arg_297_1:RecordAudio("123011072", var_300_9)
						arg_297_1:RecordAudio("123011072", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_123011", "123011072", "story_v_out_123011.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_123011", "123011072", "story_v_out_123011.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play123011073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 123011073
		arg_301_1.duration_ = 15.7

		local var_301_0 = {
			zh = 14.066,
			ja = 15.7
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
				arg_301_0:Play123011074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.325

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[476].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(123011073)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 53
				local var_304_6 = utf8.len(var_304_4)
				local var_304_7 = var_304_5 <= 0 and var_304_1 or var_304_1 * (var_304_6 / var_304_5)

				if var_304_7 > 0 and var_304_1 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_4
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011073", "story_v_out_123011.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011073", "story_v_out_123011.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_123011", "123011073", "story_v_out_123011.awb")

						arg_301_1:RecordAudio("123011073", var_304_9)
						arg_301_1:RecordAudio("123011073", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_123011", "123011073", "story_v_out_123011.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_123011", "123011073", "story_v_out_123011.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_10 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_10 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_10

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_10 and arg_301_1.time_ < var_304_0 + var_304_10 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play123011074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 123011074
		arg_305_1.duration_ = 6.933

		local var_305_0 = {
			zh = 6.933,
			ja = 6.6
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
				arg_305_0:Play123011075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.4

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[81].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(123011074)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011074", "story_v_out_123011.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011074", "story_v_out_123011.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_123011", "123011074", "story_v_out_123011.awb")

						arg_305_1:RecordAudio("123011074", var_308_9)
						arg_305_1:RecordAudio("123011074", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_123011", "123011074", "story_v_out_123011.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_123011", "123011074", "story_v_out_123011.awb")
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
	Play123011075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 123011075
		arg_309_1.duration_ = 8.999999999999

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play123011076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 2

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				local var_312_1 = manager.ui.mainCamera.transform.localPosition
				local var_312_2 = Vector3.New(0, 0, 10) + Vector3.New(var_312_1.x, var_312_1.y, 0)
				local var_312_3 = arg_309_1.bgs_.STblack

				var_312_3.transform.localPosition = var_312_2
				var_312_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_312_4 = var_312_3:GetComponent("SpriteRenderer")

				if var_312_4 and var_312_4.sprite then
					local var_312_5 = (var_312_3.transform.localPosition - var_312_1).z
					local var_312_6 = manager.ui.mainCameraCom_
					local var_312_7 = 2 * var_312_5 * Mathf.Tan(var_312_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_312_8 = var_312_7 * var_312_6.aspect
					local var_312_9 = var_312_4.sprite.bounds.size.x
					local var_312_10 = var_312_4.sprite.bounds.size.y
					local var_312_11 = var_312_8 / var_312_9
					local var_312_12 = var_312_7 / var_312_10
					local var_312_13 = var_312_12 < var_312_11 and var_312_11 or var_312_12

					var_312_3.transform.localScale = Vector3.New(var_312_13, var_312_13, 0)
				end

				for iter_312_0, iter_312_1 in pairs(arg_309_1.bgs_) do
					if iter_312_0 ~= "STblack" then
						iter_312_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = true

				arg_309_1:SetGaussion(false)
			end

			local var_312_15 = 2

			if var_312_14 <= arg_309_1.time_ and arg_309_1.time_ < var_312_14 + var_312_15 then
				local var_312_16 = (arg_309_1.time_ - var_312_14) / var_312_15
				local var_312_17 = Color.New(0, 0, 0)

				var_312_17.a = Mathf.Lerp(0, 1, var_312_16)
				arg_309_1.mask_.color = var_312_17
			end

			if arg_309_1.time_ >= var_312_14 + var_312_15 and arg_309_1.time_ < var_312_14 + var_312_15 + arg_312_0 then
				local var_312_18 = Color.New(0, 0, 0)

				var_312_18.a = 1
				arg_309_1.mask_.color = var_312_18
			end

			local var_312_19 = 2

			if var_312_19 < arg_309_1.time_ and arg_309_1.time_ <= var_312_19 + arg_312_0 then
				arg_309_1.mask_.enabled = true
				arg_309_1.mask_.raycastTarget = true

				arg_309_1:SetGaussion(false)
			end

			local var_312_20 = 2

			if var_312_19 <= arg_309_1.time_ and arg_309_1.time_ < var_312_19 + var_312_20 then
				local var_312_21 = (arg_309_1.time_ - var_312_19) / var_312_20
				local var_312_22 = Color.New(0, 0, 0)

				var_312_22.a = Mathf.Lerp(1, 0, var_312_21)
				arg_309_1.mask_.color = var_312_22
			end

			if arg_309_1.time_ >= var_312_19 + var_312_20 and arg_309_1.time_ < var_312_19 + var_312_20 + arg_312_0 then
				local var_312_23 = Color.New(0, 0, 0)
				local var_312_24 = 0

				arg_309_1.mask_.enabled = false
				var_312_23.a = var_312_24
				arg_309_1.mask_.color = var_312_23
			end

			if arg_309_1.frameCnt_ <= 1 then
				arg_309_1.dialog_:SetActive(false)
			end

			local var_312_25 = 3.999999999999
			local var_312_26 = 0.675

			if var_312_25 < arg_309_1.time_ and arg_309_1.time_ <= var_312_25 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0

				arg_309_1.dialog_:SetActive(true)

				local var_312_27 = LeanTween.value(arg_309_1.dialog_, 0, 1, 0.3)

				var_312_27:setOnUpdate(LuaHelper.FloatAction(function(arg_313_0)
					arg_309_1.dialogCg_.alpha = arg_313_0
				end))
				var_312_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_309_1.dialog_)
					var_312_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_309_1.duration_ = arg_309_1.duration_ + 0.3

				SetActive(arg_309_1.leftNameGo_, false)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_28 = arg_309_1:GetWordFromCfg(123011075)
				local var_312_29 = arg_309_1:FormatText(var_312_28.content)

				arg_309_1.text_.text = var_312_29

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_30 = 27
				local var_312_31 = utf8.len(var_312_29)
				local var_312_32 = var_312_30 <= 0 and var_312_26 or var_312_26 * (var_312_31 / var_312_30)

				if var_312_32 > 0 and var_312_26 < var_312_32 then
					arg_309_1.talkMaxDuration = var_312_32
					var_312_25 = var_312_25 + 0.3

					if var_312_32 + var_312_25 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_32 + var_312_25
					end
				end

				arg_309_1.text_.text = var_312_29
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_33 = var_312_25 + 0.3
			local var_312_34 = math.max(var_312_26, arg_309_1.talkMaxDuration)

			if var_312_33 <= arg_309_1.time_ and arg_309_1.time_ < var_312_33 + var_312_34 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_33) / var_312_34

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_33 + var_312_34 and arg_309_1.time_ < var_312_33 + var_312_34 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play123011076 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 123011076
		arg_315_1.duration_ = 7

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play123011077(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = "ST11a"

			if arg_315_1.bgs_[var_318_0] == nil then
				local var_318_1 = Object.Instantiate(arg_315_1.paintGo_)

				var_318_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_318_0)
				var_318_1.name = var_318_0
				var_318_1.transform.parent = arg_315_1.stage_.transform
				var_318_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_315_1.bgs_[var_318_0] = var_318_1
			end

			local var_318_2 = 0

			if var_318_2 < arg_315_1.time_ and arg_315_1.time_ <= var_318_2 + arg_318_0 then
				local var_318_3 = manager.ui.mainCamera.transform.localPosition
				local var_318_4 = Vector3.New(0, 0, 10) + Vector3.New(var_318_3.x, var_318_3.y, 0)
				local var_318_5 = arg_315_1.bgs_.ST11a

				var_318_5.transform.localPosition = var_318_4
				var_318_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_318_6 = var_318_5:GetComponent("SpriteRenderer")

				if var_318_6 and var_318_6.sprite then
					local var_318_7 = (var_318_5.transform.localPosition - var_318_3).z
					local var_318_8 = manager.ui.mainCameraCom_
					local var_318_9 = 2 * var_318_7 * Mathf.Tan(var_318_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_318_10 = var_318_9 * var_318_8.aspect
					local var_318_11 = var_318_6.sprite.bounds.size.x
					local var_318_12 = var_318_6.sprite.bounds.size.y
					local var_318_13 = var_318_10 / var_318_11
					local var_318_14 = var_318_9 / var_318_12
					local var_318_15 = var_318_14 < var_318_13 and var_318_13 or var_318_14

					var_318_5.transform.localScale = Vector3.New(var_318_15, var_318_15, 0)
				end

				for iter_318_0, iter_318_1 in pairs(arg_315_1.bgs_) do
					if iter_318_0 ~= "ST11a" then
						iter_318_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = true

				arg_315_1:SetGaussion(false)
			end

			local var_318_17 = 2

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Color.New(0, 0, 0)

				var_318_19.a = Mathf.Lerp(1, 0, var_318_18)
				arg_315_1.mask_.color = var_318_19
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				local var_318_20 = Color.New(0, 0, 0)
				local var_318_21 = 0

				arg_315_1.mask_.enabled = false
				var_318_20.a = var_318_21
				arg_315_1.mask_.color = var_318_20
			end

			local var_318_22 = 2
			local var_318_23 = 1

			if var_318_22 < arg_315_1.time_ and arg_315_1.time_ <= var_318_22 + arg_318_0 then
				local var_318_24 = "play"
				local var_318_25 = "effect"

				arg_315_1:AudioAction(var_318_24, var_318_25, "se_story_123_01", "se_story_123_01_whoosh", "")
			end

			if arg_315_1.frameCnt_ <= 1 then
				arg_315_1.dialog_:SetActive(false)
			end

			local var_318_26 = 2
			local var_318_27 = 1.375

			if var_318_26 < arg_315_1.time_ and arg_315_1.time_ <= var_318_26 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0

				arg_315_1.dialog_:SetActive(true)

				local var_318_28 = LeanTween.value(arg_315_1.dialog_, 0, 1, 0.3)

				var_318_28:setOnUpdate(LuaHelper.FloatAction(function(arg_319_0)
					arg_315_1.dialogCg_.alpha = arg_319_0
				end))
				var_318_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_315_1.dialog_)
					var_318_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_315_1.duration_ = arg_315_1.duration_ + 0.3

				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_29 = arg_315_1:GetWordFromCfg(123011076)
				local var_318_30 = arg_315_1:FormatText(var_318_29.content)

				arg_315_1.text_.text = var_318_30

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_31 = 55
				local var_318_32 = utf8.len(var_318_30)
				local var_318_33 = var_318_31 <= 0 and var_318_27 or var_318_27 * (var_318_32 / var_318_31)

				if var_318_33 > 0 and var_318_27 < var_318_33 then
					arg_315_1.talkMaxDuration = var_318_33
					var_318_26 = var_318_26 + 0.3

					if var_318_33 + var_318_26 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_33 + var_318_26
					end
				end

				arg_315_1.text_.text = var_318_30
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_34 = var_318_26 + 0.3
			local var_318_35 = math.max(var_318_27, arg_315_1.talkMaxDuration)

			if var_318_34 <= arg_315_1.time_ and arg_315_1.time_ < var_318_34 + var_318_35 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_34) / var_318_35

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_34 + var_318_35 and arg_315_1.time_ < var_318_34 + var_318_35 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play123011077 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 123011077
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play123011078(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.7

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_2 = arg_321_1:GetWordFromCfg(123011077)
				local var_324_3 = arg_321_1:FormatText(var_324_2.content)

				arg_321_1.text_.text = var_324_3

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_4 = 28
				local var_324_5 = utf8.len(var_324_3)
				local var_324_6 = var_324_4 <= 0 and var_324_1 or var_324_1 * (var_324_5 / var_324_4)

				if var_324_6 > 0 and var_324_1 < var_324_6 then
					arg_321_1.talkMaxDuration = var_324_6

					if var_324_6 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_6 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_3
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_7 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_7 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_7

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_7 and arg_321_1.time_ < var_324_0 + var_324_7 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play123011078 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 123011078
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play123011079(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				local var_328_2 = "play"
				local var_328_3 = "effect"

				arg_325_1:AudioAction(var_328_2, var_328_3, "se_story_123_01", "se_story_123_01_hit", "")
			end

			local var_328_4 = 0
			local var_328_5 = 0.475

			if var_328_4 < arg_325_1.time_ and arg_325_1.time_ <= var_328_4 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_6 = arg_325_1:GetWordFromCfg(123011078)
				local var_328_7 = arg_325_1:FormatText(var_328_6.content)

				arg_325_1.text_.text = var_328_7

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_8 = 19
				local var_328_9 = utf8.len(var_328_7)
				local var_328_10 = var_328_8 <= 0 and var_328_5 or var_328_5 * (var_328_9 / var_328_8)

				if var_328_10 > 0 and var_328_5 < var_328_10 then
					arg_325_1.talkMaxDuration = var_328_10

					if var_328_10 + var_328_4 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_10 + var_328_4
					end
				end

				arg_325_1.text_.text = var_328_7
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_11 = math.max(var_328_5, arg_325_1.talkMaxDuration)

			if var_328_4 <= arg_325_1.time_ and arg_325_1.time_ < var_328_4 + var_328_11 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_4) / var_328_11

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_4 + var_328_11 and arg_325_1.time_ < var_328_4 + var_328_11 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play123011079 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 123011079
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play123011080(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 1.05

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_2 = arg_329_1:GetWordFromCfg(123011079)
				local var_332_3 = arg_329_1:FormatText(var_332_2.content)

				arg_329_1.text_.text = var_332_3

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_4 = 42
				local var_332_5 = utf8.len(var_332_3)
				local var_332_6 = var_332_4 <= 0 and var_332_1 or var_332_1 * (var_332_5 / var_332_4)

				if var_332_6 > 0 and var_332_1 < var_332_6 then
					arg_329_1.talkMaxDuration = var_332_6

					if var_332_6 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_6 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_3
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_7 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_7 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_7

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_7 and arg_329_1.time_ < var_332_0 + var_332_7 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play123011080 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 123011080
		arg_333_1.duration_ = 11.966

		local var_333_0 = {
			zh = 8.133,
			ja = 11.966
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
				arg_333_0:Play123011081(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = "1199ui_story"

			if arg_333_1.actors_[var_336_0] == nil then
				local var_336_1 = Object.Instantiate(Asset.Load("Char/" .. var_336_0), arg_333_1.stage_.transform)

				var_336_1.name = var_336_0
				var_336_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_333_1.actors_[var_336_0] = var_336_1

				local var_336_2 = var_336_1:GetComponentInChildren(typeof(CharacterEffect))

				var_336_2.enabled = true

				local var_336_3 = GameObjectTools.GetOrAddComponent(var_336_1, typeof(DynamicBoneHelper))

				if var_336_3 then
					var_336_3:EnableDynamicBone(false)
				end

				arg_333_1:ShowWeapon(var_336_2.transform, false)

				arg_333_1.var_[var_336_0 .. "Animator"] = var_336_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_333_1.var_[var_336_0 .. "Animator"].applyRootMotion = true
				arg_333_1.var_[var_336_0 .. "LipSync"] = var_336_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_336_4 = arg_333_1.actors_["1199ui_story"].transform
			local var_336_5 = 0

			if var_336_5 < arg_333_1.time_ and arg_333_1.time_ <= var_336_5 + arg_336_0 then
				arg_333_1.var_.moveOldPos1199ui_story = var_336_4.localPosition
			end

			local var_336_6 = 0.001

			if var_336_5 <= arg_333_1.time_ and arg_333_1.time_ < var_336_5 + var_336_6 then
				local var_336_7 = (arg_333_1.time_ - var_336_5) / var_336_6
				local var_336_8 = Vector3.New(0, -1.08, -5.9)

				var_336_4.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1199ui_story, var_336_8, var_336_7)

				local var_336_9 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_9.x, var_336_9.y, var_336_9.z)

				local var_336_10 = var_336_4.localEulerAngles

				var_336_10.z = 0
				var_336_10.x = 0
				var_336_4.localEulerAngles = var_336_10
			end

			if arg_333_1.time_ >= var_336_5 + var_336_6 and arg_333_1.time_ < var_336_5 + var_336_6 + arg_336_0 then
				var_336_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_336_11 = manager.ui.mainCamera.transform.position - var_336_4.position

				var_336_4.forward = Vector3.New(var_336_11.x, var_336_11.y, var_336_11.z)

				local var_336_12 = var_336_4.localEulerAngles

				var_336_12.z = 0
				var_336_12.x = 0
				var_336_4.localEulerAngles = var_336_12
			end

			local var_336_13 = arg_333_1.actors_["1199ui_story"]
			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 and arg_333_1.var_.characterEffect1199ui_story == nil then
				arg_333_1.var_.characterEffect1199ui_story = var_336_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_15 = 0.200000002980232

			if var_336_14 <= arg_333_1.time_ and arg_333_1.time_ < var_336_14 + var_336_15 then
				local var_336_16 = (arg_333_1.time_ - var_336_14) / var_336_15

				if arg_333_1.var_.characterEffect1199ui_story then
					arg_333_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_14 + var_336_15 and arg_333_1.time_ < var_336_14 + var_336_15 + arg_336_0 and arg_333_1.var_.characterEffect1199ui_story then
				arg_333_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_336_17 = 0

			if var_336_17 < arg_333_1.time_ and arg_333_1.time_ <= var_336_17 + arg_336_0 then
				arg_333_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_336_18 = 0

			if var_336_18 < arg_333_1.time_ and arg_333_1.time_ <= var_336_18 + arg_336_0 then
				arg_333_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_336_19 = 0
			local var_336_20 = 0.975

			if var_336_19 < arg_333_1.time_ and arg_333_1.time_ <= var_336_19 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_21 = arg_333_1:FormatText(StoryNameCfg[84].name)

				arg_333_1.leftNameTxt_.text = var_336_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_22 = arg_333_1:GetWordFromCfg(123011080)
				local var_336_23 = arg_333_1:FormatText(var_336_22.content)

				arg_333_1.text_.text = var_336_23

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_24 = 39
				local var_336_25 = utf8.len(var_336_23)
				local var_336_26 = var_336_24 <= 0 and var_336_20 or var_336_20 * (var_336_25 / var_336_24)

				if var_336_26 > 0 and var_336_20 < var_336_26 then
					arg_333_1.talkMaxDuration = var_336_26

					if var_336_26 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_26 + var_336_19
					end
				end

				arg_333_1.text_.text = var_336_23
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011080", "story_v_out_123011.awb") ~= 0 then
					local var_336_27 = manager.audio:GetVoiceLength("story_v_out_123011", "123011080", "story_v_out_123011.awb") / 1000

					if var_336_27 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_27 + var_336_19
					end

					if var_336_22.prefab_name ~= "" and arg_333_1.actors_[var_336_22.prefab_name] ~= nil then
						local var_336_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_22.prefab_name].transform, "story_v_out_123011", "123011080", "story_v_out_123011.awb")

						arg_333_1:RecordAudio("123011080", var_336_28)
						arg_333_1:RecordAudio("123011080", var_336_28)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_123011", "123011080", "story_v_out_123011.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_123011", "123011080", "story_v_out_123011.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_29 = math.max(var_336_20, arg_333_1.talkMaxDuration)

			if var_336_19 <= arg_333_1.time_ and arg_333_1.time_ < var_336_19 + var_336_29 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_19) / var_336_29

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_19 + var_336_29 and arg_333_1.time_ < var_336_19 + var_336_29 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play123011081 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 123011081
		arg_337_1.duration_ = 2.9

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play123011082(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.375

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[84].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(123011081)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 15
				local var_340_6 = utf8.len(var_340_4)
				local var_340_7 = var_340_5 <= 0 and var_340_1 or var_340_1 * (var_340_6 / var_340_5)

				if var_340_7 > 0 and var_340_1 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_4
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011081", "story_v_out_123011.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011081", "story_v_out_123011.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_123011", "123011081", "story_v_out_123011.awb")

						arg_337_1:RecordAudio("123011081", var_340_9)
						arg_337_1:RecordAudio("123011081", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_123011", "123011081", "story_v_out_123011.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_123011", "123011081", "story_v_out_123011.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_10 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_10 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_10

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_10 and arg_337_1.time_ < var_340_0 + var_340_10 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play123011082 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 123011082
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play123011083(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1199ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1199ui_story == nil then
				arg_341_1.var_.characterEffect1199ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1199ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1199ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1199ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1199ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.825

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

				local var_344_8 = arg_341_1:GetWordFromCfg(123011082)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 33
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
	Play123011083 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 123011083
		arg_345_1.duration_ = 8.3

		local var_345_0 = {
			zh = 7.033,
			ja = 8.3
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
				arg_345_0:Play123011084(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.8

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[478].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, true)
				arg_345_1.iconController_:SetSelectedState("hero")

				arg_345_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(123011083)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 32
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011083", "story_v_out_123011.awb") ~= 0 then
					local var_348_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011083", "story_v_out_123011.awb") / 1000

					if var_348_8 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_0
					end

					if var_348_3.prefab_name ~= "" and arg_345_1.actors_[var_348_3.prefab_name] ~= nil then
						local var_348_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_3.prefab_name].transform, "story_v_out_123011", "123011083", "story_v_out_123011.awb")

						arg_345_1:RecordAudio("123011083", var_348_9)
						arg_345_1:RecordAudio("123011083", var_348_9)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_123011", "123011083", "story_v_out_123011.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_123011", "123011083", "story_v_out_123011.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_10 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_10 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_10

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_10 and arg_345_1.time_ < var_348_0 + var_348_10 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play123011084 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 123011084
		arg_349_1.duration_ = 1.999999999999

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play123011085(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1199ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1199ui_story == nil then
				arg_349_1.var_.characterEffect1199ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.200000002980232

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1199ui_story then
					arg_349_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1199ui_story then
				arg_349_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_352_4 = 0

			if var_352_4 < arg_349_1.time_ and arg_349_1.time_ <= var_352_4 + arg_352_0 then
				arg_349_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_352_5 = 0
			local var_352_6 = 0.175

			if var_352_5 < arg_349_1.time_ and arg_349_1.time_ <= var_352_5 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_7 = arg_349_1:FormatText(StoryNameCfg[84].name)

				arg_349_1.leftNameTxt_.text = var_352_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_8 = arg_349_1:GetWordFromCfg(123011084)
				local var_352_9 = arg_349_1:FormatText(var_352_8.content)

				arg_349_1.text_.text = var_352_9

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_10 = 7
				local var_352_11 = utf8.len(var_352_9)
				local var_352_12 = var_352_10 <= 0 and var_352_6 or var_352_6 * (var_352_11 / var_352_10)

				if var_352_12 > 0 and var_352_6 < var_352_12 then
					arg_349_1.talkMaxDuration = var_352_12

					if var_352_12 + var_352_5 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_12 + var_352_5
					end
				end

				arg_349_1.text_.text = var_352_9
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011084", "story_v_out_123011.awb") ~= 0 then
					local var_352_13 = manager.audio:GetVoiceLength("story_v_out_123011", "123011084", "story_v_out_123011.awb") / 1000

					if var_352_13 + var_352_5 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_13 + var_352_5
					end

					if var_352_8.prefab_name ~= "" and arg_349_1.actors_[var_352_8.prefab_name] ~= nil then
						local var_352_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_8.prefab_name].transform, "story_v_out_123011", "123011084", "story_v_out_123011.awb")

						arg_349_1:RecordAudio("123011084", var_352_14)
						arg_349_1:RecordAudio("123011084", var_352_14)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_123011", "123011084", "story_v_out_123011.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_123011", "123011084", "story_v_out_123011.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_15 = math.max(var_352_6, arg_349_1.talkMaxDuration)

			if var_352_5 <= arg_349_1.time_ and arg_349_1.time_ < var_352_5 + var_352_15 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_5) / var_352_15

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_5 + var_352_15 and arg_349_1.time_ < var_352_5 + var_352_15 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play123011085 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 123011085
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play123011086(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1199ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect1199ui_story == nil then
				arg_353_1.var_.characterEffect1199ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.200000002980232

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect1199ui_story then
					local var_356_4 = Mathf.Lerp(0, 0.5, var_356_3)

					arg_353_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1199ui_story.fillRatio = var_356_4
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect1199ui_story then
				local var_356_5 = 0.5

				arg_353_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1199ui_story.fillRatio = var_356_5
			end

			local var_356_6 = 0
			local var_356_7 = 1

			if var_356_6 < arg_353_1.time_ and arg_353_1.time_ <= var_356_6 + arg_356_0 then
				local var_356_8 = "play"
				local var_356_9 = "effect"

				arg_353_1:AudioAction(var_356_8, var_356_9, "se_story_123_01", "se_story_123_01_whoosh_draw", "")
			end

			local var_356_10 = 0
			local var_356_11 = 0.5

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, false)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_12 = arg_353_1:GetWordFromCfg(123011085)
				local var_356_13 = arg_353_1:FormatText(var_356_12.content)

				arg_353_1.text_.text = var_356_13

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_14 = 20
				local var_356_15 = utf8.len(var_356_13)
				local var_356_16 = var_356_14 <= 0 and var_356_11 or var_356_11 * (var_356_15 / var_356_14)

				if var_356_16 > 0 and var_356_11 < var_356_16 then
					arg_353_1.talkMaxDuration = var_356_16

					if var_356_16 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_16 + var_356_10
					end
				end

				arg_353_1.text_.text = var_356_13
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_17 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_17 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_10) / var_356_17

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_10 + var_356_17 and arg_353_1.time_ < var_356_10 + var_356_17 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play123011086 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 123011086
		arg_357_1.duration_ = 3.733

		local var_357_0 = {
			zh = 2.1,
			ja = 3.733
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
				arg_357_0:Play123011087(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.275

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[478].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, true)
				arg_357_1.iconController_:SetSelectedState("hero")

				arg_357_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(123011086)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 11
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011086", "story_v_out_123011.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011086", "story_v_out_123011.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_123011", "123011086", "story_v_out_123011.awb")

						arg_357_1:RecordAudio("123011086", var_360_9)
						arg_357_1:RecordAudio("123011086", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_123011", "123011086", "story_v_out_123011.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_123011", "123011086", "story_v_out_123011.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play123011087 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 123011087
		arg_361_1.duration_ = 2.033

		local var_361_0 = {
			zh = 2.033,
			ja = 1.999999999999
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
				arg_361_0:Play123011088(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1199ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1199ui_story == nil then
				arg_361_1.var_.characterEffect1199ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.200000002980232

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1199ui_story then
					arg_361_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1199ui_story then
				arg_361_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_364_4 = 0

			if var_364_4 < arg_361_1.time_ and arg_361_1.time_ <= var_364_4 + arg_364_0 then
				arg_361_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action446")
			end

			local var_364_5 = 0

			if var_364_5 < arg_361_1.time_ and arg_361_1.time_ <= var_364_5 + arg_364_0 then
				arg_361_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_364_6 = 0
			local var_364_7 = 0.3

			if var_364_6 < arg_361_1.time_ and arg_361_1.time_ <= var_364_6 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_8 = arg_361_1:FormatText(StoryNameCfg[84].name)

				arg_361_1.leftNameTxt_.text = var_364_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_9 = arg_361_1:GetWordFromCfg(123011087)
				local var_364_10 = arg_361_1:FormatText(var_364_9.content)

				arg_361_1.text_.text = var_364_10

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_11 = 12
				local var_364_12 = utf8.len(var_364_10)
				local var_364_13 = var_364_11 <= 0 and var_364_7 or var_364_7 * (var_364_12 / var_364_11)

				if var_364_13 > 0 and var_364_7 < var_364_13 then
					arg_361_1.talkMaxDuration = var_364_13

					if var_364_13 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_13 + var_364_6
					end
				end

				arg_361_1.text_.text = var_364_10
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011087", "story_v_out_123011.awb") ~= 0 then
					local var_364_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011087", "story_v_out_123011.awb") / 1000

					if var_364_14 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_14 + var_364_6
					end

					if var_364_9.prefab_name ~= "" and arg_361_1.actors_[var_364_9.prefab_name] ~= nil then
						local var_364_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_9.prefab_name].transform, "story_v_out_123011", "123011087", "story_v_out_123011.awb")

						arg_361_1:RecordAudio("123011087", var_364_15)
						arg_361_1:RecordAudio("123011087", var_364_15)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_123011", "123011087", "story_v_out_123011.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_123011", "123011087", "story_v_out_123011.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_16 = math.max(var_364_7, arg_361_1.talkMaxDuration)

			if var_364_6 <= arg_361_1.time_ and arg_361_1.time_ < var_364_6 + var_364_16 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_6) / var_364_16

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_6 + var_364_16 and arg_361_1.time_ < var_364_6 + var_364_16 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play123011088 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 123011088
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play123011089(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1199ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1199ui_story == nil then
				arg_365_1.var_.characterEffect1199ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.200000002980232

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1199ui_story then
					local var_368_4 = Mathf.Lerp(0, 0.5, var_368_3)

					arg_365_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1199ui_story.fillRatio = var_368_4
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1199ui_story then
				local var_368_5 = 0.5

				arg_365_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1199ui_story.fillRatio = var_368_5
			end

			local var_368_6 = 0
			local var_368_7 = 0.575

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_8 = arg_365_1:GetWordFromCfg(123011088)
				local var_368_9 = arg_365_1:FormatText(var_368_8.content)

				arg_365_1.text_.text = var_368_9

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_10 = 23
				local var_368_11 = utf8.len(var_368_9)
				local var_368_12 = var_368_10 <= 0 and var_368_7 or var_368_7 * (var_368_11 / var_368_10)

				if var_368_12 > 0 and var_368_7 < var_368_12 then
					arg_365_1.talkMaxDuration = var_368_12

					if var_368_12 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_12 + var_368_6
					end
				end

				arg_365_1.text_.text = var_368_9
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_13 = math.max(var_368_7, arg_365_1.talkMaxDuration)

			if var_368_6 <= arg_365_1.time_ and arg_365_1.time_ < var_368_6 + var_368_13 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_6) / var_368_13

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_6 + var_368_13 and arg_365_1.time_ < var_368_6 + var_368_13 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play123011089 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 123011089
		arg_369_1.duration_ = 6.533

		local var_369_0 = {
			zh = 3.966,
			ja = 6.533
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
				arg_369_0:Play123011090(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.45

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[478].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, true)
				arg_369_1.iconController_:SetSelectedState("hero")

				arg_369_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(123011089)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 18
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011089", "story_v_out_123011.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011089", "story_v_out_123011.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_123011", "123011089", "story_v_out_123011.awb")

						arg_369_1:RecordAudio("123011089", var_372_9)
						arg_369_1:RecordAudio("123011089", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_123011", "123011089", "story_v_out_123011.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_123011", "123011089", "story_v_out_123011.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play123011090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 123011090
		arg_373_1.duration_ = 3.6

		local var_373_0 = {
			zh = 2.666,
			ja = 3.6
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
				arg_373_0:Play123011091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1199ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1199ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(0, -1.08, -5.9)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1199ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = arg_373_1.actors_["1199ui_story"]
			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 and arg_373_1.var_.characterEffect1199ui_story == nil then
				arg_373_1.var_.characterEffect1199ui_story = var_376_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_11 = 0.200000002980232

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_11 then
				local var_376_12 = (arg_373_1.time_ - var_376_10) / var_376_11

				if arg_373_1.var_.characterEffect1199ui_story then
					arg_373_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_10 + var_376_11 and arg_373_1.time_ < var_376_10 + var_376_11 + arg_376_0 and arg_373_1.var_.characterEffect1199ui_story then
				arg_373_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_376_13 = 0

			if var_376_13 < arg_373_1.time_ and arg_373_1.time_ <= var_376_13 + arg_376_0 then
				arg_373_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action6_2")
			end

			local var_376_14 = 0

			if var_376_14 < arg_373_1.time_ and arg_373_1.time_ <= var_376_14 + arg_376_0 then
				arg_373_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_376_15 = 0
			local var_376_16 = 0.2

			if var_376_15 < arg_373_1.time_ and arg_373_1.time_ <= var_376_15 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_17 = arg_373_1:FormatText(StoryNameCfg[84].name)

				arg_373_1.leftNameTxt_.text = var_376_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_18 = arg_373_1:GetWordFromCfg(123011090)
				local var_376_19 = arg_373_1:FormatText(var_376_18.content)

				arg_373_1.text_.text = var_376_19

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_20 = 8
				local var_376_21 = utf8.len(var_376_19)
				local var_376_22 = var_376_20 <= 0 and var_376_16 or var_376_16 * (var_376_21 / var_376_20)

				if var_376_22 > 0 and var_376_16 < var_376_22 then
					arg_373_1.talkMaxDuration = var_376_22

					if var_376_22 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_22 + var_376_15
					end
				end

				arg_373_1.text_.text = var_376_19
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011090", "story_v_out_123011.awb") ~= 0 then
					local var_376_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011090", "story_v_out_123011.awb") / 1000

					if var_376_23 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_23 + var_376_15
					end

					if var_376_18.prefab_name ~= "" and arg_373_1.actors_[var_376_18.prefab_name] ~= nil then
						local var_376_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_18.prefab_name].transform, "story_v_out_123011", "123011090", "story_v_out_123011.awb")

						arg_373_1:RecordAudio("123011090", var_376_24)
						arg_373_1:RecordAudio("123011090", var_376_24)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_123011", "123011090", "story_v_out_123011.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_123011", "123011090", "story_v_out_123011.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_25 = math.max(var_376_16, arg_373_1.talkMaxDuration)

			if var_376_15 <= arg_373_1.time_ and arg_373_1.time_ < var_376_15 + var_376_25 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_15) / var_376_25

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_15 + var_376_25 and arg_373_1.time_ < var_376_15 + var_376_25 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play123011091 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 123011091
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play123011092(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1199ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1199ui_story == nil then
				arg_377_1.var_.characterEffect1199ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.200000002980232

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1199ui_story then
					local var_380_4 = Mathf.Lerp(0, 0.5, var_380_3)

					arg_377_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1199ui_story.fillRatio = var_380_4
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1199ui_story then
				local var_380_5 = 0.5

				arg_377_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1199ui_story.fillRatio = var_380_5
			end

			local var_380_6 = arg_377_1.actors_["1199ui_story"].transform
			local var_380_7 = 0

			if var_380_7 < arg_377_1.time_ and arg_377_1.time_ <= var_380_7 + arg_380_0 then
				arg_377_1.var_.moveOldPos1199ui_story = var_380_6.localPosition
			end

			local var_380_8 = 0.001

			if var_380_7 <= arg_377_1.time_ and arg_377_1.time_ < var_380_7 + var_380_8 then
				local var_380_9 = (arg_377_1.time_ - var_380_7) / var_380_8
				local var_380_10 = Vector3.New(0, 100, 0)

				var_380_6.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1199ui_story, var_380_10, var_380_9)

				local var_380_11 = manager.ui.mainCamera.transform.position - var_380_6.position

				var_380_6.forward = Vector3.New(var_380_11.x, var_380_11.y, var_380_11.z)

				local var_380_12 = var_380_6.localEulerAngles

				var_380_12.z = 0
				var_380_12.x = 0
				var_380_6.localEulerAngles = var_380_12
			end

			if arg_377_1.time_ >= var_380_7 + var_380_8 and arg_377_1.time_ < var_380_7 + var_380_8 + arg_380_0 then
				var_380_6.localPosition = Vector3.New(0, 100, 0)

				local var_380_13 = manager.ui.mainCamera.transform.position - var_380_6.position

				var_380_6.forward = Vector3.New(var_380_13.x, var_380_13.y, var_380_13.z)

				local var_380_14 = var_380_6.localEulerAngles

				var_380_14.z = 0
				var_380_14.x = 0
				var_380_6.localEulerAngles = var_380_14
			end

			local var_380_15 = manager.ui.mainCamera.transform
			local var_380_16 = 0

			if var_380_16 < arg_377_1.time_ and arg_377_1.time_ <= var_380_16 + arg_380_0 then
				arg_377_1.var_.shakeOldPos = var_380_15.localPosition
			end

			local var_380_17 = 0.6

			if var_380_16 <= arg_377_1.time_ and arg_377_1.time_ < var_380_16 + var_380_17 then
				local var_380_18 = (arg_377_1.time_ - var_380_16) / 0.066
				local var_380_19, var_380_20 = math.modf(var_380_18)

				var_380_15.localPosition = Vector3.New(var_380_20 * 0.13, var_380_20 * 0.13, var_380_20 * 0.13) + arg_377_1.var_.shakeOldPos
			end

			if arg_377_1.time_ >= var_380_16 + var_380_17 and arg_377_1.time_ < var_380_16 + var_380_17 + arg_380_0 then
				var_380_15.localPosition = arg_377_1.var_.shakeOldPos
			end

			local var_380_21 = 0

			if var_380_21 < arg_377_1.time_ and arg_377_1.time_ <= var_380_21 + arg_380_0 then
				arg_377_1.allBtn_.enabled = false
			end

			local var_380_22 = 0.6

			if arg_377_1.time_ >= var_380_21 + var_380_22 and arg_377_1.time_ < var_380_21 + var_380_22 + arg_380_0 then
				arg_377_1.allBtn_.enabled = true
			end

			local var_380_23 = 0
			local var_380_24 = 1

			if var_380_23 < arg_377_1.time_ and arg_377_1.time_ <= var_380_23 + arg_380_0 then
				local var_380_25 = "play"
				local var_380_26 = "effect"

				arg_377_1:AudioAction(var_380_25, var_380_26, "se_story_123_01", "se_story_123_01_crake", "")
			end

			local var_380_27 = 0
			local var_380_28 = 1.2

			if var_380_27 < arg_377_1.time_ and arg_377_1.time_ <= var_380_27 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_29 = arg_377_1:GetWordFromCfg(123011091)
				local var_380_30 = arg_377_1:FormatText(var_380_29.content)

				arg_377_1.text_.text = var_380_30

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_31 = 48
				local var_380_32 = utf8.len(var_380_30)
				local var_380_33 = var_380_31 <= 0 and var_380_28 or var_380_28 * (var_380_32 / var_380_31)

				if var_380_33 > 0 and var_380_28 < var_380_33 then
					arg_377_1.talkMaxDuration = var_380_33

					if var_380_33 + var_380_27 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_33 + var_380_27
					end
				end

				arg_377_1.text_.text = var_380_30
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_34 = math.max(var_380_28, arg_377_1.talkMaxDuration)

			if var_380_27 <= arg_377_1.time_ and arg_377_1.time_ < var_380_27 + var_380_34 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_27) / var_380_34

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_27 + var_380_34 and arg_377_1.time_ < var_380_27 + var_380_34 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play123011092 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 123011092
		arg_381_1.duration_ = 3.166

		local var_381_0 = {
			zh = 3.166,
			ja = 2.9
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
				arg_381_0:Play123011093(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1199ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos1199ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(0, -1.08, -5.9)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1199ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = arg_381_1.actors_["1199ui_story"]
			local var_384_10 = 0

			if var_384_10 < arg_381_1.time_ and arg_381_1.time_ <= var_384_10 + arg_384_0 and arg_381_1.var_.characterEffect1199ui_story == nil then
				arg_381_1.var_.characterEffect1199ui_story = var_384_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_11 = 0.200000002980232

			if var_384_10 <= arg_381_1.time_ and arg_381_1.time_ < var_384_10 + var_384_11 then
				local var_384_12 = (arg_381_1.time_ - var_384_10) / var_384_11

				if arg_381_1.var_.characterEffect1199ui_story then
					arg_381_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_381_1.time_ >= var_384_10 + var_384_11 and arg_381_1.time_ < var_384_10 + var_384_11 + arg_384_0 and arg_381_1.var_.characterEffect1199ui_story then
				arg_381_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_384_13 = 0

			if var_384_13 < arg_381_1.time_ and arg_381_1.time_ <= var_384_13 + arg_384_0 then
				arg_381_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action3_1")
			end

			local var_384_14 = 0

			if var_384_14 < arg_381_1.time_ and arg_381_1.time_ <= var_384_14 + arg_384_0 then
				arg_381_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_384_15 = 0
			local var_384_16 = 0.25

			if var_384_15 < arg_381_1.time_ and arg_381_1.time_ <= var_384_15 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_17 = arg_381_1:FormatText(StoryNameCfg[84].name)

				arg_381_1.leftNameTxt_.text = var_384_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_18 = arg_381_1:GetWordFromCfg(123011092)
				local var_384_19 = arg_381_1:FormatText(var_384_18.content)

				arg_381_1.text_.text = var_384_19

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_20 = 10
				local var_384_21 = utf8.len(var_384_19)
				local var_384_22 = var_384_20 <= 0 and var_384_16 or var_384_16 * (var_384_21 / var_384_20)

				if var_384_22 > 0 and var_384_16 < var_384_22 then
					arg_381_1.talkMaxDuration = var_384_22

					if var_384_22 + var_384_15 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_22 + var_384_15
					end
				end

				arg_381_1.text_.text = var_384_19
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011092", "story_v_out_123011.awb") ~= 0 then
					local var_384_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011092", "story_v_out_123011.awb") / 1000

					if var_384_23 + var_384_15 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_23 + var_384_15
					end

					if var_384_18.prefab_name ~= "" and arg_381_1.actors_[var_384_18.prefab_name] ~= nil then
						local var_384_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_18.prefab_name].transform, "story_v_out_123011", "123011092", "story_v_out_123011.awb")

						arg_381_1:RecordAudio("123011092", var_384_24)
						arg_381_1:RecordAudio("123011092", var_384_24)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_123011", "123011092", "story_v_out_123011.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_123011", "123011092", "story_v_out_123011.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_25 = math.max(var_384_16, arg_381_1.talkMaxDuration)

			if var_384_15 <= arg_381_1.time_ and arg_381_1.time_ < var_384_15 + var_384_25 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_15) / var_384_25

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_15 + var_384_25 and arg_381_1.time_ < var_384_15 + var_384_25 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play123011093 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 123011093
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play123011094(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1199ui_story"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.characterEffect1199ui_story == nil then
				arg_385_1.var_.characterEffect1199ui_story = var_388_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_2 = 0.200000002980232

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.characterEffect1199ui_story then
					local var_388_4 = Mathf.Lerp(0, 0.5, var_388_3)

					arg_385_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_385_1.var_.characterEffect1199ui_story.fillRatio = var_388_4
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.characterEffect1199ui_story then
				local var_388_5 = 0.5

				arg_385_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_385_1.var_.characterEffect1199ui_story.fillRatio = var_388_5
			end

			local var_388_6 = 0
			local var_388_7 = 0.3

			if var_388_6 < arg_385_1.time_ and arg_385_1.time_ <= var_388_6 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_8 = arg_385_1:GetWordFromCfg(123011093)
				local var_388_9 = arg_385_1:FormatText(var_388_8.content)

				arg_385_1.text_.text = var_388_9

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_10 = 12
				local var_388_11 = utf8.len(var_388_9)
				local var_388_12 = var_388_10 <= 0 and var_388_7 or var_388_7 * (var_388_11 / var_388_10)

				if var_388_12 > 0 and var_388_7 < var_388_12 then
					arg_385_1.talkMaxDuration = var_388_12

					if var_388_12 + var_388_6 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_12 + var_388_6
					end
				end

				arg_385_1.text_.text = var_388_9
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_13 = math.max(var_388_7, arg_385_1.talkMaxDuration)

			if var_388_6 <= arg_385_1.time_ and arg_385_1.time_ < var_388_6 + var_388_13 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_6) / var_388_13

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_6 + var_388_13 and arg_385_1.time_ < var_388_6 + var_388_13 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play123011094 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 123011094
		arg_389_1.duration_ = 12.3

		local var_389_0 = {
			zh = 6.633,
			ja = 12.3
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
				arg_389_0:Play123011095(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1199ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1199ui_story == nil then
				arg_389_1.var_.characterEffect1199ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1199ui_story then
					arg_389_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1199ui_story then
				arg_389_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_392_4 = 0

			if var_392_4 < arg_389_1.time_ and arg_389_1.time_ <= var_392_4 + arg_392_0 then
				arg_389_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_392_5 = 0
			local var_392_6 = 0.8

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_7 = arg_389_1:FormatText(StoryNameCfg[84].name)

				arg_389_1.leftNameTxt_.text = var_392_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_8 = arg_389_1:GetWordFromCfg(123011094)
				local var_392_9 = arg_389_1:FormatText(var_392_8.content)

				arg_389_1.text_.text = var_392_9

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_10 = 32
				local var_392_11 = utf8.len(var_392_9)
				local var_392_12 = var_392_10 <= 0 and var_392_6 or var_392_6 * (var_392_11 / var_392_10)

				if var_392_12 > 0 and var_392_6 < var_392_12 then
					arg_389_1.talkMaxDuration = var_392_12

					if var_392_12 + var_392_5 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_12 + var_392_5
					end
				end

				arg_389_1.text_.text = var_392_9
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011094", "story_v_out_123011.awb") ~= 0 then
					local var_392_13 = manager.audio:GetVoiceLength("story_v_out_123011", "123011094", "story_v_out_123011.awb") / 1000

					if var_392_13 + var_392_5 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_13 + var_392_5
					end

					if var_392_8.prefab_name ~= "" and arg_389_1.actors_[var_392_8.prefab_name] ~= nil then
						local var_392_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_8.prefab_name].transform, "story_v_out_123011", "123011094", "story_v_out_123011.awb")

						arg_389_1:RecordAudio("123011094", var_392_14)
						arg_389_1:RecordAudio("123011094", var_392_14)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_123011", "123011094", "story_v_out_123011.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_123011", "123011094", "story_v_out_123011.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_15 = math.max(var_392_6, arg_389_1.talkMaxDuration)

			if var_392_5 <= arg_389_1.time_ and arg_389_1.time_ < var_392_5 + var_392_15 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_5) / var_392_15

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_5 + var_392_15 and arg_389_1.time_ < var_392_5 + var_392_15 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play123011095 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 123011095
		arg_393_1.duration_ = 8.466

		local var_393_0 = {
			zh = 8.2,
			ja = 8.466
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
				arg_393_0:Play123011096(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = "1029ui_story"

			if arg_393_1.actors_[var_396_0] == nil then
				local var_396_1 = Object.Instantiate(Asset.Load("Char/" .. var_396_0), arg_393_1.stage_.transform)

				var_396_1.name = var_396_0
				var_396_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_393_1.actors_[var_396_0] = var_396_1

				local var_396_2 = var_396_1:GetComponentInChildren(typeof(CharacterEffect))

				var_396_2.enabled = true

				local var_396_3 = GameObjectTools.GetOrAddComponent(var_396_1, typeof(DynamicBoneHelper))

				if var_396_3 then
					var_396_3:EnableDynamicBone(false)
				end

				arg_393_1:ShowWeapon(var_396_2.transform, false)

				arg_393_1.var_[var_396_0 .. "Animator"] = var_396_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_393_1.var_[var_396_0 .. "Animator"].applyRootMotion = true
				arg_393_1.var_[var_396_0 .. "LipSync"] = var_396_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_396_4 = arg_393_1.actors_["1029ui_story"].transform
			local var_396_5 = 0

			if var_396_5 < arg_393_1.time_ and arg_393_1.time_ <= var_396_5 + arg_396_0 then
				arg_393_1.var_.moveOldPos1029ui_story = var_396_4.localPosition
			end

			local var_396_6 = 0.001

			if var_396_5 <= arg_393_1.time_ and arg_393_1.time_ < var_396_5 + var_396_6 then
				local var_396_7 = (arg_393_1.time_ - var_396_5) / var_396_6
				local var_396_8 = Vector3.New(-0.7, -1.09, -6.2)

				var_396_4.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos1029ui_story, var_396_8, var_396_7)

				local var_396_9 = manager.ui.mainCamera.transform.position - var_396_4.position

				var_396_4.forward = Vector3.New(var_396_9.x, var_396_9.y, var_396_9.z)

				local var_396_10 = var_396_4.localEulerAngles

				var_396_10.z = 0
				var_396_10.x = 0
				var_396_4.localEulerAngles = var_396_10
			end

			if arg_393_1.time_ >= var_396_5 + var_396_6 and arg_393_1.time_ < var_396_5 + var_396_6 + arg_396_0 then
				var_396_4.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_396_11 = manager.ui.mainCamera.transform.position - var_396_4.position

				var_396_4.forward = Vector3.New(var_396_11.x, var_396_11.y, var_396_11.z)

				local var_396_12 = var_396_4.localEulerAngles

				var_396_12.z = 0
				var_396_12.x = 0
				var_396_4.localEulerAngles = var_396_12
			end

			local var_396_13 = arg_393_1.actors_["1029ui_story"]
			local var_396_14 = 0

			if var_396_14 < arg_393_1.time_ and arg_393_1.time_ <= var_396_14 + arg_396_0 and arg_393_1.var_.characterEffect1029ui_story == nil then
				arg_393_1.var_.characterEffect1029ui_story = var_396_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_15 = 0.200000002980232

			if var_396_14 <= arg_393_1.time_ and arg_393_1.time_ < var_396_14 + var_396_15 then
				local var_396_16 = (arg_393_1.time_ - var_396_14) / var_396_15

				if arg_393_1.var_.characterEffect1029ui_story then
					arg_393_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_393_1.time_ >= var_396_14 + var_396_15 and arg_393_1.time_ < var_396_14 + var_396_15 + arg_396_0 and arg_393_1.var_.characterEffect1029ui_story then
				arg_393_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_396_17 = 0

			if var_396_17 < arg_393_1.time_ and arg_393_1.time_ <= var_396_17 + arg_396_0 then
				arg_393_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_396_18 = 0

			if var_396_18 < arg_393_1.time_ and arg_393_1.time_ <= var_396_18 + arg_396_0 then
				arg_393_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_396_19 = arg_393_1.actors_["1199ui_story"].transform
			local var_396_20 = 0

			if var_396_20 < arg_393_1.time_ and arg_393_1.time_ <= var_396_20 + arg_396_0 then
				arg_393_1.var_.moveOldPos1199ui_story = var_396_19.localPosition
			end

			local var_396_21 = 0.001

			if var_396_20 <= arg_393_1.time_ and arg_393_1.time_ < var_396_20 + var_396_21 then
				local var_396_22 = (arg_393_1.time_ - var_396_20) / var_396_21
				local var_396_23 = Vector3.New(0.7, -1.08, -5.9)

				var_396_19.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos1199ui_story, var_396_23, var_396_22)

				local var_396_24 = manager.ui.mainCamera.transform.position - var_396_19.position

				var_396_19.forward = Vector3.New(var_396_24.x, var_396_24.y, var_396_24.z)

				local var_396_25 = var_396_19.localEulerAngles

				var_396_25.z = 0
				var_396_25.x = 0
				var_396_19.localEulerAngles = var_396_25
			end

			if arg_393_1.time_ >= var_396_20 + var_396_21 and arg_393_1.time_ < var_396_20 + var_396_21 + arg_396_0 then
				var_396_19.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_396_26 = manager.ui.mainCamera.transform.position - var_396_19.position

				var_396_19.forward = Vector3.New(var_396_26.x, var_396_26.y, var_396_26.z)

				local var_396_27 = var_396_19.localEulerAngles

				var_396_27.z = 0
				var_396_27.x = 0
				var_396_19.localEulerAngles = var_396_27
			end

			local var_396_28 = arg_393_1.actors_["1199ui_story"]
			local var_396_29 = 0

			if var_396_29 < arg_393_1.time_ and arg_393_1.time_ <= var_396_29 + arg_396_0 and arg_393_1.var_.characterEffect1199ui_story == nil then
				arg_393_1.var_.characterEffect1199ui_story = var_396_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_30 = 0.200000002980232

			if var_396_29 <= arg_393_1.time_ and arg_393_1.time_ < var_396_29 + var_396_30 then
				local var_396_31 = (arg_393_1.time_ - var_396_29) / var_396_30

				if arg_393_1.var_.characterEffect1199ui_story then
					local var_396_32 = Mathf.Lerp(0, 0.5, var_396_31)

					arg_393_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1199ui_story.fillRatio = var_396_32
				end
			end

			if arg_393_1.time_ >= var_396_29 + var_396_30 and arg_393_1.time_ < var_396_29 + var_396_30 + arg_396_0 and arg_393_1.var_.characterEffect1199ui_story then
				local var_396_33 = 0.5

				arg_393_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1199ui_story.fillRatio = var_396_33
			end

			local var_396_34 = arg_393_1.actors_["1029ui_story"]
			local var_396_35 = 0

			if var_396_35 < arg_393_1.time_ and arg_393_1.time_ <= var_396_35 + arg_396_0 then
				if arg_393_1.var_.characterEffect1029ui_story == nil then
					arg_393_1.var_.characterEffect1029ui_story = var_396_34:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_396_36 = arg_393_1.var_.characterEffect1029ui_story

				var_396_36.imageEffect:turnOff()

				var_396_36.interferenceEffect.enabled = true
				var_396_36.interferenceEffect.noise = 0.001
				var_396_36.interferenceEffect.simTimeScale = 1
				var_396_36.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_396_37 = arg_393_1.actors_["1029ui_story"]
			local var_396_38 = 0
			local var_396_39 = 0.2

			if var_396_38 < arg_393_1.time_ and arg_393_1.time_ <= var_396_38 + arg_396_0 then
				if arg_393_1.var_.characterEffect1029ui_story == nil then
					arg_393_1.var_.characterEffect1029ui_story = var_396_37:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_393_1.var_.characterEffect1029ui_story.imageEffect:turnOn(false)
			end

			local var_396_40 = 0
			local var_396_41 = 0.825

			if var_396_40 < arg_393_1.time_ and arg_393_1.time_ <= var_396_40 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_42 = arg_393_1:FormatText(StoryNameCfg[319].name)

				arg_393_1.leftNameTxt_.text = var_396_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_43 = arg_393_1:GetWordFromCfg(123011095)
				local var_396_44 = arg_393_1:FormatText(var_396_43.content)

				arg_393_1.text_.text = var_396_44

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_45 = 33
				local var_396_46 = utf8.len(var_396_44)
				local var_396_47 = var_396_45 <= 0 and var_396_41 or var_396_41 * (var_396_46 / var_396_45)

				if var_396_47 > 0 and var_396_41 < var_396_47 then
					arg_393_1.talkMaxDuration = var_396_47

					if var_396_47 + var_396_40 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_47 + var_396_40
					end
				end

				arg_393_1.text_.text = var_396_44
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011095", "story_v_out_123011.awb") ~= 0 then
					local var_396_48 = manager.audio:GetVoiceLength("story_v_out_123011", "123011095", "story_v_out_123011.awb") / 1000

					if var_396_48 + var_396_40 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_48 + var_396_40
					end

					if var_396_43.prefab_name ~= "" and arg_393_1.actors_[var_396_43.prefab_name] ~= nil then
						local var_396_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_43.prefab_name].transform, "story_v_out_123011", "123011095", "story_v_out_123011.awb")

						arg_393_1:RecordAudio("123011095", var_396_49)
						arg_393_1:RecordAudio("123011095", var_396_49)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_123011", "123011095", "story_v_out_123011.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_123011", "123011095", "story_v_out_123011.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_50 = math.max(var_396_41, arg_393_1.talkMaxDuration)

			if var_396_40 <= arg_393_1.time_ and arg_393_1.time_ < var_396_40 + var_396_50 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_40) / var_396_50

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_40 + var_396_50 and arg_393_1.time_ < var_396_40 + var_396_50 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play123011096 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 123011096
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play123011097(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1029ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1029ui_story == nil then
				arg_397_1.var_.characterEffect1029ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1029ui_story then
					local var_400_4 = Mathf.Lerp(0, 0.5, var_400_3)

					arg_397_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_397_1.var_.characterEffect1029ui_story.fillRatio = var_400_4
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1029ui_story then
				local var_400_5 = 0.5

				arg_397_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_397_1.var_.characterEffect1029ui_story.fillRatio = var_400_5
			end

			local var_400_6 = 0
			local var_400_7 = 1

			if var_400_6 < arg_397_1.time_ and arg_397_1.time_ <= var_400_6 + arg_400_0 then
				local var_400_8 = "play"
				local var_400_9 = "effect"

				arg_397_1:AudioAction(var_400_8, var_400_9, "se_story", "se_story_communication", "")
			end

			local var_400_10 = 0
			local var_400_11 = 0.55

			if var_400_10 < arg_397_1.time_ and arg_397_1.time_ <= var_400_10 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_12 = arg_397_1:GetWordFromCfg(123011096)
				local var_400_13 = arg_397_1:FormatText(var_400_12.content)

				arg_397_1.text_.text = var_400_13

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_14 = 22
				local var_400_15 = utf8.len(var_400_13)
				local var_400_16 = var_400_14 <= 0 and var_400_11 or var_400_11 * (var_400_15 / var_400_14)

				if var_400_16 > 0 and var_400_11 < var_400_16 then
					arg_397_1.talkMaxDuration = var_400_16

					if var_400_16 + var_400_10 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_16 + var_400_10
					end
				end

				arg_397_1.text_.text = var_400_13
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_17 = math.max(var_400_11, arg_397_1.talkMaxDuration)

			if var_400_10 <= arg_397_1.time_ and arg_397_1.time_ < var_400_10 + var_400_17 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_10) / var_400_17

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_10 + var_400_17 and arg_397_1.time_ < var_400_10 + var_400_17 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play123011097 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 123011097
		arg_401_1.duration_ = 5.833

		local var_401_0 = {
			zh = 3.6,
			ja = 5.833
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
				arg_401_0:Play123011098(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1029ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1029ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(-0.7, -1.09, -6.2)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1029ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["1029ui_story"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 and arg_401_1.var_.characterEffect1029ui_story == nil then
				arg_401_1.var_.characterEffect1029ui_story = var_404_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_11 = 0.200000002980232

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11

				if arg_401_1.var_.characterEffect1029ui_story then
					local var_404_13 = Mathf.Lerp(0, 0.5, var_404_12)

					arg_401_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1029ui_story.fillRatio = var_404_13
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 and arg_401_1.var_.characterEffect1029ui_story then
				local var_404_14 = 0.5

				arg_401_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1029ui_story.fillRatio = var_404_14
			end

			local var_404_15 = arg_401_1.actors_["1199ui_story"].transform
			local var_404_16 = 0

			if var_404_16 < arg_401_1.time_ and arg_401_1.time_ <= var_404_16 + arg_404_0 then
				arg_401_1.var_.moveOldPos1199ui_story = var_404_15.localPosition
			end

			local var_404_17 = 0.001

			if var_404_16 <= arg_401_1.time_ and arg_401_1.time_ < var_404_16 + var_404_17 then
				local var_404_18 = (arg_401_1.time_ - var_404_16) / var_404_17
				local var_404_19 = Vector3.New(0.7, -1.08, -5.9)

				var_404_15.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1199ui_story, var_404_19, var_404_18)

				local var_404_20 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_20.x, var_404_20.y, var_404_20.z)

				local var_404_21 = var_404_15.localEulerAngles

				var_404_21.z = 0
				var_404_21.x = 0
				var_404_15.localEulerAngles = var_404_21
			end

			if arg_401_1.time_ >= var_404_16 + var_404_17 and arg_401_1.time_ < var_404_16 + var_404_17 + arg_404_0 then
				var_404_15.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_404_22 = manager.ui.mainCamera.transform.position - var_404_15.position

				var_404_15.forward = Vector3.New(var_404_22.x, var_404_22.y, var_404_22.z)

				local var_404_23 = var_404_15.localEulerAngles

				var_404_23.z = 0
				var_404_23.x = 0
				var_404_15.localEulerAngles = var_404_23
			end

			local var_404_24 = arg_401_1.actors_["1199ui_story"]
			local var_404_25 = 0

			if var_404_25 < arg_401_1.time_ and arg_401_1.time_ <= var_404_25 + arg_404_0 and arg_401_1.var_.characterEffect1199ui_story == nil then
				arg_401_1.var_.characterEffect1199ui_story = var_404_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_26 = 0.200000002980232

			if var_404_25 <= arg_401_1.time_ and arg_401_1.time_ < var_404_25 + var_404_26 then
				local var_404_27 = (arg_401_1.time_ - var_404_25) / var_404_26

				if arg_401_1.var_.characterEffect1199ui_story then
					arg_401_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_25 + var_404_26 and arg_401_1.time_ < var_404_25 + var_404_26 + arg_404_0 and arg_401_1.var_.characterEffect1199ui_story then
				arg_401_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_404_28 = 0

			if var_404_28 < arg_401_1.time_ and arg_401_1.time_ <= var_404_28 + arg_404_0 then
				arg_401_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_404_29 = 0
			local var_404_30 = 0.425

			if var_404_29 < arg_401_1.time_ and arg_401_1.time_ <= var_404_29 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_31 = arg_401_1:FormatText(StoryNameCfg[84].name)

				arg_401_1.leftNameTxt_.text = var_404_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_32 = arg_401_1:GetWordFromCfg(123011097)
				local var_404_33 = arg_401_1:FormatText(var_404_32.content)

				arg_401_1.text_.text = var_404_33

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_34 = 17
				local var_404_35 = utf8.len(var_404_33)
				local var_404_36 = var_404_34 <= 0 and var_404_30 or var_404_30 * (var_404_35 / var_404_34)

				if var_404_36 > 0 and var_404_30 < var_404_36 then
					arg_401_1.talkMaxDuration = var_404_36

					if var_404_36 + var_404_29 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_36 + var_404_29
					end
				end

				arg_401_1.text_.text = var_404_33
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011097", "story_v_out_123011.awb") ~= 0 then
					local var_404_37 = manager.audio:GetVoiceLength("story_v_out_123011", "123011097", "story_v_out_123011.awb") / 1000

					if var_404_37 + var_404_29 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_37 + var_404_29
					end

					if var_404_32.prefab_name ~= "" and arg_401_1.actors_[var_404_32.prefab_name] ~= nil then
						local var_404_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_32.prefab_name].transform, "story_v_out_123011", "123011097", "story_v_out_123011.awb")

						arg_401_1:RecordAudio("123011097", var_404_38)
						arg_401_1:RecordAudio("123011097", var_404_38)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_123011", "123011097", "story_v_out_123011.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_123011", "123011097", "story_v_out_123011.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_39 = math.max(var_404_30, arg_401_1.talkMaxDuration)

			if var_404_29 <= arg_401_1.time_ and arg_401_1.time_ < var_404_29 + var_404_39 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_29) / var_404_39

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_29 + var_404_39 and arg_401_1.time_ < var_404_29 + var_404_39 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play123011098 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 123011098
		arg_405_1.duration_ = 8.966

		local var_405_0 = {
			zh = 8.966,
			ja = 7.366
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
				arg_405_0:Play123011099(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1199ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1199ui_story == nil then
				arg_405_1.var_.characterEffect1199ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.200000002980232

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1199ui_story then
					local var_408_4 = Mathf.Lerp(0, 0.5, var_408_3)

					arg_405_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1199ui_story.fillRatio = var_408_4
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1199ui_story then
				local var_408_5 = 0.5

				arg_405_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1199ui_story.fillRatio = var_408_5
			end

			local var_408_6 = arg_405_1.actors_["1029ui_story"]
			local var_408_7 = 0

			if var_408_7 < arg_405_1.time_ and arg_405_1.time_ <= var_408_7 + arg_408_0 and arg_405_1.var_.characterEffect1029ui_story == nil then
				arg_405_1.var_.characterEffect1029ui_story = var_408_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_8 = 0.200000002980232

			if var_408_7 <= arg_405_1.time_ and arg_405_1.time_ < var_408_7 + var_408_8 then
				local var_408_9 = (arg_405_1.time_ - var_408_7) / var_408_8

				if arg_405_1.var_.characterEffect1029ui_story then
					arg_405_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_7 + var_408_8 and arg_405_1.time_ < var_408_7 + var_408_8 + arg_408_0 and arg_405_1.var_.characterEffect1029ui_story then
				arg_405_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_408_10 = 0
			local var_408_11 = 1.075

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_12 = arg_405_1:FormatText(StoryNameCfg[319].name)

				arg_405_1.leftNameTxt_.text = var_408_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_13 = arg_405_1:GetWordFromCfg(123011098)
				local var_408_14 = arg_405_1:FormatText(var_408_13.content)

				arg_405_1.text_.text = var_408_14

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_15 = 43
				local var_408_16 = utf8.len(var_408_14)
				local var_408_17 = var_408_15 <= 0 and var_408_11 or var_408_11 * (var_408_16 / var_408_15)

				if var_408_17 > 0 and var_408_11 < var_408_17 then
					arg_405_1.talkMaxDuration = var_408_17

					if var_408_17 + var_408_10 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_17 + var_408_10
					end
				end

				arg_405_1.text_.text = var_408_14
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011098", "story_v_out_123011.awb") ~= 0 then
					local var_408_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011098", "story_v_out_123011.awb") / 1000

					if var_408_18 + var_408_10 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_18 + var_408_10
					end

					if var_408_13.prefab_name ~= "" and arg_405_1.actors_[var_408_13.prefab_name] ~= nil then
						local var_408_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_13.prefab_name].transform, "story_v_out_123011", "123011098", "story_v_out_123011.awb")

						arg_405_1:RecordAudio("123011098", var_408_19)
						arg_405_1:RecordAudio("123011098", var_408_19)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_123011", "123011098", "story_v_out_123011.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_123011", "123011098", "story_v_out_123011.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_20 = math.max(var_408_11, arg_405_1.talkMaxDuration)

			if var_408_10 <= arg_405_1.time_ and arg_405_1.time_ < var_408_10 + var_408_20 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_10) / var_408_20

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_10 + var_408_20 and arg_405_1.time_ < var_408_10 + var_408_20 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play123011099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 123011099
		arg_409_1.duration_ = 4.9

		local var_409_0 = {
			zh = 4.2,
			ja = 4.9
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
				arg_409_0:Play123011100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1199ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect1199ui_story == nil then
				arg_409_1.var_.characterEffect1199ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.200000002980232

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect1199ui_story then
					arg_409_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect1199ui_story then
				arg_409_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_412_4 = arg_409_1.actors_["1029ui_story"]
			local var_412_5 = 0

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 and arg_409_1.var_.characterEffect1029ui_story == nil then
				arg_409_1.var_.characterEffect1029ui_story = var_412_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_6 = 0.200000002980232

			if var_412_5 <= arg_409_1.time_ and arg_409_1.time_ < var_412_5 + var_412_6 then
				local var_412_7 = (arg_409_1.time_ - var_412_5) / var_412_6

				if arg_409_1.var_.characterEffect1029ui_story then
					local var_412_8 = Mathf.Lerp(0, 0.5, var_412_7)

					arg_409_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_409_1.var_.characterEffect1029ui_story.fillRatio = var_412_8
				end
			end

			if arg_409_1.time_ >= var_412_5 + var_412_6 and arg_409_1.time_ < var_412_5 + var_412_6 + arg_412_0 and arg_409_1.var_.characterEffect1029ui_story then
				local var_412_9 = 0.5

				arg_409_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_409_1.var_.characterEffect1029ui_story.fillRatio = var_412_9
			end

			local var_412_10 = 0
			local var_412_11 = 0.475

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_12 = arg_409_1:FormatText(StoryNameCfg[84].name)

				arg_409_1.leftNameTxt_.text = var_412_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_13 = arg_409_1:GetWordFromCfg(123011099)
				local var_412_14 = arg_409_1:FormatText(var_412_13.content)

				arg_409_1.text_.text = var_412_14

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_15 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011099", "story_v_out_123011.awb") ~= 0 then
					local var_412_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011099", "story_v_out_123011.awb") / 1000

					if var_412_18 + var_412_10 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_18 + var_412_10
					end

					if var_412_13.prefab_name ~= "" and arg_409_1.actors_[var_412_13.prefab_name] ~= nil then
						local var_412_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_13.prefab_name].transform, "story_v_out_123011", "123011099", "story_v_out_123011.awb")

						arg_409_1:RecordAudio("123011099", var_412_19)
						arg_409_1:RecordAudio("123011099", var_412_19)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_123011", "123011099", "story_v_out_123011.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_123011", "123011099", "story_v_out_123011.awb")
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
	Play123011100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 123011100
		arg_413_1.duration_ = 4

		local var_413_0 = {
			zh = 4,
			ja = 2
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
				arg_413_0:Play123011101(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1199ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1199ui_story == nil then
				arg_413_1.var_.characterEffect1199ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1199ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1199ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1199ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1199ui_story.fillRatio = var_416_5
			end

			local var_416_6 = arg_413_1.actors_["1199ui_story"]
			local var_416_7 = 0

			if var_416_7 < arg_413_1.time_ and arg_413_1.time_ <= var_416_7 + arg_416_0 and arg_413_1.var_.characterEffect1199ui_story == nil then
				arg_413_1.var_.characterEffect1199ui_story = var_416_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_8 = 0.200000002980232

			if var_416_7 <= arg_413_1.time_ and arg_413_1.time_ < var_416_7 + var_416_8 then
				local var_416_9 = (arg_413_1.time_ - var_416_7) / var_416_8

				if arg_413_1.var_.characterEffect1199ui_story then
					local var_416_10 = Mathf.Lerp(0, 0.5, var_416_9)

					arg_413_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1199ui_story.fillRatio = var_416_10
				end
			end

			if arg_413_1.time_ >= var_416_7 + var_416_8 and arg_413_1.time_ < var_416_7 + var_416_8 + arg_416_0 and arg_413_1.var_.characterEffect1199ui_story then
				local var_416_11 = 0.5

				arg_413_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1199ui_story.fillRatio = var_416_11
			end

			local var_416_12 = 0
			local var_416_13 = 0.3

			if var_416_12 < arg_413_1.time_ and arg_413_1.time_ <= var_416_12 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_14 = arg_413_1:FormatText(StoryNameCfg[319].name)

				arg_413_1.leftNameTxt_.text = var_416_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_15 = arg_413_1:GetWordFromCfg(123011100)
				local var_416_16 = arg_413_1:FormatText(var_416_15.content)

				arg_413_1.text_.text = var_416_16

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_17 = 12
				local var_416_18 = utf8.len(var_416_16)
				local var_416_19 = var_416_17 <= 0 and var_416_13 or var_416_13 * (var_416_18 / var_416_17)

				if var_416_19 > 0 and var_416_13 < var_416_19 then
					arg_413_1.talkMaxDuration = var_416_19

					if var_416_19 + var_416_12 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_19 + var_416_12
					end
				end

				arg_413_1.text_.text = var_416_16
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011100", "story_v_out_123011.awb") ~= 0 then
					local var_416_20 = manager.audio:GetVoiceLength("story_v_out_123011", "123011100", "story_v_out_123011.awb") / 1000

					if var_416_20 + var_416_12 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_20 + var_416_12
					end

					if var_416_15.prefab_name ~= "" and arg_413_1.actors_[var_416_15.prefab_name] ~= nil then
						local var_416_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_15.prefab_name].transform, "story_v_out_123011", "123011100", "story_v_out_123011.awb")

						arg_413_1:RecordAudio("123011100", var_416_21)
						arg_413_1:RecordAudio("123011100", var_416_21)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_123011", "123011100", "story_v_out_123011.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_123011", "123011100", "story_v_out_123011.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_22 = math.max(var_416_13, arg_413_1.talkMaxDuration)

			if var_416_12 <= arg_413_1.time_ and arg_413_1.time_ < var_416_12 + var_416_22 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_12) / var_416_22

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_12 + var_416_22 and arg_413_1.time_ < var_416_12 + var_416_22 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play123011101 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 123011101
		arg_417_1.duration_ = 12.833

		local var_417_0 = {
			zh = 12.366,
			ja = 12.833
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
				arg_417_0:Play123011102(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = 0
			local var_420_1 = 1.5

			if var_420_0 < arg_417_1.time_ and arg_417_1.time_ <= var_420_0 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_2 = arg_417_1:FormatText(StoryNameCfg[319].name)

				arg_417_1.leftNameTxt_.text = var_420_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_3 = arg_417_1:GetWordFromCfg(123011101)
				local var_420_4 = arg_417_1:FormatText(var_420_3.content)

				arg_417_1.text_.text = var_420_4

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_5 = 60
				local var_420_6 = utf8.len(var_420_4)
				local var_420_7 = var_420_5 <= 0 and var_420_1 or var_420_1 * (var_420_6 / var_420_5)

				if var_420_7 > 0 and var_420_1 < var_420_7 then
					arg_417_1.talkMaxDuration = var_420_7

					if var_420_7 + var_420_0 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_7 + var_420_0
					end
				end

				arg_417_1.text_.text = var_420_4
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011101", "story_v_out_123011.awb") ~= 0 then
					local var_420_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011101", "story_v_out_123011.awb") / 1000

					if var_420_8 + var_420_0 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_8 + var_420_0
					end

					if var_420_3.prefab_name ~= "" and arg_417_1.actors_[var_420_3.prefab_name] ~= nil then
						local var_420_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_3.prefab_name].transform, "story_v_out_123011", "123011101", "story_v_out_123011.awb")

						arg_417_1:RecordAudio("123011101", var_420_9)
						arg_417_1:RecordAudio("123011101", var_420_9)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_123011", "123011101", "story_v_out_123011.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_123011", "123011101", "story_v_out_123011.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_10 = math.max(var_420_1, arg_417_1.talkMaxDuration)

			if var_420_0 <= arg_417_1.time_ and arg_417_1.time_ < var_420_0 + var_420_10 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_0) / var_420_10

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_0 + var_420_10 and arg_417_1.time_ < var_420_0 + var_420_10 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play123011102 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 123011102
		arg_421_1.duration_ = 2.333333333332

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play123011103(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1029ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos1029ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(-0.7, -1.09, -6.2)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1029ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = arg_421_1.actors_["1029ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect1029ui_story == nil then
				arg_421_1.var_.characterEffect1029ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.200000002980232

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect1029ui_story then
					local var_424_13 = Mathf.Lerp(0, 0.5, var_424_12)

					arg_421_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1029ui_story.fillRatio = var_424_13
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect1029ui_story then
				local var_424_14 = 0.5

				arg_421_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1029ui_story.fillRatio = var_424_14
			end

			local var_424_15 = arg_421_1.actors_["1199ui_story"].transform
			local var_424_16 = 0

			if var_424_16 < arg_421_1.time_ and arg_421_1.time_ <= var_424_16 + arg_424_0 then
				arg_421_1.var_.moveOldPos1199ui_story = var_424_15.localPosition
			end

			local var_424_17 = 0.001

			if var_424_16 <= arg_421_1.time_ and arg_421_1.time_ < var_424_16 + var_424_17 then
				local var_424_18 = (arg_421_1.time_ - var_424_16) / var_424_17
				local var_424_19 = Vector3.New(0.7, -1.08, -5.9)

				var_424_15.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1199ui_story, var_424_19, var_424_18)

				local var_424_20 = manager.ui.mainCamera.transform.position - var_424_15.position

				var_424_15.forward = Vector3.New(var_424_20.x, var_424_20.y, var_424_20.z)

				local var_424_21 = var_424_15.localEulerAngles

				var_424_21.z = 0
				var_424_21.x = 0
				var_424_15.localEulerAngles = var_424_21
			end

			if arg_421_1.time_ >= var_424_16 + var_424_17 and arg_421_1.time_ < var_424_16 + var_424_17 + arg_424_0 then
				var_424_15.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_424_22 = manager.ui.mainCamera.transform.position - var_424_15.position

				var_424_15.forward = Vector3.New(var_424_22.x, var_424_22.y, var_424_22.z)

				local var_424_23 = var_424_15.localEulerAngles

				var_424_23.z = 0
				var_424_23.x = 0
				var_424_15.localEulerAngles = var_424_23
			end

			local var_424_24 = arg_421_1.actors_["1199ui_story"]
			local var_424_25 = 0

			if var_424_25 < arg_421_1.time_ and arg_421_1.time_ <= var_424_25 + arg_424_0 and arg_421_1.var_.characterEffect1199ui_story == nil then
				arg_421_1.var_.characterEffect1199ui_story = var_424_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_26 = 0.200000002980232

			if var_424_25 <= arg_421_1.time_ and arg_421_1.time_ < var_424_25 + var_424_26 then
				local var_424_27 = (arg_421_1.time_ - var_424_25) / var_424_26

				if arg_421_1.var_.characterEffect1199ui_story then
					arg_421_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_25 + var_424_26 and arg_421_1.time_ < var_424_25 + var_424_26 + arg_424_0 and arg_421_1.var_.characterEffect1199ui_story then
				arg_421_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_424_28 = 0

			if var_424_28 < arg_421_1.time_ and arg_421_1.time_ <= var_424_28 + arg_424_0 then
				arg_421_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action436")
			end

			local var_424_29 = 0

			if var_424_29 < arg_421_1.time_ and arg_421_1.time_ <= var_424_29 + arg_424_0 then
				arg_421_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_424_30 = 0
			local var_424_31 = 0.125

			if var_424_30 < arg_421_1.time_ and arg_421_1.time_ <= var_424_30 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_32 = arg_421_1:FormatText(StoryNameCfg[84].name)

				arg_421_1.leftNameTxt_.text = var_424_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_33 = arg_421_1:GetWordFromCfg(123011102)
				local var_424_34 = arg_421_1:FormatText(var_424_33.content)

				arg_421_1.text_.text = var_424_34

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_35 = 5
				local var_424_36 = utf8.len(var_424_34)
				local var_424_37 = var_424_35 <= 0 and var_424_31 or var_424_31 * (var_424_36 / var_424_35)

				if var_424_37 > 0 and var_424_31 < var_424_37 then
					arg_421_1.talkMaxDuration = var_424_37

					if var_424_37 + var_424_30 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_37 + var_424_30
					end
				end

				arg_421_1.text_.text = var_424_34
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011102", "story_v_out_123011.awb") ~= 0 then
					local var_424_38 = manager.audio:GetVoiceLength("story_v_out_123011", "123011102", "story_v_out_123011.awb") / 1000

					if var_424_38 + var_424_30 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_38 + var_424_30
					end

					if var_424_33.prefab_name ~= "" and arg_421_1.actors_[var_424_33.prefab_name] ~= nil then
						local var_424_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_33.prefab_name].transform, "story_v_out_123011", "123011102", "story_v_out_123011.awb")

						arg_421_1:RecordAudio("123011102", var_424_39)
						arg_421_1:RecordAudio("123011102", var_424_39)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_123011", "123011102", "story_v_out_123011.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_123011", "123011102", "story_v_out_123011.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_40 = math.max(var_424_31, arg_421_1.talkMaxDuration)

			if var_424_30 <= arg_421_1.time_ and arg_421_1.time_ < var_424_30 + var_424_40 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_30) / var_424_40

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_30 + var_424_40 and arg_421_1.time_ < var_424_30 + var_424_40 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play123011103 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 123011103
		arg_425_1.duration_ = 7.7

		local var_425_0 = {
			zh = 7.166,
			ja = 7.7
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
				arg_425_0:Play123011104(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1199ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1199ui_story == nil then
				arg_425_1.var_.characterEffect1199ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.200000002980232

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1199ui_story then
					local var_428_4 = Mathf.Lerp(0, 0.5, var_428_3)

					arg_425_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1199ui_story.fillRatio = var_428_4
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1199ui_story then
				local var_428_5 = 0.5

				arg_425_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1199ui_story.fillRatio = var_428_5
			end

			local var_428_6 = arg_425_1.actors_["1029ui_story"]
			local var_428_7 = 0

			if var_428_7 < arg_425_1.time_ and arg_425_1.time_ <= var_428_7 + arg_428_0 and arg_425_1.var_.characterEffect1029ui_story == nil then
				arg_425_1.var_.characterEffect1029ui_story = var_428_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_8 = 0.200000002980232

			if var_428_7 <= arg_425_1.time_ and arg_425_1.time_ < var_428_7 + var_428_8 then
				local var_428_9 = (arg_425_1.time_ - var_428_7) / var_428_8

				if arg_425_1.var_.characterEffect1029ui_story then
					arg_425_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_7 + var_428_8 and arg_425_1.time_ < var_428_7 + var_428_8 + arg_428_0 and arg_425_1.var_.characterEffect1029ui_story then
				arg_425_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_428_10 = 0
			local var_428_11 = 0.9

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_12 = arg_425_1:FormatText(StoryNameCfg[319].name)

				arg_425_1.leftNameTxt_.text = var_428_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_13 = arg_425_1:GetWordFromCfg(123011103)
				local var_428_14 = arg_425_1:FormatText(var_428_13.content)

				arg_425_1.text_.text = var_428_14

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_15 = 36
				local var_428_16 = utf8.len(var_428_14)
				local var_428_17 = var_428_15 <= 0 and var_428_11 or var_428_11 * (var_428_16 / var_428_15)

				if var_428_17 > 0 and var_428_11 < var_428_17 then
					arg_425_1.talkMaxDuration = var_428_17

					if var_428_17 + var_428_10 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_17 + var_428_10
					end
				end

				arg_425_1.text_.text = var_428_14
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011103", "story_v_out_123011.awb") ~= 0 then
					local var_428_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011103", "story_v_out_123011.awb") / 1000

					if var_428_18 + var_428_10 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_18 + var_428_10
					end

					if var_428_13.prefab_name ~= "" and arg_425_1.actors_[var_428_13.prefab_name] ~= nil then
						local var_428_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_13.prefab_name].transform, "story_v_out_123011", "123011103", "story_v_out_123011.awb")

						arg_425_1:RecordAudio("123011103", var_428_19)
						arg_425_1:RecordAudio("123011103", var_428_19)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_123011", "123011103", "story_v_out_123011.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_123011", "123011103", "story_v_out_123011.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_20 = math.max(var_428_11, arg_425_1.talkMaxDuration)

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_20 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_10) / var_428_20

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_10 + var_428_20 and arg_425_1.time_ < var_428_10 + var_428_20 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play123011104 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 123011104
		arg_429_1.duration_ = 1.866

		local var_429_0 = {
			zh = 1.333,
			ja = 1.866
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
				arg_429_0:Play123011105(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1199ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1199ui_story == nil then
				arg_429_1.var_.characterEffect1199ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.200000002980232

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1199ui_story then
					arg_429_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1199ui_story then
				arg_429_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_432_4 = arg_429_1.actors_["1029ui_story"]
			local var_432_5 = 0

			if var_432_5 < arg_429_1.time_ and arg_429_1.time_ <= var_432_5 + arg_432_0 and arg_429_1.var_.characterEffect1029ui_story == nil then
				arg_429_1.var_.characterEffect1029ui_story = var_432_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_6 = 0.200000002980232

			if var_432_5 <= arg_429_1.time_ and arg_429_1.time_ < var_432_5 + var_432_6 then
				local var_432_7 = (arg_429_1.time_ - var_432_5) / var_432_6

				if arg_429_1.var_.characterEffect1029ui_story then
					local var_432_8 = Mathf.Lerp(0, 0.5, var_432_7)

					arg_429_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1029ui_story.fillRatio = var_432_8
				end
			end

			if arg_429_1.time_ >= var_432_5 + var_432_6 and arg_429_1.time_ < var_432_5 + var_432_6 + arg_432_0 and arg_429_1.var_.characterEffect1029ui_story then
				local var_432_9 = 0.5

				arg_429_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1029ui_story.fillRatio = var_432_9
			end

			local var_432_10 = 0
			local var_432_11 = 0.2

			if var_432_10 < arg_429_1.time_ and arg_429_1.time_ <= var_432_10 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_12 = arg_429_1:FormatText(StoryNameCfg[84].name)

				arg_429_1.leftNameTxt_.text = var_432_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_13 = arg_429_1:GetWordFromCfg(123011104)
				local var_432_14 = arg_429_1:FormatText(var_432_13.content)

				arg_429_1.text_.text = var_432_14

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_15 = 8
				local var_432_16 = utf8.len(var_432_14)
				local var_432_17 = var_432_15 <= 0 and var_432_11 or var_432_11 * (var_432_16 / var_432_15)

				if var_432_17 > 0 and var_432_11 < var_432_17 then
					arg_429_1.talkMaxDuration = var_432_17

					if var_432_17 + var_432_10 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_17 + var_432_10
					end
				end

				arg_429_1.text_.text = var_432_14
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011104", "story_v_out_123011.awb") ~= 0 then
					local var_432_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011104", "story_v_out_123011.awb") / 1000

					if var_432_18 + var_432_10 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_18 + var_432_10
					end

					if var_432_13.prefab_name ~= "" and arg_429_1.actors_[var_432_13.prefab_name] ~= nil then
						local var_432_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_13.prefab_name].transform, "story_v_out_123011", "123011104", "story_v_out_123011.awb")

						arg_429_1:RecordAudio("123011104", var_432_19)
						arg_429_1:RecordAudio("123011104", var_432_19)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_123011", "123011104", "story_v_out_123011.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_123011", "123011104", "story_v_out_123011.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_20 = math.max(var_432_11, arg_429_1.talkMaxDuration)

			if var_432_10 <= arg_429_1.time_ and arg_429_1.time_ < var_432_10 + var_432_20 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_10) / var_432_20

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_10 + var_432_20 and arg_429_1.time_ < var_432_10 + var_432_20 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play123011105 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 123011105
		arg_433_1.duration_ = 5.533

		local var_433_0 = {
			zh = 4.5,
			ja = 5.533
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play123011106(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1029ui_story"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 and arg_433_1.var_.characterEffect1029ui_story == nil then
				arg_433_1.var_.characterEffect1029ui_story = var_436_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_2 = 0.200000002980232

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2

				if arg_433_1.var_.characterEffect1029ui_story then
					arg_433_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 and arg_433_1.var_.characterEffect1029ui_story then
				arg_433_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_436_4 = arg_433_1.actors_["1199ui_story"]
			local var_436_5 = 0

			if var_436_5 < arg_433_1.time_ and arg_433_1.time_ <= var_436_5 + arg_436_0 and arg_433_1.var_.characterEffect1199ui_story == nil then
				arg_433_1.var_.characterEffect1199ui_story = var_436_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_6 = 0.200000002980232

			if var_436_5 <= arg_433_1.time_ and arg_433_1.time_ < var_436_5 + var_436_6 then
				local var_436_7 = (arg_433_1.time_ - var_436_5) / var_436_6

				if arg_433_1.var_.characterEffect1199ui_story then
					local var_436_8 = Mathf.Lerp(0, 0.5, var_436_7)

					arg_433_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_433_1.var_.characterEffect1199ui_story.fillRatio = var_436_8
				end
			end

			if arg_433_1.time_ >= var_436_5 + var_436_6 and arg_433_1.time_ < var_436_5 + var_436_6 + arg_436_0 and arg_433_1.var_.characterEffect1199ui_story then
				local var_436_9 = 0.5

				arg_433_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_433_1.var_.characterEffect1199ui_story.fillRatio = var_436_9
			end

			local var_436_10 = 0
			local var_436_11 = 0.575

			if var_436_10 < arg_433_1.time_ and arg_433_1.time_ <= var_436_10 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_12 = arg_433_1:FormatText(StoryNameCfg[319].name)

				arg_433_1.leftNameTxt_.text = var_436_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_13 = arg_433_1:GetWordFromCfg(123011105)
				local var_436_14 = arg_433_1:FormatText(var_436_13.content)

				arg_433_1.text_.text = var_436_14

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_15 = 23
				local var_436_16 = utf8.len(var_436_14)
				local var_436_17 = var_436_15 <= 0 and var_436_11 or var_436_11 * (var_436_16 / var_436_15)

				if var_436_17 > 0 and var_436_11 < var_436_17 then
					arg_433_1.talkMaxDuration = var_436_17

					if var_436_17 + var_436_10 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_17 + var_436_10
					end
				end

				arg_433_1.text_.text = var_436_14
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011105", "story_v_out_123011.awb") ~= 0 then
					local var_436_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011105", "story_v_out_123011.awb") / 1000

					if var_436_18 + var_436_10 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_18 + var_436_10
					end

					if var_436_13.prefab_name ~= "" and arg_433_1.actors_[var_436_13.prefab_name] ~= nil then
						local var_436_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_13.prefab_name].transform, "story_v_out_123011", "123011105", "story_v_out_123011.awb")

						arg_433_1:RecordAudio("123011105", var_436_19)
						arg_433_1:RecordAudio("123011105", var_436_19)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_123011", "123011105", "story_v_out_123011.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_123011", "123011105", "story_v_out_123011.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_20 = math.max(var_436_11, arg_433_1.talkMaxDuration)

			if var_436_10 <= arg_433_1.time_ and arg_433_1.time_ < var_436_10 + var_436_20 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_10) / var_436_20

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_10 + var_436_20 and arg_433_1.time_ < var_436_10 + var_436_20 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play123011106 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 123011106
		arg_437_1.duration_ = 1.999999999999

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play123011107(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1029ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.characterEffect1029ui_story == nil then
				arg_437_1.var_.characterEffect1029ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.200000002980232

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1029ui_story then
					local var_440_4 = Mathf.Lerp(0, 0.5, var_440_3)

					arg_437_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1029ui_story.fillRatio = var_440_4
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.characterEffect1029ui_story then
				local var_440_5 = 0.5

				arg_437_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1029ui_story.fillRatio = var_440_5
			end

			local var_440_6 = arg_437_1.actors_["1199ui_story"]
			local var_440_7 = 0

			if var_440_7 < arg_437_1.time_ and arg_437_1.time_ <= var_440_7 + arg_440_0 and arg_437_1.var_.characterEffect1199ui_story == nil then
				arg_437_1.var_.characterEffect1199ui_story = var_440_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_8 = 0.200000002980232

			if var_440_7 <= arg_437_1.time_ and arg_437_1.time_ < var_440_7 + var_440_8 then
				local var_440_9 = (arg_437_1.time_ - var_440_7) / var_440_8

				if arg_437_1.var_.characterEffect1199ui_story then
					arg_437_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_437_1.time_ >= var_440_7 + var_440_8 and arg_437_1.time_ < var_440_7 + var_440_8 + arg_440_0 and arg_437_1.var_.characterEffect1199ui_story then
				arg_437_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_440_10 = 0

			if var_440_10 < arg_437_1.time_ and arg_437_1.time_ <= var_440_10 + arg_440_0 then
				arg_437_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099actionlink/1099action463")
			end

			local var_440_11 = 0

			if var_440_11 < arg_437_1.time_ and arg_437_1.time_ <= var_440_11 + arg_440_0 then
				arg_437_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_440_12 = 0
			local var_440_13 = 0.175

			if var_440_12 < arg_437_1.time_ and arg_437_1.time_ <= var_440_12 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_14 = arg_437_1:FormatText(StoryNameCfg[84].name)

				arg_437_1.leftNameTxt_.text = var_440_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_15 = arg_437_1:GetWordFromCfg(123011106)
				local var_440_16 = arg_437_1:FormatText(var_440_15.content)

				arg_437_1.text_.text = var_440_16

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_17 = 7
				local var_440_18 = utf8.len(var_440_16)
				local var_440_19 = var_440_17 <= 0 and var_440_13 or var_440_13 * (var_440_18 / var_440_17)

				if var_440_19 > 0 and var_440_13 < var_440_19 then
					arg_437_1.talkMaxDuration = var_440_19

					if var_440_19 + var_440_12 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_19 + var_440_12
					end
				end

				arg_437_1.text_.text = var_440_16
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011106", "story_v_out_123011.awb") ~= 0 then
					local var_440_20 = manager.audio:GetVoiceLength("story_v_out_123011", "123011106", "story_v_out_123011.awb") / 1000

					if var_440_20 + var_440_12 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_20 + var_440_12
					end

					if var_440_15.prefab_name ~= "" and arg_437_1.actors_[var_440_15.prefab_name] ~= nil then
						local var_440_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_15.prefab_name].transform, "story_v_out_123011", "123011106", "story_v_out_123011.awb")

						arg_437_1:RecordAudio("123011106", var_440_21)
						arg_437_1:RecordAudio("123011106", var_440_21)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_123011", "123011106", "story_v_out_123011.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_123011", "123011106", "story_v_out_123011.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_22 = math.max(var_440_13, arg_437_1.talkMaxDuration)

			if var_440_12 <= arg_437_1.time_ and arg_437_1.time_ < var_440_12 + var_440_22 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_12) / var_440_22

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_12 + var_440_22 and arg_437_1.time_ < var_440_12 + var_440_22 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play123011107 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 123011107
		arg_441_1.duration_ = 7.166

		local var_441_0 = {
			zh = 4.7,
			ja = 7.166
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
				arg_441_0:Play123011108(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1029ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and arg_441_1.var_.characterEffect1029ui_story == nil then
				arg_441_1.var_.characterEffect1029ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1029ui_story then
					arg_441_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and arg_441_1.var_.characterEffect1029ui_story then
				arg_441_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_444_4 = arg_441_1.actors_["1199ui_story"]
			local var_444_5 = 0

			if var_444_5 < arg_441_1.time_ and arg_441_1.time_ <= var_444_5 + arg_444_0 and arg_441_1.var_.characterEffect1199ui_story == nil then
				arg_441_1.var_.characterEffect1199ui_story = var_444_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_6 = 0.200000002980232

			if var_444_5 <= arg_441_1.time_ and arg_441_1.time_ < var_444_5 + var_444_6 then
				local var_444_7 = (arg_441_1.time_ - var_444_5) / var_444_6

				if arg_441_1.var_.characterEffect1199ui_story then
					local var_444_8 = Mathf.Lerp(0, 0.5, var_444_7)

					arg_441_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_441_1.var_.characterEffect1199ui_story.fillRatio = var_444_8
				end
			end

			if arg_441_1.time_ >= var_444_5 + var_444_6 and arg_441_1.time_ < var_444_5 + var_444_6 + arg_444_0 and arg_441_1.var_.characterEffect1199ui_story then
				local var_444_9 = 0.5

				arg_441_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_441_1.var_.characterEffect1199ui_story.fillRatio = var_444_9
			end

			local var_444_10 = 0
			local var_444_11 = 0.525

			if var_444_10 < arg_441_1.time_ and arg_441_1.time_ <= var_444_10 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_12 = arg_441_1:FormatText(StoryNameCfg[319].name)

				arg_441_1.leftNameTxt_.text = var_444_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_13 = arg_441_1:GetWordFromCfg(123011107)
				local var_444_14 = arg_441_1:FormatText(var_444_13.content)

				arg_441_1.text_.text = var_444_14

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_15 = 21
				local var_444_16 = utf8.len(var_444_14)
				local var_444_17 = var_444_15 <= 0 and var_444_11 or var_444_11 * (var_444_16 / var_444_15)

				if var_444_17 > 0 and var_444_11 < var_444_17 then
					arg_441_1.talkMaxDuration = var_444_17

					if var_444_17 + var_444_10 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_17 + var_444_10
					end
				end

				arg_441_1.text_.text = var_444_14
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011107", "story_v_out_123011.awb") ~= 0 then
					local var_444_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011107", "story_v_out_123011.awb") / 1000

					if var_444_18 + var_444_10 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_18 + var_444_10
					end

					if var_444_13.prefab_name ~= "" and arg_441_1.actors_[var_444_13.prefab_name] ~= nil then
						local var_444_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_13.prefab_name].transform, "story_v_out_123011", "123011107", "story_v_out_123011.awb")

						arg_441_1:RecordAudio("123011107", var_444_19)
						arg_441_1:RecordAudio("123011107", var_444_19)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_123011", "123011107", "story_v_out_123011.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_123011", "123011107", "story_v_out_123011.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_20 = math.max(var_444_11, arg_441_1.talkMaxDuration)

			if var_444_10 <= arg_441_1.time_ and arg_441_1.time_ < var_444_10 + var_444_20 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_10) / var_444_20

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_10 + var_444_20 and arg_441_1.time_ < var_444_10 + var_444_20 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play123011108 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 123011108
		arg_445_1.duration_ = 1.466

		local var_445_0 = {
			zh = 0.999999999999,
			ja = 1.466
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
				arg_445_0:Play123011109(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1029ui_story"]
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 and arg_445_1.var_.characterEffect1029ui_story == nil then
				arg_445_1.var_.characterEffect1029ui_story = var_448_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_2 = 0.200000002980232

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2

				if arg_445_1.var_.characterEffect1029ui_story then
					local var_448_4 = Mathf.Lerp(0, 0.5, var_448_3)

					arg_445_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1029ui_story.fillRatio = var_448_4
				end
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 and arg_445_1.var_.characterEffect1029ui_story then
				local var_448_5 = 0.5

				arg_445_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1029ui_story.fillRatio = var_448_5
			end

			local var_448_6 = arg_445_1.actors_["1199ui_story"]
			local var_448_7 = 0

			if var_448_7 < arg_445_1.time_ and arg_445_1.time_ <= var_448_7 + arg_448_0 and arg_445_1.var_.characterEffect1199ui_story == nil then
				arg_445_1.var_.characterEffect1199ui_story = var_448_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_8 = 0.200000002980232

			if var_448_7 <= arg_445_1.time_ and arg_445_1.time_ < var_448_7 + var_448_8 then
				local var_448_9 = (arg_445_1.time_ - var_448_7) / var_448_8

				if arg_445_1.var_.characterEffect1199ui_story then
					arg_445_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_445_1.time_ >= var_448_7 + var_448_8 and arg_445_1.time_ < var_448_7 + var_448_8 + arg_448_0 and arg_445_1.var_.characterEffect1199ui_story then
				arg_445_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_448_10 = 0
			local var_448_11 = 0.075

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_12 = arg_445_1:FormatText(StoryNameCfg[84].name)

				arg_445_1.leftNameTxt_.text = var_448_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_13 = arg_445_1:GetWordFromCfg(123011108)
				local var_448_14 = arg_445_1:FormatText(var_448_13.content)

				arg_445_1.text_.text = var_448_14

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_15 = 3
				local var_448_16 = utf8.len(var_448_14)
				local var_448_17 = var_448_15 <= 0 and var_448_11 or var_448_11 * (var_448_16 / var_448_15)

				if var_448_17 > 0 and var_448_11 < var_448_17 then
					arg_445_1.talkMaxDuration = var_448_17

					if var_448_17 + var_448_10 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_17 + var_448_10
					end
				end

				arg_445_1.text_.text = var_448_14
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011108", "story_v_out_123011.awb") ~= 0 then
					local var_448_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011108", "story_v_out_123011.awb") / 1000

					if var_448_18 + var_448_10 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_18 + var_448_10
					end

					if var_448_13.prefab_name ~= "" and arg_445_1.actors_[var_448_13.prefab_name] ~= nil then
						local var_448_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_13.prefab_name].transform, "story_v_out_123011", "123011108", "story_v_out_123011.awb")

						arg_445_1:RecordAudio("123011108", var_448_19)
						arg_445_1:RecordAudio("123011108", var_448_19)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_123011", "123011108", "story_v_out_123011.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_123011", "123011108", "story_v_out_123011.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_20 = math.max(var_448_11, arg_445_1.talkMaxDuration)

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_20 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_10) / var_448_20

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_10 + var_448_20 and arg_445_1.time_ < var_448_10 + var_448_20 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play123011109 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 123011109
		arg_449_1.duration_ = 5

		local var_449_0 = {
			zh = 5,
			ja = 3.533
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
				arg_449_0:Play123011110(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["1199ui_story"]
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 and arg_449_1.var_.characterEffect1199ui_story == nil then
				arg_449_1.var_.characterEffect1199ui_story = var_452_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_2 = 0.200000002980232

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2

				if arg_449_1.var_.characterEffect1199ui_story then
					local var_452_4 = Mathf.Lerp(0, 0.5, var_452_3)

					arg_449_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1199ui_story.fillRatio = var_452_4
				end
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 and arg_449_1.var_.characterEffect1199ui_story then
				local var_452_5 = 0.5

				arg_449_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1199ui_story.fillRatio = var_452_5
			end

			local var_452_6 = arg_449_1.actors_["1029ui_story"]
			local var_452_7 = 0

			if var_452_7 < arg_449_1.time_ and arg_449_1.time_ <= var_452_7 + arg_452_0 and arg_449_1.var_.characterEffect1029ui_story == nil then
				arg_449_1.var_.characterEffect1029ui_story = var_452_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_8 = 0.200000002980232

			if var_452_7 <= arg_449_1.time_ and arg_449_1.time_ < var_452_7 + var_452_8 then
				local var_452_9 = (arg_449_1.time_ - var_452_7) / var_452_8

				if arg_449_1.var_.characterEffect1029ui_story then
					arg_449_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_7 + var_452_8 and arg_449_1.time_ < var_452_7 + var_452_8 + arg_452_0 and arg_449_1.var_.characterEffect1029ui_story then
				arg_449_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_452_10 = 0
			local var_452_11 = 0.4

			if var_452_10 < arg_449_1.time_ and arg_449_1.time_ <= var_452_10 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_12 = arg_449_1:FormatText(StoryNameCfg[319].name)

				arg_449_1.leftNameTxt_.text = var_452_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_13 = arg_449_1:GetWordFromCfg(123011109)
				local var_452_14 = arg_449_1:FormatText(var_452_13.content)

				arg_449_1.text_.text = var_452_14

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_15 = 16
				local var_452_16 = utf8.len(var_452_14)
				local var_452_17 = var_452_15 <= 0 and var_452_11 or var_452_11 * (var_452_16 / var_452_15)

				if var_452_17 > 0 and var_452_11 < var_452_17 then
					arg_449_1.talkMaxDuration = var_452_17

					if var_452_17 + var_452_10 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_17 + var_452_10
					end
				end

				arg_449_1.text_.text = var_452_14
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011109", "story_v_out_123011.awb") ~= 0 then
					local var_452_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011109", "story_v_out_123011.awb") / 1000

					if var_452_18 + var_452_10 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_18 + var_452_10
					end

					if var_452_13.prefab_name ~= "" and arg_449_1.actors_[var_452_13.prefab_name] ~= nil then
						local var_452_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_13.prefab_name].transform, "story_v_out_123011", "123011109", "story_v_out_123011.awb")

						arg_449_1:RecordAudio("123011109", var_452_19)
						arg_449_1:RecordAudio("123011109", var_452_19)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_123011", "123011109", "story_v_out_123011.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_123011", "123011109", "story_v_out_123011.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_20 = math.max(var_452_11, arg_449_1.talkMaxDuration)

			if var_452_10 <= arg_449_1.time_ and arg_449_1.time_ < var_452_10 + var_452_20 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_10) / var_452_20

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_10 + var_452_20 and arg_449_1.time_ < var_452_10 + var_452_20 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play123011110 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 123011110
		arg_453_1.duration_ = 12.1

		local var_453_0 = {
			zh = 10.833,
			ja = 12.1
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
				arg_453_0:Play123011111(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_456_2 = 0
			local var_456_3 = 1.35

			if var_456_2 < arg_453_1.time_ and arg_453_1.time_ <= var_456_2 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_4 = arg_453_1:FormatText(StoryNameCfg[319].name)

				arg_453_1.leftNameTxt_.text = var_456_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_5 = arg_453_1:GetWordFromCfg(123011110)
				local var_456_6 = arg_453_1:FormatText(var_456_5.content)

				arg_453_1.text_.text = var_456_6

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_7 = 54
				local var_456_8 = utf8.len(var_456_6)
				local var_456_9 = var_456_7 <= 0 and var_456_3 or var_456_3 * (var_456_8 / var_456_7)

				if var_456_9 > 0 and var_456_3 < var_456_9 then
					arg_453_1.talkMaxDuration = var_456_9

					if var_456_9 + var_456_2 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_9 + var_456_2
					end
				end

				arg_453_1.text_.text = var_456_6
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011110", "story_v_out_123011.awb") ~= 0 then
					local var_456_10 = manager.audio:GetVoiceLength("story_v_out_123011", "123011110", "story_v_out_123011.awb") / 1000

					if var_456_10 + var_456_2 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_10 + var_456_2
					end

					if var_456_5.prefab_name ~= "" and arg_453_1.actors_[var_456_5.prefab_name] ~= nil then
						local var_456_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_5.prefab_name].transform, "story_v_out_123011", "123011110", "story_v_out_123011.awb")

						arg_453_1:RecordAudio("123011110", var_456_11)
						arg_453_1:RecordAudio("123011110", var_456_11)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_123011", "123011110", "story_v_out_123011.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_123011", "123011110", "story_v_out_123011.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_12 = math.max(var_456_3, arg_453_1.talkMaxDuration)

			if var_456_2 <= arg_453_1.time_ and arg_453_1.time_ < var_456_2 + var_456_12 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_2) / var_456_12

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_2 + var_456_12 and arg_453_1.time_ < var_456_2 + var_456_12 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play123011111 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 123011111
		arg_457_1.duration_ = 3.266

		local var_457_0 = {
			zh = 2.466,
			ja = 3.266
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
				arg_457_0:Play123011112(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1029ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1029ui_story == nil then
				arg_457_1.var_.characterEffect1029ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1029ui_story then
					local var_460_4 = Mathf.Lerp(0, 0.5, var_460_3)

					arg_457_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_457_1.var_.characterEffect1029ui_story.fillRatio = var_460_4
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1029ui_story then
				local var_460_5 = 0.5

				arg_457_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_457_1.var_.characterEffect1029ui_story.fillRatio = var_460_5
			end

			local var_460_6 = arg_457_1.actors_["1199ui_story"]
			local var_460_7 = 0

			if var_460_7 < arg_457_1.time_ and arg_457_1.time_ <= var_460_7 + arg_460_0 and arg_457_1.var_.characterEffect1199ui_story == nil then
				arg_457_1.var_.characterEffect1199ui_story = var_460_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_8 = 0.200000002980232

			if var_460_7 <= arg_457_1.time_ and arg_457_1.time_ < var_460_7 + var_460_8 then
				local var_460_9 = (arg_457_1.time_ - var_460_7) / var_460_8

				if arg_457_1.var_.characterEffect1199ui_story then
					arg_457_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_457_1.time_ >= var_460_7 + var_460_8 and arg_457_1.time_ < var_460_7 + var_460_8 + arg_460_0 and arg_457_1.var_.characterEffect1199ui_story then
				arg_457_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_460_10 = 0
			local var_460_11 = 0.375

			if var_460_10 < arg_457_1.time_ and arg_457_1.time_ <= var_460_10 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_12 = arg_457_1:FormatText(StoryNameCfg[84].name)

				arg_457_1.leftNameTxt_.text = var_460_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_13 = arg_457_1:GetWordFromCfg(123011111)
				local var_460_14 = arg_457_1:FormatText(var_460_13.content)

				arg_457_1.text_.text = var_460_14

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_15 = 15
				local var_460_16 = utf8.len(var_460_14)
				local var_460_17 = var_460_15 <= 0 and var_460_11 or var_460_11 * (var_460_16 / var_460_15)

				if var_460_17 > 0 and var_460_11 < var_460_17 then
					arg_457_1.talkMaxDuration = var_460_17

					if var_460_17 + var_460_10 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_17 + var_460_10
					end
				end

				arg_457_1.text_.text = var_460_14
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011111", "story_v_out_123011.awb") ~= 0 then
					local var_460_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011111", "story_v_out_123011.awb") / 1000

					if var_460_18 + var_460_10 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_18 + var_460_10
					end

					if var_460_13.prefab_name ~= "" and arg_457_1.actors_[var_460_13.prefab_name] ~= nil then
						local var_460_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_13.prefab_name].transform, "story_v_out_123011", "123011111", "story_v_out_123011.awb")

						arg_457_1:RecordAudio("123011111", var_460_19)
						arg_457_1:RecordAudio("123011111", var_460_19)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_123011", "123011111", "story_v_out_123011.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_123011", "123011111", "story_v_out_123011.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_20 = math.max(var_460_11, arg_457_1.talkMaxDuration)

			if var_460_10 <= arg_457_1.time_ and arg_457_1.time_ < var_460_10 + var_460_20 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_10) / var_460_20

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_10 + var_460_20 and arg_457_1.time_ < var_460_10 + var_460_20 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play123011112 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 123011112
		arg_461_1.duration_ = 6.4

		local var_461_0 = {
			zh = 5.466,
			ja = 6.4
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
				arg_461_0:Play123011113(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1029ui_story"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.characterEffect1029ui_story == nil then
				arg_461_1.var_.characterEffect1029ui_story = var_464_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_2 = 0.200000002980232

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.characterEffect1029ui_story then
					arg_461_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.characterEffect1029ui_story then
				arg_461_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_464_4 = arg_461_1.actors_["1199ui_story"]
			local var_464_5 = 0

			if var_464_5 < arg_461_1.time_ and arg_461_1.time_ <= var_464_5 + arg_464_0 and arg_461_1.var_.characterEffect1199ui_story == nil then
				arg_461_1.var_.characterEffect1199ui_story = var_464_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_6 = 0.200000002980232

			if var_464_5 <= arg_461_1.time_ and arg_461_1.time_ < var_464_5 + var_464_6 then
				local var_464_7 = (arg_461_1.time_ - var_464_5) / var_464_6

				if arg_461_1.var_.characterEffect1199ui_story then
					local var_464_8 = Mathf.Lerp(0, 0.5, var_464_7)

					arg_461_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_461_1.var_.characterEffect1199ui_story.fillRatio = var_464_8
				end
			end

			if arg_461_1.time_ >= var_464_5 + var_464_6 and arg_461_1.time_ < var_464_5 + var_464_6 + arg_464_0 and arg_461_1.var_.characterEffect1199ui_story then
				local var_464_9 = 0.5

				arg_461_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_461_1.var_.characterEffect1199ui_story.fillRatio = var_464_9
			end

			local var_464_10 = 0
			local var_464_11 = 0.725

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_12 = arg_461_1:FormatText(StoryNameCfg[319].name)

				arg_461_1.leftNameTxt_.text = var_464_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_13 = arg_461_1:GetWordFromCfg(123011112)
				local var_464_14 = arg_461_1:FormatText(var_464_13.content)

				arg_461_1.text_.text = var_464_14

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_15 = 29
				local var_464_16 = utf8.len(var_464_14)
				local var_464_17 = var_464_15 <= 0 and var_464_11 or var_464_11 * (var_464_16 / var_464_15)

				if var_464_17 > 0 and var_464_11 < var_464_17 then
					arg_461_1.talkMaxDuration = var_464_17

					if var_464_17 + var_464_10 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_17 + var_464_10
					end
				end

				arg_461_1.text_.text = var_464_14
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011112", "story_v_out_123011.awb") ~= 0 then
					local var_464_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011112", "story_v_out_123011.awb") / 1000

					if var_464_18 + var_464_10 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_18 + var_464_10
					end

					if var_464_13.prefab_name ~= "" and arg_461_1.actors_[var_464_13.prefab_name] ~= nil then
						local var_464_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_13.prefab_name].transform, "story_v_out_123011", "123011112", "story_v_out_123011.awb")

						arg_461_1:RecordAudio("123011112", var_464_19)
						arg_461_1:RecordAudio("123011112", var_464_19)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_123011", "123011112", "story_v_out_123011.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_123011", "123011112", "story_v_out_123011.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_20 = math.max(var_464_11, arg_461_1.talkMaxDuration)

			if var_464_10 <= arg_461_1.time_ and arg_461_1.time_ < var_464_10 + var_464_20 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_10) / var_464_20

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_10 + var_464_20 and arg_461_1.time_ < var_464_10 + var_464_20 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play123011113 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 123011113
		arg_465_1.duration_ = 4.066

		local var_465_0 = {
			zh = 1.8,
			ja = 4.066
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
				arg_465_0:Play123011114(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1029ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect1029ui_story == nil then
				arg_465_1.var_.characterEffect1029ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect1029ui_story then
					local var_468_4 = Mathf.Lerp(0, 0.5, var_468_3)

					arg_465_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1029ui_story.fillRatio = var_468_4
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect1029ui_story then
				local var_468_5 = 0.5

				arg_465_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1029ui_story.fillRatio = var_468_5
			end

			local var_468_6 = arg_465_1.actors_["1199ui_story"]
			local var_468_7 = 0

			if var_468_7 < arg_465_1.time_ and arg_465_1.time_ <= var_468_7 + arg_468_0 and arg_465_1.var_.characterEffect1199ui_story == nil then
				arg_465_1.var_.characterEffect1199ui_story = var_468_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_8 = 0.200000002980232

			if var_468_7 <= arg_465_1.time_ and arg_465_1.time_ < var_468_7 + var_468_8 then
				local var_468_9 = (arg_465_1.time_ - var_468_7) / var_468_8

				if arg_465_1.var_.characterEffect1199ui_story then
					arg_465_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_7 + var_468_8 and arg_465_1.time_ < var_468_7 + var_468_8 + arg_468_0 and arg_465_1.var_.characterEffect1199ui_story then
				arg_465_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_468_10 = 0
			local var_468_11 = 0.275

			if var_468_10 < arg_465_1.time_ and arg_465_1.time_ <= var_468_10 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_12 = arg_465_1:FormatText(StoryNameCfg[84].name)

				arg_465_1.leftNameTxt_.text = var_468_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_13 = arg_465_1:GetWordFromCfg(123011113)
				local var_468_14 = arg_465_1:FormatText(var_468_13.content)

				arg_465_1.text_.text = var_468_14

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_15 = 11
				local var_468_16 = utf8.len(var_468_14)
				local var_468_17 = var_468_15 <= 0 and var_468_11 or var_468_11 * (var_468_16 / var_468_15)

				if var_468_17 > 0 and var_468_11 < var_468_17 then
					arg_465_1.talkMaxDuration = var_468_17

					if var_468_17 + var_468_10 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_17 + var_468_10
					end
				end

				arg_465_1.text_.text = var_468_14
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011113", "story_v_out_123011.awb") ~= 0 then
					local var_468_18 = manager.audio:GetVoiceLength("story_v_out_123011", "123011113", "story_v_out_123011.awb") / 1000

					if var_468_18 + var_468_10 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_18 + var_468_10
					end

					if var_468_13.prefab_name ~= "" and arg_465_1.actors_[var_468_13.prefab_name] ~= nil then
						local var_468_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_13.prefab_name].transform, "story_v_out_123011", "123011113", "story_v_out_123011.awb")

						arg_465_1:RecordAudio("123011113", var_468_19)
						arg_465_1:RecordAudio("123011113", var_468_19)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_123011", "123011113", "story_v_out_123011.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_123011", "123011113", "story_v_out_123011.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_20 = math.max(var_468_11, arg_465_1.talkMaxDuration)

			if var_468_10 <= arg_465_1.time_ and arg_465_1.time_ < var_468_10 + var_468_20 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_10) / var_468_20

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_10 + var_468_20 and arg_465_1.time_ < var_468_10 + var_468_20 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play123011114 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 123011114
		arg_469_1.duration_ = 7.5

		local var_469_0 = {
			zh = 6.733,
			ja = 7.5
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
				arg_469_0:Play123011115(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1029ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect1029ui_story == nil then
				arg_469_1.var_.characterEffect1029ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1029ui_story then
					arg_469_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect1029ui_story then
				arg_469_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_472_4 = 0

			if var_472_4 < arg_469_1.time_ and arg_469_1.time_ <= var_472_4 + arg_472_0 then
				arg_469_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_1")
			end

			local var_472_5 = 0

			if var_472_5 < arg_469_1.time_ and arg_469_1.time_ <= var_472_5 + arg_472_0 then
				arg_469_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_472_6 = arg_469_1.actors_["1199ui_story"]
			local var_472_7 = 0

			if var_472_7 < arg_469_1.time_ and arg_469_1.time_ <= var_472_7 + arg_472_0 and arg_469_1.var_.characterEffect1199ui_story == nil then
				arg_469_1.var_.characterEffect1199ui_story = var_472_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_8 = 0.200000002980232

			if var_472_7 <= arg_469_1.time_ and arg_469_1.time_ < var_472_7 + var_472_8 then
				local var_472_9 = (arg_469_1.time_ - var_472_7) / var_472_8

				if arg_469_1.var_.characterEffect1199ui_story then
					local var_472_10 = Mathf.Lerp(0, 0.5, var_472_9)

					arg_469_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1199ui_story.fillRatio = var_472_10
				end
			end

			if arg_469_1.time_ >= var_472_7 + var_472_8 and arg_469_1.time_ < var_472_7 + var_472_8 + arg_472_0 and arg_469_1.var_.characterEffect1199ui_story then
				local var_472_11 = 0.5

				arg_469_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1199ui_story.fillRatio = var_472_11
			end

			local var_472_12 = 0
			local var_472_13 = 0.675

			if var_472_12 < arg_469_1.time_ and arg_469_1.time_ <= var_472_12 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_14 = arg_469_1:FormatText(StoryNameCfg[319].name)

				arg_469_1.leftNameTxt_.text = var_472_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_15 = arg_469_1:GetWordFromCfg(123011114)
				local var_472_16 = arg_469_1:FormatText(var_472_15.content)

				arg_469_1.text_.text = var_472_16

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_17 = 27
				local var_472_18 = utf8.len(var_472_16)
				local var_472_19 = var_472_17 <= 0 and var_472_13 or var_472_13 * (var_472_18 / var_472_17)

				if var_472_19 > 0 and var_472_13 < var_472_19 then
					arg_469_1.talkMaxDuration = var_472_19

					if var_472_19 + var_472_12 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_19 + var_472_12
					end
				end

				arg_469_1.text_.text = var_472_16
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011114", "story_v_out_123011.awb") ~= 0 then
					local var_472_20 = manager.audio:GetVoiceLength("story_v_out_123011", "123011114", "story_v_out_123011.awb") / 1000

					if var_472_20 + var_472_12 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_20 + var_472_12
					end

					if var_472_15.prefab_name ~= "" and arg_469_1.actors_[var_472_15.prefab_name] ~= nil then
						local var_472_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_15.prefab_name].transform, "story_v_out_123011", "123011114", "story_v_out_123011.awb")

						arg_469_1:RecordAudio("123011114", var_472_21)
						arg_469_1:RecordAudio("123011114", var_472_21)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_123011", "123011114", "story_v_out_123011.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_123011", "123011114", "story_v_out_123011.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_22 = math.max(var_472_13, arg_469_1.talkMaxDuration)

			if var_472_12 <= arg_469_1.time_ and arg_469_1.time_ < var_472_12 + var_472_22 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_12) / var_472_22

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_12 + var_472_22 and arg_469_1.time_ < var_472_12 + var_472_22 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play123011115 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 123011115
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play123011116(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["1029ui_story"]
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 and arg_473_1.var_.characterEffect1029ui_story == nil then
				arg_473_1.var_.characterEffect1029ui_story = var_476_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_476_2 = 0.200000002980232

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2

				if arg_473_1.var_.characterEffect1029ui_story then
					local var_476_4 = Mathf.Lerp(0, 0.5, var_476_3)

					arg_473_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_473_1.var_.characterEffect1029ui_story.fillRatio = var_476_4
				end
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 and arg_473_1.var_.characterEffect1029ui_story then
				local var_476_5 = 0.5

				arg_473_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_473_1.var_.characterEffect1029ui_story.fillRatio = var_476_5
			end

			local var_476_6 = 0
			local var_476_7 = 1.05

			if var_476_6 < arg_473_1.time_ and arg_473_1.time_ <= var_476_6 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, false)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_8 = arg_473_1:GetWordFromCfg(123011115)
				local var_476_9 = arg_473_1:FormatText(var_476_8.content)

				arg_473_1.text_.text = var_476_9

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_10 = 42
				local var_476_11 = utf8.len(var_476_9)
				local var_476_12 = var_476_10 <= 0 and var_476_7 or var_476_7 * (var_476_11 / var_476_10)

				if var_476_12 > 0 and var_476_7 < var_476_12 then
					arg_473_1.talkMaxDuration = var_476_12

					if var_476_12 + var_476_6 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_12 + var_476_6
					end
				end

				arg_473_1.text_.text = var_476_9
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_13 = math.max(var_476_7, arg_473_1.talkMaxDuration)

			if var_476_6 <= arg_473_1.time_ and arg_473_1.time_ < var_476_6 + var_476_13 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_6) / var_476_13

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_6 + var_476_13 and arg_473_1.time_ < var_476_6 + var_476_13 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play123011116 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 123011116
		arg_477_1.duration_ = 2.5

		local var_477_0 = {
			zh = 2.033,
			ja = 2.5
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play123011117(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1029ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1029ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(0, 100, 0)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1029ui_story, var_480_4, var_480_3)

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

			local var_480_9 = arg_477_1.actors_["1029ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1029ui_story == nil then
				arg_477_1.var_.characterEffect1029ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.200000002980232

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1029ui_story then
					local var_480_13 = Mathf.Lerp(0, 0.5, var_480_12)

					arg_477_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1029ui_story.fillRatio = var_480_13
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect1029ui_story then
				local var_480_14 = 0.5

				arg_477_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1029ui_story.fillRatio = var_480_14
			end

			local var_480_15 = arg_477_1.actors_["1199ui_story"].transform
			local var_480_16 = 0

			if var_480_16 < arg_477_1.time_ and arg_477_1.time_ <= var_480_16 + arg_480_0 then
				arg_477_1.var_.moveOldPos1199ui_story = var_480_15.localPosition
			end

			local var_480_17 = 0.001

			if var_480_16 <= arg_477_1.time_ and arg_477_1.time_ < var_480_16 + var_480_17 then
				local var_480_18 = (arg_477_1.time_ - var_480_16) / var_480_17
				local var_480_19 = Vector3.New(0, 100, 0)

				var_480_15.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1199ui_story, var_480_19, var_480_18)

				local var_480_20 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_20.x, var_480_20.y, var_480_20.z)

				local var_480_21 = var_480_15.localEulerAngles

				var_480_21.z = 0
				var_480_21.x = 0
				var_480_15.localEulerAngles = var_480_21
			end

			if arg_477_1.time_ >= var_480_16 + var_480_17 and arg_477_1.time_ < var_480_16 + var_480_17 + arg_480_0 then
				var_480_15.localPosition = Vector3.New(0, 100, 0)

				local var_480_22 = manager.ui.mainCamera.transform.position - var_480_15.position

				var_480_15.forward = Vector3.New(var_480_22.x, var_480_22.y, var_480_22.z)

				local var_480_23 = var_480_15.localEulerAngles

				var_480_23.z = 0
				var_480_23.x = 0
				var_480_15.localEulerAngles = var_480_23
			end

			local var_480_24 = 0
			local var_480_25 = 0.2

			if var_480_24 < arg_477_1.time_ and arg_477_1.time_ <= var_480_24 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_26 = arg_477_1:FormatText(StoryNameCfg[84].name)

				arg_477_1.leftNameTxt_.text = var_480_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, true)
				arg_477_1.iconController_:SetSelectedState("hero")

				arg_477_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_27 = arg_477_1:GetWordFromCfg(123011116)
				local var_480_28 = arg_477_1:FormatText(var_480_27.content)

				arg_477_1.text_.text = var_480_28

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_29 = 8
				local var_480_30 = utf8.len(var_480_28)
				local var_480_31 = var_480_29 <= 0 and var_480_25 or var_480_25 * (var_480_30 / var_480_29)

				if var_480_31 > 0 and var_480_25 < var_480_31 then
					arg_477_1.talkMaxDuration = var_480_31

					if var_480_31 + var_480_24 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_31 + var_480_24
					end
				end

				arg_477_1.text_.text = var_480_28
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011116", "story_v_out_123011.awb") ~= 0 then
					local var_480_32 = manager.audio:GetVoiceLength("story_v_out_123011", "123011116", "story_v_out_123011.awb") / 1000

					if var_480_32 + var_480_24 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_32 + var_480_24
					end

					if var_480_27.prefab_name ~= "" and arg_477_1.actors_[var_480_27.prefab_name] ~= nil then
						local var_480_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_27.prefab_name].transform, "story_v_out_123011", "123011116", "story_v_out_123011.awb")

						arg_477_1:RecordAudio("123011116", var_480_33)
						arg_477_1:RecordAudio("123011116", var_480_33)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_123011", "123011116", "story_v_out_123011.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_123011", "123011116", "story_v_out_123011.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_34 = math.max(var_480_25, arg_477_1.talkMaxDuration)

			if var_480_24 <= arg_477_1.time_ and arg_477_1.time_ < var_480_24 + var_480_34 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_24) / var_480_34

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_24 + var_480_34 and arg_477_1.time_ < var_480_24 + var_480_34 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play123011117 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 123011117
		arg_481_1.duration_ = 4.433333333332

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play123011118(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 1.999999999999

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				local var_484_1 = manager.ui.mainCamera.transform.localPosition
				local var_484_2 = Vector3.New(0, 0, 10) + Vector3.New(var_484_1.x, var_484_1.y, 0)
				local var_484_3 = arg_481_1.bgs_.STblack

				var_484_3.transform.localPosition = var_484_2
				var_484_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_484_4 = var_484_3:GetComponent("SpriteRenderer")

				if var_484_4 and var_484_4.sprite then
					local var_484_5 = (var_484_3.transform.localPosition - var_484_1).z
					local var_484_6 = manager.ui.mainCameraCom_
					local var_484_7 = 2 * var_484_5 * Mathf.Tan(var_484_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_484_8 = var_484_7 * var_484_6.aspect
					local var_484_9 = var_484_4.sprite.bounds.size.x
					local var_484_10 = var_484_4.sprite.bounds.size.y
					local var_484_11 = var_484_8 / var_484_9
					local var_484_12 = var_484_7 / var_484_10
					local var_484_13 = var_484_12 < var_484_11 and var_484_11 or var_484_12

					var_484_3.transform.localScale = Vector3.New(var_484_13, var_484_13, 0)
				end

				for iter_484_0, iter_484_1 in pairs(arg_481_1.bgs_) do
					if iter_484_0 ~= "STblack" then
						iter_484_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_484_14 = 0

			if var_484_14 < arg_481_1.time_ and arg_481_1.time_ <= var_484_14 + arg_484_0 then
				arg_481_1.mask_.enabled = true
				arg_481_1.mask_.raycastTarget = true

				arg_481_1:SetGaussion(false)
			end

			local var_484_15 = 2

			if var_484_14 <= arg_481_1.time_ and arg_481_1.time_ < var_484_14 + var_484_15 then
				local var_484_16 = (arg_481_1.time_ - var_484_14) / var_484_15
				local var_484_17 = Color.New(0, 0, 0)

				var_484_17.a = Mathf.Lerp(0, 1, var_484_16)
				arg_481_1.mask_.color = var_484_17
			end

			if arg_481_1.time_ >= var_484_14 + var_484_15 and arg_481_1.time_ < var_484_14 + var_484_15 + arg_484_0 then
				local var_484_18 = Color.New(0, 0, 0)

				var_484_18.a = 1
				arg_481_1.mask_.color = var_484_18
			end

			local var_484_19 = 2

			if var_484_19 < arg_481_1.time_ and arg_481_1.time_ <= var_484_19 + arg_484_0 then
				arg_481_1.mask_.enabled = true
				arg_481_1.mask_.raycastTarget = true

				arg_481_1:SetGaussion(false)
			end

			local var_484_20 = 2

			if var_484_19 <= arg_481_1.time_ and arg_481_1.time_ < var_484_19 + var_484_20 then
				local var_484_21 = (arg_481_1.time_ - var_484_19) / var_484_20
				local var_484_22 = Color.New(0, 0, 0)

				var_484_22.a = Mathf.Lerp(1, 0, var_484_21)
				arg_481_1.mask_.color = var_484_22
			end

			if arg_481_1.time_ >= var_484_19 + var_484_20 and arg_481_1.time_ < var_484_19 + var_484_20 + arg_484_0 then
				local var_484_23 = Color.New(0, 0, 0)
				local var_484_24 = 0

				arg_481_1.mask_.enabled = false
				var_484_23.a = var_484_24
				arg_481_1.mask_.color = var_484_23
			end

			local var_484_25 = arg_481_1.actors_["1199ui_story"]
			local var_484_26 = 0

			if var_484_26 < arg_481_1.time_ and arg_481_1.time_ <= var_484_26 + arg_484_0 and arg_481_1.var_.characterEffect1199ui_story == nil then
				arg_481_1.var_.characterEffect1199ui_story = var_484_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_27 = 0.200000002980232

			if var_484_26 <= arg_481_1.time_ and arg_481_1.time_ < var_484_26 + var_484_27 then
				local var_484_28 = (arg_481_1.time_ - var_484_26) / var_484_27

				if arg_481_1.var_.characterEffect1199ui_story then
					local var_484_29 = Mathf.Lerp(0, 0.5, var_484_28)

					arg_481_1.var_.characterEffect1199ui_story.fillFlat = true
					arg_481_1.var_.characterEffect1199ui_story.fillRatio = var_484_29
				end
			end

			if arg_481_1.time_ >= var_484_26 + var_484_27 and arg_481_1.time_ < var_484_26 + var_484_27 + arg_484_0 and arg_481_1.var_.characterEffect1199ui_story then
				local var_484_30 = 0.5

				arg_481_1.var_.characterEffect1199ui_story.fillFlat = true
				arg_481_1.var_.characterEffect1199ui_story.fillRatio = var_484_30
			end

			local var_484_31 = 1.999999999999

			if var_484_31 < arg_481_1.time_ and arg_481_1.time_ <= var_484_31 + arg_484_0 then
				arg_481_1.fswbg_:SetActive(true)
				arg_481_1.dialog_:SetActive(false)

				arg_481_1.fswtw_.percent = 0

				local var_484_32 = arg_481_1:GetWordFromCfg(123011117)
				local var_484_33 = arg_481_1:FormatText(var_484_32.content)

				arg_481_1.fswt_.text = var_484_33

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.fswt_)

				arg_481_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_481_1.fswtw_:SetDirty()

				arg_481_1.typewritterCharCountI18N = 0

				SetActive(arg_481_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_481_1:ShowNextGo(false)
			end

			local var_484_34 = 2.01666666666567

			if var_484_34 < arg_481_1.time_ and arg_481_1.time_ <= var_484_34 + arg_484_0 then
				arg_481_1.var_.oldValueTypewriter = arg_481_1.fswtw_.percent

				arg_481_1:ShowNextGo(false)
			end

			local var_484_35 = 22
			local var_484_36 = 1.46666666666667
			local var_484_37 = arg_481_1:GetWordFromCfg(123011117)
			local var_484_38 = arg_481_1:FormatText(var_484_37.content)
			local var_484_39, var_484_40 = arg_481_1:GetPercentByPara(var_484_38, 1)

			if var_484_34 < arg_481_1.time_ and arg_481_1.time_ <= var_484_34 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0

				local var_484_41 = var_484_35 <= 0 and var_484_36 or var_484_36 * ((var_484_40 - arg_481_1.typewritterCharCountI18N) / var_484_35)

				if var_484_41 > 0 and var_484_36 < var_484_41 then
					arg_481_1.talkMaxDuration = var_484_41

					if var_484_41 + var_484_34 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_41 + var_484_34
					end
				end
			end

			local var_484_42 = 1.46666666666667
			local var_484_43 = math.max(var_484_42, arg_481_1.talkMaxDuration)

			if var_484_34 <= arg_481_1.time_ and arg_481_1.time_ < var_484_34 + var_484_43 then
				local var_484_44 = (arg_481_1.time_ - var_484_34) / var_484_43

				arg_481_1.fswtw_.percent = Mathf.Lerp(arg_481_1.var_.oldValueTypewriter, var_484_39, var_484_44)
				arg_481_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_481_1.fswtw_:SetDirty()
			end

			if arg_481_1.time_ >= var_484_34 + var_484_43 and arg_481_1.time_ < var_484_34 + var_484_43 + arg_484_0 then
				arg_481_1.fswtw_.percent = var_484_39

				arg_481_1.fswtw_:SetDirty()
				arg_481_1:ShowNextGo(true)

				arg_481_1.typewritterCharCountI18N = var_484_40
			end

			local var_484_45 = 1.999999999999

			if var_484_45 < arg_481_1.time_ and arg_481_1.time_ <= var_484_45 + arg_484_0 then
				local var_484_46 = arg_481_1.fswbg_.transform:Find("textbox/adapt/content") or arg_481_1.fswbg_.transform:Find("textbox/content")
				local var_484_47 = var_484_46:GetComponent("Text")
				local var_484_48 = var_484_46:GetComponent("RectTransform")

				var_484_47.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_484_48.offsetMin = Vector2.New(0, 0)
				var_484_48.offsetMax = Vector2.New(0, 0)
			end

			local var_484_49 = 0
			local var_484_50 = 0.866666666666667

			if var_484_49 < arg_481_1.time_ and arg_481_1.time_ <= var_484_49 + arg_484_0 then
				local var_484_51 = "play"
				local var_484_52 = "music"

				arg_481_1:AudioAction(var_484_51, var_484_52, "ui_battle", "ui_battle_stopbgm", "")
			end
		end
	end,
	Play123011118 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 123011118
		arg_485_1.duration_ = 7.399999999999

		local var_485_0 = {
			zh = 6.399999999999,
			ja = 7.399999999999
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
				arg_485_0:Play123011119(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = "XH0509"

			if arg_485_1.bgs_[var_488_0] == nil then
				local var_488_1 = Object.Instantiate(arg_485_1.paintGo_)

				var_488_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_488_0)
				var_488_1.name = var_488_0
				var_488_1.transform.parent = arg_485_1.stage_.transform
				var_488_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_485_1.bgs_[var_488_0] = var_488_1
			end

			local var_488_2 = 2

			if var_488_2 < arg_485_1.time_ and arg_485_1.time_ <= var_488_2 + arg_488_0 then
				local var_488_3 = manager.ui.mainCamera.transform.localPosition
				local var_488_4 = Vector3.New(0, 0, 10) + Vector3.New(var_488_3.x, var_488_3.y, 0)
				local var_488_5 = arg_485_1.bgs_.XH0509

				var_488_5.transform.localPosition = var_488_4
				var_488_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_488_6 = var_488_5:GetComponent("SpriteRenderer")

				if var_488_6 and var_488_6.sprite then
					local var_488_7 = (var_488_5.transform.localPosition - var_488_3).z
					local var_488_8 = manager.ui.mainCameraCom_
					local var_488_9 = 2 * var_488_7 * Mathf.Tan(var_488_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_488_10 = var_488_9 * var_488_8.aspect
					local var_488_11 = var_488_6.sprite.bounds.size.x
					local var_488_12 = var_488_6.sprite.bounds.size.y
					local var_488_13 = var_488_10 / var_488_11
					local var_488_14 = var_488_9 / var_488_12
					local var_488_15 = var_488_14 < var_488_13 and var_488_13 or var_488_14

					var_488_5.transform.localScale = Vector3.New(var_488_15, var_488_15, 0)
				end

				for iter_488_0, iter_488_1 in pairs(arg_485_1.bgs_) do
					if iter_488_0 ~= "XH0509" then
						iter_488_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_488_16 = 0

			if var_488_16 < arg_485_1.time_ and arg_485_1.time_ <= var_488_16 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_17 = 2

			if var_488_16 <= arg_485_1.time_ and arg_485_1.time_ < var_488_16 + var_488_17 then
				local var_488_18 = (arg_485_1.time_ - var_488_16) / var_488_17
				local var_488_19 = Color.New(0, 0, 0)

				var_488_19.a = Mathf.Lerp(0, 1, var_488_18)
				arg_485_1.mask_.color = var_488_19
			end

			if arg_485_1.time_ >= var_488_16 + var_488_17 and arg_485_1.time_ < var_488_16 + var_488_17 + arg_488_0 then
				local var_488_20 = Color.New(0, 0, 0)

				var_488_20.a = 1
				arg_485_1.mask_.color = var_488_20
			end

			local var_488_21 = 2

			if var_488_21 < arg_485_1.time_ and arg_485_1.time_ <= var_488_21 + arg_488_0 then
				arg_485_1.mask_.enabled = true
				arg_485_1.mask_.raycastTarget = true

				arg_485_1:SetGaussion(false)
			end

			local var_488_22 = 2

			if var_488_21 <= arg_485_1.time_ and arg_485_1.time_ < var_488_21 + var_488_22 then
				local var_488_23 = (arg_485_1.time_ - var_488_21) / var_488_22
				local var_488_24 = Color.New(0, 0, 0)

				var_488_24.a = Mathf.Lerp(1, 0, var_488_23)
				arg_485_1.mask_.color = var_488_24
			end

			if arg_485_1.time_ >= var_488_21 + var_488_22 and arg_485_1.time_ < var_488_21 + var_488_22 + arg_488_0 then
				local var_488_25 = Color.New(0, 0, 0)
				local var_488_26 = 0

				arg_485_1.mask_.enabled = false
				var_488_25.a = var_488_26
				arg_485_1.mask_.color = var_488_25
			end

			local var_488_27 = 1.98333333333333

			if var_488_27 < arg_485_1.time_ and arg_485_1.time_ <= var_488_27 + arg_488_0 then
				arg_485_1.fswbg_:SetActive(false)
				arg_485_1.dialog_:SetActive(false)
				arg_485_1:ShowNextGo(false)
			end

			local var_488_28 = 2

			if var_488_28 < arg_485_1.time_ and arg_485_1.time_ <= var_488_28 + arg_488_0 then
				arg_485_1.screenFilterGo_:SetActive(true)

				arg_485_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_488_29 = 0.1

			if var_488_28 <= arg_485_1.time_ and arg_485_1.time_ < var_488_28 + var_488_29 then
				local var_488_30 = (arg_485_1.time_ - var_488_28) / var_488_29

				arg_485_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_488_30)
			end

			if arg_485_1.time_ >= var_488_28 + var_488_29 and arg_485_1.time_ < var_488_28 + var_488_29 + arg_488_0 then
				arg_485_1.screenFilterEffect_.weight = 1
			end

			local var_488_31 = 0
			local var_488_32 = 0.866666666666667

			if var_488_31 < arg_485_1.time_ and arg_485_1.time_ <= var_488_31 + arg_488_0 then
				local var_488_33 = "play"
				local var_488_34 = "music"

				arg_485_1:AudioAction(var_488_33, var_488_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_488_35 = 1.999999999999
			local var_488_36 = 1

			if var_488_35 < arg_485_1.time_ and arg_485_1.time_ <= var_488_35 + arg_488_0 then
				local var_488_37 = "play"
				local var_488_38 = "music"

				arg_485_1:AudioAction(var_488_37, var_488_38, "bgm_activity_2_2_story_talk", "bgm_activity_2_2_story_talk", "bgm_activity_2_2_story_talk.awb")
			end

			if arg_485_1.frameCnt_ <= 1 then
				arg_485_1.dialog_:SetActive(false)
			end

			local var_488_39 = 3.999999999999
			local var_488_40 = 0.3

			if var_488_39 < arg_485_1.time_ and arg_485_1.time_ <= var_488_39 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0

				arg_485_1.dialog_:SetActive(true)

				local var_488_41 = LeanTween.value(arg_485_1.dialog_, 0, 1, 0.3)

				var_488_41:setOnUpdate(LuaHelper.FloatAction(function(arg_489_0)
					arg_485_1.dialogCg_.alpha = arg_489_0
				end))
				var_488_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_485_1.dialog_)
					var_488_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_485_1.duration_ = arg_485_1.duration_ + 0.3

				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_42 = arg_485_1:FormatText(StoryNameCfg[6].name)

				arg_485_1.leftNameTxt_.text = var_488_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_43 = arg_485_1:GetWordFromCfg(123011118)
				local var_488_44 = arg_485_1:FormatText(var_488_43.content)

				arg_485_1.text_.text = var_488_44

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_45 = 12
				local var_488_46 = utf8.len(var_488_44)
				local var_488_47 = var_488_45 <= 0 and var_488_40 or var_488_40 * (var_488_46 / var_488_45)

				if var_488_47 > 0 and var_488_40 < var_488_47 then
					arg_485_1.talkMaxDuration = var_488_47
					var_488_39 = var_488_39 + 0.3

					if var_488_47 + var_488_39 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_47 + var_488_39
					end
				end

				arg_485_1.text_.text = var_488_44
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011118", "story_v_out_123011.awb") ~= 0 then
					local var_488_48 = manager.audio:GetVoiceLength("story_v_out_123011", "123011118", "story_v_out_123011.awb") / 1000

					if var_488_48 + var_488_39 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_48 + var_488_39
					end

					if var_488_43.prefab_name ~= "" and arg_485_1.actors_[var_488_43.prefab_name] ~= nil then
						local var_488_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_43.prefab_name].transform, "story_v_out_123011", "123011118", "story_v_out_123011.awb")

						arg_485_1:RecordAudio("123011118", var_488_49)
						arg_485_1:RecordAudio("123011118", var_488_49)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_123011", "123011118", "story_v_out_123011.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_123011", "123011118", "story_v_out_123011.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_50 = var_488_39 + 0.3
			local var_488_51 = math.max(var_488_40, arg_485_1.talkMaxDuration)

			if var_488_50 <= arg_485_1.time_ and arg_485_1.time_ < var_488_50 + var_488_51 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_50) / var_488_51

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_50 + var_488_51 and arg_485_1.time_ < var_488_50 + var_488_51 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play123011119 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 123011119
		arg_491_1.duration_ = 6.133

		local var_491_0 = {
			zh = 4,
			ja = 6.133
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play123011120(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 0.5

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_2 = arg_491_1:FormatText(StoryNameCfg[6].name)

				arg_491_1.leftNameTxt_.text = var_494_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_3 = arg_491_1:GetWordFromCfg(123011119)
				local var_494_4 = arg_491_1:FormatText(var_494_3.content)

				arg_491_1.text_.text = var_494_4

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_5 = 20
				local var_494_6 = utf8.len(var_494_4)
				local var_494_7 = var_494_5 <= 0 and var_494_1 or var_494_1 * (var_494_6 / var_494_5)

				if var_494_7 > 0 and var_494_1 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_4
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011119", "story_v_out_123011.awb") ~= 0 then
					local var_494_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011119", "story_v_out_123011.awb") / 1000

					if var_494_8 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_8 + var_494_0
					end

					if var_494_3.prefab_name ~= "" and arg_491_1.actors_[var_494_3.prefab_name] ~= nil then
						local var_494_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_3.prefab_name].transform, "story_v_out_123011", "123011119", "story_v_out_123011.awb")

						arg_491_1:RecordAudio("123011119", var_494_9)
						arg_491_1:RecordAudio("123011119", var_494_9)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_123011", "123011119", "story_v_out_123011.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_123011", "123011119", "story_v_out_123011.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_10 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_10 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_10

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_10 and arg_491_1.time_ < var_494_0 + var_494_10 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play123011120 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 123011120
		arg_495_1.duration_ = 16.399999999999

		local var_495_0 = {
			zh = 11.799999999999,
			ja = 16.399999999999
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
				arg_495_0:Play123011121(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = "J12f"

			if arg_495_1.bgs_[var_498_0] == nil then
				local var_498_1 = Object.Instantiate(arg_495_1.paintGo_)

				var_498_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_498_0)
				var_498_1.name = var_498_0
				var_498_1.transform.parent = arg_495_1.stage_.transform
				var_498_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_495_1.bgs_[var_498_0] = var_498_1
			end

			local var_498_2 = 1.999999999999

			if var_498_2 < arg_495_1.time_ and arg_495_1.time_ <= var_498_2 + arg_498_0 then
				local var_498_3 = manager.ui.mainCamera.transform.localPosition
				local var_498_4 = Vector3.New(0, 0, 10) + Vector3.New(var_498_3.x, var_498_3.y, 0)
				local var_498_5 = arg_495_1.bgs_.J12f

				var_498_5.transform.localPosition = var_498_4
				var_498_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_498_6 = var_498_5:GetComponent("SpriteRenderer")

				if var_498_6 and var_498_6.sprite then
					local var_498_7 = (var_498_5.transform.localPosition - var_498_3).z
					local var_498_8 = manager.ui.mainCameraCom_
					local var_498_9 = 2 * var_498_7 * Mathf.Tan(var_498_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_498_10 = var_498_9 * var_498_8.aspect
					local var_498_11 = var_498_6.sprite.bounds.size.x
					local var_498_12 = var_498_6.sprite.bounds.size.y
					local var_498_13 = var_498_10 / var_498_11
					local var_498_14 = var_498_9 / var_498_12
					local var_498_15 = var_498_14 < var_498_13 and var_498_13 or var_498_14

					var_498_5.transform.localScale = Vector3.New(var_498_15, var_498_15, 0)
				end

				for iter_498_0, iter_498_1 in pairs(arg_495_1.bgs_) do
					if iter_498_0 ~= "J12f" then
						iter_498_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_498_16 = 0

			if var_498_16 < arg_495_1.time_ and arg_495_1.time_ <= var_498_16 + arg_498_0 then
				arg_495_1.mask_.enabled = true
				arg_495_1.mask_.raycastTarget = true

				arg_495_1:SetGaussion(false)
			end

			local var_498_17 = 2

			if var_498_16 <= arg_495_1.time_ and arg_495_1.time_ < var_498_16 + var_498_17 then
				local var_498_18 = (arg_495_1.time_ - var_498_16) / var_498_17
				local var_498_19 = Color.New(0, 0, 0)

				var_498_19.a = Mathf.Lerp(0, 1, var_498_18)
				arg_495_1.mask_.color = var_498_19
			end

			if arg_495_1.time_ >= var_498_16 + var_498_17 and arg_495_1.time_ < var_498_16 + var_498_17 + arg_498_0 then
				local var_498_20 = Color.New(0, 0, 0)

				var_498_20.a = 1
				arg_495_1.mask_.color = var_498_20
			end

			local var_498_21 = 2

			if var_498_21 < arg_495_1.time_ and arg_495_1.time_ <= var_498_21 + arg_498_0 then
				arg_495_1.mask_.enabled = true
				arg_495_1.mask_.raycastTarget = true

				arg_495_1:SetGaussion(false)
			end

			local var_498_22 = 2

			if var_498_21 <= arg_495_1.time_ and arg_495_1.time_ < var_498_21 + var_498_22 then
				local var_498_23 = (arg_495_1.time_ - var_498_21) / var_498_22
				local var_498_24 = Color.New(0, 0, 0)

				var_498_24.a = Mathf.Lerp(1, 0, var_498_23)
				arg_495_1.mask_.color = var_498_24
			end

			if arg_495_1.time_ >= var_498_21 + var_498_22 and arg_495_1.time_ < var_498_21 + var_498_22 + arg_498_0 then
				local var_498_25 = Color.New(0, 0, 0)
				local var_498_26 = 0

				arg_495_1.mask_.enabled = false
				var_498_25.a = var_498_26
				arg_495_1.mask_.color = var_498_25
			end

			local var_498_27 = arg_495_1.actors_["1029ui_story"].transform
			local var_498_28 = 2

			if var_498_28 < arg_495_1.time_ and arg_495_1.time_ <= var_498_28 + arg_498_0 then
				arg_495_1.var_.moveOldPos1029ui_story = var_498_27.localPosition
			end

			local var_498_29 = 0.001

			if var_498_28 <= arg_495_1.time_ and arg_495_1.time_ < var_498_28 + var_498_29 then
				local var_498_30 = (arg_495_1.time_ - var_498_28) / var_498_29
				local var_498_31 = Vector3.New(0, -1.09, -6.2)

				var_498_27.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos1029ui_story, var_498_31, var_498_30)

				local var_498_32 = manager.ui.mainCamera.transform.position - var_498_27.position

				var_498_27.forward = Vector3.New(var_498_32.x, var_498_32.y, var_498_32.z)

				local var_498_33 = var_498_27.localEulerAngles

				var_498_33.z = 0
				var_498_33.x = 0
				var_498_27.localEulerAngles = var_498_33
			end

			if arg_495_1.time_ >= var_498_28 + var_498_29 and arg_495_1.time_ < var_498_28 + var_498_29 + arg_498_0 then
				var_498_27.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_498_34 = manager.ui.mainCamera.transform.position - var_498_27.position

				var_498_27.forward = Vector3.New(var_498_34.x, var_498_34.y, var_498_34.z)

				local var_498_35 = var_498_27.localEulerAngles

				var_498_35.z = 0
				var_498_35.x = 0
				var_498_27.localEulerAngles = var_498_35
			end

			local var_498_36 = arg_495_1.actors_["1029ui_story"]
			local var_498_37 = 2

			if var_498_37 < arg_495_1.time_ and arg_495_1.time_ <= var_498_37 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story == nil then
				arg_495_1.var_.characterEffect1029ui_story = var_498_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_38 = 0.200000002980232

			if var_498_37 <= arg_495_1.time_ and arg_495_1.time_ < var_498_37 + var_498_38 then
				local var_498_39 = (arg_495_1.time_ - var_498_37) / var_498_38

				if arg_495_1.var_.characterEffect1029ui_story then
					arg_495_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_37 + var_498_38 and arg_495_1.time_ < var_498_37 + var_498_38 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story then
				arg_495_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_498_40 = 2

			if var_498_40 < arg_495_1.time_ and arg_495_1.time_ <= var_498_40 + arg_498_0 then
				arg_495_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_498_41 = 2

			if var_498_41 < arg_495_1.time_ and arg_495_1.time_ <= var_498_41 + arg_498_0 then
				arg_495_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_495_1.frameCnt_ <= 1 then
				arg_495_1.dialog_:SetActive(false)
			end

			local var_498_42 = 3.099999999999
			local var_498_43 = 0.9

			if var_498_42 < arg_495_1.time_ and arg_495_1.time_ <= var_498_42 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0

				arg_495_1.dialog_:SetActive(true)

				local var_498_44 = LeanTween.value(arg_495_1.dialog_, 0, 1, 0.3)

				var_498_44:setOnUpdate(LuaHelper.FloatAction(function(arg_499_0)
					arg_495_1.dialogCg_.alpha = arg_499_0
				end))
				var_498_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_495_1.dialog_)
					var_498_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_495_1.duration_ = arg_495_1.duration_ + 0.3

				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_45 = arg_495_1:FormatText(StoryNameCfg[319].name)

				arg_495_1.leftNameTxt_.text = var_498_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_46 = arg_495_1:GetWordFromCfg(123011120)
				local var_498_47 = arg_495_1:FormatText(var_498_46.content)

				arg_495_1.text_.text = var_498_47

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_48 = 36
				local var_498_49 = utf8.len(var_498_47)
				local var_498_50 = var_498_48 <= 0 and var_498_43 or var_498_43 * (var_498_49 / var_498_48)

				if var_498_50 > 0 and var_498_43 < var_498_50 then
					arg_495_1.talkMaxDuration = var_498_50
					var_498_42 = var_498_42 + 0.3

					if var_498_50 + var_498_42 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_50 + var_498_42
					end
				end

				arg_495_1.text_.text = var_498_47
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011120", "story_v_out_123011.awb") ~= 0 then
					local var_498_51 = manager.audio:GetVoiceLength("story_v_out_123011", "123011120", "story_v_out_123011.awb") / 1000

					if var_498_51 + var_498_42 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_51 + var_498_42
					end

					if var_498_46.prefab_name ~= "" and arg_495_1.actors_[var_498_46.prefab_name] ~= nil then
						local var_498_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_46.prefab_name].transform, "story_v_out_123011", "123011120", "story_v_out_123011.awb")

						arg_495_1:RecordAudio("123011120", var_498_52)
						arg_495_1:RecordAudio("123011120", var_498_52)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_123011", "123011120", "story_v_out_123011.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_123011", "123011120", "story_v_out_123011.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_53 = var_498_42 + 0.3
			local var_498_54 = math.max(var_498_43, arg_495_1.talkMaxDuration)

			if var_498_53 <= arg_495_1.time_ and arg_495_1.time_ < var_498_53 + var_498_54 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_53) / var_498_54

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_53 + var_498_54 and arg_495_1.time_ < var_498_53 + var_498_54 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play123011121 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 123011121
		arg_501_1.duration_ = 8.433

		local var_501_0 = {
			zh = 4.466,
			ja = 8.433
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
				arg_501_0:Play123011122(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.375

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[319].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(123011121)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 15
				local var_504_6 = utf8.len(var_504_4)
				local var_504_7 = var_504_5 <= 0 and var_504_1 or var_504_1 * (var_504_6 / var_504_5)

				if var_504_7 > 0 and var_504_1 < var_504_7 then
					arg_501_1.talkMaxDuration = var_504_7

					if var_504_7 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_7 + var_504_0
					end
				end

				arg_501_1.text_.text = var_504_4
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011121", "story_v_out_123011.awb") ~= 0 then
					local var_504_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011121", "story_v_out_123011.awb") / 1000

					if var_504_8 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_8 + var_504_0
					end

					if var_504_3.prefab_name ~= "" and arg_501_1.actors_[var_504_3.prefab_name] ~= nil then
						local var_504_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_3.prefab_name].transform, "story_v_out_123011", "123011121", "story_v_out_123011.awb")

						arg_501_1:RecordAudio("123011121", var_504_9)
						arg_501_1:RecordAudio("123011121", var_504_9)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_123011", "123011121", "story_v_out_123011.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_123011", "123011121", "story_v_out_123011.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_10 = math.max(var_504_1, arg_501_1.talkMaxDuration)

			if var_504_0 <= arg_501_1.time_ and arg_501_1.time_ < var_504_0 + var_504_10 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_0) / var_504_10

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_0 + var_504_10 and arg_501_1.time_ < var_504_0 + var_504_10 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play123011122 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 123011122
		arg_505_1.duration_ = 6.999999999999

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play123011123(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = "STwhite"

			if arg_505_1.bgs_[var_508_0] == nil then
				local var_508_1 = Object.Instantiate(arg_505_1.paintGo_)

				var_508_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_508_0)
				var_508_1.name = var_508_0
				var_508_1.transform.parent = arg_505_1.stage_.transform
				var_508_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_505_1.bgs_[var_508_0] = var_508_1
			end

			local var_508_2 = 0

			if var_508_2 < arg_505_1.time_ and arg_505_1.time_ <= var_508_2 + arg_508_0 then
				local var_508_3 = manager.ui.mainCamera.transform.localPosition
				local var_508_4 = Vector3.New(0, 0, 10) + Vector3.New(var_508_3.x, var_508_3.y, 0)
				local var_508_5 = arg_505_1.bgs_.STwhite

				var_508_5.transform.localPosition = var_508_4
				var_508_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_508_6 = var_508_5:GetComponent("SpriteRenderer")

				if var_508_6 and var_508_6.sprite then
					local var_508_7 = (var_508_5.transform.localPosition - var_508_3).z
					local var_508_8 = manager.ui.mainCameraCom_
					local var_508_9 = 2 * var_508_7 * Mathf.Tan(var_508_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_508_10 = var_508_9 * var_508_8.aspect
					local var_508_11 = var_508_6.sprite.bounds.size.x
					local var_508_12 = var_508_6.sprite.bounds.size.y
					local var_508_13 = var_508_10 / var_508_11
					local var_508_14 = var_508_9 / var_508_12
					local var_508_15 = var_508_14 < var_508_13 and var_508_13 or var_508_14

					var_508_5.transform.localScale = Vector3.New(var_508_15, var_508_15, 0)
				end

				for iter_508_0, iter_508_1 in pairs(arg_505_1.bgs_) do
					if iter_508_0 ~= "STwhite" then
						iter_508_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_508_16 = 0

			if var_508_16 < arg_505_1.time_ and arg_505_1.time_ <= var_508_16 + arg_508_0 then
				arg_505_1.mask_.enabled = true
				arg_505_1.mask_.raycastTarget = true

				arg_505_1:SetGaussion(false)
			end

			local var_508_17 = 2

			if var_508_16 <= arg_505_1.time_ and arg_505_1.time_ < var_508_16 + var_508_17 then
				local var_508_18 = (arg_505_1.time_ - var_508_16) / var_508_17
				local var_508_19 = Color.New(1, 1, 1)

				var_508_19.a = Mathf.Lerp(1, 0, var_508_18)
				arg_505_1.mask_.color = var_508_19
			end

			if arg_505_1.time_ >= var_508_16 + var_508_17 and arg_505_1.time_ < var_508_16 + var_508_17 + arg_508_0 then
				local var_508_20 = Color.New(1, 1, 1)
				local var_508_21 = 0

				arg_505_1.mask_.enabled = false
				var_508_20.a = var_508_21
				arg_505_1.mask_.color = var_508_20
			end

			local var_508_22 = arg_505_1.actors_["1029ui_story"].transform
			local var_508_23 = 0

			if var_508_23 < arg_505_1.time_ and arg_505_1.time_ <= var_508_23 + arg_508_0 then
				arg_505_1.var_.moveOldPos1029ui_story = var_508_22.localPosition
			end

			local var_508_24 = 0.001

			if var_508_23 <= arg_505_1.time_ and arg_505_1.time_ < var_508_23 + var_508_24 then
				local var_508_25 = (arg_505_1.time_ - var_508_23) / var_508_24
				local var_508_26 = Vector3.New(0, 100, 0)

				var_508_22.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos1029ui_story, var_508_26, var_508_25)

				local var_508_27 = manager.ui.mainCamera.transform.position - var_508_22.position

				var_508_22.forward = Vector3.New(var_508_27.x, var_508_27.y, var_508_27.z)

				local var_508_28 = var_508_22.localEulerAngles

				var_508_28.z = 0
				var_508_28.x = 0
				var_508_22.localEulerAngles = var_508_28
			end

			if arg_505_1.time_ >= var_508_23 + var_508_24 and arg_505_1.time_ < var_508_23 + var_508_24 + arg_508_0 then
				var_508_22.localPosition = Vector3.New(0, 100, 0)

				local var_508_29 = manager.ui.mainCamera.transform.position - var_508_22.position

				var_508_22.forward = Vector3.New(var_508_29.x, var_508_29.y, var_508_29.z)

				local var_508_30 = var_508_22.localEulerAngles

				var_508_30.z = 0
				var_508_30.x = 0
				var_508_22.localEulerAngles = var_508_30
			end

			local var_508_31 = arg_505_1.actors_["1029ui_story"]
			local var_508_32 = 0

			if var_508_32 < arg_505_1.time_ and arg_505_1.time_ <= var_508_32 + arg_508_0 and arg_505_1.var_.characterEffect1029ui_story == nil then
				arg_505_1.var_.characterEffect1029ui_story = var_508_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_33 = 0.200000002980232

			if var_508_32 <= arg_505_1.time_ and arg_505_1.time_ < var_508_32 + var_508_33 then
				local var_508_34 = (arg_505_1.time_ - var_508_32) / var_508_33

				if arg_505_1.var_.characterEffect1029ui_story then
					local var_508_35 = Mathf.Lerp(0, 0.5, var_508_34)

					arg_505_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_505_1.var_.characterEffect1029ui_story.fillRatio = var_508_35
				end
			end

			if arg_505_1.time_ >= var_508_32 + var_508_33 and arg_505_1.time_ < var_508_32 + var_508_33 + arg_508_0 and arg_505_1.var_.characterEffect1029ui_story then
				local var_508_36 = 0.5

				arg_505_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_505_1.var_.characterEffect1029ui_story.fillRatio = var_508_36
			end

			local var_508_37 = 0

			if var_508_37 < arg_505_1.time_ and arg_505_1.time_ <= var_508_37 + arg_508_0 then
				arg_505_1.screenFilterGo_:SetActive(false)
			end

			local var_508_38 = 0.1

			if var_508_37 <= arg_505_1.time_ and arg_505_1.time_ < var_508_37 + var_508_38 then
				local var_508_39 = (arg_505_1.time_ - var_508_37) / var_508_38

				arg_505_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_508_39)
			end

			if arg_505_1.time_ >= var_508_37 + var_508_38 and arg_505_1.time_ < var_508_37 + var_508_38 + arg_508_0 then
				arg_505_1.screenFilterEffect_.weight = 0
			end

			local var_508_40 = 2
			local var_508_41 = 1

			if var_508_40 < arg_505_1.time_ and arg_505_1.time_ <= var_508_40 + arg_508_0 then
				local var_508_42 = "play"
				local var_508_43 = "effect"

				arg_505_1:AudioAction(var_508_42, var_508_43, "se_story_123_01", "se_story_123_01_medical", "")
			end

			if arg_505_1.frameCnt_ <= 1 then
				arg_505_1.dialog_:SetActive(false)
			end

			local var_508_44 = 1.999999999999
			local var_508_45 = 1.075

			if var_508_44 < arg_505_1.time_ and arg_505_1.time_ <= var_508_44 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0

				arg_505_1.dialog_:SetActive(true)

				local var_508_46 = LeanTween.value(arg_505_1.dialog_, 0, 1, 0.3)

				var_508_46:setOnUpdate(LuaHelper.FloatAction(function(arg_509_0)
					arg_505_1.dialogCg_.alpha = arg_509_0
				end))
				var_508_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_505_1.dialog_)
					var_508_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_505_1.duration_ = arg_505_1.duration_ + 0.3

				SetActive(arg_505_1.leftNameGo_, false)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_47 = arg_505_1:GetWordFromCfg(123011122)
				local var_508_48 = arg_505_1:FormatText(var_508_47.content)

				arg_505_1.text_.text = var_508_48

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_49 = 43
				local var_508_50 = utf8.len(var_508_48)
				local var_508_51 = var_508_49 <= 0 and var_508_45 or var_508_45 * (var_508_50 / var_508_49)

				if var_508_51 > 0 and var_508_45 < var_508_51 then
					arg_505_1.talkMaxDuration = var_508_51
					var_508_44 = var_508_44 + 0.3

					if var_508_51 + var_508_44 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_51 + var_508_44
					end
				end

				arg_505_1.text_.text = var_508_48
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_52 = var_508_44 + 0.3
			local var_508_53 = math.max(var_508_45, arg_505_1.talkMaxDuration)

			if var_508_52 <= arg_505_1.time_ and arg_505_1.time_ < var_508_52 + var_508_53 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_52) / var_508_53

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_52 + var_508_53 and arg_505_1.time_ < var_508_52 + var_508_53 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play123011123 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 123011123
		arg_511_1.duration_ = 9

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play123011124(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = "I02"

			if arg_511_1.bgs_[var_514_0] == nil then
				local var_514_1 = Object.Instantiate(arg_511_1.paintGo_)

				var_514_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_514_0)
				var_514_1.name = var_514_0
				var_514_1.transform.parent = arg_511_1.stage_.transform
				var_514_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_511_1.bgs_[var_514_0] = var_514_1
			end

			local var_514_2 = 2

			if var_514_2 < arg_511_1.time_ and arg_511_1.time_ <= var_514_2 + arg_514_0 then
				local var_514_3 = manager.ui.mainCamera.transform.localPosition
				local var_514_4 = Vector3.New(0, 0, 10) + Vector3.New(var_514_3.x, var_514_3.y, 0)
				local var_514_5 = arg_511_1.bgs_.I02

				var_514_5.transform.localPosition = var_514_4
				var_514_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_514_6 = var_514_5:GetComponent("SpriteRenderer")

				if var_514_6 and var_514_6.sprite then
					local var_514_7 = (var_514_5.transform.localPosition - var_514_3).z
					local var_514_8 = manager.ui.mainCameraCom_
					local var_514_9 = 2 * var_514_7 * Mathf.Tan(var_514_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_514_10 = var_514_9 * var_514_8.aspect
					local var_514_11 = var_514_6.sprite.bounds.size.x
					local var_514_12 = var_514_6.sprite.bounds.size.y
					local var_514_13 = var_514_10 / var_514_11
					local var_514_14 = var_514_9 / var_514_12
					local var_514_15 = var_514_14 < var_514_13 and var_514_13 or var_514_14

					var_514_5.transform.localScale = Vector3.New(var_514_15, var_514_15, 0)
				end

				for iter_514_0, iter_514_1 in pairs(arg_511_1.bgs_) do
					if iter_514_0 ~= "I02" then
						iter_514_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_514_16 = 0

			if var_514_16 < arg_511_1.time_ and arg_511_1.time_ <= var_514_16 + arg_514_0 then
				arg_511_1.mask_.enabled = true
				arg_511_1.mask_.raycastTarget = true

				arg_511_1:SetGaussion(false)
			end

			local var_514_17 = 2

			if var_514_16 <= arg_511_1.time_ and arg_511_1.time_ < var_514_16 + var_514_17 then
				local var_514_18 = (arg_511_1.time_ - var_514_16) / var_514_17
				local var_514_19 = Color.New(0, 0, 0)

				var_514_19.a = Mathf.Lerp(0, 1, var_514_18)
				arg_511_1.mask_.color = var_514_19
			end

			if arg_511_1.time_ >= var_514_16 + var_514_17 and arg_511_1.time_ < var_514_16 + var_514_17 + arg_514_0 then
				local var_514_20 = Color.New(0, 0, 0)

				var_514_20.a = 1
				arg_511_1.mask_.color = var_514_20
			end

			local var_514_21 = 2

			if var_514_21 < arg_511_1.time_ and arg_511_1.time_ <= var_514_21 + arg_514_0 then
				arg_511_1.mask_.enabled = true
				arg_511_1.mask_.raycastTarget = true

				arg_511_1:SetGaussion(false)
			end

			local var_514_22 = 2

			if var_514_21 <= arg_511_1.time_ and arg_511_1.time_ < var_514_21 + var_514_22 then
				local var_514_23 = (arg_511_1.time_ - var_514_21) / var_514_22
				local var_514_24 = Color.New(0, 0, 0)

				var_514_24.a = Mathf.Lerp(1, 0, var_514_23)
				arg_511_1.mask_.color = var_514_24
			end

			if arg_511_1.time_ >= var_514_21 + var_514_22 and arg_511_1.time_ < var_514_21 + var_514_22 + arg_514_0 then
				local var_514_25 = Color.New(0, 0, 0)
				local var_514_26 = 0

				arg_511_1.mask_.enabled = false
				var_514_25.a = var_514_26
				arg_511_1.mask_.color = var_514_25
			end

			if arg_511_1.frameCnt_ <= 1 then
				arg_511_1.dialog_:SetActive(false)
			end

			local var_514_27 = 4
			local var_514_28 = 0.875

			if var_514_27 < arg_511_1.time_ and arg_511_1.time_ <= var_514_27 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0

				arg_511_1.dialog_:SetActive(true)

				local var_514_29 = LeanTween.value(arg_511_1.dialog_, 0, 1, 0.3)

				var_514_29:setOnUpdate(LuaHelper.FloatAction(function(arg_515_0)
					arg_511_1.dialogCg_.alpha = arg_515_0
				end))
				var_514_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_511_1.dialog_)
					var_514_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_511_1.duration_ = arg_511_1.duration_ + 0.3

				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_30 = arg_511_1:GetWordFromCfg(123011123)
				local var_514_31 = arg_511_1:FormatText(var_514_30.content)

				arg_511_1.text_.text = var_514_31

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_32 = 35
				local var_514_33 = utf8.len(var_514_31)
				local var_514_34 = var_514_32 <= 0 and var_514_28 or var_514_28 * (var_514_33 / var_514_32)

				if var_514_34 > 0 and var_514_28 < var_514_34 then
					arg_511_1.talkMaxDuration = var_514_34
					var_514_27 = var_514_27 + 0.3

					if var_514_34 + var_514_27 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_34 + var_514_27
					end
				end

				arg_511_1.text_.text = var_514_31
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_35 = var_514_27 + 0.3
			local var_514_36 = math.max(var_514_28, arg_511_1.talkMaxDuration)

			if var_514_35 <= arg_511_1.time_ and arg_511_1.time_ < var_514_35 + var_514_36 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_35) / var_514_36

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_35 + var_514_36 and arg_511_1.time_ < var_514_35 + var_514_36 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play123011124 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 123011124
		arg_517_1.duration_ = 5

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play123011125(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = 0
			local var_520_1 = 0.525

			if var_520_0 < arg_517_1.time_ and arg_517_1.time_ <= var_520_0 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, false)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_2 = arg_517_1:GetWordFromCfg(123011124)
				local var_520_3 = arg_517_1:FormatText(var_520_2.content)

				arg_517_1.text_.text = var_520_3

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_4 = 21
				local var_520_5 = utf8.len(var_520_3)
				local var_520_6 = var_520_4 <= 0 and var_520_1 or var_520_1 * (var_520_5 / var_520_4)

				if var_520_6 > 0 and var_520_1 < var_520_6 then
					arg_517_1.talkMaxDuration = var_520_6

					if var_520_6 + var_520_0 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_6 + var_520_0
					end
				end

				arg_517_1.text_.text = var_520_3
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)
				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_7 = math.max(var_520_1, arg_517_1.talkMaxDuration)

			if var_520_0 <= arg_517_1.time_ and arg_517_1.time_ < var_520_0 + var_520_7 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_0) / var_520_7

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_0 + var_520_7 and arg_517_1.time_ < var_520_0 + var_520_7 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play123011125 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 123011125
		arg_521_1.duration_ = 5.033

		local var_521_0 = {
			zh = 5.033,
			ja = 4.5
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
				arg_521_0:Play123011126(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = "1019ui_story"

			if arg_521_1.actors_[var_524_0] == nil then
				local var_524_1 = Object.Instantiate(Asset.Load("Char/" .. var_524_0), arg_521_1.stage_.transform)

				var_524_1.name = var_524_0
				var_524_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_521_1.actors_[var_524_0] = var_524_1

				local var_524_2 = var_524_1:GetComponentInChildren(typeof(CharacterEffect))

				var_524_2.enabled = true

				local var_524_3 = GameObjectTools.GetOrAddComponent(var_524_1, typeof(DynamicBoneHelper))

				if var_524_3 then
					var_524_3:EnableDynamicBone(false)
				end

				arg_521_1:ShowWeapon(var_524_2.transform, false)

				arg_521_1.var_[var_524_0 .. "Animator"] = var_524_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_521_1.var_[var_524_0 .. "Animator"].applyRootMotion = true
				arg_521_1.var_[var_524_0 .. "LipSync"] = var_524_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_524_4 = arg_521_1.actors_["1019ui_story"].transform
			local var_524_5 = 0

			if var_524_5 < arg_521_1.time_ and arg_521_1.time_ <= var_524_5 + arg_524_0 then
				arg_521_1.var_.moveOldPos1019ui_story = var_524_4.localPosition
			end

			local var_524_6 = 0.001

			if var_524_5 <= arg_521_1.time_ and arg_521_1.time_ < var_524_5 + var_524_6 then
				local var_524_7 = (arg_521_1.time_ - var_524_5) / var_524_6
				local var_524_8 = Vector3.New(0, -1.08, -5.9)

				var_524_4.localPosition = Vector3.Lerp(arg_521_1.var_.moveOldPos1019ui_story, var_524_8, var_524_7)

				local var_524_9 = manager.ui.mainCamera.transform.position - var_524_4.position

				var_524_4.forward = Vector3.New(var_524_9.x, var_524_9.y, var_524_9.z)

				local var_524_10 = var_524_4.localEulerAngles

				var_524_10.z = 0
				var_524_10.x = 0
				var_524_4.localEulerAngles = var_524_10
			end

			if arg_521_1.time_ >= var_524_5 + var_524_6 and arg_521_1.time_ < var_524_5 + var_524_6 + arg_524_0 then
				var_524_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_524_11 = manager.ui.mainCamera.transform.position - var_524_4.position

				var_524_4.forward = Vector3.New(var_524_11.x, var_524_11.y, var_524_11.z)

				local var_524_12 = var_524_4.localEulerAngles

				var_524_12.z = 0
				var_524_12.x = 0
				var_524_4.localEulerAngles = var_524_12
			end

			local var_524_13 = arg_521_1.actors_["1019ui_story"]
			local var_524_14 = 0

			if var_524_14 < arg_521_1.time_ and arg_521_1.time_ <= var_524_14 + arg_524_0 and arg_521_1.var_.characterEffect1019ui_story == nil then
				arg_521_1.var_.characterEffect1019ui_story = var_524_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_15 = 0.200000002980232

			if var_524_14 <= arg_521_1.time_ and arg_521_1.time_ < var_524_14 + var_524_15 then
				local var_524_16 = (arg_521_1.time_ - var_524_14) / var_524_15

				if arg_521_1.var_.characterEffect1019ui_story then
					arg_521_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_14 + var_524_15 and arg_521_1.time_ < var_524_14 + var_524_15 + arg_524_0 and arg_521_1.var_.characterEffect1019ui_story then
				arg_521_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_524_17 = 0

			if var_524_17 < arg_521_1.time_ and arg_521_1.time_ <= var_524_17 + arg_524_0 then
				arg_521_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_524_18 = 0

			if var_524_18 < arg_521_1.time_ and arg_521_1.time_ <= var_524_18 + arg_524_0 then
				arg_521_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_524_19 = 0
			local var_524_20 = 0.65

			if var_524_19 < arg_521_1.time_ and arg_521_1.time_ <= var_524_19 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_21 = arg_521_1:FormatText(StoryNameCfg[13].name)

				arg_521_1.leftNameTxt_.text = var_524_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_22 = arg_521_1:GetWordFromCfg(123011125)
				local var_524_23 = arg_521_1:FormatText(var_524_22.content)

				arg_521_1.text_.text = var_524_23

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_24 = 26
				local var_524_25 = utf8.len(var_524_23)
				local var_524_26 = var_524_24 <= 0 and var_524_20 or var_524_20 * (var_524_25 / var_524_24)

				if var_524_26 > 0 and var_524_20 < var_524_26 then
					arg_521_1.talkMaxDuration = var_524_26

					if var_524_26 + var_524_19 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_26 + var_524_19
					end
				end

				arg_521_1.text_.text = var_524_23
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011125", "story_v_out_123011.awb") ~= 0 then
					local var_524_27 = manager.audio:GetVoiceLength("story_v_out_123011", "123011125", "story_v_out_123011.awb") / 1000

					if var_524_27 + var_524_19 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_27 + var_524_19
					end

					if var_524_22.prefab_name ~= "" and arg_521_1.actors_[var_524_22.prefab_name] ~= nil then
						local var_524_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_22.prefab_name].transform, "story_v_out_123011", "123011125", "story_v_out_123011.awb")

						arg_521_1:RecordAudio("123011125", var_524_28)
						arg_521_1:RecordAudio("123011125", var_524_28)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_123011", "123011125", "story_v_out_123011.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_123011", "123011125", "story_v_out_123011.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_29 = math.max(var_524_20, arg_521_1.talkMaxDuration)

			if var_524_19 <= arg_521_1.time_ and arg_521_1.time_ < var_524_19 + var_524_29 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_19) / var_524_29

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_19 + var_524_29 and arg_521_1.time_ < var_524_19 + var_524_29 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play123011126 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 123011126
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play123011127(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["1019ui_story"]
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 and arg_525_1.var_.characterEffect1019ui_story == nil then
				arg_525_1.var_.characterEffect1019ui_story = var_528_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_528_2 = 0.200000002980232

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2

				if arg_525_1.var_.characterEffect1019ui_story then
					local var_528_4 = Mathf.Lerp(0, 0.5, var_528_3)

					arg_525_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_525_1.var_.characterEffect1019ui_story.fillRatio = var_528_4
				end
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 and arg_525_1.var_.characterEffect1019ui_story then
				local var_528_5 = 0.5

				arg_525_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_525_1.var_.characterEffect1019ui_story.fillRatio = var_528_5
			end

			local var_528_6 = 0
			local var_528_7 = 1.225

			if var_528_6 < arg_525_1.time_ and arg_525_1.time_ <= var_528_6 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_8 = arg_525_1:FormatText(StoryNameCfg[7].name)

				arg_525_1.leftNameTxt_.text = var_528_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_9 = arg_525_1:GetWordFromCfg(123011126)
				local var_528_10 = arg_525_1:FormatText(var_528_9.content)

				arg_525_1.text_.text = var_528_10

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_11 = 49
				local var_528_12 = utf8.len(var_528_10)
				local var_528_13 = var_528_11 <= 0 and var_528_7 or var_528_7 * (var_528_12 / var_528_11)

				if var_528_13 > 0 and var_528_7 < var_528_13 then
					arg_525_1.talkMaxDuration = var_528_13

					if var_528_13 + var_528_6 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_13 + var_528_6
					end
				end

				arg_525_1.text_.text = var_528_10
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_14 = math.max(var_528_7, arg_525_1.talkMaxDuration)

			if var_528_6 <= arg_525_1.time_ and arg_525_1.time_ < var_528_6 + var_528_14 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_6) / var_528_14

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_6 + var_528_14 and arg_525_1.time_ < var_528_6 + var_528_14 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play123011127 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 123011127
		arg_529_1.duration_ = 7.666

		local var_529_0 = {
			zh = 7.666,
			ja = 6.166
		}
		local var_529_1 = manager.audio:GetLocalizationFlag()

		if var_529_0[var_529_1] ~= nil then
			arg_529_1.duration_ = var_529_0[var_529_1]
		end

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play123011128(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["1019ui_story"]
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 and arg_529_1.var_.characterEffect1019ui_story == nil then
				arg_529_1.var_.characterEffect1019ui_story = var_532_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_2 = 0.200000002980232

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2

				if arg_529_1.var_.characterEffect1019ui_story then
					arg_529_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 and arg_529_1.var_.characterEffect1019ui_story then
				arg_529_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_532_4 = 0
			local var_532_5 = 0.925

			if var_532_4 < arg_529_1.time_ and arg_529_1.time_ <= var_532_4 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_6 = arg_529_1:FormatText(StoryNameCfg[13].name)

				arg_529_1.leftNameTxt_.text = var_532_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_7 = arg_529_1:GetWordFromCfg(123011127)
				local var_532_8 = arg_529_1:FormatText(var_532_7.content)

				arg_529_1.text_.text = var_532_8

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_9 = 37
				local var_532_10 = utf8.len(var_532_8)
				local var_532_11 = var_532_9 <= 0 and var_532_5 or var_532_5 * (var_532_10 / var_532_9)

				if var_532_11 > 0 and var_532_5 < var_532_11 then
					arg_529_1.talkMaxDuration = var_532_11

					if var_532_11 + var_532_4 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_11 + var_532_4
					end
				end

				arg_529_1.text_.text = var_532_8
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011127", "story_v_out_123011.awb") ~= 0 then
					local var_532_12 = manager.audio:GetVoiceLength("story_v_out_123011", "123011127", "story_v_out_123011.awb") / 1000

					if var_532_12 + var_532_4 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_12 + var_532_4
					end

					if var_532_7.prefab_name ~= "" and arg_529_1.actors_[var_532_7.prefab_name] ~= nil then
						local var_532_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_7.prefab_name].transform, "story_v_out_123011", "123011127", "story_v_out_123011.awb")

						arg_529_1:RecordAudio("123011127", var_532_13)
						arg_529_1:RecordAudio("123011127", var_532_13)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_123011", "123011127", "story_v_out_123011.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_123011", "123011127", "story_v_out_123011.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_14 = math.max(var_532_5, arg_529_1.talkMaxDuration)

			if var_532_4 <= arg_529_1.time_ and arg_529_1.time_ < var_532_4 + var_532_14 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_4) / var_532_14

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_4 + var_532_14 and arg_529_1.time_ < var_532_4 + var_532_14 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play123011128 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 123011128
		arg_533_1.duration_ = 5

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play123011129(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1019ui_story"]
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 and arg_533_1.var_.characterEffect1019ui_story == nil then
				arg_533_1.var_.characterEffect1019ui_story = var_536_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_2 = 0.200000002980232

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2

				if arg_533_1.var_.characterEffect1019ui_story then
					local var_536_4 = Mathf.Lerp(0, 0.5, var_536_3)

					arg_533_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_533_1.var_.characterEffect1019ui_story.fillRatio = var_536_4
				end
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 and arg_533_1.var_.characterEffect1019ui_story then
				local var_536_5 = 0.5

				arg_533_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_533_1.var_.characterEffect1019ui_story.fillRatio = var_536_5
			end

			local var_536_6 = 0
			local var_536_7 = 0.325

			if var_536_6 < arg_533_1.time_ and arg_533_1.time_ <= var_536_6 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_8 = arg_533_1:FormatText(StoryNameCfg[7].name)

				arg_533_1.leftNameTxt_.text = var_536_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_9 = arg_533_1:GetWordFromCfg(123011128)
				local var_536_10 = arg_533_1:FormatText(var_536_9.content)

				arg_533_1.text_.text = var_536_10

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_11 = 13
				local var_536_12 = utf8.len(var_536_10)
				local var_536_13 = var_536_11 <= 0 and var_536_7 or var_536_7 * (var_536_12 / var_536_11)

				if var_536_13 > 0 and var_536_7 < var_536_13 then
					arg_533_1.talkMaxDuration = var_536_13

					if var_536_13 + var_536_6 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_13 + var_536_6
					end
				end

				arg_533_1.text_.text = var_536_10
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_14 = math.max(var_536_7, arg_533_1.talkMaxDuration)

			if var_536_6 <= arg_533_1.time_ and arg_533_1.time_ < var_536_6 + var_536_14 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_6) / var_536_14

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_6 + var_536_14 and arg_533_1.time_ < var_536_6 + var_536_14 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play123011129 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 123011129
		arg_537_1.duration_ = 12.133

		local var_537_0 = {
			zh = 12.133,
			ja = 10
		}
		local var_537_1 = manager.audio:GetLocalizationFlag()

		if var_537_0[var_537_1] ~= nil then
			arg_537_1.duration_ = var_537_0[var_537_1]
		end

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play123011130(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1019ui_story"]
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 and arg_537_1.var_.characterEffect1019ui_story == nil then
				arg_537_1.var_.characterEffect1019ui_story = var_540_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_2 = 0.200000002980232

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2

				if arg_537_1.var_.characterEffect1019ui_story then
					arg_537_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 and arg_537_1.var_.characterEffect1019ui_story then
				arg_537_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_540_4 = 0
			local var_540_5 = 1.4

			if var_540_4 < arg_537_1.time_ and arg_537_1.time_ <= var_540_4 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_6 = arg_537_1:FormatText(StoryNameCfg[13].name)

				arg_537_1.leftNameTxt_.text = var_540_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_7 = arg_537_1:GetWordFromCfg(123011129)
				local var_540_8 = arg_537_1:FormatText(var_540_7.content)

				arg_537_1.text_.text = var_540_8

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_9 = 56
				local var_540_10 = utf8.len(var_540_8)
				local var_540_11 = var_540_9 <= 0 and var_540_5 or var_540_5 * (var_540_10 / var_540_9)

				if var_540_11 > 0 and var_540_5 < var_540_11 then
					arg_537_1.talkMaxDuration = var_540_11

					if var_540_11 + var_540_4 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_11 + var_540_4
					end
				end

				arg_537_1.text_.text = var_540_8
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011129", "story_v_out_123011.awb") ~= 0 then
					local var_540_12 = manager.audio:GetVoiceLength("story_v_out_123011", "123011129", "story_v_out_123011.awb") / 1000

					if var_540_12 + var_540_4 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_12 + var_540_4
					end

					if var_540_7.prefab_name ~= "" and arg_537_1.actors_[var_540_7.prefab_name] ~= nil then
						local var_540_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_7.prefab_name].transform, "story_v_out_123011", "123011129", "story_v_out_123011.awb")

						arg_537_1:RecordAudio("123011129", var_540_13)
						arg_537_1:RecordAudio("123011129", var_540_13)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_123011", "123011129", "story_v_out_123011.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_123011", "123011129", "story_v_out_123011.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_14 = math.max(var_540_5, arg_537_1.talkMaxDuration)

			if var_540_4 <= arg_537_1.time_ and arg_537_1.time_ < var_540_4 + var_540_14 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_4) / var_540_14

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_4 + var_540_14 and arg_537_1.time_ < var_540_4 + var_540_14 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play123011130 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 123011130
		arg_541_1.duration_ = 8.966

		local var_541_0 = {
			zh = 8.5,
			ja = 8.966
		}
		local var_541_1 = manager.audio:GetLocalizationFlag()

		if var_541_0[var_541_1] ~= nil then
			arg_541_1.duration_ = var_541_0[var_541_1]
		end

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play123011131(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 then
				arg_541_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_544_2 = 0
			local var_544_3 = 0.975

			if var_544_2 < arg_541_1.time_ and arg_541_1.time_ <= var_544_2 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_4 = arg_541_1:FormatText(StoryNameCfg[13].name)

				arg_541_1.leftNameTxt_.text = var_544_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_5 = arg_541_1:GetWordFromCfg(123011130)
				local var_544_6 = arg_541_1:FormatText(var_544_5.content)

				arg_541_1.text_.text = var_544_6

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_7 = 39
				local var_544_8 = utf8.len(var_544_6)
				local var_544_9 = var_544_7 <= 0 and var_544_3 or var_544_3 * (var_544_8 / var_544_7)

				if var_544_9 > 0 and var_544_3 < var_544_9 then
					arg_541_1.talkMaxDuration = var_544_9

					if var_544_9 + var_544_2 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_9 + var_544_2
					end
				end

				arg_541_1.text_.text = var_544_6
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011130", "story_v_out_123011.awb") ~= 0 then
					local var_544_10 = manager.audio:GetVoiceLength("story_v_out_123011", "123011130", "story_v_out_123011.awb") / 1000

					if var_544_10 + var_544_2 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_10 + var_544_2
					end

					if var_544_5.prefab_name ~= "" and arg_541_1.actors_[var_544_5.prefab_name] ~= nil then
						local var_544_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_5.prefab_name].transform, "story_v_out_123011", "123011130", "story_v_out_123011.awb")

						arg_541_1:RecordAudio("123011130", var_544_11)
						arg_541_1:RecordAudio("123011130", var_544_11)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_123011", "123011130", "story_v_out_123011.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_123011", "123011130", "story_v_out_123011.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_12 = math.max(var_544_3, arg_541_1.talkMaxDuration)

			if var_544_2 <= arg_541_1.time_ and arg_541_1.time_ < var_544_2 + var_544_12 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_2) / var_544_12

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_2 + var_544_12 and arg_541_1.time_ < var_544_2 + var_544_12 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play123011131 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 123011131
		arg_545_1.duration_ = 9.433

		local var_545_0 = {
			zh = 8.266,
			ja = 9.433
		}
		local var_545_1 = manager.audio:GetLocalizationFlag()

		if var_545_0[var_545_1] ~= nil then
			arg_545_1.duration_ = var_545_0[var_545_1]
		end

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play123011132(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0
			local var_548_1 = 1.05

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_2 = arg_545_1:FormatText(StoryNameCfg[13].name)

				arg_545_1.leftNameTxt_.text = var_548_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_3 = arg_545_1:GetWordFromCfg(123011131)
				local var_548_4 = arg_545_1:FormatText(var_548_3.content)

				arg_545_1.text_.text = var_548_4

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_5 = 42
				local var_548_6 = utf8.len(var_548_4)
				local var_548_7 = var_548_5 <= 0 and var_548_1 or var_548_1 * (var_548_6 / var_548_5)

				if var_548_7 > 0 and var_548_1 < var_548_7 then
					arg_545_1.talkMaxDuration = var_548_7

					if var_548_7 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_7 + var_548_0
					end
				end

				arg_545_1.text_.text = var_548_4
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011131", "story_v_out_123011.awb") ~= 0 then
					local var_548_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011131", "story_v_out_123011.awb") / 1000

					if var_548_8 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_8 + var_548_0
					end

					if var_548_3.prefab_name ~= "" and arg_545_1.actors_[var_548_3.prefab_name] ~= nil then
						local var_548_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_3.prefab_name].transform, "story_v_out_123011", "123011131", "story_v_out_123011.awb")

						arg_545_1:RecordAudio("123011131", var_548_9)
						arg_545_1:RecordAudio("123011131", var_548_9)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_123011", "123011131", "story_v_out_123011.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_123011", "123011131", "story_v_out_123011.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_10 = math.max(var_548_1, arg_545_1.talkMaxDuration)

			if var_548_0 <= arg_545_1.time_ and arg_545_1.time_ < var_548_0 + var_548_10 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_0) / var_548_10

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_0 + var_548_10 and arg_545_1.time_ < var_548_0 + var_548_10 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play123011132 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 123011132
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play123011133(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["1019ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect1019ui_story == nil then
				arg_549_1.var_.characterEffect1019ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.200000002980232

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect1019ui_story then
					local var_552_4 = Mathf.Lerp(0, 0.5, var_552_3)

					arg_549_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_549_1.var_.characterEffect1019ui_story.fillRatio = var_552_4
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect1019ui_story then
				local var_552_5 = 0.5

				arg_549_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_549_1.var_.characterEffect1019ui_story.fillRatio = var_552_5
			end

			local var_552_6 = 0
			local var_552_7 = 0.05

			if var_552_6 < arg_549_1.time_ and arg_549_1.time_ <= var_552_6 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_8 = arg_549_1:FormatText(StoryNameCfg[7].name)

				arg_549_1.leftNameTxt_.text = var_552_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_9 = arg_549_1:GetWordFromCfg(123011132)
				local var_552_10 = arg_549_1:FormatText(var_552_9.content)

				arg_549_1.text_.text = var_552_10

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_11 = 2
				local var_552_12 = utf8.len(var_552_10)
				local var_552_13 = var_552_11 <= 0 and var_552_7 or var_552_7 * (var_552_12 / var_552_11)

				if var_552_13 > 0 and var_552_7 < var_552_13 then
					arg_549_1.talkMaxDuration = var_552_13

					if var_552_13 + var_552_6 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_13 + var_552_6
					end
				end

				arg_549_1.text_.text = var_552_10
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_14 = math.max(var_552_7, arg_549_1.talkMaxDuration)

			if var_552_6 <= arg_549_1.time_ and arg_549_1.time_ < var_552_6 + var_552_14 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_6) / var_552_14

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_6 + var_552_14 and arg_549_1.time_ < var_552_6 + var_552_14 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play123011133 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 123011133
		arg_553_1.duration_ = 5

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play123011134(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = 0
			local var_556_1 = 1.375

			if var_556_0 < arg_553_1.time_ and arg_553_1.time_ <= var_556_0 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, false)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_2 = arg_553_1:GetWordFromCfg(123011133)
				local var_556_3 = arg_553_1:FormatText(var_556_2.content)

				arg_553_1.text_.text = var_556_3

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_4 = 55
				local var_556_5 = utf8.len(var_556_3)
				local var_556_6 = var_556_4 <= 0 and var_556_1 or var_556_1 * (var_556_5 / var_556_4)

				if var_556_6 > 0 and var_556_1 < var_556_6 then
					arg_553_1.talkMaxDuration = var_556_6

					if var_556_6 + var_556_0 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_6 + var_556_0
					end
				end

				arg_553_1.text_.text = var_556_3
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)
				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_7 = math.max(var_556_1, arg_553_1.talkMaxDuration)

			if var_556_0 <= arg_553_1.time_ and arg_553_1.time_ < var_556_0 + var_556_7 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_0) / var_556_7

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_0 + var_556_7 and arg_553_1.time_ < var_556_0 + var_556_7 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play123011134 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 123011134
		arg_557_1.duration_ = 4.566

		local var_557_0 = {
			zh = 3.8,
			ja = 4.566
		}
		local var_557_1 = manager.audio:GetLocalizationFlag()

		if var_557_0[var_557_1] ~= nil then
			arg_557_1.duration_ = var_557_0[var_557_1]
		end

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play123011135(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = arg_557_1.actors_["1019ui_story"]
			local var_560_1 = 0

			if var_560_1 < arg_557_1.time_ and arg_557_1.time_ <= var_560_1 + arg_560_0 and arg_557_1.var_.characterEffect1019ui_story == nil then
				arg_557_1.var_.characterEffect1019ui_story = var_560_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_560_2 = 0.200000002980232

			if var_560_1 <= arg_557_1.time_ and arg_557_1.time_ < var_560_1 + var_560_2 then
				local var_560_3 = (arg_557_1.time_ - var_560_1) / var_560_2

				if arg_557_1.var_.characterEffect1019ui_story then
					arg_557_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_557_1.time_ >= var_560_1 + var_560_2 and arg_557_1.time_ < var_560_1 + var_560_2 + arg_560_0 and arg_557_1.var_.characterEffect1019ui_story then
				arg_557_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_560_4 = 0

			if var_560_4 < arg_557_1.time_ and arg_557_1.time_ <= var_560_4 + arg_560_0 then
				arg_557_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_560_5 = 0

			if var_560_5 < arg_557_1.time_ and arg_557_1.time_ <= var_560_5 + arg_560_0 then
				arg_557_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_560_6 = 0
			local var_560_7 = 0.425

			if var_560_6 < arg_557_1.time_ and arg_557_1.time_ <= var_560_6 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_8 = arg_557_1:FormatText(StoryNameCfg[13].name)

				arg_557_1.leftNameTxt_.text = var_560_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_9 = arg_557_1:GetWordFromCfg(123011134)
				local var_560_10 = arg_557_1:FormatText(var_560_9.content)

				arg_557_1.text_.text = var_560_10

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_11 = 17
				local var_560_12 = utf8.len(var_560_10)
				local var_560_13 = var_560_11 <= 0 and var_560_7 or var_560_7 * (var_560_12 / var_560_11)

				if var_560_13 > 0 and var_560_7 < var_560_13 then
					arg_557_1.talkMaxDuration = var_560_13

					if var_560_13 + var_560_6 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_13 + var_560_6
					end
				end

				arg_557_1.text_.text = var_560_10
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011134", "story_v_out_123011.awb") ~= 0 then
					local var_560_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011134", "story_v_out_123011.awb") / 1000

					if var_560_14 + var_560_6 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_14 + var_560_6
					end

					if var_560_9.prefab_name ~= "" and arg_557_1.actors_[var_560_9.prefab_name] ~= nil then
						local var_560_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_557_1.actors_[var_560_9.prefab_name].transform, "story_v_out_123011", "123011134", "story_v_out_123011.awb")

						arg_557_1:RecordAudio("123011134", var_560_15)
						arg_557_1:RecordAudio("123011134", var_560_15)
					else
						arg_557_1:AudioAction("play", "voice", "story_v_out_123011", "123011134", "story_v_out_123011.awb")
					end

					arg_557_1:RecordHistoryTalkVoice("story_v_out_123011", "123011134", "story_v_out_123011.awb")
				end

				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_16 = math.max(var_560_7, arg_557_1.talkMaxDuration)

			if var_560_6 <= arg_557_1.time_ and arg_557_1.time_ < var_560_6 + var_560_16 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_6) / var_560_16

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_6 + var_560_16 and arg_557_1.time_ < var_560_6 + var_560_16 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play123011135 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 123011135
		arg_561_1.duration_ = 5

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play123011136(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["1019ui_story"]
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 and arg_561_1.var_.characterEffect1019ui_story == nil then
				arg_561_1.var_.characterEffect1019ui_story = var_564_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_2 = 0.200000002980232

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2

				if arg_561_1.var_.characterEffect1019ui_story then
					local var_564_4 = Mathf.Lerp(0, 0.5, var_564_3)

					arg_561_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_561_1.var_.characterEffect1019ui_story.fillRatio = var_564_4
				end
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 and arg_561_1.var_.characterEffect1019ui_story then
				local var_564_5 = 0.5

				arg_561_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_561_1.var_.characterEffect1019ui_story.fillRatio = var_564_5
			end

			local var_564_6 = 0
			local var_564_7 = 1.25

			if var_564_6 < arg_561_1.time_ and arg_561_1.time_ <= var_564_6 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, false)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_8 = arg_561_1:GetWordFromCfg(123011135)
				local var_564_9 = arg_561_1:FormatText(var_564_8.content)

				arg_561_1.text_.text = var_564_9

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_10 = 50
				local var_564_11 = utf8.len(var_564_9)
				local var_564_12 = var_564_10 <= 0 and var_564_7 or var_564_7 * (var_564_11 / var_564_10)

				if var_564_12 > 0 and var_564_7 < var_564_12 then
					arg_561_1.talkMaxDuration = var_564_12

					if var_564_12 + var_564_6 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_12 + var_564_6
					end
				end

				arg_561_1.text_.text = var_564_9
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)
				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_13 = math.max(var_564_7, arg_561_1.talkMaxDuration)

			if var_564_6 <= arg_561_1.time_ and arg_561_1.time_ < var_564_6 + var_564_13 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_6) / var_564_13

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_6 + var_564_13 and arg_561_1.time_ < var_564_6 + var_564_13 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play123011136 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 123011136
		arg_565_1.duration_ = 5.333

		local var_565_0 = {
			zh = 5.333,
			ja = 4.766
		}
		local var_565_1 = manager.audio:GetLocalizationFlag()

		if var_565_0[var_565_1] ~= nil then
			arg_565_1.duration_ = var_565_0[var_565_1]
		end

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play123011137(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["1019ui_story"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 and arg_565_1.var_.characterEffect1019ui_story == nil then
				arg_565_1.var_.characterEffect1019ui_story = var_568_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_2 = 0.200000002980232

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2

				if arg_565_1.var_.characterEffect1019ui_story then
					arg_565_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 and arg_565_1.var_.characterEffect1019ui_story then
				arg_565_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_568_4 = 0
			local var_568_5 = 0.55

			if var_568_4 < arg_565_1.time_ and arg_565_1.time_ <= var_568_4 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, true)

				local var_568_6 = arg_565_1:FormatText(StoryNameCfg[13].name)

				arg_565_1.leftNameTxt_.text = var_568_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_565_1.leftNameTxt_.transform)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1.leftNameTxt_.text)
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_7 = arg_565_1:GetWordFromCfg(123011136)
				local var_568_8 = arg_565_1:FormatText(var_568_7.content)

				arg_565_1.text_.text = var_568_8

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_9 = 22
				local var_568_10 = utf8.len(var_568_8)
				local var_568_11 = var_568_9 <= 0 and var_568_5 or var_568_5 * (var_568_10 / var_568_9)

				if var_568_11 > 0 and var_568_5 < var_568_11 then
					arg_565_1.talkMaxDuration = var_568_11

					if var_568_11 + var_568_4 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_11 + var_568_4
					end
				end

				arg_565_1.text_.text = var_568_8
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011136", "story_v_out_123011.awb") ~= 0 then
					local var_568_12 = manager.audio:GetVoiceLength("story_v_out_123011", "123011136", "story_v_out_123011.awb") / 1000

					if var_568_12 + var_568_4 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_12 + var_568_4
					end

					if var_568_7.prefab_name ~= "" and arg_565_1.actors_[var_568_7.prefab_name] ~= nil then
						local var_568_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_565_1.actors_[var_568_7.prefab_name].transform, "story_v_out_123011", "123011136", "story_v_out_123011.awb")

						arg_565_1:RecordAudio("123011136", var_568_13)
						arg_565_1:RecordAudio("123011136", var_568_13)
					else
						arg_565_1:AudioAction("play", "voice", "story_v_out_123011", "123011136", "story_v_out_123011.awb")
					end

					arg_565_1:RecordHistoryTalkVoice("story_v_out_123011", "123011136", "story_v_out_123011.awb")
				end

				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_14 = math.max(var_568_5, arg_565_1.talkMaxDuration)

			if var_568_4 <= arg_565_1.time_ and arg_565_1.time_ < var_568_4 + var_568_14 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_4) / var_568_14

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_4 + var_568_14 and arg_565_1.time_ < var_568_4 + var_568_14 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play123011137 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 123011137
		arg_569_1.duration_ = 15.233

		local var_569_0 = {
			zh = 14.066,
			ja = 15.233
		}
		local var_569_1 = manager.audio:GetLocalizationFlag()

		if var_569_0[var_569_1] ~= nil then
			arg_569_1.duration_ = var_569_0[var_569_1]
		end

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play123011138(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 1.375

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_2 = arg_569_1:FormatText(StoryNameCfg[13].name)

				arg_569_1.leftNameTxt_.text = var_572_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_3 = arg_569_1:GetWordFromCfg(123011137)
				local var_572_4 = arg_569_1:FormatText(var_572_3.content)

				arg_569_1.text_.text = var_572_4

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_5 = 55
				local var_572_6 = utf8.len(var_572_4)
				local var_572_7 = var_572_5 <= 0 and var_572_1 or var_572_1 * (var_572_6 / var_572_5)

				if var_572_7 > 0 and var_572_1 < var_572_7 then
					arg_569_1.talkMaxDuration = var_572_7

					if var_572_7 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_7 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_4
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011137", "story_v_out_123011.awb") ~= 0 then
					local var_572_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011137", "story_v_out_123011.awb") / 1000

					if var_572_8 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_8 + var_572_0
					end

					if var_572_3.prefab_name ~= "" and arg_569_1.actors_[var_572_3.prefab_name] ~= nil then
						local var_572_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_569_1.actors_[var_572_3.prefab_name].transform, "story_v_out_123011", "123011137", "story_v_out_123011.awb")

						arg_569_1:RecordAudio("123011137", var_572_9)
						arg_569_1:RecordAudio("123011137", var_572_9)
					else
						arg_569_1:AudioAction("play", "voice", "story_v_out_123011", "123011137", "story_v_out_123011.awb")
					end

					arg_569_1:RecordHistoryTalkVoice("story_v_out_123011", "123011137", "story_v_out_123011.awb")
				end

				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_10 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_10 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_10

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_10 and arg_569_1.time_ < var_572_0 + var_572_10 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play123011138 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 123011138
		arg_573_1.duration_ = 5

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play123011139(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = arg_573_1.actors_["1019ui_story"]
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 and arg_573_1.var_.characterEffect1019ui_story == nil then
				arg_573_1.var_.characterEffect1019ui_story = var_576_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_576_2 = 0.200000002980232

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / var_576_2

				if arg_573_1.var_.characterEffect1019ui_story then
					local var_576_4 = Mathf.Lerp(0, 0.5, var_576_3)

					arg_573_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_573_1.var_.characterEffect1019ui_story.fillRatio = var_576_4
				end
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 and arg_573_1.var_.characterEffect1019ui_story then
				local var_576_5 = 0.5

				arg_573_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_573_1.var_.characterEffect1019ui_story.fillRatio = var_576_5
			end

			local var_576_6 = 0
			local var_576_7 = 0.725

			if var_576_6 < arg_573_1.time_ and arg_573_1.time_ <= var_576_6 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, false)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_8 = arg_573_1:GetWordFromCfg(123011138)
				local var_576_9 = arg_573_1:FormatText(var_576_8.content)

				arg_573_1.text_.text = var_576_9

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_10 = 29
				local var_576_11 = utf8.len(var_576_9)
				local var_576_12 = var_576_10 <= 0 and var_576_7 or var_576_7 * (var_576_11 / var_576_10)

				if var_576_12 > 0 and var_576_7 < var_576_12 then
					arg_573_1.talkMaxDuration = var_576_12

					if var_576_12 + var_576_6 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_12 + var_576_6
					end
				end

				arg_573_1.text_.text = var_576_9
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)
				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_13 = math.max(var_576_7, arg_573_1.talkMaxDuration)

			if var_576_6 <= arg_573_1.time_ and arg_573_1.time_ < var_576_6 + var_576_13 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_6) / var_576_13

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_6 + var_576_13 and arg_573_1.time_ < var_576_6 + var_576_13 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play123011139 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 123011139
		arg_577_1.duration_ = 5

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play123011140(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 0.8

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_2 = arg_577_1:GetWordFromCfg(123011139)
				local var_580_3 = arg_577_1:FormatText(var_580_2.content)

				arg_577_1.text_.text = var_580_3

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_4 = 32
				local var_580_5 = utf8.len(var_580_3)
				local var_580_6 = var_580_4 <= 0 and var_580_1 or var_580_1 * (var_580_5 / var_580_4)

				if var_580_6 > 0 and var_580_1 < var_580_6 then
					arg_577_1.talkMaxDuration = var_580_6

					if var_580_6 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_6 + var_580_0
					end
				end

				arg_577_1.text_.text = var_580_3
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_7 = math.max(var_580_1, arg_577_1.talkMaxDuration)

			if var_580_0 <= arg_577_1.time_ and arg_577_1.time_ < var_580_0 + var_580_7 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_0) / var_580_7

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_0 + var_580_7 and arg_577_1.time_ < var_580_0 + var_580_7 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play123011140 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 123011140
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play123011141(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 0.15

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_2 = arg_581_1:FormatText(StoryNameCfg[7].name)

				arg_581_1.leftNameTxt_.text = var_584_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_3 = arg_581_1:GetWordFromCfg(123011140)
				local var_584_4 = arg_581_1:FormatText(var_584_3.content)

				arg_581_1.text_.text = var_584_4

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_5 = 6
				local var_584_6 = utf8.len(var_584_4)
				local var_584_7 = var_584_5 <= 0 and var_584_1 or var_584_1 * (var_584_6 / var_584_5)

				if var_584_7 > 0 and var_584_1 < var_584_7 then
					arg_581_1.talkMaxDuration = var_584_7

					if var_584_7 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_7 + var_584_0
					end
				end

				arg_581_1.text_.text = var_584_4
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_8 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_8 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_8

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_8 and arg_581_1.time_ < var_584_0 + var_584_8 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play123011141 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 123011141
		arg_585_1.duration_ = 4.666

		local var_585_0 = {
			zh = 4.1,
			ja = 4.666
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play123011142(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["1019ui_story"]
			local var_588_1 = 0

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 and arg_585_1.var_.characterEffect1019ui_story == nil then
				arg_585_1.var_.characterEffect1019ui_story = var_588_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_2 = 0.200000002980232

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_2 then
				local var_588_3 = (arg_585_1.time_ - var_588_1) / var_588_2

				if arg_585_1.var_.characterEffect1019ui_story then
					arg_585_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_585_1.time_ >= var_588_1 + var_588_2 and arg_585_1.time_ < var_588_1 + var_588_2 + arg_588_0 and arg_585_1.var_.characterEffect1019ui_story then
				arg_585_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_588_4 = 0

			if var_588_4 < arg_585_1.time_ and arg_585_1.time_ <= var_588_4 + arg_588_0 then
				arg_585_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_2")
			end

			local var_588_5 = 0

			if var_588_5 < arg_585_1.time_ and arg_585_1.time_ <= var_588_5 + arg_588_0 then
				arg_585_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_588_6 = 0
			local var_588_7 = 0.425

			if var_588_6 < arg_585_1.time_ and arg_585_1.time_ <= var_588_6 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_8 = arg_585_1:FormatText(StoryNameCfg[13].name)

				arg_585_1.leftNameTxt_.text = var_588_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_9 = arg_585_1:GetWordFromCfg(123011141)
				local var_588_10 = arg_585_1:FormatText(var_588_9.content)

				arg_585_1.text_.text = var_588_10

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_11 = 17
				local var_588_12 = utf8.len(var_588_10)
				local var_588_13 = var_588_11 <= 0 and var_588_7 or var_588_7 * (var_588_12 / var_588_11)

				if var_588_13 > 0 and var_588_7 < var_588_13 then
					arg_585_1.talkMaxDuration = var_588_13

					if var_588_13 + var_588_6 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_13 + var_588_6
					end
				end

				arg_585_1.text_.text = var_588_10
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011141", "story_v_out_123011.awb") ~= 0 then
					local var_588_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011141", "story_v_out_123011.awb") / 1000

					if var_588_14 + var_588_6 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_14 + var_588_6
					end

					if var_588_9.prefab_name ~= "" and arg_585_1.actors_[var_588_9.prefab_name] ~= nil then
						local var_588_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_9.prefab_name].transform, "story_v_out_123011", "123011141", "story_v_out_123011.awb")

						arg_585_1:RecordAudio("123011141", var_588_15)
						arg_585_1:RecordAudio("123011141", var_588_15)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_123011", "123011141", "story_v_out_123011.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_123011", "123011141", "story_v_out_123011.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_16 = math.max(var_588_7, arg_585_1.talkMaxDuration)

			if var_588_6 <= arg_585_1.time_ and arg_585_1.time_ < var_588_6 + var_588_16 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_6) / var_588_16

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_6 + var_588_16 and arg_585_1.time_ < var_588_6 + var_588_16 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play123011142 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 123011142
		arg_589_1.duration_ = 5

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play123011143(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = arg_589_1.actors_["1019ui_story"]
			local var_592_1 = 0

			if var_592_1 < arg_589_1.time_ and arg_589_1.time_ <= var_592_1 + arg_592_0 and arg_589_1.var_.characterEffect1019ui_story == nil then
				arg_589_1.var_.characterEffect1019ui_story = var_592_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_592_2 = 0.200000002980232

			if var_592_1 <= arg_589_1.time_ and arg_589_1.time_ < var_592_1 + var_592_2 then
				local var_592_3 = (arg_589_1.time_ - var_592_1) / var_592_2

				if arg_589_1.var_.characterEffect1019ui_story then
					local var_592_4 = Mathf.Lerp(0, 0.5, var_592_3)

					arg_589_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_589_1.var_.characterEffect1019ui_story.fillRatio = var_592_4
				end
			end

			if arg_589_1.time_ >= var_592_1 + var_592_2 and arg_589_1.time_ < var_592_1 + var_592_2 + arg_592_0 and arg_589_1.var_.characterEffect1019ui_story then
				local var_592_5 = 0.5

				arg_589_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_589_1.var_.characterEffect1019ui_story.fillRatio = var_592_5
			end

			local var_592_6 = 0
			local var_592_7 = 0.1

			if var_592_6 < arg_589_1.time_ and arg_589_1.time_ <= var_592_6 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, true)

				local var_592_8 = arg_589_1:FormatText(StoryNameCfg[7].name)

				arg_589_1.leftNameTxt_.text = var_592_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_589_1.leftNameTxt_.transform)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1.leftNameTxt_.text)
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_9 = arg_589_1:GetWordFromCfg(123011142)
				local var_592_10 = arg_589_1:FormatText(var_592_9.content)

				arg_589_1.text_.text = var_592_10

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_11 = 4
				local var_592_12 = utf8.len(var_592_10)
				local var_592_13 = var_592_11 <= 0 and var_592_7 or var_592_7 * (var_592_12 / var_592_11)

				if var_592_13 > 0 and var_592_7 < var_592_13 then
					arg_589_1.talkMaxDuration = var_592_13

					if var_592_13 + var_592_6 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_13 + var_592_6
					end
				end

				arg_589_1.text_.text = var_592_10
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_14 = math.max(var_592_7, arg_589_1.talkMaxDuration)

			if var_592_6 <= arg_589_1.time_ and arg_589_1.time_ < var_592_6 + var_592_14 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_6) / var_592_14

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_6 + var_592_14 and arg_589_1.time_ < var_592_6 + var_592_14 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play123011143 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 123011143
		arg_593_1.duration_ = 5

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play123011144(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = arg_593_1.actors_["1019ui_story"].transform
			local var_596_1 = 0

			if var_596_1 < arg_593_1.time_ and arg_593_1.time_ <= var_596_1 + arg_596_0 then
				arg_593_1.var_.moveOldPos1019ui_story = var_596_0.localPosition
			end

			local var_596_2 = 0.001

			if var_596_1 <= arg_593_1.time_ and arg_593_1.time_ < var_596_1 + var_596_2 then
				local var_596_3 = (arg_593_1.time_ - var_596_1) / var_596_2
				local var_596_4 = Vector3.New(0, 100, 0)

				var_596_0.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPos1019ui_story, var_596_4, var_596_3)

				local var_596_5 = manager.ui.mainCamera.transform.position - var_596_0.position

				var_596_0.forward = Vector3.New(var_596_5.x, var_596_5.y, var_596_5.z)

				local var_596_6 = var_596_0.localEulerAngles

				var_596_6.z = 0
				var_596_6.x = 0
				var_596_0.localEulerAngles = var_596_6
			end

			if arg_593_1.time_ >= var_596_1 + var_596_2 and arg_593_1.time_ < var_596_1 + var_596_2 + arg_596_0 then
				var_596_0.localPosition = Vector3.New(0, 100, 0)

				local var_596_7 = manager.ui.mainCamera.transform.position - var_596_0.position

				var_596_0.forward = Vector3.New(var_596_7.x, var_596_7.y, var_596_7.z)

				local var_596_8 = var_596_0.localEulerAngles

				var_596_8.z = 0
				var_596_8.x = 0
				var_596_0.localEulerAngles = var_596_8
			end

			local var_596_9 = arg_593_1.actors_["1019ui_story"]
			local var_596_10 = 0

			if var_596_10 < arg_593_1.time_ and arg_593_1.time_ <= var_596_10 + arg_596_0 and arg_593_1.var_.characterEffect1019ui_story == nil then
				arg_593_1.var_.characterEffect1019ui_story = var_596_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_596_11 = 0.200000002980232

			if var_596_10 <= arg_593_1.time_ and arg_593_1.time_ < var_596_10 + var_596_11 then
				local var_596_12 = (arg_593_1.time_ - var_596_10) / var_596_11

				if arg_593_1.var_.characterEffect1019ui_story then
					local var_596_13 = Mathf.Lerp(0, 0.5, var_596_12)

					arg_593_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_593_1.var_.characterEffect1019ui_story.fillRatio = var_596_13
				end
			end

			if arg_593_1.time_ >= var_596_10 + var_596_11 and arg_593_1.time_ < var_596_10 + var_596_11 + arg_596_0 and arg_593_1.var_.characterEffect1019ui_story then
				local var_596_14 = 0.5

				arg_593_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_593_1.var_.characterEffect1019ui_story.fillRatio = var_596_14
			end

			local var_596_15 = 0
			local var_596_16 = 0.475

			if var_596_15 < arg_593_1.time_ and arg_593_1.time_ <= var_596_15 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_17 = arg_593_1:GetWordFromCfg(123011143)
				local var_596_18 = arg_593_1:FormatText(var_596_17.content)

				arg_593_1.text_.text = var_596_18

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_19 = 19
				local var_596_20 = utf8.len(var_596_18)
				local var_596_21 = var_596_19 <= 0 and var_596_16 or var_596_16 * (var_596_20 / var_596_19)

				if var_596_21 > 0 and var_596_16 < var_596_21 then
					arg_593_1.talkMaxDuration = var_596_21

					if var_596_21 + var_596_15 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_21 + var_596_15
					end
				end

				arg_593_1.text_.text = var_596_18
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_22 = math.max(var_596_16, arg_593_1.talkMaxDuration)

			if var_596_15 <= arg_593_1.time_ and arg_593_1.time_ < var_596_15 + var_596_22 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_15) / var_596_22

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_15 + var_596_22 and arg_593_1.time_ < var_596_15 + var_596_22 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play123011144 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 123011144
		arg_597_1.duration_ = 0.499999999999

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"

			SetActive(arg_597_1.choicesGo_, true)

			for iter_598_0, iter_598_1 in ipairs(arg_597_1.choices_) do
				local var_598_0 = iter_598_0 <= 2

				SetActive(iter_598_1.go, var_598_0)
			end

			arg_597_1.choices_[1].txt.text = arg_597_1:FormatText(StoryChoiceCfg[495].name)
			arg_597_1.choices_[2].txt.text = arg_597_1:FormatText(StoryChoiceCfg[496].name)
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play123011145(arg_597_1)
			end

			if arg_599_0 == 2 then
				arg_597_0:Play123011149(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = 0

			if var_600_0 < arg_597_1.time_ and arg_597_1.time_ <= var_600_0 + arg_600_0 then
				arg_597_1.allBtn_.enabled = false
			end

			local var_600_1 = 0.5

			if arg_597_1.time_ >= var_600_0 + var_600_1 and arg_597_1.time_ < var_600_0 + var_600_1 + arg_600_0 then
				arg_597_1.allBtn_.enabled = true
			end
		end
	end,
	Play123011145 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 123011145
		arg_601_1.duration_ = 4.533

		local var_601_0 = {
			zh = 3.333,
			ja = 4.533
		}
		local var_601_1 = manager.audio:GetLocalizationFlag()

		if var_601_0[var_601_1] ~= nil then
			arg_601_1.duration_ = var_601_0[var_601_1]
		end

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play123011146(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = arg_601_1.actors_["1019ui_story"].transform
			local var_604_1 = 0

			if var_604_1 < arg_601_1.time_ and arg_601_1.time_ <= var_604_1 + arg_604_0 then
				arg_601_1.var_.moveOldPos1019ui_story = var_604_0.localPosition
			end

			local var_604_2 = 0.001

			if var_604_1 <= arg_601_1.time_ and arg_601_1.time_ < var_604_1 + var_604_2 then
				local var_604_3 = (arg_601_1.time_ - var_604_1) / var_604_2
				local var_604_4 = Vector3.New(0, -1.08, -5.9)

				var_604_0.localPosition = Vector3.Lerp(arg_601_1.var_.moveOldPos1019ui_story, var_604_4, var_604_3)

				local var_604_5 = manager.ui.mainCamera.transform.position - var_604_0.position

				var_604_0.forward = Vector3.New(var_604_5.x, var_604_5.y, var_604_5.z)

				local var_604_6 = var_604_0.localEulerAngles

				var_604_6.z = 0
				var_604_6.x = 0
				var_604_0.localEulerAngles = var_604_6
			end

			if arg_601_1.time_ >= var_604_1 + var_604_2 and arg_601_1.time_ < var_604_1 + var_604_2 + arg_604_0 then
				var_604_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_604_7 = manager.ui.mainCamera.transform.position - var_604_0.position

				var_604_0.forward = Vector3.New(var_604_7.x, var_604_7.y, var_604_7.z)

				local var_604_8 = var_604_0.localEulerAngles

				var_604_8.z = 0
				var_604_8.x = 0
				var_604_0.localEulerAngles = var_604_8
			end

			local var_604_9 = arg_601_1.actors_["1019ui_story"]
			local var_604_10 = 0

			if var_604_10 < arg_601_1.time_ and arg_601_1.time_ <= var_604_10 + arg_604_0 and arg_601_1.var_.characterEffect1019ui_story == nil then
				arg_601_1.var_.characterEffect1019ui_story = var_604_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_604_11 = 0.200000002980232

			if var_604_10 <= arg_601_1.time_ and arg_601_1.time_ < var_604_10 + var_604_11 then
				local var_604_12 = (arg_601_1.time_ - var_604_10) / var_604_11

				if arg_601_1.var_.characterEffect1019ui_story then
					arg_601_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_601_1.time_ >= var_604_10 + var_604_11 and arg_601_1.time_ < var_604_10 + var_604_11 + arg_604_0 and arg_601_1.var_.characterEffect1019ui_story then
				arg_601_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_604_13 = 0

			if var_604_13 < arg_601_1.time_ and arg_601_1.time_ <= var_604_13 + arg_604_0 then
				arg_601_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_604_14 = 0

			if var_604_14 < arg_601_1.time_ and arg_601_1.time_ <= var_604_14 + arg_604_0 then
				arg_601_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_604_15 = 0
			local var_604_16 = 0.45

			if var_604_15 < arg_601_1.time_ and arg_601_1.time_ <= var_604_15 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0
				arg_601_1.dialogCg_.alpha = 1

				arg_601_1.dialog_:SetActive(true)
				SetActive(arg_601_1.leftNameGo_, true)

				local var_604_17 = arg_601_1:FormatText(StoryNameCfg[13].name)

				arg_601_1.leftNameTxt_.text = var_604_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_601_1.leftNameTxt_.transform)

				arg_601_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_601_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_601_1:RecordName(arg_601_1.leftNameTxt_.text)
				SetActive(arg_601_1.iconTrs_.gameObject, false)
				arg_601_1.callingController_:SetSelectedState("normal")

				local var_604_18 = arg_601_1:GetWordFromCfg(123011145)
				local var_604_19 = arg_601_1:FormatText(var_604_18.content)

				arg_601_1.text_.text = var_604_19

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.text_)

				local var_604_20 = 18
				local var_604_21 = utf8.len(var_604_19)
				local var_604_22 = var_604_20 <= 0 and var_604_16 or var_604_16 * (var_604_21 / var_604_20)

				if var_604_22 > 0 and var_604_16 < var_604_22 then
					arg_601_1.talkMaxDuration = var_604_22

					if var_604_22 + var_604_15 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_22 + var_604_15
					end
				end

				arg_601_1.text_.text = var_604_19
				arg_601_1.typewritter.percent = 0

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011145", "story_v_out_123011.awb") ~= 0 then
					local var_604_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011145", "story_v_out_123011.awb") / 1000

					if var_604_23 + var_604_15 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_23 + var_604_15
					end

					if var_604_18.prefab_name ~= "" and arg_601_1.actors_[var_604_18.prefab_name] ~= nil then
						local var_604_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_601_1.actors_[var_604_18.prefab_name].transform, "story_v_out_123011", "123011145", "story_v_out_123011.awb")

						arg_601_1:RecordAudio("123011145", var_604_24)
						arg_601_1:RecordAudio("123011145", var_604_24)
					else
						arg_601_1:AudioAction("play", "voice", "story_v_out_123011", "123011145", "story_v_out_123011.awb")
					end

					arg_601_1:RecordHistoryTalkVoice("story_v_out_123011", "123011145", "story_v_out_123011.awb")
				end

				arg_601_1:RecordContent(arg_601_1.text_.text)
			end

			local var_604_25 = math.max(var_604_16, arg_601_1.talkMaxDuration)

			if var_604_15 <= arg_601_1.time_ and arg_601_1.time_ < var_604_15 + var_604_25 then
				arg_601_1.typewritter.percent = (arg_601_1.time_ - var_604_15) / var_604_25

				arg_601_1.typewritter:SetDirty()
			end

			if arg_601_1.time_ >= var_604_15 + var_604_25 and arg_601_1.time_ < var_604_15 + var_604_25 + arg_604_0 then
				arg_601_1.typewritter.percent = 1

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(true)
			end
		end
	end,
	Play123011146 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 123011146
		arg_605_1.duration_ = 7.6

		local var_605_0 = {
			zh = 5.766,
			ja = 7.6
		}
		local var_605_1 = manager.audio:GetLocalizationFlag()

		if var_605_0[var_605_1] ~= nil then
			arg_605_1.duration_ = var_605_0[var_605_1]
		end

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play123011147(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = 0
			local var_608_1 = 0.625

			if var_608_0 < arg_605_1.time_ and arg_605_1.time_ <= var_608_0 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0
				arg_605_1.dialogCg_.alpha = 1

				arg_605_1.dialog_:SetActive(true)
				SetActive(arg_605_1.leftNameGo_, true)

				local var_608_2 = arg_605_1:FormatText(StoryNameCfg[13].name)

				arg_605_1.leftNameTxt_.text = var_608_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_605_1.leftNameTxt_.transform)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1.leftNameTxt_.text)
				SetActive(arg_605_1.iconTrs_.gameObject, false)
				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_3 = arg_605_1:GetWordFromCfg(123011146)
				local var_608_4 = arg_605_1:FormatText(var_608_3.content)

				arg_605_1.text_.text = var_608_4

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_5 = 25
				local var_608_6 = utf8.len(var_608_4)
				local var_608_7 = var_608_5 <= 0 and var_608_1 or var_608_1 * (var_608_6 / var_608_5)

				if var_608_7 > 0 and var_608_1 < var_608_7 then
					arg_605_1.talkMaxDuration = var_608_7

					if var_608_7 + var_608_0 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_7 + var_608_0
					end
				end

				arg_605_1.text_.text = var_608_4
				arg_605_1.typewritter.percent = 0

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011146", "story_v_out_123011.awb") ~= 0 then
					local var_608_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011146", "story_v_out_123011.awb") / 1000

					if var_608_8 + var_608_0 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_8 + var_608_0
					end

					if var_608_3.prefab_name ~= "" and arg_605_1.actors_[var_608_3.prefab_name] ~= nil then
						local var_608_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_605_1.actors_[var_608_3.prefab_name].transform, "story_v_out_123011", "123011146", "story_v_out_123011.awb")

						arg_605_1:RecordAudio("123011146", var_608_9)
						arg_605_1:RecordAudio("123011146", var_608_9)
					else
						arg_605_1:AudioAction("play", "voice", "story_v_out_123011", "123011146", "story_v_out_123011.awb")
					end

					arg_605_1:RecordHistoryTalkVoice("story_v_out_123011", "123011146", "story_v_out_123011.awb")
				end

				arg_605_1:RecordContent(arg_605_1.text_.text)
			end

			local var_608_10 = math.max(var_608_1, arg_605_1.talkMaxDuration)

			if var_608_0 <= arg_605_1.time_ and arg_605_1.time_ < var_608_0 + var_608_10 then
				arg_605_1.typewritter.percent = (arg_605_1.time_ - var_608_0) / var_608_10

				arg_605_1.typewritter:SetDirty()
			end

			if arg_605_1.time_ >= var_608_0 + var_608_10 and arg_605_1.time_ < var_608_0 + var_608_10 + arg_608_0 then
				arg_605_1.typewritter.percent = 1

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(true)
			end
		end
	end,
	Play123011147 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 123011147
		arg_609_1.duration_ = 5

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play123011148(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = arg_609_1.actors_["1019ui_story"]
			local var_612_1 = 0

			if var_612_1 < arg_609_1.time_ and arg_609_1.time_ <= var_612_1 + arg_612_0 and arg_609_1.var_.characterEffect1019ui_story == nil then
				arg_609_1.var_.characterEffect1019ui_story = var_612_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_612_2 = 0.200000002980232

			if var_612_1 <= arg_609_1.time_ and arg_609_1.time_ < var_612_1 + var_612_2 then
				local var_612_3 = (arg_609_1.time_ - var_612_1) / var_612_2

				if arg_609_1.var_.characterEffect1019ui_story then
					local var_612_4 = Mathf.Lerp(0, 0.5, var_612_3)

					arg_609_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_609_1.var_.characterEffect1019ui_story.fillRatio = var_612_4
				end
			end

			if arg_609_1.time_ >= var_612_1 + var_612_2 and arg_609_1.time_ < var_612_1 + var_612_2 + arg_612_0 and arg_609_1.var_.characterEffect1019ui_story then
				local var_612_5 = 0.5

				arg_609_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_609_1.var_.characterEffect1019ui_story.fillRatio = var_612_5
			end

			local var_612_6 = 0
			local var_612_7 = 0.55

			if var_612_6 < arg_609_1.time_ and arg_609_1.time_ <= var_612_6 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_8 = arg_609_1:FormatText(StoryNameCfg[7].name)

				arg_609_1.leftNameTxt_.text = var_612_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_9 = arg_609_1:GetWordFromCfg(123011147)
				local var_612_10 = arg_609_1:FormatText(var_612_9.content)

				arg_609_1.text_.text = var_612_10

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_11 = 22
				local var_612_12 = utf8.len(var_612_10)
				local var_612_13 = var_612_11 <= 0 and var_612_7 or var_612_7 * (var_612_12 / var_612_11)

				if var_612_13 > 0 and var_612_7 < var_612_13 then
					arg_609_1.talkMaxDuration = var_612_13

					if var_612_13 + var_612_6 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_13 + var_612_6
					end
				end

				arg_609_1.text_.text = var_612_10
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)
				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_14 = math.max(var_612_7, arg_609_1.talkMaxDuration)

			if var_612_6 <= arg_609_1.time_ and arg_609_1.time_ < var_612_6 + var_612_14 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_6) / var_612_14

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_6 + var_612_14 and arg_609_1.time_ < var_612_6 + var_612_14 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play123011148 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 123011148
		arg_613_1.duration_ = 5

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play123011149(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = 0
			local var_616_1 = 0.15

			if var_616_0 < arg_613_1.time_ and arg_613_1.time_ <= var_616_0 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, true)

				local var_616_2 = arg_613_1:FormatText(StoryNameCfg[7].name)

				arg_613_1.leftNameTxt_.text = var_616_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_613_1.leftNameTxt_.transform)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1.leftNameTxt_.text)
				SetActive(arg_613_1.iconTrs_.gameObject, false)
				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_3 = arg_613_1:GetWordFromCfg(123011148)
				local var_616_4 = arg_613_1:FormatText(var_616_3.content)

				arg_613_1.text_.text = var_616_4

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_5 = 6
				local var_616_6 = utf8.len(var_616_4)
				local var_616_7 = var_616_5 <= 0 and var_616_1 or var_616_1 * (var_616_6 / var_616_5)

				if var_616_7 > 0 and var_616_1 < var_616_7 then
					arg_613_1.talkMaxDuration = var_616_7

					if var_616_7 + var_616_0 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_7 + var_616_0
					end
				end

				arg_613_1.text_.text = var_616_4
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)
				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_8 = math.max(var_616_1, arg_613_1.talkMaxDuration)

			if var_616_0 <= arg_613_1.time_ and arg_613_1.time_ < var_616_0 + var_616_8 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_0) / var_616_8

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_0 + var_616_8 and arg_613_1.time_ < var_616_0 + var_616_8 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play123011149 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 123011149
		arg_617_1.duration_ = 7.033

		local var_617_0 = {
			zh = 5.7,
			ja = 7.033
		}
		local var_617_1 = manager.audio:GetLocalizationFlag()

		if var_617_0[var_617_1] ~= nil then
			arg_617_1.duration_ = var_617_0[var_617_1]
		end

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play123011150(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = arg_617_1.actors_["1019ui_story"]
			local var_620_1 = 0

			if var_620_1 < arg_617_1.time_ and arg_617_1.time_ <= var_620_1 + arg_620_0 and arg_617_1.var_.characterEffect1019ui_story == nil then
				arg_617_1.var_.characterEffect1019ui_story = var_620_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_620_2 = 0.200000002980232

			if var_620_1 <= arg_617_1.time_ and arg_617_1.time_ < var_620_1 + var_620_2 then
				local var_620_3 = (arg_617_1.time_ - var_620_1) / var_620_2

				if arg_617_1.var_.characterEffect1019ui_story then
					arg_617_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_617_1.time_ >= var_620_1 + var_620_2 and arg_617_1.time_ < var_620_1 + var_620_2 + arg_620_0 and arg_617_1.var_.characterEffect1019ui_story then
				arg_617_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_620_4 = 0

			if var_620_4 < arg_617_1.time_ and arg_617_1.time_ <= var_620_4 + arg_620_0 then
				arg_617_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_620_5 = 0

			if var_620_5 < arg_617_1.time_ and arg_617_1.time_ <= var_620_5 + arg_620_0 then
				arg_617_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_620_6 = arg_617_1.actors_["1019ui_story"].transform
			local var_620_7 = 0

			if var_620_7 < arg_617_1.time_ and arg_617_1.time_ <= var_620_7 + arg_620_0 then
				arg_617_1.var_.moveOldPos1019ui_story = var_620_6.localPosition
			end

			local var_620_8 = 0.001

			if var_620_7 <= arg_617_1.time_ and arg_617_1.time_ < var_620_7 + var_620_8 then
				local var_620_9 = (arg_617_1.time_ - var_620_7) / var_620_8
				local var_620_10 = Vector3.New(0, -1.08, -5.9)

				var_620_6.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1019ui_story, var_620_10, var_620_9)

				local var_620_11 = manager.ui.mainCamera.transform.position - var_620_6.position

				var_620_6.forward = Vector3.New(var_620_11.x, var_620_11.y, var_620_11.z)

				local var_620_12 = var_620_6.localEulerAngles

				var_620_12.z = 0
				var_620_12.x = 0
				var_620_6.localEulerAngles = var_620_12
			end

			if arg_617_1.time_ >= var_620_7 + var_620_8 and arg_617_1.time_ < var_620_7 + var_620_8 + arg_620_0 then
				var_620_6.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_620_13 = manager.ui.mainCamera.transform.position - var_620_6.position

				var_620_6.forward = Vector3.New(var_620_13.x, var_620_13.y, var_620_13.z)

				local var_620_14 = var_620_6.localEulerAngles

				var_620_14.z = 0
				var_620_14.x = 0
				var_620_6.localEulerAngles = var_620_14
			end

			local var_620_15 = 0
			local var_620_16 = 0.775

			if var_620_15 < arg_617_1.time_ and arg_617_1.time_ <= var_620_15 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_17 = arg_617_1:FormatText(StoryNameCfg[13].name)

				arg_617_1.leftNameTxt_.text = var_620_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_18 = arg_617_1:GetWordFromCfg(123011149)
				local var_620_19 = arg_617_1:FormatText(var_620_18.content)

				arg_617_1.text_.text = var_620_19

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_20 = 31
				local var_620_21 = utf8.len(var_620_19)
				local var_620_22 = var_620_20 <= 0 and var_620_16 or var_620_16 * (var_620_21 / var_620_20)

				if var_620_22 > 0 and var_620_16 < var_620_22 then
					arg_617_1.talkMaxDuration = var_620_22

					if var_620_22 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_22 + var_620_15
					end
				end

				arg_617_1.text_.text = var_620_19
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011149", "story_v_out_123011.awb") ~= 0 then
					local var_620_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011149", "story_v_out_123011.awb") / 1000

					if var_620_23 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_23 + var_620_15
					end

					if var_620_18.prefab_name ~= "" and arg_617_1.actors_[var_620_18.prefab_name] ~= nil then
						local var_620_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_18.prefab_name].transform, "story_v_out_123011", "123011149", "story_v_out_123011.awb")

						arg_617_1:RecordAudio("123011149", var_620_24)
						arg_617_1:RecordAudio("123011149", var_620_24)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_out_123011", "123011149", "story_v_out_123011.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_out_123011", "123011149", "story_v_out_123011.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_25 = math.max(var_620_16, arg_617_1.talkMaxDuration)

			if var_620_15 <= arg_617_1.time_ and arg_617_1.time_ < var_620_15 + var_620_25 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_15) / var_620_25

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_15 + var_620_25 and arg_617_1.time_ < var_620_15 + var_620_25 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play123011150 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 123011150
		arg_621_1.duration_ = 5

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play123011151(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = arg_621_1.actors_["1019ui_story"]
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 and arg_621_1.var_.characterEffect1019ui_story == nil then
				arg_621_1.var_.characterEffect1019ui_story = var_624_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_2 = 0.200000002980232

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / var_624_2

				if arg_621_1.var_.characterEffect1019ui_story then
					local var_624_4 = Mathf.Lerp(0, 0.5, var_624_3)

					arg_621_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_621_1.var_.characterEffect1019ui_story.fillRatio = var_624_4
				end
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 and arg_621_1.var_.characterEffect1019ui_story then
				local var_624_5 = 0.5

				arg_621_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_621_1.var_.characterEffect1019ui_story.fillRatio = var_624_5
			end

			local var_624_6 = 0
			local var_624_7 = 0.15

			if var_624_6 < arg_621_1.time_ and arg_621_1.time_ <= var_624_6 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_8 = arg_621_1:FormatText(StoryNameCfg[7].name)

				arg_621_1.leftNameTxt_.text = var_624_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_9 = arg_621_1:GetWordFromCfg(123011150)
				local var_624_10 = arg_621_1:FormatText(var_624_9.content)

				arg_621_1.text_.text = var_624_10

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_11 = 6
				local var_624_12 = utf8.len(var_624_10)
				local var_624_13 = var_624_11 <= 0 and var_624_7 or var_624_7 * (var_624_12 / var_624_11)

				if var_624_13 > 0 and var_624_7 < var_624_13 then
					arg_621_1.talkMaxDuration = var_624_13

					if var_624_13 + var_624_6 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_13 + var_624_6
					end
				end

				arg_621_1.text_.text = var_624_10
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)
				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_14 = math.max(var_624_7, arg_621_1.talkMaxDuration)

			if var_624_6 <= arg_621_1.time_ and arg_621_1.time_ < var_624_6 + var_624_14 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_6) / var_624_14

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_6 + var_624_14 and arg_621_1.time_ < var_624_6 + var_624_14 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play123011151 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 123011151
		arg_625_1.duration_ = 9.233

		local var_625_0 = {
			zh = 4.166,
			ja = 9.233
		}
		local var_625_1 = manager.audio:GetLocalizationFlag()

		if var_625_0[var_625_1] ~= nil then
			arg_625_1.duration_ = var_625_0[var_625_1]
		end

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play123011152(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = arg_625_1.actors_["1019ui_story"]
			local var_628_1 = 0

			if var_628_1 < arg_625_1.time_ and arg_625_1.time_ <= var_628_1 + arg_628_0 and arg_625_1.var_.characterEffect1019ui_story == nil then
				arg_625_1.var_.characterEffect1019ui_story = var_628_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_628_2 = 0.200000002980232

			if var_628_1 <= arg_625_1.time_ and arg_625_1.time_ < var_628_1 + var_628_2 then
				local var_628_3 = (arg_625_1.time_ - var_628_1) / var_628_2

				if arg_625_1.var_.characterEffect1019ui_story then
					arg_625_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_625_1.time_ >= var_628_1 + var_628_2 and arg_625_1.time_ < var_628_1 + var_628_2 + arg_628_0 and arg_625_1.var_.characterEffect1019ui_story then
				arg_625_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_628_4 = 0

			if var_628_4 < arg_625_1.time_ and arg_625_1.time_ <= var_628_4 + arg_628_0 then
				arg_625_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action425")
			end

			local var_628_5 = 0

			if var_628_5 < arg_625_1.time_ and arg_625_1.time_ <= var_628_5 + arg_628_0 then
				arg_625_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_628_6 = 0
			local var_628_7 = 0.525

			if var_628_6 < arg_625_1.time_ and arg_625_1.time_ <= var_628_6 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, true)

				local var_628_8 = arg_625_1:FormatText(StoryNameCfg[13].name)

				arg_625_1.leftNameTxt_.text = var_628_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_625_1.leftNameTxt_.transform)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1.leftNameTxt_.text)
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_9 = arg_625_1:GetWordFromCfg(123011151)
				local var_628_10 = arg_625_1:FormatText(var_628_9.content)

				arg_625_1.text_.text = var_628_10

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_11 = 21
				local var_628_12 = utf8.len(var_628_10)
				local var_628_13 = var_628_11 <= 0 and var_628_7 or var_628_7 * (var_628_12 / var_628_11)

				if var_628_13 > 0 and var_628_7 < var_628_13 then
					arg_625_1.talkMaxDuration = var_628_13

					if var_628_13 + var_628_6 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_13 + var_628_6
					end
				end

				arg_625_1.text_.text = var_628_10
				arg_625_1.typewritter.percent = 0

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011151", "story_v_out_123011.awb") ~= 0 then
					local var_628_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011151", "story_v_out_123011.awb") / 1000

					if var_628_14 + var_628_6 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_14 + var_628_6
					end

					if var_628_9.prefab_name ~= "" and arg_625_1.actors_[var_628_9.prefab_name] ~= nil then
						local var_628_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_625_1.actors_[var_628_9.prefab_name].transform, "story_v_out_123011", "123011151", "story_v_out_123011.awb")

						arg_625_1:RecordAudio("123011151", var_628_15)
						arg_625_1:RecordAudio("123011151", var_628_15)
					else
						arg_625_1:AudioAction("play", "voice", "story_v_out_123011", "123011151", "story_v_out_123011.awb")
					end

					arg_625_1:RecordHistoryTalkVoice("story_v_out_123011", "123011151", "story_v_out_123011.awb")
				end

				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_16 = math.max(var_628_7, arg_625_1.talkMaxDuration)

			if var_628_6 <= arg_625_1.time_ and arg_625_1.time_ < var_628_6 + var_628_16 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_6) / var_628_16

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_6 + var_628_16 and arg_625_1.time_ < var_628_6 + var_628_16 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play123011152 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 123011152
		arg_629_1.duration_ = 5

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play123011153(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = arg_629_1.actors_["1019ui_story"]
			local var_632_1 = 0

			if var_632_1 < arg_629_1.time_ and arg_629_1.time_ <= var_632_1 + arg_632_0 and arg_629_1.var_.characterEffect1019ui_story == nil then
				arg_629_1.var_.characterEffect1019ui_story = var_632_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_632_2 = 0.200000002980232

			if var_632_1 <= arg_629_1.time_ and arg_629_1.time_ < var_632_1 + var_632_2 then
				local var_632_3 = (arg_629_1.time_ - var_632_1) / var_632_2

				if arg_629_1.var_.characterEffect1019ui_story then
					local var_632_4 = Mathf.Lerp(0, 0.5, var_632_3)

					arg_629_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_629_1.var_.characterEffect1019ui_story.fillRatio = var_632_4
				end
			end

			if arg_629_1.time_ >= var_632_1 + var_632_2 and arg_629_1.time_ < var_632_1 + var_632_2 + arg_632_0 and arg_629_1.var_.characterEffect1019ui_story then
				local var_632_5 = 0.5

				arg_629_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_629_1.var_.characterEffect1019ui_story.fillRatio = var_632_5
			end

			local var_632_6 = 0
			local var_632_7 = 0.25

			if var_632_6 < arg_629_1.time_ and arg_629_1.time_ <= var_632_6 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, true)

				local var_632_8 = arg_629_1:FormatText(StoryNameCfg[7].name)

				arg_629_1.leftNameTxt_.text = var_632_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_629_1.leftNameTxt_.transform)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1.leftNameTxt_.text)
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_9 = arg_629_1:GetWordFromCfg(123011152)
				local var_632_10 = arg_629_1:FormatText(var_632_9.content)

				arg_629_1.text_.text = var_632_10

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_11 = 10
				local var_632_12 = utf8.len(var_632_10)
				local var_632_13 = var_632_11 <= 0 and var_632_7 or var_632_7 * (var_632_12 / var_632_11)

				if var_632_13 > 0 and var_632_7 < var_632_13 then
					arg_629_1.talkMaxDuration = var_632_13

					if var_632_13 + var_632_6 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_13 + var_632_6
					end
				end

				arg_629_1.text_.text = var_632_10
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)
				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_14 = math.max(var_632_7, arg_629_1.talkMaxDuration)

			if var_632_6 <= arg_629_1.time_ and arg_629_1.time_ < var_632_6 + var_632_14 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_6) / var_632_14

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_6 + var_632_14 and arg_629_1.time_ < var_632_6 + var_632_14 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play123011153 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 123011153
		arg_633_1.duration_ = 8.999999999999

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play123011154(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = 1.999999999999

			if var_636_0 < arg_633_1.time_ and arg_633_1.time_ <= var_636_0 + arg_636_0 then
				local var_636_1 = manager.ui.mainCamera.transform.localPosition
				local var_636_2 = Vector3.New(0, 0, 10) + Vector3.New(var_636_1.x, var_636_1.y, 0)
				local var_636_3 = arg_633_1.bgs_.STblack

				var_636_3.transform.localPosition = var_636_2
				var_636_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_636_4 = var_636_3:GetComponent("SpriteRenderer")

				if var_636_4 and var_636_4.sprite then
					local var_636_5 = (var_636_3.transform.localPosition - var_636_1).z
					local var_636_6 = manager.ui.mainCameraCom_
					local var_636_7 = 2 * var_636_5 * Mathf.Tan(var_636_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_636_8 = var_636_7 * var_636_6.aspect
					local var_636_9 = var_636_4.sprite.bounds.size.x
					local var_636_10 = var_636_4.sprite.bounds.size.y
					local var_636_11 = var_636_8 / var_636_9
					local var_636_12 = var_636_7 / var_636_10
					local var_636_13 = var_636_12 < var_636_11 and var_636_11 or var_636_12

					var_636_3.transform.localScale = Vector3.New(var_636_13, var_636_13, 0)
				end

				for iter_636_0, iter_636_1 in pairs(arg_633_1.bgs_) do
					if iter_636_0 ~= "STblack" then
						iter_636_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_636_14 = 0

			if var_636_14 < arg_633_1.time_ and arg_633_1.time_ <= var_636_14 + arg_636_0 then
				arg_633_1.mask_.enabled = true
				arg_633_1.mask_.raycastTarget = true

				arg_633_1:SetGaussion(false)
			end

			local var_636_15 = 2

			if var_636_14 <= arg_633_1.time_ and arg_633_1.time_ < var_636_14 + var_636_15 then
				local var_636_16 = (arg_633_1.time_ - var_636_14) / var_636_15
				local var_636_17 = Color.New(0, 0, 0)

				var_636_17.a = Mathf.Lerp(0, 1, var_636_16)
				arg_633_1.mask_.color = var_636_17
			end

			if arg_633_1.time_ >= var_636_14 + var_636_15 and arg_633_1.time_ < var_636_14 + var_636_15 + arg_636_0 then
				local var_636_18 = Color.New(0, 0, 0)

				var_636_18.a = 1
				arg_633_1.mask_.color = var_636_18
			end

			local var_636_19 = 2

			if var_636_19 < arg_633_1.time_ and arg_633_1.time_ <= var_636_19 + arg_636_0 then
				arg_633_1.mask_.enabled = true
				arg_633_1.mask_.raycastTarget = true

				arg_633_1:SetGaussion(false)
			end

			local var_636_20 = 2

			if var_636_19 <= arg_633_1.time_ and arg_633_1.time_ < var_636_19 + var_636_20 then
				local var_636_21 = (arg_633_1.time_ - var_636_19) / var_636_20
				local var_636_22 = Color.New(0, 0, 0)

				var_636_22.a = Mathf.Lerp(1, 0, var_636_21)
				arg_633_1.mask_.color = var_636_22
			end

			if arg_633_1.time_ >= var_636_19 + var_636_20 and arg_633_1.time_ < var_636_19 + var_636_20 + arg_636_0 then
				local var_636_23 = Color.New(0, 0, 0)
				local var_636_24 = 0

				arg_633_1.mask_.enabled = false
				var_636_23.a = var_636_24
				arg_633_1.mask_.color = var_636_23
			end

			local var_636_25 = arg_633_1.actors_["1019ui_story"].transform
			local var_636_26 = 1.966

			if var_636_26 < arg_633_1.time_ and arg_633_1.time_ <= var_636_26 + arg_636_0 then
				arg_633_1.var_.moveOldPos1019ui_story = var_636_25.localPosition
			end

			local var_636_27 = 0.001

			if var_636_26 <= arg_633_1.time_ and arg_633_1.time_ < var_636_26 + var_636_27 then
				local var_636_28 = (arg_633_1.time_ - var_636_26) / var_636_27
				local var_636_29 = Vector3.New(0, 100, 0)

				var_636_25.localPosition = Vector3.Lerp(arg_633_1.var_.moveOldPos1019ui_story, var_636_29, var_636_28)

				local var_636_30 = manager.ui.mainCamera.transform.position - var_636_25.position

				var_636_25.forward = Vector3.New(var_636_30.x, var_636_30.y, var_636_30.z)

				local var_636_31 = var_636_25.localEulerAngles

				var_636_31.z = 0
				var_636_31.x = 0
				var_636_25.localEulerAngles = var_636_31
			end

			if arg_633_1.time_ >= var_636_26 + var_636_27 and arg_633_1.time_ < var_636_26 + var_636_27 + arg_636_0 then
				var_636_25.localPosition = Vector3.New(0, 100, 0)

				local var_636_32 = manager.ui.mainCamera.transform.position - var_636_25.position

				var_636_25.forward = Vector3.New(var_636_32.x, var_636_32.y, var_636_32.z)

				local var_636_33 = var_636_25.localEulerAngles

				var_636_33.z = 0
				var_636_33.x = 0
				var_636_25.localEulerAngles = var_636_33
			end

			if arg_633_1.frameCnt_ <= 1 then
				arg_633_1.dialog_:SetActive(false)
			end

			local var_636_34 = 3.999999999999
			local var_636_35 = 0.45

			if var_636_34 < arg_633_1.time_ and arg_633_1.time_ <= var_636_34 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0

				arg_633_1.dialog_:SetActive(true)

				local var_636_36 = LeanTween.value(arg_633_1.dialog_, 0, 1, 0.3)

				var_636_36:setOnUpdate(LuaHelper.FloatAction(function(arg_637_0)
					arg_633_1.dialogCg_.alpha = arg_637_0
				end))
				var_636_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_633_1.dialog_)
					var_636_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_633_1.duration_ = arg_633_1.duration_ + 0.3

				SetActive(arg_633_1.leftNameGo_, false)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_633_1.iconTrs_.gameObject, false)
				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_37 = arg_633_1:GetWordFromCfg(123011153)
				local var_636_38 = arg_633_1:FormatText(var_636_37.content)

				arg_633_1.text_.text = var_636_38

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_39 = 18
				local var_636_40 = utf8.len(var_636_38)
				local var_636_41 = var_636_39 <= 0 and var_636_35 or var_636_35 * (var_636_40 / var_636_39)

				if var_636_41 > 0 and var_636_35 < var_636_41 then
					arg_633_1.talkMaxDuration = var_636_41
					var_636_34 = var_636_34 + 0.3

					if var_636_41 + var_636_34 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_41 + var_636_34
					end
				end

				arg_633_1.text_.text = var_636_38
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)
				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_42 = var_636_34 + 0.3
			local var_636_43 = math.max(var_636_35, arg_633_1.talkMaxDuration)

			if var_636_42 <= arg_633_1.time_ and arg_633_1.time_ < var_636_42 + var_636_43 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_42) / var_636_43

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_42 + var_636_43 and arg_633_1.time_ < var_636_42 + var_636_43 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play123011154 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 123011154
		arg_639_1.duration_ = 7

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play123011155(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = "XH0607"

			if arg_639_1.bgs_[var_642_0] == nil then
				local var_642_1 = Object.Instantiate(arg_639_1.paintGo_)

				var_642_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_642_0)
				var_642_1.name = var_642_0
				var_642_1.transform.parent = arg_639_1.stage_.transform
				var_642_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_639_1.bgs_[var_642_0] = var_642_1
			end

			local var_642_2 = 0

			if var_642_2 < arg_639_1.time_ and arg_639_1.time_ <= var_642_2 + arg_642_0 then
				local var_642_3 = manager.ui.mainCamera.transform.localPosition
				local var_642_4 = Vector3.New(0, 0, 10) + Vector3.New(var_642_3.x, var_642_3.y, 0)
				local var_642_5 = arg_639_1.bgs_.XH0607

				var_642_5.transform.localPosition = var_642_4
				var_642_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_642_6 = var_642_5:GetComponent("SpriteRenderer")

				if var_642_6 and var_642_6.sprite then
					local var_642_7 = (var_642_5.transform.localPosition - var_642_3).z
					local var_642_8 = manager.ui.mainCameraCom_
					local var_642_9 = 2 * var_642_7 * Mathf.Tan(var_642_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_642_10 = var_642_9 * var_642_8.aspect
					local var_642_11 = var_642_6.sprite.bounds.size.x
					local var_642_12 = var_642_6.sprite.bounds.size.y
					local var_642_13 = var_642_10 / var_642_11
					local var_642_14 = var_642_9 / var_642_12
					local var_642_15 = var_642_14 < var_642_13 and var_642_13 or var_642_14

					var_642_5.transform.localScale = Vector3.New(var_642_15, var_642_15, 0)
				end

				for iter_642_0, iter_642_1 in pairs(arg_639_1.bgs_) do
					if iter_642_0 ~= "XH0607" then
						iter_642_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_642_16 = 0

			if var_642_16 < arg_639_1.time_ and arg_639_1.time_ <= var_642_16 + arg_642_0 then
				arg_639_1.mask_.enabled = true
				arg_639_1.mask_.raycastTarget = true

				arg_639_1:SetGaussion(false)
			end

			local var_642_17 = 2

			if var_642_16 <= arg_639_1.time_ and arg_639_1.time_ < var_642_16 + var_642_17 then
				local var_642_18 = (arg_639_1.time_ - var_642_16) / var_642_17
				local var_642_19 = Color.New(0, 0, 0)

				var_642_19.a = Mathf.Lerp(1, 0, var_642_18)
				arg_639_1.mask_.color = var_642_19
			end

			if arg_639_1.time_ >= var_642_16 + var_642_17 and arg_639_1.time_ < var_642_16 + var_642_17 + arg_642_0 then
				local var_642_20 = Color.New(0, 0, 0)
				local var_642_21 = 0

				arg_639_1.mask_.enabled = false
				var_642_20.a = var_642_21
				arg_639_1.mask_.color = var_642_20
			end

			local var_642_22 = arg_639_1.bgs_.XH0607.transform
			local var_642_23 = 0

			if var_642_23 < arg_639_1.time_ and arg_639_1.time_ <= var_642_23 + arg_642_0 then
				arg_639_1.var_.moveOldPosXH0607 = var_642_22.localPosition
			end

			local var_642_24 = 0.001

			if var_642_23 <= arg_639_1.time_ and arg_639_1.time_ < var_642_23 + var_642_24 then
				local var_642_25 = (arg_639_1.time_ - var_642_23) / var_642_24
				local var_642_26 = Vector3.New(-1.5, 0, 0)

				var_642_22.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPosXH0607, var_642_26, var_642_25)
			end

			if arg_639_1.time_ >= var_642_23 + var_642_24 and arg_639_1.time_ < var_642_23 + var_642_24 + arg_642_0 then
				var_642_22.localPosition = Vector3.New(-1.5, 0, 0)
			end

			local var_642_27 = arg_639_1.bgs_.XH0607.transform
			local var_642_28 = 0.0166666666666667

			if var_642_28 < arg_639_1.time_ and arg_639_1.time_ <= var_642_28 + arg_642_0 then
				arg_639_1.var_.moveOldPosXH0607 = var_642_27.localPosition
			end

			local var_642_29 = 4.033331

			if var_642_28 <= arg_639_1.time_ and arg_639_1.time_ < var_642_28 + var_642_29 then
				local var_642_30 = (arg_639_1.time_ - var_642_28) / var_642_29
				local var_642_31 = Vector3.New(-1.5, -0.5, 0)

				var_642_27.localPosition = Vector3.Lerp(arg_639_1.var_.moveOldPosXH0607, var_642_31, var_642_30)
			end

			if arg_639_1.time_ >= var_642_28 + var_642_29 and arg_639_1.time_ < var_642_28 + var_642_29 + arg_642_0 then
				var_642_27.localPosition = Vector3.New(-1.5, -0.5, 0)
			end

			local var_642_32 = 2

			if var_642_32 < arg_639_1.time_ and arg_639_1.time_ <= var_642_32 + arg_642_0 then
				arg_639_1.allBtn_.enabled = false
			end

			local var_642_33 = 2.04999766666667

			if arg_639_1.time_ >= var_642_32 + var_642_33 and arg_639_1.time_ < var_642_32 + var_642_33 + arg_642_0 then
				arg_639_1.allBtn_.enabled = true
			end

			local var_642_34 = 2
			local var_642_35 = 0.675

			if var_642_34 < arg_639_1.time_ and arg_639_1.time_ <= var_642_34 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, false)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_36 = arg_639_1:GetWordFromCfg(123011154)
				local var_642_37 = arg_639_1:FormatText(var_642_36.content)

				arg_639_1.text_.text = var_642_37

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_38 = 27
				local var_642_39 = utf8.len(var_642_37)
				local var_642_40 = var_642_38 <= 0 and var_642_35 or var_642_35 * (var_642_39 / var_642_38)

				if var_642_40 > 0 and var_642_35 < var_642_40 then
					arg_639_1.talkMaxDuration = var_642_40

					if var_642_40 + var_642_34 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_40 + var_642_34
					end
				end

				arg_639_1.text_.text = var_642_37
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_41 = math.max(var_642_35, arg_639_1.talkMaxDuration)

			if var_642_34 <= arg_639_1.time_ and arg_639_1.time_ < var_642_34 + var_642_41 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_34) / var_642_41

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_34 + var_642_41 and arg_639_1.time_ < var_642_34 + var_642_41 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play123011155 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 123011155
		arg_643_1.duration_ = 5

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play123011156(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.233333333333333

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				local var_646_2 = "play"
				local var_646_3 = "music"

				arg_643_1:AudioAction(var_646_2, var_646_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_646_4 = 0
			local var_646_5 = 1

			if var_646_4 < arg_643_1.time_ and arg_643_1.time_ <= var_646_4 + arg_646_0 then
				local var_646_6 = "stop"
				local var_646_7 = "effect"

				arg_643_1:AudioAction(var_646_6, var_646_7, "se_story_123_01", "se_story_123_01_medical", "")
			end

			local var_646_8 = 0
			local var_646_9 = 0.95

			if var_646_8 < arg_643_1.time_ and arg_643_1.time_ <= var_646_8 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, false)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_10 = arg_643_1:GetWordFromCfg(123011155)
				local var_646_11 = arg_643_1:FormatText(var_646_10.content)

				arg_643_1.text_.text = var_646_11

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_12 = 38
				local var_646_13 = utf8.len(var_646_11)
				local var_646_14 = var_646_12 <= 0 and var_646_9 or var_646_9 * (var_646_13 / var_646_12)

				if var_646_14 > 0 and var_646_9 < var_646_14 then
					arg_643_1.talkMaxDuration = var_646_14

					if var_646_14 + var_646_8 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_14 + var_646_8
					end
				end

				arg_643_1.text_.text = var_646_11
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)
				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_15 = math.max(var_646_9, arg_643_1.talkMaxDuration)

			if var_646_8 <= arg_643_1.time_ and arg_643_1.time_ < var_646_8 + var_646_15 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_8) / var_646_15

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_8 + var_646_15 and arg_643_1.time_ < var_646_8 + var_646_15 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play123011156 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 123011156
		arg_647_1.duration_ = 8.999999999999

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play123011157(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = "ST12"

			if arg_647_1.bgs_[var_650_0] == nil then
				local var_650_1 = Object.Instantiate(arg_647_1.paintGo_)

				var_650_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_650_0)
				var_650_1.name = var_650_0
				var_650_1.transform.parent = arg_647_1.stage_.transform
				var_650_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_647_1.bgs_[var_650_0] = var_650_1
			end

			local var_650_2 = 1.999999999999

			if var_650_2 < arg_647_1.time_ and arg_647_1.time_ <= var_650_2 + arg_650_0 then
				local var_650_3 = manager.ui.mainCamera.transform.localPosition
				local var_650_4 = Vector3.New(0, 0, 10) + Vector3.New(var_650_3.x, var_650_3.y, 0)
				local var_650_5 = arg_647_1.bgs_.ST12

				var_650_5.transform.localPosition = var_650_4
				var_650_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_650_6 = var_650_5:GetComponent("SpriteRenderer")

				if var_650_6 and var_650_6.sprite then
					local var_650_7 = (var_650_5.transform.localPosition - var_650_3).z
					local var_650_8 = manager.ui.mainCameraCom_
					local var_650_9 = 2 * var_650_7 * Mathf.Tan(var_650_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_650_10 = var_650_9 * var_650_8.aspect
					local var_650_11 = var_650_6.sprite.bounds.size.x
					local var_650_12 = var_650_6.sprite.bounds.size.y
					local var_650_13 = var_650_10 / var_650_11
					local var_650_14 = var_650_9 / var_650_12
					local var_650_15 = var_650_14 < var_650_13 and var_650_13 or var_650_14

					var_650_5.transform.localScale = Vector3.New(var_650_15, var_650_15, 0)
				end

				for iter_650_0, iter_650_1 in pairs(arg_647_1.bgs_) do
					if iter_650_0 ~= "ST12" then
						iter_650_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_650_16 = 0

			if var_650_16 < arg_647_1.time_ and arg_647_1.time_ <= var_650_16 + arg_650_0 then
				arg_647_1.mask_.enabled = true
				arg_647_1.mask_.raycastTarget = true

				arg_647_1:SetGaussion(false)
			end

			local var_650_17 = 2

			if var_650_16 <= arg_647_1.time_ and arg_647_1.time_ < var_650_16 + var_650_17 then
				local var_650_18 = (arg_647_1.time_ - var_650_16) / var_650_17
				local var_650_19 = Color.New(0, 0, 0)

				var_650_19.a = Mathf.Lerp(0, 1, var_650_18)
				arg_647_1.mask_.color = var_650_19
			end

			if arg_647_1.time_ >= var_650_16 + var_650_17 and arg_647_1.time_ < var_650_16 + var_650_17 + arg_650_0 then
				local var_650_20 = Color.New(0, 0, 0)

				var_650_20.a = 1
				arg_647_1.mask_.color = var_650_20
			end

			local var_650_21 = 2

			if var_650_21 < arg_647_1.time_ and arg_647_1.time_ <= var_650_21 + arg_650_0 then
				arg_647_1.mask_.enabled = true
				arg_647_1.mask_.raycastTarget = true

				arg_647_1:SetGaussion(false)
			end

			local var_650_22 = 2

			if var_650_21 <= arg_647_1.time_ and arg_647_1.time_ < var_650_21 + var_650_22 then
				local var_650_23 = (arg_647_1.time_ - var_650_21) / var_650_22
				local var_650_24 = Color.New(0, 0, 0)

				var_650_24.a = Mathf.Lerp(1, 0, var_650_23)
				arg_647_1.mask_.color = var_650_24
			end

			if arg_647_1.time_ >= var_650_21 + var_650_22 and arg_647_1.time_ < var_650_21 + var_650_22 + arg_650_0 then
				local var_650_25 = Color.New(0, 0, 0)
				local var_650_26 = 0

				arg_647_1.mask_.enabled = false
				var_650_25.a = var_650_26
				arg_647_1.mask_.color = var_650_25
			end

			local var_650_27 = 0
			local var_650_28 = 0.866666666666667

			if var_650_27 < arg_647_1.time_ and arg_647_1.time_ <= var_650_27 + arg_650_0 then
				local var_650_29 = "play"
				local var_650_30 = "music"

				arg_647_1:AudioAction(var_650_29, var_650_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_650_31 = 3.76666666666667
			local var_650_32 = 1

			if var_650_31 < arg_647_1.time_ and arg_647_1.time_ <= var_650_31 + arg_650_0 then
				local var_650_33 = "play"
				local var_650_34 = "music"

				arg_647_1:AudioAction(var_650_33, var_650_34, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_647_1.frameCnt_ <= 1 then
				arg_647_1.dialog_:SetActive(false)
			end

			local var_650_35 = 3.999999999999
			local var_650_36 = 1.1

			if var_650_35 < arg_647_1.time_ and arg_647_1.time_ <= var_650_35 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0

				arg_647_1.dialog_:SetActive(true)

				local var_650_37 = LeanTween.value(arg_647_1.dialog_, 0, 1, 0.3)

				var_650_37:setOnUpdate(LuaHelper.FloatAction(function(arg_651_0)
					arg_647_1.dialogCg_.alpha = arg_651_0
				end))
				var_650_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_647_1.dialog_)
					var_650_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_647_1.duration_ = arg_647_1.duration_ + 0.3

				SetActive(arg_647_1.leftNameGo_, false)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_38 = arg_647_1:GetWordFromCfg(123011156)
				local var_650_39 = arg_647_1:FormatText(var_650_38.content)

				arg_647_1.text_.text = var_650_39

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_40 = 44
				local var_650_41 = utf8.len(var_650_39)
				local var_650_42 = var_650_40 <= 0 and var_650_36 or var_650_36 * (var_650_41 / var_650_40)

				if var_650_42 > 0 and var_650_36 < var_650_42 then
					arg_647_1.talkMaxDuration = var_650_42
					var_650_35 = var_650_35 + 0.3

					if var_650_42 + var_650_35 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_42 + var_650_35
					end
				end

				arg_647_1.text_.text = var_650_39
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)
				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_43 = var_650_35 + 0.3
			local var_650_44 = math.max(var_650_36, arg_647_1.talkMaxDuration)

			if var_650_43 <= arg_647_1.time_ and arg_647_1.time_ < var_650_43 + var_650_44 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_43) / var_650_44

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_43 + var_650_44 and arg_647_1.time_ < var_650_43 + var_650_44 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play123011157 = function(arg_653_0, arg_653_1)
		arg_653_1.time_ = 0
		arg_653_1.frameCnt_ = 0
		arg_653_1.state_ = "playing"
		arg_653_1.curTalkId_ = 123011157
		arg_653_1.duration_ = 15.9

		local var_653_0 = {
			zh = 12.6,
			ja = 15.9
		}
		local var_653_1 = manager.audio:GetLocalizationFlag()

		if var_653_0[var_653_1] ~= nil then
			arg_653_1.duration_ = var_653_0[var_653_1]
		end

		SetActive(arg_653_1.tipsGo_, false)

		function arg_653_1.onSingleLineFinish_()
			arg_653_1.onSingleLineUpdate_ = nil
			arg_653_1.onSingleLineFinish_ = nil
			arg_653_1.state_ = "waiting"
		end

		function arg_653_1.playNext_(arg_655_0)
			if arg_655_0 == 1 then
				arg_653_0:Play123011158(arg_653_1)
			end
		end

		function arg_653_1.onSingleLineUpdate_(arg_656_0)
			local var_656_0 = "1033ui_story"

			if arg_653_1.actors_[var_656_0] == nil then
				local var_656_1 = Object.Instantiate(Asset.Load("Char/" .. var_656_0), arg_653_1.stage_.transform)

				var_656_1.name = var_656_0
				var_656_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_653_1.actors_[var_656_0] = var_656_1

				local var_656_2 = var_656_1:GetComponentInChildren(typeof(CharacterEffect))

				var_656_2.enabled = true

				local var_656_3 = GameObjectTools.GetOrAddComponent(var_656_1, typeof(DynamicBoneHelper))

				if var_656_3 then
					var_656_3:EnableDynamicBone(false)
				end

				arg_653_1:ShowWeapon(var_656_2.transform, false)

				arg_653_1.var_[var_656_0 .. "Animator"] = var_656_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_653_1.var_[var_656_0 .. "Animator"].applyRootMotion = true
				arg_653_1.var_[var_656_0 .. "LipSync"] = var_656_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_656_4 = arg_653_1.actors_["1033ui_story"].transform
			local var_656_5 = 0

			if var_656_5 < arg_653_1.time_ and arg_653_1.time_ <= var_656_5 + arg_656_0 then
				arg_653_1.var_.moveOldPos1033ui_story = var_656_4.localPosition
			end

			local var_656_6 = 0.001

			if var_656_5 <= arg_653_1.time_ and arg_653_1.time_ < var_656_5 + var_656_6 then
				local var_656_7 = (arg_653_1.time_ - var_656_5) / var_656_6
				local var_656_8 = Vector3.New(0, -0.9, -6.35)

				var_656_4.localPosition = Vector3.Lerp(arg_653_1.var_.moveOldPos1033ui_story, var_656_8, var_656_7)

				local var_656_9 = manager.ui.mainCamera.transform.position - var_656_4.position

				var_656_4.forward = Vector3.New(var_656_9.x, var_656_9.y, var_656_9.z)

				local var_656_10 = var_656_4.localEulerAngles

				var_656_10.z = 0
				var_656_10.x = 0
				var_656_4.localEulerAngles = var_656_10
			end

			if arg_653_1.time_ >= var_656_5 + var_656_6 and arg_653_1.time_ < var_656_5 + var_656_6 + arg_656_0 then
				var_656_4.localPosition = Vector3.New(0, -0.9, -6.35)

				local var_656_11 = manager.ui.mainCamera.transform.position - var_656_4.position

				var_656_4.forward = Vector3.New(var_656_11.x, var_656_11.y, var_656_11.z)

				local var_656_12 = var_656_4.localEulerAngles

				var_656_12.z = 0
				var_656_12.x = 0
				var_656_4.localEulerAngles = var_656_12
			end

			local var_656_13 = arg_653_1.actors_["1033ui_story"]
			local var_656_14 = 0

			if var_656_14 < arg_653_1.time_ and arg_653_1.time_ <= var_656_14 + arg_656_0 and arg_653_1.var_.characterEffect1033ui_story == nil then
				arg_653_1.var_.characterEffect1033ui_story = var_656_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_656_15 = 0.200000002980232

			if var_656_14 <= arg_653_1.time_ and arg_653_1.time_ < var_656_14 + var_656_15 then
				local var_656_16 = (arg_653_1.time_ - var_656_14) / var_656_15

				if arg_653_1.var_.characterEffect1033ui_story then
					arg_653_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_653_1.time_ >= var_656_14 + var_656_15 and arg_653_1.time_ < var_656_14 + var_656_15 + arg_656_0 and arg_653_1.var_.characterEffect1033ui_story then
				arg_653_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_656_17 = 0

			if var_656_17 < arg_653_1.time_ and arg_653_1.time_ <= var_656_17 + arg_656_0 then
				arg_653_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action1_1")
			end

			local var_656_18 = 0

			if var_656_18 < arg_653_1.time_ and arg_653_1.time_ <= var_656_18 + arg_656_0 then
				arg_653_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_656_19 = 0
			local var_656_20 = 1.675

			if var_656_19 < arg_653_1.time_ and arg_653_1.time_ <= var_656_19 + arg_656_0 then
				arg_653_1.talkMaxDuration = 0
				arg_653_1.dialogCg_.alpha = 1

				arg_653_1.dialog_:SetActive(true)
				SetActive(arg_653_1.leftNameGo_, true)

				local var_656_21 = arg_653_1:FormatText(StoryNameCfg[236].name)

				arg_653_1.leftNameTxt_.text = var_656_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_653_1.leftNameTxt_.transform)

				arg_653_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_653_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_653_1:RecordName(arg_653_1.leftNameTxt_.text)
				SetActive(arg_653_1.iconTrs_.gameObject, false)
				arg_653_1.callingController_:SetSelectedState("normal")

				local var_656_22 = arg_653_1:GetWordFromCfg(123011157)
				local var_656_23 = arg_653_1:FormatText(var_656_22.content)

				arg_653_1.text_.text = var_656_23

				LuaForUtil.ClearLinePrefixSymbol(arg_653_1.text_)

				local var_656_24 = 67
				local var_656_25 = utf8.len(var_656_23)
				local var_656_26 = var_656_24 <= 0 and var_656_20 or var_656_20 * (var_656_25 / var_656_24)

				if var_656_26 > 0 and var_656_20 < var_656_26 then
					arg_653_1.talkMaxDuration = var_656_26

					if var_656_26 + var_656_19 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_26 + var_656_19
					end
				end

				arg_653_1.text_.text = var_656_23
				arg_653_1.typewritter.percent = 0

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011157", "story_v_out_123011.awb") ~= 0 then
					local var_656_27 = manager.audio:GetVoiceLength("story_v_out_123011", "123011157", "story_v_out_123011.awb") / 1000

					if var_656_27 + var_656_19 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_27 + var_656_19
					end

					if var_656_22.prefab_name ~= "" and arg_653_1.actors_[var_656_22.prefab_name] ~= nil then
						local var_656_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_653_1.actors_[var_656_22.prefab_name].transform, "story_v_out_123011", "123011157", "story_v_out_123011.awb")

						arg_653_1:RecordAudio("123011157", var_656_28)
						arg_653_1:RecordAudio("123011157", var_656_28)
					else
						arg_653_1:AudioAction("play", "voice", "story_v_out_123011", "123011157", "story_v_out_123011.awb")
					end

					arg_653_1:RecordHistoryTalkVoice("story_v_out_123011", "123011157", "story_v_out_123011.awb")
				end

				arg_653_1:RecordContent(arg_653_1.text_.text)
			end

			local var_656_29 = math.max(var_656_20, arg_653_1.talkMaxDuration)

			if var_656_19 <= arg_653_1.time_ and arg_653_1.time_ < var_656_19 + var_656_29 then
				arg_653_1.typewritter.percent = (arg_653_1.time_ - var_656_19) / var_656_29

				arg_653_1.typewritter:SetDirty()
			end

			if arg_653_1.time_ >= var_656_19 + var_656_29 and arg_653_1.time_ < var_656_19 + var_656_29 + arg_656_0 then
				arg_653_1.typewritter.percent = 1

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(true)
			end
		end
	end,
	Play123011158 = function(arg_657_0, arg_657_1)
		arg_657_1.time_ = 0
		arg_657_1.frameCnt_ = 0
		arg_657_1.state_ = "playing"
		arg_657_1.curTalkId_ = 123011158
		arg_657_1.duration_ = 15.166

		local var_657_0 = {
			zh = 10.666,
			ja = 15.166
		}
		local var_657_1 = manager.audio:GetLocalizationFlag()

		if var_657_0[var_657_1] ~= nil then
			arg_657_1.duration_ = var_657_0[var_657_1]
		end

		SetActive(arg_657_1.tipsGo_, false)

		function arg_657_1.onSingleLineFinish_()
			arg_657_1.onSingleLineUpdate_ = nil
			arg_657_1.onSingleLineFinish_ = nil
			arg_657_1.state_ = "waiting"
		end

		function arg_657_1.playNext_(arg_659_0)
			if arg_659_0 == 1 then
				arg_657_0:Play123011159(arg_657_1)
			end
		end

		function arg_657_1.onSingleLineUpdate_(arg_660_0)
			local var_660_0 = 0
			local var_660_1 = 1.25

			if var_660_0 < arg_657_1.time_ and arg_657_1.time_ <= var_660_0 + arg_660_0 then
				arg_657_1.talkMaxDuration = 0
				arg_657_1.dialogCg_.alpha = 1

				arg_657_1.dialog_:SetActive(true)
				SetActive(arg_657_1.leftNameGo_, true)

				local var_660_2 = arg_657_1:FormatText(StoryNameCfg[236].name)

				arg_657_1.leftNameTxt_.text = var_660_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_657_1.leftNameTxt_.transform)

				arg_657_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_657_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_657_1:RecordName(arg_657_1.leftNameTxt_.text)
				SetActive(arg_657_1.iconTrs_.gameObject, false)
				arg_657_1.callingController_:SetSelectedState("normal")

				local var_660_3 = arg_657_1:GetWordFromCfg(123011158)
				local var_660_4 = arg_657_1:FormatText(var_660_3.content)

				arg_657_1.text_.text = var_660_4

				LuaForUtil.ClearLinePrefixSymbol(arg_657_1.text_)

				local var_660_5 = 50
				local var_660_6 = utf8.len(var_660_4)
				local var_660_7 = var_660_5 <= 0 and var_660_1 or var_660_1 * (var_660_6 / var_660_5)

				if var_660_7 > 0 and var_660_1 < var_660_7 then
					arg_657_1.talkMaxDuration = var_660_7

					if var_660_7 + var_660_0 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_7 + var_660_0
					end
				end

				arg_657_1.text_.text = var_660_4
				arg_657_1.typewritter.percent = 0

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011158", "story_v_out_123011.awb") ~= 0 then
					local var_660_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011158", "story_v_out_123011.awb") / 1000

					if var_660_8 + var_660_0 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_8 + var_660_0
					end

					if var_660_3.prefab_name ~= "" and arg_657_1.actors_[var_660_3.prefab_name] ~= nil then
						local var_660_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_657_1.actors_[var_660_3.prefab_name].transform, "story_v_out_123011", "123011158", "story_v_out_123011.awb")

						arg_657_1:RecordAudio("123011158", var_660_9)
						arg_657_1:RecordAudio("123011158", var_660_9)
					else
						arg_657_1:AudioAction("play", "voice", "story_v_out_123011", "123011158", "story_v_out_123011.awb")
					end

					arg_657_1:RecordHistoryTalkVoice("story_v_out_123011", "123011158", "story_v_out_123011.awb")
				end

				arg_657_1:RecordContent(arg_657_1.text_.text)
			end

			local var_660_10 = math.max(var_660_1, arg_657_1.talkMaxDuration)

			if var_660_0 <= arg_657_1.time_ and arg_657_1.time_ < var_660_0 + var_660_10 then
				arg_657_1.typewritter.percent = (arg_657_1.time_ - var_660_0) / var_660_10

				arg_657_1.typewritter:SetDirty()
			end

			if arg_657_1.time_ >= var_660_0 + var_660_10 and arg_657_1.time_ < var_660_0 + var_660_10 + arg_660_0 then
				arg_657_1.typewritter.percent = 1

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(true)
			end
		end
	end,
	Play123011159 = function(arg_661_0, arg_661_1)
		arg_661_1.time_ = 0
		arg_661_1.frameCnt_ = 0
		arg_661_1.state_ = "playing"
		arg_661_1.curTalkId_ = 123011159
		arg_661_1.duration_ = 5

		SetActive(arg_661_1.tipsGo_, false)

		function arg_661_1.onSingleLineFinish_()
			arg_661_1.onSingleLineUpdate_ = nil
			arg_661_1.onSingleLineFinish_ = nil
			arg_661_1.state_ = "waiting"
		end

		function arg_661_1.playNext_(arg_663_0)
			if arg_663_0 == 1 then
				arg_661_0:Play123011160(arg_661_1)
			end
		end

		function arg_661_1.onSingleLineUpdate_(arg_664_0)
			local var_664_0 = arg_661_1.actors_["1033ui_story"]
			local var_664_1 = 0

			if var_664_1 < arg_661_1.time_ and arg_661_1.time_ <= var_664_1 + arg_664_0 and arg_661_1.var_.characterEffect1033ui_story == nil then
				arg_661_1.var_.characterEffect1033ui_story = var_664_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_664_2 = 0.200000002980232

			if var_664_1 <= arg_661_1.time_ and arg_661_1.time_ < var_664_1 + var_664_2 then
				local var_664_3 = (arg_661_1.time_ - var_664_1) / var_664_2

				if arg_661_1.var_.characterEffect1033ui_story then
					local var_664_4 = Mathf.Lerp(0, 0.5, var_664_3)

					arg_661_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_661_1.var_.characterEffect1033ui_story.fillRatio = var_664_4
				end
			end

			if arg_661_1.time_ >= var_664_1 + var_664_2 and arg_661_1.time_ < var_664_1 + var_664_2 + arg_664_0 and arg_661_1.var_.characterEffect1033ui_story then
				local var_664_5 = 0.5

				arg_661_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_661_1.var_.characterEffect1033ui_story.fillRatio = var_664_5
			end

			local var_664_6 = 0
			local var_664_7 = 0.325

			if var_664_6 < arg_661_1.time_ and arg_661_1.time_ <= var_664_6 + arg_664_0 then
				arg_661_1.talkMaxDuration = 0
				arg_661_1.dialogCg_.alpha = 1

				arg_661_1.dialog_:SetActive(true)
				SetActive(arg_661_1.leftNameGo_, true)

				local var_664_8 = arg_661_1:FormatText(StoryNameCfg[7].name)

				arg_661_1.leftNameTxt_.text = var_664_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_661_1.leftNameTxt_.transform)

				arg_661_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_661_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_661_1:RecordName(arg_661_1.leftNameTxt_.text)
				SetActive(arg_661_1.iconTrs_.gameObject, false)
				arg_661_1.callingController_:SetSelectedState("normal")

				local var_664_9 = arg_661_1:GetWordFromCfg(123011159)
				local var_664_10 = arg_661_1:FormatText(var_664_9.content)

				arg_661_1.text_.text = var_664_10

				LuaForUtil.ClearLinePrefixSymbol(arg_661_1.text_)

				local var_664_11 = 13
				local var_664_12 = utf8.len(var_664_10)
				local var_664_13 = var_664_11 <= 0 and var_664_7 or var_664_7 * (var_664_12 / var_664_11)

				if var_664_13 > 0 and var_664_7 < var_664_13 then
					arg_661_1.talkMaxDuration = var_664_13

					if var_664_13 + var_664_6 > arg_661_1.duration_ then
						arg_661_1.duration_ = var_664_13 + var_664_6
					end
				end

				arg_661_1.text_.text = var_664_10
				arg_661_1.typewritter.percent = 0

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(false)
				arg_661_1:RecordContent(arg_661_1.text_.text)
			end

			local var_664_14 = math.max(var_664_7, arg_661_1.talkMaxDuration)

			if var_664_6 <= arg_661_1.time_ and arg_661_1.time_ < var_664_6 + var_664_14 then
				arg_661_1.typewritter.percent = (arg_661_1.time_ - var_664_6) / var_664_14

				arg_661_1.typewritter:SetDirty()
			end

			if arg_661_1.time_ >= var_664_6 + var_664_14 and arg_661_1.time_ < var_664_6 + var_664_14 + arg_664_0 then
				arg_661_1.typewritter.percent = 1

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(true)
			end
		end
	end,
	Play123011160 = function(arg_665_0, arg_665_1)
		arg_665_1.time_ = 0
		arg_665_1.frameCnt_ = 0
		arg_665_1.state_ = "playing"
		arg_665_1.curTalkId_ = 123011160
		arg_665_1.duration_ = 16

		local var_665_0 = {
			zh = 10.566,
			ja = 16
		}
		local var_665_1 = manager.audio:GetLocalizationFlag()

		if var_665_0[var_665_1] ~= nil then
			arg_665_1.duration_ = var_665_0[var_665_1]
		end

		SetActive(arg_665_1.tipsGo_, false)

		function arg_665_1.onSingleLineFinish_()
			arg_665_1.onSingleLineUpdate_ = nil
			arg_665_1.onSingleLineFinish_ = nil
			arg_665_1.state_ = "waiting"
		end

		function arg_665_1.playNext_(arg_667_0)
			if arg_667_0 == 1 then
				arg_665_0:Play123011161(arg_665_1)
			end
		end

		function arg_665_1.onSingleLineUpdate_(arg_668_0)
			local var_668_0 = arg_665_1.actors_["1033ui_story"]
			local var_668_1 = 0

			if var_668_1 < arg_665_1.time_ and arg_665_1.time_ <= var_668_1 + arg_668_0 and arg_665_1.var_.characterEffect1033ui_story == nil then
				arg_665_1.var_.characterEffect1033ui_story = var_668_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_668_2 = 0.200000002980232

			if var_668_1 <= arg_665_1.time_ and arg_665_1.time_ < var_668_1 + var_668_2 then
				local var_668_3 = (arg_665_1.time_ - var_668_1) / var_668_2

				if arg_665_1.var_.characterEffect1033ui_story then
					arg_665_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_665_1.time_ >= var_668_1 + var_668_2 and arg_665_1.time_ < var_668_1 + var_668_2 + arg_668_0 and arg_665_1.var_.characterEffect1033ui_story then
				arg_665_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_668_4 = 0

			if var_668_4 < arg_665_1.time_ and arg_665_1.time_ <= var_668_4 + arg_668_0 then
				arg_665_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action2_1")
			end

			local var_668_5 = 0

			if var_668_5 < arg_665_1.time_ and arg_665_1.time_ <= var_668_5 + arg_668_0 then
				arg_665_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_668_6 = 0
			local var_668_7 = 1.2

			if var_668_6 < arg_665_1.time_ and arg_665_1.time_ <= var_668_6 + arg_668_0 then
				arg_665_1.talkMaxDuration = 0
				arg_665_1.dialogCg_.alpha = 1

				arg_665_1.dialog_:SetActive(true)
				SetActive(arg_665_1.leftNameGo_, true)

				local var_668_8 = arg_665_1:FormatText(StoryNameCfg[236].name)

				arg_665_1.leftNameTxt_.text = var_668_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_665_1.leftNameTxt_.transform)

				arg_665_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_665_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_665_1:RecordName(arg_665_1.leftNameTxt_.text)
				SetActive(arg_665_1.iconTrs_.gameObject, false)
				arg_665_1.callingController_:SetSelectedState("normal")

				local var_668_9 = arg_665_1:GetWordFromCfg(123011160)
				local var_668_10 = arg_665_1:FormatText(var_668_9.content)

				arg_665_1.text_.text = var_668_10

				LuaForUtil.ClearLinePrefixSymbol(arg_665_1.text_)

				local var_668_11 = 48
				local var_668_12 = utf8.len(var_668_10)
				local var_668_13 = var_668_11 <= 0 and var_668_7 or var_668_7 * (var_668_12 / var_668_11)

				if var_668_13 > 0 and var_668_7 < var_668_13 then
					arg_665_1.talkMaxDuration = var_668_13

					if var_668_13 + var_668_6 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_13 + var_668_6
					end
				end

				arg_665_1.text_.text = var_668_10
				arg_665_1.typewritter.percent = 0

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011160", "story_v_out_123011.awb") ~= 0 then
					local var_668_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011160", "story_v_out_123011.awb") / 1000

					if var_668_14 + var_668_6 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_14 + var_668_6
					end

					if var_668_9.prefab_name ~= "" and arg_665_1.actors_[var_668_9.prefab_name] ~= nil then
						local var_668_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_665_1.actors_[var_668_9.prefab_name].transform, "story_v_out_123011", "123011160", "story_v_out_123011.awb")

						arg_665_1:RecordAudio("123011160", var_668_15)
						arg_665_1:RecordAudio("123011160", var_668_15)
					else
						arg_665_1:AudioAction("play", "voice", "story_v_out_123011", "123011160", "story_v_out_123011.awb")
					end

					arg_665_1:RecordHistoryTalkVoice("story_v_out_123011", "123011160", "story_v_out_123011.awb")
				end

				arg_665_1:RecordContent(arg_665_1.text_.text)
			end

			local var_668_16 = math.max(var_668_7, arg_665_1.talkMaxDuration)

			if var_668_6 <= arg_665_1.time_ and arg_665_1.time_ < var_668_6 + var_668_16 then
				arg_665_1.typewritter.percent = (arg_665_1.time_ - var_668_6) / var_668_16

				arg_665_1.typewritter:SetDirty()
			end

			if arg_665_1.time_ >= var_668_6 + var_668_16 and arg_665_1.time_ < var_668_6 + var_668_16 + arg_668_0 then
				arg_665_1.typewritter.percent = 1

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(true)
			end
		end
	end,
	Play123011161 = function(arg_669_0, arg_669_1)
		arg_669_1.time_ = 0
		arg_669_1.frameCnt_ = 0
		arg_669_1.state_ = "playing"
		arg_669_1.curTalkId_ = 123011161
		arg_669_1.duration_ = 5

		SetActive(arg_669_1.tipsGo_, false)

		function arg_669_1.onSingleLineFinish_()
			arg_669_1.onSingleLineUpdate_ = nil
			arg_669_1.onSingleLineFinish_ = nil
			arg_669_1.state_ = "waiting"
		end

		function arg_669_1.playNext_(arg_671_0)
			if arg_671_0 == 1 then
				arg_669_0:Play123011162(arg_669_1)
			end
		end

		function arg_669_1.onSingleLineUpdate_(arg_672_0)
			local var_672_0 = arg_669_1.actors_["1033ui_story"]
			local var_672_1 = 0

			if var_672_1 < arg_669_1.time_ and arg_669_1.time_ <= var_672_1 + arg_672_0 and arg_669_1.var_.characterEffect1033ui_story == nil then
				arg_669_1.var_.characterEffect1033ui_story = var_672_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_672_2 = 0.200000002980232

			if var_672_1 <= arg_669_1.time_ and arg_669_1.time_ < var_672_1 + var_672_2 then
				local var_672_3 = (arg_669_1.time_ - var_672_1) / var_672_2

				if arg_669_1.var_.characterEffect1033ui_story then
					local var_672_4 = Mathf.Lerp(0, 0.5, var_672_3)

					arg_669_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_669_1.var_.characterEffect1033ui_story.fillRatio = var_672_4
				end
			end

			if arg_669_1.time_ >= var_672_1 + var_672_2 and arg_669_1.time_ < var_672_1 + var_672_2 + arg_672_0 and arg_669_1.var_.characterEffect1033ui_story then
				local var_672_5 = 0.5

				arg_669_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_669_1.var_.characterEffect1033ui_story.fillRatio = var_672_5
			end

			local var_672_6 = 0
			local var_672_7 = 0.275

			if var_672_6 < arg_669_1.time_ and arg_669_1.time_ <= var_672_6 + arg_672_0 then
				arg_669_1.talkMaxDuration = 0
				arg_669_1.dialogCg_.alpha = 1

				arg_669_1.dialog_:SetActive(true)
				SetActive(arg_669_1.leftNameGo_, true)

				local var_672_8 = arg_669_1:FormatText(StoryNameCfg[7].name)

				arg_669_1.leftNameTxt_.text = var_672_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_669_1.leftNameTxt_.transform)

				arg_669_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_669_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_669_1:RecordName(arg_669_1.leftNameTxt_.text)
				SetActive(arg_669_1.iconTrs_.gameObject, false)
				arg_669_1.callingController_:SetSelectedState("normal")

				local var_672_9 = arg_669_1:GetWordFromCfg(123011161)
				local var_672_10 = arg_669_1:FormatText(var_672_9.content)

				arg_669_1.text_.text = var_672_10

				LuaForUtil.ClearLinePrefixSymbol(arg_669_1.text_)

				local var_672_11 = 11
				local var_672_12 = utf8.len(var_672_10)
				local var_672_13 = var_672_11 <= 0 and var_672_7 or var_672_7 * (var_672_12 / var_672_11)

				if var_672_13 > 0 and var_672_7 < var_672_13 then
					arg_669_1.talkMaxDuration = var_672_13

					if var_672_13 + var_672_6 > arg_669_1.duration_ then
						arg_669_1.duration_ = var_672_13 + var_672_6
					end
				end

				arg_669_1.text_.text = var_672_10
				arg_669_1.typewritter.percent = 0

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(false)
				arg_669_1:RecordContent(arg_669_1.text_.text)
			end

			local var_672_14 = math.max(var_672_7, arg_669_1.talkMaxDuration)

			if var_672_6 <= arg_669_1.time_ and arg_669_1.time_ < var_672_6 + var_672_14 then
				arg_669_1.typewritter.percent = (arg_669_1.time_ - var_672_6) / var_672_14

				arg_669_1.typewritter:SetDirty()
			end

			if arg_669_1.time_ >= var_672_6 + var_672_14 and arg_669_1.time_ < var_672_6 + var_672_14 + arg_672_0 then
				arg_669_1.typewritter.percent = 1

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(true)
			end
		end
	end,
	Play123011162 = function(arg_673_0, arg_673_1)
		arg_673_1.time_ = 0
		arg_673_1.frameCnt_ = 0
		arg_673_1.state_ = "playing"
		arg_673_1.curTalkId_ = 123011162
		arg_673_1.duration_ = 8.733

		local var_673_0 = {
			zh = 6.366,
			ja = 8.733
		}
		local var_673_1 = manager.audio:GetLocalizationFlag()

		if var_673_0[var_673_1] ~= nil then
			arg_673_1.duration_ = var_673_0[var_673_1]
		end

		SetActive(arg_673_1.tipsGo_, false)

		function arg_673_1.onSingleLineFinish_()
			arg_673_1.onSingleLineUpdate_ = nil
			arg_673_1.onSingleLineFinish_ = nil
			arg_673_1.state_ = "waiting"
		end

		function arg_673_1.playNext_(arg_675_0)
			if arg_675_0 == 1 then
				arg_673_0:Play123011163(arg_673_1)
			end
		end

		function arg_673_1.onSingleLineUpdate_(arg_676_0)
			local var_676_0 = arg_673_1.actors_["1033ui_story"].transform
			local var_676_1 = 0

			if var_676_1 < arg_673_1.time_ and arg_673_1.time_ <= var_676_1 + arg_676_0 then
				arg_673_1.var_.moveOldPos1033ui_story = var_676_0.localPosition
			end

			local var_676_2 = 0.001

			if var_676_1 <= arg_673_1.time_ and arg_673_1.time_ < var_676_1 + var_676_2 then
				local var_676_3 = (arg_673_1.time_ - var_676_1) / var_676_2
				local var_676_4 = Vector3.New(0, 100, 0)

				var_676_0.localPosition = Vector3.Lerp(arg_673_1.var_.moveOldPos1033ui_story, var_676_4, var_676_3)

				local var_676_5 = manager.ui.mainCamera.transform.position - var_676_0.position

				var_676_0.forward = Vector3.New(var_676_5.x, var_676_5.y, var_676_5.z)

				local var_676_6 = var_676_0.localEulerAngles

				var_676_6.z = 0
				var_676_6.x = 0
				var_676_0.localEulerAngles = var_676_6
			end

			if arg_673_1.time_ >= var_676_1 + var_676_2 and arg_673_1.time_ < var_676_1 + var_676_2 + arg_676_0 then
				var_676_0.localPosition = Vector3.New(0, 100, 0)

				local var_676_7 = manager.ui.mainCamera.transform.position - var_676_0.position

				var_676_0.forward = Vector3.New(var_676_7.x, var_676_7.y, var_676_7.z)

				local var_676_8 = var_676_0.localEulerAngles

				var_676_8.z = 0
				var_676_8.x = 0
				var_676_0.localEulerAngles = var_676_8
			end

			local var_676_9 = arg_673_1.actors_["1033ui_story"]
			local var_676_10 = 0

			if var_676_10 < arg_673_1.time_ and arg_673_1.time_ <= var_676_10 + arg_676_0 and arg_673_1.var_.characterEffect1033ui_story == nil then
				arg_673_1.var_.characterEffect1033ui_story = var_676_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_676_11 = 0.200000002980232

			if var_676_10 <= arg_673_1.time_ and arg_673_1.time_ < var_676_10 + var_676_11 then
				local var_676_12 = (arg_673_1.time_ - var_676_10) / var_676_11

				if arg_673_1.var_.characterEffect1033ui_story then
					local var_676_13 = Mathf.Lerp(0, 0.5, var_676_12)

					arg_673_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_673_1.var_.characterEffect1033ui_story.fillRatio = var_676_13
				end
			end

			if arg_673_1.time_ >= var_676_10 + var_676_11 and arg_673_1.time_ < var_676_10 + var_676_11 + arg_676_0 and arg_673_1.var_.characterEffect1033ui_story then
				local var_676_14 = 0.5

				arg_673_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_673_1.var_.characterEffect1033ui_story.fillRatio = var_676_14
			end

			local var_676_15 = arg_673_1.actors_["1019ui_story"].transform
			local var_676_16 = 0

			if var_676_16 < arg_673_1.time_ and arg_673_1.time_ <= var_676_16 + arg_676_0 then
				arg_673_1.var_.moveOldPos1019ui_story = var_676_15.localPosition
			end

			local var_676_17 = 0.001

			if var_676_16 <= arg_673_1.time_ and arg_673_1.time_ < var_676_16 + var_676_17 then
				local var_676_18 = (arg_673_1.time_ - var_676_16) / var_676_17
				local var_676_19 = Vector3.New(0, -1.08, -5.9)

				var_676_15.localPosition = Vector3.Lerp(arg_673_1.var_.moveOldPos1019ui_story, var_676_19, var_676_18)

				local var_676_20 = manager.ui.mainCamera.transform.position - var_676_15.position

				var_676_15.forward = Vector3.New(var_676_20.x, var_676_20.y, var_676_20.z)

				local var_676_21 = var_676_15.localEulerAngles

				var_676_21.z = 0
				var_676_21.x = 0
				var_676_15.localEulerAngles = var_676_21
			end

			if arg_673_1.time_ >= var_676_16 + var_676_17 and arg_673_1.time_ < var_676_16 + var_676_17 + arg_676_0 then
				var_676_15.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_676_22 = manager.ui.mainCamera.transform.position - var_676_15.position

				var_676_15.forward = Vector3.New(var_676_22.x, var_676_22.y, var_676_22.z)

				local var_676_23 = var_676_15.localEulerAngles

				var_676_23.z = 0
				var_676_23.x = 0
				var_676_15.localEulerAngles = var_676_23
			end

			local var_676_24 = arg_673_1.actors_["1019ui_story"]
			local var_676_25 = 0

			if var_676_25 < arg_673_1.time_ and arg_673_1.time_ <= var_676_25 + arg_676_0 and arg_673_1.var_.characterEffect1019ui_story == nil then
				arg_673_1.var_.characterEffect1019ui_story = var_676_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_676_26 = 0.200000002980232

			if var_676_25 <= arg_673_1.time_ and arg_673_1.time_ < var_676_25 + var_676_26 then
				local var_676_27 = (arg_673_1.time_ - var_676_25) / var_676_26

				if arg_673_1.var_.characterEffect1019ui_story then
					arg_673_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_673_1.time_ >= var_676_25 + var_676_26 and arg_673_1.time_ < var_676_25 + var_676_26 + arg_676_0 and arg_673_1.var_.characterEffect1019ui_story then
				arg_673_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_676_28 = 0

			if var_676_28 < arg_673_1.time_ and arg_673_1.time_ <= var_676_28 + arg_676_0 then
				arg_673_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_676_29 = 0

			if var_676_29 < arg_673_1.time_ and arg_673_1.time_ <= var_676_29 + arg_676_0 then
				arg_673_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_676_30 = 0
			local var_676_31 = 0.75

			if var_676_30 < arg_673_1.time_ and arg_673_1.time_ <= var_676_30 + arg_676_0 then
				arg_673_1.talkMaxDuration = 0
				arg_673_1.dialogCg_.alpha = 1

				arg_673_1.dialog_:SetActive(true)
				SetActive(arg_673_1.leftNameGo_, true)

				local var_676_32 = arg_673_1:FormatText(StoryNameCfg[13].name)

				arg_673_1.leftNameTxt_.text = var_676_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_673_1.leftNameTxt_.transform)

				arg_673_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_673_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_673_1:RecordName(arg_673_1.leftNameTxt_.text)
				SetActive(arg_673_1.iconTrs_.gameObject, false)
				arg_673_1.callingController_:SetSelectedState("normal")

				local var_676_33 = arg_673_1:GetWordFromCfg(123011162)
				local var_676_34 = arg_673_1:FormatText(var_676_33.content)

				arg_673_1.text_.text = var_676_34

				LuaForUtil.ClearLinePrefixSymbol(arg_673_1.text_)

				local var_676_35 = 30
				local var_676_36 = utf8.len(var_676_34)
				local var_676_37 = var_676_35 <= 0 and var_676_31 or var_676_31 * (var_676_36 / var_676_35)

				if var_676_37 > 0 and var_676_31 < var_676_37 then
					arg_673_1.talkMaxDuration = var_676_37

					if var_676_37 + var_676_30 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_37 + var_676_30
					end
				end

				arg_673_1.text_.text = var_676_34
				arg_673_1.typewritter.percent = 0

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011162", "story_v_out_123011.awb") ~= 0 then
					local var_676_38 = manager.audio:GetVoiceLength("story_v_out_123011", "123011162", "story_v_out_123011.awb") / 1000

					if var_676_38 + var_676_30 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_38 + var_676_30
					end

					if var_676_33.prefab_name ~= "" and arg_673_1.actors_[var_676_33.prefab_name] ~= nil then
						local var_676_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_673_1.actors_[var_676_33.prefab_name].transform, "story_v_out_123011", "123011162", "story_v_out_123011.awb")

						arg_673_1:RecordAudio("123011162", var_676_39)
						arg_673_1:RecordAudio("123011162", var_676_39)
					else
						arg_673_1:AudioAction("play", "voice", "story_v_out_123011", "123011162", "story_v_out_123011.awb")
					end

					arg_673_1:RecordHistoryTalkVoice("story_v_out_123011", "123011162", "story_v_out_123011.awb")
				end

				arg_673_1:RecordContent(arg_673_1.text_.text)
			end

			local var_676_40 = math.max(var_676_31, arg_673_1.talkMaxDuration)

			if var_676_30 <= arg_673_1.time_ and arg_673_1.time_ < var_676_30 + var_676_40 then
				arg_673_1.typewritter.percent = (arg_673_1.time_ - var_676_30) / var_676_40

				arg_673_1.typewritter:SetDirty()
			end

			if arg_673_1.time_ >= var_676_30 + var_676_40 and arg_673_1.time_ < var_676_30 + var_676_40 + arg_676_0 then
				arg_673_1.typewritter.percent = 1

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(true)
			end
		end
	end,
	Play123011163 = function(arg_677_0, arg_677_1)
		arg_677_1.time_ = 0
		arg_677_1.frameCnt_ = 0
		arg_677_1.state_ = "playing"
		arg_677_1.curTalkId_ = 123011163
		arg_677_1.duration_ = 5

		SetActive(arg_677_1.tipsGo_, false)

		function arg_677_1.onSingleLineFinish_()
			arg_677_1.onSingleLineUpdate_ = nil
			arg_677_1.onSingleLineFinish_ = nil
			arg_677_1.state_ = "waiting"
		end

		function arg_677_1.playNext_(arg_679_0)
			if arg_679_0 == 1 then
				arg_677_0:Play123011164(arg_677_1)
			end
		end

		function arg_677_1.onSingleLineUpdate_(arg_680_0)
			local var_680_0 = arg_677_1.actors_["1019ui_story"]
			local var_680_1 = 0

			if var_680_1 < arg_677_1.time_ and arg_677_1.time_ <= var_680_1 + arg_680_0 and arg_677_1.var_.characterEffect1019ui_story == nil then
				arg_677_1.var_.characterEffect1019ui_story = var_680_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_680_2 = 0.200000002980232

			if var_680_1 <= arg_677_1.time_ and arg_677_1.time_ < var_680_1 + var_680_2 then
				local var_680_3 = (arg_677_1.time_ - var_680_1) / var_680_2

				if arg_677_1.var_.characterEffect1019ui_story then
					local var_680_4 = Mathf.Lerp(0, 0.5, var_680_3)

					arg_677_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_677_1.var_.characterEffect1019ui_story.fillRatio = var_680_4
				end
			end

			if arg_677_1.time_ >= var_680_1 + var_680_2 and arg_677_1.time_ < var_680_1 + var_680_2 + arg_680_0 and arg_677_1.var_.characterEffect1019ui_story then
				local var_680_5 = 0.5

				arg_677_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_677_1.var_.characterEffect1019ui_story.fillRatio = var_680_5
			end

			local var_680_6 = 0
			local var_680_7 = 0.575

			if var_680_6 < arg_677_1.time_ and arg_677_1.time_ <= var_680_6 + arg_680_0 then
				arg_677_1.talkMaxDuration = 0
				arg_677_1.dialogCg_.alpha = 1

				arg_677_1.dialog_:SetActive(true)
				SetActive(arg_677_1.leftNameGo_, false)

				arg_677_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_677_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_677_1:RecordName(arg_677_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_677_1.iconTrs_.gameObject, false)
				arg_677_1.callingController_:SetSelectedState("normal")

				local var_680_8 = arg_677_1:GetWordFromCfg(123011163)
				local var_680_9 = arg_677_1:FormatText(var_680_8.content)

				arg_677_1.text_.text = var_680_9

				LuaForUtil.ClearLinePrefixSymbol(arg_677_1.text_)

				local var_680_10 = 23
				local var_680_11 = utf8.len(var_680_9)
				local var_680_12 = var_680_10 <= 0 and var_680_7 or var_680_7 * (var_680_11 / var_680_10)

				if var_680_12 > 0 and var_680_7 < var_680_12 then
					arg_677_1.talkMaxDuration = var_680_12

					if var_680_12 + var_680_6 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_12 + var_680_6
					end
				end

				arg_677_1.text_.text = var_680_9
				arg_677_1.typewritter.percent = 0

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(false)
				arg_677_1:RecordContent(arg_677_1.text_.text)
			end

			local var_680_13 = math.max(var_680_7, arg_677_1.talkMaxDuration)

			if var_680_6 <= arg_677_1.time_ and arg_677_1.time_ < var_680_6 + var_680_13 then
				arg_677_1.typewritter.percent = (arg_677_1.time_ - var_680_6) / var_680_13

				arg_677_1.typewritter:SetDirty()
			end

			if arg_677_1.time_ >= var_680_6 + var_680_13 and arg_677_1.time_ < var_680_6 + var_680_13 + arg_680_0 then
				arg_677_1.typewritter.percent = 1

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(true)
			end
		end
	end,
	Play123011164 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 123011164
		arg_681_1.duration_ = 8.666

		local var_681_0 = {
			zh = 6.366,
			ja = 8.666
		}
		local var_681_1 = manager.audio:GetLocalizationFlag()

		if var_681_0[var_681_1] ~= nil then
			arg_681_1.duration_ = var_681_0[var_681_1]
		end

		SetActive(arg_681_1.tipsGo_, false)

		function arg_681_1.onSingleLineFinish_()
			arg_681_1.onSingleLineUpdate_ = nil
			arg_681_1.onSingleLineFinish_ = nil
			arg_681_1.state_ = "waiting"
		end

		function arg_681_1.playNext_(arg_683_0)
			if arg_683_0 == 1 then
				arg_681_0:Play123011165(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = arg_681_1.actors_["1019ui_story"]
			local var_684_1 = 0

			if var_684_1 < arg_681_1.time_ and arg_681_1.time_ <= var_684_1 + arg_684_0 and arg_681_1.var_.characterEffect1019ui_story == nil then
				arg_681_1.var_.characterEffect1019ui_story = var_684_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_684_2 = 0.200000002980232

			if var_684_1 <= arg_681_1.time_ and arg_681_1.time_ < var_684_1 + var_684_2 then
				local var_684_3 = (arg_681_1.time_ - var_684_1) / var_684_2

				if arg_681_1.var_.characterEffect1019ui_story then
					arg_681_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_681_1.time_ >= var_684_1 + var_684_2 and arg_681_1.time_ < var_684_1 + var_684_2 + arg_684_0 and arg_681_1.var_.characterEffect1019ui_story then
				arg_681_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_684_4 = 0

			if var_684_4 < arg_681_1.time_ and arg_681_1.time_ <= var_684_4 + arg_684_0 then
				arg_681_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_1")
			end

			local var_684_5 = 0

			if var_684_5 < arg_681_1.time_ and arg_681_1.time_ <= var_684_5 + arg_684_0 then
				arg_681_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_684_6 = 0
			local var_684_7 = 0.875

			if var_684_6 < arg_681_1.time_ and arg_681_1.time_ <= var_684_6 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, true)

				local var_684_8 = arg_681_1:FormatText(StoryNameCfg[13].name)

				arg_681_1.leftNameTxt_.text = var_684_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_681_1.leftNameTxt_.transform)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1.leftNameTxt_.text)
				SetActive(arg_681_1.iconTrs_.gameObject, false)
				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_9 = arg_681_1:GetWordFromCfg(123011164)
				local var_684_10 = arg_681_1:FormatText(var_684_9.content)

				arg_681_1.text_.text = var_684_10

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_11 = 35
				local var_684_12 = utf8.len(var_684_10)
				local var_684_13 = var_684_11 <= 0 and var_684_7 or var_684_7 * (var_684_12 / var_684_11)

				if var_684_13 > 0 and var_684_7 < var_684_13 then
					arg_681_1.talkMaxDuration = var_684_13

					if var_684_13 + var_684_6 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_13 + var_684_6
					end
				end

				arg_681_1.text_.text = var_684_10
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011164", "story_v_out_123011.awb") ~= 0 then
					local var_684_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011164", "story_v_out_123011.awb") / 1000

					if var_684_14 + var_684_6 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_14 + var_684_6
					end

					if var_684_9.prefab_name ~= "" and arg_681_1.actors_[var_684_9.prefab_name] ~= nil then
						local var_684_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_681_1.actors_[var_684_9.prefab_name].transform, "story_v_out_123011", "123011164", "story_v_out_123011.awb")

						arg_681_1:RecordAudio("123011164", var_684_15)
						arg_681_1:RecordAudio("123011164", var_684_15)
					else
						arg_681_1:AudioAction("play", "voice", "story_v_out_123011", "123011164", "story_v_out_123011.awb")
					end

					arg_681_1:RecordHistoryTalkVoice("story_v_out_123011", "123011164", "story_v_out_123011.awb")
				end

				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_16 = math.max(var_684_7, arg_681_1.talkMaxDuration)

			if var_684_6 <= arg_681_1.time_ and arg_681_1.time_ < var_684_6 + var_684_16 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_6) / var_684_16

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_6 + var_684_16 and arg_681_1.time_ < var_684_6 + var_684_16 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play123011165 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 123011165
		arg_685_1.duration_ = 5

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play123011166(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = arg_685_1.actors_["1019ui_story"]
			local var_688_1 = 0

			if var_688_1 < arg_685_1.time_ and arg_685_1.time_ <= var_688_1 + arg_688_0 and arg_685_1.var_.characterEffect1019ui_story == nil then
				arg_685_1.var_.characterEffect1019ui_story = var_688_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_688_2 = 0.200000002980232

			if var_688_1 <= arg_685_1.time_ and arg_685_1.time_ < var_688_1 + var_688_2 then
				local var_688_3 = (arg_685_1.time_ - var_688_1) / var_688_2

				if arg_685_1.var_.characterEffect1019ui_story then
					local var_688_4 = Mathf.Lerp(0, 0.5, var_688_3)

					arg_685_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_685_1.var_.characterEffect1019ui_story.fillRatio = var_688_4
				end
			end

			if arg_685_1.time_ >= var_688_1 + var_688_2 and arg_685_1.time_ < var_688_1 + var_688_2 + arg_688_0 and arg_685_1.var_.characterEffect1019ui_story then
				local var_688_5 = 0.5

				arg_685_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_685_1.var_.characterEffect1019ui_story.fillRatio = var_688_5
			end

			local var_688_6 = 0
			local var_688_7 = 0.7

			if var_688_6 < arg_685_1.time_ and arg_685_1.time_ <= var_688_6 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_8 = arg_685_1:FormatText(StoryNameCfg[7].name)

				arg_685_1.leftNameTxt_.text = var_688_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_9 = arg_685_1:GetWordFromCfg(123011165)
				local var_688_10 = arg_685_1:FormatText(var_688_9.content)

				arg_685_1.text_.text = var_688_10

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_11 = 28
				local var_688_12 = utf8.len(var_688_10)
				local var_688_13 = var_688_11 <= 0 and var_688_7 or var_688_7 * (var_688_12 / var_688_11)

				if var_688_13 > 0 and var_688_7 < var_688_13 then
					arg_685_1.talkMaxDuration = var_688_13

					if var_688_13 + var_688_6 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_13 + var_688_6
					end
				end

				arg_685_1.text_.text = var_688_10
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)
				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_14 = math.max(var_688_7, arg_685_1.talkMaxDuration)

			if var_688_6 <= arg_685_1.time_ and arg_685_1.time_ < var_688_6 + var_688_14 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_6) / var_688_14

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_6 + var_688_14 and arg_685_1.time_ < var_688_6 + var_688_14 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play123011166 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 123011166
		arg_689_1.duration_ = 6.866

		local var_689_0 = {
			zh = 4.4,
			ja = 6.866
		}
		local var_689_1 = manager.audio:GetLocalizationFlag()

		if var_689_0[var_689_1] ~= nil then
			arg_689_1.duration_ = var_689_0[var_689_1]
		end

		SetActive(arg_689_1.tipsGo_, false)

		function arg_689_1.onSingleLineFinish_()
			arg_689_1.onSingleLineUpdate_ = nil
			arg_689_1.onSingleLineFinish_ = nil
			arg_689_1.state_ = "waiting"
		end

		function arg_689_1.playNext_(arg_691_0)
			if arg_691_0 == 1 then
				arg_689_0:Play123011167(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = arg_689_1.actors_["1019ui_story"]
			local var_692_1 = 0

			if var_692_1 < arg_689_1.time_ and arg_689_1.time_ <= var_692_1 + arg_692_0 and arg_689_1.var_.characterEffect1019ui_story == nil then
				arg_689_1.var_.characterEffect1019ui_story = var_692_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_692_2 = 0.200000002980232

			if var_692_1 <= arg_689_1.time_ and arg_689_1.time_ < var_692_1 + var_692_2 then
				local var_692_3 = (arg_689_1.time_ - var_692_1) / var_692_2

				if arg_689_1.var_.characterEffect1019ui_story then
					arg_689_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_689_1.time_ >= var_692_1 + var_692_2 and arg_689_1.time_ < var_692_1 + var_692_2 + arg_692_0 and arg_689_1.var_.characterEffect1019ui_story then
				arg_689_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_692_4 = 0

			if var_692_4 < arg_689_1.time_ and arg_689_1.time_ <= var_692_4 + arg_692_0 then
				arg_689_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_2")
			end

			local var_692_5 = 0

			if var_692_5 < arg_689_1.time_ and arg_689_1.time_ <= var_692_5 + arg_692_0 then
				arg_689_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_692_6 = 0
			local var_692_7 = 0.625

			if var_692_6 < arg_689_1.time_ and arg_689_1.time_ <= var_692_6 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_8 = arg_689_1:FormatText(StoryNameCfg[13].name)

				arg_689_1.leftNameTxt_.text = var_692_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, false)
				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_9 = arg_689_1:GetWordFromCfg(123011166)
				local var_692_10 = arg_689_1:FormatText(var_692_9.content)

				arg_689_1.text_.text = var_692_10

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_11 = 25
				local var_692_12 = utf8.len(var_692_10)
				local var_692_13 = var_692_11 <= 0 and var_692_7 or var_692_7 * (var_692_12 / var_692_11)

				if var_692_13 > 0 and var_692_7 < var_692_13 then
					arg_689_1.talkMaxDuration = var_692_13

					if var_692_13 + var_692_6 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_13 + var_692_6
					end
				end

				arg_689_1.text_.text = var_692_10
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011166", "story_v_out_123011.awb") ~= 0 then
					local var_692_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011166", "story_v_out_123011.awb") / 1000

					if var_692_14 + var_692_6 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_14 + var_692_6
					end

					if var_692_9.prefab_name ~= "" and arg_689_1.actors_[var_692_9.prefab_name] ~= nil then
						local var_692_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_689_1.actors_[var_692_9.prefab_name].transform, "story_v_out_123011", "123011166", "story_v_out_123011.awb")

						arg_689_1:RecordAudio("123011166", var_692_15)
						arg_689_1:RecordAudio("123011166", var_692_15)
					else
						arg_689_1:AudioAction("play", "voice", "story_v_out_123011", "123011166", "story_v_out_123011.awb")
					end

					arg_689_1:RecordHistoryTalkVoice("story_v_out_123011", "123011166", "story_v_out_123011.awb")
				end

				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_16 = math.max(var_692_7, arg_689_1.talkMaxDuration)

			if var_692_6 <= arg_689_1.time_ and arg_689_1.time_ < var_692_6 + var_692_16 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_6) / var_692_16

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_6 + var_692_16 and arg_689_1.time_ < var_692_6 + var_692_16 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play123011167 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 123011167
		arg_693_1.duration_ = 11.266

		local var_693_0 = {
			zh = 9.4,
			ja = 11.266
		}
		local var_693_1 = manager.audio:GetLocalizationFlag()

		if var_693_0[var_693_1] ~= nil then
			arg_693_1.duration_ = var_693_0[var_693_1]
		end

		SetActive(arg_693_1.tipsGo_, false)

		function arg_693_1.onSingleLineFinish_()
			arg_693_1.onSingleLineUpdate_ = nil
			arg_693_1.onSingleLineFinish_ = nil
			arg_693_1.state_ = "waiting"
		end

		function arg_693_1.playNext_(arg_695_0)
			if arg_695_0 == 1 then
				arg_693_0:Play123011168(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = 0
			local var_696_1 = 1.25

			if var_696_0 < arg_693_1.time_ and arg_693_1.time_ <= var_696_0 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0
				arg_693_1.dialogCg_.alpha = 1

				arg_693_1.dialog_:SetActive(true)
				SetActive(arg_693_1.leftNameGo_, true)

				local var_696_2 = arg_693_1:FormatText(StoryNameCfg[13].name)

				arg_693_1.leftNameTxt_.text = var_696_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_693_1.leftNameTxt_.transform)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1.leftNameTxt_.text)
				SetActive(arg_693_1.iconTrs_.gameObject, false)
				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_3 = arg_693_1:GetWordFromCfg(123011167)
				local var_696_4 = arg_693_1:FormatText(var_696_3.content)

				arg_693_1.text_.text = var_696_4

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_5 = 50
				local var_696_6 = utf8.len(var_696_4)
				local var_696_7 = var_696_5 <= 0 and var_696_1 or var_696_1 * (var_696_6 / var_696_5)

				if var_696_7 > 0 and var_696_1 < var_696_7 then
					arg_693_1.talkMaxDuration = var_696_7

					if var_696_7 + var_696_0 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_7 + var_696_0
					end
				end

				arg_693_1.text_.text = var_696_4
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011167", "story_v_out_123011.awb") ~= 0 then
					local var_696_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011167", "story_v_out_123011.awb") / 1000

					if var_696_8 + var_696_0 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_8 + var_696_0
					end

					if var_696_3.prefab_name ~= "" and arg_693_1.actors_[var_696_3.prefab_name] ~= nil then
						local var_696_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_693_1.actors_[var_696_3.prefab_name].transform, "story_v_out_123011", "123011167", "story_v_out_123011.awb")

						arg_693_1:RecordAudio("123011167", var_696_9)
						arg_693_1:RecordAudio("123011167", var_696_9)
					else
						arg_693_1:AudioAction("play", "voice", "story_v_out_123011", "123011167", "story_v_out_123011.awb")
					end

					arg_693_1:RecordHistoryTalkVoice("story_v_out_123011", "123011167", "story_v_out_123011.awb")
				end

				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_10 = math.max(var_696_1, arg_693_1.talkMaxDuration)

			if var_696_0 <= arg_693_1.time_ and arg_693_1.time_ < var_696_0 + var_696_10 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_0) / var_696_10

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_0 + var_696_10 and arg_693_1.time_ < var_696_0 + var_696_10 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play123011168 = function(arg_697_0, arg_697_1)
		arg_697_1.time_ = 0
		arg_697_1.frameCnt_ = 0
		arg_697_1.state_ = "playing"
		arg_697_1.curTalkId_ = 123011168
		arg_697_1.duration_ = 17.2

		local var_697_0 = {
			zh = 12.866,
			ja = 17.2
		}
		local var_697_1 = manager.audio:GetLocalizationFlag()

		if var_697_0[var_697_1] ~= nil then
			arg_697_1.duration_ = var_697_0[var_697_1]
		end

		SetActive(arg_697_1.tipsGo_, false)

		function arg_697_1.onSingleLineFinish_()
			arg_697_1.onSingleLineUpdate_ = nil
			arg_697_1.onSingleLineFinish_ = nil
			arg_697_1.state_ = "waiting"
		end

		function arg_697_1.playNext_(arg_699_0)
			if arg_699_0 == 1 then
				arg_697_0:Play123011169(arg_697_1)
			end
		end

		function arg_697_1.onSingleLineUpdate_(arg_700_0)
			local var_700_0 = 0
			local var_700_1 = 1.65

			if var_700_0 < arg_697_1.time_ and arg_697_1.time_ <= var_700_0 + arg_700_0 then
				arg_697_1.talkMaxDuration = 0
				arg_697_1.dialogCg_.alpha = 1

				arg_697_1.dialog_:SetActive(true)
				SetActive(arg_697_1.leftNameGo_, true)

				local var_700_2 = arg_697_1:FormatText(StoryNameCfg[13].name)

				arg_697_1.leftNameTxt_.text = var_700_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_697_1.leftNameTxt_.transform)

				arg_697_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_697_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_697_1:RecordName(arg_697_1.leftNameTxt_.text)
				SetActive(arg_697_1.iconTrs_.gameObject, false)
				arg_697_1.callingController_:SetSelectedState("normal")

				local var_700_3 = arg_697_1:GetWordFromCfg(123011168)
				local var_700_4 = arg_697_1:FormatText(var_700_3.content)

				arg_697_1.text_.text = var_700_4

				LuaForUtil.ClearLinePrefixSymbol(arg_697_1.text_)

				local var_700_5 = 66
				local var_700_6 = utf8.len(var_700_4)
				local var_700_7 = var_700_5 <= 0 and var_700_1 or var_700_1 * (var_700_6 / var_700_5)

				if var_700_7 > 0 and var_700_1 < var_700_7 then
					arg_697_1.talkMaxDuration = var_700_7

					if var_700_7 + var_700_0 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_7 + var_700_0
					end
				end

				arg_697_1.text_.text = var_700_4
				arg_697_1.typewritter.percent = 0

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011168", "story_v_out_123011.awb") ~= 0 then
					local var_700_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011168", "story_v_out_123011.awb") / 1000

					if var_700_8 + var_700_0 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_8 + var_700_0
					end

					if var_700_3.prefab_name ~= "" and arg_697_1.actors_[var_700_3.prefab_name] ~= nil then
						local var_700_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_697_1.actors_[var_700_3.prefab_name].transform, "story_v_out_123011", "123011168", "story_v_out_123011.awb")

						arg_697_1:RecordAudio("123011168", var_700_9)
						arg_697_1:RecordAudio("123011168", var_700_9)
					else
						arg_697_1:AudioAction("play", "voice", "story_v_out_123011", "123011168", "story_v_out_123011.awb")
					end

					arg_697_1:RecordHistoryTalkVoice("story_v_out_123011", "123011168", "story_v_out_123011.awb")
				end

				arg_697_1:RecordContent(arg_697_1.text_.text)
			end

			local var_700_10 = math.max(var_700_1, arg_697_1.talkMaxDuration)

			if var_700_0 <= arg_697_1.time_ and arg_697_1.time_ < var_700_0 + var_700_10 then
				arg_697_1.typewritter.percent = (arg_697_1.time_ - var_700_0) / var_700_10

				arg_697_1.typewritter:SetDirty()
			end

			if arg_697_1.time_ >= var_700_0 + var_700_10 and arg_697_1.time_ < var_700_0 + var_700_10 + arg_700_0 then
				arg_697_1.typewritter.percent = 1

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(true)
			end
		end
	end,
	Play123011169 = function(arg_701_0, arg_701_1)
		arg_701_1.time_ = 0
		arg_701_1.frameCnt_ = 0
		arg_701_1.state_ = "playing"
		arg_701_1.curTalkId_ = 123011169
		arg_701_1.duration_ = 5

		SetActive(arg_701_1.tipsGo_, false)

		function arg_701_1.onSingleLineFinish_()
			arg_701_1.onSingleLineUpdate_ = nil
			arg_701_1.onSingleLineFinish_ = nil
			arg_701_1.state_ = "waiting"
		end

		function arg_701_1.playNext_(arg_703_0)
			if arg_703_0 == 1 then
				arg_701_0:Play123011170(arg_701_1)
			end
		end

		function arg_701_1.onSingleLineUpdate_(arg_704_0)
			local var_704_0 = arg_701_1.actors_["1019ui_story"]
			local var_704_1 = 0

			if var_704_1 < arg_701_1.time_ and arg_701_1.time_ <= var_704_1 + arg_704_0 and arg_701_1.var_.characterEffect1019ui_story == nil then
				arg_701_1.var_.characterEffect1019ui_story = var_704_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_704_2 = 0.200000002980232

			if var_704_1 <= arg_701_1.time_ and arg_701_1.time_ < var_704_1 + var_704_2 then
				local var_704_3 = (arg_701_1.time_ - var_704_1) / var_704_2

				if arg_701_1.var_.characterEffect1019ui_story then
					local var_704_4 = Mathf.Lerp(0, 0.5, var_704_3)

					arg_701_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_701_1.var_.characterEffect1019ui_story.fillRatio = var_704_4
				end
			end

			if arg_701_1.time_ >= var_704_1 + var_704_2 and arg_701_1.time_ < var_704_1 + var_704_2 + arg_704_0 and arg_701_1.var_.characterEffect1019ui_story then
				local var_704_5 = 0.5

				arg_701_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_701_1.var_.characterEffect1019ui_story.fillRatio = var_704_5
			end

			local var_704_6 = 0
			local var_704_7 = 0.275

			if var_704_6 < arg_701_1.time_ and arg_701_1.time_ <= var_704_6 + arg_704_0 then
				arg_701_1.talkMaxDuration = 0
				arg_701_1.dialogCg_.alpha = 1

				arg_701_1.dialog_:SetActive(true)
				SetActive(arg_701_1.leftNameGo_, true)

				local var_704_8 = arg_701_1:FormatText(StoryNameCfg[7].name)

				arg_701_1.leftNameTxt_.text = var_704_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_701_1.leftNameTxt_.transform)

				arg_701_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_701_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_701_1:RecordName(arg_701_1.leftNameTxt_.text)
				SetActive(arg_701_1.iconTrs_.gameObject, false)
				arg_701_1.callingController_:SetSelectedState("normal")

				local var_704_9 = arg_701_1:GetWordFromCfg(123011169)
				local var_704_10 = arg_701_1:FormatText(var_704_9.content)

				arg_701_1.text_.text = var_704_10

				LuaForUtil.ClearLinePrefixSymbol(arg_701_1.text_)

				local var_704_11 = 11
				local var_704_12 = utf8.len(var_704_10)
				local var_704_13 = var_704_11 <= 0 and var_704_7 or var_704_7 * (var_704_12 / var_704_11)

				if var_704_13 > 0 and var_704_7 < var_704_13 then
					arg_701_1.talkMaxDuration = var_704_13

					if var_704_13 + var_704_6 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_13 + var_704_6
					end
				end

				arg_701_1.text_.text = var_704_10
				arg_701_1.typewritter.percent = 0

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(false)
				arg_701_1:RecordContent(arg_701_1.text_.text)
			end

			local var_704_14 = math.max(var_704_7, arg_701_1.talkMaxDuration)

			if var_704_6 <= arg_701_1.time_ and arg_701_1.time_ < var_704_6 + var_704_14 then
				arg_701_1.typewritter.percent = (arg_701_1.time_ - var_704_6) / var_704_14

				arg_701_1.typewritter:SetDirty()
			end

			if arg_701_1.time_ >= var_704_6 + var_704_14 and arg_701_1.time_ < var_704_6 + var_704_14 + arg_704_0 then
				arg_701_1.typewritter.percent = 1

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(true)
			end
		end
	end,
	Play123011170 = function(arg_705_0, arg_705_1)
		arg_705_1.time_ = 0
		arg_705_1.frameCnt_ = 0
		arg_705_1.state_ = "playing"
		arg_705_1.curTalkId_ = 123011170
		arg_705_1.duration_ = 9.466

		local var_705_0 = {
			zh = 6.233,
			ja = 9.466
		}
		local var_705_1 = manager.audio:GetLocalizationFlag()

		if var_705_0[var_705_1] ~= nil then
			arg_705_1.duration_ = var_705_0[var_705_1]
		end

		SetActive(arg_705_1.tipsGo_, false)

		function arg_705_1.onSingleLineFinish_()
			arg_705_1.onSingleLineUpdate_ = nil
			arg_705_1.onSingleLineFinish_ = nil
			arg_705_1.state_ = "waiting"
		end

		function arg_705_1.playNext_(arg_707_0)
			if arg_707_0 == 1 then
				arg_705_0:Play123011171(arg_705_1)
			end
		end

		function arg_705_1.onSingleLineUpdate_(arg_708_0)
			local var_708_0 = arg_705_1.actors_["1019ui_story"]
			local var_708_1 = 0

			if var_708_1 < arg_705_1.time_ and arg_705_1.time_ <= var_708_1 + arg_708_0 and arg_705_1.var_.characterEffect1019ui_story == nil then
				arg_705_1.var_.characterEffect1019ui_story = var_708_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_708_2 = 0.200000002980232

			if var_708_1 <= arg_705_1.time_ and arg_705_1.time_ < var_708_1 + var_708_2 then
				local var_708_3 = (arg_705_1.time_ - var_708_1) / var_708_2

				if arg_705_1.var_.characterEffect1019ui_story then
					arg_705_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_705_1.time_ >= var_708_1 + var_708_2 and arg_705_1.time_ < var_708_1 + var_708_2 + arg_708_0 and arg_705_1.var_.characterEffect1019ui_story then
				arg_705_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_708_4 = 0

			if var_708_4 < arg_705_1.time_ and arg_705_1.time_ <= var_708_4 + arg_708_0 then
				arg_705_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_708_5 = 0
			local var_708_6 = 0.775

			if var_708_5 < arg_705_1.time_ and arg_705_1.time_ <= var_708_5 + arg_708_0 then
				arg_705_1.talkMaxDuration = 0
				arg_705_1.dialogCg_.alpha = 1

				arg_705_1.dialog_:SetActive(true)
				SetActive(arg_705_1.leftNameGo_, true)

				local var_708_7 = arg_705_1:FormatText(StoryNameCfg[13].name)

				arg_705_1.leftNameTxt_.text = var_708_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_705_1.leftNameTxt_.transform)

				arg_705_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_705_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_705_1:RecordName(arg_705_1.leftNameTxt_.text)
				SetActive(arg_705_1.iconTrs_.gameObject, false)
				arg_705_1.callingController_:SetSelectedState("normal")

				local var_708_8 = arg_705_1:GetWordFromCfg(123011170)
				local var_708_9 = arg_705_1:FormatText(var_708_8.content)

				arg_705_1.text_.text = var_708_9

				LuaForUtil.ClearLinePrefixSymbol(arg_705_1.text_)

				local var_708_10 = 31
				local var_708_11 = utf8.len(var_708_9)
				local var_708_12 = var_708_10 <= 0 and var_708_6 or var_708_6 * (var_708_11 / var_708_10)

				if var_708_12 > 0 and var_708_6 < var_708_12 then
					arg_705_1.talkMaxDuration = var_708_12

					if var_708_12 + var_708_5 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_12 + var_708_5
					end
				end

				arg_705_1.text_.text = var_708_9
				arg_705_1.typewritter.percent = 0

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011170", "story_v_out_123011.awb") ~= 0 then
					local var_708_13 = manager.audio:GetVoiceLength("story_v_out_123011", "123011170", "story_v_out_123011.awb") / 1000

					if var_708_13 + var_708_5 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_13 + var_708_5
					end

					if var_708_8.prefab_name ~= "" and arg_705_1.actors_[var_708_8.prefab_name] ~= nil then
						local var_708_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_705_1.actors_[var_708_8.prefab_name].transform, "story_v_out_123011", "123011170", "story_v_out_123011.awb")

						arg_705_1:RecordAudio("123011170", var_708_14)
						arg_705_1:RecordAudio("123011170", var_708_14)
					else
						arg_705_1:AudioAction("play", "voice", "story_v_out_123011", "123011170", "story_v_out_123011.awb")
					end

					arg_705_1:RecordHistoryTalkVoice("story_v_out_123011", "123011170", "story_v_out_123011.awb")
				end

				arg_705_1:RecordContent(arg_705_1.text_.text)
			end

			local var_708_15 = math.max(var_708_6, arg_705_1.talkMaxDuration)

			if var_708_5 <= arg_705_1.time_ and arg_705_1.time_ < var_708_5 + var_708_15 then
				arg_705_1.typewritter.percent = (arg_705_1.time_ - var_708_5) / var_708_15

				arg_705_1.typewritter:SetDirty()
			end

			if arg_705_1.time_ >= var_708_5 + var_708_15 and arg_705_1.time_ < var_708_5 + var_708_15 + arg_708_0 then
				arg_705_1.typewritter.percent = 1

				arg_705_1.typewritter:SetDirty()
				arg_705_1:ShowNextGo(true)
			end
		end
	end,
	Play123011171 = function(arg_709_0, arg_709_1)
		arg_709_1.time_ = 0
		arg_709_1.frameCnt_ = 0
		arg_709_1.state_ = "playing"
		arg_709_1.curTalkId_ = 123011171
		arg_709_1.duration_ = 5

		SetActive(arg_709_1.tipsGo_, false)

		function arg_709_1.onSingleLineFinish_()
			arg_709_1.onSingleLineUpdate_ = nil
			arg_709_1.onSingleLineFinish_ = nil
			arg_709_1.state_ = "waiting"
		end

		function arg_709_1.playNext_(arg_711_0)
			if arg_711_0 == 1 then
				arg_709_0:Play123011172(arg_709_1)
			end
		end

		function arg_709_1.onSingleLineUpdate_(arg_712_0)
			local var_712_0 = arg_709_1.actors_["1019ui_story"]
			local var_712_1 = 0

			if var_712_1 < arg_709_1.time_ and arg_709_1.time_ <= var_712_1 + arg_712_0 and arg_709_1.var_.characterEffect1019ui_story == nil then
				arg_709_1.var_.characterEffect1019ui_story = var_712_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_712_2 = 0.200000002980232

			if var_712_1 <= arg_709_1.time_ and arg_709_1.time_ < var_712_1 + var_712_2 then
				local var_712_3 = (arg_709_1.time_ - var_712_1) / var_712_2

				if arg_709_1.var_.characterEffect1019ui_story then
					local var_712_4 = Mathf.Lerp(0, 0.5, var_712_3)

					arg_709_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_709_1.var_.characterEffect1019ui_story.fillRatio = var_712_4
				end
			end

			if arg_709_1.time_ >= var_712_1 + var_712_2 and arg_709_1.time_ < var_712_1 + var_712_2 + arg_712_0 and arg_709_1.var_.characterEffect1019ui_story then
				local var_712_5 = 0.5

				arg_709_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_709_1.var_.characterEffect1019ui_story.fillRatio = var_712_5
			end

			local var_712_6 = 0
			local var_712_7 = 0.5

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

				local var_712_9 = arg_709_1:GetWordFromCfg(123011171)
				local var_712_10 = arg_709_1:FormatText(var_712_9.content)

				arg_709_1.text_.text = var_712_10

				LuaForUtil.ClearLinePrefixSymbol(arg_709_1.text_)

				local var_712_11 = 20
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
	Play123011172 = function(arg_713_0, arg_713_1)
		arg_713_1.time_ = 0
		arg_713_1.frameCnt_ = 0
		arg_713_1.state_ = "playing"
		arg_713_1.curTalkId_ = 123011172
		arg_713_1.duration_ = 5.166

		local var_713_0 = {
			zh = 4.333,
			ja = 5.166
		}
		local var_713_1 = manager.audio:GetLocalizationFlag()

		if var_713_0[var_713_1] ~= nil then
			arg_713_1.duration_ = var_713_0[var_713_1]
		end

		SetActive(arg_713_1.tipsGo_, false)

		function arg_713_1.onSingleLineFinish_()
			arg_713_1.onSingleLineUpdate_ = nil
			arg_713_1.onSingleLineFinish_ = nil
			arg_713_1.state_ = "waiting"
		end

		function arg_713_1.playNext_(arg_715_0)
			if arg_715_0 == 1 then
				arg_713_0:Play123011173(arg_713_1)
			end
		end

		function arg_713_1.onSingleLineUpdate_(arg_716_0)
			local var_716_0 = arg_713_1.actors_["1019ui_story"]
			local var_716_1 = 0

			if var_716_1 < arg_713_1.time_ and arg_713_1.time_ <= var_716_1 + arg_716_0 and arg_713_1.var_.characterEffect1019ui_story == nil then
				arg_713_1.var_.characterEffect1019ui_story = var_716_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_716_2 = 0.200000002980232

			if var_716_1 <= arg_713_1.time_ and arg_713_1.time_ < var_716_1 + var_716_2 then
				local var_716_3 = (arg_713_1.time_ - var_716_1) / var_716_2

				if arg_713_1.var_.characterEffect1019ui_story then
					arg_713_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_713_1.time_ >= var_716_1 + var_716_2 and arg_713_1.time_ < var_716_1 + var_716_2 + arg_716_0 and arg_713_1.var_.characterEffect1019ui_story then
				arg_713_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_716_4 = 0

			if var_716_4 < arg_713_1.time_ and arg_713_1.time_ <= var_716_4 + arg_716_0 then
				arg_713_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_716_5 = 0

			if var_716_5 < arg_713_1.time_ and arg_713_1.time_ <= var_716_5 + arg_716_0 then
				arg_713_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_716_6 = 0
			local var_716_7 = 0.425

			if var_716_6 < arg_713_1.time_ and arg_713_1.time_ <= var_716_6 + arg_716_0 then
				arg_713_1.talkMaxDuration = 0
				arg_713_1.dialogCg_.alpha = 1

				arg_713_1.dialog_:SetActive(true)
				SetActive(arg_713_1.leftNameGo_, true)

				local var_716_8 = arg_713_1:FormatText(StoryNameCfg[13].name)

				arg_713_1.leftNameTxt_.text = var_716_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_713_1.leftNameTxt_.transform)

				arg_713_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_713_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_713_1:RecordName(arg_713_1.leftNameTxt_.text)
				SetActive(arg_713_1.iconTrs_.gameObject, false)
				arg_713_1.callingController_:SetSelectedState("normal")

				local var_716_9 = arg_713_1:GetWordFromCfg(123011172)
				local var_716_10 = arg_713_1:FormatText(var_716_9.content)

				arg_713_1.text_.text = var_716_10

				LuaForUtil.ClearLinePrefixSymbol(arg_713_1.text_)

				local var_716_11 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011172", "story_v_out_123011.awb") ~= 0 then
					local var_716_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011172", "story_v_out_123011.awb") / 1000

					if var_716_14 + var_716_6 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_14 + var_716_6
					end

					if var_716_9.prefab_name ~= "" and arg_713_1.actors_[var_716_9.prefab_name] ~= nil then
						local var_716_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_713_1.actors_[var_716_9.prefab_name].transform, "story_v_out_123011", "123011172", "story_v_out_123011.awb")

						arg_713_1:RecordAudio("123011172", var_716_15)
						arg_713_1:RecordAudio("123011172", var_716_15)
					else
						arg_713_1:AudioAction("play", "voice", "story_v_out_123011", "123011172", "story_v_out_123011.awb")
					end

					arg_713_1:RecordHistoryTalkVoice("story_v_out_123011", "123011172", "story_v_out_123011.awb")
				end

				arg_713_1:RecordContent(arg_713_1.text_.text)
			end

			local var_716_16 = math.max(var_716_7, arg_713_1.talkMaxDuration)

			if var_716_6 <= arg_713_1.time_ and arg_713_1.time_ < var_716_6 + var_716_16 then
				arg_713_1.typewritter.percent = (arg_713_1.time_ - var_716_6) / var_716_16

				arg_713_1.typewritter:SetDirty()
			end

			if arg_713_1.time_ >= var_716_6 + var_716_16 and arg_713_1.time_ < var_716_6 + var_716_16 + arg_716_0 then
				arg_713_1.typewritter.percent = 1

				arg_713_1.typewritter:SetDirty()
				arg_713_1:ShowNextGo(true)
			end
		end
	end,
	Play123011173 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 123011173
		arg_717_1.duration_ = 5

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play123011174(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = arg_717_1.actors_["1019ui_story"]
			local var_720_1 = 0

			if var_720_1 < arg_717_1.time_ and arg_717_1.time_ <= var_720_1 + arg_720_0 and arg_717_1.var_.characterEffect1019ui_story == nil then
				arg_717_1.var_.characterEffect1019ui_story = var_720_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_720_2 = 0.200000002980232

			if var_720_1 <= arg_717_1.time_ and arg_717_1.time_ < var_720_1 + var_720_2 then
				local var_720_3 = (arg_717_1.time_ - var_720_1) / var_720_2

				if arg_717_1.var_.characterEffect1019ui_story then
					local var_720_4 = Mathf.Lerp(0, 0.5, var_720_3)

					arg_717_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_717_1.var_.characterEffect1019ui_story.fillRatio = var_720_4
				end
			end

			if arg_717_1.time_ >= var_720_1 + var_720_2 and arg_717_1.time_ < var_720_1 + var_720_2 + arg_720_0 and arg_717_1.var_.characterEffect1019ui_story then
				local var_720_5 = 0.5

				arg_717_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_717_1.var_.characterEffect1019ui_story.fillRatio = var_720_5
			end

			local var_720_6 = 0
			local var_720_7 = 0.6

			if var_720_6 < arg_717_1.time_ and arg_717_1.time_ <= var_720_6 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0
				arg_717_1.dialogCg_.alpha = 1

				arg_717_1.dialog_:SetActive(true)
				SetActive(arg_717_1.leftNameGo_, true)

				local var_720_8 = arg_717_1:FormatText(StoryNameCfg[7].name)

				arg_717_1.leftNameTxt_.text = var_720_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_717_1.leftNameTxt_.transform)

				arg_717_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_717_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_717_1:RecordName(arg_717_1.leftNameTxt_.text)
				SetActive(arg_717_1.iconTrs_.gameObject, false)
				arg_717_1.callingController_:SetSelectedState("normal")

				local var_720_9 = arg_717_1:GetWordFromCfg(123011173)
				local var_720_10 = arg_717_1:FormatText(var_720_9.content)

				arg_717_1.text_.text = var_720_10

				LuaForUtil.ClearLinePrefixSymbol(arg_717_1.text_)

				local var_720_11 = 24
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
				arg_717_1:RecordContent(arg_717_1.text_.text)
			end

			local var_720_14 = math.max(var_720_7, arg_717_1.talkMaxDuration)

			if var_720_6 <= arg_717_1.time_ and arg_717_1.time_ < var_720_6 + var_720_14 then
				arg_717_1.typewritter.percent = (arg_717_1.time_ - var_720_6) / var_720_14

				arg_717_1.typewritter:SetDirty()
			end

			if arg_717_1.time_ >= var_720_6 + var_720_14 and arg_717_1.time_ < var_720_6 + var_720_14 + arg_720_0 then
				arg_717_1.typewritter.percent = 1

				arg_717_1.typewritter:SetDirty()
				arg_717_1:ShowNextGo(true)
			end
		end
	end,
	Play123011174 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 123011174
		arg_721_1.duration_ = 2.5

		local var_721_0 = {
			zh = 2.5,
			ja = 1.999999999999
		}
		local var_721_1 = manager.audio:GetLocalizationFlag()

		if var_721_0[var_721_1] ~= nil then
			arg_721_1.duration_ = var_721_0[var_721_1]
		end

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play123011175(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = arg_721_1.actors_["1019ui_story"]
			local var_724_1 = 0

			if var_724_1 < arg_721_1.time_ and arg_721_1.time_ <= var_724_1 + arg_724_0 and arg_721_1.var_.characterEffect1019ui_story == nil then
				arg_721_1.var_.characterEffect1019ui_story = var_724_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_724_2 = 0.200000002980232

			if var_724_1 <= arg_721_1.time_ and arg_721_1.time_ < var_724_1 + var_724_2 then
				local var_724_3 = (arg_721_1.time_ - var_724_1) / var_724_2

				if arg_721_1.var_.characterEffect1019ui_story then
					arg_721_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_721_1.time_ >= var_724_1 + var_724_2 and arg_721_1.time_ < var_724_1 + var_724_2 + arg_724_0 and arg_721_1.var_.characterEffect1019ui_story then
				arg_721_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_724_4 = 0

			if var_724_4 < arg_721_1.time_ and arg_721_1.time_ <= var_724_4 + arg_724_0 then
				arg_721_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_724_5 = 0
			local var_724_6 = 0.15

			if var_724_5 < arg_721_1.time_ and arg_721_1.time_ <= var_724_5 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0
				arg_721_1.dialogCg_.alpha = 1

				arg_721_1.dialog_:SetActive(true)
				SetActive(arg_721_1.leftNameGo_, true)

				local var_724_7 = arg_721_1:FormatText(StoryNameCfg[13].name)

				arg_721_1.leftNameTxt_.text = var_724_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_721_1.leftNameTxt_.transform)

				arg_721_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_721_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_721_1:RecordName(arg_721_1.leftNameTxt_.text)
				SetActive(arg_721_1.iconTrs_.gameObject, false)
				arg_721_1.callingController_:SetSelectedState("normal")

				local var_724_8 = arg_721_1:GetWordFromCfg(123011174)
				local var_724_9 = arg_721_1:FormatText(var_724_8.content)

				arg_721_1.text_.text = var_724_9

				LuaForUtil.ClearLinePrefixSymbol(arg_721_1.text_)

				local var_724_10 = 6
				local var_724_11 = utf8.len(var_724_9)
				local var_724_12 = var_724_10 <= 0 and var_724_6 or var_724_6 * (var_724_11 / var_724_10)

				if var_724_12 > 0 and var_724_6 < var_724_12 then
					arg_721_1.talkMaxDuration = var_724_12

					if var_724_12 + var_724_5 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_12 + var_724_5
					end
				end

				arg_721_1.text_.text = var_724_9
				arg_721_1.typewritter.percent = 0

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011174", "story_v_out_123011.awb") ~= 0 then
					local var_724_13 = manager.audio:GetVoiceLength("story_v_out_123011", "123011174", "story_v_out_123011.awb") / 1000

					if var_724_13 + var_724_5 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_13 + var_724_5
					end

					if var_724_8.prefab_name ~= "" and arg_721_1.actors_[var_724_8.prefab_name] ~= nil then
						local var_724_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_721_1.actors_[var_724_8.prefab_name].transform, "story_v_out_123011", "123011174", "story_v_out_123011.awb")

						arg_721_1:RecordAudio("123011174", var_724_14)
						arg_721_1:RecordAudio("123011174", var_724_14)
					else
						arg_721_1:AudioAction("play", "voice", "story_v_out_123011", "123011174", "story_v_out_123011.awb")
					end

					arg_721_1:RecordHistoryTalkVoice("story_v_out_123011", "123011174", "story_v_out_123011.awb")
				end

				arg_721_1:RecordContent(arg_721_1.text_.text)
			end

			local var_724_15 = math.max(var_724_6, arg_721_1.talkMaxDuration)

			if var_724_5 <= arg_721_1.time_ and arg_721_1.time_ < var_724_5 + var_724_15 then
				arg_721_1.typewritter.percent = (arg_721_1.time_ - var_724_5) / var_724_15

				arg_721_1.typewritter:SetDirty()
			end

			if arg_721_1.time_ >= var_724_5 + var_724_15 and arg_721_1.time_ < var_724_5 + var_724_15 + arg_724_0 then
				arg_721_1.typewritter.percent = 1

				arg_721_1.typewritter:SetDirty()
				arg_721_1:ShowNextGo(true)
			end
		end
	end,
	Play123011175 = function(arg_725_0, arg_725_1)
		arg_725_1.time_ = 0
		arg_725_1.frameCnt_ = 0
		arg_725_1.state_ = "playing"
		arg_725_1.curTalkId_ = 123011175
		arg_725_1.duration_ = 5

		SetActive(arg_725_1.tipsGo_, false)

		function arg_725_1.onSingleLineFinish_()
			arg_725_1.onSingleLineUpdate_ = nil
			arg_725_1.onSingleLineFinish_ = nil
			arg_725_1.state_ = "waiting"
		end

		function arg_725_1.playNext_(arg_727_0)
			if arg_727_0 == 1 then
				arg_725_0:Play123011176(arg_725_1)
			end
		end

		function arg_725_1.onSingleLineUpdate_(arg_728_0)
			local var_728_0 = arg_725_1.actors_["1019ui_story"]
			local var_728_1 = 0

			if var_728_1 < arg_725_1.time_ and arg_725_1.time_ <= var_728_1 + arg_728_0 and arg_725_1.var_.characterEffect1019ui_story == nil then
				arg_725_1.var_.characterEffect1019ui_story = var_728_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_728_2 = 0.200000002980232

			if var_728_1 <= arg_725_1.time_ and arg_725_1.time_ < var_728_1 + var_728_2 then
				local var_728_3 = (arg_725_1.time_ - var_728_1) / var_728_2

				if arg_725_1.var_.characterEffect1019ui_story then
					local var_728_4 = Mathf.Lerp(0, 0.5, var_728_3)

					arg_725_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_725_1.var_.characterEffect1019ui_story.fillRatio = var_728_4
				end
			end

			if arg_725_1.time_ >= var_728_1 + var_728_2 and arg_725_1.time_ < var_728_1 + var_728_2 + arg_728_0 and arg_725_1.var_.characterEffect1019ui_story then
				local var_728_5 = 0.5

				arg_725_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_725_1.var_.characterEffect1019ui_story.fillRatio = var_728_5
			end

			local var_728_6 = 0
			local var_728_7 = 0.075

			if var_728_6 < arg_725_1.time_ and arg_725_1.time_ <= var_728_6 + arg_728_0 then
				arg_725_1.talkMaxDuration = 0
				arg_725_1.dialogCg_.alpha = 1

				arg_725_1.dialog_:SetActive(true)
				SetActive(arg_725_1.leftNameGo_, true)

				local var_728_8 = arg_725_1:FormatText(StoryNameCfg[7].name)

				arg_725_1.leftNameTxt_.text = var_728_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_725_1.leftNameTxt_.transform)

				arg_725_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_725_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_725_1:RecordName(arg_725_1.leftNameTxt_.text)
				SetActive(arg_725_1.iconTrs_.gameObject, false)
				arg_725_1.callingController_:SetSelectedState("normal")

				local var_728_9 = arg_725_1:GetWordFromCfg(123011175)
				local var_728_10 = arg_725_1:FormatText(var_728_9.content)

				arg_725_1.text_.text = var_728_10

				LuaForUtil.ClearLinePrefixSymbol(arg_725_1.text_)

				local var_728_11 = 3
				local var_728_12 = utf8.len(var_728_10)
				local var_728_13 = var_728_11 <= 0 and var_728_7 or var_728_7 * (var_728_12 / var_728_11)

				if var_728_13 > 0 and var_728_7 < var_728_13 then
					arg_725_1.talkMaxDuration = var_728_13

					if var_728_13 + var_728_6 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_13 + var_728_6
					end
				end

				arg_725_1.text_.text = var_728_10
				arg_725_1.typewritter.percent = 0

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(false)
				arg_725_1:RecordContent(arg_725_1.text_.text)
			end

			local var_728_14 = math.max(var_728_7, arg_725_1.talkMaxDuration)

			if var_728_6 <= arg_725_1.time_ and arg_725_1.time_ < var_728_6 + var_728_14 then
				arg_725_1.typewritter.percent = (arg_725_1.time_ - var_728_6) / var_728_14

				arg_725_1.typewritter:SetDirty()
			end

			if arg_725_1.time_ >= var_728_6 + var_728_14 and arg_725_1.time_ < var_728_6 + var_728_14 + arg_728_0 then
				arg_725_1.typewritter.percent = 1

				arg_725_1.typewritter:SetDirty()
				arg_725_1:ShowNextGo(true)
			end
		end
	end,
	Play123011176 = function(arg_729_0, arg_729_1)
		arg_729_1.time_ = 0
		arg_729_1.frameCnt_ = 0
		arg_729_1.state_ = "playing"
		arg_729_1.curTalkId_ = 123011176
		arg_729_1.duration_ = 9

		SetActive(arg_729_1.tipsGo_, false)

		function arg_729_1.onSingleLineFinish_()
			arg_729_1.onSingleLineUpdate_ = nil
			arg_729_1.onSingleLineFinish_ = nil
			arg_729_1.state_ = "waiting"
		end

		function arg_729_1.playNext_(arg_731_0)
			if arg_731_0 == 1 then
				arg_729_0:Play123011177(arg_729_1)
			end
		end

		function arg_729_1.onSingleLineUpdate_(arg_732_0)
			local var_732_0 = 2

			if var_732_0 < arg_729_1.time_ and arg_729_1.time_ <= var_732_0 + arg_732_0 then
				local var_732_1 = manager.ui.mainCamera.transform.localPosition
				local var_732_2 = Vector3.New(0, 0, 10) + Vector3.New(var_732_1.x, var_732_1.y, 0)
				local var_732_3 = arg_729_1.bgs_.STblack

				var_732_3.transform.localPosition = var_732_2
				var_732_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_732_4 = var_732_3:GetComponent("SpriteRenderer")

				if var_732_4 and var_732_4.sprite then
					local var_732_5 = (var_732_3.transform.localPosition - var_732_1).z
					local var_732_6 = manager.ui.mainCameraCom_
					local var_732_7 = 2 * var_732_5 * Mathf.Tan(var_732_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_732_8 = var_732_7 * var_732_6.aspect
					local var_732_9 = var_732_4.sprite.bounds.size.x
					local var_732_10 = var_732_4.sprite.bounds.size.y
					local var_732_11 = var_732_8 / var_732_9
					local var_732_12 = var_732_7 / var_732_10
					local var_732_13 = var_732_12 < var_732_11 and var_732_11 or var_732_12

					var_732_3.transform.localScale = Vector3.New(var_732_13, var_732_13, 0)
				end

				for iter_732_0, iter_732_1 in pairs(arg_729_1.bgs_) do
					if iter_732_0 ~= "STblack" then
						iter_732_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_732_14 = 0

			if var_732_14 < arg_729_1.time_ and arg_729_1.time_ <= var_732_14 + arg_732_0 then
				arg_729_1.mask_.enabled = true
				arg_729_1.mask_.raycastTarget = true

				arg_729_1:SetGaussion(false)
			end

			local var_732_15 = 2

			if var_732_14 <= arg_729_1.time_ and arg_729_1.time_ < var_732_14 + var_732_15 then
				local var_732_16 = (arg_729_1.time_ - var_732_14) / var_732_15
				local var_732_17 = Color.New(0, 0, 0)

				var_732_17.a = Mathf.Lerp(0, 1, var_732_16)
				arg_729_1.mask_.color = var_732_17
			end

			if arg_729_1.time_ >= var_732_14 + var_732_15 and arg_729_1.time_ < var_732_14 + var_732_15 + arg_732_0 then
				local var_732_18 = Color.New(0, 0, 0)

				var_732_18.a = 1
				arg_729_1.mask_.color = var_732_18
			end

			local var_732_19 = 2

			if var_732_19 < arg_729_1.time_ and arg_729_1.time_ <= var_732_19 + arg_732_0 then
				arg_729_1.mask_.enabled = true
				arg_729_1.mask_.raycastTarget = true

				arg_729_1:SetGaussion(false)
			end

			local var_732_20 = 2

			if var_732_19 <= arg_729_1.time_ and arg_729_1.time_ < var_732_19 + var_732_20 then
				local var_732_21 = (arg_729_1.time_ - var_732_19) / var_732_20
				local var_732_22 = Color.New(0, 0, 0)

				var_732_22.a = Mathf.Lerp(1, 0, var_732_21)
				arg_729_1.mask_.color = var_732_22
			end

			if arg_729_1.time_ >= var_732_19 + var_732_20 and arg_729_1.time_ < var_732_19 + var_732_20 + arg_732_0 then
				local var_732_23 = Color.New(0, 0, 0)
				local var_732_24 = 0

				arg_729_1.mask_.enabled = false
				var_732_23.a = var_732_24
				arg_729_1.mask_.color = var_732_23
			end

			local var_732_25 = arg_729_1.actors_["1019ui_story"].transform
			local var_732_26 = 1.96599999815226

			if var_732_26 < arg_729_1.time_ and arg_729_1.time_ <= var_732_26 + arg_732_0 then
				arg_729_1.var_.moveOldPos1019ui_story = var_732_25.localPosition
			end

			local var_732_27 = 0.001

			if var_732_26 <= arg_729_1.time_ and arg_729_1.time_ < var_732_26 + var_732_27 then
				local var_732_28 = (arg_729_1.time_ - var_732_26) / var_732_27
				local var_732_29 = Vector3.New(0, 100, 0)

				var_732_25.localPosition = Vector3.Lerp(arg_729_1.var_.moveOldPos1019ui_story, var_732_29, var_732_28)

				local var_732_30 = manager.ui.mainCamera.transform.position - var_732_25.position

				var_732_25.forward = Vector3.New(var_732_30.x, var_732_30.y, var_732_30.z)

				local var_732_31 = var_732_25.localEulerAngles

				var_732_31.z = 0
				var_732_31.x = 0
				var_732_25.localEulerAngles = var_732_31
			end

			if arg_729_1.time_ >= var_732_26 + var_732_27 and arg_729_1.time_ < var_732_26 + var_732_27 + arg_732_0 then
				var_732_25.localPosition = Vector3.New(0, 100, 0)

				local var_732_32 = manager.ui.mainCamera.transform.position - var_732_25.position

				var_732_25.forward = Vector3.New(var_732_32.x, var_732_32.y, var_732_32.z)

				local var_732_33 = var_732_25.localEulerAngles

				var_732_33.z = 0
				var_732_33.x = 0
				var_732_25.localEulerAngles = var_732_33
			end

			local var_732_34 = arg_729_1.actors_["1019ui_story"]
			local var_732_35 = 1.96599999815226

			if var_732_35 < arg_729_1.time_ and arg_729_1.time_ <= var_732_35 + arg_732_0 and arg_729_1.var_.characterEffect1019ui_story == nil then
				arg_729_1.var_.characterEffect1019ui_story = var_732_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_732_36 = 0.034000001847744

			if var_732_35 <= arg_729_1.time_ and arg_729_1.time_ < var_732_35 + var_732_36 then
				local var_732_37 = (arg_729_1.time_ - var_732_35) / var_732_36

				if arg_729_1.var_.characterEffect1019ui_story then
					local var_732_38 = Mathf.Lerp(0, 0.5, var_732_37)

					arg_729_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_729_1.var_.characterEffect1019ui_story.fillRatio = var_732_38
				end
			end

			if arg_729_1.time_ >= var_732_35 + var_732_36 and arg_729_1.time_ < var_732_35 + var_732_36 + arg_732_0 and arg_729_1.var_.characterEffect1019ui_story then
				local var_732_39 = 0.5

				arg_729_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_729_1.var_.characterEffect1019ui_story.fillRatio = var_732_39
			end

			if arg_729_1.frameCnt_ <= 1 then
				arg_729_1.dialog_:SetActive(false)
			end

			local var_732_40 = 4
			local var_732_41 = 0.75

			if var_732_40 < arg_729_1.time_ and arg_729_1.time_ <= var_732_40 + arg_732_0 then
				arg_729_1.talkMaxDuration = 0

				arg_729_1.dialog_:SetActive(true)

				local var_732_42 = LeanTween.value(arg_729_1.dialog_, 0, 1, 0.3)

				var_732_42:setOnUpdate(LuaHelper.FloatAction(function(arg_733_0)
					arg_729_1.dialogCg_.alpha = arg_733_0
				end))
				var_732_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_729_1.dialog_)
					var_732_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_729_1.duration_ = arg_729_1.duration_ + 0.3

				SetActive(arg_729_1.leftNameGo_, false)

				arg_729_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_729_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_729_1:RecordName(arg_729_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_729_1.iconTrs_.gameObject, false)
				arg_729_1.callingController_:SetSelectedState("normal")

				local var_732_43 = arg_729_1:GetWordFromCfg(123011176)
				local var_732_44 = arg_729_1:FormatText(var_732_43.content)

				arg_729_1.text_.text = var_732_44

				LuaForUtil.ClearLinePrefixSymbol(arg_729_1.text_)

				local var_732_45 = 30
				local var_732_46 = utf8.len(var_732_44)
				local var_732_47 = var_732_45 <= 0 and var_732_41 or var_732_41 * (var_732_46 / var_732_45)

				if var_732_47 > 0 and var_732_41 < var_732_47 then
					arg_729_1.talkMaxDuration = var_732_47
					var_732_40 = var_732_40 + 0.3

					if var_732_47 + var_732_40 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_47 + var_732_40
					end
				end

				arg_729_1.text_.text = var_732_44
				arg_729_1.typewritter.percent = 0

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(false)
				arg_729_1:RecordContent(arg_729_1.text_.text)
			end

			local var_732_48 = var_732_40 + 0.3
			local var_732_49 = math.max(var_732_41, arg_729_1.talkMaxDuration)

			if var_732_48 <= arg_729_1.time_ and arg_729_1.time_ < var_732_48 + var_732_49 then
				arg_729_1.typewritter.percent = (arg_729_1.time_ - var_732_48) / var_732_49

				arg_729_1.typewritter:SetDirty()
			end

			if arg_729_1.time_ >= var_732_48 + var_732_49 and arg_729_1.time_ < var_732_48 + var_732_49 + arg_732_0 then
				arg_729_1.typewritter.percent = 1

				arg_729_1.typewritter:SetDirty()
				arg_729_1:ShowNextGo(true)
			end
		end
	end,
	Play123011177 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 123011177
		arg_735_1.duration_ = 6.999999999999

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play123011178(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = "BA0102"

			if arg_735_1.bgs_[var_738_0] == nil then
				local var_738_1 = Object.Instantiate(arg_735_1.paintGo_)

				var_738_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_738_0)
				var_738_1.name = var_738_0
				var_738_1.transform.parent = arg_735_1.stage_.transform
				var_738_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_735_1.bgs_[var_738_0] = var_738_1
			end

			local var_738_2 = 0

			if var_738_2 < arg_735_1.time_ and arg_735_1.time_ <= var_738_2 + arg_738_0 then
				local var_738_3 = manager.ui.mainCamera.transform.localPosition
				local var_738_4 = Vector3.New(0, 0, 10) + Vector3.New(var_738_3.x, var_738_3.y, 0)
				local var_738_5 = arg_735_1.bgs_.BA0102

				var_738_5.transform.localPosition = var_738_4
				var_738_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_738_6 = var_738_5:GetComponent("SpriteRenderer")

				if var_738_6 and var_738_6.sprite then
					local var_738_7 = (var_738_5.transform.localPosition - var_738_3).z
					local var_738_8 = manager.ui.mainCameraCom_
					local var_738_9 = 2 * var_738_7 * Mathf.Tan(var_738_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_738_10 = var_738_9 * var_738_8.aspect
					local var_738_11 = var_738_6.sprite.bounds.size.x
					local var_738_12 = var_738_6.sprite.bounds.size.y
					local var_738_13 = var_738_10 / var_738_11
					local var_738_14 = var_738_9 / var_738_12
					local var_738_15 = var_738_14 < var_738_13 and var_738_13 or var_738_14

					var_738_5.transform.localScale = Vector3.New(var_738_15, var_738_15, 0)
				end

				for iter_738_0, iter_738_1 in pairs(arg_735_1.bgs_) do
					if iter_738_0 ~= "BA0102" then
						iter_738_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_738_16 = 0

			if var_738_16 < arg_735_1.time_ and arg_735_1.time_ <= var_738_16 + arg_738_0 then
				arg_735_1.mask_.enabled = true
				arg_735_1.mask_.raycastTarget = true

				arg_735_1:SetGaussion(false)
			end

			local var_738_17 = 2

			if var_738_16 <= arg_735_1.time_ and arg_735_1.time_ < var_738_16 + var_738_17 then
				local var_738_18 = (arg_735_1.time_ - var_738_16) / var_738_17
				local var_738_19 = Color.New(0, 0, 0)

				var_738_19.a = Mathf.Lerp(1, 0, var_738_18)
				arg_735_1.mask_.color = var_738_19
			end

			if arg_735_1.time_ >= var_738_16 + var_738_17 and arg_735_1.time_ < var_738_16 + var_738_17 + arg_738_0 then
				local var_738_20 = Color.New(0, 0, 0)
				local var_738_21 = 0

				arg_735_1.mask_.enabled = false
				var_738_20.a = var_738_21
				arg_735_1.mask_.color = var_738_20
			end

			if arg_735_1.frameCnt_ <= 1 then
				arg_735_1.dialog_:SetActive(false)
			end

			local var_738_22 = 1.999999999999
			local var_738_23 = 1.55

			if var_738_22 < arg_735_1.time_ and arg_735_1.time_ <= var_738_22 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0

				arg_735_1.dialog_:SetActive(true)

				local var_738_24 = LeanTween.value(arg_735_1.dialog_, 0, 1, 0.3)

				var_738_24:setOnUpdate(LuaHelper.FloatAction(function(arg_739_0)
					arg_735_1.dialogCg_.alpha = arg_739_0
				end))
				var_738_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_735_1.dialog_)
					var_738_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_735_1.duration_ = arg_735_1.duration_ + 0.3

				SetActive(arg_735_1.leftNameGo_, false)

				arg_735_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_735_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_735_1:RecordName(arg_735_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_735_1.iconTrs_.gameObject, false)
				arg_735_1.callingController_:SetSelectedState("normal")

				local var_738_25 = arg_735_1:GetWordFromCfg(123011177)
				local var_738_26 = arg_735_1:FormatText(var_738_25.content)

				arg_735_1.text_.text = var_738_26

				LuaForUtil.ClearLinePrefixSymbol(arg_735_1.text_)

				local var_738_27 = 62
				local var_738_28 = utf8.len(var_738_26)
				local var_738_29 = var_738_27 <= 0 and var_738_23 or var_738_23 * (var_738_28 / var_738_27)

				if var_738_29 > 0 and var_738_23 < var_738_29 then
					arg_735_1.talkMaxDuration = var_738_29
					var_738_22 = var_738_22 + 0.3

					if var_738_29 + var_738_22 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_29 + var_738_22
					end
				end

				arg_735_1.text_.text = var_738_26
				arg_735_1.typewritter.percent = 0

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(false)
				arg_735_1:RecordContent(arg_735_1.text_.text)
			end

			local var_738_30 = var_738_22 + 0.3
			local var_738_31 = math.max(var_738_23, arg_735_1.talkMaxDuration)

			if var_738_30 <= arg_735_1.time_ and arg_735_1.time_ < var_738_30 + var_738_31 then
				arg_735_1.typewritter.percent = (arg_735_1.time_ - var_738_30) / var_738_31

				arg_735_1.typewritter:SetDirty()
			end

			if arg_735_1.time_ >= var_738_30 + var_738_31 and arg_735_1.time_ < var_738_30 + var_738_31 + arg_738_0 then
				arg_735_1.typewritter.percent = 1

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(true)
			end
		end
	end,
	Play123011178 = function(arg_741_0, arg_741_1)
		arg_741_1.time_ = 0
		arg_741_1.frameCnt_ = 0
		arg_741_1.state_ = "playing"
		arg_741_1.curTalkId_ = 123011178
		arg_741_1.duration_ = 4.966

		local var_741_0 = {
			zh = 3.133,
			ja = 4.966
		}
		local var_741_1 = manager.audio:GetLocalizationFlag()

		if var_741_0[var_741_1] ~= nil then
			arg_741_1.duration_ = var_741_0[var_741_1]
		end

		SetActive(arg_741_1.tipsGo_, false)

		function arg_741_1.onSingleLineFinish_()
			arg_741_1.onSingleLineUpdate_ = nil
			arg_741_1.onSingleLineFinish_ = nil
			arg_741_1.state_ = "waiting"
		end

		function arg_741_1.playNext_(arg_743_0)
			if arg_743_0 == 1 then
				arg_741_0:Play123011179(arg_741_1)
			end
		end

		function arg_741_1.onSingleLineUpdate_(arg_744_0)
			local var_744_0 = 0
			local var_744_1 = 0.375

			if var_744_0 < arg_741_1.time_ and arg_741_1.time_ <= var_744_0 + arg_744_0 then
				arg_741_1.talkMaxDuration = 0
				arg_741_1.dialogCg_.alpha = 1

				arg_741_1.dialog_:SetActive(true)
				SetActive(arg_741_1.leftNameGo_, true)

				local var_744_2 = arg_741_1:FormatText(StoryNameCfg[13].name)

				arg_741_1.leftNameTxt_.text = var_744_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_741_1.leftNameTxt_.transform)

				arg_741_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_741_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_741_1:RecordName(arg_741_1.leftNameTxt_.text)
				SetActive(arg_741_1.iconTrs_.gameObject, true)
				arg_741_1.iconController_:SetSelectedState("hero")

				arg_741_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_741_1.callingController_:SetSelectedState("normal")

				local var_744_3 = arg_741_1:GetWordFromCfg(123011178)
				local var_744_4 = arg_741_1:FormatText(var_744_3.content)

				arg_741_1.text_.text = var_744_4

				LuaForUtil.ClearLinePrefixSymbol(arg_741_1.text_)

				local var_744_5 = 15
				local var_744_6 = utf8.len(var_744_4)
				local var_744_7 = var_744_5 <= 0 and var_744_1 or var_744_1 * (var_744_6 / var_744_5)

				if var_744_7 > 0 and var_744_1 < var_744_7 then
					arg_741_1.talkMaxDuration = var_744_7

					if var_744_7 + var_744_0 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_7 + var_744_0
					end
				end

				arg_741_1.text_.text = var_744_4
				arg_741_1.typewritter.percent = 0

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011178", "story_v_out_123011.awb") ~= 0 then
					local var_744_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011178", "story_v_out_123011.awb") / 1000

					if var_744_8 + var_744_0 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_8 + var_744_0
					end

					if var_744_3.prefab_name ~= "" and arg_741_1.actors_[var_744_3.prefab_name] ~= nil then
						local var_744_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_741_1.actors_[var_744_3.prefab_name].transform, "story_v_out_123011", "123011178", "story_v_out_123011.awb")

						arg_741_1:RecordAudio("123011178", var_744_9)
						arg_741_1:RecordAudio("123011178", var_744_9)
					else
						arg_741_1:AudioAction("play", "voice", "story_v_out_123011", "123011178", "story_v_out_123011.awb")
					end

					arg_741_1:RecordHistoryTalkVoice("story_v_out_123011", "123011178", "story_v_out_123011.awb")
				end

				arg_741_1:RecordContent(arg_741_1.text_.text)
			end

			local var_744_10 = math.max(var_744_1, arg_741_1.talkMaxDuration)

			if var_744_0 <= arg_741_1.time_ and arg_741_1.time_ < var_744_0 + var_744_10 then
				arg_741_1.typewritter.percent = (arg_741_1.time_ - var_744_0) / var_744_10

				arg_741_1.typewritter:SetDirty()
			end

			if arg_741_1.time_ >= var_744_0 + var_744_10 and arg_741_1.time_ < var_744_0 + var_744_10 + arg_744_0 then
				arg_741_1.typewritter.percent = 1

				arg_741_1.typewritter:SetDirty()
				arg_741_1:ShowNextGo(true)
			end
		end
	end,
	Play123011179 = function(arg_745_0, arg_745_1)
		arg_745_1.time_ = 0
		arg_745_1.frameCnt_ = 0
		arg_745_1.state_ = "playing"
		arg_745_1.curTalkId_ = 123011179
		arg_745_1.duration_ = 2

		local var_745_0 = {
			zh = 1.1,
			ja = 2
		}
		local var_745_1 = manager.audio:GetLocalizationFlag()

		if var_745_0[var_745_1] ~= nil then
			arg_745_1.duration_ = var_745_0[var_745_1]
		end

		SetActive(arg_745_1.tipsGo_, false)

		function arg_745_1.onSingleLineFinish_()
			arg_745_1.onSingleLineUpdate_ = nil
			arg_745_1.onSingleLineFinish_ = nil
			arg_745_1.state_ = "waiting"
		end

		function arg_745_1.playNext_(arg_747_0)
			if arg_747_0 == 1 then
				arg_745_0:Play123011180(arg_745_1)
			end
		end

		function arg_745_1.onSingleLineUpdate_(arg_748_0)
			local var_748_0 = 0
			local var_748_1 = 0.125

			if var_748_0 < arg_745_1.time_ and arg_745_1.time_ <= var_748_0 + arg_748_0 then
				arg_745_1.talkMaxDuration = 0
				arg_745_1.dialogCg_.alpha = 1

				arg_745_1.dialog_:SetActive(true)
				SetActive(arg_745_1.leftNameGo_, true)

				local var_748_2 = arg_745_1:FormatText(StoryNameCfg[13].name)

				arg_745_1.leftNameTxt_.text = var_748_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_745_1.leftNameTxt_.transform)

				arg_745_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_745_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_745_1:RecordName(arg_745_1.leftNameTxt_.text)
				SetActive(arg_745_1.iconTrs_.gameObject, true)
				arg_745_1.iconController_:SetSelectedState("hero")

				arg_745_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_745_1.callingController_:SetSelectedState("normal")

				local var_748_3 = arg_745_1:GetWordFromCfg(123011179)
				local var_748_4 = arg_745_1:FormatText(var_748_3.content)

				arg_745_1.text_.text = var_748_4

				LuaForUtil.ClearLinePrefixSymbol(arg_745_1.text_)

				local var_748_5 = 5
				local var_748_6 = utf8.len(var_748_4)
				local var_748_7 = var_748_5 <= 0 and var_748_1 or var_748_1 * (var_748_6 / var_748_5)

				if var_748_7 > 0 and var_748_1 < var_748_7 then
					arg_745_1.talkMaxDuration = var_748_7

					if var_748_7 + var_748_0 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_7 + var_748_0
					end
				end

				arg_745_1.text_.text = var_748_4
				arg_745_1.typewritter.percent = 0

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011179", "story_v_out_123011.awb") ~= 0 then
					local var_748_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011179", "story_v_out_123011.awb") / 1000

					if var_748_8 + var_748_0 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_8 + var_748_0
					end

					if var_748_3.prefab_name ~= "" and arg_745_1.actors_[var_748_3.prefab_name] ~= nil then
						local var_748_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_745_1.actors_[var_748_3.prefab_name].transform, "story_v_out_123011", "123011179", "story_v_out_123011.awb")

						arg_745_1:RecordAudio("123011179", var_748_9)
						arg_745_1:RecordAudio("123011179", var_748_9)
					else
						arg_745_1:AudioAction("play", "voice", "story_v_out_123011", "123011179", "story_v_out_123011.awb")
					end

					arg_745_1:RecordHistoryTalkVoice("story_v_out_123011", "123011179", "story_v_out_123011.awb")
				end

				arg_745_1:RecordContent(arg_745_1.text_.text)
			end

			local var_748_10 = math.max(var_748_1, arg_745_1.talkMaxDuration)

			if var_748_0 <= arg_745_1.time_ and arg_745_1.time_ < var_748_0 + var_748_10 then
				arg_745_1.typewritter.percent = (arg_745_1.time_ - var_748_0) / var_748_10

				arg_745_1.typewritter:SetDirty()
			end

			if arg_745_1.time_ >= var_748_0 + var_748_10 and arg_745_1.time_ < var_748_0 + var_748_10 + arg_748_0 then
				arg_745_1.typewritter.percent = 1

				arg_745_1.typewritter:SetDirty()
				arg_745_1:ShowNextGo(true)
			end
		end
	end,
	Play123011180 = function(arg_749_0, arg_749_1)
		arg_749_1.time_ = 0
		arg_749_1.frameCnt_ = 0
		arg_749_1.state_ = "playing"
		arg_749_1.curTalkId_ = 123011180
		arg_749_1.duration_ = 2.066

		local var_749_0 = {
			zh = 1.666,
			ja = 2.066
		}
		local var_749_1 = manager.audio:GetLocalizationFlag()

		if var_749_0[var_749_1] ~= nil then
			arg_749_1.duration_ = var_749_0[var_749_1]
		end

		SetActive(arg_749_1.tipsGo_, false)

		function arg_749_1.onSingleLineFinish_()
			arg_749_1.onSingleLineUpdate_ = nil
			arg_749_1.onSingleLineFinish_ = nil
			arg_749_1.state_ = "waiting"
		end

		function arg_749_1.playNext_(arg_751_0)
			if arg_751_0 == 1 then
				arg_749_0:Play123011181(arg_749_1)
			end
		end

		function arg_749_1.onSingleLineUpdate_(arg_752_0)
			local var_752_0 = 0
			local var_752_1 = 0.225

			if var_752_0 < arg_749_1.time_ and arg_749_1.time_ <= var_752_0 + arg_752_0 then
				arg_749_1.talkMaxDuration = 0
				arg_749_1.dialogCg_.alpha = 1

				arg_749_1.dialog_:SetActive(true)
				SetActive(arg_749_1.leftNameGo_, true)

				local var_752_2 = arg_749_1:FormatText(StoryNameCfg[479].name)

				arg_749_1.leftNameTxt_.text = var_752_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_749_1.leftNameTxt_.transform)

				arg_749_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_749_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_749_1:RecordName(arg_749_1.leftNameTxt_.text)
				SetActive(arg_749_1.iconTrs_.gameObject, false)
				arg_749_1.callingController_:SetSelectedState("normal")

				local var_752_3 = arg_749_1:GetWordFromCfg(123011180)
				local var_752_4 = arg_749_1:FormatText(var_752_3.content)

				arg_749_1.text_.text = var_752_4

				LuaForUtil.ClearLinePrefixSymbol(arg_749_1.text_)

				local var_752_5 = 9
				local var_752_6 = utf8.len(var_752_4)
				local var_752_7 = var_752_5 <= 0 and var_752_1 or var_752_1 * (var_752_6 / var_752_5)

				if var_752_7 > 0 and var_752_1 < var_752_7 then
					arg_749_1.talkMaxDuration = var_752_7

					if var_752_7 + var_752_0 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_7 + var_752_0
					end
				end

				arg_749_1.text_.text = var_752_4
				arg_749_1.typewritter.percent = 0

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011180", "story_v_out_123011.awb") ~= 0 then
					local var_752_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011180", "story_v_out_123011.awb") / 1000

					if var_752_8 + var_752_0 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_8 + var_752_0
					end

					if var_752_3.prefab_name ~= "" and arg_749_1.actors_[var_752_3.prefab_name] ~= nil then
						local var_752_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_749_1.actors_[var_752_3.prefab_name].transform, "story_v_out_123011", "123011180", "story_v_out_123011.awb")

						arg_749_1:RecordAudio("123011180", var_752_9)
						arg_749_1:RecordAudio("123011180", var_752_9)
					else
						arg_749_1:AudioAction("play", "voice", "story_v_out_123011", "123011180", "story_v_out_123011.awb")
					end

					arg_749_1:RecordHistoryTalkVoice("story_v_out_123011", "123011180", "story_v_out_123011.awb")
				end

				arg_749_1:RecordContent(arg_749_1.text_.text)
			end

			local var_752_10 = math.max(var_752_1, arg_749_1.talkMaxDuration)

			if var_752_0 <= arg_749_1.time_ and arg_749_1.time_ < var_752_0 + var_752_10 then
				arg_749_1.typewritter.percent = (arg_749_1.time_ - var_752_0) / var_752_10

				arg_749_1.typewritter:SetDirty()
			end

			if arg_749_1.time_ >= var_752_0 + var_752_10 and arg_749_1.time_ < var_752_0 + var_752_10 + arg_752_0 then
				arg_749_1.typewritter.percent = 1

				arg_749_1.typewritter:SetDirty()
				arg_749_1:ShowNextGo(true)
			end
		end
	end,
	Play123011181 = function(arg_753_0, arg_753_1)
		arg_753_1.time_ = 0
		arg_753_1.frameCnt_ = 0
		arg_753_1.state_ = "playing"
		arg_753_1.curTalkId_ = 123011181
		arg_753_1.duration_ = 5

		SetActive(arg_753_1.tipsGo_, false)

		function arg_753_1.onSingleLineFinish_()
			arg_753_1.onSingleLineUpdate_ = nil
			arg_753_1.onSingleLineFinish_ = nil
			arg_753_1.state_ = "waiting"
		end

		function arg_753_1.playNext_(arg_755_0)
			if arg_755_0 == 1 then
				arg_753_0:Play123011182(arg_753_1)
			end
		end

		function arg_753_1.onSingleLineUpdate_(arg_756_0)
			local var_756_0 = 0
			local var_756_1 = 0.125

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

				local var_756_3 = arg_753_1:GetWordFromCfg(123011181)
				local var_756_4 = arg_753_1:FormatText(var_756_3.content)

				arg_753_1.text_.text = var_756_4

				LuaForUtil.ClearLinePrefixSymbol(arg_753_1.text_)

				local var_756_5 = 5
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
	Play123011182 = function(arg_757_0, arg_757_1)
		arg_757_1.time_ = 0
		arg_757_1.frameCnt_ = 0
		arg_757_1.state_ = "playing"
		arg_757_1.curTalkId_ = 123011182
		arg_757_1.duration_ = 5.533

		local var_757_0 = {
			zh = 5.533,
			ja = 4.5
		}
		local var_757_1 = manager.audio:GetLocalizationFlag()

		if var_757_0[var_757_1] ~= nil then
			arg_757_1.duration_ = var_757_0[var_757_1]
		end

		SetActive(arg_757_1.tipsGo_, false)

		function arg_757_1.onSingleLineFinish_()
			arg_757_1.onSingleLineUpdate_ = nil
			arg_757_1.onSingleLineFinish_ = nil
			arg_757_1.state_ = "waiting"
		end

		function arg_757_1.playNext_(arg_759_0)
			if arg_759_0 == 1 then
				arg_757_0:Play123011183(arg_757_1)
			end
		end

		function arg_757_1.onSingleLineUpdate_(arg_760_0)
			local var_760_0 = 0
			local var_760_1 = 0.725

			if var_760_0 < arg_757_1.time_ and arg_757_1.time_ <= var_760_0 + arg_760_0 then
				arg_757_1.talkMaxDuration = 0
				arg_757_1.dialogCg_.alpha = 1

				arg_757_1.dialog_:SetActive(true)
				SetActive(arg_757_1.leftNameGo_, true)

				local var_760_2 = arg_757_1:FormatText(StoryNameCfg[479].name)

				arg_757_1.leftNameTxt_.text = var_760_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_757_1.leftNameTxt_.transform)

				arg_757_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_757_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_757_1:RecordName(arg_757_1.leftNameTxt_.text)
				SetActive(arg_757_1.iconTrs_.gameObject, false)
				arg_757_1.callingController_:SetSelectedState("normal")

				local var_760_3 = arg_757_1:GetWordFromCfg(123011182)
				local var_760_4 = arg_757_1:FormatText(var_760_3.content)

				arg_757_1.text_.text = var_760_4

				LuaForUtil.ClearLinePrefixSymbol(arg_757_1.text_)

				local var_760_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011182", "story_v_out_123011.awb") ~= 0 then
					local var_760_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011182", "story_v_out_123011.awb") / 1000

					if var_760_8 + var_760_0 > arg_757_1.duration_ then
						arg_757_1.duration_ = var_760_8 + var_760_0
					end

					if var_760_3.prefab_name ~= "" and arg_757_1.actors_[var_760_3.prefab_name] ~= nil then
						local var_760_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_757_1.actors_[var_760_3.prefab_name].transform, "story_v_out_123011", "123011182", "story_v_out_123011.awb")

						arg_757_1:RecordAudio("123011182", var_760_9)
						arg_757_1:RecordAudio("123011182", var_760_9)
					else
						arg_757_1:AudioAction("play", "voice", "story_v_out_123011", "123011182", "story_v_out_123011.awb")
					end

					arg_757_1:RecordHistoryTalkVoice("story_v_out_123011", "123011182", "story_v_out_123011.awb")
				end

				arg_757_1:RecordContent(arg_757_1.text_.text)
			end

			local var_760_10 = math.max(var_760_1, arg_757_1.talkMaxDuration)

			if var_760_0 <= arg_757_1.time_ and arg_757_1.time_ < var_760_0 + var_760_10 then
				arg_757_1.typewritter.percent = (arg_757_1.time_ - var_760_0) / var_760_10

				arg_757_1.typewritter:SetDirty()
			end

			if arg_757_1.time_ >= var_760_0 + var_760_10 and arg_757_1.time_ < var_760_0 + var_760_10 + arg_760_0 then
				arg_757_1.typewritter.percent = 1

				arg_757_1.typewritter:SetDirty()
				arg_757_1:ShowNextGo(true)
			end
		end
	end,
	Play123011183 = function(arg_761_0, arg_761_1)
		arg_761_1.time_ = 0
		arg_761_1.frameCnt_ = 0
		arg_761_1.state_ = "playing"
		arg_761_1.curTalkId_ = 123011183
		arg_761_1.duration_ = 5

		SetActive(arg_761_1.tipsGo_, false)

		function arg_761_1.onSingleLineFinish_()
			arg_761_1.onSingleLineUpdate_ = nil
			arg_761_1.onSingleLineFinish_ = nil
			arg_761_1.state_ = "waiting"
		end

		function arg_761_1.playNext_(arg_763_0)
			if arg_763_0 == 1 then
				arg_761_0:Play123011184(arg_761_1)
			end
		end

		function arg_761_1.onSingleLineUpdate_(arg_764_0)
			local var_764_0 = 0
			local var_764_1 = 0.075

			if var_764_0 < arg_761_1.time_ and arg_761_1.time_ <= var_764_0 + arg_764_0 then
				arg_761_1.talkMaxDuration = 0
				arg_761_1.dialogCg_.alpha = 1

				arg_761_1.dialog_:SetActive(true)
				SetActive(arg_761_1.leftNameGo_, true)

				local var_764_2 = arg_761_1:FormatText(StoryNameCfg[7].name)

				arg_761_1.leftNameTxt_.text = var_764_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_761_1.leftNameTxt_.transform)

				arg_761_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_761_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_761_1:RecordName(arg_761_1.leftNameTxt_.text)
				SetActive(arg_761_1.iconTrs_.gameObject, false)
				arg_761_1.callingController_:SetSelectedState("normal")

				local var_764_3 = arg_761_1:GetWordFromCfg(123011183)
				local var_764_4 = arg_761_1:FormatText(var_764_3.content)

				arg_761_1.text_.text = var_764_4

				LuaForUtil.ClearLinePrefixSymbol(arg_761_1.text_)

				local var_764_5 = 3
				local var_764_6 = utf8.len(var_764_4)
				local var_764_7 = var_764_5 <= 0 and var_764_1 or var_764_1 * (var_764_6 / var_764_5)

				if var_764_7 > 0 and var_764_1 < var_764_7 then
					arg_761_1.talkMaxDuration = var_764_7

					if var_764_7 + var_764_0 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_7 + var_764_0
					end
				end

				arg_761_1.text_.text = var_764_4
				arg_761_1.typewritter.percent = 0

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(false)
				arg_761_1:RecordContent(arg_761_1.text_.text)
			end

			local var_764_8 = math.max(var_764_1, arg_761_1.talkMaxDuration)

			if var_764_0 <= arg_761_1.time_ and arg_761_1.time_ < var_764_0 + var_764_8 then
				arg_761_1.typewritter.percent = (arg_761_1.time_ - var_764_0) / var_764_8

				arg_761_1.typewritter:SetDirty()
			end

			if arg_761_1.time_ >= var_764_0 + var_764_8 and arg_761_1.time_ < var_764_0 + var_764_8 + arg_764_0 then
				arg_761_1.typewritter.percent = 1

				arg_761_1.typewritter:SetDirty()
				arg_761_1:ShowNextGo(true)
			end
		end
	end,
	Play123011184 = function(arg_765_0, arg_765_1)
		arg_765_1.time_ = 0
		arg_765_1.frameCnt_ = 0
		arg_765_1.state_ = "playing"
		arg_765_1.curTalkId_ = 123011184
		arg_765_1.duration_ = 11

		local var_765_0 = {
			zh = 11,
			ja = 9.6
		}
		local var_765_1 = manager.audio:GetLocalizationFlag()

		if var_765_0[var_765_1] ~= nil then
			arg_765_1.duration_ = var_765_0[var_765_1]
		end

		SetActive(arg_765_1.tipsGo_, false)

		function arg_765_1.onSingleLineFinish_()
			arg_765_1.onSingleLineUpdate_ = nil
			arg_765_1.onSingleLineFinish_ = nil
			arg_765_1.state_ = "waiting"
		end

		function arg_765_1.playNext_(arg_767_0)
			if arg_767_0 == 1 then
				arg_765_0:Play123011185(arg_765_1)
			end
		end

		function arg_765_1.onSingleLineUpdate_(arg_768_0)
			local var_768_0 = 0
			local var_768_1 = 1.35

			if var_768_0 < arg_765_1.time_ and arg_765_1.time_ <= var_768_0 + arg_768_0 then
				arg_765_1.talkMaxDuration = 0
				arg_765_1.dialogCg_.alpha = 1

				arg_765_1.dialog_:SetActive(true)
				SetActive(arg_765_1.leftNameGo_, true)

				local var_768_2 = arg_765_1:FormatText(StoryNameCfg[479].name)

				arg_765_1.leftNameTxt_.text = var_768_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_765_1.leftNameTxt_.transform)

				arg_765_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_765_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_765_1:RecordName(arg_765_1.leftNameTxt_.text)
				SetActive(arg_765_1.iconTrs_.gameObject, false)
				arg_765_1.callingController_:SetSelectedState("normal")

				local var_768_3 = arg_765_1:GetWordFromCfg(123011184)
				local var_768_4 = arg_765_1:FormatText(var_768_3.content)

				arg_765_1.text_.text = var_768_4

				LuaForUtil.ClearLinePrefixSymbol(arg_765_1.text_)

				local var_768_5 = 54
				local var_768_6 = utf8.len(var_768_4)
				local var_768_7 = var_768_5 <= 0 and var_768_1 or var_768_1 * (var_768_6 / var_768_5)

				if var_768_7 > 0 and var_768_1 < var_768_7 then
					arg_765_1.talkMaxDuration = var_768_7

					if var_768_7 + var_768_0 > arg_765_1.duration_ then
						arg_765_1.duration_ = var_768_7 + var_768_0
					end
				end

				arg_765_1.text_.text = var_768_4
				arg_765_1.typewritter.percent = 0

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011184", "story_v_out_123011.awb") ~= 0 then
					local var_768_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011184", "story_v_out_123011.awb") / 1000

					if var_768_8 + var_768_0 > arg_765_1.duration_ then
						arg_765_1.duration_ = var_768_8 + var_768_0
					end

					if var_768_3.prefab_name ~= "" and arg_765_1.actors_[var_768_3.prefab_name] ~= nil then
						local var_768_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_765_1.actors_[var_768_3.prefab_name].transform, "story_v_out_123011", "123011184", "story_v_out_123011.awb")

						arg_765_1:RecordAudio("123011184", var_768_9)
						arg_765_1:RecordAudio("123011184", var_768_9)
					else
						arg_765_1:AudioAction("play", "voice", "story_v_out_123011", "123011184", "story_v_out_123011.awb")
					end

					arg_765_1:RecordHistoryTalkVoice("story_v_out_123011", "123011184", "story_v_out_123011.awb")
				end

				arg_765_1:RecordContent(arg_765_1.text_.text)
			end

			local var_768_10 = math.max(var_768_1, arg_765_1.talkMaxDuration)

			if var_768_0 <= arg_765_1.time_ and arg_765_1.time_ < var_768_0 + var_768_10 then
				arg_765_1.typewritter.percent = (arg_765_1.time_ - var_768_0) / var_768_10

				arg_765_1.typewritter:SetDirty()
			end

			if arg_765_1.time_ >= var_768_0 + var_768_10 and arg_765_1.time_ < var_768_0 + var_768_10 + arg_768_0 then
				arg_765_1.typewritter.percent = 1

				arg_765_1.typewritter:SetDirty()
				arg_765_1:ShowNextGo(true)
			end
		end
	end,
	Play123011185 = function(arg_769_0, arg_769_1)
		arg_769_1.time_ = 0
		arg_769_1.frameCnt_ = 0
		arg_769_1.state_ = "playing"
		arg_769_1.curTalkId_ = 123011185
		arg_769_1.duration_ = 5

		SetActive(arg_769_1.tipsGo_, false)

		function arg_769_1.onSingleLineFinish_()
			arg_769_1.onSingleLineUpdate_ = nil
			arg_769_1.onSingleLineFinish_ = nil
			arg_769_1.state_ = "waiting"
		end

		function arg_769_1.playNext_(arg_771_0)
			if arg_771_0 == 1 then
				arg_769_0:Play123011186(arg_769_1)
			end
		end

		function arg_769_1.onSingleLineUpdate_(arg_772_0)
			local var_772_0 = 0
			local var_772_1 = 0.225

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

				local var_772_3 = arg_769_1:GetWordFromCfg(123011185)
				local var_772_4 = arg_769_1:FormatText(var_772_3.content)

				arg_769_1.text_.text = var_772_4

				LuaForUtil.ClearLinePrefixSymbol(arg_769_1.text_)

				local var_772_5 = 9
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
	Play123011186 = function(arg_773_0, arg_773_1)
		arg_773_1.time_ = 0
		arg_773_1.frameCnt_ = 0
		arg_773_1.state_ = "playing"
		arg_773_1.curTalkId_ = 123011186
		arg_773_1.duration_ = 4.733

		local var_773_0 = {
			zh = 4.733,
			ja = 3.933
		}
		local var_773_1 = manager.audio:GetLocalizationFlag()

		if var_773_0[var_773_1] ~= nil then
			arg_773_1.duration_ = var_773_0[var_773_1]
		end

		SetActive(arg_773_1.tipsGo_, false)

		function arg_773_1.onSingleLineFinish_()
			arg_773_1.onSingleLineUpdate_ = nil
			arg_773_1.onSingleLineFinish_ = nil
			arg_773_1.state_ = "waiting"
		end

		function arg_773_1.playNext_(arg_775_0)
			if arg_775_0 == 1 then
				arg_773_0:Play123011187(arg_773_1)
			end
		end

		function arg_773_1.onSingleLineUpdate_(arg_776_0)
			local var_776_0 = 0
			local var_776_1 = 0.45

			if var_776_0 < arg_773_1.time_ and arg_773_1.time_ <= var_776_0 + arg_776_0 then
				arg_773_1.talkMaxDuration = 0
				arg_773_1.dialogCg_.alpha = 1

				arg_773_1.dialog_:SetActive(true)
				SetActive(arg_773_1.leftNameGo_, true)

				local var_776_2 = arg_773_1:FormatText(StoryNameCfg[13].name)

				arg_773_1.leftNameTxt_.text = var_776_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_773_1.leftNameTxt_.transform)

				arg_773_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_773_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_773_1:RecordName(arg_773_1.leftNameTxt_.text)
				SetActive(arg_773_1.iconTrs_.gameObject, true)
				arg_773_1.iconController_:SetSelectedState("hero")

				arg_773_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_1")

				arg_773_1.callingController_:SetSelectedState("normal")

				local var_776_3 = arg_773_1:GetWordFromCfg(123011186)
				local var_776_4 = arg_773_1:FormatText(var_776_3.content)

				arg_773_1.text_.text = var_776_4

				LuaForUtil.ClearLinePrefixSymbol(arg_773_1.text_)

				local var_776_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011186", "story_v_out_123011.awb") ~= 0 then
					local var_776_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011186", "story_v_out_123011.awb") / 1000

					if var_776_8 + var_776_0 > arg_773_1.duration_ then
						arg_773_1.duration_ = var_776_8 + var_776_0
					end

					if var_776_3.prefab_name ~= "" and arg_773_1.actors_[var_776_3.prefab_name] ~= nil then
						local var_776_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_773_1.actors_[var_776_3.prefab_name].transform, "story_v_out_123011", "123011186", "story_v_out_123011.awb")

						arg_773_1:RecordAudio("123011186", var_776_9)
						arg_773_1:RecordAudio("123011186", var_776_9)
					else
						arg_773_1:AudioAction("play", "voice", "story_v_out_123011", "123011186", "story_v_out_123011.awb")
					end

					arg_773_1:RecordHistoryTalkVoice("story_v_out_123011", "123011186", "story_v_out_123011.awb")
				end

				arg_773_1:RecordContent(arg_773_1.text_.text)
			end

			local var_776_10 = math.max(var_776_1, arg_773_1.talkMaxDuration)

			if var_776_0 <= arg_773_1.time_ and arg_773_1.time_ < var_776_0 + var_776_10 then
				arg_773_1.typewritter.percent = (arg_773_1.time_ - var_776_0) / var_776_10

				arg_773_1.typewritter:SetDirty()
			end

			if arg_773_1.time_ >= var_776_0 + var_776_10 and arg_773_1.time_ < var_776_0 + var_776_10 + arg_776_0 then
				arg_773_1.typewritter.percent = 1

				arg_773_1.typewritter:SetDirty()
				arg_773_1:ShowNextGo(true)
			end
		end
	end,
	Play123011187 = function(arg_777_0, arg_777_1)
		arg_777_1.time_ = 0
		arg_777_1.frameCnt_ = 0
		arg_777_1.state_ = "playing"
		arg_777_1.curTalkId_ = 123011187
		arg_777_1.duration_ = 5.866

		local var_777_0 = {
			zh = 5.566,
			ja = 5.866
		}
		local var_777_1 = manager.audio:GetLocalizationFlag()

		if var_777_0[var_777_1] ~= nil then
			arg_777_1.duration_ = var_777_0[var_777_1]
		end

		SetActive(arg_777_1.tipsGo_, false)

		function arg_777_1.onSingleLineFinish_()
			arg_777_1.onSingleLineUpdate_ = nil
			arg_777_1.onSingleLineFinish_ = nil
			arg_777_1.state_ = "waiting"
		end

		function arg_777_1.playNext_(arg_779_0)
			if arg_779_0 == 1 then
				arg_777_0:Play123011188(arg_777_1)
			end
		end

		function arg_777_1.onSingleLineUpdate_(arg_780_0)
			local var_780_0 = 0
			local var_780_1 = 0.675

			if var_780_0 < arg_777_1.time_ and arg_777_1.time_ <= var_780_0 + arg_780_0 then
				arg_777_1.talkMaxDuration = 0
				arg_777_1.dialogCg_.alpha = 1

				arg_777_1.dialog_:SetActive(true)
				SetActive(arg_777_1.leftNameGo_, true)

				local var_780_2 = arg_777_1:FormatText(StoryNameCfg[479].name)

				arg_777_1.leftNameTxt_.text = var_780_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_777_1.leftNameTxt_.transform)

				arg_777_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_777_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_777_1:RecordName(arg_777_1.leftNameTxt_.text)
				SetActive(arg_777_1.iconTrs_.gameObject, false)
				arg_777_1.callingController_:SetSelectedState("normal")

				local var_780_3 = arg_777_1:GetWordFromCfg(123011187)
				local var_780_4 = arg_777_1:FormatText(var_780_3.content)

				arg_777_1.text_.text = var_780_4

				LuaForUtil.ClearLinePrefixSymbol(arg_777_1.text_)

				local var_780_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011187", "story_v_out_123011.awb") ~= 0 then
					local var_780_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011187", "story_v_out_123011.awb") / 1000

					if var_780_8 + var_780_0 > arg_777_1.duration_ then
						arg_777_1.duration_ = var_780_8 + var_780_0
					end

					if var_780_3.prefab_name ~= "" and arg_777_1.actors_[var_780_3.prefab_name] ~= nil then
						local var_780_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_777_1.actors_[var_780_3.prefab_name].transform, "story_v_out_123011", "123011187", "story_v_out_123011.awb")

						arg_777_1:RecordAudio("123011187", var_780_9)
						arg_777_1:RecordAudio("123011187", var_780_9)
					else
						arg_777_1:AudioAction("play", "voice", "story_v_out_123011", "123011187", "story_v_out_123011.awb")
					end

					arg_777_1:RecordHistoryTalkVoice("story_v_out_123011", "123011187", "story_v_out_123011.awb")
				end

				arg_777_1:RecordContent(arg_777_1.text_.text)
			end

			local var_780_10 = math.max(var_780_1, arg_777_1.talkMaxDuration)

			if var_780_0 <= arg_777_1.time_ and arg_777_1.time_ < var_780_0 + var_780_10 then
				arg_777_1.typewritter.percent = (arg_777_1.time_ - var_780_0) / var_780_10

				arg_777_1.typewritter:SetDirty()
			end

			if arg_777_1.time_ >= var_780_0 + var_780_10 and arg_777_1.time_ < var_780_0 + var_780_10 + arg_780_0 then
				arg_777_1.typewritter.percent = 1

				arg_777_1.typewritter:SetDirty()
				arg_777_1:ShowNextGo(true)
			end
		end
	end,
	Play123011188 = function(arg_781_0, arg_781_1)
		arg_781_1.time_ = 0
		arg_781_1.frameCnt_ = 0
		arg_781_1.state_ = "playing"
		arg_781_1.curTalkId_ = 123011188
		arg_781_1.duration_ = 9

		local var_781_0 = {
			zh = 8.333,
			ja = 9
		}
		local var_781_1 = manager.audio:GetLocalizationFlag()

		if var_781_0[var_781_1] ~= nil then
			arg_781_1.duration_ = var_781_0[var_781_1]
		end

		SetActive(arg_781_1.tipsGo_, false)

		function arg_781_1.onSingleLineFinish_()
			arg_781_1.onSingleLineUpdate_ = nil
			arg_781_1.onSingleLineFinish_ = nil
			arg_781_1.state_ = "waiting"
		end

		function arg_781_1.playNext_(arg_783_0)
			if arg_783_0 == 1 then
				arg_781_0:Play123011189(arg_781_1)
			end
		end

		function arg_781_1.onSingleLineUpdate_(arg_784_0)
			local var_784_0 = 0
			local var_784_1 = 1.1

			if var_784_0 < arg_781_1.time_ and arg_781_1.time_ <= var_784_0 + arg_784_0 then
				arg_781_1.talkMaxDuration = 0
				arg_781_1.dialogCg_.alpha = 1

				arg_781_1.dialog_:SetActive(true)
				SetActive(arg_781_1.leftNameGo_, true)

				local var_784_2 = arg_781_1:FormatText(StoryNameCfg[13].name)

				arg_781_1.leftNameTxt_.text = var_784_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_781_1.leftNameTxt_.transform)

				arg_781_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_781_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_781_1:RecordName(arg_781_1.leftNameTxt_.text)
				SetActive(arg_781_1.iconTrs_.gameObject, true)
				arg_781_1.iconController_:SetSelectedState("hero")

				arg_781_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_781_1.callingController_:SetSelectedState("normal")

				local var_784_3 = arg_781_1:GetWordFromCfg(123011188)
				local var_784_4 = arg_781_1:FormatText(var_784_3.content)

				arg_781_1.text_.text = var_784_4

				LuaForUtil.ClearLinePrefixSymbol(arg_781_1.text_)

				local var_784_5 = 44
				local var_784_6 = utf8.len(var_784_4)
				local var_784_7 = var_784_5 <= 0 and var_784_1 or var_784_1 * (var_784_6 / var_784_5)

				if var_784_7 > 0 and var_784_1 < var_784_7 then
					arg_781_1.talkMaxDuration = var_784_7

					if var_784_7 + var_784_0 > arg_781_1.duration_ then
						arg_781_1.duration_ = var_784_7 + var_784_0
					end
				end

				arg_781_1.text_.text = var_784_4
				arg_781_1.typewritter.percent = 0

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011188", "story_v_out_123011.awb") ~= 0 then
					local var_784_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011188", "story_v_out_123011.awb") / 1000

					if var_784_8 + var_784_0 > arg_781_1.duration_ then
						arg_781_1.duration_ = var_784_8 + var_784_0
					end

					if var_784_3.prefab_name ~= "" and arg_781_1.actors_[var_784_3.prefab_name] ~= nil then
						local var_784_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_781_1.actors_[var_784_3.prefab_name].transform, "story_v_out_123011", "123011188", "story_v_out_123011.awb")

						arg_781_1:RecordAudio("123011188", var_784_9)
						arg_781_1:RecordAudio("123011188", var_784_9)
					else
						arg_781_1:AudioAction("play", "voice", "story_v_out_123011", "123011188", "story_v_out_123011.awb")
					end

					arg_781_1:RecordHistoryTalkVoice("story_v_out_123011", "123011188", "story_v_out_123011.awb")
				end

				arg_781_1:RecordContent(arg_781_1.text_.text)
			end

			local var_784_10 = math.max(var_784_1, arg_781_1.talkMaxDuration)

			if var_784_0 <= arg_781_1.time_ and arg_781_1.time_ < var_784_0 + var_784_10 then
				arg_781_1.typewritter.percent = (arg_781_1.time_ - var_784_0) / var_784_10

				arg_781_1.typewritter:SetDirty()
			end

			if arg_781_1.time_ >= var_784_0 + var_784_10 and arg_781_1.time_ < var_784_0 + var_784_10 + arg_784_0 then
				arg_781_1.typewritter.percent = 1

				arg_781_1.typewritter:SetDirty()
				arg_781_1:ShowNextGo(true)
			end
		end
	end,
	Play123011189 = function(arg_785_0, arg_785_1)
		arg_785_1.time_ = 0
		arg_785_1.frameCnt_ = 0
		arg_785_1.state_ = "playing"
		arg_785_1.curTalkId_ = 123011189
		arg_785_1.duration_ = 9.166

		local var_785_0 = {
			zh = 7.7,
			ja = 9.166
		}
		local var_785_1 = manager.audio:GetLocalizationFlag()

		if var_785_0[var_785_1] ~= nil then
			arg_785_1.duration_ = var_785_0[var_785_1]
		end

		SetActive(arg_785_1.tipsGo_, false)

		function arg_785_1.onSingleLineFinish_()
			arg_785_1.onSingleLineUpdate_ = nil
			arg_785_1.onSingleLineFinish_ = nil
			arg_785_1.state_ = "waiting"
		end

		function arg_785_1.playNext_(arg_787_0)
			if arg_787_0 == 1 then
				arg_785_0:Play123011190(arg_785_1)
			end
		end

		function arg_785_1.onSingleLineUpdate_(arg_788_0)
			local var_788_0 = 0
			local var_788_1 = 1.025

			if var_788_0 < arg_785_1.time_ and arg_785_1.time_ <= var_788_0 + arg_788_0 then
				arg_785_1.talkMaxDuration = 0
				arg_785_1.dialogCg_.alpha = 1

				arg_785_1.dialog_:SetActive(true)
				SetActive(arg_785_1.leftNameGo_, true)

				local var_788_2 = arg_785_1:FormatText(StoryNameCfg[479].name)

				arg_785_1.leftNameTxt_.text = var_788_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_785_1.leftNameTxt_.transform)

				arg_785_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_785_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_785_1:RecordName(arg_785_1.leftNameTxt_.text)
				SetActive(arg_785_1.iconTrs_.gameObject, false)
				arg_785_1.callingController_:SetSelectedState("normal")

				local var_788_3 = arg_785_1:GetWordFromCfg(123011189)
				local var_788_4 = arg_785_1:FormatText(var_788_3.content)

				arg_785_1.text_.text = var_788_4

				LuaForUtil.ClearLinePrefixSymbol(arg_785_1.text_)

				local var_788_5 = 41
				local var_788_6 = utf8.len(var_788_4)
				local var_788_7 = var_788_5 <= 0 and var_788_1 or var_788_1 * (var_788_6 / var_788_5)

				if var_788_7 > 0 and var_788_1 < var_788_7 then
					arg_785_1.talkMaxDuration = var_788_7

					if var_788_7 + var_788_0 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_7 + var_788_0
					end
				end

				arg_785_1.text_.text = var_788_4
				arg_785_1.typewritter.percent = 0

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011189", "story_v_out_123011.awb") ~= 0 then
					local var_788_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011189", "story_v_out_123011.awb") / 1000

					if var_788_8 + var_788_0 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_8 + var_788_0
					end

					if var_788_3.prefab_name ~= "" and arg_785_1.actors_[var_788_3.prefab_name] ~= nil then
						local var_788_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_785_1.actors_[var_788_3.prefab_name].transform, "story_v_out_123011", "123011189", "story_v_out_123011.awb")

						arg_785_1:RecordAudio("123011189", var_788_9)
						arg_785_1:RecordAudio("123011189", var_788_9)
					else
						arg_785_1:AudioAction("play", "voice", "story_v_out_123011", "123011189", "story_v_out_123011.awb")
					end

					arg_785_1:RecordHistoryTalkVoice("story_v_out_123011", "123011189", "story_v_out_123011.awb")
				end

				arg_785_1:RecordContent(arg_785_1.text_.text)
			end

			local var_788_10 = math.max(var_788_1, arg_785_1.talkMaxDuration)

			if var_788_0 <= arg_785_1.time_ and arg_785_1.time_ < var_788_0 + var_788_10 then
				arg_785_1.typewritter.percent = (arg_785_1.time_ - var_788_0) / var_788_10

				arg_785_1.typewritter:SetDirty()
			end

			if arg_785_1.time_ >= var_788_0 + var_788_10 and arg_785_1.time_ < var_788_0 + var_788_10 + arg_788_0 then
				arg_785_1.typewritter.percent = 1

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(true)
			end
		end
	end,
	Play123011190 = function(arg_789_0, arg_789_1)
		arg_789_1.time_ = 0
		arg_789_1.frameCnt_ = 0
		arg_789_1.state_ = "playing"
		arg_789_1.curTalkId_ = 123011190
		arg_789_1.duration_ = 5

		SetActive(arg_789_1.tipsGo_, false)

		function arg_789_1.onSingleLineFinish_()
			arg_789_1.onSingleLineUpdate_ = nil
			arg_789_1.onSingleLineFinish_ = nil
			arg_789_1.state_ = "waiting"
		end

		function arg_789_1.playNext_(arg_791_0)
			if arg_791_0 == 1 then
				arg_789_0:Play123011191(arg_789_1)
			end
		end

		function arg_789_1.onSingleLineUpdate_(arg_792_0)
			local var_792_0 = 0
			local var_792_1 = 0.95

			if var_792_0 < arg_789_1.time_ and arg_789_1.time_ <= var_792_0 + arg_792_0 then
				arg_789_1.talkMaxDuration = 0
				arg_789_1.dialogCg_.alpha = 1

				arg_789_1.dialog_:SetActive(true)
				SetActive(arg_789_1.leftNameGo_, false)

				arg_789_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_789_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_789_1:RecordName(arg_789_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_789_1.iconTrs_.gameObject, false)
				arg_789_1.callingController_:SetSelectedState("normal")

				local var_792_2 = arg_789_1:GetWordFromCfg(123011190)
				local var_792_3 = arg_789_1:FormatText(var_792_2.content)

				arg_789_1.text_.text = var_792_3

				LuaForUtil.ClearLinePrefixSymbol(arg_789_1.text_)

				local var_792_4 = 38
				local var_792_5 = utf8.len(var_792_3)
				local var_792_6 = var_792_4 <= 0 and var_792_1 or var_792_1 * (var_792_5 / var_792_4)

				if var_792_6 > 0 and var_792_1 < var_792_6 then
					arg_789_1.talkMaxDuration = var_792_6

					if var_792_6 + var_792_0 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_6 + var_792_0
					end
				end

				arg_789_1.text_.text = var_792_3
				arg_789_1.typewritter.percent = 0

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(false)
				arg_789_1:RecordContent(arg_789_1.text_.text)
			end

			local var_792_7 = math.max(var_792_1, arg_789_1.talkMaxDuration)

			if var_792_0 <= arg_789_1.time_ and arg_789_1.time_ < var_792_0 + var_792_7 then
				arg_789_1.typewritter.percent = (arg_789_1.time_ - var_792_0) / var_792_7

				arg_789_1.typewritter:SetDirty()
			end

			if arg_789_1.time_ >= var_792_0 + var_792_7 and arg_789_1.time_ < var_792_0 + var_792_7 + arg_792_0 then
				arg_789_1.typewritter.percent = 1

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(true)
			end
		end
	end,
	Play123011191 = function(arg_793_0, arg_793_1)
		arg_793_1.time_ = 0
		arg_793_1.frameCnt_ = 0
		arg_793_1.state_ = "playing"
		arg_793_1.curTalkId_ = 123011191
		arg_793_1.duration_ = 5.9

		local var_793_0 = {
			zh = 4.9,
			ja = 5.9
		}
		local var_793_1 = manager.audio:GetLocalizationFlag()

		if var_793_0[var_793_1] ~= nil then
			arg_793_1.duration_ = var_793_0[var_793_1]
		end

		SetActive(arg_793_1.tipsGo_, false)

		function arg_793_1.onSingleLineFinish_()
			arg_793_1.onSingleLineUpdate_ = nil
			arg_793_1.onSingleLineFinish_ = nil
			arg_793_1.state_ = "waiting"
		end

		function arg_793_1.playNext_(arg_795_0)
			if arg_795_0 == 1 then
				arg_793_0:Play123011192(arg_793_1)
			end
		end

		function arg_793_1.onSingleLineUpdate_(arg_796_0)
			local var_796_0 = 0
			local var_796_1 = 0.575

			if var_796_0 < arg_793_1.time_ and arg_793_1.time_ <= var_796_0 + arg_796_0 then
				arg_793_1.talkMaxDuration = 0
				arg_793_1.dialogCg_.alpha = 1

				arg_793_1.dialog_:SetActive(true)
				SetActive(arg_793_1.leftNameGo_, true)

				local var_796_2 = arg_793_1:FormatText(StoryNameCfg[13].name)

				arg_793_1.leftNameTxt_.text = var_796_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_793_1.leftNameTxt_.transform)

				arg_793_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_793_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_793_1:RecordName(arg_793_1.leftNameTxt_.text)
				SetActive(arg_793_1.iconTrs_.gameObject, true)
				arg_793_1.iconController_:SetSelectedState("hero")

				arg_793_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_1")

				arg_793_1.callingController_:SetSelectedState("normal")

				local var_796_3 = arg_793_1:GetWordFromCfg(123011191)
				local var_796_4 = arg_793_1:FormatText(var_796_3.content)

				arg_793_1.text_.text = var_796_4

				LuaForUtil.ClearLinePrefixSymbol(arg_793_1.text_)

				local var_796_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011191", "story_v_out_123011.awb") ~= 0 then
					local var_796_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011191", "story_v_out_123011.awb") / 1000

					if var_796_8 + var_796_0 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_8 + var_796_0
					end

					if var_796_3.prefab_name ~= "" and arg_793_1.actors_[var_796_3.prefab_name] ~= nil then
						local var_796_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_793_1.actors_[var_796_3.prefab_name].transform, "story_v_out_123011", "123011191", "story_v_out_123011.awb")

						arg_793_1:RecordAudio("123011191", var_796_9)
						arg_793_1:RecordAudio("123011191", var_796_9)
					else
						arg_793_1:AudioAction("play", "voice", "story_v_out_123011", "123011191", "story_v_out_123011.awb")
					end

					arg_793_1:RecordHistoryTalkVoice("story_v_out_123011", "123011191", "story_v_out_123011.awb")
				end

				arg_793_1:RecordContent(arg_793_1.text_.text)
			end

			local var_796_10 = math.max(var_796_1, arg_793_1.talkMaxDuration)

			if var_796_0 <= arg_793_1.time_ and arg_793_1.time_ < var_796_0 + var_796_10 then
				arg_793_1.typewritter.percent = (arg_793_1.time_ - var_796_0) / var_796_10

				arg_793_1.typewritter:SetDirty()
			end

			if arg_793_1.time_ >= var_796_0 + var_796_10 and arg_793_1.time_ < var_796_0 + var_796_10 + arg_796_0 then
				arg_793_1.typewritter.percent = 1

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(true)
			end
		end
	end,
	Play123011192 = function(arg_797_0, arg_797_1)
		arg_797_1.time_ = 0
		arg_797_1.frameCnt_ = 0
		arg_797_1.state_ = "playing"
		arg_797_1.curTalkId_ = 123011192
		arg_797_1.duration_ = 12.733

		local var_797_0 = {
			zh = 5.4,
			ja = 12.733
		}
		local var_797_1 = manager.audio:GetLocalizationFlag()

		if var_797_0[var_797_1] ~= nil then
			arg_797_1.duration_ = var_797_0[var_797_1]
		end

		SetActive(arg_797_1.tipsGo_, false)

		function arg_797_1.onSingleLineFinish_()
			arg_797_1.onSingleLineUpdate_ = nil
			arg_797_1.onSingleLineFinish_ = nil
			arg_797_1.state_ = "waiting"
		end

		function arg_797_1.playNext_(arg_799_0)
			if arg_799_0 == 1 then
				arg_797_0:Play123011193(arg_797_1)
			end
		end

		function arg_797_1.onSingleLineUpdate_(arg_800_0)
			local var_800_0 = 0
			local var_800_1 = 0.675

			if var_800_0 < arg_797_1.time_ and arg_797_1.time_ <= var_800_0 + arg_800_0 then
				arg_797_1.talkMaxDuration = 0
				arg_797_1.dialogCg_.alpha = 1

				arg_797_1.dialog_:SetActive(true)
				SetActive(arg_797_1.leftNameGo_, true)

				local var_800_2 = arg_797_1:FormatText(StoryNameCfg[479].name)

				arg_797_1.leftNameTxt_.text = var_800_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_797_1.leftNameTxt_.transform)

				arg_797_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_797_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_797_1:RecordName(arg_797_1.leftNameTxt_.text)
				SetActive(arg_797_1.iconTrs_.gameObject, false)
				arg_797_1.callingController_:SetSelectedState("normal")

				local var_800_3 = arg_797_1:GetWordFromCfg(123011192)
				local var_800_4 = arg_797_1:FormatText(var_800_3.content)

				arg_797_1.text_.text = var_800_4

				LuaForUtil.ClearLinePrefixSymbol(arg_797_1.text_)

				local var_800_5 = 27
				local var_800_6 = utf8.len(var_800_4)
				local var_800_7 = var_800_5 <= 0 and var_800_1 or var_800_1 * (var_800_6 / var_800_5)

				if var_800_7 > 0 and var_800_1 < var_800_7 then
					arg_797_1.talkMaxDuration = var_800_7

					if var_800_7 + var_800_0 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_7 + var_800_0
					end
				end

				arg_797_1.text_.text = var_800_4
				arg_797_1.typewritter.percent = 0

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011192", "story_v_out_123011.awb") ~= 0 then
					local var_800_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011192", "story_v_out_123011.awb") / 1000

					if var_800_8 + var_800_0 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_8 + var_800_0
					end

					if var_800_3.prefab_name ~= "" and arg_797_1.actors_[var_800_3.prefab_name] ~= nil then
						local var_800_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_797_1.actors_[var_800_3.prefab_name].transform, "story_v_out_123011", "123011192", "story_v_out_123011.awb")

						arg_797_1:RecordAudio("123011192", var_800_9)
						arg_797_1:RecordAudio("123011192", var_800_9)
					else
						arg_797_1:AudioAction("play", "voice", "story_v_out_123011", "123011192", "story_v_out_123011.awb")
					end

					arg_797_1:RecordHistoryTalkVoice("story_v_out_123011", "123011192", "story_v_out_123011.awb")
				end

				arg_797_1:RecordContent(arg_797_1.text_.text)
			end

			local var_800_10 = math.max(var_800_1, arg_797_1.talkMaxDuration)

			if var_800_0 <= arg_797_1.time_ and arg_797_1.time_ < var_800_0 + var_800_10 then
				arg_797_1.typewritter.percent = (arg_797_1.time_ - var_800_0) / var_800_10

				arg_797_1.typewritter:SetDirty()
			end

			if arg_797_1.time_ >= var_800_0 + var_800_10 and arg_797_1.time_ < var_800_0 + var_800_10 + arg_800_0 then
				arg_797_1.typewritter.percent = 1

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(true)
			end
		end
	end,
	Play123011193 = function(arg_801_0, arg_801_1)
		arg_801_1.time_ = 0
		arg_801_1.frameCnt_ = 0
		arg_801_1.state_ = "playing"
		arg_801_1.curTalkId_ = 123011193
		arg_801_1.duration_ = 13.466

		local var_801_0 = {
			zh = 10.266,
			ja = 13.466
		}
		local var_801_1 = manager.audio:GetLocalizationFlag()

		if var_801_0[var_801_1] ~= nil then
			arg_801_1.duration_ = var_801_0[var_801_1]
		end

		SetActive(arg_801_1.tipsGo_, false)

		function arg_801_1.onSingleLineFinish_()
			arg_801_1.onSingleLineUpdate_ = nil
			arg_801_1.onSingleLineFinish_ = nil
			arg_801_1.state_ = "waiting"
		end

		function arg_801_1.playNext_(arg_803_0)
			if arg_803_0 == 1 then
				arg_801_0:Play123011194(arg_801_1)
			end
		end

		function arg_801_1.onSingleLineUpdate_(arg_804_0)
			local var_804_0 = 0
			local var_804_1 = 1.2

			if var_804_0 < arg_801_1.time_ and arg_801_1.time_ <= var_804_0 + arg_804_0 then
				arg_801_1.talkMaxDuration = 0
				arg_801_1.dialogCg_.alpha = 1

				arg_801_1.dialog_:SetActive(true)
				SetActive(arg_801_1.leftNameGo_, true)

				local var_804_2 = arg_801_1:FormatText(StoryNameCfg[13].name)

				arg_801_1.leftNameTxt_.text = var_804_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_801_1.leftNameTxt_.transform)

				arg_801_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_801_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_801_1:RecordName(arg_801_1.leftNameTxt_.text)
				SetActive(arg_801_1.iconTrs_.gameObject, true)
				arg_801_1.iconController_:SetSelectedState("hero")

				arg_801_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_1")

				arg_801_1.callingController_:SetSelectedState("normal")

				local var_804_3 = arg_801_1:GetWordFromCfg(123011193)
				local var_804_4 = arg_801_1:FormatText(var_804_3.content)

				arg_801_1.text_.text = var_804_4

				LuaForUtil.ClearLinePrefixSymbol(arg_801_1.text_)

				local var_804_5 = 48
				local var_804_6 = utf8.len(var_804_4)
				local var_804_7 = var_804_5 <= 0 and var_804_1 or var_804_1 * (var_804_6 / var_804_5)

				if var_804_7 > 0 and var_804_1 < var_804_7 then
					arg_801_1.talkMaxDuration = var_804_7

					if var_804_7 + var_804_0 > arg_801_1.duration_ then
						arg_801_1.duration_ = var_804_7 + var_804_0
					end
				end

				arg_801_1.text_.text = var_804_4
				arg_801_1.typewritter.percent = 0

				arg_801_1.typewritter:SetDirty()
				arg_801_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011193", "story_v_out_123011.awb") ~= 0 then
					local var_804_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011193", "story_v_out_123011.awb") / 1000

					if var_804_8 + var_804_0 > arg_801_1.duration_ then
						arg_801_1.duration_ = var_804_8 + var_804_0
					end

					if var_804_3.prefab_name ~= "" and arg_801_1.actors_[var_804_3.prefab_name] ~= nil then
						local var_804_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_801_1.actors_[var_804_3.prefab_name].transform, "story_v_out_123011", "123011193", "story_v_out_123011.awb")

						arg_801_1:RecordAudio("123011193", var_804_9)
						arg_801_1:RecordAudio("123011193", var_804_9)
					else
						arg_801_1:AudioAction("play", "voice", "story_v_out_123011", "123011193", "story_v_out_123011.awb")
					end

					arg_801_1:RecordHistoryTalkVoice("story_v_out_123011", "123011193", "story_v_out_123011.awb")
				end

				arg_801_1:RecordContent(arg_801_1.text_.text)
			end

			local var_804_10 = math.max(var_804_1, arg_801_1.talkMaxDuration)

			if var_804_0 <= arg_801_1.time_ and arg_801_1.time_ < var_804_0 + var_804_10 then
				arg_801_1.typewritter.percent = (arg_801_1.time_ - var_804_0) / var_804_10

				arg_801_1.typewritter:SetDirty()
			end

			if arg_801_1.time_ >= var_804_0 + var_804_10 and arg_801_1.time_ < var_804_0 + var_804_10 + arg_804_0 then
				arg_801_1.typewritter.percent = 1

				arg_801_1.typewritter:SetDirty()
				arg_801_1:ShowNextGo(true)
			end
		end
	end,
	Play123011194 = function(arg_805_0, arg_805_1)
		arg_805_1.time_ = 0
		arg_805_1.frameCnt_ = 0
		arg_805_1.state_ = "playing"
		arg_805_1.curTalkId_ = 123011194
		arg_805_1.duration_ = 10.666

		local var_805_0 = {
			zh = 9.433,
			ja = 10.666
		}
		local var_805_1 = manager.audio:GetLocalizationFlag()

		if var_805_0[var_805_1] ~= nil then
			arg_805_1.duration_ = var_805_0[var_805_1]
		end

		SetActive(arg_805_1.tipsGo_, false)

		function arg_805_1.onSingleLineFinish_()
			arg_805_1.onSingleLineUpdate_ = nil
			arg_805_1.onSingleLineFinish_ = nil
			arg_805_1.state_ = "waiting"
		end

		function arg_805_1.playNext_(arg_807_0)
			if arg_807_0 == 1 then
				arg_805_0:Play123011195(arg_805_1)
			end
		end

		function arg_805_1.onSingleLineUpdate_(arg_808_0)
			local var_808_0 = 0
			local var_808_1 = 1.175

			if var_808_0 < arg_805_1.time_ and arg_805_1.time_ <= var_808_0 + arg_808_0 then
				arg_805_1.talkMaxDuration = 0
				arg_805_1.dialogCg_.alpha = 1

				arg_805_1.dialog_:SetActive(true)
				SetActive(arg_805_1.leftNameGo_, true)

				local var_808_2 = arg_805_1:FormatText(StoryNameCfg[479].name)

				arg_805_1.leftNameTxt_.text = var_808_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_805_1.leftNameTxt_.transform)

				arg_805_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_805_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_805_1:RecordName(arg_805_1.leftNameTxt_.text)
				SetActive(arg_805_1.iconTrs_.gameObject, false)
				arg_805_1.callingController_:SetSelectedState("normal")

				local var_808_3 = arg_805_1:GetWordFromCfg(123011194)
				local var_808_4 = arg_805_1:FormatText(var_808_3.content)

				arg_805_1.text_.text = var_808_4

				LuaForUtil.ClearLinePrefixSymbol(arg_805_1.text_)

				local var_808_5 = 47
				local var_808_6 = utf8.len(var_808_4)
				local var_808_7 = var_808_5 <= 0 and var_808_1 or var_808_1 * (var_808_6 / var_808_5)

				if var_808_7 > 0 and var_808_1 < var_808_7 then
					arg_805_1.talkMaxDuration = var_808_7

					if var_808_7 + var_808_0 > arg_805_1.duration_ then
						arg_805_1.duration_ = var_808_7 + var_808_0
					end
				end

				arg_805_1.text_.text = var_808_4
				arg_805_1.typewritter.percent = 0

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011194", "story_v_out_123011.awb") ~= 0 then
					local var_808_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011194", "story_v_out_123011.awb") / 1000

					if var_808_8 + var_808_0 > arg_805_1.duration_ then
						arg_805_1.duration_ = var_808_8 + var_808_0
					end

					if var_808_3.prefab_name ~= "" and arg_805_1.actors_[var_808_3.prefab_name] ~= nil then
						local var_808_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_805_1.actors_[var_808_3.prefab_name].transform, "story_v_out_123011", "123011194", "story_v_out_123011.awb")

						arg_805_1:RecordAudio("123011194", var_808_9)
						arg_805_1:RecordAudio("123011194", var_808_9)
					else
						arg_805_1:AudioAction("play", "voice", "story_v_out_123011", "123011194", "story_v_out_123011.awb")
					end

					arg_805_1:RecordHistoryTalkVoice("story_v_out_123011", "123011194", "story_v_out_123011.awb")
				end

				arg_805_1:RecordContent(arg_805_1.text_.text)
			end

			local var_808_10 = math.max(var_808_1, arg_805_1.talkMaxDuration)

			if var_808_0 <= arg_805_1.time_ and arg_805_1.time_ < var_808_0 + var_808_10 then
				arg_805_1.typewritter.percent = (arg_805_1.time_ - var_808_0) / var_808_10

				arg_805_1.typewritter:SetDirty()
			end

			if arg_805_1.time_ >= var_808_0 + var_808_10 and arg_805_1.time_ < var_808_0 + var_808_10 + arg_808_0 then
				arg_805_1.typewritter.percent = 1

				arg_805_1.typewritter:SetDirty()
				arg_805_1:ShowNextGo(true)
			end
		end
	end,
	Play123011195 = function(arg_809_0, arg_809_1)
		arg_809_1.time_ = 0
		arg_809_1.frameCnt_ = 0
		arg_809_1.state_ = "playing"
		arg_809_1.curTalkId_ = 123011195
		arg_809_1.duration_ = 5

		SetActive(arg_809_1.tipsGo_, false)

		function arg_809_1.onSingleLineFinish_()
			arg_809_1.onSingleLineUpdate_ = nil
			arg_809_1.onSingleLineFinish_ = nil
			arg_809_1.state_ = "waiting"
		end

		function arg_809_1.playNext_(arg_811_0)
			if arg_811_0 == 1 then
				arg_809_0:Play123011196(arg_809_1)
			end
		end

		function arg_809_1.onSingleLineUpdate_(arg_812_0)
			local var_812_0 = 0
			local var_812_1 = 0.075

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

				local var_812_3 = arg_809_1:GetWordFromCfg(123011195)
				local var_812_4 = arg_809_1:FormatText(var_812_3.content)

				arg_809_1.text_.text = var_812_4

				LuaForUtil.ClearLinePrefixSymbol(arg_809_1.text_)

				local var_812_5 = 3
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
	Play123011196 = function(arg_813_0, arg_813_1)
		arg_813_1.time_ = 0
		arg_813_1.frameCnt_ = 0
		arg_813_1.state_ = "playing"
		arg_813_1.curTalkId_ = 123011196
		arg_813_1.duration_ = 14.1

		local var_813_0 = {
			zh = 11,
			ja = 14.1
		}
		local var_813_1 = manager.audio:GetLocalizationFlag()

		if var_813_0[var_813_1] ~= nil then
			arg_813_1.duration_ = var_813_0[var_813_1]
		end

		SetActive(arg_813_1.tipsGo_, false)

		function arg_813_1.onSingleLineFinish_()
			arg_813_1.onSingleLineUpdate_ = nil
			arg_813_1.onSingleLineFinish_ = nil
			arg_813_1.state_ = "waiting"
		end

		function arg_813_1.playNext_(arg_815_0)
			if arg_815_0 == 1 then
				arg_813_0:Play123011197(arg_813_1)
			end
		end

		function arg_813_1.onSingleLineUpdate_(arg_816_0)
			local var_816_0 = 0
			local var_816_1 = 1.475

			if var_816_0 < arg_813_1.time_ and arg_813_1.time_ <= var_816_0 + arg_816_0 then
				arg_813_1.talkMaxDuration = 0
				arg_813_1.dialogCg_.alpha = 1

				arg_813_1.dialog_:SetActive(true)
				SetActive(arg_813_1.leftNameGo_, true)

				local var_816_2 = arg_813_1:FormatText(StoryNameCfg[479].name)

				arg_813_1.leftNameTxt_.text = var_816_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_813_1.leftNameTxt_.transform)

				arg_813_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_813_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_813_1:RecordName(arg_813_1.leftNameTxt_.text)
				SetActive(arg_813_1.iconTrs_.gameObject, false)
				arg_813_1.callingController_:SetSelectedState("normal")

				local var_816_3 = arg_813_1:GetWordFromCfg(123011196)
				local var_816_4 = arg_813_1:FormatText(var_816_3.content)

				arg_813_1.text_.text = var_816_4

				LuaForUtil.ClearLinePrefixSymbol(arg_813_1.text_)

				local var_816_5 = 59
				local var_816_6 = utf8.len(var_816_4)
				local var_816_7 = var_816_5 <= 0 and var_816_1 or var_816_1 * (var_816_6 / var_816_5)

				if var_816_7 > 0 and var_816_1 < var_816_7 then
					arg_813_1.talkMaxDuration = var_816_7

					if var_816_7 + var_816_0 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_7 + var_816_0
					end
				end

				arg_813_1.text_.text = var_816_4
				arg_813_1.typewritter.percent = 0

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011196", "story_v_out_123011.awb") ~= 0 then
					local var_816_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011196", "story_v_out_123011.awb") / 1000

					if var_816_8 + var_816_0 > arg_813_1.duration_ then
						arg_813_1.duration_ = var_816_8 + var_816_0
					end

					if var_816_3.prefab_name ~= "" and arg_813_1.actors_[var_816_3.prefab_name] ~= nil then
						local var_816_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_813_1.actors_[var_816_3.prefab_name].transform, "story_v_out_123011", "123011196", "story_v_out_123011.awb")

						arg_813_1:RecordAudio("123011196", var_816_9)
						arg_813_1:RecordAudio("123011196", var_816_9)
					else
						arg_813_1:AudioAction("play", "voice", "story_v_out_123011", "123011196", "story_v_out_123011.awb")
					end

					arg_813_1:RecordHistoryTalkVoice("story_v_out_123011", "123011196", "story_v_out_123011.awb")
				end

				arg_813_1:RecordContent(arg_813_1.text_.text)
			end

			local var_816_10 = math.max(var_816_1, arg_813_1.talkMaxDuration)

			if var_816_0 <= arg_813_1.time_ and arg_813_1.time_ < var_816_0 + var_816_10 then
				arg_813_1.typewritter.percent = (arg_813_1.time_ - var_816_0) / var_816_10

				arg_813_1.typewritter:SetDirty()
			end

			if arg_813_1.time_ >= var_816_0 + var_816_10 and arg_813_1.time_ < var_816_0 + var_816_10 + arg_816_0 then
				arg_813_1.typewritter.percent = 1

				arg_813_1.typewritter:SetDirty()
				arg_813_1:ShowNextGo(true)
			end
		end
	end,
	Play123011197 = function(arg_817_0, arg_817_1)
		arg_817_1.time_ = 0
		arg_817_1.frameCnt_ = 0
		arg_817_1.state_ = "playing"
		arg_817_1.curTalkId_ = 123011197
		arg_817_1.duration_ = 5

		SetActive(arg_817_1.tipsGo_, false)

		function arg_817_1.onSingleLineFinish_()
			arg_817_1.onSingleLineUpdate_ = nil
			arg_817_1.onSingleLineFinish_ = nil
			arg_817_1.state_ = "waiting"
		end

		function arg_817_1.playNext_(arg_819_0)
			if arg_819_0 == 1 then
				arg_817_0:Play123011198(arg_817_1)
			end
		end

		function arg_817_1.onSingleLineUpdate_(arg_820_0)
			local var_820_0 = 0
			local var_820_1 = 0.075

			if var_820_0 < arg_817_1.time_ and arg_817_1.time_ <= var_820_0 + arg_820_0 then
				arg_817_1.talkMaxDuration = 0
				arg_817_1.dialogCg_.alpha = 1

				arg_817_1.dialog_:SetActive(true)
				SetActive(arg_817_1.leftNameGo_, true)

				local var_820_2 = arg_817_1:FormatText(StoryNameCfg[7].name)

				arg_817_1.leftNameTxt_.text = var_820_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_817_1.leftNameTxt_.transform)

				arg_817_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_817_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_817_1:RecordName(arg_817_1.leftNameTxt_.text)
				SetActive(arg_817_1.iconTrs_.gameObject, false)
				arg_817_1.callingController_:SetSelectedState("normal")

				local var_820_3 = arg_817_1:GetWordFromCfg(123011197)
				local var_820_4 = arg_817_1:FormatText(var_820_3.content)

				arg_817_1.text_.text = var_820_4

				LuaForUtil.ClearLinePrefixSymbol(arg_817_1.text_)

				local var_820_5 = 3
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
				arg_817_1:RecordContent(arg_817_1.text_.text)
			end

			local var_820_8 = math.max(var_820_1, arg_817_1.talkMaxDuration)

			if var_820_0 <= arg_817_1.time_ and arg_817_1.time_ < var_820_0 + var_820_8 then
				arg_817_1.typewritter.percent = (arg_817_1.time_ - var_820_0) / var_820_8

				arg_817_1.typewritter:SetDirty()
			end

			if arg_817_1.time_ >= var_820_0 + var_820_8 and arg_817_1.time_ < var_820_0 + var_820_8 + arg_820_0 then
				arg_817_1.typewritter.percent = 1

				arg_817_1.typewritter:SetDirty()
				arg_817_1:ShowNextGo(true)
			end
		end
	end,
	Play123011198 = function(arg_821_0, arg_821_1)
		arg_821_1.time_ = 0
		arg_821_1.frameCnt_ = 0
		arg_821_1.state_ = "playing"
		arg_821_1.curTalkId_ = 123011198
		arg_821_1.duration_ = 7.6

		local var_821_0 = {
			zh = 7.266,
			ja = 7.6
		}
		local var_821_1 = manager.audio:GetLocalizationFlag()

		if var_821_0[var_821_1] ~= nil then
			arg_821_1.duration_ = var_821_0[var_821_1]
		end

		SetActive(arg_821_1.tipsGo_, false)

		function arg_821_1.onSingleLineFinish_()
			arg_821_1.onSingleLineUpdate_ = nil
			arg_821_1.onSingleLineFinish_ = nil
			arg_821_1.state_ = "waiting"
		end

		function arg_821_1.playNext_(arg_823_0)
			if arg_823_0 == 1 then
				arg_821_0:Play123011199(arg_821_1)
			end
		end

		function arg_821_1.onSingleLineUpdate_(arg_824_0)
			local var_824_0 = 0
			local var_824_1 = 0.85

			if var_824_0 < arg_821_1.time_ and arg_821_1.time_ <= var_824_0 + arg_824_0 then
				arg_821_1.talkMaxDuration = 0
				arg_821_1.dialogCg_.alpha = 1

				arg_821_1.dialog_:SetActive(true)
				SetActive(arg_821_1.leftNameGo_, true)

				local var_824_2 = arg_821_1:FormatText(StoryNameCfg[13].name)

				arg_821_1.leftNameTxt_.text = var_824_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_821_1.leftNameTxt_.transform)

				arg_821_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_821_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_821_1:RecordName(arg_821_1.leftNameTxt_.text)
				SetActive(arg_821_1.iconTrs_.gameObject, true)
				arg_821_1.iconController_:SetSelectedState("hero")

				arg_821_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_821_1.callingController_:SetSelectedState("normal")

				local var_824_3 = arg_821_1:GetWordFromCfg(123011198)
				local var_824_4 = arg_821_1:FormatText(var_824_3.content)

				arg_821_1.text_.text = var_824_4

				LuaForUtil.ClearLinePrefixSymbol(arg_821_1.text_)

				local var_824_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011198", "story_v_out_123011.awb") ~= 0 then
					local var_824_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011198", "story_v_out_123011.awb") / 1000

					if var_824_8 + var_824_0 > arg_821_1.duration_ then
						arg_821_1.duration_ = var_824_8 + var_824_0
					end

					if var_824_3.prefab_name ~= "" and arg_821_1.actors_[var_824_3.prefab_name] ~= nil then
						local var_824_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_821_1.actors_[var_824_3.prefab_name].transform, "story_v_out_123011", "123011198", "story_v_out_123011.awb")

						arg_821_1:RecordAudio("123011198", var_824_9)
						arg_821_1:RecordAudio("123011198", var_824_9)
					else
						arg_821_1:AudioAction("play", "voice", "story_v_out_123011", "123011198", "story_v_out_123011.awb")
					end

					arg_821_1:RecordHistoryTalkVoice("story_v_out_123011", "123011198", "story_v_out_123011.awb")
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
	Play123011199 = function(arg_825_0, arg_825_1)
		arg_825_1.time_ = 0
		arg_825_1.frameCnt_ = 0
		arg_825_1.state_ = "playing"
		arg_825_1.curTalkId_ = 123011199
		arg_825_1.duration_ = 5.7

		local var_825_0 = {
			zh = 5.7,
			ja = 5.4
		}
		local var_825_1 = manager.audio:GetLocalizationFlag()

		if var_825_0[var_825_1] ~= nil then
			arg_825_1.duration_ = var_825_0[var_825_1]
		end

		SetActive(arg_825_1.tipsGo_, false)

		function arg_825_1.onSingleLineFinish_()
			arg_825_1.onSingleLineUpdate_ = nil
			arg_825_1.onSingleLineFinish_ = nil
			arg_825_1.state_ = "waiting"
		end

		function arg_825_1.playNext_(arg_827_0)
			if arg_827_0 == 1 then
				arg_825_0:Play123011200(arg_825_1)
			end
		end

		function arg_825_1.onSingleLineUpdate_(arg_828_0)
			local var_828_0 = 0
			local var_828_1 = 0.65

			if var_828_0 < arg_825_1.time_ and arg_825_1.time_ <= var_828_0 + arg_828_0 then
				arg_825_1.talkMaxDuration = 0
				arg_825_1.dialogCg_.alpha = 1

				arg_825_1.dialog_:SetActive(true)
				SetActive(arg_825_1.leftNameGo_, true)

				local var_828_2 = arg_825_1:FormatText(StoryNameCfg[479].name)

				arg_825_1.leftNameTxt_.text = var_828_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_825_1.leftNameTxt_.transform)

				arg_825_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_825_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_825_1:RecordName(arg_825_1.leftNameTxt_.text)
				SetActive(arg_825_1.iconTrs_.gameObject, false)
				arg_825_1.callingController_:SetSelectedState("normal")

				local var_828_3 = arg_825_1:GetWordFromCfg(123011199)
				local var_828_4 = arg_825_1:FormatText(var_828_3.content)

				arg_825_1.text_.text = var_828_4

				LuaForUtil.ClearLinePrefixSymbol(arg_825_1.text_)

				local var_828_5 = 26
				local var_828_6 = utf8.len(var_828_4)
				local var_828_7 = var_828_5 <= 0 and var_828_1 or var_828_1 * (var_828_6 / var_828_5)

				if var_828_7 > 0 and var_828_1 < var_828_7 then
					arg_825_1.talkMaxDuration = var_828_7

					if var_828_7 + var_828_0 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_7 + var_828_0
					end
				end

				arg_825_1.text_.text = var_828_4
				arg_825_1.typewritter.percent = 0

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011199", "story_v_out_123011.awb") ~= 0 then
					local var_828_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011199", "story_v_out_123011.awb") / 1000

					if var_828_8 + var_828_0 > arg_825_1.duration_ then
						arg_825_1.duration_ = var_828_8 + var_828_0
					end

					if var_828_3.prefab_name ~= "" and arg_825_1.actors_[var_828_3.prefab_name] ~= nil then
						local var_828_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_825_1.actors_[var_828_3.prefab_name].transform, "story_v_out_123011", "123011199", "story_v_out_123011.awb")

						arg_825_1:RecordAudio("123011199", var_828_9)
						arg_825_1:RecordAudio("123011199", var_828_9)
					else
						arg_825_1:AudioAction("play", "voice", "story_v_out_123011", "123011199", "story_v_out_123011.awb")
					end

					arg_825_1:RecordHistoryTalkVoice("story_v_out_123011", "123011199", "story_v_out_123011.awb")
				end

				arg_825_1:RecordContent(arg_825_1.text_.text)
			end

			local var_828_10 = math.max(var_828_1, arg_825_1.talkMaxDuration)

			if var_828_0 <= arg_825_1.time_ and arg_825_1.time_ < var_828_0 + var_828_10 then
				arg_825_1.typewritter.percent = (arg_825_1.time_ - var_828_0) / var_828_10

				arg_825_1.typewritter:SetDirty()
			end

			if arg_825_1.time_ >= var_828_0 + var_828_10 and arg_825_1.time_ < var_828_0 + var_828_10 + arg_828_0 then
				arg_825_1.typewritter.percent = 1

				arg_825_1.typewritter:SetDirty()
				arg_825_1:ShowNextGo(true)
			end
		end
	end,
	Play123011200 = function(arg_829_0, arg_829_1)
		arg_829_1.time_ = 0
		arg_829_1.frameCnt_ = 0
		arg_829_1.state_ = "playing"
		arg_829_1.curTalkId_ = 123011200
		arg_829_1.duration_ = 7.133

		local var_829_0 = {
			zh = 5.5,
			ja = 7.133
		}
		local var_829_1 = manager.audio:GetLocalizationFlag()

		if var_829_0[var_829_1] ~= nil then
			arg_829_1.duration_ = var_829_0[var_829_1]
		end

		SetActive(arg_829_1.tipsGo_, false)

		function arg_829_1.onSingleLineFinish_()
			arg_829_1.onSingleLineUpdate_ = nil
			arg_829_1.onSingleLineFinish_ = nil
			arg_829_1.state_ = "waiting"
		end

		function arg_829_1.playNext_(arg_831_0)
			if arg_831_0 == 1 then
				arg_829_0:Play123011201(arg_829_1)
			end
		end

		function arg_829_1.onSingleLineUpdate_(arg_832_0)
			local var_832_0 = 0
			local var_832_1 = 0.725

			if var_832_0 < arg_829_1.time_ and arg_829_1.time_ <= var_832_0 + arg_832_0 then
				arg_829_1.talkMaxDuration = 0
				arg_829_1.dialogCg_.alpha = 1

				arg_829_1.dialog_:SetActive(true)
				SetActive(arg_829_1.leftNameGo_, true)

				local var_832_2 = arg_829_1:FormatText(StoryNameCfg[13].name)

				arg_829_1.leftNameTxt_.text = var_832_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_829_1.leftNameTxt_.transform)

				arg_829_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_829_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_829_1:RecordName(arg_829_1.leftNameTxt_.text)
				SetActive(arg_829_1.iconTrs_.gameObject, true)
				arg_829_1.iconController_:SetSelectedState("hero")

				arg_829_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_1")

				arg_829_1.callingController_:SetSelectedState("normal")

				local var_832_3 = arg_829_1:GetWordFromCfg(123011200)
				local var_832_4 = arg_829_1:FormatText(var_832_3.content)

				arg_829_1.text_.text = var_832_4

				LuaForUtil.ClearLinePrefixSymbol(arg_829_1.text_)

				local var_832_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011200", "story_v_out_123011.awb") ~= 0 then
					local var_832_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011200", "story_v_out_123011.awb") / 1000

					if var_832_8 + var_832_0 > arg_829_1.duration_ then
						arg_829_1.duration_ = var_832_8 + var_832_0
					end

					if var_832_3.prefab_name ~= "" and arg_829_1.actors_[var_832_3.prefab_name] ~= nil then
						local var_832_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_829_1.actors_[var_832_3.prefab_name].transform, "story_v_out_123011", "123011200", "story_v_out_123011.awb")

						arg_829_1:RecordAudio("123011200", var_832_9)
						arg_829_1:RecordAudio("123011200", var_832_9)
					else
						arg_829_1:AudioAction("play", "voice", "story_v_out_123011", "123011200", "story_v_out_123011.awb")
					end

					arg_829_1:RecordHistoryTalkVoice("story_v_out_123011", "123011200", "story_v_out_123011.awb")
				end

				arg_829_1:RecordContent(arg_829_1.text_.text)
			end

			local var_832_10 = math.max(var_832_1, arg_829_1.talkMaxDuration)

			if var_832_0 <= arg_829_1.time_ and arg_829_1.time_ < var_832_0 + var_832_10 then
				arg_829_1.typewritter.percent = (arg_829_1.time_ - var_832_0) / var_832_10

				arg_829_1.typewritter:SetDirty()
			end

			if arg_829_1.time_ >= var_832_0 + var_832_10 and arg_829_1.time_ < var_832_0 + var_832_10 + arg_832_0 then
				arg_829_1.typewritter.percent = 1

				arg_829_1.typewritter:SetDirty()
				arg_829_1:ShowNextGo(true)
			end
		end
	end,
	Play123011201 = function(arg_833_0, arg_833_1)
		arg_833_1.time_ = 0
		arg_833_1.frameCnt_ = 0
		arg_833_1.state_ = "playing"
		arg_833_1.curTalkId_ = 123011201
		arg_833_1.duration_ = 13.866

		local var_833_0 = {
			zh = 10.7,
			ja = 13.866
		}
		local var_833_1 = manager.audio:GetLocalizationFlag()

		if var_833_0[var_833_1] ~= nil then
			arg_833_1.duration_ = var_833_0[var_833_1]
		end

		SetActive(arg_833_1.tipsGo_, false)

		function arg_833_1.onSingleLineFinish_()
			arg_833_1.onSingleLineUpdate_ = nil
			arg_833_1.onSingleLineFinish_ = nil
			arg_833_1.state_ = "waiting"
		end

		function arg_833_1.playNext_(arg_835_0)
			if arg_835_0 == 1 then
				arg_833_0:Play123011202(arg_833_1)
			end
		end

		function arg_833_1.onSingleLineUpdate_(arg_836_0)
			local var_836_0 = 0
			local var_836_1 = 1.3

			if var_836_0 < arg_833_1.time_ and arg_833_1.time_ <= var_836_0 + arg_836_0 then
				arg_833_1.talkMaxDuration = 0
				arg_833_1.dialogCg_.alpha = 1

				arg_833_1.dialog_:SetActive(true)
				SetActive(arg_833_1.leftNameGo_, true)

				local var_836_2 = arg_833_1:FormatText(StoryNameCfg[13].name)

				arg_833_1.leftNameTxt_.text = var_836_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_833_1.leftNameTxt_.transform)

				arg_833_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_833_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_833_1:RecordName(arg_833_1.leftNameTxt_.text)
				SetActive(arg_833_1.iconTrs_.gameObject, true)
				arg_833_1.iconController_:SetSelectedState("hero")

				arg_833_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_833_1.callingController_:SetSelectedState("normal")

				local var_836_3 = arg_833_1:GetWordFromCfg(123011201)
				local var_836_4 = arg_833_1:FormatText(var_836_3.content)

				arg_833_1.text_.text = var_836_4

				LuaForUtil.ClearLinePrefixSymbol(arg_833_1.text_)

				local var_836_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011201", "story_v_out_123011.awb") ~= 0 then
					local var_836_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011201", "story_v_out_123011.awb") / 1000

					if var_836_8 + var_836_0 > arg_833_1.duration_ then
						arg_833_1.duration_ = var_836_8 + var_836_0
					end

					if var_836_3.prefab_name ~= "" and arg_833_1.actors_[var_836_3.prefab_name] ~= nil then
						local var_836_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_833_1.actors_[var_836_3.prefab_name].transform, "story_v_out_123011", "123011201", "story_v_out_123011.awb")

						arg_833_1:RecordAudio("123011201", var_836_9)
						arg_833_1:RecordAudio("123011201", var_836_9)
					else
						arg_833_1:AudioAction("play", "voice", "story_v_out_123011", "123011201", "story_v_out_123011.awb")
					end

					arg_833_1:RecordHistoryTalkVoice("story_v_out_123011", "123011201", "story_v_out_123011.awb")
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
	Play123011202 = function(arg_837_0, arg_837_1)
		arg_837_1.time_ = 0
		arg_837_1.frameCnt_ = 0
		arg_837_1.state_ = "playing"
		arg_837_1.curTalkId_ = 123011202
		arg_837_1.duration_ = 6.266

		local var_837_0 = {
			zh = 4.4,
			ja = 6.266
		}
		local var_837_1 = manager.audio:GetLocalizationFlag()

		if var_837_0[var_837_1] ~= nil then
			arg_837_1.duration_ = var_837_0[var_837_1]
		end

		SetActive(arg_837_1.tipsGo_, false)

		function arg_837_1.onSingleLineFinish_()
			arg_837_1.onSingleLineUpdate_ = nil
			arg_837_1.onSingleLineFinish_ = nil
			arg_837_1.state_ = "waiting"
		end

		function arg_837_1.playNext_(arg_839_0)
			if arg_839_0 == 1 then
				arg_837_0:Play123011203(arg_837_1)
			end
		end

		function arg_837_1.onSingleLineUpdate_(arg_840_0)
			local var_840_0 = 0
			local var_840_1 = 0.5

			if var_840_0 < arg_837_1.time_ and arg_837_1.time_ <= var_840_0 + arg_840_0 then
				arg_837_1.talkMaxDuration = 0
				arg_837_1.dialogCg_.alpha = 1

				arg_837_1.dialog_:SetActive(true)
				SetActive(arg_837_1.leftNameGo_, true)

				local var_840_2 = arg_837_1:FormatText(StoryNameCfg[479].name)

				arg_837_1.leftNameTxt_.text = var_840_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_837_1.leftNameTxt_.transform)

				arg_837_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_837_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_837_1:RecordName(arg_837_1.leftNameTxt_.text)
				SetActive(arg_837_1.iconTrs_.gameObject, false)
				arg_837_1.callingController_:SetSelectedState("normal")

				local var_840_3 = arg_837_1:GetWordFromCfg(123011202)
				local var_840_4 = arg_837_1:FormatText(var_840_3.content)

				arg_837_1.text_.text = var_840_4

				LuaForUtil.ClearLinePrefixSymbol(arg_837_1.text_)

				local var_840_5 = 20
				local var_840_6 = utf8.len(var_840_4)
				local var_840_7 = var_840_5 <= 0 and var_840_1 or var_840_1 * (var_840_6 / var_840_5)

				if var_840_7 > 0 and var_840_1 < var_840_7 then
					arg_837_1.talkMaxDuration = var_840_7

					if var_840_7 + var_840_0 > arg_837_1.duration_ then
						arg_837_1.duration_ = var_840_7 + var_840_0
					end
				end

				arg_837_1.text_.text = var_840_4
				arg_837_1.typewritter.percent = 0

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011202", "story_v_out_123011.awb") ~= 0 then
					local var_840_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011202", "story_v_out_123011.awb") / 1000

					if var_840_8 + var_840_0 > arg_837_1.duration_ then
						arg_837_1.duration_ = var_840_8 + var_840_0
					end

					if var_840_3.prefab_name ~= "" and arg_837_1.actors_[var_840_3.prefab_name] ~= nil then
						local var_840_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_837_1.actors_[var_840_3.prefab_name].transform, "story_v_out_123011", "123011202", "story_v_out_123011.awb")

						arg_837_1:RecordAudio("123011202", var_840_9)
						arg_837_1:RecordAudio("123011202", var_840_9)
					else
						arg_837_1:AudioAction("play", "voice", "story_v_out_123011", "123011202", "story_v_out_123011.awb")
					end

					arg_837_1:RecordHistoryTalkVoice("story_v_out_123011", "123011202", "story_v_out_123011.awb")
				end

				arg_837_1:RecordContent(arg_837_1.text_.text)
			end

			local var_840_10 = math.max(var_840_1, arg_837_1.talkMaxDuration)

			if var_840_0 <= arg_837_1.time_ and arg_837_1.time_ < var_840_0 + var_840_10 then
				arg_837_1.typewritter.percent = (arg_837_1.time_ - var_840_0) / var_840_10

				arg_837_1.typewritter:SetDirty()
			end

			if arg_837_1.time_ >= var_840_0 + var_840_10 and arg_837_1.time_ < var_840_0 + var_840_10 + arg_840_0 then
				arg_837_1.typewritter.percent = 1

				arg_837_1.typewritter:SetDirty()
				arg_837_1:ShowNextGo(true)
			end
		end
	end,
	Play123011203 = function(arg_841_0, arg_841_1)
		arg_841_1.time_ = 0
		arg_841_1.frameCnt_ = 0
		arg_841_1.state_ = "playing"
		arg_841_1.curTalkId_ = 123011203
		arg_841_1.duration_ = 4.266

		local var_841_0 = {
			zh = 3.1,
			ja = 4.266
		}
		local var_841_1 = manager.audio:GetLocalizationFlag()

		if var_841_0[var_841_1] ~= nil then
			arg_841_1.duration_ = var_841_0[var_841_1]
		end

		SetActive(arg_841_1.tipsGo_, false)

		function arg_841_1.onSingleLineFinish_()
			arg_841_1.onSingleLineUpdate_ = nil
			arg_841_1.onSingleLineFinish_ = nil
			arg_841_1.state_ = "waiting"
		end

		function arg_841_1.playNext_(arg_843_0)
			if arg_843_0 == 1 then
				arg_841_0:Play123011204(arg_841_1)
			end
		end

		function arg_841_1.onSingleLineUpdate_(arg_844_0)
			local var_844_0 = 0
			local var_844_1 = 0.475

			if var_844_0 < arg_841_1.time_ and arg_841_1.time_ <= var_844_0 + arg_844_0 then
				arg_841_1.talkMaxDuration = 0
				arg_841_1.dialogCg_.alpha = 1

				arg_841_1.dialog_:SetActive(true)
				SetActive(arg_841_1.leftNameGo_, true)

				local var_844_2 = arg_841_1:FormatText(StoryNameCfg[13].name)

				arg_841_1.leftNameTxt_.text = var_844_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_841_1.leftNameTxt_.transform)

				arg_841_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_841_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_841_1:RecordName(arg_841_1.leftNameTxt_.text)
				SetActive(arg_841_1.iconTrs_.gameObject, true)
				arg_841_1.iconController_:SetSelectedState("hero")

				arg_841_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_1")

				arg_841_1.callingController_:SetSelectedState("normal")

				local var_844_3 = arg_841_1:GetWordFromCfg(123011203)
				local var_844_4 = arg_841_1:FormatText(var_844_3.content)

				arg_841_1.text_.text = var_844_4

				LuaForUtil.ClearLinePrefixSymbol(arg_841_1.text_)

				local var_844_5 = 19
				local var_844_6 = utf8.len(var_844_4)
				local var_844_7 = var_844_5 <= 0 and var_844_1 or var_844_1 * (var_844_6 / var_844_5)

				if var_844_7 > 0 and var_844_1 < var_844_7 then
					arg_841_1.talkMaxDuration = var_844_7

					if var_844_7 + var_844_0 > arg_841_1.duration_ then
						arg_841_1.duration_ = var_844_7 + var_844_0
					end
				end

				arg_841_1.text_.text = var_844_4
				arg_841_1.typewritter.percent = 0

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011203", "story_v_out_123011.awb") ~= 0 then
					local var_844_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011203", "story_v_out_123011.awb") / 1000

					if var_844_8 + var_844_0 > arg_841_1.duration_ then
						arg_841_1.duration_ = var_844_8 + var_844_0
					end

					if var_844_3.prefab_name ~= "" and arg_841_1.actors_[var_844_3.prefab_name] ~= nil then
						local var_844_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_841_1.actors_[var_844_3.prefab_name].transform, "story_v_out_123011", "123011203", "story_v_out_123011.awb")

						arg_841_1:RecordAudio("123011203", var_844_9)
						arg_841_1:RecordAudio("123011203", var_844_9)
					else
						arg_841_1:AudioAction("play", "voice", "story_v_out_123011", "123011203", "story_v_out_123011.awb")
					end

					arg_841_1:RecordHistoryTalkVoice("story_v_out_123011", "123011203", "story_v_out_123011.awb")
				end

				arg_841_1:RecordContent(arg_841_1.text_.text)
			end

			local var_844_10 = math.max(var_844_1, arg_841_1.talkMaxDuration)

			if var_844_0 <= arg_841_1.time_ and arg_841_1.time_ < var_844_0 + var_844_10 then
				arg_841_1.typewritter.percent = (arg_841_1.time_ - var_844_0) / var_844_10

				arg_841_1.typewritter:SetDirty()
			end

			if arg_841_1.time_ >= var_844_0 + var_844_10 and arg_841_1.time_ < var_844_0 + var_844_10 + arg_844_0 then
				arg_841_1.typewritter.percent = 1

				arg_841_1.typewritter:SetDirty()
				arg_841_1:ShowNextGo(true)
			end
		end
	end,
	Play123011204 = function(arg_845_0, arg_845_1)
		arg_845_1.time_ = 0
		arg_845_1.frameCnt_ = 0
		arg_845_1.state_ = "playing"
		arg_845_1.curTalkId_ = 123011204
		arg_845_1.duration_ = 9

		SetActive(arg_845_1.tipsGo_, false)

		function arg_845_1.onSingleLineFinish_()
			arg_845_1.onSingleLineUpdate_ = nil
			arg_845_1.onSingleLineFinish_ = nil
			arg_845_1.state_ = "waiting"
		end

		function arg_845_1.playNext_(arg_847_0)
			if arg_847_0 == 1 then
				arg_845_0:Play123011205(arg_845_1)
			end
		end

		function arg_845_1.onSingleLineUpdate_(arg_848_0)
			local var_848_0 = "B13"

			if arg_845_1.bgs_[var_848_0] == nil then
				local var_848_1 = Object.Instantiate(arg_845_1.paintGo_)

				var_848_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_848_0)
				var_848_1.name = var_848_0
				var_848_1.transform.parent = arg_845_1.stage_.transform
				var_848_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_845_1.bgs_[var_848_0] = var_848_1
			end

			local var_848_2 = 2

			if var_848_2 < arg_845_1.time_ and arg_845_1.time_ <= var_848_2 + arg_848_0 then
				local var_848_3 = manager.ui.mainCamera.transform.localPosition
				local var_848_4 = Vector3.New(0, 0, 10) + Vector3.New(var_848_3.x, var_848_3.y, 0)
				local var_848_5 = arg_845_1.bgs_.B13

				var_848_5.transform.localPosition = var_848_4
				var_848_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_848_6 = var_848_5:GetComponent("SpriteRenderer")

				if var_848_6 and var_848_6.sprite then
					local var_848_7 = (var_848_5.transform.localPosition - var_848_3).z
					local var_848_8 = manager.ui.mainCameraCom_
					local var_848_9 = 2 * var_848_7 * Mathf.Tan(var_848_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_848_10 = var_848_9 * var_848_8.aspect
					local var_848_11 = var_848_6.sprite.bounds.size.x
					local var_848_12 = var_848_6.sprite.bounds.size.y
					local var_848_13 = var_848_10 / var_848_11
					local var_848_14 = var_848_9 / var_848_12
					local var_848_15 = var_848_14 < var_848_13 and var_848_13 or var_848_14

					var_848_5.transform.localScale = Vector3.New(var_848_15, var_848_15, 0)
				end

				for iter_848_0, iter_848_1 in pairs(arg_845_1.bgs_) do
					if iter_848_0 ~= "B13" then
						iter_848_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_848_16 = 0

			if var_848_16 < arg_845_1.time_ and arg_845_1.time_ <= var_848_16 + arg_848_0 then
				arg_845_1.mask_.enabled = true
				arg_845_1.mask_.raycastTarget = true

				arg_845_1:SetGaussion(false)
			end

			local var_848_17 = 2

			if var_848_16 <= arg_845_1.time_ and arg_845_1.time_ < var_848_16 + var_848_17 then
				local var_848_18 = (arg_845_1.time_ - var_848_16) / var_848_17
				local var_848_19 = Color.New(0, 0, 0)

				var_848_19.a = Mathf.Lerp(0, 1, var_848_18)
				arg_845_1.mask_.color = var_848_19
			end

			if arg_845_1.time_ >= var_848_16 + var_848_17 and arg_845_1.time_ < var_848_16 + var_848_17 + arg_848_0 then
				local var_848_20 = Color.New(0, 0, 0)

				var_848_20.a = 1
				arg_845_1.mask_.color = var_848_20
			end

			local var_848_21 = 2

			if var_848_21 < arg_845_1.time_ and arg_845_1.time_ <= var_848_21 + arg_848_0 then
				arg_845_1.mask_.enabled = true
				arg_845_1.mask_.raycastTarget = true

				arg_845_1:SetGaussion(false)
			end

			local var_848_22 = 2

			if var_848_21 <= arg_845_1.time_ and arg_845_1.time_ < var_848_21 + var_848_22 then
				local var_848_23 = (arg_845_1.time_ - var_848_21) / var_848_22
				local var_848_24 = Color.New(0, 0, 0)

				var_848_24.a = Mathf.Lerp(1, 0, var_848_23)
				arg_845_1.mask_.color = var_848_24
			end

			if arg_845_1.time_ >= var_848_21 + var_848_22 and arg_845_1.time_ < var_848_21 + var_848_22 + arg_848_0 then
				local var_848_25 = Color.New(0, 0, 0)
				local var_848_26 = 0

				arg_845_1.mask_.enabled = false
				var_848_25.a = var_848_26
				arg_845_1.mask_.color = var_848_25
			end

			if arg_845_1.frameCnt_ <= 1 then
				arg_845_1.dialog_:SetActive(false)
			end

			local var_848_27 = 4
			local var_848_28 = 0.575

			if var_848_27 < arg_845_1.time_ and arg_845_1.time_ <= var_848_27 + arg_848_0 then
				arg_845_1.talkMaxDuration = 0

				arg_845_1.dialog_:SetActive(true)

				local var_848_29 = LeanTween.value(arg_845_1.dialog_, 0, 1, 0.3)

				var_848_29:setOnUpdate(LuaHelper.FloatAction(function(arg_849_0)
					arg_845_1.dialogCg_.alpha = arg_849_0
				end))
				var_848_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_845_1.dialog_)
					var_848_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_845_1.duration_ = arg_845_1.duration_ + 0.3

				SetActive(arg_845_1.leftNameGo_, false)

				arg_845_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_845_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_845_1:RecordName(arg_845_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_845_1.iconTrs_.gameObject, false)
				arg_845_1.callingController_:SetSelectedState("normal")

				local var_848_30 = arg_845_1:GetWordFromCfg(123011204)
				local var_848_31 = arg_845_1:FormatText(var_848_30.content)

				arg_845_1.text_.text = var_848_31

				LuaForUtil.ClearLinePrefixSymbol(arg_845_1.text_)

				local var_848_32 = 23
				local var_848_33 = utf8.len(var_848_31)
				local var_848_34 = var_848_32 <= 0 and var_848_28 or var_848_28 * (var_848_33 / var_848_32)

				if var_848_34 > 0 and var_848_28 < var_848_34 then
					arg_845_1.talkMaxDuration = var_848_34
					var_848_27 = var_848_27 + 0.3

					if var_848_34 + var_848_27 > arg_845_1.duration_ then
						arg_845_1.duration_ = var_848_34 + var_848_27
					end
				end

				arg_845_1.text_.text = var_848_31
				arg_845_1.typewritter.percent = 0

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(false)
				arg_845_1:RecordContent(arg_845_1.text_.text)
			end

			local var_848_35 = var_848_27 + 0.3
			local var_848_36 = math.max(var_848_28, arg_845_1.talkMaxDuration)

			if var_848_35 <= arg_845_1.time_ and arg_845_1.time_ < var_848_35 + var_848_36 then
				arg_845_1.typewritter.percent = (arg_845_1.time_ - var_848_35) / var_848_36

				arg_845_1.typewritter:SetDirty()
			end

			if arg_845_1.time_ >= var_848_35 + var_848_36 and arg_845_1.time_ < var_848_35 + var_848_36 + arg_848_0 then
				arg_845_1.typewritter.percent = 1

				arg_845_1.typewritter:SetDirty()
				arg_845_1:ShowNextGo(true)
			end
		end
	end,
	Play123011205 = function(arg_851_0, arg_851_1)
		arg_851_1.time_ = 0
		arg_851_1.frameCnt_ = 0
		arg_851_1.state_ = "playing"
		arg_851_1.curTalkId_ = 123011205
		arg_851_1.duration_ = 7.966

		local var_851_0 = {
			zh = 5.066,
			ja = 7.966
		}
		local var_851_1 = manager.audio:GetLocalizationFlag()

		if var_851_0[var_851_1] ~= nil then
			arg_851_1.duration_ = var_851_0[var_851_1]
		end

		SetActive(arg_851_1.tipsGo_, false)

		function arg_851_1.onSingleLineFinish_()
			arg_851_1.onSingleLineUpdate_ = nil
			arg_851_1.onSingleLineFinish_ = nil
			arg_851_1.state_ = "waiting"
		end

		function arg_851_1.playNext_(arg_853_0)
			if arg_853_0 == 1 then
				arg_851_0:Play123011206(arg_851_1)
			end
		end

		function arg_851_1.onSingleLineUpdate_(arg_854_0)
			local var_854_0 = arg_851_1.actors_["1019ui_story"].transform
			local var_854_1 = 0

			if var_854_1 < arg_851_1.time_ and arg_851_1.time_ <= var_854_1 + arg_854_0 then
				arg_851_1.var_.moveOldPos1019ui_story = var_854_0.localPosition
			end

			local var_854_2 = 0.001

			if var_854_1 <= arg_851_1.time_ and arg_851_1.time_ < var_854_1 + var_854_2 then
				local var_854_3 = (arg_851_1.time_ - var_854_1) / var_854_2
				local var_854_4 = Vector3.New(0, -1.08, -5.9)

				var_854_0.localPosition = Vector3.Lerp(arg_851_1.var_.moveOldPos1019ui_story, var_854_4, var_854_3)

				local var_854_5 = manager.ui.mainCamera.transform.position - var_854_0.position

				var_854_0.forward = Vector3.New(var_854_5.x, var_854_5.y, var_854_5.z)

				local var_854_6 = var_854_0.localEulerAngles

				var_854_6.z = 0
				var_854_6.x = 0
				var_854_0.localEulerAngles = var_854_6
			end

			if arg_851_1.time_ >= var_854_1 + var_854_2 and arg_851_1.time_ < var_854_1 + var_854_2 + arg_854_0 then
				var_854_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_854_7 = manager.ui.mainCamera.transform.position - var_854_0.position

				var_854_0.forward = Vector3.New(var_854_7.x, var_854_7.y, var_854_7.z)

				local var_854_8 = var_854_0.localEulerAngles

				var_854_8.z = 0
				var_854_8.x = 0
				var_854_0.localEulerAngles = var_854_8
			end

			local var_854_9 = arg_851_1.actors_["1019ui_story"]
			local var_854_10 = 0

			if var_854_10 < arg_851_1.time_ and arg_851_1.time_ <= var_854_10 + arg_854_0 and arg_851_1.var_.characterEffect1019ui_story == nil then
				arg_851_1.var_.characterEffect1019ui_story = var_854_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_854_11 = 0.200000002980232

			if var_854_10 <= arg_851_1.time_ and arg_851_1.time_ < var_854_10 + var_854_11 then
				local var_854_12 = (arg_851_1.time_ - var_854_10) / var_854_11

				if arg_851_1.var_.characterEffect1019ui_story then
					arg_851_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_851_1.time_ >= var_854_10 + var_854_11 and arg_851_1.time_ < var_854_10 + var_854_11 + arg_854_0 and arg_851_1.var_.characterEffect1019ui_story then
				arg_851_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_854_13 = 0

			if var_854_13 < arg_851_1.time_ and arg_851_1.time_ <= var_854_13 + arg_854_0 then
				arg_851_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_854_14 = 0

			if var_854_14 < arg_851_1.time_ and arg_851_1.time_ <= var_854_14 + arg_854_0 then
				arg_851_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_854_15 = 0
			local var_854_16 = 0.6

			if var_854_15 < arg_851_1.time_ and arg_851_1.time_ <= var_854_15 + arg_854_0 then
				arg_851_1.talkMaxDuration = 0
				arg_851_1.dialogCg_.alpha = 1

				arg_851_1.dialog_:SetActive(true)
				SetActive(arg_851_1.leftNameGo_, true)

				local var_854_17 = arg_851_1:FormatText(StoryNameCfg[13].name)

				arg_851_1.leftNameTxt_.text = var_854_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_851_1.leftNameTxt_.transform)

				arg_851_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_851_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_851_1:RecordName(arg_851_1.leftNameTxt_.text)
				SetActive(arg_851_1.iconTrs_.gameObject, false)
				arg_851_1.callingController_:SetSelectedState("normal")

				local var_854_18 = arg_851_1:GetWordFromCfg(123011205)
				local var_854_19 = arg_851_1:FormatText(var_854_18.content)

				arg_851_1.text_.text = var_854_19

				LuaForUtil.ClearLinePrefixSymbol(arg_851_1.text_)

				local var_854_20 = 24
				local var_854_21 = utf8.len(var_854_19)
				local var_854_22 = var_854_20 <= 0 and var_854_16 or var_854_16 * (var_854_21 / var_854_20)

				if var_854_22 > 0 and var_854_16 < var_854_22 then
					arg_851_1.talkMaxDuration = var_854_22

					if var_854_22 + var_854_15 > arg_851_1.duration_ then
						arg_851_1.duration_ = var_854_22 + var_854_15
					end
				end

				arg_851_1.text_.text = var_854_19
				arg_851_1.typewritter.percent = 0

				arg_851_1.typewritter:SetDirty()
				arg_851_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011205", "story_v_out_123011.awb") ~= 0 then
					local var_854_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011205", "story_v_out_123011.awb") / 1000

					if var_854_23 + var_854_15 > arg_851_1.duration_ then
						arg_851_1.duration_ = var_854_23 + var_854_15
					end

					if var_854_18.prefab_name ~= "" and arg_851_1.actors_[var_854_18.prefab_name] ~= nil then
						local var_854_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_851_1.actors_[var_854_18.prefab_name].transform, "story_v_out_123011", "123011205", "story_v_out_123011.awb")

						arg_851_1:RecordAudio("123011205", var_854_24)
						arg_851_1:RecordAudio("123011205", var_854_24)
					else
						arg_851_1:AudioAction("play", "voice", "story_v_out_123011", "123011205", "story_v_out_123011.awb")
					end

					arg_851_1:RecordHistoryTalkVoice("story_v_out_123011", "123011205", "story_v_out_123011.awb")
				end

				arg_851_1:RecordContent(arg_851_1.text_.text)
			end

			local var_854_25 = math.max(var_854_16, arg_851_1.talkMaxDuration)

			if var_854_15 <= arg_851_1.time_ and arg_851_1.time_ < var_854_15 + var_854_25 then
				arg_851_1.typewritter.percent = (arg_851_1.time_ - var_854_15) / var_854_25

				arg_851_1.typewritter:SetDirty()
			end

			if arg_851_1.time_ >= var_854_15 + var_854_25 and arg_851_1.time_ < var_854_15 + var_854_25 + arg_854_0 then
				arg_851_1.typewritter.percent = 1

				arg_851_1.typewritter:SetDirty()
				arg_851_1:ShowNextGo(true)
			end
		end
	end,
	Play123011206 = function(arg_855_0, arg_855_1)
		arg_855_1.time_ = 0
		arg_855_1.frameCnt_ = 0
		arg_855_1.state_ = "playing"
		arg_855_1.curTalkId_ = 123011206
		arg_855_1.duration_ = 5

		SetActive(arg_855_1.tipsGo_, false)

		function arg_855_1.onSingleLineFinish_()
			arg_855_1.onSingleLineUpdate_ = nil
			arg_855_1.onSingleLineFinish_ = nil
			arg_855_1.state_ = "waiting"
		end

		function arg_855_1.playNext_(arg_857_0)
			if arg_857_0 == 1 then
				arg_855_0:Play123011207(arg_855_1)
			end
		end

		function arg_855_1.onSingleLineUpdate_(arg_858_0)
			local var_858_0 = arg_855_1.actors_["1019ui_story"]
			local var_858_1 = 0

			if var_858_1 < arg_855_1.time_ and arg_855_1.time_ <= var_858_1 + arg_858_0 and arg_855_1.var_.characterEffect1019ui_story == nil then
				arg_855_1.var_.characterEffect1019ui_story = var_858_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_858_2 = 0.200000002980232

			if var_858_1 <= arg_855_1.time_ and arg_855_1.time_ < var_858_1 + var_858_2 then
				local var_858_3 = (arg_855_1.time_ - var_858_1) / var_858_2

				if arg_855_1.var_.characterEffect1019ui_story then
					local var_858_4 = Mathf.Lerp(0, 0.5, var_858_3)

					arg_855_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_855_1.var_.characterEffect1019ui_story.fillRatio = var_858_4
				end
			end

			if arg_855_1.time_ >= var_858_1 + var_858_2 and arg_855_1.time_ < var_858_1 + var_858_2 + arg_858_0 and arg_855_1.var_.characterEffect1019ui_story then
				local var_858_5 = 0.5

				arg_855_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_855_1.var_.characterEffect1019ui_story.fillRatio = var_858_5
			end

			local var_858_6 = 0
			local var_858_7 = 0.45

			if var_858_6 < arg_855_1.time_ and arg_855_1.time_ <= var_858_6 + arg_858_0 then
				arg_855_1.talkMaxDuration = 0
				arg_855_1.dialogCg_.alpha = 1

				arg_855_1.dialog_:SetActive(true)
				SetActive(arg_855_1.leftNameGo_, true)

				local var_858_8 = arg_855_1:FormatText(StoryNameCfg[7].name)

				arg_855_1.leftNameTxt_.text = var_858_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_855_1.leftNameTxt_.transform)

				arg_855_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_855_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_855_1:RecordName(arg_855_1.leftNameTxt_.text)
				SetActive(arg_855_1.iconTrs_.gameObject, false)
				arg_855_1.callingController_:SetSelectedState("normal")

				local var_858_9 = arg_855_1:GetWordFromCfg(123011206)
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
				arg_855_1:RecordContent(arg_855_1.text_.text)
			end

			local var_858_14 = math.max(var_858_7, arg_855_1.talkMaxDuration)

			if var_858_6 <= arg_855_1.time_ and arg_855_1.time_ < var_858_6 + var_858_14 then
				arg_855_1.typewritter.percent = (arg_855_1.time_ - var_858_6) / var_858_14

				arg_855_1.typewritter:SetDirty()
			end

			if arg_855_1.time_ >= var_858_6 + var_858_14 and arg_855_1.time_ < var_858_6 + var_858_14 + arg_858_0 then
				arg_855_1.typewritter.percent = 1

				arg_855_1.typewritter:SetDirty()
				arg_855_1:ShowNextGo(true)
			end
		end
	end,
	Play123011207 = function(arg_859_0, arg_859_1)
		arg_859_1.time_ = 0
		arg_859_1.frameCnt_ = 0
		arg_859_1.state_ = "playing"
		arg_859_1.curTalkId_ = 123011207
		arg_859_1.duration_ = 11.6

		local var_859_0 = {
			zh = 8.1,
			ja = 11.6
		}
		local var_859_1 = manager.audio:GetLocalizationFlag()

		if var_859_0[var_859_1] ~= nil then
			arg_859_1.duration_ = var_859_0[var_859_1]
		end

		SetActive(arg_859_1.tipsGo_, false)

		function arg_859_1.onSingleLineFinish_()
			arg_859_1.onSingleLineUpdate_ = nil
			arg_859_1.onSingleLineFinish_ = nil
			arg_859_1.state_ = "waiting"
		end

		function arg_859_1.playNext_(arg_861_0)
			if arg_861_0 == 1 then
				arg_859_0:Play123011208(arg_859_1)
			end
		end

		function arg_859_1.onSingleLineUpdate_(arg_862_0)
			local var_862_0 = arg_859_1.actors_["1019ui_story"]
			local var_862_1 = 0

			if var_862_1 < arg_859_1.time_ and arg_859_1.time_ <= var_862_1 + arg_862_0 and arg_859_1.var_.characterEffect1019ui_story == nil then
				arg_859_1.var_.characterEffect1019ui_story = var_862_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_862_2 = 0.200000002980232

			if var_862_1 <= arg_859_1.time_ and arg_859_1.time_ < var_862_1 + var_862_2 then
				local var_862_3 = (arg_859_1.time_ - var_862_1) / var_862_2

				if arg_859_1.var_.characterEffect1019ui_story then
					arg_859_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_859_1.time_ >= var_862_1 + var_862_2 and arg_859_1.time_ < var_862_1 + var_862_2 + arg_862_0 and arg_859_1.var_.characterEffect1019ui_story then
				arg_859_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_862_4 = 0

			if var_862_4 < arg_859_1.time_ and arg_859_1.time_ <= var_862_4 + arg_862_0 then
				arg_859_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_862_5 = 0

			if var_862_5 < arg_859_1.time_ and arg_859_1.time_ <= var_862_5 + arg_862_0 then
				arg_859_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_862_6 = 0
			local var_862_7 = 1.025

			if var_862_6 < arg_859_1.time_ and arg_859_1.time_ <= var_862_6 + arg_862_0 then
				arg_859_1.talkMaxDuration = 0
				arg_859_1.dialogCg_.alpha = 1

				arg_859_1.dialog_:SetActive(true)
				SetActive(arg_859_1.leftNameGo_, true)

				local var_862_8 = arg_859_1:FormatText(StoryNameCfg[13].name)

				arg_859_1.leftNameTxt_.text = var_862_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_859_1.leftNameTxt_.transform)

				arg_859_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_859_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_859_1:RecordName(arg_859_1.leftNameTxt_.text)
				SetActive(arg_859_1.iconTrs_.gameObject, false)
				arg_859_1.callingController_:SetSelectedState("normal")

				local var_862_9 = arg_859_1:GetWordFromCfg(123011207)
				local var_862_10 = arg_859_1:FormatText(var_862_9.content)

				arg_859_1.text_.text = var_862_10

				LuaForUtil.ClearLinePrefixSymbol(arg_859_1.text_)

				local var_862_11 = 41
				local var_862_12 = utf8.len(var_862_10)
				local var_862_13 = var_862_11 <= 0 and var_862_7 or var_862_7 * (var_862_12 / var_862_11)

				if var_862_13 > 0 and var_862_7 < var_862_13 then
					arg_859_1.talkMaxDuration = var_862_13

					if var_862_13 + var_862_6 > arg_859_1.duration_ then
						arg_859_1.duration_ = var_862_13 + var_862_6
					end
				end

				arg_859_1.text_.text = var_862_10
				arg_859_1.typewritter.percent = 0

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011207", "story_v_out_123011.awb") ~= 0 then
					local var_862_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011207", "story_v_out_123011.awb") / 1000

					if var_862_14 + var_862_6 > arg_859_1.duration_ then
						arg_859_1.duration_ = var_862_14 + var_862_6
					end

					if var_862_9.prefab_name ~= "" and arg_859_1.actors_[var_862_9.prefab_name] ~= nil then
						local var_862_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_859_1.actors_[var_862_9.prefab_name].transform, "story_v_out_123011", "123011207", "story_v_out_123011.awb")

						arg_859_1:RecordAudio("123011207", var_862_15)
						arg_859_1:RecordAudio("123011207", var_862_15)
					else
						arg_859_1:AudioAction("play", "voice", "story_v_out_123011", "123011207", "story_v_out_123011.awb")
					end

					arg_859_1:RecordHistoryTalkVoice("story_v_out_123011", "123011207", "story_v_out_123011.awb")
				end

				arg_859_1:RecordContent(arg_859_1.text_.text)
			end

			local var_862_16 = math.max(var_862_7, arg_859_1.talkMaxDuration)

			if var_862_6 <= arg_859_1.time_ and arg_859_1.time_ < var_862_6 + var_862_16 then
				arg_859_1.typewritter.percent = (arg_859_1.time_ - var_862_6) / var_862_16

				arg_859_1.typewritter:SetDirty()
			end

			if arg_859_1.time_ >= var_862_6 + var_862_16 and arg_859_1.time_ < var_862_6 + var_862_16 + arg_862_0 then
				arg_859_1.typewritter.percent = 1

				arg_859_1.typewritter:SetDirty()
				arg_859_1:ShowNextGo(true)
			end
		end
	end,
	Play123011208 = function(arg_863_0, arg_863_1)
		arg_863_1.time_ = 0
		arg_863_1.frameCnt_ = 0
		arg_863_1.state_ = "playing"
		arg_863_1.curTalkId_ = 123011208
		arg_863_1.duration_ = 11.466

		local var_863_0 = {
			zh = 7.6,
			ja = 11.466
		}
		local var_863_1 = manager.audio:GetLocalizationFlag()

		if var_863_0[var_863_1] ~= nil then
			arg_863_1.duration_ = var_863_0[var_863_1]
		end

		SetActive(arg_863_1.tipsGo_, false)

		function arg_863_1.onSingleLineFinish_()
			arg_863_1.onSingleLineUpdate_ = nil
			arg_863_1.onSingleLineFinish_ = nil
			arg_863_1.state_ = "waiting"
		end

		function arg_863_1.playNext_(arg_865_0)
			if arg_865_0 == 1 then
				arg_863_0:Play123011209(arg_863_1)
			end
		end

		function arg_863_1.onSingleLineUpdate_(arg_866_0)
			local var_866_0 = 0
			local var_866_1 = 0.95

			if var_866_0 < arg_863_1.time_ and arg_863_1.time_ <= var_866_0 + arg_866_0 then
				arg_863_1.talkMaxDuration = 0
				arg_863_1.dialogCg_.alpha = 1

				arg_863_1.dialog_:SetActive(true)
				SetActive(arg_863_1.leftNameGo_, true)

				local var_866_2 = arg_863_1:FormatText(StoryNameCfg[13].name)

				arg_863_1.leftNameTxt_.text = var_866_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_863_1.leftNameTxt_.transform)

				arg_863_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_863_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_863_1:RecordName(arg_863_1.leftNameTxt_.text)
				SetActive(arg_863_1.iconTrs_.gameObject, false)
				arg_863_1.callingController_:SetSelectedState("normal")

				local var_866_3 = arg_863_1:GetWordFromCfg(123011208)
				local var_866_4 = arg_863_1:FormatText(var_866_3.content)

				arg_863_1.text_.text = var_866_4

				LuaForUtil.ClearLinePrefixSymbol(arg_863_1.text_)

				local var_866_5 = 38
				local var_866_6 = utf8.len(var_866_4)
				local var_866_7 = var_866_5 <= 0 and var_866_1 or var_866_1 * (var_866_6 / var_866_5)

				if var_866_7 > 0 and var_866_1 < var_866_7 then
					arg_863_1.talkMaxDuration = var_866_7

					if var_866_7 + var_866_0 > arg_863_1.duration_ then
						arg_863_1.duration_ = var_866_7 + var_866_0
					end
				end

				arg_863_1.text_.text = var_866_4
				arg_863_1.typewritter.percent = 0

				arg_863_1.typewritter:SetDirty()
				arg_863_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011208", "story_v_out_123011.awb") ~= 0 then
					local var_866_8 = manager.audio:GetVoiceLength("story_v_out_123011", "123011208", "story_v_out_123011.awb") / 1000

					if var_866_8 + var_866_0 > arg_863_1.duration_ then
						arg_863_1.duration_ = var_866_8 + var_866_0
					end

					if var_866_3.prefab_name ~= "" and arg_863_1.actors_[var_866_3.prefab_name] ~= nil then
						local var_866_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_863_1.actors_[var_866_3.prefab_name].transform, "story_v_out_123011", "123011208", "story_v_out_123011.awb")

						arg_863_1:RecordAudio("123011208", var_866_9)
						arg_863_1:RecordAudio("123011208", var_866_9)
					else
						arg_863_1:AudioAction("play", "voice", "story_v_out_123011", "123011208", "story_v_out_123011.awb")
					end

					arg_863_1:RecordHistoryTalkVoice("story_v_out_123011", "123011208", "story_v_out_123011.awb")
				end

				arg_863_1:RecordContent(arg_863_1.text_.text)
			end

			local var_866_10 = math.max(var_866_1, arg_863_1.talkMaxDuration)

			if var_866_0 <= arg_863_1.time_ and arg_863_1.time_ < var_866_0 + var_866_10 then
				arg_863_1.typewritter.percent = (arg_863_1.time_ - var_866_0) / var_866_10

				arg_863_1.typewritter:SetDirty()
			end

			if arg_863_1.time_ >= var_866_0 + var_866_10 and arg_863_1.time_ < var_866_0 + var_866_10 + arg_866_0 then
				arg_863_1.typewritter.percent = 1

				arg_863_1.typewritter:SetDirty()
				arg_863_1:ShowNextGo(true)
			end
		end
	end,
	Play123011209 = function(arg_867_0, arg_867_1)
		arg_867_1.time_ = 0
		arg_867_1.frameCnt_ = 0
		arg_867_1.state_ = "playing"
		arg_867_1.curTalkId_ = 123011209
		arg_867_1.duration_ = 5

		SetActive(arg_867_1.tipsGo_, false)

		function arg_867_1.onSingleLineFinish_()
			arg_867_1.onSingleLineUpdate_ = nil
			arg_867_1.onSingleLineFinish_ = nil
			arg_867_1.state_ = "waiting"
		end

		function arg_867_1.playNext_(arg_869_0)
			if arg_869_0 == 1 then
				arg_867_0:Play123011210(arg_867_1)
			end
		end

		function arg_867_1.onSingleLineUpdate_(arg_870_0)
			local var_870_0 = arg_867_1.actors_["1019ui_story"]
			local var_870_1 = 0

			if var_870_1 < arg_867_1.time_ and arg_867_1.time_ <= var_870_1 + arg_870_0 and arg_867_1.var_.characterEffect1019ui_story == nil then
				arg_867_1.var_.characterEffect1019ui_story = var_870_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_870_2 = 0.200000002980232

			if var_870_1 <= arg_867_1.time_ and arg_867_1.time_ < var_870_1 + var_870_2 then
				local var_870_3 = (arg_867_1.time_ - var_870_1) / var_870_2

				if arg_867_1.var_.characterEffect1019ui_story then
					local var_870_4 = Mathf.Lerp(0, 0.5, var_870_3)

					arg_867_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_867_1.var_.characterEffect1019ui_story.fillRatio = var_870_4
				end
			end

			if arg_867_1.time_ >= var_870_1 + var_870_2 and arg_867_1.time_ < var_870_1 + var_870_2 + arg_870_0 and arg_867_1.var_.characterEffect1019ui_story then
				local var_870_5 = 0.5

				arg_867_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_867_1.var_.characterEffect1019ui_story.fillRatio = var_870_5
			end

			local var_870_6 = 0
			local var_870_7 = 1.525

			if var_870_6 < arg_867_1.time_ and arg_867_1.time_ <= var_870_6 + arg_870_0 then
				arg_867_1.talkMaxDuration = 0
				arg_867_1.dialogCg_.alpha = 1

				arg_867_1.dialog_:SetActive(true)
				SetActive(arg_867_1.leftNameGo_, true)

				local var_870_8 = arg_867_1:FormatText(StoryNameCfg[7].name)

				arg_867_1.leftNameTxt_.text = var_870_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_867_1.leftNameTxt_.transform)

				arg_867_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_867_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_867_1:RecordName(arg_867_1.leftNameTxt_.text)
				SetActive(arg_867_1.iconTrs_.gameObject, false)
				arg_867_1.callingController_:SetSelectedState("normal")

				local var_870_9 = arg_867_1:GetWordFromCfg(123011209)
				local var_870_10 = arg_867_1:FormatText(var_870_9.content)

				arg_867_1.text_.text = var_870_10

				LuaForUtil.ClearLinePrefixSymbol(arg_867_1.text_)

				local var_870_11 = 61
				local var_870_12 = utf8.len(var_870_10)
				local var_870_13 = var_870_11 <= 0 and var_870_7 or var_870_7 * (var_870_12 / var_870_11)

				if var_870_13 > 0 and var_870_7 < var_870_13 then
					arg_867_1.talkMaxDuration = var_870_13

					if var_870_13 + var_870_6 > arg_867_1.duration_ then
						arg_867_1.duration_ = var_870_13 + var_870_6
					end
				end

				arg_867_1.text_.text = var_870_10
				arg_867_1.typewritter.percent = 0

				arg_867_1.typewritter:SetDirty()
				arg_867_1:ShowNextGo(false)
				arg_867_1:RecordContent(arg_867_1.text_.text)
			end

			local var_870_14 = math.max(var_870_7, arg_867_1.talkMaxDuration)

			if var_870_6 <= arg_867_1.time_ and arg_867_1.time_ < var_870_6 + var_870_14 then
				arg_867_1.typewritter.percent = (arg_867_1.time_ - var_870_6) / var_870_14

				arg_867_1.typewritter:SetDirty()
			end

			if arg_867_1.time_ >= var_870_6 + var_870_14 and arg_867_1.time_ < var_870_6 + var_870_14 + arg_870_0 then
				arg_867_1.typewritter.percent = 1

				arg_867_1.typewritter:SetDirty()
				arg_867_1:ShowNextGo(true)
			end
		end
	end,
	Play123011210 = function(arg_871_0, arg_871_1)
		arg_871_1.time_ = 0
		arg_871_1.frameCnt_ = 0
		arg_871_1.state_ = "playing"
		arg_871_1.curTalkId_ = 123011210
		arg_871_1.duration_ = 2.333

		local var_871_0 = {
			zh = 2.333,
			ja = 2.266
		}
		local var_871_1 = manager.audio:GetLocalizationFlag()

		if var_871_0[var_871_1] ~= nil then
			arg_871_1.duration_ = var_871_0[var_871_1]
		end

		SetActive(arg_871_1.tipsGo_, false)

		function arg_871_1.onSingleLineFinish_()
			arg_871_1.onSingleLineUpdate_ = nil
			arg_871_1.onSingleLineFinish_ = nil
			arg_871_1.state_ = "waiting"
		end

		function arg_871_1.playNext_(arg_873_0)
			if arg_873_0 == 1 then
				arg_871_0:Play123011211(arg_871_1)
			end
		end

		function arg_871_1.onSingleLineUpdate_(arg_874_0)
			local var_874_0 = arg_871_1.actors_["1019ui_story"]
			local var_874_1 = 0

			if var_874_1 < arg_871_1.time_ and arg_871_1.time_ <= var_874_1 + arg_874_0 and arg_871_1.var_.characterEffect1019ui_story == nil then
				arg_871_1.var_.characterEffect1019ui_story = var_874_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_874_2 = 0.200000002980232

			if var_874_1 <= arg_871_1.time_ and arg_871_1.time_ < var_874_1 + var_874_2 then
				local var_874_3 = (arg_871_1.time_ - var_874_1) / var_874_2

				if arg_871_1.var_.characterEffect1019ui_story then
					arg_871_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_871_1.time_ >= var_874_1 + var_874_2 and arg_871_1.time_ < var_874_1 + var_874_2 + arg_874_0 and arg_871_1.var_.characterEffect1019ui_story then
				arg_871_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_874_4 = 0

			if var_874_4 < arg_871_1.time_ and arg_871_1.time_ <= var_874_4 + arg_874_0 then
				arg_871_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_874_5 = 0

			if var_874_5 < arg_871_1.time_ and arg_871_1.time_ <= var_874_5 + arg_874_0 then
				arg_871_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_874_6 = 0
			local var_874_7 = 0.35

			if var_874_6 < arg_871_1.time_ and arg_871_1.time_ <= var_874_6 + arg_874_0 then
				arg_871_1.talkMaxDuration = 0
				arg_871_1.dialogCg_.alpha = 1

				arg_871_1.dialog_:SetActive(true)
				SetActive(arg_871_1.leftNameGo_, true)

				local var_874_8 = arg_871_1:FormatText(StoryNameCfg[13].name)

				arg_871_1.leftNameTxt_.text = var_874_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_871_1.leftNameTxt_.transform)

				arg_871_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_871_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_871_1:RecordName(arg_871_1.leftNameTxt_.text)
				SetActive(arg_871_1.iconTrs_.gameObject, false)
				arg_871_1.callingController_:SetSelectedState("normal")

				local var_874_9 = arg_871_1:GetWordFromCfg(123011210)
				local var_874_10 = arg_871_1:FormatText(var_874_9.content)

				arg_871_1.text_.text = var_874_10

				LuaForUtil.ClearLinePrefixSymbol(arg_871_1.text_)

				local var_874_11 = 14
				local var_874_12 = utf8.len(var_874_10)
				local var_874_13 = var_874_11 <= 0 and var_874_7 or var_874_7 * (var_874_12 / var_874_11)

				if var_874_13 > 0 and var_874_7 < var_874_13 then
					arg_871_1.talkMaxDuration = var_874_13

					if var_874_13 + var_874_6 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_13 + var_874_6
					end
				end

				arg_871_1.text_.text = var_874_10
				arg_871_1.typewritter.percent = 0

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011210", "story_v_out_123011.awb") ~= 0 then
					local var_874_14 = manager.audio:GetVoiceLength("story_v_out_123011", "123011210", "story_v_out_123011.awb") / 1000

					if var_874_14 + var_874_6 > arg_871_1.duration_ then
						arg_871_1.duration_ = var_874_14 + var_874_6
					end

					if var_874_9.prefab_name ~= "" and arg_871_1.actors_[var_874_9.prefab_name] ~= nil then
						local var_874_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_871_1.actors_[var_874_9.prefab_name].transform, "story_v_out_123011", "123011210", "story_v_out_123011.awb")

						arg_871_1:RecordAudio("123011210", var_874_15)
						arg_871_1:RecordAudio("123011210", var_874_15)
					else
						arg_871_1:AudioAction("play", "voice", "story_v_out_123011", "123011210", "story_v_out_123011.awb")
					end

					arg_871_1:RecordHistoryTalkVoice("story_v_out_123011", "123011210", "story_v_out_123011.awb")
				end

				arg_871_1:RecordContent(arg_871_1.text_.text)
			end

			local var_874_16 = math.max(var_874_7, arg_871_1.talkMaxDuration)

			if var_874_6 <= arg_871_1.time_ and arg_871_1.time_ < var_874_6 + var_874_16 then
				arg_871_1.typewritter.percent = (arg_871_1.time_ - var_874_6) / var_874_16

				arg_871_1.typewritter:SetDirty()
			end

			if arg_871_1.time_ >= var_874_6 + var_874_16 and arg_871_1.time_ < var_874_6 + var_874_16 + arg_874_0 then
				arg_871_1.typewritter.percent = 1

				arg_871_1.typewritter:SetDirty()
				arg_871_1:ShowNextGo(true)
			end
		end
	end,
	Play123011211 = function(arg_875_0, arg_875_1)
		arg_875_1.time_ = 0
		arg_875_1.frameCnt_ = 0
		arg_875_1.state_ = "playing"
		arg_875_1.curTalkId_ = 123011211
		arg_875_1.duration_ = 5

		SetActive(arg_875_1.tipsGo_, false)

		function arg_875_1.onSingleLineFinish_()
			arg_875_1.onSingleLineUpdate_ = nil
			arg_875_1.onSingleLineFinish_ = nil
			arg_875_1.state_ = "waiting"
		end

		function arg_875_1.playNext_(arg_877_0)
			if arg_877_0 == 1 then
				arg_875_0:Play123011212(arg_875_1)
			end
		end

		function arg_875_1.onSingleLineUpdate_(arg_878_0)
			local var_878_0 = arg_875_1.actors_["1019ui_story"]
			local var_878_1 = 0

			if var_878_1 < arg_875_1.time_ and arg_875_1.time_ <= var_878_1 + arg_878_0 and arg_875_1.var_.characterEffect1019ui_story == nil then
				arg_875_1.var_.characterEffect1019ui_story = var_878_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_878_2 = 0.200000002980232

			if var_878_1 <= arg_875_1.time_ and arg_875_1.time_ < var_878_1 + var_878_2 then
				local var_878_3 = (arg_875_1.time_ - var_878_1) / var_878_2

				if arg_875_1.var_.characterEffect1019ui_story then
					local var_878_4 = Mathf.Lerp(0, 0.5, var_878_3)

					arg_875_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_875_1.var_.characterEffect1019ui_story.fillRatio = var_878_4
				end
			end

			if arg_875_1.time_ >= var_878_1 + var_878_2 and arg_875_1.time_ < var_878_1 + var_878_2 + arg_878_0 and arg_875_1.var_.characterEffect1019ui_story then
				local var_878_5 = 0.5

				arg_875_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_875_1.var_.characterEffect1019ui_story.fillRatio = var_878_5
			end

			local var_878_6 = 0
			local var_878_7 = 0.525

			if var_878_6 < arg_875_1.time_ and arg_875_1.time_ <= var_878_6 + arg_878_0 then
				arg_875_1.talkMaxDuration = 0
				arg_875_1.dialogCg_.alpha = 1

				arg_875_1.dialog_:SetActive(true)
				SetActive(arg_875_1.leftNameGo_, true)

				local var_878_8 = arg_875_1:FormatText(StoryNameCfg[7].name)

				arg_875_1.leftNameTxt_.text = var_878_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_875_1.leftNameTxt_.transform)

				arg_875_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_875_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_875_1:RecordName(arg_875_1.leftNameTxt_.text)
				SetActive(arg_875_1.iconTrs_.gameObject, false)
				arg_875_1.callingController_:SetSelectedState("normal")

				local var_878_9 = arg_875_1:GetWordFromCfg(123011211)
				local var_878_10 = arg_875_1:FormatText(var_878_9.content)

				arg_875_1.text_.text = var_878_10

				LuaForUtil.ClearLinePrefixSymbol(arg_875_1.text_)

				local var_878_11 = 21
				local var_878_12 = utf8.len(var_878_10)
				local var_878_13 = var_878_11 <= 0 and var_878_7 or var_878_7 * (var_878_12 / var_878_11)

				if var_878_13 > 0 and var_878_7 < var_878_13 then
					arg_875_1.talkMaxDuration = var_878_13

					if var_878_13 + var_878_6 > arg_875_1.duration_ then
						arg_875_1.duration_ = var_878_13 + var_878_6
					end
				end

				arg_875_1.text_.text = var_878_10
				arg_875_1.typewritter.percent = 0

				arg_875_1.typewritter:SetDirty()
				arg_875_1:ShowNextGo(false)
				arg_875_1:RecordContent(arg_875_1.text_.text)
			end

			local var_878_14 = math.max(var_878_7, arg_875_1.talkMaxDuration)

			if var_878_6 <= arg_875_1.time_ and arg_875_1.time_ < var_878_6 + var_878_14 then
				arg_875_1.typewritter.percent = (arg_875_1.time_ - var_878_6) / var_878_14

				arg_875_1.typewritter:SetDirty()
			end

			if arg_875_1.time_ >= var_878_6 + var_878_14 and arg_875_1.time_ < var_878_6 + var_878_14 + arg_878_0 then
				arg_875_1.typewritter.percent = 1

				arg_875_1.typewritter:SetDirty()
				arg_875_1:ShowNextGo(true)
			end
		end
	end,
	Play123011212 = function(arg_879_0, arg_879_1)
		arg_879_1.time_ = 0
		arg_879_1.frameCnt_ = 0
		arg_879_1.state_ = "playing"
		arg_879_1.curTalkId_ = 123011212
		arg_879_1.duration_ = 5

		SetActive(arg_879_1.tipsGo_, false)

		function arg_879_1.onSingleLineFinish_()
			arg_879_1.onSingleLineUpdate_ = nil
			arg_879_1.onSingleLineFinish_ = nil
			arg_879_1.state_ = "waiting"
		end

		function arg_879_1.playNext_(arg_881_0)
			if arg_881_0 == 1 then
				arg_879_0:Play123011213(arg_879_1)
			end
		end

		function arg_879_1.onSingleLineUpdate_(arg_882_0)
			local var_882_0 = arg_879_1.actors_["1019ui_story"].transform
			local var_882_1 = 0

			if var_882_1 < arg_879_1.time_ and arg_879_1.time_ <= var_882_1 + arg_882_0 then
				arg_879_1.var_.moveOldPos1019ui_story = var_882_0.localPosition
			end

			local var_882_2 = 0.001

			if var_882_1 <= arg_879_1.time_ and arg_879_1.time_ < var_882_1 + var_882_2 then
				local var_882_3 = (arg_879_1.time_ - var_882_1) / var_882_2
				local var_882_4 = Vector3.New(0, 100, 0)

				var_882_0.localPosition = Vector3.Lerp(arg_879_1.var_.moveOldPos1019ui_story, var_882_4, var_882_3)

				local var_882_5 = manager.ui.mainCamera.transform.position - var_882_0.position

				var_882_0.forward = Vector3.New(var_882_5.x, var_882_5.y, var_882_5.z)

				local var_882_6 = var_882_0.localEulerAngles

				var_882_6.z = 0
				var_882_6.x = 0
				var_882_0.localEulerAngles = var_882_6
			end

			if arg_879_1.time_ >= var_882_1 + var_882_2 and arg_879_1.time_ < var_882_1 + var_882_2 + arg_882_0 then
				var_882_0.localPosition = Vector3.New(0, 100, 0)

				local var_882_7 = manager.ui.mainCamera.transform.position - var_882_0.position

				var_882_0.forward = Vector3.New(var_882_7.x, var_882_7.y, var_882_7.z)

				local var_882_8 = var_882_0.localEulerAngles

				var_882_8.z = 0
				var_882_8.x = 0
				var_882_0.localEulerAngles = var_882_8
			end

			local var_882_9 = arg_879_1.actors_["1019ui_story"]
			local var_882_10 = 0

			if var_882_10 < arg_879_1.time_ and arg_879_1.time_ <= var_882_10 + arg_882_0 and arg_879_1.var_.characterEffect1019ui_story == nil then
				arg_879_1.var_.characterEffect1019ui_story = var_882_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_882_11 = 0.200000002980232

			if var_882_10 <= arg_879_1.time_ and arg_879_1.time_ < var_882_10 + var_882_11 then
				local var_882_12 = (arg_879_1.time_ - var_882_10) / var_882_11

				if arg_879_1.var_.characterEffect1019ui_story then
					local var_882_13 = Mathf.Lerp(0, 0.5, var_882_12)

					arg_879_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_879_1.var_.characterEffect1019ui_story.fillRatio = var_882_13
				end
			end

			if arg_879_1.time_ >= var_882_10 + var_882_11 and arg_879_1.time_ < var_882_10 + var_882_11 + arg_882_0 and arg_879_1.var_.characterEffect1019ui_story then
				local var_882_14 = 0.5

				arg_879_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_879_1.var_.characterEffect1019ui_story.fillRatio = var_882_14
			end

			local var_882_15 = 0
			local var_882_16 = 0.375

			if var_882_15 < arg_879_1.time_ and arg_879_1.time_ <= var_882_15 + arg_882_0 then
				arg_879_1.talkMaxDuration = 0
				arg_879_1.dialogCg_.alpha = 1

				arg_879_1.dialog_:SetActive(true)
				SetActive(arg_879_1.leftNameGo_, false)

				arg_879_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_879_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_879_1:RecordName(arg_879_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_879_1.iconTrs_.gameObject, false)
				arg_879_1.callingController_:SetSelectedState("normal")

				local var_882_17 = arg_879_1:GetWordFromCfg(123011212)
				local var_882_18 = arg_879_1:FormatText(var_882_17.content)

				arg_879_1.text_.text = var_882_18

				LuaForUtil.ClearLinePrefixSymbol(arg_879_1.text_)

				local var_882_19 = 15
				local var_882_20 = utf8.len(var_882_18)
				local var_882_21 = var_882_19 <= 0 and var_882_16 or var_882_16 * (var_882_20 / var_882_19)

				if var_882_21 > 0 and var_882_16 < var_882_21 then
					arg_879_1.talkMaxDuration = var_882_21

					if var_882_21 + var_882_15 > arg_879_1.duration_ then
						arg_879_1.duration_ = var_882_21 + var_882_15
					end
				end

				arg_879_1.text_.text = var_882_18
				arg_879_1.typewritter.percent = 0

				arg_879_1.typewritter:SetDirty()
				arg_879_1:ShowNextGo(false)
				arg_879_1:RecordContent(arg_879_1.text_.text)
			end

			local var_882_22 = math.max(var_882_16, arg_879_1.talkMaxDuration)

			if var_882_15 <= arg_879_1.time_ and arg_879_1.time_ < var_882_15 + var_882_22 then
				arg_879_1.typewritter.percent = (arg_879_1.time_ - var_882_15) / var_882_22

				arg_879_1.typewritter:SetDirty()
			end

			if arg_879_1.time_ >= var_882_15 + var_882_22 and arg_879_1.time_ < var_882_15 + var_882_22 + arg_882_0 then
				arg_879_1.typewritter.percent = 1

				arg_879_1.typewritter:SetDirty()
				arg_879_1:ShowNextGo(true)
			end
		end
	end,
	Play123011213 = function(arg_883_0, arg_883_1)
		arg_883_1.time_ = 0
		arg_883_1.frameCnt_ = 0
		arg_883_1.state_ = "playing"
		arg_883_1.curTalkId_ = 123011213
		arg_883_1.duration_ = 12.9

		local var_883_0 = {
			zh = 12.9,
			ja = 11.533
		}
		local var_883_1 = manager.audio:GetLocalizationFlag()

		if var_883_0[var_883_1] ~= nil then
			arg_883_1.duration_ = var_883_0[var_883_1]
		end

		SetActive(arg_883_1.tipsGo_, false)

		function arg_883_1.onSingleLineFinish_()
			arg_883_1.onSingleLineUpdate_ = nil
			arg_883_1.onSingleLineFinish_ = nil
			arg_883_1.state_ = "waiting"
		end

		function arg_883_1.playNext_(arg_885_0)
			if arg_885_0 == 1 then
				arg_883_0:Play123011214(arg_883_1)
			end
		end

		function arg_883_1.onSingleLineUpdate_(arg_886_0)
			local var_886_0 = arg_883_1.actors_["1019ui_story"].transform
			local var_886_1 = 0

			if var_886_1 < arg_883_1.time_ and arg_883_1.time_ <= var_886_1 + arg_886_0 then
				arg_883_1.var_.moveOldPos1019ui_story = var_886_0.localPosition
			end

			local var_886_2 = 0.001

			if var_886_1 <= arg_883_1.time_ and arg_883_1.time_ < var_886_1 + var_886_2 then
				local var_886_3 = (arg_883_1.time_ - var_886_1) / var_886_2
				local var_886_4 = Vector3.New(0, -1.08, -5.9)

				var_886_0.localPosition = Vector3.Lerp(arg_883_1.var_.moveOldPos1019ui_story, var_886_4, var_886_3)

				local var_886_5 = manager.ui.mainCamera.transform.position - var_886_0.position

				var_886_0.forward = Vector3.New(var_886_5.x, var_886_5.y, var_886_5.z)

				local var_886_6 = var_886_0.localEulerAngles

				var_886_6.z = 0
				var_886_6.x = 0
				var_886_0.localEulerAngles = var_886_6
			end

			if arg_883_1.time_ >= var_886_1 + var_886_2 and arg_883_1.time_ < var_886_1 + var_886_2 + arg_886_0 then
				var_886_0.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_886_7 = manager.ui.mainCamera.transform.position - var_886_0.position

				var_886_0.forward = Vector3.New(var_886_7.x, var_886_7.y, var_886_7.z)

				local var_886_8 = var_886_0.localEulerAngles

				var_886_8.z = 0
				var_886_8.x = 0
				var_886_0.localEulerAngles = var_886_8
			end

			local var_886_9 = arg_883_1.actors_["1019ui_story"]
			local var_886_10 = 0

			if var_886_10 < arg_883_1.time_ and arg_883_1.time_ <= var_886_10 + arg_886_0 and arg_883_1.var_.characterEffect1019ui_story == nil then
				arg_883_1.var_.characterEffect1019ui_story = var_886_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_886_11 = 0.200000002980232

			if var_886_10 <= arg_883_1.time_ and arg_883_1.time_ < var_886_10 + var_886_11 then
				local var_886_12 = (arg_883_1.time_ - var_886_10) / var_886_11

				if arg_883_1.var_.characterEffect1019ui_story then
					arg_883_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_883_1.time_ >= var_886_10 + var_886_11 and arg_883_1.time_ < var_886_10 + var_886_11 + arg_886_0 and arg_883_1.var_.characterEffect1019ui_story then
				arg_883_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_886_13 = 0

			if var_886_13 < arg_883_1.time_ and arg_883_1.time_ <= var_886_13 + arg_886_0 then
				arg_883_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_886_14 = 0

			if var_886_14 < arg_883_1.time_ and arg_883_1.time_ <= var_886_14 + arg_886_0 then
				arg_883_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_886_15 = 0
			local var_886_16 = 1.575

			if var_886_15 < arg_883_1.time_ and arg_883_1.time_ <= var_886_15 + arg_886_0 then
				arg_883_1.talkMaxDuration = 0
				arg_883_1.dialogCg_.alpha = 1

				arg_883_1.dialog_:SetActive(true)
				SetActive(arg_883_1.leftNameGo_, true)

				local var_886_17 = arg_883_1:FormatText(StoryNameCfg[13].name)

				arg_883_1.leftNameTxt_.text = var_886_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_883_1.leftNameTxt_.transform)

				arg_883_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_883_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_883_1:RecordName(arg_883_1.leftNameTxt_.text)
				SetActive(arg_883_1.iconTrs_.gameObject, false)
				arg_883_1.callingController_:SetSelectedState("normal")

				local var_886_18 = arg_883_1:GetWordFromCfg(123011213)
				local var_886_19 = arg_883_1:FormatText(var_886_18.content)

				arg_883_1.text_.text = var_886_19

				LuaForUtil.ClearLinePrefixSymbol(arg_883_1.text_)

				local var_886_20 = 63
				local var_886_21 = utf8.len(var_886_19)
				local var_886_22 = var_886_20 <= 0 and var_886_16 or var_886_16 * (var_886_21 / var_886_20)

				if var_886_22 > 0 and var_886_16 < var_886_22 then
					arg_883_1.talkMaxDuration = var_886_22

					if var_886_22 + var_886_15 > arg_883_1.duration_ then
						arg_883_1.duration_ = var_886_22 + var_886_15
					end
				end

				arg_883_1.text_.text = var_886_19
				arg_883_1.typewritter.percent = 0

				arg_883_1.typewritter:SetDirty()
				arg_883_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011213", "story_v_out_123011.awb") ~= 0 then
					local var_886_23 = manager.audio:GetVoiceLength("story_v_out_123011", "123011213", "story_v_out_123011.awb") / 1000

					if var_886_23 + var_886_15 > arg_883_1.duration_ then
						arg_883_1.duration_ = var_886_23 + var_886_15
					end

					if var_886_18.prefab_name ~= "" and arg_883_1.actors_[var_886_18.prefab_name] ~= nil then
						local var_886_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_883_1.actors_[var_886_18.prefab_name].transform, "story_v_out_123011", "123011213", "story_v_out_123011.awb")

						arg_883_1:RecordAudio("123011213", var_886_24)
						arg_883_1:RecordAudio("123011213", var_886_24)
					else
						arg_883_1:AudioAction("play", "voice", "story_v_out_123011", "123011213", "story_v_out_123011.awb")
					end

					arg_883_1:RecordHistoryTalkVoice("story_v_out_123011", "123011213", "story_v_out_123011.awb")
				end

				arg_883_1:RecordContent(arg_883_1.text_.text)
			end

			local var_886_25 = math.max(var_886_16, arg_883_1.talkMaxDuration)

			if var_886_15 <= arg_883_1.time_ and arg_883_1.time_ < var_886_15 + var_886_25 then
				arg_883_1.typewritter.percent = (arg_883_1.time_ - var_886_15) / var_886_25

				arg_883_1.typewritter:SetDirty()
			end

			if arg_883_1.time_ >= var_886_15 + var_886_25 and arg_883_1.time_ < var_886_15 + var_886_25 + arg_886_0 then
				arg_883_1.typewritter.percent = 1

				arg_883_1.typewritter:SetDirty()
				arg_883_1:ShowNextGo(true)
			end
		end
	end,
	Play123011214 = function(arg_887_0, arg_887_1)
		arg_887_1.time_ = 0
		arg_887_1.frameCnt_ = 0
		arg_887_1.state_ = "playing"
		arg_887_1.curTalkId_ = 123011214
		arg_887_1.duration_ = 5

		SetActive(arg_887_1.tipsGo_, false)

		function arg_887_1.onSingleLineFinish_()
			arg_887_1.onSingleLineUpdate_ = nil
			arg_887_1.onSingleLineFinish_ = nil
			arg_887_1.state_ = "waiting"
		end

		function arg_887_1.playNext_(arg_889_0)
			if arg_889_0 == 1 then
				arg_887_0:Play123011215(arg_887_1)
			end
		end

		function arg_887_1.onSingleLineUpdate_(arg_890_0)
			local var_890_0 = arg_887_1.actors_["1019ui_story"]
			local var_890_1 = 0

			if var_890_1 < arg_887_1.time_ and arg_887_1.time_ <= var_890_1 + arg_890_0 and arg_887_1.var_.characterEffect1019ui_story == nil then
				arg_887_1.var_.characterEffect1019ui_story = var_890_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_890_2 = 0.200000002980232

			if var_890_1 <= arg_887_1.time_ and arg_887_1.time_ < var_890_1 + var_890_2 then
				local var_890_3 = (arg_887_1.time_ - var_890_1) / var_890_2

				if arg_887_1.var_.characterEffect1019ui_story then
					local var_890_4 = Mathf.Lerp(0, 0.5, var_890_3)

					arg_887_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_887_1.var_.characterEffect1019ui_story.fillRatio = var_890_4
				end
			end

			if arg_887_1.time_ >= var_890_1 + var_890_2 and arg_887_1.time_ < var_890_1 + var_890_2 + arg_890_0 and arg_887_1.var_.characterEffect1019ui_story then
				local var_890_5 = 0.5

				arg_887_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_887_1.var_.characterEffect1019ui_story.fillRatio = var_890_5
			end

			local var_890_6 = 0
			local var_890_7 = 0.55

			if var_890_6 < arg_887_1.time_ and arg_887_1.time_ <= var_890_6 + arg_890_0 then
				arg_887_1.talkMaxDuration = 0
				arg_887_1.dialogCg_.alpha = 1

				arg_887_1.dialog_:SetActive(true)
				SetActive(arg_887_1.leftNameGo_, false)

				arg_887_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_887_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_887_1:RecordName(arg_887_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_887_1.iconTrs_.gameObject, false)
				arg_887_1.callingController_:SetSelectedState("normal")

				local var_890_8 = arg_887_1:GetWordFromCfg(123011214)
				local var_890_9 = arg_887_1:FormatText(var_890_8.content)

				arg_887_1.text_.text = var_890_9

				LuaForUtil.ClearLinePrefixSymbol(arg_887_1.text_)

				local var_890_10 = 22
				local var_890_11 = utf8.len(var_890_9)
				local var_890_12 = var_890_10 <= 0 and var_890_7 or var_890_7 * (var_890_11 / var_890_10)

				if var_890_12 > 0 and var_890_7 < var_890_12 then
					arg_887_1.talkMaxDuration = var_890_12

					if var_890_12 + var_890_6 > arg_887_1.duration_ then
						arg_887_1.duration_ = var_890_12 + var_890_6
					end
				end

				arg_887_1.text_.text = var_890_9
				arg_887_1.typewritter.percent = 0

				arg_887_1.typewritter:SetDirty()
				arg_887_1:ShowNextGo(false)
				arg_887_1:RecordContent(arg_887_1.text_.text)
			end

			local var_890_13 = math.max(var_890_7, arg_887_1.talkMaxDuration)

			if var_890_6 <= arg_887_1.time_ and arg_887_1.time_ < var_890_6 + var_890_13 then
				arg_887_1.typewritter.percent = (arg_887_1.time_ - var_890_6) / var_890_13

				arg_887_1.typewritter:SetDirty()
			end

			if arg_887_1.time_ >= var_890_6 + var_890_13 and arg_887_1.time_ < var_890_6 + var_890_13 + arg_890_0 then
				arg_887_1.typewritter.percent = 1

				arg_887_1.typewritter:SetDirty()
				arg_887_1:ShowNextGo(true)
			end
		end
	end,
	Play123011215 = function(arg_891_0, arg_891_1)
		arg_891_1.time_ = 0
		arg_891_1.frameCnt_ = 0
		arg_891_1.state_ = "playing"
		arg_891_1.curTalkId_ = 123011215
		arg_891_1.duration_ = 6.233

		local var_891_0 = {
			zh = 4.8,
			ja = 6.233
		}
		local var_891_1 = manager.audio:GetLocalizationFlag()

		if var_891_0[var_891_1] ~= nil then
			arg_891_1.duration_ = var_891_0[var_891_1]
		end

		SetActive(arg_891_1.tipsGo_, false)

		function arg_891_1.onSingleLineFinish_()
			arg_891_1.onSingleLineUpdate_ = nil
			arg_891_1.onSingleLineFinish_ = nil
			arg_891_1.state_ = "waiting"
		end

		function arg_891_1.playNext_(arg_893_0)
			if arg_893_0 == 1 then
				arg_891_0:Play123011216(arg_891_1)
			end
		end

		function arg_891_1.onSingleLineUpdate_(arg_894_0)
			local var_894_0 = arg_891_1.actors_["1019ui_story"]
			local var_894_1 = 0

			if var_894_1 < arg_891_1.time_ and arg_891_1.time_ <= var_894_1 + arg_894_0 and arg_891_1.var_.characterEffect1019ui_story == nil then
				arg_891_1.var_.characterEffect1019ui_story = var_894_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_894_2 = 0.200000002980232

			if var_894_1 <= arg_891_1.time_ and arg_891_1.time_ < var_894_1 + var_894_2 then
				local var_894_3 = (arg_891_1.time_ - var_894_1) / var_894_2

				if arg_891_1.var_.characterEffect1019ui_story then
					arg_891_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_891_1.time_ >= var_894_1 + var_894_2 and arg_891_1.time_ < var_894_1 + var_894_2 + arg_894_0 and arg_891_1.var_.characterEffect1019ui_story then
				arg_891_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_894_4 = 0
			local var_894_5 = 0.475

			if var_894_4 < arg_891_1.time_ and arg_891_1.time_ <= var_894_4 + arg_894_0 then
				arg_891_1.talkMaxDuration = 0
				arg_891_1.dialogCg_.alpha = 1

				arg_891_1.dialog_:SetActive(true)
				SetActive(arg_891_1.leftNameGo_, true)

				local var_894_6 = arg_891_1:FormatText(StoryNameCfg[13].name)

				arg_891_1.leftNameTxt_.text = var_894_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_891_1.leftNameTxt_.transform)

				arg_891_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_891_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_891_1:RecordName(arg_891_1.leftNameTxt_.text)
				SetActive(arg_891_1.iconTrs_.gameObject, false)
				arg_891_1.callingController_:SetSelectedState("normal")

				local var_894_7 = arg_891_1:GetWordFromCfg(123011215)
				local var_894_8 = arg_891_1:FormatText(var_894_7.content)

				arg_891_1.text_.text = var_894_8

				LuaForUtil.ClearLinePrefixSymbol(arg_891_1.text_)

				local var_894_9 = 19
				local var_894_10 = utf8.len(var_894_8)
				local var_894_11 = var_894_9 <= 0 and var_894_5 or var_894_5 * (var_894_10 / var_894_9)

				if var_894_11 > 0 and var_894_5 < var_894_11 then
					arg_891_1.talkMaxDuration = var_894_11

					if var_894_11 + var_894_4 > arg_891_1.duration_ then
						arg_891_1.duration_ = var_894_11 + var_894_4
					end
				end

				arg_891_1.text_.text = var_894_8
				arg_891_1.typewritter.percent = 0

				arg_891_1.typewritter:SetDirty()
				arg_891_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_123011", "123011215", "story_v_out_123011.awb") ~= 0 then
					local var_894_12 = manager.audio:GetVoiceLength("story_v_out_123011", "123011215", "story_v_out_123011.awb") / 1000

					if var_894_12 + var_894_4 > arg_891_1.duration_ then
						arg_891_1.duration_ = var_894_12 + var_894_4
					end

					if var_894_7.prefab_name ~= "" and arg_891_1.actors_[var_894_7.prefab_name] ~= nil then
						local var_894_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_891_1.actors_[var_894_7.prefab_name].transform, "story_v_out_123011", "123011215", "story_v_out_123011.awb")

						arg_891_1:RecordAudio("123011215", var_894_13)
						arg_891_1:RecordAudio("123011215", var_894_13)
					else
						arg_891_1:AudioAction("play", "voice", "story_v_out_123011", "123011215", "story_v_out_123011.awb")
					end

					arg_891_1:RecordHistoryTalkVoice("story_v_out_123011", "123011215", "story_v_out_123011.awb")
				end

				arg_891_1:RecordContent(arg_891_1.text_.text)
			end

			local var_894_14 = math.max(var_894_5, arg_891_1.talkMaxDuration)

			if var_894_4 <= arg_891_1.time_ and arg_891_1.time_ < var_894_4 + var_894_14 then
				arg_891_1.typewritter.percent = (arg_891_1.time_ - var_894_4) / var_894_14

				arg_891_1.typewritter:SetDirty()
			end

			if arg_891_1.time_ >= var_894_4 + var_894_14 and arg_891_1.time_ < var_894_4 + var_894_14 + arg_894_0 then
				arg_891_1.typewritter.percent = 1

				arg_891_1.typewritter:SetDirty()
				arg_891_1:ShowNextGo(true)
			end
		end
	end,
	Play123011216 = function(arg_895_0, arg_895_1)
		arg_895_1.time_ = 0
		arg_895_1.frameCnt_ = 0
		arg_895_1.state_ = "playing"
		arg_895_1.curTalkId_ = 123011216
		arg_895_1.duration_ = 5

		SetActive(arg_895_1.tipsGo_, false)

		function arg_895_1.onSingleLineFinish_()
			arg_895_1.onSingleLineUpdate_ = nil
			arg_895_1.onSingleLineFinish_ = nil
			arg_895_1.state_ = "waiting"
			arg_895_1.auto_ = false
		end

		function arg_895_1.playNext_(arg_897_0)
			arg_895_1.onStoryFinished_()
		end

		function arg_895_1.onSingleLineUpdate_(arg_898_0)
			local var_898_0 = 0
			local var_898_1 = 0.075

			if var_898_0 < arg_895_1.time_ and arg_895_1.time_ <= var_898_0 + arg_898_0 then
				arg_895_1.talkMaxDuration = 0
				arg_895_1.dialogCg_.alpha = 1

				arg_895_1.dialog_:SetActive(true)
				SetActive(arg_895_1.leftNameGo_, true)

				local var_898_2 = arg_895_1:FormatText(StoryNameCfg[7].name)

				arg_895_1.leftNameTxt_.text = var_898_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_895_1.leftNameTxt_.transform)

				arg_895_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_895_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_895_1:RecordName(arg_895_1.leftNameTxt_.text)
				SetActive(arg_895_1.iconTrs_.gameObject, false)
				arg_895_1.callingController_:SetSelectedState("normal")

				local var_898_3 = arg_895_1:GetWordFromCfg(123011216)
				local var_898_4 = arg_895_1:FormatText(var_898_3.content)

				arg_895_1.text_.text = var_898_4

				LuaForUtil.ClearLinePrefixSymbol(arg_895_1.text_)

				local var_898_5 = 3
				local var_898_6 = utf8.len(var_898_4)
				local var_898_7 = var_898_5 <= 0 and var_898_1 or var_898_1 * (var_898_6 / var_898_5)

				if var_898_7 > 0 and var_898_1 < var_898_7 then
					arg_895_1.talkMaxDuration = var_898_7

					if var_898_7 + var_898_0 > arg_895_1.duration_ then
						arg_895_1.duration_ = var_898_7 + var_898_0
					end
				end

				arg_895_1.text_.text = var_898_4
				arg_895_1.typewritter.percent = 0

				arg_895_1.typewritter:SetDirty()
				arg_895_1:ShowNextGo(false)
				arg_895_1:RecordContent(arg_895_1.text_.text)
			end

			local var_898_8 = math.max(var_898_1, arg_895_1.talkMaxDuration)

			if var_898_0 <= arg_895_1.time_ and arg_895_1.time_ < var_898_0 + var_898_8 then
				arg_895_1.typewritter.percent = (arg_895_1.time_ - var_898_0) / var_898_8

				arg_895_1.typewritter:SetDirty()
			end

			if arg_895_1.time_ >= var_898_0 + var_898_8 and arg_895_1.time_ < var_898_0 + var_898_8 + arg_898_0 then
				arg_895_1.typewritter.percent = 1

				arg_895_1.typewritter:SetDirty()
				arg_895_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/BA0105",
		"Assets/UIResources/UI_AB/TextureConfig/Background/BA0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/BA0101a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST11a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0509",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J12f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0607",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/BA0102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13"
	},
	voices = {
		"story_v_out_123011.awb"
	}
}
