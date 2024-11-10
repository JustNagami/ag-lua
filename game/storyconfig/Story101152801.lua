return {
	Play115281001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115281001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115281002(arg_1_1)
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

			local var_4_16 = manager.ui.mainCamera.transform
			local var_4_17 = 2

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_16.localPosition
			end

			local var_4_18 = 0.333333333333333

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_18 then
				local var_4_19 = (arg_1_1.time_ - var_4_17) / 0.066
				local var_4_20, var_4_21 = math.modf(var_4_19)

				var_4_16.localPosition = Vector3.New(var_4_21 * 0.13, var_4_21 * 0.13, var_4_21 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_17 + var_4_18 and arg_1_1.time_ < var_4_17 + var_4_18 + arg_4_0 then
				var_4_16.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_22 = 0
			local var_4_23 = 0.766666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.075
			local var_4_27 = 1.925

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.075

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
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

				local var_4_37 = arg_1_1:GetWordFromCfg(115281001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 3
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
	Play115281002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115281002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play115281003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.55

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

				local var_10_2 = arg_7_1:GetWordFromCfg(115281002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 22
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
	Play115281003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115281003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play115281004(arg_11_1)
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

				local var_14_2 = arg_11_1:GetWordFromCfg(115281003)
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
	Play115281004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115281004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play115281005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.95

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

				local var_18_2 = arg_15_1:GetWordFromCfg(115281004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 38
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
	Play115281005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115281005
		arg_19_1.duration_ = 2.166

		local var_19_0 = {
			ja = 1.466,
			ko = 1.833,
			zh = 1.833,
			en = 2.166
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
				arg_19_0:Play115281006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.15

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[309].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_2")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(115281005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281005", "story_v_out_115281.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281005", "story_v_out_115281.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_115281", "115281005", "story_v_out_115281.awb")

						arg_19_1:RecordAudio("115281005", var_22_9)
						arg_19_1:RecordAudio("115281005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_115281", "115281005", "story_v_out_115281.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_115281", "115281005", "story_v_out_115281.awb")
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
	Play115281006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115281006
		arg_23_1.duration_ = 8

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play115281007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "D999"

			if arg_23_1.bgs_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(arg_23_1.paintGo_)

				var_26_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_0)
				var_26_1.name = var_26_0
				var_26_1.transform.parent = arg_23_1.stage_.transform
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_0] = var_26_1
			end

			local var_26_2 = 1

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				local var_26_3 = manager.ui.mainCamera.transform.localPosition
				local var_26_4 = Vector3.New(0, 0, 10) + Vector3.New(var_26_3.x, var_26_3.y, 0)
				local var_26_5 = arg_23_1.bgs_.D999

				var_26_5.transform.localPosition = var_26_4
				var_26_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_26_6 = var_26_5:GetComponent("SpriteRenderer")

				if var_26_6 and var_26_6.sprite then
					local var_26_7 = (var_26_5.transform.localPosition - var_26_3).z
					local var_26_8 = manager.ui.mainCameraCom_
					local var_26_9 = 2 * var_26_7 * Mathf.Tan(var_26_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_26_10 = var_26_9 * var_26_8.aspect
					local var_26_11 = var_26_6.sprite.bounds.size.x
					local var_26_12 = var_26_6.sprite.bounds.size.y
					local var_26_13 = var_26_10 / var_26_11
					local var_26_14 = var_26_9 / var_26_12
					local var_26_15 = var_26_14 < var_26_13 and var_26_13 or var_26_14

					var_26_5.transform.localScale = Vector3.New(var_26_15, var_26_15, 0)
				end

				for iter_26_0, iter_26_1 in pairs(arg_23_1.bgs_) do
					if iter_26_0 ~= "D999" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = false

				arg_23_1:SetGaussion(false)
			end

			local var_26_17 = 1

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Color.New(0, 0, 0)

				var_26_19.a = Mathf.Lerp(0, 1, var_26_18)
				arg_23_1.mask_.color = var_26_19
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				local var_26_20 = Color.New(0, 0, 0)

				var_26_20.a = 1
				arg_23_1.mask_.color = var_26_20
			end

			local var_26_21 = 1

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = false

				arg_23_1:SetGaussion(false)
			end

			local var_26_22 = 2

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22
				local var_26_24 = Color.New(0, 0, 0)

				var_26_24.a = Mathf.Lerp(1, 0, var_26_23)
				arg_23_1.mask_.color = var_26_24
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 then
				local var_26_25 = Color.New(0, 0, 0)
				local var_26_26 = 0

				arg_23_1.mask_.enabled = false
				var_26_25.a = var_26_26
				arg_23_1.mask_.color = var_26_25
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_27 = 3
			local var_26_28 = 0.7

			if var_26_27 < arg_23_1.time_ and arg_23_1.time_ <= var_26_27 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_29 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_29:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_30 = arg_23_1:GetWordFromCfg(115281006)
				local var_26_31 = arg_23_1:FormatText(var_26_30.content)

				arg_23_1.text_.text = var_26_31

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_32 = 28
				local var_26_33 = utf8.len(var_26_31)
				local var_26_34 = var_26_32 <= 0 and var_26_28 or var_26_28 * (var_26_33 / var_26_32)

				if var_26_34 > 0 and var_26_28 < var_26_34 then
					arg_23_1.talkMaxDuration = var_26_34
					var_26_27 = var_26_27 + 0.3

					if var_26_34 + var_26_27 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_34 + var_26_27
					end
				end

				arg_23_1.text_.text = var_26_31
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_35 = var_26_27 + 0.3
			local var_26_36 = math.max(var_26_28, arg_23_1.talkMaxDuration)

			if var_26_35 <= arg_23_1.time_ and arg_23_1.time_ < var_26_35 + var_26_36 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_35) / var_26_36

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_35 + var_26_36 and arg_23_1.time_ < var_26_35 + var_26_36 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play115281007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 115281007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play115281008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.975

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

				local var_32_2 = arg_29_1:GetWordFromCfg(115281007)
				local var_32_3 = arg_29_1:FormatText(var_32_2.content)

				arg_29_1.text_.text = var_32_3

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_4 = 39
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
	Play115281008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 115281008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play115281009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 1.15

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_2 = arg_33_1:GetWordFromCfg(115281008)
				local var_36_3 = arg_33_1:FormatText(var_36_2.content)

				arg_33_1.text_.text = var_36_3

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_4 = 46
				local var_36_5 = utf8.len(var_36_3)
				local var_36_6 = var_36_4 <= 0 and var_36_1 or var_36_1 * (var_36_5 / var_36_4)

				if var_36_6 > 0 and var_36_1 < var_36_6 then
					arg_33_1.talkMaxDuration = var_36_6

					if var_36_6 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_6 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_3
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_7 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_7 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_7

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_7 and arg_33_1.time_ < var_36_0 + var_36_7 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play115281009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 115281009
		arg_37_1.duration_ = 10.866

		local var_37_0 = {
			ja = 10.866,
			ko = 6.933,
			zh = 7.9,
			en = 7.4
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
				arg_37_0:Play115281010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = "ST27"

			if arg_37_1.bgs_[var_40_0] == nil then
				local var_40_1 = Object.Instantiate(arg_37_1.paintGo_)

				var_40_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_40_0)
				var_40_1.name = var_40_0
				var_40_1.transform.parent = arg_37_1.stage_.transform
				var_40_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.bgs_[var_40_0] = var_40_1
			end

			local var_40_2 = 2

			if var_40_2 < arg_37_1.time_ and arg_37_1.time_ <= var_40_2 + arg_40_0 then
				local var_40_3 = manager.ui.mainCamera.transform.localPosition
				local var_40_4 = Vector3.New(0, 0, 10) + Vector3.New(var_40_3.x, var_40_3.y, 0)
				local var_40_5 = arg_37_1.bgs_.ST27

				var_40_5.transform.localPosition = var_40_4
				var_40_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_40_6 = var_40_5:GetComponent("SpriteRenderer")

				if var_40_6 and var_40_6.sprite then
					local var_40_7 = (var_40_5.transform.localPosition - var_40_3).z
					local var_40_8 = manager.ui.mainCameraCom_
					local var_40_9 = 2 * var_40_7 * Mathf.Tan(var_40_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_40_10 = var_40_9 * var_40_8.aspect
					local var_40_11 = var_40_6.sprite.bounds.size.x
					local var_40_12 = var_40_6.sprite.bounds.size.y
					local var_40_13 = var_40_10 / var_40_11
					local var_40_14 = var_40_9 / var_40_12
					local var_40_15 = var_40_14 < var_40_13 and var_40_13 or var_40_14

					var_40_5.transform.localScale = Vector3.New(var_40_15, var_40_15, 0)
				end

				for iter_40_0, iter_40_1 in pairs(arg_37_1.bgs_) do
					if iter_40_0 ~= "ST27" then
						iter_40_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_40_16 = 0

			if var_40_16 < arg_37_1.time_ and arg_37_1.time_ <= var_40_16 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = false

				arg_37_1:SetGaussion(false)
			end

			local var_40_17 = 2

			if var_40_16 <= arg_37_1.time_ and arg_37_1.time_ < var_40_16 + var_40_17 then
				local var_40_18 = (arg_37_1.time_ - var_40_16) / var_40_17
				local var_40_19 = Color.New(0, 0, 0)

				var_40_19.a = Mathf.Lerp(0, 1, var_40_18)
				arg_37_1.mask_.color = var_40_19
			end

			if arg_37_1.time_ >= var_40_16 + var_40_17 and arg_37_1.time_ < var_40_16 + var_40_17 + arg_40_0 then
				local var_40_20 = Color.New(0, 0, 0)

				var_40_20.a = 1
				arg_37_1.mask_.color = var_40_20
			end

			local var_40_21 = 2

			if var_40_21 < arg_37_1.time_ and arg_37_1.time_ <= var_40_21 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = false

				arg_37_1:SetGaussion(false)
			end

			local var_40_22 = 2

			if var_40_21 <= arg_37_1.time_ and arg_37_1.time_ < var_40_21 + var_40_22 then
				local var_40_23 = (arg_37_1.time_ - var_40_21) / var_40_22
				local var_40_24 = Color.New(0, 0, 0)

				var_40_24.a = Mathf.Lerp(1, 0, var_40_23)
				arg_37_1.mask_.color = var_40_24
			end

			if arg_37_1.time_ >= var_40_21 + var_40_22 and arg_37_1.time_ < var_40_21 + var_40_22 + arg_40_0 then
				local var_40_25 = Color.New(0, 0, 0)
				local var_40_26 = 0

				arg_37_1.mask_.enabled = false
				var_40_25.a = var_40_26
				arg_37_1.mask_.color = var_40_25
			end

			local var_40_27 = "10030"

			if arg_37_1.actors_[var_40_27] == nil then
				local var_40_28 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_40_27), arg_37_1.canvasGo_.transform)

				var_40_28.transform:SetSiblingIndex(1)

				var_40_28.name = var_40_27
				var_40_28.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_37_1.actors_[var_40_27] = var_40_28
			end

			local var_40_29 = arg_37_1.actors_["10030"].transform
			local var_40_30 = 4

			if var_40_30 < arg_37_1.time_ and arg_37_1.time_ <= var_40_30 + arg_40_0 then
				arg_37_1.var_.moveOldPos10030 = var_40_29.localPosition
				var_40_29.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("10030", 3)

				local var_40_31 = var_40_29.childCount

				for iter_40_2 = 0, var_40_31 - 1 do
					local var_40_32 = var_40_29:GetChild(iter_40_2)

					if var_40_32.name == "split_3" or not string.find(var_40_32.name, "split") then
						var_40_32.gameObject:SetActive(true)
					else
						var_40_32.gameObject:SetActive(false)
					end
				end
			end

			local var_40_33 = 0.001

			if var_40_30 <= arg_37_1.time_ and arg_37_1.time_ < var_40_30 + var_40_33 then
				local var_40_34 = (arg_37_1.time_ - var_40_30) / var_40_33
				local var_40_35 = Vector3.New(0, -390, 150)

				var_40_29.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos10030, var_40_35, var_40_34)
			end

			if arg_37_1.time_ >= var_40_30 + var_40_33 and arg_37_1.time_ < var_40_30 + var_40_33 + arg_40_0 then
				var_40_29.localPosition = Vector3.New(0, -390, 150)
			end

			local var_40_36 = arg_37_1.actors_["10030"]
			local var_40_37 = 4

			if var_40_37 < arg_37_1.time_ and arg_37_1.time_ <= var_40_37 + arg_40_0 then
				local var_40_38 = var_40_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_40_38 then
					arg_37_1.var_.alphaOldValue10030 = var_40_38.alpha
					arg_37_1.var_.characterEffect10030 = var_40_38
				end

				arg_37_1.var_.alphaOldValue10030 = 0
			end

			local var_40_39 = 0.333333333333333

			if var_40_37 <= arg_37_1.time_ and arg_37_1.time_ < var_40_37 + var_40_39 then
				local var_40_40 = (arg_37_1.time_ - var_40_37) / var_40_39
				local var_40_41 = Mathf.Lerp(arg_37_1.var_.alphaOldValue10030, 1, var_40_40)

				if arg_37_1.var_.characterEffect10030 then
					arg_37_1.var_.characterEffect10030.alpha = var_40_41
				end
			end

			if arg_37_1.time_ >= var_40_37 + var_40_39 and arg_37_1.time_ < var_40_37 + var_40_39 + arg_40_0 and arg_37_1.var_.characterEffect10030 then
				arg_37_1.var_.characterEffect10030.alpha = 1
			end

			local var_40_42 = arg_37_1.actors_["10030"]
			local var_40_43 = 4

			if var_40_43 < arg_37_1.time_ and arg_37_1.time_ <= var_40_43 + arg_40_0 and arg_37_1.var_.actorSpriteComps10030 == nil then
				arg_37_1.var_.actorSpriteComps10030 = var_40_42:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_44 = 0.2

			if var_40_43 <= arg_37_1.time_ and arg_37_1.time_ < var_40_43 + var_40_44 then
				local var_40_45 = (arg_37_1.time_ - var_40_43) / var_40_44

				if arg_37_1.var_.actorSpriteComps10030 then
					for iter_40_3, iter_40_4 in pairs(arg_37_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_40_4 then
							local var_40_46 = Mathf.Lerp(iter_40_4.color.r, 1, var_40_45)

							iter_40_4.color = Color.New(var_40_46, var_40_46, var_40_46)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_43 + var_40_44 and arg_37_1.time_ < var_40_43 + var_40_44 + arg_40_0 and arg_37_1.var_.actorSpriteComps10030 then
				local var_40_47 = 1

				for iter_40_5, iter_40_6 in pairs(arg_37_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_40_6 then
						iter_40_6.color = Color.New(var_40_47, var_40_47, var_40_47)
					end
				end

				arg_37_1.var_.actorSpriteComps10030 = nil
			end

			if arg_37_1.frameCnt_ <= 1 then
				arg_37_1.dialog_:SetActive(false)
			end

			local var_40_48 = 4
			local var_40_49 = 0.225

			if var_40_48 < arg_37_1.time_ and arg_37_1.time_ <= var_40_48 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_50 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_50:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_51 = arg_37_1:FormatText(StoryNameCfg[309].name)

				arg_37_1.leftNameTxt_.text = var_40_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_52 = arg_37_1:GetWordFromCfg(115281009)
				local var_40_53 = arg_37_1:FormatText(var_40_52.content)

				arg_37_1.text_.text = var_40_53

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_54 = 9
				local var_40_55 = utf8.len(var_40_53)
				local var_40_56 = var_40_54 <= 0 and var_40_49 or var_40_49 * (var_40_55 / var_40_54)

				if var_40_56 > 0 and var_40_49 < var_40_56 then
					arg_37_1.talkMaxDuration = var_40_56
					var_40_48 = var_40_48 + 0.3

					if var_40_56 + var_40_48 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_56 + var_40_48
					end
				end

				arg_37_1.text_.text = var_40_53
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281009", "story_v_out_115281.awb") ~= 0 then
					local var_40_57 = manager.audio:GetVoiceLength("story_v_out_115281", "115281009", "story_v_out_115281.awb") / 1000

					if var_40_57 + var_40_48 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_57 + var_40_48
					end

					if var_40_52.prefab_name ~= "" and arg_37_1.actors_[var_40_52.prefab_name] ~= nil then
						local var_40_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_52.prefab_name].transform, "story_v_out_115281", "115281009", "story_v_out_115281.awb")

						arg_37_1:RecordAudio("115281009", var_40_58)
						arg_37_1:RecordAudio("115281009", var_40_58)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_115281", "115281009", "story_v_out_115281.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_115281", "115281009", "story_v_out_115281.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_59 = var_40_48 + 0.3
			local var_40_60 = math.max(var_40_49, arg_37_1.talkMaxDuration)

			if var_40_59 <= arg_37_1.time_ and arg_37_1.time_ < var_40_59 + var_40_60 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_59) / var_40_60

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_59 + var_40_60 and arg_37_1.time_ < var_40_59 + var_40_60 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play115281010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 115281010
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play115281011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10030"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10030 == nil then
				arg_43_1.var_.actorSpriteComps10030 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10030 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 0.5, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10030 then
				local var_46_5 = 0.5

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10030 = nil
			end

			local var_46_6 = 0
			local var_46_7 = 1.275

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_8 = arg_43_1:GetWordFromCfg(115281010)
				local var_46_9 = arg_43_1:FormatText(var_46_8.content)

				arg_43_1.text_.text = var_46_9

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_10 = 51
				local var_46_11 = utf8.len(var_46_9)
				local var_46_12 = var_46_10 <= 0 and var_46_7 or var_46_7 * (var_46_11 / var_46_10)

				if var_46_12 > 0 and var_46_7 < var_46_12 then
					arg_43_1.talkMaxDuration = var_46_12

					if var_46_12 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_9
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_13 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_13 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_13

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_13 and arg_43_1.time_ < var_46_6 + var_46_13 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play115281011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115281011
		arg_47_1.duration_ = 9.933

		local var_47_0 = {
			ja = 8.266,
			ko = 8.9,
			zh = 8.4,
			en = 9.933
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
				arg_47_0:Play115281012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10030"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10030 == nil then
				arg_47_1.var_.actorSpriteComps10030 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10030 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 1, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10030 then
				local var_50_5 = 1

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10030 = nil
			end

			local var_50_6 = arg_47_1.actors_["10030"].transform
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 then
				arg_47_1.var_.moveOldPos10030 = var_50_6.localPosition
				var_50_6.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10030", 3)

				local var_50_8 = var_50_6.childCount

				for iter_50_4 = 0, var_50_8 - 1 do
					local var_50_9 = var_50_6:GetChild(iter_50_4)

					if var_50_9.name == "split_1" or not string.find(var_50_9.name, "split") then
						var_50_9.gameObject:SetActive(true)
					else
						var_50_9.gameObject:SetActive(false)
					end
				end
			end

			local var_50_10 = 0.001

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_10 then
				local var_50_11 = (arg_47_1.time_ - var_50_7) / var_50_10
				local var_50_12 = Vector3.New(0, -390, 150)

				var_50_6.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10030, var_50_12, var_50_11)
			end

			if arg_47_1.time_ >= var_50_7 + var_50_10 and arg_47_1.time_ < var_50_7 + var_50_10 + arg_50_0 then
				var_50_6.localPosition = Vector3.New(0, -390, 150)
			end

			local var_50_13 = 0
			local var_50_14 = 0.75

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_15 = arg_47_1:FormatText(StoryNameCfg[309].name)

				arg_47_1.leftNameTxt_.text = var_50_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_16 = arg_47_1:GetWordFromCfg(115281011)
				local var_50_17 = arg_47_1:FormatText(var_50_16.content)

				arg_47_1.text_.text = var_50_17

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_18 = 30
				local var_50_19 = utf8.len(var_50_17)
				local var_50_20 = var_50_18 <= 0 and var_50_14 or var_50_14 * (var_50_19 / var_50_18)

				if var_50_20 > 0 and var_50_14 < var_50_20 then
					arg_47_1.talkMaxDuration = var_50_20

					if var_50_20 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_13
					end
				end

				arg_47_1.text_.text = var_50_17
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281011", "story_v_out_115281.awb") ~= 0 then
					local var_50_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281011", "story_v_out_115281.awb") / 1000

					if var_50_21 + var_50_13 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_21 + var_50_13
					end

					if var_50_16.prefab_name ~= "" and arg_47_1.actors_[var_50_16.prefab_name] ~= nil then
						local var_50_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_16.prefab_name].transform, "story_v_out_115281", "115281011", "story_v_out_115281.awb")

						arg_47_1:RecordAudio("115281011", var_50_22)
						arg_47_1:RecordAudio("115281011", var_50_22)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_115281", "115281011", "story_v_out_115281.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_115281", "115281011", "story_v_out_115281.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_23 = math.max(var_50_14, arg_47_1.talkMaxDuration)

			if var_50_13 <= arg_47_1.time_ and arg_47_1.time_ < var_50_13 + var_50_23 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_13) / var_50_23

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_13 + var_50_23 and arg_47_1.time_ < var_50_13 + var_50_23 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play115281012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115281012
		arg_51_1.duration_ = 24.633

		local var_51_0 = {
			ja = 24.633,
			ko = 15.1,
			zh = 14.3,
			en = 13.8
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
				arg_51_0:Play115281013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.075

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[309].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(115281012)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281012", "story_v_out_115281.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281012", "story_v_out_115281.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_115281", "115281012", "story_v_out_115281.awb")

						arg_51_1:RecordAudio("115281012", var_54_9)
						arg_51_1:RecordAudio("115281012", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115281", "115281012", "story_v_out_115281.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115281", "115281012", "story_v_out_115281.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play115281013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115281013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play115281014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10030"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps10030 == nil then
				arg_55_1.var_.actorSpriteComps10030 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps10030 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps10030 then
				local var_58_5 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps10030 = nil
			end

			local var_58_6 = arg_55_1.actors_["10030"].transform
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				arg_55_1.var_.moveOldPos10030 = var_58_6.localPosition
				var_58_6.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10030", 3)

				local var_58_8 = var_58_6.childCount

				for iter_58_4 = 0, var_58_8 - 1 do
					local var_58_9 = var_58_6:GetChild(iter_58_4)

					if var_58_9.name == "split_2" or not string.find(var_58_9.name, "split") then
						var_58_9.gameObject:SetActive(true)
					else
						var_58_9.gameObject:SetActive(false)
					end
				end
			end

			local var_58_10 = 0.001

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_7) / var_58_10
				local var_58_12 = Vector3.New(0, -390, 150)

				var_58_6.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10030, var_58_12, var_58_11)
			end

			if arg_55_1.time_ >= var_58_7 + var_58_10 and arg_55_1.time_ < var_58_7 + var_58_10 + arg_58_0 then
				var_58_6.localPosition = Vector3.New(0, -390, 150)
			end

			local var_58_13 = 0
			local var_58_14 = 0.95

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(115281013)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 38
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_14 or var_58_14 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_14 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_13 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_13
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_20 = math.max(var_58_14, arg_55_1.talkMaxDuration)

			if var_58_13 <= arg_55_1.time_ and arg_55_1.time_ < var_58_13 + var_58_20 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_13) / var_58_20

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_13 + var_58_20 and arg_55_1.time_ < var_58_13 + var_58_20 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115281014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 115281014
		arg_59_1.duration_ = 3.533

		local var_59_0 = {
			ja = 3.533,
			ko = 1.933,
			zh = 2.9,
			en = 2.233
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
				arg_59_0:Play115281015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10030"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.actorSpriteComps10030 == nil then
				arg_59_1.var_.actorSpriteComps10030 = var_62_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.actorSpriteComps10030 then
					for iter_62_0, iter_62_1 in pairs(arg_59_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_62_1 then
							local var_62_4 = Mathf.Lerp(iter_62_1.color.r, 1, var_62_3)

							iter_62_1.color = Color.New(var_62_4, var_62_4, var_62_4)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.actorSpriteComps10030 then
				local var_62_5 = 1

				for iter_62_2, iter_62_3 in pairs(arg_59_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_62_3 then
						iter_62_3.color = Color.New(var_62_5, var_62_5, var_62_5)
					end
				end

				arg_59_1.var_.actorSpriteComps10030 = nil
			end

			local var_62_6 = 0
			local var_62_7 = 0.125

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[309].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(115281014)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281014", "story_v_out_115281.awb") ~= 0 then
					local var_62_14 = manager.audio:GetVoiceLength("story_v_out_115281", "115281014", "story_v_out_115281.awb") / 1000

					if var_62_14 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_14 + var_62_6
					end

					if var_62_9.prefab_name ~= "" and arg_59_1.actors_[var_62_9.prefab_name] ~= nil then
						local var_62_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_9.prefab_name].transform, "story_v_out_115281", "115281014", "story_v_out_115281.awb")

						arg_59_1:RecordAudio("115281014", var_62_15)
						arg_59_1:RecordAudio("115281014", var_62_15)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_115281", "115281014", "story_v_out_115281.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_115281", "115281014", "story_v_out_115281.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_16 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_16 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_16

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_16 and arg_59_1.time_ < var_62_6 + var_62_16 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play115281015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 115281015
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play115281016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10030"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				local var_66_2 = var_66_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_66_2 then
					arg_63_1.var_.alphaOldValue10030 = var_66_2.alpha
					arg_63_1.var_.characterEffect10030 = var_66_2
				end

				arg_63_1.var_.alphaOldValue10030 = 1
			end

			local var_66_3 = 0.333333333333333

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_1) / var_66_3
				local var_66_5 = Mathf.Lerp(arg_63_1.var_.alphaOldValue10030, 0, var_66_4)

				if arg_63_1.var_.characterEffect10030 then
					arg_63_1.var_.characterEffect10030.alpha = var_66_5
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_3 and arg_63_1.time_ < var_66_1 + var_66_3 + arg_66_0 and arg_63_1.var_.characterEffect10030 then
				arg_63_1.var_.characterEffect10030.alpha = 0
			end

			local var_66_6 = 0
			local var_66_7 = 1.35

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_8 = arg_63_1:GetWordFromCfg(115281015)
				local var_66_9 = arg_63_1:FormatText(var_66_8.content)

				arg_63_1.text_.text = var_66_9

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_10 = 54
				local var_66_11 = utf8.len(var_66_9)
				local var_66_12 = var_66_10 <= 0 and var_66_7 or var_66_7 * (var_66_11 / var_66_10)

				if var_66_12 > 0 and var_66_7 < var_66_12 then
					arg_63_1.talkMaxDuration = var_66_12

					if var_66_12 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_12 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_9
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_13 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_13 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_13

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_13 and arg_63_1.time_ < var_66_6 + var_66_13 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play115281016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 115281016
		arg_67_1.duration_ = 14.7

		local var_67_0 = {
			ja = 14.7,
			ko = 8.333,
			zh = 8.133,
			en = 11.6
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
				arg_67_0:Play115281017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "ST28a"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 2

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.ST28a

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST28a" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = false

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 2

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(0, 0, 0)

				var_70_19.a = Mathf.Lerp(0, 1, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(0, 0, 0)

				var_70_20.a = 1
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_21 = 2

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = false

				arg_67_1:SetGaussion(false)
			end

			local var_70_22 = 2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Color.New(0, 0, 0)

				var_70_24.a = Mathf.Lerp(1, 0, var_70_23)
				arg_67_1.mask_.color = var_70_24
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				local var_70_25 = Color.New(0, 0, 0)
				local var_70_26 = 0

				arg_67_1.mask_.enabled = false
				var_70_25.a = var_70_26
				arg_67_1.mask_.color = var_70_25
			end

			local var_70_27 = 0

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.screenFilterGo_:SetActive(true)

				arg_67_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_70_28 = 4

			if var_70_27 <= arg_67_1.time_ and arg_67_1.time_ < var_70_27 + var_70_28 then
				local var_70_29 = (arg_67_1.time_ - var_70_27) / var_70_28

				arg_67_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_70_29)
			end

			if arg_67_1.time_ >= var_70_27 + var_70_28 and arg_67_1.time_ < var_70_27 + var_70_28 + arg_70_0 then
				arg_67_1.screenFilterEffect_.weight = 1
			end

			local var_70_30 = "10029"

			if arg_67_1.actors_[var_70_30] == nil then
				local var_70_31 = Object.Instantiate(arg_67_1.imageGo_, arg_67_1.canvasGo_.transform)

				var_70_31.transform:SetSiblingIndex(1)

				var_70_31.name = var_70_30

				local var_70_32 = var_70_31:GetComponent(typeof(Image))

				var_70_32.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_70_30)

				var_70_32:SetNativeSize()

				var_70_31.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_67_1.actors_[var_70_30] = var_70_31
			end

			local var_70_33 = arg_67_1.actors_["10029"].transform
			local var_70_34 = 3.99933333333333

			if var_70_34 < arg_67_1.time_ and arg_67_1.time_ <= var_70_34 + arg_70_0 then
				arg_67_1.var_.moveOldPos10029 = var_70_33.localPosition
				var_70_33.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_70_35 = 0.001

			if var_70_34 <= arg_67_1.time_ and arg_67_1.time_ < var_70_34 + var_70_35 then
				local var_70_36 = (arg_67_1.time_ - var_70_34) / var_70_35
				local var_70_37 = Vector3.New(0, -350, -180)

				var_70_33.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10029, var_70_37, var_70_36)
			end

			if arg_67_1.time_ >= var_70_34 + var_70_35 and arg_67_1.time_ < var_70_34 + var_70_35 + arg_70_0 then
				var_70_33.localPosition = Vector3.New(0, -350, -180)
			end

			local var_70_38 = arg_67_1.actors_["10029"]
			local var_70_39 = 3.69933333333333

			if var_70_39 < arg_67_1.time_ and arg_67_1.time_ <= var_70_39 + arg_70_0 then
				local var_70_40 = var_70_38:GetComponent("Image")

				if var_70_40 then
					arg_67_1.var_.alphaMatValue10029 = var_70_40
					arg_67_1.var_.alphaOldValue10029 = var_70_40.color.a
				end

				arg_67_1.var_.alphaOldValue10029 = 0
			end

			local var_70_41 = 0.334

			if var_70_39 <= arg_67_1.time_ and arg_67_1.time_ < var_70_39 + var_70_41 then
				local var_70_42 = (arg_67_1.time_ - var_70_39) / var_70_41
				local var_70_43 = Mathf.Lerp(arg_67_1.var_.alphaOldValue10029, 1, var_70_42)

				if arg_67_1.var_.alphaMatValue10029 then
					local var_70_44 = arg_67_1.var_.alphaMatValue10029.color

					var_70_44.a = var_70_43
					arg_67_1.var_.alphaMatValue10029.color = var_70_44
				end
			end

			if arg_67_1.time_ >= var_70_39 + var_70_41 and arg_67_1.time_ < var_70_39 + var_70_41 + arg_70_0 and arg_67_1.var_.alphaMatValue10029 then
				local var_70_45 = arg_67_1.var_.alphaMatValue10029
				local var_70_46 = var_70_45.color

				var_70_46.a = 1
				var_70_45.color = var_70_46
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_47 = 4
			local var_70_48 = 0.45

			if var_70_47 < arg_67_1.time_ and arg_67_1.time_ <= var_70_47 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_49 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_49:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_50 = arg_67_1:FormatText(StoryNameCfg[312].name)

				arg_67_1.leftNameTxt_.text = var_70_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_51 = arg_67_1:GetWordFromCfg(115281016)
				local var_70_52 = arg_67_1:FormatText(var_70_51.content)

				arg_67_1.text_.text = var_70_52

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_53 = 18
				local var_70_54 = utf8.len(var_70_52)
				local var_70_55 = var_70_53 <= 0 and var_70_48 or var_70_48 * (var_70_54 / var_70_53)

				if var_70_55 > 0 and var_70_48 < var_70_55 then
					arg_67_1.talkMaxDuration = var_70_55
					var_70_47 = var_70_47 + 0.3

					if var_70_55 + var_70_47 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_55 + var_70_47
					end
				end

				arg_67_1.text_.text = var_70_52
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281016", "story_v_out_115281.awb") ~= 0 then
					local var_70_56 = manager.audio:GetVoiceLength("story_v_out_115281", "115281016", "story_v_out_115281.awb") / 1000

					if var_70_56 + var_70_47 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_56 + var_70_47
					end

					if var_70_51.prefab_name ~= "" and arg_67_1.actors_[var_70_51.prefab_name] ~= nil then
						local var_70_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_51.prefab_name].transform, "story_v_out_115281", "115281016", "story_v_out_115281.awb")

						arg_67_1:RecordAudio("115281016", var_70_57)
						arg_67_1:RecordAudio("115281016", var_70_57)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_115281", "115281016", "story_v_out_115281.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_115281", "115281016", "story_v_out_115281.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_58 = var_70_47 + 0.3
			local var_70_59 = math.max(var_70_48, arg_67_1.talkMaxDuration)

			if var_70_58 <= arg_67_1.time_ and arg_67_1.time_ < var_70_58 + var_70_59 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_58) / var_70_59

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_58 + var_70_59 and arg_67_1.time_ < var_70_58 + var_70_59 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play115281017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 115281017
		arg_73_1.duration_ = 15.366

		local var_73_0 = {
			ja = 15.366,
			ko = 7.5,
			zh = 6.133,
			en = 7.2
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
				arg_73_0:Play115281018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.725

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[312].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(115281017)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281017", "story_v_out_115281.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281017", "story_v_out_115281.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_115281", "115281017", "story_v_out_115281.awb")

						arg_73_1:RecordAudio("115281017", var_76_9)
						arg_73_1:RecordAudio("115281017", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_115281", "115281017", "story_v_out_115281.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_115281", "115281017", "story_v_out_115281.awb")
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
	Play115281018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 115281018
		arg_77_1.duration_ = 12.6

		local var_77_0 = {
			ja = 12.6,
			ko = 9.7,
			zh = 8.833,
			en = 10.733
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
				arg_77_0:Play115281019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 2

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				local var_80_1 = manager.ui.mainCamera.transform.localPosition
				local var_80_2 = Vector3.New(0, 0, 10) + Vector3.New(var_80_1.x, var_80_1.y, 0)
				local var_80_3 = arg_77_1.bgs_.ST27

				var_80_3.transform.localPosition = var_80_2
				var_80_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_80_4 = var_80_3:GetComponent("SpriteRenderer")

				if var_80_4 and var_80_4.sprite then
					local var_80_5 = (var_80_3.transform.localPosition - var_80_1).z
					local var_80_6 = manager.ui.mainCameraCom_
					local var_80_7 = 2 * var_80_5 * Mathf.Tan(var_80_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_80_8 = var_80_7 * var_80_6.aspect
					local var_80_9 = var_80_4.sprite.bounds.size.x
					local var_80_10 = var_80_4.sprite.bounds.size.y
					local var_80_11 = var_80_8 / var_80_9
					local var_80_12 = var_80_7 / var_80_10
					local var_80_13 = var_80_12 < var_80_11 and var_80_11 or var_80_12

					var_80_3.transform.localScale = Vector3.New(var_80_13, var_80_13, 0)
				end

				for iter_80_0, iter_80_1 in pairs(arg_77_1.bgs_) do
					if iter_80_0 ~= "ST27" then
						iter_80_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_15 = 2

			if var_80_14 <= arg_77_1.time_ and arg_77_1.time_ < var_80_14 + var_80_15 then
				local var_80_16 = (arg_77_1.time_ - var_80_14) / var_80_15
				local var_80_17 = Color.New(0, 0, 0)

				var_80_17.a = Mathf.Lerp(0, 1, var_80_16)
				arg_77_1.mask_.color = var_80_17
			end

			if arg_77_1.time_ >= var_80_14 + var_80_15 and arg_77_1.time_ < var_80_14 + var_80_15 + arg_80_0 then
				local var_80_18 = Color.New(0, 0, 0)

				var_80_18.a = 1
				arg_77_1.mask_.color = var_80_18
			end

			local var_80_19 = 2

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_20 = 2

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_20 then
				local var_80_21 = (arg_77_1.time_ - var_80_19) / var_80_20
				local var_80_22 = Color.New(0, 0, 0)

				var_80_22.a = Mathf.Lerp(1, 0, var_80_21)
				arg_77_1.mask_.color = var_80_22
			end

			if arg_77_1.time_ >= var_80_19 + var_80_20 and arg_77_1.time_ < var_80_19 + var_80_20 + arg_80_0 then
				local var_80_23 = Color.New(0, 0, 0)
				local var_80_24 = 0

				arg_77_1.mask_.enabled = false
				var_80_23.a = var_80_24
				arg_77_1.mask_.color = var_80_23
			end

			local var_80_25 = 2

			if var_80_25 < arg_77_1.time_ and arg_77_1.time_ <= var_80_25 + arg_80_0 then
				arg_77_1.screenFilterGo_:SetActive(false)
			end

			local var_80_26 = 0.0166666666666667

			if var_80_25 <= arg_77_1.time_ and arg_77_1.time_ < var_80_25 + var_80_26 then
				local var_80_27 = (arg_77_1.time_ - var_80_25) / var_80_26

				arg_77_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_80_27)
			end

			if arg_77_1.time_ >= var_80_25 + var_80_26 and arg_77_1.time_ < var_80_25 + var_80_26 + arg_80_0 then
				arg_77_1.screenFilterEffect_.weight = 0
			end

			local var_80_28 = arg_77_1.actors_["10029"].transform
			local var_80_29 = 1.99933333333333

			if var_80_29 < arg_77_1.time_ and arg_77_1.time_ <= var_80_29 + arg_80_0 then
				arg_77_1.var_.moveOldPos10029 = var_80_28.localPosition
				var_80_28.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10029", 7)
			end

			local var_80_30 = 0.001

			if var_80_29 <= arg_77_1.time_ and arg_77_1.time_ < var_80_29 + var_80_30 then
				local var_80_31 = (arg_77_1.time_ - var_80_29) / var_80_30
				local var_80_32 = Vector3.New(0, -2000, -180)

				var_80_28.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10029, var_80_32, var_80_31)
			end

			if arg_77_1.time_ >= var_80_29 + var_80_30 and arg_77_1.time_ < var_80_29 + var_80_30 + arg_80_0 then
				var_80_28.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_80_33 = arg_77_1.actors_["10030"].transform
			local var_80_34 = 4

			if var_80_34 < arg_77_1.time_ and arg_77_1.time_ <= var_80_34 + arg_80_0 then
				arg_77_1.var_.moveOldPos10030 = var_80_33.localPosition
				var_80_33.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10030", 3)

				local var_80_35 = var_80_33.childCount

				for iter_80_2 = 0, var_80_35 - 1 do
					local var_80_36 = var_80_33:GetChild(iter_80_2)

					if var_80_36.name == "split_5" or not string.find(var_80_36.name, "split") then
						var_80_36.gameObject:SetActive(true)
					else
						var_80_36.gameObject:SetActive(false)
					end
				end
			end

			local var_80_37 = 0.001

			if var_80_34 <= arg_77_1.time_ and arg_77_1.time_ < var_80_34 + var_80_37 then
				local var_80_38 = (arg_77_1.time_ - var_80_34) / var_80_37
				local var_80_39 = Vector3.New(0, -390, 150)

				var_80_33.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10030, var_80_39, var_80_38)
			end

			if arg_77_1.time_ >= var_80_34 + var_80_37 and arg_77_1.time_ < var_80_34 + var_80_37 + arg_80_0 then
				var_80_33.localPosition = Vector3.New(0, -390, 150)
			end

			local var_80_40 = arg_77_1.actors_["10030"]
			local var_80_41 = 4

			if var_80_41 < arg_77_1.time_ and arg_77_1.time_ <= var_80_41 + arg_80_0 then
				local var_80_42 = var_80_40:GetComponentInChildren(typeof(CanvasGroup))

				if var_80_42 then
					arg_77_1.var_.alphaOldValue10030 = var_80_42.alpha
					arg_77_1.var_.characterEffect10030 = var_80_42
				end

				arg_77_1.var_.alphaOldValue10030 = 0
			end

			local var_80_43 = 0.333333333333333

			if var_80_41 <= arg_77_1.time_ and arg_77_1.time_ < var_80_41 + var_80_43 then
				local var_80_44 = (arg_77_1.time_ - var_80_41) / var_80_43
				local var_80_45 = Mathf.Lerp(arg_77_1.var_.alphaOldValue10030, 1, var_80_44)

				if arg_77_1.var_.characterEffect10030 then
					arg_77_1.var_.characterEffect10030.alpha = var_80_45
				end
			end

			if arg_77_1.time_ >= var_80_41 + var_80_43 and arg_77_1.time_ < var_80_41 + var_80_43 + arg_80_0 and arg_77_1.var_.characterEffect10030 then
				arg_77_1.var_.characterEffect10030.alpha = 1
			end

			if arg_77_1.frameCnt_ <= 1 then
				arg_77_1.dialog_:SetActive(false)
			end

			local var_80_46 = 4
			local var_80_47 = 0.45

			if var_80_46 < arg_77_1.time_ and arg_77_1.time_ <= var_80_46 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_48 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_48:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_49 = arg_77_1:FormatText(StoryNameCfg[309].name)

				arg_77_1.leftNameTxt_.text = var_80_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_50 = arg_77_1:GetWordFromCfg(115281018)
				local var_80_51 = arg_77_1:FormatText(var_80_50.content)

				arg_77_1.text_.text = var_80_51

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_52 = 17
				local var_80_53 = utf8.len(var_80_51)
				local var_80_54 = var_80_52 <= 0 and var_80_47 or var_80_47 * (var_80_53 / var_80_52)

				if var_80_54 > 0 and var_80_47 < var_80_54 then
					arg_77_1.talkMaxDuration = var_80_54
					var_80_46 = var_80_46 + 0.3

					if var_80_54 + var_80_46 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_54 + var_80_46
					end
				end

				arg_77_1.text_.text = var_80_51
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281018", "story_v_out_115281.awb") ~= 0 then
					local var_80_55 = manager.audio:GetVoiceLength("story_v_out_115281", "115281018", "story_v_out_115281.awb") / 1000

					if var_80_55 + var_80_46 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_55 + var_80_46
					end

					if var_80_50.prefab_name ~= "" and arg_77_1.actors_[var_80_50.prefab_name] ~= nil then
						local var_80_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_50.prefab_name].transform, "story_v_out_115281", "115281018", "story_v_out_115281.awb")

						arg_77_1:RecordAudio("115281018", var_80_56)
						arg_77_1:RecordAudio("115281018", var_80_56)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_115281", "115281018", "story_v_out_115281.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_115281", "115281018", "story_v_out_115281.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_57 = var_80_46 + 0.3
			local var_80_58 = math.max(var_80_47, arg_77_1.talkMaxDuration)

			if var_80_57 <= arg_77_1.time_ and arg_77_1.time_ < var_80_57 + var_80_58 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_57) / var_80_58

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_57 + var_80_58 and arg_77_1.time_ < var_80_57 + var_80_58 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play115281019 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 115281019
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play115281020(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10030"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				local var_86_2 = var_86_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_86_2 then
					arg_83_1.var_.alphaOldValue10030 = var_86_2.alpha
					arg_83_1.var_.characterEffect10030 = var_86_2
				end

				arg_83_1.var_.alphaOldValue10030 = 1
			end

			local var_86_3 = 0.333333333333333

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_3 then
				local var_86_4 = (arg_83_1.time_ - var_86_1) / var_86_3
				local var_86_5 = Mathf.Lerp(arg_83_1.var_.alphaOldValue10030, 0, var_86_4)

				if arg_83_1.var_.characterEffect10030 then
					arg_83_1.var_.characterEffect10030.alpha = var_86_5
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_3 and arg_83_1.time_ < var_86_1 + var_86_3 + arg_86_0 and arg_83_1.var_.characterEffect10030 then
				arg_83_1.var_.characterEffect10030.alpha = 0
			end

			local var_86_6 = 0
			local var_86_7 = 1.125

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_8 = arg_83_1:GetWordFromCfg(115281019)
				local var_86_9 = arg_83_1:FormatText(var_86_8.content)

				arg_83_1.text_.text = var_86_9

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_10 = 45
				local var_86_11 = utf8.len(var_86_9)
				local var_86_12 = var_86_10 <= 0 and var_86_7 or var_86_7 * (var_86_11 / var_86_10)

				if var_86_12 > 0 and var_86_7 < var_86_12 then
					arg_83_1.talkMaxDuration = var_86_12

					if var_86_12 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_9
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_13 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_13 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_13

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_13 and arg_83_1.time_ < var_86_6 + var_86_13 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play115281020 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115281020
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play115281021(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.95

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_2 = arg_87_1:GetWordFromCfg(115281020)
				local var_90_3 = arg_87_1:FormatText(var_90_2.content)

				arg_87_1.text_.text = var_90_3

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_4 = 38
				local var_90_5 = utf8.len(var_90_3)
				local var_90_6 = var_90_4 <= 0 and var_90_1 or var_90_1 * (var_90_5 / var_90_4)

				if var_90_6 > 0 and var_90_1 < var_90_6 then
					arg_87_1.talkMaxDuration = var_90_6

					if var_90_6 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_6 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_3
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_7 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_7 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_7

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_7 and arg_87_1.time_ < var_90_0 + var_90_7 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play115281021 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 115281021
		arg_91_1.duration_ = 6.433

		local var_91_0 = {
			ja = 6.3,
			ko = 3.6,
			zh = 5.466,
			en = 6.433
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
				arg_91_0:Play115281022(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10029"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos10029 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)

				arg_91_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(-390, -350, -180)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos10029, var_94_4, var_94_3)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_94_5 = arg_91_1.actors_["10029"]
			local var_94_6 = 0

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				local var_94_7 = var_94_5:GetComponent("Image")

				if var_94_7 then
					arg_91_1.var_.alphaMatValue10029 = var_94_7
					arg_91_1.var_.alphaOldValue10029 = var_94_7.color.a
				end

				arg_91_1.var_.alphaOldValue10029 = 0
			end

			local var_94_8 = 0.333333333333333

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_6) / var_94_8
				local var_94_10 = Mathf.Lerp(arg_91_1.var_.alphaOldValue10029, 1, var_94_9)

				if arg_91_1.var_.alphaMatValue10029 then
					local var_94_11 = arg_91_1.var_.alphaMatValue10029.color

					var_94_11.a = var_94_10
					arg_91_1.var_.alphaMatValue10029.color = var_94_11
				end
			end

			if arg_91_1.time_ >= var_94_6 + var_94_8 and arg_91_1.time_ < var_94_6 + var_94_8 + arg_94_0 and arg_91_1.var_.alphaMatValue10029 then
				local var_94_12 = arg_91_1.var_.alphaMatValue10029
				local var_94_13 = var_94_12.color

				var_94_13.a = 1
				var_94_12.color = var_94_13
			end

			local var_94_14 = 0
			local var_94_15 = 0.425

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_16 = arg_91_1:FormatText(StoryNameCfg[312].name)

				arg_91_1.leftNameTxt_.text = var_94_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(115281021)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 17
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_15 or var_94_15 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_15 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_14
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281021", "story_v_out_115281.awb") ~= 0 then
					local var_94_22 = manager.audio:GetVoiceLength("story_v_out_115281", "115281021", "story_v_out_115281.awb") / 1000

					if var_94_22 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_14
					end

					if var_94_17.prefab_name ~= "" and arg_91_1.actors_[var_94_17.prefab_name] ~= nil then
						local var_94_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_17.prefab_name].transform, "story_v_out_115281", "115281021", "story_v_out_115281.awb")

						arg_91_1:RecordAudio("115281021", var_94_23)
						arg_91_1:RecordAudio("115281021", var_94_23)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_115281", "115281021", "story_v_out_115281.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_115281", "115281021", "story_v_out_115281.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_24 = math.max(var_94_15, arg_91_1.talkMaxDuration)

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_24 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_14) / var_94_24

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_14 + var_94_24 and arg_91_1.time_ < var_94_14 + var_94_24 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play115281022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 115281022
		arg_95_1.duration_ = 10.833

		local var_95_0 = {
			ja = 10.833,
			ko = 5.033,
			zh = 5.6,
			en = 6.1
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
				arg_95_0:Play115281023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10030"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10030 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10030", 4)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_2" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(390, -390, 150)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10030, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_98_7 = arg_95_1.actors_["10029"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 then
				local var_98_9 = var_98_7:GetComponent("Image")

				if var_98_9 then
					arg_95_1.var_.highlightMatValue10029 = var_98_9
				end
			end

			local var_98_10 = 0.2

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_10 then
				local var_98_11 = (arg_95_1.time_ - var_98_8) / var_98_10

				if arg_95_1.var_.highlightMatValue10029 then
					local var_98_12 = Mathf.Lerp(1, 0.5, var_98_11)
					local var_98_13 = arg_95_1.var_.highlightMatValue10029
					local var_98_14 = var_98_13.color

					var_98_14.r = var_98_12
					var_98_14.g = var_98_12
					var_98_14.b = var_98_12
					var_98_13.color = var_98_14
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_10 and arg_95_1.time_ < var_98_8 + var_98_10 + arg_98_0 and arg_95_1.var_.highlightMatValue10029 then
				local var_98_15 = 0.5
				local var_98_16 = arg_95_1.var_.highlightMatValue10029
				local var_98_17 = var_98_16.color

				var_98_17.r = var_98_15
				var_98_17.g = var_98_15
				var_98_17.b = var_98_15
				var_98_16.color = var_98_17
			end

			local var_98_18 = arg_95_1.actors_["10030"]
			local var_98_19 = 0

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				local var_98_20 = var_98_18:GetComponentInChildren(typeof(CanvasGroup))

				if var_98_20 then
					arg_95_1.var_.alphaOldValue10030 = var_98_20.alpha
					arg_95_1.var_.characterEffect10030 = var_98_20
				end

				arg_95_1.var_.alphaOldValue10030 = 0
			end

			local var_98_21 = 0.333333333333333

			if var_98_19 <= arg_95_1.time_ and arg_95_1.time_ < var_98_19 + var_98_21 then
				local var_98_22 = (arg_95_1.time_ - var_98_19) / var_98_21
				local var_98_23 = Mathf.Lerp(arg_95_1.var_.alphaOldValue10030, 1, var_98_22)

				if arg_95_1.var_.characterEffect10030 then
					arg_95_1.var_.characterEffect10030.alpha = var_98_23
				end
			end

			if arg_95_1.time_ >= var_98_19 + var_98_21 and arg_95_1.time_ < var_98_19 + var_98_21 + arg_98_0 and arg_95_1.var_.characterEffect10030 then
				arg_95_1.var_.characterEffect10030.alpha = 1
			end

			local var_98_24 = 0
			local var_98_25 = 0.6

			if var_98_24 < arg_95_1.time_ and arg_95_1.time_ <= var_98_24 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_26 = arg_95_1:FormatText(StoryNameCfg[309].name)

				arg_95_1.leftNameTxt_.text = var_98_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_27 = arg_95_1:GetWordFromCfg(115281022)
				local var_98_28 = arg_95_1:FormatText(var_98_27.content)

				arg_95_1.text_.text = var_98_28

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_29 = 24
				local var_98_30 = utf8.len(var_98_28)
				local var_98_31 = var_98_29 <= 0 and var_98_25 or var_98_25 * (var_98_30 / var_98_29)

				if var_98_31 > 0 and var_98_25 < var_98_31 then
					arg_95_1.talkMaxDuration = var_98_31

					if var_98_31 + var_98_24 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_31 + var_98_24
					end
				end

				arg_95_1.text_.text = var_98_28
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281022", "story_v_out_115281.awb") ~= 0 then
					local var_98_32 = manager.audio:GetVoiceLength("story_v_out_115281", "115281022", "story_v_out_115281.awb") / 1000

					if var_98_32 + var_98_24 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_32 + var_98_24
					end

					if var_98_27.prefab_name ~= "" and arg_95_1.actors_[var_98_27.prefab_name] ~= nil then
						local var_98_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_27.prefab_name].transform, "story_v_out_115281", "115281022", "story_v_out_115281.awb")

						arg_95_1:RecordAudio("115281022", var_98_33)
						arg_95_1:RecordAudio("115281022", var_98_33)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_115281", "115281022", "story_v_out_115281.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_115281", "115281022", "story_v_out_115281.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_34 = math.max(var_98_25, arg_95_1.talkMaxDuration)

			if var_98_24 <= arg_95_1.time_ and arg_95_1.time_ < var_98_24 + var_98_34 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_24) / var_98_34

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_24 + var_98_34 and arg_95_1.time_ < var_98_24 + var_98_34 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play115281023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 115281023
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play115281024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10030"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps10030 == nil then
				arg_99_1.var_.actorSpriteComps10030 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps10030 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 0.5, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps10030 then
				local var_102_5 = 0.5

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps10030 = nil
			end

			local var_102_6 = 0
			local var_102_7 = 0.875

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_8 = arg_99_1:GetWordFromCfg(115281023)
				local var_102_9 = arg_99_1:FormatText(var_102_8.content)

				arg_99_1.text_.text = var_102_9

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_10 = 35
				local var_102_11 = utf8.len(var_102_9)
				local var_102_12 = var_102_10 <= 0 and var_102_7 or var_102_7 * (var_102_11 / var_102_10)

				if var_102_12 > 0 and var_102_7 < var_102_12 then
					arg_99_1.talkMaxDuration = var_102_12

					if var_102_12 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_12 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_9
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_13 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_13 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_13

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_13 and arg_99_1.time_ < var_102_6 + var_102_13 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play115281024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 115281024
		arg_103_1.duration_ = 6.733

		local var_103_0 = {
			ja = 6,
			ko = 4.666,
			zh = 4.933,
			en = 6.733
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
				arg_103_0:Play115281025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10029"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				local var_106_2 = var_106_0:GetComponent("Image")

				if var_106_2 then
					arg_103_1.var_.highlightMatValue10029 = var_106_2
				end
			end

			local var_106_3 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_3 then
				local var_106_4 = (arg_103_1.time_ - var_106_1) / var_106_3

				if arg_103_1.var_.highlightMatValue10029 then
					local var_106_5 = Mathf.Lerp(0.5, 1, var_106_4)
					local var_106_6 = arg_103_1.var_.highlightMatValue10029
					local var_106_7 = var_106_6.color

					var_106_7.r = var_106_5
					var_106_7.g = var_106_5
					var_106_7.b = var_106_5
					var_106_6.color = var_106_7
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_3 and arg_103_1.time_ < var_106_1 + var_106_3 + arg_106_0 and arg_103_1.var_.highlightMatValue10029 then
				local var_106_8 = 1

				var_106_0.transform:SetSiblingIndex(1)

				local var_106_9 = arg_103_1.var_.highlightMatValue10029
				local var_106_10 = var_106_9.color

				var_106_10.r = var_106_8
				var_106_10.g = var_106_8
				var_106_10.b = var_106_8
				var_106_9.color = var_106_10
			end

			local var_106_11 = 0
			local var_106_12 = 0.6

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_13 = arg_103_1:FormatText(StoryNameCfg[312].name)

				arg_103_1.leftNameTxt_.text = var_106_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_14 = arg_103_1:GetWordFromCfg(115281024)
				local var_106_15 = arg_103_1:FormatText(var_106_14.content)

				arg_103_1.text_.text = var_106_15

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_16 = 21
				local var_106_17 = utf8.len(var_106_15)
				local var_106_18 = var_106_16 <= 0 and var_106_12 or var_106_12 * (var_106_17 / var_106_16)

				if var_106_18 > 0 and var_106_12 < var_106_18 then
					arg_103_1.talkMaxDuration = var_106_18

					if var_106_18 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_11
					end
				end

				arg_103_1.text_.text = var_106_15
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281024", "story_v_out_115281.awb") ~= 0 then
					local var_106_19 = manager.audio:GetVoiceLength("story_v_out_115281", "115281024", "story_v_out_115281.awb") / 1000

					if var_106_19 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_11
					end

					if var_106_14.prefab_name ~= "" and arg_103_1.actors_[var_106_14.prefab_name] ~= nil then
						local var_106_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_14.prefab_name].transform, "story_v_out_115281", "115281024", "story_v_out_115281.awb")

						arg_103_1:RecordAudio("115281024", var_106_20)
						arg_103_1:RecordAudio("115281024", var_106_20)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_115281", "115281024", "story_v_out_115281.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_115281", "115281024", "story_v_out_115281.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_21 = math.max(var_106_12, arg_103_1.talkMaxDuration)

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_21 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_11) / var_106_21

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_11 + var_106_21 and arg_103_1.time_ < var_106_11 + var_106_21 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play115281025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 115281025
		arg_107_1.duration_ = 10.733

		local var_107_0 = {
			ja = 7,
			ko = 8.533,
			zh = 8.366,
			en = 10.733
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
				arg_107_0:Play115281026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10030"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10030 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10030", 4)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_2" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(390, -390, 150)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10030, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_110_7 = arg_107_1.actors_["10029"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 then
				local var_110_9 = var_110_7:GetComponent("Image")

				if var_110_9 then
					arg_107_1.var_.highlightMatValue10029 = var_110_9
				end
			end

			local var_110_10 = 0.2

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_10 then
				local var_110_11 = (arg_107_1.time_ - var_110_8) / var_110_10

				if arg_107_1.var_.highlightMatValue10029 then
					local var_110_12 = Mathf.Lerp(1, 0.5, var_110_11)
					local var_110_13 = arg_107_1.var_.highlightMatValue10029
					local var_110_14 = var_110_13.color

					var_110_14.r = var_110_12
					var_110_14.g = var_110_12
					var_110_14.b = var_110_12
					var_110_13.color = var_110_14
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_10 and arg_107_1.time_ < var_110_8 + var_110_10 + arg_110_0 and arg_107_1.var_.highlightMatValue10029 then
				local var_110_15 = 0.5
				local var_110_16 = arg_107_1.var_.highlightMatValue10029
				local var_110_17 = var_110_16.color

				var_110_17.r = var_110_15
				var_110_17.g = var_110_15
				var_110_17.b = var_110_15
				var_110_16.color = var_110_17
			end

			local var_110_18 = arg_107_1.actors_["10030"]
			local var_110_19 = 0

			if var_110_19 < arg_107_1.time_ and arg_107_1.time_ <= var_110_19 + arg_110_0 and arg_107_1.var_.actorSpriteComps10030 == nil then
				arg_107_1.var_.actorSpriteComps10030 = var_110_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_20 = 0.2

			if var_110_19 <= arg_107_1.time_ and arg_107_1.time_ < var_110_19 + var_110_20 then
				local var_110_21 = (arg_107_1.time_ - var_110_19) / var_110_20

				if arg_107_1.var_.actorSpriteComps10030 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_110_2 then
							local var_110_22 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_21)

							iter_110_2.color = Color.New(var_110_22, var_110_22, var_110_22)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_19 + var_110_20 and arg_107_1.time_ < var_110_19 + var_110_20 + arg_110_0 and arg_107_1.var_.actorSpriteComps10030 then
				local var_110_23 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_23, var_110_23, var_110_23)
					end
				end

				arg_107_1.var_.actorSpriteComps10030 = nil
			end

			local var_110_24 = 0
			local var_110_25 = 0.925

			if var_110_24 < arg_107_1.time_ and arg_107_1.time_ <= var_110_24 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_26 = arg_107_1:FormatText(StoryNameCfg[309].name)

				arg_107_1.leftNameTxt_.text = var_110_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_27 = arg_107_1:GetWordFromCfg(115281025)
				local var_110_28 = arg_107_1:FormatText(var_110_27.content)

				arg_107_1.text_.text = var_110_28

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_29 = 37
				local var_110_30 = utf8.len(var_110_28)
				local var_110_31 = var_110_29 <= 0 and var_110_25 or var_110_25 * (var_110_30 / var_110_29)

				if var_110_31 > 0 and var_110_25 < var_110_31 then
					arg_107_1.talkMaxDuration = var_110_31

					if var_110_31 + var_110_24 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_31 + var_110_24
					end
				end

				arg_107_1.text_.text = var_110_28
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281025", "story_v_out_115281.awb") ~= 0 then
					local var_110_32 = manager.audio:GetVoiceLength("story_v_out_115281", "115281025", "story_v_out_115281.awb") / 1000

					if var_110_32 + var_110_24 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_32 + var_110_24
					end

					if var_110_27.prefab_name ~= "" and arg_107_1.actors_[var_110_27.prefab_name] ~= nil then
						local var_110_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_27.prefab_name].transform, "story_v_out_115281", "115281025", "story_v_out_115281.awb")

						arg_107_1:RecordAudio("115281025", var_110_33)
						arg_107_1:RecordAudio("115281025", var_110_33)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_115281", "115281025", "story_v_out_115281.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_115281", "115281025", "story_v_out_115281.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_34 = math.max(var_110_25, arg_107_1.talkMaxDuration)

			if var_110_24 <= arg_107_1.time_ and arg_107_1.time_ < var_110_24 + var_110_34 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_24) / var_110_34

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_24 + var_110_34 and arg_107_1.time_ < var_110_24 + var_110_34 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play115281026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 115281026
		arg_111_1.duration_ = 12.2

		local var_111_0 = {
			ja = 12.2,
			ko = 9.733,
			zh = 8.066,
			en = 10.9
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
				arg_111_0:Play115281027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10029"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				local var_114_2 = var_114_0:GetComponent("Image")

				if var_114_2 then
					arg_111_1.var_.highlightMatValue10029 = var_114_2
				end
			end

			local var_114_3 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_3 then
				local var_114_4 = (arg_111_1.time_ - var_114_1) / var_114_3

				if arg_111_1.var_.highlightMatValue10029 then
					local var_114_5 = Mathf.Lerp(0.5, 1, var_114_4)
					local var_114_6 = arg_111_1.var_.highlightMatValue10029
					local var_114_7 = var_114_6.color

					var_114_7.r = var_114_5
					var_114_7.g = var_114_5
					var_114_7.b = var_114_5
					var_114_6.color = var_114_7
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_3 and arg_111_1.time_ < var_114_1 + var_114_3 + arg_114_0 and arg_111_1.var_.highlightMatValue10029 then
				local var_114_8 = 1

				var_114_0.transform:SetSiblingIndex(1)

				local var_114_9 = arg_111_1.var_.highlightMatValue10029
				local var_114_10 = var_114_9.color

				var_114_10.r = var_114_8
				var_114_10.g = var_114_8
				var_114_10.b = var_114_8
				var_114_9.color = var_114_10
			end

			local var_114_11 = arg_111_1.actors_["10030"]
			local var_114_12 = 0

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 and arg_111_1.var_.actorSpriteComps10030 == nil then
				arg_111_1.var_.actorSpriteComps10030 = var_114_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_13 = 0.2

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_13 then
				local var_114_14 = (arg_111_1.time_ - var_114_12) / var_114_13

				if arg_111_1.var_.actorSpriteComps10030 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_114_1 then
							local var_114_15 = Mathf.Lerp(iter_114_1.color.r, 0.5, var_114_14)

							iter_114_1.color = Color.New(var_114_15, var_114_15, var_114_15)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_12 + var_114_13 and arg_111_1.time_ < var_114_12 + var_114_13 + arg_114_0 and arg_111_1.var_.actorSpriteComps10030 then
				local var_114_16 = 0.5

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_16, var_114_16, var_114_16)
					end
				end

				arg_111_1.var_.actorSpriteComps10030 = nil
			end

			local var_114_17 = 0
			local var_114_18 = 0.9

			if var_114_17 < arg_111_1.time_ and arg_111_1.time_ <= var_114_17 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_19 = arg_111_1:FormatText(StoryNameCfg[312].name)

				arg_111_1.leftNameTxt_.text = var_114_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_20 = arg_111_1:GetWordFromCfg(115281026)
				local var_114_21 = arg_111_1:FormatText(var_114_20.content)

				arg_111_1.text_.text = var_114_21

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_22 = 36
				local var_114_23 = utf8.len(var_114_21)
				local var_114_24 = var_114_22 <= 0 and var_114_18 or var_114_18 * (var_114_23 / var_114_22)

				if var_114_24 > 0 and var_114_18 < var_114_24 then
					arg_111_1.talkMaxDuration = var_114_24

					if var_114_24 + var_114_17 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_24 + var_114_17
					end
				end

				arg_111_1.text_.text = var_114_21
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281026", "story_v_out_115281.awb") ~= 0 then
					local var_114_25 = manager.audio:GetVoiceLength("story_v_out_115281", "115281026", "story_v_out_115281.awb") / 1000

					if var_114_25 + var_114_17 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_25 + var_114_17
					end

					if var_114_20.prefab_name ~= "" and arg_111_1.actors_[var_114_20.prefab_name] ~= nil then
						local var_114_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_20.prefab_name].transform, "story_v_out_115281", "115281026", "story_v_out_115281.awb")

						arg_111_1:RecordAudio("115281026", var_114_26)
						arg_111_1:RecordAudio("115281026", var_114_26)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_115281", "115281026", "story_v_out_115281.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_115281", "115281026", "story_v_out_115281.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_27 = math.max(var_114_18, arg_111_1.talkMaxDuration)

			if var_114_17 <= arg_111_1.time_ and arg_111_1.time_ < var_114_17 + var_114_27 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_17) / var_114_27

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_17 + var_114_27 and arg_111_1.time_ < var_114_17 + var_114_27 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play115281027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 115281027
		arg_115_1.duration_ = 10.333

		local var_115_0 = {
			ja = 10.333,
			ko = 9.333,
			zh = 7.733,
			en = 7.533
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
				arg_115_0:Play115281028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10029"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				local var_118_2 = var_118_0:GetComponent("Image")

				if var_118_2 then
					arg_115_1.var_.highlightMatValue10029 = var_118_2
				end
			end

			local var_118_3 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_3 then
				local var_118_4 = (arg_115_1.time_ - var_118_1) / var_118_3

				if arg_115_1.var_.highlightMatValue10029 then
					local var_118_5 = Mathf.Lerp(1, 0.5, var_118_4)
					local var_118_6 = arg_115_1.var_.highlightMatValue10029
					local var_118_7 = var_118_6.color

					var_118_7.r = var_118_5
					var_118_7.g = var_118_5
					var_118_7.b = var_118_5
					var_118_6.color = var_118_7
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_3 and arg_115_1.time_ < var_118_1 + var_118_3 + arg_118_0 and arg_115_1.var_.highlightMatValue10029 then
				local var_118_8 = 0.5
				local var_118_9 = arg_115_1.var_.highlightMatValue10029
				local var_118_10 = var_118_9.color

				var_118_10.r = var_118_8
				var_118_10.g = var_118_8
				var_118_10.b = var_118_8
				var_118_9.color = var_118_10
			end

			local var_118_11 = arg_115_1.actors_["10030"]
			local var_118_12 = 0

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 and arg_115_1.var_.actorSpriteComps10030 == nil then
				arg_115_1.var_.actorSpriteComps10030 = var_118_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_13 = 0.2

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_13 then
				local var_118_14 = (arg_115_1.time_ - var_118_12) / var_118_13

				if arg_115_1.var_.actorSpriteComps10030 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_118_1 then
							local var_118_15 = Mathf.Lerp(iter_118_1.color.r, 1, var_118_14)

							iter_118_1.color = Color.New(var_118_15, var_118_15, var_118_15)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_12 + var_118_13 and arg_115_1.time_ < var_118_12 + var_118_13 + arg_118_0 and arg_115_1.var_.actorSpriteComps10030 then
				local var_118_16 = 1

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_16, var_118_16, var_118_16)
					end
				end

				arg_115_1.var_.actorSpriteComps10030 = nil
			end

			local var_118_17 = arg_115_1.actors_["10030"].transform
			local var_118_18 = 0

			if var_118_18 < arg_115_1.time_ and arg_115_1.time_ <= var_118_18 + arg_118_0 then
				arg_115_1.var_.moveOldPos10030 = var_118_17.localPosition
				var_118_17.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("10030", 4)

				local var_118_19 = var_118_17.childCount

				for iter_118_4 = 0, var_118_19 - 1 do
					local var_118_20 = var_118_17:GetChild(iter_118_4)

					if var_118_20.name == "split_3" or not string.find(var_118_20.name, "split") then
						var_118_20.gameObject:SetActive(true)
					else
						var_118_20.gameObject:SetActive(false)
					end
				end
			end

			local var_118_21 = 0.001

			if var_118_18 <= arg_115_1.time_ and arg_115_1.time_ < var_118_18 + var_118_21 then
				local var_118_22 = (arg_115_1.time_ - var_118_18) / var_118_21
				local var_118_23 = Vector3.New(390, -390, 150)

				var_118_17.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10030, var_118_23, var_118_22)
			end

			if arg_115_1.time_ >= var_118_18 + var_118_21 and arg_115_1.time_ < var_118_18 + var_118_21 + arg_118_0 then
				var_118_17.localPosition = Vector3.New(390, -390, 150)
			end

			local var_118_24 = 0
			local var_118_25 = 0.75

			if var_118_24 < arg_115_1.time_ and arg_115_1.time_ <= var_118_24 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_26 = arg_115_1:FormatText(StoryNameCfg[309].name)

				arg_115_1.leftNameTxt_.text = var_118_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_27 = arg_115_1:GetWordFromCfg(115281027)
				local var_118_28 = arg_115_1:FormatText(var_118_27.content)

				arg_115_1.text_.text = var_118_28

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_29 = 30
				local var_118_30 = utf8.len(var_118_28)
				local var_118_31 = var_118_29 <= 0 and var_118_25 or var_118_25 * (var_118_30 / var_118_29)

				if var_118_31 > 0 and var_118_25 < var_118_31 then
					arg_115_1.talkMaxDuration = var_118_31

					if var_118_31 + var_118_24 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_31 + var_118_24
					end
				end

				arg_115_1.text_.text = var_118_28
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281027", "story_v_out_115281.awb") ~= 0 then
					local var_118_32 = manager.audio:GetVoiceLength("story_v_out_115281", "115281027", "story_v_out_115281.awb") / 1000

					if var_118_32 + var_118_24 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_32 + var_118_24
					end

					if var_118_27.prefab_name ~= "" and arg_115_1.actors_[var_118_27.prefab_name] ~= nil then
						local var_118_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_27.prefab_name].transform, "story_v_out_115281", "115281027", "story_v_out_115281.awb")

						arg_115_1:RecordAudio("115281027", var_118_33)
						arg_115_1:RecordAudio("115281027", var_118_33)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_115281", "115281027", "story_v_out_115281.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_115281", "115281027", "story_v_out_115281.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_34 = math.max(var_118_25, arg_115_1.talkMaxDuration)

			if var_118_24 <= arg_115_1.time_ and arg_115_1.time_ < var_118_24 + var_118_34 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_24) / var_118_34

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_24 + var_118_34 and arg_115_1.time_ < var_118_24 + var_118_34 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play115281028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 115281028
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play115281029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10029"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				local var_122_2 = var_122_0:GetComponent("Image")

				if var_122_2 then
					arg_119_1.var_.alphaMatValue10029 = var_122_2
					arg_119_1.var_.alphaOldValue10029 = var_122_2.color.a
				end

				arg_119_1.var_.alphaOldValue10029 = 1
			end

			local var_122_3 = 0.333333333333333

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_3 then
				local var_122_4 = (arg_119_1.time_ - var_122_1) / var_122_3
				local var_122_5 = Mathf.Lerp(arg_119_1.var_.alphaOldValue10029, 0, var_122_4)

				if arg_119_1.var_.alphaMatValue10029 then
					local var_122_6 = arg_119_1.var_.alphaMatValue10029.color

					var_122_6.a = var_122_5
					arg_119_1.var_.alphaMatValue10029.color = var_122_6
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_3 and arg_119_1.time_ < var_122_1 + var_122_3 + arg_122_0 and arg_119_1.var_.alphaMatValue10029 then
				local var_122_7 = arg_119_1.var_.alphaMatValue10029
				local var_122_8 = var_122_7.color

				var_122_8.a = 0
				var_122_7.color = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["10030"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				local var_122_11 = var_122_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_122_11 then
					arg_119_1.var_.alphaOldValue10030 = var_122_11.alpha
					arg_119_1.var_.characterEffect10030 = var_122_11
				end

				arg_119_1.var_.alphaOldValue10030 = 1
			end

			local var_122_12 = 0.333333333333333

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_12 then
				local var_122_13 = (arg_119_1.time_ - var_122_10) / var_122_12
				local var_122_14 = Mathf.Lerp(arg_119_1.var_.alphaOldValue10030, 0, var_122_13)

				if arg_119_1.var_.characterEffect10030 then
					arg_119_1.var_.characterEffect10030.alpha = var_122_14
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_12 and arg_119_1.time_ < var_122_10 + var_122_12 + arg_122_0 and arg_119_1.var_.characterEffect10030 then
				arg_119_1.var_.characterEffect10030.alpha = 0
			end

			local var_122_15 = 0
			local var_122_16 = 0.5

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_17 = arg_119_1:GetWordFromCfg(115281028)
				local var_122_18 = arg_119_1:FormatText(var_122_17.content)

				arg_119_1.text_.text = var_122_18

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_19 = 20
				local var_122_20 = utf8.len(var_122_18)
				local var_122_21 = var_122_19 <= 0 and var_122_16 or var_122_16 * (var_122_20 / var_122_19)

				if var_122_21 > 0 and var_122_16 < var_122_21 then
					arg_119_1.talkMaxDuration = var_122_21

					if var_122_21 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_18
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_22 and arg_119_1.time_ < var_122_15 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play115281029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 115281029
		arg_123_1.duration_ = 13.2

		local var_123_0 = {
			ja = 11.466,
			ko = 11.3,
			zh = 11.933,
			en = 13.2
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
				arg_123_0:Play115281030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10029"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos10029 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -350, -180)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10029, var_126_4, var_126_3)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_126_5 = arg_123_1.actors_["10029"]
			local var_126_6 = 0

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				local var_126_7 = var_126_5:GetComponent("Image")

				if var_126_7 then
					arg_123_1.var_.highlightMatValue10029 = var_126_7
				end
			end

			local var_126_8 = 0.2

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_6) / var_126_8

				if arg_123_1.var_.highlightMatValue10029 then
					local var_126_10 = Mathf.Lerp(0.5, 1, var_126_9)
					local var_126_11 = arg_123_1.var_.highlightMatValue10029
					local var_126_12 = var_126_11.color

					var_126_12.r = var_126_10
					var_126_12.g = var_126_10
					var_126_12.b = var_126_10
					var_126_11.color = var_126_12
				end
			end

			if arg_123_1.time_ >= var_126_6 + var_126_8 and arg_123_1.time_ < var_126_6 + var_126_8 + arg_126_0 and arg_123_1.var_.highlightMatValue10029 then
				local var_126_13 = 1

				var_126_5.transform:SetSiblingIndex(1)

				local var_126_14 = arg_123_1.var_.highlightMatValue10029
				local var_126_15 = var_126_14.color

				var_126_15.r = var_126_13
				var_126_15.g = var_126_13
				var_126_15.b = var_126_13
				var_126_14.color = var_126_15
			end

			local var_126_16 = arg_123_1.actors_["10029"]
			local var_126_17 = 0

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				local var_126_18 = var_126_16:GetComponent("Image")

				if var_126_18 then
					arg_123_1.var_.alphaMatValue10029 = var_126_18
					arg_123_1.var_.alphaOldValue10029 = var_126_18.color.a
				end

				arg_123_1.var_.alphaOldValue10029 = 0
			end

			local var_126_19 = 0.333333333333333

			if var_126_17 <= arg_123_1.time_ and arg_123_1.time_ < var_126_17 + var_126_19 then
				local var_126_20 = (arg_123_1.time_ - var_126_17) / var_126_19
				local var_126_21 = Mathf.Lerp(arg_123_1.var_.alphaOldValue10029, 1, var_126_20)

				if arg_123_1.var_.alphaMatValue10029 then
					local var_126_22 = arg_123_1.var_.alphaMatValue10029.color

					var_126_22.a = var_126_21
					arg_123_1.var_.alphaMatValue10029.color = var_126_22
				end
			end

			if arg_123_1.time_ >= var_126_17 + var_126_19 and arg_123_1.time_ < var_126_17 + var_126_19 + arg_126_0 and arg_123_1.var_.alphaMatValue10029 then
				local var_126_23 = arg_123_1.var_.alphaMatValue10029
				local var_126_24 = var_126_23.color

				var_126_24.a = 1
				var_126_23.color = var_126_24
			end

			local var_126_25 = 0
			local var_126_26 = 1.15

			if var_126_25 < arg_123_1.time_ and arg_123_1.time_ <= var_126_25 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_27 = arg_123_1:FormatText(StoryNameCfg[312].name)

				arg_123_1.leftNameTxt_.text = var_126_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_28 = arg_123_1:GetWordFromCfg(115281029)
				local var_126_29 = arg_123_1:FormatText(var_126_28.content)

				arg_123_1.text_.text = var_126_29

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_30 = 46
				local var_126_31 = utf8.len(var_126_29)
				local var_126_32 = var_126_30 <= 0 and var_126_26 or var_126_26 * (var_126_31 / var_126_30)

				if var_126_32 > 0 and var_126_26 < var_126_32 then
					arg_123_1.talkMaxDuration = var_126_32

					if var_126_32 + var_126_25 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_32 + var_126_25
					end
				end

				arg_123_1.text_.text = var_126_29
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281029", "story_v_out_115281.awb") ~= 0 then
					local var_126_33 = manager.audio:GetVoiceLength("story_v_out_115281", "115281029", "story_v_out_115281.awb") / 1000

					if var_126_33 + var_126_25 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_33 + var_126_25
					end

					if var_126_28.prefab_name ~= "" and arg_123_1.actors_[var_126_28.prefab_name] ~= nil then
						local var_126_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_28.prefab_name].transform, "story_v_out_115281", "115281029", "story_v_out_115281.awb")

						arg_123_1:RecordAudio("115281029", var_126_34)
						arg_123_1:RecordAudio("115281029", var_126_34)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_115281", "115281029", "story_v_out_115281.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_115281", "115281029", "story_v_out_115281.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_35 = math.max(var_126_26, arg_123_1.talkMaxDuration)

			if var_126_25 <= arg_123_1.time_ and arg_123_1.time_ < var_126_25 + var_126_35 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_25) / var_126_35

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_25 + var_126_35 and arg_123_1.time_ < var_126_25 + var_126_35 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play115281030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 115281030
		arg_127_1.duration_ = 15.466

		local var_127_0 = {
			ja = 15.466,
			ko = 13.933,
			zh = 13.133,
			en = 14.966
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
				arg_127_0:Play115281031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 1.475

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[312].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(115281030)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281030", "story_v_out_115281.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281030", "story_v_out_115281.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_115281", "115281030", "story_v_out_115281.awb")

						arg_127_1:RecordAudio("115281030", var_130_9)
						arg_127_1:RecordAudio("115281030", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_115281", "115281030", "story_v_out_115281.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_115281", "115281030", "story_v_out_115281.awb")
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
	Play115281031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 115281031
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play115281032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10029"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				local var_134_2 = var_134_0:GetComponent("Image")

				if var_134_2 then
					arg_131_1.var_.alphaMatValue10029 = var_134_2
					arg_131_1.var_.alphaOldValue10029 = var_134_2.color.a
				end

				arg_131_1.var_.alphaOldValue10029 = 1
			end

			local var_134_3 = 0.333333333333333

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_3 then
				local var_134_4 = (arg_131_1.time_ - var_134_1) / var_134_3
				local var_134_5 = Mathf.Lerp(arg_131_1.var_.alphaOldValue10029, 0, var_134_4)

				if arg_131_1.var_.alphaMatValue10029 then
					local var_134_6 = arg_131_1.var_.alphaMatValue10029.color

					var_134_6.a = var_134_5
					arg_131_1.var_.alphaMatValue10029.color = var_134_6
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_3 and arg_131_1.time_ < var_134_1 + var_134_3 + arg_134_0 and arg_131_1.var_.alphaMatValue10029 then
				local var_134_7 = arg_131_1.var_.alphaMatValue10029
				local var_134_8 = var_134_7.color

				var_134_8.a = 0
				var_134_7.color = var_134_8
			end

			local var_134_9 = 0
			local var_134_10 = 1.125

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_11 = arg_131_1:GetWordFromCfg(115281031)
				local var_134_12 = arg_131_1:FormatText(var_134_11.content)

				arg_131_1.text_.text = var_134_12

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_13 = 45
				local var_134_14 = utf8.len(var_134_12)
				local var_134_15 = var_134_13 <= 0 and var_134_10 or var_134_10 * (var_134_14 / var_134_13)

				if var_134_15 > 0 and var_134_10 < var_134_15 then
					arg_131_1.talkMaxDuration = var_134_15

					if var_134_15 + var_134_9 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_15 + var_134_9
					end
				end

				arg_131_1.text_.text = var_134_12
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_16 = math.max(var_134_10, arg_131_1.talkMaxDuration)

			if var_134_9 <= arg_131_1.time_ and arg_131_1.time_ < var_134_9 + var_134_16 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_9) / var_134_16

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_9 + var_134_16 and arg_131_1.time_ < var_134_9 + var_134_16 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play115281032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 115281032
		arg_135_1.duration_ = 17.433

		local var_135_0 = {
			ja = 14.333,
			ko = 16.366,
			zh = 13.866,
			en = 17.433
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
				arg_135_0:Play115281033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10029"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				local var_138_2 = var_138_0:GetComponent("Image")

				if var_138_2 then
					arg_135_1.var_.alphaMatValue10029 = var_138_2
					arg_135_1.var_.alphaOldValue10029 = var_138_2.color.a
				end

				arg_135_1.var_.alphaOldValue10029 = 0
			end

			local var_138_3 = 0.333333333333333

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_3 then
				local var_138_4 = (arg_135_1.time_ - var_138_1) / var_138_3
				local var_138_5 = Mathf.Lerp(arg_135_1.var_.alphaOldValue10029, 1, var_138_4)

				if arg_135_1.var_.alphaMatValue10029 then
					local var_138_6 = arg_135_1.var_.alphaMatValue10029.color

					var_138_6.a = var_138_5
					arg_135_1.var_.alphaMatValue10029.color = var_138_6
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_3 and arg_135_1.time_ < var_138_1 + var_138_3 + arg_138_0 and arg_135_1.var_.alphaMatValue10029 then
				local var_138_7 = arg_135_1.var_.alphaMatValue10029
				local var_138_8 = var_138_7.color

				var_138_8.a = 1
				var_138_7.color = var_138_8
			end

			local var_138_9 = 0
			local var_138_10 = 1.225

			if var_138_9 < arg_135_1.time_ and arg_135_1.time_ <= var_138_9 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_11 = arg_135_1:FormatText(StoryNameCfg[312].name)

				arg_135_1.leftNameTxt_.text = var_138_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_12 = arg_135_1:GetWordFromCfg(115281032)
				local var_138_13 = arg_135_1:FormatText(var_138_12.content)

				arg_135_1.text_.text = var_138_13

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_14 = 49
				local var_138_15 = utf8.len(var_138_13)
				local var_138_16 = var_138_14 <= 0 and var_138_10 or var_138_10 * (var_138_15 / var_138_14)

				if var_138_16 > 0 and var_138_10 < var_138_16 then
					arg_135_1.talkMaxDuration = var_138_16

					if var_138_16 + var_138_9 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_16 + var_138_9
					end
				end

				arg_135_1.text_.text = var_138_13
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281032", "story_v_out_115281.awb") ~= 0 then
					local var_138_17 = manager.audio:GetVoiceLength("story_v_out_115281", "115281032", "story_v_out_115281.awb") / 1000

					if var_138_17 + var_138_9 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_17 + var_138_9
					end

					if var_138_12.prefab_name ~= "" and arg_135_1.actors_[var_138_12.prefab_name] ~= nil then
						local var_138_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_12.prefab_name].transform, "story_v_out_115281", "115281032", "story_v_out_115281.awb")

						arg_135_1:RecordAudio("115281032", var_138_18)
						arg_135_1:RecordAudio("115281032", var_138_18)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_115281", "115281032", "story_v_out_115281.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_115281", "115281032", "story_v_out_115281.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_19 = math.max(var_138_10, arg_135_1.talkMaxDuration)

			if var_138_9 <= arg_135_1.time_ and arg_135_1.time_ < var_138_9 + var_138_19 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_9) / var_138_19

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_9 + var_138_19 and arg_135_1.time_ < var_138_9 + var_138_19 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play115281033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 115281033
		arg_139_1.duration_ = 9.866

		local var_139_0 = {
			ja = 8.333,
			ko = 8.8,
			zh = 5.233,
			en = 9.866
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
				arg_139_0:Play115281034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.625

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[312].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(115281033)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281033", "story_v_out_115281.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281033", "story_v_out_115281.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_115281", "115281033", "story_v_out_115281.awb")

						arg_139_1:RecordAudio("115281033", var_142_9)
						arg_139_1:RecordAudio("115281033", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_115281", "115281033", "story_v_out_115281.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_115281", "115281033", "story_v_out_115281.awb")
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
	Play115281034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 115281034
		arg_143_1.duration_ = 9

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play115281035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 2

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				local var_146_1 = manager.ui.mainCamera.transform.localPosition
				local var_146_2 = Vector3.New(0, 0, 10) + Vector3.New(var_146_1.x, var_146_1.y, 0)
				local var_146_3 = arg_143_1.bgs_.STblack

				var_146_3.transform.localPosition = var_146_2
				var_146_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_146_4 = var_146_3:GetComponent("SpriteRenderer")

				if var_146_4 and var_146_4.sprite then
					local var_146_5 = (var_146_3.transform.localPosition - var_146_1).z
					local var_146_6 = manager.ui.mainCameraCom_
					local var_146_7 = 2 * var_146_5 * Mathf.Tan(var_146_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_146_8 = var_146_7 * var_146_6.aspect
					local var_146_9 = var_146_4.sprite.bounds.size.x
					local var_146_10 = var_146_4.sprite.bounds.size.y
					local var_146_11 = var_146_8 / var_146_9
					local var_146_12 = var_146_7 / var_146_10
					local var_146_13 = var_146_12 < var_146_11 and var_146_11 or var_146_12

					var_146_3.transform.localScale = Vector3.New(var_146_13, var_146_13, 0)
				end

				for iter_146_0, iter_146_1 in pairs(arg_143_1.bgs_) do
					if iter_146_0 ~= "STblack" then
						iter_146_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = false

				arg_143_1:SetGaussion(false)
			end

			local var_146_15 = 2

			if var_146_14 <= arg_143_1.time_ and arg_143_1.time_ < var_146_14 + var_146_15 then
				local var_146_16 = (arg_143_1.time_ - var_146_14) / var_146_15
				local var_146_17 = Color.New(0, 0, 0)

				var_146_17.a = Mathf.Lerp(0, 1, var_146_16)
				arg_143_1.mask_.color = var_146_17
			end

			if arg_143_1.time_ >= var_146_14 + var_146_15 and arg_143_1.time_ < var_146_14 + var_146_15 + arg_146_0 then
				local var_146_18 = Color.New(0, 0, 0)

				var_146_18.a = 1
				arg_143_1.mask_.color = var_146_18
			end

			local var_146_19 = 2

			if var_146_19 < arg_143_1.time_ and arg_143_1.time_ <= var_146_19 + arg_146_0 then
				arg_143_1.mask_.enabled = true
				arg_143_1.mask_.raycastTarget = false

				arg_143_1:SetGaussion(false)
			end

			local var_146_20 = 2

			if var_146_19 <= arg_143_1.time_ and arg_143_1.time_ < var_146_19 + var_146_20 then
				local var_146_21 = (arg_143_1.time_ - var_146_19) / var_146_20
				local var_146_22 = Color.New(0, 0, 0)

				var_146_22.a = Mathf.Lerp(1, 0, var_146_21)
				arg_143_1.mask_.color = var_146_22
			end

			if arg_143_1.time_ >= var_146_19 + var_146_20 and arg_143_1.time_ < var_146_19 + var_146_20 + arg_146_0 then
				local var_146_23 = Color.New(0, 0, 0)
				local var_146_24 = 0

				arg_143_1.mask_.enabled = false
				var_146_23.a = var_146_24
				arg_143_1.mask_.color = var_146_23
			end

			local var_146_25 = arg_143_1.actors_["10029"].transform
			local var_146_26 = 1.99933333333333

			if var_146_26 < arg_143_1.time_ and arg_143_1.time_ <= var_146_26 + arg_146_0 then
				arg_143_1.var_.moveOldPos10029 = var_146_25.localPosition
				var_146_25.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10029", 0)
			end

			local var_146_27 = 0.001

			if var_146_26 <= arg_143_1.time_ and arg_143_1.time_ < var_146_26 + var_146_27 then
				local var_146_28 = (arg_143_1.time_ - var_146_26) / var_146_27
				local var_146_29 = Vector3.New(-1500, -350, -180)

				var_146_25.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10029, var_146_29, var_146_28)
			end

			if arg_143_1.time_ >= var_146_26 + var_146_27 and arg_143_1.time_ < var_146_26 + var_146_27 + arg_146_0 then
				var_146_25.localPosition = Vector3.New(-1500, -350, -180)
			end

			if arg_143_1.frameCnt_ <= 1 then
				arg_143_1.dialog_:SetActive(false)
			end

			local var_146_30 = 4
			local var_146_31 = 0.425

			if var_146_30 < arg_143_1.time_ and arg_143_1.time_ <= var_146_30 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0

				arg_143_1.dialog_:SetActive(true)

				local var_146_32 = LeanTween.value(arg_143_1.dialog_, 0, 1, 0.3)

				var_146_32:setOnUpdate(LuaHelper.FloatAction(function(arg_147_0)
					arg_143_1.dialogCg_.alpha = arg_147_0
				end))
				var_146_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_143_1.dialog_)
					var_146_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_143_1.duration_ = arg_143_1.duration_ + 0.3

				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_33 = arg_143_1:GetWordFromCfg(115281034)
				local var_146_34 = arg_143_1:FormatText(var_146_33.content)

				arg_143_1.text_.text = var_146_34

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_35 = 17
				local var_146_36 = utf8.len(var_146_34)
				local var_146_37 = var_146_35 <= 0 and var_146_31 or var_146_31 * (var_146_36 / var_146_35)

				if var_146_37 > 0 and var_146_31 < var_146_37 then
					arg_143_1.talkMaxDuration = var_146_37
					var_146_30 = var_146_30 + 0.3

					if var_146_37 + var_146_30 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_37 + var_146_30
					end
				end

				arg_143_1.text_.text = var_146_34
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_38 = var_146_30 + 0.3
			local var_146_39 = math.max(var_146_31, arg_143_1.talkMaxDuration)

			if var_146_38 <= arg_143_1.time_ and arg_143_1.time_ < var_146_38 + var_146_39 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_38) / var_146_39

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_38 + var_146_39 and arg_143_1.time_ < var_146_38 + var_146_39 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play115281035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115281035
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play115281036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1.175

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

				local var_152_2 = arg_149_1:GetWordFromCfg(115281035)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 47
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
	Play115281036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115281036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play115281037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.55

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_2 = arg_153_1:GetWordFromCfg(115281036)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 22
				local var_156_5 = utf8.len(var_156_3)
				local var_156_6 = var_156_4 <= 0 and var_156_1 or var_156_1 * (var_156_5 / var_156_4)

				if var_156_6 > 0 and var_156_1 < var_156_6 then
					arg_153_1.talkMaxDuration = var_156_6

					if var_156_6 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_6 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_3
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_7 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_7 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_7

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_7 and arg_153_1.time_ < var_156_0 + var_156_7 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play115281037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115281037
		arg_157_1.duration_ = 17.1

		local var_157_0 = {
			ja = 13.6,
			ko = 13.6,
			zh = 12.933,
			en = 17.1
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
				arg_157_0:Play115281038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 1

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				local var_160_1 = manager.ui.mainCamera.transform.localPosition
				local var_160_2 = Vector3.New(0, 0, 10) + Vector3.New(var_160_1.x, var_160_1.y, 0)
				local var_160_3 = arg_157_1.bgs_.ST28a

				var_160_3.transform.localPosition = var_160_2
				var_160_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_4 = var_160_3:GetComponent("SpriteRenderer")

				if var_160_4 and var_160_4.sprite then
					local var_160_5 = (var_160_3.transform.localPosition - var_160_1).z
					local var_160_6 = manager.ui.mainCameraCom_
					local var_160_7 = 2 * var_160_5 * Mathf.Tan(var_160_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_8 = var_160_7 * var_160_6.aspect
					local var_160_9 = var_160_4.sprite.bounds.size.x
					local var_160_10 = var_160_4.sprite.bounds.size.y
					local var_160_11 = var_160_8 / var_160_9
					local var_160_12 = var_160_7 / var_160_10
					local var_160_13 = var_160_12 < var_160_11 and var_160_11 or var_160_12

					var_160_3.transform.localScale = Vector3.New(var_160_13, var_160_13, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "ST28a" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_14 = 1

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = false

				arg_157_1:SetGaussion(false)
			end

			local var_160_15 = 2

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_14) / var_160_15
				local var_160_17 = Color.New(0, 0, 0)

				var_160_17.a = Mathf.Lerp(1, 0, var_160_16)
				arg_157_1.mask_.color = var_160_17
			end

			if arg_157_1.time_ >= var_160_14 + var_160_15 and arg_157_1.time_ < var_160_14 + var_160_15 + arg_160_0 then
				local var_160_18 = Color.New(0, 0, 0)
				local var_160_19 = 0

				arg_157_1.mask_.enabled = false
				var_160_18.a = var_160_19
				arg_157_1.mask_.color = var_160_18
			end

			if arg_157_1.frameCnt_ <= 1 then
				arg_157_1.dialog_:SetActive(false)
			end

			local var_160_20 = 3
			local var_160_21 = 0.85

			if var_160_20 < arg_157_1.time_ and arg_157_1.time_ <= var_160_20 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				arg_157_1.dialog_:SetActive(true)

				local var_160_22 = LeanTween.value(arg_157_1.dialog_, 0, 1, 0.3)

				var_160_22:setOnUpdate(LuaHelper.FloatAction(function(arg_161_0)
					arg_157_1.dialogCg_.alpha = arg_161_0
				end))
				var_160_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_157_1.dialog_)
					var_160_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_157_1.duration_ = arg_157_1.duration_ + 0.3

				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_23 = arg_157_1:FormatText(StoryNameCfg[224].name)

				arg_157_1.leftNameTxt_.text = var_160_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerkb")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_24 = arg_157_1:GetWordFromCfg(115281037)
				local var_160_25 = arg_157_1:FormatText(var_160_24.content)

				arg_157_1.text_.text = var_160_25

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_26 = 34
				local var_160_27 = utf8.len(var_160_25)
				local var_160_28 = var_160_26 <= 0 and var_160_21 or var_160_21 * (var_160_27 / var_160_26)

				if var_160_28 > 0 and var_160_21 < var_160_28 then
					arg_157_1.talkMaxDuration = var_160_28
					var_160_20 = var_160_20 + 0.3

					if var_160_28 + var_160_20 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_28 + var_160_20
					end
				end

				arg_157_1.text_.text = var_160_25
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281037", "story_v_out_115281.awb") ~= 0 then
					local var_160_29 = manager.audio:GetVoiceLength("story_v_out_115281", "115281037", "story_v_out_115281.awb") / 1000

					if var_160_29 + var_160_20 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_29 + var_160_20
					end

					if var_160_24.prefab_name ~= "" and arg_157_1.actors_[var_160_24.prefab_name] ~= nil then
						local var_160_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_24.prefab_name].transform, "story_v_out_115281", "115281037", "story_v_out_115281.awb")

						arg_157_1:RecordAudio("115281037", var_160_30)
						arg_157_1:RecordAudio("115281037", var_160_30)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_115281", "115281037", "story_v_out_115281.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_115281", "115281037", "story_v_out_115281.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_31 = var_160_20 + 0.3
			local var_160_32 = math.max(var_160_21, arg_157_1.talkMaxDuration)

			if var_160_31 <= arg_157_1.time_ and arg_157_1.time_ < var_160_31 + var_160_32 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_31) / var_160_32

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_31 + var_160_32 and arg_157_1.time_ < var_160_31 + var_160_32 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115281038 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 115281038
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play115281039(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.65

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(115281038)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 26
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play115281039 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 115281039
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play115281040(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.675

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_2 = arg_167_1:GetWordFromCfg(115281039)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 67
				local var_170_5 = utf8.len(var_170_3)
				local var_170_6 = var_170_4 <= 0 and var_170_1 or var_170_1 * (var_170_5 / var_170_4)

				if var_170_6 > 0 and var_170_1 < var_170_6 then
					arg_167_1.talkMaxDuration = var_170_6

					if var_170_6 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_6 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_3
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_7 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_7 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_7

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_7 and arg_167_1.time_ < var_170_0 + var_170_7 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play115281040 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 115281040
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play115281041(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 1.375

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_2 = arg_171_1:GetWordFromCfg(115281040)
				local var_174_3 = arg_171_1:FormatText(var_174_2.content)

				arg_171_1.text_.text = var_174_3

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_4 = 55
				local var_174_5 = utf8.len(var_174_3)
				local var_174_6 = var_174_4 <= 0 and var_174_1 or var_174_1 * (var_174_5 / var_174_4)

				if var_174_6 > 0 and var_174_1 < var_174_6 then
					arg_171_1.talkMaxDuration = var_174_6

					if var_174_6 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_6 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_3
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_7 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_7 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_7

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_7 and arg_171_1.time_ < var_174_0 + var_174_7 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play115281041 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 115281041
		arg_175_1.duration_ = 3.3

		local var_175_0 = {
			ja = 3.3,
			ko = 2.066,
			zh = 2.533,
			en = 2.266
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
				arg_175_0:Play115281042(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10030"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10030 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10030", 3)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "split_3" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(0, -390, 150)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10030, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_178_7 = arg_175_1.actors_["10030"]
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 then
				local var_178_9 = var_178_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_178_9 then
					arg_175_1.var_.alphaOldValue10030 = var_178_9.alpha
					arg_175_1.var_.characterEffect10030 = var_178_9
				end

				arg_175_1.var_.alphaOldValue10030 = 0
			end

			local var_178_10 = 0.333333333333333

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_10 then
				local var_178_11 = (arg_175_1.time_ - var_178_8) / var_178_10
				local var_178_12 = Mathf.Lerp(arg_175_1.var_.alphaOldValue10030, 1, var_178_11)

				if arg_175_1.var_.characterEffect10030 then
					arg_175_1.var_.characterEffect10030.alpha = var_178_12
				end
			end

			if arg_175_1.time_ >= var_178_8 + var_178_10 and arg_175_1.time_ < var_178_8 + var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect10030 then
				arg_175_1.var_.characterEffect10030.alpha = 1
			end

			local var_178_13 = 0
			local var_178_14 = 0.2

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_15 = arg_175_1:FormatText(StoryNameCfg[309].name)

				arg_175_1.leftNameTxt_.text = var_178_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_16 = arg_175_1:GetWordFromCfg(115281041)
				local var_178_17 = arg_175_1:FormatText(var_178_16.content)

				arg_175_1.text_.text = var_178_17

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_18 = 8
				local var_178_19 = utf8.len(var_178_17)
				local var_178_20 = var_178_18 <= 0 and var_178_14 or var_178_14 * (var_178_19 / var_178_18)

				if var_178_20 > 0 and var_178_14 < var_178_20 then
					arg_175_1.talkMaxDuration = var_178_20

					if var_178_20 + var_178_13 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_13
					end
				end

				arg_175_1.text_.text = var_178_17
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281041", "story_v_out_115281.awb") ~= 0 then
					local var_178_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281041", "story_v_out_115281.awb") / 1000

					if var_178_21 + var_178_13 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_21 + var_178_13
					end

					if var_178_16.prefab_name ~= "" and arg_175_1.actors_[var_178_16.prefab_name] ~= nil then
						local var_178_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_16.prefab_name].transform, "story_v_out_115281", "115281041", "story_v_out_115281.awb")

						arg_175_1:RecordAudio("115281041", var_178_22)
						arg_175_1:RecordAudio("115281041", var_178_22)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_115281", "115281041", "story_v_out_115281.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_115281", "115281041", "story_v_out_115281.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_23 = math.max(var_178_14, arg_175_1.talkMaxDuration)

			if var_178_13 <= arg_175_1.time_ and arg_175_1.time_ < var_178_13 + var_178_23 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_13) / var_178_23

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_13 + var_178_23 and arg_175_1.time_ < var_178_13 + var_178_23 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play115281042 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 115281042
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play115281043(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10030"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				local var_182_2 = var_182_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_182_2 then
					arg_179_1.var_.alphaOldValue10030 = var_182_2.alpha
					arg_179_1.var_.characterEffect10030 = var_182_2
				end

				arg_179_1.var_.alphaOldValue10030 = 1
			end

			local var_182_3 = 0.333333333333333

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_3 then
				local var_182_4 = (arg_179_1.time_ - var_182_1) / var_182_3
				local var_182_5 = Mathf.Lerp(arg_179_1.var_.alphaOldValue10030, 0, var_182_4)

				if arg_179_1.var_.characterEffect10030 then
					arg_179_1.var_.characterEffect10030.alpha = var_182_5
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_3 and arg_179_1.time_ < var_182_1 + var_182_3 + arg_182_0 and arg_179_1.var_.characterEffect10030 then
				arg_179_1.var_.characterEffect10030.alpha = 0
			end

			local var_182_6 = 0
			local var_182_7 = 1.1

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_8 = arg_179_1:GetWordFromCfg(115281042)
				local var_182_9 = arg_179_1:FormatText(var_182_8.content)

				arg_179_1.text_.text = var_182_9

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_10 = 44
				local var_182_11 = utf8.len(var_182_9)
				local var_182_12 = var_182_10 <= 0 and var_182_7 or var_182_7 * (var_182_11 / var_182_10)

				if var_182_12 > 0 and var_182_7 < var_182_12 then
					arg_179_1.talkMaxDuration = var_182_12

					if var_182_12 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_12 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_9
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_13 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_13 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_13

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_13 and arg_179_1.time_ < var_182_6 + var_182_13 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play115281043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 115281043
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play115281044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.9

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

				local var_186_2 = arg_183_1:GetWordFromCfg(115281043)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 36
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
	Play115281044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 115281044
		arg_187_1.duration_ = 18.9

		local var_187_0 = {
			ja = 16.166,
			ko = 13.266,
			zh = 13.1,
			en = 18.9
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
				arg_187_0:Play115281045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10029"].transform
			local var_190_1 = 4

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10029 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(-390, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10029, var_190_4, var_190_3)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_190_5 = arg_187_1.actors_["10029"]
			local var_190_6 = 4

			if var_190_6 < arg_187_1.time_ and arg_187_1.time_ <= var_190_6 + arg_190_0 then
				local var_190_7 = var_190_5:GetComponent("Image")

				if var_190_7 then
					arg_187_1.var_.alphaMatValue10029 = var_190_7
					arg_187_1.var_.alphaOldValue10029 = var_190_7.color.a
				end

				arg_187_1.var_.alphaOldValue10029 = 0
			end

			local var_190_8 = 0.333333333333333

			if var_190_6 <= arg_187_1.time_ and arg_187_1.time_ < var_190_6 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_6) / var_190_8
				local var_190_10 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10029, 1, var_190_9)

				if arg_187_1.var_.alphaMatValue10029 then
					local var_190_11 = arg_187_1.var_.alphaMatValue10029.color

					var_190_11.a = var_190_10
					arg_187_1.var_.alphaMatValue10029.color = var_190_11
				end
			end

			if arg_187_1.time_ >= var_190_6 + var_190_8 and arg_187_1.time_ < var_190_6 + var_190_8 + arg_190_0 and arg_187_1.var_.alphaMatValue10029 then
				local var_190_12 = arg_187_1.var_.alphaMatValue10029
				local var_190_13 = var_190_12.color

				var_190_13.a = 1
				var_190_12.color = var_190_13
			end

			local var_190_14 = arg_187_1.actors_["10030"].transform
			local var_190_15 = 4

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.var_.moveOldPos10030 = var_190_14.localPosition
				var_190_14.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10030", 4)

				local var_190_16 = var_190_14.childCount

				for iter_190_0 = 0, var_190_16 - 1 do
					local var_190_17 = var_190_14:GetChild(iter_190_0)

					if var_190_17.name == "split_1" or not string.find(var_190_17.name, "split") then
						var_190_17.gameObject:SetActive(true)
					else
						var_190_17.gameObject:SetActive(false)
					end
				end
			end

			local var_190_18 = 0.001

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_18 then
				local var_190_19 = (arg_187_1.time_ - var_190_15) / var_190_18
				local var_190_20 = Vector3.New(390, -390, 150)

				var_190_14.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10030, var_190_20, var_190_19)
			end

			if arg_187_1.time_ >= var_190_15 + var_190_18 and arg_187_1.time_ < var_190_15 + var_190_18 + arg_190_0 then
				var_190_14.localPosition = Vector3.New(390, -390, 150)
			end

			local var_190_21 = arg_187_1.actors_["10030"]
			local var_190_22 = 4

			if var_190_22 < arg_187_1.time_ and arg_187_1.time_ <= var_190_22 + arg_190_0 then
				local var_190_23 = var_190_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_190_23 then
					arg_187_1.var_.alphaOldValue10030 = var_190_23.alpha
					arg_187_1.var_.characterEffect10030 = var_190_23
				end

				arg_187_1.var_.alphaOldValue10030 = 0
			end

			local var_190_24 = 0.333333333333333

			if var_190_22 <= arg_187_1.time_ and arg_187_1.time_ < var_190_22 + var_190_24 then
				local var_190_25 = (arg_187_1.time_ - var_190_22) / var_190_24
				local var_190_26 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10030, 1, var_190_25)

				if arg_187_1.var_.characterEffect10030 then
					arg_187_1.var_.characterEffect10030.alpha = var_190_26
				end
			end

			if arg_187_1.time_ >= var_190_22 + var_190_24 and arg_187_1.time_ < var_190_22 + var_190_24 + arg_190_0 and arg_187_1.var_.characterEffect10030 then
				arg_187_1.var_.characterEffect10030.alpha = 1
			end

			local var_190_27 = arg_187_1.actors_["10029"]
			local var_190_28 = 4

			if var_190_28 < arg_187_1.time_ and arg_187_1.time_ <= var_190_28 + arg_190_0 then
				local var_190_29 = var_190_27:GetComponent("Image")

				if var_190_29 then
					arg_187_1.var_.highlightMatValue10029 = var_190_29
				end
			end

			local var_190_30 = 0.2

			if var_190_28 <= arg_187_1.time_ and arg_187_1.time_ < var_190_28 + var_190_30 then
				local var_190_31 = (arg_187_1.time_ - var_190_28) / var_190_30

				if arg_187_1.var_.highlightMatValue10029 then
					local var_190_32 = Mathf.Lerp(0.5, 1, var_190_31)
					local var_190_33 = arg_187_1.var_.highlightMatValue10029
					local var_190_34 = var_190_33.color

					var_190_34.r = var_190_32
					var_190_34.g = var_190_32
					var_190_34.b = var_190_32
					var_190_33.color = var_190_34
				end
			end

			if arg_187_1.time_ >= var_190_28 + var_190_30 and arg_187_1.time_ < var_190_28 + var_190_30 + arg_190_0 and arg_187_1.var_.highlightMatValue10029 then
				local var_190_35 = 1

				var_190_27.transform:SetSiblingIndex(1)

				local var_190_36 = arg_187_1.var_.highlightMatValue10029
				local var_190_37 = var_190_36.color

				var_190_37.r = var_190_35
				var_190_37.g = var_190_35
				var_190_37.b = var_190_35
				var_190_36.color = var_190_37
			end

			local var_190_38 = arg_187_1.actors_["10030"]
			local var_190_39 = 4

			if var_190_39 < arg_187_1.time_ and arg_187_1.time_ <= var_190_39 + arg_190_0 and arg_187_1.var_.actorSpriteComps10030 == nil then
				arg_187_1.var_.actorSpriteComps10030 = var_190_38:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_40 = 0.2

			if var_190_39 <= arg_187_1.time_ and arg_187_1.time_ < var_190_39 + var_190_40 then
				local var_190_41 = (arg_187_1.time_ - var_190_39) / var_190_40

				if arg_187_1.var_.actorSpriteComps10030 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_190_2 then
							local var_190_42 = Mathf.Lerp(iter_190_2.color.r, 0.5, var_190_41)

							iter_190_2.color = Color.New(var_190_42, var_190_42, var_190_42)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_39 + var_190_40 and arg_187_1.time_ < var_190_39 + var_190_40 + arg_190_0 and arg_187_1.var_.actorSpriteComps10030 then
				local var_190_43 = 0.5

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_43, var_190_43, var_190_43)
					end
				end

				arg_187_1.var_.actorSpriteComps10030 = nil
			end

			local var_190_44 = 0

			if var_190_44 < arg_187_1.time_ and arg_187_1.time_ <= var_190_44 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = false

				arg_187_1:SetGaussion(false)
			end

			local var_190_45 = 2

			if var_190_44 <= arg_187_1.time_ and arg_187_1.time_ < var_190_44 + var_190_45 then
				local var_190_46 = (arg_187_1.time_ - var_190_44) / var_190_45
				local var_190_47 = Color.New(0, 0, 0)

				var_190_47.a = Mathf.Lerp(0, 1, var_190_46)
				arg_187_1.mask_.color = var_190_47
			end

			if arg_187_1.time_ >= var_190_44 + var_190_45 and arg_187_1.time_ < var_190_44 + var_190_45 + arg_190_0 then
				local var_190_48 = Color.New(0, 0, 0)

				var_190_48.a = 1
				arg_187_1.mask_.color = var_190_48
			end

			local var_190_49 = 2

			if var_190_49 < arg_187_1.time_ and arg_187_1.time_ <= var_190_49 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = false

				arg_187_1:SetGaussion(false)
			end

			local var_190_50 = 2

			if var_190_49 <= arg_187_1.time_ and arg_187_1.time_ < var_190_49 + var_190_50 then
				local var_190_51 = (arg_187_1.time_ - var_190_49) / var_190_50
				local var_190_52 = Color.New(0, 0, 0)

				var_190_52.a = Mathf.Lerp(1, 0, var_190_51)
				arg_187_1.mask_.color = var_190_52
			end

			if arg_187_1.time_ >= var_190_49 + var_190_50 and arg_187_1.time_ < var_190_49 + var_190_50 + arg_190_0 then
				local var_190_53 = Color.New(0, 0, 0)
				local var_190_54 = 0

				arg_187_1.mask_.enabled = false
				var_190_53.a = var_190_54
				arg_187_1.mask_.color = var_190_53
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_55 = 4
			local var_190_56 = 1.025

			if var_190_55 < arg_187_1.time_ and arg_187_1.time_ <= var_190_55 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_57 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_57:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_58 = arg_187_1:FormatText(StoryNameCfg[312].name)

				arg_187_1.leftNameTxt_.text = var_190_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_59 = arg_187_1:GetWordFromCfg(115281044)
				local var_190_60 = arg_187_1:FormatText(var_190_59.content)

				arg_187_1.text_.text = var_190_60

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_61 = 41
				local var_190_62 = utf8.len(var_190_60)
				local var_190_63 = var_190_61 <= 0 and var_190_56 or var_190_56 * (var_190_62 / var_190_61)

				if var_190_63 > 0 and var_190_56 < var_190_63 then
					arg_187_1.talkMaxDuration = var_190_63
					var_190_55 = var_190_55 + 0.3

					if var_190_63 + var_190_55 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_63 + var_190_55
					end
				end

				arg_187_1.text_.text = var_190_60
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281044", "story_v_out_115281.awb") ~= 0 then
					local var_190_64 = manager.audio:GetVoiceLength("story_v_out_115281", "115281044", "story_v_out_115281.awb") / 1000

					if var_190_64 + var_190_55 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_64 + var_190_55
					end

					if var_190_59.prefab_name ~= "" and arg_187_1.actors_[var_190_59.prefab_name] ~= nil then
						local var_190_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_59.prefab_name].transform, "story_v_out_115281", "115281044", "story_v_out_115281.awb")

						arg_187_1:RecordAudio("115281044", var_190_65)
						arg_187_1:RecordAudio("115281044", var_190_65)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_115281", "115281044", "story_v_out_115281.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_115281", "115281044", "story_v_out_115281.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_66 = var_190_55 + 0.3
			local var_190_67 = math.max(var_190_56, arg_187_1.talkMaxDuration)

			if var_190_66 <= arg_187_1.time_ and arg_187_1.time_ < var_190_66 + var_190_67 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_66) / var_190_67

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_66 + var_190_67 and arg_187_1.time_ < var_190_66 + var_190_67 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play115281045 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115281045
		arg_193_1.duration_ = 16.166

		local var_193_0 = {
			ja = 11.033,
			ko = 15.466,
			zh = 12.1,
			en = 16.166
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
				arg_193_0:Play115281046(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1.275

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[312].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(115281045)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 51
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281045", "story_v_out_115281.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281045", "story_v_out_115281.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_115281", "115281045", "story_v_out_115281.awb")

						arg_193_1:RecordAudio("115281045", var_196_9)
						arg_193_1:RecordAudio("115281045", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_115281", "115281045", "story_v_out_115281.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_115281", "115281045", "story_v_out_115281.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play115281046 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115281046
		arg_197_1.duration_ = 2.8

		local var_197_0 = {
			ja = 2.8,
			ko = 1,
			zh = 1.4,
			en = 1.733
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
				arg_197_0:Play115281047(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10029"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				local var_200_2 = var_200_0:GetComponent("Image")

				if var_200_2 then
					arg_197_1.var_.highlightMatValue10029 = var_200_2
				end
			end

			local var_200_3 = 0.2

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_3 then
				local var_200_4 = (arg_197_1.time_ - var_200_1) / var_200_3

				if arg_197_1.var_.highlightMatValue10029 then
					local var_200_5 = Mathf.Lerp(1, 0.5, var_200_4)
					local var_200_6 = arg_197_1.var_.highlightMatValue10029
					local var_200_7 = var_200_6.color

					var_200_7.r = var_200_5
					var_200_7.g = var_200_5
					var_200_7.b = var_200_5
					var_200_6.color = var_200_7
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_3 and arg_197_1.time_ < var_200_1 + var_200_3 + arg_200_0 and arg_197_1.var_.highlightMatValue10029 then
				local var_200_8 = 0.5
				local var_200_9 = arg_197_1.var_.highlightMatValue10029
				local var_200_10 = var_200_9.color

				var_200_10.r = var_200_8
				var_200_10.g = var_200_8
				var_200_10.b = var_200_8
				var_200_9.color = var_200_10
			end

			local var_200_11 = arg_197_1.actors_["10030"]
			local var_200_12 = 0

			if var_200_12 < arg_197_1.time_ and arg_197_1.time_ <= var_200_12 + arg_200_0 and arg_197_1.var_.actorSpriteComps10030 == nil then
				arg_197_1.var_.actorSpriteComps10030 = var_200_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_200_13 = 0.2

			if var_200_12 <= arg_197_1.time_ and arg_197_1.time_ < var_200_12 + var_200_13 then
				local var_200_14 = (arg_197_1.time_ - var_200_12) / var_200_13

				if arg_197_1.var_.actorSpriteComps10030 then
					for iter_200_0, iter_200_1 in pairs(arg_197_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_200_1 then
							local var_200_15 = Mathf.Lerp(iter_200_1.color.r, 1, var_200_14)

							iter_200_1.color = Color.New(var_200_15, var_200_15, var_200_15)
						end
					end
				end
			end

			if arg_197_1.time_ >= var_200_12 + var_200_13 and arg_197_1.time_ < var_200_12 + var_200_13 + arg_200_0 and arg_197_1.var_.actorSpriteComps10030 then
				local var_200_16 = 1

				for iter_200_2, iter_200_3 in pairs(arg_197_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_200_3 then
						iter_200_3.color = Color.New(var_200_16, var_200_16, var_200_16)
					end
				end

				arg_197_1.var_.actorSpriteComps10030 = nil
			end

			local var_200_17 = 0
			local var_200_18 = 0.1

			if var_200_17 < arg_197_1.time_ and arg_197_1.time_ <= var_200_17 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_19 = arg_197_1:FormatText(StoryNameCfg[309].name)

				arg_197_1.leftNameTxt_.text = var_200_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_20 = arg_197_1:GetWordFromCfg(115281046)
				local var_200_21 = arg_197_1:FormatText(var_200_20.content)

				arg_197_1.text_.text = var_200_21

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_22 = 4
				local var_200_23 = utf8.len(var_200_21)
				local var_200_24 = var_200_22 <= 0 and var_200_18 or var_200_18 * (var_200_23 / var_200_22)

				if var_200_24 > 0 and var_200_18 < var_200_24 then
					arg_197_1.talkMaxDuration = var_200_24

					if var_200_24 + var_200_17 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_24 + var_200_17
					end
				end

				arg_197_1.text_.text = var_200_21
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281046", "story_v_out_115281.awb") ~= 0 then
					local var_200_25 = manager.audio:GetVoiceLength("story_v_out_115281", "115281046", "story_v_out_115281.awb") / 1000

					if var_200_25 + var_200_17 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_25 + var_200_17
					end

					if var_200_20.prefab_name ~= "" and arg_197_1.actors_[var_200_20.prefab_name] ~= nil then
						local var_200_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_20.prefab_name].transform, "story_v_out_115281", "115281046", "story_v_out_115281.awb")

						arg_197_1:RecordAudio("115281046", var_200_26)
						arg_197_1:RecordAudio("115281046", var_200_26)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_115281", "115281046", "story_v_out_115281.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_115281", "115281046", "story_v_out_115281.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_27 = math.max(var_200_18, arg_197_1.talkMaxDuration)

			if var_200_17 <= arg_197_1.time_ and arg_197_1.time_ < var_200_17 + var_200_27 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_17) / var_200_27

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_17 + var_200_27 and arg_197_1.time_ < var_200_17 + var_200_27 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115281047 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115281047
		arg_201_1.duration_ = 9

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play115281048(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10030"]
			local var_204_1 = 2

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				local var_204_2 = var_204_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_204_2 then
					arg_201_1.var_.alphaOldValue10030 = var_204_2.alpha
					arg_201_1.var_.characterEffect10030 = var_204_2
				end

				arg_201_1.var_.alphaOldValue10030 = 1
			end

			local var_204_3 = 0.0166666666666667

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_3 then
				local var_204_4 = (arg_201_1.time_ - var_204_1) / var_204_3
				local var_204_5 = Mathf.Lerp(arg_201_1.var_.alphaOldValue10030, 0, var_204_4)

				if arg_201_1.var_.characterEffect10030 then
					arg_201_1.var_.characterEffect10030.alpha = var_204_5
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_3 and arg_201_1.time_ < var_204_1 + var_204_3 + arg_204_0 and arg_201_1.var_.characterEffect10030 then
				arg_201_1.var_.characterEffect10030.alpha = 0
			end

			local var_204_6 = arg_201_1.actors_["10029"]
			local var_204_7 = 2

			if var_204_7 < arg_201_1.time_ and arg_201_1.time_ <= var_204_7 + arg_204_0 then
				local var_204_8 = var_204_6:GetComponent("Image")

				if var_204_8 then
					arg_201_1.var_.alphaMatValue10029 = var_204_8
					arg_201_1.var_.alphaOldValue10029 = var_204_8.color.a
				end

				arg_201_1.var_.alphaOldValue10029 = 1
			end

			local var_204_9 = 0.0166666666666667

			if var_204_7 <= arg_201_1.time_ and arg_201_1.time_ < var_204_7 + var_204_9 then
				local var_204_10 = (arg_201_1.time_ - var_204_7) / var_204_9
				local var_204_11 = Mathf.Lerp(arg_201_1.var_.alphaOldValue10029, 0, var_204_10)

				if arg_201_1.var_.alphaMatValue10029 then
					local var_204_12 = arg_201_1.var_.alphaMatValue10029.color

					var_204_12.a = var_204_11
					arg_201_1.var_.alphaMatValue10029.color = var_204_12
				end
			end

			if arg_201_1.time_ >= var_204_7 + var_204_9 and arg_201_1.time_ < var_204_7 + var_204_9 + arg_204_0 and arg_201_1.var_.alphaMatValue10029 then
				local var_204_13 = arg_201_1.var_.alphaMatValue10029
				local var_204_14 = var_204_13.color

				var_204_14.a = 0
				var_204_13.color = var_204_14
			end

			local var_204_15 = 0

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = false

				arg_201_1:SetGaussion(false)
			end

			local var_204_16 = 2

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_16 then
				local var_204_17 = (arg_201_1.time_ - var_204_15) / var_204_16
				local var_204_18 = Color.New(0, 0, 0)

				var_204_18.a = Mathf.Lerp(0, 1, var_204_17)
				arg_201_1.mask_.color = var_204_18
			end

			if arg_201_1.time_ >= var_204_15 + var_204_16 and arg_201_1.time_ < var_204_15 + var_204_16 + arg_204_0 then
				local var_204_19 = Color.New(0, 0, 0)

				var_204_19.a = 1
				arg_201_1.mask_.color = var_204_19
			end

			local var_204_20 = 2

			if var_204_20 < arg_201_1.time_ and arg_201_1.time_ <= var_204_20 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = false

				arg_201_1:SetGaussion(false)
			end

			local var_204_21 = 2

			if var_204_20 <= arg_201_1.time_ and arg_201_1.time_ < var_204_20 + var_204_21 then
				local var_204_22 = (arg_201_1.time_ - var_204_20) / var_204_21
				local var_204_23 = Color.New(0, 0, 0)

				var_204_23.a = Mathf.Lerp(1, 0, var_204_22)
				arg_201_1.mask_.color = var_204_23
			end

			if arg_201_1.time_ >= var_204_20 + var_204_21 and arg_201_1.time_ < var_204_20 + var_204_21 + arg_204_0 then
				local var_204_24 = Color.New(0, 0, 0)
				local var_204_25 = 0

				arg_201_1.mask_.enabled = false
				var_204_24.a = var_204_25
				arg_201_1.mask_.color = var_204_24
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_26 = 4
			local var_204_27 = 1.425

			if var_204_26 < arg_201_1.time_ and arg_201_1.time_ <= var_204_26 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_28 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_28:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_29 = arg_201_1:GetWordFromCfg(115281047)
				local var_204_30 = arg_201_1:FormatText(var_204_29.content)

				arg_201_1.text_.text = var_204_30

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_31 = 57
				local var_204_32 = utf8.len(var_204_30)
				local var_204_33 = var_204_31 <= 0 and var_204_27 or var_204_27 * (var_204_32 / var_204_31)

				if var_204_33 > 0 and var_204_27 < var_204_33 then
					arg_201_1.talkMaxDuration = var_204_33
					var_204_26 = var_204_26 + 0.3

					if var_204_33 + var_204_26 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_33 + var_204_26
					end
				end

				arg_201_1.text_.text = var_204_30
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_34 = var_204_26 + 0.3
			local var_204_35 = math.max(var_204_27, arg_201_1.talkMaxDuration)

			if var_204_34 <= arg_201_1.time_ and arg_201_1.time_ < var_204_34 + var_204_35 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_34) / var_204_35

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_34 + var_204_35 and arg_201_1.time_ < var_204_34 + var_204_35 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play115281048 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 115281048
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play115281049(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.025

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_2 = arg_207_1:GetWordFromCfg(115281048)
				local var_210_3 = arg_207_1:FormatText(var_210_2.content)

				arg_207_1.text_.text = var_210_3

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_4 = 41
				local var_210_5 = utf8.len(var_210_3)
				local var_210_6 = var_210_4 <= 0 and var_210_1 or var_210_1 * (var_210_5 / var_210_4)

				if var_210_6 > 0 and var_210_1 < var_210_6 then
					arg_207_1.talkMaxDuration = var_210_6

					if var_210_6 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_6 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_3
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_7 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_7 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_7

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_7 and arg_207_1.time_ < var_210_0 + var_210_7 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play115281049 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 115281049
		arg_211_1.duration_ = 7.1

		local var_211_0 = {
			ja = 3.866,
			ko = 5.5,
			zh = 7.1,
			en = 6.133
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
				arg_211_0:Play115281050(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10030"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos10030 = var_214_0.localPosition
				var_214_0.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("10030", 3)

				local var_214_2 = var_214_0.childCount

				for iter_214_0 = 0, var_214_2 - 1 do
					local var_214_3 = var_214_0:GetChild(iter_214_0)

					if var_214_3.name == "split_1" or not string.find(var_214_3.name, "split") then
						var_214_3.gameObject:SetActive(true)
					else
						var_214_3.gameObject:SetActive(false)
					end
				end
			end

			local var_214_4 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_1) / var_214_4
				local var_214_6 = Vector3.New(0, -390, 150)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10030, var_214_6, var_214_5)
			end

			if arg_211_1.time_ >= var_214_1 + var_214_4 and arg_211_1.time_ < var_214_1 + var_214_4 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_214_7 = arg_211_1.actors_["10030"]
			local var_214_8 = 0

			if var_214_8 < arg_211_1.time_ and arg_211_1.time_ <= var_214_8 + arg_214_0 then
				local var_214_9 = var_214_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_214_9 then
					arg_211_1.var_.alphaOldValue10030 = var_214_9.alpha
					arg_211_1.var_.characterEffect10030 = var_214_9
				end

				arg_211_1.var_.alphaOldValue10030 = 0
			end

			local var_214_10 = 0.333333333333333

			if var_214_8 <= arg_211_1.time_ and arg_211_1.time_ < var_214_8 + var_214_10 then
				local var_214_11 = (arg_211_1.time_ - var_214_8) / var_214_10
				local var_214_12 = Mathf.Lerp(arg_211_1.var_.alphaOldValue10030, 1, var_214_11)

				if arg_211_1.var_.characterEffect10030 then
					arg_211_1.var_.characterEffect10030.alpha = var_214_12
				end
			end

			if arg_211_1.time_ >= var_214_8 + var_214_10 and arg_211_1.time_ < var_214_8 + var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect10030 then
				arg_211_1.var_.characterEffect10030.alpha = 1
			end

			local var_214_13 = arg_211_1.actors_["10030"]
			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 and arg_211_1.var_.actorSpriteComps10030 == nil then
				arg_211_1.var_.actorSpriteComps10030 = var_214_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_15 = 0.2

			if var_214_14 <= arg_211_1.time_ and arg_211_1.time_ < var_214_14 + var_214_15 then
				local var_214_16 = (arg_211_1.time_ - var_214_14) / var_214_15

				if arg_211_1.var_.actorSpriteComps10030 then
					for iter_214_1, iter_214_2 in pairs(arg_211_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_214_2 then
							local var_214_17 = Mathf.Lerp(iter_214_2.color.r, 1, var_214_16)

							iter_214_2.color = Color.New(var_214_17, var_214_17, var_214_17)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_14 + var_214_15 and arg_211_1.time_ < var_214_14 + var_214_15 + arg_214_0 and arg_211_1.var_.actorSpriteComps10030 then
				local var_214_18 = 1

				for iter_214_3, iter_214_4 in pairs(arg_211_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_214_4 then
						iter_214_4.color = Color.New(var_214_18, var_214_18, var_214_18)
					end
				end

				arg_211_1.var_.actorSpriteComps10030 = nil
			end

			local var_214_19 = 0
			local var_214_20 = 0.45

			if var_214_19 < arg_211_1.time_ and arg_211_1.time_ <= var_214_19 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_21 = arg_211_1:FormatText(StoryNameCfg[309].name)

				arg_211_1.leftNameTxt_.text = var_214_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_22 = arg_211_1:GetWordFromCfg(115281049)
				local var_214_23 = arg_211_1:FormatText(var_214_22.content)

				arg_211_1.text_.text = var_214_23

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_24 = 18
				local var_214_25 = utf8.len(var_214_23)
				local var_214_26 = var_214_24 <= 0 and var_214_20 or var_214_20 * (var_214_25 / var_214_24)

				if var_214_26 > 0 and var_214_20 < var_214_26 then
					arg_211_1.talkMaxDuration = var_214_26

					if var_214_26 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_26 + var_214_19
					end
				end

				arg_211_1.text_.text = var_214_23
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281049", "story_v_out_115281.awb") ~= 0 then
					local var_214_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281049", "story_v_out_115281.awb") / 1000

					if var_214_27 + var_214_19 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_27 + var_214_19
					end

					if var_214_22.prefab_name ~= "" and arg_211_1.actors_[var_214_22.prefab_name] ~= nil then
						local var_214_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_22.prefab_name].transform, "story_v_out_115281", "115281049", "story_v_out_115281.awb")

						arg_211_1:RecordAudio("115281049", var_214_28)
						arg_211_1:RecordAudio("115281049", var_214_28)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_115281", "115281049", "story_v_out_115281.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_115281", "115281049", "story_v_out_115281.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_29 = math.max(var_214_20, arg_211_1.talkMaxDuration)

			if var_214_19 <= arg_211_1.time_ and arg_211_1.time_ < var_214_19 + var_214_29 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_19) / var_214_29

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_19 + var_214_29 and arg_211_1.time_ < var_214_19 + var_214_29 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play115281050 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 115281050
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play115281051(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10030"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.actorSpriteComps10030 == nil then
				arg_215_1.var_.actorSpriteComps10030 = var_218_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.actorSpriteComps10030 then
					for iter_218_0, iter_218_1 in pairs(arg_215_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_218_1 then
							local var_218_4 = Mathf.Lerp(iter_218_1.color.r, 0.5, var_218_3)

							iter_218_1.color = Color.New(var_218_4, var_218_4, var_218_4)
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.actorSpriteComps10030 then
				local var_218_5 = 0.5

				for iter_218_2, iter_218_3 in pairs(arg_215_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_218_3 then
						iter_218_3.color = Color.New(var_218_5, var_218_5, var_218_5)
					end
				end

				arg_215_1.var_.actorSpriteComps10030 = nil
			end

			local var_218_6 = 0
			local var_218_7 = 0.775

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_8 = arg_215_1:GetWordFromCfg(115281050)
				local var_218_9 = arg_215_1:FormatText(var_218_8.content)

				arg_215_1.text_.text = var_218_9

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_10 = 31
				local var_218_11 = utf8.len(var_218_9)
				local var_218_12 = var_218_10 <= 0 and var_218_7 or var_218_7 * (var_218_11 / var_218_10)

				if var_218_12 > 0 and var_218_7 < var_218_12 then
					arg_215_1.talkMaxDuration = var_218_12

					if var_218_12 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_12 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_9
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_13 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_13 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_13

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_13 and arg_215_1.time_ < var_218_6 + var_218_13 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play115281051 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 115281051
		arg_219_1.duration_ = 12.266

		local var_219_0 = {
			ja = 12.266,
			ko = 8.733,
			zh = 8.1,
			en = 9.933
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
				arg_219_0:Play115281052(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10030"].transform
			local var_222_1 = 2

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10030 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10030", 7)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "split_1" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(0, -2000, 150)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10030, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = false

				arg_219_1:SetGaussion(false)
			end

			local var_222_8 = 2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8
				local var_222_10 = Color.New(0, 0, 0)

				var_222_10.a = Mathf.Lerp(0, 1, var_222_9)
				arg_219_1.mask_.color = var_222_10
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 then
				local var_222_11 = Color.New(0, 0, 0)

				var_222_11.a = 1
				arg_219_1.mask_.color = var_222_11
			end

			local var_222_12 = 2

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.mask_.enabled = true
				arg_219_1.mask_.raycastTarget = false

				arg_219_1:SetGaussion(false)
			end

			local var_222_13 = 2

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_13 then
				local var_222_14 = (arg_219_1.time_ - var_222_12) / var_222_13
				local var_222_15 = Color.New(0, 0, 0)

				var_222_15.a = Mathf.Lerp(1, 0, var_222_14)
				arg_219_1.mask_.color = var_222_15
			end

			if arg_219_1.time_ >= var_222_12 + var_222_13 and arg_219_1.time_ < var_222_12 + var_222_13 + arg_222_0 then
				local var_222_16 = Color.New(0, 0, 0)
				local var_222_17 = 0

				arg_219_1.mask_.enabled = false
				var_222_16.a = var_222_17
				arg_219_1.mask_.color = var_222_16
			end

			local var_222_18 = 0

			if var_222_18 < arg_219_1.time_ and arg_219_1.time_ <= var_222_18 + arg_222_0 then
				arg_219_1.screenFilterGo_:SetActive(true)

				arg_219_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_222_19 = 4

			if var_222_18 <= arg_219_1.time_ and arg_219_1.time_ < var_222_18 + var_222_19 then
				local var_222_20 = (arg_219_1.time_ - var_222_18) / var_222_19

				arg_219_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_222_20)
			end

			if arg_219_1.time_ >= var_222_18 + var_222_19 and arg_219_1.time_ < var_222_18 + var_222_19 + arg_222_0 then
				arg_219_1.screenFilterEffect_.weight = 1
			end

			if arg_219_1.frameCnt_ <= 1 then
				arg_219_1.dialog_:SetActive(false)
			end

			local var_222_21 = 4
			local var_222_22 = 0.525

			if var_222_21 < arg_219_1.time_ and arg_219_1.time_ <= var_222_21 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0

				arg_219_1.dialog_:SetActive(true)

				local var_222_23 = LeanTween.value(arg_219_1.dialog_, 0, 1, 0.3)

				var_222_23:setOnUpdate(LuaHelper.FloatAction(function(arg_223_0)
					arg_219_1.dialogCg_.alpha = arg_223_0
				end))
				var_222_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_219_1.dialog_)
					var_222_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_219_1.duration_ = arg_219_1.duration_ + 0.3

				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_24 = arg_219_1:FormatText(StoryNameCfg[104].name)

				arg_219_1.leftNameTxt_.text = var_222_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_25 = arg_219_1:GetWordFromCfg(115281051)
				local var_222_26 = arg_219_1:FormatText(var_222_25.content)

				arg_219_1.text_.text = var_222_26

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_27 = 21
				local var_222_28 = utf8.len(var_222_26)
				local var_222_29 = var_222_27 <= 0 and var_222_22 or var_222_22 * (var_222_28 / var_222_27)

				if var_222_29 > 0 and var_222_22 < var_222_29 then
					arg_219_1.talkMaxDuration = var_222_29
					var_222_21 = var_222_21 + 0.3

					if var_222_29 + var_222_21 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_29 + var_222_21
					end
				end

				arg_219_1.text_.text = var_222_26
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281051", "story_v_out_115281.awb") ~= 0 then
					local var_222_30 = manager.audio:GetVoiceLength("story_v_out_115281", "115281051", "story_v_out_115281.awb") / 1000

					if var_222_30 + var_222_21 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_30 + var_222_21
					end

					if var_222_25.prefab_name ~= "" and arg_219_1.actors_[var_222_25.prefab_name] ~= nil then
						local var_222_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_25.prefab_name].transform, "story_v_out_115281", "115281051", "story_v_out_115281.awb")

						arg_219_1:RecordAudio("115281051", var_222_31)
						arg_219_1:RecordAudio("115281051", var_222_31)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_115281", "115281051", "story_v_out_115281.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_115281", "115281051", "story_v_out_115281.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_32 = var_222_21 + 0.3
			local var_222_33 = math.max(var_222_22, arg_219_1.talkMaxDuration)

			if var_222_32 <= arg_219_1.time_ and arg_219_1.time_ < var_222_32 + var_222_33 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_32) / var_222_33

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_32 + var_222_33 and arg_219_1.time_ < var_222_32 + var_222_33 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play115281052 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115281052
		arg_225_1.duration_ = 3.3

		local var_225_0 = {
			ja = 3.3,
			ko = 2.666,
			zh = 2.533,
			en = 2.9
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
				arg_225_0:Play115281053(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.3

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[105].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, true)
				arg_225_1.iconController_:SetSelectedState("hero")

				arg_225_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(115281052)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 12
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281052", "story_v_out_115281.awb") ~= 0 then
					local var_228_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281052", "story_v_out_115281.awb") / 1000

					if var_228_8 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_8 + var_228_0
					end

					if var_228_3.prefab_name ~= "" and arg_225_1.actors_[var_228_3.prefab_name] ~= nil then
						local var_228_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_3.prefab_name].transform, "story_v_out_115281", "115281052", "story_v_out_115281.awb")

						arg_225_1:RecordAudio("115281052", var_228_9)
						arg_225_1:RecordAudio("115281052", var_228_9)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_115281", "115281052", "story_v_out_115281.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_115281", "115281052", "story_v_out_115281.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_10 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_10 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_10

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_10 and arg_225_1.time_ < var_228_0 + var_228_10 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play115281053 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115281053
		arg_229_1.duration_ = 5.9

		local var_229_0 = {
			ja = 3.766,
			ko = 3.666,
			zh = 4.366,
			en = 5.9
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
				arg_229_0:Play115281054(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10030"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps10030 == nil then
				arg_229_1.var_.actorSpriteComps10030 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps10030 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 1, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps10030 then
				local var_232_5 = 1

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps10030 = nil
			end

			local var_232_6 = arg_229_1.actors_["10030"].transform
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 then
				arg_229_1.var_.moveOldPos10030 = var_232_6.localPosition
				var_232_6.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("10030", 3)

				local var_232_8 = var_232_6.childCount

				for iter_232_4 = 0, var_232_8 - 1 do
					local var_232_9 = var_232_6:GetChild(iter_232_4)

					if var_232_9.name == "split_1" or not string.find(var_232_9.name, "split") then
						var_232_9.gameObject:SetActive(true)
					else
						var_232_9.gameObject:SetActive(false)
					end
				end
			end

			local var_232_10 = 0.001

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_10 then
				local var_232_11 = (arg_229_1.time_ - var_232_7) / var_232_10
				local var_232_12 = Vector3.New(0, -390, 150)

				var_232_6.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10030, var_232_12, var_232_11)
			end

			if arg_229_1.time_ >= var_232_7 + var_232_10 and arg_229_1.time_ < var_232_7 + var_232_10 + arg_232_0 then
				var_232_6.localPosition = Vector3.New(0, -390, 150)
			end

			local var_232_13 = arg_229_1.actors_["10030"]
			local var_232_14 = 0.0083333333333333

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 then
				local var_232_15 = var_232_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_232_15 then
					arg_229_1.var_.alphaOldValue10030 = var_232_15.alpha
					arg_229_1.var_.characterEffect10030 = var_232_15
				end

				arg_229_1.var_.alphaOldValue10030 = 0
			end

			local var_232_16 = 0.333333333333333

			if var_232_14 <= arg_229_1.time_ and arg_229_1.time_ < var_232_14 + var_232_16 then
				local var_232_17 = (arg_229_1.time_ - var_232_14) / var_232_16
				local var_232_18 = Mathf.Lerp(arg_229_1.var_.alphaOldValue10030, 1, var_232_17)

				if arg_229_1.var_.characterEffect10030 then
					arg_229_1.var_.characterEffect10030.alpha = var_232_18
				end
			end

			if arg_229_1.time_ >= var_232_14 + var_232_16 and arg_229_1.time_ < var_232_14 + var_232_16 + arg_232_0 and arg_229_1.var_.characterEffect10030 then
				arg_229_1.var_.characterEffect10030.alpha = 1
			end

			local var_232_19 = 0
			local var_232_20 = 0.325

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[309].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(115281053)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 13
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281053", "story_v_out_115281.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281053", "story_v_out_115281.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_115281", "115281053", "story_v_out_115281.awb")

						arg_229_1:RecordAudio("115281053", var_232_28)
						arg_229_1:RecordAudio("115281053", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115281", "115281053", "story_v_out_115281.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115281", "115281053", "story_v_out_115281.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115281054 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 115281054
		arg_233_1.duration_ = 9.833

		local var_233_0 = {
			ja = 9.833,
			ko = 6.366,
			zh = 5.7,
			en = 6.866
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
				arg_233_0:Play115281055(arg_233_1)
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
							local var_236_4 = Mathf.Lerp(iter_236_1.color.r, 0.5, var_236_3)

							iter_236_1.color = Color.New(var_236_4, var_236_4, var_236_4)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.actorSpriteComps10030 then
				local var_236_5 = 0.5

				for iter_236_2, iter_236_3 in pairs(arg_233_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_236_3 then
						iter_236_3.color = Color.New(var_236_5, var_236_5, var_236_5)
					end
				end

				arg_233_1.var_.actorSpriteComps10030 = nil
			end

			local var_236_6 = 0
			local var_236_7 = 0.725

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[105].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, true)
				arg_233_1.iconController_:SetSelectedState("hero")

				arg_233_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_9 = arg_233_1:GetWordFromCfg(115281054)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281054", "story_v_out_115281.awb") ~= 0 then
					local var_236_14 = manager.audio:GetVoiceLength("story_v_out_115281", "115281054", "story_v_out_115281.awb") / 1000

					if var_236_14 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_14 + var_236_6
					end

					if var_236_9.prefab_name ~= "" and arg_233_1.actors_[var_236_9.prefab_name] ~= nil then
						local var_236_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_9.prefab_name].transform, "story_v_out_115281", "115281054", "story_v_out_115281.awb")

						arg_233_1:RecordAudio("115281054", var_236_15)
						arg_233_1:RecordAudio("115281054", var_236_15)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_115281", "115281054", "story_v_out_115281.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_115281", "115281054", "story_v_out_115281.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_16 = math.max(var_236_7, arg_233_1.talkMaxDuration)

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_16 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_6) / var_236_16

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_6 + var_236_16 and arg_233_1.time_ < var_236_6 + var_236_16 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play115281055 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115281055
		arg_237_1.duration_ = 8.366

		local var_237_0 = {
			ja = 8.133,
			ko = 5.966,
			zh = 5,
			en = 8.366
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
				arg_237_0:Play115281056(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.675

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[104].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, true)
				arg_237_1.iconController_:SetSelectedState("hero")

				arg_237_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(115281055)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281055", "story_v_out_115281.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281055", "story_v_out_115281.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_115281", "115281055", "story_v_out_115281.awb")

						arg_237_1:RecordAudio("115281055", var_240_9)
						arg_237_1:RecordAudio("115281055", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_115281", "115281055", "story_v_out_115281.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_115281", "115281055", "story_v_out_115281.awb")
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
	Play115281056 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115281056
		arg_241_1.duration_ = 8.366

		local var_241_0 = {
			ja = 8.366,
			ko = 4.7,
			zh = 4.433,
			en = 4.6
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
				arg_241_0:Play115281057(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10030"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos10030 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10030", 3)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "split_2" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(0, -390, 150)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10030, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_244_7 = arg_241_1.actors_["10030"]
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 == nil then
				arg_241_1.var_.actorSpriteComps10030 = var_244_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_9 = 0.2

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_9 then
				local var_244_10 = (arg_241_1.time_ - var_244_8) / var_244_9

				if arg_241_1.var_.actorSpriteComps10030 then
					for iter_244_1, iter_244_2 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_244_2 then
							local var_244_11 = Mathf.Lerp(iter_244_2.color.r, 1, var_244_10)

							iter_244_2.color = Color.New(var_244_11, var_244_11, var_244_11)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_8 + var_244_9 and arg_241_1.time_ < var_244_8 + var_244_9 + arg_244_0 and arg_241_1.var_.actorSpriteComps10030 then
				local var_244_12 = 1

				for iter_244_3, iter_244_4 in pairs(arg_241_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_244_4 then
						iter_244_4.color = Color.New(var_244_12, var_244_12, var_244_12)
					end
				end

				arg_241_1.var_.actorSpriteComps10030 = nil
			end

			local var_244_13 = 0
			local var_244_14 = 0.35

			if var_244_13 < arg_241_1.time_ and arg_241_1.time_ <= var_244_13 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_15 = arg_241_1:FormatText(StoryNameCfg[309].name)

				arg_241_1.leftNameTxt_.text = var_244_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_16 = arg_241_1:GetWordFromCfg(115281056)
				local var_244_17 = arg_241_1:FormatText(var_244_16.content)

				arg_241_1.text_.text = var_244_17

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_18 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281056", "story_v_out_115281.awb") ~= 0 then
					local var_244_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281056", "story_v_out_115281.awb") / 1000

					if var_244_21 + var_244_13 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_21 + var_244_13
					end

					if var_244_16.prefab_name ~= "" and arg_241_1.actors_[var_244_16.prefab_name] ~= nil then
						local var_244_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_16.prefab_name].transform, "story_v_out_115281", "115281056", "story_v_out_115281.awb")

						arg_241_1:RecordAudio("115281056", var_244_22)
						arg_241_1:RecordAudio("115281056", var_244_22)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115281", "115281056", "story_v_out_115281.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115281", "115281056", "story_v_out_115281.awb")
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
	Play115281057 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115281057
		arg_245_1.duration_ = 9.866

		local var_245_0 = {
			ja = 9.866,
			ko = 7.5,
			zh = 8.933,
			en = 7.633
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
				arg_245_0:Play115281058(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10030"].transform
			local var_248_1 = 2

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos10030 = var_248_0.localPosition
				var_248_0.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10030", 0)

				local var_248_2 = var_248_0.childCount

				for iter_248_0 = 0, var_248_2 - 1 do
					local var_248_3 = var_248_0:GetChild(iter_248_0)

					if var_248_3.name == "split_2" or not string.find(var_248_3.name, "split") then
						var_248_3.gameObject:SetActive(true)
					else
						var_248_3.gameObject:SetActive(false)
					end
				end
			end

			local var_248_4 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_4 then
				local var_248_5 = (arg_245_1.time_ - var_248_1) / var_248_4
				local var_248_6 = Vector3.New(-2000, -390, 150)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10030, var_248_6, var_248_5)
			end

			if arg_245_1.time_ >= var_248_1 + var_248_4 and arg_245_1.time_ < var_248_1 + var_248_4 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-2000, -390, 150)
			end

			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = false

				arg_245_1:SetGaussion(false)
			end

			local var_248_8 = 2

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_8 then
				local var_248_9 = (arg_245_1.time_ - var_248_7) / var_248_8
				local var_248_10 = Color.New(0, 0, 0)

				var_248_10.a = Mathf.Lerp(0, 1, var_248_9)
				arg_245_1.mask_.color = var_248_10
			end

			if arg_245_1.time_ >= var_248_7 + var_248_8 and arg_245_1.time_ < var_248_7 + var_248_8 + arg_248_0 then
				local var_248_11 = Color.New(0, 0, 0)

				var_248_11.a = 1
				arg_245_1.mask_.color = var_248_11
			end

			local var_248_12 = 2

			if var_248_12 < arg_245_1.time_ and arg_245_1.time_ <= var_248_12 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = false

				arg_245_1:SetGaussion(false)
			end

			local var_248_13 = 2

			if var_248_12 <= arg_245_1.time_ and arg_245_1.time_ < var_248_12 + var_248_13 then
				local var_248_14 = (arg_245_1.time_ - var_248_12) / var_248_13
				local var_248_15 = Color.New(0, 0, 0)

				var_248_15.a = Mathf.Lerp(1, 0, var_248_14)
				arg_245_1.mask_.color = var_248_15
			end

			if arg_245_1.time_ >= var_248_12 + var_248_13 and arg_245_1.time_ < var_248_12 + var_248_13 + arg_248_0 then
				local var_248_16 = Color.New(0, 0, 0)
				local var_248_17 = 0

				arg_245_1.mask_.enabled = false
				var_248_16.a = var_248_17
				arg_245_1.mask_.color = var_248_16
			end

			local var_248_18 = 2

			if var_248_18 < arg_245_1.time_ and arg_245_1.time_ <= var_248_18 + arg_248_0 then
				arg_245_1.screenFilterGo_:SetActive(false)
			end

			local var_248_19 = 0.0166666666666667

			if var_248_18 <= arg_245_1.time_ and arg_245_1.time_ < var_248_18 + var_248_19 then
				local var_248_20 = (arg_245_1.time_ - var_248_18) / var_248_19

				arg_245_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_248_20)
			end

			if arg_245_1.time_ >= var_248_18 + var_248_19 and arg_245_1.time_ < var_248_18 + var_248_19 + arg_248_0 then
				arg_245_1.screenFilterEffect_.weight = 0
			end

			if arg_245_1.frameCnt_ <= 1 then
				arg_245_1.dialog_:SetActive(false)
			end

			local var_248_21 = 4
			local var_248_22 = 0.425

			if var_248_21 < arg_245_1.time_ and arg_245_1.time_ <= var_248_21 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				arg_245_1.dialog_:SetActive(true)

				local var_248_23 = LeanTween.value(arg_245_1.dialog_, 0, 1, 0.3)

				var_248_23:setOnUpdate(LuaHelper.FloatAction(function(arg_249_0)
					arg_245_1.dialogCg_.alpha = arg_249_0
				end))
				var_248_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_245_1.dialog_)
					var_248_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_245_1.duration_ = arg_245_1.duration_ + 0.3

				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_24 = arg_245_1:FormatText(StoryNameCfg[36].name)

				arg_245_1.leftNameTxt_.text = var_248_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_25 = arg_245_1:GetWordFromCfg(115281057)
				local var_248_26 = arg_245_1:FormatText(var_248_25.content)

				arg_245_1.text_.text = var_248_26

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_27 = 17
				local var_248_28 = utf8.len(var_248_26)
				local var_248_29 = var_248_27 <= 0 and var_248_22 or var_248_22 * (var_248_28 / var_248_27)

				if var_248_29 > 0 and var_248_22 < var_248_29 then
					arg_245_1.talkMaxDuration = var_248_29
					var_248_21 = var_248_21 + 0.3

					if var_248_29 + var_248_21 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_29 + var_248_21
					end
				end

				arg_245_1.text_.text = var_248_26
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281057", "story_v_out_115281.awb") ~= 0 then
					local var_248_30 = manager.audio:GetVoiceLength("story_v_out_115281", "115281057", "story_v_out_115281.awb") / 1000

					if var_248_30 + var_248_21 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_30 + var_248_21
					end

					if var_248_25.prefab_name ~= "" and arg_245_1.actors_[var_248_25.prefab_name] ~= nil then
						local var_248_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_25.prefab_name].transform, "story_v_out_115281", "115281057", "story_v_out_115281.awb")

						arg_245_1:RecordAudio("115281057", var_248_31)
						arg_245_1:RecordAudio("115281057", var_248_31)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_115281", "115281057", "story_v_out_115281.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_115281", "115281057", "story_v_out_115281.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_32 = var_248_21 + 0.3
			local var_248_33 = math.max(var_248_22, arg_245_1.talkMaxDuration)

			if var_248_32 <= arg_245_1.time_ and arg_245_1.time_ < var_248_32 + var_248_33 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_32) / var_248_33

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_32 + var_248_33 and arg_245_1.time_ < var_248_32 + var_248_33 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115281058 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 115281058
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play115281059(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 1.225

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

				local var_254_2 = arg_251_1:GetWordFromCfg(115281058)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 49
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
	Play115281059 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 115281059
		arg_255_1.duration_ = 3.966

		local var_255_0 = {
			ja = 3.433,
			ko = 3.2,
			zh = 3.466,
			en = 3.966
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
				arg_255_0:Play115281060(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10030"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos10030 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("10030", 4)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "split_1" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(390, -390, 150)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10030, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_258_7 = "1038"

			if arg_255_1.actors_[var_258_7] == nil then
				local var_258_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_258_7), arg_255_1.canvasGo_.transform)

				var_258_8.transform:SetSiblingIndex(1)

				var_258_8.name = var_258_7
				var_258_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_255_1.actors_[var_258_7] = var_258_8
			end

			local var_258_9 = arg_255_1.actors_["1038"].transform
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.var_.moveOldPos1038 = var_258_9.localPosition
				var_258_9.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1038", 2)

				local var_258_11 = var_258_9.childCount

				for iter_258_1 = 0, var_258_11 - 1 do
					local var_258_12 = var_258_9:GetChild(iter_258_1)

					if var_258_12.name == "split_1" or not string.find(var_258_12.name, "split") then
						var_258_12.gameObject:SetActive(true)
					else
						var_258_12.gameObject:SetActive(false)
					end
				end
			end

			local var_258_13 = 0.001

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_13 then
				local var_258_14 = (arg_255_1.time_ - var_258_10) / var_258_13
				local var_258_15 = Vector3.New(-390, -400, 0)

				var_258_9.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1038, var_258_15, var_258_14)
			end

			if arg_255_1.time_ >= var_258_10 + var_258_13 and arg_255_1.time_ < var_258_10 + var_258_13 + arg_258_0 then
				var_258_9.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_258_16 = arg_255_1.actors_["10030"]
			local var_258_17 = 0

			if var_258_17 < arg_255_1.time_ and arg_255_1.time_ <= var_258_17 + arg_258_0 and arg_255_1.var_.actorSpriteComps10030 == nil then
				arg_255_1.var_.actorSpriteComps10030 = var_258_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_18 = 0.2

			if var_258_17 <= arg_255_1.time_ and arg_255_1.time_ < var_258_17 + var_258_18 then
				local var_258_19 = (arg_255_1.time_ - var_258_17) / var_258_18

				if arg_255_1.var_.actorSpriteComps10030 then
					for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_258_3 then
							local var_258_20 = Mathf.Lerp(iter_258_3.color.r, 1, var_258_19)

							iter_258_3.color = Color.New(var_258_20, var_258_20, var_258_20)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_17 + var_258_18 and arg_255_1.time_ < var_258_17 + var_258_18 + arg_258_0 and arg_255_1.var_.actorSpriteComps10030 then
				local var_258_21 = 1

				for iter_258_4, iter_258_5 in pairs(arg_255_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_258_5 then
						iter_258_5.color = Color.New(var_258_21, var_258_21, var_258_21)
					end
				end

				arg_255_1.var_.actorSpriteComps10030 = nil
			end

			local var_258_22 = arg_255_1.actors_["10030"]
			local var_258_23 = 0

			if var_258_23 < arg_255_1.time_ and arg_255_1.time_ <= var_258_23 + arg_258_0 then
				local var_258_24 = var_258_22:GetComponentInChildren(typeof(CanvasGroup))

				if var_258_24 then
					arg_255_1.var_.alphaOldValue10030 = var_258_24.alpha
					arg_255_1.var_.characterEffect10030 = var_258_24
				end

				arg_255_1.var_.alphaOldValue10030 = 0
			end

			local var_258_25 = 0.333333333333333

			if var_258_23 <= arg_255_1.time_ and arg_255_1.time_ < var_258_23 + var_258_25 then
				local var_258_26 = (arg_255_1.time_ - var_258_23) / var_258_25
				local var_258_27 = Mathf.Lerp(arg_255_1.var_.alphaOldValue10030, 1, var_258_26)

				if arg_255_1.var_.characterEffect10030 then
					arg_255_1.var_.characterEffect10030.alpha = var_258_27
				end
			end

			if arg_255_1.time_ >= var_258_23 + var_258_25 and arg_255_1.time_ < var_258_23 + var_258_25 + arg_258_0 and arg_255_1.var_.characterEffect10030 then
				arg_255_1.var_.characterEffect10030.alpha = 1
			end

			local var_258_28 = arg_255_1.actors_["1038"]
			local var_258_29 = 0

			if var_258_29 < arg_255_1.time_ and arg_255_1.time_ <= var_258_29 + arg_258_0 then
				local var_258_30 = var_258_28:GetComponentInChildren(typeof(CanvasGroup))

				if var_258_30 then
					arg_255_1.var_.alphaOldValue1038 = var_258_30.alpha
					arg_255_1.var_.characterEffect1038 = var_258_30
				end

				arg_255_1.var_.alphaOldValue1038 = 0
			end

			local var_258_31 = 0.333333333333333

			if var_258_29 <= arg_255_1.time_ and arg_255_1.time_ < var_258_29 + var_258_31 then
				local var_258_32 = (arg_255_1.time_ - var_258_29) / var_258_31
				local var_258_33 = Mathf.Lerp(arg_255_1.var_.alphaOldValue1038, 1, var_258_32)

				if arg_255_1.var_.characterEffect1038 then
					arg_255_1.var_.characterEffect1038.alpha = var_258_33
				end
			end

			if arg_255_1.time_ >= var_258_29 + var_258_31 and arg_255_1.time_ < var_258_29 + var_258_31 + arg_258_0 and arg_255_1.var_.characterEffect1038 then
				arg_255_1.var_.characterEffect1038.alpha = 1
			end

			local var_258_34 = arg_255_1.actors_["1038"]
			local var_258_35 = 0

			if var_258_35 < arg_255_1.time_ and arg_255_1.time_ <= var_258_35 + arg_258_0 and arg_255_1.var_.actorSpriteComps1038 == nil then
				arg_255_1.var_.actorSpriteComps1038 = var_258_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_36 = 0.0166666666666667

			if var_258_35 <= arg_255_1.time_ and arg_255_1.time_ < var_258_35 + var_258_36 then
				local var_258_37 = (arg_255_1.time_ - var_258_35) / var_258_36

				if arg_255_1.var_.actorSpriteComps1038 then
					for iter_258_6, iter_258_7 in pairs(arg_255_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_258_7 then
							local var_258_38 = Mathf.Lerp(iter_258_7.color.r, 0.5, var_258_37)

							iter_258_7.color = Color.New(var_258_38, var_258_38, var_258_38)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_35 + var_258_36 and arg_255_1.time_ < var_258_35 + var_258_36 + arg_258_0 and arg_255_1.var_.actorSpriteComps1038 then
				local var_258_39 = 0.5

				for iter_258_8, iter_258_9 in pairs(arg_255_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_258_9 then
						iter_258_9.color = Color.New(var_258_39, var_258_39, var_258_39)
					end
				end

				arg_255_1.var_.actorSpriteComps1038 = nil
			end

			local var_258_40 = 0
			local var_258_41 = 0.325

			if var_258_40 < arg_255_1.time_ and arg_255_1.time_ <= var_258_40 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_42 = arg_255_1:FormatText(StoryNameCfg[309].name)

				arg_255_1.leftNameTxt_.text = var_258_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_43 = arg_255_1:GetWordFromCfg(115281059)
				local var_258_44 = arg_255_1:FormatText(var_258_43.content)

				arg_255_1.text_.text = var_258_44

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_45 = 13
				local var_258_46 = utf8.len(var_258_44)
				local var_258_47 = var_258_45 <= 0 and var_258_41 or var_258_41 * (var_258_46 / var_258_45)

				if var_258_47 > 0 and var_258_41 < var_258_47 then
					arg_255_1.talkMaxDuration = var_258_47

					if var_258_47 + var_258_40 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_47 + var_258_40
					end
				end

				arg_255_1.text_.text = var_258_44
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281059", "story_v_out_115281.awb") ~= 0 then
					local var_258_48 = manager.audio:GetVoiceLength("story_v_out_115281", "115281059", "story_v_out_115281.awb") / 1000

					if var_258_48 + var_258_40 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_48 + var_258_40
					end

					if var_258_43.prefab_name ~= "" and arg_255_1.actors_[var_258_43.prefab_name] ~= nil then
						local var_258_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_43.prefab_name].transform, "story_v_out_115281", "115281059", "story_v_out_115281.awb")

						arg_255_1:RecordAudio("115281059", var_258_49)
						arg_255_1:RecordAudio("115281059", var_258_49)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_115281", "115281059", "story_v_out_115281.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_115281", "115281059", "story_v_out_115281.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_50 = math.max(var_258_41, arg_255_1.talkMaxDuration)

			if var_258_40 <= arg_255_1.time_ and arg_255_1.time_ < var_258_40 + var_258_50 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_40) / var_258_50

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_40 + var_258_50 and arg_255_1.time_ < var_258_40 + var_258_50 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play115281060 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 115281060
		arg_259_1.duration_ = 4.033

		local var_259_0 = {
			ja = 2.333,
			ko = 3.966,
			zh = 4.033,
			en = 3.2
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
				arg_259_0:Play115281061(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1038"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1038 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("1038", 2)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_1" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(-390, -400, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1038, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_262_7 = arg_259_1.actors_["10030"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps10030 == nil then
				arg_259_1.var_.actorSpriteComps10030 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.2

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps10030 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 0.5, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps10030 then
				local var_262_12 = 0.5

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps10030 = nil
			end

			local var_262_13 = arg_259_1.actors_["1038"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps1038 == nil then
				arg_259_1.var_.actorSpriteComps1038 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.2

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps1038 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 1, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1038 then
				local var_262_18 = 1

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps1038 = nil
			end

			local var_262_19 = 0
			local var_262_20 = 0.4

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_21 = arg_259_1:FormatText(StoryNameCfg[94].name)

				arg_259_1.leftNameTxt_.text = var_262_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_22 = arg_259_1:GetWordFromCfg(115281060)
				local var_262_23 = arg_259_1:FormatText(var_262_22.content)

				arg_259_1.text_.text = var_262_23

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_24 = 16
				local var_262_25 = utf8.len(var_262_23)
				local var_262_26 = var_262_24 <= 0 and var_262_20 or var_262_20 * (var_262_25 / var_262_24)

				if var_262_26 > 0 and var_262_20 < var_262_26 then
					arg_259_1.talkMaxDuration = var_262_26

					if var_262_26 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_26 + var_262_19
					end
				end

				arg_259_1.text_.text = var_262_23
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281060", "story_v_out_115281.awb") ~= 0 then
					local var_262_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281060", "story_v_out_115281.awb") / 1000

					if var_262_27 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_27 + var_262_19
					end

					if var_262_22.prefab_name ~= "" and arg_259_1.actors_[var_262_22.prefab_name] ~= nil then
						local var_262_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_22.prefab_name].transform, "story_v_out_115281", "115281060", "story_v_out_115281.awb")

						arg_259_1:RecordAudio("115281060", var_262_28)
						arg_259_1:RecordAudio("115281060", var_262_28)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_115281", "115281060", "story_v_out_115281.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_115281", "115281060", "story_v_out_115281.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_29 = math.max(var_262_20, arg_259_1.talkMaxDuration)

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_29 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_19) / var_262_29

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_19 + var_262_29 and arg_259_1.time_ < var_262_19 + var_262_29 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play115281061 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 115281061
		arg_263_1.duration_ = 8.4

		local var_263_0 = {
			ja = 8.4,
			ko = 3.766,
			zh = 4.9,
			en = 5.166
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play115281062(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.475

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[94].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(115281061)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 19
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281061", "story_v_out_115281.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281061", "story_v_out_115281.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_out_115281", "115281061", "story_v_out_115281.awb")

						arg_263_1:RecordAudio("115281061", var_266_9)
						arg_263_1:RecordAudio("115281061", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_115281", "115281061", "story_v_out_115281.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_115281", "115281061", "story_v_out_115281.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play115281062 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 115281062
		arg_267_1.duration_ = 6.333

		local var_267_0 = {
			ja = 6.333,
			ko = 3.6,
			zh = 3.1,
			en = 4.033
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
				arg_267_0:Play115281063(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10030"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.actorSpriteComps10030 == nil then
				arg_267_1.var_.actorSpriteComps10030 = var_270_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_2 = 0.2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.actorSpriteComps10030 then
					for iter_270_0, iter_270_1 in pairs(arg_267_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_270_1 then
							local var_270_4 = Mathf.Lerp(iter_270_1.color.r, 1, var_270_3)

							iter_270_1.color = Color.New(var_270_4, var_270_4, var_270_4)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.actorSpriteComps10030 then
				local var_270_5 = 1

				for iter_270_2, iter_270_3 in pairs(arg_267_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_270_3 then
						iter_270_3.color = Color.New(var_270_5, var_270_5, var_270_5)
					end
				end

				arg_267_1.var_.actorSpriteComps10030 = nil
			end

			local var_270_6 = arg_267_1.actors_["1038"]
			local var_270_7 = 0

			if var_270_7 < arg_267_1.time_ and arg_267_1.time_ <= var_270_7 + arg_270_0 and arg_267_1.var_.actorSpriteComps1038 == nil then
				arg_267_1.var_.actorSpriteComps1038 = var_270_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_8 = 0.2

			if var_270_7 <= arg_267_1.time_ and arg_267_1.time_ < var_270_7 + var_270_8 then
				local var_270_9 = (arg_267_1.time_ - var_270_7) / var_270_8

				if arg_267_1.var_.actorSpriteComps1038 then
					for iter_270_4, iter_270_5 in pairs(arg_267_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_270_5 then
							local var_270_10 = Mathf.Lerp(iter_270_5.color.r, 0.5, var_270_9)

							iter_270_5.color = Color.New(var_270_10, var_270_10, var_270_10)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_7 + var_270_8 and arg_267_1.time_ < var_270_7 + var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps1038 then
				local var_270_11 = 0.5

				for iter_270_6, iter_270_7 in pairs(arg_267_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_270_7 then
						iter_270_7.color = Color.New(var_270_11, var_270_11, var_270_11)
					end
				end

				arg_267_1.var_.actorSpriteComps1038 = nil
			end

			local var_270_12 = 0
			local var_270_13 = 0.35

			if var_270_12 < arg_267_1.time_ and arg_267_1.time_ <= var_270_12 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_14 = arg_267_1:FormatText(StoryNameCfg[309].name)

				arg_267_1.leftNameTxt_.text = var_270_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_15 = arg_267_1:GetWordFromCfg(115281062)
				local var_270_16 = arg_267_1:FormatText(var_270_15.content)

				arg_267_1.text_.text = var_270_16

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_17 = 14
				local var_270_18 = utf8.len(var_270_16)
				local var_270_19 = var_270_17 <= 0 and var_270_13 or var_270_13 * (var_270_18 / var_270_17)

				if var_270_19 > 0 and var_270_13 < var_270_19 then
					arg_267_1.talkMaxDuration = var_270_19

					if var_270_19 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_19 + var_270_12
					end
				end

				arg_267_1.text_.text = var_270_16
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281062", "story_v_out_115281.awb") ~= 0 then
					local var_270_20 = manager.audio:GetVoiceLength("story_v_out_115281", "115281062", "story_v_out_115281.awb") / 1000

					if var_270_20 + var_270_12 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_20 + var_270_12
					end

					if var_270_15.prefab_name ~= "" and arg_267_1.actors_[var_270_15.prefab_name] ~= nil then
						local var_270_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_15.prefab_name].transform, "story_v_out_115281", "115281062", "story_v_out_115281.awb")

						arg_267_1:RecordAudio("115281062", var_270_21)
						arg_267_1:RecordAudio("115281062", var_270_21)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_115281", "115281062", "story_v_out_115281.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_115281", "115281062", "story_v_out_115281.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_13, arg_267_1.talkMaxDuration)

			if var_270_12 <= arg_267_1.time_ and arg_267_1.time_ < var_270_12 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_12) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_12 + var_270_22 and arg_267_1.time_ < var_270_12 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play115281063 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 115281063
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play115281064(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["10030"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps10030 == nil then
				arg_271_1.var_.actorSpriteComps10030 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.2

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps10030 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 0.5, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps10030 then
				local var_274_5 = 0.5

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps10030 = nil
			end

			local var_274_6 = 0
			local var_274_7 = 1.15

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_8 = arg_271_1:GetWordFromCfg(115281063)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 46
				local var_274_11 = utf8.len(var_274_9)
				local var_274_12 = var_274_10 <= 0 and var_274_7 or var_274_7 * (var_274_11 / var_274_10)

				if var_274_12 > 0 and var_274_7 < var_274_12 then
					arg_271_1.talkMaxDuration = var_274_12

					if var_274_12 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_12 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_9
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_13 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_13 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_13

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_13 and arg_271_1.time_ < var_274_6 + var_274_13 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play115281064 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 115281064
		arg_275_1.duration_ = 7

		local var_275_0 = {
			ja = 7,
			ko = 5.266,
			zh = 5.2,
			en = 5.3
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
				arg_275_0:Play115281065(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1038"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 == nil then
				arg_275_1.var_.actorSpriteComps1038 = var_278_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.actorSpriteComps1038 then
					for iter_278_0, iter_278_1 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_278_1 then
							local var_278_4 = Mathf.Lerp(iter_278_1.color.r, 1, var_278_3)

							iter_278_1.color = Color.New(var_278_4, var_278_4, var_278_4)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 then
				local var_278_5 = 1

				for iter_278_2, iter_278_3 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_278_3 then
						iter_278_3.color = Color.New(var_278_5, var_278_5, var_278_5)
					end
				end

				arg_275_1.var_.actorSpriteComps1038 = nil
			end

			local var_278_6 = 0
			local var_278_7 = 0.525

			if var_278_6 < arg_275_1.time_ and arg_275_1.time_ <= var_278_6 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_8 = arg_275_1:FormatText(StoryNameCfg[94].name)

				arg_275_1.leftNameTxt_.text = var_278_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_9 = arg_275_1:GetWordFromCfg(115281064)
				local var_278_10 = arg_275_1:FormatText(var_278_9.content)

				arg_275_1.text_.text = var_278_10

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_11 = 19
				local var_278_12 = utf8.len(var_278_10)
				local var_278_13 = var_278_11 <= 0 and var_278_7 or var_278_7 * (var_278_12 / var_278_11)

				if var_278_13 > 0 and var_278_7 < var_278_13 then
					arg_275_1.talkMaxDuration = var_278_13

					if var_278_13 + var_278_6 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_13 + var_278_6
					end
				end

				arg_275_1.text_.text = var_278_10
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281064", "story_v_out_115281.awb") ~= 0 then
					local var_278_14 = manager.audio:GetVoiceLength("story_v_out_115281", "115281064", "story_v_out_115281.awb") / 1000

					if var_278_14 + var_278_6 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_14 + var_278_6
					end

					if var_278_9.prefab_name ~= "" and arg_275_1.actors_[var_278_9.prefab_name] ~= nil then
						local var_278_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_9.prefab_name].transform, "story_v_out_115281", "115281064", "story_v_out_115281.awb")

						arg_275_1:RecordAudio("115281064", var_278_15)
						arg_275_1:RecordAudio("115281064", var_278_15)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_115281", "115281064", "story_v_out_115281.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_115281", "115281064", "story_v_out_115281.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_16 = math.max(var_278_7, arg_275_1.talkMaxDuration)

			if var_278_6 <= arg_275_1.time_ and arg_275_1.time_ < var_278_6 + var_278_16 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_6) / var_278_16

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_6 + var_278_16 and arg_275_1.time_ < var_278_6 + var_278_16 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play115281065 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 115281065
		arg_279_1.duration_ = 3.033

		local var_279_0 = {
			ja = 3.033,
			ko = 1.5,
			zh = 2.733,
			en = 2.7
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
				arg_279_0:Play115281066(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1038"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.actorSpriteComps1038 == nil then
				arg_279_1.var_.actorSpriteComps1038 = var_282_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_2 = 0.2

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.actorSpriteComps1038 then
					for iter_282_0, iter_282_1 in pairs(arg_279_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_282_1 then
							local var_282_4 = Mathf.Lerp(iter_282_1.color.r, 0.5, var_282_3)

							iter_282_1.color = Color.New(var_282_4, var_282_4, var_282_4)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.actorSpriteComps1038 then
				local var_282_5 = 0.5

				for iter_282_2, iter_282_3 in pairs(arg_279_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_282_3 then
						iter_282_3.color = Color.New(var_282_5, var_282_5, var_282_5)
					end
				end

				arg_279_1.var_.actorSpriteComps1038 = nil
			end

			local var_282_6 = arg_279_1.actors_["10030"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.actorSpriteComps10030 == nil then
				arg_279_1.var_.actorSpriteComps10030 = var_282_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_8 = 0.2

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.actorSpriteComps10030 then
					for iter_282_4, iter_282_5 in pairs(arg_279_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_282_5 then
							local var_282_10 = Mathf.Lerp(iter_282_5.color.r, 1, var_282_9)

							iter_282_5.color = Color.New(var_282_10, var_282_10, var_282_10)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps10030 then
				local var_282_11 = 1

				for iter_282_6, iter_282_7 in pairs(arg_279_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_282_7 then
						iter_282_7.color = Color.New(var_282_11, var_282_11, var_282_11)
					end
				end

				arg_279_1.var_.actorSpriteComps10030 = nil
			end

			local var_282_12 = arg_279_1.actors_["10030"].transform
			local var_282_13 = 0

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1.var_.moveOldPos10030 = var_282_12.localPosition
				var_282_12.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("10030", 4)

				local var_282_14 = var_282_12.childCount

				for iter_282_8 = 0, var_282_14 - 1 do
					local var_282_15 = var_282_12:GetChild(iter_282_8)

					if var_282_15.name == "split_3" or not string.find(var_282_15.name, "split") then
						var_282_15.gameObject:SetActive(true)
					else
						var_282_15.gameObject:SetActive(false)
					end
				end
			end

			local var_282_16 = 0.001

			if var_282_13 <= arg_279_1.time_ and arg_279_1.time_ < var_282_13 + var_282_16 then
				local var_282_17 = (arg_279_1.time_ - var_282_13) / var_282_16
				local var_282_18 = Vector3.New(390, -390, 150)

				var_282_12.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos10030, var_282_18, var_282_17)
			end

			if arg_279_1.time_ >= var_282_13 + var_282_16 and arg_279_1.time_ < var_282_13 + var_282_16 + arg_282_0 then
				var_282_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_282_19 = arg_279_1.actors_["10030"]
			local var_282_20 = 0

			if var_282_20 < arg_279_1.time_ and arg_279_1.time_ <= var_282_20 + arg_282_0 then
				local var_282_21 = var_282_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_282_21 then
					arg_279_1.var_.alphaOldValue10030 = var_282_21.alpha
					arg_279_1.var_.characterEffect10030 = var_282_21
				end

				arg_279_1.var_.alphaOldValue10030 = 0
			end

			local var_282_22 = 0.0166666666666667

			if var_282_20 <= arg_279_1.time_ and arg_279_1.time_ < var_282_20 + var_282_22 then
				local var_282_23 = (arg_279_1.time_ - var_282_20) / var_282_22
				local var_282_24 = Mathf.Lerp(arg_279_1.var_.alphaOldValue10030, 1, var_282_23)

				if arg_279_1.var_.characterEffect10030 then
					arg_279_1.var_.characterEffect10030.alpha = var_282_24
				end
			end

			if arg_279_1.time_ >= var_282_20 + var_282_22 and arg_279_1.time_ < var_282_20 + var_282_22 + arg_282_0 and arg_279_1.var_.characterEffect10030 then
				arg_279_1.var_.characterEffect10030.alpha = 1
			end

			local var_282_25 = 0
			local var_282_26 = 0.125

			if var_282_25 < arg_279_1.time_ and arg_279_1.time_ <= var_282_25 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_27 = arg_279_1:FormatText(StoryNameCfg[309].name)

				arg_279_1.leftNameTxt_.text = var_282_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_28 = arg_279_1:GetWordFromCfg(115281065)
				local var_282_29 = arg_279_1:FormatText(var_282_28.content)

				arg_279_1.text_.text = var_282_29

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_30 = 5
				local var_282_31 = utf8.len(var_282_29)
				local var_282_32 = var_282_30 <= 0 and var_282_26 or var_282_26 * (var_282_31 / var_282_30)

				if var_282_32 > 0 and var_282_26 < var_282_32 then
					arg_279_1.talkMaxDuration = var_282_32

					if var_282_32 + var_282_25 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_32 + var_282_25
					end
				end

				arg_279_1.text_.text = var_282_29
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281065", "story_v_out_115281.awb") ~= 0 then
					local var_282_33 = manager.audio:GetVoiceLength("story_v_out_115281", "115281065", "story_v_out_115281.awb") / 1000

					if var_282_33 + var_282_25 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_33 + var_282_25
					end

					if var_282_28.prefab_name ~= "" and arg_279_1.actors_[var_282_28.prefab_name] ~= nil then
						local var_282_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_28.prefab_name].transform, "story_v_out_115281", "115281065", "story_v_out_115281.awb")

						arg_279_1:RecordAudio("115281065", var_282_34)
						arg_279_1:RecordAudio("115281065", var_282_34)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_115281", "115281065", "story_v_out_115281.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_115281", "115281065", "story_v_out_115281.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_35 = math.max(var_282_26, arg_279_1.talkMaxDuration)

			if var_282_25 <= arg_279_1.time_ and arg_279_1.time_ < var_282_25 + var_282_35 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_25) / var_282_35

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_25 + var_282_35 and arg_279_1.time_ < var_282_25 + var_282_35 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play115281066 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 115281066
		arg_283_1.duration_ = 12.5

		local var_283_0 = {
			ja = 12.5,
			ko = 7.266,
			zh = 8.333,
			en = 8.2
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
				arg_283_0:Play115281067(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1038"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps1038 == nil then
				arg_283_1.var_.actorSpriteComps1038 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 0.2

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps1038 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_286_1 then
							local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 1, var_286_3)

							iter_286_1.color = Color.New(var_286_4, var_286_4, var_286_4)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps1038 then
				local var_286_5 = 1

				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_286_3 then
						iter_286_3.color = Color.New(var_286_5, var_286_5, var_286_5)
					end
				end

				arg_283_1.var_.actorSpriteComps1038 = nil
			end

			local var_286_6 = arg_283_1.actors_["10030"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.actorSpriteComps10030 == nil then
				arg_283_1.var_.actorSpriteComps10030 = var_286_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_8 = 0.2

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.actorSpriteComps10030 then
					for iter_286_4, iter_286_5 in pairs(arg_283_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_286_5 then
							local var_286_10 = Mathf.Lerp(iter_286_5.color.r, 0.5, var_286_9)

							iter_286_5.color = Color.New(var_286_10, var_286_10, var_286_10)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps10030 then
				local var_286_11 = 0.5

				for iter_286_6, iter_286_7 in pairs(arg_283_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_286_7 then
						iter_286_7.color = Color.New(var_286_11, var_286_11, var_286_11)
					end
				end

				arg_283_1.var_.actorSpriteComps10030 = nil
			end

			local var_286_12 = 0
			local var_286_13 = 0.85

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_14 = arg_283_1:FormatText(StoryNameCfg[94].name)

				arg_283_1.leftNameTxt_.text = var_286_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_15 = arg_283_1:GetWordFromCfg(115281066)
				local var_286_16 = arg_283_1:FormatText(var_286_15.content)

				arg_283_1.text_.text = var_286_16

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_17 = 34
				local var_286_18 = utf8.len(var_286_16)
				local var_286_19 = var_286_17 <= 0 and var_286_13 or var_286_13 * (var_286_18 / var_286_17)

				if var_286_19 > 0 and var_286_13 < var_286_19 then
					arg_283_1.talkMaxDuration = var_286_19

					if var_286_19 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_12
					end
				end

				arg_283_1.text_.text = var_286_16
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281066", "story_v_out_115281.awb") ~= 0 then
					local var_286_20 = manager.audio:GetVoiceLength("story_v_out_115281", "115281066", "story_v_out_115281.awb") / 1000

					if var_286_20 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_12
					end

					if var_286_15.prefab_name ~= "" and arg_283_1.actors_[var_286_15.prefab_name] ~= nil then
						local var_286_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_15.prefab_name].transform, "story_v_out_115281", "115281066", "story_v_out_115281.awb")

						arg_283_1:RecordAudio("115281066", var_286_21)
						arg_283_1:RecordAudio("115281066", var_286_21)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_115281", "115281066", "story_v_out_115281.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_115281", "115281066", "story_v_out_115281.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_13, arg_283_1.talkMaxDuration)

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_12) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_12 + var_286_22 and arg_283_1.time_ < var_286_12 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play115281067 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 115281067
		arg_287_1.duration_ = 8.733

		local var_287_0 = {
			ja = 6.933,
			ko = 8.033,
			zh = 7.566,
			en = 8.733
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play115281068(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1038"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.actorSpriteComps1038 == nil then
				arg_287_1.var_.actorSpriteComps1038 = var_290_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_2 = 0.2

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.actorSpriteComps1038 then
					for iter_290_0, iter_290_1 in pairs(arg_287_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_290_1 then
							local var_290_4 = Mathf.Lerp(iter_290_1.color.r, 0.5, var_290_3)

							iter_290_1.color = Color.New(var_290_4, var_290_4, var_290_4)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.actorSpriteComps1038 then
				local var_290_5 = 0.5

				for iter_290_2, iter_290_3 in pairs(arg_287_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_290_3 then
						iter_290_3.color = Color.New(var_290_5, var_290_5, var_290_5)
					end
				end

				arg_287_1.var_.actorSpriteComps1038 = nil
			end

			local var_290_6 = arg_287_1.actors_["10030"]
			local var_290_7 = 0

			if var_290_7 < arg_287_1.time_ and arg_287_1.time_ <= var_290_7 + arg_290_0 and arg_287_1.var_.actorSpriteComps10030 == nil then
				arg_287_1.var_.actorSpriteComps10030 = var_290_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_8 = 0.2

			if var_290_7 <= arg_287_1.time_ and arg_287_1.time_ < var_290_7 + var_290_8 then
				local var_290_9 = (arg_287_1.time_ - var_290_7) / var_290_8

				if arg_287_1.var_.actorSpriteComps10030 then
					for iter_290_4, iter_290_5 in pairs(arg_287_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_290_5 then
							local var_290_10 = Mathf.Lerp(iter_290_5.color.r, 1, var_290_9)

							iter_290_5.color = Color.New(var_290_10, var_290_10, var_290_10)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_7 + var_290_8 and arg_287_1.time_ < var_290_7 + var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps10030 then
				local var_290_11 = 1

				for iter_290_6, iter_290_7 in pairs(arg_287_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_290_7 then
						iter_290_7.color = Color.New(var_290_11, var_290_11, var_290_11)
					end
				end

				arg_287_1.var_.actorSpriteComps10030 = nil
			end

			local var_290_12 = 0
			local var_290_13 = 0.75

			if var_290_12 < arg_287_1.time_ and arg_287_1.time_ <= var_290_12 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_14 = arg_287_1:FormatText(StoryNameCfg[309].name)

				arg_287_1.leftNameTxt_.text = var_290_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_15 = arg_287_1:GetWordFromCfg(115281067)
				local var_290_16 = arg_287_1:FormatText(var_290_15.content)

				arg_287_1.text_.text = var_290_16

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_17 = 30
				local var_290_18 = utf8.len(var_290_16)
				local var_290_19 = var_290_17 <= 0 and var_290_13 or var_290_13 * (var_290_18 / var_290_17)

				if var_290_19 > 0 and var_290_13 < var_290_19 then
					arg_287_1.talkMaxDuration = var_290_19

					if var_290_19 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_19 + var_290_12
					end
				end

				arg_287_1.text_.text = var_290_16
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281067", "story_v_out_115281.awb") ~= 0 then
					local var_290_20 = manager.audio:GetVoiceLength("story_v_out_115281", "115281067", "story_v_out_115281.awb") / 1000

					if var_290_20 + var_290_12 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_20 + var_290_12
					end

					if var_290_15.prefab_name ~= "" and arg_287_1.actors_[var_290_15.prefab_name] ~= nil then
						local var_290_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_15.prefab_name].transform, "story_v_out_115281", "115281067", "story_v_out_115281.awb")

						arg_287_1:RecordAudio("115281067", var_290_21)
						arg_287_1:RecordAudio("115281067", var_290_21)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_115281", "115281067", "story_v_out_115281.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_115281", "115281067", "story_v_out_115281.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_22 = math.max(var_290_13, arg_287_1.talkMaxDuration)

			if var_290_12 <= arg_287_1.time_ and arg_287_1.time_ < var_290_12 + var_290_22 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_12) / var_290_22

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_12 + var_290_22 and arg_287_1.time_ < var_290_12 + var_290_22 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play115281068 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 115281068
		arg_291_1.duration_ = 12.333

		local var_291_0 = {
			ja = 10.666,
			ko = 12.333,
			zh = 8.1,
			en = 11.833
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
				arg_291_0:Play115281069(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.825

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_2 = arg_291_1:FormatText(StoryNameCfg[309].name)

				arg_291_1.leftNameTxt_.text = var_294_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_3 = arg_291_1:GetWordFromCfg(115281068)
				local var_294_4 = arg_291_1:FormatText(var_294_3.content)

				arg_291_1.text_.text = var_294_4

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_5 = 33
				local var_294_6 = utf8.len(var_294_4)
				local var_294_7 = var_294_5 <= 0 and var_294_1 or var_294_1 * (var_294_6 / var_294_5)

				if var_294_7 > 0 and var_294_1 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_4
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281068", "story_v_out_115281.awb") ~= 0 then
					local var_294_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281068", "story_v_out_115281.awb") / 1000

					if var_294_8 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_8 + var_294_0
					end

					if var_294_3.prefab_name ~= "" and arg_291_1.actors_[var_294_3.prefab_name] ~= nil then
						local var_294_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_3.prefab_name].transform, "story_v_out_115281", "115281068", "story_v_out_115281.awb")

						arg_291_1:RecordAudio("115281068", var_294_9)
						arg_291_1:RecordAudio("115281068", var_294_9)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_115281", "115281068", "story_v_out_115281.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_115281", "115281068", "story_v_out_115281.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_10 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_10 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_10

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_10 and arg_291_1.time_ < var_294_0 + var_294_10 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play115281069 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 115281069
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play115281070(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10030"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps10030 == nil then
				arg_295_1.var_.actorSpriteComps10030 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps10030 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_298_1 then
							local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 0.5, var_298_3)

							iter_298_1.color = Color.New(var_298_4, var_298_4, var_298_4)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps10030 then
				local var_298_5 = 0.5

				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_298_3 then
						iter_298_3.color = Color.New(var_298_5, var_298_5, var_298_5)
					end
				end

				arg_295_1.var_.actorSpriteComps10030 = nil
			end

			local var_298_6 = arg_295_1.actors_["1038"].transform
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 then
				arg_295_1.var_.moveOldPos1038 = var_298_6.localPosition
				var_298_6.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1038", 2)

				local var_298_8 = var_298_6.childCount

				for iter_298_4 = 0, var_298_8 - 1 do
					local var_298_9 = var_298_6:GetChild(iter_298_4)

					if var_298_9.name == "split_1" or not string.find(var_298_9.name, "split") then
						var_298_9.gameObject:SetActive(true)
					else
						var_298_9.gameObject:SetActive(false)
					end
				end
			end

			local var_298_10 = 0.001

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_10 then
				local var_298_11 = (arg_295_1.time_ - var_298_7) / var_298_10
				local var_298_12 = Vector3.New(-390, -400, 0)

				var_298_6.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1038, var_298_12, var_298_11)
			end

			if arg_295_1.time_ >= var_298_7 + var_298_10 and arg_295_1.time_ < var_298_7 + var_298_10 + arg_298_0 then
				var_298_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_298_13 = arg_295_1.actors_["1038"]
			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 and arg_295_1.var_.actorSpriteComps1038 == nil then
				arg_295_1.var_.actorSpriteComps1038 = var_298_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_15 = 0.2

			if var_298_14 <= arg_295_1.time_ and arg_295_1.time_ < var_298_14 + var_298_15 then
				local var_298_16 = (arg_295_1.time_ - var_298_14) / var_298_15

				if arg_295_1.var_.actorSpriteComps1038 then
					for iter_298_5, iter_298_6 in pairs(arg_295_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_298_6 then
							local var_298_17 = Mathf.Lerp(iter_298_6.color.r, 0.5, var_298_16)

							iter_298_6.color = Color.New(var_298_17, var_298_17, var_298_17)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_14 + var_298_15 and arg_295_1.time_ < var_298_14 + var_298_15 + arg_298_0 and arg_295_1.var_.actorSpriteComps1038 then
				local var_298_18 = 0.5

				for iter_298_7, iter_298_8 in pairs(arg_295_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_298_8 then
						iter_298_8.color = Color.New(var_298_18, var_298_18, var_298_18)
					end
				end

				arg_295_1.var_.actorSpriteComps1038 = nil
			end

			local var_298_19 = 0
			local var_298_20 = 0.65

			if var_298_19 < arg_295_1.time_ and arg_295_1.time_ <= var_298_19 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_21 = arg_295_1:GetWordFromCfg(115281069)
				local var_298_22 = arg_295_1:FormatText(var_298_21.content)

				arg_295_1.text_.text = var_298_22

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_23 = 26
				local var_298_24 = utf8.len(var_298_22)
				local var_298_25 = var_298_23 <= 0 and var_298_20 or var_298_20 * (var_298_24 / var_298_23)

				if var_298_25 > 0 and var_298_20 < var_298_25 then
					arg_295_1.talkMaxDuration = var_298_25

					if var_298_25 + var_298_19 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_25 + var_298_19
					end
				end

				arg_295_1.text_.text = var_298_22
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_26 = math.max(var_298_20, arg_295_1.talkMaxDuration)

			if var_298_19 <= arg_295_1.time_ and arg_295_1.time_ < var_298_19 + var_298_26 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_19) / var_298_26

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_19 + var_298_26 and arg_295_1.time_ < var_298_19 + var_298_26 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play115281070 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 115281070
		arg_299_1.duration_ = 10.466

		local var_299_0 = {
			ja = 7.933,
			ko = 9.5,
			zh = 10.466,
			en = 8.933
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
				arg_299_0:Play115281071(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1038"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.actorSpriteComps1038 == nil then
				arg_299_1.var_.actorSpriteComps1038 = var_302_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_2 = 0.2

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.actorSpriteComps1038 then
					for iter_302_0, iter_302_1 in pairs(arg_299_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_302_1 then
							local var_302_4 = Mathf.Lerp(iter_302_1.color.r, 1, var_302_3)

							iter_302_1.color = Color.New(var_302_4, var_302_4, var_302_4)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.actorSpriteComps1038 then
				local var_302_5 = 1

				for iter_302_2, iter_302_3 in pairs(arg_299_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_302_3 then
						iter_302_3.color = Color.New(var_302_5, var_302_5, var_302_5)
					end
				end

				arg_299_1.var_.actorSpriteComps1038 = nil
			end

			local var_302_6 = arg_299_1.actors_["1038"].transform
			local var_302_7 = 0

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 then
				arg_299_1.var_.moveOldPos1038 = var_302_6.localPosition
				var_302_6.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("1038", 2)

				local var_302_8 = var_302_6.childCount

				for iter_302_4 = 0, var_302_8 - 1 do
					local var_302_9 = var_302_6:GetChild(iter_302_4)

					if var_302_9.name == "split_5" or not string.find(var_302_9.name, "split") then
						var_302_9.gameObject:SetActive(true)
					else
						var_302_9.gameObject:SetActive(false)
					end
				end
			end

			local var_302_10 = 0.001

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_10 then
				local var_302_11 = (arg_299_1.time_ - var_302_7) / var_302_10
				local var_302_12 = Vector3.New(-390, -400, 0)

				var_302_6.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1038, var_302_12, var_302_11)
			end

			if arg_299_1.time_ >= var_302_7 + var_302_10 and arg_299_1.time_ < var_302_7 + var_302_10 + arg_302_0 then
				var_302_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_302_13 = 0
			local var_302_14 = 0.9

			if var_302_13 < arg_299_1.time_ and arg_299_1.time_ <= var_302_13 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_15 = arg_299_1:FormatText(StoryNameCfg[94].name)

				arg_299_1.leftNameTxt_.text = var_302_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_16 = arg_299_1:GetWordFromCfg(115281070)
				local var_302_17 = arg_299_1:FormatText(var_302_16.content)

				arg_299_1.text_.text = var_302_17

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_18 = 36
				local var_302_19 = utf8.len(var_302_17)
				local var_302_20 = var_302_18 <= 0 and var_302_14 or var_302_14 * (var_302_19 / var_302_18)

				if var_302_20 > 0 and var_302_14 < var_302_20 then
					arg_299_1.talkMaxDuration = var_302_20

					if var_302_20 + var_302_13 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_20 + var_302_13
					end
				end

				arg_299_1.text_.text = var_302_17
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281070", "story_v_out_115281.awb") ~= 0 then
					local var_302_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281070", "story_v_out_115281.awb") / 1000

					if var_302_21 + var_302_13 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_21 + var_302_13
					end

					if var_302_16.prefab_name ~= "" and arg_299_1.actors_[var_302_16.prefab_name] ~= nil then
						local var_302_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_16.prefab_name].transform, "story_v_out_115281", "115281070", "story_v_out_115281.awb")

						arg_299_1:RecordAudio("115281070", var_302_22)
						arg_299_1:RecordAudio("115281070", var_302_22)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_115281", "115281070", "story_v_out_115281.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_115281", "115281070", "story_v_out_115281.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_23 = math.max(var_302_14, arg_299_1.talkMaxDuration)

			if var_302_13 <= arg_299_1.time_ and arg_299_1.time_ < var_302_13 + var_302_23 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_13) / var_302_23

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_13 + var_302_23 and arg_299_1.time_ < var_302_13 + var_302_23 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play115281071 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 115281071
		arg_303_1.duration_ = 12.7

		local var_303_0 = {
			ja = 12.7,
			ko = 8.366,
			zh = 8.166,
			en = 10.966
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
				arg_303_0:Play115281072(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1038"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1038 = var_306_0.localPosition
				var_306_0.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("1038", 2)

				local var_306_2 = var_306_0.childCount

				for iter_306_0 = 0, var_306_2 - 1 do
					local var_306_3 = var_306_0:GetChild(iter_306_0)

					if var_306_3.name == "split_7" or not string.find(var_306_3.name, "split") then
						var_306_3.gameObject:SetActive(true)
					else
						var_306_3.gameObject:SetActive(false)
					end
				end
			end

			local var_306_4 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_1) / var_306_4
				local var_306_6 = Vector3.New(-390, -400, 0)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1038, var_306_6, var_306_5)
			end

			if arg_303_1.time_ >= var_306_1 + var_306_4 and arg_303_1.time_ < var_306_1 + var_306_4 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_306_7 = 0
			local var_306_8 = 0.8

			if var_306_7 < arg_303_1.time_ and arg_303_1.time_ <= var_306_7 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_9 = arg_303_1:FormatText(StoryNameCfg[94].name)

				arg_303_1.leftNameTxt_.text = var_306_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_10 = arg_303_1:GetWordFromCfg(115281071)
				local var_306_11 = arg_303_1:FormatText(var_306_10.content)

				arg_303_1.text_.text = var_306_11

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_12 = 32
				local var_306_13 = utf8.len(var_306_11)
				local var_306_14 = var_306_12 <= 0 and var_306_8 or var_306_8 * (var_306_13 / var_306_12)

				if var_306_14 > 0 and var_306_8 < var_306_14 then
					arg_303_1.talkMaxDuration = var_306_14

					if var_306_14 + var_306_7 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_14 + var_306_7
					end
				end

				arg_303_1.text_.text = var_306_11
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281071", "story_v_out_115281.awb") ~= 0 then
					local var_306_15 = manager.audio:GetVoiceLength("story_v_out_115281", "115281071", "story_v_out_115281.awb") / 1000

					if var_306_15 + var_306_7 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_15 + var_306_7
					end

					if var_306_10.prefab_name ~= "" and arg_303_1.actors_[var_306_10.prefab_name] ~= nil then
						local var_306_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_10.prefab_name].transform, "story_v_out_115281", "115281071", "story_v_out_115281.awb")

						arg_303_1:RecordAudio("115281071", var_306_16)
						arg_303_1:RecordAudio("115281071", var_306_16)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_115281", "115281071", "story_v_out_115281.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_115281", "115281071", "story_v_out_115281.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_17 = math.max(var_306_8, arg_303_1.talkMaxDuration)

			if var_306_7 <= arg_303_1.time_ and arg_303_1.time_ < var_306_7 + var_306_17 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_7) / var_306_17

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_7 + var_306_17 and arg_303_1.time_ < var_306_7 + var_306_17 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play115281072 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 115281072
		arg_307_1.duration_ = 3.4

		local var_307_0 = {
			ja = 2.2,
			ko = 2.766,
			zh = 3.4,
			en = 3.1
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
				arg_307_0:Play115281073(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10030"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos10030 = var_310_0.localPosition
				var_310_0.localScale = Vector3.New(1, 1, 1)

				arg_307_1:CheckSpriteTmpPos("10030", 4)

				local var_310_2 = var_310_0.childCount

				for iter_310_0 = 0, var_310_2 - 1 do
					local var_310_3 = var_310_0:GetChild(iter_310_0)

					if var_310_3.name == "split_1" or not string.find(var_310_3.name, "split") then
						var_310_3.gameObject:SetActive(true)
					else
						var_310_3.gameObject:SetActive(false)
					end
				end
			end

			local var_310_4 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_4 then
				local var_310_5 = (arg_307_1.time_ - var_310_1) / var_310_4
				local var_310_6 = Vector3.New(390, -390, 150)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos10030, var_310_6, var_310_5)
			end

			if arg_307_1.time_ >= var_310_1 + var_310_4 and arg_307_1.time_ < var_310_1 + var_310_4 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_310_7 = arg_307_1.actors_["1038"]
			local var_310_8 = 0

			if var_310_8 < arg_307_1.time_ and arg_307_1.time_ <= var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps1038 == nil then
				arg_307_1.var_.actorSpriteComps1038 = var_310_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_9 = 0.2

			if var_310_8 <= arg_307_1.time_ and arg_307_1.time_ < var_310_8 + var_310_9 then
				local var_310_10 = (arg_307_1.time_ - var_310_8) / var_310_9

				if arg_307_1.var_.actorSpriteComps1038 then
					for iter_310_1, iter_310_2 in pairs(arg_307_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_310_2 then
							local var_310_11 = Mathf.Lerp(iter_310_2.color.r, 0.5, var_310_10)

							iter_310_2.color = Color.New(var_310_11, var_310_11, var_310_11)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_8 + var_310_9 and arg_307_1.time_ < var_310_8 + var_310_9 + arg_310_0 and arg_307_1.var_.actorSpriteComps1038 then
				local var_310_12 = 0.5

				for iter_310_3, iter_310_4 in pairs(arg_307_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_310_4 then
						iter_310_4.color = Color.New(var_310_12, var_310_12, var_310_12)
					end
				end

				arg_307_1.var_.actorSpriteComps1038 = nil
			end

			local var_310_13 = arg_307_1.actors_["10030"]
			local var_310_14 = 0

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 and arg_307_1.var_.actorSpriteComps10030 == nil then
				arg_307_1.var_.actorSpriteComps10030 = var_310_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_15 = 0.2

			if var_310_14 <= arg_307_1.time_ and arg_307_1.time_ < var_310_14 + var_310_15 then
				local var_310_16 = (arg_307_1.time_ - var_310_14) / var_310_15

				if arg_307_1.var_.actorSpriteComps10030 then
					for iter_310_5, iter_310_6 in pairs(arg_307_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_310_6 then
							local var_310_17 = Mathf.Lerp(iter_310_6.color.r, 1, var_310_16)

							iter_310_6.color = Color.New(var_310_17, var_310_17, var_310_17)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_14 + var_310_15 and arg_307_1.time_ < var_310_14 + var_310_15 + arg_310_0 and arg_307_1.var_.actorSpriteComps10030 then
				local var_310_18 = 1

				for iter_310_7, iter_310_8 in pairs(arg_307_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_310_8 then
						iter_310_8.color = Color.New(var_310_18, var_310_18, var_310_18)
					end
				end

				arg_307_1.var_.actorSpriteComps10030 = nil
			end

			local var_310_19 = 0
			local var_310_20 = 0.2

			if var_310_19 < arg_307_1.time_ and arg_307_1.time_ <= var_310_19 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_21 = arg_307_1:FormatText(StoryNameCfg[309].name)

				arg_307_1.leftNameTxt_.text = var_310_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_22 = arg_307_1:GetWordFromCfg(115281072)
				local var_310_23 = arg_307_1:FormatText(var_310_22.content)

				arg_307_1.text_.text = var_310_23

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_24 = 8
				local var_310_25 = utf8.len(var_310_23)
				local var_310_26 = var_310_24 <= 0 and var_310_20 or var_310_20 * (var_310_25 / var_310_24)

				if var_310_26 > 0 and var_310_20 < var_310_26 then
					arg_307_1.talkMaxDuration = var_310_26

					if var_310_26 + var_310_19 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_26 + var_310_19
					end
				end

				arg_307_1.text_.text = var_310_23
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281072", "story_v_out_115281.awb") ~= 0 then
					local var_310_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281072", "story_v_out_115281.awb") / 1000

					if var_310_27 + var_310_19 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_27 + var_310_19
					end

					if var_310_22.prefab_name ~= "" and arg_307_1.actors_[var_310_22.prefab_name] ~= nil then
						local var_310_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_22.prefab_name].transform, "story_v_out_115281", "115281072", "story_v_out_115281.awb")

						arg_307_1:RecordAudio("115281072", var_310_28)
						arg_307_1:RecordAudio("115281072", var_310_28)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_115281", "115281072", "story_v_out_115281.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_115281", "115281072", "story_v_out_115281.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_29 = math.max(var_310_20, arg_307_1.talkMaxDuration)

			if var_310_19 <= arg_307_1.time_ and arg_307_1.time_ < var_310_19 + var_310_29 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_19) / var_310_29

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_19 + var_310_29 and arg_307_1.time_ < var_310_19 + var_310_29 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play115281073 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 115281073
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play115281074(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["10030"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				local var_314_2 = var_314_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_314_2 then
					arg_311_1.var_.alphaOldValue10030 = var_314_2.alpha
					arg_311_1.var_.characterEffect10030 = var_314_2
				end

				arg_311_1.var_.alphaOldValue10030 = 1
			end

			local var_314_3 = 0.333333333333333

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_3 then
				local var_314_4 = (arg_311_1.time_ - var_314_1) / var_314_3
				local var_314_5 = Mathf.Lerp(arg_311_1.var_.alphaOldValue10030, 0, var_314_4)

				if arg_311_1.var_.characterEffect10030 then
					arg_311_1.var_.characterEffect10030.alpha = var_314_5
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_3 and arg_311_1.time_ < var_314_1 + var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect10030 then
				arg_311_1.var_.characterEffect10030.alpha = 0
			end

			local var_314_6 = arg_311_1.actors_["1038"]
			local var_314_7 = 0

			if var_314_7 < arg_311_1.time_ and arg_311_1.time_ <= var_314_7 + arg_314_0 then
				local var_314_8 = var_314_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_314_8 then
					arg_311_1.var_.alphaOldValue1038 = var_314_8.alpha
					arg_311_1.var_.characterEffect1038 = var_314_8
				end

				arg_311_1.var_.alphaOldValue1038 = 1
			end

			local var_314_9 = 0.333333333333333

			if var_314_7 <= arg_311_1.time_ and arg_311_1.time_ < var_314_7 + var_314_9 then
				local var_314_10 = (arg_311_1.time_ - var_314_7) / var_314_9
				local var_314_11 = Mathf.Lerp(arg_311_1.var_.alphaOldValue1038, 0, var_314_10)

				if arg_311_1.var_.characterEffect1038 then
					arg_311_1.var_.characterEffect1038.alpha = var_314_11
				end
			end

			if arg_311_1.time_ >= var_314_7 + var_314_9 and arg_311_1.time_ < var_314_7 + var_314_9 + arg_314_0 and arg_311_1.var_.characterEffect1038 then
				arg_311_1.var_.characterEffect1038.alpha = 0
			end

			local var_314_12 = 0
			local var_314_13 = 1.2

			if var_314_12 < arg_311_1.time_ and arg_311_1.time_ <= var_314_12 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_14 = arg_311_1:GetWordFromCfg(115281073)
				local var_314_15 = arg_311_1:FormatText(var_314_14.content)

				arg_311_1.text_.text = var_314_15

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_16 = 48
				local var_314_17 = utf8.len(var_314_15)
				local var_314_18 = var_314_16 <= 0 and var_314_13 or var_314_13 * (var_314_17 / var_314_16)

				if var_314_18 > 0 and var_314_13 < var_314_18 then
					arg_311_1.talkMaxDuration = var_314_18

					if var_314_18 + var_314_12 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_18 + var_314_12
					end
				end

				arg_311_1.text_.text = var_314_15
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_19 = math.max(var_314_13, arg_311_1.talkMaxDuration)

			if var_314_12 <= arg_311_1.time_ and arg_311_1.time_ < var_314_12 + var_314_19 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_12) / var_314_19

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_12 + var_314_19 and arg_311_1.time_ < var_314_12 + var_314_19 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play115281074 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 115281074
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play115281075(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.65

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(115281074)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 26
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play115281075 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 115281075
		arg_319_1.duration_ = 2.1

		local var_319_0 = {
			ja = 2.1,
			ko = 1.4,
			zh = 1.366,
			en = 1.3
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
				arg_319_0:Play115281076(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10030"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos10030 = var_322_0.localPosition
				var_322_0.localScale = Vector3.New(1, 1, 1)

				arg_319_1:CheckSpriteTmpPos("10030", 4)

				local var_322_2 = var_322_0.childCount

				for iter_322_0 = 0, var_322_2 - 1 do
					local var_322_3 = var_322_0:GetChild(iter_322_0)

					if var_322_3.name == "split_2" or not string.find(var_322_3.name, "split") then
						var_322_3.gameObject:SetActive(true)
					else
						var_322_3.gameObject:SetActive(false)
					end
				end
			end

			local var_322_4 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_4 then
				local var_322_5 = (arg_319_1.time_ - var_322_1) / var_322_4
				local var_322_6 = Vector3.New(390, -390, 150)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos10030, var_322_6, var_322_5)
			end

			if arg_319_1.time_ >= var_322_1 + var_322_4 and arg_319_1.time_ < var_322_1 + var_322_4 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_322_7 = arg_319_1.actors_["10030"]
			local var_322_8 = 0

			if var_322_8 < arg_319_1.time_ and arg_319_1.time_ <= var_322_8 + arg_322_0 then
				local var_322_9 = var_322_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_322_9 then
					arg_319_1.var_.alphaOldValue10030 = var_322_9.alpha
					arg_319_1.var_.characterEffect10030 = var_322_9
				end

				arg_319_1.var_.alphaOldValue10030 = 0
			end

			local var_322_10 = 0.333333333333333

			if var_322_8 <= arg_319_1.time_ and arg_319_1.time_ < var_322_8 + var_322_10 then
				local var_322_11 = (arg_319_1.time_ - var_322_8) / var_322_10
				local var_322_12 = Mathf.Lerp(arg_319_1.var_.alphaOldValue10030, 1, var_322_11)

				if arg_319_1.var_.characterEffect10030 then
					arg_319_1.var_.characterEffect10030.alpha = var_322_12
				end
			end

			if arg_319_1.time_ >= var_322_8 + var_322_10 and arg_319_1.time_ < var_322_8 + var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect10030 then
				arg_319_1.var_.characterEffect10030.alpha = 1
			end

			local var_322_13 = arg_319_1.actors_["10030"]
			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 and arg_319_1.var_.actorSpriteComps10030 == nil then
				arg_319_1.var_.actorSpriteComps10030 = var_322_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_322_15 = 0.2

			if var_322_14 <= arg_319_1.time_ and arg_319_1.time_ < var_322_14 + var_322_15 then
				local var_322_16 = (arg_319_1.time_ - var_322_14) / var_322_15

				if arg_319_1.var_.actorSpriteComps10030 then
					for iter_322_1, iter_322_2 in pairs(arg_319_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_322_2 then
							local var_322_17 = Mathf.Lerp(iter_322_2.color.r, 1, var_322_16)

							iter_322_2.color = Color.New(var_322_17, var_322_17, var_322_17)
						end
					end
				end
			end

			if arg_319_1.time_ >= var_322_14 + var_322_15 and arg_319_1.time_ < var_322_14 + var_322_15 + arg_322_0 and arg_319_1.var_.actorSpriteComps10030 then
				local var_322_18 = 1

				for iter_322_3, iter_322_4 in pairs(arg_319_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_322_4 then
						iter_322_4.color = Color.New(var_322_18, var_322_18, var_322_18)
					end
				end

				arg_319_1.var_.actorSpriteComps10030 = nil
			end

			local var_322_19 = 0
			local var_322_20 = 0.075

			if var_322_19 < arg_319_1.time_ and arg_319_1.time_ <= var_322_19 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_21 = arg_319_1:FormatText(StoryNameCfg[309].name)

				arg_319_1.leftNameTxt_.text = var_322_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_22 = arg_319_1:GetWordFromCfg(115281075)
				local var_322_23 = arg_319_1:FormatText(var_322_22.content)

				arg_319_1.text_.text = var_322_23

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_24 = 3
				local var_322_25 = utf8.len(var_322_23)
				local var_322_26 = var_322_24 <= 0 and var_322_20 or var_322_20 * (var_322_25 / var_322_24)

				if var_322_26 > 0 and var_322_20 < var_322_26 then
					arg_319_1.talkMaxDuration = var_322_26

					if var_322_26 + var_322_19 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_26 + var_322_19
					end
				end

				arg_319_1.text_.text = var_322_23
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281075", "story_v_out_115281.awb") ~= 0 then
					local var_322_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281075", "story_v_out_115281.awb") / 1000

					if var_322_27 + var_322_19 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_27 + var_322_19
					end

					if var_322_22.prefab_name ~= "" and arg_319_1.actors_[var_322_22.prefab_name] ~= nil then
						local var_322_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_22.prefab_name].transform, "story_v_out_115281", "115281075", "story_v_out_115281.awb")

						arg_319_1:RecordAudio("115281075", var_322_28)
						arg_319_1:RecordAudio("115281075", var_322_28)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_115281", "115281075", "story_v_out_115281.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_115281", "115281075", "story_v_out_115281.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_29 = math.max(var_322_20, arg_319_1.talkMaxDuration)

			if var_322_19 <= arg_319_1.time_ and arg_319_1.time_ < var_322_19 + var_322_29 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_19) / var_322_29

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_19 + var_322_29 and arg_319_1.time_ < var_322_19 + var_322_29 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play115281076 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 115281076
		arg_323_1.duration_ = 2.133

		local var_323_0 = {
			ja = 1,
			ko = 0.999999999999,
			zh = 2.133,
			en = 1.4
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
				arg_323_0:Play115281077(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1038"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1038 = var_326_0.localPosition
				var_326_0.localScale = Vector3.New(1, 1, 1)

				arg_323_1:CheckSpriteTmpPos("1038", 2)

				local var_326_2 = var_326_0.childCount

				for iter_326_0 = 0, var_326_2 - 1 do
					local var_326_3 = var_326_0:GetChild(iter_326_0)

					if var_326_3.name == "split_5" or not string.find(var_326_3.name, "split") then
						var_326_3.gameObject:SetActive(true)
					else
						var_326_3.gameObject:SetActive(false)
					end
				end
			end

			local var_326_4 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_4 then
				local var_326_5 = (arg_323_1.time_ - var_326_1) / var_326_4
				local var_326_6 = Vector3.New(-390, -400, 0)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1038, var_326_6, var_326_5)
			end

			if arg_323_1.time_ >= var_326_1 + var_326_4 and arg_323_1.time_ < var_326_1 + var_326_4 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_326_7 = arg_323_1.actors_["10030"]
			local var_326_8 = 0

			if var_326_8 < arg_323_1.time_ and arg_323_1.time_ <= var_326_8 + arg_326_0 and arg_323_1.var_.actorSpriteComps10030 == nil then
				arg_323_1.var_.actorSpriteComps10030 = var_326_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_9 = 0.2

			if var_326_8 <= arg_323_1.time_ and arg_323_1.time_ < var_326_8 + var_326_9 then
				local var_326_10 = (arg_323_1.time_ - var_326_8) / var_326_9

				if arg_323_1.var_.actorSpriteComps10030 then
					for iter_326_1, iter_326_2 in pairs(arg_323_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_326_2 then
							local var_326_11 = Mathf.Lerp(iter_326_2.color.r, 0.5, var_326_10)

							iter_326_2.color = Color.New(var_326_11, var_326_11, var_326_11)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_8 + var_326_9 and arg_323_1.time_ < var_326_8 + var_326_9 + arg_326_0 and arg_323_1.var_.actorSpriteComps10030 then
				local var_326_12 = 0.5

				for iter_326_3, iter_326_4 in pairs(arg_323_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_326_4 then
						iter_326_4.color = Color.New(var_326_12, var_326_12, var_326_12)
					end
				end

				arg_323_1.var_.actorSpriteComps10030 = nil
			end

			local var_326_13 = arg_323_1.actors_["1038"]
			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				local var_326_15 = var_326_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_326_15 then
					arg_323_1.var_.alphaOldValue1038 = var_326_15.alpha
					arg_323_1.var_.characterEffect1038 = var_326_15
				end

				arg_323_1.var_.alphaOldValue1038 = 0
			end

			local var_326_16 = 0.333333333333333

			if var_326_14 <= arg_323_1.time_ and arg_323_1.time_ < var_326_14 + var_326_16 then
				local var_326_17 = (arg_323_1.time_ - var_326_14) / var_326_16
				local var_326_18 = Mathf.Lerp(arg_323_1.var_.alphaOldValue1038, 1, var_326_17)

				if arg_323_1.var_.characterEffect1038 then
					arg_323_1.var_.characterEffect1038.alpha = var_326_18
				end
			end

			if arg_323_1.time_ >= var_326_14 + var_326_16 and arg_323_1.time_ < var_326_14 + var_326_16 + arg_326_0 and arg_323_1.var_.characterEffect1038 then
				arg_323_1.var_.characterEffect1038.alpha = 1
			end

			local var_326_19 = 0
			local var_326_20 = 0.05

			if var_326_19 < arg_323_1.time_ and arg_323_1.time_ <= var_326_19 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_21 = arg_323_1:FormatText(StoryNameCfg[94].name)

				arg_323_1.leftNameTxt_.text = var_326_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_22 = arg_323_1:GetWordFromCfg(115281076)
				local var_326_23 = arg_323_1:FormatText(var_326_22.content)

				arg_323_1.text_.text = var_326_23

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_24 = 2
				local var_326_25 = utf8.len(var_326_23)
				local var_326_26 = var_326_24 <= 0 and var_326_20 or var_326_20 * (var_326_25 / var_326_24)

				if var_326_26 > 0 and var_326_20 < var_326_26 then
					arg_323_1.talkMaxDuration = var_326_26

					if var_326_26 + var_326_19 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_26 + var_326_19
					end
				end

				arg_323_1.text_.text = var_326_23
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281076", "story_v_out_115281.awb") ~= 0 then
					local var_326_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281076", "story_v_out_115281.awb") / 1000

					if var_326_27 + var_326_19 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_27 + var_326_19
					end

					if var_326_22.prefab_name ~= "" and arg_323_1.actors_[var_326_22.prefab_name] ~= nil then
						local var_326_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_22.prefab_name].transform, "story_v_out_115281", "115281076", "story_v_out_115281.awb")

						arg_323_1:RecordAudio("115281076", var_326_28)
						arg_323_1:RecordAudio("115281076", var_326_28)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_115281", "115281076", "story_v_out_115281.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_115281", "115281076", "story_v_out_115281.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_29 = math.max(var_326_20, arg_323_1.talkMaxDuration)

			if var_326_19 <= arg_323_1.time_ and arg_323_1.time_ < var_326_19 + var_326_29 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_19) / var_326_29

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_19 + var_326_29 and arg_323_1.time_ < var_326_19 + var_326_29 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play115281077 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 115281077
		arg_327_1.duration_ = 6.7

		local var_327_0 = {
			ja = 6.7,
			ko = 5.433,
			zh = 6.033,
			en = 5.666
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
				arg_327_0:Play115281078(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1038"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.actorSpriteComps1038 == nil then
				arg_327_1.var_.actorSpriteComps1038 = var_330_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_2 = 0.2

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.actorSpriteComps1038 then
					for iter_330_0, iter_330_1 in pairs(arg_327_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_330_1 then
							local var_330_4 = Mathf.Lerp(iter_330_1.color.r, 0.5, var_330_3)

							iter_330_1.color = Color.New(var_330_4, var_330_4, var_330_4)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.actorSpriteComps1038 then
				local var_330_5 = 0.5

				for iter_330_2, iter_330_3 in pairs(arg_327_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_330_3 then
						iter_330_3.color = Color.New(var_330_5, var_330_5, var_330_5)
					end
				end

				arg_327_1.var_.actorSpriteComps1038 = nil
			end

			local var_330_6 = arg_327_1.actors_["10030"]
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 and arg_327_1.var_.actorSpriteComps10030 == nil then
				arg_327_1.var_.actorSpriteComps10030 = var_330_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_8 = 0.2

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_8 then
				local var_330_9 = (arg_327_1.time_ - var_330_7) / var_330_8

				if arg_327_1.var_.actorSpriteComps10030 then
					for iter_330_4, iter_330_5 in pairs(arg_327_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_330_5 then
							local var_330_10 = Mathf.Lerp(iter_330_5.color.r, 1, var_330_9)

							iter_330_5.color = Color.New(var_330_10, var_330_10, var_330_10)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_7 + var_330_8 and arg_327_1.time_ < var_330_7 + var_330_8 + arg_330_0 and arg_327_1.var_.actorSpriteComps10030 then
				local var_330_11 = 1

				for iter_330_6, iter_330_7 in pairs(arg_327_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_330_7 then
						iter_330_7.color = Color.New(var_330_11, var_330_11, var_330_11)
					end
				end

				arg_327_1.var_.actorSpriteComps10030 = nil
			end

			local var_330_12 = 0
			local var_330_13 = 0.525

			if var_330_12 < arg_327_1.time_ and arg_327_1.time_ <= var_330_12 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_14 = arg_327_1:FormatText(StoryNameCfg[309].name)

				arg_327_1.leftNameTxt_.text = var_330_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_15 = arg_327_1:GetWordFromCfg(115281077)
				local var_330_16 = arg_327_1:FormatText(var_330_15.content)

				arg_327_1.text_.text = var_330_16

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_17 = 21
				local var_330_18 = utf8.len(var_330_16)
				local var_330_19 = var_330_17 <= 0 and var_330_13 or var_330_13 * (var_330_18 / var_330_17)

				if var_330_19 > 0 and var_330_13 < var_330_19 then
					arg_327_1.talkMaxDuration = var_330_19

					if var_330_19 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_19 + var_330_12
					end
				end

				arg_327_1.text_.text = var_330_16
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281077", "story_v_out_115281.awb") ~= 0 then
					local var_330_20 = manager.audio:GetVoiceLength("story_v_out_115281", "115281077", "story_v_out_115281.awb") / 1000

					if var_330_20 + var_330_12 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_20 + var_330_12
					end

					if var_330_15.prefab_name ~= "" and arg_327_1.actors_[var_330_15.prefab_name] ~= nil then
						local var_330_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_15.prefab_name].transform, "story_v_out_115281", "115281077", "story_v_out_115281.awb")

						arg_327_1:RecordAudio("115281077", var_330_21)
						arg_327_1:RecordAudio("115281077", var_330_21)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_115281", "115281077", "story_v_out_115281.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_115281", "115281077", "story_v_out_115281.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_22 = math.max(var_330_13, arg_327_1.talkMaxDuration)

			if var_330_12 <= arg_327_1.time_ and arg_327_1.time_ < var_330_12 + var_330_22 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_12) / var_330_22

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_12 + var_330_22 and arg_327_1.time_ < var_330_12 + var_330_22 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play115281078 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 115281078
		arg_331_1.duration_ = 11.4

		local var_331_0 = {
			ja = 9.066,
			ko = 10.133,
			zh = 10.266,
			en = 11.4
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
				arg_331_0:Play115281079(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = 0
			local var_334_1 = 1.3

			if var_334_0 < arg_331_1.time_ and arg_331_1.time_ <= var_334_0 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_2 = arg_331_1:FormatText(StoryNameCfg[309].name)

				arg_331_1.leftNameTxt_.text = var_334_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_3 = arg_331_1:GetWordFromCfg(115281078)
				local var_334_4 = arg_331_1:FormatText(var_334_3.content)

				arg_331_1.text_.text = var_334_4

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281078", "story_v_out_115281.awb") ~= 0 then
					local var_334_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281078", "story_v_out_115281.awb") / 1000

					if var_334_8 + var_334_0 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_8 + var_334_0
					end

					if var_334_3.prefab_name ~= "" and arg_331_1.actors_[var_334_3.prefab_name] ~= nil then
						local var_334_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_3.prefab_name].transform, "story_v_out_115281", "115281078", "story_v_out_115281.awb")

						arg_331_1:RecordAudio("115281078", var_334_9)
						arg_331_1:RecordAudio("115281078", var_334_9)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_115281", "115281078", "story_v_out_115281.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_115281", "115281078", "story_v_out_115281.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_10 = math.max(var_334_1, arg_331_1.talkMaxDuration)

			if var_334_0 <= arg_331_1.time_ and arg_331_1.time_ < var_334_0 + var_334_10 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_0) / var_334_10

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_0 + var_334_10 and arg_331_1.time_ < var_334_0 + var_334_10 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play115281079 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 115281079
		arg_335_1.duration_ = 14.233

		local var_335_0 = {
			ja = 14.233,
			ko = 10.666,
			zh = 12.366,
			en = 11.566
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
				arg_335_0:Play115281080(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1.425

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[309].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(115281079)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 57
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281079", "story_v_out_115281.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281079", "story_v_out_115281.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_115281", "115281079", "story_v_out_115281.awb")

						arg_335_1:RecordAudio("115281079", var_338_9)
						arg_335_1:RecordAudio("115281079", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_115281", "115281079", "story_v_out_115281.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_115281", "115281079", "story_v_out_115281.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play115281080 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 115281080
		arg_339_1.duration_ = 13.7

		local var_339_0 = {
			ja = 13.7,
			ko = 10.566,
			zh = 9.633,
			en = 13.133
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play115281081(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 1.2

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_2 = arg_339_1:FormatText(StoryNameCfg[309].name)

				arg_339_1.leftNameTxt_.text = var_342_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_3 = arg_339_1:GetWordFromCfg(115281080)
				local var_342_4 = arg_339_1:FormatText(var_342_3.content)

				arg_339_1.text_.text = var_342_4

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_5 = 48
				local var_342_6 = utf8.len(var_342_4)
				local var_342_7 = var_342_5 <= 0 and var_342_1 or var_342_1 * (var_342_6 / var_342_5)

				if var_342_7 > 0 and var_342_1 < var_342_7 then
					arg_339_1.talkMaxDuration = var_342_7

					if var_342_7 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_7 + var_342_0
					end
				end

				arg_339_1.text_.text = var_342_4
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281080", "story_v_out_115281.awb") ~= 0 then
					local var_342_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281080", "story_v_out_115281.awb") / 1000

					if var_342_8 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_8 + var_342_0
					end

					if var_342_3.prefab_name ~= "" and arg_339_1.actors_[var_342_3.prefab_name] ~= nil then
						local var_342_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_3.prefab_name].transform, "story_v_out_115281", "115281080", "story_v_out_115281.awb")

						arg_339_1:RecordAudio("115281080", var_342_9)
						arg_339_1:RecordAudio("115281080", var_342_9)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_115281", "115281080", "story_v_out_115281.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_115281", "115281080", "story_v_out_115281.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_10 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_10 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_10

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_10 and arg_339_1.time_ < var_342_0 + var_342_10 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play115281081 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 115281081
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play115281082(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1038"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				local var_346_2 = var_346_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_346_2 then
					arg_343_1.var_.alphaOldValue1038 = var_346_2.alpha
					arg_343_1.var_.characterEffect1038 = var_346_2
				end

				arg_343_1.var_.alphaOldValue1038 = 1
			end

			local var_346_3 = 0.333333333333333

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_3 then
				local var_346_4 = (arg_343_1.time_ - var_346_1) / var_346_3
				local var_346_5 = Mathf.Lerp(arg_343_1.var_.alphaOldValue1038, 0, var_346_4)

				if arg_343_1.var_.characterEffect1038 then
					arg_343_1.var_.characterEffect1038.alpha = var_346_5
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_3 and arg_343_1.time_ < var_346_1 + var_346_3 + arg_346_0 and arg_343_1.var_.characterEffect1038 then
				arg_343_1.var_.characterEffect1038.alpha = 0
			end

			local var_346_6 = arg_343_1.actors_["10030"]
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 then
				local var_346_8 = var_346_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_346_8 then
					arg_343_1.var_.alphaOldValue10030 = var_346_8.alpha
					arg_343_1.var_.characterEffect10030 = var_346_8
				end

				arg_343_1.var_.alphaOldValue10030 = 1
			end

			local var_346_9 = 0.333333333333333

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_9 then
				local var_346_10 = (arg_343_1.time_ - var_346_7) / var_346_9
				local var_346_11 = Mathf.Lerp(arg_343_1.var_.alphaOldValue10030, 0, var_346_10)

				if arg_343_1.var_.characterEffect10030 then
					arg_343_1.var_.characterEffect10030.alpha = var_346_11
				end
			end

			if arg_343_1.time_ >= var_346_7 + var_346_9 and arg_343_1.time_ < var_346_7 + var_346_9 + arg_346_0 and arg_343_1.var_.characterEffect10030 then
				arg_343_1.var_.characterEffect10030.alpha = 0
			end

			local var_346_12 = 0
			local var_346_13 = 1.05

			if var_346_12 < arg_343_1.time_ and arg_343_1.time_ <= var_346_12 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_14 = arg_343_1:GetWordFromCfg(115281081)
				local var_346_15 = arg_343_1:FormatText(var_346_14.content)

				arg_343_1.text_.text = var_346_15

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_16 = 42
				local var_346_17 = utf8.len(var_346_15)
				local var_346_18 = var_346_16 <= 0 and var_346_13 or var_346_13 * (var_346_17 / var_346_16)

				if var_346_18 > 0 and var_346_13 < var_346_18 then
					arg_343_1.talkMaxDuration = var_346_18

					if var_346_18 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_18 + var_346_12
					end
				end

				arg_343_1.text_.text = var_346_15
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_19 = math.max(var_346_13, arg_343_1.talkMaxDuration)

			if var_346_12 <= arg_343_1.time_ and arg_343_1.time_ < var_346_12 + var_346_19 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_12) / var_346_19

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_12 + var_346_19 and arg_343_1.time_ < var_346_12 + var_346_19 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play115281082 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 115281082
		arg_347_1.duration_ = 4.4

		local var_347_0 = {
			ja = 2.1,
			ko = 3.366,
			zh = 3.4,
			en = 4.4
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
				arg_347_0:Play115281083(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10030"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos10030 = var_350_0.localPosition
				var_350_0.localScale = Vector3.New(1, 1, 1)

				arg_347_1:CheckSpriteTmpPos("10030", 4)

				local var_350_2 = var_350_0.childCount

				for iter_350_0 = 0, var_350_2 - 1 do
					local var_350_3 = var_350_0:GetChild(iter_350_0)

					if var_350_3.name == "split_2" or not string.find(var_350_3.name, "split") then
						var_350_3.gameObject:SetActive(true)
					else
						var_350_3.gameObject:SetActive(false)
					end
				end
			end

			local var_350_4 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_4 then
				local var_350_5 = (arg_347_1.time_ - var_350_1) / var_350_4
				local var_350_6 = Vector3.New(390, -390, 150)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10030, var_350_6, var_350_5)
			end

			if arg_347_1.time_ >= var_350_1 + var_350_4 and arg_347_1.time_ < var_350_1 + var_350_4 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_350_7 = arg_347_1.actors_["10030"]
			local var_350_8 = 0

			if var_350_8 < arg_347_1.time_ and arg_347_1.time_ <= var_350_8 + arg_350_0 then
				local var_350_9 = var_350_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_350_9 then
					arg_347_1.var_.alphaOldValue10030 = var_350_9.alpha
					arg_347_1.var_.characterEffect10030 = var_350_9
				end

				arg_347_1.var_.alphaOldValue10030 = 0
			end

			local var_350_10 = 0.333333333333333

			if var_350_8 <= arg_347_1.time_ and arg_347_1.time_ < var_350_8 + var_350_10 then
				local var_350_11 = (arg_347_1.time_ - var_350_8) / var_350_10
				local var_350_12 = Mathf.Lerp(arg_347_1.var_.alphaOldValue10030, 1, var_350_11)

				if arg_347_1.var_.characterEffect10030 then
					arg_347_1.var_.characterEffect10030.alpha = var_350_12
				end
			end

			if arg_347_1.time_ >= var_350_8 + var_350_10 and arg_347_1.time_ < var_350_8 + var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect10030 then
				arg_347_1.var_.characterEffect10030.alpha = 1
			end

			local var_350_13 = arg_347_1.actors_["10030"]
			local var_350_14 = 0

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 and arg_347_1.var_.actorSpriteComps10030 == nil then
				arg_347_1.var_.actorSpriteComps10030 = var_350_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_15 = 0.2

			if var_350_14 <= arg_347_1.time_ and arg_347_1.time_ < var_350_14 + var_350_15 then
				local var_350_16 = (arg_347_1.time_ - var_350_14) / var_350_15

				if arg_347_1.var_.actorSpriteComps10030 then
					for iter_350_1, iter_350_2 in pairs(arg_347_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_350_2 then
							local var_350_17 = Mathf.Lerp(iter_350_2.color.r, 1, var_350_16)

							iter_350_2.color = Color.New(var_350_17, var_350_17, var_350_17)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_14 + var_350_15 and arg_347_1.time_ < var_350_14 + var_350_15 + arg_350_0 and arg_347_1.var_.actorSpriteComps10030 then
				local var_350_18 = 1

				for iter_350_3, iter_350_4 in pairs(arg_347_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_350_4 then
						iter_350_4.color = Color.New(var_350_18, var_350_18, var_350_18)
					end
				end

				arg_347_1.var_.actorSpriteComps10030 = nil
			end

			local var_350_19 = 0
			local var_350_20 = 0.35

			if var_350_19 < arg_347_1.time_ and arg_347_1.time_ <= var_350_19 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_21 = arg_347_1:FormatText(StoryNameCfg[309].name)

				arg_347_1.leftNameTxt_.text = var_350_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_22 = arg_347_1:GetWordFromCfg(115281082)
				local var_350_23 = arg_347_1:FormatText(var_350_22.content)

				arg_347_1.text_.text = var_350_23

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_24 = 14
				local var_350_25 = utf8.len(var_350_23)
				local var_350_26 = var_350_24 <= 0 and var_350_20 or var_350_20 * (var_350_25 / var_350_24)

				if var_350_26 > 0 and var_350_20 < var_350_26 then
					arg_347_1.talkMaxDuration = var_350_26

					if var_350_26 + var_350_19 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_26 + var_350_19
					end
				end

				arg_347_1.text_.text = var_350_23
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281082", "story_v_out_115281.awb") ~= 0 then
					local var_350_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281082", "story_v_out_115281.awb") / 1000

					if var_350_27 + var_350_19 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_27 + var_350_19
					end

					if var_350_22.prefab_name ~= "" and arg_347_1.actors_[var_350_22.prefab_name] ~= nil then
						local var_350_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_22.prefab_name].transform, "story_v_out_115281", "115281082", "story_v_out_115281.awb")

						arg_347_1:RecordAudio("115281082", var_350_28)
						arg_347_1:RecordAudio("115281082", var_350_28)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_115281", "115281082", "story_v_out_115281.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_115281", "115281082", "story_v_out_115281.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_29 = math.max(var_350_20, arg_347_1.talkMaxDuration)

			if var_350_19 <= arg_347_1.time_ and arg_347_1.time_ < var_350_19 + var_350_29 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_19) / var_350_29

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_19 + var_350_29 and arg_347_1.time_ < var_350_19 + var_350_29 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play115281083 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 115281083
		arg_351_1.duration_ = 5.533

		local var_351_0 = {
			ja = 5.533,
			ko = 3.366,
			zh = 3.3,
			en = 5.033
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
				arg_351_0:Play115281084(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1038"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1038 = var_354_0.localPosition
				var_354_0.localScale = Vector3.New(1, 1, 1)

				arg_351_1:CheckSpriteTmpPos("1038", 2)

				local var_354_2 = var_354_0.childCount

				for iter_354_0 = 0, var_354_2 - 1 do
					local var_354_3 = var_354_0:GetChild(iter_354_0)

					if var_354_3.name == "split_7" or not string.find(var_354_3.name, "split") then
						var_354_3.gameObject:SetActive(true)
					else
						var_354_3.gameObject:SetActive(false)
					end
				end
			end

			local var_354_4 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_4 then
				local var_354_5 = (arg_351_1.time_ - var_354_1) / var_354_4
				local var_354_6 = Vector3.New(-390, -400, 0)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1038, var_354_6, var_354_5)
			end

			if arg_351_1.time_ >= var_354_1 + var_354_4 and arg_351_1.time_ < var_354_1 + var_354_4 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_354_7 = arg_351_1.actors_["10030"]
			local var_354_8 = 0

			if var_354_8 < arg_351_1.time_ and arg_351_1.time_ <= var_354_8 + arg_354_0 and arg_351_1.var_.actorSpriteComps10030 == nil then
				arg_351_1.var_.actorSpriteComps10030 = var_354_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_9 = 0.2

			if var_354_8 <= arg_351_1.time_ and arg_351_1.time_ < var_354_8 + var_354_9 then
				local var_354_10 = (arg_351_1.time_ - var_354_8) / var_354_9

				if arg_351_1.var_.actorSpriteComps10030 then
					for iter_354_1, iter_354_2 in pairs(arg_351_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_354_2 then
							local var_354_11 = Mathf.Lerp(iter_354_2.color.r, 0.5, var_354_10)

							iter_354_2.color = Color.New(var_354_11, var_354_11, var_354_11)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_8 + var_354_9 and arg_351_1.time_ < var_354_8 + var_354_9 + arg_354_0 and arg_351_1.var_.actorSpriteComps10030 then
				local var_354_12 = 0.5

				for iter_354_3, iter_354_4 in pairs(arg_351_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_354_4 then
						iter_354_4.color = Color.New(var_354_12, var_354_12, var_354_12)
					end
				end

				arg_351_1.var_.actorSpriteComps10030 = nil
			end

			local var_354_13 = arg_351_1.actors_["1038"]
			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				local var_354_15 = var_354_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_354_15 then
					arg_351_1.var_.alphaOldValue1038 = var_354_15.alpha
					arg_351_1.var_.characterEffect1038 = var_354_15
				end

				arg_351_1.var_.alphaOldValue1038 = 0
			end

			local var_354_16 = 0.333333333333333

			if var_354_14 <= arg_351_1.time_ and arg_351_1.time_ < var_354_14 + var_354_16 then
				local var_354_17 = (arg_351_1.time_ - var_354_14) / var_354_16
				local var_354_18 = Mathf.Lerp(arg_351_1.var_.alphaOldValue1038, 1, var_354_17)

				if arg_351_1.var_.characterEffect1038 then
					arg_351_1.var_.characterEffect1038.alpha = var_354_18
				end
			end

			if arg_351_1.time_ >= var_354_14 + var_354_16 and arg_351_1.time_ < var_354_14 + var_354_16 + arg_354_0 and arg_351_1.var_.characterEffect1038 then
				arg_351_1.var_.characterEffect1038.alpha = 1
			end

			local var_354_19 = arg_351_1.actors_["1038"]
			local var_354_20 = 0

			if var_354_20 < arg_351_1.time_ and arg_351_1.time_ <= var_354_20 + arg_354_0 and arg_351_1.var_.actorSpriteComps1038 == nil then
				arg_351_1.var_.actorSpriteComps1038 = var_354_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_21 = 0.2

			if var_354_20 <= arg_351_1.time_ and arg_351_1.time_ < var_354_20 + var_354_21 then
				local var_354_22 = (arg_351_1.time_ - var_354_20) / var_354_21

				if arg_351_1.var_.actorSpriteComps1038 then
					for iter_354_5, iter_354_6 in pairs(arg_351_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_354_6 then
							local var_354_23 = Mathf.Lerp(iter_354_6.color.r, 1, var_354_22)

							iter_354_6.color = Color.New(var_354_23, var_354_23, var_354_23)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_20 + var_354_21 and arg_351_1.time_ < var_354_20 + var_354_21 + arg_354_0 and arg_351_1.var_.actorSpriteComps1038 then
				local var_354_24 = 1

				for iter_354_7, iter_354_8 in pairs(arg_351_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_354_8 then
						iter_354_8.color = Color.New(var_354_24, var_354_24, var_354_24)
					end
				end

				arg_351_1.var_.actorSpriteComps1038 = nil
			end

			local var_354_25 = 0
			local var_354_26 = 0.225

			if var_354_25 < arg_351_1.time_ and arg_351_1.time_ <= var_354_25 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_27 = arg_351_1:FormatText(StoryNameCfg[94].name)

				arg_351_1.leftNameTxt_.text = var_354_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_28 = arg_351_1:GetWordFromCfg(115281083)
				local var_354_29 = arg_351_1:FormatText(var_354_28.content)

				arg_351_1.text_.text = var_354_29

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_30 = 9
				local var_354_31 = utf8.len(var_354_29)
				local var_354_32 = var_354_30 <= 0 and var_354_26 or var_354_26 * (var_354_31 / var_354_30)

				if var_354_32 > 0 and var_354_26 < var_354_32 then
					arg_351_1.talkMaxDuration = var_354_32

					if var_354_32 + var_354_25 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_32 + var_354_25
					end
				end

				arg_351_1.text_.text = var_354_29
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281083", "story_v_out_115281.awb") ~= 0 then
					local var_354_33 = manager.audio:GetVoiceLength("story_v_out_115281", "115281083", "story_v_out_115281.awb") / 1000

					if var_354_33 + var_354_25 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_33 + var_354_25
					end

					if var_354_28.prefab_name ~= "" and arg_351_1.actors_[var_354_28.prefab_name] ~= nil then
						local var_354_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_28.prefab_name].transform, "story_v_out_115281", "115281083", "story_v_out_115281.awb")

						arg_351_1:RecordAudio("115281083", var_354_34)
						arg_351_1:RecordAudio("115281083", var_354_34)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_115281", "115281083", "story_v_out_115281.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_115281", "115281083", "story_v_out_115281.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_35 = math.max(var_354_26, arg_351_1.talkMaxDuration)

			if var_354_25 <= arg_351_1.time_ and arg_351_1.time_ < var_354_25 + var_354_35 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_25) / var_354_35

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_25 + var_354_35 and arg_351_1.time_ < var_354_25 + var_354_35 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play115281084 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 115281084
		arg_355_1.duration_ = 6.833

		local var_355_0 = {
			ja = 6.833,
			ko = 4.766,
			zh = 5.466,
			en = 5.566
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
				arg_355_0:Play115281085(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["10030"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.actorSpriteComps10030 == nil then
				arg_355_1.var_.actorSpriteComps10030 = var_358_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_2 = 0.2

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.actorSpriteComps10030 then
					for iter_358_0, iter_358_1 in pairs(arg_355_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_358_1 then
							local var_358_4 = Mathf.Lerp(iter_358_1.color.r, 1, var_358_3)

							iter_358_1.color = Color.New(var_358_4, var_358_4, var_358_4)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.actorSpriteComps10030 then
				local var_358_5 = 1

				for iter_358_2, iter_358_3 in pairs(arg_355_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_358_3 then
						iter_358_3.color = Color.New(var_358_5, var_358_5, var_358_5)
					end
				end

				arg_355_1.var_.actorSpriteComps10030 = nil
			end

			local var_358_6 = arg_355_1.actors_["1038"]
			local var_358_7 = 0

			if var_358_7 < arg_355_1.time_ and arg_355_1.time_ <= var_358_7 + arg_358_0 and arg_355_1.var_.actorSpriteComps1038 == nil then
				arg_355_1.var_.actorSpriteComps1038 = var_358_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_8 = 0.2

			if var_358_7 <= arg_355_1.time_ and arg_355_1.time_ < var_358_7 + var_358_8 then
				local var_358_9 = (arg_355_1.time_ - var_358_7) / var_358_8

				if arg_355_1.var_.actorSpriteComps1038 then
					for iter_358_4, iter_358_5 in pairs(arg_355_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_358_5 then
							local var_358_10 = Mathf.Lerp(iter_358_5.color.r, 0.5, var_358_9)

							iter_358_5.color = Color.New(var_358_10, var_358_10, var_358_10)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_7 + var_358_8 and arg_355_1.time_ < var_358_7 + var_358_8 + arg_358_0 and arg_355_1.var_.actorSpriteComps1038 then
				local var_358_11 = 0.5

				for iter_358_6, iter_358_7 in pairs(arg_355_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_358_7 then
						iter_358_7.color = Color.New(var_358_11, var_358_11, var_358_11)
					end
				end

				arg_355_1.var_.actorSpriteComps1038 = nil
			end

			local var_358_12 = arg_355_1.actors_["10030"].transform
			local var_358_13 = 0

			if var_358_13 < arg_355_1.time_ and arg_355_1.time_ <= var_358_13 + arg_358_0 then
				arg_355_1.var_.moveOldPos10030 = var_358_12.localPosition
				var_358_12.localScale = Vector3.New(1, 1, 1)

				arg_355_1:CheckSpriteTmpPos("10030", 4)

				local var_358_14 = var_358_12.childCount

				for iter_358_8 = 0, var_358_14 - 1 do
					local var_358_15 = var_358_12:GetChild(iter_358_8)

					if var_358_15.name == "split_1" or not string.find(var_358_15.name, "split") then
						var_358_15.gameObject:SetActive(true)
					else
						var_358_15.gameObject:SetActive(false)
					end
				end
			end

			local var_358_16 = 0.001

			if var_358_13 <= arg_355_1.time_ and arg_355_1.time_ < var_358_13 + var_358_16 then
				local var_358_17 = (arg_355_1.time_ - var_358_13) / var_358_16
				local var_358_18 = Vector3.New(390, -390, 150)

				var_358_12.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos10030, var_358_18, var_358_17)
			end

			if arg_355_1.time_ >= var_358_13 + var_358_16 and arg_355_1.time_ < var_358_13 + var_358_16 + arg_358_0 then
				var_358_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_358_19 = arg_355_1.actors_["10030"]
			local var_358_20 = 0

			if var_358_20 < arg_355_1.time_ and arg_355_1.time_ <= var_358_20 + arg_358_0 then
				local var_358_21 = var_358_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_358_21 then
					arg_355_1.var_.alphaOldValue10030 = var_358_21.alpha
					arg_355_1.var_.characterEffect10030 = var_358_21
				end

				arg_355_1.var_.alphaOldValue10030 = 0
			end

			local var_358_22 = 0.0166666666666667

			if var_358_20 <= arg_355_1.time_ and arg_355_1.time_ < var_358_20 + var_358_22 then
				local var_358_23 = (arg_355_1.time_ - var_358_20) / var_358_22
				local var_358_24 = Mathf.Lerp(arg_355_1.var_.alphaOldValue10030, 1, var_358_23)

				if arg_355_1.var_.characterEffect10030 then
					arg_355_1.var_.characterEffect10030.alpha = var_358_24
				end
			end

			if arg_355_1.time_ >= var_358_20 + var_358_22 and arg_355_1.time_ < var_358_20 + var_358_22 + arg_358_0 and arg_355_1.var_.characterEffect10030 then
				arg_355_1.var_.characterEffect10030.alpha = 1
			end

			local var_358_25 = 0
			local var_358_26 = 0.35

			if var_358_25 < arg_355_1.time_ and arg_355_1.time_ <= var_358_25 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_27 = arg_355_1:FormatText(StoryNameCfg[309].name)

				arg_355_1.leftNameTxt_.text = var_358_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_28 = arg_355_1:GetWordFromCfg(115281084)
				local var_358_29 = arg_355_1:FormatText(var_358_28.content)

				arg_355_1.text_.text = var_358_29

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_30 = 14
				local var_358_31 = utf8.len(var_358_29)
				local var_358_32 = var_358_30 <= 0 and var_358_26 or var_358_26 * (var_358_31 / var_358_30)

				if var_358_32 > 0 and var_358_26 < var_358_32 then
					arg_355_1.talkMaxDuration = var_358_32

					if var_358_32 + var_358_25 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_32 + var_358_25
					end
				end

				arg_355_1.text_.text = var_358_29
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281084", "story_v_out_115281.awb") ~= 0 then
					local var_358_33 = manager.audio:GetVoiceLength("story_v_out_115281", "115281084", "story_v_out_115281.awb") / 1000

					if var_358_33 + var_358_25 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_33 + var_358_25
					end

					if var_358_28.prefab_name ~= "" and arg_355_1.actors_[var_358_28.prefab_name] ~= nil then
						local var_358_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_28.prefab_name].transform, "story_v_out_115281", "115281084", "story_v_out_115281.awb")

						arg_355_1:RecordAudio("115281084", var_358_34)
						arg_355_1:RecordAudio("115281084", var_358_34)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_115281", "115281084", "story_v_out_115281.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_115281", "115281084", "story_v_out_115281.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_35 = math.max(var_358_26, arg_355_1.talkMaxDuration)

			if var_358_25 <= arg_355_1.time_ and arg_355_1.time_ < var_358_25 + var_358_35 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_25) / var_358_35

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_25 + var_358_35 and arg_355_1.time_ < var_358_25 + var_358_35 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play115281085 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 115281085
		arg_359_1.duration_ = 8.566

		local var_359_0 = {
			ja = 8.566,
			ko = 7.833,
			zh = 6.866,
			en = 7.766
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
				arg_359_0:Play115281086(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1038"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos1038 = var_362_0.localPosition
				var_362_0.localScale = Vector3.New(1, 1, 1)

				arg_359_1:CheckSpriteTmpPos("1038", 2)

				local var_362_2 = var_362_0.childCount

				for iter_362_0 = 0, var_362_2 - 1 do
					local var_362_3 = var_362_0:GetChild(iter_362_0)

					if var_362_3.name == "split_2" or not string.find(var_362_3.name, "split") then
						var_362_3.gameObject:SetActive(true)
					else
						var_362_3.gameObject:SetActive(false)
					end
				end
			end

			local var_362_4 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_4 then
				local var_362_5 = (arg_359_1.time_ - var_362_1) / var_362_4
				local var_362_6 = Vector3.New(-390, -400, 0)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1038, var_362_6, var_362_5)
			end

			if arg_359_1.time_ >= var_362_1 + var_362_4 and arg_359_1.time_ < var_362_1 + var_362_4 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_362_7 = arg_359_1.actors_["10030"]
			local var_362_8 = 0

			if var_362_8 < arg_359_1.time_ and arg_359_1.time_ <= var_362_8 + arg_362_0 and arg_359_1.var_.actorSpriteComps10030 == nil then
				arg_359_1.var_.actorSpriteComps10030 = var_362_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_362_9 = 0.2

			if var_362_8 <= arg_359_1.time_ and arg_359_1.time_ < var_362_8 + var_362_9 then
				local var_362_10 = (arg_359_1.time_ - var_362_8) / var_362_9

				if arg_359_1.var_.actorSpriteComps10030 then
					for iter_362_1, iter_362_2 in pairs(arg_359_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_362_2 then
							local var_362_11 = Mathf.Lerp(iter_362_2.color.r, 0.5, var_362_10)

							iter_362_2.color = Color.New(var_362_11, var_362_11, var_362_11)
						end
					end
				end
			end

			if arg_359_1.time_ >= var_362_8 + var_362_9 and arg_359_1.time_ < var_362_8 + var_362_9 + arg_362_0 and arg_359_1.var_.actorSpriteComps10030 then
				local var_362_12 = 0.5

				for iter_362_3, iter_362_4 in pairs(arg_359_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_362_4 then
						iter_362_4.color = Color.New(var_362_12, var_362_12, var_362_12)
					end
				end

				arg_359_1.var_.actorSpriteComps10030 = nil
			end

			local var_362_13 = arg_359_1.actors_["1038"]
			local var_362_14 = 0

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 and arg_359_1.var_.actorSpriteComps1038 == nil then
				arg_359_1.var_.actorSpriteComps1038 = var_362_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_362_15 = 0.2

			if var_362_14 <= arg_359_1.time_ and arg_359_1.time_ < var_362_14 + var_362_15 then
				local var_362_16 = (arg_359_1.time_ - var_362_14) / var_362_15

				if arg_359_1.var_.actorSpriteComps1038 then
					for iter_362_5, iter_362_6 in pairs(arg_359_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_362_6 then
							local var_362_17 = Mathf.Lerp(iter_362_6.color.r, 1, var_362_16)

							iter_362_6.color = Color.New(var_362_17, var_362_17, var_362_17)
						end
					end
				end
			end

			if arg_359_1.time_ >= var_362_14 + var_362_15 and arg_359_1.time_ < var_362_14 + var_362_15 + arg_362_0 and arg_359_1.var_.actorSpriteComps1038 then
				local var_362_18 = 1

				for iter_362_7, iter_362_8 in pairs(arg_359_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_362_8 then
						iter_362_8.color = Color.New(var_362_18, var_362_18, var_362_18)
					end
				end

				arg_359_1.var_.actorSpriteComps1038 = nil
			end

			local var_362_19 = 0
			local var_362_20 = 0.675

			if var_362_19 < arg_359_1.time_ and arg_359_1.time_ <= var_362_19 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_21 = arg_359_1:FormatText(StoryNameCfg[94].name)

				arg_359_1.leftNameTxt_.text = var_362_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_22 = arg_359_1:GetWordFromCfg(115281085)
				local var_362_23 = arg_359_1:FormatText(var_362_22.content)

				arg_359_1.text_.text = var_362_23

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_24 = 27
				local var_362_25 = utf8.len(var_362_23)
				local var_362_26 = var_362_24 <= 0 and var_362_20 or var_362_20 * (var_362_25 / var_362_24)

				if var_362_26 > 0 and var_362_20 < var_362_26 then
					arg_359_1.talkMaxDuration = var_362_26

					if var_362_26 + var_362_19 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_26 + var_362_19
					end
				end

				arg_359_1.text_.text = var_362_23
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281085", "story_v_out_115281.awb") ~= 0 then
					local var_362_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281085", "story_v_out_115281.awb") / 1000

					if var_362_27 + var_362_19 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_27 + var_362_19
					end

					if var_362_22.prefab_name ~= "" and arg_359_1.actors_[var_362_22.prefab_name] ~= nil then
						local var_362_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_22.prefab_name].transform, "story_v_out_115281", "115281085", "story_v_out_115281.awb")

						arg_359_1:RecordAudio("115281085", var_362_28)
						arg_359_1:RecordAudio("115281085", var_362_28)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_115281", "115281085", "story_v_out_115281.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_115281", "115281085", "story_v_out_115281.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_29 = math.max(var_362_20, arg_359_1.talkMaxDuration)

			if var_362_19 <= arg_359_1.time_ and arg_359_1.time_ < var_362_19 + var_362_29 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_19) / var_362_29

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_19 + var_362_29 and arg_359_1.time_ < var_362_19 + var_362_29 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play115281086 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 115281086
		arg_363_1.duration_ = 6.333

		local var_363_0 = {
			ja = 5.433,
			ko = 4.3,
			zh = 5.366,
			en = 6.333
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
				arg_363_0:Play115281087(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["10030"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos10030 = var_366_0.localPosition
				var_366_0.localScale = Vector3.New(1, 1, 1)

				arg_363_1:CheckSpriteTmpPos("10030", 4)

				local var_366_2 = var_366_0.childCount

				for iter_366_0 = 0, var_366_2 - 1 do
					local var_366_3 = var_366_0:GetChild(iter_366_0)

					if var_366_3.name == "split_4" or not string.find(var_366_3.name, "split") then
						var_366_3.gameObject:SetActive(true)
					else
						var_366_3.gameObject:SetActive(false)
					end
				end
			end

			local var_366_4 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_4 then
				local var_366_5 = (arg_363_1.time_ - var_366_1) / var_366_4
				local var_366_6 = Vector3.New(390, -390, 150)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos10030, var_366_6, var_366_5)
			end

			if arg_363_1.time_ >= var_366_1 + var_366_4 and arg_363_1.time_ < var_366_1 + var_366_4 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_366_7 = arg_363_1.actors_["10030"]
			local var_366_8 = 0

			if var_366_8 < arg_363_1.time_ and arg_363_1.time_ <= var_366_8 + arg_366_0 and arg_363_1.var_.actorSpriteComps10030 == nil then
				arg_363_1.var_.actorSpriteComps10030 = var_366_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_9 = 0.2

			if var_366_8 <= arg_363_1.time_ and arg_363_1.time_ < var_366_8 + var_366_9 then
				local var_366_10 = (arg_363_1.time_ - var_366_8) / var_366_9

				if arg_363_1.var_.actorSpriteComps10030 then
					for iter_366_1, iter_366_2 in pairs(arg_363_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_366_2 then
							local var_366_11 = Mathf.Lerp(iter_366_2.color.r, 1, var_366_10)

							iter_366_2.color = Color.New(var_366_11, var_366_11, var_366_11)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_8 + var_366_9 and arg_363_1.time_ < var_366_8 + var_366_9 + arg_366_0 and arg_363_1.var_.actorSpriteComps10030 then
				local var_366_12 = 1

				for iter_366_3, iter_366_4 in pairs(arg_363_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_366_4 then
						iter_366_4.color = Color.New(var_366_12, var_366_12, var_366_12)
					end
				end

				arg_363_1.var_.actorSpriteComps10030 = nil
			end

			local var_366_13 = arg_363_1.actors_["1038"]
			local var_366_14 = 0

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 and arg_363_1.var_.actorSpriteComps1038 == nil then
				arg_363_1.var_.actorSpriteComps1038 = var_366_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_15 = 0.2

			if var_366_14 <= arg_363_1.time_ and arg_363_1.time_ < var_366_14 + var_366_15 then
				local var_366_16 = (arg_363_1.time_ - var_366_14) / var_366_15

				if arg_363_1.var_.actorSpriteComps1038 then
					for iter_366_5, iter_366_6 in pairs(arg_363_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_366_6 then
							local var_366_17 = Mathf.Lerp(iter_366_6.color.r, 0.5, var_366_16)

							iter_366_6.color = Color.New(var_366_17, var_366_17, var_366_17)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_14 + var_366_15 and arg_363_1.time_ < var_366_14 + var_366_15 + arg_366_0 and arg_363_1.var_.actorSpriteComps1038 then
				local var_366_18 = 0.5

				for iter_366_7, iter_366_8 in pairs(arg_363_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_366_8 then
						iter_366_8.color = Color.New(var_366_18, var_366_18, var_366_18)
					end
				end

				arg_363_1.var_.actorSpriteComps1038 = nil
			end

			local var_366_19 = 0
			local var_366_20 = 0.425

			if var_366_19 < arg_363_1.time_ and arg_363_1.time_ <= var_366_19 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_21 = arg_363_1:FormatText(StoryNameCfg[309].name)

				arg_363_1.leftNameTxt_.text = var_366_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_22 = arg_363_1:GetWordFromCfg(115281086)
				local var_366_23 = arg_363_1:FormatText(var_366_22.content)

				arg_363_1.text_.text = var_366_23

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_24 = 17
				local var_366_25 = utf8.len(var_366_23)
				local var_366_26 = var_366_24 <= 0 and var_366_20 or var_366_20 * (var_366_25 / var_366_24)

				if var_366_26 > 0 and var_366_20 < var_366_26 then
					arg_363_1.talkMaxDuration = var_366_26

					if var_366_26 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_26 + var_366_19
					end
				end

				arg_363_1.text_.text = var_366_23
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281086", "story_v_out_115281.awb") ~= 0 then
					local var_366_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281086", "story_v_out_115281.awb") / 1000

					if var_366_27 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_27 + var_366_19
					end

					if var_366_22.prefab_name ~= "" and arg_363_1.actors_[var_366_22.prefab_name] ~= nil then
						local var_366_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_22.prefab_name].transform, "story_v_out_115281", "115281086", "story_v_out_115281.awb")

						arg_363_1:RecordAudio("115281086", var_366_28)
						arg_363_1:RecordAudio("115281086", var_366_28)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_115281", "115281086", "story_v_out_115281.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_115281", "115281086", "story_v_out_115281.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_29 = math.max(var_366_20, arg_363_1.talkMaxDuration)

			if var_366_19 <= arg_363_1.time_ and arg_363_1.time_ < var_366_19 + var_366_29 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_19) / var_366_29

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_19 + var_366_29 and arg_363_1.time_ < var_366_19 + var_366_29 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play115281087 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 115281087
		arg_367_1.duration_ = 5.9

		local var_367_0 = {
			ja = 4.3,
			ko = 3.866,
			zh = 3.833,
			en = 5.9
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
				arg_367_0:Play115281088(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10030"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos10030 = var_370_0.localPosition
				var_370_0.localScale = Vector3.New(1, 1, 1)

				arg_367_1:CheckSpriteTmpPos("10030", 4)

				local var_370_2 = var_370_0.childCount

				for iter_370_0 = 0, var_370_2 - 1 do
					local var_370_3 = var_370_0:GetChild(iter_370_0)

					if var_370_3.name == "split_3" or not string.find(var_370_3.name, "split") then
						var_370_3.gameObject:SetActive(true)
					else
						var_370_3.gameObject:SetActive(false)
					end
				end
			end

			local var_370_4 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_4 then
				local var_370_5 = (arg_367_1.time_ - var_370_1) / var_370_4
				local var_370_6 = Vector3.New(390, -390, 150)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos10030, var_370_6, var_370_5)
			end

			if arg_367_1.time_ >= var_370_1 + var_370_4 and arg_367_1.time_ < var_370_1 + var_370_4 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_370_7 = arg_367_1.actors_["10030"]
			local var_370_8 = 0

			if var_370_8 < arg_367_1.time_ and arg_367_1.time_ <= var_370_8 + arg_370_0 and arg_367_1.var_.actorSpriteComps10030 == nil then
				arg_367_1.var_.actorSpriteComps10030 = var_370_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_9 = 0.0166666666666667

			if var_370_8 <= arg_367_1.time_ and arg_367_1.time_ < var_370_8 + var_370_9 then
				local var_370_10 = (arg_367_1.time_ - var_370_8) / var_370_9

				if arg_367_1.var_.actorSpriteComps10030 then
					for iter_370_1, iter_370_2 in pairs(arg_367_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_370_2 then
							local var_370_11 = Mathf.Lerp(iter_370_2.color.r, 1, var_370_10)

							iter_370_2.color = Color.New(var_370_11, var_370_11, var_370_11)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_8 + var_370_9 and arg_367_1.time_ < var_370_8 + var_370_9 + arg_370_0 and arg_367_1.var_.actorSpriteComps10030 then
				local var_370_12 = 1

				for iter_370_3, iter_370_4 in pairs(arg_367_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_370_4 then
						iter_370_4.color = Color.New(var_370_12, var_370_12, var_370_12)
					end
				end

				arg_367_1.var_.actorSpriteComps10030 = nil
			end

			local var_370_13 = 0
			local var_370_14 = 0.5

			if var_370_13 < arg_367_1.time_ and arg_367_1.time_ <= var_370_13 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_15 = arg_367_1:FormatText(StoryNameCfg[309].name)

				arg_367_1.leftNameTxt_.text = var_370_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_16 = arg_367_1:GetWordFromCfg(115281087)
				local var_370_17 = arg_367_1:FormatText(var_370_16.content)

				arg_367_1.text_.text = var_370_17

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_18 = 20
				local var_370_19 = utf8.len(var_370_17)
				local var_370_20 = var_370_18 <= 0 and var_370_14 or var_370_14 * (var_370_19 / var_370_18)

				if var_370_20 > 0 and var_370_14 < var_370_20 then
					arg_367_1.talkMaxDuration = var_370_20

					if var_370_20 + var_370_13 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_20 + var_370_13
					end
				end

				arg_367_1.text_.text = var_370_17
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281087", "story_v_out_115281.awb") ~= 0 then
					local var_370_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281087", "story_v_out_115281.awb") / 1000

					if var_370_21 + var_370_13 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_21 + var_370_13
					end

					if var_370_16.prefab_name ~= "" and arg_367_1.actors_[var_370_16.prefab_name] ~= nil then
						local var_370_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_16.prefab_name].transform, "story_v_out_115281", "115281087", "story_v_out_115281.awb")

						arg_367_1:RecordAudio("115281087", var_370_22)
						arg_367_1:RecordAudio("115281087", var_370_22)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_115281", "115281087", "story_v_out_115281.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_115281", "115281087", "story_v_out_115281.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_23 = math.max(var_370_14, arg_367_1.talkMaxDuration)

			if var_370_13 <= arg_367_1.time_ and arg_367_1.time_ < var_370_13 + var_370_23 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_13) / var_370_23

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_13 + var_370_23 and arg_367_1.time_ < var_370_13 + var_370_23 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play115281088 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 115281088
		arg_371_1.duration_ = 11.4

		local var_371_0 = {
			ja = 10.566,
			ko = 8.433,
			zh = 8.466,
			en = 11.4
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
				arg_371_0:Play115281089(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1038"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1038 = var_374_0.localPosition
				var_374_0.localScale = Vector3.New(1, 1, 1)

				arg_371_1:CheckSpriteTmpPos("1038", 2)

				local var_374_2 = var_374_0.childCount

				for iter_374_0 = 0, var_374_2 - 1 do
					local var_374_3 = var_374_0:GetChild(iter_374_0)

					if var_374_3.name == "split_1" or not string.find(var_374_3.name, "split") then
						var_374_3.gameObject:SetActive(true)
					else
						var_374_3.gameObject:SetActive(false)
					end
				end
			end

			local var_374_4 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_4 then
				local var_374_5 = (arg_371_1.time_ - var_374_1) / var_374_4
				local var_374_6 = Vector3.New(-390, -400, 0)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1038, var_374_6, var_374_5)
			end

			if arg_371_1.time_ >= var_374_1 + var_374_4 and arg_371_1.time_ < var_374_1 + var_374_4 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_374_7 = arg_371_1.actors_["10030"]
			local var_374_8 = 0

			if var_374_8 < arg_371_1.time_ and arg_371_1.time_ <= var_374_8 + arg_374_0 and arg_371_1.var_.actorSpriteComps10030 == nil then
				arg_371_1.var_.actorSpriteComps10030 = var_374_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_9 = 0.2

			if var_374_8 <= arg_371_1.time_ and arg_371_1.time_ < var_374_8 + var_374_9 then
				local var_374_10 = (arg_371_1.time_ - var_374_8) / var_374_9

				if arg_371_1.var_.actorSpriteComps10030 then
					for iter_374_1, iter_374_2 in pairs(arg_371_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_374_2 then
							local var_374_11 = Mathf.Lerp(iter_374_2.color.r, 0.5, var_374_10)

							iter_374_2.color = Color.New(var_374_11, var_374_11, var_374_11)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_8 + var_374_9 and arg_371_1.time_ < var_374_8 + var_374_9 + arg_374_0 and arg_371_1.var_.actorSpriteComps10030 then
				local var_374_12 = 0.5

				for iter_374_3, iter_374_4 in pairs(arg_371_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_374_4 then
						iter_374_4.color = Color.New(var_374_12, var_374_12, var_374_12)
					end
				end

				arg_371_1.var_.actorSpriteComps10030 = nil
			end

			local var_374_13 = arg_371_1.actors_["1038"]
			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 and arg_371_1.var_.actorSpriteComps1038 == nil then
				arg_371_1.var_.actorSpriteComps1038 = var_374_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_15 = 0.2

			if var_374_14 <= arg_371_1.time_ and arg_371_1.time_ < var_374_14 + var_374_15 then
				local var_374_16 = (arg_371_1.time_ - var_374_14) / var_374_15

				if arg_371_1.var_.actorSpriteComps1038 then
					for iter_374_5, iter_374_6 in pairs(arg_371_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_374_6 then
							local var_374_17 = Mathf.Lerp(iter_374_6.color.r, 1, var_374_16)

							iter_374_6.color = Color.New(var_374_17, var_374_17, var_374_17)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_14 + var_374_15 and arg_371_1.time_ < var_374_14 + var_374_15 + arg_374_0 and arg_371_1.var_.actorSpriteComps1038 then
				local var_374_18 = 1

				for iter_374_7, iter_374_8 in pairs(arg_371_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_374_8 then
						iter_374_8.color = Color.New(var_374_18, var_374_18, var_374_18)
					end
				end

				arg_371_1.var_.actorSpriteComps1038 = nil
			end

			local var_374_19 = 0
			local var_374_20 = 0.75

			if var_374_19 < arg_371_1.time_ and arg_371_1.time_ <= var_374_19 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_21 = arg_371_1:FormatText(StoryNameCfg[94].name)

				arg_371_1.leftNameTxt_.text = var_374_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_22 = arg_371_1:GetWordFromCfg(115281088)
				local var_374_23 = arg_371_1:FormatText(var_374_22.content)

				arg_371_1.text_.text = var_374_23

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_24 = 30
				local var_374_25 = utf8.len(var_374_23)
				local var_374_26 = var_374_24 <= 0 and var_374_20 or var_374_20 * (var_374_25 / var_374_24)

				if var_374_26 > 0 and var_374_20 < var_374_26 then
					arg_371_1.talkMaxDuration = var_374_26

					if var_374_26 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_26 + var_374_19
					end
				end

				arg_371_1.text_.text = var_374_23
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281088", "story_v_out_115281.awb") ~= 0 then
					local var_374_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281088", "story_v_out_115281.awb") / 1000

					if var_374_27 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_27 + var_374_19
					end

					if var_374_22.prefab_name ~= "" and arg_371_1.actors_[var_374_22.prefab_name] ~= nil then
						local var_374_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_22.prefab_name].transform, "story_v_out_115281", "115281088", "story_v_out_115281.awb")

						arg_371_1:RecordAudio("115281088", var_374_28)
						arg_371_1:RecordAudio("115281088", var_374_28)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_115281", "115281088", "story_v_out_115281.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_115281", "115281088", "story_v_out_115281.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_29 = math.max(var_374_20, arg_371_1.talkMaxDuration)

			if var_374_19 <= arg_371_1.time_ and arg_371_1.time_ < var_374_19 + var_374_29 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_19) / var_374_29

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_19 + var_374_29 and arg_371_1.time_ < var_374_19 + var_374_29 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play115281089 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 115281089
		arg_375_1.duration_ = 13.933

		local var_375_0 = {
			ja = 13.933,
			ko = 12.433,
			zh = 12.7,
			en = 12.633
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
				arg_375_0:Play115281090(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 0
			local var_378_1 = 1.15

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_2 = arg_375_1:FormatText(StoryNameCfg[94].name)

				arg_375_1.leftNameTxt_.text = var_378_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_3 = arg_375_1:GetWordFromCfg(115281089)
				local var_378_4 = arg_375_1:FormatText(var_378_3.content)

				arg_375_1.text_.text = var_378_4

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281089", "story_v_out_115281.awb") ~= 0 then
					local var_378_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281089", "story_v_out_115281.awb") / 1000

					if var_378_8 + var_378_0 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_8 + var_378_0
					end

					if var_378_3.prefab_name ~= "" and arg_375_1.actors_[var_378_3.prefab_name] ~= nil then
						local var_378_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_3.prefab_name].transform, "story_v_out_115281", "115281089", "story_v_out_115281.awb")

						arg_375_1:RecordAudio("115281089", var_378_9)
						arg_375_1:RecordAudio("115281089", var_378_9)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_115281", "115281089", "story_v_out_115281.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_115281", "115281089", "story_v_out_115281.awb")
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
	Play115281090 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 115281090
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play115281091(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1038"]
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				local var_382_2 = var_382_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_382_2 then
					arg_379_1.var_.alphaOldValue1038 = var_382_2.alpha
					arg_379_1.var_.characterEffect1038 = var_382_2
				end

				arg_379_1.var_.alphaOldValue1038 = 1
			end

			local var_382_3 = 0.333333333333333

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_3 then
				local var_382_4 = (arg_379_1.time_ - var_382_1) / var_382_3
				local var_382_5 = Mathf.Lerp(arg_379_1.var_.alphaOldValue1038, 0, var_382_4)

				if arg_379_1.var_.characterEffect1038 then
					arg_379_1.var_.characterEffect1038.alpha = var_382_5
				end
			end

			if arg_379_1.time_ >= var_382_1 + var_382_3 and arg_379_1.time_ < var_382_1 + var_382_3 + arg_382_0 and arg_379_1.var_.characterEffect1038 then
				arg_379_1.var_.characterEffect1038.alpha = 0
			end

			local var_382_6 = arg_379_1.actors_["10030"]
			local var_382_7 = 0

			if var_382_7 < arg_379_1.time_ and arg_379_1.time_ <= var_382_7 + arg_382_0 then
				local var_382_8 = var_382_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_382_8 then
					arg_379_1.var_.alphaOldValue10030 = var_382_8.alpha
					arg_379_1.var_.characterEffect10030 = var_382_8
				end

				arg_379_1.var_.alphaOldValue10030 = 1
			end

			local var_382_9 = 0.333333333333333

			if var_382_7 <= arg_379_1.time_ and arg_379_1.time_ < var_382_7 + var_382_9 then
				local var_382_10 = (arg_379_1.time_ - var_382_7) / var_382_9
				local var_382_11 = Mathf.Lerp(arg_379_1.var_.alphaOldValue10030, 0, var_382_10)

				if arg_379_1.var_.characterEffect10030 then
					arg_379_1.var_.characterEffect10030.alpha = var_382_11
				end
			end

			if arg_379_1.time_ >= var_382_7 + var_382_9 and arg_379_1.time_ < var_382_7 + var_382_9 + arg_382_0 and arg_379_1.var_.characterEffect10030 then
				arg_379_1.var_.characterEffect10030.alpha = 0
			end

			local var_382_12 = 0
			local var_382_13 = 0.25

			if var_382_12 < arg_379_1.time_ and arg_379_1.time_ <= var_382_12 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_14 = arg_379_1:GetWordFromCfg(115281090)
				local var_382_15 = arg_379_1:FormatText(var_382_14.content)

				arg_379_1.text_.text = var_382_15

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_16 = 10
				local var_382_17 = utf8.len(var_382_15)
				local var_382_18 = var_382_16 <= 0 and var_382_13 or var_382_13 * (var_382_17 / var_382_16)

				if var_382_18 > 0 and var_382_13 < var_382_18 then
					arg_379_1.talkMaxDuration = var_382_18

					if var_382_18 + var_382_12 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_18 + var_382_12
					end
				end

				arg_379_1.text_.text = var_382_15
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_19 = math.max(var_382_13, arg_379_1.talkMaxDuration)

			if var_382_12 <= arg_379_1.time_ and arg_379_1.time_ < var_382_12 + var_382_19 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_12) / var_382_19

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_12 + var_382_19 and arg_379_1.time_ < var_382_12 + var_382_19 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play115281091 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 115281091
		arg_383_1.duration_ = 11.8

		local var_383_0 = {
			ja = 11.1,
			ko = 11.533,
			zh = 11.8,
			en = 9.5
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
				arg_383_0:Play115281092(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1038"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1038 = var_386_0.localPosition
				var_386_0.localScale = Vector3.New(1, 1, 1)

				arg_383_1:CheckSpriteTmpPos("1038", 3)

				local var_386_2 = var_386_0.childCount

				for iter_386_0 = 0, var_386_2 - 1 do
					local var_386_3 = var_386_0:GetChild(iter_386_0)

					if var_386_3.name == "split_1" or not string.find(var_386_3.name, "split") then
						var_386_3.gameObject:SetActive(true)
					else
						var_386_3.gameObject:SetActive(false)
					end
				end
			end

			local var_386_4 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_4 then
				local var_386_5 = (arg_383_1.time_ - var_386_1) / var_386_4
				local var_386_6 = Vector3.New(0, -400, 0)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1038, var_386_6, var_386_5)
			end

			if arg_383_1.time_ >= var_386_1 + var_386_4 and arg_383_1.time_ < var_386_1 + var_386_4 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_386_7 = arg_383_1.actors_["1038"]
			local var_386_8 = 0

			if var_386_8 < arg_383_1.time_ and arg_383_1.time_ <= var_386_8 + arg_386_0 and arg_383_1.var_.actorSpriteComps1038 == nil then
				arg_383_1.var_.actorSpriteComps1038 = var_386_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_9 = 0.2

			if var_386_8 <= arg_383_1.time_ and arg_383_1.time_ < var_386_8 + var_386_9 then
				local var_386_10 = (arg_383_1.time_ - var_386_8) / var_386_9

				if arg_383_1.var_.actorSpriteComps1038 then
					for iter_386_1, iter_386_2 in pairs(arg_383_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_386_2 then
							local var_386_11 = Mathf.Lerp(iter_386_2.color.r, 1, var_386_10)

							iter_386_2.color = Color.New(var_386_11, var_386_11, var_386_11)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_8 + var_386_9 and arg_383_1.time_ < var_386_8 + var_386_9 + arg_386_0 and arg_383_1.var_.actorSpriteComps1038 then
				local var_386_12 = 1

				for iter_386_3, iter_386_4 in pairs(arg_383_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_386_4 then
						iter_386_4.color = Color.New(var_386_12, var_386_12, var_386_12)
					end
				end

				arg_383_1.var_.actorSpriteComps1038 = nil
			end

			local var_386_13 = arg_383_1.actors_["1038"]
			local var_386_14 = 0

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				local var_386_15 = var_386_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_386_15 then
					arg_383_1.var_.alphaOldValue1038 = var_386_15.alpha
					arg_383_1.var_.characterEffect1038 = var_386_15
				end

				arg_383_1.var_.alphaOldValue1038 = 0
			end

			local var_386_16 = 0.333333333333333

			if var_386_14 <= arg_383_1.time_ and arg_383_1.time_ < var_386_14 + var_386_16 then
				local var_386_17 = (arg_383_1.time_ - var_386_14) / var_386_16
				local var_386_18 = Mathf.Lerp(arg_383_1.var_.alphaOldValue1038, 1, var_386_17)

				if arg_383_1.var_.characterEffect1038 then
					arg_383_1.var_.characterEffect1038.alpha = var_386_18
				end
			end

			if arg_383_1.time_ >= var_386_14 + var_386_16 and arg_383_1.time_ < var_386_14 + var_386_16 + arg_386_0 and arg_383_1.var_.characterEffect1038 then
				arg_383_1.var_.characterEffect1038.alpha = 1
			end

			local var_386_19 = 0
			local var_386_20 = 1.15

			if var_386_19 < arg_383_1.time_ and arg_383_1.time_ <= var_386_19 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_21 = arg_383_1:FormatText(StoryNameCfg[94].name)

				arg_383_1.leftNameTxt_.text = var_386_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_22 = arg_383_1:GetWordFromCfg(115281091)
				local var_386_23 = arg_383_1:FormatText(var_386_22.content)

				arg_383_1.text_.text = var_386_23

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_24 = 46
				local var_386_25 = utf8.len(var_386_23)
				local var_386_26 = var_386_24 <= 0 and var_386_20 or var_386_20 * (var_386_25 / var_386_24)

				if var_386_26 > 0 and var_386_20 < var_386_26 then
					arg_383_1.talkMaxDuration = var_386_26

					if var_386_26 + var_386_19 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_26 + var_386_19
					end
				end

				arg_383_1.text_.text = var_386_23
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281091", "story_v_out_115281.awb") ~= 0 then
					local var_386_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281091", "story_v_out_115281.awb") / 1000

					if var_386_27 + var_386_19 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_27 + var_386_19
					end

					if var_386_22.prefab_name ~= "" and arg_383_1.actors_[var_386_22.prefab_name] ~= nil then
						local var_386_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_22.prefab_name].transform, "story_v_out_115281", "115281091", "story_v_out_115281.awb")

						arg_383_1:RecordAudio("115281091", var_386_28)
						arg_383_1:RecordAudio("115281091", var_386_28)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_115281", "115281091", "story_v_out_115281.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_115281", "115281091", "story_v_out_115281.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_29 = math.max(var_386_20, arg_383_1.talkMaxDuration)

			if var_386_19 <= arg_383_1.time_ and arg_383_1.time_ < var_386_19 + var_386_29 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_19) / var_386_29

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_19 + var_386_29 and arg_383_1.time_ < var_386_19 + var_386_29 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play115281092 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 115281092
		arg_387_1.duration_ = 11.033

		local var_387_0 = {
			ja = 9.866,
			ko = 10.5,
			zh = 11.033,
			en = 10.866
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
				arg_387_0:Play115281093(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 1

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[94].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(115281092)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 40
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281092", "story_v_out_115281.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281092", "story_v_out_115281.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_115281", "115281092", "story_v_out_115281.awb")

						arg_387_1:RecordAudio("115281092", var_390_9)
						arg_387_1:RecordAudio("115281092", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_115281", "115281092", "story_v_out_115281.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_115281", "115281092", "story_v_out_115281.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play115281093 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 115281093
		arg_391_1.duration_ = 5

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play115281094(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1038"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				local var_394_2 = var_394_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_394_2 then
					arg_391_1.var_.alphaOldValue1038 = var_394_2.alpha
					arg_391_1.var_.characterEffect1038 = var_394_2
				end

				arg_391_1.var_.alphaOldValue1038 = 1
			end

			local var_394_3 = 0.333333333333333

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_3 then
				local var_394_4 = (arg_391_1.time_ - var_394_1) / var_394_3
				local var_394_5 = Mathf.Lerp(arg_391_1.var_.alphaOldValue1038, 0, var_394_4)

				if arg_391_1.var_.characterEffect1038 then
					arg_391_1.var_.characterEffect1038.alpha = var_394_5
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_3 and arg_391_1.time_ < var_394_1 + var_394_3 + arg_394_0 and arg_391_1.var_.characterEffect1038 then
				arg_391_1.var_.characterEffect1038.alpha = 0
			end

			local var_394_6 = 0
			local var_394_7 = 1.375

			if var_394_6 < arg_391_1.time_ and arg_391_1.time_ <= var_394_6 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_8 = arg_391_1:GetWordFromCfg(115281093)
				local var_394_9 = arg_391_1:FormatText(var_394_8.content)

				arg_391_1.text_.text = var_394_9

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_10 = 55
				local var_394_11 = utf8.len(var_394_9)
				local var_394_12 = var_394_10 <= 0 and var_394_7 or var_394_7 * (var_394_11 / var_394_10)

				if var_394_12 > 0 and var_394_7 < var_394_12 then
					arg_391_1.talkMaxDuration = var_394_12

					if var_394_12 + var_394_6 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_12 + var_394_6
					end
				end

				arg_391_1.text_.text = var_394_9
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_13 = math.max(var_394_7, arg_391_1.talkMaxDuration)

			if var_394_6 <= arg_391_1.time_ and arg_391_1.time_ < var_394_6 + var_394_13 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_6) / var_394_13

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_6 + var_394_13 and arg_391_1.time_ < var_394_6 + var_394_13 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play115281094 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 115281094
		arg_395_1.duration_ = 6.9

		local var_395_0 = {
			ja = 6.9,
			ko = 4.1,
			zh = 4.8,
			en = 6.366
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
				arg_395_0:Play115281095(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1038"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1038 = var_398_0.localPosition
				var_398_0.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("1038", 2)

				local var_398_2 = var_398_0.childCount

				for iter_398_0 = 0, var_398_2 - 1 do
					local var_398_3 = var_398_0:GetChild(iter_398_0)

					if var_398_3.name == "split_1" or not string.find(var_398_3.name, "split") then
						var_398_3.gameObject:SetActive(true)
					else
						var_398_3.gameObject:SetActive(false)
					end
				end
			end

			local var_398_4 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_1) / var_398_4
				local var_398_6 = Vector3.New(-390, -400, 0)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1038, var_398_6, var_398_5)
			end

			if arg_395_1.time_ >= var_398_1 + var_398_4 and arg_395_1.time_ < var_398_1 + var_398_4 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_398_7 = arg_395_1.actors_["1038"]
			local var_398_8 = 0

			if var_398_8 < arg_395_1.time_ and arg_395_1.time_ <= var_398_8 + arg_398_0 then
				local var_398_9 = var_398_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_398_9 then
					arg_395_1.var_.alphaOldValue1038 = var_398_9.alpha
					arg_395_1.var_.characterEffect1038 = var_398_9
				end

				arg_395_1.var_.alphaOldValue1038 = 0
			end

			local var_398_10 = 0.333333333333333

			if var_398_8 <= arg_395_1.time_ and arg_395_1.time_ < var_398_8 + var_398_10 then
				local var_398_11 = (arg_395_1.time_ - var_398_8) / var_398_10
				local var_398_12 = Mathf.Lerp(arg_395_1.var_.alphaOldValue1038, 1, var_398_11)

				if arg_395_1.var_.characterEffect1038 then
					arg_395_1.var_.characterEffect1038.alpha = var_398_12
				end
			end

			if arg_395_1.time_ >= var_398_8 + var_398_10 and arg_395_1.time_ < var_398_8 + var_398_10 + arg_398_0 and arg_395_1.var_.characterEffect1038 then
				arg_395_1.var_.characterEffect1038.alpha = 1
			end

			local var_398_13 = 0
			local var_398_14 = 0.4

			if var_398_13 < arg_395_1.time_ and arg_395_1.time_ <= var_398_13 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_15 = arg_395_1:FormatText(StoryNameCfg[94].name)

				arg_395_1.leftNameTxt_.text = var_398_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_16 = arg_395_1:GetWordFromCfg(115281094)
				local var_398_17 = arg_395_1:FormatText(var_398_16.content)

				arg_395_1.text_.text = var_398_17

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_18 = 16
				local var_398_19 = utf8.len(var_398_17)
				local var_398_20 = var_398_18 <= 0 and var_398_14 or var_398_14 * (var_398_19 / var_398_18)

				if var_398_20 > 0 and var_398_14 < var_398_20 then
					arg_395_1.talkMaxDuration = var_398_20

					if var_398_20 + var_398_13 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_20 + var_398_13
					end
				end

				arg_395_1.text_.text = var_398_17
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281094", "story_v_out_115281.awb") ~= 0 then
					local var_398_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281094", "story_v_out_115281.awb") / 1000

					if var_398_21 + var_398_13 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_21 + var_398_13
					end

					if var_398_16.prefab_name ~= "" and arg_395_1.actors_[var_398_16.prefab_name] ~= nil then
						local var_398_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_16.prefab_name].transform, "story_v_out_115281", "115281094", "story_v_out_115281.awb")

						arg_395_1:RecordAudio("115281094", var_398_22)
						arg_395_1:RecordAudio("115281094", var_398_22)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_115281", "115281094", "story_v_out_115281.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_115281", "115281094", "story_v_out_115281.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_23 = math.max(var_398_14, arg_395_1.talkMaxDuration)

			if var_398_13 <= arg_395_1.time_ and arg_395_1.time_ < var_398_13 + var_398_23 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_13) / var_398_23

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_13 + var_398_23 and arg_395_1.time_ < var_398_13 + var_398_23 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play115281095 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 115281095
		arg_399_1.duration_ = 3.366

		local var_399_0 = {
			ja = 2.833,
			ko = 3,
			zh = 3.2,
			en = 3.366
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
				arg_399_0:Play115281096(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["10030"].transform
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 then
				arg_399_1.var_.moveOldPos10030 = var_402_0.localPosition
				var_402_0.localScale = Vector3.New(1, 1, 1)

				arg_399_1:CheckSpriteTmpPos("10030", 4)

				local var_402_2 = var_402_0.childCount

				for iter_402_0 = 0, var_402_2 - 1 do
					local var_402_3 = var_402_0:GetChild(iter_402_0)

					if var_402_3.name == "split_5" or not string.find(var_402_3.name, "split") then
						var_402_3.gameObject:SetActive(true)
					else
						var_402_3.gameObject:SetActive(false)
					end
				end
			end

			local var_402_4 = 0.001

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_4 then
				local var_402_5 = (arg_399_1.time_ - var_402_1) / var_402_4
				local var_402_6 = Vector3.New(390, -390, 150)

				var_402_0.localPosition = Vector3.Lerp(arg_399_1.var_.moveOldPos10030, var_402_6, var_402_5)
			end

			if arg_399_1.time_ >= var_402_1 + var_402_4 and arg_399_1.time_ < var_402_1 + var_402_4 + arg_402_0 then
				var_402_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_402_7 = arg_399_1.actors_["1038"]
			local var_402_8 = 0

			if var_402_8 < arg_399_1.time_ and arg_399_1.time_ <= var_402_8 + arg_402_0 and arg_399_1.var_.actorSpriteComps1038 == nil then
				arg_399_1.var_.actorSpriteComps1038 = var_402_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_402_9 = 0.2

			if var_402_8 <= arg_399_1.time_ and arg_399_1.time_ < var_402_8 + var_402_9 then
				local var_402_10 = (arg_399_1.time_ - var_402_8) / var_402_9

				if arg_399_1.var_.actorSpriteComps1038 then
					for iter_402_1, iter_402_2 in pairs(arg_399_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_402_2 then
							local var_402_11 = Mathf.Lerp(iter_402_2.color.r, 0.5, var_402_10)

							iter_402_2.color = Color.New(var_402_11, var_402_11, var_402_11)
						end
					end
				end
			end

			if arg_399_1.time_ >= var_402_8 + var_402_9 and arg_399_1.time_ < var_402_8 + var_402_9 + arg_402_0 and arg_399_1.var_.actorSpriteComps1038 then
				local var_402_12 = 0.5

				for iter_402_3, iter_402_4 in pairs(arg_399_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_402_4 then
						iter_402_4.color = Color.New(var_402_12, var_402_12, var_402_12)
					end
				end

				arg_399_1.var_.actorSpriteComps1038 = nil
			end

			local var_402_13 = arg_399_1.actors_["10030"]
			local var_402_14 = 0

			if var_402_14 < arg_399_1.time_ and arg_399_1.time_ <= var_402_14 + arg_402_0 then
				local var_402_15 = var_402_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_402_15 then
					arg_399_1.var_.alphaOldValue10030 = var_402_15.alpha
					arg_399_1.var_.characterEffect10030 = var_402_15
				end

				arg_399_1.var_.alphaOldValue10030 = 0
			end

			local var_402_16 = 0.333333333333333

			if var_402_14 <= arg_399_1.time_ and arg_399_1.time_ < var_402_14 + var_402_16 then
				local var_402_17 = (arg_399_1.time_ - var_402_14) / var_402_16
				local var_402_18 = Mathf.Lerp(arg_399_1.var_.alphaOldValue10030, 1, var_402_17)

				if arg_399_1.var_.characterEffect10030 then
					arg_399_1.var_.characterEffect10030.alpha = var_402_18
				end
			end

			if arg_399_1.time_ >= var_402_14 + var_402_16 and arg_399_1.time_ < var_402_14 + var_402_16 + arg_402_0 and arg_399_1.var_.characterEffect10030 then
				arg_399_1.var_.characterEffect10030.alpha = 1
			end

			local var_402_19 = 0
			local var_402_20 = 0.275

			if var_402_19 < arg_399_1.time_ and arg_399_1.time_ <= var_402_19 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_21 = arg_399_1:FormatText(StoryNameCfg[309].name)

				arg_399_1.leftNameTxt_.text = var_402_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_22 = arg_399_1:GetWordFromCfg(115281095)
				local var_402_23 = arg_399_1:FormatText(var_402_22.content)

				arg_399_1.text_.text = var_402_23

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_24 = 11
				local var_402_25 = utf8.len(var_402_23)
				local var_402_26 = var_402_24 <= 0 and var_402_20 or var_402_20 * (var_402_25 / var_402_24)

				if var_402_26 > 0 and var_402_20 < var_402_26 then
					arg_399_1.talkMaxDuration = var_402_26

					if var_402_26 + var_402_19 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_26 + var_402_19
					end
				end

				arg_399_1.text_.text = var_402_23
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281095", "story_v_out_115281.awb") ~= 0 then
					local var_402_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281095", "story_v_out_115281.awb") / 1000

					if var_402_27 + var_402_19 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_27 + var_402_19
					end

					if var_402_22.prefab_name ~= "" and arg_399_1.actors_[var_402_22.prefab_name] ~= nil then
						local var_402_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_22.prefab_name].transform, "story_v_out_115281", "115281095", "story_v_out_115281.awb")

						arg_399_1:RecordAudio("115281095", var_402_28)
						arg_399_1:RecordAudio("115281095", var_402_28)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_115281", "115281095", "story_v_out_115281.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_115281", "115281095", "story_v_out_115281.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_29 = math.max(var_402_20, arg_399_1.talkMaxDuration)

			if var_402_19 <= arg_399_1.time_ and arg_399_1.time_ < var_402_19 + var_402_29 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_19) / var_402_29

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_19 + var_402_29 and arg_399_1.time_ < var_402_19 + var_402_29 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play115281096 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 115281096
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play115281097(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["10030"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				local var_406_2 = var_406_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_406_2 then
					arg_403_1.var_.alphaOldValue10030 = var_406_2.alpha
					arg_403_1.var_.characterEffect10030 = var_406_2
				end

				arg_403_1.var_.alphaOldValue10030 = 1
			end

			local var_406_3 = 0.333333333333333

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_3 then
				local var_406_4 = (arg_403_1.time_ - var_406_1) / var_406_3
				local var_406_5 = Mathf.Lerp(arg_403_1.var_.alphaOldValue10030, 0, var_406_4)

				if arg_403_1.var_.characterEffect10030 then
					arg_403_1.var_.characterEffect10030.alpha = var_406_5
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_3 and arg_403_1.time_ < var_406_1 + var_406_3 + arg_406_0 and arg_403_1.var_.characterEffect10030 then
				arg_403_1.var_.characterEffect10030.alpha = 0
			end

			local var_406_6 = arg_403_1.actors_["1038"]
			local var_406_7 = 0

			if var_406_7 < arg_403_1.time_ and arg_403_1.time_ <= var_406_7 + arg_406_0 then
				local var_406_8 = var_406_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_406_8 then
					arg_403_1.var_.alphaOldValue1038 = var_406_8.alpha
					arg_403_1.var_.characterEffect1038 = var_406_8
				end

				arg_403_1.var_.alphaOldValue1038 = 1
			end

			local var_406_9 = 0.333333333333333

			if var_406_7 <= arg_403_1.time_ and arg_403_1.time_ < var_406_7 + var_406_9 then
				local var_406_10 = (arg_403_1.time_ - var_406_7) / var_406_9
				local var_406_11 = Mathf.Lerp(arg_403_1.var_.alphaOldValue1038, 0, var_406_10)

				if arg_403_1.var_.characterEffect1038 then
					arg_403_1.var_.characterEffect1038.alpha = var_406_11
				end
			end

			if arg_403_1.time_ >= var_406_7 + var_406_9 and arg_403_1.time_ < var_406_7 + var_406_9 + arg_406_0 and arg_403_1.var_.characterEffect1038 then
				arg_403_1.var_.characterEffect1038.alpha = 0
			end

			local var_406_12 = 0
			local var_406_13 = 0.725

			if var_406_12 < arg_403_1.time_ and arg_403_1.time_ <= var_406_12 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_14 = arg_403_1:GetWordFromCfg(115281096)
				local var_406_15 = arg_403_1:FormatText(var_406_14.content)

				arg_403_1.text_.text = var_406_15

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_16 = 29
				local var_406_17 = utf8.len(var_406_15)
				local var_406_18 = var_406_16 <= 0 and var_406_13 or var_406_13 * (var_406_17 / var_406_16)

				if var_406_18 > 0 and var_406_13 < var_406_18 then
					arg_403_1.talkMaxDuration = var_406_18

					if var_406_18 + var_406_12 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_18 + var_406_12
					end
				end

				arg_403_1.text_.text = var_406_15
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_19 = math.max(var_406_13, arg_403_1.talkMaxDuration)

			if var_406_12 <= arg_403_1.time_ and arg_403_1.time_ < var_406_12 + var_406_19 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_12) / var_406_19

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_12 + var_406_19 and arg_403_1.time_ < var_406_12 + var_406_19 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play115281097 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 115281097
		arg_407_1.duration_ = 8.533

		local var_407_0 = {
			ja = 8.533,
			ko = 4.666,
			zh = 4.466,
			en = 6.833
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
				arg_407_0:Play115281098(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.475

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_2 = arg_407_1:FormatText(StoryNameCfg[309].name)

				arg_407_1.leftNameTxt_.text = var_410_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, true)
				arg_407_1.iconController_:SetSelectedState("hero")

				arg_407_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_1")

				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_3 = arg_407_1:GetWordFromCfg(115281097)
				local var_410_4 = arg_407_1:FormatText(var_410_3.content)

				arg_407_1.text_.text = var_410_4

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281097", "story_v_out_115281.awb") ~= 0 then
					local var_410_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281097", "story_v_out_115281.awb") / 1000

					if var_410_8 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_8 + var_410_0
					end

					if var_410_3.prefab_name ~= "" and arg_407_1.actors_[var_410_3.prefab_name] ~= nil then
						local var_410_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_3.prefab_name].transform, "story_v_out_115281", "115281097", "story_v_out_115281.awb")

						arg_407_1:RecordAudio("115281097", var_410_9)
						arg_407_1:RecordAudio("115281097", var_410_9)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_115281", "115281097", "story_v_out_115281.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_115281", "115281097", "story_v_out_115281.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_10 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_10 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_10

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_10 and arg_407_1.time_ < var_410_0 + var_410_10 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play115281098 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 115281098
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play115281099(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 1.25

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_2 = arg_411_1:GetWordFromCfg(115281098)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 49
				local var_414_5 = utf8.len(var_414_3)
				local var_414_6 = var_414_4 <= 0 and var_414_1 or var_414_1 * (var_414_5 / var_414_4)

				if var_414_6 > 0 and var_414_1 < var_414_6 then
					arg_411_1.talkMaxDuration = var_414_6

					if var_414_6 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_6 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_3
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_7 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_7 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_7

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_7 and arg_411_1.time_ < var_414_0 + var_414_7 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play115281099 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 115281099
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play115281100(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = manager.ui.mainCamera.transform
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 then
				arg_415_1.var_.shakeOldPos = var_418_0.localPosition
			end

			local var_418_2 = 0.166666666666667

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / 0.066
				local var_418_4, var_418_5 = math.modf(var_418_3)

				var_418_0.localPosition = Vector3.New(var_418_5 * 0.13, var_418_5 * 0.13, var_418_5 * 0.13) + arg_415_1.var_.shakeOldPos
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 then
				var_418_0.localPosition = arg_415_1.var_.shakeOldPos
			end

			local var_418_6 = 0
			local var_418_7 = 0.3

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				local var_418_8 = "play"
				local var_418_9 = "music"

				arg_415_1:AudioAction(var_418_8, var_418_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_418_10 = 0.4
			local var_418_11 = 0.6

			if var_418_10 < arg_415_1.time_ and arg_415_1.time_ <= var_418_10 + arg_418_0 then
				local var_418_12 = "play"
				local var_418_13 = "music"

				arg_415_1:AudioAction(var_418_12, var_418_13, "bgm_activity_1_4_story_surface", "bgm_activity_1_4_story_surface", "bgm_activity_1_4_story_surface.awb")
			end

			local var_418_14 = 0
			local var_418_15 = 1

			if var_418_14 < arg_415_1.time_ and arg_415_1.time_ <= var_418_14 + arg_418_0 then
				local var_418_16 = "play"
				local var_418_17 = "effect"

				arg_415_1:AudioAction(var_418_16, var_418_17, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks03", "")
			end

			local var_418_18 = 0
			local var_418_19 = 0.075

			if var_418_18 < arg_415_1.time_ and arg_415_1.time_ <= var_418_18 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_20 = arg_415_1:GetWordFromCfg(115281099)
				local var_418_21 = arg_415_1:FormatText(var_418_20.content)

				arg_415_1.text_.text = var_418_21

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_22 = 3
				local var_418_23 = utf8.len(var_418_21)
				local var_418_24 = var_418_22 <= 0 and var_418_19 or var_418_19 * (var_418_23 / var_418_22)

				if var_418_24 > 0 and var_418_19 < var_418_24 then
					arg_415_1.talkMaxDuration = var_418_24

					if var_418_24 + var_418_18 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_24 + var_418_18
					end
				end

				arg_415_1.text_.text = var_418_21
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_25 = math.max(var_418_19, arg_415_1.talkMaxDuration)

			if var_418_18 <= arg_415_1.time_ and arg_415_1.time_ < var_418_18 + var_418_25 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_18) / var_418_25

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_18 + var_418_25 and arg_415_1.time_ < var_418_18 + var_418_25 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play115281100 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 115281100
		arg_419_1.duration_ = 2.466

		local var_419_0 = {
			ja = 1.8,
			ko = 1.8,
			zh = 2,
			en = 2.466
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
				arg_419_0:Play115281101(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 0.15

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[309].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, true)
				arg_419_1.iconController_:SetSelectedState("hero")

				arg_419_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_2")

				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(115281100)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 6
				local var_422_6 = utf8.len(var_422_4)
				local var_422_7 = var_422_5 <= 0 and var_422_1 or var_422_1 * (var_422_6 / var_422_5)

				if var_422_7 > 0 and var_422_1 < var_422_7 then
					arg_419_1.talkMaxDuration = var_422_7

					if var_422_7 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_7 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_4
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281100", "story_v_out_115281.awb") ~= 0 then
					local var_422_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281100", "story_v_out_115281.awb") / 1000

					if var_422_8 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_8 + var_422_0
					end

					if var_422_3.prefab_name ~= "" and arg_419_1.actors_[var_422_3.prefab_name] ~= nil then
						local var_422_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_3.prefab_name].transform, "story_v_out_115281", "115281100", "story_v_out_115281.awb")

						arg_419_1:RecordAudio("115281100", var_422_9)
						arg_419_1:RecordAudio("115281100", var_422_9)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_115281", "115281100", "story_v_out_115281.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_115281", "115281100", "story_v_out_115281.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_10 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_10

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_10 and arg_419_1.time_ < var_422_0 + var_422_10 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play115281101 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 115281101
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play115281102(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["10030"].transform
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 then
				arg_423_1.var_.moveOldPos10030 = var_426_0.localPosition
				var_426_0.localScale = Vector3.New(1, 1, 1)

				arg_423_1:CheckSpriteTmpPos("10030", 0)

				local var_426_2 = var_426_0.childCount

				for iter_426_0 = 0, var_426_2 - 1 do
					local var_426_3 = var_426_0:GetChild(iter_426_0)

					if var_426_3.name == "split_2" or not string.find(var_426_3.name, "split") then
						var_426_3.gameObject:SetActive(true)
					else
						var_426_3.gameObject:SetActive(false)
					end
				end
			end

			local var_426_4 = 0.001

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_4 then
				local var_426_5 = (arg_423_1.time_ - var_426_1) / var_426_4
				local var_426_6 = Vector3.New(-1500, -350, -180)

				var_426_0.localPosition = Vector3.Lerp(arg_423_1.var_.moveOldPos10030, var_426_6, var_426_5)
			end

			if arg_423_1.time_ >= var_426_1 + var_426_4 and arg_423_1.time_ < var_426_1 + var_426_4 + arg_426_0 then
				var_426_0.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_426_7 = 0
			local var_426_8 = 0.55

			if var_426_7 < arg_423_1.time_ and arg_423_1.time_ <= var_426_7 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, false)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_9 = arg_423_1:GetWordFromCfg(115281101)
				local var_426_10 = arg_423_1:FormatText(var_426_9.content)

				arg_423_1.text_.text = var_426_10

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_11 = 22
				local var_426_12 = utf8.len(var_426_10)
				local var_426_13 = var_426_11 <= 0 and var_426_8 or var_426_8 * (var_426_12 / var_426_11)

				if var_426_13 > 0 and var_426_8 < var_426_13 then
					arg_423_1.talkMaxDuration = var_426_13

					if var_426_13 + var_426_7 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_13 + var_426_7
					end
				end

				arg_423_1.text_.text = var_426_10
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_14 = math.max(var_426_8, arg_423_1.talkMaxDuration)

			if var_426_7 <= arg_423_1.time_ and arg_423_1.time_ < var_426_7 + var_426_14 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_7) / var_426_14

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_7 + var_426_14 and arg_423_1.time_ < var_426_7 + var_426_14 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play115281102 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 115281102
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play115281103(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.725

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, false)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_2 = arg_427_1:GetWordFromCfg(115281102)
				local var_430_3 = arg_427_1:FormatText(var_430_2.content)

				arg_427_1.text_.text = var_430_3

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_4 = 29
				local var_430_5 = utf8.len(var_430_3)
				local var_430_6 = var_430_4 <= 0 and var_430_1 or var_430_1 * (var_430_5 / var_430_4)

				if var_430_6 > 0 and var_430_1 < var_430_6 then
					arg_427_1.talkMaxDuration = var_430_6

					if var_430_6 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_6 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_3
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_7 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_7 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_7

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_7 and arg_427_1.time_ < var_430_0 + var_430_7 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play115281103 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 115281103
		arg_431_1.duration_ = 7

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play115281104(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 1

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				local var_434_1 = manager.ui.mainCamera.transform.localPosition
				local var_434_2 = Vector3.New(0, 0, 10) + Vector3.New(var_434_1.x, var_434_1.y, 0)
				local var_434_3 = arg_431_1.bgs_.STblack

				var_434_3.transform.localPosition = var_434_2
				var_434_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_434_4 = var_434_3:GetComponent("SpriteRenderer")

				if var_434_4 and var_434_4.sprite then
					local var_434_5 = (var_434_3.transform.localPosition - var_434_1).z
					local var_434_6 = manager.ui.mainCameraCom_
					local var_434_7 = 2 * var_434_5 * Mathf.Tan(var_434_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_434_8 = var_434_7 * var_434_6.aspect
					local var_434_9 = var_434_4.sprite.bounds.size.x
					local var_434_10 = var_434_4.sprite.bounds.size.y
					local var_434_11 = var_434_8 / var_434_9
					local var_434_12 = var_434_7 / var_434_10
					local var_434_13 = var_434_12 < var_434_11 and var_434_11 or var_434_12

					var_434_3.transform.localScale = Vector3.New(var_434_13, var_434_13, 0)
				end

				for iter_434_0, iter_434_1 in pairs(arg_431_1.bgs_) do
					if iter_434_0 ~= "STblack" then
						iter_434_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_434_14 = 0

			if var_434_14 < arg_431_1.time_ and arg_431_1.time_ <= var_434_14 + arg_434_0 then
				arg_431_1.mask_.enabled = true
				arg_431_1.mask_.raycastTarget = false

				arg_431_1:SetGaussion(false)
			end

			local var_434_15 = 1

			if var_434_14 <= arg_431_1.time_ and arg_431_1.time_ < var_434_14 + var_434_15 then
				local var_434_16 = (arg_431_1.time_ - var_434_14) / var_434_15
				local var_434_17 = Color.New(0, 0, 0)

				var_434_17.a = Mathf.Lerp(0, 1, var_434_16)
				arg_431_1.mask_.color = var_434_17
			end

			if arg_431_1.time_ >= var_434_14 + var_434_15 and arg_431_1.time_ < var_434_14 + var_434_15 + arg_434_0 then
				local var_434_18 = Color.New(0, 0, 0)

				var_434_18.a = 1
				arg_431_1.mask_.color = var_434_18
			end

			local var_434_19 = 1

			if var_434_19 < arg_431_1.time_ and arg_431_1.time_ <= var_434_19 + arg_434_0 then
				arg_431_1.mask_.enabled = true
				arg_431_1.mask_.raycastTarget = false

				arg_431_1:SetGaussion(false)
			end

			local var_434_20 = 1

			if var_434_19 <= arg_431_1.time_ and arg_431_1.time_ < var_434_19 + var_434_20 then
				local var_434_21 = (arg_431_1.time_ - var_434_19) / var_434_20
				local var_434_22 = Color.New(0, 0, 0)

				var_434_22.a = Mathf.Lerp(1, 0, var_434_21)
				arg_431_1.mask_.color = var_434_22
			end

			if arg_431_1.time_ >= var_434_19 + var_434_20 and arg_431_1.time_ < var_434_19 + var_434_20 + arg_434_0 then
				local var_434_23 = Color.New(0, 0, 0)
				local var_434_24 = 0

				arg_431_1.mask_.enabled = false
				var_434_23.a = var_434_24
				arg_431_1.mask_.color = var_434_23
			end

			if arg_431_1.frameCnt_ <= 1 then
				arg_431_1.dialog_:SetActive(false)
			end

			local var_434_25 = 2
			local var_434_26 = 0.5

			if var_434_25 < arg_431_1.time_ and arg_431_1.time_ <= var_434_25 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0

				arg_431_1.dialog_:SetActive(true)

				local var_434_27 = LeanTween.value(arg_431_1.dialog_, 0, 1, 0.3)

				var_434_27:setOnUpdate(LuaHelper.FloatAction(function(arg_435_0)
					arg_431_1.dialogCg_.alpha = arg_435_0
				end))
				var_434_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_431_1.dialog_)
					var_434_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_431_1.duration_ = arg_431_1.duration_ + 0.3

				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_28 = arg_431_1:GetWordFromCfg(115281103)
				local var_434_29 = arg_431_1:FormatText(var_434_28.content)

				arg_431_1.text_.text = var_434_29

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_30 = 20
				local var_434_31 = utf8.len(var_434_29)
				local var_434_32 = var_434_30 <= 0 and var_434_26 or var_434_26 * (var_434_31 / var_434_30)

				if var_434_32 > 0 and var_434_26 < var_434_32 then
					arg_431_1.talkMaxDuration = var_434_32
					var_434_25 = var_434_25 + 0.3

					if var_434_32 + var_434_25 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_32 + var_434_25
					end
				end

				arg_431_1.text_.text = var_434_29
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_33 = var_434_25 + 0.3
			local var_434_34 = math.max(var_434_26, arg_431_1.talkMaxDuration)

			if var_434_33 <= arg_431_1.time_ and arg_431_1.time_ < var_434_33 + var_434_34 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_33) / var_434_34

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_33 + var_434_34 and arg_431_1.time_ < var_434_33 + var_434_34 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play115281104 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 115281104
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play115281105(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 0.5

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, false)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_2 = arg_437_1:GetWordFromCfg(115281104)
				local var_440_3 = arg_437_1:FormatText(var_440_2.content)

				arg_437_1.text_.text = var_440_3

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_4 = 20
				local var_440_5 = utf8.len(var_440_3)
				local var_440_6 = var_440_4 <= 0 and var_440_1 or var_440_1 * (var_440_5 / var_440_4)

				if var_440_6 > 0 and var_440_1 < var_440_6 then
					arg_437_1.talkMaxDuration = var_440_6

					if var_440_6 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_6 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_3
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_7 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_7 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_7

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_7 and arg_437_1.time_ < var_440_0 + var_440_7 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play115281105 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 115281105
		arg_441_1.duration_ = 5.633

		local var_441_0 = {
			ja = 3.999999999999,
			ko = 5.633,
			zh = 4.366,
			en = 3.999999999999
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
				arg_441_0:Play115281106(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 1

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				local var_444_1 = manager.ui.mainCamera.transform.localPosition
				local var_444_2 = Vector3.New(0, 0, 10) + Vector3.New(var_444_1.x, var_444_1.y, 0)
				local var_444_3 = arg_441_1.bgs_.ST28a

				var_444_3.transform.localPosition = var_444_2
				var_444_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_444_4 = var_444_3:GetComponent("SpriteRenderer")

				if var_444_4 and var_444_4.sprite then
					local var_444_5 = (var_444_3.transform.localPosition - var_444_1).z
					local var_444_6 = manager.ui.mainCameraCom_
					local var_444_7 = 2 * var_444_5 * Mathf.Tan(var_444_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_444_8 = var_444_7 * var_444_6.aspect
					local var_444_9 = var_444_4.sprite.bounds.size.x
					local var_444_10 = var_444_4.sprite.bounds.size.y
					local var_444_11 = var_444_8 / var_444_9
					local var_444_12 = var_444_7 / var_444_10
					local var_444_13 = var_444_12 < var_444_11 and var_444_11 or var_444_12

					var_444_3.transform.localScale = Vector3.New(var_444_13, var_444_13, 0)
				end

				for iter_444_0, iter_444_1 in pairs(arg_441_1.bgs_) do
					if iter_444_0 ~= "ST28a" then
						iter_444_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_444_14 = 0

			if var_444_14 < arg_441_1.time_ and arg_441_1.time_ <= var_444_14 + arg_444_0 then
				arg_441_1.mask_.enabled = true
				arg_441_1.mask_.raycastTarget = false

				arg_441_1:SetGaussion(false)
			end

			local var_444_15 = 1

			if var_444_14 <= arg_441_1.time_ and arg_441_1.time_ < var_444_14 + var_444_15 then
				local var_444_16 = (arg_441_1.time_ - var_444_14) / var_444_15
				local var_444_17 = Color.New(0, 0, 0)

				var_444_17.a = Mathf.Lerp(0, 1, var_444_16)
				arg_441_1.mask_.color = var_444_17
			end

			if arg_441_1.time_ >= var_444_14 + var_444_15 and arg_441_1.time_ < var_444_14 + var_444_15 + arg_444_0 then
				local var_444_18 = Color.New(0, 0, 0)

				var_444_18.a = 1
				arg_441_1.mask_.color = var_444_18
			end

			local var_444_19 = 1

			if var_444_19 < arg_441_1.time_ and arg_441_1.time_ <= var_444_19 + arg_444_0 then
				arg_441_1.mask_.enabled = true
				arg_441_1.mask_.raycastTarget = false

				arg_441_1:SetGaussion(false)
			end

			local var_444_20 = 2

			if var_444_19 <= arg_441_1.time_ and arg_441_1.time_ < var_444_19 + var_444_20 then
				local var_444_21 = (arg_441_1.time_ - var_444_19) / var_444_20
				local var_444_22 = Color.New(0, 0, 0)

				var_444_22.a = Mathf.Lerp(1, 0, var_444_21)
				arg_441_1.mask_.color = var_444_22
			end

			if arg_441_1.time_ >= var_444_19 + var_444_20 and arg_441_1.time_ < var_444_19 + var_444_20 + arg_444_0 then
				local var_444_23 = Color.New(0, 0, 0)
				local var_444_24 = 0

				arg_441_1.mask_.enabled = false
				var_444_23.a = var_444_24
				arg_441_1.mask_.color = var_444_23
			end

			local var_444_25 = manager.ui.mainCamera.transform
			local var_444_26 = 3

			if var_444_26 < arg_441_1.time_ and arg_441_1.time_ <= var_444_26 + arg_444_0 then
				arg_441_1.var_.shakeOldPos = var_444_25.localPosition
			end

			local var_444_27 = 0.133333333333333

			if var_444_26 <= arg_441_1.time_ and arg_441_1.time_ < var_444_26 + var_444_27 then
				local var_444_28 = (arg_441_1.time_ - var_444_26) / 0.066
				local var_444_29, var_444_30 = math.modf(var_444_28)

				var_444_25.localPosition = Vector3.New(var_444_30 * 0.13, var_444_30 * 0.13, var_444_30 * 0.13) + arg_441_1.var_.shakeOldPos
			end

			if arg_441_1.time_ >= var_444_26 + var_444_27 and arg_441_1.time_ < var_444_26 + var_444_27 + arg_444_0 then
				var_444_25.localPosition = arg_441_1.var_.shakeOldPos
			end

			local var_444_31 = 3
			local var_444_32 = 1

			if var_444_31 < arg_441_1.time_ and arg_441_1.time_ <= var_444_31 + arg_444_0 then
				local var_444_33 = "play"
				local var_444_34 = "effect"

				arg_441_1:AudioAction(var_444_33, var_444_34, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks02", "")
			end

			local var_444_35 = arg_441_1.actors_["10030"].transform
			local var_444_36 = 3

			if var_444_36 < arg_441_1.time_ and arg_441_1.time_ <= var_444_36 + arg_444_0 then
				arg_441_1.var_.moveOldPos10030 = var_444_35.localPosition
				var_444_35.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("10030", 3)

				local var_444_37 = var_444_35.childCount

				for iter_444_2 = 0, var_444_37 - 1 do
					local var_444_38 = var_444_35:GetChild(iter_444_2)

					if var_444_38.name == "split_1" or not string.find(var_444_38.name, "split") then
						var_444_38.gameObject:SetActive(true)
					else
						var_444_38.gameObject:SetActive(false)
					end
				end
			end

			local var_444_39 = 0.001

			if var_444_36 <= arg_441_1.time_ and arg_441_1.time_ < var_444_36 + var_444_39 then
				local var_444_40 = (arg_441_1.time_ - var_444_36) / var_444_39
				local var_444_41 = Vector3.New(0, -390, 150)

				var_444_35.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos10030, var_444_41, var_444_40)
			end

			if arg_441_1.time_ >= var_444_36 + var_444_39 and arg_441_1.time_ < var_444_36 + var_444_39 + arg_444_0 then
				var_444_35.localPosition = Vector3.New(0, -390, 150)
			end

			local var_444_42 = arg_441_1.actors_["10030"]
			local var_444_43 = 2.70066666666667

			if var_444_43 < arg_441_1.time_ and arg_441_1.time_ <= var_444_43 + arg_444_0 then
				local var_444_44 = var_444_42:GetComponentInChildren(typeof(CanvasGroup))

				if var_444_44 then
					arg_441_1.var_.alphaOldValue10030 = var_444_44.alpha
					arg_441_1.var_.characterEffect10030 = var_444_44
				end

				arg_441_1.var_.alphaOldValue10030 = 0
			end

			local var_444_45 = 0.333333333333333

			if var_444_43 <= arg_441_1.time_ and arg_441_1.time_ < var_444_43 + var_444_45 then
				local var_444_46 = (arg_441_1.time_ - var_444_43) / var_444_45
				local var_444_47 = Mathf.Lerp(arg_441_1.var_.alphaOldValue10030, 1, var_444_46)

				if arg_441_1.var_.characterEffect10030 then
					arg_441_1.var_.characterEffect10030.alpha = var_444_47
				end
			end

			if arg_441_1.time_ >= var_444_43 + var_444_45 and arg_441_1.time_ < var_444_43 + var_444_45 + arg_444_0 and arg_441_1.var_.characterEffect10030 then
				arg_441_1.var_.characterEffect10030.alpha = 1
			end

			local var_444_48 = arg_441_1.actors_["10030"]
			local var_444_49 = 3.034

			if var_444_49 < arg_441_1.time_ and arg_441_1.time_ <= var_444_49 + arg_444_0 and arg_441_1.var_.actorSpriteComps10030 == nil then
				arg_441_1.var_.actorSpriteComps10030 = var_444_48:GetComponentsInChildren(typeof(Image), true)
			end

			local var_444_50 = 0.2

			if var_444_49 <= arg_441_1.time_ and arg_441_1.time_ < var_444_49 + var_444_50 then
				local var_444_51 = (arg_441_1.time_ - var_444_49) / var_444_50

				if arg_441_1.var_.actorSpriteComps10030 then
					for iter_444_3, iter_444_4 in pairs(arg_441_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_444_4 then
							local var_444_52 = Mathf.Lerp(iter_444_4.color.r, 1, var_444_51)

							iter_444_4.color = Color.New(var_444_52, var_444_52, var_444_52)
						end
					end
				end
			end

			if arg_441_1.time_ >= var_444_49 + var_444_50 and arg_441_1.time_ < var_444_49 + var_444_50 + arg_444_0 and arg_441_1.var_.actorSpriteComps10030 then
				local var_444_53 = 1

				for iter_444_5, iter_444_6 in pairs(arg_441_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_444_6 then
						iter_444_6.color = Color.New(var_444_53, var_444_53, var_444_53)
					end
				end

				arg_441_1.var_.actorSpriteComps10030 = nil
			end

			local var_444_54 = manager.ui.mainCamera.transform
			local var_444_55 = 1

			if var_444_55 < arg_441_1.time_ and arg_441_1.time_ <= var_444_55 + arg_444_0 then
				local var_444_56 = arg_441_1.var_.effecthuo

				if not var_444_56 then
					var_444_56 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_444_56.name = "huo"
					arg_441_1.var_.effecthuo = var_444_56
				end

				local var_444_57 = var_444_54:Find("")

				if var_444_57 then
					var_444_56.transform.parent = var_444_57
				else
					var_444_56.transform.parent = var_444_54
				end

				var_444_56.transform.localPosition = Vector3.New(0, 0.02, 0.35)
				var_444_56.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_441_1.frameCnt_ <= 1 then
				arg_441_1.dialog_:SetActive(false)
			end

			local var_444_58 = 3
			local var_444_59 = 0.025

			if var_444_58 < arg_441_1.time_ and arg_441_1.time_ <= var_444_58 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0

				arg_441_1.dialog_:SetActive(true)

				local var_444_60 = LeanTween.value(arg_441_1.dialog_, 0, 1, 0.3)

				var_444_60:setOnUpdate(LuaHelper.FloatAction(function(arg_445_0)
					arg_441_1.dialogCg_.alpha = arg_445_0
				end))
				var_444_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_441_1.dialog_)
					var_444_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_441_1.duration_ = arg_441_1.duration_ + 0.3

				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_61 = arg_441_1:FormatText(StoryNameCfg[309].name)

				arg_441_1.leftNameTxt_.text = var_444_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_62 = arg_441_1:GetWordFromCfg(115281105)
				local var_444_63 = arg_441_1:FormatText(var_444_62.content)

				arg_441_1.text_.text = var_444_63

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_64 = 1
				local var_444_65 = utf8.len(var_444_63)
				local var_444_66 = var_444_64 <= 0 and var_444_59 or var_444_59 * (var_444_65 / var_444_64)

				if var_444_66 > 0 and var_444_59 < var_444_66 then
					arg_441_1.talkMaxDuration = var_444_66
					var_444_58 = var_444_58 + 0.3

					if var_444_66 + var_444_58 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_66 + var_444_58
					end
				end

				arg_441_1.text_.text = var_444_63
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281105", "story_v_out_115281.awb") ~= 0 then
					local var_444_67 = manager.audio:GetVoiceLength("story_v_out_115281", "115281105", "story_v_out_115281.awb") / 1000

					if var_444_67 + var_444_58 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_67 + var_444_58
					end

					if var_444_62.prefab_name ~= "" and arg_441_1.actors_[var_444_62.prefab_name] ~= nil then
						local var_444_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_62.prefab_name].transform, "story_v_out_115281", "115281105", "story_v_out_115281.awb")

						arg_441_1:RecordAudio("115281105", var_444_68)
						arg_441_1:RecordAudio("115281105", var_444_68)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_115281", "115281105", "story_v_out_115281.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_115281", "115281105", "story_v_out_115281.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_69 = var_444_58 + 0.3
			local var_444_70 = math.max(var_444_59, arg_441_1.talkMaxDuration)

			if var_444_69 <= arg_441_1.time_ and arg_441_1.time_ < var_444_69 + var_444_70 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_69) / var_444_70

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_69 + var_444_70 and arg_441_1.time_ < var_444_69 + var_444_70 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play115281106 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 115281106
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play115281107(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["10030"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				local var_450_2 = var_450_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_450_2 then
					arg_447_1.var_.alphaOldValue10030 = var_450_2.alpha
					arg_447_1.var_.characterEffect10030 = var_450_2
				end

				arg_447_1.var_.alphaOldValue10030 = 1
			end

			local var_450_3 = 0.333333333333333

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_3 then
				local var_450_4 = (arg_447_1.time_ - var_450_1) / var_450_3
				local var_450_5 = Mathf.Lerp(arg_447_1.var_.alphaOldValue10030, 0, var_450_4)

				if arg_447_1.var_.characterEffect10030 then
					arg_447_1.var_.characterEffect10030.alpha = var_450_5
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_3 and arg_447_1.time_ < var_450_1 + var_450_3 + arg_450_0 and arg_447_1.var_.characterEffect10030 then
				arg_447_1.var_.characterEffect10030.alpha = 0
			end

			local var_450_6 = 0
			local var_450_7 = 0.65

			if var_450_6 < arg_447_1.time_ and arg_447_1.time_ <= var_450_6 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, false)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_8 = arg_447_1:GetWordFromCfg(115281106)
				local var_450_9 = arg_447_1:FormatText(var_450_8.content)

				arg_447_1.text_.text = var_450_9

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_10 = 26
				local var_450_11 = utf8.len(var_450_9)
				local var_450_12 = var_450_10 <= 0 and var_450_7 or var_450_7 * (var_450_11 / var_450_10)

				if var_450_12 > 0 and var_450_7 < var_450_12 then
					arg_447_1.talkMaxDuration = var_450_12

					if var_450_12 + var_450_6 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_12 + var_450_6
					end
				end

				arg_447_1.text_.text = var_450_9
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_13 = math.max(var_450_7, arg_447_1.talkMaxDuration)

			if var_450_6 <= arg_447_1.time_ and arg_447_1.time_ < var_450_6 + var_450_13 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_6) / var_450_13

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_6 + var_450_13 and arg_447_1.time_ < var_450_6 + var_450_13 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play115281107 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 115281107
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play115281108(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				local var_454_2 = "play"
				local var_454_3 = "effect"

				arg_451_1:AudioAction(var_454_2, var_454_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks04", "")
			end

			local var_454_4 = 0
			local var_454_5 = 1.175

			if var_454_4 < arg_451_1.time_ and arg_451_1.time_ <= var_454_4 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_6 = arg_451_1:GetWordFromCfg(115281107)
				local var_454_7 = arg_451_1:FormatText(var_454_6.content)

				arg_451_1.text_.text = var_454_7

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_8 = 47
				local var_454_9 = utf8.len(var_454_7)
				local var_454_10 = var_454_8 <= 0 and var_454_5 or var_454_5 * (var_454_9 / var_454_8)

				if var_454_10 > 0 and var_454_5 < var_454_10 then
					arg_451_1.talkMaxDuration = var_454_10

					if var_454_10 + var_454_4 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_10 + var_454_4
					end
				end

				arg_451_1.text_.text = var_454_7
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_11 = math.max(var_454_5, arg_451_1.talkMaxDuration)

			if var_454_4 <= arg_451_1.time_ and arg_451_1.time_ < var_454_4 + var_454_11 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_4) / var_454_11

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_4 + var_454_11 and arg_451_1.time_ < var_454_4 + var_454_11 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play115281108 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 115281108
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play115281109(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 1.05

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_2 = arg_455_1:GetWordFromCfg(115281108)
				local var_458_3 = arg_455_1:FormatText(var_458_2.content)

				arg_455_1.text_.text = var_458_3

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_4 = 42
				local var_458_5 = utf8.len(var_458_3)
				local var_458_6 = var_458_4 <= 0 and var_458_1 or var_458_1 * (var_458_5 / var_458_4)

				if var_458_6 > 0 and var_458_1 < var_458_6 then
					arg_455_1.talkMaxDuration = var_458_6

					if var_458_6 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_6 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_3
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_7 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_7 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_7

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_7 and arg_455_1.time_ < var_458_0 + var_458_7 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play115281109 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 115281109
		arg_459_1.duration_ = 2.333

		local var_459_0 = {
			ja = 1.1,
			ko = 1.033,
			zh = 2.333,
			en = 1
		}
		local var_459_1 = manager.audio:GetLocalizationFlag()

		if var_459_0[var_459_1] ~= nil then
			arg_459_1.duration_ = var_459_0[var_459_1]
		end

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play115281110(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1038"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos1038 = var_462_0.localPosition
				var_462_0.localScale = Vector3.New(1, 1, 1)

				arg_459_1:CheckSpriteTmpPos("1038", 3)

				local var_462_2 = var_462_0.childCount

				for iter_462_0 = 0, var_462_2 - 1 do
					local var_462_3 = var_462_0:GetChild(iter_462_0)

					if var_462_3.name == "split_5" or not string.find(var_462_3.name, "split") then
						var_462_3.gameObject:SetActive(true)
					else
						var_462_3.gameObject:SetActive(false)
					end
				end
			end

			local var_462_4 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_4 then
				local var_462_5 = (arg_459_1.time_ - var_462_1) / var_462_4
				local var_462_6 = Vector3.New(0, -400, 0)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos1038, var_462_6, var_462_5)
			end

			if arg_459_1.time_ >= var_462_1 + var_462_4 and arg_459_1.time_ < var_462_1 + var_462_4 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_462_7 = arg_459_1.actors_["1038"]
			local var_462_8 = 0

			if var_462_8 < arg_459_1.time_ and arg_459_1.time_ <= var_462_8 + arg_462_0 and arg_459_1.var_.actorSpriteComps1038 == nil then
				arg_459_1.var_.actorSpriteComps1038 = var_462_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_462_9 = 0.2

			if var_462_8 <= arg_459_1.time_ and arg_459_1.time_ < var_462_8 + var_462_9 then
				local var_462_10 = (arg_459_1.time_ - var_462_8) / var_462_9

				if arg_459_1.var_.actorSpriteComps1038 then
					for iter_462_1, iter_462_2 in pairs(arg_459_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_462_2 then
							local var_462_11 = Mathf.Lerp(iter_462_2.color.r, 1, var_462_10)

							iter_462_2.color = Color.New(var_462_11, var_462_11, var_462_11)
						end
					end
				end
			end

			if arg_459_1.time_ >= var_462_8 + var_462_9 and arg_459_1.time_ < var_462_8 + var_462_9 + arg_462_0 and arg_459_1.var_.actorSpriteComps1038 then
				local var_462_12 = 1

				for iter_462_3, iter_462_4 in pairs(arg_459_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_462_4 then
						iter_462_4.color = Color.New(var_462_12, var_462_12, var_462_12)
					end
				end

				arg_459_1.var_.actorSpriteComps1038 = nil
			end

			local var_462_13 = arg_459_1.actors_["1038"]
			local var_462_14 = 0

			if var_462_14 < arg_459_1.time_ and arg_459_1.time_ <= var_462_14 + arg_462_0 then
				local var_462_15 = var_462_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_462_15 then
					arg_459_1.var_.alphaOldValue1038 = var_462_15.alpha
					arg_459_1.var_.characterEffect1038 = var_462_15
				end

				arg_459_1.var_.alphaOldValue1038 = 0
			end

			local var_462_16 = 0.333333333333333

			if var_462_14 <= arg_459_1.time_ and arg_459_1.time_ < var_462_14 + var_462_16 then
				local var_462_17 = (arg_459_1.time_ - var_462_14) / var_462_16
				local var_462_18 = Mathf.Lerp(arg_459_1.var_.alphaOldValue1038, 1, var_462_17)

				if arg_459_1.var_.characterEffect1038 then
					arg_459_1.var_.characterEffect1038.alpha = var_462_18
				end
			end

			if arg_459_1.time_ >= var_462_14 + var_462_16 and arg_459_1.time_ < var_462_14 + var_462_16 + arg_462_0 and arg_459_1.var_.characterEffect1038 then
				arg_459_1.var_.characterEffect1038.alpha = 1
			end

			local var_462_19 = manager.ui.mainCamera.transform
			local var_462_20 = 0

			if var_462_20 < arg_459_1.time_ and arg_459_1.time_ <= var_462_20 + arg_462_0 then
				arg_459_1.var_.shakeOldPos = var_462_19.localPosition
			end

			local var_462_21 = 0.333333333333333

			if var_462_20 <= arg_459_1.time_ and arg_459_1.time_ < var_462_20 + var_462_21 then
				local var_462_22 = (arg_459_1.time_ - var_462_20) / 0.066
				local var_462_23, var_462_24 = math.modf(var_462_22)

				var_462_19.localPosition = Vector3.New(var_462_24 * 0.13, var_462_24 * 0.13, var_462_24 * 0.13) + arg_459_1.var_.shakeOldPos
			end

			if arg_459_1.time_ >= var_462_20 + var_462_21 and arg_459_1.time_ < var_462_20 + var_462_21 + arg_462_0 then
				var_462_19.localPosition = arg_459_1.var_.shakeOldPos
			end

			local var_462_25 = 0
			local var_462_26 = 0.125

			if var_462_25 < arg_459_1.time_ and arg_459_1.time_ <= var_462_25 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_27 = arg_459_1:FormatText(StoryNameCfg[94].name)

				arg_459_1.leftNameTxt_.text = var_462_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_28 = arg_459_1:GetWordFromCfg(115281109)
				local var_462_29 = arg_459_1:FormatText(var_462_28.content)

				arg_459_1.text_.text = var_462_29

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_30 = 5
				local var_462_31 = utf8.len(var_462_29)
				local var_462_32 = var_462_30 <= 0 and var_462_26 or var_462_26 * (var_462_31 / var_462_30)

				if var_462_32 > 0 and var_462_26 < var_462_32 then
					arg_459_1.talkMaxDuration = var_462_32

					if var_462_32 + var_462_25 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_32 + var_462_25
					end
				end

				arg_459_1.text_.text = var_462_29
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281109", "story_v_out_115281.awb") ~= 0 then
					local var_462_33 = manager.audio:GetVoiceLength("story_v_out_115281", "115281109", "story_v_out_115281.awb") / 1000

					if var_462_33 + var_462_25 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_33 + var_462_25
					end

					if var_462_28.prefab_name ~= "" and arg_459_1.actors_[var_462_28.prefab_name] ~= nil then
						local var_462_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_28.prefab_name].transform, "story_v_out_115281", "115281109", "story_v_out_115281.awb")

						arg_459_1:RecordAudio("115281109", var_462_34)
						arg_459_1:RecordAudio("115281109", var_462_34)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_115281", "115281109", "story_v_out_115281.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_115281", "115281109", "story_v_out_115281.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_35 = math.max(var_462_26, arg_459_1.talkMaxDuration)

			if var_462_25 <= arg_459_1.time_ and arg_459_1.time_ < var_462_25 + var_462_35 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_25) / var_462_35

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_25 + var_462_35 and arg_459_1.time_ < var_462_25 + var_462_35 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play115281110 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 115281110
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play115281111(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1038"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				local var_466_2 = var_466_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_466_2 then
					arg_463_1.var_.alphaOldValue1038 = var_466_2.alpha
					arg_463_1.var_.characterEffect1038 = var_466_2
				end

				arg_463_1.var_.alphaOldValue1038 = 1
			end

			local var_466_3 = 0.333333333333333

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_3 then
				local var_466_4 = (arg_463_1.time_ - var_466_1) / var_466_3
				local var_466_5 = Mathf.Lerp(arg_463_1.var_.alphaOldValue1038, 0, var_466_4)

				if arg_463_1.var_.characterEffect1038 then
					arg_463_1.var_.characterEffect1038.alpha = var_466_5
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_3 and arg_463_1.time_ < var_466_1 + var_466_3 + arg_466_0 and arg_463_1.var_.characterEffect1038 then
				arg_463_1.var_.characterEffect1038.alpha = 0
			end

			local var_466_6 = 0
			local var_466_7 = 0.975

			if var_466_6 < arg_463_1.time_ and arg_463_1.time_ <= var_466_6 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_8 = arg_463_1:GetWordFromCfg(115281110)
				local var_466_9 = arg_463_1:FormatText(var_466_8.content)

				arg_463_1.text_.text = var_466_9

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_10 = 39
				local var_466_11 = utf8.len(var_466_9)
				local var_466_12 = var_466_10 <= 0 and var_466_7 or var_466_7 * (var_466_11 / var_466_10)

				if var_466_12 > 0 and var_466_7 < var_466_12 then
					arg_463_1.talkMaxDuration = var_466_12

					if var_466_12 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_12 + var_466_6
					end
				end

				arg_463_1.text_.text = var_466_9
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_13 = math.max(var_466_7, arg_463_1.talkMaxDuration)

			if var_466_6 <= arg_463_1.time_ and arg_463_1.time_ < var_466_6 + var_466_13 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_6) / var_466_13

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_6 + var_466_13 and arg_463_1.time_ < var_466_6 + var_466_13 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play115281111 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 115281111
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play115281112(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 1.2

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

				local var_470_2 = arg_467_1:GetWordFromCfg(115281111)
				local var_470_3 = arg_467_1:FormatText(var_470_2.content)

				arg_467_1.text_.text = var_470_3

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_4 = 48
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
	Play115281112 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 115281112
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play115281113(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 1.25

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_2 = arg_471_1:GetWordFromCfg(115281112)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 50
				local var_474_5 = utf8.len(var_474_3)
				local var_474_6 = var_474_4 <= 0 and var_474_1 or var_474_1 * (var_474_5 / var_474_4)

				if var_474_6 > 0 and var_474_1 < var_474_6 then
					arg_471_1.talkMaxDuration = var_474_6

					if var_474_6 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_6 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_3
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_7 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_7 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_7

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_7 and arg_471_1.time_ < var_474_0 + var_474_7 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play115281113 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 115281113
		arg_475_1.duration_ = 4.999999999999

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play115281114(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 1.01666666666667

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				local var_478_1 = manager.ui.mainCamera.transform.localPosition
				local var_478_2 = Vector3.New(0, 0, 10) + Vector3.New(var_478_1.x, var_478_1.y, 0)
				local var_478_3 = arg_475_1.bgs_.STblack

				var_478_3.transform.localPosition = var_478_2
				var_478_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_478_4 = var_478_3:GetComponent("SpriteRenderer")

				if var_478_4 and var_478_4.sprite then
					local var_478_5 = (var_478_3.transform.localPosition - var_478_1).z
					local var_478_6 = manager.ui.mainCameraCom_
					local var_478_7 = 2 * var_478_5 * Mathf.Tan(var_478_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_478_8 = var_478_7 * var_478_6.aspect
					local var_478_9 = var_478_4.sprite.bounds.size.x
					local var_478_10 = var_478_4.sprite.bounds.size.y
					local var_478_11 = var_478_8 / var_478_9
					local var_478_12 = var_478_7 / var_478_10
					local var_478_13 = var_478_12 < var_478_11 and var_478_11 or var_478_12

					var_478_3.transform.localScale = Vector3.New(var_478_13, var_478_13, 0)
				end

				for iter_478_0, iter_478_1 in pairs(arg_475_1.bgs_) do
					if iter_478_0 ~= "STblack" then
						iter_478_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_478_14 = 3

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1.fswbg_:SetActive(true)
				arg_475_1.dialog_:SetActive(false)

				arg_475_1.fswtw_.percent = 0

				local var_478_15 = arg_475_1:GetWordFromCfg(115281113)
				local var_478_16 = arg_475_1:FormatText(var_478_15.content)

				arg_475_1.fswt_.text = var_478_16

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.fswt_)

				arg_475_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_475_1.fswtw_:SetDirty()

				arg_475_1.typewritterCharCountI18N = 0

				arg_475_1:ShowNextGo(false)
			end

			local var_478_17 = 3.01666666666667

			if var_478_17 < arg_475_1.time_ and arg_475_1.time_ <= var_478_17 + arg_478_0 then
				arg_475_1.var_.oldValueTypewriter = arg_475_1.fswtw_.percent

				arg_475_1:ShowNextGo(false)
			end

			local var_478_18 = 15
			local var_478_19 = 1
			local var_478_20 = arg_475_1:GetWordFromCfg(115281113)
			local var_478_21 = arg_475_1:FormatText(var_478_20.content)
			local var_478_22, var_478_23 = arg_475_1:GetPercentByPara(var_478_21, 1)

			if var_478_17 < arg_475_1.time_ and arg_475_1.time_ <= var_478_17 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0

				local var_478_24 = var_478_18 <= 0 and var_478_19 or var_478_19 * ((var_478_23 - arg_475_1.typewritterCharCountI18N) / var_478_18)

				if var_478_24 > 0 and var_478_19 < var_478_24 then
					arg_475_1.talkMaxDuration = var_478_24

					if var_478_24 + var_478_17 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_24 + var_478_17
					end
				end
			end

			local var_478_25 = 1
			local var_478_26 = math.max(var_478_25, arg_475_1.talkMaxDuration)

			if var_478_17 <= arg_475_1.time_ and arg_475_1.time_ < var_478_17 + var_478_26 then
				local var_478_27 = (arg_475_1.time_ - var_478_17) / var_478_26

				arg_475_1.fswtw_.percent = Mathf.Lerp(arg_475_1.var_.oldValueTypewriter, var_478_22, var_478_27)
				arg_475_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_475_1.fswtw_:SetDirty()
			end

			if arg_475_1.time_ >= var_478_17 + var_478_26 and arg_475_1.time_ < var_478_17 + var_478_26 + arg_478_0 then
				arg_475_1.fswtw_.percent = var_478_22

				arg_475_1.fswtw_:SetDirty()
				arg_475_1:ShowNextGo(true)

				arg_475_1.typewritterCharCountI18N = var_478_23
			end

			local var_478_28 = manager.ui.mainCamera.transform
			local var_478_29 = 1

			if var_478_29 < arg_475_1.time_ and arg_475_1.time_ <= var_478_29 + arg_478_0 then
				local var_478_30 = arg_475_1.var_.effecthuo

				if var_478_30 then
					Object.Destroy(var_478_30)

					arg_475_1.var_.effecthuo = nil
				end
			end

			local var_478_31 = 0

			if var_478_31 < arg_475_1.time_ and arg_475_1.time_ <= var_478_31 + arg_478_0 then
				arg_475_1.mask_.enabled = true
				arg_475_1.mask_.raycastTarget = true

				arg_475_1:SetGaussion(false)
			end

			local var_478_32 = 1.01666666666667

			if var_478_31 <= arg_475_1.time_ and arg_475_1.time_ < var_478_31 + var_478_32 then
				local var_478_33 = (arg_475_1.time_ - var_478_31) / var_478_32
				local var_478_34 = Color.New(0, 0, 0)

				var_478_34.a = Mathf.Lerp(0, 1, var_478_33)
				arg_475_1.mask_.color = var_478_34
			end

			if arg_475_1.time_ >= var_478_31 + var_478_32 and arg_475_1.time_ < var_478_31 + var_478_32 + arg_478_0 then
				local var_478_35 = Color.New(0, 0, 0)

				var_478_35.a = 1
				arg_475_1.mask_.color = var_478_35
			end

			local var_478_36 = 1.01666666666667

			if var_478_36 < arg_475_1.time_ and arg_475_1.time_ <= var_478_36 + arg_478_0 then
				arg_475_1.mask_.enabled = true
				arg_475_1.mask_.raycastTarget = true

				arg_475_1:SetGaussion(false)
			end

			local var_478_37 = 1.01666666666667

			if var_478_36 <= arg_475_1.time_ and arg_475_1.time_ < var_478_36 + var_478_37 then
				local var_478_38 = (arg_475_1.time_ - var_478_36) / var_478_37
				local var_478_39 = Color.New(0, 0, 0)

				var_478_39.a = Mathf.Lerp(1, 0, var_478_38)
				arg_475_1.mask_.color = var_478_39
			end

			if arg_475_1.time_ >= var_478_36 + var_478_37 and arg_475_1.time_ < var_478_36 + var_478_37 + arg_478_0 then
				local var_478_40 = Color.New(0, 0, 0)
				local var_478_41 = 0

				arg_475_1.mask_.enabled = false
				var_478_40.a = var_478_41
				arg_475_1.mask_.color = var_478_40
			end
		end
	end,
	Play115281114 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 115281114
		arg_479_1.duration_ = 1.199999999999

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play115281115(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.var_.oldValueTypewriter = arg_479_1.fswtw_.percent

				arg_479_1:ShowNextGo(false)
			end

			local var_482_1 = 18
			local var_482_2 = 1.2
			local var_482_3 = arg_479_1:GetWordFromCfg(115281113)
			local var_482_4 = arg_479_1:FormatText(var_482_3.content)
			local var_482_5, var_482_6 = arg_479_1:GetPercentByPara(var_482_4, 2)

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0

				local var_482_7 = var_482_1 <= 0 and var_482_2 or var_482_2 * ((var_482_6 - arg_479_1.typewritterCharCountI18N) / var_482_1)

				if var_482_7 > 0 and var_482_2 < var_482_7 then
					arg_479_1.talkMaxDuration = var_482_7

					if var_482_7 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_7 + var_482_0
					end
				end
			end

			local var_482_8 = 1.2
			local var_482_9 = math.max(var_482_8, arg_479_1.talkMaxDuration)

			if var_482_0 <= arg_479_1.time_ and arg_479_1.time_ < var_482_0 + var_482_9 then
				local var_482_10 = (arg_479_1.time_ - var_482_0) / var_482_9

				arg_479_1.fswtw_.percent = Mathf.Lerp(arg_479_1.var_.oldValueTypewriter, var_482_5, var_482_10)
				arg_479_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_479_1.fswtw_:SetDirty()
			end

			if arg_479_1.time_ >= var_482_0 + var_482_9 and arg_479_1.time_ < var_482_0 + var_482_9 + arg_482_0 then
				arg_479_1.fswtw_.percent = var_482_5

				arg_479_1.fswtw_:SetDirty()
				arg_479_1:ShowNextGo(true)

				arg_479_1.typewritterCharCountI18N = var_482_6
			end
		end
	end,
	Play115281115 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 115281115
		arg_483_1.duration_ = 1.133333333332

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play115281116(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.var_.oldValueTypewriter = arg_483_1.fswtw_.percent

				arg_483_1:ShowNextGo(false)
			end

			local var_486_1 = 17
			local var_486_2 = 1.13333333333333
			local var_486_3 = arg_483_1:GetWordFromCfg(115281113)
			local var_486_4 = arg_483_1:FormatText(var_486_3.content)
			local var_486_5, var_486_6 = arg_483_1:GetPercentByPara(var_486_4, 3)

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0

				local var_486_7 = var_486_1 <= 0 and var_486_2 or var_486_2 * ((var_486_6 - arg_483_1.typewritterCharCountI18N) / var_486_1)

				if var_486_7 > 0 and var_486_2 < var_486_7 then
					arg_483_1.talkMaxDuration = var_486_7

					if var_486_7 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_7 + var_486_0
					end
				end
			end

			local var_486_8 = 1.13333333333333
			local var_486_9 = math.max(var_486_8, arg_483_1.talkMaxDuration)

			if var_486_0 <= arg_483_1.time_ and arg_483_1.time_ < var_486_0 + var_486_9 then
				local var_486_10 = (arg_483_1.time_ - var_486_0) / var_486_9

				arg_483_1.fswtw_.percent = Mathf.Lerp(arg_483_1.var_.oldValueTypewriter, var_486_5, var_486_10)
				arg_483_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_483_1.fswtw_:SetDirty()
			end

			if arg_483_1.time_ >= var_486_0 + var_486_9 and arg_483_1.time_ < var_486_0 + var_486_9 + arg_486_0 then
				arg_483_1.fswtw_.percent = var_486_5

				arg_483_1.fswtw_:SetDirty()
				arg_483_1:ShowNextGo(true)

				arg_483_1.typewritterCharCountI18N = var_486_6
			end
		end
	end,
	Play115281116 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 115281116
		arg_487_1.duration_ = 1.399999999999

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play115281117(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.var_.oldValueTypewriter = arg_487_1.fswtw_.percent

				arg_487_1:ShowNextGo(false)
			end

			local var_490_1 = 21
			local var_490_2 = 1.4
			local var_490_3 = arg_487_1:GetWordFromCfg(115281113)
			local var_490_4 = arg_487_1:FormatText(var_490_3.content)
			local var_490_5, var_490_6 = arg_487_1:GetPercentByPara(var_490_4, 4)

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0

				local var_490_7 = var_490_1 <= 0 and var_490_2 or var_490_2 * ((var_490_6 - arg_487_1.typewritterCharCountI18N) / var_490_1)

				if var_490_7 > 0 and var_490_2 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end
			end

			local var_490_8 = 1.4
			local var_490_9 = math.max(var_490_8, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_9 then
				local var_490_10 = (arg_487_1.time_ - var_490_0) / var_490_9

				arg_487_1.fswtw_.percent = Mathf.Lerp(arg_487_1.var_.oldValueTypewriter, var_490_5, var_490_10)
				arg_487_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_487_1.fswtw_:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_9 and arg_487_1.time_ < var_490_0 + var_490_9 + arg_490_0 then
				arg_487_1.fswtw_.percent = var_490_5

				arg_487_1.fswtw_:SetDirty()
				arg_487_1:ShowNextGo(true)

				arg_487_1.typewritterCharCountI18N = var_490_6
			end
		end
	end,
	Play115281117 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 115281117
		arg_491_1.duration_ = 1.266666666666

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play115281118(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.var_.oldValueTypewriter = arg_491_1.fswtw_.percent

				arg_491_1:ShowNextGo(false)
			end

			local var_494_1 = 19
			local var_494_2 = 1.26666666666667
			local var_494_3 = arg_491_1:GetWordFromCfg(115281113)
			local var_494_4 = arg_491_1:FormatText(var_494_3.content)
			local var_494_5, var_494_6 = arg_491_1:GetPercentByPara(var_494_4, 5)

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0

				local var_494_7 = var_494_1 <= 0 and var_494_2 or var_494_2 * ((var_494_6 - arg_491_1.typewritterCharCountI18N) / var_494_1)

				if var_494_7 > 0 and var_494_2 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end
			end

			local var_494_8 = 1.26666666666667
			local var_494_9 = math.max(var_494_8, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_9 then
				local var_494_10 = (arg_491_1.time_ - var_494_0) / var_494_9

				arg_491_1.fswtw_.percent = Mathf.Lerp(arg_491_1.var_.oldValueTypewriter, var_494_5, var_494_10)
				arg_491_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_491_1.fswtw_:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_9 and arg_491_1.time_ < var_494_0 + var_494_9 + arg_494_0 then
				arg_491_1.fswtw_.percent = var_494_5

				arg_491_1.fswtw_:SetDirty()
				arg_491_1:ShowNextGo(true)

				arg_491_1.typewritterCharCountI18N = var_494_6
			end
		end
	end,
	Play115281118 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 115281118
		arg_495_1.duration_ = 1.466666666666

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play115281119(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.var_.oldValueTypewriter = arg_495_1.fswtw_.percent

				arg_495_1:ShowNextGo(false)
			end

			local var_498_1 = 22
			local var_498_2 = 1.46666666666667
			local var_498_3 = arg_495_1:GetWordFromCfg(115281113)
			local var_498_4 = arg_495_1:FormatText(var_498_3.content)
			local var_498_5, var_498_6 = arg_495_1:GetPercentByPara(var_498_4, 6)

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0

				local var_498_7 = var_498_1 <= 0 and var_498_2 or var_498_2 * ((var_498_6 - arg_495_1.typewritterCharCountI18N) / var_498_1)

				if var_498_7 > 0 and var_498_2 < var_498_7 then
					arg_495_1.talkMaxDuration = var_498_7

					if var_498_7 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_7 + var_498_0
					end
				end
			end

			local var_498_8 = 1.46666666666667
			local var_498_9 = math.max(var_498_8, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_9 then
				local var_498_10 = (arg_495_1.time_ - var_498_0) / var_498_9

				arg_495_1.fswtw_.percent = Mathf.Lerp(arg_495_1.var_.oldValueTypewriter, var_498_5, var_498_10)
				arg_495_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_495_1.fswtw_:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_9 and arg_495_1.time_ < var_498_0 + var_498_9 + arg_498_0 then
				arg_495_1.fswtw_.percent = var_498_5

				arg_495_1.fswtw_:SetDirty()
				arg_495_1:ShowNextGo(true)

				arg_495_1.typewritterCharCountI18N = var_498_6
			end
		end
	end,
	Play115281119 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 115281119
		arg_499_1.duration_ = 0.999999999999

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play115281120(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.var_.oldValueTypewriter = arg_499_1.fswtw_.percent

				arg_499_1:ShowNextGo(false)
			end

			local var_502_1 = 8
			local var_502_2 = 0.533333333333333
			local var_502_3 = arg_499_1:GetWordFromCfg(115281113)
			local var_502_4 = arg_499_1:FormatText(var_502_3.content)
			local var_502_5, var_502_6 = arg_499_1:GetPercentByPara(var_502_4, 7)

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0

				local var_502_7 = var_502_1 <= 0 and var_502_2 or var_502_2 * ((var_502_6 - arg_499_1.typewritterCharCountI18N) / var_502_1)

				if var_502_7 > 0 and var_502_2 < var_502_7 then
					arg_499_1.talkMaxDuration = var_502_7

					if var_502_7 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_7 + var_502_0
					end
				end
			end

			local var_502_8 = 0.533333333333333
			local var_502_9 = math.max(var_502_8, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_9 then
				local var_502_10 = (arg_499_1.time_ - var_502_0) / var_502_9

				arg_499_1.fswtw_.percent = Mathf.Lerp(arg_499_1.var_.oldValueTypewriter, var_502_5, var_502_10)
				arg_499_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_499_1.fswtw_:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_9 and arg_499_1.time_ < var_502_0 + var_502_9 + arg_502_0 then
				arg_499_1.fswtw_.percent = var_502_5

				arg_499_1.fswtw_:SetDirty()
				arg_499_1:ShowNextGo(true)

				arg_499_1.typewritterCharCountI18N = var_502_6
			end
		end
	end,
	Play115281120 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 115281120
		arg_503_1.duration_ = 0.999999999999

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play115281121(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.var_.oldValueTypewriter = arg_503_1.fswtw_.percent

				arg_503_1:ShowNextGo(false)
			end

			local var_506_1 = 12
			local var_506_2 = 0.8
			local var_506_3 = arg_503_1:GetWordFromCfg(115281113)
			local var_506_4 = arg_503_1:FormatText(var_506_3.content)
			local var_506_5, var_506_6 = arg_503_1:GetPercentByPara(var_506_4, 8)

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0

				local var_506_7 = var_506_1 <= 0 and var_506_2 or var_506_2 * ((var_506_6 - arg_503_1.typewritterCharCountI18N) / var_506_1)

				if var_506_7 > 0 and var_506_2 < var_506_7 then
					arg_503_1.talkMaxDuration = var_506_7

					if var_506_7 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_7 + var_506_0
					end
				end
			end

			local var_506_8 = 0.8
			local var_506_9 = math.max(var_506_8, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_9 then
				local var_506_10 = (arg_503_1.time_ - var_506_0) / var_506_9

				arg_503_1.fswtw_.percent = Mathf.Lerp(arg_503_1.var_.oldValueTypewriter, var_506_5, var_506_10)
				arg_503_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_503_1.fswtw_:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_9 and arg_503_1.time_ < var_506_0 + var_506_9 + arg_506_0 then
				arg_503_1.fswtw_.percent = var_506_5

				arg_503_1.fswtw_:SetDirty()
				arg_503_1:ShowNextGo(true)

				arg_503_1.typewritterCharCountI18N = var_506_6
			end
		end
	end,
	Play115281121 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 115281121
		arg_507_1.duration_ = 9

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play115281122(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 2

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				local var_510_1 = manager.ui.mainCamera.transform.localPosition
				local var_510_2 = Vector3.New(0, 0, 10) + Vector3.New(var_510_1.x, var_510_1.y, 0)
				local var_510_3 = arg_507_1.bgs_.D999

				var_510_3.transform.localPosition = var_510_2
				var_510_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_510_4 = var_510_3:GetComponent("SpriteRenderer")

				if var_510_4 and var_510_4.sprite then
					local var_510_5 = (var_510_3.transform.localPosition - var_510_1).z
					local var_510_6 = manager.ui.mainCameraCom_
					local var_510_7 = 2 * var_510_5 * Mathf.Tan(var_510_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_510_8 = var_510_7 * var_510_6.aspect
					local var_510_9 = var_510_4.sprite.bounds.size.x
					local var_510_10 = var_510_4.sprite.bounds.size.y
					local var_510_11 = var_510_8 / var_510_9
					local var_510_12 = var_510_7 / var_510_10
					local var_510_13 = var_510_12 < var_510_11 and var_510_11 or var_510_12

					var_510_3.transform.localScale = Vector3.New(var_510_13, var_510_13, 0)
				end

				for iter_510_0, iter_510_1 in pairs(arg_507_1.bgs_) do
					if iter_510_0 ~= "D999" then
						iter_510_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_510_14 = 0

			if var_510_14 < arg_507_1.time_ and arg_507_1.time_ <= var_510_14 + arg_510_0 then
				local var_510_15 = manager.ui.mainCamera.transform.localPosition
				local var_510_16 = Vector3.New(0, 0, 10) + Vector3.New(var_510_15.x, var_510_15.y, 0)
				local var_510_17 = arg_507_1.bgs_.STblack

				var_510_17.transform.localPosition = var_510_16
				var_510_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_510_18 = var_510_17:GetComponent("SpriteRenderer")

				if var_510_18 and var_510_18.sprite then
					local var_510_19 = (var_510_17.transform.localPosition - var_510_15).z
					local var_510_20 = manager.ui.mainCameraCom_
					local var_510_21 = 2 * var_510_19 * Mathf.Tan(var_510_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_510_22 = var_510_21 * var_510_20.aspect
					local var_510_23 = var_510_18.sprite.bounds.size.x
					local var_510_24 = var_510_18.sprite.bounds.size.y
					local var_510_25 = var_510_22 / var_510_23
					local var_510_26 = var_510_21 / var_510_24
					local var_510_27 = var_510_26 < var_510_25 and var_510_25 or var_510_26

					var_510_17.transform.localScale = Vector3.New(var_510_27, var_510_27, 0)
				end

				for iter_510_2, iter_510_3 in pairs(arg_507_1.bgs_) do
					if iter_510_2 ~= "STblack" then
						iter_510_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_510_28 = 0

			if var_510_28 < arg_507_1.time_ and arg_507_1.time_ <= var_510_28 + arg_510_0 then
				arg_507_1.mask_.enabled = true
				arg_507_1.mask_.raycastTarget = false

				arg_507_1:SetGaussion(false)
			end

			local var_510_29 = 2

			if var_510_28 <= arg_507_1.time_ and arg_507_1.time_ < var_510_28 + var_510_29 then
				local var_510_30 = (arg_507_1.time_ - var_510_28) / var_510_29
				local var_510_31 = Color.New(0, 0, 0)

				var_510_31.a = Mathf.Lerp(0, 1, var_510_30)
				arg_507_1.mask_.color = var_510_31
			end

			if arg_507_1.time_ >= var_510_28 + var_510_29 and arg_507_1.time_ < var_510_28 + var_510_29 + arg_510_0 then
				local var_510_32 = Color.New(0, 0, 0)

				var_510_32.a = 1
				arg_507_1.mask_.color = var_510_32
			end

			local var_510_33 = 2

			if var_510_33 < arg_507_1.time_ and arg_507_1.time_ <= var_510_33 + arg_510_0 then
				arg_507_1.mask_.enabled = true
				arg_507_1.mask_.raycastTarget = false

				arg_507_1:SetGaussion(false)
			end

			local var_510_34 = 2

			if var_510_33 <= arg_507_1.time_ and arg_507_1.time_ < var_510_33 + var_510_34 then
				local var_510_35 = (arg_507_1.time_ - var_510_33) / var_510_34
				local var_510_36 = Color.New(0, 0, 0)

				var_510_36.a = Mathf.Lerp(1, 0, var_510_35)
				arg_507_1.mask_.color = var_510_36
			end

			if arg_507_1.time_ >= var_510_33 + var_510_34 and arg_507_1.time_ < var_510_33 + var_510_34 + arg_510_0 then
				local var_510_37 = Color.New(0, 0, 0)
				local var_510_38 = 0

				arg_507_1.mask_.enabled = false
				var_510_37.a = var_510_38
				arg_507_1.mask_.color = var_510_37
			end

			local var_510_39 = 0

			if var_510_39 < arg_507_1.time_ and arg_507_1.time_ <= var_510_39 + arg_510_0 then
				arg_507_1.fswbg_:SetActive(false)
				arg_507_1.dialog_:SetActive(true)
				arg_507_1:ShowNextGo(false)
			end

			local var_510_40 = "STwhite"

			if arg_507_1.bgs_[var_510_40] == nil then
				local var_510_41 = Object.Instantiate(arg_507_1.paintGo_)

				var_510_41:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_510_40)
				var_510_41.name = var_510_40
				var_510_41.transform.parent = arg_507_1.stage_.transform
				var_510_41.transform.localPosition = Vector3.New(0, 100, 0)
				arg_507_1.bgs_[var_510_40] = var_510_41
			end

			local var_510_42 = arg_507_1.bgs_.STwhite.transform
			local var_510_43 = 2

			if var_510_43 < arg_507_1.time_ and arg_507_1.time_ <= var_510_43 + arg_510_0 then
				arg_507_1.var_.moveOldPosSTwhite = var_510_42.localPosition
				var_510_42.localScale = Vector3.New(12, 12, 12)
			end

			local var_510_44 = 0.001

			if var_510_43 <= arg_507_1.time_ and arg_507_1.time_ < var_510_43 + var_510_44 then
				local var_510_45 = (arg_507_1.time_ - var_510_43) / var_510_44
				local var_510_46 = Vector3.New(0, 0, 0)

				var_510_42.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPosSTwhite, var_510_46, var_510_45)
			end

			if arg_507_1.time_ >= var_510_43 + var_510_44 and arg_507_1.time_ < var_510_43 + var_510_44 + arg_510_0 then
				var_510_42.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_507_1.frameCnt_ <= 1 then
				arg_507_1.dialog_:SetActive(false)
			end

			local var_510_47 = 4
			local var_510_48 = 0.975

			if var_510_47 < arg_507_1.time_ and arg_507_1.time_ <= var_510_47 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0

				arg_507_1.dialog_:SetActive(true)

				local var_510_49 = LeanTween.value(arg_507_1.dialog_, 0, 1, 0.3)

				var_510_49:setOnUpdate(LuaHelper.FloatAction(function(arg_511_0)
					arg_507_1.dialogCg_.alpha = arg_511_0
				end))
				var_510_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_507_1.dialog_)
					var_510_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_507_1.duration_ = arg_507_1.duration_ + 0.3

				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_50 = arg_507_1:GetWordFromCfg(115281121)
				local var_510_51 = arg_507_1:FormatText(var_510_50.content)

				arg_507_1.text_.text = var_510_51

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_52 = 39
				local var_510_53 = utf8.len(var_510_51)
				local var_510_54 = var_510_52 <= 0 and var_510_48 or var_510_48 * (var_510_53 / var_510_52)

				if var_510_54 > 0 and var_510_48 < var_510_54 then
					arg_507_1.talkMaxDuration = var_510_54
					var_510_47 = var_510_47 + 0.3

					if var_510_54 + var_510_47 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_54 + var_510_47
					end
				end

				arg_507_1.text_.text = var_510_51
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_55 = var_510_47 + 0.3
			local var_510_56 = math.max(var_510_48, arg_507_1.talkMaxDuration)

			if var_510_55 <= arg_507_1.time_ and arg_507_1.time_ < var_510_55 + var_510_56 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_55) / var_510_56

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_55 + var_510_56 and arg_507_1.time_ < var_510_55 + var_510_56 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play115281122 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 115281122
		arg_513_1.duration_ = 5.666

		local var_513_0 = {
			ja = 5.666,
			ko = 2.433,
			zh = 5.533,
			en = 3.233
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
				arg_513_0:Play115281123(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.25

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[309].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, true)
				arg_513_1.iconController_:SetSelectedState("hero")

				arg_513_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_3")

				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(115281122)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 10
				local var_516_6 = utf8.len(var_516_4)
				local var_516_7 = var_516_5 <= 0 and var_516_1 or var_516_1 * (var_516_6 / var_516_5)

				if var_516_7 > 0 and var_516_1 < var_516_7 then
					arg_513_1.talkMaxDuration = var_516_7

					if var_516_7 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_7 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_4
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281122", "story_v_out_115281.awb") ~= 0 then
					local var_516_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281122", "story_v_out_115281.awb") / 1000

					if var_516_8 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_8 + var_516_0
					end

					if var_516_3.prefab_name ~= "" and arg_513_1.actors_[var_516_3.prefab_name] ~= nil then
						local var_516_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_3.prefab_name].transform, "story_v_out_115281", "115281122", "story_v_out_115281.awb")

						arg_513_1:RecordAudio("115281122", var_516_9)
						arg_513_1:RecordAudio("115281122", var_516_9)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_115281", "115281122", "story_v_out_115281.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_115281", "115281122", "story_v_out_115281.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_10 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_10 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_10

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_10 and arg_513_1.time_ < var_516_0 + var_516_10 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play115281123 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 115281123
		arg_517_1.duration_ = 5

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play115281124(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = 0
			local var_520_1 = 0.55

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

				local var_520_2 = arg_517_1:GetWordFromCfg(115281123)
				local var_520_3 = arg_517_1:FormatText(var_520_2.content)

				arg_517_1.text_.text = var_520_3

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_4 = 22
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
	Play115281124 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 115281124
		arg_521_1.duration_ = 6.533

		local var_521_0 = {
			ja = 5,
			ko = 5.033,
			zh = 6.533,
			en = 5
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
				arg_521_0:Play115281125(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 2

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				local var_524_1 = manager.ui.mainCamera.transform.localPosition
				local var_524_2 = Vector3.New(0, 0, 10) + Vector3.New(var_524_1.x, var_524_1.y, 0)
				local var_524_3 = arg_521_1.bgs_.ST28a

				var_524_3.transform.localPosition = var_524_2
				var_524_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_524_4 = var_524_3:GetComponent("SpriteRenderer")

				if var_524_4 and var_524_4.sprite then
					local var_524_5 = (var_524_3.transform.localPosition - var_524_1).z
					local var_524_6 = manager.ui.mainCameraCom_
					local var_524_7 = 2 * var_524_5 * Mathf.Tan(var_524_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_524_8 = var_524_7 * var_524_6.aspect
					local var_524_9 = var_524_4.sprite.bounds.size.x
					local var_524_10 = var_524_4.sprite.bounds.size.y
					local var_524_11 = var_524_8 / var_524_9
					local var_524_12 = var_524_7 / var_524_10
					local var_524_13 = var_524_12 < var_524_11 and var_524_11 or var_524_12

					var_524_3.transform.localScale = Vector3.New(var_524_13, var_524_13, 0)
				end

				for iter_524_0, iter_524_1 in pairs(arg_521_1.bgs_) do
					if iter_524_0 ~= "ST28a" then
						iter_524_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_524_14 = 0

			if var_524_14 < arg_521_1.time_ and arg_521_1.time_ <= var_524_14 + arg_524_0 then
				arg_521_1.mask_.enabled = true
				arg_521_1.mask_.raycastTarget = false

				arg_521_1:SetGaussion(false)
			end

			local var_524_15 = 2

			if var_524_14 <= arg_521_1.time_ and arg_521_1.time_ < var_524_14 + var_524_15 then
				local var_524_16 = (arg_521_1.time_ - var_524_14) / var_524_15
				local var_524_17 = Color.New(0, 0, 0)

				var_524_17.a = Mathf.Lerp(0, 1, var_524_16)
				arg_521_1.mask_.color = var_524_17
			end

			if arg_521_1.time_ >= var_524_14 + var_524_15 and arg_521_1.time_ < var_524_14 + var_524_15 + arg_524_0 then
				local var_524_18 = Color.New(0, 0, 0)

				var_524_18.a = 1
				arg_521_1.mask_.color = var_524_18
			end

			local var_524_19 = 2

			if var_524_19 < arg_521_1.time_ and arg_521_1.time_ <= var_524_19 + arg_524_0 then
				arg_521_1.mask_.enabled = true
				arg_521_1.mask_.raycastTarget = false

				arg_521_1:SetGaussion(false)
			end

			local var_524_20 = 2

			if var_524_19 <= arg_521_1.time_ and arg_521_1.time_ < var_524_19 + var_524_20 then
				local var_524_21 = (arg_521_1.time_ - var_524_19) / var_524_20
				local var_524_22 = Color.New(0, 0, 0)

				var_524_22.a = Mathf.Lerp(1, 0, var_524_21)
				arg_521_1.mask_.color = var_524_22
			end

			if arg_521_1.time_ >= var_524_19 + var_524_20 and arg_521_1.time_ < var_524_19 + var_524_20 + arg_524_0 then
				local var_524_23 = Color.New(0, 0, 0)
				local var_524_24 = 0

				arg_521_1.mask_.enabled = false
				var_524_23.a = var_524_24
				arg_521_1.mask_.color = var_524_23
			end

			local var_524_25 = manager.ui.mainCamera.transform
			local var_524_26 = 4

			if var_524_26 < arg_521_1.time_ and arg_521_1.time_ <= var_524_26 + arg_524_0 then
				arg_521_1.var_.shakeOldPos = var_524_25.localPosition
			end

			local var_524_27 = 0.333333333333333

			if var_524_26 <= arg_521_1.time_ and arg_521_1.time_ < var_524_26 + var_524_27 then
				local var_524_28 = (arg_521_1.time_ - var_524_26) / 0.066
				local var_524_29, var_524_30 = math.modf(var_524_28)

				var_524_25.localPosition = Vector3.New(var_524_30 * 0.13, var_524_30 * 0.13, var_524_30 * 0.13) + arg_521_1.var_.shakeOldPos
			end

			if arg_521_1.time_ >= var_524_26 + var_524_27 and arg_521_1.time_ < var_524_26 + var_524_27 + arg_524_0 then
				var_524_25.localPosition = arg_521_1.var_.shakeOldPos
			end

			local var_524_31 = manager.ui.mainCamera.transform
			local var_524_32 = 2

			if var_524_32 < arg_521_1.time_ and arg_521_1.time_ <= var_524_32 + arg_524_0 then
				local var_524_33 = arg_521_1.var_.effecthuo

				if not var_524_33 then
					var_524_33 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_red"))
					var_524_33.name = "huo"
					arg_521_1.var_.effecthuo = var_524_33
				end

				local var_524_34 = var_524_31:Find("")

				if var_524_34 then
					var_524_33.transform.parent = var_524_34
				else
					var_524_33.transform.parent = var_524_31
				end

				var_524_33.transform.localPosition = Vector3.New(0, 0.02, 0.35)
				var_524_33.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_521_1.frameCnt_ <= 1 then
				arg_521_1.dialog_:SetActive(false)
			end

			local var_524_35 = 4
			local var_524_36 = 0.125

			if var_524_35 < arg_521_1.time_ and arg_521_1.time_ <= var_524_35 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0

				arg_521_1.dialog_:SetActive(true)

				local var_524_37 = LeanTween.value(arg_521_1.dialog_, 0, 1, 0.3)

				var_524_37:setOnUpdate(LuaHelper.FloatAction(function(arg_525_0)
					arg_521_1.dialogCg_.alpha = arg_525_0
				end))
				var_524_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_521_1.dialog_)
					var_524_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_521_1.duration_ = arg_521_1.duration_ + 0.3

				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_38 = arg_521_1:FormatText(StoryNameCfg[94].name)

				arg_521_1.leftNameTxt_.text = var_524_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, true)
				arg_521_1.iconController_:SetSelectedState("hero")

				arg_521_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_5")

				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_39 = arg_521_1:GetWordFromCfg(115281124)
				local var_524_40 = arg_521_1:FormatText(var_524_39.content)

				arg_521_1.text_.text = var_524_40

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_41 = 5
				local var_524_42 = utf8.len(var_524_40)
				local var_524_43 = var_524_41 <= 0 and var_524_36 or var_524_36 * (var_524_42 / var_524_41)

				if var_524_43 > 0 and var_524_36 < var_524_43 then
					arg_521_1.talkMaxDuration = var_524_43
					var_524_35 = var_524_35 + 0.3

					if var_524_43 + var_524_35 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_43 + var_524_35
					end
				end

				arg_521_1.text_.text = var_524_40
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281124", "story_v_out_115281.awb") ~= 0 then
					local var_524_44 = manager.audio:GetVoiceLength("story_v_out_115281", "115281124", "story_v_out_115281.awb") / 1000

					if var_524_44 + var_524_35 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_44 + var_524_35
					end

					if var_524_39.prefab_name ~= "" and arg_521_1.actors_[var_524_39.prefab_name] ~= nil then
						local var_524_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_39.prefab_name].transform, "story_v_out_115281", "115281124", "story_v_out_115281.awb")

						arg_521_1:RecordAudio("115281124", var_524_45)
						arg_521_1:RecordAudio("115281124", var_524_45)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_115281", "115281124", "story_v_out_115281.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_115281", "115281124", "story_v_out_115281.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_46 = var_524_35 + 0.3
			local var_524_47 = math.max(var_524_36, arg_521_1.talkMaxDuration)

			if var_524_46 <= arg_521_1.time_ and arg_521_1.time_ < var_524_46 + var_524_47 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_46) / var_524_47

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_46 + var_524_47 and arg_521_1.time_ < var_524_46 + var_524_47 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play115281125 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 115281125
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play115281126(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 1.225

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

				local var_530_2 = arg_527_1:GetWordFromCfg(115281125)
				local var_530_3 = arg_527_1:FormatText(var_530_2.content)

				arg_527_1.text_.text = var_530_3

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_4 = 49
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
	Play115281126 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 115281126
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play115281127(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0
			local var_534_1 = 0.7

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, false)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_2 = arg_531_1:GetWordFromCfg(115281126)
				local var_534_3 = arg_531_1:FormatText(var_534_2.content)

				arg_531_1.text_.text = var_534_3

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_4 = 28
				local var_534_5 = utf8.len(var_534_3)
				local var_534_6 = var_534_4 <= 0 and var_534_1 or var_534_1 * (var_534_5 / var_534_4)

				if var_534_6 > 0 and var_534_1 < var_534_6 then
					arg_531_1.talkMaxDuration = var_534_6

					if var_534_6 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_6 + var_534_0
					end
				end

				arg_531_1.text_.text = var_534_3
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_7 = math.max(var_534_1, arg_531_1.talkMaxDuration)

			if var_534_0 <= arg_531_1.time_ and arg_531_1.time_ < var_534_0 + var_534_7 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_0) / var_534_7

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_0 + var_534_7 and arg_531_1.time_ < var_534_0 + var_534_7 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play115281127 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 115281127
		arg_535_1.duration_ = 5.2

		local var_535_0 = {
			ja = 3.766,
			ko = 4.633,
			zh = 5.2,
			en = 3.866
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
				arg_535_0:Play115281128(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1038"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos1038 = var_538_0.localPosition
				var_538_0.localScale = Vector3.New(1, 1, 1)

				arg_535_1:CheckSpriteTmpPos("1038", 3)

				local var_538_2 = var_538_0.childCount

				for iter_538_0 = 0, var_538_2 - 1 do
					local var_538_3 = var_538_0:GetChild(iter_538_0)

					if var_538_3.name == "split_9" or not string.find(var_538_3.name, "split") then
						var_538_3.gameObject:SetActive(true)
					else
						var_538_3.gameObject:SetActive(false)
					end
				end
			end

			local var_538_4 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_4 then
				local var_538_5 = (arg_535_1.time_ - var_538_1) / var_538_4
				local var_538_6 = Vector3.New(0, -400, 0)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1038, var_538_6, var_538_5)
			end

			if arg_535_1.time_ >= var_538_1 + var_538_4 and arg_535_1.time_ < var_538_1 + var_538_4 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_538_7 = arg_535_1.actors_["1038"]
			local var_538_8 = 0

			if var_538_8 < arg_535_1.time_ and arg_535_1.time_ <= var_538_8 + arg_538_0 then
				local var_538_9 = var_538_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_538_9 then
					arg_535_1.var_.alphaOldValue1038 = var_538_9.alpha
					arg_535_1.var_.characterEffect1038 = var_538_9
				end

				arg_535_1.var_.alphaOldValue1038 = 0
			end

			local var_538_10 = 0.333333333333333

			if var_538_8 <= arg_535_1.time_ and arg_535_1.time_ < var_538_8 + var_538_10 then
				local var_538_11 = (arg_535_1.time_ - var_538_8) / var_538_10
				local var_538_12 = Mathf.Lerp(arg_535_1.var_.alphaOldValue1038, 1, var_538_11)

				if arg_535_1.var_.characterEffect1038 then
					arg_535_1.var_.characterEffect1038.alpha = var_538_12
				end
			end

			if arg_535_1.time_ >= var_538_8 + var_538_10 and arg_535_1.time_ < var_538_8 + var_538_10 + arg_538_0 and arg_535_1.var_.characterEffect1038 then
				arg_535_1.var_.characterEffect1038.alpha = 1
			end

			local var_538_13 = 0
			local var_538_14 = 0.5

			if var_538_13 < arg_535_1.time_ and arg_535_1.time_ <= var_538_13 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_15 = arg_535_1:FormatText(StoryNameCfg[94].name)

				arg_535_1.leftNameTxt_.text = var_538_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_16 = arg_535_1:GetWordFromCfg(115281127)
				local var_538_17 = arg_535_1:FormatText(var_538_16.content)

				arg_535_1.text_.text = var_538_17

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_18 = 19
				local var_538_19 = utf8.len(var_538_17)
				local var_538_20 = var_538_18 <= 0 and var_538_14 or var_538_14 * (var_538_19 / var_538_18)

				if var_538_20 > 0 and var_538_14 < var_538_20 then
					arg_535_1.talkMaxDuration = var_538_20

					if var_538_20 + var_538_13 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_20 + var_538_13
					end
				end

				arg_535_1.text_.text = var_538_17
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281127", "story_v_out_115281.awb") ~= 0 then
					local var_538_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281127", "story_v_out_115281.awb") / 1000

					if var_538_21 + var_538_13 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_21 + var_538_13
					end

					if var_538_16.prefab_name ~= "" and arg_535_1.actors_[var_538_16.prefab_name] ~= nil then
						local var_538_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_16.prefab_name].transform, "story_v_out_115281", "115281127", "story_v_out_115281.awb")

						arg_535_1:RecordAudio("115281127", var_538_22)
						arg_535_1:RecordAudio("115281127", var_538_22)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_115281", "115281127", "story_v_out_115281.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_115281", "115281127", "story_v_out_115281.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_23 = math.max(var_538_14, arg_535_1.talkMaxDuration)

			if var_538_13 <= arg_535_1.time_ and arg_535_1.time_ < var_538_13 + var_538_23 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_13) / var_538_23

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_13 + var_538_23 and arg_535_1.time_ < var_538_13 + var_538_23 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play115281128 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 115281128
		arg_539_1.duration_ = 5.3

		local var_539_0 = {
			ja = 3.133,
			ko = 2.033,
			zh = 5.3,
			en = 3.9
		}
		local var_539_1 = manager.audio:GetLocalizationFlag()

		if var_539_0[var_539_1] ~= nil then
			arg_539_1.duration_ = var_539_0[var_539_1]
		end

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play115281129(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1038"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1038 = var_542_0.localPosition
				var_542_0.localScale = Vector3.New(1, 1, 1)

				arg_539_1:CheckSpriteTmpPos("1038", 3)

				local var_542_2 = var_542_0.childCount

				for iter_542_0 = 0, var_542_2 - 1 do
					local var_542_3 = var_542_0:GetChild(iter_542_0)

					if var_542_3.name == "split_7" or not string.find(var_542_3.name, "split") then
						var_542_3.gameObject:SetActive(true)
					else
						var_542_3.gameObject:SetActive(false)
					end
				end
			end

			local var_542_4 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_4 then
				local var_542_5 = (arg_539_1.time_ - var_542_1) / var_542_4
				local var_542_6 = Vector3.New(0, -400, 0)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1038, var_542_6, var_542_5)
			end

			if arg_539_1.time_ >= var_542_1 + var_542_4 and arg_539_1.time_ < var_542_1 + var_542_4 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_542_7 = 0
			local var_542_8 = 0.425

			if var_542_7 < arg_539_1.time_ and arg_539_1.time_ <= var_542_7 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_9 = arg_539_1:FormatText(StoryNameCfg[94].name)

				arg_539_1.leftNameTxt_.text = var_542_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_10 = arg_539_1:GetWordFromCfg(115281128)
				local var_542_11 = arg_539_1:FormatText(var_542_10.content)

				arg_539_1.text_.text = var_542_11

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_12 = 17
				local var_542_13 = utf8.len(var_542_11)
				local var_542_14 = var_542_12 <= 0 and var_542_8 or var_542_8 * (var_542_13 / var_542_12)

				if var_542_14 > 0 and var_542_8 < var_542_14 then
					arg_539_1.talkMaxDuration = var_542_14

					if var_542_14 + var_542_7 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_14 + var_542_7
					end
				end

				arg_539_1.text_.text = var_542_11
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281128", "story_v_out_115281.awb") ~= 0 then
					local var_542_15 = manager.audio:GetVoiceLength("story_v_out_115281", "115281128", "story_v_out_115281.awb") / 1000

					if var_542_15 + var_542_7 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_15 + var_542_7
					end

					if var_542_10.prefab_name ~= "" and arg_539_1.actors_[var_542_10.prefab_name] ~= nil then
						local var_542_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_10.prefab_name].transform, "story_v_out_115281", "115281128", "story_v_out_115281.awb")

						arg_539_1:RecordAudio("115281128", var_542_16)
						arg_539_1:RecordAudio("115281128", var_542_16)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_115281", "115281128", "story_v_out_115281.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_115281", "115281128", "story_v_out_115281.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_17 = math.max(var_542_8, arg_539_1.talkMaxDuration)

			if var_542_7 <= arg_539_1.time_ and arg_539_1.time_ < var_542_7 + var_542_17 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_7) / var_542_17

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_7 + var_542_17 and arg_539_1.time_ < var_542_7 + var_542_17 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play115281129 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 115281129
		arg_543_1.duration_ = 9

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play115281130(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = "RO0501"

			if arg_543_1.bgs_[var_546_0] == nil then
				local var_546_1 = Object.Instantiate(arg_543_1.paintGo_)

				var_546_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_546_0)
				var_546_1.name = var_546_0
				var_546_1.transform.parent = arg_543_1.stage_.transform
				var_546_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_543_1.bgs_[var_546_0] = var_546_1
			end

			local var_546_2 = 1.98333333333333

			if var_546_2 < arg_543_1.time_ and arg_543_1.time_ <= var_546_2 + arg_546_0 then
				local var_546_3 = manager.ui.mainCamera.transform.localPosition
				local var_546_4 = Vector3.New(0, 0, 10) + Vector3.New(var_546_3.x, var_546_3.y, 0)
				local var_546_5 = arg_543_1.bgs_.RO0501

				var_546_5.transform.localPosition = var_546_4
				var_546_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_546_6 = var_546_5:GetComponent("SpriteRenderer")

				if var_546_6 and var_546_6.sprite then
					local var_546_7 = (var_546_5.transform.localPosition - var_546_3).z
					local var_546_8 = manager.ui.mainCameraCom_
					local var_546_9 = 2 * var_546_7 * Mathf.Tan(var_546_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_546_10 = var_546_9 * var_546_8.aspect
					local var_546_11 = var_546_6.sprite.bounds.size.x
					local var_546_12 = var_546_6.sprite.bounds.size.y
					local var_546_13 = var_546_10 / var_546_11
					local var_546_14 = var_546_9 / var_546_12
					local var_546_15 = var_546_14 < var_546_13 and var_546_13 or var_546_14

					var_546_5.transform.localScale = Vector3.New(var_546_15, var_546_15, 0)
				end

				for iter_546_0, iter_546_1 in pairs(arg_543_1.bgs_) do
					if iter_546_0 ~= "RO0501" then
						iter_546_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_546_16 = 0

			if var_546_16 < arg_543_1.time_ and arg_543_1.time_ <= var_546_16 + arg_546_0 then
				arg_543_1.mask_.enabled = true
				arg_543_1.mask_.raycastTarget = true

				arg_543_1:SetGaussion(false)
			end

			local var_546_17 = 2

			if var_546_16 <= arg_543_1.time_ and arg_543_1.time_ < var_546_16 + var_546_17 then
				local var_546_18 = (arg_543_1.time_ - var_546_16) / var_546_17
				local var_546_19 = Color.New(1, 1, 1)

				var_546_19.a = Mathf.Lerp(0, 1, var_546_18)
				arg_543_1.mask_.color = var_546_19
			end

			if arg_543_1.time_ >= var_546_16 + var_546_17 and arg_543_1.time_ < var_546_16 + var_546_17 + arg_546_0 then
				local var_546_20 = Color.New(1, 1, 1)

				var_546_20.a = 1
				arg_543_1.mask_.color = var_546_20
			end

			local var_546_21 = 2

			if var_546_21 < arg_543_1.time_ and arg_543_1.time_ <= var_546_21 + arg_546_0 then
				arg_543_1.mask_.enabled = true
				arg_543_1.mask_.raycastTarget = true

				arg_543_1:SetGaussion(false)
			end

			local var_546_22 = 2

			if var_546_21 <= arg_543_1.time_ and arg_543_1.time_ < var_546_21 + var_546_22 then
				local var_546_23 = (arg_543_1.time_ - var_546_21) / var_546_22
				local var_546_24 = Color.New(1, 1, 1)

				var_546_24.a = Mathf.Lerp(1, 0, var_546_23)
				arg_543_1.mask_.color = var_546_24
			end

			if arg_543_1.time_ >= var_546_21 + var_546_22 and arg_543_1.time_ < var_546_21 + var_546_22 + arg_546_0 then
				local var_546_25 = Color.New(1, 1, 1)
				local var_546_26 = 0

				arg_543_1.mask_.enabled = false
				var_546_25.a = var_546_26
				arg_543_1.mask_.color = var_546_25
			end

			local var_546_27 = arg_543_1.actors_["1038"].transform
			local var_546_28 = 2

			if var_546_28 < arg_543_1.time_ and arg_543_1.time_ <= var_546_28 + arg_546_0 then
				arg_543_1.var_.moveOldPos1038 = var_546_27.localPosition
				var_546_27.localScale = Vector3.New(1, 1, 1)

				arg_543_1:CheckSpriteTmpPos("1038", 0)

				local var_546_29 = var_546_27.childCount

				for iter_546_2 = 0, var_546_29 - 1 do
					local var_546_30 = var_546_27:GetChild(iter_546_2)

					if var_546_30.name == "split_7" or not string.find(var_546_30.name, "split") then
						var_546_30.gameObject:SetActive(true)
					else
						var_546_30.gameObject:SetActive(false)
					end
				end
			end

			local var_546_31 = 0.001

			if var_546_28 <= arg_543_1.time_ and arg_543_1.time_ < var_546_28 + var_546_31 then
				local var_546_32 = (arg_543_1.time_ - var_546_28) / var_546_31
				local var_546_33 = Vector3.New(-1500, -350, -180)

				var_546_27.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1038, var_546_33, var_546_32)
			end

			if arg_543_1.time_ >= var_546_28 + var_546_31 and arg_543_1.time_ < var_546_28 + var_546_31 + arg_546_0 then
				var_546_27.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_546_34 = 4
			local var_546_35 = 1

			if var_546_34 < arg_543_1.time_ and arg_543_1.time_ <= var_546_34 + arg_546_0 then
				local var_546_36 = "play"
				local var_546_37 = "effect"

				arg_543_1:AudioAction(var_546_36, var_546_37, "se_story_activity_1_5_3", "se_story_activity_1_5_3_magic", "")
			end

			local var_546_38 = manager.ui.mainCamera.transform
			local var_546_39 = 1.98333333333333

			if var_546_39 < arg_543_1.time_ and arg_543_1.time_ <= var_546_39 + arg_546_0 then
				local var_546_40 = arg_543_1.var_.effecthuo

				if var_546_40 then
					Object.Destroy(var_546_40)

					arg_543_1.var_.effecthuo = nil
				end
			end

			local var_546_41 = arg_543_1.bgs_.RO0501.transform
			local var_546_42 = 2

			if var_546_42 < arg_543_1.time_ and arg_543_1.time_ <= var_546_42 + arg_546_0 then
				arg_543_1.var_.moveOldPosRO0501 = var_546_41.localPosition
			end

			local var_546_43 = 0.001

			if var_546_42 <= arg_543_1.time_ and arg_543_1.time_ < var_546_42 + var_546_43 then
				local var_546_44 = (arg_543_1.time_ - var_546_42) / var_546_43
				local var_546_45 = Vector3.New(3.68, 0.25, 1)

				var_546_41.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPosRO0501, var_546_45, var_546_44)
			end

			if arg_543_1.time_ >= var_546_42 + var_546_43 and arg_543_1.time_ < var_546_42 + var_546_43 + arg_546_0 then
				var_546_41.localPosition = Vector3.New(3.68, 0.25, 1)
			end

			local var_546_46 = arg_543_1.bgs_.RO0501.transform
			local var_546_47 = 2.83333333333333

			if var_546_47 < arg_543_1.time_ and arg_543_1.time_ <= var_546_47 + arg_546_0 then
				arg_543_1.var_.moveOldPosRO0501 = var_546_46.localPosition
			end

			local var_546_48 = 2.86666666666667

			if var_546_47 <= arg_543_1.time_ and arg_543_1.time_ < var_546_47 + var_546_48 then
				local var_546_49 = (arg_543_1.time_ - var_546_47) / var_546_48
				local var_546_50 = Vector3.New(-3.13, 0.25, 5)

				var_546_46.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPosRO0501, var_546_50, var_546_49)
			end

			if arg_543_1.time_ >= var_546_47 + var_546_48 and arg_543_1.time_ < var_546_47 + var_546_48 + arg_546_0 then
				var_546_46.localPosition = Vector3.New(-3.13, 0.25, 5)
			end

			local var_546_51 = 4
			local var_546_52 = 1.1

			if var_546_51 < arg_543_1.time_ and arg_543_1.time_ <= var_546_51 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, false)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_53 = arg_543_1:GetWordFromCfg(115281129)
				local var_546_54 = arg_543_1:FormatText(var_546_53.content)

				arg_543_1.text_.text = var_546_54

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_55 = 44
				local var_546_56 = utf8.len(var_546_54)
				local var_546_57 = var_546_55 <= 0 and var_546_52 or var_546_52 * (var_546_56 / var_546_55)

				if var_546_57 > 0 and var_546_52 < var_546_57 then
					arg_543_1.talkMaxDuration = var_546_57

					if var_546_57 + var_546_51 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_57 + var_546_51
					end
				end

				arg_543_1.text_.text = var_546_54
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_58 = math.max(var_546_52, arg_543_1.talkMaxDuration)

			if var_546_51 <= arg_543_1.time_ and arg_543_1.time_ < var_546_51 + var_546_58 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_51) / var_546_58

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_51 + var_546_58 and arg_543_1.time_ < var_546_51 + var_546_58 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play115281130 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 115281130
		arg_547_1.duration_ = 6.8

		local var_547_0 = {
			ja = 6.8,
			ko = 3.366,
			zh = 4.9,
			en = 2.766
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
				arg_547_0:Play115281131(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.325

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[94].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(115281130)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281130", "story_v_out_115281.awb") ~= 0 then
					local var_550_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281130", "story_v_out_115281.awb") / 1000

					if var_550_8 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_8 + var_550_0
					end

					if var_550_3.prefab_name ~= "" and arg_547_1.actors_[var_550_3.prefab_name] ~= nil then
						local var_550_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_3.prefab_name].transform, "story_v_out_115281", "115281130", "story_v_out_115281.awb")

						arg_547_1:RecordAudio("115281130", var_550_9)
						arg_547_1:RecordAudio("115281130", var_550_9)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_115281", "115281130", "story_v_out_115281.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_115281", "115281130", "story_v_out_115281.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_10 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_10 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_10

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_10 and arg_547_1.time_ < var_550_0 + var_550_10 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play115281131 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 115281131
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play115281132(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 1.05

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

				local var_554_2 = arg_551_1:GetWordFromCfg(115281131)
				local var_554_3 = arg_551_1:FormatText(var_554_2.content)

				arg_551_1.text_.text = var_554_3

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_4 = 42
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
	Play115281132 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 115281132
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play115281133(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.mask_.enabled = true
				arg_555_1.mask_.raycastTarget = true

				arg_555_1:SetGaussion(false)
			end

			local var_558_1 = 0.8

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_1 then
				local var_558_2 = (arg_555_1.time_ - var_558_0) / var_558_1
				local var_558_3 = Color.New(1, 1, 1)

				var_558_3.a = Mathf.Lerp(1, 0, var_558_2)
				arg_555_1.mask_.color = var_558_3
			end

			if arg_555_1.time_ >= var_558_0 + var_558_1 and arg_555_1.time_ < var_558_0 + var_558_1 + arg_558_0 then
				local var_558_4 = Color.New(1, 1, 1)
				local var_558_5 = 0

				arg_555_1.mask_.enabled = false
				var_558_4.a = var_558_5
				arg_555_1.mask_.color = var_558_4
			end

			local var_558_6 = 0
			local var_558_7 = 1.625

			if var_558_6 < arg_555_1.time_ and arg_555_1.time_ <= var_558_6 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_8 = arg_555_1:GetWordFromCfg(115281132)
				local var_558_9 = arg_555_1:FormatText(var_558_8.content)

				arg_555_1.text_.text = var_558_9

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_10 = 65
				local var_558_11 = utf8.len(var_558_9)
				local var_558_12 = var_558_10 <= 0 and var_558_7 or var_558_7 * (var_558_11 / var_558_10)

				if var_558_12 > 0 and var_558_7 < var_558_12 then
					arg_555_1.talkMaxDuration = var_558_12

					if var_558_12 + var_558_6 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_12 + var_558_6
					end
				end

				arg_555_1.text_.text = var_558_9
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_13 = math.max(var_558_7, arg_555_1.talkMaxDuration)

			if var_558_6 <= arg_555_1.time_ and arg_555_1.time_ < var_558_6 + var_558_13 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_6) / var_558_13

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_6 + var_558_13 and arg_555_1.time_ < var_558_6 + var_558_13 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play115281133 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 115281133
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play115281134(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 1.05

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_2 = arg_559_1:GetWordFromCfg(115281133)
				local var_562_3 = arg_559_1:FormatText(var_562_2.content)

				arg_559_1.text_.text = var_562_3

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_4 = 42
				local var_562_5 = utf8.len(var_562_3)
				local var_562_6 = var_562_4 <= 0 and var_562_1 or var_562_1 * (var_562_5 / var_562_4)

				if var_562_6 > 0 and var_562_1 < var_562_6 then
					arg_559_1.talkMaxDuration = var_562_6

					if var_562_6 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_6 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_3
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_7 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_7 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_7

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_7 and arg_559_1.time_ < var_562_0 + var_562_7 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play115281134 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 115281134
		arg_563_1.duration_ = 9.033

		local var_563_0 = {
			ja = 7.3,
			ko = 6.1,
			zh = 9.033,
			en = 8.866
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play115281135(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.65

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[94].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(115281134)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281134", "story_v_out_115281.awb") ~= 0 then
					local var_566_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281134", "story_v_out_115281.awb") / 1000

					if var_566_8 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_8 + var_566_0
					end

					if var_566_3.prefab_name ~= "" and arg_563_1.actors_[var_566_3.prefab_name] ~= nil then
						local var_566_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_3.prefab_name].transform, "story_v_out_115281", "115281134", "story_v_out_115281.awb")

						arg_563_1:RecordAudio("115281134", var_566_9)
						arg_563_1:RecordAudio("115281134", var_566_9)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_out_115281", "115281134", "story_v_out_115281.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_out_115281", "115281134", "story_v_out_115281.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_10 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_10 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_10

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_10 and arg_563_1.time_ < var_566_0 + var_566_10 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play115281135 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 115281135
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play115281136(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 1.15

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

				local var_570_2 = arg_567_1:GetWordFromCfg(115281135)
				local var_570_3 = arg_567_1:FormatText(var_570_2.content)

				arg_567_1.text_.text = var_570_3

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_4 = 46
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
	Play115281136 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 115281136
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play115281137(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = 0
			local var_574_1 = 0.95

			if var_574_0 < arg_571_1.time_ and arg_571_1.time_ <= var_574_0 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_2 = arg_571_1:GetWordFromCfg(115281136)
				local var_574_3 = arg_571_1:FormatText(var_574_2.content)

				arg_571_1.text_.text = var_574_3

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_4 = 38
				local var_574_5 = utf8.len(var_574_3)
				local var_574_6 = var_574_4 <= 0 and var_574_1 or var_574_1 * (var_574_5 / var_574_4)

				if var_574_6 > 0 and var_574_1 < var_574_6 then
					arg_571_1.talkMaxDuration = var_574_6

					if var_574_6 + var_574_0 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_6 + var_574_0
					end
				end

				arg_571_1.text_.text = var_574_3
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_7 = math.max(var_574_1, arg_571_1.talkMaxDuration)

			if var_574_0 <= arg_571_1.time_ and arg_571_1.time_ < var_574_0 + var_574_7 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_0) / var_574_7

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_0 + var_574_7 and arg_571_1.time_ < var_574_0 + var_574_7 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play115281137 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 115281137
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play115281138(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = 0
			local var_578_1 = 0.75

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

				local var_578_2 = arg_575_1:GetWordFromCfg(115281137)
				local var_578_3 = arg_575_1:FormatText(var_578_2.content)

				arg_575_1.text_.text = var_578_3

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_4 = 30
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
	Play115281138 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 115281138
		arg_579_1.duration_ = 7.7

		local var_579_0 = {
			ja = 3.666,
			ko = 5.466,
			zh = 7.2,
			en = 7.7
		}
		local var_579_1 = manager.audio:GetLocalizationFlag()

		if var_579_0[var_579_1] ~= nil then
			arg_579_1.duration_ = var_579_0[var_579_1]
		end

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play115281139(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = 0
			local var_582_1 = 0.725

			if var_582_0 < arg_579_1.time_ and arg_579_1.time_ <= var_582_0 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_2 = arg_579_1:FormatText(StoryNameCfg[94].name)

				arg_579_1.leftNameTxt_.text = var_582_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_3 = arg_579_1:GetWordFromCfg(115281138)
				local var_582_4 = arg_579_1:FormatText(var_582_3.content)

				arg_579_1.text_.text = var_582_4

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_5 = 29
				local var_582_6 = utf8.len(var_582_4)
				local var_582_7 = var_582_5 <= 0 and var_582_1 or var_582_1 * (var_582_6 / var_582_5)

				if var_582_7 > 0 and var_582_1 < var_582_7 then
					arg_579_1.talkMaxDuration = var_582_7

					if var_582_7 + var_582_0 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_7 + var_582_0
					end
				end

				arg_579_1.text_.text = var_582_4
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281138", "story_v_out_115281.awb") ~= 0 then
					local var_582_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281138", "story_v_out_115281.awb") / 1000

					if var_582_8 + var_582_0 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_8 + var_582_0
					end

					if var_582_3.prefab_name ~= "" and arg_579_1.actors_[var_582_3.prefab_name] ~= nil then
						local var_582_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_3.prefab_name].transform, "story_v_out_115281", "115281138", "story_v_out_115281.awb")

						arg_579_1:RecordAudio("115281138", var_582_9)
						arg_579_1:RecordAudio("115281138", var_582_9)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_out_115281", "115281138", "story_v_out_115281.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_out_115281", "115281138", "story_v_out_115281.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_10 = math.max(var_582_1, arg_579_1.talkMaxDuration)

			if var_582_0 <= arg_579_1.time_ and arg_579_1.time_ < var_582_0 + var_582_10 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_0) / var_582_10

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_0 + var_582_10 and arg_579_1.time_ < var_582_0 + var_582_10 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play115281139 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 115281139
		arg_583_1.duration_ = 5

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play115281140(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = 0
			local var_586_1 = 1.525

			if var_586_0 < arg_583_1.time_ and arg_583_1.time_ <= var_586_0 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, false)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_2 = arg_583_1:GetWordFromCfg(115281139)
				local var_586_3 = arg_583_1:FormatText(var_586_2.content)

				arg_583_1.text_.text = var_586_3

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_4 = 61
				local var_586_5 = utf8.len(var_586_3)
				local var_586_6 = var_586_4 <= 0 and var_586_1 or var_586_1 * (var_586_5 / var_586_4)

				if var_586_6 > 0 and var_586_1 < var_586_6 then
					arg_583_1.talkMaxDuration = var_586_6

					if var_586_6 + var_586_0 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_6 + var_586_0
					end
				end

				arg_583_1.text_.text = var_586_3
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)
				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_7 = math.max(var_586_1, arg_583_1.talkMaxDuration)

			if var_586_0 <= arg_583_1.time_ and arg_583_1.time_ < var_586_0 + var_586_7 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_0) / var_586_7

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_0 + var_586_7 and arg_583_1.time_ < var_586_0 + var_586_7 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play115281140 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 115281140
		arg_587_1.duration_ = 5

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play115281141(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 0
			local var_590_1 = 1.375

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, false)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_2 = arg_587_1:GetWordFromCfg(115281140)
				local var_590_3 = arg_587_1:FormatText(var_590_2.content)

				arg_587_1.text_.text = var_590_3

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_4 = 55
				local var_590_5 = utf8.len(var_590_3)
				local var_590_6 = var_590_4 <= 0 and var_590_1 or var_590_1 * (var_590_5 / var_590_4)

				if var_590_6 > 0 and var_590_1 < var_590_6 then
					arg_587_1.talkMaxDuration = var_590_6

					if var_590_6 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_6 + var_590_0
					end
				end

				arg_587_1.text_.text = var_590_3
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_7 = math.max(var_590_1, arg_587_1.talkMaxDuration)

			if var_590_0 <= arg_587_1.time_ and arg_587_1.time_ < var_590_0 + var_590_7 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_0) / var_590_7

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_0 + var_590_7 and arg_587_1.time_ < var_590_0 + var_590_7 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play115281141 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 115281141
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play115281142(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 0.55

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, false)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_2 = arg_591_1:GetWordFromCfg(115281141)
				local var_594_3 = arg_591_1:FormatText(var_594_2.content)

				arg_591_1.text_.text = var_594_3

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_4 = 22
				local var_594_5 = utf8.len(var_594_3)
				local var_594_6 = var_594_4 <= 0 and var_594_1 or var_594_1 * (var_594_5 / var_594_4)

				if var_594_6 > 0 and var_594_1 < var_594_6 then
					arg_591_1.talkMaxDuration = var_594_6

					if var_594_6 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_6 + var_594_0
					end
				end

				arg_591_1.text_.text = var_594_3
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_7 = math.max(var_594_1, arg_591_1.talkMaxDuration)

			if var_594_0 <= arg_591_1.time_ and arg_591_1.time_ < var_594_0 + var_594_7 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_0) / var_594_7

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_0 + var_594_7 and arg_591_1.time_ < var_594_0 + var_594_7 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play115281142 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 115281142
		arg_595_1.duration_ = 12.5

		local var_595_0 = {
			ja = 12.5,
			ko = 8.5,
			zh = 10.6,
			en = 9.466
		}
		local var_595_1 = manager.audio:GetLocalizationFlag()

		if var_595_0[var_595_1] ~= nil then
			arg_595_1.duration_ = var_595_0[var_595_1]
		end

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play115281143(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = 0
			local var_598_1 = 0.925

			if var_598_0 < arg_595_1.time_ and arg_595_1.time_ <= var_598_0 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_2 = arg_595_1:FormatText(StoryNameCfg[94].name)

				arg_595_1.leftNameTxt_.text = var_598_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_3 = arg_595_1:GetWordFromCfg(115281142)
				local var_598_4 = arg_595_1:FormatText(var_598_3.content)

				arg_595_1.text_.text = var_598_4

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_5 = 37
				local var_598_6 = utf8.len(var_598_4)
				local var_598_7 = var_598_5 <= 0 and var_598_1 or var_598_1 * (var_598_6 / var_598_5)

				if var_598_7 > 0 and var_598_1 < var_598_7 then
					arg_595_1.talkMaxDuration = var_598_7

					if var_598_7 + var_598_0 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_7 + var_598_0
					end
				end

				arg_595_1.text_.text = var_598_4
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281142", "story_v_out_115281.awb") ~= 0 then
					local var_598_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281142", "story_v_out_115281.awb") / 1000

					if var_598_8 + var_598_0 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_8 + var_598_0
					end

					if var_598_3.prefab_name ~= "" and arg_595_1.actors_[var_598_3.prefab_name] ~= nil then
						local var_598_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_3.prefab_name].transform, "story_v_out_115281", "115281142", "story_v_out_115281.awb")

						arg_595_1:RecordAudio("115281142", var_598_9)
						arg_595_1:RecordAudio("115281142", var_598_9)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_115281", "115281142", "story_v_out_115281.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_115281", "115281142", "story_v_out_115281.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_10 = math.max(var_598_1, arg_595_1.talkMaxDuration)

			if var_598_0 <= arg_595_1.time_ and arg_595_1.time_ < var_598_0 + var_598_10 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_0) / var_598_10

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_0 + var_598_10 and arg_595_1.time_ < var_598_0 + var_598_10 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play115281143 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 115281143
		arg_599_1.duration_ = 14.3

		local var_599_0 = {
			ja = 14.3,
			ko = 7.766,
			zh = 8.7,
			en = 9.866
		}
		local var_599_1 = manager.audio:GetLocalizationFlag()

		if var_599_0[var_599_1] ~= nil then
			arg_599_1.duration_ = var_599_0[var_599_1]
		end

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play115281144(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 0.95

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_2 = arg_599_1:FormatText(StoryNameCfg[94].name)

				arg_599_1.leftNameTxt_.text = var_602_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_3 = arg_599_1:GetWordFromCfg(115281143)
				local var_602_4 = arg_599_1:FormatText(var_602_3.content)

				arg_599_1.text_.text = var_602_4

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_5 = 38
				local var_602_6 = utf8.len(var_602_4)
				local var_602_7 = var_602_5 <= 0 and var_602_1 or var_602_1 * (var_602_6 / var_602_5)

				if var_602_7 > 0 and var_602_1 < var_602_7 then
					arg_599_1.talkMaxDuration = var_602_7

					if var_602_7 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_7 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_4
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281143", "story_v_out_115281.awb") ~= 0 then
					local var_602_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281143", "story_v_out_115281.awb") / 1000

					if var_602_8 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_8 + var_602_0
					end

					if var_602_3.prefab_name ~= "" and arg_599_1.actors_[var_602_3.prefab_name] ~= nil then
						local var_602_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_3.prefab_name].transform, "story_v_out_115281", "115281143", "story_v_out_115281.awb")

						arg_599_1:RecordAudio("115281143", var_602_9)
						arg_599_1:RecordAudio("115281143", var_602_9)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_115281", "115281143", "story_v_out_115281.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_115281", "115281143", "story_v_out_115281.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_10 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_10 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_10

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_10 and arg_599_1.time_ < var_602_0 + var_602_10 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play115281144 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 115281144
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play115281145(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.75

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_2 = arg_603_1:GetWordFromCfg(115281144)
				local var_606_3 = arg_603_1:FormatText(var_606_2.content)

				arg_603_1.text_.text = var_606_3

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_4 = 30
				local var_606_5 = utf8.len(var_606_3)
				local var_606_6 = var_606_4 <= 0 and var_606_1 or var_606_1 * (var_606_5 / var_606_4)

				if var_606_6 > 0 and var_606_1 < var_606_6 then
					arg_603_1.talkMaxDuration = var_606_6

					if var_606_6 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_6 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_3
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_7 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_7 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_7

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_7 and arg_603_1.time_ < var_606_0 + var_606_7 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play115281145 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 115281145
		arg_607_1.duration_ = 8.1

		local var_607_0 = {
			ja = 8.1,
			ko = 6.033,
			zh = 6.266,
			en = 5.1
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play115281146(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.625

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_2 = arg_607_1:FormatText(StoryNameCfg[94].name)

				arg_607_1.leftNameTxt_.text = var_610_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_3 = arg_607_1:GetWordFromCfg(115281145)
				local var_610_4 = arg_607_1:FormatText(var_610_3.content)

				arg_607_1.text_.text = var_610_4

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_5 = 25
				local var_610_6 = utf8.len(var_610_4)
				local var_610_7 = var_610_5 <= 0 and var_610_1 or var_610_1 * (var_610_6 / var_610_5)

				if var_610_7 > 0 and var_610_1 < var_610_7 then
					arg_607_1.talkMaxDuration = var_610_7

					if var_610_7 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_7 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_4
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281145", "story_v_out_115281.awb") ~= 0 then
					local var_610_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281145", "story_v_out_115281.awb") / 1000

					if var_610_8 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_8 + var_610_0
					end

					if var_610_3.prefab_name ~= "" and arg_607_1.actors_[var_610_3.prefab_name] ~= nil then
						local var_610_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_3.prefab_name].transform, "story_v_out_115281", "115281145", "story_v_out_115281.awb")

						arg_607_1:RecordAudio("115281145", var_610_9)
						arg_607_1:RecordAudio("115281145", var_610_9)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_115281", "115281145", "story_v_out_115281.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_115281", "115281145", "story_v_out_115281.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_10 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_10 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_10

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_10 and arg_607_1.time_ < var_610_0 + var_610_10 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play115281146 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 115281146
		arg_611_1.duration_ = 13.833

		local var_611_0 = {
			ja = 13.833,
			ko = 5.333,
			zh = 7.6,
			en = 5.8
		}
		local var_611_1 = manager.audio:GetLocalizationFlag()

		if var_611_0[var_611_1] ~= nil then
			arg_611_1.duration_ = var_611_0[var_611_1]
		end

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play115281147(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.6

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_2 = arg_611_1:FormatText(StoryNameCfg[94].name)

				arg_611_1.leftNameTxt_.text = var_614_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_3 = arg_611_1:GetWordFromCfg(115281146)
				local var_614_4 = arg_611_1:FormatText(var_614_3.content)

				arg_611_1.text_.text = var_614_4

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_5 = 24
				local var_614_6 = utf8.len(var_614_4)
				local var_614_7 = var_614_5 <= 0 and var_614_1 or var_614_1 * (var_614_6 / var_614_5)

				if var_614_7 > 0 and var_614_1 < var_614_7 then
					arg_611_1.talkMaxDuration = var_614_7

					if var_614_7 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_7 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_4
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281146", "story_v_out_115281.awb") ~= 0 then
					local var_614_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281146", "story_v_out_115281.awb") / 1000

					if var_614_8 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_8 + var_614_0
					end

					if var_614_3.prefab_name ~= "" and arg_611_1.actors_[var_614_3.prefab_name] ~= nil then
						local var_614_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_3.prefab_name].transform, "story_v_out_115281", "115281146", "story_v_out_115281.awb")

						arg_611_1:RecordAudio("115281146", var_614_9)
						arg_611_1:RecordAudio("115281146", var_614_9)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_115281", "115281146", "story_v_out_115281.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_115281", "115281146", "story_v_out_115281.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_10 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_10 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_10

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_10 and arg_611_1.time_ < var_614_0 + var_614_10 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play115281147 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 115281147
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play115281148(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				local var_618_1 = manager.ui.mainCamera.transform.localPosition
				local var_618_2 = Vector3.New(0, 0, 10) + Vector3.New(var_618_1.x, var_618_1.y, 0)
				local var_618_3 = arg_615_1.bgs_.RO0501

				var_618_3.transform.localPosition = var_618_2
				var_618_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_618_4 = var_618_3:GetComponent("SpriteRenderer")

				if var_618_4 and var_618_4.sprite then
					local var_618_5 = (var_618_3.transform.localPosition - var_618_1).z
					local var_618_6 = manager.ui.mainCameraCom_
					local var_618_7 = 2 * var_618_5 * Mathf.Tan(var_618_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_618_8 = var_618_7 * var_618_6.aspect
					local var_618_9 = var_618_4.sprite.bounds.size.x
					local var_618_10 = var_618_4.sprite.bounds.size.y
					local var_618_11 = var_618_8 / var_618_9
					local var_618_12 = var_618_7 / var_618_10
					local var_618_13 = var_618_12 < var_618_11 and var_618_11 or var_618_12

					var_618_3.transform.localScale = Vector3.New(var_618_13, var_618_13, 0)
				end

				for iter_618_0, iter_618_1 in pairs(arg_615_1.bgs_) do
					if iter_618_0 ~= "RO0501" then
						iter_618_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_618_14 = 0

			if var_618_14 < arg_615_1.time_ and arg_615_1.time_ <= var_618_14 + arg_618_0 then
				arg_615_1.mask_.enabled = true
				arg_615_1.mask_.raycastTarget = true

				arg_615_1:SetGaussion(false)
			end

			local var_618_15 = 0.5

			if var_618_14 <= arg_615_1.time_ and arg_615_1.time_ < var_618_14 + var_618_15 then
				local var_618_16 = (arg_615_1.time_ - var_618_14) / var_618_15
				local var_618_17 = Color.New(1, 1, 1)

				var_618_17.a = Mathf.Lerp(1, 0, var_618_16)
				arg_615_1.mask_.color = var_618_17
			end

			if arg_615_1.time_ >= var_618_14 + var_618_15 and arg_615_1.time_ < var_618_14 + var_618_15 + arg_618_0 then
				local var_618_18 = Color.New(1, 1, 1)
				local var_618_19 = 0

				arg_615_1.mask_.enabled = false
				var_618_18.a = var_618_19
				arg_615_1.mask_.color = var_618_18
			end

			local var_618_20 = 0
			local var_618_21 = 0.975

			if var_618_20 < arg_615_1.time_ and arg_615_1.time_ <= var_618_20 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_22 = arg_615_1:GetWordFromCfg(115281147)
				local var_618_23 = arg_615_1:FormatText(var_618_22.content)

				arg_615_1.text_.text = var_618_23

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_24 = 39
				local var_618_25 = utf8.len(var_618_23)
				local var_618_26 = var_618_24 <= 0 and var_618_21 or var_618_21 * (var_618_25 / var_618_24)

				if var_618_26 > 0 and var_618_21 < var_618_26 then
					arg_615_1.talkMaxDuration = var_618_26

					if var_618_26 + var_618_20 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_26 + var_618_20
					end
				end

				arg_615_1.text_.text = var_618_23
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_27 = math.max(var_618_21, arg_615_1.talkMaxDuration)

			if var_618_20 <= arg_615_1.time_ and arg_615_1.time_ < var_618_20 + var_618_27 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_20) / var_618_27

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_20 + var_618_27 and arg_615_1.time_ < var_618_20 + var_618_27 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play115281148 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 115281148
		arg_619_1.duration_ = 3.766

		local var_619_0 = {
			ja = 2.766,
			ko = 2.1,
			zh = 3.766,
			en = 2.233
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play115281149(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.2

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[94].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(115281148)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 8
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281148", "story_v_out_115281.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281148", "story_v_out_115281.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_out_115281", "115281148", "story_v_out_115281.awb")

						arg_619_1:RecordAudio("115281148", var_622_9)
						arg_619_1:RecordAudio("115281148", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_115281", "115281148", "story_v_out_115281.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_115281", "115281148", "story_v_out_115281.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_10 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_10 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_10

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_10 and arg_619_1.time_ < var_622_0 + var_622_10 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play115281149 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 115281149
		arg_623_1.duration_ = 6

		local var_623_0 = {
			ja = 5.766,
			ko = 5.266,
			zh = 6,
			en = 5.333
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play115281150(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 0.575

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_2 = arg_623_1:FormatText(StoryNameCfg[94].name)

				arg_623_1.leftNameTxt_.text = var_626_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_3 = arg_623_1:GetWordFromCfg(115281149)
				local var_626_4 = arg_623_1:FormatText(var_626_3.content)

				arg_623_1.text_.text = var_626_4

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_5 = 23
				local var_626_6 = utf8.len(var_626_4)
				local var_626_7 = var_626_5 <= 0 and var_626_1 or var_626_1 * (var_626_6 / var_626_5)

				if var_626_7 > 0 and var_626_1 < var_626_7 then
					arg_623_1.talkMaxDuration = var_626_7

					if var_626_7 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_7 + var_626_0
					end
				end

				arg_623_1.text_.text = var_626_4
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281149", "story_v_out_115281.awb") ~= 0 then
					local var_626_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281149", "story_v_out_115281.awb") / 1000

					if var_626_8 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_8 + var_626_0
					end

					if var_626_3.prefab_name ~= "" and arg_623_1.actors_[var_626_3.prefab_name] ~= nil then
						local var_626_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_3.prefab_name].transform, "story_v_out_115281", "115281149", "story_v_out_115281.awb")

						arg_623_1:RecordAudio("115281149", var_626_9)
						arg_623_1:RecordAudio("115281149", var_626_9)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_115281", "115281149", "story_v_out_115281.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_115281", "115281149", "story_v_out_115281.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_10 = math.max(var_626_1, arg_623_1.talkMaxDuration)

			if var_626_0 <= arg_623_1.time_ and arg_623_1.time_ < var_626_0 + var_626_10 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_0) / var_626_10

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_0 + var_626_10 and arg_623_1.time_ < var_626_0 + var_626_10 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play115281150 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 115281150
		arg_627_1.duration_ = 5

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play115281151(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0
			local var_630_1 = 0.85

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, false)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_2 = arg_627_1:GetWordFromCfg(115281150)
				local var_630_3 = arg_627_1:FormatText(var_630_2.content)

				arg_627_1.text_.text = var_630_3

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_4 = 34
				local var_630_5 = utf8.len(var_630_3)
				local var_630_6 = var_630_4 <= 0 and var_630_1 or var_630_1 * (var_630_5 / var_630_4)

				if var_630_6 > 0 and var_630_1 < var_630_6 then
					arg_627_1.talkMaxDuration = var_630_6

					if var_630_6 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_6 + var_630_0
					end
				end

				arg_627_1.text_.text = var_630_3
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)
				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_7 = math.max(var_630_1, arg_627_1.talkMaxDuration)

			if var_630_0 <= arg_627_1.time_ and arg_627_1.time_ < var_630_0 + var_630_7 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_0) / var_630_7

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_0 + var_630_7 and arg_627_1.time_ < var_630_0 + var_630_7 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play115281151 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 115281151
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play115281152(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = 0
			local var_634_1 = 1.125

			if var_634_0 < arg_631_1.time_ and arg_631_1.time_ <= var_634_0 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, false)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_2 = arg_631_1:GetWordFromCfg(115281151)
				local var_634_3 = arg_631_1:FormatText(var_634_2.content)

				arg_631_1.text_.text = var_634_3

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_4 = 45
				local var_634_5 = utf8.len(var_634_3)
				local var_634_6 = var_634_4 <= 0 and var_634_1 or var_634_1 * (var_634_5 / var_634_4)

				if var_634_6 > 0 and var_634_1 < var_634_6 then
					arg_631_1.talkMaxDuration = var_634_6

					if var_634_6 + var_634_0 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_6 + var_634_0
					end
				end

				arg_631_1.text_.text = var_634_3
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_7 = math.max(var_634_1, arg_631_1.talkMaxDuration)

			if var_634_0 <= arg_631_1.time_ and arg_631_1.time_ < var_634_0 + var_634_7 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_0) / var_634_7

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_0 + var_634_7 and arg_631_1.time_ < var_634_0 + var_634_7 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play115281152 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 115281152
		arg_635_1.duration_ = 12.566

		local var_635_0 = {
			ja = 12.566,
			ko = 9.4,
			zh = 9.333,
			en = 9.166
		}
		local var_635_1 = manager.audio:GetLocalizationFlag()

		if var_635_0[var_635_1] ~= nil then
			arg_635_1.duration_ = var_635_0[var_635_1]
		end

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play115281153(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = 2

			if var_638_0 < arg_635_1.time_ and arg_635_1.time_ <= var_638_0 + arg_638_0 then
				local var_638_1 = manager.ui.mainCamera.transform.localPosition
				local var_638_2 = Vector3.New(0, 0, 10) + Vector3.New(var_638_1.x, var_638_1.y, 0)
				local var_638_3 = arg_635_1.bgs_.STblack

				var_638_3.transform.localPosition = var_638_2
				var_638_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_638_4 = var_638_3:GetComponent("SpriteRenderer")

				if var_638_4 and var_638_4.sprite then
					local var_638_5 = (var_638_3.transform.localPosition - var_638_1).z
					local var_638_6 = manager.ui.mainCameraCom_
					local var_638_7 = 2 * var_638_5 * Mathf.Tan(var_638_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_638_8 = var_638_7 * var_638_6.aspect
					local var_638_9 = var_638_4.sprite.bounds.size.x
					local var_638_10 = var_638_4.sprite.bounds.size.y
					local var_638_11 = var_638_8 / var_638_9
					local var_638_12 = var_638_7 / var_638_10
					local var_638_13 = var_638_12 < var_638_11 and var_638_11 or var_638_12

					var_638_3.transform.localScale = Vector3.New(var_638_13, var_638_13, 0)
				end

				for iter_638_0, iter_638_1 in pairs(arg_635_1.bgs_) do
					if iter_638_0 ~= "STblack" then
						iter_638_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_638_14 = 0

			if var_638_14 < arg_635_1.time_ and arg_635_1.time_ <= var_638_14 + arg_638_0 then
				arg_635_1.mask_.enabled = true
				arg_635_1.mask_.raycastTarget = false

				arg_635_1:SetGaussion(false)
			end

			local var_638_15 = 2

			if var_638_14 <= arg_635_1.time_ and arg_635_1.time_ < var_638_14 + var_638_15 then
				local var_638_16 = (arg_635_1.time_ - var_638_14) / var_638_15
				local var_638_17 = Color.New(0, 0, 0)

				var_638_17.a = Mathf.Lerp(0, 1, var_638_16)
				arg_635_1.mask_.color = var_638_17
			end

			if arg_635_1.time_ >= var_638_14 + var_638_15 and arg_635_1.time_ < var_638_14 + var_638_15 + arg_638_0 then
				local var_638_18 = Color.New(0, 0, 0)

				var_638_18.a = 1
				arg_635_1.mask_.color = var_638_18
			end

			local var_638_19 = 2

			if var_638_19 < arg_635_1.time_ and arg_635_1.time_ <= var_638_19 + arg_638_0 then
				arg_635_1.mask_.enabled = true
				arg_635_1.mask_.raycastTarget = false

				arg_635_1:SetGaussion(false)
			end

			local var_638_20 = 2

			if var_638_19 <= arg_635_1.time_ and arg_635_1.time_ < var_638_19 + var_638_20 then
				local var_638_21 = (arg_635_1.time_ - var_638_19) / var_638_20
				local var_638_22 = Color.New(0, 0, 0)

				var_638_22.a = Mathf.Lerp(1, 0, var_638_21)
				arg_635_1.mask_.color = var_638_22
			end

			if arg_635_1.time_ >= var_638_19 + var_638_20 and arg_635_1.time_ < var_638_19 + var_638_20 + arg_638_0 then
				local var_638_23 = Color.New(0, 0, 0)
				local var_638_24 = 0

				arg_635_1.mask_.enabled = false
				var_638_23.a = var_638_24
				arg_635_1.mask_.color = var_638_23
			end

			if arg_635_1.frameCnt_ <= 1 then
				arg_635_1.dialog_:SetActive(false)
			end

			local var_638_25 = 4
			local var_638_26 = 0.525

			if var_638_25 < arg_635_1.time_ and arg_635_1.time_ <= var_638_25 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0

				arg_635_1.dialog_:SetActive(true)

				local var_638_27 = LeanTween.value(arg_635_1.dialog_, 0, 1, 0.3)

				var_638_27:setOnUpdate(LuaHelper.FloatAction(function(arg_639_0)
					arg_635_1.dialogCg_.alpha = arg_639_0
				end))
				var_638_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_635_1.dialog_)
					var_638_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_635_1.duration_ = arg_635_1.duration_ + 0.3

				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_28 = arg_635_1:FormatText(StoryNameCfg[94].name)

				arg_635_1.leftNameTxt_.text = var_638_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, true)
				arg_635_1.iconController_:SetSelectedState("hero")

				arg_635_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1138_split_6")

				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_29 = arg_635_1:GetWordFromCfg(115281152)
				local var_638_30 = arg_635_1:FormatText(var_638_29.content)

				arg_635_1.text_.text = var_638_30

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_31 = 21
				local var_638_32 = utf8.len(var_638_30)
				local var_638_33 = var_638_31 <= 0 and var_638_26 or var_638_26 * (var_638_32 / var_638_31)

				if var_638_33 > 0 and var_638_26 < var_638_33 then
					arg_635_1.talkMaxDuration = var_638_33
					var_638_25 = var_638_25 + 0.3

					if var_638_33 + var_638_25 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_33 + var_638_25
					end
				end

				arg_635_1.text_.text = var_638_30
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281152", "story_v_out_115281.awb") ~= 0 then
					local var_638_34 = manager.audio:GetVoiceLength("story_v_out_115281", "115281152", "story_v_out_115281.awb") / 1000

					if var_638_34 + var_638_25 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_34 + var_638_25
					end

					if var_638_29.prefab_name ~= "" and arg_635_1.actors_[var_638_29.prefab_name] ~= nil then
						local var_638_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_29.prefab_name].transform, "story_v_out_115281", "115281152", "story_v_out_115281.awb")

						arg_635_1:RecordAudio("115281152", var_638_35)
						arg_635_1:RecordAudio("115281152", var_638_35)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_115281", "115281152", "story_v_out_115281.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_115281", "115281152", "story_v_out_115281.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_36 = var_638_25 + 0.3
			local var_638_37 = math.max(var_638_26, arg_635_1.talkMaxDuration)

			if var_638_36 <= arg_635_1.time_ and arg_635_1.time_ < var_638_36 + var_638_37 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_36) / var_638_37

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_36 + var_638_37 and arg_635_1.time_ < var_638_36 + var_638_37 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play115281153 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 115281153
		arg_641_1.duration_ = 5

		SetActive(arg_641_1.tipsGo_, false)

		function arg_641_1.onSingleLineFinish_()
			arg_641_1.onSingleLineUpdate_ = nil
			arg_641_1.onSingleLineFinish_ = nil
			arg_641_1.state_ = "waiting"
		end

		function arg_641_1.playNext_(arg_643_0)
			if arg_643_0 == 1 then
				arg_641_0:Play115281154(arg_641_1)
			end
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = 0
			local var_644_1 = 0.975

			if var_644_0 < arg_641_1.time_ and arg_641_1.time_ <= var_644_0 + arg_644_0 then
				arg_641_1.talkMaxDuration = 0
				arg_641_1.dialogCg_.alpha = 1

				arg_641_1.dialog_:SetActive(true)
				SetActive(arg_641_1.leftNameGo_, false)

				arg_641_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_641_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_641_1:RecordName(arg_641_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_641_1.iconTrs_.gameObject, false)
				arg_641_1.callingController_:SetSelectedState("normal")

				local var_644_2 = arg_641_1:GetWordFromCfg(115281153)
				local var_644_3 = arg_641_1:FormatText(var_644_2.content)

				arg_641_1.text_.text = var_644_3

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_4 = 39
				local var_644_5 = utf8.len(var_644_3)
				local var_644_6 = var_644_4 <= 0 and var_644_1 or var_644_1 * (var_644_5 / var_644_4)

				if var_644_6 > 0 and var_644_1 < var_644_6 then
					arg_641_1.talkMaxDuration = var_644_6

					if var_644_6 + var_644_0 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_6 + var_644_0
					end
				end

				arg_641_1.text_.text = var_644_3
				arg_641_1.typewritter.percent = 0

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(false)
				arg_641_1:RecordContent(arg_641_1.text_.text)
			end

			local var_644_7 = math.max(var_644_1, arg_641_1.talkMaxDuration)

			if var_644_0 <= arg_641_1.time_ and arg_641_1.time_ < var_644_0 + var_644_7 then
				arg_641_1.typewritter.percent = (arg_641_1.time_ - var_644_0) / var_644_7

				arg_641_1.typewritter:SetDirty()
			end

			if arg_641_1.time_ >= var_644_0 + var_644_7 and arg_641_1.time_ < var_644_0 + var_644_7 + arg_644_0 then
				arg_641_1.typewritter.percent = 1

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(true)
			end
		end
	end,
	Play115281154 = function(arg_645_0, arg_645_1)
		arg_645_1.time_ = 0
		arg_645_1.frameCnt_ = 0
		arg_645_1.state_ = "playing"
		arg_645_1.curTalkId_ = 115281154
		arg_645_1.duration_ = 5

		SetActive(arg_645_1.tipsGo_, false)

		function arg_645_1.onSingleLineFinish_()
			arg_645_1.onSingleLineUpdate_ = nil
			arg_645_1.onSingleLineFinish_ = nil
			arg_645_1.state_ = "waiting"
		end

		function arg_645_1.playNext_(arg_647_0)
			if arg_647_0 == 1 then
				arg_645_0:Play115281155(arg_645_1)
			end
		end

		function arg_645_1.onSingleLineUpdate_(arg_648_0)
			local var_648_0 = 0
			local var_648_1 = 0.95

			if var_648_0 < arg_645_1.time_ and arg_645_1.time_ <= var_648_0 + arg_648_0 then
				arg_645_1.talkMaxDuration = 0
				arg_645_1.dialogCg_.alpha = 1

				arg_645_1.dialog_:SetActive(true)
				SetActive(arg_645_1.leftNameGo_, false)

				arg_645_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_645_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_645_1:RecordName(arg_645_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_645_1.iconTrs_.gameObject, false)
				arg_645_1.callingController_:SetSelectedState("normal")

				local var_648_2 = arg_645_1:GetWordFromCfg(115281154)
				local var_648_3 = arg_645_1:FormatText(var_648_2.content)

				arg_645_1.text_.text = var_648_3

				LuaForUtil.ClearLinePrefixSymbol(arg_645_1.text_)

				local var_648_4 = 38
				local var_648_5 = utf8.len(var_648_3)
				local var_648_6 = var_648_4 <= 0 and var_648_1 or var_648_1 * (var_648_5 / var_648_4)

				if var_648_6 > 0 and var_648_1 < var_648_6 then
					arg_645_1.talkMaxDuration = var_648_6

					if var_648_6 + var_648_0 > arg_645_1.duration_ then
						arg_645_1.duration_ = var_648_6 + var_648_0
					end
				end

				arg_645_1.text_.text = var_648_3
				arg_645_1.typewritter.percent = 0

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(false)
				arg_645_1:RecordContent(arg_645_1.text_.text)
			end

			local var_648_7 = math.max(var_648_1, arg_645_1.talkMaxDuration)

			if var_648_0 <= arg_645_1.time_ and arg_645_1.time_ < var_648_0 + var_648_7 then
				arg_645_1.typewritter.percent = (arg_645_1.time_ - var_648_0) / var_648_7

				arg_645_1.typewritter:SetDirty()
			end

			if arg_645_1.time_ >= var_648_0 + var_648_7 and arg_645_1.time_ < var_648_0 + var_648_7 + arg_648_0 then
				arg_645_1.typewritter.percent = 1

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(true)
			end
		end
	end,
	Play115281155 = function(arg_649_0, arg_649_1)
		arg_649_1.time_ = 0
		arg_649_1.frameCnt_ = 0
		arg_649_1.state_ = "playing"
		arg_649_1.curTalkId_ = 115281155
		arg_649_1.duration_ = 8

		SetActive(arg_649_1.tipsGo_, false)

		function arg_649_1.onSingleLineFinish_()
			arg_649_1.onSingleLineUpdate_ = nil
			arg_649_1.onSingleLineFinish_ = nil
			arg_649_1.state_ = "waiting"
		end

		function arg_649_1.playNext_(arg_651_0)
			if arg_651_0 == 1 then
				arg_649_0:Play115281156(arg_649_1)
			end
		end

		function arg_649_1.onSingleLineUpdate_(arg_652_0)
			local var_652_0 = 1

			if var_652_0 < arg_649_1.time_ and arg_649_1.time_ <= var_652_0 + arg_652_0 then
				local var_652_1 = manager.ui.mainCamera.transform.localPosition
				local var_652_2 = Vector3.New(0, 0, 10) + Vector3.New(var_652_1.x, var_652_1.y, 0)
				local var_652_3 = arg_649_1.bgs_.ST28a

				var_652_3.transform.localPosition = var_652_2
				var_652_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_652_4 = var_652_3:GetComponent("SpriteRenderer")

				if var_652_4 and var_652_4.sprite then
					local var_652_5 = (var_652_3.transform.localPosition - var_652_1).z
					local var_652_6 = manager.ui.mainCameraCom_
					local var_652_7 = 2 * var_652_5 * Mathf.Tan(var_652_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_652_8 = var_652_7 * var_652_6.aspect
					local var_652_9 = var_652_4.sprite.bounds.size.x
					local var_652_10 = var_652_4.sprite.bounds.size.y
					local var_652_11 = var_652_8 / var_652_9
					local var_652_12 = var_652_7 / var_652_10
					local var_652_13 = var_652_12 < var_652_11 and var_652_11 or var_652_12

					var_652_3.transform.localScale = Vector3.New(var_652_13, var_652_13, 0)
				end

				for iter_652_0, iter_652_1 in pairs(arg_649_1.bgs_) do
					if iter_652_0 ~= "ST28a" then
						iter_652_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_652_14 = 0

			if var_652_14 < arg_649_1.time_ and arg_649_1.time_ <= var_652_14 + arg_652_0 then
				arg_649_1.mask_.enabled = true
				arg_649_1.mask_.raycastTarget = false

				arg_649_1:SetGaussion(false)
			end

			local var_652_15 = 1

			if var_652_14 <= arg_649_1.time_ and arg_649_1.time_ < var_652_14 + var_652_15 then
				local var_652_16 = (arg_649_1.time_ - var_652_14) / var_652_15
				local var_652_17 = Color.New(0, 0, 0)

				var_652_17.a = Mathf.Lerp(0, 1, var_652_16)
				arg_649_1.mask_.color = var_652_17
			end

			if arg_649_1.time_ >= var_652_14 + var_652_15 and arg_649_1.time_ < var_652_14 + var_652_15 + arg_652_0 then
				local var_652_18 = Color.New(0, 0, 0)

				var_652_18.a = 1
				arg_649_1.mask_.color = var_652_18
			end

			local var_652_19 = 1

			if var_652_19 < arg_649_1.time_ and arg_649_1.time_ <= var_652_19 + arg_652_0 then
				arg_649_1.mask_.enabled = true
				arg_649_1.mask_.raycastTarget = false

				arg_649_1:SetGaussion(false)
			end

			local var_652_20 = 2

			if var_652_19 <= arg_649_1.time_ and arg_649_1.time_ < var_652_19 + var_652_20 then
				local var_652_21 = (arg_649_1.time_ - var_652_19) / var_652_20
				local var_652_22 = Color.New(0, 0, 0)

				var_652_22.a = Mathf.Lerp(1, 0, var_652_21)
				arg_649_1.mask_.color = var_652_22
			end

			if arg_649_1.time_ >= var_652_19 + var_652_20 and arg_649_1.time_ < var_652_19 + var_652_20 + arg_652_0 then
				local var_652_23 = Color.New(0, 0, 0)
				local var_652_24 = 0

				arg_649_1.mask_.enabled = false
				var_652_23.a = var_652_24
				arg_649_1.mask_.color = var_652_23
			end

			if arg_649_1.frameCnt_ <= 1 then
				arg_649_1.dialog_:SetActive(false)
			end

			local var_652_25 = 3
			local var_652_26 = 0.225

			if var_652_25 < arg_649_1.time_ and arg_649_1.time_ <= var_652_25 + arg_652_0 then
				arg_649_1.talkMaxDuration = 0

				arg_649_1.dialog_:SetActive(true)

				local var_652_27 = LeanTween.value(arg_649_1.dialog_, 0, 1, 0.3)

				var_652_27:setOnUpdate(LuaHelper.FloatAction(function(arg_653_0)
					arg_649_1.dialogCg_.alpha = arg_653_0
				end))
				var_652_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_649_1.dialog_)
					var_652_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_649_1.duration_ = arg_649_1.duration_ + 0.3

				SetActive(arg_649_1.leftNameGo_, false)

				arg_649_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_649_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_649_1:RecordName(arg_649_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_649_1.iconTrs_.gameObject, false)
				arg_649_1.callingController_:SetSelectedState("normal")

				local var_652_28 = arg_649_1:GetWordFromCfg(115281155)
				local var_652_29 = arg_649_1:FormatText(var_652_28.content)

				arg_649_1.text_.text = var_652_29

				LuaForUtil.ClearLinePrefixSymbol(arg_649_1.text_)

				local var_652_30 = 9
				local var_652_31 = utf8.len(var_652_29)
				local var_652_32 = var_652_30 <= 0 and var_652_26 or var_652_26 * (var_652_31 / var_652_30)

				if var_652_32 > 0 and var_652_26 < var_652_32 then
					arg_649_1.talkMaxDuration = var_652_32
					var_652_25 = var_652_25 + 0.3

					if var_652_32 + var_652_25 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_32 + var_652_25
					end
				end

				arg_649_1.text_.text = var_652_29
				arg_649_1.typewritter.percent = 0

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(false)
				arg_649_1:RecordContent(arg_649_1.text_.text)
			end

			local var_652_33 = var_652_25 + 0.3
			local var_652_34 = math.max(var_652_26, arg_649_1.talkMaxDuration)

			if var_652_33 <= arg_649_1.time_ and arg_649_1.time_ < var_652_33 + var_652_34 then
				arg_649_1.typewritter.percent = (arg_649_1.time_ - var_652_33) / var_652_34

				arg_649_1.typewritter:SetDirty()
			end

			if arg_649_1.time_ >= var_652_33 + var_652_34 and arg_649_1.time_ < var_652_33 + var_652_34 + arg_652_0 then
				arg_649_1.typewritter.percent = 1

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(true)
			end
		end
	end,
	Play115281156 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 115281156
		arg_655_1.duration_ = 5

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play115281157(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 1.05

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, false)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_2 = arg_655_1:GetWordFromCfg(115281156)
				local var_658_3 = arg_655_1:FormatText(var_658_2.content)

				arg_655_1.text_.text = var_658_3

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_4 = 42
				local var_658_5 = utf8.len(var_658_3)
				local var_658_6 = var_658_4 <= 0 and var_658_1 or var_658_1 * (var_658_5 / var_658_4)

				if var_658_6 > 0 and var_658_1 < var_658_6 then
					arg_655_1.talkMaxDuration = var_658_6

					if var_658_6 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_6 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_3
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)
				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_7 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_7 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_7

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_7 and arg_655_1.time_ < var_658_0 + var_658_7 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play115281157 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 115281157
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play115281158(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0
			local var_662_1 = 1.125

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, false)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_2 = arg_659_1:GetWordFromCfg(115281157)
				local var_662_3 = arg_659_1:FormatText(var_662_2.content)

				arg_659_1.text_.text = var_662_3

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_4 = 45
				local var_662_5 = utf8.len(var_662_3)
				local var_662_6 = var_662_4 <= 0 and var_662_1 or var_662_1 * (var_662_5 / var_662_4)

				if var_662_6 > 0 and var_662_1 < var_662_6 then
					arg_659_1.talkMaxDuration = var_662_6

					if var_662_6 + var_662_0 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_6 + var_662_0
					end
				end

				arg_659_1.text_.text = var_662_3
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_7 = math.max(var_662_1, arg_659_1.talkMaxDuration)

			if var_662_0 <= arg_659_1.time_ and arg_659_1.time_ < var_662_0 + var_662_7 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_0) / var_662_7

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_0 + var_662_7 and arg_659_1.time_ < var_662_0 + var_662_7 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play115281158 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 115281158
		arg_663_1.duration_ = 14.2

		local var_663_0 = {
			ja = 10.466,
			ko = 10.233,
			zh = 9.266,
			en = 14.2
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play115281159(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.975

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_2 = arg_663_1:FormatText(StoryNameCfg[224].name)

				arg_663_1.leftNameTxt_.text = var_666_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, true)
				arg_663_1.iconController_:SetSelectedState("hero")

				arg_663_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerkb")

				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_3 = arg_663_1:GetWordFromCfg(115281158)
				local var_666_4 = arg_663_1:FormatText(var_666_3.content)

				arg_663_1.text_.text = var_666_4

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_5 = 39
				local var_666_6 = utf8.len(var_666_4)
				local var_666_7 = var_666_5 <= 0 and var_666_1 or var_666_1 * (var_666_6 / var_666_5)

				if var_666_7 > 0 and var_666_1 < var_666_7 then
					arg_663_1.talkMaxDuration = var_666_7

					if var_666_7 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_7 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_4
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281158", "story_v_out_115281.awb") ~= 0 then
					local var_666_8 = manager.audio:GetVoiceLength("story_v_out_115281", "115281158", "story_v_out_115281.awb") / 1000

					if var_666_8 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_8 + var_666_0
					end

					if var_666_3.prefab_name ~= "" and arg_663_1.actors_[var_666_3.prefab_name] ~= nil then
						local var_666_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_3.prefab_name].transform, "story_v_out_115281", "115281158", "story_v_out_115281.awb")

						arg_663_1:RecordAudio("115281158", var_666_9)
						arg_663_1:RecordAudio("115281158", var_666_9)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_115281", "115281158", "story_v_out_115281.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_115281", "115281158", "story_v_out_115281.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_10 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_10 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_10

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_10 and arg_663_1.time_ < var_666_0 + var_666_10 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play115281159 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 115281159
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play115281160(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 1.25

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, false)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_2 = arg_667_1:GetWordFromCfg(115281159)
				local var_670_3 = arg_667_1:FormatText(var_670_2.content)

				arg_667_1.text_.text = var_670_3

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_4 = 50
				local var_670_5 = utf8.len(var_670_3)
				local var_670_6 = var_670_4 <= 0 and var_670_1 or var_670_1 * (var_670_5 / var_670_4)

				if var_670_6 > 0 and var_670_1 < var_670_6 then
					arg_667_1.talkMaxDuration = var_670_6

					if var_670_6 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_6 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_3
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_7 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_7 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_7

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_7 and arg_667_1.time_ < var_670_0 + var_670_7 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play115281160 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 115281160
		arg_671_1.duration_ = 5.466

		local var_671_0 = {
			ja = 5.466,
			ko = 1.666,
			zh = 4.3,
			en = 1.666
		}
		local var_671_1 = manager.audio:GetLocalizationFlag()

		if var_671_0[var_671_1] ~= nil then
			arg_671_1.duration_ = var_671_0[var_671_1]
		end

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play115281161(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["10030"].transform
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 then
				arg_671_1.var_.moveOldPos10030 = var_674_0.localPosition
				var_674_0.localScale = Vector3.New(1, 1, 1)

				arg_671_1:CheckSpriteTmpPos("10030", 3)

				local var_674_2 = var_674_0.childCount

				for iter_674_0 = 0, var_674_2 - 1 do
					local var_674_3 = var_674_0:GetChild(iter_674_0)

					if var_674_3.name == "split_3" or not string.find(var_674_3.name, "split") then
						var_674_3.gameObject:SetActive(true)
					else
						var_674_3.gameObject:SetActive(false)
					end
				end
			end

			local var_674_4 = 0.001

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_4 then
				local var_674_5 = (arg_671_1.time_ - var_674_1) / var_674_4
				local var_674_6 = Vector3.New(0, -390, 150)

				var_674_0.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos10030, var_674_6, var_674_5)
			end

			if arg_671_1.time_ >= var_674_1 + var_674_4 and arg_671_1.time_ < var_674_1 + var_674_4 + arg_674_0 then
				var_674_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_674_7 = arg_671_1.actors_["10030"]
			local var_674_8 = 0

			if var_674_8 < arg_671_1.time_ and arg_671_1.time_ <= var_674_8 + arg_674_0 and arg_671_1.var_.actorSpriteComps10030 == nil then
				arg_671_1.var_.actorSpriteComps10030 = var_674_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_674_9 = 0.2

			if var_674_8 <= arg_671_1.time_ and arg_671_1.time_ < var_674_8 + var_674_9 then
				local var_674_10 = (arg_671_1.time_ - var_674_8) / var_674_9

				if arg_671_1.var_.actorSpriteComps10030 then
					for iter_674_1, iter_674_2 in pairs(arg_671_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_674_2 then
							local var_674_11 = Mathf.Lerp(iter_674_2.color.r, 1, var_674_10)

							iter_674_2.color = Color.New(var_674_11, var_674_11, var_674_11)
						end
					end
				end
			end

			if arg_671_1.time_ >= var_674_8 + var_674_9 and arg_671_1.time_ < var_674_8 + var_674_9 + arg_674_0 and arg_671_1.var_.actorSpriteComps10030 then
				local var_674_12 = 1

				for iter_674_3, iter_674_4 in pairs(arg_671_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_674_4 then
						iter_674_4.color = Color.New(var_674_12, var_674_12, var_674_12)
					end
				end

				arg_671_1.var_.actorSpriteComps10030 = nil
			end

			local var_674_13 = arg_671_1.actors_["10030"]
			local var_674_14 = 0

			if var_674_14 < arg_671_1.time_ and arg_671_1.time_ <= var_674_14 + arg_674_0 then
				local var_674_15 = var_674_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_674_15 then
					arg_671_1.var_.alphaOldValue10030 = var_674_15.alpha
					arg_671_1.var_.characterEffect10030 = var_674_15
				end

				arg_671_1.var_.alphaOldValue10030 = 0
			end

			local var_674_16 = 0.333333333333333

			if var_674_14 <= arg_671_1.time_ and arg_671_1.time_ < var_674_14 + var_674_16 then
				local var_674_17 = (arg_671_1.time_ - var_674_14) / var_674_16
				local var_674_18 = Mathf.Lerp(arg_671_1.var_.alphaOldValue10030, 1, var_674_17)

				if arg_671_1.var_.characterEffect10030 then
					arg_671_1.var_.characterEffect10030.alpha = var_674_18
				end
			end

			if arg_671_1.time_ >= var_674_14 + var_674_16 and arg_671_1.time_ < var_674_14 + var_674_16 + arg_674_0 and arg_671_1.var_.characterEffect10030 then
				arg_671_1.var_.characterEffect10030.alpha = 1
			end

			local var_674_19 = 0
			local var_674_20 = 0.2

			if var_674_19 < arg_671_1.time_ and arg_671_1.time_ <= var_674_19 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_21 = arg_671_1:FormatText(StoryNameCfg[309].name)

				arg_671_1.leftNameTxt_.text = var_674_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_22 = arg_671_1:GetWordFromCfg(115281160)
				local var_674_23 = arg_671_1:FormatText(var_674_22.content)

				arg_671_1.text_.text = var_674_23

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_24 = 8
				local var_674_25 = utf8.len(var_674_23)
				local var_674_26 = var_674_24 <= 0 and var_674_20 or var_674_20 * (var_674_25 / var_674_24)

				if var_674_26 > 0 and var_674_20 < var_674_26 then
					arg_671_1.talkMaxDuration = var_674_26

					if var_674_26 + var_674_19 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_26 + var_674_19
					end
				end

				arg_671_1.text_.text = var_674_23
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281160", "story_v_out_115281.awb") ~= 0 then
					local var_674_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281160", "story_v_out_115281.awb") / 1000

					if var_674_27 + var_674_19 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_27 + var_674_19
					end

					if var_674_22.prefab_name ~= "" and arg_671_1.actors_[var_674_22.prefab_name] ~= nil then
						local var_674_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_22.prefab_name].transform, "story_v_out_115281", "115281160", "story_v_out_115281.awb")

						arg_671_1:RecordAudio("115281160", var_674_28)
						arg_671_1:RecordAudio("115281160", var_674_28)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_out_115281", "115281160", "story_v_out_115281.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_out_115281", "115281160", "story_v_out_115281.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_29 = math.max(var_674_20, arg_671_1.talkMaxDuration)

			if var_674_19 <= arg_671_1.time_ and arg_671_1.time_ < var_674_19 + var_674_29 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_19) / var_674_29

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_19 + var_674_29 and arg_671_1.time_ < var_674_19 + var_674_29 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play115281161 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 115281161
		arg_675_1.duration_ = 5

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play115281162(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["10030"]
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 then
				local var_678_2 = var_678_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_678_2 then
					arg_675_1.var_.alphaOldValue10030 = var_678_2.alpha
					arg_675_1.var_.characterEffect10030 = var_678_2
				end

				arg_675_1.var_.alphaOldValue10030 = 1
			end

			local var_678_3 = 0.333333333333333

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_3 then
				local var_678_4 = (arg_675_1.time_ - var_678_1) / var_678_3
				local var_678_5 = Mathf.Lerp(arg_675_1.var_.alphaOldValue10030, 0, var_678_4)

				if arg_675_1.var_.characterEffect10030 then
					arg_675_1.var_.characterEffect10030.alpha = var_678_5
				end
			end

			if arg_675_1.time_ >= var_678_1 + var_678_3 and arg_675_1.time_ < var_678_1 + var_678_3 + arg_678_0 and arg_675_1.var_.characterEffect10030 then
				arg_675_1.var_.characterEffect10030.alpha = 0
			end

			local var_678_6 = 0
			local var_678_7 = 0.575

			if var_678_6 < arg_675_1.time_ and arg_675_1.time_ <= var_678_6 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, false)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_8 = arg_675_1:GetWordFromCfg(115281161)
				local var_678_9 = arg_675_1:FormatText(var_678_8.content)

				arg_675_1.text_.text = var_678_9

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_10 = 23
				local var_678_11 = utf8.len(var_678_9)
				local var_678_12 = var_678_10 <= 0 and var_678_7 or var_678_7 * (var_678_11 / var_678_10)

				if var_678_12 > 0 and var_678_7 < var_678_12 then
					arg_675_1.talkMaxDuration = var_678_12

					if var_678_12 + var_678_6 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_12 + var_678_6
					end
				end

				arg_675_1.text_.text = var_678_9
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)
				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_13 = math.max(var_678_7, arg_675_1.talkMaxDuration)

			if var_678_6 <= arg_675_1.time_ and arg_675_1.time_ < var_678_6 + var_678_13 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_6) / var_678_13

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_6 + var_678_13 and arg_675_1.time_ < var_678_6 + var_678_13 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play115281162 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 115281162
		arg_679_1.duration_ = 5.033

		local var_679_0 = {
			ja = 5.033,
			ko = 3.733,
			zh = 4.466,
			en = 4.7
		}
		local var_679_1 = manager.audio:GetLocalizationFlag()

		if var_679_0[var_679_1] ~= nil then
			arg_679_1.duration_ = var_679_0[var_679_1]
		end

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play115281163(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = arg_679_1.actors_["1038"].transform
			local var_682_1 = 0

			if var_682_1 < arg_679_1.time_ and arg_679_1.time_ <= var_682_1 + arg_682_0 then
				arg_679_1.var_.moveOldPos1038 = var_682_0.localPosition
				var_682_0.localScale = Vector3.New(1, 1, 1)

				arg_679_1:CheckSpriteTmpPos("1038", 2)

				local var_682_2 = var_682_0.childCount

				for iter_682_0 = 0, var_682_2 - 1 do
					local var_682_3 = var_682_0:GetChild(iter_682_0)

					if var_682_3.name == "split_9" or not string.find(var_682_3.name, "split") then
						var_682_3.gameObject:SetActive(true)
					else
						var_682_3.gameObject:SetActive(false)
					end
				end
			end

			local var_682_4 = 0.001

			if var_682_1 <= arg_679_1.time_ and arg_679_1.time_ < var_682_1 + var_682_4 then
				local var_682_5 = (arg_679_1.time_ - var_682_1) / var_682_4
				local var_682_6 = Vector3.New(-390, -400, 0)

				var_682_0.localPosition = Vector3.Lerp(arg_679_1.var_.moveOldPos1038, var_682_6, var_682_5)
			end

			if arg_679_1.time_ >= var_682_1 + var_682_4 and arg_679_1.time_ < var_682_1 + var_682_4 + arg_682_0 then
				var_682_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_682_7 = arg_679_1.actors_["1038"]
			local var_682_8 = 0

			if var_682_8 < arg_679_1.time_ and arg_679_1.time_ <= var_682_8 + arg_682_0 then
				local var_682_9 = var_682_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_682_9 then
					arg_679_1.var_.alphaOldValue1038 = var_682_9.alpha
					arg_679_1.var_.characterEffect1038 = var_682_9
				end

				arg_679_1.var_.alphaOldValue1038 = 0
			end

			local var_682_10 = 0.333333333333333

			if var_682_8 <= arg_679_1.time_ and arg_679_1.time_ < var_682_8 + var_682_10 then
				local var_682_11 = (arg_679_1.time_ - var_682_8) / var_682_10
				local var_682_12 = Mathf.Lerp(arg_679_1.var_.alphaOldValue1038, 1, var_682_11)

				if arg_679_1.var_.characterEffect1038 then
					arg_679_1.var_.characterEffect1038.alpha = var_682_12
				end
			end

			if arg_679_1.time_ >= var_682_8 + var_682_10 and arg_679_1.time_ < var_682_8 + var_682_10 + arg_682_0 and arg_679_1.var_.characterEffect1038 then
				arg_679_1.var_.characterEffect1038.alpha = 1
			end

			local var_682_13 = 0
			local var_682_14 = 0.375

			if var_682_13 < arg_679_1.time_ and arg_679_1.time_ <= var_682_13 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_15 = arg_679_1:FormatText(StoryNameCfg[94].name)

				arg_679_1.leftNameTxt_.text = var_682_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_16 = arg_679_1:GetWordFromCfg(115281162)
				local var_682_17 = arg_679_1:FormatText(var_682_16.content)

				arg_679_1.text_.text = var_682_17

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_18 = 15
				local var_682_19 = utf8.len(var_682_17)
				local var_682_20 = var_682_18 <= 0 and var_682_14 or var_682_14 * (var_682_19 / var_682_18)

				if var_682_20 > 0 and var_682_14 < var_682_20 then
					arg_679_1.talkMaxDuration = var_682_20

					if var_682_20 + var_682_13 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_20 + var_682_13
					end
				end

				arg_679_1.text_.text = var_682_17
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281162", "story_v_out_115281.awb") ~= 0 then
					local var_682_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281162", "story_v_out_115281.awb") / 1000

					if var_682_21 + var_682_13 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_21 + var_682_13
					end

					if var_682_16.prefab_name ~= "" and arg_679_1.actors_[var_682_16.prefab_name] ~= nil then
						local var_682_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_16.prefab_name].transform, "story_v_out_115281", "115281162", "story_v_out_115281.awb")

						arg_679_1:RecordAudio("115281162", var_682_22)
						arg_679_1:RecordAudio("115281162", var_682_22)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_out_115281", "115281162", "story_v_out_115281.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_out_115281", "115281162", "story_v_out_115281.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_23 = math.max(var_682_14, arg_679_1.talkMaxDuration)

			if var_682_13 <= arg_679_1.time_ and arg_679_1.time_ < var_682_13 + var_682_23 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_13) / var_682_23

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_13 + var_682_23 and arg_679_1.time_ < var_682_13 + var_682_23 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play115281163 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 115281163
		arg_683_1.duration_ = 2.166

		local var_683_0 = {
			ja = 1.5,
			ko = 1.4,
			zh = 2.166,
			en = 1.6
		}
		local var_683_1 = manager.audio:GetLocalizationFlag()

		if var_683_0[var_683_1] ~= nil then
			arg_683_1.duration_ = var_683_0[var_683_1]
		end

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play115281164(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = arg_683_1.actors_["10030"].transform
			local var_686_1 = 0

			if var_686_1 < arg_683_1.time_ and arg_683_1.time_ <= var_686_1 + arg_686_0 then
				arg_683_1.var_.moveOldPos10030 = var_686_0.localPosition
				var_686_0.localScale = Vector3.New(1, 1, 1)

				arg_683_1:CheckSpriteTmpPos("10030", 4)

				local var_686_2 = var_686_0.childCount

				for iter_686_0 = 0, var_686_2 - 1 do
					local var_686_3 = var_686_0:GetChild(iter_686_0)

					if var_686_3.name == "split_3" or not string.find(var_686_3.name, "split") then
						var_686_3.gameObject:SetActive(true)
					else
						var_686_3.gameObject:SetActive(false)
					end
				end
			end

			local var_686_4 = 0.001

			if var_686_1 <= arg_683_1.time_ and arg_683_1.time_ < var_686_1 + var_686_4 then
				local var_686_5 = (arg_683_1.time_ - var_686_1) / var_686_4
				local var_686_6 = Vector3.New(390, -390, 150)

				var_686_0.localPosition = Vector3.Lerp(arg_683_1.var_.moveOldPos10030, var_686_6, var_686_5)
			end

			if arg_683_1.time_ >= var_686_1 + var_686_4 and arg_683_1.time_ < var_686_1 + var_686_4 + arg_686_0 then
				var_686_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_686_7 = arg_683_1.actors_["1038"]
			local var_686_8 = 0

			if var_686_8 < arg_683_1.time_ and arg_683_1.time_ <= var_686_8 + arg_686_0 and arg_683_1.var_.actorSpriteComps1038 == nil then
				arg_683_1.var_.actorSpriteComps1038 = var_686_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_686_9 = 0.2

			if var_686_8 <= arg_683_1.time_ and arg_683_1.time_ < var_686_8 + var_686_9 then
				local var_686_10 = (arg_683_1.time_ - var_686_8) / var_686_9

				if arg_683_1.var_.actorSpriteComps1038 then
					for iter_686_1, iter_686_2 in pairs(arg_683_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_686_2 then
							local var_686_11 = Mathf.Lerp(iter_686_2.color.r, 0.5, var_686_10)

							iter_686_2.color = Color.New(var_686_11, var_686_11, var_686_11)
						end
					end
				end
			end

			if arg_683_1.time_ >= var_686_8 + var_686_9 and arg_683_1.time_ < var_686_8 + var_686_9 + arg_686_0 and arg_683_1.var_.actorSpriteComps1038 then
				local var_686_12 = 0.5

				for iter_686_3, iter_686_4 in pairs(arg_683_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_686_4 then
						iter_686_4.color = Color.New(var_686_12, var_686_12, var_686_12)
					end
				end

				arg_683_1.var_.actorSpriteComps1038 = nil
			end

			local var_686_13 = arg_683_1.actors_["10030"]
			local var_686_14 = 0

			if var_686_14 < arg_683_1.time_ and arg_683_1.time_ <= var_686_14 + arg_686_0 then
				local var_686_15 = var_686_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_686_15 then
					arg_683_1.var_.alphaOldValue10030 = var_686_15.alpha
					arg_683_1.var_.characterEffect10030 = var_686_15
				end

				arg_683_1.var_.alphaOldValue10030 = 0
			end

			local var_686_16 = 0.333333333333333

			if var_686_14 <= arg_683_1.time_ and arg_683_1.time_ < var_686_14 + var_686_16 then
				local var_686_17 = (arg_683_1.time_ - var_686_14) / var_686_16
				local var_686_18 = Mathf.Lerp(arg_683_1.var_.alphaOldValue10030, 1, var_686_17)

				if arg_683_1.var_.characterEffect10030 then
					arg_683_1.var_.characterEffect10030.alpha = var_686_18
				end
			end

			if arg_683_1.time_ >= var_686_14 + var_686_16 and arg_683_1.time_ < var_686_14 + var_686_16 + arg_686_0 and arg_683_1.var_.characterEffect10030 then
				arg_683_1.var_.characterEffect10030.alpha = 1
			end

			local var_686_19 = 0
			local var_686_20 = 0.15

			if var_686_19 < arg_683_1.time_ and arg_683_1.time_ <= var_686_19 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_21 = arg_683_1:FormatText(StoryNameCfg[309].name)

				arg_683_1.leftNameTxt_.text = var_686_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_22 = arg_683_1:GetWordFromCfg(115281163)
				local var_686_23 = arg_683_1:FormatText(var_686_22.content)

				arg_683_1.text_.text = var_686_23

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_24 = 6
				local var_686_25 = utf8.len(var_686_23)
				local var_686_26 = var_686_24 <= 0 and var_686_20 or var_686_20 * (var_686_25 / var_686_24)

				if var_686_26 > 0 and var_686_20 < var_686_26 then
					arg_683_1.talkMaxDuration = var_686_26

					if var_686_26 + var_686_19 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_26 + var_686_19
					end
				end

				arg_683_1.text_.text = var_686_23
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281163", "story_v_out_115281.awb") ~= 0 then
					local var_686_27 = manager.audio:GetVoiceLength("story_v_out_115281", "115281163", "story_v_out_115281.awb") / 1000

					if var_686_27 + var_686_19 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_27 + var_686_19
					end

					if var_686_22.prefab_name ~= "" and arg_683_1.actors_[var_686_22.prefab_name] ~= nil then
						local var_686_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_22.prefab_name].transform, "story_v_out_115281", "115281163", "story_v_out_115281.awb")

						arg_683_1:RecordAudio("115281163", var_686_28)
						arg_683_1:RecordAudio("115281163", var_686_28)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_out_115281", "115281163", "story_v_out_115281.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_out_115281", "115281163", "story_v_out_115281.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_29 = math.max(var_686_20, arg_683_1.talkMaxDuration)

			if var_686_19 <= arg_683_1.time_ and arg_683_1.time_ < var_686_19 + var_686_29 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_19) / var_686_29

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_19 + var_686_29 and arg_683_1.time_ < var_686_19 + var_686_29 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play115281164 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 115281164
		arg_687_1.duration_ = 5

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play115281165(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = arg_687_1.actors_["10030"].transform
			local var_690_1 = 0.299333333333333

			if var_690_1 < arg_687_1.time_ and arg_687_1.time_ <= var_690_1 + arg_690_0 then
				arg_687_1.var_.moveOldPos10030 = var_690_0.localPosition
				var_690_0.localScale = Vector3.New(1, 1, 1)

				arg_687_1:CheckSpriteTmpPos("10030", 0)

				local var_690_2 = var_690_0.childCount

				for iter_690_0 = 0, var_690_2 - 1 do
					local var_690_3 = var_690_0:GetChild(iter_690_0)

					if var_690_3.name == "split_3" or not string.find(var_690_3.name, "split") then
						var_690_3.gameObject:SetActive(true)
					else
						var_690_3.gameObject:SetActive(false)
					end
				end
			end

			local var_690_4 = 0.001

			if var_690_1 <= arg_687_1.time_ and arg_687_1.time_ < var_690_1 + var_690_4 then
				local var_690_5 = (arg_687_1.time_ - var_690_1) / var_690_4
				local var_690_6 = Vector3.New(-1500, -350, -180)

				var_690_0.localPosition = Vector3.Lerp(arg_687_1.var_.moveOldPos10030, var_690_6, var_690_5)
			end

			if arg_687_1.time_ >= var_690_1 + var_690_4 and arg_687_1.time_ < var_690_1 + var_690_4 + arg_690_0 then
				var_690_0.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_690_7 = arg_687_1.actors_["1038"].transform
			local var_690_8 = 0.299333333333333

			if var_690_8 < arg_687_1.time_ and arg_687_1.time_ <= var_690_8 + arg_690_0 then
				arg_687_1.var_.moveOldPos1038 = var_690_7.localPosition
				var_690_7.localScale = Vector3.New(1, 1, 1)

				arg_687_1:CheckSpriteTmpPos("1038", 0)

				local var_690_9 = var_690_7.childCount

				for iter_690_1 = 0, var_690_9 - 1 do
					local var_690_10 = var_690_7:GetChild(iter_690_1)

					if var_690_10.name == "split_9" or not string.find(var_690_10.name, "split") then
						var_690_10.gameObject:SetActive(true)
					else
						var_690_10.gameObject:SetActive(false)
					end
				end
			end

			local var_690_11 = 0.001

			if var_690_8 <= arg_687_1.time_ and arg_687_1.time_ < var_690_8 + var_690_11 then
				local var_690_12 = (arg_687_1.time_ - var_690_8) / var_690_11
				local var_690_13 = Vector3.New(-1500, -350, -180)

				var_690_7.localPosition = Vector3.Lerp(arg_687_1.var_.moveOldPos1038, var_690_13, var_690_12)
			end

			if arg_687_1.time_ >= var_690_8 + var_690_11 and arg_687_1.time_ < var_690_8 + var_690_11 + arg_690_0 then
				var_690_7.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_690_14 = arg_687_1.actors_["10030"]
			local var_690_15 = 0

			if var_690_15 < arg_687_1.time_ and arg_687_1.time_ <= var_690_15 + arg_690_0 then
				local var_690_16 = var_690_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_690_16 then
					arg_687_1.var_.alphaOldValue10030 = var_690_16.alpha
					arg_687_1.var_.characterEffect10030 = var_690_16
				end

				arg_687_1.var_.alphaOldValue10030 = 1
			end

			local var_690_17 = 0.333333333333333

			if var_690_15 <= arg_687_1.time_ and arg_687_1.time_ < var_690_15 + var_690_17 then
				local var_690_18 = (arg_687_1.time_ - var_690_15) / var_690_17
				local var_690_19 = Mathf.Lerp(arg_687_1.var_.alphaOldValue10030, 0, var_690_18)

				if arg_687_1.var_.characterEffect10030 then
					arg_687_1.var_.characterEffect10030.alpha = var_690_19
				end
			end

			if arg_687_1.time_ >= var_690_15 + var_690_17 and arg_687_1.time_ < var_690_15 + var_690_17 + arg_690_0 and arg_687_1.var_.characterEffect10030 then
				arg_687_1.var_.characterEffect10030.alpha = 0
			end

			local var_690_20 = arg_687_1.actors_["1038"]
			local var_690_21 = 0

			if var_690_21 < arg_687_1.time_ and arg_687_1.time_ <= var_690_21 + arg_690_0 then
				local var_690_22 = var_690_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_690_22 then
					arg_687_1.var_.alphaOldValue1038 = var_690_22.alpha
					arg_687_1.var_.characterEffect1038 = var_690_22
				end

				arg_687_1.var_.alphaOldValue1038 = 1
			end

			local var_690_23 = 0.333333333333333

			if var_690_21 <= arg_687_1.time_ and arg_687_1.time_ < var_690_21 + var_690_23 then
				local var_690_24 = (arg_687_1.time_ - var_690_21) / var_690_23
				local var_690_25 = Mathf.Lerp(arg_687_1.var_.alphaOldValue1038, 0, var_690_24)

				if arg_687_1.var_.characterEffect1038 then
					arg_687_1.var_.characterEffect1038.alpha = var_690_25
				end
			end

			if arg_687_1.time_ >= var_690_21 + var_690_23 and arg_687_1.time_ < var_690_21 + var_690_23 + arg_690_0 and arg_687_1.var_.characterEffect1038 then
				arg_687_1.var_.characterEffect1038.alpha = 0
			end

			local var_690_26 = 0
			local var_690_27 = 0.75

			if var_690_26 < arg_687_1.time_ and arg_687_1.time_ <= var_690_26 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, false)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_28 = arg_687_1:GetWordFromCfg(115281164)
				local var_690_29 = arg_687_1:FormatText(var_690_28.content)

				arg_687_1.text_.text = var_690_29

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_30 = 30
				local var_690_31 = utf8.len(var_690_29)
				local var_690_32 = var_690_30 <= 0 and var_690_27 or var_690_27 * (var_690_31 / var_690_30)

				if var_690_32 > 0 and var_690_27 < var_690_32 then
					arg_687_1.talkMaxDuration = var_690_32

					if var_690_32 + var_690_26 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_32 + var_690_26
					end
				end

				arg_687_1.text_.text = var_690_29
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)
				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_33 = math.max(var_690_27, arg_687_1.talkMaxDuration)

			if var_690_26 <= arg_687_1.time_ and arg_687_1.time_ < var_690_26 + var_690_33 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_26) / var_690_33

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_26 + var_690_33 and arg_687_1.time_ < var_690_26 + var_690_33 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play115281165 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 115281165
		arg_691_1.duration_ = 11.066

		local var_691_0 = {
			ja = 9.566,
			ko = 8.633,
			zh = 11.066,
			en = 9.1
		}
		local var_691_1 = manager.audio:GetLocalizationFlag()

		if var_691_0[var_691_1] ~= nil then
			arg_691_1.duration_ = var_691_0[var_691_1]
		end

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
			arg_691_1.auto_ = false
		end

		function arg_691_1.playNext_(arg_693_0)
			arg_691_1.onStoryFinished_()
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = arg_691_1.actors_["10030"].transform
			local var_694_1 = 0

			if var_694_1 < arg_691_1.time_ and arg_691_1.time_ <= var_694_1 + arg_694_0 then
				arg_691_1.var_.moveOldPos10030 = var_694_0.localPosition
				var_694_0.localScale = Vector3.New(1, 1, 1)

				arg_691_1:CheckSpriteTmpPos("10030", 3)

				local var_694_2 = var_694_0.childCount

				for iter_694_0 = 0, var_694_2 - 1 do
					local var_694_3 = var_694_0:GetChild(iter_694_0)

					if var_694_3.name == "split_3" or not string.find(var_694_3.name, "split") then
						var_694_3.gameObject:SetActive(true)
					else
						var_694_3.gameObject:SetActive(false)
					end
				end
			end

			local var_694_4 = 0.001

			if var_694_1 <= arg_691_1.time_ and arg_691_1.time_ < var_694_1 + var_694_4 then
				local var_694_5 = (arg_691_1.time_ - var_694_1) / var_694_4
				local var_694_6 = Vector3.New(0, -390, 150)

				var_694_0.localPosition = Vector3.Lerp(arg_691_1.var_.moveOldPos10030, var_694_6, var_694_5)
			end

			if arg_691_1.time_ >= var_694_1 + var_694_4 and arg_691_1.time_ < var_694_1 + var_694_4 + arg_694_0 then
				var_694_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_694_7 = arg_691_1.actors_["10030"]
			local var_694_8 = 0

			if var_694_8 < arg_691_1.time_ and arg_691_1.time_ <= var_694_8 + arg_694_0 then
				local var_694_9 = var_694_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_694_9 then
					arg_691_1.var_.alphaOldValue10030 = var_694_9.alpha
					arg_691_1.var_.characterEffect10030 = var_694_9
				end

				arg_691_1.var_.alphaOldValue10030 = 0
			end

			local var_694_10 = 0.333333333333333

			if var_694_8 <= arg_691_1.time_ and arg_691_1.time_ < var_694_8 + var_694_10 then
				local var_694_11 = (arg_691_1.time_ - var_694_8) / var_694_10
				local var_694_12 = Mathf.Lerp(arg_691_1.var_.alphaOldValue10030, 1, var_694_11)

				if arg_691_1.var_.characterEffect10030 then
					arg_691_1.var_.characterEffect10030.alpha = var_694_12
				end
			end

			if arg_691_1.time_ >= var_694_8 + var_694_10 and arg_691_1.time_ < var_694_8 + var_694_10 + arg_694_0 and arg_691_1.var_.characterEffect10030 then
				arg_691_1.var_.characterEffect10030.alpha = 1
			end

			local var_694_13 = 0
			local var_694_14 = 0.825

			if var_694_13 < arg_691_1.time_ and arg_691_1.time_ <= var_694_13 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, true)

				local var_694_15 = arg_691_1:FormatText(StoryNameCfg[309].name)

				arg_691_1.leftNameTxt_.text = var_694_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_691_1.leftNameTxt_.transform)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1.leftNameTxt_.text)
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_16 = arg_691_1:GetWordFromCfg(115281165)
				local var_694_17 = arg_691_1:FormatText(var_694_16.content)

				arg_691_1.text_.text = var_694_17

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_18 = 33
				local var_694_19 = utf8.len(var_694_17)
				local var_694_20 = var_694_18 <= 0 and var_694_14 or var_694_14 * (var_694_19 / var_694_18)

				if var_694_20 > 0 and var_694_14 < var_694_20 then
					arg_691_1.talkMaxDuration = var_694_20

					if var_694_20 + var_694_13 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_20 + var_694_13
					end
				end

				arg_691_1.text_.text = var_694_17
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115281", "115281165", "story_v_out_115281.awb") ~= 0 then
					local var_694_21 = manager.audio:GetVoiceLength("story_v_out_115281", "115281165", "story_v_out_115281.awb") / 1000

					if var_694_21 + var_694_13 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_21 + var_694_13
					end

					if var_694_16.prefab_name ~= "" and arg_691_1.actors_[var_694_16.prefab_name] ~= nil then
						local var_694_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_691_1.actors_[var_694_16.prefab_name].transform, "story_v_out_115281", "115281165", "story_v_out_115281.awb")

						arg_691_1:RecordAudio("115281165", var_694_22)
						arg_691_1:RecordAudio("115281165", var_694_22)
					else
						arg_691_1:AudioAction("play", "voice", "story_v_out_115281", "115281165", "story_v_out_115281.awb")
					end

					arg_691_1:RecordHistoryTalkVoice("story_v_out_115281", "115281165", "story_v_out_115281.awb")
				end

				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_23 = math.max(var_694_14, arg_691_1.talkMaxDuration)

			if var_694_13 <= arg_691_1.time_ and arg_691_1.time_ < var_694_13 + var_694_23 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_13) / var_694_23

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_13 + var_694_23 and arg_691_1.time_ < var_694_13 + var_694_23 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D999",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST27",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST28a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/RO0501"
	},
	voices = {
		"story_v_out_115281.awb"
	}
}
