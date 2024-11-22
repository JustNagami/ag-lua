return {
	Play319931001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319931001
		arg_1_1.duration_ = 6.78867580434308

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319931002(arg_1_1)
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
			local var_4_23 = 0.2

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_26 = 1.78867580434307
			local var_4_27 = 0.825

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

				local var_4_29 = arg_1_1:GetWordFromCfg(319931001)
				local var_4_30 = arg_1_1:FormatText(var_4_29.content)

				arg_1_1.text_.text = var_4_30

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_31 = 33
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
	Play319931002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319931002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319931003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.225

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

				local var_10_2 = arg_7_1:GetWordFromCfg(319931002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 49
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
	Play319931003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319931003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319931004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.425

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

				local var_14_2 = arg_11_1:GetWordFromCfg(319931003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 17
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
	Play319931004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319931004
		arg_15_1.duration_ = 4.9

		local var_15_0 = {
			zh = 4.9,
			ja = 4
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
				arg_15_0:Play319931005(arg_15_1)
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

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319931004)
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931004", "story_v_out_319931.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931004", "story_v_out_319931.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319931", "319931004", "story_v_out_319931.awb")

						arg_15_1:RecordAudio("319931004", var_18_9)
						arg_15_1:RecordAudio("319931004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319931", "319931004", "story_v_out_319931.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319931", "319931004", "story_v_out_319931.awb")
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
	Play319931005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319931005
		arg_19_1.duration_ = 6.566

		local var_19_0 = {
			zh = 6.566,
			ja = 6.4
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
				arg_19_0:Play319931006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.475

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(319931005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931005", "story_v_out_319931.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931005", "story_v_out_319931.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_319931", "319931005", "story_v_out_319931.awb")

						arg_19_1:RecordAudio("319931005", var_22_9)
						arg_19_1:RecordAudio("319931005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319931", "319931005", "story_v_out_319931.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319931", "319931005", "story_v_out_319931.awb")
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
	Play319931006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319931006
		arg_23_1.duration_ = 1.833

		local var_23_0 = {
			zh = 1.466,
			ja = 1.833
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
				arg_23_0:Play319931007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.125

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[692].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10050")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(319931006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931006", "story_v_out_319931.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931006", "story_v_out_319931.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_319931", "319931006", "story_v_out_319931.awb")

						arg_23_1:RecordAudio("319931006", var_26_9)
						arg_23_1:RecordAudio("319931006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319931", "319931006", "story_v_out_319931.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319931", "319931006", "story_v_out_319931.awb")
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
	Play319931007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319931007
		arg_27_1.duration_ = 1.999999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319931008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "10079ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["10079ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos10079ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0, -0.95, -6.05)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10079ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_30_15 = arg_27_1.actors_["10079ui_story"]
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story == nil then
				arg_27_1.var_.characterEffect10079ui_story = var_30_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_17 = 0.2

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17

				if arg_27_1.var_.characterEffect10079ui_story then
					arg_27_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 and arg_27_1.var_.characterEffect10079ui_story then
				arg_27_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_30_19 = 0
			local var_30_20 = 0.05

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(319931007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 2
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931007", "story_v_out_319931.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_319931", "319931007", "story_v_out_319931.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_319931", "319931007", "story_v_out_319931.awb")

						arg_27_1:RecordAudio("319931007", var_30_28)
						arg_27_1:RecordAudio("319931007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319931", "319931007", "story_v_out_319931.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319931", "319931007", "story_v_out_319931.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319931008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319931008
		arg_31_1.duration_ = 7

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play319931009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "I11r"

			if arg_31_1.bgs_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_0)
				var_34_1.name = var_34_0
				var_34_1.transform.parent = arg_31_1.stage_.transform
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_0] = var_34_1
			end

			local var_34_2 = 0

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				local var_34_3 = manager.ui.mainCamera.transform.localPosition
				local var_34_4 = Vector3.New(0, 0, 10) + Vector3.New(var_34_3.x, var_34_3.y, 0)
				local var_34_5 = arg_31_1.bgs_.I11r

				var_34_5.transform.localPosition = var_34_4
				var_34_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_6 = var_34_5:GetComponent("SpriteRenderer")

				if var_34_6 and var_34_6.sprite then
					local var_34_7 = (var_34_5.transform.localPosition - var_34_3).z
					local var_34_8 = manager.ui.mainCameraCom_
					local var_34_9 = 2 * var_34_7 * Mathf.Tan(var_34_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_10 = var_34_9 * var_34_8.aspect
					local var_34_11 = var_34_6.sprite.bounds.size.x
					local var_34_12 = var_34_6.sprite.bounds.size.y
					local var_34_13 = var_34_10 / var_34_11
					local var_34_14 = var_34_9 / var_34_12
					local var_34_15 = var_34_14 < var_34_13 and var_34_13 or var_34_14

					var_34_5.transform.localScale = Vector3.New(var_34_15, var_34_15, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "I11r" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_16 = 2

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1.allBtn_.enabled = false
			end

			local var_34_17 = 0.3

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 then
				arg_31_1.allBtn_.enabled = true
			end

			local var_34_18 = 0

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_19 = 2

			if var_34_18 <= arg_31_1.time_ and arg_31_1.time_ < var_34_18 + var_34_19 then
				local var_34_20 = (arg_31_1.time_ - var_34_18) / var_34_19
				local var_34_21 = Color.New(1, 1, 1)

				var_34_21.a = Mathf.Lerp(1, 0, var_34_20)
				arg_31_1.mask_.color = var_34_21
			end

			if arg_31_1.time_ >= var_34_18 + var_34_19 and arg_31_1.time_ < var_34_18 + var_34_19 + arg_34_0 then
				local var_34_22 = Color.New(1, 1, 1)
				local var_34_23 = 0

				arg_31_1.mask_.enabled = false
				var_34_22.a = var_34_23
				arg_31_1.mask_.color = var_34_22
			end

			local var_34_24 = arg_31_1.actors_["10079ui_story"].transform
			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.var_.moveOldPos10079ui_story = var_34_24.localPosition
			end

			local var_34_26 = 0.001

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26
				local var_34_28 = Vector3.New(0, 100, 0)

				var_34_24.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10079ui_story, var_34_28, var_34_27)

				local var_34_29 = manager.ui.mainCamera.transform.position - var_34_24.position

				var_34_24.forward = Vector3.New(var_34_29.x, var_34_29.y, var_34_29.z)

				local var_34_30 = var_34_24.localEulerAngles

				var_34_30.z = 0
				var_34_30.x = 0
				var_34_24.localEulerAngles = var_34_30
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				var_34_24.localPosition = Vector3.New(0, 100, 0)

				local var_34_31 = manager.ui.mainCamera.transform.position - var_34_24.position

				var_34_24.forward = Vector3.New(var_34_31.x, var_34_31.y, var_34_31.z)

				local var_34_32 = var_34_24.localEulerAngles

				var_34_32.z = 0
				var_34_32.x = 0
				var_34_24.localEulerAngles = var_34_32
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_33 = 2
			local var_34_34 = 0.95

			if var_34_33 < arg_31_1.time_ and arg_31_1.time_ <= var_34_33 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_35 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_35:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_36 = arg_31_1:GetWordFromCfg(319931008)
				local var_34_37 = arg_31_1:FormatText(var_34_36.content)

				arg_31_1.text_.text = var_34_37

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_38 = 38
				local var_34_39 = utf8.len(var_34_37)
				local var_34_40 = var_34_38 <= 0 and var_34_34 or var_34_34 * (var_34_39 / var_34_38)

				if var_34_40 > 0 and var_34_34 < var_34_40 then
					arg_31_1.talkMaxDuration = var_34_40
					var_34_33 = var_34_33 + 0.3

					if var_34_40 + var_34_33 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_40 + var_34_33
					end
				end

				arg_31_1.text_.text = var_34_37
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_41 = var_34_33 + 0.3
			local var_34_42 = math.max(var_34_34, arg_31_1.talkMaxDuration)

			if var_34_41 <= arg_31_1.time_ and arg_31_1.time_ < var_34_41 + var_34_42 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_41) / var_34_42

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_41 + var_34_42 and arg_31_1.time_ < var_34_41 + var_34_42 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319931009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319931009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play319931010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.775

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

				local var_40_2 = arg_37_1:GetWordFromCfg(319931009)
				local var_40_3 = arg_37_1:FormatText(var_40_2.content)

				arg_37_1.text_.text = var_40_3

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_4 = 31
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
	Play319931010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319931010
		arg_41_1.duration_ = 2.8

		local var_41_0 = {
			zh = 1.999999999999,
			ja = 2.8
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
				arg_41_0:Play319931011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10079ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos10079ui_story = var_44_0.localPosition
			end

			local var_44_2 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2
				local var_44_4 = Vector3.New(0, -0.95, -6.05)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10079ui_story, var_44_4, var_44_3)

				local var_44_5 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_5.x, var_44_5.y, var_44_5.z)

				local var_44_6 = var_44_0.localEulerAngles

				var_44_6.z = 0
				var_44_6.x = 0
				var_44_0.localEulerAngles = var_44_6
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_44_7 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_7.x, var_44_7.y, var_44_7.z)

				local var_44_8 = var_44_0.localEulerAngles

				var_44_8.z = 0
				var_44_8.x = 0
				var_44_0.localEulerAngles = var_44_8
			end

			local var_44_9 = arg_41_1.actors_["10079ui_story"]
			local var_44_10 = 0

			if var_44_10 < arg_41_1.time_ and arg_41_1.time_ <= var_44_10 + arg_44_0 and arg_41_1.var_.characterEffect10079ui_story == nil then
				arg_41_1.var_.characterEffect10079ui_story = var_44_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_11 = 0.200000002980232

			if var_44_10 <= arg_41_1.time_ and arg_41_1.time_ < var_44_10 + var_44_11 then
				local var_44_12 = (arg_41_1.time_ - var_44_10) / var_44_11

				if arg_41_1.var_.characterEffect10079ui_story then
					arg_41_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_10 + var_44_11 and arg_41_1.time_ < var_44_10 + var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect10079ui_story then
				arg_41_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_44_15 = 0
			local var_44_16 = 0.2

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				local var_44_17 = "play"
				local var_44_18 = "music"

				arg_41_1:AudioAction(var_44_17, var_44_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_44_19 = 0.233333333333333
			local var_44_20 = 1

			if var_44_19 < arg_41_1.time_ and arg_41_1.time_ <= var_44_19 + arg_44_0 then
				local var_44_21 = "play"
				local var_44_22 = "music"

				arg_41_1:AudioAction(var_44_21, var_44_22, "bgm_activity_1_6_story_intense", "bgm_activity_1_6_story_intense", "bgm_activity_1_6_story_intense.awb")
			end

			local var_44_23 = 0
			local var_44_24 = 0.175

			if var_44_23 < arg_41_1.time_ and arg_41_1.time_ <= var_44_23 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_25 = arg_41_1:FormatText(StoryNameCfg[6].name)

				arg_41_1.leftNameTxt_.text = var_44_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_26 = arg_41_1:GetWordFromCfg(319931010)
				local var_44_27 = arg_41_1:FormatText(var_44_26.content)

				arg_41_1.text_.text = var_44_27

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_28 = 7
				local var_44_29 = utf8.len(var_44_27)
				local var_44_30 = var_44_28 <= 0 and var_44_24 or var_44_24 * (var_44_29 / var_44_28)

				if var_44_30 > 0 and var_44_24 < var_44_30 then
					arg_41_1.talkMaxDuration = var_44_30

					if var_44_30 + var_44_23 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_30 + var_44_23
					end
				end

				arg_41_1.text_.text = var_44_27
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931010", "story_v_out_319931.awb") ~= 0 then
					local var_44_31 = manager.audio:GetVoiceLength("story_v_out_319931", "319931010", "story_v_out_319931.awb") / 1000

					if var_44_31 + var_44_23 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_31 + var_44_23
					end

					if var_44_26.prefab_name ~= "" and arg_41_1.actors_[var_44_26.prefab_name] ~= nil then
						local var_44_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_26.prefab_name].transform, "story_v_out_319931", "319931010", "story_v_out_319931.awb")

						arg_41_1:RecordAudio("319931010", var_44_32)
						arg_41_1:RecordAudio("319931010", var_44_32)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319931", "319931010", "story_v_out_319931.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319931", "319931010", "story_v_out_319931.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_33 = math.max(var_44_24, arg_41_1.talkMaxDuration)

			if var_44_23 <= arg_41_1.time_ and arg_41_1.time_ < var_44_23 + var_44_33 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_23) / var_44_33

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_23 + var_44_33 and arg_41_1.time_ < var_44_23 + var_44_33 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319931011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319931011
		arg_45_1.duration_ = 8.2

		local var_45_0 = {
			zh = 8.2,
			ja = 7.633
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
				arg_45_0:Play319931012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "10075ui_story"

			if arg_45_1.actors_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(Asset.Load("Char/" .. var_48_0), arg_45_1.stage_.transform)

				var_48_1.name = var_48_0
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.actors_[var_48_0] = var_48_1

				local var_48_2 = var_48_1:GetComponentInChildren(typeof(CharacterEffect))

				var_48_2.enabled = true

				local var_48_3 = GameObjectTools.GetOrAddComponent(var_48_1, typeof(DynamicBoneHelper))

				if var_48_3 then
					var_48_3:EnableDynamicBone(false)
				end

				arg_45_1:ShowWeapon(var_48_2.transform, false)

				arg_45_1.var_[var_48_0 .. "Animator"] = var_48_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_45_1.var_[var_48_0 .. "Animator"].applyRootMotion = true
				arg_45_1.var_[var_48_0 .. "LipSync"] = var_48_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_48_4 = arg_45_1.actors_["10075ui_story"].transform
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.var_.moveOldPos10075ui_story = var_48_4.localPosition
			end

			local var_48_6 = 0.001

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6
				local var_48_8 = Vector3.New(0.7, -0.715, -6.15)

				var_48_4.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10075ui_story, var_48_8, var_48_7)

				local var_48_9 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_9.x, var_48_9.y, var_48_9.z)

				local var_48_10 = var_48_4.localEulerAngles

				var_48_10.z = 0
				var_48_10.x = 0
				var_48_4.localEulerAngles = var_48_10
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				var_48_4.localPosition = Vector3.New(0.7, -0.715, -6.15)

				local var_48_11 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_11.x, var_48_11.y, var_48_11.z)

				local var_48_12 = var_48_4.localEulerAngles

				var_48_12.z = 0
				var_48_12.x = 0
				var_48_4.localEulerAngles = var_48_12
			end

			local var_48_13 = arg_45_1.actors_["10075ui_story"]
			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 and arg_45_1.var_.characterEffect10075ui_story == nil then
				arg_45_1.var_.characterEffect10075ui_story = var_48_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_15 = 0.200000002980232

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15

				if arg_45_1.var_.characterEffect10075ui_story then
					arg_45_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 and arg_45_1.var_.characterEffect10075ui_story then
				arg_45_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_48_17 = 0

			if var_48_17 < arg_45_1.time_ and arg_45_1.time_ <= var_48_17 + arg_48_0 then
				arg_45_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_48_18 = 0

			if var_48_18 < arg_45_1.time_ and arg_45_1.time_ <= var_48_18 + arg_48_0 then
				arg_45_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_48_19 = arg_45_1.actors_["10079ui_story"].transform
			local var_48_20 = 0

			if var_48_20 < arg_45_1.time_ and arg_45_1.time_ <= var_48_20 + arg_48_0 then
				arg_45_1.var_.moveOldPos10079ui_story = var_48_19.localPosition
			end

			local var_48_21 = 0.001

			if var_48_20 <= arg_45_1.time_ and arg_45_1.time_ < var_48_20 + var_48_21 then
				local var_48_22 = (arg_45_1.time_ - var_48_20) / var_48_21
				local var_48_23 = Vector3.New(-0.7, -0.95, -6.05)

				var_48_19.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10079ui_story, var_48_23, var_48_22)

				local var_48_24 = manager.ui.mainCamera.transform.position - var_48_19.position

				var_48_19.forward = Vector3.New(var_48_24.x, var_48_24.y, var_48_24.z)

				local var_48_25 = var_48_19.localEulerAngles

				var_48_25.z = 0
				var_48_25.x = 0
				var_48_19.localEulerAngles = var_48_25
			end

			if arg_45_1.time_ >= var_48_20 + var_48_21 and arg_45_1.time_ < var_48_20 + var_48_21 + arg_48_0 then
				var_48_19.localPosition = Vector3.New(-0.7, -0.95, -6.05)

				local var_48_26 = manager.ui.mainCamera.transform.position - var_48_19.position

				var_48_19.forward = Vector3.New(var_48_26.x, var_48_26.y, var_48_26.z)

				local var_48_27 = var_48_19.localEulerAngles

				var_48_27.z = 0
				var_48_27.x = 0
				var_48_19.localEulerAngles = var_48_27
			end

			local var_48_28 = arg_45_1.actors_["10079ui_story"]
			local var_48_29 = 0

			if var_48_29 < arg_45_1.time_ and arg_45_1.time_ <= var_48_29 + arg_48_0 and arg_45_1.var_.characterEffect10079ui_story == nil then
				arg_45_1.var_.characterEffect10079ui_story = var_48_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_30 = 0.200000002980232

			if var_48_29 <= arg_45_1.time_ and arg_45_1.time_ < var_48_29 + var_48_30 then
				local var_48_31 = (arg_45_1.time_ - var_48_29) / var_48_30

				if arg_45_1.var_.characterEffect10079ui_story then
					local var_48_32 = Mathf.Lerp(0, 0.5, var_48_31)

					arg_45_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_45_1.var_.characterEffect10079ui_story.fillRatio = var_48_32
				end
			end

			if arg_45_1.time_ >= var_48_29 + var_48_30 and arg_45_1.time_ < var_48_29 + var_48_30 + arg_48_0 and arg_45_1.var_.characterEffect10079ui_story then
				local var_48_33 = 0.5

				arg_45_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_45_1.var_.characterEffect10079ui_story.fillRatio = var_48_33
			end

			local var_48_34 = 0
			local var_48_35 = 0.45

			if var_48_34 < arg_45_1.time_ and arg_45_1.time_ <= var_48_34 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_36 = arg_45_1:FormatText(StoryNameCfg[692].name)

				arg_45_1.leftNameTxt_.text = var_48_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_37 = arg_45_1:GetWordFromCfg(319931011)
				local var_48_38 = arg_45_1:FormatText(var_48_37.content)

				arg_45_1.text_.text = var_48_38

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_39 = 18
				local var_48_40 = utf8.len(var_48_38)
				local var_48_41 = var_48_39 <= 0 and var_48_35 or var_48_35 * (var_48_40 / var_48_39)

				if var_48_41 > 0 and var_48_35 < var_48_41 then
					arg_45_1.talkMaxDuration = var_48_41

					if var_48_41 + var_48_34 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_41 + var_48_34
					end
				end

				arg_45_1.text_.text = var_48_38
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931011", "story_v_out_319931.awb") ~= 0 then
					local var_48_42 = manager.audio:GetVoiceLength("story_v_out_319931", "319931011", "story_v_out_319931.awb") / 1000

					if var_48_42 + var_48_34 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_42 + var_48_34
					end

					if var_48_37.prefab_name ~= "" and arg_45_1.actors_[var_48_37.prefab_name] ~= nil then
						local var_48_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_37.prefab_name].transform, "story_v_out_319931", "319931011", "story_v_out_319931.awb")

						arg_45_1:RecordAudio("319931011", var_48_43)
						arg_45_1:RecordAudio("319931011", var_48_43)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319931", "319931011", "story_v_out_319931.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319931", "319931011", "story_v_out_319931.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_44 = math.max(var_48_35, arg_45_1.talkMaxDuration)

			if var_48_34 <= arg_45_1.time_ and arg_45_1.time_ < var_48_34 + var_48_44 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_34) / var_48_44

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_34 + var_48_44 and arg_45_1.time_ < var_48_34 + var_48_44 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319931012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319931012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play319931013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10075ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10075ui_story == nil then
				arg_49_1.var_.characterEffect10075ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10075ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10075ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10075ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10075ui_story.fillRatio = var_52_5
			end

			local var_52_6 = 0
			local var_52_7 = 1

			if var_52_6 < arg_49_1.time_ and arg_49_1.time_ <= var_52_6 + arg_52_0 then
				local var_52_8 = "play"
				local var_52_9 = "effect"

				arg_49_1:AudioAction(var_52_8, var_52_9, "se_story_122_03", "se_story_122_03_crystal2", "")
			end

			local var_52_10 = arg_49_1.actors_["10075ui_story"].transform
			local var_52_11 = 0

			if var_52_11 < arg_49_1.time_ and arg_49_1.time_ <= var_52_11 + arg_52_0 then
				arg_49_1.var_.moveOldPos10075ui_story = var_52_10.localPosition
			end

			local var_52_12 = 0.001

			if var_52_11 <= arg_49_1.time_ and arg_49_1.time_ < var_52_11 + var_52_12 then
				local var_52_13 = (arg_49_1.time_ - var_52_11) / var_52_12
				local var_52_14 = Vector3.New(0, 100, 0)

				var_52_10.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10075ui_story, var_52_14, var_52_13)

				local var_52_15 = manager.ui.mainCamera.transform.position - var_52_10.position

				var_52_10.forward = Vector3.New(var_52_15.x, var_52_15.y, var_52_15.z)

				local var_52_16 = var_52_10.localEulerAngles

				var_52_16.z = 0
				var_52_16.x = 0
				var_52_10.localEulerAngles = var_52_16
			end

			if arg_49_1.time_ >= var_52_11 + var_52_12 and arg_49_1.time_ < var_52_11 + var_52_12 + arg_52_0 then
				var_52_10.localPosition = Vector3.New(0, 100, 0)

				local var_52_17 = manager.ui.mainCamera.transform.position - var_52_10.position

				var_52_10.forward = Vector3.New(var_52_17.x, var_52_17.y, var_52_17.z)

				local var_52_18 = var_52_10.localEulerAngles

				var_52_18.z = 0
				var_52_18.x = 0
				var_52_10.localEulerAngles = var_52_18
			end

			local var_52_19 = arg_49_1.actors_["10079ui_story"].transform
			local var_52_20 = 0

			if var_52_20 < arg_49_1.time_ and arg_49_1.time_ <= var_52_20 + arg_52_0 then
				arg_49_1.var_.moveOldPos10079ui_story = var_52_19.localPosition
			end

			local var_52_21 = 0.001

			if var_52_20 <= arg_49_1.time_ and arg_49_1.time_ < var_52_20 + var_52_21 then
				local var_52_22 = (arg_49_1.time_ - var_52_20) / var_52_21
				local var_52_23 = Vector3.New(0, 100, 0)

				var_52_19.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10079ui_story, var_52_23, var_52_22)

				local var_52_24 = manager.ui.mainCamera.transform.position - var_52_19.position

				var_52_19.forward = Vector3.New(var_52_24.x, var_52_24.y, var_52_24.z)

				local var_52_25 = var_52_19.localEulerAngles

				var_52_25.z = 0
				var_52_25.x = 0
				var_52_19.localEulerAngles = var_52_25
			end

			if arg_49_1.time_ >= var_52_20 + var_52_21 and arg_49_1.time_ < var_52_20 + var_52_21 + arg_52_0 then
				var_52_19.localPosition = Vector3.New(0, 100, 0)

				local var_52_26 = manager.ui.mainCamera.transform.position - var_52_19.position

				var_52_19.forward = Vector3.New(var_52_26.x, var_52_26.y, var_52_26.z)

				local var_52_27 = var_52_19.localEulerAngles

				var_52_27.z = 0
				var_52_27.x = 0
				var_52_19.localEulerAngles = var_52_27
			end

			local var_52_28 = 0
			local var_52_29 = 1.15

			if var_52_28 < arg_49_1.time_ and arg_49_1.time_ <= var_52_28 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_30 = arg_49_1:GetWordFromCfg(319931012)
				local var_52_31 = arg_49_1:FormatText(var_52_30.content)

				arg_49_1.text_.text = var_52_31

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_32 = 46
				local var_52_33 = utf8.len(var_52_31)
				local var_52_34 = var_52_32 <= 0 and var_52_29 or var_52_29 * (var_52_33 / var_52_32)

				if var_52_34 > 0 and var_52_29 < var_52_34 then
					arg_49_1.talkMaxDuration = var_52_34

					if var_52_34 + var_52_28 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_34 + var_52_28
					end
				end

				arg_49_1.text_.text = var_52_31
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_35 = math.max(var_52_29, arg_49_1.talkMaxDuration)

			if var_52_28 <= arg_49_1.time_ and arg_49_1.time_ < var_52_28 + var_52_35 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_28) / var_52_35

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_28 + var_52_35 and arg_49_1.time_ < var_52_28 + var_52_35 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319931013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319931013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play319931014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.825

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_2 = arg_53_1:GetWordFromCfg(319931013)
				local var_56_3 = arg_53_1:FormatText(var_56_2.content)

				arg_53_1.text_.text = var_56_3

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_4 = 33
				local var_56_5 = utf8.len(var_56_3)
				local var_56_6 = var_56_4 <= 0 and var_56_1 or var_56_1 * (var_56_5 / var_56_4)

				if var_56_6 > 0 and var_56_1 < var_56_6 then
					arg_53_1.talkMaxDuration = var_56_6

					if var_56_6 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_6 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_3
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_7 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_7 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_7

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_7 and arg_53_1.time_ < var_56_0 + var_56_7 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319931014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319931014
		arg_57_1.duration_ = 2.733

		local var_57_0 = {
			zh = 2.733,
			ja = 2.533
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
				arg_57_0:Play319931015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10079ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10079ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, -0.95, -6.05)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10079ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = 0

			if var_60_9 < arg_57_1.time_ and arg_57_1.time_ <= var_60_9 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_60_11 = arg_57_1.actors_["10079ui_story"]
			local var_60_12 = 0

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story == nil then
				arg_57_1.var_.characterEffect10079ui_story = var_60_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_13 = 0.2

			if var_60_12 <= arg_57_1.time_ and arg_57_1.time_ < var_60_12 + var_60_13 then
				local var_60_14 = (arg_57_1.time_ - var_60_12) / var_60_13

				if arg_57_1.var_.characterEffect10079ui_story then
					arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_12 + var_60_13 and arg_57_1.time_ < var_60_12 + var_60_13 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story then
				arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_60_15 = 0
			local var_60_16 = 0.175

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[6].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(319931014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 7
				local var_60_21 = utf8.len(var_60_19)
				local var_60_22 = var_60_20 <= 0 and var_60_16 or var_60_16 * (var_60_21 / var_60_20)

				if var_60_22 > 0 and var_60_16 < var_60_22 then
					arg_57_1.talkMaxDuration = var_60_22

					if var_60_22 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_22 + var_60_15
					end
				end

				arg_57_1.text_.text = var_60_19
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931014", "story_v_out_319931.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_out_319931", "319931014", "story_v_out_319931.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_out_319931", "319931014", "story_v_out_319931.awb")

						arg_57_1:RecordAudio("319931014", var_60_24)
						arg_57_1:RecordAudio("319931014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319931", "319931014", "story_v_out_319931.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319931", "319931014", "story_v_out_319931.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_25 = math.max(var_60_16, arg_57_1.talkMaxDuration)

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_25 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_15) / var_60_25

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_15 + var_60_25 and arg_57_1.time_ < var_60_15 + var_60_25 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319931015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319931015
		arg_61_1.duration_ = 3.833

		local var_61_0 = {
			zh = 3.8,
			ja = 3.833
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
				arg_61_0:Play319931016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.375

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[6].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(319931015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931015", "story_v_out_319931.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931015", "story_v_out_319931.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_319931", "319931015", "story_v_out_319931.awb")

						arg_61_1:RecordAudio("319931015", var_64_9)
						arg_61_1:RecordAudio("319931015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319931", "319931015", "story_v_out_319931.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319931", "319931015", "story_v_out_319931.awb")
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
	Play319931016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319931016
		arg_65_1.duration_ = 5.966

		local var_65_0 = {
			zh = 5.966,
			ja = 4.833
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
				arg_65_0:Play319931017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 then
				arg_65_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_68_2 = 0
			local var_68_3 = 0.4

			if var_68_2 < arg_65_1.time_ and arg_65_1.time_ <= var_68_2 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_4 = arg_65_1:FormatText(StoryNameCfg[6].name)

				arg_65_1.leftNameTxt_.text = var_68_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_5 = arg_65_1:GetWordFromCfg(319931016)
				local var_68_6 = arg_65_1:FormatText(var_68_5.content)

				arg_65_1.text_.text = var_68_6

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_7 = 16
				local var_68_8 = utf8.len(var_68_6)
				local var_68_9 = var_68_7 <= 0 and var_68_3 or var_68_3 * (var_68_8 / var_68_7)

				if var_68_9 > 0 and var_68_3 < var_68_9 then
					arg_65_1.talkMaxDuration = var_68_9

					if var_68_9 + var_68_2 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_9 + var_68_2
					end
				end

				arg_65_1.text_.text = var_68_6
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931016", "story_v_out_319931.awb") ~= 0 then
					local var_68_10 = manager.audio:GetVoiceLength("story_v_out_319931", "319931016", "story_v_out_319931.awb") / 1000

					if var_68_10 + var_68_2 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_10 + var_68_2
					end

					if var_68_5.prefab_name ~= "" and arg_65_1.actors_[var_68_5.prefab_name] ~= nil then
						local var_68_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_5.prefab_name].transform, "story_v_out_319931", "319931016", "story_v_out_319931.awb")

						arg_65_1:RecordAudio("319931016", var_68_11)
						arg_65_1:RecordAudio("319931016", var_68_11)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_319931", "319931016", "story_v_out_319931.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_319931", "319931016", "story_v_out_319931.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_12 = math.max(var_68_3, arg_65_1.talkMaxDuration)

			if var_68_2 <= arg_65_1.time_ and arg_65_1.time_ < var_68_2 + var_68_12 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_2) / var_68_12

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_2 + var_68_12 and arg_65_1.time_ < var_68_2 + var_68_12 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319931017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319931017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319931018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10079ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect10079ui_story == nil then
				arg_69_1.var_.characterEffect10079ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect10079ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_69_1.var_.characterEffect10079ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect10079ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_69_1.var_.characterEffect10079ui_story.fillRatio = var_72_5
			end

			local var_72_6 = arg_69_1.actors_["10079ui_story"].transform
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 then
				arg_69_1.var_.moveOldPos10079ui_story = var_72_6.localPosition
			end

			local var_72_8 = 0.001

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8
				local var_72_10 = Vector3.New(0, 100, 0)

				var_72_6.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos10079ui_story, var_72_10, var_72_9)

				local var_72_11 = manager.ui.mainCamera.transform.position - var_72_6.position

				var_72_6.forward = Vector3.New(var_72_11.x, var_72_11.y, var_72_11.z)

				local var_72_12 = var_72_6.localEulerAngles

				var_72_12.z = 0
				var_72_12.x = 0
				var_72_6.localEulerAngles = var_72_12
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 then
				var_72_6.localPosition = Vector3.New(0, 100, 0)

				local var_72_13 = manager.ui.mainCamera.transform.position - var_72_6.position

				var_72_6.forward = Vector3.New(var_72_13.x, var_72_13.y, var_72_13.z)

				local var_72_14 = var_72_6.localEulerAngles

				var_72_14.z = 0
				var_72_14.x = 0
				var_72_6.localEulerAngles = var_72_14
			end

			local var_72_15 = 0
			local var_72_16 = 1.175

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_17 = arg_69_1:GetWordFromCfg(319931017)
				local var_72_18 = arg_69_1:FormatText(var_72_17.content)

				arg_69_1.text_.text = var_72_18

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_19 = 47
				local var_72_20 = utf8.len(var_72_18)
				local var_72_21 = var_72_19 <= 0 and var_72_16 or var_72_16 * (var_72_20 / var_72_19)

				if var_72_21 > 0 and var_72_16 < var_72_21 then
					arg_69_1.talkMaxDuration = var_72_21

					if var_72_21 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_18
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_22 and arg_69_1.time_ < var_72_15 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319931018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319931018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play319931019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.375

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_2 = arg_73_1:GetWordFromCfg(319931018)
				local var_76_3 = arg_73_1:FormatText(var_76_2.content)

				arg_73_1.text_.text = var_76_3

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_4 = 55
				local var_76_5 = utf8.len(var_76_3)
				local var_76_6 = var_76_4 <= 0 and var_76_1 or var_76_1 * (var_76_5 / var_76_4)

				if var_76_6 > 0 and var_76_1 < var_76_6 then
					arg_73_1.talkMaxDuration = var_76_6

					if var_76_6 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_6 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_3
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_7 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_7 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_7

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_7 and arg_73_1.time_ < var_76_0 + var_76_7 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319931019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319931019
		arg_77_1.duration_ = 1.999999999999

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319931020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10079ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10079ui_story = var_80_0.localPosition

				local var_80_2 = "10079ui_story"

				arg_77_1:ShowWeapon(arg_77_1.var_[var_80_2 .. "Animator"].transform, true)
			end

			local var_80_3 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_3 then
				local var_80_4 = (arg_77_1.time_ - var_80_1) / var_80_3
				local var_80_5 = Vector3.New(0, -0.95, -6.05)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10079ui_story, var_80_5, var_80_4)

				local var_80_6 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_6.x, var_80_6.y, var_80_6.z)

				local var_80_7 = var_80_0.localEulerAngles

				var_80_7.z = 0
				var_80_7.x = 0
				var_80_0.localEulerAngles = var_80_7
			end

			if arg_77_1.time_ >= var_80_1 + var_80_3 and arg_77_1.time_ < var_80_1 + var_80_3 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_80_8 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_8.x, var_80_8.y, var_80_8.z)

				local var_80_9 = var_80_0.localEulerAngles

				var_80_9.z = 0
				var_80_9.x = 0
				var_80_0.localEulerAngles = var_80_9
			end

			local var_80_10 = arg_77_1.actors_["10079ui_story"]
			local var_80_11 = 0

			if var_80_11 < arg_77_1.time_ and arg_77_1.time_ <= var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story == nil then
				arg_77_1.var_.characterEffect10079ui_story = var_80_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_12 = 0.200000002980232

			if var_80_11 <= arg_77_1.time_ and arg_77_1.time_ < var_80_11 + var_80_12 then
				local var_80_13 = (arg_77_1.time_ - var_80_11) / var_80_12

				if arg_77_1.var_.characterEffect10079ui_story then
					arg_77_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_11 + var_80_12 and arg_77_1.time_ < var_80_11 + var_80_12 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story then
				arg_77_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_80_15 = 0

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_80_16 = 0
			local var_80_17 = 0.1

			if var_80_16 < arg_77_1.time_ and arg_77_1.time_ <= var_80_16 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_18 = arg_77_1:FormatText(StoryNameCfg[6].name)

				arg_77_1.leftNameTxt_.text = var_80_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_19 = arg_77_1:GetWordFromCfg(319931019)
				local var_80_20 = arg_77_1:FormatText(var_80_19.content)

				arg_77_1.text_.text = var_80_20

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_21 = 4
				local var_80_22 = utf8.len(var_80_20)
				local var_80_23 = var_80_21 <= 0 and var_80_17 or var_80_17 * (var_80_22 / var_80_21)

				if var_80_23 > 0 and var_80_17 < var_80_23 then
					arg_77_1.talkMaxDuration = var_80_23

					if var_80_23 + var_80_16 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_16
					end
				end

				arg_77_1.text_.text = var_80_20
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931019", "story_v_out_319931.awb") ~= 0 then
					local var_80_24 = manager.audio:GetVoiceLength("story_v_out_319931", "319931019", "story_v_out_319931.awb") / 1000

					if var_80_24 + var_80_16 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_24 + var_80_16
					end

					if var_80_19.prefab_name ~= "" and arg_77_1.actors_[var_80_19.prefab_name] ~= nil then
						local var_80_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_19.prefab_name].transform, "story_v_out_319931", "319931019", "story_v_out_319931.awb")

						arg_77_1:RecordAudio("319931019", var_80_25)
						arg_77_1:RecordAudio("319931019", var_80_25)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319931", "319931019", "story_v_out_319931.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319931", "319931019", "story_v_out_319931.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_26 = math.max(var_80_17, arg_77_1.talkMaxDuration)

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_26 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_16) / var_80_26

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_16 + var_80_26 and arg_77_1.time_ < var_80_16 + var_80_26 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319931020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319931020
		arg_81_1.duration_ = 1.999999999999

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play319931021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = true

				arg_81_1:SetGaussion(false)
			end

			local var_84_1 = 1

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_1 then
				local var_84_2 = (arg_81_1.time_ - var_84_0) / var_84_1
				local var_84_3 = Color.New(1, 1, 1)

				var_84_3.a = Mathf.Lerp(1, 0, var_84_2)
				arg_81_1.mask_.color = var_84_3
			end

			if arg_81_1.time_ >= var_84_0 + var_84_1 and arg_81_1.time_ < var_84_0 + var_84_1 + arg_84_0 then
				local var_84_4 = Color.New(1, 1, 1)
				local var_84_5 = 0

				arg_81_1.mask_.enabled = false
				var_84_4.a = var_84_5
				arg_81_1.mask_.color = var_84_4
			end

			local var_84_6 = manager.ui.mainCamera.transform
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 then
				arg_81_1.var_.shakeOldPos = var_84_6.localPosition
			end

			local var_84_8 = 0.5

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_8 then
				local var_84_9 = (arg_81_1.time_ - var_84_7) / 0.066
				local var_84_10, var_84_11 = math.modf(var_84_9)

				var_84_6.localPosition = Vector3.New(var_84_11 * 0.13, var_84_11 * 0.13, var_84_11 * 0.13) + arg_81_1.var_.shakeOldPos
			end

			if arg_81_1.time_ >= var_84_7 + var_84_8 and arg_81_1.time_ < var_84_7 + var_84_8 + arg_84_0 then
				var_84_6.localPosition = arg_81_1.var_.shakeOldPos
			end

			local var_84_12 = arg_81_1.actors_["10079ui_story"].transform
			local var_84_13 = 0

			if var_84_13 < arg_81_1.time_ and arg_81_1.time_ <= var_84_13 + arg_84_0 then
				arg_81_1.var_.moveOldPos10079ui_story = var_84_12.localPosition

				local var_84_14 = "10079ui_story"

				arg_81_1:ShowWeapon(arg_81_1.var_[var_84_14 .. "Animator"].transform, false)
			end

			local var_84_15 = 0.001

			if var_84_13 <= arg_81_1.time_ and arg_81_1.time_ < var_84_13 + var_84_15 then
				local var_84_16 = (arg_81_1.time_ - var_84_13) / var_84_15
				local var_84_17 = Vector3.New(0, 100, 0)

				var_84_12.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10079ui_story, var_84_17, var_84_16)

				local var_84_18 = manager.ui.mainCamera.transform.position - var_84_12.position

				var_84_12.forward = Vector3.New(var_84_18.x, var_84_18.y, var_84_18.z)

				local var_84_19 = var_84_12.localEulerAngles

				var_84_19.z = 0
				var_84_19.x = 0
				var_84_12.localEulerAngles = var_84_19
			end

			if arg_81_1.time_ >= var_84_13 + var_84_15 and arg_81_1.time_ < var_84_13 + var_84_15 + arg_84_0 then
				var_84_12.localPosition = Vector3.New(0, 100, 0)

				local var_84_20 = manager.ui.mainCamera.transform.position - var_84_12.position

				var_84_12.forward = Vector3.New(var_84_20.x, var_84_20.y, var_84_20.z)

				local var_84_21 = var_84_12.localEulerAngles

				var_84_21.z = 0
				var_84_21.x = 0
				var_84_12.localEulerAngles = var_84_21
			end

			local var_84_22 = 0
			local var_84_23 = 1.566
			local var_84_24 = manager.audio:GetVoiceLength("story_v_out_319931", "319931020", "story_v_out_319931.awb") / 1000

			if var_84_24 > 0 and var_84_23 < var_84_24 and var_84_24 + var_84_22 > arg_81_1.duration_ then
				local var_84_25 = var_84_24

				arg_81_1.duration_ = var_84_24 + var_84_22
			end

			if var_84_22 < arg_81_1.time_ and arg_81_1.time_ <= var_84_22 + arg_84_0 then
				local var_84_26 = "play"
				local var_84_27 = "voice"

				arg_81_1:AudioAction(var_84_26, var_84_27, "story_v_out_319931", "319931020", "story_v_out_319931.awb")
			end

			local var_84_28 = 0

			if var_84_28 < arg_81_1.time_ and arg_81_1.time_ <= var_84_28 + arg_84_0 then
				local var_84_29 = manager.ui.mainCamera.transform.localPosition
				local var_84_30 = Vector3.New(0, 0, 10) + Vector3.New(var_84_29.x, var_84_29.y, 0)
				local var_84_31 = arg_81_1.bgs_.STblack

				var_84_31.transform.localPosition = var_84_30
				var_84_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_84_32 = var_84_31:GetComponent("SpriteRenderer")

				if var_84_32 and var_84_32.sprite then
					local var_84_33 = (var_84_31.transform.localPosition - var_84_29).z
					local var_84_34 = manager.ui.mainCameraCom_
					local var_84_35 = 2 * var_84_33 * Mathf.Tan(var_84_34.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_84_36 = var_84_35 * var_84_34.aspect
					local var_84_37 = var_84_32.sprite.bounds.size.x
					local var_84_38 = var_84_32.sprite.bounds.size.y
					local var_84_39 = var_84_36 / var_84_37
					local var_84_40 = var_84_35 / var_84_38
					local var_84_41 = var_84_40 < var_84_39 and var_84_39 or var_84_40

					var_84_31.transform.localScale = Vector3.New(var_84_41, var_84_41, 0)
				end

				for iter_84_0, iter_84_1 in pairs(arg_81_1.bgs_) do
					if iter_84_0 ~= "STblack" then
						iter_84_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_84_42 = 0

			if var_84_42 < arg_81_1.time_ and arg_81_1.time_ <= var_84_42 + arg_84_0 then
				local var_84_43 = arg_81_1.fswbg_.transform:Find("textbox/adapt/content") or arg_81_1.fswbg_.transform:Find("textbox/content")
				local var_84_44 = var_84_43:GetComponent("Text")
				local var_84_45 = var_84_43:GetComponent("RectTransform")

				var_84_44.alignment = UnityEngine.TextAnchor.LowerCenter
				var_84_45.offsetMin = Vector2.New(0, 0)
				var_84_45.offsetMax = Vector2.New(0, 0)
			end

			local var_84_46 = 0

			if var_84_46 < arg_81_1.time_ and arg_81_1.time_ <= var_84_46 + arg_84_0 then
				arg_81_1.fswbg_:SetActive(true)
				arg_81_1.dialog_:SetActive(false)

				arg_81_1.fswtw_.percent = 0

				local var_84_47 = arg_81_1:GetWordFromCfg(319931020)
				local var_84_48 = arg_81_1:FormatText(var_84_47.content)

				arg_81_1.fswt_.text = var_84_48

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.fswt_)

				arg_81_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_81_1.fswtw_:SetDirty()

				arg_81_1.typewritterCharCountI18N = 0

				SetActive(arg_81_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_81_1:ShowNextGo(false)
			end

			local var_84_49 = 0.149999999998999

			if var_84_49 < arg_81_1.time_ and arg_81_1.time_ <= var_84_49 + arg_84_0 then
				arg_81_1.var_.oldValueTypewriter = arg_81_1.fswtw_.percent

				arg_81_1:ShowNextGo(false)
			end

			local var_84_50 = 0
			local var_84_51 = 0
			local var_84_52 = arg_81_1:GetWordFromCfg(319931020)
			local var_84_53 = arg_81_1:FormatText(var_84_52.content)
			local var_84_54, var_84_55 = arg_81_1:GetPercentByPara(var_84_53, 1)

			if var_84_49 < arg_81_1.time_ and arg_81_1.time_ <= var_84_49 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				local var_84_56 = var_84_50 <= 0 and var_84_51 or var_84_51 * ((var_84_55 - arg_81_1.typewritterCharCountI18N) / var_84_50)

				if var_84_56 > 0 and var_84_51 < var_84_56 then
					arg_81_1.talkMaxDuration = var_84_56

					if var_84_56 + var_84_49 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_56 + var_84_49
					end
				end
			end

			local var_84_57 = 0
			local var_84_58 = math.max(var_84_57, arg_81_1.talkMaxDuration)

			if var_84_49 <= arg_81_1.time_ and arg_81_1.time_ < var_84_49 + var_84_58 then
				local var_84_59 = (arg_81_1.time_ - var_84_49) / var_84_58

				arg_81_1.fswtw_.percent = Mathf.Lerp(arg_81_1.var_.oldValueTypewriter, var_84_54, var_84_59)
				arg_81_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_81_1.fswtw_:SetDirty()
			end

			if arg_81_1.time_ >= var_84_49 + var_84_58 and arg_81_1.time_ < var_84_49 + var_84_58 + arg_84_0 then
				arg_81_1.fswtw_.percent = var_84_54

				arg_81_1.fswtw_:SetDirty()
				arg_81_1:ShowNextGo(true)

				arg_81_1.typewritterCharCountI18N = var_84_55
			end

			local var_84_60 = 0.149999999998999

			if var_84_60 < arg_81_1.time_ and arg_81_1.time_ <= var_84_60 + arg_84_0 then
				arg_81_1.var_.oldValueTypewriter = arg_81_1.fswtw_.percent

				arg_81_1:ShowNextGo(false)
			end

			local var_84_61 = 3
			local var_84_62 = 0.200000000001001
			local var_84_63 = arg_81_1:GetWordFromCfg(319931020)
			local var_84_64 = arg_81_1:FormatText(var_84_63.content)
			local var_84_65, var_84_66 = arg_81_1:GetPercentByPara(var_84_64, 1)

			if var_84_60 < arg_81_1.time_ and arg_81_1.time_ <= var_84_60 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				local var_84_67 = var_84_61 <= 0 and var_84_62 or var_84_62 * ((var_84_66 - arg_81_1.typewritterCharCountI18N) / var_84_61)

				if var_84_67 > 0 and var_84_62 < var_84_67 then
					arg_81_1.talkMaxDuration = var_84_67

					if var_84_67 + var_84_60 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_67 + var_84_60
					end
				end
			end

			local var_84_68 = 0.200000000001001
			local var_84_69 = math.max(var_84_68, arg_81_1.talkMaxDuration)

			if var_84_60 <= arg_81_1.time_ and arg_81_1.time_ < var_84_60 + var_84_69 then
				local var_84_70 = (arg_81_1.time_ - var_84_60) / var_84_69

				arg_81_1.fswtw_.percent = Mathf.Lerp(arg_81_1.var_.oldValueTypewriter, var_84_65, var_84_70)
				arg_81_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_81_1.fswtw_:SetDirty()
			end

			if arg_81_1.time_ >= var_84_60 + var_84_69 and arg_81_1.time_ < var_84_60 + var_84_69 + arg_84_0 then
				arg_81_1.fswtw_.percent = var_84_65

				arg_81_1.fswtw_:SetDirty()
				arg_81_1:ShowNextGo(true)

				arg_81_1.typewritterCharCountI18N = var_84_66
			end

			local var_84_71 = 0

			if var_84_71 < arg_81_1.time_ and arg_81_1.time_ <= var_84_71 + arg_84_0 then
				arg_81_1.cswbg_:SetActive(true)

				local var_84_72 = arg_81_1.cswt_:GetComponent("RectTransform")

				arg_81_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_84_72.offsetMin = Vector2.New(410, 330)
				var_84_72.offsetMax = Vector2.New(-400, -175)

				local var_84_73 = arg_81_1:GetWordFromCfg(419079)
				local var_84_74 = arg_81_1:FormatText(var_84_73.content)

				arg_81_1.cswt_.text = var_84_74

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.cswt_)

				arg_81_1.cswt_.fontSize = 180
				arg_81_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_81_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319931021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319931021
		arg_85_1.duration_ = 6.5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play319931022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0.999999999999

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_1 = manager.ui.mainCamera.transform.localPosition
				local var_88_2 = Vector3.New(0, 0, 10) + Vector3.New(var_88_1.x, var_88_1.y, 0)
				local var_88_3 = arg_85_1.bgs_.STblack

				var_88_3.transform.localPosition = var_88_2
				var_88_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_88_4 = var_88_3:GetComponent("SpriteRenderer")

				if var_88_4 and var_88_4.sprite then
					local var_88_5 = (var_88_3.transform.localPosition - var_88_1).z
					local var_88_6 = manager.ui.mainCameraCom_
					local var_88_7 = 2 * var_88_5 * Mathf.Tan(var_88_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_88_8 = var_88_7 * var_88_6.aspect
					local var_88_9 = var_88_4.sprite.bounds.size.x
					local var_88_10 = var_88_4.sprite.bounds.size.y
					local var_88_11 = var_88_8 / var_88_9
					local var_88_12 = var_88_7 / var_88_10
					local var_88_13 = var_88_12 < var_88_11 and var_88_11 or var_88_12

					var_88_3.transform.localScale = Vector3.New(var_88_13, var_88_13, 0)
				end

				for iter_88_0, iter_88_1 in pairs(arg_85_1.bgs_) do
					if iter_88_0 ~= "STblack" then
						iter_88_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_15 = 1

			if var_88_14 <= arg_85_1.time_ and arg_85_1.time_ < var_88_14 + var_88_15 then
				local var_88_16 = (arg_85_1.time_ - var_88_14) / var_88_15
				local var_88_17 = Color.New(0, 0, 0)

				var_88_17.a = Mathf.Lerp(0, 1, var_88_16)
				arg_85_1.mask_.color = var_88_17
			end

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 then
				local var_88_18 = Color.New(0, 0, 0)

				var_88_18.a = 1
				arg_85_1.mask_.color = var_88_18
			end

			local var_88_19 = 1

			if var_88_19 < arg_85_1.time_ and arg_85_1.time_ <= var_88_19 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_20 = 1

			if var_88_19 <= arg_85_1.time_ and arg_85_1.time_ < var_88_19 + var_88_20 then
				local var_88_21 = (arg_85_1.time_ - var_88_19) / var_88_20
				local var_88_22 = Color.New(0, 0, 0)

				var_88_22.a = Mathf.Lerp(1, 0, var_88_21)
				arg_85_1.mask_.color = var_88_22
			end

			if arg_85_1.time_ >= var_88_19 + var_88_20 and arg_85_1.time_ < var_88_19 + var_88_20 + arg_88_0 then
				local var_88_23 = Color.New(0, 0, 0)
				local var_88_24 = 0

				arg_85_1.mask_.enabled = false
				var_88_23.a = var_88_24
				arg_85_1.mask_.color = var_88_23
			end

			local var_88_25 = 0

			if var_88_25 < arg_85_1.time_ and arg_85_1.time_ <= var_88_25 + arg_88_0 then
				arg_85_1.fswbg_:SetActive(true)
				arg_85_1.dialog_:SetActive(false)

				arg_85_1.fswtw_.percent = 0

				local var_88_26 = arg_85_1:GetWordFromCfg(319931020)
				local var_88_27 = arg_85_1:FormatText(var_88_26.content)

				arg_85_1.fswt_.text = var_88_27

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.fswt_)

				arg_85_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_85_1.fswtw_:SetDirty()

				arg_85_1.typewritterCharCountI18N = 0

				SetActive(arg_85_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_85_1:ShowNextGo(false)
			end

			local var_88_28 = 0.149999999998999

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1.var_.oldValueTypewriter = arg_85_1.fswtw_.percent

				arg_85_1:ShowNextGo(false)
			end

			local var_88_29 = 0
			local var_88_30 = 0
			local var_88_31 = arg_85_1:GetWordFromCfg(319931020)
			local var_88_32 = arg_85_1:FormatText(var_88_31.content)
			local var_88_33, var_88_34 = arg_85_1:GetPercentByPara(var_88_32, 1)

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				local var_88_35 = var_88_29 <= 0 and var_88_30 or var_88_30 * ((var_88_34 - arg_85_1.typewritterCharCountI18N) / var_88_29)

				if var_88_35 > 0 and var_88_30 < var_88_35 then
					arg_85_1.talkMaxDuration = var_88_35

					if var_88_35 + var_88_28 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_35 + var_88_28
					end
				end
			end

			local var_88_36 = 0
			local var_88_37 = math.max(var_88_36, arg_85_1.talkMaxDuration)

			if var_88_28 <= arg_85_1.time_ and arg_85_1.time_ < var_88_28 + var_88_37 then
				local var_88_38 = (arg_85_1.time_ - var_88_28) / var_88_37

				arg_85_1.fswtw_.percent = Mathf.Lerp(arg_85_1.var_.oldValueTypewriter, var_88_33, var_88_38)
				arg_85_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_85_1.fswtw_:SetDirty()
			end

			if arg_85_1.time_ >= var_88_28 + var_88_37 and arg_85_1.time_ < var_88_28 + var_88_37 + arg_88_0 then
				arg_85_1.fswtw_.percent = var_88_33

				arg_85_1.fswtw_:SetDirty()
				arg_85_1:ShowNextGo(true)

				arg_85_1.typewritterCharCountI18N = var_88_34
			end

			local var_88_39 = 0.15

			if var_88_39 < arg_85_1.time_ and arg_85_1.time_ <= var_88_39 + arg_88_0 then
				arg_85_1.fswbg_:SetActive(false)
				arg_85_1.dialog_:SetActive(false)
				arg_85_1:ShowNextGo(false)
			end

			local var_88_40 = 0

			if var_88_40 < arg_85_1.time_ and arg_85_1.time_ <= var_88_40 + arg_88_0 then
				arg_85_1.cswbg_:SetActive(false)
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_41 = 1.5
			local var_88_42 = 0.85

			if var_88_41 < arg_85_1.time_ and arg_85_1.time_ <= var_88_41 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_43 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_43:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_44 = arg_85_1:GetWordFromCfg(319931021)
				local var_88_45 = arg_85_1:FormatText(var_88_44.content)

				arg_85_1.text_.text = var_88_45

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_46 = 34
				local var_88_47 = utf8.len(var_88_45)
				local var_88_48 = var_88_46 <= 0 and var_88_42 or var_88_42 * (var_88_47 / var_88_46)

				if var_88_48 > 0 and var_88_42 < var_88_48 then
					arg_85_1.talkMaxDuration = var_88_48
					var_88_41 = var_88_41 + 0.3

					if var_88_48 + var_88_41 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_48 + var_88_41
					end
				end

				arg_85_1.text_.text = var_88_45
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_49 = var_88_41 + 0.3
			local var_88_50 = math.max(var_88_42, arg_85_1.talkMaxDuration)

			if var_88_49 <= arg_85_1.time_ and arg_85_1.time_ < var_88_49 + var_88_50 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_49) / var_88_50

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_49 + var_88_50 and arg_85_1.time_ < var_88_49 + var_88_50 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319931022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319931022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play319931023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.4

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_2 = arg_91_1:GetWordFromCfg(319931022)
				local var_94_3 = arg_91_1:FormatText(var_94_2.content)

				arg_91_1.text_.text = var_94_3

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_4 = 56
				local var_94_5 = utf8.len(var_94_3)
				local var_94_6 = var_94_4 <= 0 and var_94_1 or var_94_1 * (var_94_5 / var_94_4)

				if var_94_6 > 0 and var_94_1 < var_94_6 then
					arg_91_1.talkMaxDuration = var_94_6

					if var_94_6 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_6 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_3
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_7 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_7 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_7

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_7 and arg_91_1.time_ < var_94_0 + var_94_7 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319931023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319931023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319931024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.05

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_2 = arg_95_1:GetWordFromCfg(319931023)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 42
				local var_98_5 = utf8.len(var_98_3)
				local var_98_6 = var_98_4 <= 0 and var_98_1 or var_98_1 * (var_98_5 / var_98_4)

				if var_98_6 > 0 and var_98_1 < var_98_6 then
					arg_95_1.talkMaxDuration = var_98_6

					if var_98_6 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_6 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_3
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_7 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_7 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_7

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_7 and arg_95_1.time_ < var_98_0 + var_98_7 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319931024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319931024
		arg_99_1.duration_ = 1.916333333331

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play319931025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0.283333333332333
			local var_102_1 = 1.633
			local var_102_2 = manager.audio:GetVoiceLength("story_v_out_319931", "319931024", "story_v_out_319931.awb") / 1000

			if var_102_2 > 0 and var_102_1 < var_102_2 and var_102_2 + var_102_0 > arg_99_1.duration_ then
				local var_102_3 = var_102_2

				arg_99_1.duration_ = var_102_2 + var_102_0
			end

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				local var_102_4 = "play"
				local var_102_5 = "voice"

				arg_99_1:AudioAction(var_102_4, var_102_5, "story_v_out_319931", "319931024", "story_v_out_319931.awb")
			end

			local var_102_6 = 0

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				local var_102_7 = arg_99_1.fswbg_.transform:Find("textbox/adapt/content") or arg_99_1.fswbg_.transform:Find("textbox/content")
				local var_102_8 = var_102_7:GetComponent("Text")
				local var_102_9 = var_102_7:GetComponent("RectTransform")

				var_102_8.alignment = UnityEngine.TextAnchor.LowerCenter
				var_102_9.offsetMin = Vector2.New(0, 0)
				var_102_9.offsetMax = Vector2.New(0, 0)
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1.fswbg_:SetActive(true)
				arg_99_1.dialog_:SetActive(false)

				arg_99_1.fswtw_.percent = 0

				local var_102_11 = arg_99_1:GetWordFromCfg(319931024)
				local var_102_12 = arg_99_1:FormatText(var_102_11.content)

				arg_99_1.fswt_.text = var_102_12

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.fswt_)

				arg_99_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_99_1.fswtw_:SetDirty()

				arg_99_1.typewritterCharCountI18N = 0

				SetActive(arg_99_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_99_1:ShowNextGo(false)
			end

			local var_102_13 = 0.149999999998999

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.var_.oldValueTypewriter = arg_99_1.fswtw_.percent

				arg_99_1:ShowNextGo(false)
			end

			local var_102_14 = 0
			local var_102_15 = 0
			local var_102_16 = arg_99_1:GetWordFromCfg(319931024)
			local var_102_17 = arg_99_1:FormatText(var_102_16.content)
			local var_102_18, var_102_19 = arg_99_1:GetPercentByPara(var_102_17, 1)

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				local var_102_20 = var_102_14 <= 0 and var_102_15 or var_102_15 * ((var_102_19 - arg_99_1.typewritterCharCountI18N) / var_102_14)

				if var_102_20 > 0 and var_102_15 < var_102_20 then
					arg_99_1.talkMaxDuration = var_102_20

					if var_102_20 + var_102_13 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_13
					end
				end
			end

			local var_102_21 = 0
			local var_102_22 = math.max(var_102_21, arg_99_1.talkMaxDuration)

			if var_102_13 <= arg_99_1.time_ and arg_99_1.time_ < var_102_13 + var_102_22 then
				local var_102_23 = (arg_99_1.time_ - var_102_13) / var_102_22

				arg_99_1.fswtw_.percent = Mathf.Lerp(arg_99_1.var_.oldValueTypewriter, var_102_18, var_102_23)
				arg_99_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_99_1.fswtw_:SetDirty()
			end

			if arg_99_1.time_ >= var_102_13 + var_102_22 and arg_99_1.time_ < var_102_13 + var_102_22 + arg_102_0 then
				arg_99_1.fswtw_.percent = var_102_18

				arg_99_1.fswtw_:SetDirty()
				arg_99_1:ShowNextGo(true)

				arg_99_1.typewritterCharCountI18N = var_102_19
			end

			local var_102_24 = 0.283333333332333

			if var_102_24 < arg_99_1.time_ and arg_99_1.time_ <= var_102_24 + arg_102_0 then
				arg_99_1.var_.oldValueTypewriter = arg_99_1.fswtw_.percent

				arg_99_1:ShowNextGo(false)
			end

			local var_102_25 = 4
			local var_102_26 = 0.266666666666667
			local var_102_27 = arg_99_1:GetWordFromCfg(319931024)
			local var_102_28 = arg_99_1:FormatText(var_102_27.content)
			local var_102_29, var_102_30 = arg_99_1:GetPercentByPara(var_102_28, 1)

			if var_102_24 < arg_99_1.time_ and arg_99_1.time_ <= var_102_24 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				local var_102_31 = var_102_25 <= 0 and var_102_26 or var_102_26 * ((var_102_30 - arg_99_1.typewritterCharCountI18N) / var_102_25)

				if var_102_31 > 0 and var_102_26 < var_102_31 then
					arg_99_1.talkMaxDuration = var_102_31

					if var_102_31 + var_102_24 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_31 + var_102_24
					end
				end
			end

			local var_102_32 = 0.266666666666667
			local var_102_33 = math.max(var_102_32, arg_99_1.talkMaxDuration)

			if var_102_24 <= arg_99_1.time_ and arg_99_1.time_ < var_102_24 + var_102_33 then
				local var_102_34 = (arg_99_1.time_ - var_102_24) / var_102_33

				arg_99_1.fswtw_.percent = Mathf.Lerp(arg_99_1.var_.oldValueTypewriter, var_102_29, var_102_34)
				arg_99_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_99_1.fswtw_:SetDirty()
			end

			if arg_99_1.time_ >= var_102_24 + var_102_33 and arg_99_1.time_ < var_102_24 + var_102_33 + arg_102_0 then
				arg_99_1.fswtw_.percent = var_102_29

				arg_99_1.fswtw_:SetDirty()
				arg_99_1:ShowNextGo(true)

				arg_99_1.typewritterCharCountI18N = var_102_30
			end

			local var_102_35 = 0

			if var_102_35 < arg_99_1.time_ and arg_99_1.time_ <= var_102_35 + arg_102_0 then
				arg_99_1.cswbg_:SetActive(true)

				local var_102_36 = arg_99_1.cswt_:GetComponent("RectTransform")

				arg_99_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_102_36.offsetMin = Vector2.New(410, 330)
				var_102_36.offsetMax = Vector2.New(-400, -175)

				local var_102_37 = arg_99_1:GetWordFromCfg(419080)
				local var_102_38 = arg_99_1:FormatText(var_102_37.content)

				arg_99_1.cswt_.text = var_102_38

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.cswt_)

				arg_99_1.cswt_.fontSize = 180
				arg_99_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_99_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319931025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319931025
		arg_103_1.duration_ = 5.9

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play319931026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.fswbg_:SetActive(false)
				arg_103_1.dialog_:SetActive(false)
				arg_103_1:ShowNextGo(false)
			end

			local var_106_1 = 0.149999999998999

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.oldValueTypewriter = arg_103_1.fswtw_.percent

				arg_103_1:ShowNextGo(false)
			end

			local var_106_2 = 0
			local var_106_3 = 0
			local var_106_4 = arg_103_1:GetWordFromCfg(319931024)
			local var_106_5 = arg_103_1:FormatText(var_106_4.content)
			local var_106_6, var_106_7 = arg_103_1:GetPercentByPara(var_106_5, 1)

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				local var_106_8 = var_106_2 <= 0 and var_106_3 or var_106_3 * ((var_106_7 - arg_103_1.typewritterCharCountI18N) / var_106_2)

				if var_106_8 > 0 and var_106_3 < var_106_8 then
					arg_103_1.talkMaxDuration = var_106_8

					if var_106_8 + var_106_1 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_1
					end
				end
			end

			local var_106_9 = 0
			local var_106_10 = math.max(var_106_9, arg_103_1.talkMaxDuration)

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_10 then
				local var_106_11 = (arg_103_1.time_ - var_106_1) / var_106_10

				arg_103_1.fswtw_.percent = Mathf.Lerp(arg_103_1.var_.oldValueTypewriter, var_106_6, var_106_11)
				arg_103_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_103_1.fswtw_:SetDirty()
			end

			if arg_103_1.time_ >= var_106_1 + var_106_10 and arg_103_1.time_ < var_106_1 + var_106_10 + arg_106_0 then
				arg_103_1.fswtw_.percent = var_106_6

				arg_103_1.fswtw_:SetDirty()
				arg_103_1:ShowNextGo(true)

				arg_103_1.typewritterCharCountI18N = var_106_7
			end

			local var_106_12 = 0

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.fswbg_:SetActive(false)
				arg_103_1.dialog_:SetActive(false)
				arg_103_1:ShowNextGo(false)
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1.cswbg_:SetActive(false)
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				local var_106_15 = manager.ui.mainCamera.transform.localPosition
				local var_106_16 = Vector3.New(0, 0, 10) + Vector3.New(var_106_15.x, var_106_15.y, 0)
				local var_106_17 = arg_103_1.bgs_.STblack

				var_106_17.transform.localPosition = var_106_16
				var_106_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_106_18 = var_106_17:GetComponent("SpriteRenderer")

				if var_106_18 and var_106_18.sprite then
					local var_106_19 = (var_106_17.transform.localPosition - var_106_15).z
					local var_106_20 = manager.ui.mainCameraCom_
					local var_106_21 = 2 * var_106_19 * Mathf.Tan(var_106_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_106_22 = var_106_21 * var_106_20.aspect
					local var_106_23 = var_106_18.sprite.bounds.size.x
					local var_106_24 = var_106_18.sprite.bounds.size.y
					local var_106_25 = var_106_22 / var_106_23
					local var_106_26 = var_106_21 / var_106_24
					local var_106_27 = var_106_26 < var_106_25 and var_106_25 or var_106_26

					var_106_17.transform.localScale = Vector3.New(var_106_27, var_106_27, 0)
				end

				for iter_106_0, iter_106_1 in pairs(arg_103_1.bgs_) do
					if iter_106_0 ~= "STblack" then
						iter_106_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_106_28 = 1.00008890058234e-12

			if var_106_28 < arg_103_1.time_ and arg_103_1.time_ <= var_106_28 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_29 = 1

			if var_106_28 <= arg_103_1.time_ and arg_103_1.time_ < var_106_28 + var_106_29 then
				local var_106_30 = (arg_103_1.time_ - var_106_28) / var_106_29
				local var_106_31 = Color.New(0, 0, 0)

				var_106_31.a = Mathf.Lerp(1, 0, var_106_30)
				arg_103_1.mask_.color = var_106_31
			end

			if arg_103_1.time_ >= var_106_28 + var_106_29 and arg_103_1.time_ < var_106_28 + var_106_29 + arg_106_0 then
				local var_106_32 = Color.New(0, 0, 0)
				local var_106_33 = 0

				arg_103_1.mask_.enabled = false
				var_106_32.a = var_106_33
				arg_103_1.mask_.color = var_106_32
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_34 = 0.9
			local var_106_35 = 1.7

			if var_106_34 < arg_103_1.time_ and arg_103_1.time_ <= var_106_34 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_36 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_36:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_37 = arg_103_1:GetWordFromCfg(319931025)
				local var_106_38 = arg_103_1:FormatText(var_106_37.content)

				arg_103_1.text_.text = var_106_38

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_39 = 68
				local var_106_40 = utf8.len(var_106_38)
				local var_106_41 = var_106_39 <= 0 and var_106_35 or var_106_35 * (var_106_40 / var_106_39)

				if var_106_41 > 0 and var_106_35 < var_106_41 then
					arg_103_1.talkMaxDuration = var_106_41
					var_106_34 = var_106_34 + 0.3

					if var_106_41 + var_106_34 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_41 + var_106_34
					end
				end

				arg_103_1.text_.text = var_106_38
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_42 = var_106_34 + 0.3
			local var_106_43 = math.max(var_106_35, arg_103_1.talkMaxDuration)

			if var_106_42 <= arg_103_1.time_ and arg_103_1.time_ < var_106_42 + var_106_43 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_42) / var_106_43

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_42 + var_106_43 and arg_103_1.time_ < var_106_42 + var_106_43 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319931026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319931026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319931027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.2

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "music"

				arg_109_1:AudioAction(var_112_2, var_112_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_112_4 = 0
			local var_112_5 = 0.775

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

				local var_112_6 = arg_109_1:GetWordFromCfg(319931026)
				local var_112_7 = arg_109_1:FormatText(var_112_6.content)

				arg_109_1.text_.text = var_112_7

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_8 = 31
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
	Play319931027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319931027
		arg_113_1.duration_ = 6

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319931028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				local var_116_1 = manager.ui.mainCamera.transform.localPosition
				local var_116_2 = Vector3.New(0, 0, 10) + Vector3.New(var_116_1.x, var_116_1.y, 0)
				local var_116_3 = arg_113_1.bgs_.I11r

				var_116_3.transform.localPosition = var_116_2
				var_116_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_116_4 = var_116_3:GetComponent("SpriteRenderer")

				if var_116_4 and var_116_4.sprite then
					local var_116_5 = (var_116_3.transform.localPosition - var_116_1).z
					local var_116_6 = manager.ui.mainCameraCom_
					local var_116_7 = 2 * var_116_5 * Mathf.Tan(var_116_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_116_8 = var_116_7 * var_116_6.aspect
					local var_116_9 = var_116_4.sprite.bounds.size.x
					local var_116_10 = var_116_4.sprite.bounds.size.y
					local var_116_11 = var_116_8 / var_116_9
					local var_116_12 = var_116_7 / var_116_10
					local var_116_13 = var_116_12 < var_116_11 and var_116_11 or var_116_12

					var_116_3.transform.localScale = Vector3.New(var_116_13, var_116_13, 0)
				end

				for iter_116_0, iter_116_1 in pairs(arg_113_1.bgs_) do
					if iter_116_0 ~= "I11r" then
						iter_116_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_116_14 = 1

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.allBtn_.enabled = false
			end

			local var_116_15 = 0.3

			if arg_113_1.time_ >= var_116_14 + var_116_15 and arg_113_1.time_ < var_116_14 + var_116_15 + arg_116_0 then
				arg_113_1.allBtn_.enabled = true
			end

			local var_116_16 = 0

			if var_116_16 < arg_113_1.time_ and arg_113_1.time_ <= var_116_16 + arg_116_0 then
				arg_113_1.mask_.enabled = true
				arg_113_1.mask_.raycastTarget = true

				arg_113_1:SetGaussion(false)
			end

			local var_116_17 = 1

			if var_116_16 <= arg_113_1.time_ and arg_113_1.time_ < var_116_16 + var_116_17 then
				local var_116_18 = (arg_113_1.time_ - var_116_16) / var_116_17
				local var_116_19 = Color.New(0, 0, 0)

				var_116_19.a = Mathf.Lerp(1, 0, var_116_18)
				arg_113_1.mask_.color = var_116_19
			end

			if arg_113_1.time_ >= var_116_16 + var_116_17 and arg_113_1.time_ < var_116_16 + var_116_17 + arg_116_0 then
				local var_116_20 = Color.New(0, 0, 0)
				local var_116_21 = 0

				arg_113_1.mask_.enabled = false
				var_116_20.a = var_116_21
				arg_113_1.mask_.color = var_116_20
			end

			if arg_113_1.frameCnt_ <= 1 then
				arg_113_1.dialog_:SetActive(false)
			end

			local var_116_22 = 1
			local var_116_23 = 0.35

			if var_116_22 < arg_113_1.time_ and arg_113_1.time_ <= var_116_22 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				arg_113_1.dialog_:SetActive(true)

				local var_116_24 = LeanTween.value(arg_113_1.dialog_, 0, 1, 0.3)

				var_116_24:setOnUpdate(LuaHelper.FloatAction(function(arg_117_0)
					arg_113_1.dialogCg_.alpha = arg_117_0
				end))
				var_116_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_113_1.dialog_)
					var_116_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_113_1.duration_ = arg_113_1.duration_ + 0.3

				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_25 = arg_113_1:GetWordFromCfg(319931027)
				local var_116_26 = arg_113_1:FormatText(var_116_25.content)

				arg_113_1.text_.text = var_116_26

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_27 = 14
				local var_116_28 = utf8.len(var_116_26)
				local var_116_29 = var_116_27 <= 0 and var_116_23 or var_116_23 * (var_116_28 / var_116_27)

				if var_116_29 > 0 and var_116_23 < var_116_29 then
					arg_113_1.talkMaxDuration = var_116_29
					var_116_22 = var_116_22 + 0.3

					if var_116_29 + var_116_22 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_29 + var_116_22
					end
				end

				arg_113_1.text_.text = var_116_26
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_30 = var_116_22 + 0.3
			local var_116_31 = math.max(var_116_23, arg_113_1.talkMaxDuration)

			if var_116_30 <= arg_113_1.time_ and arg_113_1.time_ < var_116_30 + var_116_31 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_30) / var_116_31

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_30 + var_116_31 and arg_113_1.time_ < var_116_30 + var_116_31 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319931028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319931028
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play319931029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1.5

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(319931028)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 60
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319931029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319931029
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play319931030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.85

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(319931029)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 34
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319931030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319931030
		arg_127_1.duration_ = 3.933

		local var_127_0 = {
			zh = 2,
			ja = 3.933
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
				arg_127_0:Play319931031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10075ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10075ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -0.715, -6.15)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10075ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["10075ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect10075ui_story == nil then
				arg_127_1.var_.characterEffect10075ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect10075ui_story then
					arg_127_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect10075ui_story then
				arg_127_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action3_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.2

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				local var_130_17 = "play"
				local var_130_18 = "music"

				arg_127_1:AudioAction(var_130_17, var_130_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_130_19 = 0.233333333333333
			local var_130_20 = 1

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				local var_130_21 = "play"
				local var_130_22 = "music"

				arg_127_1:AudioAction(var_130_21, var_130_22, "bgm_activity_3_0_story_hospital_room", "bgm_activity_3_0_story_hospital_room", "bgm_activity_3_0_story_hospital_room.awb")
			end

			local var_130_23 = 0
			local var_130_24 = 0.2

			if var_130_23 < arg_127_1.time_ and arg_127_1.time_ <= var_130_23 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_25 = arg_127_1:FormatText(StoryNameCfg[692].name)

				arg_127_1.leftNameTxt_.text = var_130_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_26 = arg_127_1:GetWordFromCfg(319931030)
				local var_130_27 = arg_127_1:FormatText(var_130_26.content)

				arg_127_1.text_.text = var_130_27

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_28 = 8
				local var_130_29 = utf8.len(var_130_27)
				local var_130_30 = var_130_28 <= 0 and var_130_24 or var_130_24 * (var_130_29 / var_130_28)

				if var_130_30 > 0 and var_130_24 < var_130_30 then
					arg_127_1.talkMaxDuration = var_130_30

					if var_130_30 + var_130_23 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_30 + var_130_23
					end
				end

				arg_127_1.text_.text = var_130_27
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931030", "story_v_out_319931.awb") ~= 0 then
					local var_130_31 = manager.audio:GetVoiceLength("story_v_out_319931", "319931030", "story_v_out_319931.awb") / 1000

					if var_130_31 + var_130_23 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_31 + var_130_23
					end

					if var_130_26.prefab_name ~= "" and arg_127_1.actors_[var_130_26.prefab_name] ~= nil then
						local var_130_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_26.prefab_name].transform, "story_v_out_319931", "319931030", "story_v_out_319931.awb")

						arg_127_1:RecordAudio("319931030", var_130_32)
						arg_127_1:RecordAudio("319931030", var_130_32)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319931", "319931030", "story_v_out_319931.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319931", "319931030", "story_v_out_319931.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_33 = math.max(var_130_24, arg_127_1.talkMaxDuration)

			if var_130_23 <= arg_127_1.time_ and arg_127_1.time_ < var_130_23 + var_130_33 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_23) / var_130_33

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_23 + var_130_33 and arg_127_1.time_ < var_130_23 + var_130_33 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play319931031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319931031
		arg_131_1.duration_ = 4.133

		local var_131_0 = {
			zh = 2.933,
			ja = 4.133
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
				arg_131_0:Play319931032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10079ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10079ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0.7, -0.95, -6.05)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10079ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = arg_131_1.actors_["10079ui_story"]
			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story == nil then
				arg_131_1.var_.characterEffect10079ui_story = var_134_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_11 = 0.200000002980232

			if var_134_10 <= arg_131_1.time_ and arg_131_1.time_ < var_134_10 + var_134_11 then
				local var_134_12 = (arg_131_1.time_ - var_134_10) / var_134_11

				if arg_131_1.var_.characterEffect10079ui_story then
					arg_131_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_131_1.time_ >= var_134_10 + var_134_11 and arg_131_1.time_ < var_134_10 + var_134_11 + arg_134_0 and arg_131_1.var_.characterEffect10079ui_story then
				arg_131_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_134_13 = 0

			if var_134_13 < arg_131_1.time_ and arg_131_1.time_ <= var_134_13 + arg_134_0 then
				arg_131_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_134_15 = arg_131_1.actors_["10075ui_story"].transform
			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.var_.moveOldPos10075ui_story = var_134_15.localPosition
			end

			local var_134_17 = 0.001

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Vector3.New(-0.7, -0.715, -6.15)

				var_134_15.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10075ui_story, var_134_19, var_134_18)

				local var_134_20 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_20.x, var_134_20.y, var_134_20.z)

				local var_134_21 = var_134_15.localEulerAngles

				var_134_21.z = 0
				var_134_21.x = 0
				var_134_15.localEulerAngles = var_134_21
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				var_134_15.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_134_22 = manager.ui.mainCamera.transform.position - var_134_15.position

				var_134_15.forward = Vector3.New(var_134_22.x, var_134_22.y, var_134_22.z)

				local var_134_23 = var_134_15.localEulerAngles

				var_134_23.z = 0
				var_134_23.x = 0
				var_134_15.localEulerAngles = var_134_23
			end

			local var_134_24 = arg_131_1.actors_["10075ui_story"]
			local var_134_25 = 0

			if var_134_25 < arg_131_1.time_ and arg_131_1.time_ <= var_134_25 + arg_134_0 and arg_131_1.var_.characterEffect10075ui_story == nil then
				arg_131_1.var_.characterEffect10075ui_story = var_134_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_26 = 0.200000002980232

			if var_134_25 <= arg_131_1.time_ and arg_131_1.time_ < var_134_25 + var_134_26 then
				local var_134_27 = (arg_131_1.time_ - var_134_25) / var_134_26

				if arg_131_1.var_.characterEffect10075ui_story then
					local var_134_28 = Mathf.Lerp(0, 0.5, var_134_27)

					arg_131_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10075ui_story.fillRatio = var_134_28
				end
			end

			if arg_131_1.time_ >= var_134_25 + var_134_26 and arg_131_1.time_ < var_134_25 + var_134_26 + arg_134_0 and arg_131_1.var_.characterEffect10075ui_story then
				local var_134_29 = 0.5

				arg_131_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10075ui_story.fillRatio = var_134_29
			end

			local var_134_30 = 0
			local var_134_31 = 0.375

			if var_134_30 < arg_131_1.time_ and arg_131_1.time_ <= var_134_30 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_32 = arg_131_1:FormatText(StoryNameCfg[6].name)

				arg_131_1.leftNameTxt_.text = var_134_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_33 = arg_131_1:GetWordFromCfg(319931031)
				local var_134_34 = arg_131_1:FormatText(var_134_33.content)

				arg_131_1.text_.text = var_134_34

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_35 = 15
				local var_134_36 = utf8.len(var_134_34)
				local var_134_37 = var_134_35 <= 0 and var_134_31 or var_134_31 * (var_134_36 / var_134_35)

				if var_134_37 > 0 and var_134_31 < var_134_37 then
					arg_131_1.talkMaxDuration = var_134_37

					if var_134_37 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_37 + var_134_30
					end
				end

				arg_131_1.text_.text = var_134_34
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931031", "story_v_out_319931.awb") ~= 0 then
					local var_134_38 = manager.audio:GetVoiceLength("story_v_out_319931", "319931031", "story_v_out_319931.awb") / 1000

					if var_134_38 + var_134_30 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_38 + var_134_30
					end

					if var_134_33.prefab_name ~= "" and arg_131_1.actors_[var_134_33.prefab_name] ~= nil then
						local var_134_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_33.prefab_name].transform, "story_v_out_319931", "319931031", "story_v_out_319931.awb")

						arg_131_1:RecordAudio("319931031", var_134_39)
						arg_131_1:RecordAudio("319931031", var_134_39)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_319931", "319931031", "story_v_out_319931.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_319931", "319931031", "story_v_out_319931.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_40 = math.max(var_134_31, arg_131_1.talkMaxDuration)

			if var_134_30 <= arg_131_1.time_ and arg_131_1.time_ < var_134_30 + var_134_40 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_30) / var_134_40

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_30 + var_134_40 and arg_131_1.time_ < var_134_30 + var_134_40 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319931032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319931032
		arg_135_1.duration_ = 5

		local var_135_0 = {
			zh = 4.3,
			ja = 5
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
				arg_135_0:Play319931033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10079ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story == nil then
				arg_135_1.var_.characterEffect10079ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect10079ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect10079ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10079ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050actionlink/10050action435")
			end

			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 then
				arg_135_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_138_8 = arg_135_1.actors_["10075ui_story"]
			local var_138_9 = 0

			if var_138_9 < arg_135_1.time_ and arg_135_1.time_ <= var_138_9 + arg_138_0 and arg_135_1.var_.characterEffect10075ui_story == nil then
				arg_135_1.var_.characterEffect10075ui_story = var_138_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_10 = 0.200000002980232

			if var_138_9 <= arg_135_1.time_ and arg_135_1.time_ < var_138_9 + var_138_10 then
				local var_138_11 = (arg_135_1.time_ - var_138_9) / var_138_10

				if arg_135_1.var_.characterEffect10075ui_story then
					arg_135_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_9 + var_138_10 and arg_135_1.time_ < var_138_9 + var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect10075ui_story then
				arg_135_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_138_12 = 0
			local var_138_13 = 0.35

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[692].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(319931032)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 14
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931032", "story_v_out_319931.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_319931", "319931032", "story_v_out_319931.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_319931", "319931032", "story_v_out_319931.awb")

						arg_135_1:RecordAudio("319931032", var_138_21)
						arg_135_1:RecordAudio("319931032", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319931", "319931032", "story_v_out_319931.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319931", "319931032", "story_v_out_319931.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319931033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319931033
		arg_139_1.duration_ = 5

		local var_139_0 = {
			zh = 3.933,
			ja = 5
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
				arg_139_0:Play319931034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10079ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect10079ui_story == nil then
				arg_139_1.var_.characterEffect10079ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect10079ui_story then
					arg_139_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect10079ui_story then
				arg_139_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["10075ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect10075ui_story == nil then
				arg_139_1.var_.characterEffect10075ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.200000002980232

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect10075ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_139_1.var_.characterEffect10075ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect10075ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_139_1.var_.characterEffect10075ui_story.fillRatio = var_142_9
			end

			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_142_11 = 0

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_142_12 = 0
			local var_142_13 = 0.4

			if var_142_12 < arg_139_1.time_ and arg_139_1.time_ <= var_142_12 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_14 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_15 = arg_139_1:GetWordFromCfg(319931033)
				local var_142_16 = arg_139_1:FormatText(var_142_15.content)

				arg_139_1.text_.text = var_142_16

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_17 = 16
				local var_142_18 = utf8.len(var_142_16)
				local var_142_19 = var_142_17 <= 0 and var_142_13 or var_142_13 * (var_142_18 / var_142_17)

				if var_142_19 > 0 and var_142_13 < var_142_19 then
					arg_139_1.talkMaxDuration = var_142_19

					if var_142_19 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_12
					end
				end

				arg_139_1.text_.text = var_142_16
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931033", "story_v_out_319931.awb") ~= 0 then
					local var_142_20 = manager.audio:GetVoiceLength("story_v_out_319931", "319931033", "story_v_out_319931.awb") / 1000

					if var_142_20 + var_142_12 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_20 + var_142_12
					end

					if var_142_15.prefab_name ~= "" and arg_139_1.actors_[var_142_15.prefab_name] ~= nil then
						local var_142_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_15.prefab_name].transform, "story_v_out_319931", "319931033", "story_v_out_319931.awb")

						arg_139_1:RecordAudio("319931033", var_142_21)
						arg_139_1:RecordAudio("319931033", var_142_21)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_319931", "319931033", "story_v_out_319931.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_319931", "319931033", "story_v_out_319931.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_22 = math.max(var_142_13, arg_139_1.talkMaxDuration)

			if var_142_12 <= arg_139_1.time_ and arg_139_1.time_ < var_142_12 + var_142_22 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_12) / var_142_22

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_12 + var_142_22 and arg_139_1.time_ < var_142_12 + var_142_22 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319931034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319931034
		arg_143_1.duration_ = 14.4

		local var_143_0 = {
			zh = 14.4,
			ja = 5.566
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
				arg_143_0:Play319931035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10075ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect10075ui_story == nil then
				arg_143_1.var_.characterEffect10075ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect10075ui_story then
					arg_143_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect10075ui_story then
				arg_143_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action5_2")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_146_6 = arg_143_1.actors_["10079ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect10079ui_story == nil then
				arg_143_1.var_.characterEffect10079ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.200000002980232

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect10079ui_story then
					local var_146_10 = Mathf.Lerp(0, 0.5, var_146_9)

					arg_143_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_143_1.var_.characterEffect10079ui_story.fillRatio = var_146_10
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect10079ui_story then
				local var_146_11 = 0.5

				arg_143_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_143_1.var_.characterEffect10079ui_story.fillRatio = var_146_11
			end

			local var_146_12 = 0
			local var_146_13 = 0.8

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_14 = arg_143_1:FormatText(StoryNameCfg[692].name)

				arg_143_1.leftNameTxt_.text = var_146_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_15 = arg_143_1:GetWordFromCfg(319931034)
				local var_146_16 = arg_143_1:FormatText(var_146_15.content)

				arg_143_1.text_.text = var_146_16

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_17 = 32
				local var_146_18 = utf8.len(var_146_16)
				local var_146_19 = var_146_17 <= 0 and var_146_13 or var_146_13 * (var_146_18 / var_146_17)

				if var_146_19 > 0 and var_146_13 < var_146_19 then
					arg_143_1.talkMaxDuration = var_146_19

					if var_146_19 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_19 + var_146_12
					end
				end

				arg_143_1.text_.text = var_146_16
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931034", "story_v_out_319931.awb") ~= 0 then
					local var_146_20 = manager.audio:GetVoiceLength("story_v_out_319931", "319931034", "story_v_out_319931.awb") / 1000

					if var_146_20 + var_146_12 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_20 + var_146_12
					end

					if var_146_15.prefab_name ~= "" and arg_143_1.actors_[var_146_15.prefab_name] ~= nil then
						local var_146_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_15.prefab_name].transform, "story_v_out_319931", "319931034", "story_v_out_319931.awb")

						arg_143_1:RecordAudio("319931034", var_146_21)
						arg_143_1:RecordAudio("319931034", var_146_21)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_319931", "319931034", "story_v_out_319931.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_319931", "319931034", "story_v_out_319931.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_22 = math.max(var_146_13, arg_143_1.talkMaxDuration)

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_22 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_12) / var_146_22

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_12 + var_146_22 and arg_143_1.time_ < var_146_12 + var_146_22 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319931035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319931035
		arg_147_1.duration_ = 4.366

		local var_147_0 = {
			zh = 3.4,
			ja = 4.366
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
				arg_147_0:Play319931036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10079ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect10079ui_story == nil then
				arg_147_1.var_.characterEffect10079ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect10079ui_story then
					arg_147_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect10079ui_story then
				arg_147_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_150_4 = 0

			if var_150_4 < arg_147_1.time_ and arg_147_1.time_ <= var_150_4 + arg_150_0 then
				arg_147_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_150_6 = arg_147_1.actors_["10075ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect10075ui_story == nil then
				arg_147_1.var_.characterEffect10075ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.200000002980232

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect10075ui_story then
					local var_150_10 = Mathf.Lerp(0, 0.5, var_150_9)

					arg_147_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_147_1.var_.characterEffect10075ui_story.fillRatio = var_150_10
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect10075ui_story then
				local var_150_11 = 0.5

				arg_147_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_147_1.var_.characterEffect10075ui_story.fillRatio = var_150_11
			end

			local var_150_12 = 0
			local var_150_13 = 0.3

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(319931035)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 12
				local var_150_18 = utf8.len(var_150_16)
				local var_150_19 = var_150_17 <= 0 and var_150_13 or var_150_13 * (var_150_18 / var_150_17)

				if var_150_19 > 0 and var_150_13 < var_150_19 then
					arg_147_1.talkMaxDuration = var_150_19

					if var_150_19 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_16
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931035", "story_v_out_319931.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_out_319931", "319931035", "story_v_out_319931.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_out_319931", "319931035", "story_v_out_319931.awb")

						arg_147_1:RecordAudio("319931035", var_150_21)
						arg_147_1:RecordAudio("319931035", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319931", "319931035", "story_v_out_319931.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319931", "319931035", "story_v_out_319931.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_22 and arg_147_1.time_ < var_150_12 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319931036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319931036
		arg_151_1.duration_ = 13.1

		local var_151_0 = {
			zh = 9.966,
			ja = 13.1
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
				arg_151_0:Play319931037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10079ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect10079ui_story == nil then
				arg_151_1.var_.characterEffect10079ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect10079ui_story then
					local var_154_4 = Mathf.Lerp(0, 0.5, var_154_3)

					arg_151_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_151_1.var_.characterEffect10079ui_story.fillRatio = var_154_4
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect10079ui_story then
				local var_154_5 = 0.5

				arg_151_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_151_1.var_.characterEffect10079ui_story.fillRatio = var_154_5
			end

			local var_154_6 = arg_151_1.actors_["10075ui_story"]
			local var_154_7 = 0

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 and arg_151_1.var_.characterEffect10075ui_story == nil then
				arg_151_1.var_.characterEffect10075ui_story = var_154_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_8 = 0.200000002980232

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_8 then
				local var_154_9 = (arg_151_1.time_ - var_154_7) / var_154_8

				if arg_151_1.var_.characterEffect10075ui_story then
					arg_151_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_7 + var_154_8 and arg_151_1.time_ < var_154_7 + var_154_8 + arg_154_0 and arg_151_1.var_.characterEffect10075ui_story then
				arg_151_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_154_10 = 0
			local var_154_11 = 0.95

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_12 = arg_151_1:FormatText(StoryNameCfg[692].name)

				arg_151_1.leftNameTxt_.text = var_154_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_13 = arg_151_1:GetWordFromCfg(319931036)
				local var_154_14 = arg_151_1:FormatText(var_154_13.content)

				arg_151_1.text_.text = var_154_14

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_15 = 38
				local var_154_16 = utf8.len(var_154_14)
				local var_154_17 = var_154_15 <= 0 and var_154_11 or var_154_11 * (var_154_16 / var_154_15)

				if var_154_17 > 0 and var_154_11 < var_154_17 then
					arg_151_1.talkMaxDuration = var_154_17

					if var_154_17 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_17 + var_154_10
					end
				end

				arg_151_1.text_.text = var_154_14
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931036", "story_v_out_319931.awb") ~= 0 then
					local var_154_18 = manager.audio:GetVoiceLength("story_v_out_319931", "319931036", "story_v_out_319931.awb") / 1000

					if var_154_18 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_10
					end

					if var_154_13.prefab_name ~= "" and arg_151_1.actors_[var_154_13.prefab_name] ~= nil then
						local var_154_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_13.prefab_name].transform, "story_v_out_319931", "319931036", "story_v_out_319931.awb")

						arg_151_1:RecordAudio("319931036", var_154_19)
						arg_151_1:RecordAudio("319931036", var_154_19)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_319931", "319931036", "story_v_out_319931.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_319931", "319931036", "story_v_out_319931.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_20 = math.max(var_154_11, arg_151_1.talkMaxDuration)

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_20 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_10) / var_154_20

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_10 + var_154_20 and arg_151_1.time_ < var_154_10 + var_154_20 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319931037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319931037
		arg_155_1.duration_ = 12.533

		local var_155_0 = {
			zh = 11.233,
			ja = 12.533
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
				arg_155_0:Play319931038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.95

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[692].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(319931037)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931037", "story_v_out_319931.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931037", "story_v_out_319931.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_319931", "319931037", "story_v_out_319931.awb")

						arg_155_1:RecordAudio("319931037", var_158_9)
						arg_155_1:RecordAudio("319931037", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_319931", "319931037", "story_v_out_319931.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_319931", "319931037", "story_v_out_319931.awb")
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
	Play319931038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319931038
		arg_159_1.duration_ = 13.533

		local var_159_0 = {
			zh = 9.533,
			ja = 13.533
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
				arg_159_0:Play319931039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.825

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[692].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(319931038)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931038", "story_v_out_319931.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931038", "story_v_out_319931.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_319931", "319931038", "story_v_out_319931.awb")

						arg_159_1:RecordAudio("319931038", var_162_9)
						arg_159_1:RecordAudio("319931038", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_319931", "319931038", "story_v_out_319931.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_319931", "319931038", "story_v_out_319931.awb")
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
	Play319931039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319931039
		arg_163_1.duration_ = 20

		local var_163_0 = {
			zh = 13.333,
			ja = 20
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
				arg_163_0:Play319931040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1.15

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[692].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(319931039)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931039", "story_v_out_319931.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931039", "story_v_out_319931.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_319931", "319931039", "story_v_out_319931.awb")

						arg_163_1:RecordAudio("319931039", var_166_9)
						arg_163_1:RecordAudio("319931039", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319931", "319931039", "story_v_out_319931.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319931", "319931039", "story_v_out_319931.awb")
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
	Play319931040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319931040
		arg_167_1.duration_ = 6.933

		local var_167_0 = {
			zh = 5.866,
			ja = 6.933
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
				arg_167_0:Play319931041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10079ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect10079ui_story == nil then
				arg_167_1.var_.characterEffect10079ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect10079ui_story then
					arg_167_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect10079ui_story then
				arg_167_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_170_4 = 0

			if var_170_4 < arg_167_1.time_ and arg_167_1.time_ <= var_170_4 + arg_170_0 then
				arg_167_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 then
				arg_167_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_6 = arg_167_1.actors_["10075ui_story"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.characterEffect10075ui_story == nil then
				arg_167_1.var_.characterEffect10075ui_story = var_170_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_8 = 0.200000002980232

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.characterEffect10075ui_story then
					local var_170_10 = Mathf.Lerp(0, 0.5, var_170_9)

					arg_167_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_167_1.var_.characterEffect10075ui_story.fillRatio = var_170_10
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.characterEffect10075ui_story then
				local var_170_11 = 0.5

				arg_167_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_167_1.var_.characterEffect10075ui_story.fillRatio = var_170_11
			end

			local var_170_12 = 0
			local var_170_13 = 0.6

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_14 = arg_167_1:FormatText(StoryNameCfg[6].name)

				arg_167_1.leftNameTxt_.text = var_170_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_15 = arg_167_1:GetWordFromCfg(319931040)
				local var_170_16 = arg_167_1:FormatText(var_170_15.content)

				arg_167_1.text_.text = var_170_16

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_17 = 24
				local var_170_18 = utf8.len(var_170_16)
				local var_170_19 = var_170_17 <= 0 and var_170_13 or var_170_13 * (var_170_18 / var_170_17)

				if var_170_19 > 0 and var_170_13 < var_170_19 then
					arg_167_1.talkMaxDuration = var_170_19

					if var_170_19 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_19 + var_170_12
					end
				end

				arg_167_1.text_.text = var_170_16
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931040", "story_v_out_319931.awb") ~= 0 then
					local var_170_20 = manager.audio:GetVoiceLength("story_v_out_319931", "319931040", "story_v_out_319931.awb") / 1000

					if var_170_20 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_12
					end

					if var_170_15.prefab_name ~= "" and arg_167_1.actors_[var_170_15.prefab_name] ~= nil then
						local var_170_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_15.prefab_name].transform, "story_v_out_319931", "319931040", "story_v_out_319931.awb")

						arg_167_1:RecordAudio("319931040", var_170_21)
						arg_167_1:RecordAudio("319931040", var_170_21)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_319931", "319931040", "story_v_out_319931.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_319931", "319931040", "story_v_out_319931.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_22 = math.max(var_170_13, arg_167_1.talkMaxDuration)

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_22 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_12) / var_170_22

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_12 + var_170_22 and arg_167_1.time_ < var_170_12 + var_170_22 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319931041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319931041
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play319931042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10079ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect10079ui_story == nil then
				arg_171_1.var_.characterEffect10079ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect10079ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_171_1.var_.characterEffect10079ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10079ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_171_1.var_.characterEffect10079ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["10079ui_story"].transform
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 then
				arg_171_1.var_.moveOldPos10079ui_story = var_174_6.localPosition
			end

			local var_174_8 = 0.001

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8
				local var_174_10 = Vector3.New(0, 100, 0)

				var_174_6.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10079ui_story, var_174_10, var_174_9)

				local var_174_11 = manager.ui.mainCamera.transform.position - var_174_6.position

				var_174_6.forward = Vector3.New(var_174_11.x, var_174_11.y, var_174_11.z)

				local var_174_12 = var_174_6.localEulerAngles

				var_174_12.z = 0
				var_174_12.x = 0
				var_174_6.localEulerAngles = var_174_12
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 then
				var_174_6.localPosition = Vector3.New(0, 100, 0)

				local var_174_13 = manager.ui.mainCamera.transform.position - var_174_6.position

				var_174_6.forward = Vector3.New(var_174_13.x, var_174_13.y, var_174_13.z)

				local var_174_14 = var_174_6.localEulerAngles

				var_174_14.z = 0
				var_174_14.x = 0
				var_174_6.localEulerAngles = var_174_14
			end

			local var_174_15 = arg_171_1.actors_["10075ui_story"].transform
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.var_.moveOldPos10075ui_story = var_174_15.localPosition
			end

			local var_174_17 = 0.001

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Vector3.New(0, 100, 0)

				var_174_15.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10075ui_story, var_174_19, var_174_18)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_15.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_15.localEulerAngles = var_174_21
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				var_174_15.localPosition = Vector3.New(0, 100, 0)

				local var_174_22 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_22.x, var_174_22.y, var_174_22.z)

				local var_174_23 = var_174_15.localEulerAngles

				var_174_23.z = 0
				var_174_23.x = 0
				var_174_15.localEulerAngles = var_174_23
			end

			local var_174_24 = 0
			local var_174_25 = 0.9

			if var_174_24 < arg_171_1.time_ and arg_171_1.time_ <= var_174_24 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_26 = arg_171_1:GetWordFromCfg(319931041)
				local var_174_27 = arg_171_1:FormatText(var_174_26.content)

				arg_171_1.text_.text = var_174_27

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_28 = 36
				local var_174_29 = utf8.len(var_174_27)
				local var_174_30 = var_174_28 <= 0 and var_174_25 or var_174_25 * (var_174_29 / var_174_28)

				if var_174_30 > 0 and var_174_25 < var_174_30 then
					arg_171_1.talkMaxDuration = var_174_30

					if var_174_30 + var_174_24 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_30 + var_174_24
					end
				end

				arg_171_1.text_.text = var_174_27
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_31 = math.max(var_174_25, arg_171_1.talkMaxDuration)

			if var_174_24 <= arg_171_1.time_ and arg_171_1.time_ < var_174_24 + var_174_31 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_24) / var_174_31

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_24 + var_174_31 and arg_171_1.time_ < var_174_24 + var_174_31 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319931042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319931042
		arg_175_1.duration_ = 7

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319931043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = "I11i"

			if arg_175_1.bgs_[var_178_0] == nil then
				local var_178_1 = Object.Instantiate(arg_175_1.paintGo_)

				var_178_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_178_0)
				var_178_1.name = var_178_0
				var_178_1.transform.parent = arg_175_1.stage_.transform
				var_178_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_175_1.bgs_[var_178_0] = var_178_1
			end

			local var_178_2 = 1

			if var_178_2 < arg_175_1.time_ and arg_175_1.time_ <= var_178_2 + arg_178_0 then
				local var_178_3 = manager.ui.mainCamera.transform.localPosition
				local var_178_4 = Vector3.New(0, 0, 10) + Vector3.New(var_178_3.x, var_178_3.y, 0)
				local var_178_5 = arg_175_1.bgs_.I11i

				var_178_5.transform.localPosition = var_178_4
				var_178_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_178_6 = var_178_5:GetComponent("SpriteRenderer")

				if var_178_6 and var_178_6.sprite then
					local var_178_7 = (var_178_5.transform.localPosition - var_178_3).z
					local var_178_8 = manager.ui.mainCameraCom_
					local var_178_9 = 2 * var_178_7 * Mathf.Tan(var_178_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_178_10 = var_178_9 * var_178_8.aspect
					local var_178_11 = var_178_6.sprite.bounds.size.x
					local var_178_12 = var_178_6.sprite.bounds.size.y
					local var_178_13 = var_178_10 / var_178_11
					local var_178_14 = var_178_9 / var_178_12
					local var_178_15 = var_178_14 < var_178_13 and var_178_13 or var_178_14

					var_178_5.transform.localScale = Vector3.New(var_178_15, var_178_15, 0)
				end

				for iter_178_0, iter_178_1 in pairs(arg_175_1.bgs_) do
					if iter_178_0 ~= "I11i" then
						iter_178_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_178_16 = 2

			if var_178_16 < arg_175_1.time_ and arg_175_1.time_ <= var_178_16 + arg_178_0 then
				arg_175_1.allBtn_.enabled = false
			end

			local var_178_17 = 0.3

			if arg_175_1.time_ >= var_178_16 + var_178_17 and arg_175_1.time_ < var_178_16 + var_178_17 + arg_178_0 then
				arg_175_1.allBtn_.enabled = true
			end

			local var_178_18 = 0

			if var_178_18 < arg_175_1.time_ and arg_175_1.time_ <= var_178_18 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_19 = 1

			if var_178_18 <= arg_175_1.time_ and arg_175_1.time_ < var_178_18 + var_178_19 then
				local var_178_20 = (arg_175_1.time_ - var_178_18) / var_178_19
				local var_178_21 = Color.New(0, 0, 0)

				var_178_21.a = Mathf.Lerp(0, 1, var_178_20)
				arg_175_1.mask_.color = var_178_21
			end

			if arg_175_1.time_ >= var_178_18 + var_178_19 and arg_175_1.time_ < var_178_18 + var_178_19 + arg_178_0 then
				local var_178_22 = Color.New(0, 0, 0)

				var_178_22.a = 1
				arg_175_1.mask_.color = var_178_22
			end

			local var_178_23 = 1

			if var_178_23 < arg_175_1.time_ and arg_175_1.time_ <= var_178_23 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_24 = 1

			if var_178_23 <= arg_175_1.time_ and arg_175_1.time_ < var_178_23 + var_178_24 then
				local var_178_25 = (arg_175_1.time_ - var_178_23) / var_178_24
				local var_178_26 = Color.New(0, 0, 0)

				var_178_26.a = Mathf.Lerp(1, 0, var_178_25)
				arg_175_1.mask_.color = var_178_26
			end

			if arg_175_1.time_ >= var_178_23 + var_178_24 and arg_175_1.time_ < var_178_23 + var_178_24 + arg_178_0 then
				local var_178_27 = Color.New(0, 0, 0)
				local var_178_28 = 0

				arg_175_1.mask_.enabled = false
				var_178_27.a = var_178_28
				arg_175_1.mask_.color = var_178_27
			end

			if arg_175_1.frameCnt_ <= 1 then
				arg_175_1.dialog_:SetActive(false)
			end

			local var_178_29 = 2
			local var_178_30 = 0.65

			if var_178_29 < arg_175_1.time_ and arg_175_1.time_ <= var_178_29 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				arg_175_1.dialog_:SetActive(true)

				local var_178_31 = LeanTween.value(arg_175_1.dialog_, 0, 1, 0.3)

				var_178_31:setOnUpdate(LuaHelper.FloatAction(function(arg_179_0)
					arg_175_1.dialogCg_.alpha = arg_179_0
				end))
				var_178_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_175_1.dialog_)
					var_178_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_175_1.duration_ = arg_175_1.duration_ + 0.3

				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_32 = arg_175_1:GetWordFromCfg(319931042)
				local var_178_33 = arg_175_1:FormatText(var_178_32.content)

				arg_175_1.text_.text = var_178_33

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_34 = 26
				local var_178_35 = utf8.len(var_178_33)
				local var_178_36 = var_178_34 <= 0 and var_178_30 or var_178_30 * (var_178_35 / var_178_34)

				if var_178_36 > 0 and var_178_30 < var_178_36 then
					arg_175_1.talkMaxDuration = var_178_36
					var_178_29 = var_178_29 + 0.3

					if var_178_36 + var_178_29 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_36 + var_178_29
					end
				end

				arg_175_1.text_.text = var_178_33
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_37 = var_178_29 + 0.3
			local var_178_38 = math.max(var_178_30, arg_175_1.talkMaxDuration)

			if var_178_37 <= arg_175_1.time_ and arg_175_1.time_ < var_178_37 + var_178_38 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_37) / var_178_38

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_37 + var_178_38 and arg_175_1.time_ < var_178_37 + var_178_38 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319931043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319931043
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319931044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.925

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_2 = arg_181_1:GetWordFromCfg(319931043)
				local var_184_3 = arg_181_1:FormatText(var_184_2.content)

				arg_181_1.text_.text = var_184_3

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_4 = 37
				local var_184_5 = utf8.len(var_184_3)
				local var_184_6 = var_184_4 <= 0 and var_184_1 or var_184_1 * (var_184_5 / var_184_4)

				if var_184_6 > 0 and var_184_1 < var_184_6 then
					arg_181_1.talkMaxDuration = var_184_6

					if var_184_6 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_6 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_3
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_7 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_7 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_7

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_7 and arg_181_1.time_ < var_184_0 + var_184_7 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319931044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319931044
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play319931045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 1.15

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_2 = arg_185_1:GetWordFromCfg(319931044)
				local var_188_3 = arg_185_1:FormatText(var_188_2.content)

				arg_185_1.text_.text = var_188_3

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_4 = 46
				local var_188_5 = utf8.len(var_188_3)
				local var_188_6 = var_188_4 <= 0 and var_188_1 or var_188_1 * (var_188_5 / var_188_4)

				if var_188_6 > 0 and var_188_1 < var_188_6 then
					arg_185_1.talkMaxDuration = var_188_6

					if var_188_6 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_6 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_3
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_7 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_7 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_7

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_7 and arg_185_1.time_ < var_188_0 + var_188_7 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319931045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319931045
		arg_189_1.duration_ = 4.266

		local var_189_0 = {
			zh = 1.999999999999,
			ja = 4.266
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
				arg_189_0:Play319931046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = "1084ui_story"

			if arg_189_1.actors_[var_192_0] == nil then
				local var_192_1 = Object.Instantiate(Asset.Load("Char/" .. var_192_0), arg_189_1.stage_.transform)

				var_192_1.name = var_192_0
				var_192_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_189_1.actors_[var_192_0] = var_192_1

				local var_192_2 = var_192_1:GetComponentInChildren(typeof(CharacterEffect))

				var_192_2.enabled = true

				local var_192_3 = GameObjectTools.GetOrAddComponent(var_192_1, typeof(DynamicBoneHelper))

				if var_192_3 then
					var_192_3:EnableDynamicBone(false)
				end

				arg_189_1:ShowWeapon(var_192_2.transform, false)

				arg_189_1.var_[var_192_0 .. "Animator"] = var_192_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_189_1.var_[var_192_0 .. "Animator"].applyRootMotion = true
				arg_189_1.var_[var_192_0 .. "LipSync"] = var_192_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_192_4 = arg_189_1.actors_["1084ui_story"].transform
			local var_192_5 = 0

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 then
				arg_189_1.var_.moveOldPos1084ui_story = var_192_4.localPosition

				local var_192_6 = "1084ui_story"

				arg_189_1:ShowWeapon(arg_189_1.var_[var_192_6 .. "Animator"].transform, false)
			end

			local var_192_7 = 0.001

			if var_192_5 <= arg_189_1.time_ and arg_189_1.time_ < var_192_5 + var_192_7 then
				local var_192_8 = (arg_189_1.time_ - var_192_5) / var_192_7
				local var_192_9 = Vector3.New(0.7, -0.97, -6)

				var_192_4.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1084ui_story, var_192_9, var_192_8)

				local var_192_10 = manager.ui.mainCamera.transform.position - var_192_4.position

				var_192_4.forward = Vector3.New(var_192_10.x, var_192_10.y, var_192_10.z)

				local var_192_11 = var_192_4.localEulerAngles

				var_192_11.z = 0
				var_192_11.x = 0
				var_192_4.localEulerAngles = var_192_11
			end

			if arg_189_1.time_ >= var_192_5 + var_192_7 and arg_189_1.time_ < var_192_5 + var_192_7 + arg_192_0 then
				var_192_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_192_12 = manager.ui.mainCamera.transform.position - var_192_4.position

				var_192_4.forward = Vector3.New(var_192_12.x, var_192_12.y, var_192_12.z)

				local var_192_13 = var_192_4.localEulerAngles

				var_192_13.z = 0
				var_192_13.x = 0
				var_192_4.localEulerAngles = var_192_13
			end

			local var_192_14 = arg_189_1.actors_["1084ui_story"]
			local var_192_15 = 0

			if var_192_15 < arg_189_1.time_ and arg_189_1.time_ <= var_192_15 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story == nil then
				arg_189_1.var_.characterEffect1084ui_story = var_192_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_16 = 0.200000002980232

			if var_192_15 <= arg_189_1.time_ and arg_189_1.time_ < var_192_15 + var_192_16 then
				local var_192_17 = (arg_189_1.time_ - var_192_15) / var_192_16

				if arg_189_1.var_.characterEffect1084ui_story then
					arg_189_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_15 + var_192_16 and arg_189_1.time_ < var_192_15 + var_192_16 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story then
				arg_189_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_192_18 = 0

			if var_192_18 < arg_189_1.time_ and arg_189_1.time_ <= var_192_18 + arg_192_0 then
				arg_189_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_192_19 = 0

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 then
				arg_189_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_192_20 = 0
			local var_192_21 = 0.225

			if var_192_20 < arg_189_1.time_ and arg_189_1.time_ <= var_192_20 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_22 = arg_189_1:FormatText(StoryNameCfg[6].name)

				arg_189_1.leftNameTxt_.text = var_192_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_23 = arg_189_1:GetWordFromCfg(319931045)
				local var_192_24 = arg_189_1:FormatText(var_192_23.content)

				arg_189_1.text_.text = var_192_24

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_25 = 9
				local var_192_26 = utf8.len(var_192_24)
				local var_192_27 = var_192_25 <= 0 and var_192_21 or var_192_21 * (var_192_26 / var_192_25)

				if var_192_27 > 0 and var_192_21 < var_192_27 then
					arg_189_1.talkMaxDuration = var_192_27

					if var_192_27 + var_192_20 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_27 + var_192_20
					end
				end

				arg_189_1.text_.text = var_192_24
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931045", "story_v_out_319931.awb") ~= 0 then
					local var_192_28 = manager.audio:GetVoiceLength("story_v_out_319931", "319931045", "story_v_out_319931.awb") / 1000

					if var_192_28 + var_192_20 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_28 + var_192_20
					end

					if var_192_23.prefab_name ~= "" and arg_189_1.actors_[var_192_23.prefab_name] ~= nil then
						local var_192_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_23.prefab_name].transform, "story_v_out_319931", "319931045", "story_v_out_319931.awb")

						arg_189_1:RecordAudio("319931045", var_192_29)
						arg_189_1:RecordAudio("319931045", var_192_29)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319931", "319931045", "story_v_out_319931.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319931", "319931045", "story_v_out_319931.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_30 = math.max(var_192_21, arg_189_1.talkMaxDuration)

			if var_192_20 <= arg_189_1.time_ and arg_189_1.time_ < var_192_20 + var_192_30 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_20) / var_192_30

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_20 + var_192_30 and arg_189_1.time_ < var_192_20 + var_192_30 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319931046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319931046
		arg_193_1.duration_ = 13.4

		local var_193_0 = {
			zh = 13.4,
			ja = 9.266
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
				arg_193_0:Play319931047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10075ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect10075ui_story == nil then
				arg_193_1.var_.characterEffect10075ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect10075ui_story then
					arg_193_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect10075ui_story then
				arg_193_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_196_4 = 0

			if var_196_4 < arg_193_1.time_ and arg_193_1.time_ <= var_196_4 + arg_196_0 then
				arg_193_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action2_1")
			end

			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 then
				arg_193_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_196_6 = arg_193_1.actors_["1084ui_story"]
			local var_196_7 = 0

			if var_196_7 < arg_193_1.time_ and arg_193_1.time_ <= var_196_7 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story == nil then
				arg_193_1.var_.characterEffect1084ui_story = var_196_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_8 = 0.200000002980232

			if var_196_7 <= arg_193_1.time_ and arg_193_1.time_ < var_196_7 + var_196_8 then
				local var_196_9 = (arg_193_1.time_ - var_196_7) / var_196_8

				if arg_193_1.var_.characterEffect1084ui_story then
					local var_196_10 = Mathf.Lerp(0, 0.5, var_196_9)

					arg_193_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1084ui_story.fillRatio = var_196_10
				end
			end

			if arg_193_1.time_ >= var_196_7 + var_196_8 and arg_193_1.time_ < var_196_7 + var_196_8 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story then
				local var_196_11 = 0.5

				arg_193_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1084ui_story.fillRatio = var_196_11
			end

			local var_196_12 = arg_193_1.actors_["10075ui_story"].transform
			local var_196_13 = 0

			if var_196_13 < arg_193_1.time_ and arg_193_1.time_ <= var_196_13 + arg_196_0 then
				arg_193_1.var_.moveOldPos10075ui_story = var_196_12.localPosition
			end

			local var_196_14 = 0.001

			if var_196_13 <= arg_193_1.time_ and arg_193_1.time_ < var_196_13 + var_196_14 then
				local var_196_15 = (arg_193_1.time_ - var_196_13) / var_196_14
				local var_196_16 = Vector3.New(-0.7, -0.715, -6.15)

				var_196_12.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos10075ui_story, var_196_16, var_196_15)

				local var_196_17 = manager.ui.mainCamera.transform.position - var_196_12.position

				var_196_12.forward = Vector3.New(var_196_17.x, var_196_17.y, var_196_17.z)

				local var_196_18 = var_196_12.localEulerAngles

				var_196_18.z = 0
				var_196_18.x = 0
				var_196_12.localEulerAngles = var_196_18
			end

			if arg_193_1.time_ >= var_196_13 + var_196_14 and arg_193_1.time_ < var_196_13 + var_196_14 + arg_196_0 then
				var_196_12.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_196_19 = manager.ui.mainCamera.transform.position - var_196_12.position

				var_196_12.forward = Vector3.New(var_196_19.x, var_196_19.y, var_196_19.z)

				local var_196_20 = var_196_12.localEulerAngles

				var_196_20.z = 0
				var_196_20.x = 0
				var_196_12.localEulerAngles = var_196_20
			end

			local var_196_21 = 0
			local var_196_22 = 0.825

			if var_196_21 < arg_193_1.time_ and arg_193_1.time_ <= var_196_21 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_23 = arg_193_1:FormatText(StoryNameCfg[692].name)

				arg_193_1.leftNameTxt_.text = var_196_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_24 = arg_193_1:GetWordFromCfg(319931046)
				local var_196_25 = arg_193_1:FormatText(var_196_24.content)

				arg_193_1.text_.text = var_196_25

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_26 = 33
				local var_196_27 = utf8.len(var_196_25)
				local var_196_28 = var_196_26 <= 0 and var_196_22 or var_196_22 * (var_196_27 / var_196_26)

				if var_196_28 > 0 and var_196_22 < var_196_28 then
					arg_193_1.talkMaxDuration = var_196_28

					if var_196_28 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_28 + var_196_21
					end
				end

				arg_193_1.text_.text = var_196_25
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931046", "story_v_out_319931.awb") ~= 0 then
					local var_196_29 = manager.audio:GetVoiceLength("story_v_out_319931", "319931046", "story_v_out_319931.awb") / 1000

					if var_196_29 + var_196_21 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_29 + var_196_21
					end

					if var_196_24.prefab_name ~= "" and arg_193_1.actors_[var_196_24.prefab_name] ~= nil then
						local var_196_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_24.prefab_name].transform, "story_v_out_319931", "319931046", "story_v_out_319931.awb")

						arg_193_1:RecordAudio("319931046", var_196_30)
						arg_193_1:RecordAudio("319931046", var_196_30)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319931", "319931046", "story_v_out_319931.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319931", "319931046", "story_v_out_319931.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_31 = math.max(var_196_22, arg_193_1.talkMaxDuration)

			if var_196_21 <= arg_193_1.time_ and arg_193_1.time_ < var_196_21 + var_196_31 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_21) / var_196_31

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_21 + var_196_31 and arg_193_1.time_ < var_196_21 + var_196_31 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319931047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319931047
		arg_197_1.duration_ = 10

		local var_197_0 = {
			zh = 7.766,
			ja = 10
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
				arg_197_0:Play319931048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.625

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[692].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(319931047)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 25
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931047", "story_v_out_319931.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931047", "story_v_out_319931.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_319931", "319931047", "story_v_out_319931.awb")

						arg_197_1:RecordAudio("319931047", var_200_9)
						arg_197_1:RecordAudio("319931047", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319931", "319931047", "story_v_out_319931.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319931", "319931047", "story_v_out_319931.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319931048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319931048
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play319931049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10075ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect10075ui_story == nil then
				arg_201_1.var_.characterEffect10075ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect10075ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_201_1.var_.characterEffect10075ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect10075ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_201_1.var_.characterEffect10075ui_story.fillRatio = var_204_5
			end

			local var_204_6 = 0
			local var_204_7 = 0.775

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

				local var_204_8 = arg_201_1:GetWordFromCfg(319931048)
				local var_204_9 = arg_201_1:FormatText(var_204_8.content)

				arg_201_1.text_.text = var_204_9

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_10 = 31
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
	Play319931049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319931049
		arg_205_1.duration_ = 7.333

		local var_205_0 = {
			zh = 3.666,
			ja = 7.333
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
				arg_205_0:Play319931050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10075ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect10075ui_story == nil then
				arg_205_1.var_.characterEffect10075ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect10075ui_story then
					arg_205_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect10075ui_story then
				arg_205_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_208_4 = 0

			if var_208_4 < arg_205_1.time_ and arg_205_1.time_ <= var_208_4 + arg_208_0 then
				arg_205_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action2_2")
			end

			local var_208_5 = 0
			local var_208_6 = 0.3

			if var_208_5 < arg_205_1.time_ and arg_205_1.time_ <= var_208_5 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_7 = arg_205_1:FormatText(StoryNameCfg[692].name)

				arg_205_1.leftNameTxt_.text = var_208_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_8 = arg_205_1:GetWordFromCfg(319931049)
				local var_208_9 = arg_205_1:FormatText(var_208_8.content)

				arg_205_1.text_.text = var_208_9

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_10 = 12
				local var_208_11 = utf8.len(var_208_9)
				local var_208_12 = var_208_10 <= 0 and var_208_6 or var_208_6 * (var_208_11 / var_208_10)

				if var_208_12 > 0 and var_208_6 < var_208_12 then
					arg_205_1.talkMaxDuration = var_208_12

					if var_208_12 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_12 + var_208_5
					end
				end

				arg_205_1.text_.text = var_208_9
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931049", "story_v_out_319931.awb") ~= 0 then
					local var_208_13 = manager.audio:GetVoiceLength("story_v_out_319931", "319931049", "story_v_out_319931.awb") / 1000

					if var_208_13 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_5
					end

					if var_208_8.prefab_name ~= "" and arg_205_1.actors_[var_208_8.prefab_name] ~= nil then
						local var_208_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_8.prefab_name].transform, "story_v_out_319931", "319931049", "story_v_out_319931.awb")

						arg_205_1:RecordAudio("319931049", var_208_14)
						arg_205_1:RecordAudio("319931049", var_208_14)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319931", "319931049", "story_v_out_319931.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319931", "319931049", "story_v_out_319931.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_15 = math.max(var_208_6, arg_205_1.talkMaxDuration)

			if var_208_5 <= arg_205_1.time_ and arg_205_1.time_ < var_208_5 + var_208_15 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_5) / var_208_15

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_5 + var_208_15 and arg_205_1.time_ < var_208_5 + var_208_15 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319931050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319931050
		arg_209_1.duration_ = 6.333

		local var_209_0 = {
			zh = 5.766,
			ja = 6.333
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
				arg_209_0:Play319931051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10075ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect10075ui_story == nil then
				arg_209_1.var_.characterEffect10075ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.200000002980232

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect10075ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_209_1.var_.characterEffect10075ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect10075ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_209_1.var_.characterEffect10075ui_story.fillRatio = var_212_5
			end

			local var_212_6 = 0

			if var_212_6 < arg_209_1.time_ and arg_209_1.time_ <= var_212_6 + arg_212_0 then
				arg_209_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_212_7 = arg_209_1.actors_["1084ui_story"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story == nil then
				arg_209_1.var_.characterEffect1084ui_story = var_212_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_9 = 0.200000002980232

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.characterEffect1084ui_story then
					arg_209_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.characterEffect1084ui_story then
				arg_209_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_212_11 = 0
			local var_212_12 = 0.475

			if var_212_11 < arg_209_1.time_ and arg_209_1.time_ <= var_212_11 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_13 = arg_209_1:FormatText(StoryNameCfg[6].name)

				arg_209_1.leftNameTxt_.text = var_212_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_14 = arg_209_1:GetWordFromCfg(319931050)
				local var_212_15 = arg_209_1:FormatText(var_212_14.content)

				arg_209_1.text_.text = var_212_15

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_16 = 19
				local var_212_17 = utf8.len(var_212_15)
				local var_212_18 = var_212_16 <= 0 and var_212_12 or var_212_12 * (var_212_17 / var_212_16)

				if var_212_18 > 0 and var_212_12 < var_212_18 then
					arg_209_1.talkMaxDuration = var_212_18

					if var_212_18 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_18 + var_212_11
					end
				end

				arg_209_1.text_.text = var_212_15
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931050", "story_v_out_319931.awb") ~= 0 then
					local var_212_19 = manager.audio:GetVoiceLength("story_v_out_319931", "319931050", "story_v_out_319931.awb") / 1000

					if var_212_19 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_11
					end

					if var_212_14.prefab_name ~= "" and arg_209_1.actors_[var_212_14.prefab_name] ~= nil then
						local var_212_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_14.prefab_name].transform, "story_v_out_319931", "319931050", "story_v_out_319931.awb")

						arg_209_1:RecordAudio("319931050", var_212_20)
						arg_209_1:RecordAudio("319931050", var_212_20)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319931", "319931050", "story_v_out_319931.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319931", "319931050", "story_v_out_319931.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_21 = math.max(var_212_12, arg_209_1.talkMaxDuration)

			if var_212_11 <= arg_209_1.time_ and arg_209_1.time_ < var_212_11 + var_212_21 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_11) / var_212_21

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_11 + var_212_21 and arg_209_1.time_ < var_212_11 + var_212_21 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319931051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319931051
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319931052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1084ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story == nil then
				arg_213_1.var_.characterEffect1084ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1084ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1084ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1084ui_story.fillRatio = var_216_5
			end

			local var_216_6 = 0
			local var_216_7 = 0.5

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(319931051)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 20
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_7 or var_216_7 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_7 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_13 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_13 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_13

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_13 and arg_213_1.time_ < var_216_6 + var_216_13 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319931052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319931052
		arg_217_1.duration_ = 4.6

		local var_217_0 = {
			zh = 4.033,
			ja = 4.6
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
				arg_217_0:Play319931053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = "ML0207"

			if arg_217_1.bgs_[var_220_0] == nil then
				local var_220_1 = Object.Instantiate(arg_217_1.paintGo_)

				var_220_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_220_0)
				var_220_1.name = var_220_0
				var_220_1.transform.parent = arg_217_1.stage_.transform
				var_220_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_217_1.bgs_[var_220_0] = var_220_1
			end

			local var_220_2 = 0

			if var_220_2 < arg_217_1.time_ and arg_217_1.time_ <= var_220_2 + arg_220_0 then
				local var_220_3 = manager.ui.mainCamera.transform.localPosition
				local var_220_4 = Vector3.New(0, 0, 10) + Vector3.New(var_220_3.x, var_220_3.y, 0)
				local var_220_5 = arg_217_1.bgs_.ML0207

				var_220_5.transform.localPosition = var_220_4
				var_220_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_6 = var_220_5:GetComponent("SpriteRenderer")

				if var_220_6 and var_220_6.sprite then
					local var_220_7 = (var_220_5.transform.localPosition - var_220_3).z
					local var_220_8 = manager.ui.mainCameraCom_
					local var_220_9 = 2 * var_220_7 * Mathf.Tan(var_220_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_10 = var_220_9 * var_220_8.aspect
					local var_220_11 = var_220_6.sprite.bounds.size.x
					local var_220_12 = var_220_6.sprite.bounds.size.y
					local var_220_13 = var_220_10 / var_220_11
					local var_220_14 = var_220_9 / var_220_12
					local var_220_15 = var_220_14 < var_220_13 and var_220_13 or var_220_14

					var_220_5.transform.localScale = Vector3.New(var_220_15, var_220_15, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "ML0207" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_16 = 2

			if var_220_16 < arg_217_1.time_ and arg_217_1.time_ <= var_220_16 + arg_220_0 then
				arg_217_1.allBtn_.enabled = false
			end

			local var_220_17 = 0.3

			if arg_217_1.time_ >= var_220_16 + var_220_17 and arg_217_1.time_ < var_220_16 + var_220_17 + arg_220_0 then
				arg_217_1.allBtn_.enabled = true
			end

			local var_220_18 = 0

			if var_220_18 < arg_217_1.time_ and arg_217_1.time_ <= var_220_18 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_19 = 2

			if var_220_18 <= arg_217_1.time_ and arg_217_1.time_ < var_220_18 + var_220_19 then
				local var_220_20 = (arg_217_1.time_ - var_220_18) / var_220_19
				local var_220_21 = Color.New(1, 1, 1)

				var_220_21.a = Mathf.Lerp(1, 0, var_220_20)
				arg_217_1.mask_.color = var_220_21
			end

			if arg_217_1.time_ >= var_220_18 + var_220_19 and arg_217_1.time_ < var_220_18 + var_220_19 + arg_220_0 then
				local var_220_22 = Color.New(1, 1, 1)
				local var_220_23 = 0

				arg_217_1.mask_.enabled = false
				var_220_22.a = var_220_23
				arg_217_1.mask_.color = var_220_22
			end

			local var_220_24 = arg_217_1.actors_["1084ui_story"].transform
			local var_220_25 = 0

			if var_220_25 < arg_217_1.time_ and arg_217_1.time_ <= var_220_25 + arg_220_0 then
				arg_217_1.var_.moveOldPos1084ui_story = var_220_24.localPosition
			end

			local var_220_26 = 0.001

			if var_220_25 <= arg_217_1.time_ and arg_217_1.time_ < var_220_25 + var_220_26 then
				local var_220_27 = (arg_217_1.time_ - var_220_25) / var_220_26
				local var_220_28 = Vector3.New(0, 100, 0)

				var_220_24.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1084ui_story, var_220_28, var_220_27)

				local var_220_29 = manager.ui.mainCamera.transform.position - var_220_24.position

				var_220_24.forward = Vector3.New(var_220_29.x, var_220_29.y, var_220_29.z)

				local var_220_30 = var_220_24.localEulerAngles

				var_220_30.z = 0
				var_220_30.x = 0
				var_220_24.localEulerAngles = var_220_30
			end

			if arg_217_1.time_ >= var_220_25 + var_220_26 and arg_217_1.time_ < var_220_25 + var_220_26 + arg_220_0 then
				var_220_24.localPosition = Vector3.New(0, 100, 0)

				local var_220_31 = manager.ui.mainCamera.transform.position - var_220_24.position

				var_220_24.forward = Vector3.New(var_220_31.x, var_220_31.y, var_220_31.z)

				local var_220_32 = var_220_24.localEulerAngles

				var_220_32.z = 0
				var_220_32.x = 0
				var_220_24.localEulerAngles = var_220_32
			end

			local var_220_33 = arg_217_1.actors_["10075ui_story"].transform
			local var_220_34 = 0

			if var_220_34 < arg_217_1.time_ and arg_217_1.time_ <= var_220_34 + arg_220_0 then
				arg_217_1.var_.moveOldPos10075ui_story = var_220_33.localPosition
			end

			local var_220_35 = 0.001

			if var_220_34 <= arg_217_1.time_ and arg_217_1.time_ < var_220_34 + var_220_35 then
				local var_220_36 = (arg_217_1.time_ - var_220_34) / var_220_35
				local var_220_37 = Vector3.New(0, 100, 0)

				var_220_33.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10075ui_story, var_220_37, var_220_36)

				local var_220_38 = manager.ui.mainCamera.transform.position - var_220_33.position

				var_220_33.forward = Vector3.New(var_220_38.x, var_220_38.y, var_220_38.z)

				local var_220_39 = var_220_33.localEulerAngles

				var_220_39.z = 0
				var_220_39.x = 0
				var_220_33.localEulerAngles = var_220_39
			end

			if arg_217_1.time_ >= var_220_34 + var_220_35 and arg_217_1.time_ < var_220_34 + var_220_35 + arg_220_0 then
				var_220_33.localPosition = Vector3.New(0, 100, 0)

				local var_220_40 = manager.ui.mainCamera.transform.position - var_220_33.position

				var_220_33.forward = Vector3.New(var_220_40.x, var_220_40.y, var_220_40.z)

				local var_220_41 = var_220_33.localEulerAngles

				var_220_41.z = 0
				var_220_41.x = 0
				var_220_33.localEulerAngles = var_220_41
			end

			local var_220_42 = arg_217_1.bgs_.ML0207.transform
			local var_220_43 = 0

			if var_220_43 < arg_217_1.time_ and arg_217_1.time_ <= var_220_43 + arg_220_0 then
				arg_217_1.var_.moveOldPosML0207 = var_220_42.localPosition
			end

			local var_220_44 = 0.001

			if var_220_43 <= arg_217_1.time_ and arg_217_1.time_ < var_220_43 + var_220_44 then
				local var_220_45 = (arg_217_1.time_ - var_220_43) / var_220_44
				local var_220_46 = Vector3.New(0, 1, 9.5)

				var_220_42.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPosML0207, var_220_46, var_220_45)
			end

			if arg_217_1.time_ >= var_220_43 + var_220_44 and arg_217_1.time_ < var_220_43 + var_220_44 + arg_220_0 then
				var_220_42.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_220_47 = arg_217_1.bgs_.ML0207.transform
			local var_220_48 = 0.0166666666666667

			if var_220_48 < arg_217_1.time_ and arg_217_1.time_ <= var_220_48 + arg_220_0 then
				arg_217_1.var_.moveOldPosML0207 = var_220_47.localPosition
			end

			local var_220_49 = 3.5

			if var_220_48 <= arg_217_1.time_ and arg_217_1.time_ < var_220_48 + var_220_49 then
				local var_220_50 = (arg_217_1.time_ - var_220_48) / var_220_49
				local var_220_51 = Vector3.New(0, 1, 10)

				var_220_47.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPosML0207, var_220_51, var_220_50)
			end

			if arg_217_1.time_ >= var_220_48 + var_220_49 and arg_217_1.time_ < var_220_48 + var_220_49 + arg_220_0 then
				var_220_47.localPosition = Vector3.New(0, 1, 10)
			end

			local var_220_52 = 2

			if var_220_52 < arg_217_1.time_ and arg_217_1.time_ <= var_220_52 + arg_220_0 then
				arg_217_1.allBtn_.enabled = false
			end

			local var_220_53 = 1.51666666666667

			if arg_217_1.time_ >= var_220_52 + var_220_53 and arg_217_1.time_ < var_220_52 + var_220_53 + arg_220_0 then
				arg_217_1.allBtn_.enabled = true
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_54 = 2
			local var_220_55 = 0.15

			if var_220_54 < arg_217_1.time_ and arg_217_1.time_ <= var_220_54 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_56 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_56:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_57 = arg_217_1:FormatText(StoryNameCfg[692].name)

				arg_217_1.leftNameTxt_.text = var_220_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_58 = arg_217_1:GetWordFromCfg(319931052)
				local var_220_59 = arg_217_1:FormatText(var_220_58.content)

				arg_217_1.text_.text = var_220_59

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_60 = 6
				local var_220_61 = utf8.len(var_220_59)
				local var_220_62 = var_220_60 <= 0 and var_220_55 or var_220_55 * (var_220_61 / var_220_60)

				if var_220_62 > 0 and var_220_55 < var_220_62 then
					arg_217_1.talkMaxDuration = var_220_62
					var_220_54 = var_220_54 + 0.3

					if var_220_62 + var_220_54 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_62 + var_220_54
					end
				end

				arg_217_1.text_.text = var_220_59
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931052", "story_v_out_319931.awb") ~= 0 then
					local var_220_63 = manager.audio:GetVoiceLength("story_v_out_319931", "319931052", "story_v_out_319931.awb") / 1000

					if var_220_63 + var_220_54 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_63 + var_220_54
					end

					if var_220_58.prefab_name ~= "" and arg_217_1.actors_[var_220_58.prefab_name] ~= nil then
						local var_220_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_58.prefab_name].transform, "story_v_out_319931", "319931052", "story_v_out_319931.awb")

						arg_217_1:RecordAudio("319931052", var_220_64)
						arg_217_1:RecordAudio("319931052", var_220_64)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319931", "319931052", "story_v_out_319931.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319931", "319931052", "story_v_out_319931.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_65 = var_220_54 + 0.3
			local var_220_66 = math.max(var_220_55, arg_217_1.talkMaxDuration)

			if var_220_65 <= arg_217_1.time_ and arg_217_1.time_ < var_220_65 + var_220_66 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_65) / var_220_66

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_65 + var_220_66 and arg_217_1.time_ < var_220_65 + var_220_66 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319931053 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319931053
		arg_223_1.duration_ = 5.833

		local var_223_0 = {
			zh = 2.966,
			ja = 5.833
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
				arg_223_0:Play319931054(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10075ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect10075ui_story == nil then
				arg_223_1.var_.characterEffect10075ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect10075ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_223_1.var_.characterEffect10075ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect10075ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_223_1.var_.characterEffect10075ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.275

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[6].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(319931053)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 11
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931053", "story_v_out_319931.awb") ~= 0 then
					local var_226_14 = manager.audio:GetVoiceLength("story_v_out_319931", "319931053", "story_v_out_319931.awb") / 1000

					if var_226_14 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_14 + var_226_6
					end

					if var_226_9.prefab_name ~= "" and arg_223_1.actors_[var_226_9.prefab_name] ~= nil then
						local var_226_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_9.prefab_name].transform, "story_v_out_319931", "319931053", "story_v_out_319931.awb")

						arg_223_1:RecordAudio("319931053", var_226_15)
						arg_223_1:RecordAudio("319931053", var_226_15)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_319931", "319931053", "story_v_out_319931.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_319931", "319931053", "story_v_out_319931.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_16 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_16 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_16

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_16 and arg_223_1.time_ < var_226_6 + var_226_16 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319931054 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319931054
		arg_227_1.duration_ = 2.433

		local var_227_0 = {
			zh = 2.366,
			ja = 2.433
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
				arg_227_0:Play319931055(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.175

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[6].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(319931054)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931054", "story_v_out_319931.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931054", "story_v_out_319931.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_319931", "319931054", "story_v_out_319931.awb")

						arg_227_1:RecordAudio("319931054", var_230_9)
						arg_227_1:RecordAudio("319931054", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319931", "319931054", "story_v_out_319931.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319931", "319931054", "story_v_out_319931.awb")
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
	Play319931055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319931055
		arg_231_1.duration_ = 2.7

		local var_231_0 = {
			zh = 2.7,
			ja = 2.6
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
				arg_231_0:Play319931056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.325

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[692].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_3 = arg_231_1:GetWordFromCfg(319931055)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931055", "story_v_out_319931.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931055", "story_v_out_319931.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_319931", "319931055", "story_v_out_319931.awb")

						arg_231_1:RecordAudio("319931055", var_234_9)
						arg_231_1:RecordAudio("319931055", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_319931", "319931055", "story_v_out_319931.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_319931", "319931055", "story_v_out_319931.awb")
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
	Play319931056 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319931056
		arg_235_1.duration_ = 9.466

		local var_235_0 = {
			zh = 6.833,
			ja = 9.466
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
				arg_235_0:Play319931057(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.675

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[692].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(319931056)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931056", "story_v_out_319931.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931056", "story_v_out_319931.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_319931", "319931056", "story_v_out_319931.awb")

						arg_235_1:RecordAudio("319931056", var_238_9)
						arg_235_1:RecordAudio("319931056", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_319931", "319931056", "story_v_out_319931.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_319931", "319931056", "story_v_out_319931.awb")
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
	Play319931057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319931057
		arg_239_1.duration_ = 5.433

		local var_239_0 = {
			zh = 5.433,
			ja = 3.666
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
				arg_239_0:Play319931058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.525

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[6].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(319931057)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931057", "story_v_out_319931.awb") ~= 0 then
					local var_242_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931057", "story_v_out_319931.awb") / 1000

					if var_242_8 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_8 + var_242_0
					end

					if var_242_3.prefab_name ~= "" and arg_239_1.actors_[var_242_3.prefab_name] ~= nil then
						local var_242_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_3.prefab_name].transform, "story_v_out_319931", "319931057", "story_v_out_319931.awb")

						arg_239_1:RecordAudio("319931057", var_242_9)
						arg_239_1:RecordAudio("319931057", var_242_9)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_319931", "319931057", "story_v_out_319931.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_319931", "319931057", "story_v_out_319931.awb")
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
	Play319931058 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 319931058
		arg_243_1.duration_ = 10

		local var_243_0 = {
			zh = 8.166,
			ja = 10
		}
		local var_243_1 = manager.audio:GetLocalizationFlag()

		if var_243_0[var_243_1] ~= nil then
			arg_243_1.duration_ = var_243_0[var_243_1]
		end

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play319931059(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.825

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[6].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(319931058)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931058", "story_v_out_319931.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931058", "story_v_out_319931.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_319931", "319931058", "story_v_out_319931.awb")

						arg_243_1:RecordAudio("319931058", var_246_9)
						arg_243_1:RecordAudio("319931058", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_319931", "319931058", "story_v_out_319931.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_319931", "319931058", "story_v_out_319931.awb")
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
	Play319931059 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 319931059
		arg_247_1.duration_ = 2

		local var_247_0 = {
			zh = 1.833,
			ja = 2
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
				arg_247_0:Play319931060(arg_247_1)
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

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[692].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(319931059)
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931059", "story_v_out_319931.awb") ~= 0 then
					local var_250_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931059", "story_v_out_319931.awb") / 1000

					if var_250_8 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_8 + var_250_0
					end

					if var_250_3.prefab_name ~= "" and arg_247_1.actors_[var_250_3.prefab_name] ~= nil then
						local var_250_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_3.prefab_name].transform, "story_v_out_319931", "319931059", "story_v_out_319931.awb")

						arg_247_1:RecordAudio("319931059", var_250_9)
						arg_247_1:RecordAudio("319931059", var_250_9)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_319931", "319931059", "story_v_out_319931.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_319931", "319931059", "story_v_out_319931.awb")
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
	Play319931060 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 319931060
		arg_251_1.duration_ = 2.5

		local var_251_0 = {
			zh = 1.466,
			ja = 2.5
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
				arg_251_0:Play319931061(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.1

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[6].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(319931060)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 4
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931060", "story_v_out_319931.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931060", "story_v_out_319931.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_319931", "319931060", "story_v_out_319931.awb")

						arg_251_1:RecordAudio("319931060", var_254_9)
						arg_251_1:RecordAudio("319931060", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_319931", "319931060", "story_v_out_319931.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_319931", "319931060", "story_v_out_319931.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play319931061 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 319931061
		arg_255_1.duration_ = 4.4

		local var_255_0 = {
			zh = 4.4,
			ja = 4.1
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
				arg_255_0:Play319931062(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.45

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[6].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(319931061)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931061", "story_v_out_319931.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931061", "story_v_out_319931.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_319931", "319931061", "story_v_out_319931.awb")

						arg_255_1:RecordAudio("319931061", var_258_9)
						arg_255_1:RecordAudio("319931061", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_319931", "319931061", "story_v_out_319931.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_319931", "319931061", "story_v_out_319931.awb")
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
	Play319931062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 319931062
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play319931063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.5

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_2 = arg_259_1:GetWordFromCfg(319931062)
				local var_262_3 = arg_259_1:FormatText(var_262_2.content)

				arg_259_1.text_.text = var_262_3

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_4 = 20
				local var_262_5 = utf8.len(var_262_3)
				local var_262_6 = var_262_4 <= 0 and var_262_1 or var_262_1 * (var_262_5 / var_262_4)

				if var_262_6 > 0 and var_262_1 < var_262_6 then
					arg_259_1.talkMaxDuration = var_262_6

					if var_262_6 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_6 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_3
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_7 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_7 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_7

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_7 and arg_259_1.time_ < var_262_0 + var_262_7 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play319931063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 319931063
		arg_263_1.duration_ = 4.999999999999

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play319931064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				local var_266_1 = manager.ui.mainCamera.transform.localPosition
				local var_266_2 = Vector3.New(0, 0, 10) + Vector3.New(var_266_1.x, var_266_1.y, 0)
				local var_266_3 = arg_263_1.bgs_.STblack

				var_266_3.transform.localPosition = var_266_2
				var_266_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_4 = var_266_3:GetComponent("SpriteRenderer")

				if var_266_4 and var_266_4.sprite then
					local var_266_5 = (var_266_3.transform.localPosition - var_266_1).z
					local var_266_6 = manager.ui.mainCameraCom_
					local var_266_7 = 2 * var_266_5 * Mathf.Tan(var_266_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_8 = var_266_7 * var_266_6.aspect
					local var_266_9 = var_266_4.sprite.bounds.size.x
					local var_266_10 = var_266_4.sprite.bounds.size.y
					local var_266_11 = var_266_8 / var_266_9
					local var_266_12 = var_266_7 / var_266_10
					local var_266_13 = var_266_12 < var_266_11 and var_266_11 or var_266_12

					var_266_3.transform.localScale = Vector3.New(var_266_13, var_266_13, 0)
				end

				for iter_266_0, iter_266_1 in pairs(arg_263_1.bgs_) do
					if iter_266_0 ~= "STblack" then
						iter_266_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				local var_266_15 = arg_263_1.fswbg_.transform:Find("textbox/adapt/content") or arg_263_1.fswbg_.transform:Find("textbox/content")
				local var_266_16 = var_266_15:GetComponent("Text")
				local var_266_17 = var_266_15:GetComponent("RectTransform")

				var_266_16.alignment = UnityEngine.TextAnchor.LowerCenter
				var_266_17.offsetMin = Vector2.New(0, 0)
				var_266_17.offsetMax = Vector2.New(0, 0)
			end

			local var_266_18 = 0

			if var_266_18 < arg_263_1.time_ and arg_263_1.time_ <= var_266_18 + arg_266_0 then
				arg_263_1.fswbg_:SetActive(true)
				arg_263_1.dialog_:SetActive(false)

				arg_263_1.fswtw_.percent = 0

				local var_266_19 = arg_263_1:GetWordFromCfg(319931063)
				local var_266_20 = arg_263_1:FormatText(var_266_19.content)

				arg_263_1.fswt_.text = var_266_20

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.fswt_)

				arg_263_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_263_1.fswtw_:SetDirty()

				arg_263_1.typewritterCharCountI18N = 0

				SetActive(arg_263_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_263_1:ShowNextGo(false)
			end

			local var_266_21 = 0.149999999998999

			if var_266_21 < arg_263_1.time_ and arg_263_1.time_ <= var_266_21 + arg_266_0 then
				arg_263_1.var_.oldValueTypewriter = arg_263_1.fswtw_.percent

				arg_263_1:ShowNextGo(false)
			end

			local var_266_22 = 0
			local var_266_23 = 0
			local var_266_24 = arg_263_1:GetWordFromCfg(319931063)
			local var_266_25 = arg_263_1:FormatText(var_266_24.content)
			local var_266_26, var_266_27 = arg_263_1:GetPercentByPara(var_266_25, 1)

			if var_266_21 < arg_263_1.time_ and arg_263_1.time_ <= var_266_21 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				local var_266_28 = var_266_22 <= 0 and var_266_23 or var_266_23 * ((var_266_27 - arg_263_1.typewritterCharCountI18N) / var_266_22)

				if var_266_28 > 0 and var_266_23 < var_266_28 then
					arg_263_1.talkMaxDuration = var_266_28

					if var_266_28 + var_266_21 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_28 + var_266_21
					end
				end
			end

			local var_266_29 = 0
			local var_266_30 = math.max(var_266_29, arg_263_1.talkMaxDuration)

			if var_266_21 <= arg_263_1.time_ and arg_263_1.time_ < var_266_21 + var_266_30 then
				local var_266_31 = (arg_263_1.time_ - var_266_21) / var_266_30

				arg_263_1.fswtw_.percent = Mathf.Lerp(arg_263_1.var_.oldValueTypewriter, var_266_26, var_266_31)
				arg_263_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_263_1.fswtw_:SetDirty()
			end

			if arg_263_1.time_ >= var_266_21 + var_266_30 and arg_263_1.time_ < var_266_21 + var_266_30 + arg_266_0 then
				arg_263_1.fswtw_.percent = var_266_26

				arg_263_1.fswtw_:SetDirty()
				arg_263_1:ShowNextGo(true)

				arg_263_1.typewritterCharCountI18N = var_266_27
			end

			local var_266_32 = 0.15

			if var_266_32 < arg_263_1.time_ and arg_263_1.time_ <= var_266_32 + arg_266_0 then
				arg_263_1.var_.oldValueTypewriter = arg_263_1.fswtw_.percent

				arg_263_1:ShowNextGo(false)
			end

			local var_266_33 = 36
			local var_266_34 = 2.4
			local var_266_35 = arg_263_1:GetWordFromCfg(319931063)
			local var_266_36 = arg_263_1:FormatText(var_266_35.content)
			local var_266_37, var_266_38 = arg_263_1:GetPercentByPara(var_266_36, 1)

			if var_266_32 < arg_263_1.time_ and arg_263_1.time_ <= var_266_32 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				local var_266_39 = var_266_33 <= 0 and var_266_34 or var_266_34 * ((var_266_38 - arg_263_1.typewritterCharCountI18N) / var_266_33)

				if var_266_39 > 0 and var_266_34 < var_266_39 then
					arg_263_1.talkMaxDuration = var_266_39

					if var_266_39 + var_266_32 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_39 + var_266_32
					end
				end
			end

			local var_266_40 = 2.4
			local var_266_41 = math.max(var_266_40, arg_263_1.talkMaxDuration)

			if var_266_32 <= arg_263_1.time_ and arg_263_1.time_ < var_266_32 + var_266_41 then
				local var_266_42 = (arg_263_1.time_ - var_266_32) / var_266_41

				arg_263_1.fswtw_.percent = Mathf.Lerp(arg_263_1.var_.oldValueTypewriter, var_266_37, var_266_42)
				arg_263_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_263_1.fswtw_:SetDirty()
			end

			if arg_263_1.time_ >= var_266_32 + var_266_41 and arg_263_1.time_ < var_266_32 + var_266_41 + arg_266_0 then
				arg_263_1.fswtw_.percent = var_266_37

				arg_263_1.fswtw_:SetDirty()
				arg_263_1:ShowNextGo(true)

				arg_263_1.typewritterCharCountI18N = var_266_38
			end

			local var_266_43 = 0

			if var_266_43 < arg_263_1.time_ and arg_263_1.time_ <= var_266_43 + arg_266_0 then
				arg_263_1.cswbg_:SetActive(true)

				local var_266_44 = arg_263_1.cswt_:GetComponent("RectTransform")

				arg_263_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_266_44.offsetMin = Vector2.New(410, 330)
				var_266_44.offsetMax = Vector2.New(-400, -180)

				local var_266_45 = arg_263_1:GetWordFromCfg(419081)
				local var_266_46 = arg_263_1:FormatText(var_266_45.content)

				arg_263_1.cswt_.text = var_266_46

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.cswt_)

				arg_263_1.cswt_.fontSize = 175
				arg_263_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_263_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319931064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 319931064
		arg_267_1.duration_ = 6.999999999999

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play319931065(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = "D999"

			if arg_267_1.bgs_[var_270_0] == nil then
				local var_270_1 = Object.Instantiate(arg_267_1.paintGo_)

				var_270_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_270_0)
				var_270_1.name = var_270_0
				var_270_1.transform.parent = arg_267_1.stage_.transform
				var_270_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_267_1.bgs_[var_270_0] = var_270_1
			end

			local var_270_2 = 0

			if var_270_2 < arg_267_1.time_ and arg_267_1.time_ <= var_270_2 + arg_270_0 then
				local var_270_3 = manager.ui.mainCamera.transform.localPosition
				local var_270_4 = Vector3.New(0, 0, 10) + Vector3.New(var_270_3.x, var_270_3.y, 0)
				local var_270_5 = arg_267_1.bgs_.D999

				var_270_5.transform.localPosition = var_270_4
				var_270_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_270_6 = var_270_5:GetComponent("SpriteRenderer")

				if var_270_6 and var_270_6.sprite then
					local var_270_7 = (var_270_5.transform.localPosition - var_270_3).z
					local var_270_8 = manager.ui.mainCameraCom_
					local var_270_9 = 2 * var_270_7 * Mathf.Tan(var_270_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_270_10 = var_270_9 * var_270_8.aspect
					local var_270_11 = var_270_6.sprite.bounds.size.x
					local var_270_12 = var_270_6.sprite.bounds.size.y
					local var_270_13 = var_270_10 / var_270_11
					local var_270_14 = var_270_9 / var_270_12
					local var_270_15 = var_270_14 < var_270_13 and var_270_13 or var_270_14

					var_270_5.transform.localScale = Vector3.New(var_270_15, var_270_15, 0)
				end

				for iter_270_0, iter_270_1 in pairs(arg_267_1.bgs_) do
					if iter_270_0 ~= "D999" then
						iter_270_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
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
				local var_270_19 = Color.New(1, 1, 1)

				var_270_19.a = Mathf.Lerp(1, 0, var_270_18)
				arg_267_1.mask_.color = var_270_19
			end

			if arg_267_1.time_ >= var_270_16 + var_270_17 and arg_267_1.time_ < var_270_16 + var_270_17 + arg_270_0 then
				local var_270_20 = Color.New(1, 1, 1)
				local var_270_21 = 0

				arg_267_1.mask_.enabled = false
				var_270_20.a = var_270_21
				arg_267_1.mask_.color = var_270_20
			end

			local var_270_22 = 0

			if var_270_22 < arg_267_1.time_ and arg_267_1.time_ <= var_270_22 + arg_270_0 then
				arg_267_1.fswbg_:SetActive(true)
				arg_267_1.dialog_:SetActive(false)

				arg_267_1.fswtw_.percent = 0

				local var_270_23 = arg_267_1:GetWordFromCfg(319931020)
				local var_270_24 = arg_267_1:FormatText(var_270_23.content)

				arg_267_1.fswt_.text = var_270_24

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.fswt_)

				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()

				arg_267_1.typewritterCharCountI18N = 0

				SetActive(arg_267_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_267_1:ShowNextGo(false)
			end

			local var_270_25 = 0.149999999998999

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 then
				arg_267_1.var_.oldValueTypewriter = arg_267_1.fswtw_.percent

				arg_267_1:ShowNextGo(false)
			end

			local var_270_26 = 0
			local var_270_27 = 0
			local var_270_28 = arg_267_1:GetWordFromCfg(319931020)
			local var_270_29 = arg_267_1:FormatText(var_270_28.content)
			local var_270_30, var_270_31 = arg_267_1:GetPercentByPara(var_270_29, 1)

			if var_270_25 < arg_267_1.time_ and arg_267_1.time_ <= var_270_25 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				local var_270_32 = var_270_26 <= 0 and var_270_27 or var_270_27 * ((var_270_31 - arg_267_1.typewritterCharCountI18N) / var_270_26)

				if var_270_32 > 0 and var_270_27 < var_270_32 then
					arg_267_1.talkMaxDuration = var_270_32

					if var_270_32 + var_270_25 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_32 + var_270_25
					end
				end
			end

			local var_270_33 = 0
			local var_270_34 = math.max(var_270_33, arg_267_1.talkMaxDuration)

			if var_270_25 <= arg_267_1.time_ and arg_267_1.time_ < var_270_25 + var_270_34 then
				local var_270_35 = (arg_267_1.time_ - var_270_25) / var_270_34

				arg_267_1.fswtw_.percent = Mathf.Lerp(arg_267_1.var_.oldValueTypewriter, var_270_30, var_270_35)
				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()
			end

			if arg_267_1.time_ >= var_270_25 + var_270_34 and arg_267_1.time_ < var_270_25 + var_270_34 + arg_270_0 then
				arg_267_1.fswtw_.percent = var_270_30

				arg_267_1.fswtw_:SetDirty()
				arg_267_1:ShowNextGo(true)

				arg_267_1.typewritterCharCountI18N = var_270_31
			end

			local var_270_36 = 0.15

			if var_270_36 < arg_267_1.time_ and arg_267_1.time_ <= var_270_36 + arg_270_0 then
				arg_267_1.fswbg_:SetActive(false)
				arg_267_1.dialog_:SetActive(false)
				arg_267_1:ShowNextGo(false)
			end

			local var_270_37 = 0

			if var_270_37 < arg_267_1.time_ and arg_267_1.time_ <= var_270_37 + arg_270_0 then
				arg_267_1.cswbg_:SetActive(false)
			end

			if arg_267_1.frameCnt_ <= 1 then
				arg_267_1.dialog_:SetActive(false)
			end

			local var_270_38 = 1.999999999999
			local var_270_39 = 0.5

			if var_270_38 < arg_267_1.time_ and arg_267_1.time_ <= var_270_38 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				arg_267_1.dialog_:SetActive(true)

				local var_270_40 = LeanTween.value(arg_267_1.dialog_, 0, 1, 0.3)

				var_270_40:setOnUpdate(LuaHelper.FloatAction(function(arg_271_0)
					arg_267_1.dialogCg_.alpha = arg_271_0
				end))
				var_270_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_267_1.dialog_)
					var_270_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_267_1.duration_ = arg_267_1.duration_ + 0.3

				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_41 = arg_267_1:GetWordFromCfg(319931064)
				local var_270_42 = arg_267_1:FormatText(var_270_41.content)

				arg_267_1.text_.text = var_270_42

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_43 = 20
				local var_270_44 = utf8.len(var_270_42)
				local var_270_45 = var_270_43 <= 0 and var_270_39 or var_270_39 * (var_270_44 / var_270_43)

				if var_270_45 > 0 and var_270_39 < var_270_45 then
					arg_267_1.talkMaxDuration = var_270_45
					var_270_38 = var_270_38 + 0.3

					if var_270_45 + var_270_38 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_45 + var_270_38
					end
				end

				arg_267_1.text_.text = var_270_42
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_46 = var_270_38 + 0.3
			local var_270_47 = math.max(var_270_39, arg_267_1.talkMaxDuration)

			if var_270_46 <= arg_267_1.time_ and arg_267_1.time_ < var_270_46 + var_270_47 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_46) / var_270_47

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_46 + var_270_47 and arg_267_1.time_ < var_270_46 + var_270_47 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play319931065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 319931065
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play319931066(arg_273_1)
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

				local var_276_2 = arg_273_1:GetWordFromCfg(319931065)
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
	Play319931066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 319931066
		arg_277_1.duration_ = 3.566

		local var_277_0 = {
			zh = 3.566,
			ja = 2.9
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
				arg_277_0:Play319931067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["10075ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos10075ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, -0.715, -6.15)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10075ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -0.715, -6.15)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["10075ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect10075ui_story == nil then
				arg_277_1.var_.characterEffect10075ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.200000002980232

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect10075ui_story then
					arg_277_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect10075ui_story then
				arg_277_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action1_1")
			end

			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1:PlayTimeline("10075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_280_15 = 0
			local var_280_16 = 0.275

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_17 = arg_277_1:FormatText(StoryNameCfg[692].name)

				arg_277_1.leftNameTxt_.text = var_280_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_18 = arg_277_1:GetWordFromCfg(319931066)
				local var_280_19 = arg_277_1:FormatText(var_280_18.content)

				arg_277_1.text_.text = var_280_19

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931066", "story_v_out_319931.awb") ~= 0 then
					local var_280_23 = manager.audio:GetVoiceLength("story_v_out_319931", "319931066", "story_v_out_319931.awb") / 1000

					if var_280_23 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_23 + var_280_15
					end

					if var_280_18.prefab_name ~= "" and arg_277_1.actors_[var_280_18.prefab_name] ~= nil then
						local var_280_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_18.prefab_name].transform, "story_v_out_319931", "319931066", "story_v_out_319931.awb")

						arg_277_1:RecordAudio("319931066", var_280_24)
						arg_277_1:RecordAudio("319931066", var_280_24)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_319931", "319931066", "story_v_out_319931.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_319931", "319931066", "story_v_out_319931.awb")
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
	Play319931067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 319931067
		arg_281_1.duration_ = 5.6

		local var_281_0 = {
			zh = 1.999999999999,
			ja = 5.6
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
				arg_281_0:Play319931068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["10079ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos10079ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0.7, -0.95, -6.05)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10079ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["10079ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect10079ui_story == nil then
				arg_281_1.var_.characterEffect10079ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect10079ui_story then
					arg_281_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect10079ui_story then
				arg_281_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_284_13 = 0

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				arg_281_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_284_14 = 0

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 then
				arg_281_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_284_15 = arg_281_1.actors_["10075ui_story"].transform
			local var_284_16 = 0

			if var_284_16 < arg_281_1.time_ and arg_281_1.time_ <= var_284_16 + arg_284_0 then
				arg_281_1.var_.moveOldPos10075ui_story = var_284_15.localPosition
			end

			local var_284_17 = 0.001

			if var_284_16 <= arg_281_1.time_ and arg_281_1.time_ < var_284_16 + var_284_17 then
				local var_284_18 = (arg_281_1.time_ - var_284_16) / var_284_17
				local var_284_19 = Vector3.New(-0.7, -0.715, -6.15)

				var_284_15.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos10075ui_story, var_284_19, var_284_18)

				local var_284_20 = manager.ui.mainCamera.transform.position - var_284_15.position

				var_284_15.forward = Vector3.New(var_284_20.x, var_284_20.y, var_284_20.z)

				local var_284_21 = var_284_15.localEulerAngles

				var_284_21.z = 0
				var_284_21.x = 0
				var_284_15.localEulerAngles = var_284_21
			end

			if arg_281_1.time_ >= var_284_16 + var_284_17 and arg_281_1.time_ < var_284_16 + var_284_17 + arg_284_0 then
				var_284_15.localPosition = Vector3.New(-0.7, -0.715, -6.15)

				local var_284_22 = manager.ui.mainCamera.transform.position - var_284_15.position

				var_284_15.forward = Vector3.New(var_284_22.x, var_284_22.y, var_284_22.z)

				local var_284_23 = var_284_15.localEulerAngles

				var_284_23.z = 0
				var_284_23.x = 0
				var_284_15.localEulerAngles = var_284_23
			end

			local var_284_24 = arg_281_1.actors_["10075ui_story"]
			local var_284_25 = 0

			if var_284_25 < arg_281_1.time_ and arg_281_1.time_ <= var_284_25 + arg_284_0 and arg_281_1.var_.characterEffect10075ui_story == nil then
				arg_281_1.var_.characterEffect10075ui_story = var_284_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_26 = 0.200000002980232

			if var_284_25 <= arg_281_1.time_ and arg_281_1.time_ < var_284_25 + var_284_26 then
				local var_284_27 = (arg_281_1.time_ - var_284_25) / var_284_26

				if arg_281_1.var_.characterEffect10075ui_story then
					local var_284_28 = Mathf.Lerp(0, 0.5, var_284_27)

					arg_281_1.var_.characterEffect10075ui_story.fillFlat = true
					arg_281_1.var_.characterEffect10075ui_story.fillRatio = var_284_28
				end
			end

			if arg_281_1.time_ >= var_284_25 + var_284_26 and arg_281_1.time_ < var_284_25 + var_284_26 + arg_284_0 and arg_281_1.var_.characterEffect10075ui_story then
				local var_284_29 = 0.5

				arg_281_1.var_.characterEffect10075ui_story.fillFlat = true
				arg_281_1.var_.characterEffect10075ui_story.fillRatio = var_284_29
			end

			local var_284_30 = 0
			local var_284_31 = 0.2

			if var_284_30 < arg_281_1.time_ and arg_281_1.time_ <= var_284_30 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_32 = arg_281_1:FormatText(StoryNameCfg[6].name)

				arg_281_1.leftNameTxt_.text = var_284_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_33 = arg_281_1:GetWordFromCfg(319931067)
				local var_284_34 = arg_281_1:FormatText(var_284_33.content)

				arg_281_1.text_.text = var_284_34

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_35 = 8
				local var_284_36 = utf8.len(var_284_34)
				local var_284_37 = var_284_35 <= 0 and var_284_31 or var_284_31 * (var_284_36 / var_284_35)

				if var_284_37 > 0 and var_284_31 < var_284_37 then
					arg_281_1.talkMaxDuration = var_284_37

					if var_284_37 + var_284_30 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_37 + var_284_30
					end
				end

				arg_281_1.text_.text = var_284_34
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931067", "story_v_out_319931.awb") ~= 0 then
					local var_284_38 = manager.audio:GetVoiceLength("story_v_out_319931", "319931067", "story_v_out_319931.awb") / 1000

					if var_284_38 + var_284_30 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_38 + var_284_30
					end

					if var_284_33.prefab_name ~= "" and arg_281_1.actors_[var_284_33.prefab_name] ~= nil then
						local var_284_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_33.prefab_name].transform, "story_v_out_319931", "319931067", "story_v_out_319931.awb")

						arg_281_1:RecordAudio("319931067", var_284_39)
						arg_281_1:RecordAudio("319931067", var_284_39)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_319931", "319931067", "story_v_out_319931.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_319931", "319931067", "story_v_out_319931.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_40 = math.max(var_284_31, arg_281_1.talkMaxDuration)

			if var_284_30 <= arg_281_1.time_ and arg_281_1.time_ < var_284_30 + var_284_40 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_30) / var_284_40

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_30 + var_284_40 and arg_281_1.time_ < var_284_30 + var_284_40 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play319931068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 319931068
		arg_285_1.duration_ = 8.533

		local var_285_0 = {
			zh = 8,
			ja = 8.533
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
				arg_285_0:Play319931069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["10079ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect10079ui_story == nil then
				arg_285_1.var_.characterEffect10079ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect10079ui_story then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_285_1.var_.characterEffect10079ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect10079ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_285_1.var_.characterEffect10079ui_story.fillRatio = var_288_5
			end

			local var_288_6 = arg_285_1.actors_["10075ui_story"]
			local var_288_7 = 0

			if var_288_7 < arg_285_1.time_ and arg_285_1.time_ <= var_288_7 + arg_288_0 and arg_285_1.var_.characterEffect10075ui_story == nil then
				arg_285_1.var_.characterEffect10075ui_story = var_288_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_8 = 0.200000002980232

			if var_288_7 <= arg_285_1.time_ and arg_285_1.time_ < var_288_7 + var_288_8 then
				local var_288_9 = (arg_285_1.time_ - var_288_7) / var_288_8

				if arg_285_1.var_.characterEffect10075ui_story then
					arg_285_1.var_.characterEffect10075ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_7 + var_288_8 and arg_285_1.time_ < var_288_7 + var_288_8 + arg_288_0 and arg_285_1.var_.characterEffect10075ui_story then
				arg_285_1.var_.characterEffect10075ui_story.fillFlat = false
			end

			local var_288_10 = 0
			local var_288_11 = 0.8

			if var_288_10 < arg_285_1.time_ and arg_285_1.time_ <= var_288_10 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_12 = arg_285_1:FormatText(StoryNameCfg[692].name)

				arg_285_1.leftNameTxt_.text = var_288_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_13 = arg_285_1:GetWordFromCfg(319931068)
				local var_288_14 = arg_285_1:FormatText(var_288_13.content)

				arg_285_1.text_.text = var_288_14

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_15 = 32
				local var_288_16 = utf8.len(var_288_14)
				local var_288_17 = var_288_15 <= 0 and var_288_11 or var_288_11 * (var_288_16 / var_288_15)

				if var_288_17 > 0 and var_288_11 < var_288_17 then
					arg_285_1.talkMaxDuration = var_288_17

					if var_288_17 + var_288_10 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_17 + var_288_10
					end
				end

				arg_285_1.text_.text = var_288_14
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931068", "story_v_out_319931.awb") ~= 0 then
					local var_288_18 = manager.audio:GetVoiceLength("story_v_out_319931", "319931068", "story_v_out_319931.awb") / 1000

					if var_288_18 + var_288_10 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_18 + var_288_10
					end

					if var_288_13.prefab_name ~= "" and arg_285_1.actors_[var_288_13.prefab_name] ~= nil then
						local var_288_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_13.prefab_name].transform, "story_v_out_319931", "319931068", "story_v_out_319931.awb")

						arg_285_1:RecordAudio("319931068", var_288_19)
						arg_285_1:RecordAudio("319931068", var_288_19)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_319931", "319931068", "story_v_out_319931.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_319931", "319931068", "story_v_out_319931.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_20 = math.max(var_288_11, arg_285_1.talkMaxDuration)

			if var_288_10 <= arg_285_1.time_ and arg_285_1.time_ < var_288_10 + var_288_20 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_10) / var_288_20

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_10 + var_288_20 and arg_285_1.time_ < var_288_10 + var_288_20 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play319931069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 319931069
		arg_289_1.duration_ = 9.133

		local var_289_0 = {
			zh = 7.8,
			ja = 9.133
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
				arg_289_0:Play319931070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.725

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[692].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(319931069)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931069", "story_v_out_319931.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_319931", "319931069", "story_v_out_319931.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_319931", "319931069", "story_v_out_319931.awb")

						arg_289_1:RecordAudio("319931069", var_292_9)
						arg_289_1:RecordAudio("319931069", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_319931", "319931069", "story_v_out_319931.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_319931", "319931069", "story_v_out_319931.awb")
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
	Play319931070 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 319931070
		arg_293_1.duration_ = 13.533

		local var_293_0 = {
			zh = 8.8,
			ja = 13.533
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
				arg_293_0:Play319931071(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "XH0204"

			if arg_293_1.bgs_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(arg_293_1.paintGo_)

				var_296_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_296_0)
				var_296_1.name = var_296_0
				var_296_1.transform.parent = arg_293_1.stage_.transform
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.bgs_[var_296_0] = var_296_1
			end

			local var_296_2 = 0

			if var_296_2 < arg_293_1.time_ and arg_293_1.time_ <= var_296_2 + arg_296_0 then
				local var_296_3 = manager.ui.mainCamera.transform.localPosition
				local var_296_4 = Vector3.New(0, 0, 10) + Vector3.New(var_296_3.x, var_296_3.y, 0)
				local var_296_5 = arg_293_1.bgs_.XH0204

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
					if iter_296_0 ~= "XH0204" then
						iter_296_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.allBtn_.enabled = false
			end

			local var_296_17 = 0.3

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				arg_293_1.allBtn_.enabled = true
			end

			local var_296_18 = arg_293_1.actors_["10075ui_story"].transform
			local var_296_19 = 0

			if var_296_19 < arg_293_1.time_ and arg_293_1.time_ <= var_296_19 + arg_296_0 then
				arg_293_1.var_.moveOldPos10075ui_story = var_296_18.localPosition
			end

			local var_296_20 = 0.001

			if var_296_19 <= arg_293_1.time_ and arg_293_1.time_ < var_296_19 + var_296_20 then
				local var_296_21 = (arg_293_1.time_ - var_296_19) / var_296_20
				local var_296_22 = Vector3.New(0, 100, 0)

				var_296_18.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10075ui_story, var_296_22, var_296_21)

				local var_296_23 = manager.ui.mainCamera.transform.position - var_296_18.position

				var_296_18.forward = Vector3.New(var_296_23.x, var_296_23.y, var_296_23.z)

				local var_296_24 = var_296_18.localEulerAngles

				var_296_24.z = 0
				var_296_24.x = 0
				var_296_18.localEulerAngles = var_296_24
			end

			if arg_293_1.time_ >= var_296_19 + var_296_20 and arg_293_1.time_ < var_296_19 + var_296_20 + arg_296_0 then
				var_296_18.localPosition = Vector3.New(0, 100, 0)

				local var_296_25 = manager.ui.mainCamera.transform.position - var_296_18.position

				var_296_18.forward = Vector3.New(var_296_25.x, var_296_25.y, var_296_25.z)

				local var_296_26 = var_296_18.localEulerAngles

				var_296_26.z = 0
				var_296_26.x = 0
				var_296_18.localEulerAngles = var_296_26
			end

			local var_296_27 = arg_293_1.actors_["10079ui_story"].transform
			local var_296_28 = 0

			if var_296_28 < arg_293_1.time_ and arg_293_1.time_ <= var_296_28 + arg_296_0 then
				arg_293_1.var_.moveOldPos10079ui_story = var_296_27.localPosition
			end

			local var_296_29 = 0.001

			if var_296_28 <= arg_293_1.time_ and arg_293_1.time_ < var_296_28 + var_296_29 then
				local var_296_30 = (arg_293_1.time_ - var_296_28) / var_296_29
				local var_296_31 = Vector3.New(0, 100, 0)

				var_296_27.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10079ui_story, var_296_31, var_296_30)

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

			local var_296_36 = manager.ui.mainCamera.transform
			local var_296_37 = 0

			if var_296_37 < arg_293_1.time_ and arg_293_1.time_ <= var_296_37 + arg_296_0 then
				local var_296_38 = arg_293_1.var_.effecthuiyisi1

				if not var_296_38 then
					var_296_38 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_296_38.name = "huiyisi1"
					arg_293_1.var_.effecthuiyisi1 = var_296_38
				end

				local var_296_39 = var_296_36:Find("")

				if var_296_39 then
					var_296_38.transform.parent = var_296_39
				else
					var_296_38.transform.parent = var_296_36
				end

				var_296_38.transform.localPosition = Vector3.New(0, 0, 0)
				var_296_38.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_296_40 = manager.ui.mainCamera.transform
			local var_296_41 = 2

			if var_296_41 < arg_293_1.time_ and arg_293_1.time_ <= var_296_41 + arg_296_0 then
				local var_296_42 = arg_293_1.var_.effecthuiyisi1

				if var_296_42 then
					Object.Destroy(var_296_42)

					arg_293_1.var_.effecthuiyisi1 = nil
				end
			end

			local var_296_43 = 0

			if var_296_43 < arg_293_1.time_ and arg_293_1.time_ <= var_296_43 + arg_296_0 then
				arg_293_1.screenFilterGo_:SetActive(true)

				arg_293_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_296_44 = 0.0166666666666667

			if var_296_43 <= arg_293_1.time_ and arg_293_1.time_ < var_296_43 + var_296_44 then
				local var_296_45 = (arg_293_1.time_ - var_296_43) / var_296_44

				arg_293_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_296_45)
			end

			if arg_293_1.time_ >= var_296_43 + var_296_44 and arg_293_1.time_ < var_296_43 + var_296_44 + arg_296_0 then
				arg_293_1.screenFilterEffect_.weight = 1
			end

			local var_296_46 = 0
			local var_296_47 = 0.65

			if var_296_46 < arg_293_1.time_ and arg_293_1.time_ <= var_296_46 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				arg_293_1.dialog_:SetActive(true)

				local var_296_48 = LeanTween.value(arg_293_1.dialog_, 0, 1, 0.3)

				var_296_48:setOnUpdate(LuaHelper.FloatAction(function(arg_297_0)
					arg_293_1.dialogCg_.alpha = arg_297_0
				end))
				var_296_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_293_1.dialog_)
					var_296_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_293_1.duration_ = arg_293_1.duration_ + 0.3

				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_49 = arg_293_1:FormatText(StoryNameCfg[692].name)

				arg_293_1.leftNameTxt_.text = var_296_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_50 = arg_293_1:GetWordFromCfg(319931070)
				local var_296_51 = arg_293_1:FormatText(var_296_50.content)

				arg_293_1.text_.text = var_296_51

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_52 = 26
				local var_296_53 = utf8.len(var_296_51)
				local var_296_54 = var_296_52 <= 0 and var_296_47 or var_296_47 * (var_296_53 / var_296_52)

				if var_296_54 > 0 and var_296_47 < var_296_54 then
					arg_293_1.talkMaxDuration = var_296_54
					var_296_46 = var_296_46 + 0.3

					if var_296_54 + var_296_46 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_54 + var_296_46
					end
				end

				arg_293_1.text_.text = var_296_51
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931070", "story_v_out_319931.awb") ~= 0 then
					local var_296_55 = manager.audio:GetVoiceLength("story_v_out_319931", "319931070", "story_v_out_319931.awb") / 1000

					if var_296_55 + var_296_46 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_55 + var_296_46
					end

					if var_296_50.prefab_name ~= "" and arg_293_1.actors_[var_296_50.prefab_name] ~= nil then
						local var_296_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_50.prefab_name].transform, "story_v_out_319931", "319931070", "story_v_out_319931.awb")

						arg_293_1:RecordAudio("319931070", var_296_56)
						arg_293_1:RecordAudio("319931070", var_296_56)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_319931", "319931070", "story_v_out_319931.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_319931", "319931070", "story_v_out_319931.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_57 = var_296_46 + 0.3
			local var_296_58 = math.max(var_296_47, arg_293_1.talkMaxDuration)

			if var_296_57 <= arg_293_1.time_ and arg_293_1.time_ < var_296_57 + var_296_58 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_57) / var_296_58

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_57 + var_296_58 and arg_293_1.time_ < var_296_57 + var_296_58 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play319931071 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 319931071
		arg_299_1.duration_ = 9.7

		local var_299_0 = {
			zh = 6.833,
			ja = 9.7
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
				arg_299_0:Play319931072(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = "XH0506"

			if arg_299_1.bgs_[var_302_0] == nil then
				local var_302_1 = Object.Instantiate(arg_299_1.paintGo_)

				var_302_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_302_0)
				var_302_1.name = var_302_0
				var_302_1.transform.parent = arg_299_1.stage_.transform
				var_302_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_299_1.bgs_[var_302_0] = var_302_1
			end

			local var_302_2 = 0

			if var_302_2 < arg_299_1.time_ and arg_299_1.time_ <= var_302_2 + arg_302_0 then
				local var_302_3 = manager.ui.mainCamera.transform.localPosition
				local var_302_4 = Vector3.New(0, 0, 10) + Vector3.New(var_302_3.x, var_302_3.y, 0)
				local var_302_5 = arg_299_1.bgs_.XH0506

				var_302_5.transform.localPosition = var_302_4
				var_302_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_302_6 = var_302_5:GetComponent("SpriteRenderer")

				if var_302_6 and var_302_6.sprite then
					local var_302_7 = (var_302_5.transform.localPosition - var_302_3).z
					local var_302_8 = manager.ui.mainCameraCom_
					local var_302_9 = 2 * var_302_7 * Mathf.Tan(var_302_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_302_10 = var_302_9 * var_302_8.aspect
					local var_302_11 = var_302_6.sprite.bounds.size.x
					local var_302_12 = var_302_6.sprite.bounds.size.y
					local var_302_13 = var_302_10 / var_302_11
					local var_302_14 = var_302_9 / var_302_12
					local var_302_15 = var_302_14 < var_302_13 and var_302_13 or var_302_14

					var_302_5.transform.localScale = Vector3.New(var_302_15, var_302_15, 0)
				end

				for iter_302_0, iter_302_1 in pairs(arg_299_1.bgs_) do
					if iter_302_0 ~= "XH0506" then
						iter_302_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_302_16 = manager.ui.mainCamera.transform
			local var_302_17 = 0

			if var_302_17 < arg_299_1.time_ and arg_299_1.time_ <= var_302_17 + arg_302_0 then
				local var_302_18 = arg_299_1.var_.effecthuiyisi1

				if not var_302_18 then
					var_302_18 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_302_18.name = "huiyisi1"
					arg_299_1.var_.effecthuiyisi1 = var_302_18
				end

				local var_302_19 = var_302_16:Find("")

				if var_302_19 then
					var_302_18.transform.parent = var_302_19
				else
					var_302_18.transform.parent = var_302_16
				end

				var_302_18.transform.localPosition = Vector3.New(0, 0, 0)
				var_302_18.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_302_20 = manager.ui.mainCamera.transform
			local var_302_21 = 2

			if var_302_21 < arg_299_1.time_ and arg_299_1.time_ <= var_302_21 + arg_302_0 then
				local var_302_22 = arg_299_1.var_.effecthuiyisi1

				if var_302_22 then
					Object.Destroy(var_302_22)

					arg_299_1.var_.effecthuiyisi1 = nil
				end
			end

			local var_302_23 = 0
			local var_302_24 = 0.6

			if var_302_23 < arg_299_1.time_ and arg_299_1.time_ <= var_302_23 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0

				arg_299_1.dialog_:SetActive(true)

				local var_302_25 = LeanTween.value(arg_299_1.dialog_, 0, 1, 0.3)

				var_302_25:setOnUpdate(LuaHelper.FloatAction(function(arg_303_0)
					arg_299_1.dialogCg_.alpha = arg_303_0
				end))
				var_302_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_299_1.dialog_)
					var_302_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_299_1.duration_ = arg_299_1.duration_ + 0.3

				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_26 = arg_299_1:FormatText(StoryNameCfg[692].name)

				arg_299_1.leftNameTxt_.text = var_302_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_27 = arg_299_1:GetWordFromCfg(319931071)
				local var_302_28 = arg_299_1:FormatText(var_302_27.content)

				arg_299_1.text_.text = var_302_28

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_29 = 24
				local var_302_30 = utf8.len(var_302_28)
				local var_302_31 = var_302_29 <= 0 and var_302_24 or var_302_24 * (var_302_30 / var_302_29)

				if var_302_31 > 0 and var_302_24 < var_302_31 then
					arg_299_1.talkMaxDuration = var_302_31
					var_302_23 = var_302_23 + 0.3

					if var_302_31 + var_302_23 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_31 + var_302_23
					end
				end

				arg_299_1.text_.text = var_302_28
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931071", "story_v_out_319931.awb") ~= 0 then
					local var_302_32 = manager.audio:GetVoiceLength("story_v_out_319931", "319931071", "story_v_out_319931.awb") / 1000

					if var_302_32 + var_302_23 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_32 + var_302_23
					end

					if var_302_27.prefab_name ~= "" and arg_299_1.actors_[var_302_27.prefab_name] ~= nil then
						local var_302_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_27.prefab_name].transform, "story_v_out_319931", "319931071", "story_v_out_319931.awb")

						arg_299_1:RecordAudio("319931071", var_302_33)
						arg_299_1:RecordAudio("319931071", var_302_33)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_319931", "319931071", "story_v_out_319931.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_319931", "319931071", "story_v_out_319931.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_34 = var_302_23 + 0.3
			local var_302_35 = math.max(var_302_24, arg_299_1.talkMaxDuration)

			if var_302_34 <= arg_299_1.time_ and arg_299_1.time_ < var_302_34 + var_302_35 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_34) / var_302_35

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_34 + var_302_35 and arg_299_1.time_ < var_302_34 + var_302_35 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play319931072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 319931072
		arg_305_1.duration_ = 5.3

		local var_305_0 = {
			zh = 3.5,
			ja = 5.3
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
				arg_305_0:Play319931073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = "ML0101"

			if arg_305_1.bgs_[var_308_0] == nil then
				local var_308_1 = Object.Instantiate(arg_305_1.paintGo_)

				var_308_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_308_0)
				var_308_1.name = var_308_0
				var_308_1.transform.parent = arg_305_1.stage_.transform
				var_308_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_305_1.bgs_[var_308_0] = var_308_1
			end

			local var_308_2 = 1

			if var_308_2 < arg_305_1.time_ and arg_305_1.time_ <= var_308_2 + arg_308_0 then
				local var_308_3 = manager.ui.mainCamera.transform.localPosition
				local var_308_4 = Vector3.New(0, 0, 10) + Vector3.New(var_308_3.x, var_308_3.y, 0)
				local var_308_5 = arg_305_1.bgs_.ML0101

				var_308_5.transform.localPosition = var_308_4
				var_308_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_308_6 = var_308_5:GetComponent("SpriteRenderer")

				if var_308_6 and var_308_6.sprite then
					local var_308_7 = (var_308_5.transform.localPosition - var_308_3).z
					local var_308_8 = manager.ui.mainCameraCom_
					local var_308_9 = 2 * var_308_7 * Mathf.Tan(var_308_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_308_10 = var_308_9 * var_308_8.aspect
					local var_308_11 = var_308_6.sprite.bounds.size.x
					local var_308_12 = var_308_6.sprite.bounds.size.y
					local var_308_13 = var_308_10 / var_308_11
					local var_308_14 = var_308_9 / var_308_12
					local var_308_15 = var_308_14 < var_308_13 and var_308_13 or var_308_14

					var_308_5.transform.localScale = Vector3.New(var_308_15, var_308_15, 0)
				end

				for iter_308_0, iter_308_1 in pairs(arg_305_1.bgs_) do
					if iter_308_0 ~= "ML0101" then
						iter_308_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_308_16 = 1.999999999999

			if var_308_16 < arg_305_1.time_ and arg_305_1.time_ <= var_308_16 + arg_308_0 then
				arg_305_1.allBtn_.enabled = false
			end

			local var_308_17 = 0.3

			if arg_305_1.time_ >= var_308_16 + var_308_17 and arg_305_1.time_ < var_308_16 + var_308_17 + arg_308_0 then
				arg_305_1.allBtn_.enabled = true
			end

			local var_308_18 = 0

			if var_308_18 < arg_305_1.time_ and arg_305_1.time_ <= var_308_18 + arg_308_0 then
				arg_305_1.mask_.enabled = true
				arg_305_1.mask_.raycastTarget = true

				arg_305_1:SetGaussion(false)
			end

			local var_308_19 = 1

			if var_308_18 <= arg_305_1.time_ and arg_305_1.time_ < var_308_18 + var_308_19 then
				local var_308_20 = (arg_305_1.time_ - var_308_18) / var_308_19
				local var_308_21 = Color.New(0, 0, 0)

				var_308_21.a = Mathf.Lerp(0, 1, var_308_20)
				arg_305_1.mask_.color = var_308_21
			end

			if arg_305_1.time_ >= var_308_18 + var_308_19 and arg_305_1.time_ < var_308_18 + var_308_19 + arg_308_0 then
				local var_308_22 = Color.New(0, 0, 0)

				var_308_22.a = 1
				arg_305_1.mask_.color = var_308_22
			end

			local var_308_23 = 1

			if var_308_23 < arg_305_1.time_ and arg_305_1.time_ <= var_308_23 + arg_308_0 then
				arg_305_1.mask_.enabled = true
				arg_305_1.mask_.raycastTarget = true

				arg_305_1:SetGaussion(false)
			end

			local var_308_24 = 1

			if var_308_23 <= arg_305_1.time_ and arg_305_1.time_ < var_308_23 + var_308_24 then
				local var_308_25 = (arg_305_1.time_ - var_308_23) / var_308_24
				local var_308_26 = Color.New(0, 0, 0)

				var_308_26.a = Mathf.Lerp(1, 0, var_308_25)
				arg_305_1.mask_.color = var_308_26
			end

			if arg_305_1.time_ >= var_308_23 + var_308_24 and arg_305_1.time_ < var_308_23 + var_308_24 + arg_308_0 then
				local var_308_27 = Color.New(0, 0, 0)
				local var_308_28 = 0

				arg_305_1.mask_.enabled = false
				var_308_27.a = var_308_28
				arg_305_1.mask_.color = var_308_27
			end

			if arg_305_1.frameCnt_ <= 1 then
				arg_305_1.dialog_:SetActive(false)
			end

			local var_308_29 = 2
			local var_308_30 = 0.125

			if var_308_29 < arg_305_1.time_ and arg_305_1.time_ <= var_308_29 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0

				arg_305_1.dialog_:SetActive(true)

				local var_308_31 = LeanTween.value(arg_305_1.dialog_, 0, 1, 0.3)

				var_308_31:setOnUpdate(LuaHelper.FloatAction(function(arg_309_0)
					arg_305_1.dialogCg_.alpha = arg_309_0
				end))
				var_308_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_305_1.dialog_)
					var_308_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_305_1.duration_ = arg_305_1.duration_ + 0.3

				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_32 = arg_305_1:FormatText(StoryNameCfg[692].name)

				arg_305_1.leftNameTxt_.text = var_308_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_33 = arg_305_1:GetWordFromCfg(319931072)
				local var_308_34 = arg_305_1:FormatText(var_308_33.content)

				arg_305_1.text_.text = var_308_34

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_35 = 5
				local var_308_36 = utf8.len(var_308_34)
				local var_308_37 = var_308_35 <= 0 and var_308_30 or var_308_30 * (var_308_36 / var_308_35)

				if var_308_37 > 0 and var_308_30 < var_308_37 then
					arg_305_1.talkMaxDuration = var_308_37
					var_308_29 = var_308_29 + 0.3

					if var_308_37 + var_308_29 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_37 + var_308_29
					end
				end

				arg_305_1.text_.text = var_308_34
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931072", "story_v_out_319931.awb") ~= 0 then
					local var_308_38 = manager.audio:GetVoiceLength("story_v_out_319931", "319931072", "story_v_out_319931.awb") / 1000

					if var_308_38 + var_308_29 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_38 + var_308_29
					end

					if var_308_33.prefab_name ~= "" and arg_305_1.actors_[var_308_33.prefab_name] ~= nil then
						local var_308_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_33.prefab_name].transform, "story_v_out_319931", "319931072", "story_v_out_319931.awb")

						arg_305_1:RecordAudio("319931072", var_308_39)
						arg_305_1:RecordAudio("319931072", var_308_39)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_319931", "319931072", "story_v_out_319931.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_319931", "319931072", "story_v_out_319931.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_40 = var_308_29 + 0.3
			local var_308_41 = math.max(var_308_30, arg_305_1.talkMaxDuration)

			if var_308_40 <= arg_305_1.time_ and arg_305_1.time_ < var_308_40 + var_308_41 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_40) / var_308_41

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_40 + var_308_41 and arg_305_1.time_ < var_308_40 + var_308_41 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play319931073 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 319931073
		arg_311_1.duration_ = 4.633

		local var_311_0 = {
			zh = 4.133333333332,
			ja = 4.633
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
				arg_311_0:Play319931074(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "I10f"

			if arg_311_1.bgs_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(arg_311_1.paintGo_)

				var_314_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_314_0)
				var_314_1.name = var_314_0
				var_314_1.transform.parent = arg_311_1.stage_.transform
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.bgs_[var_314_0] = var_314_1
			end

			local var_314_2 = 1

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 then
				local var_314_3 = manager.ui.mainCamera.transform.localPosition
				local var_314_4 = Vector3.New(0, 0, 10) + Vector3.New(var_314_3.x, var_314_3.y, 0)
				local var_314_5 = arg_311_1.bgs_.I10f

				var_314_5.transform.localPosition = var_314_4
				var_314_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_314_6 = var_314_5:GetComponent("SpriteRenderer")

				if var_314_6 and var_314_6.sprite then
					local var_314_7 = (var_314_5.transform.localPosition - var_314_3).z
					local var_314_8 = manager.ui.mainCameraCom_
					local var_314_9 = 2 * var_314_7 * Mathf.Tan(var_314_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_314_10 = var_314_9 * var_314_8.aspect
					local var_314_11 = var_314_6.sprite.bounds.size.x
					local var_314_12 = var_314_6.sprite.bounds.size.y
					local var_314_13 = var_314_10 / var_314_11
					local var_314_14 = var_314_9 / var_314_12
					local var_314_15 = var_314_14 < var_314_13 and var_314_13 or var_314_14

					var_314_5.transform.localScale = Vector3.New(var_314_15, var_314_15, 0)
				end

				for iter_314_0, iter_314_1 in pairs(arg_311_1.bgs_) do
					if iter_314_0 ~= "I10f" then
						iter_314_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_314_16 = 1.96599999815226

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.allBtn_.enabled = false
			end

			local var_314_17 = 0.3

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				arg_311_1.allBtn_.enabled = true
			end

			local var_314_18 = arg_311_1.actors_["10079ui_story"].transform
			local var_314_19 = 1.96599999815226

			if var_314_19 < arg_311_1.time_ and arg_311_1.time_ <= var_314_19 + arg_314_0 then
				arg_311_1.var_.moveOldPos10079ui_story = var_314_18.localPosition
			end

			local var_314_20 = 0.001

			if var_314_19 <= arg_311_1.time_ and arg_311_1.time_ < var_314_19 + var_314_20 then
				local var_314_21 = (arg_311_1.time_ - var_314_19) / var_314_20
				local var_314_22 = Vector3.New(0, -0.95, -6.05)

				var_314_18.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10079ui_story, var_314_22, var_314_21)

				local var_314_23 = manager.ui.mainCamera.transform.position - var_314_18.position

				var_314_18.forward = Vector3.New(var_314_23.x, var_314_23.y, var_314_23.z)

				local var_314_24 = var_314_18.localEulerAngles

				var_314_24.z = 0
				var_314_24.x = 0
				var_314_18.localEulerAngles = var_314_24
			end

			if arg_311_1.time_ >= var_314_19 + var_314_20 and arg_311_1.time_ < var_314_19 + var_314_20 + arg_314_0 then
				var_314_18.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_314_25 = manager.ui.mainCamera.transform.position - var_314_18.position

				var_314_18.forward = Vector3.New(var_314_25.x, var_314_25.y, var_314_25.z)

				local var_314_26 = var_314_18.localEulerAngles

				var_314_26.z = 0
				var_314_26.x = 0
				var_314_18.localEulerAngles = var_314_26
			end

			local var_314_27 = arg_311_1.actors_["10079ui_story"]
			local var_314_28 = 1.96599999815226

			if var_314_28 < arg_311_1.time_ and arg_311_1.time_ <= var_314_28 + arg_314_0 and arg_311_1.var_.characterEffect10079ui_story == nil then
				arg_311_1.var_.characterEffect10079ui_story = var_314_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_29 = 0.034000001847744

			if var_314_28 <= arg_311_1.time_ and arg_311_1.time_ < var_314_28 + var_314_29 then
				local var_314_30 = (arg_311_1.time_ - var_314_28) / var_314_29

				if arg_311_1.var_.characterEffect10079ui_story then
					arg_311_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_28 + var_314_29 and arg_311_1.time_ < var_314_28 + var_314_29 + arg_314_0 and arg_311_1.var_.characterEffect10079ui_story then
				arg_311_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_314_31 = 1.96599999815226

			if var_314_31 < arg_311_1.time_ and arg_311_1.time_ <= var_314_31 + arg_314_0 then
				arg_311_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_314_32 = 1.96599999815226

			if var_314_32 < arg_311_1.time_ and arg_311_1.time_ <= var_314_32 + arg_314_0 then
				arg_311_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_314_33 = 0

			if var_314_33 < arg_311_1.time_ and arg_311_1.time_ <= var_314_33 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_34 = 1

			if var_314_33 <= arg_311_1.time_ and arg_311_1.time_ < var_314_33 + var_314_34 then
				local var_314_35 = (arg_311_1.time_ - var_314_33) / var_314_34
				local var_314_36 = Color.New(0, 0, 0)

				var_314_36.a = Mathf.Lerp(0, 1, var_314_35)
				arg_311_1.mask_.color = var_314_36
			end

			if arg_311_1.time_ >= var_314_33 + var_314_34 and arg_311_1.time_ < var_314_33 + var_314_34 + arg_314_0 then
				local var_314_37 = Color.New(0, 0, 0)

				var_314_37.a = 1
				arg_311_1.mask_.color = var_314_37
			end

			local var_314_38 = 1

			if var_314_38 < arg_311_1.time_ and arg_311_1.time_ <= var_314_38 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_39 = 1

			if var_314_38 <= arg_311_1.time_ and arg_311_1.time_ < var_314_38 + var_314_39 then
				local var_314_40 = (arg_311_1.time_ - var_314_38) / var_314_39
				local var_314_41 = Color.New(0, 0, 0)

				var_314_41.a = Mathf.Lerp(1, 0, var_314_40)
				arg_311_1.mask_.color = var_314_41
			end

			if arg_311_1.time_ >= var_314_38 + var_314_39 and arg_311_1.time_ < var_314_38 + var_314_39 + arg_314_0 then
				local var_314_42 = Color.New(0, 0, 0)
				local var_314_43 = 0

				arg_311_1.mask_.enabled = false
				var_314_42.a = var_314_43
				arg_311_1.mask_.color = var_314_42
			end

			if arg_311_1.frameCnt_ <= 1 then
				arg_311_1.dialog_:SetActive(false)
			end

			local var_314_44 = 2
			local var_314_45 = 0.15

			if var_314_44 < arg_311_1.time_ and arg_311_1.time_ <= var_314_44 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				arg_311_1.dialog_:SetActive(true)

				local var_314_46 = LeanTween.value(arg_311_1.dialog_, 0, 1, 0.3)

				var_314_46:setOnUpdate(LuaHelper.FloatAction(function(arg_315_0)
					arg_311_1.dialogCg_.alpha = arg_315_0
				end))
				var_314_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_311_1.dialog_)
					var_314_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_311_1.duration_ = arg_311_1.duration_ + 0.3

				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_47 = arg_311_1:FormatText(StoryNameCfg[6].name)

				arg_311_1.leftNameTxt_.text = var_314_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_48 = arg_311_1:GetWordFromCfg(319931073)
				local var_314_49 = arg_311_1:FormatText(var_314_48.content)

				arg_311_1.text_.text = var_314_49

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_50 = 6
				local var_314_51 = utf8.len(var_314_49)
				local var_314_52 = var_314_50 <= 0 and var_314_45 or var_314_45 * (var_314_51 / var_314_50)

				if var_314_52 > 0 and var_314_45 < var_314_52 then
					arg_311_1.talkMaxDuration = var_314_52
					var_314_44 = var_314_44 + 0.3

					if var_314_52 + var_314_44 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_52 + var_314_44
					end
				end

				arg_311_1.text_.text = var_314_49
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931073", "story_v_out_319931.awb") ~= 0 then
					local var_314_53 = manager.audio:GetVoiceLength("story_v_out_319931", "319931073", "story_v_out_319931.awb") / 1000

					if var_314_53 + var_314_44 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_53 + var_314_44
					end

					if var_314_48.prefab_name ~= "" and arg_311_1.actors_[var_314_48.prefab_name] ~= nil then
						local var_314_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_48.prefab_name].transform, "story_v_out_319931", "319931073", "story_v_out_319931.awb")

						arg_311_1:RecordAudio("319931073", var_314_54)
						arg_311_1:RecordAudio("319931073", var_314_54)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_319931", "319931073", "story_v_out_319931.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_319931", "319931073", "story_v_out_319931.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_55 = var_314_44 + 0.3
			local var_314_56 = math.max(var_314_45, arg_311_1.talkMaxDuration)

			if var_314_55 <= arg_311_1.time_ and arg_311_1.time_ < var_314_55 + var_314_56 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_55) / var_314_56

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_55 + var_314_56 and arg_311_1.time_ < var_314_55 + var_314_56 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play319931074 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 319931074
		arg_317_1.duration_ = 6.066

		local var_317_0 = {
			zh = 5.333,
			ja = 6.066
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
				arg_317_0:Play319931075(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				local var_320_1 = manager.ui.mainCamera.transform.localPosition
				local var_320_2 = Vector3.New(0, 0, 10) + Vector3.New(var_320_1.x, var_320_1.y, 0)
				local var_320_3 = arg_317_1.bgs_.D999

				var_320_3.transform.localPosition = var_320_2
				var_320_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_320_4 = var_320_3:GetComponent("SpriteRenderer")

				if var_320_4 and var_320_4.sprite then
					local var_320_5 = (var_320_3.transform.localPosition - var_320_1).z
					local var_320_6 = manager.ui.mainCameraCom_
					local var_320_7 = 2 * var_320_5 * Mathf.Tan(var_320_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_320_8 = var_320_7 * var_320_6.aspect
					local var_320_9 = var_320_4.sprite.bounds.size.x
					local var_320_10 = var_320_4.sprite.bounds.size.y
					local var_320_11 = var_320_8 / var_320_9
					local var_320_12 = var_320_7 / var_320_10
					local var_320_13 = var_320_12 < var_320_11 and var_320_11 or var_320_12

					var_320_3.transform.localScale = Vector3.New(var_320_13, var_320_13, 0)
				end

				for iter_320_0, iter_320_1 in pairs(arg_317_1.bgs_) do
					if iter_320_0 ~= "D999" then
						iter_320_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1.allBtn_.enabled = false
			end

			local var_320_15 = 0.3

			if arg_317_1.time_ >= var_320_14 + var_320_15 and arg_317_1.time_ < var_320_14 + var_320_15 + arg_320_0 then
				arg_317_1.allBtn_.enabled = true
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
				local var_320_19 = Color.New(1, 1, 1)

				var_320_19.a = Mathf.Lerp(1, 0, var_320_18)
				arg_317_1.mask_.color = var_320_19
			end

			if arg_317_1.time_ >= var_320_16 + var_320_17 and arg_317_1.time_ < var_320_16 + var_320_17 + arg_320_0 then
				local var_320_20 = Color.New(1, 1, 1)
				local var_320_21 = 0

				arg_317_1.mask_.enabled = false
				var_320_20.a = var_320_21
				arg_317_1.mask_.color = var_320_20
			end

			local var_320_22 = arg_317_1.actors_["10079ui_story"]
			local var_320_23 = 0

			if var_320_23 < arg_317_1.time_ and arg_317_1.time_ <= var_320_23 + arg_320_0 and arg_317_1.var_.characterEffect10079ui_story == nil then
				arg_317_1.var_.characterEffect10079ui_story = var_320_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_24 = 0.200000002980232

			if var_320_23 <= arg_317_1.time_ and arg_317_1.time_ < var_320_23 + var_320_24 then
				local var_320_25 = (arg_317_1.time_ - var_320_23) / var_320_24

				if arg_317_1.var_.characterEffect10079ui_story then
					local var_320_26 = Mathf.Lerp(0, 0.5, var_320_25)

					arg_317_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_317_1.var_.characterEffect10079ui_story.fillRatio = var_320_26
				end
			end

			if arg_317_1.time_ >= var_320_23 + var_320_24 and arg_317_1.time_ < var_320_23 + var_320_24 + arg_320_0 and arg_317_1.var_.characterEffect10079ui_story then
				local var_320_27 = 0.5

				arg_317_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_317_1.var_.characterEffect10079ui_story.fillRatio = var_320_27
			end

			local var_320_28 = arg_317_1.actors_["10079ui_story"].transform
			local var_320_29 = 0

			if var_320_29 < arg_317_1.time_ and arg_317_1.time_ <= var_320_29 + arg_320_0 then
				arg_317_1.var_.moveOldPos10079ui_story = var_320_28.localPosition
			end

			local var_320_30 = 0.001

			if var_320_29 <= arg_317_1.time_ and arg_317_1.time_ < var_320_29 + var_320_30 then
				local var_320_31 = (arg_317_1.time_ - var_320_29) / var_320_30
				local var_320_32 = Vector3.New(0, 100, 0)

				var_320_28.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10079ui_story, var_320_32, var_320_31)

				local var_320_33 = manager.ui.mainCamera.transform.position - var_320_28.position

				var_320_28.forward = Vector3.New(var_320_33.x, var_320_33.y, var_320_33.z)

				local var_320_34 = var_320_28.localEulerAngles

				var_320_34.z = 0
				var_320_34.x = 0
				var_320_28.localEulerAngles = var_320_34
			end

			if arg_317_1.time_ >= var_320_29 + var_320_30 and arg_317_1.time_ < var_320_29 + var_320_30 + arg_320_0 then
				var_320_28.localPosition = Vector3.New(0, 100, 0)

				local var_320_35 = manager.ui.mainCamera.transform.position - var_320_28.position

				var_320_28.forward = Vector3.New(var_320_35.x, var_320_35.y, var_320_35.z)

				local var_320_36 = var_320_28.localEulerAngles

				var_320_36.z = 0
				var_320_36.x = 0
				var_320_28.localEulerAngles = var_320_36
			end

			local var_320_37 = 0

			if var_320_37 < arg_317_1.time_ and arg_317_1.time_ <= var_320_37 + arg_320_0 then
				arg_317_1.screenFilterGo_:SetActive(false)
			end

			local var_320_38 = 0.0333333333333333

			if var_320_37 <= arg_317_1.time_ and arg_317_1.time_ < var_320_37 + var_320_38 then
				local var_320_39 = (arg_317_1.time_ - var_320_37) / var_320_38

				arg_317_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_320_39)
			end

			if arg_317_1.time_ >= var_320_37 + var_320_38 and arg_317_1.time_ < var_320_37 + var_320_38 + arg_320_0 then
				arg_317_1.screenFilterEffect_.weight = 0
			end

			if arg_317_1.frameCnt_ <= 1 then
				arg_317_1.dialog_:SetActive(false)
			end

			local var_320_40 = 2
			local var_320_41 = 0.35

			if var_320_40 < arg_317_1.time_ and arg_317_1.time_ <= var_320_40 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0

				arg_317_1.dialog_:SetActive(true)

				local var_320_42 = LeanTween.value(arg_317_1.dialog_, 0, 1, 0.3)

				var_320_42:setOnUpdate(LuaHelper.FloatAction(function(arg_321_0)
					arg_317_1.dialogCg_.alpha = arg_321_0
				end))
				var_320_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_317_1.dialog_)
					var_320_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_317_1.duration_ = arg_317_1.duration_ + 0.3

				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_43 = arg_317_1:GetWordFromCfg(319931074)
				local var_320_44 = arg_317_1:FormatText(var_320_43.content)

				arg_317_1.text_.text = var_320_44

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_45 = 14
				local var_320_46 = utf8.len(var_320_44)
				local var_320_47 = var_320_45 <= 0 and var_320_41 or var_320_41 * (var_320_46 / var_320_45)

				if var_320_47 > 0 and var_320_41 < var_320_47 then
					arg_317_1.talkMaxDuration = var_320_47
					var_320_40 = var_320_40 + 0.3

					if var_320_47 + var_320_40 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_47 + var_320_40
					end
				end

				arg_317_1.text_.text = var_320_44
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319931", "319931074", "story_v_out_319931.awb") ~= 0 then
					local var_320_48 = manager.audio:GetVoiceLength("story_v_out_319931", "319931074", "story_v_out_319931.awb") / 1000

					if var_320_48 + var_320_40 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_48 + var_320_40
					end

					if var_320_43.prefab_name ~= "" and arg_317_1.actors_[var_320_43.prefab_name] ~= nil then
						local var_320_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_43.prefab_name].transform, "story_v_out_319931", "319931074", "story_v_out_319931.awb")

						arg_317_1:RecordAudio("319931074", var_320_49)
						arg_317_1:RecordAudio("319931074", var_320_49)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_319931", "319931074", "story_v_out_319931.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_319931", "319931074", "story_v_out_319931.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_50 = var_320_40 + 0.3
			local var_320_51 = math.max(var_320_41, arg_317_1.talkMaxDuration)

			if var_320_50 <= arg_317_1.time_ and arg_317_1.time_ < var_320_50 + var_320_51 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_50) / var_320_51

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_50 + var_320_51 and arg_317_1.time_ < var_320_50 + var_320_51 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play319931075 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 319931075
		arg_323_1.duration_ = 5.53333333333333

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
			arg_323_1.auto_ = false
		end

		function arg_323_1.playNext_(arg_325_0)
			arg_323_1.onStoryFinished_()
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 0.2

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				local var_326_2 = "play"
				local var_326_3 = "music"

				arg_323_1:AudioAction(var_326_2, var_326_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_323_1.frameCnt_ <= 1 then
				arg_323_1.dialog_:SetActive(false)
			end

			local var_326_4 = 0.533333333333333
			local var_326_5 = 0.7

			if var_326_4 < arg_323_1.time_ and arg_323_1.time_ <= var_326_4 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0

				arg_323_1.dialog_:SetActive(true)

				local var_326_6 = LeanTween.value(arg_323_1.dialog_, 0, 1, 0.3)

				var_326_6:setOnUpdate(LuaHelper.FloatAction(function(arg_327_0)
					arg_323_1.dialogCg_.alpha = arg_327_0
				end))
				var_326_6:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_323_1.dialog_)
					var_326_6:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_323_1.duration_ = arg_323_1.duration_ + 0.3

				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_7 = arg_323_1:GetWordFromCfg(319931075)
				local var_326_8 = arg_323_1:FormatText(var_326_7.content)

				arg_323_1.text_.text = var_326_8

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_9 = 28
				local var_326_10 = utf8.len(var_326_8)
				local var_326_11 = var_326_9 <= 0 and var_326_5 or var_326_5 * (var_326_10 / var_326_9)

				if var_326_11 > 0 and var_326_5 < var_326_11 then
					arg_323_1.talkMaxDuration = var_326_11
					var_326_4 = var_326_4 + 0.3

					if var_326_11 + var_326_4 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_11 + var_326_4
					end
				end

				arg_323_1.text_.text = var_326_8
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_12 = var_326_4 + 0.3
			local var_326_13 = math.max(var_326_5, arg_323_1.talkMaxDuration)

			if var_326_12 <= arg_323_1.time_ and arg_323_1.time_ < var_326_12 + var_326_13 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_12) / var_326_13

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_12 + var_326_13 and arg_323_1.time_ < var_326_12 + var_326_13 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11r",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11i",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0207",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D999",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0204",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0506",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I10f"
	},
	voices = {
		"story_v_out_319931.awb"
	}
}
