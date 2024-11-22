return {
	Play111021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 111021001
		arg_1_1.duration_ = 7.53333333333333

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play111021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST01"

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
				local var_4_5 = arg_1_1.bgs_.ST01

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
					if iter_4_0 ~= "ST01" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.ST01
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueST01 = var_4_20.a
					arg_1_1.var_.alphaMatValueST01 = var_4_19
				end

				arg_1_1.var_.alphaOldValueST01 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueST01, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueST01 then
					local var_4_24 = arg_1_1.var_.alphaMatValueST01
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueST01 then
				local var_4_26 = arg_1_1.var_.alphaMatValueST01
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 1.03333333333333

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 1.5

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = manager.ui.mainCamera.transform
			local var_4_31 = 0

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_30.localPosition
			end

			local var_4_32 = 2.83333333333333

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / 0.066
				local var_4_34, var_4_35 = math.modf(var_4_33)

				var_4_30.localPosition = Vector3.New(var_4_35 * 0.13, var_4_35 * 0.13, var_4_35 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				var_4_30.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_36 = 2.53333333333333
			local var_4_37 = 1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "effect"

				arg_1_1:AudioAction(var_4_38, var_4_39, "se_story", "se_story_quakeloop", "")
			end

			local var_4_40 = 0.0333333333333332
			local var_4_41 = 1

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_42 = "play"
				local var_4_43 = "music"

				arg_1_1:AudioAction(var_4_42, var_4_43, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_44 = 2.53333333333333
			local var_4_45 = 1.125

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_46 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_46:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_47 = arg_1_1:GetWordFromCfg(111021001)
				local var_4_48 = arg_1_1:FormatText(var_4_47.content)

				arg_1_1.text_.text = var_4_48

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_49 = 45
				local var_4_50 = utf8.len(var_4_48)
				local var_4_51 = var_4_49 <= 0 and var_4_45 or var_4_45 * (var_4_50 / var_4_49)

				if var_4_51 > 0 and var_4_45 < var_4_51 then
					arg_1_1.talkMaxDuration = var_4_51
					var_4_44 = var_4_44 + 0.3

					if var_4_51 + var_4_44 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_51 + var_4_44
					end
				end

				arg_1_1.text_.text = var_4_48
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_52 = var_4_44 + 0.3
			local var_4_53 = math.max(var_4_45, arg_1_1.talkMaxDuration)

			if var_4_52 <= arg_1_1.time_ and arg_1_1.time_ < var_4_52 + var_4_53 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_52) / var_4_53

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_52 + var_4_53 and arg_1_1.time_ < var_4_52 + var_4_53 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play111021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 111021002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play111021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0.45
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "effect"

				arg_7_1:AudioAction(var_10_2, var_10_3, "se_story", "se_story_alarmloop", "")
			end

			local var_10_4 = 0
			local var_10_5 = 1.1

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_6 = arg_7_1:GetWordFromCfg(111021002)
				local var_10_7 = arg_7_1:FormatText(var_10_6.content)

				arg_7_1.text_.text = var_10_7

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_8 = 44
				local var_10_9 = utf8.len(var_10_7)
				local var_10_10 = var_10_8 <= 0 and var_10_5 or var_10_5 * (var_10_9 / var_10_8)

				if var_10_10 > 0 and var_10_5 < var_10_10 then
					arg_7_1.talkMaxDuration = var_10_10

					if var_10_10 + var_10_4 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_10 + var_10_4
					end
				end

				arg_7_1.text_.text = var_10_7
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_11 = math.max(var_10_5, arg_7_1.talkMaxDuration)

			if var_10_4 <= arg_7_1.time_ and arg_7_1.time_ < var_10_4 + var_10_11 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_4) / var_10_11

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_4 + var_10_11 and arg_7_1.time_ < var_10_4 + var_10_11 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play111021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 111021003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play111021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.15

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(111021003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 6
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
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_8 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_8 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_8

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_8 and arg_11_1.time_ < var_14_0 + var_14_8 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play111021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 111021004
		arg_15_1.duration_ = 6.666

		local var_15_0 = {
			ja = 6.666,
			ko = 5.766,
			zh = 4.833,
			en = 6.466
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
				arg_15_0:Play111021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_2 = "stop"
				local var_18_3 = "effect"

				arg_15_1:AudioAction(var_18_2, var_18_3, "se_story", "se_story_quakeloop", "")
			end

			local var_18_4 = 0
			local var_18_5 = 0.575

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_6 = arg_15_1:FormatText(StoryNameCfg[10].name)

				arg_15_1.leftNameTxt_.text = var_18_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_7 = arg_15_1:GetWordFromCfg(111021004)
				local var_18_8 = arg_15_1:FormatText(var_18_7.content)

				arg_15_1.text_.text = var_18_8

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_9 = 23
				local var_18_10 = utf8.len(var_18_8)
				local var_18_11 = var_18_9 <= 0 and var_18_5 or var_18_5 * (var_18_10 / var_18_9)

				if var_18_11 > 0 and var_18_5 < var_18_11 then
					arg_15_1.talkMaxDuration = var_18_11

					if var_18_11 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_11 + var_18_4
					end
				end

				arg_15_1.text_.text = var_18_8
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021004", "story_v_out_111021.awb") ~= 0 then
					local var_18_12 = manager.audio:GetVoiceLength("story_v_out_111021", "111021004", "story_v_out_111021.awb") / 1000

					if var_18_12 + var_18_4 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_12 + var_18_4
					end

					if var_18_7.prefab_name ~= "" and arg_15_1.actors_[var_18_7.prefab_name] ~= nil then
						local var_18_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_7.prefab_name].transform, "story_v_out_111021", "111021004", "story_v_out_111021.awb")

						arg_15_1:RecordAudio("111021004", var_18_13)
						arg_15_1:RecordAudio("111021004", var_18_13)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_111021", "111021004", "story_v_out_111021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_111021", "111021004", "story_v_out_111021.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_5, arg_15_1.talkMaxDuration)

			if var_18_4 <= arg_15_1.time_ and arg_15_1.time_ < var_18_4 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_4) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_4 + var_18_14 and arg_15_1.time_ < var_18_4 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play111021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 111021005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play111021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 1

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				local var_22_2 = "stop"
				local var_22_3 = "effect"

				arg_19_1:AudioAction(var_22_2, var_22_3, "se_story", "se_story_alarmloop", "")
			end

			local var_22_4 = 0
			local var_22_5 = 1.5

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_6 = arg_19_1:GetWordFromCfg(111021005)
				local var_22_7 = arg_19_1:FormatText(var_22_6.content)

				arg_19_1.text_.text = var_22_7

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_8 = 60
				local var_22_9 = utf8.len(var_22_7)
				local var_22_10 = var_22_8 <= 0 and var_22_5 or var_22_5 * (var_22_9 / var_22_8)

				if var_22_10 > 0 and var_22_5 < var_22_10 then
					arg_19_1.talkMaxDuration = var_22_10

					if var_22_10 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_10 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_7
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_11 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_11

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_11 and arg_19_1.time_ < var_22_4 + var_22_11 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play111021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 111021006
		arg_23_1.duration_ = 8

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play111021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "A00"

			if arg_23_1.bgs_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(arg_23_1.paintGo_)

				var_26_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_0)
				var_26_1.name = var_26_0
				var_26_1.transform.parent = arg_23_1.stage_.transform
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_0] = var_26_1
			end

			local var_26_2 = 1.5

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				local var_26_3 = manager.ui.mainCamera.transform.localPosition
				local var_26_4 = Vector3.New(0, 0, 10) + Vector3.New(var_26_3.x, var_26_3.y, 0)
				local var_26_5 = arg_23_1.bgs_.A00

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
					if iter_26_0 ~= "A00" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_16 = arg_23_1.bgs_.A00
			local var_26_17 = 1.5

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				local var_26_18 = var_26_16:GetComponent("SpriteRenderer")

				if var_26_18 then
					var_26_18.material = arg_23_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_26_19 = var_26_18.material
					local var_26_20 = var_26_19:GetColor("_Color")

					arg_23_1.var_.alphaOldValueA00 = var_26_20.a
					arg_23_1.var_.alphaMatValueA00 = var_26_19
				end

				arg_23_1.var_.alphaOldValueA00 = 0
			end

			local var_26_21 = 1.5

			if var_26_17 <= arg_23_1.time_ and arg_23_1.time_ < var_26_17 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_17) / var_26_21
				local var_26_23 = Mathf.Lerp(arg_23_1.var_.alphaOldValueA00, 1, var_26_22)

				if arg_23_1.var_.alphaMatValueA00 then
					local var_26_24 = arg_23_1.var_.alphaMatValueA00
					local var_26_25 = var_26_24:GetColor("_Color")

					var_26_25.a = var_26_23

					var_26_24:SetColor("_Color", var_26_25)
				end
			end

			if arg_23_1.time_ >= var_26_17 + var_26_21 and arg_23_1.time_ < var_26_17 + var_26_21 + arg_26_0 and arg_23_1.var_.alphaMatValueA00 then
				local var_26_26 = arg_23_1.var_.alphaMatValueA00
				local var_26_27 = var_26_26:GetColor("_Color")

				var_26_27.a = 1

				var_26_26:SetColor("_Color", var_26_27)
			end

			local var_26_28 = arg_23_1.bgs_.ST01
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				local var_26_30 = var_26_28:GetComponent("SpriteRenderer")

				if var_26_30 then
					var_26_30.material = arg_23_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_26_31 = var_26_30.material
					local var_26_32 = var_26_31:GetColor("_Color")

					arg_23_1.var_.alphaOldValueST01 = var_26_32.a
					arg_23_1.var_.alphaMatValueST01 = var_26_31
				end

				arg_23_1.var_.alphaOldValueST01 = 1
			end

			local var_26_33 = 1.5

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_33 then
				local var_26_34 = (arg_23_1.time_ - var_26_29) / var_26_33
				local var_26_35 = Mathf.Lerp(arg_23_1.var_.alphaOldValueST01, 0, var_26_34)

				if arg_23_1.var_.alphaMatValueST01 then
					local var_26_36 = arg_23_1.var_.alphaMatValueST01
					local var_26_37 = var_26_36:GetColor("_Color")

					var_26_37.a = var_26_35

					var_26_36:SetColor("_Color", var_26_37)
				end
			end

			if arg_23_1.time_ >= var_26_29 + var_26_33 and arg_23_1.time_ < var_26_29 + var_26_33 + arg_26_0 and arg_23_1.var_.alphaMatValueST01 then
				local var_26_38 = arg_23_1.var_.alphaMatValueST01
				local var_26_39 = var_26_38:GetColor("_Color")

				var_26_39.a = 0

				var_26_38:SetColor("_Color", var_26_39)
			end

			local var_26_40 = 0

			if var_26_40 < arg_23_1.time_ and arg_23_1.time_ <= var_26_40 + arg_26_0 then
				arg_23_1.allBtn_.enabled = false
			end

			local var_26_41 = 2.5

			if arg_23_1.time_ >= var_26_40 + var_26_41 and arg_23_1.time_ < var_26_40 + var_26_41 + arg_26_0 then
				arg_23_1.allBtn_.enabled = true
			end

			local var_26_42 = 3.25
			local var_26_43 = 1

			if var_26_42 < arg_23_1.time_ and arg_23_1.time_ <= var_26_42 + arg_26_0 then
				local var_26_44 = "play"
				local var_26_45 = "music"

				arg_23_1:AudioAction(var_26_44, var_26_45, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_46 = 3
			local var_26_47 = 1.45

			if var_26_46 < arg_23_1.time_ and arg_23_1.time_ <= var_26_46 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_48 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_48:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_49 = arg_23_1:GetWordFromCfg(111021006)
				local var_26_50 = arg_23_1:FormatText(var_26_49.content)

				arg_23_1.text_.text = var_26_50

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_51 = 58
				local var_26_52 = utf8.len(var_26_50)
				local var_26_53 = var_26_51 <= 0 and var_26_47 or var_26_47 * (var_26_52 / var_26_51)

				if var_26_53 > 0 and var_26_47 < var_26_53 then
					arg_23_1.talkMaxDuration = var_26_53
					var_26_46 = var_26_46 + 0.3

					if var_26_53 + var_26_46 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_53 + var_26_46
					end
				end

				arg_23_1.text_.text = var_26_50
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_54 = var_26_46 + 0.3
			local var_26_55 = math.max(var_26_47, arg_23_1.talkMaxDuration)

			if var_26_54 <= arg_23_1.time_ and arg_23_1.time_ < var_26_54 + var_26_55 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_54) / var_26_55

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_54 + var_26_55 and arg_23_1.time_ < var_26_54 + var_26_55 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play111021007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 111021007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play111021008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 1.525

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

				local var_32_2 = arg_29_1:GetWordFromCfg(111021007)
				local var_32_3 = arg_29_1:FormatText(var_32_2.content)

				arg_29_1.text_.text = var_32_3

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_4 = 61
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
	Play111021008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 111021008
		arg_33_1.duration_ = 6.133

		local var_33_0 = {
			ja = 4.2,
			ko = 5.666,
			zh = 3.866,
			en = 6.133
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
				arg_33_0:Play111021009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = "1084ui_story"

			if arg_33_1.actors_[var_36_0] == nil then
				local var_36_1 = Object.Instantiate(Asset.Load("Char/" .. var_36_0), arg_33_1.stage_.transform)

				var_36_1.name = var_36_0
				var_36_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.actors_[var_36_0] = var_36_1

				local var_36_2 = var_36_1:GetComponentInChildren(typeof(CharacterEffect))

				var_36_2.enabled = true

				local var_36_3 = GameObjectTools.GetOrAddComponent(var_36_1, typeof(DynamicBoneHelper))

				if var_36_3 then
					var_36_3:EnableDynamicBone(false)
				end

				arg_33_1:ShowWeapon(var_36_2.transform, false)

				arg_33_1.var_[var_36_0 .. "Animator"] = var_36_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_33_1.var_[var_36_0 .. "Animator"].applyRootMotion = true
				arg_33_1.var_[var_36_0 .. "LipSync"] = var_36_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_36_4 = arg_33_1.actors_["1084ui_story"].transform
			local var_36_5 = 0

			if var_36_5 < arg_33_1.time_ and arg_33_1.time_ <= var_36_5 + arg_36_0 then
				arg_33_1.var_.moveOldPos1084ui_story = var_36_4.localPosition
			end

			local var_36_6 = 0.001

			if var_36_5 <= arg_33_1.time_ and arg_33_1.time_ < var_36_5 + var_36_6 then
				local var_36_7 = (arg_33_1.time_ - var_36_5) / var_36_6
				local var_36_8 = Vector3.New(-0.7, -0.97, -6)

				var_36_4.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1084ui_story, var_36_8, var_36_7)

				local var_36_9 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_9.x, var_36_9.y, var_36_9.z)

				local var_36_10 = var_36_4.localEulerAngles

				var_36_10.z = 0
				var_36_10.x = 0
				var_36_4.localEulerAngles = var_36_10
			end

			if arg_33_1.time_ >= var_36_5 + var_36_6 and arg_33_1.time_ < var_36_5 + var_36_6 + arg_36_0 then
				var_36_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_36_11 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_11.x, var_36_11.y, var_36_11.z)

				local var_36_12 = var_36_4.localEulerAngles

				var_36_12.z = 0
				var_36_12.x = 0
				var_36_4.localEulerAngles = var_36_12
			end

			local var_36_13 = 0

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				arg_33_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_36_15 = arg_33_1.actors_["1084ui_story"]
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story == nil then
				arg_33_1.var_.characterEffect1084ui_story = var_36_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_17 = 0.2

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_17 then
				local var_36_18 = (arg_33_1.time_ - var_36_16) / var_36_17

				if arg_33_1.var_.characterEffect1084ui_story then
					arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_16 + var_36_17 and arg_33_1.time_ < var_36_16 + var_36_17 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story then
				arg_33_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_36_19 = 0
			local var_36_20 = 0.5

			if var_36_19 < arg_33_1.time_ and arg_33_1.time_ <= var_36_19 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_21 = arg_33_1:FormatText(StoryNameCfg[6].name)

				arg_33_1.leftNameTxt_.text = var_36_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_22 = arg_33_1:GetWordFromCfg(111021008)
				local var_36_23 = arg_33_1:FormatText(var_36_22.content)

				arg_33_1.text_.text = var_36_23

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_24 = 20
				local var_36_25 = utf8.len(var_36_23)
				local var_36_26 = var_36_24 <= 0 and var_36_20 or var_36_20 * (var_36_25 / var_36_24)

				if var_36_26 > 0 and var_36_20 < var_36_26 then
					arg_33_1.talkMaxDuration = var_36_26

					if var_36_26 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_26 + var_36_19
					end
				end

				arg_33_1.text_.text = var_36_23
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021008", "story_v_out_111021.awb") ~= 0 then
					local var_36_27 = manager.audio:GetVoiceLength("story_v_out_111021", "111021008", "story_v_out_111021.awb") / 1000

					if var_36_27 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_27 + var_36_19
					end

					if var_36_22.prefab_name ~= "" and arg_33_1.actors_[var_36_22.prefab_name] ~= nil then
						local var_36_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_22.prefab_name].transform, "story_v_out_111021", "111021008", "story_v_out_111021.awb")

						arg_33_1:RecordAudio("111021008", var_36_28)
						arg_33_1:RecordAudio("111021008", var_36_28)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_111021", "111021008", "story_v_out_111021.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_111021", "111021008", "story_v_out_111021.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_29 = math.max(var_36_20, arg_33_1.talkMaxDuration)

			if var_36_19 <= arg_33_1.time_ and arg_33_1.time_ < var_36_19 + var_36_29 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_19) / var_36_29

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_19 + var_36_29 and arg_33_1.time_ < var_36_19 + var_36_29 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play111021009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 111021009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play111021010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1084ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1084ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_5
			end

			local var_40_6 = 0
			local var_40_7 = 0.65

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
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_9 = arg_37_1:GetWordFromCfg(111021009)
				local var_40_10 = arg_37_1:FormatText(var_40_9.content)

				arg_37_1.text_.text = var_40_10

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_11 = 26
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
	Play111021010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 111021010
		arg_41_1.duration_ = 9.1

		local var_41_0 = {
			ja = 7.3,
			ko = 8.5,
			zh = 6.633,
			en = 9.1
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
				arg_41_0:Play111021011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = "1019ui_story"

			if arg_41_1.actors_[var_44_0] == nil then
				local var_44_1 = Object.Instantiate(Asset.Load("Char/" .. var_44_0), arg_41_1.stage_.transform)

				var_44_1.name = var_44_0
				var_44_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_41_1.actors_[var_44_0] = var_44_1

				local var_44_2 = var_44_1:GetComponentInChildren(typeof(CharacterEffect))

				var_44_2.enabled = true

				local var_44_3 = GameObjectTools.GetOrAddComponent(var_44_1, typeof(DynamicBoneHelper))

				if var_44_3 then
					var_44_3:EnableDynamicBone(false)
				end

				arg_41_1:ShowWeapon(var_44_2.transform, false)

				arg_41_1.var_[var_44_0 .. "Animator"] = var_44_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_41_1.var_[var_44_0 .. "Animator"].applyRootMotion = true
				arg_41_1.var_[var_44_0 .. "LipSync"] = var_44_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_44_4 = arg_41_1.actors_["1019ui_story"].transform
			local var_44_5 = 0

			if var_44_5 < arg_41_1.time_ and arg_41_1.time_ <= var_44_5 + arg_44_0 then
				arg_41_1.var_.moveOldPos1019ui_story = var_44_4.localPosition
			end

			local var_44_6 = 0.001

			if var_44_5 <= arg_41_1.time_ and arg_41_1.time_ < var_44_5 + var_44_6 then
				local var_44_7 = (arg_41_1.time_ - var_44_5) / var_44_6
				local var_44_8 = Vector3.New(0.7, -1.08, -5.9)

				var_44_4.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1019ui_story, var_44_8, var_44_7)

				local var_44_9 = manager.ui.mainCamera.transform.position - var_44_4.position

				var_44_4.forward = Vector3.New(var_44_9.x, var_44_9.y, var_44_9.z)

				local var_44_10 = var_44_4.localEulerAngles

				var_44_10.z = 0
				var_44_10.x = 0
				var_44_4.localEulerAngles = var_44_10
			end

			if arg_41_1.time_ >= var_44_5 + var_44_6 and arg_41_1.time_ < var_44_5 + var_44_6 + arg_44_0 then
				var_44_4.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_44_11 = manager.ui.mainCamera.transform.position - var_44_4.position

				var_44_4.forward = Vector3.New(var_44_11.x, var_44_11.y, var_44_11.z)

				local var_44_12 = var_44_4.localEulerAngles

				var_44_12.z = 0
				var_44_12.x = 0
				var_44_4.localEulerAngles = var_44_12
			end

			local var_44_13 = 0

			if var_44_13 < arg_41_1.time_ and arg_41_1.time_ <= var_44_13 + arg_44_0 then
				arg_41_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_44_15 = arg_41_1.actors_["1019ui_story"]
			local var_44_16 = 0

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 and arg_41_1.var_.characterEffect1019ui_story == nil then
				arg_41_1.var_.characterEffect1019ui_story = var_44_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_17 = 0.2

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_17 then
				local var_44_18 = (arg_41_1.time_ - var_44_16) / var_44_17

				if arg_41_1.var_.characterEffect1019ui_story then
					arg_41_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_16 + var_44_17 and arg_41_1.time_ < var_44_16 + var_44_17 + arg_44_0 and arg_41_1.var_.characterEffect1019ui_story then
				arg_41_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_44_19 = 0
			local var_44_20 = 0.925

			if var_44_19 < arg_41_1.time_ and arg_41_1.time_ <= var_44_19 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_21 = arg_41_1:FormatText(StoryNameCfg[13].name)

				arg_41_1.leftNameTxt_.text = var_44_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_22 = arg_41_1:GetWordFromCfg(111021010)
				local var_44_23 = arg_41_1:FormatText(var_44_22.content)

				arg_41_1.text_.text = var_44_23

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_24 = 33
				local var_44_25 = utf8.len(var_44_23)
				local var_44_26 = var_44_24 <= 0 and var_44_20 or var_44_20 * (var_44_25 / var_44_24)

				if var_44_26 > 0 and var_44_20 < var_44_26 then
					arg_41_1.talkMaxDuration = var_44_26

					if var_44_26 + var_44_19 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_26 + var_44_19
					end
				end

				arg_41_1.text_.text = var_44_23
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021010", "story_v_out_111021.awb") ~= 0 then
					local var_44_27 = manager.audio:GetVoiceLength("story_v_out_111021", "111021010", "story_v_out_111021.awb") / 1000

					if var_44_27 + var_44_19 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_27 + var_44_19
					end

					if var_44_22.prefab_name ~= "" and arg_41_1.actors_[var_44_22.prefab_name] ~= nil then
						local var_44_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_22.prefab_name].transform, "story_v_out_111021", "111021010", "story_v_out_111021.awb")

						arg_41_1:RecordAudio("111021010", var_44_28)
						arg_41_1:RecordAudio("111021010", var_44_28)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_111021", "111021010", "story_v_out_111021.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_111021", "111021010", "story_v_out_111021.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_29 = math.max(var_44_20, arg_41_1.talkMaxDuration)

			if var_44_19 <= arg_41_1.time_ and arg_41_1.time_ < var_44_19 + var_44_29 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_19) / var_44_29

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_19 + var_44_29 and arg_41_1.time_ < var_44_19 + var_44_29 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play111021011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 111021011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play111021012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1019ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1019ui_story == nil then
				arg_45_1.var_.characterEffect1019ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.2

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1019ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1019ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1019ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1019ui_story.fillRatio = var_48_5
			end

			local var_48_6 = 0
			local var_48_7 = 0.825

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_8 = arg_45_1:GetWordFromCfg(111021011)
				local var_48_9 = arg_45_1:FormatText(var_48_8.content)

				arg_45_1.text_.text = var_48_9

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_10 = 33
				local var_48_11 = utf8.len(var_48_9)
				local var_48_12 = var_48_10 <= 0 and var_48_7 or var_48_7 * (var_48_11 / var_48_10)

				if var_48_12 > 0 and var_48_7 < var_48_12 then
					arg_45_1.talkMaxDuration = var_48_12

					if var_48_12 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_12 + var_48_6
					end
				end

				arg_45_1.text_.text = var_48_9
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_13 = math.max(var_48_7, arg_45_1.talkMaxDuration)

			if var_48_6 <= arg_45_1.time_ and arg_45_1.time_ < var_48_6 + var_48_13 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_6) / var_48_13

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_6 + var_48_13 and arg_45_1.time_ < var_48_6 + var_48_13 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play111021012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 111021012
		arg_49_1.duration_ = 12

		local var_49_0 = {
			ja = 12,
			ko = 6.8,
			zh = 5.6,
			en = 6.466
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
				arg_49_0:Play111021013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1019ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect1019ui_story == nil then
				arg_49_1.var_.characterEffect1019ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1019ui_story then
					arg_49_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect1019ui_story then
				arg_49_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_52_4 = 0
			local var_52_5 = 0.8

			if var_52_4 < arg_49_1.time_ and arg_49_1.time_ <= var_52_4 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_6 = arg_49_1:FormatText(StoryNameCfg[13].name)

				arg_49_1.leftNameTxt_.text = var_52_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_7 = arg_49_1:GetWordFromCfg(111021012)
				local var_52_8 = arg_49_1:FormatText(var_52_7.content)

				arg_49_1.text_.text = var_52_8

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_9 = 32
				local var_52_10 = utf8.len(var_52_8)
				local var_52_11 = var_52_9 <= 0 and var_52_5 or var_52_5 * (var_52_10 / var_52_9)

				if var_52_11 > 0 and var_52_5 < var_52_11 then
					arg_49_1.talkMaxDuration = var_52_11

					if var_52_11 + var_52_4 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_11 + var_52_4
					end
				end

				arg_49_1.text_.text = var_52_8
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021012", "story_v_out_111021.awb") ~= 0 then
					local var_52_12 = manager.audio:GetVoiceLength("story_v_out_111021", "111021012", "story_v_out_111021.awb") / 1000

					if var_52_12 + var_52_4 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_12 + var_52_4
					end

					if var_52_7.prefab_name ~= "" and arg_49_1.actors_[var_52_7.prefab_name] ~= nil then
						local var_52_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_7.prefab_name].transform, "story_v_out_111021", "111021012", "story_v_out_111021.awb")

						arg_49_1:RecordAudio("111021012", var_52_13)
						arg_49_1:RecordAudio("111021012", var_52_13)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_111021", "111021012", "story_v_out_111021.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_111021", "111021012", "story_v_out_111021.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_14 = math.max(var_52_5, arg_49_1.talkMaxDuration)

			if var_52_4 <= arg_49_1.time_ and arg_49_1.time_ < var_52_4 + var_52_14 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_4) / var_52_14

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_4 + var_52_14 and arg_49_1.time_ < var_52_4 + var_52_14 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play111021013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 111021013
		arg_53_1.duration_ = 5.966

		local var_53_0 = {
			ja = 5.966,
			ko = 5.166,
			zh = 4.766,
			en = 5.966
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
				arg_53_0:Play111021014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1019ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1019ui_story == nil then
				arg_53_1.var_.characterEffect1019ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.2

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1019ui_story then
					arg_53_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1019ui_story then
				arg_53_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_56_4 = 0

			if var_56_4 < arg_53_1.time_ and arg_53_1.time_ <= var_56_4 + arg_56_0 then
				arg_53_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action467")
			end

			local var_56_5 = 0

			if var_56_5 < arg_53_1.time_ and arg_53_1.time_ <= var_56_5 + arg_56_0 then
				arg_53_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_56_6 = 0
			local var_56_7 = 0.575

			if var_56_6 < arg_53_1.time_ and arg_53_1.time_ <= var_56_6 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_8 = arg_53_1:FormatText(StoryNameCfg[13].name)

				arg_53_1.leftNameTxt_.text = var_56_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_9 = arg_53_1:GetWordFromCfg(111021013)
				local var_56_10 = arg_53_1:FormatText(var_56_9.content)

				arg_53_1.text_.text = var_56_10

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_11 = 23
				local var_56_12 = utf8.len(var_56_10)
				local var_56_13 = var_56_11 <= 0 and var_56_7 or var_56_7 * (var_56_12 / var_56_11)

				if var_56_13 > 0 and var_56_7 < var_56_13 then
					arg_53_1.talkMaxDuration = var_56_13

					if var_56_13 + var_56_6 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_13 + var_56_6
					end
				end

				arg_53_1.text_.text = var_56_10
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021013", "story_v_out_111021.awb") ~= 0 then
					local var_56_14 = manager.audio:GetVoiceLength("story_v_out_111021", "111021013", "story_v_out_111021.awb") / 1000

					if var_56_14 + var_56_6 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_14 + var_56_6
					end

					if var_56_9.prefab_name ~= "" and arg_53_1.actors_[var_56_9.prefab_name] ~= nil then
						local var_56_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_9.prefab_name].transform, "story_v_out_111021", "111021013", "story_v_out_111021.awb")

						arg_53_1:RecordAudio("111021013", var_56_15)
						arg_53_1:RecordAudio("111021013", var_56_15)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_111021", "111021013", "story_v_out_111021.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_111021", "111021013", "story_v_out_111021.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_16 = math.max(var_56_7, arg_53_1.talkMaxDuration)

			if var_56_6 <= arg_53_1.time_ and arg_53_1.time_ < var_56_6 + var_56_16 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_6) / var_56_16

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_6 + var_56_16 and arg_53_1.time_ < var_56_6 + var_56_16 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play111021014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 111021014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play111021015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1019ui_story"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.characterEffect1019ui_story == nil then
				arg_57_1.var_.characterEffect1019ui_story = var_60_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_2 = 0.2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.characterEffect1019ui_story then
					local var_60_4 = Mathf.Lerp(0, 0.5, var_60_3)

					arg_57_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1019ui_story.fillRatio = var_60_4
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.characterEffect1019ui_story then
				local var_60_5 = 0.5

				arg_57_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1019ui_story.fillRatio = var_60_5
			end

			local var_60_6 = 0
			local var_60_7 = 0.35

			if var_60_6 < arg_57_1.time_ and arg_57_1.time_ <= var_60_6 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_8 = arg_57_1:FormatText(StoryNameCfg[7].name)

				arg_57_1.leftNameTxt_.text = var_60_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_9 = arg_57_1:GetWordFromCfg(111021014)
				local var_60_10 = arg_57_1:FormatText(var_60_9.content)

				arg_57_1.text_.text = var_60_10

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_11 = 14
				local var_60_12 = utf8.len(var_60_10)
				local var_60_13 = var_60_11 <= 0 and var_60_7 or var_60_7 * (var_60_12 / var_60_11)

				if var_60_13 > 0 and var_60_7 < var_60_13 then
					arg_57_1.talkMaxDuration = var_60_13

					if var_60_13 + var_60_6 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_13 + var_60_6
					end
				end

				arg_57_1.text_.text = var_60_10
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_14 = math.max(var_60_7, arg_57_1.talkMaxDuration)

			if var_60_6 <= arg_57_1.time_ and arg_57_1.time_ < var_60_6 + var_60_14 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_6) / var_60_14

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_6 + var_60_14 and arg_57_1.time_ < var_60_6 + var_60_14 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play111021015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 111021015
		arg_61_1.duration_ = 7.75

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play111021016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "D05"

			if arg_61_1.bgs_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_0)
				var_64_1.name = var_64_0
				var_64_1.transform.parent = arg_61_1.stage_.transform
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_0] = var_64_1
			end

			local var_64_2 = 1.5

			if var_64_2 < arg_61_1.time_ and arg_61_1.time_ <= var_64_2 + arg_64_0 then
				local var_64_3 = manager.ui.mainCamera.transform.localPosition
				local var_64_4 = Vector3.New(0, 0, 10) + Vector3.New(var_64_3.x, var_64_3.y, 0)
				local var_64_5 = arg_61_1.bgs_.D05

				var_64_5.transform.localPosition = var_64_4
				var_64_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_6 = var_64_5:GetComponent("SpriteRenderer")

				if var_64_6 and var_64_6.sprite then
					local var_64_7 = (var_64_5.transform.localPosition - var_64_3).z
					local var_64_8 = manager.ui.mainCameraCom_
					local var_64_9 = 2 * var_64_7 * Mathf.Tan(var_64_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_10 = var_64_9 * var_64_8.aspect
					local var_64_11 = var_64_6.sprite.bounds.size.x
					local var_64_12 = var_64_6.sprite.bounds.size.y
					local var_64_13 = var_64_10 / var_64_11
					local var_64_14 = var_64_9 / var_64_12
					local var_64_15 = var_64_14 < var_64_13 and var_64_13 or var_64_14

					var_64_5.transform.localScale = Vector3.New(var_64_15, var_64_15, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "D05" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_16 = arg_61_1.bgs_.D05
			local var_64_17 = 1.5

			if var_64_17 < arg_61_1.time_ and arg_61_1.time_ <= var_64_17 + arg_64_0 then
				local var_64_18 = var_64_16:GetComponent("SpriteRenderer")

				if var_64_18 then
					var_64_18.material = arg_61_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_64_19 = var_64_18.material
					local var_64_20 = var_64_19:GetColor("_Color")

					arg_61_1.var_.alphaOldValueD05 = var_64_20.a
					arg_61_1.var_.alphaMatValueD05 = var_64_19
				end

				arg_61_1.var_.alphaOldValueD05 = 0
			end

			local var_64_21 = 1.5

			if var_64_17 <= arg_61_1.time_ and arg_61_1.time_ < var_64_17 + var_64_21 then
				local var_64_22 = (arg_61_1.time_ - var_64_17) / var_64_21
				local var_64_23 = Mathf.Lerp(arg_61_1.var_.alphaOldValueD05, 1, var_64_22)

				if arg_61_1.var_.alphaMatValueD05 then
					local var_64_24 = arg_61_1.var_.alphaMatValueD05
					local var_64_25 = var_64_24:GetColor("_Color")

					var_64_25.a = var_64_23

					var_64_24:SetColor("_Color", var_64_25)
				end
			end

			if arg_61_1.time_ >= var_64_17 + var_64_21 and arg_61_1.time_ < var_64_17 + var_64_21 + arg_64_0 and arg_61_1.var_.alphaMatValueD05 then
				local var_64_26 = arg_61_1.var_.alphaMatValueD05
				local var_64_27 = var_64_26:GetColor("_Color")

				var_64_27.a = 1

				var_64_26:SetColor("_Color", var_64_27)
			end

			local var_64_28 = arg_61_1.actors_["1019ui_story"].transform
			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1.var_.moveOldPos1019ui_story = var_64_28.localPosition
			end

			local var_64_30 = 0.001

			if var_64_29 <= arg_61_1.time_ and arg_61_1.time_ < var_64_29 + var_64_30 then
				local var_64_31 = (arg_61_1.time_ - var_64_29) / var_64_30
				local var_64_32 = Vector3.New(0, 100, 0)

				var_64_28.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1019ui_story, var_64_32, var_64_31)

				local var_64_33 = manager.ui.mainCamera.transform.position - var_64_28.position

				var_64_28.forward = Vector3.New(var_64_33.x, var_64_33.y, var_64_33.z)

				local var_64_34 = var_64_28.localEulerAngles

				var_64_34.z = 0
				var_64_34.x = 0
				var_64_28.localEulerAngles = var_64_34
			end

			if arg_61_1.time_ >= var_64_29 + var_64_30 and arg_61_1.time_ < var_64_29 + var_64_30 + arg_64_0 then
				var_64_28.localPosition = Vector3.New(0, 100, 0)

				local var_64_35 = manager.ui.mainCamera.transform.position - var_64_28.position

				var_64_28.forward = Vector3.New(var_64_35.x, var_64_35.y, var_64_35.z)

				local var_64_36 = var_64_28.localEulerAngles

				var_64_36.z = 0
				var_64_36.x = 0
				var_64_28.localEulerAngles = var_64_36
			end

			local var_64_37 = arg_61_1.actors_["1084ui_story"].transform
			local var_64_38 = 0

			if var_64_38 < arg_61_1.time_ and arg_61_1.time_ <= var_64_38 + arg_64_0 then
				arg_61_1.var_.moveOldPos1084ui_story = var_64_37.localPosition
			end

			local var_64_39 = 0.001

			if var_64_38 <= arg_61_1.time_ and arg_61_1.time_ < var_64_38 + var_64_39 then
				local var_64_40 = (arg_61_1.time_ - var_64_38) / var_64_39
				local var_64_41 = Vector3.New(0, 100, 0)

				var_64_37.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1084ui_story, var_64_41, var_64_40)

				local var_64_42 = manager.ui.mainCamera.transform.position - var_64_37.position

				var_64_37.forward = Vector3.New(var_64_42.x, var_64_42.y, var_64_42.z)

				local var_64_43 = var_64_37.localEulerAngles

				var_64_43.z = 0
				var_64_43.x = 0
				var_64_37.localEulerAngles = var_64_43
			end

			if arg_61_1.time_ >= var_64_38 + var_64_39 and arg_61_1.time_ < var_64_38 + var_64_39 + arg_64_0 then
				var_64_37.localPosition = Vector3.New(0, 100, 0)

				local var_64_44 = manager.ui.mainCamera.transform.position - var_64_37.position

				var_64_37.forward = Vector3.New(var_64_44.x, var_64_44.y, var_64_44.z)

				local var_64_45 = var_64_37.localEulerAngles

				var_64_45.z = 0
				var_64_45.x = 0
				var_64_37.localEulerAngles = var_64_45
			end

			local var_64_46 = arg_61_1.bgs_.A00
			local var_64_47 = 0

			if var_64_47 < arg_61_1.time_ and arg_61_1.time_ <= var_64_47 + arg_64_0 then
				local var_64_48 = var_64_46:GetComponent("SpriteRenderer")

				if var_64_48 then
					var_64_48.material = arg_61_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_64_49 = var_64_48.material
					local var_64_50 = var_64_49:GetColor("_Color")

					arg_61_1.var_.alphaOldValueA00 = var_64_50.a
					arg_61_1.var_.alphaMatValueA00 = var_64_49
				end

				arg_61_1.var_.alphaOldValueA00 = 1
			end

			local var_64_51 = 1.5

			if var_64_47 <= arg_61_1.time_ and arg_61_1.time_ < var_64_47 + var_64_51 then
				local var_64_52 = (arg_61_1.time_ - var_64_47) / var_64_51
				local var_64_53 = Mathf.Lerp(arg_61_1.var_.alphaOldValueA00, 0, var_64_52)

				if arg_61_1.var_.alphaMatValueA00 then
					local var_64_54 = arg_61_1.var_.alphaMatValueA00
					local var_64_55 = var_64_54:GetColor("_Color")

					var_64_55.a = var_64_53

					var_64_54:SetColor("_Color", var_64_55)
				end
			end

			if arg_61_1.time_ >= var_64_47 + var_64_51 and arg_61_1.time_ < var_64_47 + var_64_51 + arg_64_0 and arg_61_1.var_.alphaMatValueA00 then
				local var_64_56 = arg_61_1.var_.alphaMatValueA00
				local var_64_57 = var_64_56:GetColor("_Color")

				var_64_57.a = 0

				var_64_56:SetColor("_Color", var_64_57)
			end

			local var_64_58 = 0

			if var_64_58 < arg_61_1.time_ and arg_61_1.time_ <= var_64_58 + arg_64_0 then
				arg_61_1.allBtn_.enabled = false
			end

			local var_64_59 = 2.75

			if arg_61_1.time_ >= var_64_58 + var_64_59 and arg_61_1.time_ < var_64_58 + var_64_59 + arg_64_0 then
				arg_61_1.allBtn_.enabled = true
			end

			local var_64_60 = 0
			local var_64_61 = 1

			if var_64_60 < arg_61_1.time_ and arg_61_1.time_ <= var_64_60 + arg_64_0 then
				local var_64_62 = "stop"
				local var_64_63 = "music"

				arg_61_1:AudioAction(var_64_62, var_64_63, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_64 = 2.75
			local var_64_65 = 1.1

			if var_64_64 < arg_61_1.time_ and arg_61_1.time_ <= var_64_64 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_66 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_66:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_66:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_66:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_67 = arg_61_1:GetWordFromCfg(111021015)
				local var_64_68 = arg_61_1:FormatText(var_64_67.content)

				arg_61_1.text_.text = var_64_68

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_69 = 44
				local var_64_70 = utf8.len(var_64_68)
				local var_64_71 = var_64_69 <= 0 and var_64_65 or var_64_65 * (var_64_70 / var_64_69)

				if var_64_71 > 0 and var_64_65 < var_64_71 then
					arg_61_1.talkMaxDuration = var_64_71
					var_64_64 = var_64_64 + 0.3

					if var_64_71 + var_64_64 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_71 + var_64_64
					end
				end

				arg_61_1.text_.text = var_64_68
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_72 = var_64_64 + 0.3
			local var_64_73 = math.max(var_64_65, arg_61_1.talkMaxDuration)

			if var_64_72 <= arg_61_1.time_ and arg_61_1.time_ < var_64_72 + var_64_73 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_72) / var_64_73

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_72 + var_64_73 and arg_61_1.time_ < var_64_72 + var_64_73 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play111021016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 111021016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play111021017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				local var_70_2 = "play"
				local var_70_3 = "music"

				arg_67_1:AudioAction(var_70_2, var_70_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			local var_70_4 = 0
			local var_70_5 = 1

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				local var_70_6 = "play"
				local var_70_7 = "effect"

				arg_67_1:AudioAction(var_70_6, var_70_7, "se_story_activity_1_1", "se_story_activity_1_1_firecrowdloop", "")
			end

			local var_70_8 = 0
			local var_70_9 = 0.825

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_10 = arg_67_1:GetWordFromCfg(111021016)
				local var_70_11 = arg_67_1:FormatText(var_70_10.content)

				arg_67_1.text_.text = var_70_11

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_12 = 34
				local var_70_13 = utf8.len(var_70_11)
				local var_70_14 = var_70_12 <= 0 and var_70_9 or var_70_9 * (var_70_13 / var_70_12)

				if var_70_14 > 0 and var_70_9 < var_70_14 then
					arg_67_1.talkMaxDuration = var_70_14

					if var_70_14 + var_70_8 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_8
					end
				end

				arg_67_1.text_.text = var_70_11
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_15 = math.max(var_70_9, arg_67_1.talkMaxDuration)

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_15 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_8) / var_70_15

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_8 + var_70_15 and arg_67_1.time_ < var_70_8 + var_70_15 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play111021017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 111021017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play111021018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.85

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(111021017)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 34
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play111021018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 111021018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play111021019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.125

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(111021018)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 43
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play111021019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 111021019
		arg_79_1.duration_ = 5.8

		local var_79_0 = {
			ja = 3.166,
			ko = 4,
			zh = 5.8,
			en = 2.4
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
				arg_79_0:Play111021020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(-0.7, -0.97, -6)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = 0

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_82_11 = arg_79_1.actors_["1084ui_story"]
			local var_82_12 = 0

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_13 = 0.2

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_13 then
				local var_82_14 = (arg_79_1.time_ - var_82_12) / var_82_13

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_12 + var_82_13 and arg_79_1.time_ < var_82_12 + var_82_13 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_15 = 0
			local var_82_16 = 0.35

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(111021019)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 14
				local var_82_21 = utf8.len(var_82_19)
				local var_82_22 = var_82_20 <= 0 and var_82_16 or var_82_16 * (var_82_21 / var_82_20)

				if var_82_22 > 0 and var_82_16 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_19
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021019", "story_v_out_111021.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_111021", "111021019", "story_v_out_111021.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_111021", "111021019", "story_v_out_111021.awb")

						arg_79_1:RecordAudio("111021019", var_82_24)
						arg_79_1:RecordAudio("111021019", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_111021", "111021019", "story_v_out_111021.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_111021", "111021019", "story_v_out_111021.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_25 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_25 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_25

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_25 and arg_79_1.time_ < var_82_15 + var_82_25 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play111021020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 111021020
		arg_83_1.duration_ = 3.3

		local var_83_0 = {
			ja = 3.3,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.766
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
				arg_83_0:Play111021021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "1048ui_story"

			if arg_83_1.actors_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(Asset.Load("Char/" .. var_86_0), arg_83_1.stage_.transform)

				var_86_1.name = var_86_0
				var_86_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_83_1.actors_[var_86_0] = var_86_1

				local var_86_2 = var_86_1:GetComponentInChildren(typeof(CharacterEffect))

				var_86_2.enabled = true

				local var_86_3 = GameObjectTools.GetOrAddComponent(var_86_1, typeof(DynamicBoneHelper))

				if var_86_3 then
					var_86_3:EnableDynamicBone(false)
				end

				arg_83_1:ShowWeapon(var_86_2.transform, false)

				arg_83_1.var_[var_86_0 .. "Animator"] = var_86_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_83_1.var_[var_86_0 .. "Animator"].applyRootMotion = true
				arg_83_1.var_[var_86_0 .. "LipSync"] = var_86_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_86_4 = arg_83_1.actors_["1048ui_story"].transform
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 then
				arg_83_1.var_.moveOldPos1048ui_story = var_86_4.localPosition
			end

			local var_86_6 = 0.001

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6
				local var_86_8 = Vector3.New(0.7, -0.8, -6.2)

				var_86_4.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1048ui_story, var_86_8, var_86_7)

				local var_86_9 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_9.x, var_86_9.y, var_86_9.z)

				local var_86_10 = var_86_4.localEulerAngles

				var_86_10.z = 0
				var_86_10.x = 0
				var_86_4.localEulerAngles = var_86_10
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 then
				var_86_4.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_4.position

				var_86_4.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_4.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_4.localEulerAngles = var_86_12
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action2_1")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_86_15 = arg_83_1.actors_["1084ui_story"]
			local var_86_16 = 0

			if var_86_16 < arg_83_1.time_ and arg_83_1.time_ <= var_86_16 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_17 = 0.2

			if var_86_16 <= arg_83_1.time_ and arg_83_1.time_ < var_86_16 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_16) / var_86_17

				if arg_83_1.var_.characterEffect1084ui_story then
					local var_86_19 = Mathf.Lerp(0, 0.5, var_86_18)

					arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_19
				end
			end

			if arg_83_1.time_ >= var_86_16 + var_86_17 and arg_83_1.time_ < var_86_16 + var_86_17 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				local var_86_20 = 0.5

				arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_20
			end

			local var_86_21 = arg_83_1.actors_["1048ui_story"]
			local var_86_22 = 0

			if var_86_22 < arg_83_1.time_ and arg_83_1.time_ <= var_86_22 + arg_86_0 and arg_83_1.var_.characterEffect1048ui_story == nil then
				arg_83_1.var_.characterEffect1048ui_story = var_86_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_23 = 0.2

			if var_86_22 <= arg_83_1.time_ and arg_83_1.time_ < var_86_22 + var_86_23 then
				local var_86_24 = (arg_83_1.time_ - var_86_22) / var_86_23

				if arg_83_1.var_.characterEffect1048ui_story then
					arg_83_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_22 + var_86_23 and arg_83_1.time_ < var_86_22 + var_86_23 + arg_86_0 and arg_83_1.var_.characterEffect1048ui_story then
				arg_83_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_86_25 = 0
			local var_86_26 = 0.2

			if var_86_25 < arg_83_1.time_ and arg_83_1.time_ <= var_86_25 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_27 = arg_83_1:FormatText(StoryNameCfg[8].name)

				arg_83_1.leftNameTxt_.text = var_86_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_28 = arg_83_1:GetWordFromCfg(111021020)
				local var_86_29 = arg_83_1:FormatText(var_86_28.content)

				arg_83_1.text_.text = var_86_29

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_30 = 8
				local var_86_31 = utf8.len(var_86_29)
				local var_86_32 = var_86_30 <= 0 and var_86_26 or var_86_26 * (var_86_31 / var_86_30)

				if var_86_32 > 0 and var_86_26 < var_86_32 then
					arg_83_1.talkMaxDuration = var_86_32

					if var_86_32 + var_86_25 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_32 + var_86_25
					end
				end

				arg_83_1.text_.text = var_86_29
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021020", "story_v_out_111021.awb") ~= 0 then
					local var_86_33 = manager.audio:GetVoiceLength("story_v_out_111021", "111021020", "story_v_out_111021.awb") / 1000

					if var_86_33 + var_86_25 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_33 + var_86_25
					end

					if var_86_28.prefab_name ~= "" and arg_83_1.actors_[var_86_28.prefab_name] ~= nil then
						local var_86_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_28.prefab_name].transform, "story_v_out_111021", "111021020", "story_v_out_111021.awb")

						arg_83_1:RecordAudio("111021020", var_86_34)
						arg_83_1:RecordAudio("111021020", var_86_34)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_111021", "111021020", "story_v_out_111021.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_111021", "111021020", "story_v_out_111021.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_35 = math.max(var_86_26, arg_83_1.talkMaxDuration)

			if var_86_25 <= arg_83_1.time_ and arg_83_1.time_ < var_86_25 + var_86_35 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_25) / var_86_35

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_25 + var_86_35 and arg_83_1.time_ < var_86_25 + var_86_35 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play111021021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 111021021
		arg_87_1.duration_ = 2.3

		local var_87_0 = {
			ja = 2.3,
			ko = 1.999999999999,
			zh = 2.233,
			en = 1.999999999999
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
				arg_87_0:Play111021022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1048ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1048ui_story == nil then
				arg_87_1.var_.characterEffect1048ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1048ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1048ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1048ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1048ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.225

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[13].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(111021021)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 9
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021021", "story_v_out_111021.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_111021", "111021021", "story_v_out_111021.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_111021", "111021021", "story_v_out_111021.awb")

						arg_87_1:RecordAudio("111021021", var_90_15)
						arg_87_1:RecordAudio("111021021", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_111021", "111021021", "story_v_out_111021.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_111021", "111021021", "story_v_out_111021.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play111021022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 111021022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play111021023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.35

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[7].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(111021022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 14
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
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_8 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_8 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_8

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_8 and arg_91_1.time_ < var_94_0 + var_94_8 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play111021023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 111021023
		arg_95_1.duration_ = 8.8

		local var_95_0 = {
			ja = 8.8,
			ko = 7.6,
			zh = 8.066,
			en = 8.8
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
				arg_95_0:Play111021024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.125

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[13].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(111021023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021023", "story_v_out_111021.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_111021", "111021023", "story_v_out_111021.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_111021", "111021023", "story_v_out_111021.awb")

						arg_95_1:RecordAudio("111021023", var_98_9)
						arg_95_1:RecordAudio("111021023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_111021", "111021023", "story_v_out_111021.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_111021", "111021023", "story_v_out_111021.awb")
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
	Play111021024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 111021024
		arg_99_1.duration_ = 14.3

		local var_99_0 = {
			ja = 14.3,
			ko = 9.2,
			zh = 9.033,
			en = 6.4
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
				arg_99_0:Play111021025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 1.2

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[13].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(111021024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021024", "story_v_out_111021.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_111021", "111021024", "story_v_out_111021.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_111021", "111021024", "story_v_out_111021.awb")

						arg_99_1:RecordAudio("111021024", var_102_9)
						arg_99_1:RecordAudio("111021024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_111021", "111021024", "story_v_out_111021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_111021", "111021024", "story_v_out_111021.awb")
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
	Play111021025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 111021025
		arg_103_1.duration_ = 7.533

		local var_103_0 = {
			ja = 3.333,
			ko = 7.533,
			zh = 6.366,
			en = 6.1
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
				arg_103_0:Play111021026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1084ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1084ui_story then
					arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_106_4 = 0

			if var_106_4 < arg_103_1.time_ and arg_103_1.time_ <= var_106_4 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_6 = 0
			local var_106_7 = 0.7

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[6].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(111021025)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 28
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021025", "story_v_out_111021.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_111021", "111021025", "story_v_out_111021.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_111021", "111021025", "story_v_out_111021.awb")

						arg_103_1:RecordAudio("111021025", var_106_15)
						arg_103_1:RecordAudio("111021025", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_111021", "111021025", "story_v_out_111021.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_111021", "111021025", "story_v_out_111021.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play111021026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 111021026
		arg_107_1.duration_ = 12

		local var_107_0 = {
			ja = 12,
			ko = 6.333,
			zh = 7.5,
			en = 9.566
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
				arg_107_0:Play111021027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1084ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story == nil then
				arg_107_1.var_.characterEffect1084ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1084ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.825

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[13].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(111021026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 34
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021026", "story_v_out_111021.awb") ~= 0 then
					local var_110_14 = manager.audio:GetVoiceLength("story_v_out_111021", "111021026", "story_v_out_111021.awb") / 1000

					if var_110_14 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_14 + var_110_6
					end

					if var_110_9.prefab_name ~= "" and arg_107_1.actors_[var_110_9.prefab_name] ~= nil then
						local var_110_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_9.prefab_name].transform, "story_v_out_111021", "111021026", "story_v_out_111021.awb")

						arg_107_1:RecordAudio("111021026", var_110_15)
						arg_107_1:RecordAudio("111021026", var_110_15)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_111021", "111021026", "story_v_out_111021.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_111021", "111021026", "story_v_out_111021.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_16 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_16 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_16

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_16 and arg_107_1.time_ < var_110_6 + var_110_16 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play111021027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 111021027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play111021028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.075

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_2 = arg_111_1:GetWordFromCfg(111021027)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 43
				local var_114_5 = utf8.len(var_114_3)
				local var_114_6 = var_114_4 <= 0 and var_114_1 or var_114_1 * (var_114_5 / var_114_4)

				if var_114_6 > 0 and var_114_1 < var_114_6 then
					arg_111_1.talkMaxDuration = var_114_6

					if var_114_6 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_6 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_3
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_7 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_7 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_7

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_7 and arg_111_1.time_ < var_114_0 + var_114_7 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play111021028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 111021028
		arg_115_1.duration_ = 8.5

		local var_115_0 = {
			ja = 8.5,
			ko = 1.999999999999,
			zh = 2.933,
			en = 3.933
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
				arg_115_0:Play111021029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = "1039ui_story"

			if arg_115_1.actors_[var_118_0] == nil then
				local var_118_1 = Object.Instantiate(Asset.Load("Char/" .. var_118_0), arg_115_1.stage_.transform)

				var_118_1.name = var_118_0
				var_118_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_115_1.actors_[var_118_0] = var_118_1

				local var_118_2 = var_118_1:GetComponentInChildren(typeof(CharacterEffect))

				var_118_2.enabled = true

				local var_118_3 = GameObjectTools.GetOrAddComponent(var_118_1, typeof(DynamicBoneHelper))

				if var_118_3 then
					var_118_3:EnableDynamicBone(false)
				end

				arg_115_1:ShowWeapon(var_118_2.transform, false)

				arg_115_1.var_[var_118_0 .. "Animator"] = var_118_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_115_1.var_[var_118_0 .. "Animator"].applyRootMotion = true
				arg_115_1.var_[var_118_0 .. "LipSync"] = var_118_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_118_4 = arg_115_1.actors_["1039ui_story"].transform
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 then
				arg_115_1.var_.moveOldPos1039ui_story = var_118_4.localPosition
			end

			local var_118_6 = 0.001

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6
				local var_118_8 = Vector3.New(0, -1.01, -5.9)

				var_118_4.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1039ui_story, var_118_8, var_118_7)

				local var_118_9 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_9.x, var_118_9.y, var_118_9.z)

				local var_118_10 = var_118_4.localEulerAngles

				var_118_10.z = 0
				var_118_10.x = 0
				var_118_4.localEulerAngles = var_118_10
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 then
				var_118_4.localPosition = Vector3.New(0, -1.01, -5.9)

				local var_118_11 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_11.x, var_118_11.y, var_118_11.z)

				local var_118_12 = var_118_4.localEulerAngles

				var_118_12.z = 0
				var_118_12.x = 0
				var_118_4.localEulerAngles = var_118_12
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_118_15 = arg_115_1.actors_["1039ui_story"]
			local var_118_16 = 0

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 and arg_115_1.var_.characterEffect1039ui_story == nil then
				arg_115_1.var_.characterEffect1039ui_story = var_118_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_17 = 0.2

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_17 then
				local var_118_18 = (arg_115_1.time_ - var_118_16) / var_118_17

				if arg_115_1.var_.characterEffect1039ui_story then
					arg_115_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_16 + var_118_17 and arg_115_1.time_ < var_118_16 + var_118_17 + arg_118_0 and arg_115_1.var_.characterEffect1039ui_story then
				arg_115_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_118_19 = 0
			local var_118_20 = 1.075

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[9].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(111021028)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 14
				local var_118_25 = utf8.len(var_118_23)
				local var_118_26 = var_118_24 <= 0 and var_118_20 or var_118_20 * (var_118_25 / var_118_24)

				if var_118_26 > 0 and var_118_20 < var_118_26 then
					arg_115_1.talkMaxDuration = var_118_26

					if var_118_26 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_26 + var_118_19
					end
				end

				arg_115_1.text_.text = var_118_23
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021028", "story_v_out_111021.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_111021", "111021028", "story_v_out_111021.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_111021", "111021028", "story_v_out_111021.awb")

						arg_115_1:RecordAudio("111021028", var_118_28)
						arg_115_1:RecordAudio("111021028", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_111021", "111021028", "story_v_out_111021.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_111021", "111021028", "story_v_out_111021.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_29 = math.max(var_118_20, arg_115_1.talkMaxDuration)

			if var_118_19 <= arg_115_1.time_ and arg_115_1.time_ < var_118_19 + var_118_29 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_19) / var_118_29

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_19 + var_118_29 and arg_115_1.time_ < var_118_19 + var_118_29 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play111021029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 111021029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play111021030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1039ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1039ui_story == nil then
				arg_119_1.var_.characterEffect1039ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1039ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1039ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1039ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1039ui_story.fillRatio = var_122_5
			end

			local var_122_6 = 0
			local var_122_7 = 1.075

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[7].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(111021029)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 30
				local var_122_12 = utf8.len(var_122_10)
				local var_122_13 = var_122_11 <= 0 and var_122_7 or var_122_7 * (var_122_12 / var_122_11)

				if var_122_13 > 0 and var_122_7 < var_122_13 then
					arg_119_1.talkMaxDuration = var_122_13

					if var_122_13 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_13 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_10
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_14 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_14 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_14

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_14 and arg_119_1.time_ < var_122_6 + var_122_14 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play111021030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 111021030
		arg_123_1.duration_ = 1.999999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
			arg_123_1.auto_ = false
		end

		function arg_123_1.playNext_(arg_125_0)
			arg_123_1.onStoryFinished_()
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1084ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1084ui_story then
					arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["1048ui_story"]
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 and arg_123_1.var_.characterEffect1048ui_story == nil then
				arg_123_1.var_.characterEffect1048ui_story = var_126_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_6 = 0.2

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6

				if arg_123_1.var_.characterEffect1048ui_story then
					arg_123_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 and arg_123_1.var_.characterEffect1048ui_story then
				arg_123_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_126_8 = arg_123_1.actors_["1039ui_story"]
			local var_126_9 = 0

			if var_126_9 < arg_123_1.time_ and arg_123_1.time_ <= var_126_9 + arg_126_0 and arg_123_1.var_.characterEffect1039ui_story == nil then
				arg_123_1.var_.characterEffect1039ui_story = var_126_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_10 = 0.2

			if var_126_9 <= arg_123_1.time_ and arg_123_1.time_ < var_126_9 + var_126_10 then
				local var_126_11 = (arg_123_1.time_ - var_126_9) / var_126_10

				if arg_123_1.var_.characterEffect1039ui_story then
					arg_123_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_9 + var_126_10 and arg_123_1.time_ < var_126_9 + var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect1039ui_story then
				arg_123_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_126_12 = 0

			if var_126_12 < arg_123_1.time_ and arg_123_1.time_ <= var_126_12 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action459")
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action423")
			end

			local var_126_15 = 0

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action452")
			end

			local var_126_17 = 0

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				arg_123_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_126_18 = 0
			local var_126_19 = 1

			if var_126_18 < arg_123_1.time_ and arg_123_1.time_ <= var_126_18 + arg_126_0 then
				local var_126_20 = "stop"
				local var_126_21 = "effect"

				arg_123_1:AudioAction(var_126_20, var_126_21, "se_story_activity_1_1", "se_story_activity_1_1_firecrowdloop", "")
			end

			local var_126_22 = 0
			local var_126_23 = 1.075

			if var_126_22 < arg_123_1.time_ and arg_123_1.time_ <= var_126_22 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_24 = arg_123_1:FormatText(StoryNameCfg[50].name)

				arg_123_1.leftNameTxt_.text = var_126_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_25 = arg_123_1:GetWordFromCfg(111021030)
				local var_126_26 = arg_123_1:FormatText(var_126_25.content)

				arg_123_1.text_.text = var_126_26

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_27 = 3
				local var_126_28 = utf8.len(var_126_26)
				local var_126_29 = var_126_27 <= 0 and var_126_23 or var_126_23 * (var_126_28 / var_126_27)

				if var_126_29 > 0 and var_126_23 < var_126_29 then
					arg_123_1.talkMaxDuration = var_126_29

					if var_126_29 + var_126_22 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_29 + var_126_22
					end
				end

				arg_123_1.text_.text = var_126_26
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111021", "111021030", "story_v_out_111021.awb") ~= 0 then
					local var_126_30 = manager.audio:GetVoiceLength("story_v_out_111021", "111021030", "story_v_out_111021.awb") / 1000

					if var_126_30 + var_126_22 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_30 + var_126_22
					end

					if var_126_25.prefab_name ~= "" and arg_123_1.actors_[var_126_25.prefab_name] ~= nil then
						local var_126_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_25.prefab_name].transform, "story_v_out_111021", "111021030", "story_v_out_111021.awb")

						arg_123_1:RecordAudio("111021030", var_126_31)
						arg_123_1:RecordAudio("111021030", var_126_31)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_111021", "111021030", "story_v_out_111021.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_111021", "111021030", "story_v_out_111021.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_32 = math.max(var_126_23, arg_123_1.talkMaxDuration)

			if var_126_22 <= arg_123_1.time_ and arg_123_1.time_ < var_126_22 + var_126_32 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_22) / var_126_32

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_22 + var_126_32 and arg_123_1.time_ < var_126_22 + var_126_32 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D05"
	},
	voices = {
		"story_v_out_111021.awb"
	}
}
